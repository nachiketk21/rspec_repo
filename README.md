This suite uses ruby and modified rspec framework. I also have used seeds which will seed data into the test db and will be used to run tests locally, the reason behind this was the data will never be corrupted and always data will be seeded to the db to avoid any failures due to data.

Follow the steps below to setup and run tests for zinrelo


Install Ruby
Run this cmd : gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3. The gpg command contacts a public key server and requests a key associated with the given ID. In this case we are requesting the RVM project's key which is used to sign each RVM release. Having the RVM project's public key allows us to verify the legitimacy of the RVM release we will be downloading, which is signed with the matching private key.
  Install rvm : \curl -sSL https://get.rvm.io | bash
  Install ruby : rvm install ruby-2.3.1
  Than do : rvm list
  rvm use 2.3.1
  Install npm
  sudo apt-get install nodejs 
  sudo apt-get install npm
  sudo ln -s /usr/bin/nodejs /usr/bin/node
  npm -v

Install mongo-seed

A tool to quickly populate your mongo db from a set of .json files. The concept is very similar to Ruby on Rails idea of seeding a database. This allows a new developer to pull down the source code for a project (which contains .json files to populate their mongodb with) and run a command and bingo!! database populated and ready to rock.

  Run $ npm install -g node-mongo-seeds
  Run $ seed to seed your mongodb with all your data from your /seeds folder.
  Install selenium-webdriver
  sudo gem install selenium-webdriver
  Install chromedriver

Chromedriver is needed to run selenium tests with chrome.
  sudo apt-get install chromium-chromedriver
  sudo ln -s /usr/lib/chromium-browser/chromedriver /usr/bin/chromedriver



# rspec_repo
This is a rspec example with all the framework.

All folders with a page object model and ruby as language.

This framework can be used for web based automation with selenium and ruby

To run test in parallel 
parallel_rspec spec/

To run tests with a particular tag
parallel_rspec -- -t smoke -- spec/*_spec.rb 

To run a single test
rspec spec/*_spec.rb
