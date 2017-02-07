# instalação dev básica
sudo apt-get python-dev python-pip chromium postgresql postgresql-contrib libpq-dev
sudo pip install virtualenvwrapper psycopg2
printf "export $WORKON_HOME=$HOME/.virtualenvs\n" >> ~/.bashrc
mkdir -p $WORKON_HOME

# configuração do postgres -- achar um jeito de automatizar isso
# $sudo -i -u postgres
# $createuser <app_name> -P -s
# $createdb <app_name>
# echo "local <app_name> <app_name> 127.0.0.1/32 password" >> /etc/postgresql/<postgres_version>/main/pg_hba.conf
