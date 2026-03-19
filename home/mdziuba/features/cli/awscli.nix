{personalConfig, ...}: let
  awsProfile = personalConfig.aws.profile;
  awsRegion = personalConfig.aws.defaultRegion;
  awsAccountID = personalConfig.aws.awsAccountID;
in {
  programs.awscli = {
    enable = true;
    settings = {
      "default" = {
        region = awsRegion;
      };
      "profile ${awsProfile}" = {
        credential_process = "aws-vault exec ${awsProfile} --json";
        mfa_serial = "arn:aws:iam::${awsAccountID}:mfa/1password";
        mfa_process = "arx otp";
      };
      "profile arx" = {
        source_profile = "mateusz.dziuba";
        role_arn = "arn:aws:iam::${awsAccountID}:role/arx-admin";
        mfa_serial = "arn:aws:iam::${awsAccountID}:mfa/1password";
        mfa_process = "arx otp";
      };
    };
  };
}
