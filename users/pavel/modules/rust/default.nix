{pkgs, ...}:

{
  home.packages = with pkgs; [
    (rust-bin.nightly.latest.default.override {
      extensions = [ 
        "cargo" 
        "rust-src" 
      ];
      targets = [ 
        "wasm32-unknown-unknown" 
        "aarch64-linux-android"
        "aarch64-apple-ios"
        "aarch64-apple-ios-sim"
        "x86_64-apple-ios"
      ];
    })
    wabt
    cmake
    ninja
  ];
}
