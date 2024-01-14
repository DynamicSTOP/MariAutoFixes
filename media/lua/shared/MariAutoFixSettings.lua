---@author Leonid B. aka DynamicSTOP
--- TODO put this stuff into sandbox settings require "MariAutoFix"
local Settings = {}

local SBVars = SandboxVars.MariAutoFix or {}

--- on or off injuries
Settings.Evil = SBVars.Evil

--- if set to 0 no xp will be granted upon repairing
Settings.XP_Multiplier = SBVars.XP_Multiplier or 1;

Settings.Glass = {}
--- list of types that will be allowed to repair
Settings.Glass.Repairable_Items = SBVars.Glass_Repairable_Items or 'Windshield1;Windshield2;Windshield3;'
--- if experimental part of autodetecting is on
Settings.Glass.Repairable_Experimental = SBVars.Glass_Repairable_Experimental or ''
--- some of the types that we should always ignore, e.g. glass bottle?
Settings.Glass.Repairable_Exp_IgnoreTypes = SBVars.Glass_Repairable_Exp_IgnoreTypes or ''
--- some of the common parts of the names we should search in type names. e.g. "windshield" case insensitive
Settings.Glass.Repairable_Exp_SearchPositive = SBVars.Glass_Exp_SearchPositive or ''
--- some of the common parts of the names we should be ignoring e.g. "armor" is probably made from metal
Settings.Glass.Repairable_Exp_SearchNegative = SBVars.Glass_Exp_SearchNegative or ''

Settings.Glass.Restore_Margin_Per_Skill = SBVars.Glass_Restore_Margin_Per_Skill or 1

--- minimum quality of the restorable item
Settings.Glass.GlueMix_Restore_From = SBVars.Glass_GlueMix_Restore_From or 0
--- maximum quality that solution could fix
Settings.Glass.GlueMix_Restore_Max = SBVars.Glass_GlueMix_Restore_Max or 60
--- one solution could fix this amount at max
Settings.Glass.GlueMix_Restore_Step = SBVars.Glass_GlueMix_Restore_Step or 10

Settings.Glass.GluePro_Restore_From = 40
Settings.Glass.GluePro_Restore_Max = 80
Settings.Glass.GluePro_Restore_Step = 5

return Settings