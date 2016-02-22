#!bin/bash

# Compress image in a folder with imagemagick
# transform png into jpg

#argument 1 is folder path
if [ $1 ]
  then
    FILES="${1}/*";
  else
    FILES="*";
fi

for f in $FILES
  do
    echo "compressing ${f}";
    if [[ $f == *".jpg" ]] ; then
      convert -strip -interlace Plane -gaussian-blur 0.05 -quality 50% -resize 160^ $f $f
    else
      convert -strip -interlace Plane -gaussian-blur 0.05 -quality 50% -resize 160^ $f "${f//.png}.jpg"
    fi
done

echo "Removing old files";

for cf in $FILES
  do
    if [[ $cf == *".png" ]] ; then
      rm -rf $cf;
    fi
done
