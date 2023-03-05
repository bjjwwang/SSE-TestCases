#!/bin/bash
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

if [ $machine == "Mac" ]; then
  test_dirs="
      paper_case
      paper_fp
  "
  bc_path="mac_bc"
elif  [ $machine == "Linux" ]; then
  test_dirs="
      pass
      overflow_pass
      overflow_unpass
      unpass
      ikos_cases
  "
  bc_path="linux_bc"
fi

root=$(cd "$(dirname "$0")"; pwd)


########
# Loops through each folder in test_dirs.
########
for td in $test_dirs
do
    #######
    # Full path to the test dir.
    ########
    full_td="$root/src/$td"
    if [ ! -d $root/src/$td ]
    then
      echo "$root/$td not exist, continue."
      continue
    fi
    ########
    # Loops through each file within the folder.
    ########
    if [ ! -d $bc_path/$td ]
    then
        mkdir -p $bc_path/$td
    fi
    for c_f in "$full_td/"*.c
    do
        n_f="${c_f##*/}"
        $LLVM_DIR/bin/clang -S -c -Xclang -DINCLUDEMAIN -disable-O0-optnone -fno-discard-value-names -g -emit-llvm $c_f -o $bc_path/$td/${n_f%.*}.ll
        $LLVM_DIR/bin/opt -S -mem2reg $bc_path/$td/${n_f%.*}.ll -o $bc_path/$td/${n_f%.*}.ll
    done 
done

#-loop-unroll -unroll-count=3
