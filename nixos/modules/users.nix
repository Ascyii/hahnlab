{
  users.users = {
    root = {
      isNormalUser = false;
      initialPassword = "root"; # Be sure to change upon install
    };
    jonas = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
    };
    horst = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
    };
  };
}
