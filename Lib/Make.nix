{
  ...
}:

rec {
  mkSecretEnv = secret: ''
    if [ -f /run/secrets/${secret} ]; then
      export ${secret}="$(cat /run/secrets/${secret})"
    fi
  '';
}
