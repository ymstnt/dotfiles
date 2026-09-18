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
    extraConfig.pipewire = {
      "99-lewitt-mic.conf" = {
        "context.modules" = [
          {
            name = "libpipewire-module-loopback";
            args = {
              "node.description" = "Microphone - CONNECT 2 (Clean)";
              "capture.props" = {
                "node.target" = "alsa_input.lewitt_connect_2";
                "audio.position" = [ "FL" "FR" ];
                "stream.dont-remix" = true;
                "node.passive" = true;
              };
              "playback.props" = {
                "media.class" = "Audio/Source";
                "audio.position" = [ "FL" "FR" ];
              };
            };
          }
        ];
      };
    };
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
      "99-lewitt-rename" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              { "node.name" = "~alsa_input.usb-Lewitt_GmbH_CONNECT_2_.*"; }
            ];
            actions = {
              update-props = {
                "node.name" = "alsa_input.lewitt_connect_2";
              };
            };
          }
        ];
      };
    };
  };
  hm.home.packages = with pkgs; [
    pwvucontrol
  ];
}
