{
  networking.nameservers = [ "1.1.1.1#cloudflare-dns.com" "1.0.0.1#cloudflare-dns.com" "2606:4700:4700::1111#cloudflare-dns.com" "2606:4700:4700::1001#cloudflare-dns.com" ]; 

  services.resolved = {
    enable = true;
    domains = [ "~." ];
    dnssec = "allow-downgrade";
    dnsovertls = "opportunistic";
  };

  networking.hostName = "nixos";

  # Disable dhcpcd.
  networking.useDHCP = false;

  # Enable systemd-networkd.
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
    checkReversePath = false;
  };

  # Replace iptables firewall with nftables.
  networking.nftables.enable = true;
}
