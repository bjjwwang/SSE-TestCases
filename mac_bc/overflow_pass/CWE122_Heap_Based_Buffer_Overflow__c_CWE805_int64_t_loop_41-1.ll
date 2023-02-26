; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_badSink(i64* noundef %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !28
  call void @llvm.dbg.declare(metadata i64* %i, metadata !29, metadata !DIExpression()), !dbg !36
  store i64 0, i64* %i, align 8, !dbg !37
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !40
  %cmp = icmp ult i64 %1, 100, !dbg !42
  br i1 %cmp, label %for.body, label %for.end, !dbg !43

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !44
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !46
  %3 = load i64, i64* %arrayidx, align 8, !dbg !46
  %4 = load i64*, i64** %data.addr, align 8, !dbg !47
  %5 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !47
  store i64 %3, i64* %arrayidx1, align 8, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !51
  %inc = add i64 %6, 1, !dbg !51
  store i64 %inc, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !56
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !56
  call void @printLongLongLine(i64 noundef %8), !dbg !57
  %9 = load i64*, i64** %data.addr, align 8, !dbg !58
  %10 = bitcast i64* %9 to i8*, !dbg !58
  call void @free(i8* noundef %10), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_bad() #0 !dbg !61 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !64, metadata !DIExpression()), !dbg !65
  store i64* null, i64** %data, align 8, !dbg !66
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !67
  %0 = bitcast i8* %call to i64*, !dbg !68
  store i64* %0, i64** %data, align 8, !dbg !69
  %1 = load i64*, i64** %data, align 8, !dbg !70
  %cmp = icmp eq i64* %1, null, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_badSink(i64* noundef %2), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_goodG2BSink(i64* noundef %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !84
  call void @llvm.dbg.declare(metadata i64* %i, metadata !85, metadata !DIExpression()), !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !91
  %cmp = icmp ult i64 %1, 100, !dbg !93
  br i1 %cmp, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !97
  %3 = load i64, i64* %arrayidx, align 8, !dbg !97
  %4 = load i64*, i64** %data.addr, align 8, !dbg !98
  %5 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !98
  store i64 %3, i64* %arrayidx1, align 8, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !102
  %inc = add i64 %6, 1, !dbg !102
  store i64 %inc, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !106
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !106
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !106
  call void @printLongLongLine(i64 noundef %8), !dbg !107
  %9 = load i64*, i64** %data.addr, align 8, !dbg !108
  %10 = bitcast i64* %9 to i8*, !dbg !108
  call void @free(i8* noundef %10), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_good() #0 !dbg !111 {
entry:
  call void @goodG2B(), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !114 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call i64 @time(i64* noundef null), !dbg !125
  %conv = trunc i64 %call to i32, !dbg !126
  call void @srand(i32 noundef %conv), !dbg !127
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !128
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_good(), !dbg !129
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !131
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_bad(), !dbg !132
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !133
  ret i32 0, !dbg !134
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !135 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !136, metadata !DIExpression()), !dbg !137
  store i64* null, i64** %data, align 8, !dbg !138
  %call = call i8* @malloc(i64 noundef 800) #6, !dbg !139
  %0 = bitcast i8* %call to i64*, !dbg !140
  store i64* %0, i64** %data, align 8, !dbg !141
  %1 = load i64*, i64** %data, align 8, !dbg !142
  %cmp = icmp eq i64* %1, null, !dbg !144
  br i1 %cmp, label %if.then, label %if.end, !dbg !145

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !146
  unreachable, !dbg !146

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !148
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_goodG2BSink(i64* noundef %2), !dbg !149
  ret void, !dbg !150
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_badSink", scope: !17, file: !17, line: 21, type: !18, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !3}
!20 = !{}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 21, type: !3)
!22 = !DILocation(line: 21, column: 84, scope: !16)
!23 = !DILocalVariable(name: "source", scope: !24, file: !17, line: 24, type: !25)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 23, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 24, column: 17, scope: !24)
!29 = !DILocalVariable(name: "i", scope: !30, file: !17, line: 26, type: !31)
!30 = distinct !DILexicalBlock(scope: !24, file: !17, line: 25, column: 9)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 31, baseType: !33)
!32 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !34, line: 94, baseType: !35)
!34 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 26, column: 20, scope: !30)
!37 = !DILocation(line: 28, column: 20, scope: !38)
!38 = distinct !DILexicalBlock(scope: !30, file: !17, line: 28, column: 13)
!39 = !DILocation(line: 28, column: 18, scope: !38)
!40 = !DILocation(line: 28, column: 25, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !17, line: 28, column: 13)
!42 = !DILocation(line: 28, column: 27, scope: !41)
!43 = !DILocation(line: 28, column: 13, scope: !38)
!44 = !DILocation(line: 30, column: 34, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !17, line: 29, column: 13)
!46 = !DILocation(line: 30, column: 27, scope: !45)
!47 = !DILocation(line: 30, column: 17, scope: !45)
!48 = !DILocation(line: 30, column: 22, scope: !45)
!49 = !DILocation(line: 30, column: 25, scope: !45)
!50 = !DILocation(line: 31, column: 13, scope: !45)
!51 = !DILocation(line: 28, column: 35, scope: !41)
!52 = !DILocation(line: 28, column: 13, scope: !41)
!53 = distinct !{!53, !43, !54, !55}
!54 = !DILocation(line: 31, column: 13, scope: !38)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 32, column: 31, scope: !30)
!57 = !DILocation(line: 32, column: 13, scope: !30)
!58 = !DILocation(line: 33, column: 18, scope: !30)
!59 = !DILocation(line: 33, column: 13, scope: !30)
!60 = !DILocation(line: 36, column: 1, scope: !16)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_bad", scope: !17, file: !17, line: 38, type: !62, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!62 = !DISubroutineType(types: !63)
!63 = !{null}
!64 = !DILocalVariable(name: "data", scope: !61, file: !17, line: 40, type: !3)
!65 = !DILocation(line: 40, column: 15, scope: !61)
!66 = !DILocation(line: 41, column: 10, scope: !61)
!67 = !DILocation(line: 43, column: 23, scope: !61)
!68 = !DILocation(line: 43, column: 12, scope: !61)
!69 = !DILocation(line: 43, column: 10, scope: !61)
!70 = !DILocation(line: 44, column: 9, scope: !71)
!71 = distinct !DILexicalBlock(scope: !61, file: !17, line: 44, column: 9)
!72 = !DILocation(line: 44, column: 14, scope: !71)
!73 = !DILocation(line: 44, column: 9, scope: !61)
!74 = !DILocation(line: 44, column: 24, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !17, line: 44, column: 23)
!76 = !DILocation(line: 45, column: 73, scope: !61)
!77 = !DILocation(line: 45, column: 5, scope: !61)
!78 = !DILocation(line: 46, column: 1, scope: !61)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_goodG2BSink", scope: !17, file: !17, line: 52, type: !18, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !17, line: 52, type: !3)
!81 = !DILocation(line: 52, column: 88, scope: !79)
!82 = !DILocalVariable(name: "source", scope: !83, file: !17, line: 55, type: !25)
!83 = distinct !DILexicalBlock(scope: !79, file: !17, line: 54, column: 5)
!84 = !DILocation(line: 55, column: 17, scope: !83)
!85 = !DILocalVariable(name: "i", scope: !86, file: !17, line: 57, type: !31)
!86 = distinct !DILexicalBlock(scope: !83, file: !17, line: 56, column: 9)
!87 = !DILocation(line: 57, column: 20, scope: !86)
!88 = !DILocation(line: 59, column: 20, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !17, line: 59, column: 13)
!90 = !DILocation(line: 59, column: 18, scope: !89)
!91 = !DILocation(line: 59, column: 25, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !17, line: 59, column: 13)
!93 = !DILocation(line: 59, column: 27, scope: !92)
!94 = !DILocation(line: 59, column: 13, scope: !89)
!95 = !DILocation(line: 61, column: 34, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !17, line: 60, column: 13)
!97 = !DILocation(line: 61, column: 27, scope: !96)
!98 = !DILocation(line: 61, column: 17, scope: !96)
!99 = !DILocation(line: 61, column: 22, scope: !96)
!100 = !DILocation(line: 61, column: 25, scope: !96)
!101 = !DILocation(line: 62, column: 13, scope: !96)
!102 = !DILocation(line: 59, column: 35, scope: !92)
!103 = !DILocation(line: 59, column: 13, scope: !92)
!104 = distinct !{!104, !94, !105, !55}
!105 = !DILocation(line: 62, column: 13, scope: !89)
!106 = !DILocation(line: 63, column: 31, scope: !86)
!107 = !DILocation(line: 63, column: 13, scope: !86)
!108 = !DILocation(line: 64, column: 18, scope: !86)
!109 = !DILocation(line: 64, column: 13, scope: !86)
!110 = !DILocation(line: 67, column: 1, scope: !79)
!111 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_loop_41_good", scope: !17, file: !17, line: 80, type: !62, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!112 = !DILocation(line: 82, column: 5, scope: !111)
!113 = !DILocation(line: 83, column: 1, scope: !111)
!114 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 95, type: !115, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!115 = !DISubroutineType(types: !116)
!116 = !{!117, !117, !118}
!117 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!121 = !DILocalVariable(name: "argc", arg: 1, scope: !114, file: !17, line: 95, type: !117)
!122 = !DILocation(line: 95, column: 14, scope: !114)
!123 = !DILocalVariable(name: "argv", arg: 2, scope: !114, file: !17, line: 95, type: !118)
!124 = !DILocation(line: 95, column: 27, scope: !114)
!125 = !DILocation(line: 98, column: 22, scope: !114)
!126 = !DILocation(line: 98, column: 12, scope: !114)
!127 = !DILocation(line: 98, column: 5, scope: !114)
!128 = !DILocation(line: 100, column: 5, scope: !114)
!129 = !DILocation(line: 101, column: 5, scope: !114)
!130 = !DILocation(line: 102, column: 5, scope: !114)
!131 = !DILocation(line: 105, column: 5, scope: !114)
!132 = !DILocation(line: 106, column: 5, scope: !114)
!133 = !DILocation(line: 107, column: 5, scope: !114)
!134 = !DILocation(line: 109, column: 5, scope: !114)
!135 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 70, type: !62, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!136 = !DILocalVariable(name: "data", scope: !135, file: !17, line: 72, type: !3)
!137 = !DILocation(line: 72, column: 15, scope: !135)
!138 = !DILocation(line: 73, column: 10, scope: !135)
!139 = !DILocation(line: 75, column: 23, scope: !135)
!140 = !DILocation(line: 75, column: 12, scope: !135)
!141 = !DILocation(line: 75, column: 10, scope: !135)
!142 = !DILocation(line: 76, column: 9, scope: !143)
!143 = distinct !DILexicalBlock(scope: !135, file: !17, line: 76, column: 9)
!144 = !DILocation(line: 76, column: 14, scope: !143)
!145 = !DILocation(line: 76, column: 9, scope: !135)
!146 = !DILocation(line: 76, column: 24, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !17, line: 76, column: 23)
!148 = !DILocation(line: 77, column: 77, scope: !135)
!149 = !DILocation(line: 77, column: 5, scope: !135)
!150 = !DILocation(line: 78, column: 1, scope: !135)
