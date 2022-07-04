from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile import hook
import subprocess
import os
#from test import *

mod = "mod4"
terminal = guess_terminal()

#Brightness
#global default_brightness 
# default_brightness = 1.0

# def fun1():
#     global default_brightness
#     default_brightness = default_brightness + 0.1
#     return str(default_brightness)
keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "Tab",lazy.next_layout(),desc='Toggle through layouts'),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    #Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),

    # Custom keybinds
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r",lazy.spawn("rofi -show run"), desc="Spawns rofi"),
    Key([mod], "b",lazy.spawn("firefox")),
    #Key([mod] ,"F8", lazy.spawn("exec /home/simon/Code/Bash-Scripts/SystemUtils.fish brightness 0.5")),
    #Key([mod] ,"F7", subprocess.run("SystemUtils.fish"," brightness","-0.2")),
]
#lazy.spawn("change_brightness.sh 1")

group_icon1 = "ﳐ"
group_icon2 = ""
group_icon3 = ""
group_icon4 = ""
group_icon5 = ""

groups = [
            Group(group_icon1, spawn = "alacritty"),
            Group(group_icon2, spawn = "alacritty"),
            Group(group_icon3, spawn = "firefox"),
            Group(group_icon4, spawn = "alacritty"),
            Group(group_icon5, spawn = "alacritty")
        ]



for index, group in enumerate(groups):

    if index == 0:
        index = 5
    
    keys.extend(
        [
            Key(
                [mod],
                str(index),
                lazy.group[group.name].toscreen(),
                desc="Switch to group {}".format(group.name),
            ),

            Key(
                [mod, "shift"],
                str(index),
                lazy.window.togroup(group.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(group.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layouts = [
    layout.Columns(
        border_focus= "565f8c" ,#"596394",
        border_normal = "000000",
        border_width = 1,
        margin = 5,
        margin_on_single = 5
    ),
    layout.Max(),
]

widget_defaults = dict(
    font="sans",
    fontsize=32,
    padding=0,
)
extension_defaults = widget_defaults.copy()

colors = ["#34eb9c","#34abeb"]
yellow = "fcba03"
red = "ff4f40"
transparent = "000000ff"
gray = "ffffff99"
gray1 = "8fa0f2ff"
highlight_color = "#d1e0ff"#c2d2f2"#b1c7f2"

screens = [
    Screen(
        bottom=bar.Bar(
           [

            widget.GroupBox(
                            highlight_method = None,
                            this_current_screen_border = None,
                            visible_groups = [group_icon1],
                            fontsize = 100,
                            urgent_alert_method = "None",
                            urgent_border = "00000000",
                            active = gray1,
                            block_highlight_text_color = highlight_color,
                            ),
            widget.Spacer(
                         length = 40,   
                        ),            

            widget.GroupBox(
                            urgent_alert_method = None,urgent_border = "00000000",
                            fontsize = 60, active = gray1,spacing = 50,highlight_method=None,
                            disable_drag = True,this_current_screen_border = None,
                            block_highlight_text_color = highlight_color,
                            visible_groups =[group_icon2,group_icon3,group_icon4,group_icon5]
                            ),
            
            widget.Spacer(),
            
            widget.TextBox(
                            fmt  = "|",
                            fontsize = 40,
                            foreground = gray1,
            ),
            widget.TextBox(
                            fmt  = " ",
                            fontsize = 40,
                            foreground = gray1,
            ),

            widget.Clock(
                            format=" %d/%m ",
                            fontsize = 25,
                            foreground = gray1
                        ),

            widget.TextBox(
                            fmt  = "|",
                            fontsize = 40,
                            foreground = gray1,
            ),

            widget.TextBox(
                            fmt  = " ",
                            fontsize = 42,
                            foreground = gray1,
            ),

            widget.Clock(
                            format=" %H:%M ",
                            fontsize = 27,
                            foreground = gray1
                        ),


            widget.TextBox(
                            fmt  = "|",
                            fontsize = 40,
                            foreground = gray1,
            ),

            widget.Battery(
                            format = " {char} ",
                            font = "FiraCode Nerd Font Mono", fontsize = 28,
                            charge_char = "", discharge_char = "",full_char = "",empty_char = "", 
                            unknown_char = "",
                            update_interval = 1,
                            foreground = gray1, low_foreground = red,
                            low_percentage = 0.2, 
                        ),
            widget.Battery(
                            format="{percent:2.0%} ",
                            fontsize = 27,
                            foreground = gray1,
                        ),
            ],
                75,
                background = "1a1b26fe", 
                border_width=[2, 0, 0, 0],
                border_color= "8fa0f233"
            ),
        wallpaper="~/.config/qtile/space.png",
    ),
]

#Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width = 0
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True
wmname = "qtile"
