; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx1, align 4, !dbg !51
  %7 = load i32*, i32** %data, align 8, !dbg !52
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call3 = call i32* @wcsncpy(i32* noundef %7, i32* noundef %arraydecay2, i64 noundef 99), !dbg !54
  %8 = load i32*, i32** %data, align 8, !dbg !55
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !55
  store i32 0, i32* %arrayidx4, align 4, !dbg !56
  %9 = load i32*, i32** %data, align 8, !dbg !57
  call void @printWLine(i32* noundef %9), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcsncpy(i32* noundef, i32* noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* noundef null), !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 noundef %conv), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 200, align 16, !dbg !89
  %1 = bitcast i8* %0 to i32*, !dbg !90
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = alloca i8, i64 400, align 16, !dbg !93
  %3 = bitcast i8* %2 to i32*, !dbg !94
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !92
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !95
  %cmp = icmp ne i32 %4, 5, !dbg !97
  br i1 %cmp, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end, !dbg !101

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !102
  store i32* %5, i32** %data, align 8, !dbg !104
  %6 = load i32*, i32** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !110
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !111
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx1, align 4, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %call3 = call i32* @wcsncpy(i32* noundef %7, i32* noundef %arraydecay2, i64 noundef 99), !dbg !116
  %8 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !117
  store i32 0, i32* %arrayidx4, align 4, !dbg !118
  %9 = load i32*, i32** %data, align 8, !dbg !119
  call void @printWLine(i32* noundef %9), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !122 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = alloca i8, i64 200, align 16, !dbg !127
  %1 = bitcast i8* %0 to i32*, !dbg !128
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %2 = alloca i8, i64 400, align 16, !dbg !131
  %3 = bitcast i8* %2 to i32*, !dbg !132
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !130
  %4 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !133
  %cmp = icmp eq i32 %4, 5, !dbg !135
  br i1 %cmp, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !137
  store i32* %5, i32** %data, align 8, !dbg !139
  %6 = load i32*, i32** %data, align 8, !dbg !140
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !140
  store i32 0, i32* %arrayidx, align 4, !dbg !141
  br label %if.end, !dbg !142

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !143, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !146
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !147
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx1, align 4, !dbg !149
  %7 = load i32*, i32** %data, align 8, !dbg !150
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !151
  %call3 = call i32* @wcsncpy(i32* noundef %7, i32* noundef %arraydecay2, i64 noundef 99), !dbg !152
  %8 = load i32*, i32** %data, align 8, !dbg !153
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !153
  store i32 0, i32* %arrayidx4, align 4, !dbg !154
  %9 = load i32*, i32** %data, align 8, !dbg !155
  call void @printWLine(i32* noundef %9), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 42, scope: !17)
