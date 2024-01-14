require "ISUI/ISToolTip"
require "MariAutoFix"

local function checkItemCondition(item, delta)
    return item:getConditionMax() >= 100 and item:getCondition() < (MariAutoFix.Settings.Glass.Restore_Max + delta) and item:getCondition() >= (MariAutoFix.Settings.Glass.Restore_From - delta);
end

local function getItem(items)
    local item = nil
    for _, v in ipairs(items) do
        if not instanceof(v, "InventoryItem") then
            if #v.items == 2 then
                item = v.items[1];
            end
        else
            item = v
        end
    end

    return item
end

local function checkName(item)
    if item == nil then
        return false
    end

    local itemType = item:getType()
    if MariAutoFix.Funcs.IsInList(MariAutoFix.Settings.Glass.Repairable_Items_List, itemType) then
        return true
    end

    if MariAutoFix.Settings.Glass.Repairable_Experimental == false then
        return false
    end

    return MariAutoFix.Funcs.IsInListPartially(MariAutoFix.Settings.Glass.Repairable_Exp_SearchPositive_List, itemType)
            and not MariAutoFix.Funcs.IsInListPartially(MariAutoFix.Settings.Glass.Repairable_Exp_SearchNegative_List, itemType)
            and not MariAutoFix.Funcs.IsInList(MariAutoFix.Settings.Glass.Repairable_Exp_IgnoreTypes_List, itemType)
end

local function fixGlassWithGlueMix (player, item, mixCan)
    -- TODO send command to fix item with mix can
    -- TODO make it timed action
    local condition = item:getCondition()
    local mechLevel = player:getPerkLevel(Perks.Mechanics)
    local delta = mechLevel * MariAutoFix.Settings.Glass.Restore_Margin_Per_Skill
    local repairAmount = ZombRand(MariAutoFix.Settings.Glass.GlueMix_Restore_Step) + 1 + 0.25 * mechLevel

    local newCondition = condition + repairAmount;
    if newCondition > MariAutoFix.Settings.Glass.GlueMix_Restore_Max + delta then
        newCondition = MariAutoFix.Settings.Glass.GlueMix_Restore_Max
    end
    local emitter = player:getEmitter()
    emitter:playSound("PZ_DuctTape")
    player:getInventory():Remove(mixCan)
    item:setCondition(newCondition)
    player:getXp():AddXP(Perks.Mechanics, repairAmount * MariAutoFix.Settings.XP_Multiplier);
end

local function OnPreFillInventoryObjectContextMenu(playerID, context, items)
    local item = getItem(items)
    if item == nil then
        return
    end

    local player = getSpecificPlayer(playerID)
    local mechLevel = player:getPerkLevel(Perks.Mechanics)
    local delta = mechLevel * MariAutoFix.Settings.Glass.Restore_Margin_Per_Skill

    -- item should have max condition >= 100 and suffice in names
    if not checkItemCondition(item, delta) or not checkName(item) then
        return
    end

    local condition = item:getCondition()
    local inventory = player:getInventory();
    local mixCan = inventory:getItemFromType("TinCanWithGlassFixMix", true, true);

    local fixSubMenu = context:getNew(context)
    local option = context:addOption(getText("IGUI_MariAutoFix_Fix_Glass_SubMenu"))
    context:addSubMenu(option, fixSubMenu)

    local glueMax = MariAutoFix.Settings.Glass.GlueMix_Restore_Max + delta
    local glueMin = MariAutoFix.Settings.Glass.GlueMix_Restore_From - delta

    if mixCan then
        if condition >= glueMax then
            fixSubMenu:addOption(getText('IGUI_MariAutoFix_Fix_Glass_SubMenu_TGFGM'))
        elseif condition < glueMin then
            fixSubMenu:addOption(getText('IGUI_MariAutoFix_Fix_Glass_SubMenu_TBFGM'))
        else
            fixSubMenu:addOption(getText('IGUI_MariAutoFix_Fix_Glass_SubMenu_WGM'), player, fixGlassWithGlueMix, item, mixCan)
        end
    else
        fixSubMenu:addOption(getText('IGUI_MariAutoFix_Fix_Glass_SubMenu_NGM'))
    end
end

Events.OnPreFillInventoryObjectContextMenu.Add(OnPreFillInventoryObjectContextMenu)