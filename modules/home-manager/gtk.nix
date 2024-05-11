{ lib, pkgs, ... }: {
    gtk = {
        enable = true;
        theme = {
            name = "orchis-theme";
            package = pkgs.orchis-theme;
        };
        iconTheme = {
            name = "Adwaita";
            package = pkgs.gnome.adwaita-icon-theme;
        };
        #cursorTheme = {
        #    name = "Adwaita";
        #    package = pkgs.gnome.adwaita-icon-theme;
        #};
        gtk2.extraConfig = "gtk-application-prefer-dark-theme = 1";
        gtk3.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
        gtk4.extraConfig = {
            gtk-application-prefer-dark-theme = true;
        };
    };
    home.sessionVariables = {
        GTK_THEME = "Adwaita:dark";
    };
}
