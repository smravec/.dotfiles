
set -U -x SXHKD_SHELL /usr/bin/bash
set -U -x SXHKD_SHELL sh

if status is-interactive
    # Commands to run in interactive sessions can go here
	starship init fish | source
	set -Ua fish_user_paths /home/simon/Code/Bash-Scripts
	set -Ua fish_user_paths /home/simon/.local/bin
	
end

if status --is-login
		set -U -x Brightness 1.0
		set -U -x PF_INFO "ascii os wm pkgs memory uptime shell kernel "
  	if test -z "$DISPLAY" -a $XDG_VTNR = 1
    		exec startx -- vt1 &> /dev/null
				
  	end
end
