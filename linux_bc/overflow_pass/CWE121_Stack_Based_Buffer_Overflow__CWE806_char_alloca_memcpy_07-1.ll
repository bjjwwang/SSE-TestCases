; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_bad() #0 !dbg !18 {
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
  %7 = load i8*, i8** %data, align 8, !dbg !46
  %call = call i64 @strlen(i8* %7) #7, !dbg !47
  %mul = mul i64 %call, 1, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %6, i64 %mul, i1 false), !dbg !44
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !49
  store i8 0, i8* %arrayidx1, align 1, !dbg !50
  %8 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* %8), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #8, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #8, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 100, align 16, !dbg !81
  store i8* %0, i8** %dataBuffer, align 8, !dbg !80
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !82
  store i8* %1, i8** %data, align 8, !dbg !83
  %2 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %2, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !99
  %6 = load i8*, i8** %data, align 8, !dbg !100
  %7 = load i8*, i8** %data, align 8, !dbg !101
  %call = call i64 @strlen(i8* %7) #7, !dbg !102
  %mul = mul i64 %call, 1, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %6, i64 %mul, i1 false), !dbg !99
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !104
  store i8 0, i8* %arrayidx1, align 1, !dbg !105
  %8 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %8), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 100, align 16, !dbg !114
  store i8* %0, i8** %dataBuffer, align 8, !dbg !113
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !115
  store i8* %1, i8** %data, align 8, !dbg !116
  %2 = load i32, i32* @staticFive, align 4, !dbg !117
  %cmp = icmp eq i32 %2, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 1 %3, i8 65, i64 49, i1 false), !dbg !123
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end, !dbg !126

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !130
  %6 = load i8*, i8** %data, align 8, !dbg !131
  %7 = load i8*, i8** %data, align 8, !dbg !132
  %call = call i64 @strlen(i8* %7) #7, !dbg !133
  %mul = mul i64 %call, 1, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %6, i64 %mul, i1 false), !dbg !130
  %arrayidx1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !135
  store i8 0, i8* %arrayidx1, align 1, !dbg !136
  %8 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* %8), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_bad", scope: !10, file: !10, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
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
!44 = !DILocation(line: 43, column: 9, scope: !39)
!45 = !DILocation(line: 43, column: 22, scope: !39)
!46 = !DILocation(line: 43, column: 35, scope: !39)
!47 = !DILocation(line: 43, column: 28, scope: !39)
!48 = !DILocation(line: 43, column: 40, scope: !39)
!49 = !DILocation(line: 44, column: 9, scope: !39)
!50 = !DILocation(line: 44, column: 20, scope: !39)
!51 = !DILocation(line: 45, column: 19, scope: !39)
!52 = !DILocation(line: 45, column: 9, scope: !39)
!53 = !DILocation(line: 47, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_good", scope: !10, file: !10, line: 100, type: !19, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DILocation(line: 102, column: 5, scope: !54)
!56 = !DILocation(line: 103, column: 5, scope: !54)
!57 = !DILocation(line: 104, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 116, type: !59, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !10, line: 116, type: !11)
!63 = !DILocation(line: 116, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !10, line: 116, type: !61)
!65 = !DILocation(line: 116, column: 27, scope: !58)
!66 = !DILocation(line: 119, column: 22, scope: !58)
!67 = !DILocation(line: 119, column: 12, scope: !58)
!68 = !DILocation(line: 119, column: 5, scope: !58)
!69 = !DILocation(line: 121, column: 5, scope: !58)
!70 = !DILocation(line: 122, column: 5, scope: !58)
!71 = !DILocation(line: 123, column: 5, scope: !58)
!72 = !DILocation(line: 126, column: 5, scope: !58)
!73 = !DILocation(line: 127, column: 5, scope: !58)
!74 = !DILocation(line: 128, column: 5, scope: !58)
!75 = !DILocation(line: 130, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!77 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 56, type: !6)
!78 = !DILocation(line: 56, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !10, line: 57, type: !6)
!80 = !DILocation(line: 57, column: 12, scope: !76)
!81 = !DILocation(line: 57, column: 33, scope: !76)
!82 = !DILocation(line: 58, column: 12, scope: !76)
!83 = !DILocation(line: 58, column: 10, scope: !76)
!84 = !DILocation(line: 59, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !76, file: !10, line: 59, column: 8)
!86 = !DILocation(line: 59, column: 18, scope: !85)
!87 = !DILocation(line: 59, column: 8, scope: !76)
!88 = !DILocation(line: 62, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !10, line: 60, column: 5)
!90 = !DILocation(line: 63, column: 5, scope: !89)
!91 = !DILocation(line: 67, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !10, line: 65, column: 5)
!93 = !DILocation(line: 67, column: 9, scope: !92)
!94 = !DILocation(line: 68, column: 9, scope: !92)
!95 = !DILocation(line: 68, column: 20, scope: !92)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !10, line: 71, type: !40)
!97 = distinct !DILexicalBlock(scope: !76, file: !10, line: 70, column: 5)
!98 = !DILocation(line: 71, column: 14, scope: !97)
!99 = !DILocation(line: 73, column: 9, scope: !97)
!100 = !DILocation(line: 73, column: 22, scope: !97)
!101 = !DILocation(line: 73, column: 35, scope: !97)
!102 = !DILocation(line: 73, column: 28, scope: !97)
!103 = !DILocation(line: 73, column: 40, scope: !97)
!104 = !DILocation(line: 74, column: 9, scope: !97)
!105 = !DILocation(line: 74, column: 20, scope: !97)
!106 = !DILocation(line: 75, column: 19, scope: !97)
!107 = !DILocation(line: 75, column: 9, scope: !97)
!108 = !DILocation(line: 77, column: 1, scope: !76)
!109 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 80, type: !19, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!110 = !DILocalVariable(name: "data", scope: !109, file: !10, line: 82, type: !6)
!111 = !DILocation(line: 82, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !10, line: 83, type: !6)
!113 = !DILocation(line: 83, column: 12, scope: !109)
!114 = !DILocation(line: 83, column: 33, scope: !109)
!115 = !DILocation(line: 84, column: 12, scope: !109)
!116 = !DILocation(line: 84, column: 10, scope: !109)
!117 = !DILocation(line: 85, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !109, file: !10, line: 85, column: 8)
!119 = !DILocation(line: 85, column: 18, scope: !118)
!120 = !DILocation(line: 85, column: 8, scope: !109)
!121 = !DILocation(line: 88, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !10, line: 86, column: 5)
!123 = !DILocation(line: 88, column: 9, scope: !122)
!124 = !DILocation(line: 89, column: 9, scope: !122)
!125 = !DILocation(line: 89, column: 20, scope: !122)
!126 = !DILocation(line: 90, column: 5, scope: !122)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !10, line: 92, type: !40)
!128 = distinct !DILexicalBlock(scope: !109, file: !10, line: 91, column: 5)
!129 = !DILocation(line: 92, column: 14, scope: !128)
!130 = !DILocation(line: 94, column: 9, scope: !128)
!131 = !DILocation(line: 94, column: 22, scope: !128)
!132 = !DILocation(line: 94, column: 35, scope: !128)
!133 = !DILocation(line: 94, column: 28, scope: !128)
!134 = !DILocation(line: 94, column: 40, scope: !128)
!135 = !DILocation(line: 95, column: 9, scope: !128)
!136 = !DILocation(line: 95, column: 20, scope: !128)
!137 = !DILocation(line: 96, column: 19, scope: !128)
!138 = !DILocation(line: 96, column: 9, scope: !128)
!139 = !DILocation(line: 98, column: 1, scope: !109)
