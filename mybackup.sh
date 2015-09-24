#!/bin/bash
#simple demo of copying a directory tree while preserving a directory tree

mkdir ~/mydata-backup
cd ~/mydata
tar cf - . | ( cd ~/mydata-backup ; tar xf - )