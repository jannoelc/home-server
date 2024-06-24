#  _____ _ _      _           _
# |  ___(_) | ___| |__   ___ | |_
# | |_  | | |/ _ \ '_ \ / _ \| __|
# |  _| | | |  __/ |_) | (_) | |_
# |_|   |_|_|\___|_.__/ \___/ \__|
#
# Flag to easily disable installation on startup
INSTALL_FILEBOT=true
INSTALL_LEGACY_FILEBOT=false
# Define software versions (only used for legacy installation)
ARCH=amd64 # (amd64, 1386, armhf)
FILEBOT_VERSION=4.7.9

if [[ ${INSTALL_FILEBOT} == 'true' ]]; then
    if ! command -v filebot &>/dev/null; then
        # 1. Import signing keys
        apt-get update
        apt-get install -y --install-recommends dirmngr gnupg apt-transport-https
        apt-key adv --fetch-keys "https://raw.githubusercontent.com/filebot/plugins/master/gpg/maintainer.pub"

        # 2. Add deb repository to sources.list
        echo "deb [arch=all] https://get.filebot.net/deb/ universal main" | tee /etc/apt/sources.list.d/filebot.list

        # 3. Update package index
        apt-get update

        # 4. Install dependencies explicitly (otherwise apt-get autoremove may purge them)
        apt-get install -y --install-recommends \
            default-jre \
            openjfx \
            mediainfo \
            libchromaprint-tools \
            p7zip-full \
            unrar

        if [[ ${INSTALL_LEGACY_FILEBOT} == 'true' ]]; then
            # 5. Install FileBot legacy version
            mkdir -p /config/filebot/
            pushd /config/filebot/
            if [[ ! -e /config/filebot/filebot_${FILEBOT_VERSION}_${ARCH}.deb ]]; then
                curl -kSL \
                    -o /config/filebot/filebot_${FILEBOT_VERSION}_${ARCH}.deb \
                    "https://cfhcable.dl.sourceforge.net/project/filebot/filebot/FileBot_${FILEBOT_VERSION}/filebot_${FILEBOT_VERSION}_${ARCH}.deb"
                chmod a+rw /config/filebot/filebot_${FILEBOT_VERSION}_${ARCH}.deb
            fi
            # apt-get install -y openjdk-8-jdk-headless   libjna-java
            apt-get install -y /config/filebot/filebot_${FILEBOT_VERSION}_${ARCH}.deb

            popd
        else
            # 5. Install FileBot from repo
            apt-get install -y --install-recommends filebot
        fi

    fi
fi
