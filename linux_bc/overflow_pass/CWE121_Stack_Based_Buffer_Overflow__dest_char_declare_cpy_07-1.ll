; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i8* %arraydecay, i8** %data, align 8, !dbg !39
  %1 = load i8*, i8** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx2, align 1, !dbg !48
  %2 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay3) #5, !dbg !51
  %3 = load i8*, i8** %data, align 8, !dbg !52
  call void @printLine(i8* %3), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strcpy(i8*, i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_good() #0 !dbg !55 {
entry:
  call void @goodG2B1(), !dbg !56
  call void @goodG2B2(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* null) #5, !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 %conv) #5, !dbg !69
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_good(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_bad(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %0, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !91
  store i8* %arraydecay, i8** %data, align 8, !dbg !93
  %1 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx2, align 1, !dbg !101
  %2 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !103
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay3) #5, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* %3), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i32, i32* @staticFive, align 4, !dbg !115
  %cmp = icmp eq i32 %0, 5, !dbg !117
  br i1 %cmp, label %if.then, label %if.end, !dbg !118

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i8* %arraydecay, i8** %data, align 8, !dbg !121
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  br label %if.end, !dbg !124

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !128
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !129
  store i8 0, i8* %arrayidx2, align 1, !dbg !130
  %2 = load i8*, i8** %data, align 8, !dbg !131
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !132
  %call = call i8* @strcpy(i8* %2, i8* %arraydecay3) #5, !dbg !133
  %3 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* %3), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !16)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 50)
