#! /bin/bash

type -t aptitude >/dev/null || sudo apt-get install -y aptitude
type -t git >/dev/null || sudo aptitude install -y git gitk git-gui
type -t cvs >/dev/null || sudo aptitude install -y cvs
type -t mercurial >/dev/null || sudo aptitude install -y mercurial
type -t subversion >/dev/null || sudo aptitude install -y subversion
type -t bzr >/dev/null || sudo aptitude install -y bzr



