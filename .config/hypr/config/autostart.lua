-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart

hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("hyprlock")
    hl.exec_cmd("xhost +SI:localuser:root")
    
	-- btop: sin delay
    hl.exec_cmd("kitty --title btop -e btop")
 
    -- cava: delay de 5 segundos
    hl.exec_cmd("kitty --title cava -e sh -c \"sleep 5 && cava\"")
 
    -- pipe: delay de 7 segundos
    hl.exec_cmd("kitty --title pipe -e sh -c \"sleep 1 && pipes.sh\"")
end)
