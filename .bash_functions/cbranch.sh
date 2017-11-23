#!/usr/bin/env bash

function cbranch() {
  git branch | grep -v "\*" | grep -v master | xargs -n1 git branch -D
}

