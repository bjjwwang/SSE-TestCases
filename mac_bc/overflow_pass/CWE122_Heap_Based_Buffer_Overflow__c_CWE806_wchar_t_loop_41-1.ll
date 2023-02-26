; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_badSink(i32* noundef %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !25, metadata !DIExpression()), !dbg !30
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %i, metadata !31, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !37, metadata !DIExpression()), !dbg !38
  %1 = load i32*, i32** %data.addr, align 8, !dbg !39
  %call = call i64 @wcslen(i32* noundef %1), !dbg !40
  store i64 %call, i64* %dataLen, align 8, !dbg !41
  store i64 0, i64* %i, align 8, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !45
  %3 = load i64, i64* %dataLen, align 8, !dbg !47
  %cmp = icmp ult i64 %2, %3, !dbg !48
  br i1 %cmp, label %for.body, label %for.end, !dbg !49

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !50
  %5 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !50
  %6 = load i32, i32* %arrayidx, align 4, !dbg !50
  %7 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !54
  store i32 %6, i32* %arrayidx1, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %8, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !62
  store i32 0, i32* %arrayidx2, align 4, !dbg !63
  %9 = load i32*, i32** %data.addr, align 8, !dbg !64
  call void @printWLine(i32* noundef %9), !dbg !65
  %10 = load i32*, i32** %data.addr, align 8, !dbg !66
  %11 = bitcast i32* %10 to i8*, !dbg !66
  call void @free(i8* noundef %11), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_bad() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !75
  store i32* %0, i32** %data, align 8, !dbg !76
  %1 = load i32*, i32** %data, align 8, !dbg !77
  %cmp = icmp eq i32* %1, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !83
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %4 = load i32*, i32** %data, align 8, !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_badSink(i32* noundef %4), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_goodG2BSink(i32* noundef %data) #0 !dbg !90 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !95
  call void @llvm.dbg.declare(metadata i64* %i, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !98, metadata !DIExpression()), !dbg !99
  %1 = load i32*, i32** %data.addr, align 8, !dbg !100
  %call = call i64 @wcslen(i32* noundef %1), !dbg !101
  store i64 %call, i64* %dataLen, align 8, !dbg !102
  store i64 0, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !106
  %3 = load i64, i64* %dataLen, align 8, !dbg !108
  %cmp = icmp ult i64 %2, %3, !dbg !109
  br i1 %cmp, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !111
  %5 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !111
  %6 = load i32, i32* %arrayidx, align 4, !dbg !111
  %7 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !115
  store i32 %6, i32* %arrayidx1, align 4, !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !118
  %inc = add i64 %8, 1, !dbg !118
  store i64 %inc, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !122
  store i32 0, i32* %arrayidx2, align 4, !dbg !123
  %9 = load i32*, i32** %data.addr, align 8, !dbg !124
  call void @printWLine(i32* noundef %9), !dbg !125
  %10 = load i32*, i32** %data.addr, align 8, !dbg !126
  %11 = bitcast i32* %10 to i8*, !dbg !126
  call void @free(i8* noundef %11), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_good() #0 !dbg !129 {
