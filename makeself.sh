#!/usr/bin/env bash
set -xeuo pipefail

chmod 777 ./install.sh
chown -R 1000:1000 ./*

makeself --xz --threads 15 --complevel 9 --current --nox11 --nocrc ./ ../dead_space_ru.sh "dead space ru"  ./install.sh