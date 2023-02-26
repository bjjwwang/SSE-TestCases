; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_12_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.else, !dbg !28

if.then:                                          ; preds = %entry
  %call1 = call i8* @malloc(i64 noundef 200) #5, !dbg !29
  %0 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then2, label %if.end, !dbg !36

if.then2:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #6, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !39
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end10, !dbg !43

if.else:                                          ; preds = %entry
  %call4 = call i8* @malloc(i64 noundef 400) #5, !dbg !44
  %4 = bitcast i8* %call4 to i32*, !dbg !46
  store i32* %4, i32** %data, align 8, !dbg !47
  %5 = load i32*, i32** %data, align 8, !dbg !48
  %cmp5 = icmp eq i32* %5, null, !dbg !50
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !51

if.then6:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !52
  unreachable, !dbg !52

if.end7:                                          ; preds = %if.else
  %6 = load i32*, i32** %data, align 8, !dbg !54
  %call8 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !55
  %7 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !56
  store i32 0, i32* %arrayidx9, align 4, !dbg !57
  br label %if.end10

if.end10:                                         ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !58, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !67, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !72
  %call11 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !73
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !74
  store i32 0, i32* %arrayidx12, align 4, !dbg !75
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !76
  %call14 = call i64 @wcslen(i32* noundef %arraydecay13), !dbg !77
  store i64 %call14, i64* %destLen, align 8, !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %if.end10
  %8 = load i64, i64* %i, align 8, !dbg !82
  %9 = load i64, i64* %destLen, align 8, !dbg !84
  %cmp15 = icmp ult i64 %8, %9, !dbg !85
  br i1 %cmp15, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !87
  %11 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !87
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !87
  %13 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx17 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %13, !dbg !91
  store i32 %12, i32* %arrayidx17, align 4, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %14, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %arrayidx18 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !99
  store i32 0, i32* %arrayidx18, align 4, !dbg !100
  %arraydecay19 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !101
  call void @printWLine(i32* noundef %arraydecay19), !dbg !102
  %15 = load i32*, i32** %data, align 8, !dbg !103
  %16 = bitcast i32* %15 to i8*, !dbg !103
  call void @free(i8* noundef %16), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #3

; Function Attrs: noreturn
declare void @exit(i32 noundef) #4

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_loop_12_good() #0 !dbg !106 {
entry:
  call void @goodG2B(), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !109 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* noundef null), !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 noundef %conv), !dbg !121
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_12_good(), !dbg !123
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_12_bad(), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !129 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !130, metadata !DIExpression()), !dbg !131
  store i32* null, i32** %data, align 8, !dbg !132
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !133
  %tobool = icmp ne i32 %call, 0, !dbg !133
  br i1 %tobool, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %entry
  %call1 = call i8* @malloc(i64 noundef 400) #5, !dbg !136
  %0 = bitcast i8* %call1 to i32*, !dbg !138
  store i32* %0, i32** %data, align 8, !dbg !139
  %1 = load i32*, i32** %data, align 8, !dbg !140
  %cmp = icmp eq i32* %1, null, !dbg !142
  br i1 %cmp, label %if.then2, label %if.end, !dbg !143

if.then2:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #6, !dbg !144
  unreachable, !dbg !144

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !146
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !147
  %3 = load i32*, i32** %data, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  br label %if.end10, !dbg !150

if.else:                                          ; preds = %entry
  %call4 = call i8* @malloc(i64 noundef 400) #5, !dbg !151
  %4 = bitcast i8* %call4 to i32*, !dbg !153
  store i32* %4, i32** %data, align 8, !dbg !154
  %5 = load i32*, i32** %data, align 8, !dbg !155
  %cmp5 = icmp eq i32* %5, null, !dbg !157
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !158

if.then6:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #6, !dbg !159
  unreachable, !dbg !159

if.end7:                                          ; preds = %if.else
  %6 = load i32*, i32** %data, align 8, !dbg !161
  %call8 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !162
  %7 = load i32*, i32** %data, align 8, !dbg !163
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !163
  store i32 0, i32* %arrayidx9, align 4, !dbg !164
  br label %if.end10

