#This script moves some files from a directory "Source" into a directory "Build" to facilitate a new source code build

#!/bin/bash
echo "Beginning new build..."
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version
echo "Do you want to continue? (enter "1" for yes, "0" for no)"
read versioncontinue
if [ $versioncontinue -eq 1 ]
then
  echo "OK"
  for filename in source/*
  do
    echo $filename
    if [ "$filename" == "source/secretinfo.md" ]
    then
      echo $filename "is not being copied"
    else
      echo $filename "is being copied, chill"
      cp $filename build/
    fi
  done
else
  echo "Please come back when you are ready"
fi

cd build/
echo "This is version" $version "and these are the files in your build directory"
ls
cd ..
