; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i8* %arraydecay, i8** %data, align 8, !dbg !30
  %0 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %0, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !35
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !35
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !35
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !53, metadata !DIExpression()), !dbg !54
  %6 = load i8*, i8** %data, align 8, !dbg !55
  %call1 = call i64 @strlen(i8* noundef %6), !dbg !56
  store i64 %call1, i64* %dataLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !61
  %8 = load i64, i64* %dataLen, align 8, !dbg !63
  %cmp2 = icmp ult i64 %7, %8, !dbg !64
  br i1 %cmp2, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !66
  %10 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !66
  %11 = load i8, i8* %arrayidx3, align 1, !dbg !66
  %12 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !70
  store i8 %11, i8* %arrayidx4, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %13, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !78
  store i8 0, i8* %arrayidx5, align 1, !dbg !79
  %14 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* noundef %14), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_good() #0 !dbg !83 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay, i8** %data, align 8, !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp ne i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !119
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !119
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !123, metadata !DIExpression()), !dbg !125
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !128, metadata !DIExpression()), !dbg !129
  %6 = load i8*, i8** %data, align 8, !dbg !130
  %call1 = call i64 @strlen(i8* noundef %6), !dbg !131
  store i64 %call1, i64* %dataLen, align 8, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !136
  %8 = load i64, i64* %dataLen, align 8, !dbg !138
  %cmp2 = icmp ult i64 %7, %8, !dbg !139
  br i1 %cmp2, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !141
  %10 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !141
  %11 = load i8, i8* %arrayidx3, align 1, !dbg !141
  %12 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !145
  store i8 %11, i8* %arrayidx4, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %13, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !152
  store i8 0, i8* %arrayidx5, align 1, !dbg !153
  %14 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* noundef %14), !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !162
  store i8* %arraydecay, i8** %data, align 8, !dbg !163
  %0 = load i32, i32* @staticFive, align 4, !dbg !164
  %cmp = icmp eq i32 %0, 5, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !168
  %2 = load i8*, i8** %data, align 8, !dbg !168
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !168
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !168
  %4 = load i8*, i8** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !173, metadata !DIExpression()), !dbg !175
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !178, metadata !DIExpression()), !dbg !179
  %6 = load i8*, i8** %data, align 8, !dbg !180
  %call1 = call i64 @strlen(i8* noundef %6), !dbg !181
  store i64 %call1, i64* %dataLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !186
  %8 = load i64, i64* %dataLen, align 8, !dbg !188
  %cmp2 = icmp ult i64 %7, %8, !dbg !189
  br i1 %cmp2, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !191
  %10 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !191
  %11 = load i8, i8* %arrayidx3, align 1, !dbg !191
  %12 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !195
  store i8 %11, i8* %arrayidx4, align 1, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %13, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !202
  store i8 0, i8* %arrayidx5, align 1, !dbg !203
  %14 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* noundef %14), !dbg !205
  ret void, !dbg !206
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_bad", scope: !7, file: !7, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DILocation(line: 31, column: 12, scope: !16)
!24 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !7, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 32, column: 10, scope: !16)
!29 = !DILocation(line: 33, column: 12, scope: !16)
!30 = !DILocation(line: 33, column: 10, scope: !16)
!31 = !DILocation(line: 34, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !16, file: !7, line: 34, column: 8)
!33 = !DILocation(line: 34, column: 18, scope: !32)
!34 = !DILocation(line: 34, column: 8, scope: !16)
!35 = !DILocation(line: 37, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !7, line: 35, column: 5)
!37 = !DILocation(line: 38, column: 9, scope: !36)
!38 = !DILocation(line: 38, column: 21, scope: !36)
!39 = !DILocation(line: 39, column: 5, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !7, line: 41, type: !42)
!41 = distinct !DILexicalBlock(scope: !16, file: !7, line: 40, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 41, column: 14, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !7, line: 42, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !50, line: 94, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 42, column: 16, scope: !41)
!53 = !DILocalVariable(name: "dataLen", scope: !41, file: !7, line: 42, type: !47)
!54 = !DILocation(line: 42, column: 19, scope: !41)
!55 = !DILocation(line: 43, column: 26, scope: !41)
!56 = !DILocation(line: 43, column: 19, scope: !41)
!57 = !DILocation(line: 43, column: 17, scope: !41)
!58 = !DILocation(line: 45, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !41, file: !7, line: 45, column: 9)
!60 = !DILocation(line: 45, column: 14, scope: !59)
!61 = !DILocation(line: 45, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !7, line: 45, column: 9)
!63 = !DILocation(line: 45, column: 25, scope: !62)
!64 = !DILocation(line: 45, column: 23, scope: !62)
!65 = !DILocation(line: 45, column: 9, scope: !59)
!66 = !DILocation(line: 47, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !7, line: 46, column: 9)
!68 = !DILocation(line: 47, column: 28, scope: !67)
!69 = !DILocation(line: 47, column: 18, scope: !67)
!70 = !DILocation(line: 47, column: 13, scope: !67)
!71 = !DILocation(line: 47, column: 21, scope: !67)
!72 = !DILocation(line: 48, column: 9, scope: !67)
!73 = !DILocation(line: 45, column: 35, scope: !62)
!74 = !DILocation(line: 45, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 48, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 49, column: 9, scope: !41)
!79 = !DILocation(line: 49, column: 20, scope: !41)
!80 = !DILocation(line: 50, column: 19, scope: !41)
!81 = !DILocation(line: 50, column: 9, scope: !41)
!82 = !DILocation(line: 52, column: 1, scope: !16)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_07_good", scope: !7, file: !7, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!84 = !DILocation(line: 117, column: 5, scope: !83)
!85 = !DILocation(line: 118, column: 5, scope: !83)
!86 = !DILocation(line: 119, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 131, type: !88, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!88 = !DISubroutineType(types: !89)
!89 = !{!8, !8, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !7, line: 131, type: !8)
!92 = !DILocation(line: 131, column: 14, scope: !87)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !7, line: 131, type: !90)
!94 = !DILocation(line: 131, column: 27, scope: !87)
!95 = !DILocation(line: 134, column: 22, scope: !87)
!96 = !DILocation(line: 134, column: 12, scope: !87)
!97 = !DILocation(line: 134, column: 5, scope: !87)
!98 = !DILocation(line: 136, column: 5, scope: !87)
!99 = !DILocation(line: 137, column: 5, scope: !87)
!100 = !DILocation(line: 138, column: 5, scope: !87)
!101 = !DILocation(line: 141, column: 5, scope: !87)
!102 = !DILocation(line: 142, column: 5, scope: !87)
!103 = !DILocation(line: 143, column: 5, scope: !87)
!104 = !DILocation(line: 145, column: 5, scope: !87)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!106 = !DILocalVariable(name: "data", scope: !105, file: !7, line: 61, type: !21)
!107 = !DILocation(line: 61, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBuffer", scope: !105, file: !7, line: 62, type: !25)
!109 = !DILocation(line: 62, column: 10, scope: !105)
!110 = !DILocation(line: 63, column: 12, scope: !105)
!111 = !DILocation(line: 63, column: 10, scope: !105)
!112 = !DILocation(line: 64, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !7, line: 64, column: 8)
!114 = !DILocation(line: 64, column: 18, scope: !113)
!115 = !DILocation(line: 64, column: 8, scope: !105)
!116 = !DILocation(line: 67, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !7, line: 65, column: 5)
!118 = !DILocation(line: 68, column: 5, scope: !117)
!119 = !DILocation(line: 72, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !7, line: 70, column: 5)
!121 = !DILocation(line: 73, column: 9, scope: !120)
!122 = !DILocation(line: 73, column: 20, scope: !120)
!123 = !DILocalVariable(name: "dest", scope: !124, file: !7, line: 76, type: !42)
!124 = distinct !DILexicalBlock(scope: !105, file: !7, line: 75, column: 5)
!125 = !DILocation(line: 76, column: 14, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !124, file: !7, line: 77, type: !47)
!127 = !DILocation(line: 77, column: 16, scope: !124)
!128 = !DILocalVariable(name: "dataLen", scope: !124, file: !7, line: 77, type: !47)
!129 = !DILocation(line: 77, column: 19, scope: !124)
!130 = !DILocation(line: 78, column: 26, scope: !124)
!131 = !DILocation(line: 78, column: 19, scope: !124)
!132 = !DILocation(line: 78, column: 17, scope: !124)
!133 = !DILocation(line: 80, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !124, file: !7, line: 80, column: 9)
!135 = !DILocation(line: 80, column: 14, scope: !134)
!136 = !DILocation(line: 80, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !7, line: 80, column: 9)
!138 = !DILocation(line: 80, column: 25, scope: !137)
!139 = !DILocation(line: 80, column: 23, scope: !137)
!140 = !DILocation(line: 80, column: 9, scope: !134)
!141 = !DILocation(line: 82, column: 23, scope: !142)
!142 = distinct !DILexicalBlock(scope: !137, file: !7, line: 81, column: 9)
!143 = !DILocation(line: 82, column: 28, scope: !142)
!144 = !DILocation(line: 82, column: 18, scope: !142)
!145 = !DILocation(line: 82, column: 13, scope: !142)
!146 = !DILocation(line: 82, column: 21, scope: !142)
!147 = !DILocation(line: 83, column: 9, scope: !142)
!148 = !DILocation(line: 80, column: 35, scope: !137)
!149 = !DILocation(line: 80, column: 9, scope: !137)
!150 = distinct !{!150, !140, !151, !77}
!151 = !DILocation(line: 83, column: 9, scope: !134)
!152 = !DILocation(line: 84, column: 9, scope: !124)
!153 = !DILocation(line: 84, column: 20, scope: !124)
!154 = !DILocation(line: 85, column: 19, scope: !124)
!155 = !DILocation(line: 85, column: 9, scope: !124)
!156 = !DILocation(line: 87, column: 1, scope: !105)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 90, type: !17, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!158 = !DILocalVariable(name: "data", scope: !157, file: !7, line: 92, type: !21)
!159 = !DILocation(line: 92, column: 12, scope: !157)
!160 = !DILocalVariable(name: "dataBuffer", scope: !157, file: !7, line: 93, type: !25)
!161 = !DILocation(line: 93, column: 10, scope: !157)
!162 = !DILocation(line: 94, column: 12, scope: !157)
!163 = !DILocation(line: 94, column: 10, scope: !157)
!164 = !DILocation(line: 95, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !157, file: !7, line: 95, column: 8)
!166 = !DILocation(line: 95, column: 18, scope: !165)
!167 = !DILocation(line: 95, column: 8, scope: !157)
!168 = !DILocation(line: 98, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !7, line: 96, column: 5)
!170 = !DILocation(line: 99, column: 9, scope: !169)
!171 = !DILocation(line: 99, column: 20, scope: !169)
!172 = !DILocation(line: 100, column: 5, scope: !169)
!173 = !DILocalVariable(name: "dest", scope: !174, file: !7, line: 102, type: !42)
!174 = distinct !DILexicalBlock(scope: !157, file: !7, line: 101, column: 5)
!175 = !DILocation(line: 102, column: 14, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !7, line: 103, type: !47)
!177 = !DILocation(line: 103, column: 16, scope: !174)
!178 = !DILocalVariable(name: "dataLen", scope: !174, file: !7, line: 103, type: !47)
!179 = !DILocation(line: 103, column: 19, scope: !174)
!180 = !DILocation(line: 104, column: 26, scope: !174)
!181 = !DILocation(line: 104, column: 19, scope: !174)
!182 = !DILocation(line: 104, column: 17, scope: !174)
!183 = !DILocation(line: 106, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !7, line: 106, column: 9)
!185 = !DILocation(line: 106, column: 14, scope: !184)
!186 = !DILocation(line: 106, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !7, line: 106, column: 9)
!188 = !DILocation(line: 106, column: 25, scope: !187)
!189 = !DILocation(line: 106, column: 23, scope: !187)
!190 = !DILocation(line: 106, column: 9, scope: !184)
!191 = !DILocation(line: 108, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !7, line: 107, column: 9)
!193 = !DILocation(line: 108, column: 28, scope: !192)
!194 = !DILocation(line: 108, column: 18, scope: !192)
!195 = !DILocation(line: 108, column: 13, scope: !192)
!196 = !DILocation(line: 108, column: 21, scope: !192)
!197 = !DILocation(line: 109, column: 9, scope: !192)
!198 = !DILocation(line: 106, column: 35, scope: !187)
!199 = !DILocation(line: 106, column: 9, scope: !187)
!200 = distinct !{!200, !190, !201, !77}
!201 = !DILocation(line: 109, column: 9, scope: !184)
!202 = !DILocation(line: 110, column: 9, scope: !174)
!203 = !DILocation(line: 110, column: 20, scope: !174)
!204 = !DILocation(line: 111, column: 19, scope: !174)
!205 = !DILocation(line: 111, column: 9, scope: !174)
!206 = !DILocation(line: 113, column: 1, scope: !157)
