; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_badSink(i8* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !27
  %1 = load i8*, i8** %data.addr, align 8, !dbg !27
  %call = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef 50) #7, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !28
  call void @printLine(i8* noundef %2), !dbg !29
  %3 = load i8*, i8** %data.addr, align 8, !dbg !30
  call void @free(i8* noundef %3), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #3

declare void @printLine(i8* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !36, metadata !DIExpression()), !dbg !37
  %call = call i8* @malloc(i64 noundef 100) #8, !dbg !38
  store i8* %call, i8** %data, align 8, !dbg !39
  %0 = load i8*, i8** %data, align 8, !dbg !40
  %cmp = icmp eq i8* %0, null, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !46
  %2 = load i8*, i8** %data, align 8, !dbg !46
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !46
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #7, !dbg !46
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !47
  store i8 0, i8* %arrayidx, align 1, !dbg !48
  %5 = load i8*, i8** %data, align 8, !dbg !49
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_badSink(i8* noundef %5), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #5

; Function Attrs: noreturn
declare void @exit(i32 noundef) #6

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_goodG2BSink(i8* noundef %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !57
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !57
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !58
  %1 = load i8*, i8** %data.addr, align 8, !dbg !58
  %call = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef 50) #7, !dbg !58
  %2 = load i8*, i8** %data.addr, align 8, !dbg !59
  call void @printLine(i8* noundef %2), !dbg !60
  %3 = load i8*, i8** %data.addr, align 8, !dbg !61
  call void @free(i8* noundef %3), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !67 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_good(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_bad(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i8* @malloc(i64 noundef 100) #8, !dbg !89
  store i8* %call, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %cmp = icmp eq i8* %0, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !97
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #7, !dbg !97
  %4 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %5 = load i8*, i8** %data, align 8, !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_goodG2BSink(i8* noundef %5), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !3}
!18 = !{}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 74, scope: !14)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !15, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 26, column: 14, scope: !22)
!27 = !DILocation(line: 28, column: 9, scope: !22)
!28 = !DILocation(line: 29, column: 19, scope: !22)
!29 = !DILocation(line: 29, column: 9, scope: !22)
!30 = !DILocation(line: 30, column: 14, scope: !22)
!31 = !DILocation(line: 30, column: 9, scope: !22)
!32 = !DILocation(line: 32, column: 1, scope: !14)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_bad", scope: !15, file: !15, line: 34, type: !34, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 36, type: !3)
!37 = !DILocation(line: 36, column: 12, scope: !33)
!38 = !DILocation(line: 37, column: 20, scope: !33)
!39 = !DILocation(line: 37, column: 10, scope: !33)
!40 = !DILocation(line: 38, column: 9, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !15, line: 38, column: 9)
!42 = !DILocation(line: 38, column: 14, scope: !41)
!43 = !DILocation(line: 38, column: 9, scope: !33)
!44 = !DILocation(line: 38, column: 24, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !15, line: 38, column: 23)
!46 = !DILocation(line: 40, column: 5, scope: !33)
!47 = !DILocation(line: 41, column: 5, scope: !33)
!48 = !DILocation(line: 41, column: 17, scope: !33)
!49 = !DILocation(line: 42, column: 66, scope: !33)
!50 = !DILocation(line: 42, column: 5, scope: !33)
!51 = !DILocation(line: 43, column: 1, scope: !33)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_goodG2BSink", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!53 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !15, line: 49, type: !3)
!54 = !DILocation(line: 49, column: 78, scope: !52)
!55 = !DILocalVariable(name: "dest", scope: !56, file: !15, line: 52, type: !23)
!56 = distinct !DILexicalBlock(scope: !52, file: !15, line: 51, column: 5)
!57 = !DILocation(line: 52, column: 14, scope: !56)
!58 = !DILocation(line: 54, column: 9, scope: !56)
!59 = !DILocation(line: 55, column: 19, scope: !56)
!60 = !DILocation(line: 55, column: 9, scope: !56)
!61 = !DILocation(line: 56, column: 14, scope: !56)
!62 = !DILocation(line: 56, column: 9, scope: !56)
!63 = !DILocation(line: 58, column: 1, scope: !52)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_41_good", scope: !15, file: !15, line: 72, type: !34, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!65 = !DILocation(line: 74, column: 5, scope: !64)
!66 = !DILocation(line: 75, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 87, type: !68, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !71}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 87, type: !70)
!73 = !DILocation(line: 87, column: 14, scope: !67)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 87, type: !71)
!75 = !DILocation(line: 87, column: 27, scope: !67)
!76 = !DILocation(line: 90, column: 22, scope: !67)
!77 = !DILocation(line: 90, column: 12, scope: !67)
!78 = !DILocation(line: 90, column: 5, scope: !67)
!79 = !DILocation(line: 92, column: 5, scope: !67)
!80 = !DILocation(line: 93, column: 5, scope: !67)
!81 = !DILocation(line: 94, column: 5, scope: !67)
!82 = !DILocation(line: 97, column: 5, scope: !67)
!83 = !DILocation(line: 98, column: 5, scope: !67)
!84 = !DILocation(line: 99, column: 5, scope: !67)
!85 = !DILocation(line: 101, column: 5, scope: !67)
!86 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !34, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 63, type: !3)
!88 = !DILocation(line: 63, column: 12, scope: !86)
!89 = !DILocation(line: 64, column: 20, scope: !86)
!90 = !DILocation(line: 64, column: 10, scope: !86)
!91 = !DILocation(line: 65, column: 9, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !15, line: 65, column: 9)
!93 = !DILocation(line: 65, column: 14, scope: !92)
!94 = !DILocation(line: 65, column: 9, scope: !86)
!95 = !DILocation(line: 65, column: 24, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !15, line: 65, column: 23)
!97 = !DILocation(line: 67, column: 5, scope: !86)
!98 = !DILocation(line: 68, column: 5, scope: !86)
!99 = !DILocation(line: 68, column: 16, scope: !86)
!100 = !DILocation(line: 69, column: 70, scope: !86)
!101 = !DILocation(line: 69, column: 5, scope: !86)
!102 = !DILocation(line: 70, column: 1, scope: !86)
