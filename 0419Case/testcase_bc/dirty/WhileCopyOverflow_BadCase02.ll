; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/dirty/WhileCopyOverflow_BadCase02.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/dirty/WhileCopyOverflow_BadCase02.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [6 x i8] c"test1\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i8* @cwe120_c_86(i8* noundef %dest, i8* noundef %src, i64 noundef %count) #0 !dbg !12 {
entry:
  %dest.addr = alloca i8*, align 8
  %src.addr = alloca i8*, align 8
  %count.addr = alloca i64, align 8
  %tmp = alloca i8*, align 8
  %s = alloca i8*, align 8
  %i = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %i, align 4, !dbg !39
  br label %while.cond, !dbg !40

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i32, i32* %i, align 4, !dbg !41
  %conv = sext i32 %2 to i64, !dbg !41
  %3 = load i64, i64* %count.addr, align 8, !dbg !42
  %cmp = icmp ult i64 %conv, %3, !dbg !43
  br i1 %cmp, label %while.body, label %while.end, !dbg !40

while.body:                                       ; preds = %while.cond
  %4 = load i8*, i8** %s, align 8, !dbg !44
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1, !dbg !44
  store i8* %incdec.ptr, i8** %s, align 8, !dbg !44
  %5 = load i8, i8* %4, align 1, !dbg !46
  %6 = load i8*, i8** %tmp, align 8, !dbg !47
  %incdec.ptr2 = getelementptr inbounds i8, i8* %6, i32 1, !dbg !47
  store i8* %incdec.ptr2, i8** %tmp, align 8, !dbg !47
  store i8 %5, i8* %6, align 1, !dbg !48
  %7 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %7, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %while.cond, !dbg !40, !llvm.loop !50

while.end:                                        ; preds = %while.cond
  %8 = load i8*, i8** %dest.addr, align 8, !dbg !53
  ret i8* %8, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dest1 = alloca [10 x i8], align 1
  %src1 = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [10 x i8]* %dest1, metadata !63, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %src1, metadata !68, metadata !DIExpression()), !dbg !69
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8** %src1, align 8, !dbg !69
  %0 = load i32, i32* %argc.addr, align 4, !dbg !70
  %cmp = icmp sgt i32 %0, 1, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dest1, i64 0, i64 0, !dbg !74
  %1 = load i8*, i8** %src1, align 8, !dbg !76
  %2 = load i8**, i8*** %argv.addr, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8*, i8** %2, i64 1, !dbg !77
  %3 = load i8*, i8** %arrayidx, align 8, !dbg !77
  %call = call i32 @atoi(i8* noundef %3), !dbg !78
  %conv = sext i32 %call to i64, !dbg !78
  %call1 = call i8* @cwe120_c_86(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %conv), !dbg !79
  br label %if.end, !dbg !80

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !81
}

declare i32 @atoi(i8* noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/dirty/WhileCopyOverflow_BadCase02.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
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
!12 = distinct !DISubprogram(name: "cwe120_c_86", scope: !13, file: !13, line: 12, type: !14, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!13 = !DIFile(filename: "dirty/WhileCopyOverflow_BadCase02.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
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
!25 = !DILocalVariable(name: "dest", arg: 1, scope: !12, file: !13, line: 12, type: !16)
!26 = !DILocation(line: 12, column: 25, scope: !12)
!27 = !DILocalVariable(name: "src", arg: 2, scope: !12, file: !13, line: 12, type: !17)
!28 = !DILocation(line: 12, column: 43, scope: !12)
!29 = !DILocalVariable(name: "count", arg: 3, scope: !12, file: !13, line: 12, type: !19)
!30 = !DILocation(line: 12, column: 55, scope: !12)
!31 = !DILocalVariable(name: "tmp", scope: !12, file: !13, line: 14, type: !3)
!32 = !DILocation(line: 14, column: 8, scope: !12)
!33 = !DILocation(line: 14, column: 22, scope: !12)
!34 = !DILocalVariable(name: "s", scope: !12, file: !13, line: 15, type: !3)
!35 = !DILocation(line: 15, column: 8, scope: !12)
!36 = !DILocation(line: 15, column: 20, scope: !12)
!37 = !DILocalVariable(name: "i", scope: !12, file: !13, line: 16, type: !38)
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DILocation(line: 16, column: 6, scope: !12)
!40 = !DILocation(line: 17, column: 2, scope: !12)
!41 = !DILocation(line: 17, column: 9, scope: !12)
!42 = !DILocation(line: 17, column: 13, scope: !12)
!43 = !DILocation(line: 17, column: 11, scope: !12)
!44 = !DILocation(line: 20, column: 14, scope: !45)
!45 = distinct !DILexicalBlock(scope: !12, file: !13, line: 18, column: 2)
!46 = !DILocation(line: 20, column: 12, scope: !45)
!47 = !DILocation(line: 20, column: 7, scope: !45)
!48 = !DILocation(line: 20, column: 10, scope: !45)
!49 = !DILocation(line: 21, column: 4, scope: !45)
!50 = distinct !{!50, !40, !51, !52}
!51 = !DILocation(line: 22, column: 2, scope: !12)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 23, column: 9, scope: !12)
!54 = !DILocation(line: 23, column: 2, scope: !12)
!55 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 25, type: !56, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!56 = !DISubroutineType(types: !57)
!57 = !{!38, !38, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !13, line: 25, type: !38)
!60 = !DILocation(line: 25, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !13, line: 25, type: !58)
!62 = !DILocation(line: 25, column: 27, scope: !55)
!63 = !DILocalVariable(name: "dest1", scope: !55, file: !13, line: 27, type: !64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 10)
!67 = !DILocation(line: 27, column: 7, scope: !55)
!68 = !DILocalVariable(name: "src1", scope: !55, file: !13, line: 28, type: !3)
!69 = !DILocation(line: 28, column: 8, scope: !55)
!70 = !DILocation(line: 29, column: 6, scope: !71)
!71 = distinct !DILexicalBlock(scope: !55, file: !13, line: 29, column: 6)
!72 = !DILocation(line: 29, column: 11, scope: !71)
!73 = !DILocation(line: 29, column: 6, scope: !55)
!74 = !DILocation(line: 30, column: 15, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !13, line: 29, column: 16)
!76 = !DILocation(line: 30, column: 22, scope: !75)
!77 = !DILocation(line: 30, column: 33, scope: !75)
!78 = !DILocation(line: 30, column: 28, scope: !75)
!79 = !DILocation(line: 30, column: 3, scope: !75)
!80 = !DILocation(line: 31, column: 2, scope: !75)
!81 = !DILocation(line: 33, column: 2, scope: !55)
