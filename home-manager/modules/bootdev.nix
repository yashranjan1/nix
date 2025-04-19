{
  lib,
  stdenv,
  fetchFromGitHub,
  buildGoModule,
}:
buildGoModule rec {
  pname = "bootdev";
  version = "1.19.0";

  src = fetchFromGitHub {
    owner = "bootdotdev";
    repo = "bootdev";
    rev = "v${version}";
    sha256 = "1cavxq2nzb9wxgldf2rzbrvvcl0mvr85hpxcbhymcpx3ls71fbp5";
  };
  vendorHash = "sha256-jhRoPXgfntDauInD+F7koCaJlX4XDj+jQSe/uEEYIMM=";
  meta = with lib; {
    description = "The official command line tool for Boot.dev";
    homepage = "https://www.boot.dev/";
    license = licenses.mit;
    maintainers = with maintainers; [wagslane cgsdev0];
  };
}
