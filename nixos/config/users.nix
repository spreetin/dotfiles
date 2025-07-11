{ config, pkgs, options, ... }:

{
    users = {
        users.david = {
            isNormalUser = true;
            description = "David Falk";
            extraGroups = [ "networkmanager" "wheel" "video" "users" "libvirtd" "david" ];
            uid = 1000;
            shell = pkgs.zsh;
        };
        groups = {
            david.gid = 1000;
        };
    };

    security = {
        polkit = {
            enable = true;
            extraConfig = ''
                polkit.addRule(function(action, subject) {
	                if (subject.isInGroup("users") && (
	                    action.id == "org.freedesktop.login1.reboot" ||
		                action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
		                action.id == "org.freedesktop.login1.power-off" ||
		                action.id == "org.freedesktop.login1.power-off-multiple-sessions"))
                        {
	                        return polkit.Result.YES;
	                }
	            })
            '';
        };
    };
}
