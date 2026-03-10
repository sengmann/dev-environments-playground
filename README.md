# Dev Environment Playground

Experiment with various methods of providing a dev environment.

## Devenv.sh

Uses nix to build a development environment.

1. install nix
2. install devenv
3. configure shared secretspec provider (if not already done)
    1. `nix run nixpkgs#secretspec -- config init`
    2. `nix run nixpkgs#secretspec -- config provider add shared keyring://secretspec/shared/{profile}/{key}`
4. clone project
5. enter cloned dir
6. use command `direnv allow`

## Structure

Experimenting with the mono repo approach of devenv.

- [x] ~~Tools~~
    - [x] ~~Gradle~~
    - [x] ~~Kotlin~~
    - [x] ~~Git~~
    - [x] ~~NodeJS~~
    - [x] ~~Typescript~~
- [x] ~~Konfiguration~~
    - [x] ~~Auth Gradle~~
    - [x] ~~Auth npm~~
    - [x] ~~IntelliJ JDK Path~~
- [ ] Services
    - [x] ~~Postgres~~
    - [ ] Caddy
- [ ] Profile
    - [ ] Entwicklung
    - [ ] CI
- [ ] Build
    - [ ] Dockerfile
    - [ ] From Scratch
