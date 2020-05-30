#!/bin/bash

cd ~
mkdir -p ~/.tags.d
cd ~/.tags.d

echo "generate glibc tags..."
repoquery --installed -l glibc-headers | grep '.h$' > glibc.files
ctags --c-kinds=+pxl --language-force=c -f glibc.tags -L  glibc.files

echo "generate stdc++ tags..."
ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --language-force=c++ -f stdc++.tags /usr/include/c++/4.8.5/

echo "generate kernel tags..."
repoquery --installed -l kernel-headers-0:3.10.0-327.10.1.el7.x86_64 | grep '.h$' > kernel.files
ctags --c-kinds=+pxl --language-force=c -f kernel.tags -L  kernel.files

echo "clean temp file..."
rm -f glibc.files kernel.files
