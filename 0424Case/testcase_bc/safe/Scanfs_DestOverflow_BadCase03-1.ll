; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/safe/Scanfs_DestOverflow_BadCase03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/safe/Scanfs_DestOverflow_BadCase03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }

@__stdinp = external global %struct.__sFILE*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%3c\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"%[a-z]\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_196(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !9 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %c = alloca i8, align 1
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !23, metadata !DIExpression()), !dbg !24
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8* %c, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !29
  %call = call i32 (%struct.__sFILE*, i8*, i8*, ...) bitcast (i32 (...)* @fscanf_s to i32 (%struct.__sFILE*, i8*, i8*, ...)*)(%struct.__sFILE* noundef %0, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %c), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @fscanf_s(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_202(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !32 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !35, metadata !DIExpression()), !dbg !36
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %len, metadata !39, metadata !DIExpression()), !dbg !40
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !41
  %call = call i64 @strlen(i8* noundef %0), !dbg !42
  store i64 %call, i64* %len, align 8, !dbg !40
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !43
  %2 = load i8*, i8** %buf.addr, align 8, !dbg !44
  %3 = load i64, i64* %len, align 8, !dbg !45
  %call1 = call i32 (%struct.__sFILE*, i8*, ...) @VOS_fscanf_s(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* noundef %2, i64 noundef %3), !dbg !46
  %4 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !47
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !48
  %6 = load i64, i64* %len, align 8, !dbg !49
  %call2 = call i32 (%struct.__sFILE*, i8*, ...) @VOS_fscanf_s(%struct.__sFILE* noundef %4, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* noundef %5, i64 noundef %6), !dbg !50
  %7 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !51
  %8 = load i8*, i8** %buf.addr, align 8, !dbg !52
  %9 = load i64, i64* %len, align 8, !dbg !53
  %call3 = call i32 (%struct.__sFILE*, i8*, ...) @VOS_fscanf_s(%struct.__sFILE* noundef %7, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i8* noundef %8, i64 noundef %9), !dbg !54
  ret void, !dbg !55
}

declare i64 @strlen(i8* noundef) #2