!27 = !DILocation(line: 26, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !3)
!29 = !DILocation(line: 27, column: 15, scope: !17)
!30 = !DILocation(line: 27, column: 43, scope: !17)
!31 = !DILocation(line: 27, column: 32, scope: !17)
!32 = !DILocation(line: 28, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 8)
!34 = !DILocation(line: 28, column: 25, scope: !33)
!35 = !DILocation(line: 28, column: 8, scope: !17)
!36 = !DILocation(line: 32, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !18, line: 29, column: 5)
!38 = !DILocation(line: 32, column: 14, scope: !37)
!39 = !DILocation(line: 33, column: 9, scope: !37)
!40 = !DILocation(line: 33, column: 17, scope: !37)
!41 = !DILocation(line: 34, column: 5, scope: !37)
!42 = !DILocalVariable(name: "source", scope: !43, file: !18, line: 36, type: !44)
!43 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 36, column: 17, scope: !43)
!48 = !DILocation(line: 37, column: 17, scope: !43)
!49 = !DILocation(line: 37, column: 9, scope: !43)
!50 = !DILocation(line: 38, column: 9, scope: !43)
!51 = !DILocation(line: 38, column: 23, scope: !43)
!52 = !DILocation(line: 40, column: 17, scope: !43)
!53 = !DILocation(line: 40, column: 23, scope: !43)
!54 = !DILocation(line: 40, column: 9, scope: !43)
!55 = !DILocation(line: 41, column: 9, scope: !43)
!56 = !DILocation(line: 41, column: 21, scope: !43)
!57 = !DILocation(line: 42, column: 20, scope: !43)
!58 = !DILocation(line: 42, column: 9, scope: !43)
!59 = !DILocation(line: 44, column: 1, scope: !17)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_ncpy_13_good", scope: !18, file: !18, line: 101, type: !19, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!61 = !DILocation(line: 103, column: 5, scope: !60)
!62 = !DILocation(line: 104, column: 5, scope: !60)
!63 = !DILocation(line: 105, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 117, type: !65, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DISubroutineType(types: !66)
!66 = !{!8, !8, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !18, line: 117, type: !8)
!71 = !DILocation(line: 117, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !18, line: 117, type: !67)
!73 = !DILocation(line: 117, column: 27, scope: !64)
!74 = !DILocation(line: 120, column: 22, scope: !64)
!75 = !DILocation(line: 120, column: 12, scope: !64)
!76 = !DILocation(line: 120, column: 5, scope: !64)
!77 = !DILocation(line: 122, column: 5, scope: !64)
!78 = !DILocation(line: 123, column: 5, scope: !64)
!79 = !DILocation(line: 124, column: 5, scope: !64)
!80 = !DILocation(line: 127, column: 5, scope: !64)
!81 = !DILocation(line: 128, column: 5, scope: !64)
!82 = !DILocation(line: 129, column: 5, scope: !64)
!83 = !DILocation(line: 131, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 51, type: !19, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!85 = !DILocalVariable(name: "data", scope: !84, file: !18, line: 53, type: !3)
!86 = !DILocation(line: 53, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !18, line: 54, type: !3)
!88 = !DILocation(line: 54, column: 15, scope: !84)
!89 = !DILocation(line: 54, column: 42, scope: !84)
!90 = !DILocation(line: 54, column: 31, scope: !84)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !18, line: 55, type: !3)
!92 = !DILocation(line: 55, column: 15, scope: !84)
!93 = !DILocation(line: 55, column: 43, scope: !84)
!94 = !DILocation(line: 55, column: 32, scope: !84)
!95 = !DILocation(line: 56, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !84, file: !18, line: 56, column: 8)
!97 = !DILocation(line: 56, column: 25, scope: !96)
!98 = !DILocation(line: 56, column: 8, scope: !84)
!99 = !DILocation(line: 59, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !18, line: 57, column: 5)
!101 = !DILocation(line: 60, column: 5, scope: !100)
!102 = !DILocation(line: 64, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !18, line: 62, column: 5)
!104 = !DILocation(line: 64, column: 14, scope: !103)
!105 = !DILocation(line: 65, column: 9, scope: !103)
!106 = !DILocation(line: 65, column: 17, scope: !103)
!107 = !DILocalVariable(name: "source", scope: !108, file: !18, line: 68, type: !44)
!108 = distinct !DILexicalBlock(scope: !84, file: !18, line: 67, column: 5)
!109 = !DILocation(line: 68, column: 17, scope: !108)
!110 = !DILocation(line: 69, column: 17, scope: !108)
!111 = !DILocation(line: 69, column: 9, scope: !108)
!112 = !DILocation(line: 70, column: 9, scope: !108)
!113 = !DILocation(line: 70, column: 23, scope: !108)
!114 = !DILocation(line: 72, column: 17, scope: !108)
!115 = !DILocation(line: 72, column: 23, scope: !108)
!116 = !DILocation(line: 72, column: 9, scope: !108)
!117 = !DILocation(line: 73, column: 9, scope: !108)
!118 = !DILocation(line: 73, column: 21, scope: !108)
!119 = !DILocation(line: 74, column: 20, scope: !108)
!120 = !DILocation(line: 74, column: 9, scope: !108)
!121 = !DILocation(line: 76, column: 1, scope: !84)
!122 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 79, type: !19, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!123 = !DILocalVariable(name: "data", scope: !122, file: !18, line: 81, type: !3)
!124 = !DILocation(line: 81, column: 15, scope: !122)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !122, file: !18, line: 82, type: !3)
!126 = !DILocation(line: 82, column: 15, scope: !122)
!127 = !DILocation(line: 82, column: 42, scope: !122)
!128 = !DILocation(line: 82, column: 31, scope: !122)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !122, file: !18, line: 83, type: !3)
!130 = !DILocation(line: 83, column: 15, scope: !122)
!131 = !DILocation(line: 83, column: 43, scope: !122)
!132 = !DILocation(line: 83, column: 32, scope: !122)
!133 = !DILocation(line: 84, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !122, file: !18, line: 84, column: 8)
!135 = !DILocation(line: 84, column: 25, scope: !134)
!136 = !DILocation(line: 84, column: 8, scope: !122)
!137 = !DILocation(line: 87, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !18, line: 85, column: 5)
!139 = !DILocation(line: 87, column: 14, scope: !138)
!140 = !DILocation(line: 88, column: 9, scope: !138)
!141 = !DILocation(line: 88, column: 17, scope: !138)
!142 = !DILocation(line: 89, column: 5, scope: !138)
!143 = !DILocalVariable(name: "source", scope: !144, file: !18, line: 91, type: !44)
!144 = distinct !DILexicalBlock(scope: !122, file: !18, line: 90, column: 5)
!145 = !DILocation(line: 91, column: 17, scope: !144)
!146 = !DILocation(line: 92, column: 17, scope: !144)
!147 = !DILocation(line: 92, column: 9, scope: !144)
!148 = !DILocation(line: 93, column: 9, scope: !144)
!149 = !DILocation(line: 93, column: 23, scope: !144)
!150 = !DILocation(line: 95, column: 17, scope: !144)
!151 = !DILocation(line: 95, column: 23, scope: !144)
!152 = !DILocation(line: 95, column: 9, scope: !144)
!153 = !DILocation(line: 96, column: 9, scope: !144)
!154 = !DILocation(line: 96, column: 21, scope: !144)
!155 = !DILocation(line: 97, column: 20, scope: !144)
!156 = !DILocation(line: 97, column: 9, scope: !144)
!157 = !DILocation(line: 99, column: 1, scope: !122)
