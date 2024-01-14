---@author Leonid B. aka DynamicSTOP

if MariAutoFix then
    return
end  -- avoid loading twice the same module
MariAutoFix = {}
MariAutoFix.Funcs = require('MariAutoFixFuncs')
MariAutoFix.Settings = require('MariAutoFixSettings')

MariAutoFix.Settings.Glass.Repairable_Items_List = MariAutoFix.Funcs.SettingsSplit(MariAutoFix.Settings.Glass.Repairable_Items)
MariAutoFix.Settings.Glass.Repairable_Exp_IgnoreTypes_List = MariAutoFix.Funcs.SettingsSplit(MariAutoFix.Settings.Glass.Repairable_Exp_IgnoreTypes)
MariAutoFix.Settings.Glass.Repairable_Exp_SearchPositive_List = MariAutoFix.Funcs.SettingsSplit(MariAutoFix.Settings.Glass.Repairable_Exp_SearchPositive)
MariAutoFix.Settings.Glass.Repairable_Exp_SearchNegative_List = MariAutoFix.Funcs.SettingsSplit(MariAutoFix.Settings.Glass.Repairable_Exp_SearchNegative)

--- for faster context menu check
if MariAutoFix.Settings.Glass.GluePro_Restore_Max > MariAutoFix.Settings.Glass.GlueMix_Restore_Max then
    MariAutoFix.Settings.Glass.Restore_Max = MariAutoFix.Settings.Glass.GluePro_Restore_Max
else
    MariAutoFix.Settings.Glass.Restore_Max = MariAutoFix.Settings.Glass.GlueMix_Restore_Max
end

if MariAutoFix.Settings.Glass.GlueMix_Restore_From > MariAutoFix.Settings.Glass.GluePro_Restore_From then
    MariAutoFix.Settings.Glass.Restore_From = MariAutoFix.Settings.Glass.GluePro_Restore_From
else
    MariAutoFix.Settings.Glass.Restore_From = MariAutoFix.Settings.Glass.GlueMix_Restore_From
end