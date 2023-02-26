; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %0, i8** %dataBuffer, align 8, !dbg !24
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !26
  store i8* %1, i8** %data, align 8, !dbg !27
  %2 = load i32, i32* @staticFive, align 4, !dbg !28
  %cmp = icmp eq i32 %2, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 99, i1 false), !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  %call = call i8* @strcat(i8* %arraydecay, i8* %6) #5, !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* %7), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcat(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* null) #5, !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 %conv) #5, !dbg !64
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07_good(), !dbg !66
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07_bad(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 100, align 16, !dbg !77
  store i8* %0, i8** %dataBuffer, align 8, !dbg !76
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  store i8* %1, i8** %data, align 8, !dbg !79
  %2 = load i32, i32* @staticFive, align 4, !dbg !80
  %cmp = icmp ne i32 %2, 5, !dbg !82
  br i1 %cmp, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !96
  %call = call i8* @strcat(i8* %arraydecay, i8* %6) #5, !dbg !97
  %7 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* %7), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %0, i8** %dataBuffer, align 8, !dbg !105
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %1, i8** %data, align 8, !dbg !108
  %2 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp = icmp eq i32 %2, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !121
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !122
  %6 = load i8*, i8** %data, align 8, !dbg !123
  %call = call i8* @strcat(i8* %arraydecay, i8* %6) #5, !dbg !124
  %7 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* %7), !dbg !126
  ret void, !dbg !127
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !18, file: !10, line: 31, type: !6)
!22 = !DILocation(line: 31, column: 12, scope: !18)
!23 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !10, line: 32, type: !6)
!24 = !DILocation(line: 32, column: 12, scope: !18)
!25 = !DILocation(line: 32, column: 33, scope: !18)
!26 = !DILocation(line: 33, column: 12, scope: !18)
!27 = !DILocation(line: 33, column: 10, scope: !18)
!28 = !DILocation(line: 34, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !10, line: 34, column: 8)
!30 = !DILocation(line: 34, column: 18, scope: !29)
!31 = !DILocation(line: 34, column: 8, scope: !18)
!32 = !DILocation(line: 37, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 35, column: 5)
!34 = !DILocation(line: 37, column: 9, scope: !33)
!35 = !DILocation(line: 38, column: 9, scope: !33)
!36 = !DILocation(line: 38, column: 21, scope: !33)
!37 = !DILocation(line: 39, column: 5, scope: !33)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !18, file: !10, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 14, scope: !39)
!44 = !DILocation(line: 43, column: 16, scope: !39)
!45 = !DILocation(line: 43, column: 22, scope: !39)
!46 = !DILocation(line: 43, column: 9, scope: !39)
!47 = !DILocation(line: 44, column: 19, scope: !39)
!48 = !DILocation(line: 44, column: 9, scope: !39)
!49 = !DILocation(line: 46, column: 1, scope: !18)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_07_good", scope: !10, file: !10, line: 97, type: !19, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DILocation(line: 99, column: 5, scope: !50)
!52 = !DILocation(line: 100, column: 5, scope: !50)
!53 = !DILocation(line: 101, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 113, type: !55, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!11, !11, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !10, line: 113, type: !11)
!59 = !DILocation(line: 113, column: 14, scope: !54)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !10, line: 113, type: !57)
!61 = !DILocation(line: 113, column: 27, scope: !54)
!62 = !DILocation(line: 116, column: 22, scope: !54)
!63 = !DILocation(line: 116, column: 12, scope: !54)
!64 = !DILocation(line: 116, column: 5, scope: !54)
!65 = !DILocation(line: 118, column: 5, scope: !54)
!66 = !DILocation(line: 119, column: 5, scope: !54)
!67 = !DILocation(line: 120, column: 5, scope: !54)
!68 = !DILocation(line: 123, column: 5, scope: !54)
!69 = !DILocation(line: 124, column: 5, scope: !54)
!70 = !DILocation(line: 125, column: 5, scope: !54)
!71 = !DILocation(line: 127, column: 5, scope: !54)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 53, type: !19, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DILocalVariable(name: "data", scope: !72, file: !10, line: 55, type: !6)
!74 = !DILocation(line: 55, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !10, line: 56, type: !6)
!76 = !DILocation(line: 56, column: 12, scope: !72)
!77 = !DILocation(line: 56, column: 33, scope: !72)
!78 = !DILocation(line: 57, column: 12, scope: !72)
!79 = !DILocation(line: 57, column: 10, scope: !72)
!80 = !DILocation(line: 58, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !10, line: 58, column: 8)
!82 = !DILocation(line: 58, column: 18, scope: !81)
!83 = !DILocation(line: 58, column: 8, scope: !72)
!84 = !DILocation(line: 61, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !10, line: 59, column: 5)
!86 = !DILocation(line: 62, column: 5, scope: !85)
!87 = !DILocation(line: 66, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !10, line: 64, column: 5)
!89 = !DILocation(line: 66, column: 9, scope: !88)
!90 = !DILocation(line: 67, column: 9, scope: !88)
!91 = !DILocation(line: 67, column: 20, scope: !88)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !10, line: 70, type: !40)
!93 = distinct !DILexicalBlock(scope: !72, file: !10, line: 69, column: 5)
!94 = !DILocation(line: 70, column: 14, scope: !93)
!95 = !DILocation(line: 72, column: 16, scope: !93)
!96 = !DILocation(line: 72, column: 22, scope: !93)
!97 = !DILocation(line: 72, column: 9, scope: !93)
!98 = !DILocation(line: 73, column: 19, scope: !93)
!99 = !DILocation(line: 73, column: 9, scope: !93)
!100 = !DILocation(line: 75, column: 1, scope: !72)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 78, type: !19, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!102 = !DILocalVariable(name: "data", scope: !101, file: !10, line: 80, type: !6)
!103 = !DILocation(line: 80, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !10, line: 81, type: !6)
!105 = !DILocation(line: 81, column: 12, scope: !101)
!106 = !DILocation(line: 81, column: 33, scope: !101)
!107 = !DILocation(line: 82, column: 12, scope: !101)
!108 = !DILocation(line: 82, column: 10, scope: !101)
!109 = !DILocation(line: 83, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !10, line: 83, column: 8)
!111 = !DILocation(line: 83, column: 18, scope: !110)
!112 = !DILocation(line: 83, column: 8, scope: !101)
!113 = !DILocation(line: 86, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !10, line: 84, column: 5)
!115 = !DILocation(line: 86, column: 9, scope: !114)
!116 = !DILocation(line: 87, column: 9, scope: !114)
!117 = !DILocation(line: 87, column: 20, scope: !114)
!118 = !DILocation(line: 88, column: 5, scope: !114)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !10, line: 90, type: !40)
!120 = distinct !DILexicalBlock(scope: !101, file: !10, line: 89, column: 5)
!121 = !DILocation(line: 90, column: 14, scope: !120)
!122 = !DILocation(line: 92, column: 16, scope: !120)
!123 = !DILocation(line: 92, column: 22, scope: !120)
!124 = !DILocation(line: 92, column: 9, scope: !120)
!125 = !DILocation(line: 93, column: 19, scope: !120)
!126 = !DILocation(line: 93, column: 9, scope: !120)
!127 = !DILocation(line: 95, column: 1, scope: !101)
