; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_bad() #0 !dbg !13 {
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
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !25
  %tobool = icmp ne i32 %2, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %4 = load i8*, i8** %data, align 8, !dbg !28
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !28
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 99, i64 noundef %5) #5, !dbg !28
  %6 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !46, metadata !DIExpression()), !dbg !47
  %8 = load i8*, i8** %data, align 8, !dbg !48
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !49
  store i64 %call1, i64* %dataLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !54
  %10 = load i64, i64* %dataLen, align 8, !dbg !56
  %cmp = icmp ult i64 %9, %10, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !59
  %12 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !59
  %13 = load i8, i8* %arrayidx2, align 1, !dbg !59
  %14 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %14, !dbg !63
  store i8 %13, i8* %arrayidx3, align 1, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %15, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !71
  store i8 0, i8* %arrayidx4, align 1, !dbg !72
  %16 = load i8*, i8** %data, align 8, !dbg !73
  call void @printLine(i8* noundef %16), !dbg !74
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_good() #0 !dbg !76 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 100, align 16, !dbg !104
  store i8* %0, i8** %dataBuffer, align 8, !dbg !103
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !105
  store i8* %1, i8** %data, align 8, !dbg !106
  %2 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !107
  %tobool = icmp ne i32 %2, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !113
  %4 = load i8*, i8** %data, align 8, !dbg !113
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !113
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !113
  %6 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !122, metadata !DIExpression()), !dbg !123
  %8 = load i8*, i8** %data, align 8, !dbg !124
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !125
  store i64 %call1, i64* %dataLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !130
  %10 = load i64, i64* %dataLen, align 8, !dbg !132
  %cmp = icmp ult i64 %9, %10, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !135
  %12 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !135
  %13 = load i8, i8* %arrayidx2, align 1, !dbg !135
  %14 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %14, !dbg !139
  store i8 %13, i8* %arrayidx3, align 1, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %15, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !146
  store i8 0, i8* %arrayidx4, align 1, !dbg !147
  %16 = load i8*, i8** %data, align 8, !dbg !148
  call void @printLine(i8* noundef %16), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %0 = alloca i8, i64 100, align 16, !dbg !156
  store i8* %0, i8** %dataBuffer, align 8, !dbg !155
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !157
  store i8* %1, i8** %data, align 8, !dbg !158
  %2 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !159
  %tobool = icmp ne i32 %2, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %data, align 8, !dbg !162
  %4 = load i8*, i8** %data, align 8, !dbg !162
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !162
  %call = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #5, !dbg !162
  %6 = load i8*, i8** %data, align 8, !dbg !164
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !164
  store i8 0, i8* %arrayidx, align 1, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !167, metadata !DIExpression()), !dbg !169
  %7 = bitcast [50 x i8]* %dest to i8*, !dbg !169
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 50, i1 false), !dbg !169
  call void @llvm.dbg.declare(metadata i64* %i, metadata !170, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !172, metadata !DIExpression()), !dbg !173
  %8 = load i8*, i8** %data, align 8, !dbg !174
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !175
  store i64 %call1, i64* %dataLen, align 8, !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !180
  %10 = load i64, i64* %dataLen, align 8, !dbg !182
  %cmp = icmp ult i64 %9, %10, !dbg !183
  br i1 %cmp, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %11 = load i8*, i8** %data, align 8, !dbg !185
  %12 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx2 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !185
  %13 = load i8, i8* %arrayidx2, align 1, !dbg !185
  %14 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %14, !dbg !189
  store i8 %13, i8* %arrayidx3, align 1, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %15, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !196
  store i8 0, i8* %arrayidx4, align 1, !dbg !197
  %16 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* noundef %16), !dbg !199
  ret void, !dbg !200
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 33, scope: !13)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 10, scope: !13)
!25 = !DILocation(line: 28, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!27 = !DILocation(line: 28, column: 8, scope: !13)
!28 = !DILocation(line: 31, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 29, column: 5)
!30 = !DILocation(line: 32, column: 9, scope: !29)
!31 = !DILocation(line: 32, column: 21, scope: !29)
!32 = !DILocation(line: 33, column: 5, scope: !29)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 35, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 35, column: 14, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !34, file: !14, line: 36, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !43, line: 94, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 36, column: 16, scope: !34)
!46 = !DILocalVariable(name: "dataLen", scope: !34, file: !14, line: 36, type: !40)
!47 = !DILocation(line: 36, column: 19, scope: !34)
!48 = !DILocation(line: 37, column: 26, scope: !34)
!49 = !DILocation(line: 37, column: 19, scope: !34)
!50 = !DILocation(line: 37, column: 17, scope: !34)
!51 = !DILocation(line: 39, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !34, file: !14, line: 39, column: 9)
!53 = !DILocation(line: 39, column: 14, scope: !52)
!54 = !DILocation(line: 39, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !14, line: 39, column: 9)
!56 = !DILocation(line: 39, column: 25, scope: !55)
!57 = !DILocation(line: 39, column: 23, scope: !55)
!58 = !DILocation(line: 39, column: 9, scope: !52)
!59 = !DILocation(line: 41, column: 23, scope: !60)
!60 = distinct !DILexicalBlock(scope: !55, file: !14, line: 40, column: 9)
!61 = !DILocation(line: 41, column: 28, scope: !60)
!62 = !DILocation(line: 41, column: 18, scope: !60)
!63 = !DILocation(line: 41, column: 13, scope: !60)
!64 = !DILocation(line: 41, column: 21, scope: !60)
!65 = !DILocation(line: 42, column: 9, scope: !60)
!66 = !DILocation(line: 39, column: 35, scope: !55)
!67 = !DILocation(line: 39, column: 9, scope: !55)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 42, column: 9, scope: !52)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 43, column: 9, scope: !34)
!72 = !DILocation(line: 43, column: 20, scope: !34)
!73 = !DILocation(line: 44, column: 19, scope: !34)
!74 = !DILocation(line: 44, column: 9, scope: !34)
!75 = !DILocation(line: 46, column: 1, scope: !13)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_09_good", scope: !14, file: !14, line: 109, type: !15, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DILocation(line: 111, column: 5, scope: !76)
!78 = !DILocation(line: 112, column: 5, scope: !76)
!79 = !DILocation(line: 113, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 125, type: !81, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !83, !84}
!83 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !14, line: 125, type: !83)
!86 = !DILocation(line: 125, column: 14, scope: !80)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !14, line: 125, type: !84)
!88 = !DILocation(line: 125, column: 27, scope: !80)
!89 = !DILocation(line: 128, column: 22, scope: !80)
!90 = !DILocation(line: 128, column: 12, scope: !80)
!91 = !DILocation(line: 128, column: 5, scope: !80)
!92 = !DILocation(line: 130, column: 5, scope: !80)
!93 = !DILocation(line: 131, column: 5, scope: !80)
!94 = !DILocation(line: 132, column: 5, scope: !80)
!95 = !DILocation(line: 135, column: 5, scope: !80)
!96 = !DILocation(line: 136, column: 5, scope: !80)
!97 = !DILocation(line: 137, column: 5, scope: !80)
!98 = !DILocation(line: 139, column: 5, scope: !80)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 53, type: !15, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!100 = !DILocalVariable(name: "data", scope: !99, file: !14, line: 55, type: !3)
!101 = !DILocation(line: 55, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBuffer", scope: !99, file: !14, line: 56, type: !3)
!103 = !DILocation(line: 56, column: 12, scope: !99)
!104 = !DILocation(line: 56, column: 33, scope: !99)
!105 = !DILocation(line: 57, column: 12, scope: !99)
!106 = !DILocation(line: 57, column: 10, scope: !99)
!107 = !DILocation(line: 58, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !99, file: !14, line: 58, column: 8)
!109 = !DILocation(line: 58, column: 8, scope: !99)
!110 = !DILocation(line: 61, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 59, column: 5)
!112 = !DILocation(line: 62, column: 5, scope: !111)
!113 = !DILocation(line: 66, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !14, line: 64, column: 5)
!115 = !DILocation(line: 67, column: 9, scope: !114)
!116 = !DILocation(line: 67, column: 20, scope: !114)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !14, line: 70, type: !35)
!118 = distinct !DILexicalBlock(scope: !99, file: !14, line: 69, column: 5)
!119 = !DILocation(line: 70, column: 14, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !14, line: 71, type: !40)
!121 = !DILocation(line: 71, column: 16, scope: !118)
!122 = !DILocalVariable(name: "dataLen", scope: !118, file: !14, line: 71, type: !40)
!123 = !DILocation(line: 71, column: 19, scope: !118)
!124 = !DILocation(line: 72, column: 26, scope: !118)
!125 = !DILocation(line: 72, column: 19, scope: !118)
!126 = !DILocation(line: 72, column: 17, scope: !118)
!127 = !DILocation(line: 74, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !14, line: 74, column: 9)
!129 = !DILocation(line: 74, column: 14, scope: !128)
!130 = !DILocation(line: 74, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !14, line: 74, column: 9)
!132 = !DILocation(line: 74, column: 25, scope: !131)
!133 = !DILocation(line: 74, column: 23, scope: !131)
!134 = !DILocation(line: 74, column: 9, scope: !128)
!135 = !DILocation(line: 76, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !14, line: 75, column: 9)
!137 = !DILocation(line: 76, column: 28, scope: !136)
!138 = !DILocation(line: 76, column: 18, scope: !136)
!139 = !DILocation(line: 76, column: 13, scope: !136)
!140 = !DILocation(line: 76, column: 21, scope: !136)
!141 = !DILocation(line: 77, column: 9, scope: !136)
!142 = !DILocation(line: 74, column: 35, scope: !131)
!143 = !DILocation(line: 74, column: 9, scope: !131)
!144 = distinct !{!144, !134, !145, !70}
!145 = !DILocation(line: 77, column: 9, scope: !128)
!146 = !DILocation(line: 78, column: 9, scope: !118)
!147 = !DILocation(line: 78, column: 20, scope: !118)
!148 = !DILocation(line: 79, column: 19, scope: !118)
!149 = !DILocation(line: 79, column: 9, scope: !118)
!150 = !DILocation(line: 81, column: 1, scope: !99)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 84, type: !15, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!152 = !DILocalVariable(name: "data", scope: !151, file: !14, line: 86, type: !3)
!153 = !DILocation(line: 86, column: 12, scope: !151)
!154 = !DILocalVariable(name: "dataBuffer", scope: !151, file: !14, line: 87, type: !3)
!155 = !DILocation(line: 87, column: 12, scope: !151)
!156 = !DILocation(line: 87, column: 33, scope: !151)
!157 = !DILocation(line: 88, column: 12, scope: !151)
!158 = !DILocation(line: 88, column: 10, scope: !151)
!159 = !DILocation(line: 89, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !151, file: !14, line: 89, column: 8)
!161 = !DILocation(line: 89, column: 8, scope: !151)
!162 = !DILocation(line: 92, column: 9, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !14, line: 90, column: 5)
!164 = !DILocation(line: 93, column: 9, scope: !163)
!165 = !DILocation(line: 93, column: 20, scope: !163)
!166 = !DILocation(line: 94, column: 5, scope: !163)
!167 = !DILocalVariable(name: "dest", scope: !168, file: !14, line: 96, type: !35)
!168 = distinct !DILexicalBlock(scope: !151, file: !14, line: 95, column: 5)
!169 = !DILocation(line: 96, column: 14, scope: !168)
!170 = !DILocalVariable(name: "i", scope: !168, file: !14, line: 97, type: !40)
!171 = !DILocation(line: 97, column: 16, scope: !168)
!172 = !DILocalVariable(name: "dataLen", scope: !168, file: !14, line: 97, type: !40)
!173 = !DILocation(line: 97, column: 19, scope: !168)
!174 = !DILocation(line: 98, column: 26, scope: !168)
!175 = !DILocation(line: 98, column: 19, scope: !168)
!176 = !DILocation(line: 98, column: 17, scope: !168)
!177 = !DILocation(line: 100, column: 16, scope: !178)
!178 = distinct !DILexicalBlock(scope: !168, file: !14, line: 100, column: 9)
!179 = !DILocation(line: 100, column: 14, scope: !178)
!180 = !DILocation(line: 100, column: 21, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !14, line: 100, column: 9)
!182 = !DILocation(line: 100, column: 25, scope: !181)
!183 = !DILocation(line: 100, column: 23, scope: !181)
!184 = !DILocation(line: 100, column: 9, scope: !178)
!185 = !DILocation(line: 102, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !181, file: !14, line: 101, column: 9)
!187 = !DILocation(line: 102, column: 28, scope: !186)
!188 = !DILocation(line: 102, column: 18, scope: !186)
!189 = !DILocation(line: 102, column: 13, scope: !186)
!190 = !DILocation(line: 102, column: 21, scope: !186)
!191 = !DILocation(line: 103, column: 9, scope: !186)
!192 = !DILocation(line: 100, column: 35, scope: !181)
!193 = !DILocation(line: 100, column: 9, scope: !181)
!194 = distinct !{!194, !184, !195, !70}
!195 = !DILocation(line: 103, column: 9, scope: !178)
!196 = !DILocation(line: 104, column: 9, scope: !168)
!197 = !DILocation(line: 104, column: 20, scope: !168)
!198 = !DILocation(line: 105, column: 19, scope: !168)
!199 = !DILocation(line: 105, column: 9, scope: !168)
!200 = !DILocation(line: 107, column: 1, scope: !151)
