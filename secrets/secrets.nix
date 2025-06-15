let
  inherit (builtins)
    attrNames
    listToAttrs
    readDir
    removeAttrs
    ;

  cassiopeia-root = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIG0MpAJw5Q5t4yaxX88Xr1cUjMHEfjcfq++v7efoqTIa";
  andromeda-root = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAHfr8D6mA/MhI/5CQF/NiVCBiwWheLog31vpFmXtIu8";
  cassiopeia = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVor+g/31/XFIzuZYQrNK/RIbU1iDaSyOfM8re73eAd";
  andromeda = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVxinYyV/gDhWNeSa0LD6kRKwTWhFxXVS23axGO/2sa";

  keys = [
    cassiopeia-root
    andromeda-root
    cassiopeia
    andromeda
  ];
  secretFiles = attrNames (removeAttrs (readDir (toString ./.)) [ "secrets.nix" ]);
  result = listToAttrs (
    map (x: {
      name = x;
      value = {
        publicKeys = keys;
      };
    }) secretFiles
  );
in
result
