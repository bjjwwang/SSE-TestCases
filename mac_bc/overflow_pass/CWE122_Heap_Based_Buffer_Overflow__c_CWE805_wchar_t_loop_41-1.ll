; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_badSink(i32* noundef %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !37
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !38
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !44
  %cmp = icmp ult i64 %0, 100, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !50
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !50
  %3 = load i32*, i32** %data.addr, align 8, !dbg !51
  %4 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !51
  store i32 %2, i32* %arrayidx2, align 4, !dbg !53
  br label %for.inc, !dbg !54

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !55
  %inc = add i64 %5, 1, !dbg !55
  store i64 %inc, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !56, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !60
  store i32 0, i32* %arrayidx3, align 4, !dbg !61
  %7 = load i32*, i32** %data.addr, align 8, !dbg !62
  call void @printWLine(i32* noundef %7), !dbg !63
  %8 = load i32*, i32** %data.addr, align 8, !dbg !64
  %9 = bitcast i32* %8 to i8*, !dbg !64
  call void @free(i8* noundef %9), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_bad() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32* null, i32** %data, align 8, !dbg !72
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !73
  %0 = bitcast i8* %call to i32*, !dbg !74
  store i32* %0, i32** %data, align 8, !dbg !75
  %1 = load i32*, i32** %data, align 8, !dbg !76
  %cmp = icmp eq i32* %1, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  %3 = load i32*, i32** %data, align 8, !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_badSink(i32* noundef %3), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_goodG2BSink(i32* noundef %data) #0 !dbg !87 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !95
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !96
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  store i64 0, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !102
  %cmp = icmp ult i64 %0, 100, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !106
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !108
  %2 = load i32, i32* %arrayidx1, align 4, !dbg !108
  %3 = load i32*, i32** %data.addr, align 8, !dbg !109
  %4 = load i64, i64* %i, align 8, !dbg !110
  %arrayidx2 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !109
  store i32 %2, i32* %arrayidx2, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %5, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data.addr, align 8, !dbg !117
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !117
  store i32 0, i32* %arrayidx3, align 4, !dbg !118
  %7 = load i32*, i32** %data.addr, align 8, !dbg !119
  call void @printWLine(i32* noundef %7), !dbg !120
  %8 = load i32*, i32** %data.addr, align 8, !dbg !121
  %9 = bitcast i32* %8 to i8*, !dbg !121
  call void @free(i8* noundef %9), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_good() #0 !dbg !124 {
entry:
  call void @goodG2B(), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !127 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !133, metadata !DIExpression()), !dbg !134
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !135, metadata !DIExpression()), !dbg !136
  %call = call i64 @time(i64* noundef null), !dbg !137
  %conv = trunc i64 %call to i32, !dbg !138
  call void @srand(i32 noundef %conv), !dbg !139
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !140
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_good(), !dbg !141
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !142
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !143
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_bad(), !dbg !144
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !145
  ret i32 0, !dbg !146
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  store i32* null, i32** %data, align 8, !dbg !150
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !151
  %0 = bitcast i8* %call to i32*, !dbg !152
  store i32* %0, i32** %data, align 8, !dbg !153
  %1 = load i32*, i32** %data, align 8, !dbg !154
  %cmp = icmp eq i32* %1, null, !dbg !156
  br i1 %cmp, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !158
  unreachable, !dbg !158

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !161
  %3 = load i32*, i32** %data, align 8, !dbg !162
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_goodG2BSink(i32* noundef %3), !dbg !163
  ret void, !dbg !164
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_badSink", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !3}
!22 = !{}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !19, line: 23, type: !3)
!24 = !DILocation(line: 23, column: 84, scope: !18)
!25 = !DILocalVariable(name: "i", scope: !26, file: !19, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 25, column: 5)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 31, baseType: !29)
!28 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !30)
!30 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 26, column: 16, scope: !26)
!32 = !DILocalVariable(name: "source", scope: !26, file: !19, line: 27, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 27, column: 17, scope: !26)
!37 = !DILocation(line: 28, column: 17, scope: !26)
!38 = !DILocation(line: 28, column: 9, scope: !26)
!39 = !DILocation(line: 29, column: 9, scope: !26)
!40 = !DILocation(line: 29, column: 23, scope: !26)
!41 = !DILocation(line: 31, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !26, file: !19, line: 31, column: 9)
!43 = !DILocation(line: 31, column: 14, scope: !42)
!44 = !DILocation(line: 31, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !19, line: 31, column: 9)
!46 = !DILocation(line: 31, column: 23, scope: !45)
!47 = !DILocation(line: 31, column: 9, scope: !42)
!48 = !DILocation(line: 33, column: 30, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !19, line: 32, column: 9)
!50 = !DILocation(line: 33, column: 23, scope: !49)
!51 = !DILocation(line: 33, column: 13, scope: !49)
!52 = !DILocation(line: 33, column: 18, scope: !49)
!53 = !DILocation(line: 33, column: 21, scope: !49)
!54 = !DILocation(line: 34, column: 9, scope: !49)
!55 = !DILocation(line: 31, column: 31, scope: !45)
!56 = !DILocation(line: 31, column: 9, scope: !45)
!57 = distinct !{!57, !47, !58, !59}
!58 = !DILocation(line: 34, column: 9, scope: !42)
!59 = !{!"llvm.loop.mustprogress"}
!60 = !DILocation(line: 35, column: 9, scope: !26)
!61 = !DILocation(line: 35, column: 21, scope: !26)
!62 = !DILocation(line: 36, column: 20, scope: !26)
!63 = !DILocation(line: 36, column: 9, scope: !26)
!64 = !DILocation(line: 37, column: 14, scope: !26)
!65 = !DILocation(line: 37, column: 9, scope: !26)
!66 = !DILocation(line: 39, column: 1, scope: !18)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_bad", scope: !19, file: !19, line: 41, type: !68, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!68 = !DISubroutineType(types: !69)
!69 = !{null}
!70 = !DILocalVariable(name: "data", scope: !67, file: !19, line: 43, type: !3)
!71 = !DILocation(line: 43, column: 15, scope: !67)
!72 = !DILocation(line: 44, column: 10, scope: !67)
!73 = !DILocation(line: 46, column: 23, scope: !67)
!74 = !DILocation(line: 46, column: 12, scope: !67)
!75 = !DILocation(line: 46, column: 10, scope: !67)
!76 = !DILocation(line: 47, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !67, file: !19, line: 47, column: 9)
!78 = !DILocation(line: 47, column: 14, scope: !77)
!79 = !DILocation(line: 47, column: 9, scope: !67)
!80 = !DILocation(line: 47, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !19, line: 47, column: 23)
!82 = !DILocation(line: 48, column: 5, scope: !67)
!83 = !DILocation(line: 48, column: 13, scope: !67)
!84 = !DILocation(line: 49, column: 73, scope: !67)
!85 = !DILocation(line: 49, column: 5, scope: !67)
!86 = !DILocation(line: 50, column: 1, scope: !67)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_goodG2BSink", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!88 = !DILocalVariable(name: "data", arg: 1, scope: !87, file: !19, line: 56, type: !3)
!89 = !DILocation(line: 56, column: 88, scope: !87)
!90 = !DILocalVariable(name: "i", scope: !91, file: !19, line: 59, type: !27)
!91 = distinct !DILexicalBlock(scope: !87, file: !19, line: 58, column: 5)
!92 = !DILocation(line: 59, column: 16, scope: !91)
!93 = !DILocalVariable(name: "source", scope: !91, file: !19, line: 60, type: !33)
!94 = !DILocation(line: 60, column: 17, scope: !91)
!95 = !DILocation(line: 61, column: 17, scope: !91)
!96 = !DILocation(line: 61, column: 9, scope: !91)
!97 = !DILocation(line: 62, column: 9, scope: !91)
!98 = !DILocation(line: 62, column: 23, scope: !91)
!99 = !DILocation(line: 64, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !91, file: !19, line: 64, column: 9)
!101 = !DILocation(line: 64, column: 14, scope: !100)
!102 = !DILocation(line: 64, column: 21, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !19, line: 64, column: 9)
!104 = !DILocation(line: 64, column: 23, scope: !103)
!105 = !DILocation(line: 64, column: 9, scope: !100)
!106 = !DILocation(line: 66, column: 30, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !19, line: 65, column: 9)
!108 = !DILocation(line: 66, column: 23, scope: !107)
!109 = !DILocation(line: 66, column: 13, scope: !107)
!110 = !DILocation(line: 66, column: 18, scope: !107)
!111 = !DILocation(line: 66, column: 21, scope: !107)
!112 = !DILocation(line: 67, column: 9, scope: !107)
!113 = !DILocation(line: 64, column: 31, scope: !103)
!114 = !DILocation(line: 64, column: 9, scope: !103)
!115 = distinct !{!115, !105, !116, !59}
!116 = !DILocation(line: 67, column: 9, scope: !100)
!117 = !DILocation(line: 68, column: 9, scope: !91)
!118 = !DILocation(line: 68, column: 21, scope: !91)
!119 = !DILocation(line: 69, column: 20, scope: !91)
!120 = !DILocation(line: 69, column: 9, scope: !91)
!121 = !DILocation(line: 70, column: 14, scope: !91)
!122 = !DILocation(line: 70, column: 9, scope: !91)
!123 = !DILocation(line: 72, column: 1, scope: !87)
!124 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_41_good", scope: !19, file: !19, line: 86, type: !68, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!125 = !DILocation(line: 88, column: 5, scope: !124)
!126 = !DILocation(line: 89, column: 1, scope: !124)
!127 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 101, type: !128, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!128 = !DISubroutineType(types: !129)
!129 = !{!8, !8, !130}
!130 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !131, size: 64)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!133 = !DILocalVariable(name: "argc", arg: 1, scope: !127, file: !19, line: 101, type: !8)
!134 = !DILocation(line: 101, column: 14, scope: !127)
!135 = !DILocalVariable(name: "argv", arg: 2, scope: !127, file: !19, line: 101, type: !130)
!136 = !DILocation(line: 101, column: 27, scope: !127)
!137 = !DILocation(line: 104, column: 22, scope: !127)
!138 = !DILocation(line: 104, column: 12, scope: !127)
!139 = !DILocation(line: 104, column: 5, scope: !127)
!140 = !DILocation(line: 106, column: 5, scope: !127)
!141 = !DILocation(line: 107, column: 5, scope: !127)
!142 = !DILocation(line: 108, column: 5, scope: !127)
!143 = !DILocation(line: 111, column: 5, scope: !127)
!144 = !DILocation(line: 112, column: 5, scope: !127)
!145 = !DILocation(line: 113, column: 5, scope: !127)
!146 = !DILocation(line: 115, column: 5, scope: !127)
!147 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 75, type: !68, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!148 = !DILocalVariable(name: "data", scope: !147, file: !19, line: 77, type: !3)
!149 = !DILocation(line: 77, column: 15, scope: !147)
!150 = !DILocation(line: 78, column: 10, scope: !147)
!151 = !DILocation(line: 80, column: 23, scope: !147)
!152 = !DILocation(line: 80, column: 12, scope: !147)
!153 = !DILocation(line: 80, column: 10, scope: !147)
!154 = !DILocation(line: 81, column: 9, scope: !155)
!155 = distinct !DILexicalBlock(scope: !147, file: !19, line: 81, column: 9)
!156 = !DILocation(line: 81, column: 14, scope: !155)
!157 = !DILocation(line: 81, column: 9, scope: !147)
!158 = !DILocation(line: 81, column: 24, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !19, line: 81, column: 23)
!160 = !DILocation(line: 82, column: 5, scope: !147)
!161 = !DILocation(line: 82, column: 13, scope: !147)
!162 = !DILocation(line: 83, column: 77, scope: !147)
!163 = !DILocation(line: 83, column: 5, scope: !147)
!164 = !DILocation(line: 84, column: 1, scope: !147)
