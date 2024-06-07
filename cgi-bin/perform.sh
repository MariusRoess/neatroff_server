#!/bin/bash
echo "Content-type: text/plain"
echo ""

cd /var/www/html/neatroff/demo
make | tr '\n' ' '
cd ..
zip -r demo.zip demo
#cp zip


echo "Success"