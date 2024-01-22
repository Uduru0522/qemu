#!/bin/bash

git remote add upstream https://github.com/qemu/qemu.git
git fetch uptream --depth=1
git checkout master
git rebase upstream/master
