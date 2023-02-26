; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 100, align 16, !dbg !22
  store i8* %0, i8** %dataBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !28
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !28
  %5 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !46, metadata !DIExpression()), !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !49
  store i64 %call2, i64* %dataLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !54
  %9 = load i64, i64* %dataLen, align 8, !dbg !56
  %cmp = icmp ult i64 %8, %9, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !59
  %11 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !59
  %12 = load i8, i8* %arrayidx3, align 1, !dbg !59
  %13 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !63
  store i8 %12, i8* %arrayidx4, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %14, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !71
  store i8 0, i8* %arrayidx5, align 1, !dbg !72
  %15 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* noundef %15), !dbg !74
  ret void, !dbg !75
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* noundef null), !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 noundef %conv), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !99 {
entry:
  ret i32 1, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 100, align 16, !dbg !108
  store i8* %0, i8** %dataBuffer, align 8, !dbg !107
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !109
  store i8* %1, i8** %data, align 8, !dbg !110
  %call = call i32 @staticReturnsFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !117
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !117
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !117
  %5 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !126, metadata !DIExpression()), !dbg !127
  %7 = load i8*, i8** %data, align 8, !dbg !128
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !129
  store i64 %call2, i64* %dataLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !134
  %9 = load i64, i64* %dataLen, align 8, !dbg !136
  %cmp = icmp ult i64 %8, %9, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !139
  %11 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !139
  %12 = load i8, i8* %arrayidx3, align 1, !dbg !139
  %13 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !143
  store i8 %12, i8* %arrayidx4, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %14, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !150
  store i8 0, i8* %arrayidx5, align 1, !dbg !151
  %15 = load i8*, i8** %data, align 8, !dbg !152
  call void @printLine(i8* noundef %15), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !155 {
entry:
  ret i32 0, !dbg !156
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = alloca i8, i64 100, align 16, !dbg !162
  store i8* %0, i8** %dataBuffer, align 8, !dbg !161
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !163
  store i8* %1, i8** %data, align 8, !dbg !164
  %call = call i32 @staticReturnsTrue(), !dbg !165
  %tobool = icmp ne i32 %call, 0, !dbg !165
  br i1 %tobool, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !168
  %3 = load i8*, i8** %data, align 8, !dbg !168
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !168
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !168
  %5 = load i8*, i8** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !170
  store i8 0, i8* %arrayidx, align 1, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !173, metadata !DIExpression()), !dbg !175
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %i, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !178, metadata !DIExpression()), !dbg !179
  %7 = load i8*, i8** %data, align 8, !dbg !180
  %call2 = call i64 @strlen(i8* noundef %7), !dbg !181
  store i64 %call2, i64* %dataLen, align 8, !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %8 = load i64, i64* %i, align 8, !dbg !186
  %9 = load i64, i64* %dataLen, align 8, !dbg !188
  %cmp = icmp ult i64 %8, %9, !dbg !189
  br i1 %cmp, label %for.body, label %for.end, !dbg !190

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !191
  %11 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx3 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !191
  %12 = load i8, i8* %arrayidx3, align 1, !dbg !191
  %13 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !195
  store i8 %12, i8* %arrayidx4, align 1, !dbg !196
  br label %for.inc, !dbg !197

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !198
  %inc = add i64 %14, 1, !dbg !198
  store i64 %inc, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !199, !llvm.loop !200

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !202
  store i8 0, i8* %arrayidx5, align 1, !dbg !203
  %15 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* noundef %15), !dbg !205
  ret void, !dbg !206
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !3)
!19 = !DILocation(line: 39, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !3)
!21 = !DILocation(line: 40, column: 12, scope: !13)
!22 = !DILocation(line: 40, column: 33, scope: !13)
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocation(line: 41, column: 10, scope: !13)
!25 = !DILocation(line: 42, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 8)
!27 = !DILocation(line: 42, column: 8, scope: !13)
!28 = !DILocation(line: 45, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 43, column: 5)
!30 = !DILocation(line: 46, column: 9, scope: !29)
!31 = !DILocation(line: 46, column: 21, scope: !29)
!32 = !DILocation(line: 47, column: 5, scope: !29)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !14, line: 50, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !43, line: 94, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 50, column: 16, scope: !34)
!46 = !DILocalVariable(name: "dataLen", scope: !34, file: !14, line: 50, type: !40)
!47 = !DILocation(line: 50, column: 19, scope: !34)
!48 = !DILocation(line: 51, column: 26, scope: !34)
!49 = !DILocation(line: 51, column: 19, scope: !34)
!50 = !DILocation(line: 51, column: 17, scope: !34)
!51 = !DILocation(line: 53, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !34, file: !14, line: 53, column: 9)
!53 = !DILocation(line: 53, column: 14, scope: !52)
!54 = !DILocation(line: 53, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !14, line: 53, column: 9)
!56 = !DILocation(line: 53, column: 25, scope: !55)
!57 = !DILocation(line: 53, column: 23, scope: !55)
!58 = !DILocation(line: 53, column: 9, scope: !52)
!59 = !DILocation(line: 55, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !14, line: 54, column: 9)
!61 = !DILocation(line: 55, column: 28, scope: !60)
!62 = !DILocation(line: 55, column: 18, scope: !60)
!63 = !DILocation(line: 55, column: 13, scope: !60)
!64 = !DILocation(line: 55, column: 21, scope: !60)
!65 = !DILocation(line: 56, column: 9, scope: !60)
!66 = !DILocation(line: 53, column: 35, scope: !55)
!67 = !DILocation(line: 53, column: 9, scope: !55)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 56, column: 9, scope: !52)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 57, column: 9, scope: !34)
!72 = !DILocation(line: 57, column: 20, scope: !34)
!73 = !DILocation(line: 58, column: 19, scope: !34)
!74 = !DILocation(line: 58, column: 9, scope: !34)
!75 = !DILocation(line: 60, column: 1, scope: !13)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_08_good", scope: !14, file: !14, line: 123, type: !15, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DILocation(line: 125, column: 5, scope: !76)
!78 = !DILocation(line: 126, column: 5, scope: !76)
!79 = !DILocation(line: 127, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 139, type: !81, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !14, line: 139, type: !83)
!86 = !DILocation(line: 139, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !14, line: 139, type: !84)
!88 = !DILocation(line: 139, column: 27, scope: !80)
!89 = !DILocation(line: 142, column: 22, scope: !80)
!90 = !DILocation(line: 142, column: 12, scope: !80)
!91 = !DILocation(line: 142, column: 5, scope: !80)
!92 = !DILocation(line: 144, column: 5, scope: !80)
!93 = !DILocation(line: 145, column: 5, scope: !80)
!94 = !DILocation(line: 146, column: 5, scope: !80)
!95 = !DILocation(line: 149, column: 5, scope: !80)
!96 = !DILocation(line: 150, column: 5, scope: !80)
!97 = !DILocation(line: 151, column: 5, scope: !80)
!98 = !DILocation(line: 153, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !100, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!100 = !DISubroutineType(types: !101)
!101 = !{!83}
!102 = !DILocation(line: 27, column: 5, scope: !99)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!104 = !DILocalVariable(name: "data", scope: !103, file: !14, line: 69, type: !3)
!105 = !DILocation(line: 69, column: 12, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !14, line: 70, type: !3)
!107 = !DILocation(line: 70, column: 12, scope: !103)
!108 = !DILocation(line: 70, column: 33, scope: !103)
!109 = !DILocation(line: 71, column: 12, scope: !103)
!110 = !DILocation(line: 71, column: 10, scope: !103)
!111 = !DILocation(line: 72, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !103, file: !14, line: 72, column: 8)
!113 = !DILocation(line: 72, column: 8, scope: !103)
!114 = !DILocation(line: 75, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !14, line: 73, column: 5)
!116 = !DILocation(line: 76, column: 5, scope: !115)
!117 = !DILocation(line: 80, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !14, line: 78, column: 5)
!119 = !DILocation(line: 81, column: 9, scope: !118)
!120 = !DILocation(line: 81, column: 20, scope: !118)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !14, line: 84, type: !35)
!122 = distinct !DILexicalBlock(scope: !103, file: !14, line: 83, column: 5)
!123 = !DILocation(line: 84, column: 14, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !14, line: 85, type: !40)
!125 = !DILocation(line: 85, column: 16, scope: !122)
!126 = !DILocalVariable(name: "dataLen", scope: !122, file: !14, line: 85, type: !40)
!127 = !DILocation(line: 85, column: 19, scope: !122)
!128 = !DILocation(line: 86, column: 26, scope: !122)
!129 = !DILocation(line: 86, column: 19, scope: !122)
!130 = !DILocation(line: 86, column: 17, scope: !122)
!131 = !DILocation(line: 88, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !14, line: 88, column: 9)
!133 = !DILocation(line: 88, column: 14, scope: !132)
!134 = !DILocation(line: 88, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !14, line: 88, column: 9)
!136 = !DILocation(line: 88, column: 25, scope: !135)
!137 = !DILocation(line: 88, column: 23, scope: !135)
!138 = !DILocation(line: 88, column: 9, scope: !132)
!139 = !DILocation(line: 90, column: 23, scope: !140)
!140 = distinct !DILexicalBlock(scope: !135, file: !14, line: 89, column: 9)
!141 = !DILocation(line: 90, column: 28, scope: !140)
!142 = !DILocation(line: 90, column: 18, scope: !140)
!143 = !DILocation(line: 90, column: 13, scope: !140)
!144 = !DILocation(line: 90, column: 21, scope: !140)
!145 = !DILocation(line: 91, column: 9, scope: !140)
!146 = !DILocation(line: 88, column: 35, scope: !135)
!147 = !DILocation(line: 88, column: 9, scope: !135)
!148 = distinct !{!148, !138, !149, !70}
!149 = !DILocation(line: 91, column: 9, scope: !132)
!150 = !DILocation(line: 92, column: 9, scope: !122)
!151 = !DILocation(line: 92, column: 20, scope: !122)
!152 = !DILocation(line: 93, column: 19, scope: !122)
!153 = !DILocation(line: 93, column: 9, scope: !122)
!154 = !DILocation(line: 95, column: 1, scope: !103)
!155 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !100, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!156 = !DILocation(line: 32, column: 5, scope: !155)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!158 = !DILocalVariable(name: "data", scope: !157, file: !14, line: 100, type: !3)
!159 = !DILocation(line: 100, column: 12, scope: !157)
!160 = !DILocalVariable(name: "dataBuffer", scope: !157, file: !14, line: 101, type: !3)
!161 = !DILocation(line: 101, column: 12, scope: !157)
!162 = !DILocation(line: 101, column: 33, scope: !157)
!163 = !DILocation(line: 102, column: 12, scope: !157)
!164 = !DILocation(line: 102, column: 10, scope: !157)
!165 = !DILocation(line: 103, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !157, file: !14, line: 103, column: 8)
!167 = !DILocation(line: 103, column: 8, scope: !157)
!168 = !DILocation(line: 106, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !14, line: 104, column: 5)
!170 = !DILocation(line: 107, column: 9, scope: !169)
!171 = !DILocation(line: 107, column: 20, scope: !169)
!172 = !DILocation(line: 108, column: 5, scope: !169)
!173 = !DILocalVariable(name: "dest", scope: !174, file: !14, line: 110, type: !35)
!174 = distinct !DILexicalBlock(scope: !157, file: !14, line: 109, column: 5)
!175 = !DILocation(line: 110, column: 14, scope: !174)
!176 = !DILocalVariable(name: "i", scope: !174, file: !14, line: 111, type: !40)
!177 = !DILocation(line: 111, column: 16, scope: !174)
!178 = !DILocalVariable(name: "dataLen", scope: !174, file: !14, line: 111, type: !40)
!179 = !DILocation(line: 111, column: 19, scope: !174)
!180 = !DILocation(line: 112, column: 26, scope: !174)
!181 = !DILocation(line: 112, column: 19, scope: !174)
!182 = !DILocation(line: 112, column: 17, scope: !174)
!183 = !DILocation(line: 114, column: 16, scope: !184)
!184 = distinct !DILexicalBlock(scope: !174, file: !14, line: 114, column: 9)
!185 = !DILocation(line: 114, column: 14, scope: !184)
!186 = !DILocation(line: 114, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !14, line: 114, column: 9)
!188 = !DILocation(line: 114, column: 25, scope: !187)
!189 = !DILocation(line: 114, column: 23, scope: !187)
!190 = !DILocation(line: 114, column: 9, scope: !184)
!191 = !DILocation(line: 116, column: 23, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !14, line: 115, column: 9)
!193 = !DILocation(line: 116, column: 28, scope: !192)
!194 = !DILocation(line: 116, column: 18, scope: !192)
!195 = !DILocation(line: 116, column: 13, scope: !192)
!196 = !DILocation(line: 116, column: 21, scope: !192)
!197 = !DILocation(line: 117, column: 9, scope: !192)
!198 = !DILocation(line: 114, column: 35, scope: !187)
!199 = !DILocation(line: 114, column: 9, scope: !187)
!200 = distinct !{!200, !190, !201, !70}
!201 = !DILocation(line: 117, column: 9, scope: !184)
!202 = !DILocation(line: 118, column: 9, scope: !174)
!203 = !DILocation(line: 118, column: 20, scope: !174)
!204 = !DILocation(line: 119, column: 19, scope: !174)
!205 = !DILocation(line: 119, column: 9, scope: !174)
!206 = !DILocation(line: 121, column: 1, scope: !157)
