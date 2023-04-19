; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/safe/Scanfs_FormatOverflow_BadCase02.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/safe/Scanfs_FormatOverflow_BadCase02.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%3c\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"%[a-z]\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_192(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !9 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i64* %len, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !29
  %call = call i64 @strlen(i8* noundef %0), !dbg !30
  store i64 %call, i64* %len, align 8, !dbg !28
  %1 = load i8*, i8** %buf.addr, align 8, !dbg !31
  %2 = load i64, i64* %len, align 8, !dbg !32
  %call1 = call i32 (i8*, i8*, i64, ...) bitcast (i32 (...)* @scanf_s to i32 (i8*, i8*, i64, ...)*)(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %1, i64 noundef %2), !dbg !33
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !34
  %4 = load i64, i64* %len, align 8, !dbg !35
  %call2 = call i32 (i8*, i8*, i64, ...) bitcast (i32 (...)* @scanf_s to i32 (i8*, i8*, i64, ...)*)(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* noundef %3, i64 noundef %4), !dbg !36
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !37
  %6 = load i64, i64* %len, align 8, !dbg !38
  %call3 = call i32 (i8*, i8*, i64, ...) bitcast (i32 (...)* @scanf_s to i32 (i8*, i8*, i64, ...)*)(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* noundef %5, i64 noundef %6), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i64 @strlen(i8* noundef) #2

declare i32 @scanf_s(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_189(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !41 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %c = alloca i8, align 1
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i8* %c, metadata !48, metadata !DIExpression()), !dbg !49
  %call = call i32 (i8*, i8*, ...) bitcast (i32 (...)* @scanf_s to i32 (i8*, i8*, ...)*)(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0), i8* noundef %c), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !61, metadata !DIExpression()), !dbg !65
  %0 = load i32, i32* %argc.addr, align 4, !dbg !66
  %cmp = icmp sgt i32 %0, 1, !dbg !68
  br i1 %cmp, label %if.then, label %if.end, !dbg !69

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !70
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !72
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !72
  call void @cwe120_c_189(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !73
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !74
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !75
  %4 = load i8*, i8** %arrayidx2, align 8, !dbg !75
  call void @cwe120_c_192(i8* noundef %arraydecay1, i64 noundef 16, i8* noundef %4), !dbg !76
  br label %if.end, !dbg !77

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !78
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/safe/Scanfs_FormatOverflow_BadCase02.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_192", scope: !10, file: !10, line: 15, type: !11, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!10 = !DIFile(filename: "safe/Scanfs_FormatOverflow_BadCase02.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !15, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !16, line: 31, baseType: !17)
!16 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !18, line: 94, baseType: !19)
!18 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!19 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!20 = !{}
!21 = !DILocalVariable(name: "buf", arg: 1, scope: !9, file: !10, line: 15, type: !13)
!22 = !DILocation(line: 15, column: 25, scope: !9)
!23 = !DILocalVariable(name: "bufSize", arg: 2, scope: !9, file: !10, line: 15, type: !15)
!24 = !DILocation(line: 15, column: 37, scope: !9)
!25 = !DILocalVariable(name: "msg", arg: 3, scope: !9, file: !10, line: 15, type: !13)
!26 = !DILocation(line: 15, column: 52, scope: !9)
!27 = !DILocalVariable(name: "len", scope: !9, file: !10, line: 17, type: !15)
!28 = !DILocation(line: 17, column: 12, scope: !9)
!29 = !DILocation(line: 17, column: 25, scope: !9)
!30 = !DILocation(line: 17, column: 18, scope: !9)
!31 = !DILocation(line: 19, column: 23, scope: !9)
!32 = !DILocation(line: 19, column: 28, scope: !9)
!33 = !DILocation(line: 19, column: 5, scope: !9)
!34 = !DILocation(line: 21, column: 24, scope: !9)
!35 = !DILocation(line: 21, column: 29, scope: !9)
!36 = !DILocation(line: 21, column: 5, scope: !9)
!37 = !DILocation(line: 23, column: 27, scope: !9)
!38 = !DILocation(line: 23, column: 32, scope: !9)
!39 = !DILocation(line: 23, column: 5, scope: !9)
!40 = !DILocation(line: 24, column: 1, scope: !9)
!41 = distinct !DISubprogram(name: "cwe120_c_189", scope: !10, file: !10, line: 29, type: !11, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!42 = !DILocalVariable(name: "buf", arg: 1, scope: !41, file: !10, line: 29, type: !13)
!43 = !DILocation(line: 29, column: 25, scope: !41)
!44 = !DILocalVariable(name: "bufSize", arg: 2, scope: !41, file: !10, line: 29, type: !15)
!45 = !DILocation(line: 29, column: 37, scope: !41)
!46 = !DILocalVariable(name: "msg", arg: 3, scope: !41, file: !10, line: 29, type: !13)
!47 = !DILocation(line: 29, column: 52, scope: !41)
!48 = !DILocalVariable(name: "c", scope: !41, file: !10, line: 31, type: !14)
!49 = !DILocation(line: 31, column: 10, scope: !41)
!50 = !DILocation(line: 33, column: 5, scope: !41)
!51 = !DILocation(line: 34, column: 1, scope: !41)
!52 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 35, type: !53, scopeLine: 36, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!53 = !DISubroutineType(types: !54)
!54 = !{!55, !55, !56}
!55 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !10, line: 35, type: !55)
!58 = !DILocation(line: 35, column: 14, scope: !52)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !10, line: 35, type: !56)
!60 = !DILocation(line: 35, column: 27, scope: !52)
!61 = !DILocalVariable(name: "buf", scope: !52, file: !10, line: 37, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 16)
!65 = !DILocation(line: 37, column: 10, scope: !52)
!66 = !DILocation(line: 38, column: 9, scope: !67)
!67 = distinct !DILexicalBlock(scope: !52, file: !10, line: 38, column: 9)
!68 = !DILocation(line: 38, column: 14, scope: !67)
!69 = !DILocation(line: 38, column: 9, scope: !52)
!70 = !DILocation(line: 39, column: 22, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !10, line: 38, column: 19)
!72 = !DILocation(line: 39, column: 40, scope: !71)
!73 = !DILocation(line: 39, column: 9, scope: !71)
!74 = !DILocation(line: 40, column: 16, scope: !71)
!75 = !DILocation(line: 40, column: 34, scope: !71)
!76 = !DILocation(line: 40, column: 3, scope: !71)
!77 = !DILocation(line: 41, column: 5, scope: !71)
!78 = !DILocation(line: 42, column: 5, scope: !52)
