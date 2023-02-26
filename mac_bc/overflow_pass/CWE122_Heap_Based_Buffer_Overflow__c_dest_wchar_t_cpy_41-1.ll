; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_badSink(i32* noundef %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !25, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %0 = load i32*, i32** %data.addr, align 8, !dbg !35
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !36
  %call2 = call i32* @wcscpy(i32* noundef %0, i32* noundef %arraydecay1), !dbg !37
  %1 = load i32*, i32** %data.addr, align 8, !dbg !38
  call void @printWLine(i32* noundef %1), !dbg !39
  %2 = load i32*, i32** %data.addr, align 8, !dbg !40
  %3 = bitcast i32* %2 to i8*, !dbg !40
  call void @free(i8* noundef %3), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32* @wcscpy(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_bad() #0 !dbg !43 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !46, metadata !DIExpression()), !dbg !47
  store i32* null, i32** %data, align 8, !dbg !48
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !49
  %0 = bitcast i8* %call to i32*, !dbg !50
  store i32* %0, i32** %data, align 8, !dbg !51
  %1 = load i32*, i32** %data, align 8, !dbg !52
  %cmp = icmp eq i32* %1, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !58
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !58
  store i32 0, i32* %arrayidx, align 4, !dbg !59
  %3 = load i32*, i32** %data, align 8, !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_badSink(i32* noundef %3), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_goodG2BSink(i32* noundef %data) #0 !dbg !63 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !66, metadata !DIExpression()), !dbg !68
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !69
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !70
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !71
  store i32 0, i32* %arrayidx, align 4, !dbg !72
  %0 = load i32*, i32** %data.addr, align 8, !dbg !73
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !74
  %call2 = call i32* @wcscpy(i32* noundef %0, i32* noundef %arraydecay1), !dbg !75
  %1 = load i32*, i32** %data.addr, align 8, !dbg !76
  call void @printWLine(i32* noundef %1), !dbg !77
  %2 = load i32*, i32** %data.addr, align 8, !dbg !78
  %3 = bitcast i32* %2 to i8*, !dbg !78
  call void @free(i8* noundef %3), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* noundef null), !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 noundef %conv), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* null, i32** %data, align 8, !dbg !107
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !108
  %0 = bitcast i8* %call to i32*, !dbg !109
  store i32* %0, i32** %data, align 8, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  %cmp = icmp eq i32* %1, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !117
  store i32 0, i32* %arrayidx, align 4, !dbg !118
  %3 = load i32*, i32** %data, align 8, !dbg !119
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_goodG2BSink(i32* noundef %3), !dbg !120
  ret void, !dbg !121
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_badSink", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !3}
!22 = !{}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !19, line: 23, type: !3)
!24 = !DILocation(line: 23, column: 81, scope: !18)
!25 = !DILocalVariable(name: "source", scope: !26, file: !19, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 25, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 26, column: 17, scope: !26)
!31 = !DILocation(line: 27, column: 17, scope: !26)
!32 = !DILocation(line: 27, column: 9, scope: !26)
!33 = !DILocation(line: 28, column: 9, scope: !26)
!34 = !DILocation(line: 28, column: 23, scope: !26)
!35 = !DILocation(line: 30, column: 16, scope: !26)
!36 = !DILocation(line: 30, column: 22, scope: !26)
!37 = !DILocation(line: 30, column: 9, scope: !26)
!38 = !DILocation(line: 31, column: 20, scope: !26)
!39 = !DILocation(line: 31, column: 9, scope: !26)
!40 = !DILocation(line: 32, column: 14, scope: !26)
!41 = !DILocation(line: 32, column: 9, scope: !26)
!42 = !DILocation(line: 34, column: 1, scope: !18)
!43 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_bad", scope: !19, file: !19, line: 36, type: !44, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!44 = !DISubroutineType(types: !45)
!45 = !{null}
!46 = !DILocalVariable(name: "data", scope: !43, file: !19, line: 38, type: !3)
!47 = !DILocation(line: 38, column: 15, scope: !43)
!48 = !DILocation(line: 39, column: 10, scope: !43)
!49 = !DILocation(line: 41, column: 23, scope: !43)
!50 = !DILocation(line: 41, column: 12, scope: !43)
!51 = !DILocation(line: 41, column: 10, scope: !43)
!52 = !DILocation(line: 42, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !43, file: !19, line: 42, column: 9)
!54 = !DILocation(line: 42, column: 14, scope: !53)
!55 = !DILocation(line: 42, column: 9, scope: !43)
!56 = !DILocation(line: 42, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !19, line: 42, column: 23)
!58 = !DILocation(line: 43, column: 5, scope: !43)
!59 = !DILocation(line: 43, column: 13, scope: !43)
!60 = !DILocation(line: 44, column: 70, scope: !43)
!61 = !DILocation(line: 44, column: 5, scope: !43)
!62 = !DILocation(line: 45, column: 1, scope: !43)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_goodG2BSink", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!64 = !DILocalVariable(name: "data", arg: 1, scope: !63, file: !19, line: 51, type: !3)
!65 = !DILocation(line: 51, column: 85, scope: !63)
!66 = !DILocalVariable(name: "source", scope: !67, file: !19, line: 54, type: !27)
!67 = distinct !DILexicalBlock(scope: !63, file: !19, line: 53, column: 5)
!68 = !DILocation(line: 54, column: 17, scope: !67)
!69 = !DILocation(line: 55, column: 17, scope: !67)
!70 = !DILocation(line: 55, column: 9, scope: !67)
!71 = !DILocation(line: 56, column: 9, scope: !67)
!72 = !DILocation(line: 56, column: 23, scope: !67)
!73 = !DILocation(line: 58, column: 16, scope: !67)
!74 = !DILocation(line: 58, column: 22, scope: !67)
!75 = !DILocation(line: 58, column: 9, scope: !67)
!76 = !DILocation(line: 59, column: 20, scope: !67)
!77 = !DILocation(line: 59, column: 9, scope: !67)
!78 = !DILocation(line: 60, column: 14, scope: !67)
!79 = !DILocation(line: 60, column: 9, scope: !67)
!80 = !DILocation(line: 62, column: 1, scope: !63)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_wchar_t_cpy_41_good", scope: !19, file: !19, line: 76, type: !44, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!82 = !DILocation(line: 78, column: 5, scope: !81)
!83 = !DILocation(line: 79, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 91, type: !85, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!85 = !DISubroutineType(types: !86)
!86 = !{!8, !8, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !19, line: 91, type: !8)
!91 = !DILocation(line: 91, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !19, line: 91, type: !87)
!93 = !DILocation(line: 91, column: 27, scope: !84)
!94 = !DILocation(line: 94, column: 22, scope: !84)
!95 = !DILocation(line: 94, column: 12, scope: !84)
!96 = !DILocation(line: 94, column: 5, scope: !84)
!97 = !DILocation(line: 96, column: 5, scope: !84)
!98 = !DILocation(line: 97, column: 5, scope: !84)
!99 = !DILocation(line: 98, column: 5, scope: !84)
!100 = !DILocation(line: 101, column: 5, scope: !84)
!101 = !DILocation(line: 102, column: 5, scope: !84)
!102 = !DILocation(line: 103, column: 5, scope: !84)
!103 = !DILocation(line: 105, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 65, type: !44, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!105 = !DILocalVariable(name: "data", scope: !104, file: !19, line: 67, type: !3)
!106 = !DILocation(line: 67, column: 15, scope: !104)
!107 = !DILocation(line: 68, column: 10, scope: !104)
!108 = !DILocation(line: 70, column: 23, scope: !104)
!109 = !DILocation(line: 70, column: 12, scope: !104)
!110 = !DILocation(line: 70, column: 10, scope: !104)
!111 = !DILocation(line: 71, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !19, line: 71, column: 9)
!113 = !DILocation(line: 71, column: 14, scope: !112)
!114 = !DILocation(line: 71, column: 9, scope: !104)
!115 = !DILocation(line: 71, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !19, line: 71, column: 23)
!117 = !DILocation(line: 72, column: 5, scope: !104)
!118 = !DILocation(line: 72, column: 13, scope: !104)
!119 = !DILocation(line: 73, column: 74, scope: !104)
!120 = !DILocation(line: 73, column: 5, scope: !104)
!121 = !DILocation(line: 74, column: 1, scope: !104)
