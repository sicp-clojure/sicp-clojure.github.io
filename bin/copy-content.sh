#!/bin/bash

echo $0
echo `dirname $0`

PROJECT_HOME=`dirname $0`/../..
TARGET_HOME=$PROJECT_HOME/sicp-clojure.github.io

BUILD_DATE=`date "+%Y%m%d"`
BUILD_TIME=`date "+%H:%M:%S"`

echo Clearing out target
rm $TARGET_HOME/*.xhtml $TARGET_HOME/*epub

rm -rf $TARGET_HOME/css $TARGET_HOME/fig $TARGET_HOME/js


echo Copying html content
cp -R $PROJECT_HOME/book-content/html/* $TARGET_HOME


echo Copying EPUB
cp $PROJECT_HOME/sicp.epub $TARGET_HOME/sicp-${BUILD_DATE}.epub


echo Creating index.html
cat $TARGET_HOME/bin/index.html.template | sed "s/DATE/$BUILD_DATE/g" | sed "s/TIME/$BUILD_TIME/g" > $TARGET_HOME/index.html
