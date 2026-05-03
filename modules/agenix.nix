let
  machines = {
    laptop="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAf6wRDrKuCdTl4tsl36EiayXTmmTgSAbUVcZ1xN1U9v ielxm@nixos";
    computer="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK8sKRLFw6ykHKTwEidJ2GIYmYz2LmuetnBeaXPqZWtK ielxm@nixos";
  };

in

{
  "qemu-guest/id_ed25519.age".publicKeys = [ machines.computer ];
  "computer/id_ed25519.age".publicKeys = [ machines.computer];
  "laptop/id_ed25519.age".publicKeys = [ machines.laptop ];

}
