; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/dirty/WhileCopyOverflow_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/dirty/WhileCopyOverflow_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @cwe120_c_85(i8* noundef %dest, i8* noundef %src, i64 noundef %count) #0 !dbg !12 {
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
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  %count = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i8** %src, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %count, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** %dest, align 8, !dbg !62
  %1 = load i8*, i8** %src, align 8, !dbg !63
  %2 = load i64, i64* %count, align 8, !dbg !64
  %call = call i8* @cwe120_c_85(i8* noundef %0, i8* noundef %1, i64 noundef %2), !dbg !65
  ret i32 0, !dbg !66
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/dirty/WhileCopyOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "cwe120_c_85", scope: !13, file: !13, line: 13, type: !14, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!13 = !DIFile(filename: "dirty/WhileCopyOverflow_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!14 = !DISubroutineType(types: !15)
!15 = !{!16, !16, !17, !19}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !20, line: 31, baseType: !21)
!20 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !22, line: 94, baseType: !23)
!22 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!23 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!24 = !{}
!25 = !DILocalVariable(name: "dest", arg: 1, scope: !12, file: !13, line: 13, type: !16)
!26 = !DILocation(line: 13, column: 26, scope: !12)
!27 = !DILocalVariable(name: "src", arg: 2, scope: !12, file: !13, line: 13, type: !17)
!28 = !DILocation(line: 13, column: 44, scope: !12)
!29 = !DILocalVariable(name: "count", arg: 3, scope: !12, file: !13, line: 13, type: !19)
!30 = !DILocation(line: 13, column: 56, scope: !12)
!31 = !DILocalVariable(name: "tmp", scope: !12, file: !13, line: 16, type: !3)
!32 = !DILocation(line: 16, column: 8, scope: !12)
!33 = !DILocation(line: 16, column: 22, scope: !12)
!34 = !DILocalVariable(name: "s", scope: !12, file: !13, line: 16, type: !3)
!35 = !DILocation(line: 16, column: 29, scope: !12)
!36 = !DILocation(line: 16, column: 41, scope: !12)
!37 = !DILocation(line: 17, column: 2, scope: !12)
!38 = !DILocation(line: 17, column: 14, scope: !12)
!39 = !DILocation(line: 19, column: 14, scope: !12)
!40 = !DILocation(line: 19, column: 12, scope: !12)
!41 = !DILocation(line: 19, column: 7, scope: !12)
!42 = !DILocation(line: 19, column: 10, scope: !12)
!43 = distinct !{!43, !37, !39, !44}
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocation(line: 20, column: 9, scope: !12)
!46 = !DILocation(line: 20, column: 2, scope: !12)
!47 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 22, type: !48, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !51}
!50 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !13, line: 22, type: !50)
!53 = !DILocation(line: 22, column: 14, scope: !47)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !13, line: 22, type: !51)
!55 = !DILocation(line: 22, column: 25, scope: !47)
!56 = !DILocalVariable(name: "dest", scope: !47, file: !13, line: 24, type: !16)
!57 = !DILocation(line: 24, column: 9, scope: !47)
!58 = !DILocalVariable(name: "src", scope: !47, file: !13, line: 25, type: !17)
!59 = !DILocation(line: 25, column: 14, scope: !47)
!60 = !DILocalVariable(name: "count", scope: !47, file: !13, line: 26, type: !19)
!61 = !DILocation(line: 26, column: 9, scope: !47)
!62 = !DILocation(line: 27, column: 14, scope: !47)
!63 = !DILocation(line: 27, column: 20, scope: !47)
!64 = !DILocation(line: 27, column: 25, scope: !47)
!65 = !DILocation(line: 27, column: 2, scope: !47)
!66 = !DILocation(line: 28, column: 2, scope: !47)
