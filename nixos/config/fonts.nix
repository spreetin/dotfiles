{ config, pkgs, options, ... }:

{
    fonts = {
        packages = with pkgs; [
            font-awesome fira roboto liberation_ttf
            nerd-fonts.liberation nerd-fonts.jetbrains-mono nerd-fonts.symbols-only
            openttd-ttf adwaita-fonts
        ];
        fontDir.enable = true;
    };
}
