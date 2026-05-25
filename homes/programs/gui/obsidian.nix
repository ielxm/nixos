let
  obsidianVaultsDir=".obsidian";
in {
  programs.obsidian = {
    enable = true;
    vaults = {
      diary = {
        target = "${obsidianVaultsDir}/Diary";
        enable = false;
      };
      KB = {
        target = "${obsidianVaultsDir}/KB";
        enable = false;
      };
      
    };
  };
}
