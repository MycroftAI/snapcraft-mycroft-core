local snapcraft = import 'snapcraft.libsonnet';
local alsa = import 'https://raw.githubusercontent.com/diddlesnaps/snapcraft-alsa/master/alsa.libsonnet';
local environment = import 'environment.libsonnet';
local apps = import 'apps.libsonnet';
local plugs = import 'plugs.libsonnet';
local parts = import 'parts.libsonnet';

snapcraft {
    name: "mycroft",
    summary: "Your AI personal assistant!",
    description: |||
        Mycroft is a free and open-source intelligent personal assistant and knowledge
        navigator for Linux-based operating systems that uses a natural language user
        interface. It is the world's first fully open-source AI voice assistant.

        Mycroft is named after a fictional computer from 1966 science fiction novel
        "The Moon Is a Harsh Mistress".

        Installing skills by voice seems to be broken for now, but you can use
        the `mycroft.msm` command to list, install, and remove skills.
    |||,
    "adopt-info": "mycroft",
    grade: "devel",
    confinement: "devmode",
    base: "core18",
    layout: {
        "/etc/mycroft/mycroft.conf": {
            "bind-file": "$SNAP/etc/mycroft/mycroft.conf",
        },
        "/usr/include": {
            bind: "$SNAP/usr/include",
        },
        "/var/tmp": {
            bind: "$SNAP_COMMON/vartmp",
        },
    },
    plugs: plugs,
    apps: apps,
    parts: parts,
} + alsa()
