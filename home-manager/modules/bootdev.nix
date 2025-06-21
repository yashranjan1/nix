{ lib, stdenv, fetchFromGitHub, buildGoModule, }:
buildGoModule rec {
  pname = "bootdev";
  version = "1.19.2";

  src = fetchFromGitHub {
    owner = "bootdotdev";
    repo = "bootdev";
    rev = "v${version}";
    sha256 = "sha256-jTI91t/gcEdOc3mwP0dFqL5sYeaC6nD96+RpuQfAf4s=";
  };
  vendorHash = "sha256-jhRoPXgfntDauInD+F7koCaJlX4XDj+jQSe/uEEYIMM=";
  meta = with lib; {
    description = "The official command line tool for Boot.dev";
    homepage = "https://www.boot.dev/";
    license = licenses.mit;
    maintainers = with maintainers; [ wagslane cgsdev0 ];
  };
}
