for c_f in "./"*.c
do
    n_f="${c_f##*/}"
    $LLVM_DIR/bin/clang -S -c -Xclang -DINCLUDEMAIN -disable-O0-optnone -fno-discard-value-names -g -emit-llvm $c_f -o ${n_f%.*}.ll
     #TODO: translate each instructions, please don't use opt passer.
    $LLVM_DIR/bin/opt -S -mem2reg ${n_f%.*}.ll -o ${n_f%.*}.ll
    #LLVM_DIR/bin/opt -analyze -scalar-evolution -loop-rotate $bc_path/$td/${n_f%.*}.ll > $bc_path/$td/${n_f%.*}.ana
done
