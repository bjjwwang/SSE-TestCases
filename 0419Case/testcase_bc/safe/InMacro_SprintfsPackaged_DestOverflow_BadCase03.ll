; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/safe/InMacro_SprintfsPackaged_DestOverflow_BadCase03.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/safe/InMacro_SprintfsPackaged_DestOverflow_BadCase03.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_221(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !9 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %count = alloca i64, align 8
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
  call void @llvm.dbg.declare(metadata i64* %count, metadata !31, metadata !DIExpression()), !dbg !32
  %1 = load i64, i64* %len, align 8, !dbg !33
  %cmp = icmp ugt i64 %1, 0, !dbg !34
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !33

cond.true:                                        ; preds = %entry
  %2 = load i64, i64* %len, align 8, !dbg !35
  %sub = sub i64 %2, 1, !dbg !36
  br label %cond.end, !dbg !33

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !33

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ 0, %cond.false ], !dbg !33
  store i64 %cond, i64* %count, align 8, !dbg !32
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !37
  %4 = load i64, i64* %len, align 8, !dbg !38
  %5 = load i64, i64* %count, align 8, !dbg !39
  %6 = load i8*, i8** %msg.addr, align 8, !dbg !40
  %call1 = call i32 (i8*, i64, i64, i8*, ...) @VOS_snprintf_s(i8* noundef %3, i64 noundef %4, i64 noundef %5, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %6), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i64 @strlen(i8* noundef) #2

declare i32 @VOS_snprintf_s(i8* noundef, i64 noundef, i64 noundef, i8* noundef, ...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_211(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !43 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %count = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !44, metadata !DIExpression()), !dbg !45
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !46, metadata !DIExpression()), !dbg !47
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %len, metadata !50, metadata !DIExpression()), !dbg !51
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !52
  %call = call i64 @strlen(i8* noundef %0), !dbg !53
  store i64 %call, i64* %len, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i64* %count, metadata !54, metadata !DIExpression()), !dbg !55
  %1 = load i64, i64* %len, align 8, !dbg !56
  %cmp = icmp ugt i64 %1, 0, !dbg !57
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !56

cond.true:                                        ; preds = %entry
  %2 = load i64, i64* %len, align 8, !dbg !58
  %sub = sub i64 %2, 1, !dbg !59
  br label %cond.end, !dbg !56

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !56

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ 0, %cond.false ], !dbg !56
  store i64 %cond, i64* %count, align 8, !dbg !55
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !60
  %4 = load i64, i64* %len, align 8, !dbg !61
  %5 = load i64, i64* %count, align 8, !dbg !62
  %6 = load i8*, i8** %msg.addr, align 8, !dbg !63
  %call1 = call i32 (i8*, i64, i64, i8*, i8*, ...) bitcast (i32 (...)* @snprintf_s to i32 (i8*, i64, i64, i8*, i8*, ...)*)(i8* noundef %3, i64 noundef %4, i64 noundef %5, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %6), !dbg !64
  ret void, !dbg !65
}

declare i32 @snprintf_s(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @cwe120_c_215(i8* noundef %buf, i64 noundef %bufSize, i8* noundef %msg) #0 !dbg !66 {
entry:
  %buf.addr = alloca i8*, align 8
  %bufSize.addr = alloca i64, align 8
  %msg.addr = alloca i8*, align 8
  %len = alloca i64, align 8
  %count = alloca i64, align 8
  store i8* %buf, i8** %buf.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %buf.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i64 %bufSize, i64* %bufSize.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %bufSize.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8* %msg, i8** %msg.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %msg.addr, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %len, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i8*, i8** %msg.addr, align 8, !dbg !75
  %call = call i64 @strlen(i8* noundef %0), !dbg !76
  store i64 %call, i64* %len, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i64* %count, metadata !77, metadata !DIExpression()), !dbg !78
  %1 = load i64, i64* %len, align 8, !dbg !79
  %cmp = icmp ugt i64 %1, 0, !dbg !80
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !79

cond.true:                                        ; preds = %entry
  %2 = load i64, i64* %len, align 8, !dbg !81
  %sub = sub i64 %2, 1, !dbg !82
  br label %cond.end, !dbg !79

