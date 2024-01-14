require "MariAutoFix"

MariRecipe = {}
MariRecipe.GetItemTypes = {}
MariRecipe.OnCanPerform = {}
MariRecipe.OnCreate = {}
MariRecipe.OnGiveXP = {}
MariRecipe.OnTest = {}



-- no gloves at least 30% chance of getting injured
-- gloves at least 1% chance of getting injured

-- absolute average player with a well fed status gets +20 bonus. wearing gloves make barrier 25. so you need to roll below 5 to injure yourself
-- no gloves barrier is 75 and with +20 bonus everything it makes all rolls below 55 bad.

-- under normal conditions with no traits the bonus is just +10.
-- with all good traits and food it's +44 to roll.

-- having bad moodles almost guarantees injury

function MariRecipe.rollDamageChance(player)
    local barrier = 1

    local hasGloves = false;
    local gloves = player:getWornItem('Hands');
    if (gloves == nil) then
        barrier = 75
    else
        local glovesType = gloves:getType()
        hasGloves = glovesType == 'Gloves_LeatherGloves' or glovesType == 'Gloves_LeatherGlovesBlack'
    end

    if hasGloves then
        barrier = 25
    end

    local roll = ZombRand(0, 100)

    if (roll == 0 or (hasGloves ~= true and roll < 30)) then
        --print('-------', roll, 'bad luck')
        return true
    end

    local bonus = 0

    if player:HasTrait('AllThumbs') then
        bonus = bonus - 15
    end

    if player:HasTrait('ShortSighted') then
        bonus = bonus - 3
    end

    if player:HasTrait('Unlucky') then
        bonus = bonus - 5
    end

    if player:HasTrait('Clumsy') then
        bonus = bonus - 10
    end

    if player:HasTrait('Obese') then
        bonus = bonus - 3
    end

    if player:HasTrait('Dextrous') then
        bonus = bonus + 5
    end

    if player:HasTrait('Handy') then
        bonus = bonus + 5
    end

    if player:HasTrait('ThickSkinned') then
        bonus = bonus + 3
    end

    if player:HasTrait('Lucky') then
        bonus = bonus + 5
    end

    if player:HasTrait('Graceful') then
        bonus = bonus + 3
    end

    if player:HasTrait('Sewer') then
        bonus = bonus + 5
    end

    if player:HasTrait('Gymnast') then
        bonus = bonus + 3
    end

    local profession = player:getDescriptor():getProfession();
    if (profession == 'fireofficer' or profession == 'constructionworker' or profession == 'carpenter' or profession == 'repairman' or profession == 'metalworker') then
        bonus = bonus + 3
    end

    local moodles = player:getMoodles()
    -- panic
    bonus = bonus - moodles:getMoodleLevel(MoodleType.Panic) * 20

    -- stress
    bonus = bonus - moodles:getMoodleLevel(MoodleType.Stress) * 10

    -- fatigue
    bonus = bonus - moodles:getMoodleLevel(MoodleType.Tired) * 15

    -- drunkness
    bonus = bonus - moodles:getMoodleLevel(MoodleType.Drunk) * 15

    -- pain
    bonus = bonus - moodles:getMoodleLevel(MoodleType.Pain) * 15

    -- heavy load
    bonus = bonus - moodles:getMoodleLevel(MoodleType.HeavyLoad) * 10

    if (moodles:getMoodleLevel(MoodleType.Hypothermia) >= 2) then
        bonus = bonus - 10
    end

    if (moodles:getMoodleLevel(MoodleType.Hyperthermia) >= 2) then
        bonus = bonus - 10
    end

    -- hungry
    if (moodles:getMoodleLevel(MoodleType.Hungry) >= 2) then
        bonus = bonus - 10
    end

    if (moodles:getMoodleLevel(MoodleType.FoodEaten) >= 2) then
        bonus = bonus + 10
    end

    -- thirsty
    if (moodles:getMoodleLevel(MoodleType.Thirst) >= 2) then
        bonus = bonus - 10
    end

    -- endurance
    if (moodles:getMoodleLevel(MoodleType.Endurance) >= 2) then
        bonus = bonus - 10
    end

    local health = player:getBodyDamage():getOverallBodyHealth();
    if health < 60 then
        bonus = bonus - 15
    elseif health > 90 then
        bonus = bonus + 10
    end

    if player:getBodyDamage():getColdStrength() > 15 then
        bonus = bonus - 15
    end

    --print('-------', roll, '<>', barrier, ' bonus ', bonus)

    return (roll + bonus) < barrier
end

function MariRecipe.CheckGlassCut(items, result, player)
    if not MariAutoFix.Settings.Evil then
        return
    end

    local gotInjured = MariRecipe.rollDamageChance(player);
    if gotInjured then
        local sound = 'SpearHuntingKnifeHit'
        local deepCut = ZombRand(4) == 0
        local handPeek = player:getBodyDamage():getBodyPart(BodyPartType.Hand_L)

        if ZombRand(2) == 0 then
            handPeek = player:getBodyDamage():getBodyPart(BodyPartType.Hand_R)
        end
        -- haha no bandage anymore
        handPeek:setBandaged(false, 0)

        local oldScratch = handPeek:getScratchTime()
        local oldBleed = handPeek:getBleedingTime()
        local oldPain = handPeek:getAdditionalPain()
        local oldDW = handPeek:getDeepWoundTime()

        -- actual damage part
        if deepCut then
            handPeek:setScratched(true, true)
            handPeek:setBleedingTime(oldBleed + handPeek:getBleedingTime() + ZombRand(10) + 3);
            handPeek:setAdditionalPain(oldPain + 10);
            if ZombRand(4) == 0 then
                sound = 'SmashedBottleHit'
                handPeek:setHaveGlass(true);
                handPeek:setBleedingTime(handPeek:getBleedingTime() + oldBleed + 10);
                handPeek:setDeepWounded(true);
                handPeek:setDeepWoundTime(oldDW + ZombRand(10) + 3)
                handPeek:setAdditionalPain(oldPain + 20);
                if ZombRand(5) == 0 then
                    -- do you really want this achievement?
                    player:Say(getText('IGUI_MariAutoFix_Injure_Rare'))
                else
                    player:Say(getText('IGUI_MariAutoFix_Injure_Medium'))
                end
            else
                player:Say(getText('IGUI_MariAutoFix_Injure_Medium'))
            end
        else
            handPeek:setScratched(true, false);
            handPeek:setScratchTime(handPeek:getScratchTime() + oldScratch + 3);
            player:Say(getText('IGUI_MariAutoFix_Injure_Light'))
        end
        player:getEmitter():playSound(sound)
    end
end

-- the only way of getting multiple items that i know of
function MariRecipe.OnCreate.UnpackGlass(items, result, player)
    local inventory = player:getInventory()
    for i = 1, 4 do
        inventory:AddItem("Base.TinCanEmpty")
    end
    MariRecipe.CheckGlassCut(items, result, player)
end

function MariRecipe.OnCanPerform.NoBleeding(recipe, player, item)
    return not MariAutoFix.Settings.Evil or player:getMoodles():getMoodleLevel(MoodleType.Bleeding) == 0
end