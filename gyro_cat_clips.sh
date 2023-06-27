#!/bin/bash


read -p "Gyroflow preset: " gyro_preset

:> filelist.txt
for file in "${@}"; do
    if [[ -f "$file" && -r "$file" ]]; then

        # gyroflow "$file" --preset gyro_preset
        "/Applications/Gyroflow.app/Contents/MacOS/gyroflow" "$file" --preset "$gyro_preset" -j 8
       
        base_name=$(basename "$file" .MP4)
        new_file="${base_name}_stabilized.mp4"

        # Wait for gyroflow to create the output file
        while [[ ! -f "$new_file" ]]; do sleep 1; done

        echo "file '$new_file'" >> filelist.txt
        echo "$new_file"
    else
        echo "Cannot read file $file"
        break
    fi
done

ffmpeg -f concat -safe 0 -i filelist.txt -c copy "output.mp4"