declare i32 @VOS_fscanf_s(%struct.__sFILE* noundef, i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_187(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !56 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata i64* %len, metadata !63, metadata !DIExpression()), !dbg !64
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !65
  %call = call i64 @strlen(i8* noundef %0), !dbg !66
  store i64 %call, i64* %len, align 8, !dbg !64
  %1 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !67
  %2 = load i8*, i8** %buf.addr, align 8, !dbg !68
  %3 = load i64, i64* %len, align 8, !dbg !69
  %call1 = call i32 (%struct.__sFILE*, i8*, i8*, i64, ...) bitcast (i32 (...)* @fscanf_s to i32 (%struct.__sFILE*, i8*, i8*, i64, ...)*)(%struct.__sFILE* noundef %1, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* noundef %2, i64 noundef %3), !dbg !70
  %4 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !71
  %5 = load i8*, i8** %buf.addr, align 8, !dbg !72
  %6 = load i64, i64* %len, align 8, !dbg !73
  %call2 = call i32 (%struct.__sFILE*, i8*, i8*, i64, ...) bitcast (i32 (...)* @fscanf_s to i32 (%struct.__sFILE*, i8*, i8*, i64, ...)*)(%struct.__sFILE* noundef %4, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i8* noundef %5, i64 noundef %6), !dbg !74
  %7 = load %struct.__sFILE*, %struct.__sFILE** @__stdinp, align 8, !dbg !75
  %8 = load i8*, i8** %buf.addr, align 8, !dbg !76
  %9 = load i64, i64* %len, align 8, !dbg !77
  %call3 = call i32 (%struct.__sFILE*, i8*, i8*, i64, ...) bitcast (i32 (...)* @fscanf_s to i32 (%struct.__sFILE*, i8*, i8*, i64, ...)*)(%struct.__sFILE* noundef %7, i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0), i8* noundef %8, i64 noundef %9), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !89, metadata !DIExpression()), !dbg !93
  %0 = load i32, i32* %argc.addr, align 4, !dbg !94
  %cmp = icmp sgt i32 %0, 1, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !98
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !100
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !100
  call void @cwe120_c_187(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !101
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !102
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !103
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !103
  %4 = load i8*, i8** %arrayidx2, align 8, !dbg !103
  call void @cwe120_c_196(i8* noundef %arraydecay1, i64 noundef 16, i8* noundef %4), !dbg !104
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !105
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !106
  %arrayidx4 = getelementptr inbounds i8*, i8** %5, i64 1, !dbg !106
  %6 = load i8*, i8** %arrayidx4, align 8, !dbg !106
  call void @cwe120_c_202(i8* noundef %arraydecay3, i64 noundef 16, i8* noundef %6), !dbg !107
  br label %if.end, !dbg !108

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !109
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/safe/Scanfs_DestOverflow_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_196", scope: !10, file: !10, line: 15, type: !11, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!10 = !DIFile(filename: "safe/Scanfs_DestOverflow_BadCase03-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
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
!27 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 17, type: !14)
!28 = !DILocation(line: 17, column: 10, scope: !9)
!29 = !DILocation(line: 19, column: 18, scope: !9)
!30 = !DILocation(line: 19, column: 5, scope: !9)
!31 = !DILocation(line: 20, column: 1, scope: !9)
!32 = distinct !DISubprogram(name: "cwe120_c_202", scope: !10, file: !10, line: 25, type: !11, scopeLine: 26, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!33 = !DILocalVariable(name: "buf", arg: 1, scope: !32, file: !10, line: 25, type: !13)
!34 = !DILocation(line: 25, column: 25, scope: !32)
!35 = !DILocalVariable(name: "bufSize", arg: 2, scope: !32, file: !10, line: 25, type: !15)
!36 = !DILocation(line: 25, column: 37, scope: !32)
!37 = !DILocalVariable(name: "msg", arg: 3, scope: !32, file: !10, line: 25, type: !13)
!38 = !DILocation(line: 25, column: 52, scope: !32)
!39 = !DILocalVariable(name: "len", scope: !32, file: !10, line: 27, type: !15)
!40 = !DILocation(line: 27, column: 12, scope: !32)
!41 = !DILocation(line: 27, column: 25, scope: !32)
!42 = !DILocation(line: 27, column: 18, scope: !32)
!43 = !DILocation(line: 29, column: 18, scope: !32)
!44 = !DILocation(line: 29, column: 31, scope: !32)
!45 = !DILocation(line: 29, column: 36, scope: !32)
!46 = !DILocation(line: 29, column: 5, scope: !32)
!47 = !DILocation(line: 31, column: 18, scope: !32)
!48 = !DILocation(line: 31, column: 32, scope: !32)
!49 = !DILocation(line: 31, column: 37, scope: !32)
!50 = !DILocation(line: 31, column: 5, scope: !32)
!51 = !DILocation(line: 33, column: 18, scope: !32)
!52 = !DILocation(line: 33, column: 35, scope: !32)
!53 = !DILocation(line: 33, column: 40, scope: !32)
!54 = !DILocation(line: 33, column: 5, scope: !32)
!55 = !DILocation(line: 34, column: 1, scope: !32)
!56 = distinct !DISubprogram(name: "cwe120_c_187", scope: !10, file: !10, line: 40, type: !11, scopeLine: 41, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!57 = !DILocalVariable(name: "buf", arg: 1, scope: !56, file: !10, line: 40, type: !13)
!58 = !DILocation(line: 40, column: 25, scope: !56)
!59 = !DILocalVariable(name: "bufSize", arg: 2, scope: !56, file: !10, line: 40, type: !15)
!60 = !DILocation(line: 40, column: 37, scope: !56)
!61 = !DILocalVariable(name: "msg", arg: 3, scope: !56, file: !10, line: 40, type: !13)
!62 = !DILocation(line: 40, column: 52, scope: !56)
!63 = !DILocalVariable(name: "len", scope: !56, file: !10, line: 42, type: !15)
!64 = !DILocation(line: 42, column: 12, scope: !56)
!65 = !DILocation(line: 42, column: 25, scope: !56)
!66 = !DILocation(line: 42, column: 18, scope: !56)
!67 = !DILocation(line: 44, column: 14, scope: !56)
!68 = !DILocation(line: 44, column: 27, scope: !56)
!69 = !DILocation(line: 44, column: 32, scope: !56)
!70 = !DILocation(line: 44, column: 5, scope: !56)
!71 = !DILocation(line: 46, column: 14, scope: !56)
!72 = !DILocation(line: 46, column: 28, scope: !56)
!73 = !DILocation(line: 46, column: 33, scope: !56)
!74 = !DILocation(line: 46, column: 5, scope: !56)
!75 = !DILocation(line: 48, column: 14, scope: !56)
!76 = !DILocation(line: 48, column: 31, scope: !56)
!77 = !DILocation(line: 48, column: 36, scope: !56)
!78 = !DILocation(line: 48, column: 5, scope: !56)
!79 = !DILocation(line: 49, column: 1, scope: !56)
!80 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 50, type: !81, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !10, line: 50, type: !83)
!86 = !DILocation(line: 50, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !10, line: 50, type: !84)
!88 = !DILocation(line: 50, column: 27, scope: !80)
!89 = !DILocalVariable(name: "buf", scope: !80, file: !10, line: 52, type: !90)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 16)
!93 = !DILocation(line: 52, column: 10, scope: !80)
!94 = !DILocation(line: 53, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !80, file: !10, line: 53, column: 9)
!96 = !DILocation(line: 53, column: 14, scope: !95)
!97 = !DILocation(line: 53, column: 9, scope: !80)
!98 = !DILocation(line: 54, column: 22, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !10, line: 53, column: 19)
!100 = !DILocation(line: 54, column: 40, scope: !99)
!101 = !DILocation(line: 54, column: 9, scope: !99)
!102 = !DILocation(line: 55, column: 16, scope: !99)
!103 = !DILocation(line: 55, column: 34, scope: !99)
!104 = !DILocation(line: 55, column: 3, scope: !99)
!105 = !DILocation(line: 56, column: 16, scope: !99)
!106 = !DILocation(line: 56, column: 34, scope: !99)
!107 = !DILocation(line: 56, column: 3, scope: !99)
!108 = !DILocation(line: 57, column: 5, scope: !99)
!109 = !DILocation(line: 58, column: 5, scope: !80)
