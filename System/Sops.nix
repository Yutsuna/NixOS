{
  vars,
  self,
  ...
}:

{
  sops = {
    defaultSopsFile = "${self}/Secrets/Secrets.yaml";
    defaultSopsFormat = "yaml";

    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    secrets = {
      MISTRAL_API_KEY = {
        owner = vars.user.name;
      };
    };
  };
}