cond.false:                                       ; preds = %entry
  br label %cond.end, !dbg !79

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub, %cond.true ], [ 0, %cond.false ], !dbg !79
  store i64 %cond, i64* %count, align 8, !dbg !78
  %3 = load i8*, i8** %buf.addr, align 8, !dbg !83
  %4 = load i64, i64* %len, align 8, !dbg !84
  %5 = load i64, i64* %count, align 8, !dbg !85
  %6 = load i8*, i8** %msg.addr, align 8, !dbg !86
  %call1 = call i32 (i8*, i64, i64, i8*, i8*, ...) bitcast (i32 (...)* @snprintf_s to i32 (i8*, i64, i64, i8*, i8*, ...)*)(i8* noundef %3, i64 noundef %4, i64 noundef %5, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* noundef %6), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %buf = alloca [16 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [16 x i8]* %buf, metadata !98, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* %argc.addr, align 4, !dbg !103
  %cmp = icmp sgt i32 %0, 1, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !107
  %1 = load i8**, i8*** %argv.addr, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8*, i8** %1, i64 1, !dbg !109
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !109
  call void @cwe120_c_211(i8* noundef %arraydecay, i64 noundef 16, i8* noundef %2), !dbg !110
  %arraydecay1 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !111
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !112
  %arrayidx2 = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !112
  %4 = load i8*, i8** %arrayidx2, align 8, !dbg !112
  call void @cwe120_c_215(i8* noundef %arraydecay1, i64 noundef 16, i8* noundef %4), !dbg !113
  %arraydecay3 = getelementptr inbounds [16 x i8], [16 x i8]* %buf, i64 0, i64 0, !dbg !114
  %5 = load i8**, i8*** %argv.addr, align 8, !dbg !115
  %arrayidx4 = getelementptr inbounds i8*, i8** %5, i64 1, !dbg !115
  %6 = load i8*, i8** %arrayidx4, align 8, !dbg !115
  call void @cwe120_c_221(i8* noundef %arraydecay3, i64 noundef 16, i8* noundef %6), !dbg !116
  br label %if.end, !dbg !117

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !118
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/safe/InMacro_SprintfsPackaged_DestOverflow_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "cwe120_c_221", scope: !10, file: !10, line: 14, type: !11, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!10 = !DIFile(filename: "safe/InMacro_SprintfsPackaged_DestOverflow_BadCase03.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
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
!21 = !DILocalVariable(name: "buf", arg: 1, scope: !9, file: !10, line: 14, type: !13)
!22 = !DILocation(line: 14, column: 25, scope: !9)
!23 = !DILocalVariable(name: "bufSize", arg: 2, scope: !9, file: !10, line: 14, type: !15)
!24 = !DILocation(line: 14, column: 37, scope: !9)
!25 = !DILocalVariable(name: "msg", arg: 3, scope: !9, file: !10, line: 14, type: !13)
!26 = !DILocation(line: 14, column: 52, scope: !9)
!27 = !DILocalVariable(name: "len", scope: !9, file: !10, line: 16, type: !15)
!28 = !DILocation(line: 16, column: 12, scope: !9)
!29 = !DILocation(line: 16, column: 25, scope: !9)
!30 = !DILocation(line: 16, column: 18, scope: !9)
!31 = !DILocalVariable(name: "count", scope: !9, file: !10, line: 17, type: !15)
!32 = !DILocation(line: 17, column: 12, scope: !9)
!33 = !DILocation(line: 17, column: 21, scope: !9)
!34 = !DILocation(line: 17, column: 25, scope: !9)
!35 = !DILocation(line: 17, column: 31, scope: !9)
!36 = !DILocation(line: 17, column: 35, scope: !9)
!37 = !DILocation(line: 19, column: 20, scope: !9)
!38 = !DILocation(line: 19, column: 25, scope: !9)
!39 = !DILocation(line: 19, column: 30, scope: !9)
!40 = !DILocation(line: 19, column: 43, scope: !9)
!41 = !DILocation(line: 19, column: 5, scope: !9)
!42 = !DILocation(line: 20, column: 1, scope: !9)
!43 = distinct !DISubprogram(name: "cwe120_c_211", scope: !10, file: !10, line: 26, type: !11, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!44 = !DILocalVariable(name: "buf", arg: 1, scope: !43, file: !10, line: 26, type: !13)
!45 = !DILocation(line: 26, column: 25, scope: !43)
!46 = !DILocalVariable(name: "bufSize", arg: 2, scope: !43, file: !10, line: 26, type: !15)
!47 = !DILocation(line: 26, column: 37, scope: !43)
!48 = !DILocalVariable(name: "msg", arg: 3, scope: !43, file: !10, line: 26, type: !13)
!49 = !DILocation(line: 26, column: 52, scope: !43)
!50 = !DILocalVariable(name: "len", scope: !43, file: !10, line: 28, type: !15)
!51 = !DILocation(line: 28, column: 12, scope: !43)
!52 = !DILocation(line: 28, column: 25, scope: !43)
!53 = !DILocation(line: 28, column: 18, scope: !43)
!54 = !DILocalVariable(name: "count", scope: !43, file: !10, line: 29, type: !15)
!55 = !DILocation(line: 29, column: 12, scope: !43)
!56 = !DILocation(line: 29, column: 21, scope: !43)
!57 = !DILocation(line: 29, column: 25, scope: !43)
!58 = !DILocation(line: 29, column: 31, scope: !43)
!59 = !DILocation(line: 29, column: 35, scope: !43)
!60 = !DILocation(line: 31, column: 16, scope: !43)
!61 = !DILocation(line: 31, column: 21, scope: !43)
!62 = !DILocation(line: 31, column: 26, scope: !43)
!63 = !DILocation(line: 31, column: 39, scope: !43)
!64 = !DILocation(line: 31, column: 5, scope: !43)
!65 = !DILocation(line: 32, column: 1, scope: !43)
!66 = distinct !DISubprogram(name: "cwe120_c_215", scope: !10, file: !10, line: 39, type: !11, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!67 = !DILocalVariable(name: "buf", arg: 1, scope: !66, file: !10, line: 39, type: !13)
!68 = !DILocation(line: 39, column: 25, scope: !66)
!69 = !DILocalVariable(name: "bufSize", arg: 2, scope: !66, file: !10, line: 39, type: !15)
!70 = !DILocation(line: 39, column: 37, scope: !66)
!71 = !DILocalVariable(name: "msg", arg: 3, scope: !66, file: !10, line: 39, type: !13)
!72 = !DILocation(line: 39, column: 52, scope: !66)
!73 = !DILocalVariable(name: "len", scope: !66, file: !10, line: 41, type: !15)
!74 = !DILocation(line: 41, column: 12, scope: !66)
!75 = !DILocation(line: 41, column: 25, scope: !66)
!76 = !DILocation(line: 41, column: 18, scope: !66)
!77 = !DILocalVariable(name: "count", scope: !66, file: !10, line: 42, type: !15)
!78 = !DILocation(line: 42, column: 12, scope: !66)
!79 = !DILocation(line: 42, column: 21, scope: !66)
!80 = !DILocation(line: 42, column: 25, scope: !66)
!81 = !DILocation(line: 42, column: 31, scope: !66)
!82 = !DILocation(line: 42, column: 35, scope: !66)
!83 = !DILocation(line: 44, column: 20, scope: !66)
!84 = !DILocation(line: 44, column: 25, scope: !66)
!85 = !DILocation(line: 44, column: 30, scope: !66)
!86 = !DILocation(line: 44, column: 43, scope: !66)
!87 = !DILocation(line: 44, column: 5, scope: !66)
!88 = !DILocation(line: 45, column: 1, scope: !66)
!89 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 46, type: !90, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!90 = !DISubroutineType(types: !91)
!91 = !{!92, !92, !93}
!92 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !10, line: 46, type: !92)
!95 = !DILocation(line: 46, column: 14, scope: !89)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !10, line: 46, type: !93)
!97 = !DILocation(line: 46, column: 27, scope: !89)
!98 = !DILocalVariable(name: "buf", scope: !89, file: !10, line: 48, type: !99)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 128, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 16)
!102 = !DILocation(line: 48, column: 10, scope: !89)
!103 = !DILocation(line: 49, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !89, file: !10, line: 49, column: 9)
!105 = !DILocation(line: 49, column: 14, scope: !104)
!106 = !DILocation(line: 49, column: 9, scope: !89)
!107 = !DILocation(line: 50, column: 22, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !10, line: 49, column: 19)
!109 = !DILocation(line: 50, column: 40, scope: !108)
!110 = !DILocation(line: 50, column: 9, scope: !108)
!111 = !DILocation(line: 51, column: 22, scope: !108)
!112 = !DILocation(line: 51, column: 40, scope: !108)
!113 = !DILocation(line: 51, column: 9, scope: !108)
!114 = !DILocation(line: 52, column: 22, scope: !108)
!115 = !DILocation(line: 52, column: 40, scope: !108)
!116 = !DILocation(line: 52, column: 9, scope: !108)
!117 = !DILocation(line: 53, column: 5, scope: !108)
!118 = !DILocation(line: 54, column: 5, scope: !89)
