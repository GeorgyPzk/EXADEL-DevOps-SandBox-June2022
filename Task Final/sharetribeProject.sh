sudo apt update
sudo apt install apache2 -y

sudo apt-get install php-xml


sudo docker run --name nginx -d -p 8080:80 nginx:latest



#in container

apt update
apt-get update && apt-get upgrade
apt-get install vim nano -y
apt install git -y
apt install curl -y
apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev -y

#install rudi and rbenv
apt install ruby-full -y
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
sudo apt-get install rubygems


#set 2.7.5
rbenv install -l
rbenv install 2.7.5
rbenv global 2.7.5

#rubygems
apt-get install rubygems

gem install bundler

cd /home
git clone https://github.com/sharetribe/sharetribe.git