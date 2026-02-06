{pkgs, ...}:

{
  home.packages = with pkgs; [
    (python3.withPackages (p: (with p; [
      python-lsp-server
      python-lsp-ruff
    ])))
  ];
}
