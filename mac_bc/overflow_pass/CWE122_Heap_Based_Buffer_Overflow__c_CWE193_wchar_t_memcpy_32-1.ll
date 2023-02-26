; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !25, metadata !DIExpression()), !dbg !27
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !28, metadata !DIExpression()), !dbg !29
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !34
  %1 = load i32*, i32** %0, align 8, !dbg !35
  store i32* %1, i32** %data1, align 8, !dbg !33
  %call = call i8* @malloc(i64 noundef 40) #7, !dbg !36
  %2 = bitcast i8* %call to i32*, !dbg !37
  store i32* %2, i32** %data1, align 8, !dbg !38
  %3 = load i32*, i32** %data1, align 8, !dbg !39
  %cmp = icmp eq i32* %3, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !45
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !46
  store i32* %4, i32** %5, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !48, metadata !DIExpression()), !dbg !50
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !51
  %7 = load i32*, i32** %6, align 8, !dbg !52
  store i32* %7, i32** %data2, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !53, metadata !DIExpression()), !dbg !58
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32_bad.source to i8*), i64 44, i1 false), !dbg !58
  %9 = load i32*, i32** %data2, align 8, !dbg !59
  %10 = bitcast i32* %9 to i8*, !dbg !59
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !59
  %11 = bitcast i32* %arraydecay to i8*, !dbg !59
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !59
  %call4 = call i64 @wcslen(i32* noundef %arraydecay3), !dbg !59
  %add = add i64 %call4, 1, !dbg !59
  %mul = mul i64 %add, 4, !dbg !59
  %12 = load i32*, i32** %data2, align 8, !dbg !59
  %13 = bitcast i32* %12 to i8*, !dbg !59
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !59
  %call5 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef %mul, i64 noundef %14) #9, !dbg !59
  %15 = load i32*, i32** %data2, align 8, !dbg !60
  call void @printWLine(i32* noundef %15), !dbg !61
  %16 = load i32*, i32** %data2, align 8, !dbg !62
  %17 = bitcast i32* %16 to i8*, !dbg !62
  call void @free(i8* noundef %17), !dbg !63
  ret void, !dbg !64
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @wcslen(i32* noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32_good() #0 !dbg !65 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* noundef null), !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 noundef %conv), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !91, metadata !DIExpression()), !dbg !92
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !93, metadata !DIExpression()), !dbg !94
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !94
  store i32* null, i32** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !96, metadata !DIExpression()), !dbg !98
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !99
  %1 = load i32*, i32** %0, align 8, !dbg !100
  store i32* %1, i32** %data1, align 8, !dbg !98
  %call = call i8* @malloc(i64 noundef 44) #7, !dbg !101
  %2 = bitcast i8* %call to i32*, !dbg !102
  store i32* %2, i32** %data1, align 8, !dbg !103
  %3 = load i32*, i32** %data1, align 8, !dbg !104
  %cmp = icmp eq i32* %3, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !110
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !111
  store i32* %4, i32** %5, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !113, metadata !DIExpression()), !dbg !115
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !116
  %7 = load i32*, i32** %6, align 8, !dbg !117
  store i32* %7, i32** %data2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %8 = bitcast [11 x i32]* %source to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %8, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !120
  %9 = load i32*, i32** %data2, align 8, !dbg !121
  %10 = bitcast i32* %9 to i8*, !dbg !121
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !121
  %11 = bitcast i32* %arraydecay to i8*, !dbg !121
  %arraydecay3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !121
  %call4 = call i64 @wcslen(i32* noundef %arraydecay3), !dbg !121
  %add = add i64 %call4, 1, !dbg !121
  %mul = mul i64 %add, 4, !dbg !121
  %12 = load i32*, i32** %data2, align 8, !dbg !121
  %13 = bitcast i32* %12 to i8*, !dbg !121
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !121
  %call5 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef %mul, i64 noundef %14) #9, !dbg !121
  %15 = load i32*, i32** %data2, align 8, !dbg !122
  call void @printWLine(i32* noundef %15), !dbg !123
  %16 = load i32*, i32** %data2, align 8, !dbg !124
  %17 = bitcast i32* %16 to i8*, !dbg !124
  call void @free(i8* noundef %17), !dbg !125
  ret void, !dbg !126
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
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32_bad", scope: !19, file: !19, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 30, type: !3)
!24 = !DILocation(line: 30, column: 15, scope: !18)
!25 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !19, line: 31, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!27 = !DILocation(line: 31, column: 16, scope: !18)
!28 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !19, line: 32, type: !26)
!29 = !DILocation(line: 32, column: 16, scope: !18)
!30 = !DILocation(line: 33, column: 10, scope: !18)
!31 = !DILocalVariable(name: "data", scope: !32, file: !19, line: 35, type: !3)
!32 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!33 = !DILocation(line: 35, column: 19, scope: !32)
!34 = !DILocation(line: 35, column: 27, scope: !32)
!35 = !DILocation(line: 35, column: 26, scope: !32)
!36 = !DILocation(line: 37, column: 27, scope: !32)
!37 = !DILocation(line: 37, column: 16, scope: !32)
!38 = !DILocation(line: 37, column: 14, scope: !32)
!39 = !DILocation(line: 38, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !19, line: 38, column: 13)
!41 = !DILocation(line: 38, column: 18, scope: !40)
!42 = !DILocation(line: 38, column: 13, scope: !32)
!43 = !DILocation(line: 38, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 38, column: 27)
!45 = !DILocation(line: 39, column: 21, scope: !32)
!46 = !DILocation(line: 39, column: 10, scope: !32)
!47 = !DILocation(line: 39, column: 19, scope: !32)
!48 = !DILocalVariable(name: "data", scope: !49, file: !19, line: 42, type: !3)
!49 = distinct !DILexicalBlock(scope: !18, file: !19, line: 41, column: 5)
!50 = !DILocation(line: 42, column: 19, scope: !49)
!51 = !DILocation(line: 42, column: 27, scope: !49)
!52 = !DILocation(line: 42, column: 26, scope: !49)
!53 = !DILocalVariable(name: "source", scope: !54, file: !19, line: 44, type: !55)
!54 = distinct !DILexicalBlock(scope: !49, file: !19, line: 43, column: 9)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 11)
!58 = !DILocation(line: 44, column: 21, scope: !54)
!59 = !DILocation(line: 47, column: 13, scope: !54)
!60 = !DILocation(line: 48, column: 24, scope: !54)
!61 = !DILocation(line: 48, column: 13, scope: !54)
!62 = !DILocation(line: 49, column: 18, scope: !54)
!63 = !DILocation(line: 49, column: 13, scope: !54)
!64 = !DILocation(line: 52, column: 1, scope: !18)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memcpy_32_good", scope: !19, file: !19, line: 85, type: !20, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!66 = !DILocation(line: 87, column: 5, scope: !65)
!67 = !DILocation(line: 88, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 99, type: !69, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!69 = !DISubroutineType(types: !70)
!70 = !{!8, !8, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !19, line: 99, type: !8)
!75 = !DILocation(line: 99, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !19, line: 99, type: !71)
!77 = !DILocation(line: 99, column: 27, scope: !68)
!78 = !DILocation(line: 102, column: 22, scope: !68)
!79 = !DILocation(line: 102, column: 12, scope: !68)
!80 = !DILocation(line: 102, column: 5, scope: !68)
!81 = !DILocation(line: 104, column: 5, scope: !68)
!82 = !DILocation(line: 105, column: 5, scope: !68)
!83 = !DILocation(line: 106, column: 5, scope: !68)
!84 = !DILocation(line: 109, column: 5, scope: !68)
!85 = !DILocation(line: 110, column: 5, scope: !68)
!86 = !DILocation(line: 111, column: 5, scope: !68)
!87 = !DILocation(line: 113, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!89 = !DILocalVariable(name: "data", scope: !88, file: !19, line: 61, type: !3)
!90 = !DILocation(line: 61, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataPtr1", scope: !88, file: !19, line: 62, type: !26)
!92 = !DILocation(line: 62, column: 16, scope: !88)
!93 = !DILocalVariable(name: "dataPtr2", scope: !88, file: !19, line: 63, type: !26)
!94 = !DILocation(line: 63, column: 16, scope: !88)
!95 = !DILocation(line: 64, column: 10, scope: !88)
!96 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 66, type: !3)
!97 = distinct !DILexicalBlock(scope: !88, file: !19, line: 65, column: 5)
!98 = !DILocation(line: 66, column: 19, scope: !97)
!99 = !DILocation(line: 66, column: 27, scope: !97)
!100 = !DILocation(line: 66, column: 26, scope: !97)
!101 = !DILocation(line: 68, column: 27, scope: !97)
!102 = !DILocation(line: 68, column: 16, scope: !97)
!103 = !DILocation(line: 68, column: 14, scope: !97)
!104 = !DILocation(line: 69, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !97, file: !19, line: 69, column: 13)
!106 = !DILocation(line: 69, column: 18, scope: !105)
!107 = !DILocation(line: 69, column: 13, scope: !97)
!108 = !DILocation(line: 69, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !19, line: 69, column: 27)
!110 = !DILocation(line: 70, column: 21, scope: !97)
!111 = !DILocation(line: 70, column: 10, scope: !97)
!112 = !DILocation(line: 70, column: 19, scope: !97)
!113 = !DILocalVariable(name: "data", scope: !114, file: !19, line: 73, type: !3)
!114 = distinct !DILexicalBlock(scope: !88, file: !19, line: 72, column: 5)
!115 = !DILocation(line: 73, column: 19, scope: !114)
!116 = !DILocation(line: 73, column: 27, scope: !114)
!117 = !DILocation(line: 73, column: 26, scope: !114)
!118 = !DILocalVariable(name: "source", scope: !119, file: !19, line: 75, type: !55)
!119 = distinct !DILexicalBlock(scope: !114, file: !19, line: 74, column: 9)
!120 = !DILocation(line: 75, column: 21, scope: !119)
!121 = !DILocation(line: 78, column: 13, scope: !119)
!122 = !DILocation(line: 79, column: 24, scope: !119)
!123 = !DILocation(line: 79, column: 13, scope: !119)
!124 = !DILocation(line: 80, column: 18, scope: !119)
!125 = !DILocation(line: 80, column: 13, scope: !119)
!126 = !DILocation(line: 83, column: 1, scope: !88)
