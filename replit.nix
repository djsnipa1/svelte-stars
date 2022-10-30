{ pkgs }: {
    deps = [
        pkgs.nodejs-16_x
        pkgs.wget
        pkgs.bashInteractive
        pkgs.nodePackages.pnpm
        pkgs.nodePackages.svelte-language-server
        pkgs.neovim
        pkgs.bat
        pkgs.lf
      
    ];
}