{
  lib,
  vars,
  self,
  ...
}:

{
  sops = {
    defaultSopsFile = "${self}/Secrets/Secrets.yaml";
    defaultSopsFormat = "yaml";

    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    secrets =
      lib.genAttrs
        [
          "MISTRAL_API_KEY"
          "GEMINI_API_KEY"
          "OPENROUTER_API_KEY"
          "MOONSHOT_API_KEY"
        ]
        (_: {
          owner = vars.user.name;
        });
  };
}
