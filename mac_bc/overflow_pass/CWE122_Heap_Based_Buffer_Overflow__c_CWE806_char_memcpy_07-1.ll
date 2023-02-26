; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07_bad() #0 !dbg !19 {
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
  %8 = load i8*, i8** %data, align 8, !dbg !48
  %call5 = call i64 @strlen(i8* noundef %8), !dbg !48
  %mul = mul i64 %call5, 1, !dbg !48
  %call6 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !48
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !49
  store i8 0, i8* %arrayidx7, align 1, !dbg !50
  %9 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* noundef %9), !dbg !52
  %10 = load i8*, i8** %data, align 8, !dbg !53
  call void @free(i8* noundef %10), !dbg !54
  ret void, !dbg !55
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !89
  %cmp1 = icmp ne i32 %1, 5, !dbg !91
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !92

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !93
  br label %if.end4, !dbg !95

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !96
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !96
  %5 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %7 = load i8*, i8** %data, align 8, !dbg !103
  %8 = load i8*, i8** %data, align 8, !dbg !103
  %call5 = call i64 @strlen(i8* noundef %8), !dbg !103
  %mul = mul i64 %call5, 1, !dbg !103
  %call6 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !103
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !104
  store i8 0, i8* %arrayidx7, align 1, !dbg !105
  %9 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* noundef %9), !dbg !107
  %10 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* noundef %10), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !114
  store i8* %call, i8** %data, align 8, !dbg !115
  %0 = load i8*, i8** %data, align 8, !dbg !116
  %cmp = icmp eq i8* %0, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !122
  %cmp1 = icmp eq i32 %1, 5, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !125

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !126
  %3 = load i8*, i8** %data, align 8, !dbg !126
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !126
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !126
  %5 = load i8*, i8** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  br label %if.end4, !dbg !130

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !131, metadata !DIExpression()), !dbg !133
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !133
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !134
  %7 = load i8*, i8** %data, align 8, !dbg !134
  %8 = load i8*, i8** %data, align 8, !dbg !134
  %call5 = call i64 @strlen(i8* noundef %8), !dbg !134
  %mul = mul i64 %call5, 1, !dbg !134
  %call6 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #9, !dbg !134
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !135
  store i8 0, i8* %arrayidx7, align 1, !dbg !136
  %9 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* noundef %9), !dbg !138
  %10 = load i8*, i8** %data, align 8, !dbg !139
  call void @free(i8* noundef %10), !dbg !140
  ret void, !dbg !141
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
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0}
!10 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07_bad", scope: !10, file: !10, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
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
!49 = !DILocation(line: 44, column: 9, scope: !43)
!50 = !DILocation(line: 44, column: 20, scope: !43)
!51 = !DILocation(line: 45, column: 19, scope: !43)
!52 = !DILocation(line: 45, column: 9, scope: !43)
!53 = !DILocation(line: 46, column: 14, scope: !43)
!54 = !DILocation(line: 46, column: 9, scope: !43)
!55 = !DILocation(line: 48, column: 1, scope: !19)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_07_good", scope: !10, file: !10, line: 103, type: !20, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!57 = !DILocation(line: 105, column: 5, scope: !56)
!58 = !DILocation(line: 106, column: 5, scope: !56)
!59 = !DILocation(line: 107, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 119, type: !61, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!61 = !DISubroutineType(types: !62)
!62 = !{!11, !11, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !10, line: 119, type: !11)
!65 = !DILocation(line: 119, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !10, line: 119, type: !63)
!67 = !DILocation(line: 119, column: 27, scope: !60)
!68 = !DILocation(line: 122, column: 22, scope: !60)
!69 = !DILocation(line: 122, column: 12, scope: !60)
!70 = !DILocation(line: 122, column: 5, scope: !60)
!71 = !DILocation(line: 124, column: 5, scope: !60)
!72 = !DILocation(line: 125, column: 5, scope: !60)
!73 = !DILocation(line: 126, column: 5, scope: !60)
!74 = !DILocation(line: 129, column: 5, scope: !60)
!75 = !DILocation(line: 130, column: 5, scope: !60)
!76 = !DILocation(line: 131, column: 5, scope: !60)
!77 = !DILocation(line: 133, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !10, file: !10, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!79 = !DILocalVariable(name: "data", scope: !78, file: !10, line: 57, type: !5)
!80 = !DILocation(line: 57, column: 12, scope: !78)
!81 = !DILocation(line: 58, column: 20, scope: !78)
!82 = !DILocation(line: 58, column: 10, scope: !78)
!83 = !DILocation(line: 59, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !10, line: 59, column: 9)
!85 = !DILocation(line: 59, column: 14, scope: !84)
!86 = !DILocation(line: 59, column: 9, scope: !78)
!87 = !DILocation(line: 59, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !10, line: 59, column: 23)
!89 = !DILocation(line: 60, column: 8, scope: !90)
!90 = distinct !DILexicalBlock(scope: !78, file: !10, line: 60, column: 8)
!91 = !DILocation(line: 60, column: 18, scope: !90)
!92 = !DILocation(line: 60, column: 8, scope: !78)
!93 = !DILocation(line: 63, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !10, line: 61, column: 5)
!95 = !DILocation(line: 64, column: 5, scope: !94)
!96 = !DILocation(line: 68, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !10, line: 66, column: 5)
!98 = !DILocation(line: 69, column: 9, scope: !97)
!99 = !DILocation(line: 69, column: 20, scope: !97)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !10, line: 72, type: !44)
!101 = distinct !DILexicalBlock(scope: !78, file: !10, line: 71, column: 5)
!102 = !DILocation(line: 72, column: 14, scope: !101)
!103 = !DILocation(line: 74, column: 9, scope: !101)
!104 = !DILocation(line: 75, column: 9, scope: !101)
!105 = !DILocation(line: 75, column: 20, scope: !101)
!106 = !DILocation(line: 76, column: 19, scope: !101)
!107 = !DILocation(line: 76, column: 9, scope: !101)
!108 = !DILocation(line: 77, column: 14, scope: !101)
!109 = !DILocation(line: 77, column: 9, scope: !101)
!110 = !DILocation(line: 79, column: 1, scope: !78)
!111 = distinct !DISubprogram(name: "goodG2B2", scope: !10, file: !10, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!112 = !DILocalVariable(name: "data", scope: !111, file: !10, line: 84, type: !5)
!113 = !DILocation(line: 84, column: 12, scope: !111)
!114 = !DILocation(line: 85, column: 20, scope: !111)
!115 = !DILocation(line: 85, column: 10, scope: !111)
!116 = !DILocation(line: 86, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !10, line: 86, column: 9)
!118 = !DILocation(line: 86, column: 14, scope: !117)
!119 = !DILocation(line: 86, column: 9, scope: !111)
!120 = !DILocation(line: 86, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !10, line: 86, column: 23)
!122 = !DILocation(line: 87, column: 8, scope: !123)
!123 = distinct !DILexicalBlock(scope: !111, file: !10, line: 87, column: 8)
!124 = !DILocation(line: 87, column: 18, scope: !123)
!125 = !DILocation(line: 87, column: 8, scope: !111)
!126 = !DILocation(line: 90, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !10, line: 88, column: 5)
!128 = !DILocation(line: 91, column: 9, scope: !127)
!129 = !DILocation(line: 91, column: 20, scope: !127)
!130 = !DILocation(line: 92, column: 5, scope: !127)
!131 = !DILocalVariable(name: "dest", scope: !132, file: !10, line: 94, type: !44)
!132 = distinct !DILexicalBlock(scope: !111, file: !10, line: 93, column: 5)
!133 = !DILocation(line: 94, column: 14, scope: !132)
!134 = !DILocation(line: 96, column: 9, scope: !132)
!135 = !DILocation(line: 97, column: 9, scope: !132)
!136 = !DILocation(line: 97, column: 20, scope: !132)
!137 = !DILocation(line: 98, column: 19, scope: !132)
!138 = !DILocation(line: 98, column: 9, scope: !132)
!139 = !DILocation(line: 99, column: 14, scope: !132)
!140 = !DILocation(line: 99, column: 9, scope: !132)
!141 = !DILocation(line: 101, column: 1, scope: !111)
