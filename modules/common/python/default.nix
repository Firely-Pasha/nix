{pkgs, ...}:

{
  home.packages = with pkgs; [
    (python3.withPackages (p: (with p; [
      pip
      python-lsp-server
      python-lsp-ruff
    ])))
  ];
}
