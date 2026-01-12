{
  programs.awscli = {
    enable = true;
    settings = {
      "default" = {
        region = "us-west-1";
      };
      "profile mateusz.dziuba" = {
        region = "us-west-1";
        credential_process = "aws-vault exec mateusz.dziuba --json";
      };
    };
  };
}
