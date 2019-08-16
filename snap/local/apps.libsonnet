{
    mycroft: {
        command: "bin/desktop-launch $SNAP/bin/mycroft-launch",
        desktop: "usr/share/applications/mycroft.desktop",
        plugs: [
            "gnome-3-28-1804",
            "gtk-3-themes",
            "icon-themes",
            "sound-themes",
            "desktop",
            "desktop-legacy",
            "mount-observe",
            "network",
            "network-bind",
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