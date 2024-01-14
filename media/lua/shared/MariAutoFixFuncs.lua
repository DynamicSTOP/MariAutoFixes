---@author Leonid B. aka DynamicSTOP

-- hello hello it's 2024 here, why those funcs aren't built in functionality?
local Funcs = {}

---MariAutoFix.Funcs.SettingsSplit
---@usage splits string into parts
---@param str string
---@return table
function Funcs.SettingsSplit(str)
    local list = {}
    for s in string.gmatch(str, "([^;]+)") do
        if str ~= '' then
            table.insert(list, s)
        end
    end
    return list
end

---MariAutoFix.Funcs.IsInList
---@usage checks if {'apple', 'orange'} has 'orange' in it
---@param list table
---@param needle string
---@return boolean
function Funcs.IsInList(list, needle)
    for _, item in ipairs(list) do
        if item == needle then
            return true
        end
    end
    return false
end

---MariAutoFix.Funcs.IsInListPartially
---@usage checks if {'apple', 'orange'} has 'rang' in it
---@param list table
---@param needle string
---@return boolean
function Funcs.IsInListPartially(list, needle)
    for _, item in ipairs(list) do
        if string.find(needle, item) then
            return true
        end
    end
    return false
end

---MariAutoFix.PrintList
---@usage silly old me get his console.log output: cat ~/Zomboid/console.txt | grep "____________________________" -a -A 15
---@param list table
function Funcs.PrintList(list)
    print('____________________________')
    for i, item in ipairs(list) do
        print('  ', i, '  ', item)
    end
    print('____________________________')
end

return Funcs