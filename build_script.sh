#!/bin/bash
# Future Updates: I would like to test the user giving an input for the changelog and secret files, if any

echo "Hello there!"

# Uses changelog.md to display the source code version
firstline=$(head -n1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are using version ${version} of this program" 

echo "Would you like to continue? 1 for Yes, 0 for No"
read versioncontinue

if [ $versioncontinue -eq 1 ]; then
  echo "Continuing..."
  for file in source/*
  do
    # Prevents secret file (secretinfo.md) from being copied
    if [ "$file" == "source/secretinfo.md" ]; then
      echo "${file} will not be copied"
    else
      echo "Copying ${file}"
      cp $file build/.
    fi
  done
elif [ $versioncontinue -eq 0 ]; then
  echo "Exiting..."
else
  echo "Wrong Entry"
fi

echo "Program Terminated"
echo "Version: ${version}  Files: "
ls build
