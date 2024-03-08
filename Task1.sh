#!/bin/bash




################################ Task1 ######################################


# Project Idea: File Organizer
# The goal of this project is to create a Bash script that organizes files in a specified directory based on 
# their file types into separate subdirectories. This can be useful to keep your directories clean and tidy 
# by automatically sorting files into appropriate categories.
# 
# Features:
# The script should take a directory path as an argument and organize the files within that directory.
# It should create subdirectories based on the file extensions (e.g., "txt" for text files, "jpg" for image files).
# Files with unknown or no file extensions should be placed in a "misc" subdirectory.
# If a subdirectory for a particular file type already exists, the script should move the files into that existing directory.
# The script should handle edge cases, such as files with no extensions or hidden files (those starting with a dot).
#


##############################################################################



function File_Organizer () {

    # Declare Variables 
   declare directory
   declare extension 
   declare -i return_value
   ############################################

    directory="$1" 

    # Check if the target is a directory or not 
    if [ ! -d "$directory" ]; then
        echo "Please try again , this isn't a directory "
        exit 1
    else 
        echo "Access to the directory succeeded "
    fi
    ############################################




    # Loop inside the directory to detect extensions 
    for file in "$directory"/*; do

        # detect file extension 
        extension="${file##*.}"
        #######################

        # create directory for each extension then move this file 
        if [ "$extension" == "txt" ] ; then 
            mkdir "./directory/txt"
            mv "$file" "./directory/txt"
        else 

            if [ "$extension" == "jpg" ] ; then 
                mkdir "./directory/JPG"
                mv  "$file" "./directory/JPG"
            else 

                if [ "$extension" == "pdf" ] ; then 
                    mkdir "./directory/PDF"
                    mv "$file" "./directory/PDF"
                else 
                    mkdir "./directory/Unknown"
                    mv "$file" "./directory/Unknown"
                fi
            fi
        fi

    done

 

     ############################################
   
    return 0 
}


function main () {
   
   # declare return value 
   declare -i return_value

   
   File_Organizer "$1"

   return_value=$? 

   # check if the operation is succedded or not 
    if [[ "$return_value" == 0 ]] ; then 

        echo "Operation is done "
    else 
        echo "problem found"
    fi 

}



main "$1"


