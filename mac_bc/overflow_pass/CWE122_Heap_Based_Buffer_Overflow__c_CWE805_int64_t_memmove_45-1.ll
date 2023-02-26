; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_goodG2BData = internal global i64* null, align 8, !dbg !12

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_bad() #0 !dbg !22 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !29
  %0 = bitcast i8* %call to i64*, !dbg !30
  store i64* %0, i64** %data, align 8, !dbg !31
  %1 = load i64*, i64** %data, align 8, !dbg !32
  %cmp = icmp eq i64* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !38
  store i64* %2, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_badData, align 8, !dbg !39
  call void @badSink(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_good() #0 !dbg !42 {
entry:
  call void @goodG2B(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !52, metadata !DIExpression()), !dbg !53
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !54, metadata !DIExpression()), !dbg !55
  %call = call i64 @time(i64* noundef null), !dbg !56
  %conv = trunc i64 %call to i32, !dbg !57
  call void @srand(i32 noundef %conv), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_good(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_bad(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !64
  ret i32 0, !dbg !65
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !66 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !67, metadata !DIExpression()), !dbg !68
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_badData, align 8, !dbg !69
  store i64* %0, i64** %data, align 8, !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !70, metadata !DIExpression()), !dbg !75
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !75
  %2 = load i64*, i64** %data, align 8, !dbg !76
  %3 = bitcast i64* %2 to i8*, !dbg !76
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !76
  %4 = bitcast i64* %arraydecay to i8*, !dbg !76
  %5 = load i64*, i64** %data, align 8, !dbg !76
  %6 = bitcast i64* %5 to i8*, !dbg !76
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !76
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 800, i64 noundef %7) #9, !dbg !76
  %8 = load i64*, i64** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !77
  %9 = load i64, i64* %arrayidx, align 8, !dbg !77
  call void @printLongLongLine(i64 noundef %9), !dbg !78
  %10 = load i64*, i64** %data, align 8, !dbg !79
  %11 = bitcast i64* %10 to i8*, !dbg !79
  call void @free(i8* noundef %11), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !83, metadata !DIExpression()), !dbg !84
  store i64* null, i64** %data, align 8, !dbg !85
  %call = call i8* @malloc(i64 noundef 800) #7, !dbg !86
  %0 = bitcast i8* %call to i64*, !dbg !87
  store i64* %0, i64** %data, align 8, !dbg !88
  %1 = load i64*, i64** %data, align 8, !dbg !89
  %cmp = icmp eq i64* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !95
  store i64* %2, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_goodG2BData, align 8, !dbg !96
  call void @goodG2BSink(), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !99 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = load i64*, i64** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_goodG2BData, align 8, !dbg !102
  store i64* %0, i64** %data, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !103, metadata !DIExpression()), !dbg !105
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !105
  %2 = load i64*, i64** %data, align 8, !dbg !106
  %3 = bitcast i64* %2 to i8*, !dbg !106
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !106
  %4 = bitcast i64* %arraydecay to i8*, !dbg !106
  %5 = load i64*, i64** %data, align 8, !dbg !106
  %6 = bitcast i64* %5 to i8*, !dbg !106
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !106
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 800, i64 noundef %7) #9, !dbg !106
  %8 = load i64*, i64** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !107
  %9 = load i64, i64* %arrayidx, align 8, !dbg !107
  call void @printLongLongLine(i64 noundef %9), !dbg !108
  %10 = load i64*, i64** %data, align 8, !dbg !109
  %11 = bitcast i64* %10 to i8*, !dbg !109
  call void @free(i8* noundef %11), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_badData", scope: !2, file: !14, line: 19, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !11, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !9, !10}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 30, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!8 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_goodG2BData", scope: !2, file: !14, line: 20, type: !5, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_bad", scope: !14, file: !14, line: 36, type: !23, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !{}
