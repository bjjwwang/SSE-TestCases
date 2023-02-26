; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 200) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !31, metadata !DIExpression()), !dbg !36
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %4 = bitcast i32* %3 to i8*, !dbg !37
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %5 = bitcast i32* %arraydecay to i8*, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !37
  %7 = bitcast i32* %6 to i8*, !dbg !37
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !37
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 400, i64 noundef %8) #9, !dbg !37
  %9 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !38
  %10 = load i32, i32* %arrayidx, align 4, !dbg !38
  call void @printIntLine(i32 noundef %10), !dbg !39
  %11 = load i32*, i32** %data, align 8, !dbg !40
  %12 = bitcast i32* %11 to i8*, !dbg !40
  call void @free(i8* noundef %12), !dbg !41
  ret void, !dbg !42
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15_good() #0 !dbg !43 {
entry:
  call void @goodG2B1(), !dbg !44
  call void @goodG2B2(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !47 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i32* null, i32** %data, align 8, !dbg !70
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !71
  %0 = bitcast i8* %call to i32*, !dbg !72
  store i32* %0, i32** %data, align 8, !dbg !73
  %1 = load i32*, i32** %data, align 8, !dbg !74
  %cmp = icmp eq i32* %1, null, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !78
  unreachable, !dbg !78

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !82
  %3 = load i32*, i32** %data, align 8, !dbg !83
  %4 = bitcast i32* %3 to i8*, !dbg !83
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !83
  %5 = bitcast i32* %arraydecay to i8*, !dbg !83
  %6 = load i32*, i32** %data, align 8, !dbg !83
  %7 = bitcast i32* %6 to i8*, !dbg !83
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !83
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 400, i64 noundef %8) #9, !dbg !83
  %9 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !84
  %10 = load i32, i32* %arrayidx, align 4, !dbg !84
  call void @printIntLine(i32 noundef %10), !dbg !85
  %11 = load i32*, i32** %data, align 8, !dbg !86
  %12 = bitcast i32* %11 to i8*, !dbg !86
  call void @free(i8* noundef %12), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !89 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i32* null, i32** %data, align 8, !dbg !92
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !93
  %0 = bitcast i8* %call to i32*, !dbg !94
  store i32* %0, i32** %data, align 8, !dbg !95
  %1 = load i32*, i32** %data, align 8, !dbg !96
  %cmp = icmp eq i32* %1, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !104
  %3 = load i32*, i32** %data, align 8, !dbg !105
  %4 = bitcast i32* %3 to i8*, !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %5 = bitcast i32* %arraydecay to i8*, !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !105
  %7 = bitcast i32* %6 to i8*, !dbg !105
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !105
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 400, i64 noundef %8) #9, !dbg !105
  %9 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !106
  %10 = load i32, i32* %arrayidx, align 4, !dbg !106
  call void @printIntLine(i32 noundef %10), !dbg !107
  %11 = load i32*, i32** %data, align 8, !dbg !108
  %12 = bitcast i32* %11 to i8*, !dbg !108
  call void @free(i8* noundef %12), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 11, scope: !14)
