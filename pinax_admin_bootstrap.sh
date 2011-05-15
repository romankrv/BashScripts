#!/bin/bash

#This script can be used to install and run the preset configurations of different
#the types of pinax starter projects

#Create enviroment:
f="VIRTUALENVS"
[ -d $HOME/$f ] && export WORKON_HOME=$HOME/$f || mkdir $HOME/$f && export WORKON_HOME=$HOME/$f && source /usr/local/bin/virtualenvwrapper.sh


#The first parameter is the name of the starter project.
#it can be:

#social
#    This project demonstrates a social networking site. It provides profiles,
#    friends, photos, blogs, tribes, wikis, tweets, bookmarks, swaps,
#    locations and user-to-user messaging.
    
#     In 0.5 this was called 'complete_project'.

# cms_company
#     A very simple CMS that lets you set up templates and then edit content,
#     including images, right in the frontend of the site.
    
#     The sample media, templates and content including in the project demonstrate
#     a basic company website.

# intranet
#     This project demonstrates a closed site requiring an invitation to join and
#     not exposing any information publicly. It provides a top-level task tracking
#     system, wiki and bookmarks. It is intended to be the starting point of sites
#     like intranets.

# zero
#     This project lays the foundation for all other Pinax starter projects. It
#     provides the project directory layout and some key infrastructure apps on
#     which the other starter projects are based.

# code
#     This project demonstrates group functionality and the tasks, wiki and topics
#     apps. It is intended to be the starting point for things like code project
#     management where each code project gets its own wiki, task tracking system
#     and threaded discussions.

# sample_group
#     This project demonstrates group functionality with a barebones group
#     containing no extra content apps as well as two additional group types,
#     tribes and projects, which show different membership approaches and
#     content apps.

# account
#     This project lays the foundation for all other Pinax starter projects. It
#     provides the project directory layout and some key infrastructure apps on
#     which the other starter projects are based.

# private_beta
#     This project demonstrates the use of a waiting list and signup codes for
#     sites in private beta. Otherwise it is the same as basic_project.

# cms_holidayhouse
#     A very simple CMS that lets you set up templates and then edit content,
#     including images, right in the frontend of the site.
    
#     The sample media, templates and content including in the project demonstrate
#     a basic site for holiday house rentals.

# static
#     This project just serves static media and templates with no models or views.
#     It is a great starting point for doing HTML mockups while taking advantage of
#     the Django templating language.

# basic
#     This project comes with the bare minimum set of applications and templates
#     to get you started. It includes no extra tabs, only the profile and notices
#     tabs are included by default. From here you can add any extra functionality
#     and applications that you would like.

# company
#     A starter project for company or project sites intended to provide static
#     information and a blog.

# --->
# The second parameter is the name of the directory and name of the project 
# where the project is creating

# --->
# The third parameter is the name of the virtual environment, where it
# will run the project


# for example:
# ./pinax_admin_bootstarp basic ~/my_basic pinax_basic_env


echo -en "Please type name of the starter project: \nIt can be: social \ncms_company \nintranet \nzero \ncode \nsample_group \naccount \nprivate_beta \ncms_holidayhouse \nstatic \nbasic \ncompany\nPlease type here: "
read starter

echo -en "Please type name of environ:"
read env

echo -en "Please type name of folder for project (path):"
read path

url="git+https://github.com/pinax/pinax.git@fb092bacc94806037b82#egg=pinax-dev"
mkvirtualenv $env

pip install -e $url
pinax-admin setup_project -b $starter $path

cd $path
workon $path
./manage.py syncdb && ./manage.py runserver
