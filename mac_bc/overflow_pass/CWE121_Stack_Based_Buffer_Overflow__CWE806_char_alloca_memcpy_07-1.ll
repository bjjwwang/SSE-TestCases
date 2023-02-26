; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 100, align 16, !dbg !26
  store i8* %0, i8** %dataBuffer, align 8, !dbg !25
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !27
  store i8* %1, i8** %data, align 8, !dbg !28
  %2 = load i32, i32* @staticFive, align 4, !dbg !29
  %cmp = icmp eq i32 %2, 5, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !33
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 99, i64 noundef %5) #5, !dbg !33
  %6 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %8 = load i8*, i8** %data, align 8, !dbg !44
  %9 = load i8*, i8** %data, align 8, !dbg !44
  %call1 = call i64 @strlen(i8* noundef %9), !dbg !44
  %mul = mul i64 %call1, 1, !dbg !44
  %call2 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %mul, i64 noundef 50) #5, !dbg !44
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  %10 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* noundef %10), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
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
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !87
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !87
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !87
  %6 = load i8*, i8** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !89
  store i8 0, i8* %arrayidx, align 1, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !91, metadata !DIExpression()), !dbg !93
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !93
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !94
  %8 = load i8*, i8** %data, align 8, !dbg !94
  %9 = load i8*, i8** %data, align 8, !dbg !94
  %call1 = call i64 @strlen(i8* noundef %9), !dbg !94
  %mul = mul i64 %call1, 1, !dbg !94
  %call2 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %mul, i64 noundef 50) #5, !dbg !94
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !95
  store i8 0, i8* %arrayidx3, align 1, !dbg !96
  %10 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* noundef %10), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 100, align 16, !dbg !105
  store i8* %0, i8** %dataBuffer, align 8, !dbg !104
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !106
  store i8* %1, i8** %data, align 8, !dbg !107
  %2 = load i32, i32* @staticFive, align 4, !dbg !108
  %cmp = icmp eq i32 %2, 5, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !112
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !112
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !112
  %6 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !120
  %8 = load i8*, i8** %data, align 8, !dbg !120
  %9 = load i8*, i8** %data, align 8, !dbg !120
  %call1 = call i64 @strlen(i8* noundef %9), !dbg !120
  %mul = mul i64 %call1, 1, !dbg !120
  %call2 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %mul, i64 noundef 50) #5, !dbg !120
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !121
  store i8 0, i8* %arrayidx3, align 1, !dbg !122
  %10 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* noundef %10), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_bad", scope: !9, file: !9, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 31, type: !5)
