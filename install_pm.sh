#!/usr/bin/env bash
function stop() {
    echo "$@"
    exit 1
}

function RUN() {
    echo "RUNNING: $@"
    "$@" || stop "Failed"
}

function copyConfig() {
    cat << EOF > config.properties
__PROJECTS_DIR__ = $HOME/Projects
__PATH__ = $HOME/Path
EOF
}

RUN git clone "https://github.com/RaffaeleCanale/wx-pm.git"
RUN cd "wx-pm"
RUN copyConfig
RUN ./install.sh
RUN ./dist/wx setup
