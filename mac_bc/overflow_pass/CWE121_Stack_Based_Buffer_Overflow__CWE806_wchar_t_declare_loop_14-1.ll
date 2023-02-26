; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  %0 = load i32, i32* @globalFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 99), !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !53, metadata !DIExpression()), !dbg !54
  %4 = load i32*, i32** %data, align 8, !dbg !55
  %call1 = call i64 @wcslen(i32* noundef %4), !dbg !56
  store i64 %call1, i64* %dataLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !61
  %6 = load i64, i64* %dataLen, align 8, !dbg !63
  %cmp2 = icmp ult i64 %5, %6, !dbg !64
  br i1 %cmp2, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !66
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !66
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !66
  %10 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !70
  store i32 %9, i32* %arrayidx4, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %11, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !78
  store i32 0, i32* %arrayidx5, align 4, !dbg !79
  %12 = load i32*, i32** %data, align 8, !dbg !80
  call void @printWLine(i32* noundef %12), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !93, metadata !DIExpression()), !dbg !94
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %call = call i64 @time(i64* noundef null), !dbg !97
  %conv = trunc i64 %call to i32, !dbg !98
  call void @srand(i32 noundef %conv), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_good(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_bad(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !105
  ret i32 0, !dbg !106
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !107 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !112
  store i32* %arraydecay, i32** %data, align 8, !dbg !113
  %0 = load i32, i32* @globalFive, align 4, !dbg !114
  %cmp = icmp ne i32 %0, 5, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !123
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !131, metadata !DIExpression()), !dbg !132
  %4 = load i32*, i32** %data, align 8, !dbg !133
  %call1 = call i64 @wcslen(i32* noundef %4), !dbg !134
  store i64 %call1, i64* %dataLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !139
  %6 = load i64, i64* %dataLen, align 8, !dbg !141
  %cmp2 = icmp ult i64 %5, %6, !dbg !142
  br i1 %cmp2, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !144
  %8 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !144
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !144
  %10 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !148
  store i32 %9, i32* %arrayidx4, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %11, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !155
  store i32 0, i32* %arrayidx5, align 4, !dbg !156
  %12 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* noundef %12), !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !160 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !165
  store i32* %arraydecay, i32** %data, align 8, !dbg !166
  %0 = load i32, i32* @globalFive, align 4, !dbg !167
  %cmp = icmp eq i32 %0, 5, !dbg !169
  br i1 %cmp, label %if.then, label %if.end, !dbg !170

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !171
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !173
  %2 = load i32*, i32** %data, align 8, !dbg !174
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !174
  store i32 0, i32* %arrayidx, align 4, !dbg !175
  br label %if.end, !dbg !176

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !177, metadata !DIExpression()), !dbg !179
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !179
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !182, metadata !DIExpression()), !dbg !183
  %4 = load i32*, i32** %data, align 8, !dbg !184
  %call1 = call i64 @wcslen(i32* noundef %4), !dbg !185
  store i64 %call1, i64* %dataLen, align 8, !dbg !186
  store i64 0, i64* %i, align 8, !dbg !187
  br label %for.cond, !dbg !189

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !190
  %6 = load i64, i64* %dataLen, align 8, !dbg !192
  %cmp2 = icmp ult i64 %5, %6, !dbg !193
  br i1 %cmp2, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !195
  %8 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !195
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !195
  %10 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !199
  store i32 %9, i32* %arrayidx4, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %11, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !206
  store i32 0, i32* %arrayidx5, align 4, !dbg !207
  %12 = load i32*, i32** %data, align 8, !dbg !208
  call void @printWLine(i32* noundef %12), !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocation(line: 27, column: 12, scope: !11)
