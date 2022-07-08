set -U -x fish_greeting ""
set -U -x SXHKD_SHELL /usr/bin/bash
set -U -x SXHKD_SHELL sh
set -U -x custom_cursor_colors true

if status is-interactive
    # Commands to run in interactive sessions can go here
	starship init fish | source
	set -Ua fish_user_paths /home/simon/Code/Scripts
	set -Ua fish_user_paths /home/simon/.local/bin
	
end

if status --is-login
		set -U -x PF_INFO "ascii title os wm shell kernel pkgs"
  	if test -z "$DISPLAY" -a $XDG_VTNR = 1
    		exec startx -- vt1 &> /dev/null
				
  	end
end
