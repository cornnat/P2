#!/bin/bash

# This script defines an alias called file_remove
# The function file_remove takes one argument: the directory where the .bin files are

function file_remove() {
    # Check if the directory argument is provided
    if [ -z "$1" ]; then
        echo "Usage: file_remove <directory>"
        return 1
    fi

    # Check if the provided directory exists
    if [ ! -d "$1" ]; then
        echo "Directory $1 not found."
        return 1
    fi

    # Remove all .bin files within the provided directory
    rm "$1"/*.bin
    echo "All .bin files have been removed from $1."
}

# Export the function so it's available in the terminal
export -f file_remove
