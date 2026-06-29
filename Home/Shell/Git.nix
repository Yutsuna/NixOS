{ vars, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = vars.user.name;
        email = vars.user.email;
      };
    };
  };
}
