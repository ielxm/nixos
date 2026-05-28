{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        padding = { right = 1; };
      };
      modules = [
        {
          type="os";
          key="Distro";
        }
        {
          type="kernel";
          key="Kernel";
        }
        {
          type="shell";
          key="Shell";
        }
        {
          type="packages";
          key="Pkgs";
        }
        {
          type="uptime";
          key="Uptime";
        }
        {
          type="cpu";
          key="CPU";
        }
        {
          type="gpu";
          key="GPU";
        }
        {
          type="memory";
          key="RAM";
        }
        {
          type="disk";
          key="Drive";
        }        
      ];
    };
  };
}
