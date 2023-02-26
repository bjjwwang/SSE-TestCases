; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp1 = icmp eq i32 %1, 5, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !36

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !37
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !37
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #9, !dbg !37
  %5 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %if.end4, !dbg !41

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !47
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !47
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !48
  %7 = load i8*, i8** %data, align 8, !dbg !48
  %call5 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !48
  %8 = load i8*, i8** %data, align 8, !dbg !49
  call void @printLine(i8* noundef %8), !dbg !50
  %9 = load i8*, i8** %data, align 8, !dbg !51
  call void @free(i8* noundef %9), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #4

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  %cmp = icmp eq i8* %0, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !87
  %cmp1 = icmp ne i32 %1, 5, !dbg !89
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !90

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  br label %if.end4, !dbg !93

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !94
  %3 = load i8*, i8** %data, align 8, !dbg !94
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !94
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !94
  %5 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !98, metadata !DIExpression()), !dbg !100
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !100
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !101
  %7 = load i8*, i8** %data, align 8, !dbg !101
  %call5 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !101
  %8 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* noundef %8), !dbg !103
  %9 = load i8*, i8** %data, align 8, !dbg !104
  call void @free(i8* noundef %9), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !110
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !118
  %cmp1 = icmp eq i32 %1, 5, !dbg !120
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !121

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !122
  %3 = load i8*, i8** %data, align 8, !dbg !122
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !122
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !122
  %5 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end4, !dbg !126

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !130
  %7 = load i8*, i8** %data, align 8, !dbg !130
  %call5 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !130
  %8 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* noundef %8), !dbg !132
  %9 = load i8*, i8** %data, align 8, !dbg !133
  call void @free(i8* noundef %9), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !10, line: 25, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_bad", scope: !10, file: !10, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !10, line: 31, type: !5)
!24 = !DILocation(line: 31, column: 12, scope: !19)
!25 = !DILocation(line: 32, column: 20, scope: !19)
!26 = !DILocation(line: 32, column: 10, scope: !19)
!27 = !DILocation(line: 33, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !19, file: !10, line: 33, column: 9)
!29 = !DILocation(line: 33, column: 14, scope: !28)
!30 = !DILocation(line: 33, column: 9, scope: !19)
!31 = !DILocation(line: 33, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 33, column: 23)
!33 = !DILocation(line: 34, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !10, line: 34, column: 8)
!35 = !DILocation(line: 34, column: 18, scope: !34)
!36 = !DILocation(line: 34, column: 8, scope: !19)
!37 = !DILocation(line: 37, column: 9, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 35, column: 5)
!39 = !DILocation(line: 38, column: 9, scope: !38)
!40 = !DILocation(line: 38, column: 21, scope: !38)
!41 = !DILocation(line: 39, column: 5, scope: !38)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !10, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !10, line: 40, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 50)
!47 = !DILocation(line: 41, column: 14, scope: !43)
!48 = !DILocation(line: 43, column: 9, scope: !43)
!49 = !DILocation(line: 44, column: 19, scope: !43)
!50 = !DILocation(line: 44, column: 9, scope: !43)
!51 = !DILocation(line: 45, column: 14, scope: !43)
!52 = !DILocation(line: 45, column: 9, scope: !43)
!53 = !DILocation(line: 47, column: 1, scope: !19)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_07_good", scope: !10, file: !10, line: 100, type: !20, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!55 = !DILocation(line: 102, column: 5, scope: !54)
!56 = !DILocation(line: 103, column: 5, scope: !54)
!57 = !DILocation(line: 104, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 116, type: !59, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!59 = !DISubroutineType(types: !60)
!60 = !{!11, !11, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
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
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!77 = !DILocalVariable(name: "data", scope: !76, file: !10, line: 56, type: !5)
!78 = !DILocation(line: 56, column: 12, scope: !76)
!79 = !DILocation(line: 57, column: 20, scope: !76)
!80 = !DILocation(line: 57, column: 10, scope: !76)
!81 = !DILocation(line: 58, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !10, line: 58, column: 9)
!83 = !DILocation(line: 58, column: 14, scope: !82)
!84 = !DILocation(line: 58, column: 9, scope: !76)
!85 = !DILocation(line: 58, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !10, line: 58, column: 23)
!87 = !DILocation(line: 59, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !76, file: !10, line: 59, column: 8)
!89 = !DILocation(line: 59, column: 18, scope: !88)
!90 = !DILocation(line: 59, column: 8, scope: !76)
!91 = !DILocation(line: 62, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !10, line: 60, column: 5)
!93 = !DILocation(line: 63, column: 5, scope: !92)
!94 = !DILocation(line: 67, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !10, line: 65, column: 5)
!96 = !DILocation(line: 68, column: 9, scope: !95)
!97 = !DILocation(line: 68, column: 20, scope: !95)
!98 = !DILocalVariable(name: "dest", scope: !99, file: !10, line: 71, type: !44)
!99 = distinct !DILexicalBlock(scope: !76, file: !10, line: 70, column: 5)
!100 = !DILocation(line: 71, column: 14, scope: !99)
!101 = !DILocation(line: 73, column: 9, scope: !99)
!102 = !DILocation(line: 74, column: 19, scope: !99)
!103 = !DILocation(line: 74, column: 9, scope: !99)
!104 = !DILocation(line: 75, column: 14, scope: !99)
!105 = !DILocation(line: 75, column: 9, scope: !99)
!106 = !DILocation(line: 77, column: 1, scope: !76)
!107 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!108 = !DILocalVariable(name: "data", scope: !107, file: !10, line: 82, type: !5)
!109 = !DILocation(line: 82, column: 12, scope: !107)
!110 = !DILocation(line: 83, column: 20, scope: !107)
!111 = !DILocation(line: 83, column: 10, scope: !107)
!112 = !DILocation(line: 84, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !10, line: 84, column: 9)
!114 = !DILocation(line: 84, column: 14, scope: !113)
!115 = !DILocation(line: 84, column: 9, scope: !107)
!116 = !DILocation(line: 84, column: 24, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !10, line: 84, column: 23)
!118 = !DILocation(line: 85, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !107, file: !10, line: 85, column: 8)
!120 = !DILocation(line: 85, column: 18, scope: !119)
!121 = !DILocation(line: 85, column: 8, scope: !107)
!122 = !DILocation(line: 88, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !10, line: 86, column: 5)
!124 = !DILocation(line: 89, column: 9, scope: !123)
!125 = !DILocation(line: 89, column: 20, scope: !123)
!126 = !DILocation(line: 90, column: 5, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !10, line: 92, type: !44)
!128 = distinct !DILexicalBlock(scope: !107, file: !10, line: 91, column: 5)
!129 = !DILocation(line: 92, column: 14, scope: !128)
!130 = !DILocation(line: 94, column: 9, scope: !128)
!131 = !DILocation(line: 95, column: 19, scope: !128)
!132 = !DILocation(line: 95, column: 9, scope: !128)
!133 = !DILocation(line: 96, column: 14, scope: !128)
!134 = !DILocation(line: 96, column: 9, scope: !128)
!135 = !DILocation(line: 98, column: 1, scope: !107)
