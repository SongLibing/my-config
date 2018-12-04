gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:swap_lalt_lctl', 'ctrl:swap_ralt_rctl']"

cat <<EOF |sudo tee -a /usr/share/X11/xkb/symbols/ctrl

// Swap the functions of the right Alt key and the right Ctrl key.
partial modifier_keys
xkb_symbols "swap_ralt_rctl" {
    replace key <RALT> { [ Control_R, Control_R ] };
    replace key <RCTL> { [ Alt_R, Meta_R ] };
    modifier_map Mod1    { <RCTL> };
    modifier_map Control { <RALT> };
};
EOF

cat <<EOF | sudo tee -a /usr/share/X11/xkb/rules/evdev.lst

  ctrl:swap_ralt_rctl  Swap Right Alt with Right Ctrl
EOF

cat <<EOF | sudo tee -a  /usr/share/X11/xkb/rules/evdev

! option	=	symbols
  ctrl:swap_ralt_rctl	=	+ctrl(swap_ralt_rctl)
EOF


