state("SporeApp")
{
	int Cell: 0x12B3C04, 0xE8, 0x38, 0x9C;
	
	int PartTutorial: 0x12B3C04, 0xE8, 0x38, 0x4C;
	
	int Creature: 0x127EB50, 0xFC;
	
	int TribeCivSpace: 0x116B0C4, 0xEF8;
	
	int SpaceContact: 0x127EB04, 0x68, 0x20;
	
	int Editor: 0x12F6DB4, 0x20, 0x408, 0x20, 0x3B8; 
	
	int Loads: 0x11FCC50, 0x58;
	
	int BadgeGet: 0x12DC0FC, 0x70, 0x5C;
}

startup
{
	settings.Add("Cell Stage", true, "Cell Stage");
	settings.Add("Other Stages", true, "Other Stages");
	settings.Add("Miscellanous", false, "Miscellanous");

	settings.CurrentDefaultParent = "Cell Stage";
	settings.Add("Cell", true, "Ending+Mating Cutscenes");
	settings.SetToolTip("Cell", "Split on the last cutscene, when your cell grows a brain and when mating.");
	settings.Add("PartTutorial", true, "Tutorial Cutscene");
	settings.SetToolTip("PartTutorial", "Split after the tutorial part cutscene (after gettting 12 dna in easy or normal difficulty).");
	
	settings.CurrentDefaultParent = "Other Stages";
	settings.Add("Creature", true, "Creature and Tribal Stage");
	settings.SetToolTip("Creature", "Split after the first cutscene and when evolving (growing a brain cutscene) in Creature Stage.");
	settings.Add("TribeCivSpace", true, "Tribal, Civ. and Space Stage");
	settings.SetToolTip("TribeCivSpace", "Split after the cutscene when you ally/destroy a tribe in Tribal Stage, after the first cutscene and when you conquer a city in Civ Stage (after the cutscene+the plane cutscene), when getting a promotion in Space Stage.");
	
	settings.CurrentDefaultParent = "Miscellanous";
	settings.Add("SpaceContact", false, "Communication panels");
	settings.SetToolTip("SpaceContact", "Split after closing the communication panel of a city in Civ Stage or an empire in Space Stage.");
	
	settings.Add("Editor", false, "Editor saves");
	settings.SetToolTip("Editor", "Split after exiting an editor in Cell, Creature Stage etc.");
	
	settings.Add("BadgeGet", false, "Obtaining Badges");
	settings.SetToolTip("BadgeGet", "Split after obtaining a badge in space stage. Can be used for omnipotent or in Any%.");
}

split
{
	if (settings["Cell"] && current.Cell < old.Cell) {
		return true;
	}
	if (settings["Creature"] && current.Creature < old.Creature) {
		return true;
	}
	if (settings["TribeCivSpace"] && current.TribeCivSpace < old.TribeCivSpace) {
		return true;
	}
	if (settings["SpaceContact"] && current.SpaceContact < old.SpaceContact) {
		return true;
	}
	if (settings["Editor"] && current.Editor < old.Editor) {
		return true;
	}
	if (settings["BadgeGet"] && current.BadgeGet > old.BadgeGet) {
		return true;
	}
	if (settings["PartTutorial"] && current.PartTutorial < old.PartTutorial) {
		return true;
	}
}

isLoading
{
return current.Loads > 0;
}
