{
  fonts.fontconfig.enable = true;

  xdg.configFile."fontconfig/fonts.conf".text = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
    <fontconfig>
      <match>
        <test name="lang" compare="contains">
          <string>ja</string>
        </test>
        <edit name="family" mode="prepend">
          <string>Source Han Sans VF</string>
        </edit>
      </match>
    </fontconfig>
  '';
}
