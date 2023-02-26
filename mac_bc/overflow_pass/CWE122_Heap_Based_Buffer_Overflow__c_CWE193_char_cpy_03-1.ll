; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !37
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !37
  %2 = load i8*, i8** %data, align 8, !dbg !38
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !38
  %call1 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %4) #9, !dbg !38
  %5 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* noundef %5), !dbg !40
  %6 = load i8*, i8** %data, align 8, !dbg !41
  call void @free(i8* noundef %6), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i8* null, i8** %data, align 8, !dbg !70
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !71
  store i8* %call, i8** %data, align 8, !dbg !74
  %0 = load i8*, i8** %data, align 8, !dbg !75
  %cmp = icmp eq i8* %0, null, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !79
  unreachable, !dbg !79

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !81, metadata !DIExpression()), !dbg !83
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !83
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !83
  %2 = load i8*, i8** %data, align 8, !dbg !84
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !84
  %3 = load i8*, i8** %data, align 8, !dbg !84
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !84
  %call1 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %4) #9, !dbg !84
  %5 = load i8*, i8** %data, align 8, !dbg !85
  call void @printLine(i8* noundef %5), !dbg !86
  %6 = load i8*, i8** %data, align 8, !dbg !87
  call void @free(i8* noundef %6), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  store i8* null, i8** %data, align 8, !dbg !93
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !94
  store i8* %call, i8** %data, align 8, !dbg !97
  %0 = load i8*, i8** %data, align 8, !dbg !98
  %cmp = icmp eq i8* %0, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !106
  %2 = load i8*, i8** %data, align 8, !dbg !107
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !107
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !107
  %call1 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %4) #9, !dbg !107
  %5 = load i8*, i8** %data, align 8, !dbg !108
  call void @printLine(i8* noundef %5), !dbg !109
  %6 = load i8*, i8** %data, align 8, !dbg !110
  call void @free(i8* noundef %6), !dbg !111
  ret void, !dbg !112
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !3)
!20 = !DILocation(line: 30, column: 12, scope: !14)
!21 = !DILocation(line: 31, column: 10, scope: !14)
!22 = !DILocation(line: 35, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 33, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!25 = !DILocation(line: 35, column: 14, scope: !23)
!26 = !DILocation(line: 36, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 36, column: 13)
!28 = !DILocation(line: 36, column: 18, scope: !27)
!29 = !DILocation(line: 36, column: 13, scope: !23)
!30 = !DILocation(line: 36, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 36, column: 27)
!32 = !DILocalVariable(name: "source", scope: !33, file: !15, line: 39, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 11)
!37 = !DILocation(line: 39, column: 14, scope: !33)
!38 = !DILocation(line: 41, column: 9, scope: !33)
!39 = !DILocation(line: 42, column: 19, scope: !33)
!40 = !DILocation(line: 42, column: 9, scope: !33)
!41 = !DILocation(line: 43, column: 14, scope: !33)
!42 = !DILocation(line: 43, column: 9, scope: !33)
!43 = !DILocation(line: 45, column: 1, scope: !14)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_03_good", scope: !15, file: !15, line: 96, type: !16, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!45 = !DILocation(line: 98, column: 5, scope: !44)
!46 = !DILocation(line: 99, column: 5, scope: !44)
!47 = !DILocation(line: 100, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 112, type: !49, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !15, line: 112, type: !51)
!54 = !DILocation(line: 112, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !15, line: 112, type: !52)
!56 = !DILocation(line: 112, column: 27, scope: !48)
!57 = !DILocation(line: 115, column: 22, scope: !48)
!58 = !DILocation(line: 115, column: 12, scope: !48)
!59 = !DILocation(line: 115, column: 5, scope: !48)
!60 = !DILocation(line: 117, column: 5, scope: !48)
!61 = !DILocation(line: 118, column: 5, scope: !48)
!62 = !DILocation(line: 119, column: 5, scope: !48)
!63 = !DILocation(line: 122, column: 5, scope: !48)
!64 = !DILocation(line: 123, column: 5, scope: !48)
!65 = !DILocation(line: 124, column: 5, scope: !48)
!66 = !DILocation(line: 126, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!68 = !DILocalVariable(name: "data", scope: !67, file: !15, line: 54, type: !3)
!69 = !DILocation(line: 54, column: 12, scope: !67)
!70 = !DILocation(line: 55, column: 10, scope: !67)
!71 = !DILocation(line: 64, column: 24, scope: !72)
!72 = distinct !DILexicalBlock(scope: !73, file: !15, line: 62, column: 5)
!73 = distinct !DILexicalBlock(scope: !67, file: !15, line: 56, column: 8)
!74 = !DILocation(line: 64, column: 14, scope: !72)
!75 = !DILocation(line: 65, column: 13, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 65, column: 13)
!77 = !DILocation(line: 65, column: 18, scope: !76)
!78 = !DILocation(line: 65, column: 13, scope: !72)
!79 = !DILocation(line: 65, column: 28, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !15, line: 65, column: 27)
!81 = !DILocalVariable(name: "source", scope: !82, file: !15, line: 68, type: !34)
!82 = distinct !DILexicalBlock(scope: !67, file: !15, line: 67, column: 5)
!83 = !DILocation(line: 68, column: 14, scope: !82)
!84 = !DILocation(line: 70, column: 9, scope: !82)
!85 = !DILocation(line: 71, column: 19, scope: !82)
!86 = !DILocation(line: 71, column: 9, scope: !82)
!87 = !DILocation(line: 72, column: 14, scope: !82)
!88 = !DILocation(line: 72, column: 9, scope: !82)
!89 = !DILocation(line: 74, column: 1, scope: !67)
!90 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!91 = !DILocalVariable(name: "data", scope: !90, file: !15, line: 79, type: !3)
!92 = !DILocation(line: 79, column: 12, scope: !90)
!93 = !DILocation(line: 80, column: 10, scope: !90)
!94 = !DILocation(line: 84, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !96, file: !15, line: 82, column: 5)
!96 = distinct !DILexicalBlock(scope: !90, file: !15, line: 81, column: 8)
!97 = !DILocation(line: 84, column: 14, scope: !95)
!98 = !DILocation(line: 85, column: 13, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 85, column: 13)
!100 = !DILocation(line: 85, column: 18, scope: !99)
!101 = !DILocation(line: 85, column: 13, scope: !95)
!102 = !DILocation(line: 85, column: 28, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 85, column: 27)
!104 = !DILocalVariable(name: "source", scope: !105, file: !15, line: 88, type: !34)
!105 = distinct !DILexicalBlock(scope: !90, file: !15, line: 87, column: 5)
!106 = !DILocation(line: 88, column: 14, scope: !105)
!107 = !DILocation(line: 90, column: 9, scope: !105)
!108 = !DILocation(line: 91, column: 19, scope: !105)
!109 = !DILocation(line: 91, column: 9, scope: !105)
!110 = !DILocation(line: 92, column: 14, scope: !105)
!111 = !DILocation(line: 92, column: 9, scope: !105)
!112 = !DILocation(line: 94, column: 1, scope: !90)
