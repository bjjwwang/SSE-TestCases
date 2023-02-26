; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !50
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !51
  store i32 0, i32* %arrayidx2, align 4, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !56
  %cmp3 = icmp ult i64 %3, 100, !dbg !58
  br i1 %cmp3, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !62
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !62
  %6 = load i32*, i32** %data, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !63
  store i32 %5, i32* %arrayidx5, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %8, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !72
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !72
  store i32 0, i32* %arrayidx6, align 4, !dbg !73
  %10 = load i32*, i32** %data, align 8, !dbg !74
  call void @printWLine(i32* noundef %10), !dbg !75
  %11 = load i32*, i32** %data, align 8, !dbg !76
  %12 = bitcast i32* %11 to i8*, !dbg !76
  call void @free(i8* noundef %12), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* noundef null), !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 noundef %conv), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i32* null, i32** %data, align 8, !dbg !106
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !107
  %0 = bitcast i8* %call to i32*, !dbg !108
  store i32* %0, i32** %data, align 8, !dbg !109
  %1 = load i32*, i32** %data, align 8, !dbg !110
  %cmp = icmp eq i32* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !124
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx2, align 4, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !130
  %cmp3 = icmp ult i64 %3, 100, !dbg !132
  br i1 %cmp3, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !136
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !136
  %6 = load i32*, i32** %data, align 8, !dbg !137
  %7 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !137
  store i32 %5, i32* %arrayidx5, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %8, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !145
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !145
  store i32 0, i32* %arrayidx6, align 4, !dbg !146
  %10 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* noundef %10), !dbg !148
  %11 = load i32*, i32** %data, align 8, !dbg !149
  %12 = bitcast i32* %11 to i8*, !dbg !149
  call void @free(i8* noundef %12), !dbg !150
  ret void, !dbg !151
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !152 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !153, metadata !DIExpression()), !dbg !154
  store i32* null, i32** %data, align 8, !dbg !155
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !156
  %0 = bitcast i8* %call to i32*, !dbg !157
  store i32* %0, i32** %data, align 8, !dbg !158
  %1 = load i32*, i32** %data, align 8, !dbg !159
  %cmp = icmp eq i32* %1, null, !dbg !161
  br i1 %cmp, label %if.then, label %if.end, !dbg !162

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !163
  unreachable, !dbg !163

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !165
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  call void @llvm.dbg.declare(metadata i64* %i, metadata !167, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !172
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !173
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !174
  store i32 0, i32* %arrayidx2, align 4, !dbg !175
  store i64 0, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !179
  %cmp3 = icmp ult i64 %3, 100, !dbg !181
  br i1 %cmp3, label %for.body, label %for.end, !dbg !182

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !185
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !185
  %6 = load i32*, i32** %data, align 8, !dbg !186
  %7 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !186
  store i32 %5, i32* %arrayidx5, align 4, !dbg !188
  br label %for.inc, !dbg !189

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !190
  %inc = add i64 %8, 1, !dbg !190
  store i64 %inc, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !191, !llvm.loop !192

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !194
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !194
  store i32 0, i32* %arrayidx6, align 4, !dbg !195
  %10 = load i32*, i32** %data, align 8, !dbg !196
  call void @printWLine(i32* noundef %10), !dbg !197
  %11 = load i32*, i32** %data, align 8, !dbg !198
  %12 = bitcast i32* %11 to i8*, !dbg !198
  call void @free(i8* noundef %12), !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 31, column: 27, scope: !18)
