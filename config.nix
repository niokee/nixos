# Personal configuration values
# Centralized place for user-specific settings that vary across machines
{
  # User information
  user = {
    name = "Mateusz Dziuba";
    username = "mdziuba";
    email = {
      personal = "mateusz.dziuba97@gmail.com";
      work = "mateusz.dziuba@arx.city";
    };
  };

  # AWS configuration
  aws = {
    defaultRegion = "us-west-1";
    profile = "mateusz.dziuba";
  };

  # Git settings
  git = {
    defaultEmail = "mateusz.dziuba97@gmail.com";
  };

  # 1Password configuration
  onePassword = {
    # macOS agent socket path
    darwinAgentSock = "~/Library/Group\\ Containers/2BUA8C4S2C.com.1password/t/agent.sock";
  };

  # Hardware-specific settings
  hardware = {
    bluetooth = {
      # Bluetooth device MAC addresses for auto-connect
      headphones = "F8:4E:17:7F:1B:A3";
    };
  };
}
