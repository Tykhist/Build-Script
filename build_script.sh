#!/bin/bash
echo "Hello there!"

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
