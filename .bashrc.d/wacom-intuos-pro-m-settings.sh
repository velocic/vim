# some useful commands:
# xsetwacom list devices
# xsetwacom set <stylus id> ResetArea - when passed the id of a STYLUS, resets the resolution setting to default
# xsetwacom set <stylus ID> MapToOutput <xorg display name, ex HDMI-0> - Map the tablet to a single monitor when
#   using a multi-monitor setup
# xsetwacom set <stylus ID> MapToOutput 1920x1080+1920+0 - similar to above. If xsetwacom can't find the display
#   (like when using NVidia binary drivers) you can define a screen region instead to constrain the
#   pad to. The screen region the monitors are already mapped to can be discovered using xrandr
initializeWacomTabletConfig()
{
    #TODO: If top mouse button isn't mapped to anything by default, perhaps use it to control
    # drawing mask

    #Stylus config options
    xsetwacom set 16 MapToOutput 1920x1080+1920+0
    xsetwacom set 16 TabletPCButton on

    #Tablet button config options
    xsetwacom set 17

    #Set the button inside the scroll wheel to tab
    xsetwacom set 17 Button 13 "key tab"

    #Set the top button of the lower 4 button group to "z"
    xsetwacom set 17 Button 9 "key z"
}

