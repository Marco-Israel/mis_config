#/!bin/bash


#Generate tag.db for global ptxdist .make rules
echo `ptxdist print PTXDIST_TOPDIR`/Makefile > tags.db 
find `ptxdist print PTXDIST_TOPDIR` -name *.make >> tags.db


#Generate tag.db for all ptxdist project .make rulefiles
platform_root_path=`pwd`/../
find $platform_root_path -name *.make >> tags.db
echo "`readlink -f $platform_root_path/selected_collectionconfig`" >> tags.db
echo "`readlink -f $platform_root_path/selected_platformconfig`" >> tags.db
echo "`readlink -f $platform_root_path/selected_ptxconfig`" >> tags.db


#generate Makefile tags
ctags  \
 --tag-relative=yes \
 --recurse=no \
 -L ./tags.db \
 -h .make.mk.in \
 --fields=+afikmnsSzt \
 --extra=+f \
 --language-force=Make \
 --languages=Make \
 --Make-kinds=+m 
