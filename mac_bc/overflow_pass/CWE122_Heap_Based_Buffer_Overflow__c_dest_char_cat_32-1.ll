; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !30
  %1 = load i8*, i8** %0, align 8, !dbg !31
  store i8* %1, i8** %data1, align 8, !dbg !29
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !32
  store i8* %call, i8** %data1, align 8, !dbg !33
  %2 = load i8*, i8** %data1, align 8, !dbg !34
  %cmp = icmp eq i8* %2, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %4 = load i8*, i8** %data1, align 8, !dbg !42
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  store i8* %4, i8** %5, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !45, metadata !DIExpression()), !dbg !47
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !48
  %7 = load i8*, i8** %6, align 8, !dbg !49
  store i8* %7, i8** %data2, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx3, align 1, !dbg !58
  %8 = load i8*, i8** %data2, align 8, !dbg !59
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !59
  %9 = load i8*, i8** %data2, align 8, !dbg !59
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !59
  %call5 = call i8* @__strcat_chk(i8* noundef %8, i8* noundef %arraydecay4, i64 noundef %10) #9, !dbg !59
  %11 = load i8*, i8** %data2, align 8, !dbg !60
  call void @printLine(i8* noundef %11), !dbg !61
  %12 = load i8*, i8** %data2, align 8, !dbg !62
  call void @free(i8* noundef %12), !dbg !63
  ret void, !dbg !64
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* noundef null), !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 noundef %conv), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_good(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_bad(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !92
  store i8* null, i8** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !94, metadata !DIExpression()), !dbg !96
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !97
  %1 = load i8*, i8** %0, align 8, !dbg !98
  store i8* %1, i8** %data1, align 8, !dbg !96
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !99
  store i8* %call, i8** %data1, align 8, !dbg !100
  %2 = load i8*, i8** %data1, align 8, !dbg !101
  %cmp = icmp eq i8* %2, null, !dbg !103
  br i1 %cmp, label %if.then, label %if.end, !dbg !104

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !105
  unreachable, !dbg !105

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %4 = load i8*, i8** %data1, align 8, !dbg !109
  %5 = load i8**, i8*** %dataPtr1, align 8, !dbg !110
  store i8* %4, i8** %5, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !112, metadata !DIExpression()), !dbg !114
  %6 = load i8**, i8*** %dataPtr2, align 8, !dbg !115
  %7 = load i8*, i8** %6, align 8, !dbg !116
  store i8* %7, i8** %data2, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx3, align 1, !dbg !122
  %8 = load i8*, i8** %data2, align 8, !dbg !123
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  %9 = load i8*, i8** %data2, align 8, !dbg !123
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !123
  %call5 = call i8* @__strcat_chk(i8* noundef %8, i8* noundef %arraydecay4, i64 noundef %10) #9, !dbg !123
  %11 = load i8*, i8** %data2, align 8, !dbg !124
  call void @printLine(i8* noundef %11), !dbg !125
  %12 = load i8*, i8** %data2, align 8, !dbg !126
  call void @free(i8* noundef %12), !dbg !127
  ret void, !dbg !128
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!23 = !DILocation(line: 26, column: 13, scope: !14)
!24 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 13, scope: !14)
!26 = !DILocation(line: 28, column: 10, scope: !14)
!27 = !DILocalVariable(name: "data", scope: !28, file: !15, line: 30, type: !3)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 24, scope: !28)
!31 = !DILocation(line: 30, column: 23, scope: !28)
!32 = !DILocation(line: 32, column: 24, scope: !28)
!33 = !DILocation(line: 32, column: 14, scope: !28)
!34 = !DILocation(line: 33, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !15, line: 33, column: 13)
!36 = !DILocation(line: 33, column: 18, scope: !35)
!37 = !DILocation(line: 33, column: 13, scope: !28)
!38 = !DILocation(line: 33, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 33, column: 27)
!40 = !DILocation(line: 34, column: 9, scope: !28)
!41 = !DILocation(line: 34, column: 17, scope: !28)
!42 = !DILocation(line: 35, column: 21, scope: !28)
!43 = !DILocation(line: 35, column: 10, scope: !28)
!44 = !DILocation(line: 35, column: 19, scope: !28)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 38, type: !3)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 16, scope: !46)
!48 = !DILocation(line: 38, column: 24, scope: !46)
!49 = !DILocation(line: 38, column: 23, scope: !46)
!50 = !DILocalVariable(name: "source", scope: !51, file: !15, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 40, column: 18, scope: !51)
!56 = !DILocation(line: 41, column: 13, scope: !51)
!57 = !DILocation(line: 42, column: 13, scope: !51)
!58 = !DILocation(line: 42, column: 27, scope: !51)
!59 = !DILocation(line: 44, column: 13, scope: !51)
!60 = !DILocation(line: 45, column: 23, scope: !51)
!61 = !DILocation(line: 45, column: 13, scope: !51)
!62 = !DILocation(line: 46, column: 18, scope: !51)
!63 = !DILocation(line: 46, column: 13, scope: !51)
!64 = !DILocation(line: 49, column: 1, scope: !14)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cat_32_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!66 = !DILocation(line: 86, column: 5, scope: !65)
!67 = !DILocation(line: 87, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 98, type: !69, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !22}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !15, line: 98, type: !71)
!73 = !DILocation(line: 98, column: 14, scope: !68)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !15, line: 98, type: !22)
!75 = !DILocation(line: 98, column: 27, scope: !68)
!76 = !DILocation(line: 101, column: 22, scope: !68)
!77 = !DILocation(line: 101, column: 12, scope: !68)
!78 = !DILocation(line: 101, column: 5, scope: !68)
!79 = !DILocation(line: 103, column: 5, scope: !68)
!80 = !DILocation(line: 104, column: 5, scope: !68)
!81 = !DILocation(line: 105, column: 5, scope: !68)
!82 = !DILocation(line: 108, column: 5, scope: !68)
!83 = !DILocation(line: 109, column: 5, scope: !68)
!84 = !DILocation(line: 110, column: 5, scope: !68)
!85 = !DILocation(line: 112, column: 5, scope: !68)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 58, type: !3)
!88 = !DILocation(line: 58, column: 12, scope: !86)
!89 = !DILocalVariable(name: "dataPtr1", scope: !86, file: !15, line: 59, type: !22)
!90 = !DILocation(line: 59, column: 13, scope: !86)
!91 = !DILocalVariable(name: "dataPtr2", scope: !86, file: !15, line: 60, type: !22)
!92 = !DILocation(line: 60, column: 13, scope: !86)
!93 = !DILocation(line: 61, column: 10, scope: !86)
!94 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 63, type: !3)
!95 = distinct !DILexicalBlock(scope: !86, file: !15, line: 62, column: 5)
!96 = !DILocation(line: 63, column: 16, scope: !95)
!97 = !DILocation(line: 63, column: 24, scope: !95)
!98 = !DILocation(line: 63, column: 23, scope: !95)
!99 = !DILocation(line: 65, column: 24, scope: !95)
!100 = !DILocation(line: 65, column: 14, scope: !95)
!101 = !DILocation(line: 66, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !95, file: !15, line: 66, column: 13)
!103 = !DILocation(line: 66, column: 18, scope: !102)
!104 = !DILocation(line: 66, column: 13, scope: !95)
!105 = !DILocation(line: 66, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !15, line: 66, column: 27)
!107 = !DILocation(line: 67, column: 9, scope: !95)
!108 = !DILocation(line: 67, column: 17, scope: !95)
!109 = !DILocation(line: 68, column: 21, scope: !95)
!110 = !DILocation(line: 68, column: 10, scope: !95)
!111 = !DILocation(line: 68, column: 19, scope: !95)
!112 = !DILocalVariable(name: "data", scope: !113, file: !15, line: 71, type: !3)
!113 = distinct !DILexicalBlock(scope: !86, file: !15, line: 70, column: 5)
!114 = !DILocation(line: 71, column: 16, scope: !113)
!115 = !DILocation(line: 71, column: 24, scope: !113)
!116 = !DILocation(line: 71, column: 23, scope: !113)
!117 = !DILocalVariable(name: "source", scope: !118, file: !15, line: 73, type: !52)
!118 = distinct !DILexicalBlock(scope: !113, file: !15, line: 72, column: 9)
!119 = !DILocation(line: 73, column: 18, scope: !118)
!120 = !DILocation(line: 74, column: 13, scope: !118)
!121 = !DILocation(line: 75, column: 13, scope: !118)
!122 = !DILocation(line: 75, column: 27, scope: !118)
!123 = !DILocation(line: 77, column: 13, scope: !118)
!124 = !DILocation(line: 78, column: 23, scope: !118)
!125 = !DILocation(line: 78, column: 13, scope: !118)
!126 = !DILocation(line: 79, column: 18, scope: !118)
!127 = !DILocation(line: 79, column: 13, scope: !118)
!128 = !DILocation(line: 82, column: 1, scope: !86)
