{
    programs.awscli = {
    enable = true;
    settings = {
      "default" = {
        region = "us-west-1";
        output = "json";
      };
    };
  };
}