!27 = !DILocation(line: 31, column: 16, scope: !18)
!28 = !DILocation(line: 31, column: 14, scope: !18)
!29 = !DILocation(line: 32, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 13)
!31 = !DILocation(line: 32, column: 18, scope: !30)
!32 = !DILocation(line: 32, column: 13, scope: !18)
!33 = !DILocation(line: 32, column: 28, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 32, column: 27)
!35 = !DILocation(line: 33, column: 9, scope: !18)
!36 = !DILocation(line: 33, column: 17, scope: !18)
!37 = !DILocalVariable(name: "i", scope: !38, file: !19, line: 41, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 40, column: 5)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !40, line: 31, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !42)
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 41, column: 16, scope: !38)
!44 = !DILocalVariable(name: "source", scope: !38, file: !19, line: 42, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 42, column: 17, scope: !38)
!49 = !DILocation(line: 43, column: 17, scope: !38)
!50 = !DILocation(line: 43, column: 9, scope: !38)
!51 = !DILocation(line: 44, column: 9, scope: !38)
!52 = !DILocation(line: 44, column: 23, scope: !38)
!53 = !DILocation(line: 46, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !38, file: !19, line: 46, column: 9)
!55 = !DILocation(line: 46, column: 14, scope: !54)
!56 = !DILocation(line: 46, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !19, line: 46, column: 9)
!58 = !DILocation(line: 46, column: 23, scope: !57)
!59 = !DILocation(line: 46, column: 9, scope: !54)
!60 = !DILocation(line: 48, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !19, line: 47, column: 9)
!62 = !DILocation(line: 48, column: 23, scope: !61)
!63 = !DILocation(line: 48, column: 13, scope: !61)
!64 = !DILocation(line: 48, column: 18, scope: !61)
!65 = !DILocation(line: 48, column: 21, scope: !61)
!66 = !DILocation(line: 49, column: 9, scope: !61)
!67 = !DILocation(line: 46, column: 31, scope: !57)
!68 = !DILocation(line: 46, column: 9, scope: !57)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 49, column: 9, scope: !54)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 50, column: 9, scope: !38)
!73 = !DILocation(line: 50, column: 21, scope: !38)
!74 = !DILocation(line: 51, column: 20, scope: !38)
!75 = !DILocation(line: 51, column: 9, scope: !38)
!76 = !DILocation(line: 52, column: 14, scope: !38)
!77 = !DILocation(line: 52, column: 9, scope: !38)
!78 = !DILocation(line: 54, column: 1, scope: !18)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_15_good", scope: !19, file: !19, line: 128, type: !20, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!80 = !DILocation(line: 130, column: 5, scope: !79)
!81 = !DILocation(line: 131, column: 5, scope: !79)
!82 = !DILocation(line: 132, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 144, type: !84, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!84 = !DISubroutineType(types: !85)
!85 = !{!8, !8, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !19, line: 144, type: !8)
!90 = !DILocation(line: 144, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !19, line: 144, type: !86)
!92 = !DILocation(line: 144, column: 27, scope: !83)
!93 = !DILocation(line: 147, column: 22, scope: !83)
!94 = !DILocation(line: 147, column: 12, scope: !83)
!95 = !DILocation(line: 147, column: 5, scope: !83)
!96 = !DILocation(line: 149, column: 5, scope: !83)
!97 = !DILocation(line: 150, column: 5, scope: !83)
!98 = !DILocation(line: 151, column: 5, scope: !83)
!99 = !DILocation(line: 154, column: 5, scope: !83)
!100 = !DILocation(line: 155, column: 5, scope: !83)
!101 = !DILocation(line: 156, column: 5, scope: !83)
!102 = !DILocation(line: 158, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 61, type: !20, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!104 = !DILocalVariable(name: "data", scope: !103, file: !19, line: 63, type: !3)
!105 = !DILocation(line: 63, column: 15, scope: !103)
!106 = !DILocation(line: 64, column: 10, scope: !103)
!107 = !DILocation(line: 73, column: 27, scope: !103)
!108 = !DILocation(line: 73, column: 16, scope: !103)
!109 = !DILocation(line: 73, column: 14, scope: !103)
!110 = !DILocation(line: 74, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !19, line: 74, column: 13)
!112 = !DILocation(line: 74, column: 18, scope: !111)
!113 = !DILocation(line: 74, column: 13, scope: !103)
!114 = !DILocation(line: 74, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !19, line: 74, column: 27)
!116 = !DILocation(line: 75, column: 9, scope: !103)
!117 = !DILocation(line: 75, column: 17, scope: !103)
!118 = !DILocalVariable(name: "i", scope: !119, file: !19, line: 79, type: !39)
!119 = distinct !DILexicalBlock(scope: !103, file: !19, line: 78, column: 5)
!120 = !DILocation(line: 79, column: 16, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !119, file: !19, line: 80, type: !45)
!122 = !DILocation(line: 80, column: 17, scope: !119)
!123 = !DILocation(line: 81, column: 17, scope: !119)
!124 = !DILocation(line: 81, column: 9, scope: !119)
!125 = !DILocation(line: 82, column: 9, scope: !119)
!126 = !DILocation(line: 82, column: 23, scope: !119)
!127 = !DILocation(line: 84, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !119, file: !19, line: 84, column: 9)
!129 = !DILocation(line: 84, column: 14, scope: !128)
!130 = !DILocation(line: 84, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !19, line: 84, column: 9)
!132 = !DILocation(line: 84, column: 23, scope: !131)
!133 = !DILocation(line: 84, column: 9, scope: !128)
!134 = !DILocation(line: 86, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !19, line: 85, column: 9)
!136 = !DILocation(line: 86, column: 23, scope: !135)
!137 = !DILocation(line: 86, column: 13, scope: !135)
!138 = !DILocation(line: 86, column: 18, scope: !135)
!139 = !DILocation(line: 86, column: 21, scope: !135)
!140 = !DILocation(line: 87, column: 9, scope: !135)
!141 = !DILocation(line: 84, column: 31, scope: !131)
!142 = !DILocation(line: 84, column: 9, scope: !131)
!143 = distinct !{!143, !133, !144, !71}
!144 = !DILocation(line: 87, column: 9, scope: !128)
!145 = !DILocation(line: 88, column: 9, scope: !119)
!146 = !DILocation(line: 88, column: 21, scope: !119)
!147 = !DILocation(line: 89, column: 20, scope: !119)
!148 = !DILocation(line: 89, column: 9, scope: !119)
!149 = !DILocation(line: 90, column: 14, scope: !119)
!150 = !DILocation(line: 90, column: 9, scope: !119)
!151 = !DILocation(line: 92, column: 1, scope: !103)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 95, type: !20, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!153 = !DILocalVariable(name: "data", scope: !152, file: !19, line: 97, type: !3)
!154 = !DILocation(line: 97, column: 15, scope: !152)
!155 = !DILocation(line: 98, column: 10, scope: !152)
!156 = !DILocation(line: 103, column: 27, scope: !152)
!157 = !DILocation(line: 103, column: 16, scope: !152)
!158 = !DILocation(line: 103, column: 14, scope: !152)
!159 = !DILocation(line: 104, column: 13, scope: !160)
!160 = distinct !DILexicalBlock(scope: !152, file: !19, line: 104, column: 13)
!161 = !DILocation(line: 104, column: 18, scope: !160)
!162 = !DILocation(line: 104, column: 13, scope: !152)
!163 = !DILocation(line: 104, column: 28, scope: !164)
!164 = distinct !DILexicalBlock(scope: !160, file: !19, line: 104, column: 27)
!165 = !DILocation(line: 105, column: 9, scope: !152)
!166 = !DILocation(line: 105, column: 17, scope: !152)
!167 = !DILocalVariable(name: "i", scope: !168, file: !19, line: 113, type: !39)
!168 = distinct !DILexicalBlock(scope: !152, file: !19, line: 112, column: 5)
!169 = !DILocation(line: 113, column: 16, scope: !168)
!170 = !DILocalVariable(name: "source", scope: !168, file: !19, line: 114, type: !45)
!171 = !DILocation(line: 114, column: 17, scope: !168)
!172 = !DILocation(line: 115, column: 17, scope: !168)
!173 = !DILocation(line: 115, column: 9, scope: !168)
!174 = !DILocation(line: 116, column: 9, scope: !168)
!175 = !DILocation(line: 116, column: 23, scope: !168)
!176 = !DILocation(line: 118, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !168, file: !19, line: 118, column: 9)
!178 = !DILocation(line: 118, column: 14, scope: !177)
!179 = !DILocation(line: 118, column: 21, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !19, line: 118, column: 9)
!181 = !DILocation(line: 118, column: 23, scope: !180)
!182 = !DILocation(line: 118, column: 9, scope: !177)
!183 = !DILocation(line: 120, column: 30, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !19, line: 119, column: 9)
!185 = !DILocation(line: 120, column: 23, scope: !184)
!186 = !DILocation(line: 120, column: 13, scope: !184)
!187 = !DILocation(line: 120, column: 18, scope: !184)
!188 = !DILocation(line: 120, column: 21, scope: !184)
!189 = !DILocation(line: 121, column: 9, scope: !184)
!190 = !DILocation(line: 118, column: 31, scope: !180)
!191 = !DILocation(line: 118, column: 9, scope: !180)
!192 = distinct !{!192, !182, !193, !71}
!193 = !DILocation(line: 121, column: 9, scope: !177)
!194 = !DILocation(line: 122, column: 9, scope: !168)
!195 = !DILocation(line: 122, column: 21, scope: !168)
!196 = !DILocation(line: 123, column: 20, scope: !168)
!197 = !DILocation(line: 123, column: 9, scope: !168)
!198 = !DILocation(line: 124, column: 14, scope: !168)
!199 = !DILocation(line: 124, column: 9, scope: !168)
!200 = !DILocation(line: 126, column: 1, scope: !152)
