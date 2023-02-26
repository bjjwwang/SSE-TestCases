; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17_bad() #0 !dbg !14 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %i, align 4, !dbg !35
  %cmp1 = icmp slt i32 %1, 1, !dbg !37
  br i1 %cmp1, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !39
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #9, !dbg !39
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %6, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !54
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !55
  %8 = load i8*, i8** %data, align 8, !dbg !55
  %9 = load i8*, i8** %data, align 8, !dbg !55
  %call3 = call i64 @strlen(i8* noundef %9), !dbg !55
  %call4 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %call3, i64 noundef 50) #9, !dbg !55
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !56
  store i8 0, i8* %arrayidx5, align 1, !dbg !57
  %10 = load i8*, i8** %data, align 8, !dbg !58
  call void @printLine(i8* noundef %10), !dbg !59
  %11 = load i8*, i8** %data, align 8, !dbg !60
  call void @free(i8* noundef %11), !dbg !61
  ret void, !dbg !62
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
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17_good() #0 !dbg !63 {
entry:
  call void @goodG2B(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* noundef null), !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 noundef %conv), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !89
  store i8* %call, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %cmp = icmp eq i8* %0, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  store i32 0, i32* %h, align 4, !dbg !97
  br label %for.cond, !dbg !99

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i32, i32* %h, align 4, !dbg !100
  %cmp1 = icmp slt i32 %1, 1, !dbg !102
  br i1 %cmp1, label %for.body, label %for.end, !dbg !103

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !104
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !104
  %5 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !109
  %inc = add nsw i32 %6, 1, !dbg !109
  store i32 %inc, i32* %h, align 4, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !115
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !115
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !116
  %8 = load i8*, i8** %data, align 8, !dbg !116
  %9 = load i8*, i8** %data, align 8, !dbg !116
  %call3 = call i64 @strlen(i8* noundef %9), !dbg !116
  %call4 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef %call3, i64 noundef 50) #9, !dbg !116
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !117
  store i8 0, i8* %arrayidx5, align 1, !dbg !118
  %10 = load i8*, i8** %data, align 8, !dbg !119
  call void @printLine(i8* noundef %10), !dbg !120
  %11 = load i8*, i8** %data, align 8, !dbg !121
  call void @free(i8* noundef %11), !dbg !122
  ret void, !dbg !123
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "i", scope: !14, file: !15, line: 25, type: !20)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DILocation(line: 25, column: 9, scope: !14)
!22 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 26, type: !3)
!23 = !DILocation(line: 26, column: 12, scope: !14)
!24 = !DILocation(line: 27, column: 20, scope: !14)
!25 = !DILocation(line: 27, column: 10, scope: !14)
!26 = !DILocation(line: 28, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 9)
!28 = !DILocation(line: 28, column: 14, scope: !27)
!29 = !DILocation(line: 28, column: 9, scope: !14)
!30 = !DILocation(line: 28, column: 24, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 28, column: 23)
!32 = !DILocation(line: 29, column: 11, scope: !33)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!34 = !DILocation(line: 29, column: 9, scope: !33)
!35 = !DILocation(line: 29, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !15, line: 29, column: 5)
!37 = !DILocation(line: 29, column: 18, scope: !36)
!38 = !DILocation(line: 29, column: 5, scope: !33)
!39 = !DILocation(line: 32, column: 9, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 30, column: 5)
!41 = !DILocation(line: 33, column: 9, scope: !40)
!42 = !DILocation(line: 33, column: 21, scope: !40)
!43 = !DILocation(line: 34, column: 5, scope: !40)
!44 = !DILocation(line: 29, column: 24, scope: !36)
!45 = !DILocation(line: 29, column: 5, scope: !36)
!46 = distinct !{!46, !38, !47, !48}
!47 = !DILocation(line: 34, column: 5, scope: !33)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "dest", scope: !50, file: !15, line: 36, type: !51)
!50 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 36, column: 14, scope: !50)
!55 = !DILocation(line: 38, column: 9, scope: !50)
!56 = !DILocation(line: 39, column: 9, scope: !50)
!57 = !DILocation(line: 39, column: 20, scope: !50)
!58 = !DILocation(line: 40, column: 19, scope: !50)
!59 = !DILocation(line: 40, column: 9, scope: !50)
!60 = !DILocation(line: 41, column: 14, scope: !50)
!61 = !DILocation(line: 41, column: 9, scope: !50)
!62 = !DILocation(line: 43, column: 1, scope: !14)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_17_good", scope: !15, file: !15, line: 72, type: !16, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!64 = !DILocation(line: 74, column: 5, scope: !63)
!65 = !DILocation(line: 75, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 87, type: !67, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!67 = !DISubroutineType(types: !68)
!68 = !{!20, !20, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 87, type: !20)
!71 = !DILocation(line: 87, column: 14, scope: !66)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 87, type: !69)
!73 = !DILocation(line: 87, column: 27, scope: !66)
!74 = !DILocation(line: 90, column: 22, scope: !66)
!75 = !DILocation(line: 90, column: 12, scope: !66)
!76 = !DILocation(line: 90, column: 5, scope: !66)
!77 = !DILocation(line: 92, column: 5, scope: !66)
!78 = !DILocation(line: 93, column: 5, scope: !66)
!79 = !DILocation(line: 94, column: 5, scope: !66)
!80 = !DILocation(line: 97, column: 5, scope: !66)
!81 = !DILocation(line: 98, column: 5, scope: !66)
!82 = !DILocation(line: 99, column: 5, scope: !66)
!83 = !DILocation(line: 101, column: 5, scope: !66)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!85 = !DILocalVariable(name: "h", scope: !84, file: !15, line: 52, type: !20)
!86 = !DILocation(line: 52, column: 9, scope: !84)
!87 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 53, type: !3)
!88 = !DILocation(line: 53, column: 12, scope: !84)
!89 = !DILocation(line: 54, column: 20, scope: !84)
!90 = !DILocation(line: 54, column: 10, scope: !84)
!91 = !DILocation(line: 55, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !84, file: !15, line: 55, column: 9)
!93 = !DILocation(line: 55, column: 14, scope: !92)
!94 = !DILocation(line: 55, column: 9, scope: !84)
!95 = !DILocation(line: 55, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 55, column: 23)
!97 = !DILocation(line: 56, column: 11, scope: !98)
!98 = distinct !DILexicalBlock(scope: !84, file: !15, line: 56, column: 5)
!99 = !DILocation(line: 56, column: 9, scope: !98)
!100 = !DILocation(line: 56, column: 16, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !15, line: 56, column: 5)
!102 = !DILocation(line: 56, column: 18, scope: !101)
!103 = !DILocation(line: 56, column: 5, scope: !98)
!104 = !DILocation(line: 59, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !15, line: 57, column: 5)
!106 = !DILocation(line: 60, column: 9, scope: !105)
!107 = !DILocation(line: 60, column: 20, scope: !105)
!108 = !DILocation(line: 61, column: 5, scope: !105)
!109 = !DILocation(line: 56, column: 24, scope: !101)
!110 = !DILocation(line: 56, column: 5, scope: !101)
!111 = distinct !{!111, !103, !112, !48}
!112 = !DILocation(line: 61, column: 5, scope: !98)
!113 = !DILocalVariable(name: "dest", scope: !114, file: !15, line: 63, type: !51)
!114 = distinct !DILexicalBlock(scope: !84, file: !15, line: 62, column: 5)
!115 = !DILocation(line: 63, column: 14, scope: !114)
!116 = !DILocation(line: 65, column: 9, scope: !114)
!117 = !DILocation(line: 66, column: 9, scope: !114)
!118 = !DILocation(line: 66, column: 20, scope: !114)
!119 = !DILocation(line: 67, column: 19, scope: !114)
!120 = !DILocation(line: 67, column: 9, scope: !114)
!121 = !DILocation(line: 68, column: 14, scope: !114)
!122 = !DILocation(line: 68, column: 9, scope: !114)
!123 = !DILocation(line: 70, column: 1, scope: !84)
