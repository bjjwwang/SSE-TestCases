; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_badSink(i32* noundef %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %i, metadata !25, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !40
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !43
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !44
  store i64 %call2, i64* %destLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !49
  %1 = load i64, i64* %destLen, align 8, !dbg !51
  %cmp = icmp ult i64 %0, %1, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !54
  %3 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !54
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !54
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !58
  store i32 %4, i32* %arrayidx4, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx5, align 4, !dbg !67
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  call void @printWLine(i32* noundef %arraydecay6), !dbg !69
  %7 = load i32*, i32** %data.addr, align 8, !dbg !70
  %8 = bitcast i32* %7 to i8*, !dbg !70
  call void @free(i8* noundef %8), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_bad() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  store i32* null, i32** %data, align 8, !dbg !78
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !79
  %0 = bitcast i8* %call to i32*, !dbg !80
  store i32* %0, i32** %data, align 8, !dbg !81
  %1 = load i32*, i32** %data, align 8, !dbg !82
  %cmp = icmp eq i32* %1, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !88
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !89
  %3 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  %4 = load i32*, i32** %data, align 8, !dbg !92
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_badSink(i32* noundef %4), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_goodG2BSink(i32* noundef %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i64* %i, metadata !98, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !106
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !110
  store i64 %call2, i64* %destLen, align 8, !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !115
  %1 = load i64, i64* %destLen, align 8, !dbg !117
  %cmp = icmp ult i64 %0, %1, !dbg !118
  br i1 %cmp, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !120
  %3 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !120
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !120
  %5 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !124
  store i32 %4, i32* %arrayidx4, align 4, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !127
  %inc = add i64 %6, 1, !dbg !127
  store i64 %inc, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx5, align 4, !dbg !132
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  call void @printWLine(i32* noundef %arraydecay6), !dbg !134
  %7 = load i32*, i32** %data.addr, align 8, !dbg !135
  %8 = bitcast i32* %7 to i8*, !dbg !135
  call void @free(i8* noundef %8), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_good() #0 !dbg !138 {
entry:
  call void @goodG2B(), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !141 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !147, metadata !DIExpression()), !dbg !148
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !149, metadata !DIExpression()), !dbg !150
  %call = call i64 @time(i64* noundef null), !dbg !151
  %conv = trunc i64 %call to i32, !dbg !152
  call void @srand(i32 noundef %conv), !dbg !153
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !154
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_good(), !dbg !155
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !156
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !157
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_bad(), !dbg !158
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !159
  ret i32 0, !dbg !160
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !161 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !162, metadata !DIExpression()), !dbg !163
  store i32* null, i32** %data, align 8, !dbg !164
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !165
  %0 = bitcast i8* %call to i32*, !dbg !166
  store i32* %0, i32** %data, align 8, !dbg !167
  %1 = load i32*, i32** %data, align 8, !dbg !168
  %cmp = icmp eq i32* %1, null, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !172
  unreachable, !dbg !172

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !174
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !175
  %3 = load i32*, i32** %data, align 8, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !177
  %4 = load i32*, i32** %data, align 8, !dbg !178
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_41_goodG2BSink(i32* noundef %4), !dbg !179
  ret void, !dbg !180
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_41_badSink", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !3}
!22 = !{}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !19, line: 23, type: !3)
!24 = !DILocation(line: 23, column: 71, scope: !18)
!25 = !DILocalVariable(name: "i", scope: !26, file: !19, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 25, column: 5)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 31, baseType: !29)
!28 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !30)
!30 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!31 = !DILocation(line: 26, column: 16, scope: !26)
!32 = !DILocalVariable(name: "destLen", scope: !26, file: !19, line: 26, type: !27)
!33 = !DILocation(line: 26, column: 19, scope: !26)
!34 = !DILocalVariable(name: "dest", scope: !26, file: !19, line: 27, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 27, column: 17, scope: !26)
!39 = !DILocation(line: 28, column: 17, scope: !26)
!40 = !DILocation(line: 28, column: 9, scope: !26)
!41 = !DILocation(line: 29, column: 9, scope: !26)
!42 = !DILocation(line: 29, column: 21, scope: !26)
!43 = !DILocation(line: 30, column: 26, scope: !26)
!44 = !DILocation(line: 30, column: 19, scope: !26)
!45 = !DILocation(line: 30, column: 17, scope: !26)
!46 = !DILocation(line: 33, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !26, file: !19, line: 33, column: 9)
!48 = !DILocation(line: 33, column: 14, scope: !47)
!49 = !DILocation(line: 33, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !19, line: 33, column: 9)
!51 = !DILocation(line: 33, column: 25, scope: !50)
!52 = !DILocation(line: 33, column: 23, scope: !50)
!53 = !DILocation(line: 33, column: 9, scope: !47)
!54 = !DILocation(line: 35, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !19, line: 34, column: 9)
!56 = !DILocation(line: 35, column: 28, scope: !55)
!57 = !DILocation(line: 35, column: 18, scope: !55)
!58 = !DILocation(line: 35, column: 13, scope: !55)
!59 = !DILocation(line: 35, column: 21, scope: !55)
!60 = !DILocation(line: 36, column: 9, scope: !55)
!61 = !DILocation(line: 33, column: 35, scope: !50)
!62 = !DILocation(line: 33, column: 9, scope: !50)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 36, column: 9, scope: !47)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 37, column: 9, scope: !26)
!67 = !DILocation(line: 37, column: 21, scope: !26)
!68 = !DILocation(line: 38, column: 20, scope: !26)
!69 = !DILocation(line: 38, column: 9, scope: !26)
!70 = !DILocation(line: 39, column: 14, scope: !26)
!71 = !DILocation(line: 39, column: 9, scope: !26)
!72 = !DILocation(line: 41, column: 1, scope: !18)
!73 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_41_bad", scope: !19, file: !19, line: 43, type: !74, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!74 = !DISubroutineType(types: !75)
!75 = !{null}
!76 = !DILocalVariable(name: "data", scope: !73, file: !19, line: 45, type: !3)
!77 = !DILocation(line: 45, column: 15, scope: !73)
!78 = !DILocation(line: 46, column: 10, scope: !73)
!79 = !DILocation(line: 48, column: 23, scope: !73)
!80 = !DILocation(line: 48, column: 12, scope: !73)
!81 = !DILocation(line: 48, column: 10, scope: !73)
!82 = !DILocation(line: 49, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !19, line: 49, column: 9)
!84 = !DILocation(line: 49, column: 14, scope: !83)
!85 = !DILocation(line: 49, column: 9, scope: !73)
!86 = !DILocation(line: 49, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !19, line: 49, column: 23)
!88 = !DILocation(line: 50, column: 13, scope: !73)
!89 = !DILocation(line: 50, column: 5, scope: !73)
!90 = !DILocation(line: 51, column: 5, scope: !73)
!91 = !DILocation(line: 51, column: 16, scope: !73)
!92 = !DILocation(line: 52, column: 60, scope: !73)
!93 = !DILocation(line: 52, column: 5, scope: !73)
!94 = !DILocation(line: 53, column: 1, scope: !73)
!95 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_41_goodG2BSink", scope: !19, file: !19, line: 59, type: !20, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !19, line: 59, type: !3)
!97 = !DILocation(line: 59, column: 75, scope: !95)
!98 = !DILocalVariable(name: "i", scope: !99, file: !19, line: 62, type: !27)
!99 = distinct !DILexicalBlock(scope: !95, file: !19, line: 61, column: 5)
!100 = !DILocation(line: 62, column: 16, scope: !99)
!101 = !DILocalVariable(name: "destLen", scope: !99, file: !19, line: 62, type: !27)
!102 = !DILocation(line: 62, column: 19, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !99, file: !19, line: 63, type: !35)
!104 = !DILocation(line: 63, column: 17, scope: !99)
!105 = !DILocation(line: 64, column: 17, scope: !99)
!106 = !DILocation(line: 64, column: 9, scope: !99)
!107 = !DILocation(line: 65, column: 9, scope: !99)
!108 = !DILocation(line: 65, column: 21, scope: !99)
!109 = !DILocation(line: 66, column: 26, scope: !99)
!110 = !DILocation(line: 66, column: 19, scope: !99)
!111 = !DILocation(line: 66, column: 17, scope: !99)
!112 = !DILocation(line: 69, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !99, file: !19, line: 69, column: 9)
!114 = !DILocation(line: 69, column: 14, scope: !113)
!115 = !DILocation(line: 69, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !19, line: 69, column: 9)
!117 = !DILocation(line: 69, column: 25, scope: !116)
!118 = !DILocation(line: 69, column: 23, scope: !116)
!119 = !DILocation(line: 69, column: 9, scope: !113)
!120 = !DILocation(line: 71, column: 23, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !19, line: 70, column: 9)
!122 = !DILocation(line: 71, column: 28, scope: !121)
!123 = !DILocation(line: 71, column: 18, scope: !121)
!124 = !DILocation(line: 71, column: 13, scope: !121)
!125 = !DILocation(line: 71, column: 21, scope: !121)
!126 = !DILocation(line: 72, column: 9, scope: !121)
!127 = !DILocation(line: 69, column: 35, scope: !116)
!128 = !DILocation(line: 69, column: 9, scope: !116)
!129 = distinct !{!129, !119, !130, !65}
!130 = !DILocation(line: 72, column: 9, scope: !113)
!131 = !DILocation(line: 73, column: 9, scope: !99)
!132 = !DILocation(line: 73, column: 21, scope: !99)
!133 = !DILocation(line: 74, column: 20, scope: !99)
!134 = !DILocation(line: 74, column: 9, scope: !99)
!135 = !DILocation(line: 75, column: 14, scope: !99)
!136 = !DILocation(line: 75, column: 9, scope: !99)
!137 = !DILocation(line: 77, column: 1, scope: !95)
!138 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_41_good", scope: !19, file: !19, line: 92, type: !74, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!139 = !DILocation(line: 94, column: 5, scope: !138)
!140 = !DILocation(line: 95, column: 1, scope: !138)
!141 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 107, type: !142, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!142 = !DISubroutineType(types: !143)
!143 = !{!8, !8, !144}
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !146, size: 64)
!146 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!147 = !DILocalVariable(name: "argc", arg: 1, scope: !141, file: !19, line: 107, type: !8)
!148 = !DILocation(line: 107, column: 14, scope: !141)
!149 = !DILocalVariable(name: "argv", arg: 2, scope: !141, file: !19, line: 107, type: !144)
!150 = !DILocation(line: 107, column: 27, scope: !141)
!151 = !DILocation(line: 110, column: 22, scope: !141)
!152 = !DILocation(line: 110, column: 12, scope: !141)
!153 = !DILocation(line: 110, column: 5, scope: !141)
!154 = !DILocation(line: 112, column: 5, scope: !141)
!155 = !DILocation(line: 113, column: 5, scope: !141)
!156 = !DILocation(line: 114, column: 5, scope: !141)
!157 = !DILocation(line: 117, column: 5, scope: !141)
!158 = !DILocation(line: 118, column: 5, scope: !141)
!159 = !DILocation(line: 119, column: 5, scope: !141)
!160 = !DILocation(line: 121, column: 5, scope: !141)
!161 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 80, type: !74, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!162 = !DILocalVariable(name: "data", scope: !161, file: !19, line: 82, type: !3)
!163 = !DILocation(line: 82, column: 15, scope: !161)
!164 = !DILocation(line: 83, column: 10, scope: !161)
!165 = !DILocation(line: 85, column: 23, scope: !161)
!166 = !DILocation(line: 85, column: 12, scope: !161)
!167 = !DILocation(line: 85, column: 10, scope: !161)
!168 = !DILocation(line: 86, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !161, file: !19, line: 86, column: 9)
!170 = !DILocation(line: 86, column: 14, scope: !169)
!171 = !DILocation(line: 86, column: 9, scope: !161)
!172 = !DILocation(line: 86, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !19, line: 86, column: 23)
!174 = !DILocation(line: 87, column: 13, scope: !161)
!175 = !DILocation(line: 87, column: 5, scope: !161)
!176 = !DILocation(line: 88, column: 5, scope: !161)
!177 = !DILocation(line: 88, column: 17, scope: !161)
!178 = !DILocation(line: 89, column: 64, scope: !161)
!179 = !DILocation(line: 89, column: 5, scope: !161)
!180 = !DILocation(line: 90, column: 1, scope: !161)
