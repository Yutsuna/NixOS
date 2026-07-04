{
  ...
}:
rec {

  mkSecretEnv =
    secret:
    "${secret} = \"\$(if [ -f /run/secrets/${secret} ]; then cat /run/secrets/${secret}; fi)\";";
}
