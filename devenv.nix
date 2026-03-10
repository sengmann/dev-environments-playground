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
  '';

  # set env variables when running in ci with `--profile=ci`
  profiles.ci.module = {
    env.CI = true;
  };
}
