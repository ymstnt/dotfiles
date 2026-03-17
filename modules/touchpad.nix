{ ... }:

{
  # MagicMouse driver conflicts with the touchpad driver
  # If it loads first, the libinput settings will not be applied:
  # Physical clicks won't work and sensitivity will be reset
  # Disabling this driver fixes the touchpad issues for the Jomaa USB touchpad
  boot.blacklistedKernelModules = [ "hid_magicmouse" ];
}
