; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %2, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx1, align 1, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !49
  %6 = load i8*, i8** %data, align 8, !dbg !49
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !49
  %call = call i8* @__strcat_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef %7) #5, !dbg !49
  %8 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* noundef %8), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07_good() #0 !dbg !53 {
entry:
  call void @goodG2B1(), !dbg !54
  call void @goodG2B2(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 50, align 16, !dbg !80
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %1 = alloca i8, i64 100, align 16, !dbg !83
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !82
  %2 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %2, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !91
  store i8* %3, i8** %data, align 8, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx1, align 1, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !102
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !102
  %call = call i8* @__strcat_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef %7) #5, !dbg !102
  %8 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* noundef %8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 50, align 16, !dbg !111
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %1 = alloca i8, i64 100, align 16, !dbg !114
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !113
  %2 = load i32, i32* @staticFive, align 4, !dbg !115
  %cmp = icmp eq i32 %2, 5, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !119
  store i8* %3, i8** %data, align 8, !dbg !121
  %4 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx1, align 1, !dbg !130
  %5 = load i8*, i8** %data, align 8, !dbg !131
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  %6 = load i8*, i8** %data, align 8, !dbg !131
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !131
  %call = call i8* @__strcat_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef %7) #5, !dbg !131
  %8 = load i8*, i8** %data, align 8, !dbg !132
  call void @printLine(i8* noundef %8), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07_bad", scope: !9, file: !9, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 31, type: !5)
!23 = !DILocation(line: 31, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !18)
!26 = !DILocation(line: 32, column: 36, scope: !18)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 33, type: !5)
!28 = !DILocation(line: 33, column: 12, scope: !18)
!29 = !DILocation(line: 33, column: 37, scope: !18)
!30 = !DILocation(line: 34, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !9, line: 34, column: 8)
!32 = !DILocation(line: 34, column: 18, scope: !31)
!33 = !DILocation(line: 34, column: 8, scope: !18)
!34 = !DILocation(line: 38, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !9, line: 35, column: 5)
!36 = !DILocation(line: 38, column: 14, scope: !35)
!37 = !DILocation(line: 39, column: 9, scope: !35)
!38 = !DILocation(line: 39, column: 17, scope: !35)
!39 = !DILocation(line: 40, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !9, line: 42, type: !42)
!41 = distinct !DILexicalBlock(scope: !18, file: !9, line: 41, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 42, column: 14, scope: !41)
!46 = !DILocation(line: 43, column: 9, scope: !41)
!47 = !DILocation(line: 44, column: 9, scope: !41)
!48 = !DILocation(line: 44, column: 23, scope: !41)
!49 = !DILocation(line: 46, column: 9, scope: !41)
!50 = !DILocation(line: 47, column: 19, scope: !41)
!51 = !DILocation(line: 47, column: 9, scope: !41)
!52 = !DILocation(line: 49, column: 1, scope: !18)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cat_07_good", scope: !9, file: !9, line: 104, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!54 = !DILocation(line: 106, column: 5, scope: !53)
!55 = !DILocation(line: 107, column: 5, scope: !53)
!56 = !DILocation(line: 108, column: 1, scope: !53)
!57 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 120, type: !58, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!58 = !DISubroutineType(types: !59)
!59 = !{!10, !10, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !9, line: 120, type: !10)
!62 = !DILocation(line: 120, column: 14, scope: !57)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !9, line: 120, type: !60)
!64 = !DILocation(line: 120, column: 27, scope: !57)
!65 = !DILocation(line: 123, column: 22, scope: !57)
!66 = !DILocation(line: 123, column: 12, scope: !57)
!67 = !DILocation(line: 123, column: 5, scope: !57)
!68 = !DILocation(line: 125, column: 5, scope: !57)
!69 = !DILocation(line: 126, column: 5, scope: !57)
!70 = !DILocation(line: 127, column: 5, scope: !57)
!71 = !DILocation(line: 130, column: 5, scope: !57)
!72 = !DILocation(line: 131, column: 5, scope: !57)
!73 = !DILocation(line: 132, column: 5, scope: !57)
!74 = !DILocation(line: 134, column: 5, scope: !57)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!76 = !DILocalVariable(name: "data", scope: !75, file: !9, line: 58, type: !5)
!77 = !DILocation(line: 58, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !9, line: 59, type: !5)
!79 = !DILocation(line: 59, column: 12, scope: !75)
!80 = !DILocation(line: 59, column: 36, scope: !75)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !9, line: 60, type: !5)
!82 = !DILocation(line: 60, column: 12, scope: !75)
!83 = !DILocation(line: 60, column: 37, scope: !75)
!84 = !DILocation(line: 61, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !9, line: 61, column: 8)
!86 = !DILocation(line: 61, column: 18, scope: !85)
!87 = !DILocation(line: 61, column: 8, scope: !75)
!88 = !DILocation(line: 64, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !9, line: 62, column: 5)
!90 = !DILocation(line: 65, column: 5, scope: !89)
!91 = !DILocation(line: 69, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !9, line: 67, column: 5)
!93 = !DILocation(line: 69, column: 14, scope: !92)
!94 = !DILocation(line: 70, column: 9, scope: !92)
!95 = !DILocation(line: 70, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !9, line: 73, type: !42)
!97 = distinct !DILexicalBlock(scope: !75, file: !9, line: 72, column: 5)
!98 = !DILocation(line: 73, column: 14, scope: !97)
!99 = !DILocation(line: 74, column: 9, scope: !97)
!100 = !DILocation(line: 75, column: 9, scope: !97)
!101 = !DILocation(line: 75, column: 23, scope: !97)
!102 = !DILocation(line: 77, column: 9, scope: !97)
!103 = !DILocation(line: 78, column: 19, scope: !97)
!104 = !DILocation(line: 78, column: 9, scope: !97)
!105 = !DILocation(line: 80, column: 1, scope: !75)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!107 = !DILocalVariable(name: "data", scope: !106, file: !9, line: 85, type: !5)
!108 = !DILocation(line: 85, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !9, line: 86, type: !5)
!110 = !DILocation(line: 86, column: 12, scope: !106)
!111 = !DILocation(line: 86, column: 36, scope: !106)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !9, line: 87, type: !5)
!113 = !DILocation(line: 87, column: 12, scope: !106)
!114 = !DILocation(line: 87, column: 37, scope: !106)
!115 = !DILocation(line: 88, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !9, line: 88, column: 8)
!117 = !DILocation(line: 88, column: 18, scope: !116)
!118 = !DILocation(line: 88, column: 8, scope: !106)
!119 = !DILocation(line: 91, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !9, line: 89, column: 5)
!121 = !DILocation(line: 91, column: 14, scope: !120)
!122 = !DILocation(line: 92, column: 9, scope: !120)
!123 = !DILocation(line: 92, column: 17, scope: !120)
!124 = !DILocation(line: 93, column: 5, scope: !120)
!125 = !DILocalVariable(name: "source", scope: !126, file: !9, line: 95, type: !42)
!126 = distinct !DILexicalBlock(scope: !106, file: !9, line: 94, column: 5)
!127 = !DILocation(line: 95, column: 14, scope: !126)
!128 = !DILocation(line: 96, column: 9, scope: !126)
!129 = !DILocation(line: 97, column: 9, scope: !126)
!130 = !DILocation(line: 97, column: 23, scope: !126)
!131 = !DILocation(line: 99, column: 9, scope: !126)
!132 = !DILocation(line: 100, column: 19, scope: !126)
!133 = !DILocation(line: 100, column: 9, scope: !126)
!134 = !DILocation(line: 102, column: 1, scope: !106)
