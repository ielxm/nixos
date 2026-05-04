{ pkgs, ... }:

{
  console = {
    packages = with pkgs; [ terminus_font ];
    earlySetup = true;
    font = "ter-u16b";
    keyMap = "us";
  };
}
