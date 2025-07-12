{ pkgs, inputs }:

{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        browsh
        elinks
        librewolf
    ];

    programs = {
        firefox = {
            enable = true;
            languagePacks = [
                "en-GB"
                "sv-SE"
            ];
            policies = {
                DefaultDownloadDirectory = "\${home}/Downloads";
                HttpsOnlyMode = "enabled";
            };
            profiles = {
                default = {
                    name = "Browsing";
                    id = 0;
                    search = {
                        default = "ddg";
                        force = true;
                        engines = {
                            nix-packages = {
                                name = "NixOS Packages";
                                urls = [{
                                    template = "https://search.nixos.org/packages";
                                    params = [
                                        { name = "type"; value = "packages"; }
                                        { name = "query"; value = "{searchTerms}"; }
                                    ];
                                }];
                                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                                definedAliases = [ "@nix" ];
                            };
                            home-manager = {
                                name = "Home-manager options";
                                urls = [{
                                    template = "https://home-manager-options.extranix.com/?query={searchTerms}";
                                }];
                                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                                definedAliases = [ "@hm" ];
                            };
                        };
                    };
                    extensions = {
                        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
                            bitwarden
                            ublock-origin
                        ];
                    };
                };
            };
        };
    };
}
