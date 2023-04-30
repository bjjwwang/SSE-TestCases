; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/dirty/WhileCopyOverflow_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/dirty/WhileCopyOverflow_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.main.dest = private unnamed_addr constant [3 x i8] c"ab\00", align 1
@__const.main.src = private unnamed_addr constant [2 x i8] c"c\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @cwe120_c_85(i8* noundef %dest, i8* noundef %src, i64 noundef %count) #0 !dbg !13 {
entry:
  %dest.addr = alloca i8*, align 8
  %src.addr = alloca i8*, align 8
  %count.addr = alloca i64, align 8
  %tmp = alloca i8*, align 8
  %s = alloca i8*, align 8
  store i8* %dest, i8** %dest.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %dest.addr, metadata !25, metadata !DIExpression()), !dbg !26
  store i8* %src, i8** %src.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %src.addr, metadata !27, metadata !DIExpression()), !dbg !28
  store i64 %count, i64* %count.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %count.addr, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i8** %tmp, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = load i8*, i8** %dest.addr, align 8, !dbg !33
  store i8* %0, i8** %tmp, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %s, metadata !34, metadata !DIExpression()), !dbg !35
  %1 = load i8*, i8** %src.addr, align 8, !dbg !36
  store i8* %1, i8** %s, align 8, !dbg !35
  br label %while.cond, !dbg !37

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, i64* %count.addr, align 8, !dbg !38
  %dec = add i64 %2, -1, !dbg !38
  store i64 %dec, i64* %count.addr, align 8, !dbg !38
  %tobool = icmp ne i64 %2, 0, !dbg !37
  br i1 %tobool, label %while.body, label %while.end, !dbg !37

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %s, align 8, !dbg !39
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !39
  store i8* %incdec.ptr, i8** %s, align 8, !dbg !39
  %4 = load i8, i8* %3, align 1, !dbg !40
  %5 = load i8*, i8** %tmp, align 8, !dbg !41
  %incdec.ptr1 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !41
  store i8* %incdec.ptr1, i8** %tmp, align 8, !dbg !41
  store i8 %4, i8* %5, align 1, !dbg !42
  br label %while.cond, !dbg !37, !llvm.loop !43

while.end:                                        ; preds = %while.cond
  %6 = load i8*, i8** %dest.addr, align 8, !dbg !45
  ret i8* %6, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dest = alloca [3 x i8], align 1
  %src = alloca [2 x i8], align 1
  %count = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [3 x i8]* %dest, metadata !56, metadata !DIExpression()), !dbg !60
  %0 = bitcast [3 x i8]* %dest to i8*, !dbg !60
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([3 x i8], [3 x i8]* @__const.main.dest, i32 0, i32 0), i64 3, i1 false), !dbg !60
  call void @llvm.dbg.declare(metadata [2 x i8]* %src, metadata !61, metadata !DIExpression()), !dbg !65
  %1 = bitcast [2 x i8]* %src to i8*, !dbg !65
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([2 x i8], [2 x i8]* @__const.main.src, i32 0, i32 0), i64 2, i1 false), !dbg !65
  call void @llvm.dbg.declare(metadata i64* %count, metadata !66, metadata !DIExpression()), !dbg !67
  store i64 5, i64* %count, align 8, !dbg !67
  %arraydecay = getelementptr inbounds [3 x i8], [3 x i8]* %dest, i64 0, i64 0, !dbg !68
  %arraydecay1 = getelementptr inbounds [2 x i8], [2 x i8]* %src, i64 0, i64 0, !dbg !69
  %2 = load i64, i64* %count, align 8, !dbg !70
  %call = call i8* @cwe120_c_85(i8* noundef %arraydecay, i8* noundef %arraydecay1, i64 noundef %2), !dbg !71
  ret i32 0, !dbg !72
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/dirty/WhileCopyOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "cwe120_c_85", scope: !14, file: !14, line: 13, type: !15, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!14 = !DIFile(filename: "dirty/WhileCopyOverflow_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!15 = !DISubroutineType(types: !16)
!16 = !{!5, !5, !17, !19}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 31, baseType: !21)
!20 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !22, line: 94, baseType: !23)
!22 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!23 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!24 = !{}
!25 = !DILocalVariable(name: "dest", arg: 1, scope: !13, file: !14, line: 13, type: !5)
!26 = !DILocation(line: 13, column: 26, scope: !13)
!27 = !DILocalVariable(name: "src", arg: 2, scope: !13, file: !14, line: 13, type: !17)
!28 = !DILocation(line: 13, column: 44, scope: !13)
!29 = !DILocalVariable(name: "count", arg: 3, scope: !13, file: !14, line: 13, type: !19)
!30 = !DILocation(line: 13, column: 56, scope: !13)
!31 = !DILocalVariable(name: "tmp", scope: !13, file: !14, line: 16, type: !3)
!32 = !DILocation(line: 16, column: 8, scope: !13)
!33 = !DILocation(line: 16, column: 22, scope: !13)
!34 = !DILocalVariable(name: "s", scope: !13, file: !14, line: 16, type: !3)
!35 = !DILocation(line: 16, column: 29, scope: !13)
!36 = !DILocation(line: 16, column: 41, scope: !13)
!37 = !DILocation(line: 17, column: 2, scope: !13)
!38 = !DILocation(line: 17, column: 14, scope: !13)
!39 = !DILocation(line: 19, column: 14, scope: !13)
!40 = !DILocation(line: 19, column: 12, scope: !13)
!41 = !DILocation(line: 19, column: 7, scope: !13)
!42 = !DILocation(line: 19, column: 10, scope: !13)
!43 = distinct !{!43, !37, !39, !44}
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocation(line: 20, column: 9, scope: !13)
!46 = !DILocation(line: 20, column: 2, scope: !13)
!47 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 23, type: !48, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !14, line: 23, type: !50)
!53 = !DILocation(line: 23, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !14, line: 23, type: !51)
!55 = !DILocation(line: 23, column: 25, scope: !47)
!56 = !DILocalVariable(name: "dest", scope: !47, file: !14, line: 25, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 3)
!60 = !DILocation(line: 25, column: 7, scope: !47)
!61 = !DILocalVariable(name: "src", scope: !47, file: !14, line: 26, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 2)
!65 = !DILocation(line: 26, column: 7, scope: !47)
!66 = !DILocalVariable(name: "count", scope: !47, file: !14, line: 27, type: !19)
!67 = !DILocation(line: 27, column: 9, scope: !47)
!68 = !DILocation(line: 28, column: 21, scope: !47)
!69 = !DILocation(line: 28, column: 27, scope: !47)
!70 = !DILocation(line: 28, column: 32, scope: !47)
!71 = !DILocation(line: 28, column: 2, scope: !47)
!72 = !DILocation(line: 29, column: 2, scope: !47)
