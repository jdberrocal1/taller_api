# taller

## Setting up the app

### Global Docker Dev Setup

#### Mac

1. Install [Docker](https://docs.docker.com/install) and [Docker Compose](https://docs.docker.com/compose/install)
2. Install [Dinghy](https://github.com/codekitchen/dinghy). `brew tap codekitchen/dinghy; brew install dinghy`
3. Install [Virtual Box](https://download.virtualbox.org/virtualbox/5.2.6/VirtualBox-5.2.6-120293-OSX.dmg)
4. Create dinghy with new virtualbox provider: `dinghy create --provider virtualbox --memory=6000 --cpus=2`
5. Set Dinghy env variables: `eval $(dinghy env)` (for OS X users, add this command to your .bash_profile so the env variables will get set with each new shell)

Note: you can run this wihtout Dinghy by following this steps:
1. Shut off dinghy
2. Remove the eval stuff from your .envrc or bash profile or wherever you have it
3. Remove the .docker stuff from your /etc/hosts
4. Change the IP in /etc/resolver/docker to 127.0.0.1
5. Give Docker For Mac 6gb of RAM and half of your CPUs
6. Close ALL of your terminal tabs.
7. Open a fresh terminal tab, build then migrate your DB

## Configure Repo
1. Fork this repo (BeenVerifiedInc/taller) to your own github
2. Clone your forked repo `git clone git@github.com:[your-github-username]/taller.git`
3. CD into directory: `cd taller`
4. Acquire a mysql development DB and drop the SQL file into the /mysql folder
5. Acquire spec/fixtures and spec/http_fixtures
6. Get a copy of the `dev.env` and `test.env` files. Drop them in the root of the repo.

## App-Specific Docker Dev Setup

Add domains and dinghy IP to your `/etc/hosts`:

    echo "$(dinghy ip) taller.docker" | sudo tee -a /etc/hosts

## Build Docker Image
1. Build Docker: `docker-compose build`
2. You may need to build the image we use for testing: `docker-compose -f docker-compose-test.yaml build`

## Prepare DB
1. Acquire a mysql development DB and drop the SQL file into the /mysql folder
2. Migrate your DB: `docker-compose run taller rake db:migrate`

## Running the App
1. Start the app in the background (the streaming logs seem to slow it down)
  - Mac: `sh run.sh`
2. The app should be accessible at http://taller.docker once everything is up and running

If you are running this without dinghy (same as CORE) you need to make sure to run the `dinghy-proxy` script that is on the CORE project

## Running the App with Core
If you experience the following issue while running this app and core locally at the same time:

    Blocked host: taller

    To allow requests to taller, add the following to your environment configuration:

    config.hosts << "taller"

You need to comment out the following line in the `development.rb` file:

`config.hosts << 'taller.docker'`

## Running the Specs
1. Ensure the test DB has been prepared: `docker-compose -f docker-compose-test.yaml run taller_rspec rake db:test:prepare`
3. To run specs only: `docker-compose -f docker-compose-test.yaml run taller_rspec`.
4. To run a specific spec: `docker-compose -f docker-compose-test.yaml run taller_rspec rspec spec/whatever.rb:400`

## Creating migrations
1. Build and Run your migration like this: `docker-compose run taller rails g model PersonNote body:string user_code:string permalink:string`

## Container
1. Run `docker exec -it taller_taller_1 /bin/bash`

## Upgrade packages
1. Update the gemfile
2. Run `docker-compose run --rm taller bundle update`
3. Build the image `docker-compose build`
4. Run the tests to check everything keeps working
