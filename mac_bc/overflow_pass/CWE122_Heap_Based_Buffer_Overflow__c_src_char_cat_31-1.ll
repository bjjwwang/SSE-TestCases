; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
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
  %4 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %5, i8** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !36, metadata !DIExpression()), !dbg !37
  %6 = load i8*, i8** %dataCopy, align 8, !dbg !38
  store i8* %6, i8** %data2, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %8 = load i8*, i8** %data2, align 8, !dbg !45
  %call3 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef 50) #9, !dbg !45
  %9 = load i8*, i8** %data2, align 8, !dbg !46
  call void @printLine(i8* noundef %9), !dbg !47
  %10 = load i8*, i8** %data2, align 8, !dbg !48
  call void @free(i8* noundef %10), !dbg !49
  ret void, !dbg !50
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !76
  store i8* %call, i8** %data, align 8, !dbg !77
  %0 = load i8*, i8** %data, align 8, !dbg !78
  %cmp = icmp eq i8* %0, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !84
  %2 = load i8*, i8** %data, align 8, !dbg !84
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !84
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !84
  %4 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !87, metadata !DIExpression()), !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !90
  store i8* %5, i8** %dataCopy, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !91, metadata !DIExpression()), !dbg !92
  %6 = load i8*, i8** %dataCopy, align 8, !dbg !93
  store i8* %6, i8** %data2, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %8 = load i8*, i8** %data2, align 8, !dbg !97
  %call3 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %8, i64 noundef 50) #9, !dbg !97
  %9 = load i8*, i8** %data2, align 8, !dbg !98
  call void @printLine(i8* noundef %9), !dbg !99
  %10 = load i8*, i8** %data2, align 8, !dbg !100
  call void @free(i8* noundef %10), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 20, scope: !14)
!22 = !DILocation(line: 26, column: 10, scope: !14)
!23 = !DILocation(line: 27, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!25 = !DILocation(line: 27, column: 14, scope: !24)
!26 = !DILocation(line: 27, column: 9, scope: !14)
!27 = !DILocation(line: 27, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 27, column: 23)
!29 = !DILocation(line: 29, column: 5, scope: !14)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 30, column: 17, scope: !14)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !15, line: 32, type: !3)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 16, scope: !33)
!35 = !DILocation(line: 32, column: 27, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 33, type: !3)
!37 = !DILocation(line: 33, column: 16, scope: !33)
!38 = !DILocation(line: 33, column: 23, scope: !33)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !15, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !15, line: 34, column: 9)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 35, column: 18, scope: !40)
!45 = !DILocation(line: 37, column: 13, scope: !40)
!46 = !DILocation(line: 38, column: 23, scope: !40)
!47 = !DILocation(line: 38, column: 13, scope: !40)
!48 = !DILocation(line: 39, column: 18, scope: !40)
!49 = !DILocation(line: 39, column: 13, scope: !40)
!50 = !DILocation(line: 42, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_31_good", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!52 = !DILocation(line: 72, column: 5, scope: !51)
!53 = !DILocation(line: 73, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 84, type: !55, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !15, line: 84, type: !57)
!60 = !DILocation(line: 84, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !15, line: 84, type: !58)
!62 = !DILocation(line: 84, column: 27, scope: !54)
!63 = !DILocation(line: 87, column: 22, scope: !54)
!64 = !DILocation(line: 87, column: 12, scope: !54)
!65 = !DILocation(line: 87, column: 5, scope: !54)
!66 = !DILocation(line: 89, column: 5, scope: !54)
!67 = !DILocation(line: 90, column: 5, scope: !54)
!68 = !DILocation(line: 91, column: 5, scope: !54)
!69 = !DILocation(line: 94, column: 5, scope: !54)
!70 = !DILocation(line: 95, column: 5, scope: !54)
!71 = !DILocation(line: 96, column: 5, scope: !54)
!72 = !DILocation(line: 98, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 51, type: !3)
!75 = !DILocation(line: 51, column: 12, scope: !73)
!76 = !DILocation(line: 52, column: 20, scope: !73)
!77 = !DILocation(line: 52, column: 10, scope: !73)
!78 = !DILocation(line: 53, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !73, file: !15, line: 53, column: 9)
!80 = !DILocation(line: 53, column: 14, scope: !79)
!81 = !DILocation(line: 53, column: 9, scope: !73)
!82 = !DILocation(line: 53, column: 24, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 53, column: 23)
!84 = !DILocation(line: 55, column: 5, scope: !73)
!85 = !DILocation(line: 56, column: 5, scope: !73)
!86 = !DILocation(line: 56, column: 16, scope: !73)
!87 = !DILocalVariable(name: "dataCopy", scope: !88, file: !15, line: 58, type: !3)
!88 = distinct !DILexicalBlock(scope: !73, file: !15, line: 57, column: 5)
!89 = !DILocation(line: 58, column: 16, scope: !88)
!90 = !DILocation(line: 58, column: 27, scope: !88)
!91 = !DILocalVariable(name: "data", scope: !88, file: !15, line: 59, type: !3)
!92 = !DILocation(line: 59, column: 16, scope: !88)
!93 = !DILocation(line: 59, column: 23, scope: !88)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !15, line: 61, type: !41)
!95 = distinct !DILexicalBlock(scope: !88, file: !15, line: 60, column: 9)
!96 = !DILocation(line: 61, column: 18, scope: !95)
!97 = !DILocation(line: 63, column: 13, scope: !95)
!98 = !DILocation(line: 64, column: 23, scope: !95)
!99 = !DILocation(line: 64, column: 13, scope: !95)
!100 = !DILocation(line: 65, column: 18, scope: !95)
!101 = !DILocation(line: 65, column: 13, scope: !95)
!102 = !DILocation(line: 68, column: 1, scope: !73)
