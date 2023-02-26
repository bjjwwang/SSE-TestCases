; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 200) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !43
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !44
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx2, align 4, !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %4 = bitcast i32* %3 to i8*, !dbg !47
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !47
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %7 = bitcast i32* %6 to i8*, !dbg !47
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !47
  %call4 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 400, i64 noundef %8) #8, !dbg !47
  %9 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !48
  store i32 0, i32* %arrayidx5, align 4, !dbg !49
  %10 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* noundef %10), !dbg !51
  %11 = load i32*, i32** %data, align 8, !dbg !52
  %12 = bitcast i32* %11 to i8*, !dbg !52
  call void @free(i8* noundef %12), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  store i32* null, i32** %data, align 8, !dbg !81
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !82
  %0 = bitcast i8* %call to i32*, !dbg !83
  store i32* %0, i32** %data, align 8, !dbg !84
  %1 = load i32*, i32** %data, align 8, !dbg !85
  %cmp = icmp eq i32* %1, null, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !89
  unreachable, !dbg !89

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !91
  store i32 0, i32* %arrayidx, align 4, !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !96
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !97
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !98
  store i32 0, i32* %arrayidx2, align 4, !dbg !99
  %3 = load i32*, i32** %data, align 8, !dbg !100
  %4 = bitcast i32* %3 to i8*, !dbg !100
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !100
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %7 = bitcast i32* %6 to i8*, !dbg !100
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !100
  %call4 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 400, i64 noundef %8) #8, !dbg !100
  %9 = load i32*, i32** %data, align 8, !dbg !101
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !101
  store i32 0, i32* %arrayidx5, align 4, !dbg !102
  %10 = load i32*, i32** %data, align 8, !dbg !103
  call void @printWLine(i32* noundef %10), !dbg !104
  %11 = load i32*, i32** %data, align 8, !dbg !105
  %12 = bitcast i32* %11 to i8*, !dbg !105
  call void @free(i8* noundef %12), !dbg !106
  ret void, !dbg !107
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 28, column: 23, scope: !18)
!27 = !DILocation(line: 28, column: 12, scope: !18)
!28 = !DILocation(line: 28, column: 10, scope: !18)
!29 = !DILocation(line: 29, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 9)
!31 = !DILocation(line: 29, column: 14, scope: !30)
!32 = !DILocation(line: 29, column: 9, scope: !18)
!33 = !DILocation(line: 29, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 29, column: 23)
!35 = !DILocation(line: 30, column: 5, scope: !18)
!36 = !DILocation(line: 30, column: 13, scope: !18)
!37 = !DILocalVariable(name: "source", scope: !38, file: !19, line: 32, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 32, column: 17, scope: !38)
!43 = !DILocation(line: 33, column: 17, scope: !38)
!44 = !DILocation(line: 33, column: 9, scope: !38)
!45 = !DILocation(line: 34, column: 9, scope: !38)
!46 = !DILocation(line: 34, column: 23, scope: !38)
!47 = !DILocation(line: 36, column: 9, scope: !38)
!48 = !DILocation(line: 37, column: 9, scope: !38)
!49 = !DILocation(line: 37, column: 21, scope: !38)
!50 = !DILocation(line: 38, column: 20, scope: !38)
!51 = !DILocation(line: 38, column: 9, scope: !38)
!52 = !DILocation(line: 39, column: 14, scope: !38)
!53 = !DILocation(line: 39, column: 9, scope: !38)
!54 = !DILocation(line: 41, column: 1, scope: !18)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memcpy_01_good", scope: !19, file: !19, line: 68, type: !20, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!56 = !DILocation(line: 70, column: 5, scope: !55)
!57 = !DILocation(line: 71, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 83, type: !59, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !19, line: 83, type: !8)
!65 = !DILocation(line: 83, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !19, line: 83, type: !61)
!67 = !DILocation(line: 83, column: 27, scope: !58)
!68 = !DILocation(line: 86, column: 22, scope: !58)
!69 = !DILocation(line: 86, column: 12, scope: !58)
!70 = !DILocation(line: 86, column: 5, scope: !58)
!71 = !DILocation(line: 88, column: 5, scope: !58)
!72 = !DILocation(line: 89, column: 5, scope: !58)
!73 = !DILocation(line: 90, column: 5, scope: !58)
!74 = !DILocation(line: 93, column: 5, scope: !58)
!75 = !DILocation(line: 94, column: 5, scope: !58)
!76 = !DILocation(line: 95, column: 5, scope: !58)
!77 = !DILocation(line: 97, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 48, type: !20, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!79 = !DILocalVariable(name: "data", scope: !78, file: !19, line: 50, type: !3)
!80 = !DILocation(line: 50, column: 15, scope: !78)
!81 = !DILocation(line: 51, column: 10, scope: !78)
!82 = !DILocation(line: 53, column: 23, scope: !78)
!83 = !DILocation(line: 53, column: 12, scope: !78)
!84 = !DILocation(line: 53, column: 10, scope: !78)
!85 = !DILocation(line: 54, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !19, line: 54, column: 9)
!87 = !DILocation(line: 54, column: 14, scope: !86)
!88 = !DILocation(line: 54, column: 9, scope: !78)
!89 = !DILocation(line: 54, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !19, line: 54, column: 23)
!91 = !DILocation(line: 55, column: 5, scope: !78)
!92 = !DILocation(line: 55, column: 13, scope: !78)
!93 = !DILocalVariable(name: "source", scope: !94, file: !19, line: 57, type: !39)
!94 = distinct !DILexicalBlock(scope: !78, file: !19, line: 56, column: 5)
!95 = !DILocation(line: 57, column: 17, scope: !94)
!96 = !DILocation(line: 58, column: 17, scope: !94)
!97 = !DILocation(line: 58, column: 9, scope: !94)
!98 = !DILocation(line: 59, column: 9, scope: !94)
!99 = !DILocation(line: 59, column: 23, scope: !94)
!100 = !DILocation(line: 61, column: 9, scope: !94)
!101 = !DILocation(line: 62, column: 9, scope: !94)
!102 = !DILocation(line: 62, column: 21, scope: !94)
!103 = !DILocation(line: 63, column: 20, scope: !94)
!104 = !DILocation(line: 63, column: 9, scope: !94)
!105 = !DILocation(line: 64, column: 14, scope: !94)
!106 = !DILocation(line: 64, column: 9, scope: !94)
!107 = !DILocation(line: 66, column: 1, scope: !78)
