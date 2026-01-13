{personalConfig, ...}: let
  awsProfile = personalConfig.aws.profile;
  awsRegion = personalConfig.aws.defaultRegion;
in {
  programs.awscli = {
    enable = true;
    settings = {
      "default" = {
        region = awsRegion;
      };
      "profile ${awsProfile}" = {
        region = awsRegion;
        credential_process = "aws-vault exec ${awsProfile} --json";
      };
    };
  };
}
