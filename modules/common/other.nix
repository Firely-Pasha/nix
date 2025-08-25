{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    nodejs
    bun
    lazygit
    act
    go-migrate
    tmuxinator
    gitlab-runner
    gitlab-ci-local
  ];
}
