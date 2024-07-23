#!/bin/bash -e
# <Create a Python Package template.>
# Copyright (C) <2024>  <Scott Hara>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

PROGRAMNAME="create_python_template_package"

# Display usage
function usage {
    echo "usage: ${PROGRAMNAME} [-nh]"
    echo "  -n      Create a new python repository template"
    echo "  -h      display help"
    exit 1
}

# Creates a set of python template folders
function create_repo_folders {
    mkdir $REPO_NAME
    touch $REPO_NAME/setup.py
    touch $REPO_NAME/README.md
    touch $REPO_NAME/LICENSE
    mkdir $REPO_NAME/$REPO_NAME/
    touch $REPO_NAME/$REPO_NAME/__init__.py
    touch $REPO_NAME/$REPO_NAME/python_script_template.py
}

# setup variables
CREATE_FOLDER='false'
REPO_NAME=''

# Get the options
while getopts ":hn:" option; do
   case $option in
      h) # display usage
         usage
         exit;;
      n) # Enter a name
         REPO_NAME=$OPTARG;;
      c) # Create a folder
         CREATE_FOLDER='true';;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done


create_repo_folders