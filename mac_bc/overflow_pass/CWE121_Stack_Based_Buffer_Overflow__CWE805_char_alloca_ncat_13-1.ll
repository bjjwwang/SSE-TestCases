; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !26
  %cmp = icmp eq i32 %2, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %3, i8** %data, align 8, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx1, align 1, !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !45
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !45
  %call = call i8* @__strncat_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %7) #5, !dbg !45
  %8 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* noundef %8), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 50, align 16, !dbg !77
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %1 = alloca i8, i64 100, align 16, !dbg !80
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !79
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !81
  %cmp = icmp ne i32 %2, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !88
  store i8* %3, i8** %data, align 8, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx1, align 1, !dbg !98
  %5 = load i8*, i8** %data, align 8, !dbg !99
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  %6 = load i8*, i8** %data, align 8, !dbg !99
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !99
  %call = call i8* @__strncat_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %7) #5, !dbg !99
  %8 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* noundef %8), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 50, align 16, !dbg !108
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %1 = alloca i8, i64 100, align 16, !dbg !111
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !110
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !112
  %cmp = icmp eq i32 %2, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  store i8* %3, i8** %data, align 8, !dbg !118
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end, !dbg !121

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !125
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !126
  store i8 0, i8* %arrayidx1, align 1, !dbg !127
  %5 = load i8*, i8** %data, align 8, !dbg !128
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  %6 = load i8*, i8** %data, align 8, !dbg !128
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !128
  %call = call i8* @__strncat_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %7) #5, !dbg !128
  %8 = load i8*, i8** %data, align 8, !dbg !129
  call void @printLine(i8* noundef %8), !dbg !130
  ret void, !dbg !131
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 25, scope: !27)
!29 = !DILocation(line: 28, column: 8, scope: !13)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 29, column: 5)
!32 = !DILocation(line: 32, column: 14, scope: !31)
!33 = !DILocation(line: 33, column: 9, scope: !31)
!34 = !DILocation(line: 33, column: 17, scope: !31)
!35 = !DILocation(line: 34, column: 5, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 36, type: !38)
!37 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 36, column: 14, scope: !37)
!42 = !DILocation(line: 37, column: 9, scope: !37)
!43 = !DILocation(line: 38, column: 9, scope: !37)
!44 = !DILocation(line: 38, column: 23, scope: !37)
!45 = !DILocation(line: 40, column: 9, scope: !37)
!46 = !DILocation(line: 41, column: 19, scope: !37)
!47 = !DILocation(line: 41, column: 9, scope: !37)
!48 = !DILocation(line: 43, column: 1, scope: !13)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncat_13_good", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DILocation(line: 100, column: 5, scope: !49)
!51 = !DILocation(line: 101, column: 5, scope: !49)
!52 = !DILocation(line: 102, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 114, type: !54, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 114, type: !56)
!59 = !DILocation(line: 114, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 114, type: !57)
!61 = !DILocation(line: 114, column: 27, scope: !53)
!62 = !DILocation(line: 117, column: 22, scope: !53)
!63 = !DILocation(line: 117, column: 12, scope: !53)
!64 = !DILocation(line: 117, column: 5, scope: !53)
!65 = !DILocation(line: 119, column: 5, scope: !53)
!66 = !DILocation(line: 120, column: 5, scope: !53)
!67 = !DILocation(line: 121, column: 5, scope: !53)
!68 = !DILocation(line: 124, column: 5, scope: !53)
!69 = !DILocation(line: 125, column: 5, scope: !53)
!70 = !DILocation(line: 126, column: 5, scope: !53)
!71 = !DILocation(line: 128, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 52, type: !3)
!74 = !DILocation(line: 52, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !14, line: 53, type: !3)
!76 = !DILocation(line: 53, column: 12, scope: !72)
!77 = !DILocation(line: 53, column: 36, scope: !72)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !14, line: 54, type: !3)
!79 = !DILocation(line: 54, column: 12, scope: !72)
!80 = !DILocation(line: 54, column: 37, scope: !72)
!81 = !DILocation(line: 55, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !14, line: 55, column: 8)
!83 = !DILocation(line: 55, column: 25, scope: !82)
!84 = !DILocation(line: 55, column: 8, scope: !72)
!85 = !DILocation(line: 58, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !14, line: 56, column: 5)
!87 = !DILocation(line: 59, column: 5, scope: !86)
!88 = !DILocation(line: 63, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !14, line: 61, column: 5)
!90 = !DILocation(line: 63, column: 14, scope: !89)
!91 = !DILocation(line: 64, column: 9, scope: !89)
!92 = !DILocation(line: 64, column: 17, scope: !89)
!93 = !DILocalVariable(name: "source", scope: !94, file: !14, line: 67, type: !38)
!94 = distinct !DILexicalBlock(scope: !72, file: !14, line: 66, column: 5)
!95 = !DILocation(line: 67, column: 14, scope: !94)
!96 = !DILocation(line: 68, column: 9, scope: !94)
!97 = !DILocation(line: 69, column: 9, scope: !94)
!98 = !DILocation(line: 69, column: 23, scope: !94)
!99 = !DILocation(line: 71, column: 9, scope: !94)
!100 = !DILocation(line: 72, column: 19, scope: !94)
!101 = !DILocation(line: 72, column: 9, scope: !94)
!102 = !DILocation(line: 74, column: 1, scope: !72)
!103 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 77, type: !15, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!104 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 79, type: !3)
!105 = !DILocation(line: 79, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !14, line: 80, type: !3)
!107 = !DILocation(line: 80, column: 12, scope: !103)
!108 = !DILocation(line: 80, column: 36, scope: !103)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !14, line: 81, type: !3)
!110 = !DILocation(line: 81, column: 12, scope: !103)
!111 = !DILocation(line: 81, column: 37, scope: !103)
!112 = !DILocation(line: 82, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !103, file: !14, line: 82, column: 8)
!114 = !DILocation(line: 82, column: 25, scope: !113)
!115 = !DILocation(line: 82, column: 8, scope: !103)
!116 = !DILocation(line: 85, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !14, line: 83, column: 5)
!118 = !DILocation(line: 85, column: 14, scope: !117)
!119 = !DILocation(line: 86, column: 9, scope: !117)
!120 = !DILocation(line: 86, column: 17, scope: !117)
!121 = !DILocation(line: 87, column: 5, scope: !117)
!122 = !DILocalVariable(name: "source", scope: !123, file: !14, line: 89, type: !38)
!123 = distinct !DILexicalBlock(scope: !103, file: !14, line: 88, column: 5)
!124 = !DILocation(line: 89, column: 14, scope: !123)
!125 = !DILocation(line: 90, column: 9, scope: !123)
!126 = !DILocation(line: 91, column: 9, scope: !123)
!127 = !DILocation(line: 91, column: 23, scope: !123)
!128 = !DILocation(line: 93, column: 9, scope: !123)
!129 = !DILocation(line: 94, column: 19, scope: !123)
!130 = !DILocation(line: 94, column: 9, scope: !123)
!131 = !DILocation(line: 96, column: 1, scope: !103)
