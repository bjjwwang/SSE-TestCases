; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  %0 = load i8*, i8** %data, align 8, !dbg !24
  %cmp = icmp eq i8* %0, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !32, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !38
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx1, align 1, !dbg !40
  %2 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !41
  %3 = load i8*, i8** %data, align 8, !dbg !41
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !41
  %call3 = call i8* @__strcat_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef %4) #9, !dbg !41
  %5 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %5), !dbg !43
  %6 = load i8*, i8** %data, align 8, !dbg !44
  call void @free(i8* noundef %6), !dbg !45
  ret void, !dbg !46
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
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  store i8* null, i8** %data, align 8, !dbg !73
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !74
  store i8* %call, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %cmp = icmp eq i8* %0, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !82
  store i8 0, i8* %arrayidx, align 1, !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !87
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx1, align 1, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !90
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !90
  %call3 = call i8* @__strcat_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef %4) #9, !dbg !90
  %5 = load i8*, i8** %data, align 8, !dbg !91
  call void @printLine(i8* noundef %5), !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  call void @free(i8* noundef %6), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i8* null, i8** %data, align 8, !dbg !99
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !100
  store i8* %call, i8** %data, align 8, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %cmp = icmp eq i8* %0, null, !dbg !104
  br i1 %cmp, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !106
  unreachable, !dbg !106

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !113
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !114
  store i8 0, i8* %arrayidx1, align 1, !dbg !115
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !116
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !116
  %call3 = call i8* @__strcat_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef %4) #9, !dbg !116
  %5 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* noundef %5), !dbg !118
  %6 = load i8*, i8** %data, align 8, !dbg !119
  call void @free(i8* noundef %6), !dbg !120
  ret void, !dbg !121
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
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 31, column: 24, scope: !14)
!23 = !DILocation(line: 31, column: 14, scope: !14)
!24 = !DILocation(line: 32, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 13)
!26 = !DILocation(line: 32, column: 18, scope: !25)
!27 = !DILocation(line: 32, column: 13, scope: !14)
!28 = !DILocation(line: 32, column: 28, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 32, column: 27)
!30 = !DILocation(line: 33, column: 9, scope: !14)
!31 = !DILocation(line: 33, column: 17, scope: !14)
!32 = !DILocalVariable(name: "source", scope: !33, file: !15, line: 41, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 41, column: 14, scope: !33)
!38 = !DILocation(line: 42, column: 9, scope: !33)
!39 = !DILocation(line: 43, column: 9, scope: !33)
!40 = !DILocation(line: 43, column: 23, scope: !33)
!41 = !DILocation(line: 45, column: 9, scope: !33)
!42 = !DILocation(line: 46, column: 19, scope: !33)
!43 = !DILocation(line: 46, column: 9, scope: !33)
!44 = !DILocation(line: 47, column: 14, scope: !33)
!45 = !DILocation(line: 47, column: 9, scope: !33)
!46 = !DILocation(line: 49, column: 1, scope: !14)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_15_good", scope: !15, file: !15, line: 113, type: !16, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!48 = !DILocation(line: 115, column: 5, scope: !47)
!49 = !DILocation(line: 116, column: 5, scope: !47)
!50 = !DILocation(line: 117, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 129, type: !52, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !15, line: 129, type: !54)
!57 = !DILocation(line: 129, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !15, line: 129, type: !55)
!59 = !DILocation(line: 129, column: 27, scope: !51)
!60 = !DILocation(line: 132, column: 22, scope: !51)
!61 = !DILocation(line: 132, column: 12, scope: !51)
!62 = !DILocation(line: 132, column: 5, scope: !51)
!63 = !DILocation(line: 134, column: 5, scope: !51)
!64 = !DILocation(line: 135, column: 5, scope: !51)
!65 = !DILocation(line: 136, column: 5, scope: !51)
!66 = !DILocation(line: 139, column: 5, scope: !51)
!67 = !DILocation(line: 140, column: 5, scope: !51)
!68 = !DILocation(line: 141, column: 5, scope: !51)
!69 = !DILocation(line: 143, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!71 = !DILocalVariable(name: "data", scope: !70, file: !15, line: 58, type: !3)
!72 = !DILocation(line: 58, column: 12, scope: !70)
!73 = !DILocation(line: 59, column: 10, scope: !70)
!74 = !DILocation(line: 68, column: 24, scope: !70)
!75 = !DILocation(line: 68, column: 14, scope: !70)
!76 = !DILocation(line: 69, column: 13, scope: !77)
!77 = distinct !DILexicalBlock(scope: !70, file: !15, line: 69, column: 13)
!78 = !DILocation(line: 69, column: 18, scope: !77)
!79 = !DILocation(line: 69, column: 13, scope: !70)
!80 = !DILocation(line: 69, column: 28, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 69, column: 27)
!82 = !DILocation(line: 70, column: 9, scope: !70)
!83 = !DILocation(line: 70, column: 17, scope: !70)
!84 = !DILocalVariable(name: "source", scope: !85, file: !15, line: 74, type: !34)
!85 = distinct !DILexicalBlock(scope: !70, file: !15, line: 73, column: 5)
!86 = !DILocation(line: 74, column: 14, scope: !85)
!87 = !DILocation(line: 75, column: 9, scope: !85)
!88 = !DILocation(line: 76, column: 9, scope: !85)
!89 = !DILocation(line: 76, column: 23, scope: !85)
!90 = !DILocation(line: 78, column: 9, scope: !85)
!91 = !DILocation(line: 79, column: 19, scope: !85)
!92 = !DILocation(line: 79, column: 9, scope: !85)
!93 = !DILocation(line: 80, column: 14, scope: !85)
!94 = !DILocation(line: 80, column: 9, scope: !85)
!95 = !DILocation(line: 82, column: 1, scope: !70)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 85, type: !16, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!97 = !DILocalVariable(name: "data", scope: !96, file: !15, line: 87, type: !3)
!98 = !DILocation(line: 87, column: 12, scope: !96)
!99 = !DILocation(line: 88, column: 10, scope: !96)
!100 = !DILocation(line: 93, column: 24, scope: !96)
!101 = !DILocation(line: 93, column: 14, scope: !96)
!102 = !DILocation(line: 94, column: 13, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !15, line: 94, column: 13)
!104 = !DILocation(line: 94, column: 18, scope: !103)
!105 = !DILocation(line: 94, column: 13, scope: !96)
!106 = !DILocation(line: 94, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !15, line: 94, column: 27)
!108 = !DILocation(line: 95, column: 9, scope: !96)
!109 = !DILocation(line: 95, column: 17, scope: !96)
!110 = !DILocalVariable(name: "source", scope: !111, file: !15, line: 103, type: !34)
!111 = distinct !DILexicalBlock(scope: !96, file: !15, line: 102, column: 5)
!112 = !DILocation(line: 103, column: 14, scope: !111)
!113 = !DILocation(line: 104, column: 9, scope: !111)
!114 = !DILocation(line: 105, column: 9, scope: !111)
!115 = !DILocation(line: 105, column: 23, scope: !111)
!116 = !DILocation(line: 107, column: 9, scope: !111)
!117 = !DILocation(line: 108, column: 19, scope: !111)
!118 = !DILocation(line: 108, column: 9, scope: !111)
!119 = !DILocation(line: 109, column: 14, scope: !111)
!120 = !DILocation(line: 109, column: 9, scope: !111)
!121 = !DILocation(line: 111, column: 1, scope: !96)
