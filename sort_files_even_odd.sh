#!/bin/bash

# Function to sort files into 'odd' and 'even' directories based on index
function sort_files_even_odd() {
    # Check if the directory argument is provided
    if [ -z "$1" ]; then
        echo "Usage: sort_files_even_odd <directory>"
        return 1
    fi

    # Assign the directory path to a variable
    dir="$1"

    # Check if the provided directory exists
    if [ ! -d "$dir" ]; then
        echo "Directory $dir not found."
        return 1
    fi

    # Create 'odd' and 'even' directories within the specified directory if they don't exist
    mkdir -p "$dir/odd" "$dir/even"

    # Loop through the .bin files in the provided directory
    for file in "$dir"/electron_scattering_2023-10-04_sample_index_*.bin; do
        # Extract the number from the filename
        number=$(echo "$file" | sed -n 's/.*sample_index_\([0-9]*\)\.bin/\1/p')

        # Check if the number was extracted
        if [ -z "$number" ]; then
            echo "Skipping invalid file: $file"
            continue
        fi

        # Determine whether the number is even or odd
        if [ $((number % 2)) -eq 0 ]; then
            # Move even-numbered file to the 'even' directory
            mv "$file" "$dir/even/"
            echo "Moved $file to $dir/even/"
        else
            # Move odd-numbered file to the 'odd' directory
            mv "$file" "$dir/odd/"
            echo "Moved $file to $dir/odd/"
        fi
    done
}

# Export the function so it's available in the terminal session
export -f sort_files_even_odd
