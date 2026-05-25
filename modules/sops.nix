self:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  inherit (builtins)
    concatStringsSep
    fromJSON
    listToAttrs
    readFile
    isAttrs
    mapAttrs
    ;
  inherit (lib)
    filterAttrs
    mapAttrsToListRecursive
    mapAttrsRecursive
    nameValuePair
    mkOption
    ;
  inherit (lib.types)
    submodule
    str
    ;

  # register all secrets from the yaml file to be available from config.sops.secrets
  secretsYamlDirty = fromJSON (
    readFile (
      pkgs.runCommand "secrets.yaml.json" { }
        ''${pkgs.yj}/bin/yj < "${../secrets/secrets.yaml}" > "$out"''
    )
  );
  secretsYaml = filterAttrs (name: value: name != "sops") secretsYamlDirty;
  secretNames = mapAttrsToListRecursive (name: value: name) secretsYaml;
  secretNamesFlattened = map (concatStringsSep "/") secretNames;
  secrets = listToAttrs (map (secretName: (nameValuePair secretName { })) secretNamesFlattened);

  # alias config.sops.secrets."foo/bar/baz".path to secrets.foo.bar.baz
  mkSecretOption = mkOption {
    type = str;
    readOnly = true;
  };
  mkSecretSubmodule =
    options:
    mkOption {
      type = submodule {
        inherit options;
      };
    };
  mkNestedSecretOptions =
    node:
    if isAttrs node then
      (mkSecretSubmodule (mapAttrs (name: value: mkNestedSecretOptions value) node))
    else
      mkSecretOption;
  secretOptions = mkNestedSecretOptions secretsYaml;
  secretValues = mapAttrsRecursive (
    path: value: config.sops.secrets."${concatStringsSep "/" path}".path
  ) secretsYaml;
in
{
  imports = [
    self.inputs.sops-nix.nixosModules.sops
  ];

  config = {
    sops = {
      defaultSopsFile = ../secrets/secrets.yaml;
      inherit secrets;
    };

    environment.systemPackages = [ pkgs.sops ];
  };

  options.secrets = secretOptions;
  config.secrets = secretValues;
}
