; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44_bad() #0 !dbg !16 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !23, metadata !DIExpression()), !dbg !27
  store void (i64*)* @badSink, void (i64*)** %funcPtr, align 8, !dbg !27
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
  %2 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !38
  %3 = load i64*, i64** %data, align 8, !dbg !39
  call void %2(i64* noundef %3), !dbg !38
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i64* noundef %data) #0 !dbg !41 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !42, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !49
  %1 = load i64*, i64** %data.addr, align 8, !dbg !50
  %2 = bitcast i64* %1 to i8*, !dbg !50
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !50
  %3 = bitcast i64* %arraydecay to i8*, !dbg !50
  %4 = load i64*, i64** %data.addr, align 8, !dbg !50
  %5 = bitcast i64* %4 to i8*, !dbg !50
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !50
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #9, !dbg !50
  %7 = load i64*, i64** %data.addr, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !51
  %8 = load i64, i64* %arrayidx, align 8, !dbg !51
  call void @printLongLongLine(i64 noundef %8), !dbg !52
  %9 = load i64*, i64** %data.addr, align 8, !dbg !53
  %10 = bitcast i64* %9 to i8*, !dbg !53
  call void @free(i8* noundef %10), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* noundef null), !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 noundef %conv), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44_good(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44_bad(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !80 {
entry:
  %data = alloca i64*, align 8
  %funcPtr = alloca void (i64*)*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata void (i64*)** %funcPtr, metadata !83, metadata !DIExpression()), !dbg !84
  store void (i64*)* @goodG2BSink, void (i64*)** %funcPtr, align 8, !dbg !84
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
  %2 = load void (i64*)*, void (i64*)** %funcPtr, align 8, !dbg !95
  %3 = load i64*, i64** %data, align 8, !dbg !96
  call void %2(i64* noundef %3), !dbg !95
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i64* noundef %data) #0 !dbg !98 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !103
  %1 = load i64*, i64** %data.addr, align 8, !dbg !104
  %2 = bitcast i64* %1 to i8*, !dbg !104
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !104
  %3 = bitcast i64* %arraydecay to i8*, !dbg !104
  %4 = load i64*, i64** %data.addr, align 8, !dbg !104
  %5 = bitcast i64* %4 to i8*, !dbg !104
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !104
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #9, !dbg !104
  %7 = load i64*, i64** %data.addr, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !105
  %8 = load i64, i64* %arrayidx, align 8, !dbg !105
  call void @printLongLongLine(i64 noundef %8), !dbg !106
  %9 = load i64*, i64** %data.addr, align 8, !dbg !107
  %10 = bitcast i64* %9 to i8*, !dbg !107
  call void @free(i8* noundef %10), !dbg !108
  ret void, !dbg !109
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44_bad", scope: !17, file: !17, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{}
!21 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 34, type: !3)
!22 = !DILocation(line: 34, column: 15, scope: !16)
!23 = !DILocalVariable(name: "funcPtr", scope: !16, file: !17, line: 36, type: !24)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{null, !3}
!27 = !DILocation(line: 36, column: 12, scope: !16)
!28 = !DILocation(line: 37, column: 10, scope: !16)
!29 = !DILocation(line: 39, column: 23, scope: !16)
!30 = !DILocation(line: 39, column: 12, scope: !16)
!31 = !DILocation(line: 39, column: 10, scope: !16)
!32 = !DILocation(line: 40, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !16, file: !17, line: 40, column: 9)
!34 = !DILocation(line: 40, column: 14, scope: !33)
!35 = !DILocation(line: 40, column: 9, scope: !16)
!36 = !DILocation(line: 40, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 40, column: 23)
!38 = !DILocation(line: 42, column: 5, scope: !16)
!39 = !DILocation(line: 42, column: 13, scope: !16)
!40 = !DILocation(line: 43, column: 1, scope: !16)
!41 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 21, type: !25, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!42 = !DILocalVariable(name: "data", arg: 1, scope: !41, file: !17, line: 21, type: !3)
!43 = !DILocation(line: 21, column: 31, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !17, line: 24, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !17, line: 23, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 24, column: 17, scope: !45)
!50 = !DILocation(line: 26, column: 9, scope: !45)
!51 = !DILocation(line: 27, column: 27, scope: !45)
!52 = !DILocation(line: 27, column: 9, scope: !45)
!53 = !DILocation(line: 28, column: 14, scope: !45)
!54 = !DILocation(line: 28, column: 9, scope: !45)
!55 = !DILocation(line: 30, column: 1, scope: !41)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_44_good", scope: !17, file: !17, line: 72, type: !18, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!57 = !DILocation(line: 74, column: 5, scope: !56)
!58 = !DILocation(line: 75, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 86, type: !60, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !17, line: 86, type: !62)
!67 = !DILocation(line: 86, column: 14, scope: !59)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !17, line: 86, type: !63)
!69 = !DILocation(line: 86, column: 27, scope: !59)
!70 = !DILocation(line: 89, column: 22, scope: !59)
!71 = !DILocation(line: 89, column: 12, scope: !59)
!72 = !DILocation(line: 89, column: 5, scope: !59)
!73 = !DILocation(line: 91, column: 5, scope: !59)
!74 = !DILocation(line: 92, column: 5, scope: !59)
!75 = !DILocation(line: 93, column: 5, scope: !59)
!76 = !DILocation(line: 96, column: 5, scope: !59)
!77 = !DILocation(line: 97, column: 5, scope: !59)
!78 = !DILocation(line: 98, column: 5, scope: !59)
!79 = !DILocation(line: 100, column: 5, scope: !59)
!80 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 61, type: !18, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!81 = !DILocalVariable(name: "data", scope: !80, file: !17, line: 63, type: !3)
!82 = !DILocation(line: 63, column: 15, scope: !80)
!83 = !DILocalVariable(name: "funcPtr", scope: !80, file: !17, line: 64, type: !24)
!84 = !DILocation(line: 64, column: 12, scope: !80)
!85 = !DILocation(line: 65, column: 10, scope: !80)
!86 = !DILocation(line: 67, column: 23, scope: !80)
!87 = !DILocation(line: 67, column: 12, scope: !80)
!88 = !DILocation(line: 67, column: 10, scope: !80)
!89 = !DILocation(line: 68, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !80, file: !17, line: 68, column: 9)
!91 = !DILocation(line: 68, column: 14, scope: !90)
!92 = !DILocation(line: 68, column: 9, scope: !80)
!93 = !DILocation(line: 68, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 68, column: 23)
!95 = !DILocation(line: 69, column: 5, scope: !80)
!96 = !DILocation(line: 69, column: 13, scope: !80)
!97 = !DILocation(line: 70, column: 1, scope: !80)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 50, type: !25, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!99 = !DILocalVariable(name: "data", arg: 1, scope: !98, file: !17, line: 50, type: !3)
!100 = !DILocation(line: 50, column: 35, scope: !98)
!101 = !DILocalVariable(name: "source", scope: !102, file: !17, line: 53, type: !46)
!102 = distinct !DILexicalBlock(scope: !98, file: !17, line: 52, column: 5)
!103 = !DILocation(line: 53, column: 17, scope: !102)
!104 = !DILocation(line: 55, column: 9, scope: !102)
!105 = !DILocation(line: 56, column: 27, scope: !102)
!106 = !DILocation(line: 56, column: 9, scope: !102)
!107 = !DILocation(line: 57, column: 14, scope: !102)
!108 = !DILocation(line: 57, column: 9, scope: !102)
!109 = !DILocation(line: 59, column: 1, scope: !98)