!30 = !DILocation(line: 27, column: 10, scope: !11)
!31 = !DILocation(line: 28, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!33 = !DILocation(line: 28, column: 18, scope: !32)
!34 = !DILocation(line: 28, column: 8, scope: !11)
!35 = !DILocation(line: 31, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 29, column: 5)
!37 = !DILocation(line: 31, column: 9, scope: !36)
!38 = !DILocation(line: 32, column: 9, scope: !36)
!39 = !DILocation(line: 32, column: 21, scope: !36)
!40 = !DILocation(line: 33, column: 5, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 35, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 36, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !51)
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 36, column: 16, scope: !42)
!53 = !DILocalVariable(name: "dataLen", scope: !42, file: !12, line: 36, type: !48)
!54 = !DILocation(line: 36, column: 19, scope: !42)
!55 = !DILocation(line: 37, column: 26, scope: !42)
!56 = !DILocation(line: 37, column: 19, scope: !42)
!57 = !DILocation(line: 37, column: 17, scope: !42)
!58 = !DILocation(line: 39, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !42, file: !12, line: 39, column: 9)
!60 = !DILocation(line: 39, column: 14, scope: !59)
!61 = !DILocation(line: 39, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 39, column: 9)
!63 = !DILocation(line: 39, column: 25, scope: !62)
!64 = !DILocation(line: 39, column: 23, scope: !62)
!65 = !DILocation(line: 39, column: 9, scope: !59)
!66 = !DILocation(line: 41, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !12, line: 40, column: 9)
!68 = !DILocation(line: 41, column: 28, scope: !67)
!69 = !DILocation(line: 41, column: 18, scope: !67)
!70 = !DILocation(line: 41, column: 13, scope: !67)
!71 = !DILocation(line: 41, column: 21, scope: !67)
!72 = !DILocation(line: 42, column: 9, scope: !67)
!73 = !DILocation(line: 39, column: 35, scope: !62)
!74 = !DILocation(line: 39, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 42, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 43, column: 9, scope: !42)
!79 = !DILocation(line: 43, column: 20, scope: !42)
!80 = !DILocation(line: 44, column: 20, scope: !42)
!81 = !DILocation(line: 44, column: 9, scope: !42)
!82 = !DILocation(line: 46, column: 1, scope: !11)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_14_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DILocation(line: 111, column: 5, scope: !83)
!85 = !DILocation(line: 112, column: 5, scope: !83)
!86 = !DILocation(line: 113, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !88, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DISubroutineType(types: !89)
!89 = !{!22, !22, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!93 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !12, line: 125, type: !22)
!94 = !DILocation(line: 125, column: 14, scope: !87)
!95 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !12, line: 125, type: !90)
!96 = !DILocation(line: 125, column: 27, scope: !87)
!97 = !DILocation(line: 128, column: 22, scope: !87)
!98 = !DILocation(line: 128, column: 12, scope: !87)
!99 = !DILocation(line: 128, column: 5, scope: !87)
!100 = !DILocation(line: 130, column: 5, scope: !87)
!101 = !DILocation(line: 131, column: 5, scope: !87)
!102 = !DILocation(line: 132, column: 5, scope: !87)
!103 = !DILocation(line: 135, column: 5, scope: !87)
!104 = !DILocation(line: 136, column: 5, scope: !87)
!105 = !DILocation(line: 137, column: 5, scope: !87)
!106 = !DILocation(line: 139, column: 5, scope: !87)
!107 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 55, type: !17)
!109 = !DILocation(line: 55, column: 15, scope: !107)
!110 = !DILocalVariable(name: "dataBuffer", scope: !107, file: !12, line: 56, type: !25)
!111 = !DILocation(line: 56, column: 13, scope: !107)
!112 = !DILocation(line: 57, column: 12, scope: !107)
!113 = !DILocation(line: 57, column: 10, scope: !107)
!114 = !DILocation(line: 58, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !12, line: 58, column: 8)
!116 = !DILocation(line: 58, column: 18, scope: !115)
!117 = !DILocation(line: 58, column: 8, scope: !107)
!118 = !DILocation(line: 61, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 59, column: 5)
!120 = !DILocation(line: 62, column: 5, scope: !119)
!121 = !DILocation(line: 66, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !12, line: 64, column: 5)
!123 = !DILocation(line: 66, column: 9, scope: !122)
!124 = !DILocation(line: 67, column: 9, scope: !122)
!125 = !DILocation(line: 67, column: 20, scope: !122)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !12, line: 70, type: !43)
!127 = distinct !DILexicalBlock(scope: !107, file: !12, line: 69, column: 5)
!128 = !DILocation(line: 70, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !12, line: 71, type: !48)
!130 = !DILocation(line: 71, column: 16, scope: !127)
!131 = !DILocalVariable(name: "dataLen", scope: !127, file: !12, line: 71, type: !48)
!132 = !DILocation(line: 71, column: 19, scope: !127)
!133 = !DILocation(line: 72, column: 26, scope: !127)
!134 = !DILocation(line: 72, column: 19, scope: !127)
!135 = !DILocation(line: 72, column: 17, scope: !127)
!136 = !DILocation(line: 74, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !12, line: 74, column: 9)
!138 = !DILocation(line: 74, column: 14, scope: !137)
!139 = !DILocation(line: 74, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 74, column: 9)
!141 = !DILocation(line: 74, column: 25, scope: !140)
!142 = !DILocation(line: 74, column: 23, scope: !140)
!143 = !DILocation(line: 74, column: 9, scope: !137)
!144 = !DILocation(line: 76, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !12, line: 75, column: 9)
!146 = !DILocation(line: 76, column: 28, scope: !145)
!147 = !DILocation(line: 76, column: 18, scope: !145)
!148 = !DILocation(line: 76, column: 13, scope: !145)
!149 = !DILocation(line: 76, column: 21, scope: !145)
!150 = !DILocation(line: 77, column: 9, scope: !145)
!151 = !DILocation(line: 74, column: 35, scope: !140)
!152 = !DILocation(line: 74, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !77}
!154 = !DILocation(line: 77, column: 9, scope: !137)
!155 = !DILocation(line: 78, column: 9, scope: !127)
!156 = !DILocation(line: 78, column: 20, scope: !127)
!157 = !DILocation(line: 79, column: 20, scope: !127)
!158 = !DILocation(line: 79, column: 9, scope: !127)
!159 = !DILocation(line: 81, column: 1, scope: !107)
!160 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!161 = !DILocalVariable(name: "data", scope: !160, file: !12, line: 86, type: !17)
!162 = !DILocation(line: 86, column: 15, scope: !160)
!163 = !DILocalVariable(name: "dataBuffer", scope: !160, file: !12, line: 87, type: !25)
!164 = !DILocation(line: 87, column: 13, scope: !160)
!165 = !DILocation(line: 88, column: 12, scope: !160)
!166 = !DILocation(line: 88, column: 10, scope: !160)
!167 = !DILocation(line: 89, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !160, file: !12, line: 89, column: 8)
!169 = !DILocation(line: 89, column: 18, scope: !168)
!170 = !DILocation(line: 89, column: 8, scope: !160)
!171 = !DILocation(line: 92, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !12, line: 90, column: 5)
!173 = !DILocation(line: 92, column: 9, scope: !172)
!174 = !DILocation(line: 93, column: 9, scope: !172)
!175 = !DILocation(line: 93, column: 20, scope: !172)
!176 = !DILocation(line: 94, column: 5, scope: !172)
!177 = !DILocalVariable(name: "dest", scope: !178, file: !12, line: 96, type: !43)
!178 = distinct !DILexicalBlock(scope: !160, file: !12, line: 95, column: 5)
!179 = !DILocation(line: 96, column: 17, scope: !178)
!180 = !DILocalVariable(name: "i", scope: !178, file: !12, line: 97, type: !48)
!181 = !DILocation(line: 97, column: 16, scope: !178)
!182 = !DILocalVariable(name: "dataLen", scope: !178, file: !12, line: 97, type: !48)
!183 = !DILocation(line: 97, column: 19, scope: !178)
!184 = !DILocation(line: 98, column: 26, scope: !178)
!185 = !DILocation(line: 98, column: 19, scope: !178)
!186 = !DILocation(line: 98, column: 17, scope: !178)
!187 = !DILocation(line: 100, column: 16, scope: !188)
!188 = distinct !DILexicalBlock(scope: !178, file: !12, line: 100, column: 9)
!189 = !DILocation(line: 100, column: 14, scope: !188)
!190 = !DILocation(line: 100, column: 21, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !12, line: 100, column: 9)
!192 = !DILocation(line: 100, column: 25, scope: !191)
!193 = !DILocation(line: 100, column: 23, scope: !191)
!194 = !DILocation(line: 100, column: 9, scope: !188)
!195 = !DILocation(line: 102, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !191, file: !12, line: 101, column: 9)
!197 = !DILocation(line: 102, column: 28, scope: !196)
!198 = !DILocation(line: 102, column: 18, scope: !196)
!199 = !DILocation(line: 102, column: 13, scope: !196)
!200 = !DILocation(line: 102, column: 21, scope: !196)
!201 = !DILocation(line: 103, column: 9, scope: !196)
!202 = !DILocation(line: 100, column: 35, scope: !191)
!203 = !DILocation(line: 100, column: 9, scope: !191)
!204 = distinct !{!204, !194, !205, !77}
!205 = !DILocation(line: 103, column: 9, scope: !188)
!206 = !DILocation(line: 104, column: 9, scope: !178)
!207 = !DILocation(line: 104, column: 20, scope: !178)
!208 = !DILocation(line: 105, column: 20, scope: !178)
!209 = !DILocation(line: 105, column: 9, scope: !178)
!210 = !DILocation(line: 107, column: 1, scope: !160)
