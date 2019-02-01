#!/usr/bin/env sh

# location of https://github.com/opencv/opencv
OPENCV=../opencv

find . -not -path '*/\.*' -type f -not -path '*javadoc*' -not -path '*licenses*' | grep -v '.sh' | while read -r file ; do
    echo $file
    find $OPENCV -name `basename $file` |xargs -n1 echo "    "
done