entry:
  call void @goodG2B(), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !132 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !138, metadata !DIExpression()), !dbg !139
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !140, metadata !DIExpression()), !dbg !141
  %call = call i64 @time(i64* noundef null), !dbg !142
  %conv = trunc i64 %call to i32, !dbg !143
  call void @srand(i32 noundef %conv), !dbg !144
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !145
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_good(), !dbg !146
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !147
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !148
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_bad(), !dbg !149
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !150
  ret i32 0, !dbg !151
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !152 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !153, metadata !DIExpression()), !dbg !154
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !155
  %0 = bitcast i8* %call to i32*, !dbg !156
  store i32* %0, i32** %data, align 8, !dbg !157
  %1 = load i32*, i32** %data, align 8, !dbg !158
  %cmp = icmp eq i32* %1, null, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !162
  unreachable, !dbg !162

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !164
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !165
  %3 = load i32*, i32** %data, align 8, !dbg !166
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !166
  store i32 0, i32* %arrayidx, align 4, !dbg !167
  %4 = load i32*, i32** %data, align 8, !dbg !168
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_goodG2BSink(i32* noundef %4), !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_badSink", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !3}
!22 = !{}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !19, line: 23, type: !3)
!24 = !DILocation(line: 23, column: 84, scope: !18)
!25 = !DILocalVariable(name: "dest", scope: !26, file: !19, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 25, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 26, column: 17, scope: !26)
!31 = !DILocalVariable(name: "i", scope: !26, file: !19, line: 27, type: !32)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !33, line: 31, baseType: !34)
!33 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !35)
!35 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DILocation(line: 27, column: 16, scope: !26)
!37 = !DILocalVariable(name: "dataLen", scope: !26, file: !19, line: 27, type: !32)
!38 = !DILocation(line: 27, column: 19, scope: !26)
!39 = !DILocation(line: 28, column: 26, scope: !26)
!40 = !DILocation(line: 28, column: 19, scope: !26)
!41 = !DILocation(line: 28, column: 17, scope: !26)
!42 = !DILocation(line: 30, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !26, file: !19, line: 30, column: 9)
!44 = !DILocation(line: 30, column: 14, scope: !43)
!45 = !DILocation(line: 30, column: 21, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !19, line: 30, column: 9)
!47 = !DILocation(line: 30, column: 25, scope: !46)
!48 = !DILocation(line: 30, column: 23, scope: !46)
!49 = !DILocation(line: 30, column: 9, scope: !43)
!50 = !DILocation(line: 32, column: 23, scope: !51)
!51 = distinct !DILexicalBlock(scope: !46, file: !19, line: 31, column: 9)
!52 = !DILocation(line: 32, column: 28, scope: !51)
!53 = !DILocation(line: 32, column: 18, scope: !51)
!54 = !DILocation(line: 32, column: 13, scope: !51)
!55 = !DILocation(line: 32, column: 21, scope: !51)
!56 = !DILocation(line: 33, column: 9, scope: !51)
!57 = !DILocation(line: 30, column: 35, scope: !46)
!58 = !DILocation(line: 30, column: 9, scope: !46)
!59 = distinct !{!59, !49, !60, !61}
!60 = !DILocation(line: 33, column: 9, scope: !43)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocation(line: 34, column: 9, scope: !26)
!63 = !DILocation(line: 34, column: 20, scope: !26)
!64 = !DILocation(line: 35, column: 20, scope: !26)
!65 = !DILocation(line: 35, column: 9, scope: !26)
!66 = !DILocation(line: 36, column: 14, scope: !26)
!67 = !DILocation(line: 36, column: 9, scope: !26)
!68 = !DILocation(line: 38, column: 1, scope: !18)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_bad", scope: !19, file: !19, line: 40, type: !70, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!70 = !DISubroutineType(types: !71)
!71 = !{null}
!72 = !DILocalVariable(name: "data", scope: !69, file: !19, line: 42, type: !3)
!73 = !DILocation(line: 42, column: 15, scope: !69)
!74 = !DILocation(line: 43, column: 23, scope: !69)
!75 = !DILocation(line: 43, column: 12, scope: !69)
!76 = !DILocation(line: 43, column: 10, scope: !69)
!77 = !DILocation(line: 44, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !69, file: !19, line: 44, column: 9)
!79 = !DILocation(line: 44, column: 14, scope: !78)
!80 = !DILocation(line: 44, column: 9, scope: !69)
!81 = !DILocation(line: 44, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !19, line: 44, column: 23)
!83 = !DILocation(line: 46, column: 13, scope: !69)
!84 = !DILocation(line: 46, column: 5, scope: !69)
!85 = !DILocation(line: 47, column: 5, scope: !69)
!86 = !DILocation(line: 47, column: 17, scope: !69)
!87 = !DILocation(line: 48, column: 73, scope: !69)
!88 = !DILocation(line: 48, column: 5, scope: !69)
!89 = !DILocation(line: 49, column: 1, scope: !69)
!90 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_goodG2BSink", scope: !19, file: !19, line: 55, type: !20, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!91 = !DILocalVariable(name: "data", arg: 1, scope: !90, file: !19, line: 55, type: !3)
!92 = !DILocation(line: 55, column: 88, scope: !90)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !19, line: 58, type: !27)
!94 = distinct !DILexicalBlock(scope: !90, file: !19, line: 57, column: 5)
!95 = !DILocation(line: 58, column: 17, scope: !94)
!96 = !DILocalVariable(name: "i", scope: !94, file: !19, line: 59, type: !32)
!97 = !DILocation(line: 59, column: 16, scope: !94)
!98 = !DILocalVariable(name: "dataLen", scope: !94, file: !19, line: 59, type: !32)
!99 = !DILocation(line: 59, column: 19, scope: !94)
!100 = !DILocation(line: 60, column: 26, scope: !94)
!101 = !DILocation(line: 60, column: 19, scope: !94)
!102 = !DILocation(line: 60, column: 17, scope: !94)
!103 = !DILocation(line: 62, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !94, file: !19, line: 62, column: 9)
!105 = !DILocation(line: 62, column: 14, scope: !104)
!106 = !DILocation(line: 62, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !19, line: 62, column: 9)
!108 = !DILocation(line: 62, column: 25, scope: !107)
!109 = !DILocation(line: 62, column: 23, scope: !107)
!110 = !DILocation(line: 62, column: 9, scope: !104)
!111 = !DILocation(line: 64, column: 23, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !19, line: 63, column: 9)
!113 = !DILocation(line: 64, column: 28, scope: !112)
!114 = !DILocation(line: 64, column: 18, scope: !112)
!115 = !DILocation(line: 64, column: 13, scope: !112)
!116 = !DILocation(line: 64, column: 21, scope: !112)
!117 = !DILocation(line: 65, column: 9, scope: !112)
!118 = !DILocation(line: 62, column: 35, scope: !107)
!119 = !DILocation(line: 62, column: 9, scope: !107)
!120 = distinct !{!120, !110, !121, !61}
!121 = !DILocation(line: 65, column: 9, scope: !104)
!122 = !DILocation(line: 66, column: 9, scope: !94)
!123 = !DILocation(line: 66, column: 20, scope: !94)
!124 = !DILocation(line: 67, column: 20, scope: !94)
!125 = !DILocation(line: 67, column: 9, scope: !94)
!126 = !DILocation(line: 68, column: 14, scope: !94)
!127 = !DILocation(line: 68, column: 9, scope: !94)
!128 = !DILocation(line: 70, column: 1, scope: !90)
!129 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_41_good", scope: !19, file: !19, line: 84, type: !70, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!130 = !DILocation(line: 86, column: 5, scope: !129)
!131 = !DILocation(line: 87, column: 1, scope: !129)
!132 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 99, type: !133, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!133 = !DISubroutineType(types: !134)
!134 = !{!8, !8, !135}
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64)
!137 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!138 = !DILocalVariable(name: "argc", arg: 1, scope: !132, file: !19, line: 99, type: !8)
!139 = !DILocation(line: 99, column: 14, scope: !132)
!140 = !DILocalVariable(name: "argv", arg: 2, scope: !132, file: !19, line: 99, type: !135)
!141 = !DILocation(line: 99, column: 27, scope: !132)
!142 = !DILocation(line: 102, column: 22, scope: !132)
!143 = !DILocation(line: 102, column: 12, scope: !132)
!144 = !DILocation(line: 102, column: 5, scope: !132)
!145 = !DILocation(line: 104, column: 5, scope: !132)
!146 = !DILocation(line: 105, column: 5, scope: !132)
!147 = !DILocation(line: 106, column: 5, scope: !132)
!148 = !DILocation(line: 109, column: 5, scope: !132)
!149 = !DILocation(line: 110, column: 5, scope: !132)
!150 = !DILocation(line: 111, column: 5, scope: !132)
!151 = !DILocation(line: 113, column: 5, scope: !132)
!152 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 73, type: !70, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!153 = !DILocalVariable(name: "data", scope: !152, file: !19, line: 75, type: !3)
!154 = !DILocation(line: 75, column: 15, scope: !152)
!155 = !DILocation(line: 76, column: 23, scope: !152)
!156 = !DILocation(line: 76, column: 12, scope: !152)
!157 = !DILocation(line: 76, column: 10, scope: !152)
!158 = !DILocation(line: 77, column: 9, scope: !159)
!159 = distinct !DILexicalBlock(scope: !152, file: !19, line: 77, column: 9)
!160 = !DILocation(line: 77, column: 14, scope: !159)
!161 = !DILocation(line: 77, column: 9, scope: !152)
!162 = !DILocation(line: 77, column: 24, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !19, line: 77, column: 23)
!164 = !DILocation(line: 79, column: 13, scope: !152)
!165 = !DILocation(line: 79, column: 5, scope: !152)
!166 = !DILocation(line: 80, column: 5, scope: !152)
!167 = !DILocation(line: 80, column: 16, scope: !152)
!168 = !DILocation(line: 81, column: 77, scope: !152)
!169 = !DILocation(line: 81, column: 5, scope: !152)
!170 = !DILocation(line: 82, column: 1, scope: !152)
