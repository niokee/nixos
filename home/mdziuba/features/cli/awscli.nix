{
  programs.awscli = {
    enable = true;
    settings = {
      "default" = {
        region = "us-west-1";
        output = "json";
      };
      "profile mateusz.dziuba" = {
        mfa_serial = "arn:aws:iam::811074819111:mfa/1password";
      };
    };
  };
}
