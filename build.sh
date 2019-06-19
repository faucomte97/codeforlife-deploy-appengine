#!/bin/bash -ex

export ENVIRONMENT="$1"

gem install sass --version 3.3.4
rbenv rehash
pip install git+https://github.com/PyGithub/PyGithub.git@ba50af5
pip install "urllib3==1.22" --force-reinstall

pip install -t lib git+https://github.com/ocadotechnology/codeforlife-portal.git@test_permissions_on_dev
pip install -t lib --upgrade git+https://github.com/ocadotechnology/aimmo.git@trying_to_fix_permissions#egg=aimmo

python get_latest_aimmo_unity_release.py

rm -rf lib/pytz lib/pytz*.dist-info

./manage.py collectstatic --noinput