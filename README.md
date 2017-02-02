# OpenBlog

A Ruby on Rails website developer coding practical written by Michael Orr

## Development Setup

I create local environments with VirtualBox and Vagrant so that my development environment closely matches the production environment. It uses a base Ubuntu 14.04 LTS image with Postgres and Ruby already configured. I had to upgrade the Ruby on it and I used rbenv which was also already installed. Steps to install the correct Ruby after Vagrant provisions are included below in the Manual Configuration section.

### Install VirtualBox and Vagrant

First install VirtualBox
https://www.virtualbox.org/wiki/Downloads

Then install Vagrant
https://www.vagrantup.com/

### Clone the Repository

Do these steps in terminal:

```
mkdir /srv
cd /srv
git clone git@github.com:imightbeinatree/openblog.git
```


### Create Your Development Box

Do these steps in terminal:

```
cd /srv/openblog
vagrant up
```

This will ask for your password so that files can be shared from your local computer into the virtual box.  This allows you to work on the code locally on your computer in the editor of your choice.

### Log in to your VirtualBox

Do these steps in terminal:

```
cd /srv/openblog
vagrant ssh
```

### Manual Configuration

You are now logged into the virtual machine in this terminal tab. Now we need to continue configuring the website.

```
cd /srv/openblog
rbenv install 2.3.3
gem install bundler
gem install rainbow -v '2.2.1'
bundle install
rake db:create
rake db:migrate
```

### Start your rails server

Do these steps from the terminal tab where you logged into your virtualbox:

```
cd /srv/bk/openblog
rails s - b 0.0.0.0
```

### Visit the site in your browser

Rails starts on port 3000 by default, the IP address of your virtualbox is defined in the Vagrantfile at the root of the repository, which is then forwarded to your local machine.  You should therefore be able to access the site from http://localhost:3000 or http://33.33.33.55:3000


## Notes

- I did have to install the rainbow gem manually when doing the bundle install after adding the clint_eastwood code linting gem because it was giving me problems. I'd added it to the few steps for manually configuring the server after vagrant provisions.