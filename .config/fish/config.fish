# Start X at login.
if status --is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

# Load up the config files.
if status --is-interactive
    for file in ~/.config/fish/fish.d/*
        test -r $file
        and source $file
    end
end
