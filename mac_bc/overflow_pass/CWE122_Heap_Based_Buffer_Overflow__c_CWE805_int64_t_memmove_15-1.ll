; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_bad() #0 !dbg !16 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !24
  %0 = bitcast i8* %call to i64*, !dbg !25
  store i64* %0, i64** %data, align 8, !dbg !26
  %1 = load i64*, i64** %data, align 8, !dbg !27
  %cmp = icmp eq i64* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !38
  %3 = load i64*, i64** %data, align 8, !dbg !39
  %4 = bitcast i64* %3 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !39
  %5 = bitcast i64* %arraydecay to i8*, !dbg !39
  %6 = load i64*, i64** %data, align 8, !dbg !39
  %7 = bitcast i64* %6 to i8*, !dbg !39
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !39
  %call1 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !39
  %9 = load i64*, i64** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !40
  %10 = load i64, i64* %arrayidx, align 8, !dbg !40
  call void @printLongLongLine(i64 noundef %10), !dbg !41
  %11 = load i64*, i64** %data, align 8, !dbg !42
  %12 = bitcast i64* %11 to i8*, !dbg !42
  call void @free(i8* noundef %12), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i64* null, i64** %data, align 8, !dbg !73
  %call = call i8* @malloc(i64 noundef 800) #7, !dbg !74
  %0 = bitcast i8* %call to i64*, !dbg !75
  store i64* %0, i64** %data, align 8, !dbg !76
  %1 = load i64*, i64** %data, align 8, !dbg !77
  %cmp = icmp eq i64* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !83, metadata !DIExpression()), !dbg !85
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !85
  %3 = load i64*, i64** %data, align 8, !dbg !86
  %4 = bitcast i64* %3 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !86
  %5 = bitcast i64* %arraydecay to i8*, !dbg !86
  %6 = load i64*, i64** %data, align 8, !dbg !86
  %7 = bitcast i64* %6 to i8*, !dbg !86
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !86
  %call1 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !86
  %9 = load i64*, i64** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !87
  %10 = load i64, i64* %arrayidx, align 8, !dbg !87
  call void @printLongLongLine(i64 noundef %10), !dbg !88
  %11 = load i64*, i64** %data, align 8, !dbg !89
  %12 = bitcast i64* %11 to i8*, !dbg !89
  call void @free(i8* noundef %12), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !92 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i64* null, i64** %data, align 8, !dbg !95
  %call = call i8* @malloc(i64 noundef 800) #7, !dbg !96
  %0 = bitcast i8* %call to i64*, !dbg !97
  store i64* %0, i64** %data, align 8, !dbg !98
  %1 = load i64*, i64** %data, align 8, !dbg !99
  %cmp = icmp eq i64* %1, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !107
  %3 = load i64*, i64** %data, align 8, !dbg !108
  %4 = bitcast i64* %3 to i8*, !dbg !108
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !108
  %5 = bitcast i64* %arraydecay to i8*, !dbg !108
  %6 = load i64*, i64** %data, align 8, !dbg !108
  %7 = bitcast i64* %6 to i8*, !dbg !108
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !108
  %call1 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !108
  %9 = load i64*, i64** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !109
  %10 = load i64, i64* %arrayidx, align 8, !dbg !109
  call void @printLongLongLine(i64 noundef %10), !dbg !110
  %11 = load i64*, i64** %data, align 8, !dbg !111
  %12 = bitcast i64* %11 to i8*, !dbg !111
  call void @free(i8* noundef %12), !dbg !112
  ret void, !dbg !113
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7, !8}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_bad", scope: !17, file: !17, line: 21, type: !18, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{}
!21 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 23, type: !3)
!22 = !DILocation(line: 23, column: 15, scope: !16)
!23 = !DILocation(line: 24, column: 10, scope: !16)
!24 = !DILocation(line: 29, column: 27, scope: !16)
!25 = !DILocation(line: 29, column: 16, scope: !16)
!26 = !DILocation(line: 29, column: 14, scope: !16)
!27 = !DILocation(line: 30, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 13)
!29 = !DILocation(line: 30, column: 18, scope: !28)
!30 = !DILocation(line: 30, column: 13, scope: !16)
!31 = !DILocation(line: 30, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 30, column: 27)
!33 = !DILocalVariable(name: "source", scope: !34, file: !17, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 37, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 38, column: 17, scope: !34)
!39 = !DILocation(line: 40, column: 9, scope: !34)
!40 = !DILocation(line: 41, column: 27, scope: !34)
!41 = !DILocation(line: 41, column: 9, scope: !34)
!42 = !DILocation(line: 42, column: 14, scope: !34)
!43 = !DILocation(line: 42, column: 9, scope: !34)
!44 = !DILocation(line: 44, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_15_good", scope: !17, file: !17, line: 102, type: !18, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!46 = !DILocation(line: 104, column: 5, scope: !45)
!47 = !DILocation(line: 105, column: 5, scope: !45)
!48 = !DILocation(line: 106, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 118, type: !50, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !17, line: 118, type: !52)
!57 = !DILocation(line: 118, column: 14, scope: !49)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !17, line: 118, type: !53)
!59 = !DILocation(line: 118, column: 27, scope: !49)
!60 = !DILocation(line: 121, column: 22, scope: !49)
!61 = !DILocation(line: 121, column: 12, scope: !49)
!62 = !DILocation(line: 121, column: 5, scope: !49)
!63 = !DILocation(line: 123, column: 5, scope: !49)
!64 = !DILocation(line: 124, column: 5, scope: !49)
!65 = !DILocation(line: 125, column: 5, scope: !49)
!66 = !DILocation(line: 128, column: 5, scope: !49)
!67 = !DILocation(line: 129, column: 5, scope: !49)
!68 = !DILocation(line: 130, column: 5, scope: !49)
!69 = !DILocation(line: 132, column: 5, scope: !49)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!71 = !DILocalVariable(name: "data", scope: !70, file: !17, line: 53, type: !3)
!72 = !DILocation(line: 53, column: 15, scope: !70)
!73 = !DILocation(line: 54, column: 10, scope: !70)
!74 = !DILocation(line: 63, column: 27, scope: !70)
!75 = !DILocation(line: 63, column: 16, scope: !70)
!76 = !DILocation(line: 63, column: 14, scope: !70)
!77 = !DILocation(line: 64, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !17, line: 64, column: 13)
!79 = !DILocation(line: 64, column: 18, scope: !78)
!80 = !DILocation(line: 64, column: 13, scope: !70)
!81 = !DILocation(line: 64, column: 28, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !17, line: 64, column: 27)
!83 = !DILocalVariable(name: "source", scope: !84, file: !17, line: 68, type: !35)
!84 = distinct !DILexicalBlock(scope: !70, file: !17, line: 67, column: 5)
!85 = !DILocation(line: 68, column: 17, scope: !84)
!86 = !DILocation(line: 70, column: 9, scope: !84)
!87 = !DILocation(line: 71, column: 27, scope: !84)
!88 = !DILocation(line: 71, column: 9, scope: !84)
!89 = !DILocation(line: 72, column: 14, scope: !84)
!90 = !DILocation(line: 72, column: 9, scope: !84)
!91 = !DILocation(line: 74, column: 1, scope: !70)
!92 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 77, type: !18, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!93 = !DILocalVariable(name: "data", scope: !92, file: !17, line: 79, type: !3)
!94 = !DILocation(line: 79, column: 15, scope: !92)
!95 = !DILocation(line: 80, column: 10, scope: !92)
!96 = !DILocation(line: 85, column: 27, scope: !92)
!97 = !DILocation(line: 85, column: 16, scope: !92)
!98 = !DILocation(line: 85, column: 14, scope: !92)
!99 = !DILocation(line: 86, column: 13, scope: !100)
!100 = distinct !DILexicalBlock(scope: !92, file: !17, line: 86, column: 13)
!101 = !DILocation(line: 86, column: 18, scope: !100)
!102 = !DILocation(line: 86, column: 13, scope: !92)
!103 = !DILocation(line: 86, column: 28, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !17, line: 86, column: 27)
!105 = !DILocalVariable(name: "source", scope: !106, file: !17, line: 94, type: !35)
!106 = distinct !DILexicalBlock(scope: !92, file: !17, line: 93, column: 5)
!107 = !DILocation(line: 94, column: 17, scope: !106)
!108 = !DILocation(line: 96, column: 9, scope: !106)
!109 = !DILocation(line: 97, column: 27, scope: !106)
!110 = !DILocation(line: 97, column: 9, scope: !106)
!111 = !DILocation(line: 98, column: 14, scope: !106)
!112 = !DILocation(line: 98, column: 9, scope: !106)
!113 = !DILocation(line: 100, column: 1, scope: !92)