!23 = !DILocation(line: 31, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataBuffer", scope: !18, file: !9, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !18)
!26 = !DILocation(line: 32, column: 33, scope: !18)
!27 = !DILocation(line: 33, column: 12, scope: !18)
!28 = !DILocation(line: 33, column: 10, scope: !18)
!29 = !DILocation(line: 34, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !9, line: 34, column: 8)
!31 = !DILocation(line: 34, column: 18, scope: !30)
!32 = !DILocation(line: 34, column: 8, scope: !18)
!33 = !DILocation(line: 37, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !9, line: 35, column: 5)
!35 = !DILocation(line: 38, column: 9, scope: !34)
!36 = !DILocation(line: 38, column: 21, scope: !34)
!37 = !DILocation(line: 39, column: 5, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !9, line: 41, type: !40)
!39 = distinct !DILexicalBlock(scope: !18, file: !9, line: 40, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 41, column: 14, scope: !39)
!44 = !DILocation(line: 43, column: 9, scope: !39)
!45 = !DILocation(line: 44, column: 9, scope: !39)
!46 = !DILocation(line: 44, column: 20, scope: !39)
!47 = !DILocation(line: 45, column: 19, scope: !39)
!48 = !DILocation(line: 45, column: 9, scope: !39)
!49 = !DILocation(line: 47, column: 1, scope: !18)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_07_good", scope: !9, file: !9, line: 100, type: !19, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!51 = !DILocation(line: 102, column: 5, scope: !50)
!52 = !DILocation(line: 103, column: 5, scope: !50)
!53 = !DILocation(line: 104, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 116, type: !55, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!55 = !DISubroutineType(types: !56)
!56 = !{!10, !10, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !9, line: 116, type: !10)
!59 = !DILocation(line: 116, column: 14, scope: !54)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !9, line: 116, type: !57)
!61 = !DILocation(line: 116, column: 27, scope: !54)
!62 = !DILocation(line: 119, column: 22, scope: !54)
!63 = !DILocation(line: 119, column: 12, scope: !54)
!64 = !DILocation(line: 119, column: 5, scope: !54)
!65 = !DILocation(line: 121, column: 5, scope: !54)
!66 = !DILocation(line: 122, column: 5, scope: !54)
!67 = !DILocation(line: 123, column: 5, scope: !54)
!68 = !DILocation(line: 126, column: 5, scope: !54)
!69 = !DILocation(line: 127, column: 5, scope: !54)
!70 = !DILocation(line: 128, column: 5, scope: !54)
!71 = !DILocation(line: 130, column: 5, scope: !54)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!73 = !DILocalVariable(name: "data", scope: !72, file: !9, line: 56, type: !5)
!74 = !DILocation(line: 56, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !9, line: 57, type: !5)
!76 = !DILocation(line: 57, column: 12, scope: !72)
!77 = !DILocation(line: 57, column: 33, scope: !72)
!78 = !DILocation(line: 58, column: 12, scope: !72)
!79 = !DILocation(line: 58, column: 10, scope: !72)
!80 = !DILocation(line: 59, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !9, line: 59, column: 8)
!82 = !DILocation(line: 59, column: 18, scope: !81)
!83 = !DILocation(line: 59, column: 8, scope: !72)
!84 = !DILocation(line: 62, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !9, line: 60, column: 5)
!86 = !DILocation(line: 63, column: 5, scope: !85)
!87 = !DILocation(line: 67, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !9, line: 65, column: 5)
!89 = !DILocation(line: 68, column: 9, scope: !88)
!90 = !DILocation(line: 68, column: 20, scope: !88)
!91 = !DILocalVariable(name: "dest", scope: !92, file: !9, line: 71, type: !40)
!92 = distinct !DILexicalBlock(scope: !72, file: !9, line: 70, column: 5)
!93 = !DILocation(line: 71, column: 14, scope: !92)
!94 = !DILocation(line: 73, column: 9, scope: !92)
!95 = !DILocation(line: 74, column: 9, scope: !92)
!96 = !DILocation(line: 74, column: 20, scope: !92)
!97 = !DILocation(line: 75, column: 19, scope: !92)
!98 = !DILocation(line: 75, column: 9, scope: !92)
!99 = !DILocation(line: 77, column: 1, scope: !72)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 80, type: !19, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!101 = !DILocalVariable(name: "data", scope: !100, file: !9, line: 82, type: !5)
!102 = !DILocation(line: 82, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBuffer", scope: !100, file: !9, line: 83, type: !5)
!104 = !DILocation(line: 83, column: 12, scope: !100)
!105 = !DILocation(line: 83, column: 33, scope: !100)
!106 = !DILocation(line: 84, column: 12, scope: !100)
!107 = !DILocation(line: 84, column: 10, scope: !100)
!108 = !DILocation(line: 85, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !100, file: !9, line: 85, column: 8)
!110 = !DILocation(line: 85, column: 18, scope: !109)
!111 = !DILocation(line: 85, column: 8, scope: !100)
!112 = !DILocation(line: 88, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !9, line: 86, column: 5)
!114 = !DILocation(line: 89, column: 9, scope: !113)
!115 = !DILocation(line: 89, column: 20, scope: !113)
!116 = !DILocation(line: 90, column: 5, scope: !113)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !9, line: 92, type: !40)
!118 = distinct !DILexicalBlock(scope: !100, file: !9, line: 91, column: 5)
!119 = !DILocation(line: 92, column: 14, scope: !118)
!120 = !DILocation(line: 94, column: 9, scope: !118)
!121 = !DILocation(line: 95, column: 9, scope: !118)
!122 = !DILocation(line: 95, column: 20, scope: !118)
!123 = !DILocation(line: 96, column: 19, scope: !118)
!124 = !DILocation(line: 96, column: 9, scope: !118)
!125 = !DILocation(line: 98, column: 1, scope: !100)
