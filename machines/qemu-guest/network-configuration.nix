{ options, ... }:

{

  networking.nameservers = [ "8.8.8.8#dns.google" "8.8.4.4#dns.google" ]; 

  # systemd-resolved
  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    domains = [ "~." ];
    dnsovertls = "opportunistic";
  };

  # NTP servers (defaults + 0.pool.ntp.org)
  networking.timeServers = options.networking.timeServers.default ++ [ "0.pool.ntp.org" ];

  # Hostname 
  networking.hostName = "nixos"; # Define your hostname.
  # Disable dhcpcd completely to prevent it from working alongside with systemd-networkd
  networking.useDHCP = false;

  # Enable systemd-networkd
  systemd.network.enable = true;

  systemd.network.networks."10-lan" = {
    matchConfig.Name = "enp6s0";
    address = [
      "192.168.100.2/24" # default NAT network
    ];
    routes = [
      { Gateway = "192.168.100.1"; }
    ];
    linkConfig.RequiredForOnline = "routable";
  };

  # Replace iptables with nftables
  networking.nftables.enable = true;

  networking.firewall = {
    enable = true;
    allowPing = true;
    logRefusedConnections = true;
    checkReversePath = false; # for libvi
    allowedTCPPorts = [ 22 ];
    #allowedUDPPorts = [ ... ];
  };

}
