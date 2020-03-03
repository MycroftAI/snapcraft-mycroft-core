{
    mycroft: {
        command: "bin/mycroft-launch",
        desktop: "usr/share/applications/mycroft.desktop",
        extensions: ["gnome-3-28"],
        plugs: [
            "audio-playback",
            "audio-record",
            "desktop",
            "desktop-legacy",
            "mount-observe",
            "network",
            "network-bind",
            "pulseaudio",
            "unity7",
            "wayland",
            "x11",
        ],
    },

  # mycroftd:
  #   command: mycroft-launch
  #   daemon: forking
  #   plugs:
  #   - alsa
  #   - mount-observe
  #   - network
  #   - network-bind
  #   - pulseaudio
}