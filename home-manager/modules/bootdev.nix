{
  lib,
  stdenv,
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  pname = "bootdev";
  version = "1.19.1";

  src = fetchFromGitHub {
    owner = "bootdotdev";
    repo = "bootdev";
    rev = "v${version}";
    sha256 = "sha256-cAVCTA4SZdD3QVgbSbha860fExq1swWnJjpWKpfHP2Q=";
  };
  vendorHash = "sha256-jhRoPXgfntDauInD+F7koCaJlX4XDj+jQSe/uEEYIMM=";
  meta = with lib; {
    description = "The official command line tool for Boot.dev";
    homepage = "https://www.boot.dev/";
    license = licenses.mit;
    maintainers = with maintainers; [wagslane cgsdev0];
  };
}
