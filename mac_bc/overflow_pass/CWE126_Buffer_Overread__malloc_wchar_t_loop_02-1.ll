; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_02_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !56
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx3, align 4, !dbg !58
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call5 = call i64 @wcslen(i32* noundef %arraydecay4), !dbg !60
  store i64 %call5, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !65
  %5 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp6 = icmp ult i64 %4, %5, !dbg !68
  br i1 %cmp6, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !70
  %7 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !70
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !70
  %9 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !74
  store i32 %8, i32* %arrayidx8, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %10, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx9, align 4, !dbg !83
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  call void @printWLine(i32* noundef %arraydecay10), !dbg !85
  %11 = load i32*, i32** %data, align 8, !dbg !86
  %12 = bitcast i32* %11 to i8*, !dbg !86
  call void @free(i8* noundef %12), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_02_good() #0 !dbg !89 {
entry:
  call void @goodG2B1(), !dbg !90
  call void @goodG2B2(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_02_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_02_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32* null, i32** %data, align 8, !dbg !116
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !117
  %0 = bitcast i8* %call to i32*, !dbg !120
  store i32* %0, i32** %data, align 8, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %cmp = icmp eq i32* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !128
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !129
  %3 = load i32*, i32** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !140
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx3, align 4, !dbg !142
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %call5 = call i64 @wcslen(i32* noundef %arraydecay4), !dbg !144
  store i64 %call5, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !149
  %5 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp6 = icmp ult i64 %4, %5, !dbg !152
  br i1 %cmp6, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !154
  %7 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !154
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !154
  %9 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !158
  store i32 %8, i32* %arrayidx8, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %10, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx9, align 4, !dbg !166
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  call void @printWLine(i32* noundef %arraydecay10), !dbg !168
  %11 = load i32*, i32** %data, align 8, !dbg !169
  %12 = bitcast i32* %11 to i8*, !dbg !169
  call void @free(i8* noundef %12), !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !172 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !173, metadata !DIExpression()), !dbg !174
  store i32* null, i32** %data, align 8, !dbg !175
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !176
  %0 = bitcast i8* %call to i32*, !dbg !179
  store i32* %0, i32** %data, align 8, !dbg !180
  %1 = load i32*, i32** %data, align 8, !dbg !181
  %cmp = icmp eq i32* %1, null, !dbg !183
  br i1 %cmp, label %if.then, label %if.end, !dbg !184

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !185
  unreachable, !dbg !185

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !187
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !188
  %3 = load i32*, i32** %data, align 8, !dbg !189
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !189
  store i32 0, i32* %arrayidx, align 4, !dbg !190
  call void @llvm.dbg.declare(metadata i64* %i, metadata !191, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !196, metadata !DIExpression()), !dbg !197
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !198
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !199
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !200
  store i32 0, i32* %arrayidx3, align 4, !dbg !201
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !202
  %call5 = call i64 @wcslen(i32* noundef %arraydecay4), !dbg !203
  store i64 %call5, i64* %destLen, align 8, !dbg !204
  store i64 0, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !207

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !208
  %5 = load i64, i64* %destLen, align 8, !dbg !210
  %cmp6 = icmp ult i64 %4, %5, !dbg !211
  br i1 %cmp6, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !213
  %7 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx7 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !213
  %8 = load i32, i32* %arrayidx7, align 4, !dbg !213
  %9 = load i64, i64* %i, align 8, !dbg !216
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %9, !dbg !217
  store i32 %8, i32* %arrayidx8, align 4, !dbg !218
  br label %for.inc, !dbg !219

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !220
  %inc = add i64 %10, 1, !dbg !220
  store i64 %inc, i64* %i, align 8, !dbg !220
  br label %for.cond, !dbg !221, !llvm.loop !222

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !224
  store i32 0, i32* %arrayidx9, align 4, !dbg !225
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !226
  call void @printWLine(i32* noundef %arraydecay10), !dbg !227
  %11 = load i32*, i32** %data, align 8, !dbg !228
  %12 = bitcast i32* %11 to i8*, !dbg !228
  call void @free(i8* noundef %12), !dbg !229
  ret void, !dbg !230
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_02_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 28, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 8)
!29 = !DILocation(line: 30, column: 16, scope: !27)
!30 = !DILocation(line: 30, column: 14, scope: !27)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !19, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !27)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 17, scope: !27)
!38 = !DILocation(line: 32, column: 9, scope: !27)
!39 = !DILocation(line: 33, column: 9, scope: !27)
!40 = !DILocation(line: 33, column: 20, scope: !27)
!41 = !DILocalVariable(name: "i", scope: !42, file: !19, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !46)
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 16, scope: !42)
!48 = !DILocalVariable(name: "destLen", scope: !42, file: !19, line: 36, type: !43)
!49 = !DILocation(line: 36, column: 19, scope: !42)
!50 = !DILocalVariable(name: "dest", scope: !42, file: !19, line: 37, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 37, column: 17, scope: !42)
!55 = !DILocation(line: 38, column: 17, scope: !42)
!56 = !DILocation(line: 38, column: 9, scope: !42)
!57 = !DILocation(line: 39, column: 9, scope: !42)
!58 = !DILocation(line: 39, column: 21, scope: !42)
!59 = !DILocation(line: 40, column: 26, scope: !42)
!60 = !DILocation(line: 40, column: 19, scope: !42)
!61 = !DILocation(line: 40, column: 17, scope: !42)
!62 = !DILocation(line: 43, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !42, file: !19, line: 43, column: 9)
!64 = !DILocation(line: 43, column: 14, scope: !63)
!65 = !DILocation(line: 43, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !19, line: 43, column: 9)
!67 = !DILocation(line: 43, column: 25, scope: !66)
!68 = !DILocation(line: 43, column: 23, scope: !66)
!69 = !DILocation(line: 43, column: 9, scope: !63)
!70 = !DILocation(line: 45, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !19, line: 44, column: 9)
!72 = !DILocation(line: 45, column: 28, scope: !71)
!73 = !DILocation(line: 45, column: 18, scope: !71)
!74 = !DILocation(line: 45, column: 13, scope: !71)
!75 = !DILocation(line: 45, column: 21, scope: !71)
!76 = !DILocation(line: 46, column: 9, scope: !71)
!77 = !DILocation(line: 43, column: 35, scope: !66)
!78 = !DILocation(line: 43, column: 9, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 46, column: 9, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 47, column: 9, scope: !42)
!83 = !DILocation(line: 47, column: 21, scope: !42)
!84 = !DILocation(line: 48, column: 20, scope: !42)
!85 = !DILocation(line: 48, column: 9, scope: !42)
!86 = !DILocation(line: 49, column: 14, scope: !42)
!87 = !DILocation(line: 49, column: 9, scope: !42)
!88 = !DILocation(line: 51, column: 1, scope: !18)
!89 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_02_good", scope: !19, file: !19, line: 124, type: !20, scopeLine: 125, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!90 = !DILocation(line: 126, column: 5, scope: !89)
!91 = !DILocation(line: 127, column: 5, scope: !89)
!92 = !DILocation(line: 128, column: 1, scope: !89)
!93 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 140, type: !94, scopeLine: 141, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!94 = !DISubroutineType(types: !95)
!95 = !{!8, !8, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !19, line: 140, type: !8)
!100 = !DILocation(line: 140, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !19, line: 140, type: !96)
!102 = !DILocation(line: 140, column: 27, scope: !93)
!103 = !DILocation(line: 143, column: 22, scope: !93)
!104 = !DILocation(line: 143, column: 12, scope: !93)
!105 = !DILocation(line: 143, column: 5, scope: !93)
!106 = !DILocation(line: 145, column: 5, scope: !93)
!107 = !DILocation(line: 146, column: 5, scope: !93)
!108 = !DILocation(line: 147, column: 5, scope: !93)
!109 = !DILocation(line: 150, column: 5, scope: !93)
!110 = !DILocation(line: 151, column: 5, scope: !93)
!111 = !DILocation(line: 152, column: 5, scope: !93)
!112 = !DILocation(line: 154, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!114 = !DILocalVariable(name: "data", scope: !113, file: !19, line: 60, type: !3)
!115 = !DILocation(line: 60, column: 15, scope: !113)
!116 = !DILocation(line: 61, column: 10, scope: !113)
!117 = !DILocation(line: 70, column: 27, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !19, line: 68, column: 5)
!119 = distinct !DILexicalBlock(scope: !113, file: !19, line: 62, column: 8)
!120 = !DILocation(line: 70, column: 16, scope: !118)
!121 = !DILocation(line: 70, column: 14, scope: !118)
!122 = !DILocation(line: 71, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !19, line: 71, column: 13)
!124 = !DILocation(line: 71, column: 18, scope: !123)
!125 = !DILocation(line: 71, column: 13, scope: !118)
!126 = !DILocation(line: 71, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !19, line: 71, column: 27)
!128 = !DILocation(line: 72, column: 17, scope: !118)
!129 = !DILocation(line: 72, column: 9, scope: !118)
!130 = !DILocation(line: 73, column: 9, scope: !118)
!131 = !DILocation(line: 73, column: 21, scope: !118)
!132 = !DILocalVariable(name: "i", scope: !133, file: !19, line: 76, type: !43)
!133 = distinct !DILexicalBlock(scope: !113, file: !19, line: 75, column: 5)
!134 = !DILocation(line: 76, column: 16, scope: !133)
!135 = !DILocalVariable(name: "destLen", scope: !133, file: !19, line: 76, type: !43)
!136 = !DILocation(line: 76, column: 19, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !133, file: !19, line: 77, type: !51)
!138 = !DILocation(line: 77, column: 17, scope: !133)
!139 = !DILocation(line: 78, column: 17, scope: !133)
!140 = !DILocation(line: 78, column: 9, scope: !133)
!141 = !DILocation(line: 79, column: 9, scope: !133)
!142 = !DILocation(line: 79, column: 21, scope: !133)
!143 = !DILocation(line: 80, column: 26, scope: !133)
!144 = !DILocation(line: 80, column: 19, scope: !133)
!145 = !DILocation(line: 80, column: 17, scope: !133)
!146 = !DILocation(line: 83, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !133, file: !19, line: 83, column: 9)
!148 = !DILocation(line: 83, column: 14, scope: !147)
!149 = !DILocation(line: 83, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !19, line: 83, column: 9)
!151 = !DILocation(line: 83, column: 25, scope: !150)
!152 = !DILocation(line: 83, column: 23, scope: !150)
!153 = !DILocation(line: 83, column: 9, scope: !147)
!154 = !DILocation(line: 85, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !19, line: 84, column: 9)
!156 = !DILocation(line: 85, column: 28, scope: !155)
!157 = !DILocation(line: 85, column: 18, scope: !155)
!158 = !DILocation(line: 85, column: 13, scope: !155)
!159 = !DILocation(line: 85, column: 21, scope: !155)
!160 = !DILocation(line: 86, column: 9, scope: !155)
!161 = !DILocation(line: 83, column: 35, scope: !150)
!162 = !DILocation(line: 83, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !81}
!164 = !DILocation(line: 86, column: 9, scope: !147)
!165 = !DILocation(line: 87, column: 9, scope: !133)
!166 = !DILocation(line: 87, column: 21, scope: !133)
!167 = !DILocation(line: 88, column: 20, scope: !133)
!168 = !DILocation(line: 88, column: 9, scope: !133)
!169 = !DILocation(line: 89, column: 14, scope: !133)
!170 = !DILocation(line: 89, column: 9, scope: !133)
!171 = !DILocation(line: 91, column: 1, scope: !113)
!172 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 94, type: !20, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!173 = !DILocalVariable(name: "data", scope: !172, file: !19, line: 96, type: !3)
!174 = !DILocation(line: 96, column: 15, scope: !172)
!175 = !DILocation(line: 97, column: 10, scope: !172)
!176 = !DILocation(line: 101, column: 27, scope: !177)
!177 = distinct !DILexicalBlock(scope: !178, file: !19, line: 99, column: 5)
!178 = distinct !DILexicalBlock(scope: !172, file: !19, line: 98, column: 8)
!179 = !DILocation(line: 101, column: 16, scope: !177)
!180 = !DILocation(line: 101, column: 14, scope: !177)
!181 = !DILocation(line: 102, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !177, file: !19, line: 102, column: 13)
!183 = !DILocation(line: 102, column: 18, scope: !182)
!184 = !DILocation(line: 102, column: 13, scope: !177)
!185 = !DILocation(line: 102, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !19, line: 102, column: 27)
!187 = !DILocation(line: 103, column: 17, scope: !177)
!188 = !DILocation(line: 103, column: 9, scope: !177)
!189 = !DILocation(line: 104, column: 9, scope: !177)
!190 = !DILocation(line: 104, column: 21, scope: !177)
!191 = !DILocalVariable(name: "i", scope: !192, file: !19, line: 107, type: !43)
!192 = distinct !DILexicalBlock(scope: !172, file: !19, line: 106, column: 5)
!193 = !DILocation(line: 107, column: 16, scope: !192)
!194 = !DILocalVariable(name: "destLen", scope: !192, file: !19, line: 107, type: !43)
!195 = !DILocation(line: 107, column: 19, scope: !192)
!196 = !DILocalVariable(name: "dest", scope: !192, file: !19, line: 108, type: !51)
!197 = !DILocation(line: 108, column: 17, scope: !192)
!198 = !DILocation(line: 109, column: 17, scope: !192)
!199 = !DILocation(line: 109, column: 9, scope: !192)
!200 = !DILocation(line: 110, column: 9, scope: !192)
!201 = !DILocation(line: 110, column: 21, scope: !192)
!202 = !DILocation(line: 111, column: 26, scope: !192)
!203 = !DILocation(line: 111, column: 19, scope: !192)
!204 = !DILocation(line: 111, column: 17, scope: !192)
!205 = !DILocation(line: 114, column: 16, scope: !206)
!206 = distinct !DILexicalBlock(scope: !192, file: !19, line: 114, column: 9)
!207 = !DILocation(line: 114, column: 14, scope: !206)
!208 = !DILocation(line: 114, column: 21, scope: !209)
!209 = distinct !DILexicalBlock(scope: !206, file: !19, line: 114, column: 9)
!210 = !DILocation(line: 114, column: 25, scope: !209)
!211 = !DILocation(line: 114, column: 23, scope: !209)
!212 = !DILocation(line: 114, column: 9, scope: !206)
!213 = !DILocation(line: 116, column: 23, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !19, line: 115, column: 9)
!215 = !DILocation(line: 116, column: 28, scope: !214)
!216 = !DILocation(line: 116, column: 18, scope: !214)
!217 = !DILocation(line: 116, column: 13, scope: !214)
!218 = !DILocation(line: 116, column: 21, scope: !214)
!219 = !DILocation(line: 117, column: 9, scope: !214)
!220 = !DILocation(line: 114, column: 35, scope: !209)
!221 = !DILocation(line: 114, column: 9, scope: !209)
!222 = distinct !{!222, !212, !223, !81}
!223 = !DILocation(line: 117, column: 9, scope: !206)
!224 = !DILocation(line: 118, column: 9, scope: !192)
!225 = !DILocation(line: 118, column: 21, scope: !192)
!226 = !DILocation(line: 119, column: 20, scope: !192)
!227 = !DILocation(line: 119, column: 9, scope: !192)
!228 = !DILocation(line: 120, column: 14, scope: !192)
!229 = !DILocation(line: 120, column: 9, scope: !192)
!230 = !DILocation(line: 122, column: 1, scope: !172)
