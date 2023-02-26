; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !29
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !29
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !29
  %4 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !34, metadata !DIExpression()), !dbg !39
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !39
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !40
  %6 = load i8*, i8** %data, align 8, !dbg !40
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef 50) #9, !dbg !40
  %7 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* noundef %7), !dbg !42
  %8 = load i8*, i8** %data, align 8, !dbg !43
  call void @free(i8* noundef %8), !dbg !44
  ret void, !dbg !45
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
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #4

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !72
  store i8* %call, i8** %data, align 8, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  %cmp = icmp eq i8* %0, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !80
  %2 = load i8*, i8** %data, align 8, !dbg !80
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !80
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !80
  %4 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !87
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !88
  %6 = load i8*, i8** %data, align 8, !dbg !88
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef 50) #9, !dbg !88
  %7 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* noundef %7), !dbg !90
  %8 = load i8*, i8** %data, align 8, !dbg !91
  call void @free(i8* noundef %8), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !97
  store i8* %call, i8** %data, align 8, !dbg !98
  %0 = load i8*, i8** %data, align 8, !dbg !99
  %cmp = icmp eq i8* %0, null, !dbg !101
  br i1 %cmp, label %if.then, label %if.end, !dbg !102

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !103
  unreachable, !dbg !103

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !105
  %2 = load i8*, i8** %data, align 8, !dbg !105
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !105
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !105
  %4 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !113
  %6 = load i8*, i8** %data, align 8, !dbg !113
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef 50) #9, !dbg !113
  %7 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* noundef %7), !dbg !115
  %8 = load i8*, i8** %data, align 8, !dbg !116
  call void @free(i8* noundef %8), !dbg !117
  ret void, !dbg !118
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !3)
!20 = !DILocation(line: 29, column: 12, scope: !14)
!21 = !DILocation(line: 30, column: 20, scope: !14)
!22 = !DILocation(line: 30, column: 10, scope: !14)
!23 = !DILocation(line: 31, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 9)
!25 = !DILocation(line: 31, column: 14, scope: !24)
!26 = !DILocation(line: 31, column: 9, scope: !14)
!27 = !DILocation(line: 31, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 31, column: 23)
!29 = !DILocation(line: 35, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !15, line: 33, column: 5)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 8)
!32 = !DILocation(line: 36, column: 9, scope: !30)
!33 = !DILocation(line: 36, column: 21, scope: !30)
!34 = !DILocalVariable(name: "dest", scope: !35, file: !15, line: 39, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 50)
!39 = !DILocation(line: 39, column: 14, scope: !35)
!40 = !DILocation(line: 41, column: 9, scope: !35)
!41 = !DILocation(line: 42, column: 19, scope: !35)
!42 = !DILocation(line: 42, column: 9, scope: !35)
!43 = !DILocation(line: 43, column: 14, scope: !35)
!44 = !DILocation(line: 43, column: 9, scope: !35)
!45 = !DILocation(line: 45, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_06_good", scope: !15, file: !15, line: 98, type: !16, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!47 = !DILocation(line: 100, column: 5, scope: !46)
!48 = !DILocation(line: 101, column: 5, scope: !46)
!49 = !DILocation(line: 102, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 114, type: !51, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !15, line: 114, type: !53)
!56 = !DILocation(line: 114, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !15, line: 114, type: !54)
!58 = !DILocation(line: 114, column: 27, scope: !50)
!59 = !DILocation(line: 117, column: 22, scope: !50)
!60 = !DILocation(line: 117, column: 12, scope: !50)
!61 = !DILocation(line: 117, column: 5, scope: !50)
!62 = !DILocation(line: 119, column: 5, scope: !50)
!63 = !DILocation(line: 120, column: 5, scope: !50)
!64 = !DILocation(line: 121, column: 5, scope: !50)
!65 = !DILocation(line: 124, column: 5, scope: !50)
!66 = !DILocation(line: 125, column: 5, scope: !50)
!67 = !DILocation(line: 126, column: 5, scope: !50)
!68 = !DILocation(line: 128, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 54, type: !3)
!71 = !DILocation(line: 54, column: 12, scope: !69)
!72 = !DILocation(line: 55, column: 20, scope: !69)
!73 = !DILocation(line: 55, column: 10, scope: !69)
!74 = !DILocation(line: 56, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !15, line: 56, column: 9)
!76 = !DILocation(line: 56, column: 14, scope: !75)
!77 = !DILocation(line: 56, column: 9, scope: !69)
!78 = !DILocation(line: 56, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 56, column: 23)
!80 = !DILocation(line: 65, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !15, line: 63, column: 5)
!82 = distinct !DILexicalBlock(scope: !69, file: !15, line: 57, column: 8)
!83 = !DILocation(line: 66, column: 9, scope: !81)
!84 = !DILocation(line: 66, column: 20, scope: !81)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !15, line: 69, type: !36)
!86 = distinct !DILexicalBlock(scope: !69, file: !15, line: 68, column: 5)
!87 = !DILocation(line: 69, column: 14, scope: !86)
!88 = !DILocation(line: 71, column: 9, scope: !86)
!89 = !DILocation(line: 72, column: 19, scope: !86)
!90 = !DILocation(line: 72, column: 9, scope: !86)
!91 = !DILocation(line: 73, column: 14, scope: !86)
!92 = !DILocation(line: 73, column: 9, scope: !86)
!93 = !DILocation(line: 75, column: 1, scope: !69)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!95 = !DILocalVariable(name: "data", scope: !94, file: !15, line: 80, type: !3)
!96 = !DILocation(line: 80, column: 12, scope: !94)
!97 = !DILocation(line: 81, column: 20, scope: !94)
!98 = !DILocation(line: 81, column: 10, scope: !94)
!99 = !DILocation(line: 82, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !15, line: 82, column: 9)
!101 = !DILocation(line: 82, column: 14, scope: !100)
!102 = !DILocation(line: 82, column: 9, scope: !94)
!103 = !DILocation(line: 82, column: 24, scope: !104)
!104 = distinct !DILexicalBlock(scope: !100, file: !15, line: 82, column: 23)
!105 = !DILocation(line: 86, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !15, line: 84, column: 5)
!107 = distinct !DILexicalBlock(scope: !94, file: !15, line: 83, column: 8)
!108 = !DILocation(line: 87, column: 9, scope: !106)
!109 = !DILocation(line: 87, column: 20, scope: !106)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !15, line: 90, type: !36)
!111 = distinct !DILexicalBlock(scope: !94, file: !15, line: 89, column: 5)
!112 = !DILocation(line: 90, column: 14, scope: !111)
!113 = !DILocation(line: 92, column: 9, scope: !111)
!114 = !DILocation(line: 93, column: 19, scope: !111)
!115 = !DILocation(line: 93, column: 9, scope: !111)
!116 = !DILocation(line: 94, column: 14, scope: !111)
!117 = !DILocation(line: 94, column: 9, scope: !111)
!118 = !DILocation(line: 96, column: 1, scope: !94)