!27 = !DILocation(line: 32, column: 10, scope: !16)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 33, column: 10, scope: !16)
!33 = !DILocation(line: 34, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !16, file: !8, line: 34, column: 8)
!35 = !DILocation(line: 34, column: 18, scope: !34)
!36 = !DILocation(line: 34, column: 8, scope: !16)
!37 = !DILocation(line: 38, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !8, line: 35, column: 5)
!39 = !DILocation(line: 38, column: 14, scope: !38)
!40 = !DILocation(line: 39, column: 9, scope: !38)
!41 = !DILocation(line: 39, column: 17, scope: !38)
!42 = !DILocation(line: 40, column: 5, scope: !38)
!43 = !DILocalVariable(name: "source", scope: !44, file: !8, line: 42, type: !29)
!44 = distinct !DILexicalBlock(scope: !16, file: !8, line: 41, column: 5)
!45 = !DILocation(line: 42, column: 14, scope: !44)
!46 = !DILocation(line: 43, column: 9, scope: !44)
!47 = !DILocation(line: 44, column: 9, scope: !44)
!48 = !DILocation(line: 44, column: 23, scope: !44)
!49 = !DILocation(line: 46, column: 16, scope: !44)
!50 = !DILocation(line: 46, column: 22, scope: !44)
!51 = !DILocation(line: 46, column: 9, scope: !44)
!52 = !DILocation(line: 47, column: 19, scope: !44)
!53 = !DILocation(line: 47, column: 9, scope: !44)
!54 = !DILocation(line: 49, column: 1, scope: !16)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cpy_07_good", scope: !8, file: !8, line: 104, type: !17, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DILocation(line: 106, column: 5, scope: !55)
!57 = !DILocation(line: 107, column: 5, scope: !55)
!58 = !DILocation(line: 108, column: 1, scope: !55)
!59 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 120, type: !60, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!60 = !DISubroutineType(types: !61)
!61 = !{!9, !9, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !8, line: 120, type: !9)
!64 = !DILocation(line: 120, column: 14, scope: !59)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !8, line: 120, type: !62)
!66 = !DILocation(line: 120, column: 27, scope: !59)
!67 = !DILocation(line: 123, column: 22, scope: !59)
!68 = !DILocation(line: 123, column: 12, scope: !59)
!69 = !DILocation(line: 123, column: 5, scope: !59)
!70 = !DILocation(line: 125, column: 5, scope: !59)
!71 = !DILocation(line: 126, column: 5, scope: !59)
!72 = !DILocation(line: 127, column: 5, scope: !59)
!73 = !DILocation(line: 130, column: 5, scope: !59)
!74 = !DILocation(line: 131, column: 5, scope: !59)
!75 = !DILocation(line: 132, column: 5, scope: !59)
!76 = !DILocation(line: 134, column: 5, scope: !59)
!77 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 56, type: !17, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DILocalVariable(name: "data", scope: !77, file: !8, line: 58, type: !20)
!79 = !DILocation(line: 58, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBadBuffer", scope: !77, file: !8, line: 59, type: !24)
!81 = !DILocation(line: 59, column: 10, scope: !77)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !77, file: !8, line: 60, type: !29)
!83 = !DILocation(line: 60, column: 10, scope: !77)
!84 = !DILocation(line: 61, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !8, line: 61, column: 8)
!86 = !DILocation(line: 61, column: 18, scope: !85)
!87 = !DILocation(line: 61, column: 8, scope: !77)
!88 = !DILocation(line: 64, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !8, line: 62, column: 5)
!90 = !DILocation(line: 65, column: 5, scope: !89)
!91 = !DILocation(line: 69, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !8, line: 67, column: 5)
!93 = !DILocation(line: 69, column: 14, scope: !92)
!94 = !DILocation(line: 70, column: 9, scope: !92)
!95 = !DILocation(line: 70, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !8, line: 73, type: !29)
!97 = distinct !DILexicalBlock(scope: !77, file: !8, line: 72, column: 5)
!98 = !DILocation(line: 73, column: 14, scope: !97)
!99 = !DILocation(line: 74, column: 9, scope: !97)
!100 = !DILocation(line: 75, column: 9, scope: !97)
!101 = !DILocation(line: 75, column: 23, scope: !97)
!102 = !DILocation(line: 77, column: 16, scope: !97)
!103 = !DILocation(line: 77, column: 22, scope: !97)
!104 = !DILocation(line: 77, column: 9, scope: !97)
!105 = !DILocation(line: 78, column: 19, scope: !97)
!106 = !DILocation(line: 78, column: 9, scope: !97)
!107 = !DILocation(line: 80, column: 1, scope: !77)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 83, type: !17, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!109 = !DILocalVariable(name: "data", scope: !108, file: !8, line: 85, type: !20)
!110 = !DILocation(line: 85, column: 12, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !8, line: 86, type: !24)
!112 = !DILocation(line: 86, column: 10, scope: !108)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !8, line: 87, type: !29)
!114 = !DILocation(line: 87, column: 10, scope: !108)
!115 = !DILocation(line: 88, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !8, line: 88, column: 8)
!117 = !DILocation(line: 88, column: 18, scope: !116)
!118 = !DILocation(line: 88, column: 8, scope: !108)
!119 = !DILocation(line: 91, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !8, line: 89, column: 5)
!121 = !DILocation(line: 91, column: 14, scope: !120)
!122 = !DILocation(line: 92, column: 9, scope: !120)
!123 = !DILocation(line: 92, column: 17, scope: !120)
!124 = !DILocation(line: 93, column: 5, scope: !120)
!125 = !DILocalVariable(name: "source", scope: !126, file: !8, line: 95, type: !29)
!126 = distinct !DILexicalBlock(scope: !108, file: !8, line: 94, column: 5)
!127 = !DILocation(line: 95, column: 14, scope: !126)
!128 = !DILocation(line: 96, column: 9, scope: !126)
!129 = !DILocation(line: 97, column: 9, scope: !126)
!130 = !DILocation(line: 97, column: 23, scope: !126)
!131 = !DILocation(line: 99, column: 16, scope: !126)
!132 = !DILocation(line: 99, column: 22, scope: !126)
!133 = !DILocation(line: 99, column: 9, scope: !126)
!134 = !DILocation(line: 100, column: 19, scope: !126)
!135 = !DILocation(line: 100, column: 9, scope: !126)
!136 = !DILocation(line: 102, column: 1, scope: !108)