if.end10:                                         ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !168, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  %call11 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !173
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !174
  store i32 0, i32* %arrayidx12, align 4, !dbg !175
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !176
  %call14 = call i64 @wcslen(i32* noundef %arraydecay13), !dbg !177
  store i64 %call14, i64* %destLen, align 8, !dbg !178
  store i64 0, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.end10
  %8 = load i64, i64* %i, align 8, !dbg !182
  %9 = load i64, i64* %destLen, align 8, !dbg !184
  %cmp15 = icmp ult i64 %8, %9, !dbg !185
  br i1 %cmp15, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !187
  %11 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !187
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !187
  %13 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx17 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %13, !dbg !191
  store i32 %12, i32* %arrayidx17, align 4, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %14, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %arrayidx18 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !198
  store i32 0, i32* %arrayidx18, align 4, !dbg !199
  %arraydecay19 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !200
  call void @printWLine(i32* noundef %arraydecay19), !dbg !201
  %15 = load i32*, i32** %data, align 8, !dbg !202
  %16 = bitcast i32* %15 to i8*, !dbg !202
  call void @free(i8* noundef %16), !dbg !203
  ret void, !dbg !204
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_12_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_loop_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 27, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 8)
!28 = !DILocation(line: 27, column: 8, scope: !18)
!29 = !DILocation(line: 30, column: 27, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !19, line: 28, column: 5)
!31 = !DILocation(line: 30, column: 16, scope: !30)
!32 = !DILocation(line: 30, column: 14, scope: !30)
!33 = !DILocation(line: 31, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 31, column: 13)
!35 = !DILocation(line: 31, column: 18, scope: !34)
!36 = !DILocation(line: 31, column: 13, scope: !30)
!37 = !DILocation(line: 31, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 31, column: 27)
!39 = !DILocation(line: 32, column: 17, scope: !30)
!40 = !DILocation(line: 32, column: 9, scope: !30)
!41 = !DILocation(line: 33, column: 9, scope: !30)
!42 = !DILocation(line: 33, column: 20, scope: !30)
!43 = !DILocation(line: 34, column: 5, scope: !30)
!44 = !DILocation(line: 38, column: 27, scope: !45)
!45 = distinct !DILexicalBlock(scope: !27, file: !19, line: 36, column: 5)
!46 = !DILocation(line: 38, column: 16, scope: !45)
!47 = !DILocation(line: 38, column: 14, scope: !45)
!48 = !DILocation(line: 39, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !19, line: 39, column: 13)
!50 = !DILocation(line: 39, column: 18, scope: !49)
!51 = !DILocation(line: 39, column: 13, scope: !45)
!52 = !DILocation(line: 39, column: 28, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !19, line: 39, column: 27)
!54 = !DILocation(line: 40, column: 17, scope: !45)
!55 = !DILocation(line: 40, column: 9, scope: !45)
!56 = !DILocation(line: 41, column: 9, scope: !45)
!57 = !DILocation(line: 41, column: 21, scope: !45)
!58 = !DILocalVariable(name: "i", scope: !59, file: !19, line: 44, type: !60)
!59 = distinct !DILexicalBlock(scope: !18, file: !19, line: 43, column: 5)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !61, line: 31, baseType: !62)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !63)
!63 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!64 = !DILocation(line: 44, column: 16, scope: !59)
!65 = !DILocalVariable(name: "destLen", scope: !59, file: !19, line: 44, type: !60)
!66 = !DILocation(line: 44, column: 19, scope: !59)
!67 = !DILocalVariable(name: "dest", scope: !59, file: !19, line: 45, type: !68)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 100)
!71 = !DILocation(line: 45, column: 17, scope: !59)
!72 = !DILocation(line: 46, column: 17, scope: !59)
!73 = !DILocation(line: 46, column: 9, scope: !59)
!74 = !DILocation(line: 47, column: 9, scope: !59)
!75 = !DILocation(line: 47, column: 21, scope: !59)
!76 = !DILocation(line: 48, column: 26, scope: !59)
!77 = !DILocation(line: 48, column: 19, scope: !59)
!78 = !DILocation(line: 48, column: 17, scope: !59)
!79 = !DILocation(line: 51, column: 16, scope: !80)
!80 = distinct !DILexicalBlock(scope: !59, file: !19, line: 51, column: 9)
!81 = !DILocation(line: 51, column: 14, scope: !80)
!82 = !DILocation(line: 51, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !19, line: 51, column: 9)
!84 = !DILocation(line: 51, column: 25, scope: !83)
!85 = !DILocation(line: 51, column: 23, scope: !83)
!86 = !DILocation(line: 51, column: 9, scope: !80)
!87 = !DILocation(line: 53, column: 23, scope: !88)
!88 = distinct !DILexicalBlock(scope: !83, file: !19, line: 52, column: 9)
!89 = !DILocation(line: 53, column: 28, scope: !88)
!90 = !DILocation(line: 53, column: 18, scope: !88)
!91 = !DILocation(line: 53, column: 13, scope: !88)
!92 = !DILocation(line: 53, column: 21, scope: !88)
!93 = !DILocation(line: 54, column: 9, scope: !88)
!94 = !DILocation(line: 51, column: 35, scope: !83)
!95 = !DILocation(line: 51, column: 9, scope: !83)
!96 = distinct !{!96, !86, !97, !98}
!97 = !DILocation(line: 54, column: 9, scope: !80)
!98 = !{!"llvm.loop.mustprogress"}
!99 = !DILocation(line: 55, column: 9, scope: !59)
!100 = !DILocation(line: 55, column: 21, scope: !59)
!101 = !DILocation(line: 56, column: 20, scope: !59)
!102 = !DILocation(line: 56, column: 9, scope: !59)
!103 = !DILocation(line: 57, column: 14, scope: !59)
!104 = !DILocation(line: 57, column: 9, scope: !59)
!105 = !DILocation(line: 59, column: 1, scope: !18)
!106 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_12_good", scope: !19, file: !19, line: 105, type: !20, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!107 = !DILocation(line: 107, column: 5, scope: !106)
!108 = !DILocation(line: 108, column: 1, scope: !106)
!109 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 120, type: !110, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!110 = !DISubroutineType(types: !111)
!111 = !{!8, !8, !112}
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !109, file: !19, line: 120, type: !8)
!116 = !DILocation(line: 120, column: 14, scope: !109)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !109, file: !19, line: 120, type: !112)
!118 = !DILocation(line: 120, column: 27, scope: !109)
!119 = !DILocation(line: 123, column: 22, scope: !109)
!120 = !DILocation(line: 123, column: 12, scope: !109)
!121 = !DILocation(line: 123, column: 5, scope: !109)
!122 = !DILocation(line: 125, column: 5, scope: !109)
!123 = !DILocation(line: 126, column: 5, scope: !109)
!124 = !DILocation(line: 127, column: 5, scope: !109)
!125 = !DILocation(line: 130, column: 5, scope: !109)
!126 = !DILocation(line: 131, column: 5, scope: !109)
!127 = !DILocation(line: 132, column: 5, scope: !109)
!128 = !DILocation(line: 134, column: 5, scope: !109)
!129 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!130 = !DILocalVariable(name: "data", scope: !129, file: !19, line: 69, type: !3)
!131 = !DILocation(line: 69, column: 15, scope: !129)
!132 = !DILocation(line: 70, column: 10, scope: !129)
!133 = !DILocation(line: 71, column: 8, scope: !134)
!134 = distinct !DILexicalBlock(scope: !129, file: !19, line: 71, column: 8)
!135 = !DILocation(line: 71, column: 8, scope: !129)
!136 = !DILocation(line: 74, column: 27, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !19, line: 72, column: 5)
!138 = !DILocation(line: 74, column: 16, scope: !137)
!139 = !DILocation(line: 74, column: 14, scope: !137)
!140 = !DILocation(line: 75, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !19, line: 75, column: 13)
!142 = !DILocation(line: 75, column: 18, scope: !141)
!143 = !DILocation(line: 75, column: 13, scope: !137)
!144 = !DILocation(line: 75, column: 28, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !19, line: 75, column: 27)
!146 = !DILocation(line: 76, column: 17, scope: !137)
!147 = !DILocation(line: 76, column: 9, scope: !137)
!148 = !DILocation(line: 77, column: 9, scope: !137)
!149 = !DILocation(line: 77, column: 21, scope: !137)
!150 = !DILocation(line: 78, column: 5, scope: !137)
!151 = !DILocation(line: 82, column: 27, scope: !152)
!152 = distinct !DILexicalBlock(scope: !134, file: !19, line: 80, column: 5)
!153 = !DILocation(line: 82, column: 16, scope: !152)
!154 = !DILocation(line: 82, column: 14, scope: !152)
!155 = !DILocation(line: 83, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !19, line: 83, column: 13)
!157 = !DILocation(line: 83, column: 18, scope: !156)
!158 = !DILocation(line: 83, column: 13, scope: !152)
!159 = !DILocation(line: 83, column: 28, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !19, line: 83, column: 27)
!161 = !DILocation(line: 84, column: 17, scope: !152)
!162 = !DILocation(line: 84, column: 9, scope: !152)
!163 = !DILocation(line: 85, column: 9, scope: !152)
!164 = !DILocation(line: 85, column: 21, scope: !152)
!165 = !DILocalVariable(name: "i", scope: !166, file: !19, line: 88, type: !60)
!166 = distinct !DILexicalBlock(scope: !129, file: !19, line: 87, column: 5)
!167 = !DILocation(line: 88, column: 16, scope: !166)
!168 = !DILocalVariable(name: "destLen", scope: !166, file: !19, line: 88, type: !60)
!169 = !DILocation(line: 88, column: 19, scope: !166)
!170 = !DILocalVariable(name: "dest", scope: !166, file: !19, line: 89, type: !68)
!171 = !DILocation(line: 89, column: 17, scope: !166)
!172 = !DILocation(line: 90, column: 17, scope: !166)
!173 = !DILocation(line: 90, column: 9, scope: !166)
!174 = !DILocation(line: 91, column: 9, scope: !166)
!175 = !DILocation(line: 91, column: 21, scope: !166)
!176 = !DILocation(line: 92, column: 26, scope: !166)
!177 = !DILocation(line: 92, column: 19, scope: !166)
!178 = !DILocation(line: 92, column: 17, scope: !166)
!179 = !DILocation(line: 95, column: 16, scope: !180)
!180 = distinct !DILexicalBlock(scope: !166, file: !19, line: 95, column: 9)
!181 = !DILocation(line: 95, column: 14, scope: !180)
!182 = !DILocation(line: 95, column: 21, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !19, line: 95, column: 9)
!184 = !DILocation(line: 95, column: 25, scope: !183)
!185 = !DILocation(line: 95, column: 23, scope: !183)
!186 = !DILocation(line: 95, column: 9, scope: !180)
!187 = !DILocation(line: 97, column: 23, scope: !188)
!188 = distinct !DILexicalBlock(scope: !183, file: !19, line: 96, column: 9)
!189 = !DILocation(line: 97, column: 28, scope: !188)
!190 = !DILocation(line: 97, column: 18, scope: !188)
!191 = !DILocation(line: 97, column: 13, scope: !188)
!192 = !DILocation(line: 97, column: 21, scope: !188)
!193 = !DILocation(line: 98, column: 9, scope: !188)
!194 = !DILocation(line: 95, column: 35, scope: !183)
!195 = !DILocation(line: 95, column: 9, scope: !183)
!196 = distinct !{!196, !186, !197, !98}
!197 = !DILocation(line: 98, column: 9, scope: !180)
!198 = !DILocation(line: 99, column: 9, scope: !166)
!199 = !DILocation(line: 99, column: 21, scope: !166)
!200 = !DILocation(line: 100, column: 20, scope: !166)
!201 = !DILocation(line: 100, column: 9, scope: !166)
!202 = !DILocation(line: 101, column: 14, scope: !166)
!203 = !DILocation(line: 101, column: 9, scope: !166)
!204 = !DILocation(line: 103, column: 1, scope: !129)
