{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  packages = [
    pkgs.git
    pkgs.secretspec
  ];

  enterShell = ''
    git --version # Use packages
    gradle --version
    node --version
    pnpm --version
    echo
    echo "Never print secrets :)"
    echo ${config.secretspec.secrets.api-key}
    echo ${config.secretspec.secrets.shared-secret}
    echo
  '';

  # set env variables when running in ci with `--profile=ci`
  profiles.ci.module = {
    env.CI = true;
  };
}
