{ pkgs, ... }:
{
  # Enable sound with pipewire.
  hardware.enableAllFirmware = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.extraConfig = {
      "disable-monitor-sounds" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              {
                device.profile.name = "hdmi-stereo";
              }
            ];
            actions = {
              update-props = {
                device.disabled = true;
              };
            };
          }
        ];
      };
    };
  };
  hm.home.packages = with pkgs; [
    pavucontrol
  ];
}
