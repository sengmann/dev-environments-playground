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
  dbPass = config.secretspec.secrets.db-pass;
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
        pass = dbPass;
      }
    ];
  };

  processes.backend = {
    exec = "gradle bootTestRun";
    env = {
      SPRING_DATABASE_PASSWORD = dbPass;
    };
    cwd = "${config.git.root}/backend";
    process-compose = {
      depends_on = {
        postgres = {
          condition = "process_healthy";
        };
      };
    };
  };

  # TODO: make sure db is mocked or ready
  tasks."backend:build" = {
    exec = "gradle build";
    cwd = "${config.git.root}/backend";
  };

  tasks."backend:test" = {
    exec = "gradle test";
    cwd = "${config.git.root}/backend";
  };
}
