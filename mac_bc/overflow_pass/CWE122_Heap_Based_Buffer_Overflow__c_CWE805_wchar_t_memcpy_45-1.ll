; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_goodG2BData = internal global i32* null, align 8, !dbg !14

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  %call = call i8* @malloc(i64 noundef 200) #6, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %data, align 8, !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %cmp = icmp eq i32* %1, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %3 = load i32*, i32** %data, align 8, !dbg !42
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_badData, align 8, !dbg !43
  call void @badSink(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_badData, align 8, !dbg !72
  store i32* %0, i32** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !73, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !79
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !80
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !81
  store i32 0, i32* %arrayidx, align 4, !dbg !82
  %1 = load i32*, i32** %data, align 8, !dbg !83
  %2 = bitcast i32* %1 to i8*, !dbg !83
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !83
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !83
  %4 = load i32*, i32** %data, align 8, !dbg !83
  %5 = bitcast i32* %4 to i8*, !dbg !83
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !83
  %call2 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #8, !dbg !83
  %7 = load i32*, i32** %data, align 8, !dbg !84
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !84
  store i32 0, i32* %arrayidx3, align 4, !dbg !85
  %8 = load i32*, i32** %data, align 8, !dbg !86
  call void @printWLine(i32* noundef %8), !dbg !87
  %9 = load i32*, i32** %data, align 8, !dbg !88
  %10 = bitcast i32* %9 to i8*, !dbg !88
  call void @free(i8* noundef %10), !dbg !89
  ret void, !dbg !90
}

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  store i32* null, i32** %data, align 8, !dbg !94
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !95
  %0 = bitcast i8* %call to i32*, !dbg !96
  store i32* %0, i32** %data, align 8, !dbg !97
  %1 = load i32*, i32** %data, align 8, !dbg !98
  %cmp = icmp eq i32* %1, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %3 = load i32*, i32** %data, align 8, !dbg !106
  store i32* %3, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_goodG2BData, align 8, !dbg !107
  call void @goodG2BSink(), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_goodG2BData, align 8, !dbg !113
  store i32* %0, i32** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !117
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !118
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %2 = bitcast i32* %1 to i8*, !dbg !121
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !121
  %3 = bitcast i32* %arraydecay1 to i8*, !dbg !121
  %4 = load i32*, i32** %data, align 8, !dbg !121
  %5 = bitcast i32* %4 to i8*, !dbg !121
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !121
  %call2 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #8, !dbg !121
  %7 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !122
  store i32 0, i32* %arrayidx3, align 4, !dbg !123
  %8 = load i32*, i32** %data, align 8, !dbg !124
  call void @printWLine(i32* noundef %8), !dbg !125
  %9 = load i32*, i32** %data, align 8, !dbg !126
  %10 = bitcast i32* %9 to i8*, !dbg !126
  call void @free(i8* noundef %10), !dbg !127
  ret void, !dbg !128
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_badData", scope: !2, file: !16, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11, !12}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_goodG2BData", scope: !2, file: !16, line: 22, type: !5, isLocal: true, isDefinition: true)
!16 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Homebrew clang version 14.0.6"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_bad", scope: !16, file: !16, line: 41, type: !25, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !{}
!28 = !DILocalVariable(name: "data", scope: !24, file: !16, line: 43, type: !5)
!29 = !DILocation(line: 43, column: 15, scope: !24)
!30 = !DILocation(line: 44, column: 10, scope: !24)
!31 = !DILocation(line: 46, column: 23, scope: !24)
!32 = !DILocation(line: 46, column: 12, scope: !24)
!33 = !DILocation(line: 46, column: 10, scope: !24)
!34 = !DILocation(line: 47, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !24, file: !16, line: 47, column: 9)
!36 = !DILocation(line: 47, column: 14, scope: !35)
!37 = !DILocation(line: 47, column: 9, scope: !24)
!38 = !DILocation(line: 47, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !16, line: 47, column: 23)
!40 = !DILocation(line: 48, column: 5, scope: !24)
!41 = !DILocation(line: 48, column: 13, scope: !24)
!42 = !DILocation(line: 49, column: 77, scope: !24)
!43 = !DILocation(line: 49, column: 75, scope: !24)
!44 = !DILocation(line: 50, column: 5, scope: !24)
!45 = !DILocation(line: 51, column: 1, scope: !24)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_45_good", scope: !16, file: !16, line: 85, type: !25, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!47 = !DILocation(line: 87, column: 5, scope: !46)
!48 = !DILocation(line: 88, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 99, type: !50, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!50 = !DISubroutineType(types: !51)
!51 = !{!10, !10, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !16, line: 99, type: !10)
!56 = !DILocation(line: 99, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !16, line: 99, type: !52)
!58 = !DILocation(line: 99, column: 27, scope: !49)
!59 = !DILocation(line: 102, column: 22, scope: !49)
!60 = !DILocation(line: 102, column: 12, scope: !49)
!61 = !DILocation(line: 102, column: 5, scope: !49)
!62 = !DILocation(line: 104, column: 5, scope: !49)
!63 = !DILocation(line: 105, column: 5, scope: !49)
!64 = !DILocation(line: 106, column: 5, scope: !49)
!65 = !DILocation(line: 109, column: 5, scope: !49)
!66 = !DILocation(line: 110, column: 5, scope: !49)
!67 = !DILocation(line: 111, column: 5, scope: !49)
!68 = !DILocation(line: 113, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 26, type: !25, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!70 = !DILocalVariable(name: "data", scope: !69, file: !16, line: 28, type: !5)
!71 = !DILocation(line: 28, column: 15, scope: !69)
!72 = !DILocation(line: 28, column: 22, scope: !69)
!73 = !DILocalVariable(name: "source", scope: !74, file: !16, line: 30, type: !75)
!74 = distinct !DILexicalBlock(scope: !69, file: !16, line: 29, column: 5)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 100)
!78 = !DILocation(line: 30, column: 17, scope: !74)
!79 = !DILocation(line: 31, column: 17, scope: !74)
!80 = !DILocation(line: 31, column: 9, scope: !74)
!81 = !DILocation(line: 32, column: 9, scope: !74)
!82 = !DILocation(line: 32, column: 23, scope: !74)
!83 = !DILocation(line: 34, column: 9, scope: !74)
!84 = !DILocation(line: 35, column: 9, scope: !74)
!85 = !DILocation(line: 35, column: 21, scope: !74)
!86 = !DILocation(line: 36, column: 20, scope: !74)
!87 = !DILocation(line: 36, column: 9, scope: !74)
!88 = !DILocation(line: 37, column: 14, scope: !74)
!89 = !DILocation(line: 37, column: 9, scope: !74)
!90 = !DILocation(line: 39, column: 1, scope: !69)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 73, type: !25, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!92 = !DILocalVariable(name: "data", scope: !91, file: !16, line: 75, type: !5)
!93 = !DILocation(line: 75, column: 15, scope: !91)
!94 = !DILocation(line: 76, column: 10, scope: !91)
!95 = !DILocation(line: 78, column: 23, scope: !91)
!96 = !DILocation(line: 78, column: 12, scope: !91)
!97 = !DILocation(line: 78, column: 10, scope: !91)
!98 = !DILocation(line: 79, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !91, file: !16, line: 79, column: 9)
!100 = !DILocation(line: 79, column: 14, scope: !99)
!101 = !DILocation(line: 79, column: 9, scope: !91)
!102 = !DILocation(line: 79, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !16, line: 79, column: 23)
!104 = !DILocation(line: 80, column: 5, scope: !91)
!105 = !DILocation(line: 80, column: 13, scope: !91)
!106 = !DILocation(line: 81, column: 81, scope: !91)
!107 = !DILocation(line: 81, column: 79, scope: !91)
!108 = !DILocation(line: 82, column: 5, scope: !91)
!109 = !DILocation(line: 83, column: 1, scope: !91)
!110 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 58, type: !25, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!111 = !DILocalVariable(name: "data", scope: !110, file: !16, line: 60, type: !5)
!112 = !DILocation(line: 60, column: 15, scope: !110)
!113 = !DILocation(line: 60, column: 22, scope: !110)
!114 = !DILocalVariable(name: "source", scope: !115, file: !16, line: 62, type: !75)
!115 = distinct !DILexicalBlock(scope: !110, file: !16, line: 61, column: 5)
!116 = !DILocation(line: 62, column: 17, scope: !115)
!117 = !DILocation(line: 63, column: 17, scope: !115)
!118 = !DILocation(line: 63, column: 9, scope: !115)
!119 = !DILocation(line: 64, column: 9, scope: !115)
!120 = !DILocation(line: 64, column: 23, scope: !115)
!121 = !DILocation(line: 66, column: 9, scope: !115)
!122 = !DILocation(line: 67, column: 9, scope: !115)
!123 = !DILocation(line: 67, column: 21, scope: !115)
!124 = !DILocation(line: 68, column: 20, scope: !115)
!125 = !DILocation(line: 68, column: 9, scope: !115)
!126 = !DILocation(line: 69, column: 14, scope: !115)
!127 = !DILocation(line: 69, column: 9, scope: !115)
!128 = !DILocation(line: 71, column: 1, scope: !110)
