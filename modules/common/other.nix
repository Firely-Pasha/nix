{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    nodejs_24
    bun
    lazygit
    act
    go-migrate
    tmuxinator
    gitlab-runner
    gitlab-ci-local
    tree-sitter
    openapi-generator-cli
  ];
}
