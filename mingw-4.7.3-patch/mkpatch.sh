build_patch(){

orig_file=$1
this_dir=$(pwd)
download_file=$orig_file".tar.xz"
orig_abs_file=$this_dir/$download_file
patch_abs_file=$this_dir/$orig_file".patch.tar.bz2"

wget https://www.freedesktop.org/software/gstreamer-sdk/data/packages/2012.5/windows/toolchain/$download_file
tmp=$(mktemp -d)
( cd $tmp ;
tar xvf $orig_abs_file ;
tar xvf $patch_abs_file ;
sh ./patch.sh ;
rm -rf patch patch.sh;
tar vcfJ $this_dir/$orig_file"-patch1.tar.xz" . ;
echo $tmp 
)
rm -rf $tmp

}

build_patch mingw-w32-gcc-4.7.3-linux-x86
build_patch mingw-w32-gcc-4.7.3-windows-x86
