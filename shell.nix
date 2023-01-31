{pkgs}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    global-platform-pro
    javacard-devkit
    oraclejdk11
  ];
  shellHook = ''
        export JAVA_HOME=$(type -P javac | xargs readlink -f | xargs dirname | xargs dirname)
        export PATH="$JAVA_HOME/bin:$PATH"
    '';
}