!21 = !DILocation(line: 24, column: 10, scope: !14)
!22 = !DILocation(line: 29, column: 23, scope: !14)
!23 = !DILocation(line: 29, column: 16, scope: !14)
!24 = !DILocation(line: 29, column: 14, scope: !14)
!25 = !DILocation(line: 30, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 13)
!27 = !DILocation(line: 30, column: 18, scope: !26)
!28 = !DILocation(line: 30, column: 13, scope: !14)
!29 = !DILocation(line: 30, column: 28, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 30, column: 27)
!31 = !DILocalVariable(name: "source", scope: !32, file: !15, line: 38, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 38, column: 13, scope: !32)
!37 = !DILocation(line: 40, column: 9, scope: !32)
!38 = !DILocation(line: 41, column: 22, scope: !32)
!39 = !DILocation(line: 41, column: 9, scope: !32)
!40 = !DILocation(line: 42, column: 14, scope: !32)
!41 = !DILocation(line: 42, column: 9, scope: !32)
!42 = !DILocation(line: 44, column: 1, scope: !14)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_15_good", scope: !15, file: !15, line: 102, type: !16, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!44 = !DILocation(line: 104, column: 5, scope: !43)
!45 = !DILocation(line: 105, column: 5, scope: !43)
!46 = !DILocation(line: 106, column: 1, scope: !43)
!47 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 118, type: !48, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!48 = !DISubroutineType(types: !49)
!49 = !{!4, !4, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !15, line: 118, type: !4)
!54 = !DILocation(line: 118, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !15, line: 118, type: !50)
!56 = !DILocation(line: 118, column: 27, scope: !47)
!57 = !DILocation(line: 121, column: 22, scope: !47)
!58 = !DILocation(line: 121, column: 12, scope: !47)
!59 = !DILocation(line: 121, column: 5, scope: !47)
!60 = !DILocation(line: 123, column: 5, scope: !47)
!61 = !DILocation(line: 124, column: 5, scope: !47)
!62 = !DILocation(line: 125, column: 5, scope: !47)
!63 = !DILocation(line: 128, column: 5, scope: !47)
!64 = !DILocation(line: 129, column: 5, scope: !47)
!65 = !DILocation(line: 130, column: 5, scope: !47)
!66 = !DILocation(line: 132, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!68 = !DILocalVariable(name: "data", scope: !67, file: !15, line: 53, type: !3)
!69 = !DILocation(line: 53, column: 11, scope: !67)
!70 = !DILocation(line: 54, column: 10, scope: !67)
!71 = !DILocation(line: 63, column: 23, scope: !67)
!72 = !DILocation(line: 63, column: 16, scope: !67)
!73 = !DILocation(line: 63, column: 14, scope: !67)
!74 = !DILocation(line: 64, column: 13, scope: !75)
!75 = distinct !DILexicalBlock(scope: !67, file: !15, line: 64, column: 13)
!76 = !DILocation(line: 64, column: 18, scope: !75)
!77 = !DILocation(line: 64, column: 13, scope: !67)
!78 = !DILocation(line: 64, column: 28, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 64, column: 27)
!80 = !DILocalVariable(name: "source", scope: !81, file: !15, line: 68, type: !33)
!81 = distinct !DILexicalBlock(scope: !67, file: !15, line: 67, column: 5)
!82 = !DILocation(line: 68, column: 13, scope: !81)
!83 = !DILocation(line: 70, column: 9, scope: !81)
!84 = !DILocation(line: 71, column: 22, scope: !81)
!85 = !DILocation(line: 71, column: 9, scope: !81)
!86 = !DILocation(line: 72, column: 14, scope: !81)
!87 = !DILocation(line: 72, column: 9, scope: !81)
!88 = !DILocation(line: 74, column: 1, scope: !67)
!89 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 77, type: !16, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!90 = !DILocalVariable(name: "data", scope: !89, file: !15, line: 79, type: !3)
!91 = !DILocation(line: 79, column: 11, scope: !89)
!92 = !DILocation(line: 80, column: 10, scope: !89)
!93 = !DILocation(line: 85, column: 23, scope: !89)
!94 = !DILocation(line: 85, column: 16, scope: !89)
!95 = !DILocation(line: 85, column: 14, scope: !89)
!96 = !DILocation(line: 86, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !89, file: !15, line: 86, column: 13)
!98 = !DILocation(line: 86, column: 18, scope: !97)
!99 = !DILocation(line: 86, column: 13, scope: !89)
!100 = !DILocation(line: 86, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 86, column: 27)
!102 = !DILocalVariable(name: "source", scope: !103, file: !15, line: 94, type: !33)
!103 = distinct !DILexicalBlock(scope: !89, file: !15, line: 93, column: 5)
!104 = !DILocation(line: 94, column: 13, scope: !103)
!105 = !DILocation(line: 96, column: 9, scope: !103)
!106 = !DILocation(line: 97, column: 22, scope: !103)
!107 = !DILocation(line: 97, column: 9, scope: !103)
!108 = !DILocation(line: 98, column: 14, scope: !103)
!109 = !DILocation(line: 98, column: 9, scope: !103)
!110 = !DILocation(line: 100, column: 1, scope: !89)
