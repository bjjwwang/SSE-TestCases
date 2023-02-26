; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_badSink(i8* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !27
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %0 = load i8*, i8** %data.addr, align 8, !dbg !30
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  %1 = load i8*, i8** %data.addr, align 8, !dbg !30
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !30
  %call = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %arraydecay1, i64 noundef 100, i64 noundef %2) #7, !dbg !30
  %3 = load i8*, i8** %data.addr, align 8, !dbg !31
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !31
  store i8 0, i8* %arrayidx2, align 1, !dbg !32
  %4 = load i8*, i8** %data.addr, align 8, !dbg !33
  call void @printLine(i8* noundef %4), !dbg !34
  %5 = load i8*, i8** %data.addr, align 8, !dbg !35
  call void @free(i8* noundef %5), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_bad() #0 !dbg !38 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !41, metadata !DIExpression()), !dbg !42
  store i8* null, i8** %data, align 8, !dbg !43
  %call = call i8* @malloc(i64 noundef 50) #8, !dbg !44
  store i8* %call, i8** %data, align 8, !dbg !45
  %0 = load i8*, i8** %data, align 8, !dbg !46
  %cmp = icmp eq i8* %0, null, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !50
  unreachable, !dbg !50

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  %2 = load i8*, i8** %data, align 8, !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_badSink(i8* noundef %2), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #5

; Function Attrs: noreturn
declare void @exit(i32 noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_goodG2BSink(i8* noundef %data) #0 !dbg !57 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !60, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !63
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !63
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !64
  store i8 0, i8* %arrayidx, align 1, !dbg !65
  %0 = load i8*, i8** %data.addr, align 8, !dbg !66
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !66
  %1 = load i8*, i8** %data.addr, align 8, !dbg !66
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !66
  %call = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %arraydecay1, i64 noundef 100, i64 noundef %2) #7, !dbg !66
  %3 = load i8*, i8** %data.addr, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !67
  store i8 0, i8* %arrayidx2, align 1, !dbg !68
  %4 = load i8*, i8** %data.addr, align 8, !dbg !69
  call void @printLine(i8* noundef %4), !dbg !70
  %5 = load i8*, i8** %data.addr, align 8, !dbg !71
  call void @free(i8* noundef %5), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* noundef null), !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 noundef %conv), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  %call = call i8* @malloc(i64 noundef 100) #8, !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %cmp = icmp eq i8* %0, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  %2 = load i8*, i8** %data, align 8, !dbg !110
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_goodG2BSink(i8* noundef %2), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { allocsize(0) }
attributes #9 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !3}
!18 = !{}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 80, scope: !14)
!21 = !DILocalVariable(name: "source", scope: !22, file: !15, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 14, scope: !22)
!27 = !DILocation(line: 27, column: 9, scope: !22)
!28 = !DILocation(line: 28, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 23, scope: !22)
!30 = !DILocation(line: 30, column: 9, scope: !22)
!31 = !DILocation(line: 31, column: 9, scope: !22)
!32 = !DILocation(line: 31, column: 21, scope: !22)
!33 = !DILocation(line: 32, column: 19, scope: !22)
!34 = !DILocation(line: 32, column: 9, scope: !22)
!35 = !DILocation(line: 33, column: 14, scope: !22)
!36 = !DILocation(line: 33, column: 9, scope: !22)
!37 = !DILocation(line: 35, column: 1, scope: !14)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_bad", scope: !15, file: !15, line: 37, type: !39, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !DILocalVariable(name: "data", scope: !38, file: !15, line: 39, type: !3)
!42 = !DILocation(line: 39, column: 12, scope: !38)
!43 = !DILocation(line: 40, column: 10, scope: !38)
!44 = !DILocation(line: 42, column: 20, scope: !38)
!45 = !DILocation(line: 42, column: 10, scope: !38)
!46 = !DILocation(line: 43, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !38, file: !15, line: 43, column: 9)
!48 = !DILocation(line: 43, column: 14, scope: !47)
!49 = !DILocation(line: 43, column: 9, scope: !38)
!50 = !DILocation(line: 43, column: 24, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !15, line: 43, column: 23)
!52 = !DILocation(line: 44, column: 5, scope: !38)
!53 = !DILocation(line: 44, column: 13, scope: !38)
!54 = !DILocation(line: 45, column: 72, scope: !38)
!55 = !DILocation(line: 45, column: 5, scope: !38)
!56 = !DILocation(line: 46, column: 1, scope: !38)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_goodG2BSink", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!58 = !DILocalVariable(name: "data", arg: 1, scope: !57, file: !15, line: 52, type: !3)
!59 = !DILocation(line: 52, column: 84, scope: !57)
!60 = !DILocalVariable(name: "source", scope: !61, file: !15, line: 55, type: !23)
!61 = distinct !DILexicalBlock(scope: !57, file: !15, line: 54, column: 5)
!62 = !DILocation(line: 55, column: 14, scope: !61)
!63 = !DILocation(line: 56, column: 9, scope: !61)
!64 = !DILocation(line: 57, column: 9, scope: !61)
!65 = !DILocation(line: 57, column: 23, scope: !61)
!66 = !DILocation(line: 59, column: 9, scope: !61)
!67 = !DILocation(line: 60, column: 9, scope: !61)
!68 = !DILocation(line: 60, column: 21, scope: !61)
!69 = !DILocation(line: 61, column: 19, scope: !61)
!70 = !DILocation(line: 61, column: 9, scope: !61)
!71 = !DILocation(line: 62, column: 14, scope: !61)
!72 = !DILocation(line: 62, column: 9, scope: !61)
!73 = !DILocation(line: 64, column: 1, scope: !57)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_memcpy_41_good", scope: !15, file: !15, line: 78, type: !39, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!75 = !DILocation(line: 80, column: 5, scope: !74)
!76 = !DILocation(line: 81, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 93, type: !78, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !15, line: 93, type: !80)
!83 = !DILocation(line: 93, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !15, line: 93, type: !81)
!85 = !DILocation(line: 93, column: 27, scope: !77)
!86 = !DILocation(line: 96, column: 22, scope: !77)
!87 = !DILocation(line: 96, column: 12, scope: !77)
!88 = !DILocation(line: 96, column: 5, scope: !77)
!89 = !DILocation(line: 98, column: 5, scope: !77)
!90 = !DILocation(line: 99, column: 5, scope: !77)
!91 = !DILocation(line: 100, column: 5, scope: !77)
!92 = !DILocation(line: 103, column: 5, scope: !77)
!93 = !DILocation(line: 104, column: 5, scope: !77)
!94 = !DILocation(line: 105, column: 5, scope: !77)
!95 = !DILocation(line: 107, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !39, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 69, type: !3)
!98 = !DILocation(line: 69, column: 12, scope: !96)
!99 = !DILocation(line: 70, column: 10, scope: !96)
!100 = !DILocation(line: 72, column: 20, scope: !96)
!101 = !DILocation(line: 72, column: 10, scope: !96)
!102 = !DILocation(line: 73, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !15, line: 73, column: 9)
!104 = !DILocation(line: 73, column: 14, scope: !103)
!105 = !DILocation(line: 73, column: 9, scope: !96)
!106 = !DILocation(line: 73, column: 24, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 73, column: 23)
!108 = !DILocation(line: 74, column: 5, scope: !96)
!109 = !DILocation(line: 74, column: 13, scope: !96)
!110 = !DILocation(line: 75, column: 76, scope: !96)
!111 = !DILocation(line: 75, column: 5, scope: !96)
!112 = !DILocation(line: 76, column: 1, scope: !96)
