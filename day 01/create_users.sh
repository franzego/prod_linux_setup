#!/bin/bash
# This script add users to a group.
# It first checks if the username and group and creates if absent.
Input_name="$1"
group="$2"

if [ -z "$Input_name" ] || [ -z "$group" ]; then
    echo "Useage: $0 <username> <groupname>"
    exit 1
fi

#creating the user
echo "Creating the User '$Input_name'... "
sudo useradd -m "$Input_name"

#check if the user was created properly
if [ $? -ne 0 ]; then
    echo "User '$Input_name' was not created successfully"
    exit 2
fi

#check if the group exists
if [ ! getent group "$group" > /dev/null ]; then
    echo "The group '$group' does not exist. Kindly create it"
    exit 4
fi

#adding to the group
sudo usermod -aG "$group" "$Input_name"
if [ $? -ne 0 ]; then
    echo "was not added to group. Kindly check again."
    exit 3
    else
    echo "Successfully created."
fi

