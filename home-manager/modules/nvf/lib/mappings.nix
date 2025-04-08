{ lib }:

with lib;

let
  mkMappingOption = description: default:
    mkOption {
      type = types.nullOr types.str;
      inherit default description;
    };

in {
  inherit mkMappingOption;
}
