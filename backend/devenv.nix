{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
let
  initScript = ''
    CREATE TABLE Training(id SERIAL PRIMARY KEY, name TEXT);
  '';
in
{
  languages.kotlin.enable = true;
  services.postgres = {
    enable = true;
    listen_addresses = "*";
    initialDatabases = [
      {
        name = "tcc";
        initialSQL = initScript;
        user = "tcc";
        pass = "tcc";
      }
    ];
  };

  processes.backend = {
      exec = "gradle bootTestRun";
      cwd = "${config.git.root}/backend";
      process-compose = {
        depends_on = {
          postgres = {
            condition = "process_healthy";
          };
        };
      };
    };
}
