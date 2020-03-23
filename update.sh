rm Packages
rm Packages.gz
rm Packages.bz2
dpkg-scanpackages ./debs /dev/null > Packages
#dpkg-scanpackages -m . | gzip -c > Packages.gz
gzip -c9 Packages > Packages.gz
bzip2 -c9 Packages > Packages.bz2
