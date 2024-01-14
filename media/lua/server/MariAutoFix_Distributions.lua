require 'Items/SuburbsDistributions'
require 'Items/ProceduralDistributions'
require 'Vehicles/VehicleDistributions'

-- same as MechanicMag1

table.insert(ProceduralDistributions.list["BookstoreMisc"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["BookstoreMisc"].items, 2);
table.insert(ProceduralDistributions.list["CrateMagazines"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["CrateMagazines"].items, 1);
table.insert(ProceduralDistributions.list["CrateMechanics"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["CrateMechanics"].items, 1);
table.insert(ProceduralDistributions.list["GasStorageMechanics"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["GasStorageMechanics"].items, 1);
table.insert(ProceduralDistributions.list["LibraryBooks"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["LibraryBooks"].items, 1);
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["LivingRoomShelf"].items, 0.1);
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["LivingRoomShelfNoTapes"].items, 0.1);
table.insert(ProceduralDistributions.list["LivingRoomSideTable"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["LivingRoomSideTable"].items, 0.1);
table.insert(ProceduralDistributions.list["LivingRoomSideTableNoRemote"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["LivingRoomSideTableNoRemote"].items, 0.1);
table.insert(ProceduralDistributions.list["MagazineRackMixed"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["MagazineRackMixed"].items, 1);
table.insert(ProceduralDistributions.list["MechanicShelfBooks"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["MechanicShelfBooks"].items, 2);
table.insert(ProceduralDistributions.list["MechanicSpecial"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["MechanicSpecial"].items, 1);
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["PostOfficeMagazines"].items, 1);
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["ShelfGeneric"].items, 0.1);
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items, 1);
table.insert(ProceduralDistributions.list["ToolStoreBooks"].items, "Base.MariAutoFixesMag");
table.insert(ProceduralDistributions.list["ToolStoreBooks"].items, 2);

-- just some bonus spots

table.insert(SuburbsDistributions["all"]["inventorymale"].items, "Base.MariAutoFixesMag");
table.insert(SuburbsDistributions["all"]["inventorymale"].items, 0.005);
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, "Base.MariAutoFixesMag");
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items, 0.002);

table.insert(VehicleDistributions["GloveBox"].items, "Base.MariAutoFixesMag");
table.insert(VehicleDistributions["GloveBox"].items, 0.01);

table.insert(SuburbsDistributions["all"]["postbox"].items, "Base.MariAutoFixesMag");
table.insert(SuburbsDistributions["all"]["postbox"].items, 0.01);
table.insert(SuburbsDistributions["all"]["bin"].items, "Base.MariAutoFixesMag");
table.insert(SuburbsDistributions["all"]["bin"].items, 0.001);
