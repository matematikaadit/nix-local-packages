{ writeTextFile, yuicompressor, openjdk, bash }:

writeTextFile {
    name = "yuicompressor-bin-0.1";
    text = ''
        #!${bash}/bin/bash
        ${openjdk}/bin/java -jar ${yuicompressor}/lib/yuicompressor.jar "$@"
    '';
    executable = true;
    destination = "/bin/yuicompressor";
}