!26 = !DILocalVariable(name: "data", scope: !22, file: !14, line: 38, type: !5)
!27 = !DILocation(line: 38, column: 15, scope: !22)
!28 = !DILocation(line: 39, column: 10, scope: !22)
!29 = !DILocation(line: 41, column: 23, scope: !22)
!30 = !DILocation(line: 41, column: 12, scope: !22)
!31 = !DILocation(line: 41, column: 10, scope: !22)
!32 = !DILocation(line: 42, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !22, file: !14, line: 42, column: 9)
!34 = !DILocation(line: 42, column: 14, scope: !33)
!35 = !DILocation(line: 42, column: 9, scope: !22)
!36 = !DILocation(line: 42, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 42, column: 23)
!38 = !DILocation(line: 43, column: 78, scope: !22)
!39 = !DILocation(line: 43, column: 76, scope: !22)
!40 = !DILocation(line: 44, column: 5, scope: !22)
!41 = !DILocation(line: 45, column: 1, scope: !22)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_45_good", scope: !14, file: !14, line: 75, type: !23, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!43 = !DILocation(line: 77, column: 5, scope: !42)
!44 = !DILocation(line: 78, column: 1, scope: !42)
!45 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 89, type: !46, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!52 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !14, line: 89, type: !48)
!53 = !DILocation(line: 89, column: 14, scope: !45)
!54 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !14, line: 89, type: !49)
!55 = !DILocation(line: 89, column: 27, scope: !45)
!56 = !DILocation(line: 92, column: 22, scope: !45)
!57 = !DILocation(line: 92, column: 12, scope: !45)
!58 = !DILocation(line: 92, column: 5, scope: !45)
!59 = !DILocation(line: 94, column: 5, scope: !45)
!60 = !DILocation(line: 95, column: 5, scope: !45)
!61 = !DILocation(line: 96, column: 5, scope: !45)
!62 = !DILocation(line: 99, column: 5, scope: !45)
!63 = !DILocation(line: 100, column: 5, scope: !45)
!64 = !DILocation(line: 101, column: 5, scope: !45)
!65 = !DILocation(line: 103, column: 5, scope: !45)
!66 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 24, type: !23, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!67 = !DILocalVariable(name: "data", scope: !66, file: !14, line: 26, type: !5)
!68 = !DILocation(line: 26, column: 15, scope: !66)
!69 = !DILocation(line: 26, column: 22, scope: !66)
!70 = !DILocalVariable(name: "source", scope: !71, file: !14, line: 28, type: !72)
!71 = distinct !DILexicalBlock(scope: !66, file: !14, line: 27, column: 5)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 100)
!75 = !DILocation(line: 28, column: 17, scope: !71)
!76 = !DILocation(line: 30, column: 9, scope: !71)
!77 = !DILocation(line: 31, column: 27, scope: !71)
!78 = !DILocation(line: 31, column: 9, scope: !71)
!79 = !DILocation(line: 32, column: 14, scope: !71)
!80 = !DILocation(line: 32, column: 9, scope: !71)
!81 = !DILocation(line: 34, column: 1, scope: !66)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 64, type: !23, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 66, type: !5)
!84 = !DILocation(line: 66, column: 15, scope: !82)
!85 = !DILocation(line: 67, column: 10, scope: !82)
!86 = !DILocation(line: 69, column: 23, scope: !82)
!87 = !DILocation(line: 69, column: 12, scope: !82)
!88 = !DILocation(line: 69, column: 10, scope: !82)
!89 = !DILocation(line: 70, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !82, file: !14, line: 70, column: 9)
!91 = !DILocation(line: 70, column: 14, scope: !90)
!92 = !DILocation(line: 70, column: 9, scope: !82)
!93 = !DILocation(line: 70, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !14, line: 70, column: 23)
!95 = !DILocation(line: 71, column: 82, scope: !82)
!96 = !DILocation(line: 71, column: 80, scope: !82)
!97 = !DILocation(line: 72, column: 5, scope: !82)
!98 = !DILocation(line: 73, column: 1, scope: !82)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 52, type: !23, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!100 = !DILocalVariable(name: "data", scope: !99, file: !14, line: 54, type: !5)
!101 = !DILocation(line: 54, column: 15, scope: !99)
!102 = !DILocation(line: 54, column: 22, scope: !99)
!103 = !DILocalVariable(name: "source", scope: !104, file: !14, line: 56, type: !72)
!104 = distinct !DILexicalBlock(scope: !99, file: !14, line: 55, column: 5)
!105 = !DILocation(line: 56, column: 17, scope: !104)
!106 = !DILocation(line: 58, column: 9, scope: !104)
!107 = !DILocation(line: 59, column: 27, scope: !104)
!108 = !DILocation(line: 59, column: 9, scope: !104)
!109 = !DILocation(line: 60, column: 14, scope: !104)
!110 = !DILocation(line: 60, column: 9, scope: !104)
!111 = !DILocation(line: 62, column: 1, scope: !99)
