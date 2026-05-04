{
  networking.nameservers = [ "1.1.1.1#cloudflare-dns.com" "1.0.0.1#cloudflare-dns.com" "2606:4700:4700::1111#cloudflare-dns.com" "2606:4700:4700::1001#cloudflare-dns.com" ]; 

  # systemd-resolved
  services.resolved = {
    enable = true;
    dnssec = "allow-downgrade";
    domains = [ "~." ];
    dnsovertls = "opportunistic";
  };

   # NTP servers (defaults + 0.pool.ntp.org)
  networking.timeServers = options.networking.timeServers.default ++ [ "0.pool.ntp.org" ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.useDHCP = false;

  systemd.network.enable = true;

  systemd.network.networks."10-lan" = {
    matchConfig.Name = "en*";
    networkConfig = {
      DHCP = "ipv4";
      IPv6AcceptRA = true;
    };
    linkConfig.RequiredForOnline = "routable";
  };

  networking.firewall = {
    enable = true;
    allowPing = true;
    logRefusedConnections = true;
    checkReversePath = false; # for libvi
    allowedTCPPorts = [ 22 ];
    #allowedUDPPorts = [ ... ];
  };
  networking.nftables.enable = true; # replace iptables with nftables
}
