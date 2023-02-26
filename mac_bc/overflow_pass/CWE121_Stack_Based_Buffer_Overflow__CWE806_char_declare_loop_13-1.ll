; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !31
  %2 = load i8*, i8** %data, align 8, !dbg !31
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !31
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #5, !dbg !31
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !49, metadata !DIExpression()), !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !51
  %call1 = call i64 @strlen(i8* noundef %6), !dbg !52
  store i64 %call1, i64* %dataLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !57
  %8 = load i64, i64* %dataLen, align 8, !dbg !59
  %cmp2 = icmp ult i64 %7, %8, !dbg !60
  br i1 %cmp2, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !62
  %11 = load i8, i8* %arrayidx3, align 1, !dbg !62
  %12 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !66
  store i8 %11, i8* %arrayidx4, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %13, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !74
  store i8 0, i8* %arrayidx5, align 1, !dbg !75
  %14 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* noundef %14), !dbg !77
  ret void, !dbg !78
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13_good() #0 !dbg !79 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* noundef null), !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 noundef %conv), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13_good(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13_bad(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i8* %arraydecay, i8** %data, align 8, !dbg !108
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !109
  %cmp = icmp ne i32 %0, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !116
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !116
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !125, metadata !DIExpression()), !dbg !126
  %6 = load i8*, i8** %data, align 8, !dbg !127
  %call1 = call i64 @strlen(i8* noundef %6), !dbg !128
  store i64 %call1, i64* %dataLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !133
  %8 = load i64, i64* %dataLen, align 8, !dbg !135
  %cmp2 = icmp ult i64 %7, %8, !dbg !136
  br i1 %cmp2, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !138
  %10 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !138
  %11 = load i8, i8* %arrayidx3, align 1, !dbg !138
  %12 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !142
  store i8 %11, i8* %arrayidx4, align 1, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %13, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !149
  store i8 0, i8* %arrayidx5, align 1, !dbg !150
  %14 = load i8*, i8** %data, align 8, !dbg !151
  call void @printLine(i8* noundef %14), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !159
  store i8* %arraydecay, i8** %data, align 8, !dbg !160
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !161
  %cmp = icmp eq i32 %0, 5, !dbg !163
  br i1 %cmp, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !165
  %2 = load i8*, i8** %data, align 8, !dbg !165
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !165
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #5, !dbg !165
  %4 = load i8*, i8** %data, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !170, metadata !DIExpression()), !dbg !172
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !175, metadata !DIExpression()), !dbg !176
  %6 = load i8*, i8** %data, align 8, !dbg !177
  %call1 = call i64 @strlen(i8* noundef %6), !dbg !178
  store i64 %call1, i64* %dataLen, align 8, !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !183
  %8 = load i64, i64* %dataLen, align 8, !dbg !185
  %cmp2 = icmp ult i64 %7, %8, !dbg !186
  br i1 %cmp2, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !188
  %10 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !188
  %11 = load i8, i8* %arrayidx3, align 1, !dbg !188
  %12 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %12, !dbg !192
  store i8 %11, i8* %arrayidx4, align 1, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !195
  %inc = add i64 %13, 1, !dbg !195
  store i64 %inc, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !199
  store i8 0, i8* %arrayidx5, align 1, !dbg !200
  %14 = load i8*, i8** %data, align 8, !dbg !201
  call void @printLine(i8* noundef %14), !dbg !202
  ret void, !dbg !203
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocation(line: 27, column: 12, scope: !11)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 28, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!29 = !DILocation(line: 28, column: 25, scope: !28)
!30 = !DILocation(line: 28, column: 8, scope: !11)
!31 = !DILocation(line: 31, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 29, column: 5)
!33 = !DILocation(line: 32, column: 9, scope: !32)
!34 = !DILocation(line: 32, column: 21, scope: !32)
!35 = !DILocation(line: 33, column: 5, scope: !32)
!36 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 35, column: 14, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 36, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !46, line: 94, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 36, column: 16, scope: !37)
!49 = !DILocalVariable(name: "dataLen", scope: !37, file: !12, line: 36, type: !43)
!50 = !DILocation(line: 36, column: 19, scope: !37)
!51 = !DILocation(line: 37, column: 26, scope: !37)
!52 = !DILocation(line: 37, column: 19, scope: !37)
!53 = !DILocation(line: 37, column: 17, scope: !37)
!54 = !DILocation(line: 39, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !37, file: !12, line: 39, column: 9)
!56 = !DILocation(line: 39, column: 14, scope: !55)
!57 = !DILocation(line: 39, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 39, column: 9)
!59 = !DILocation(line: 39, column: 25, scope: !58)
!60 = !DILocation(line: 39, column: 23, scope: !58)
!61 = !DILocation(line: 39, column: 9, scope: !55)
!62 = !DILocation(line: 41, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !12, line: 40, column: 9)
!64 = !DILocation(line: 41, column: 28, scope: !63)
!65 = !DILocation(line: 41, column: 18, scope: !63)
!66 = !DILocation(line: 41, column: 13, scope: !63)
!67 = !DILocation(line: 41, column: 21, scope: !63)
!68 = !DILocation(line: 42, column: 9, scope: !63)
!69 = !DILocation(line: 39, column: 35, scope: !58)
!70 = !DILocation(line: 39, column: 9, scope: !58)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 42, column: 9, scope: !55)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 43, column: 9, scope: !37)
!75 = !DILocation(line: 43, column: 20, scope: !37)
!76 = !DILocation(line: 44, column: 19, scope: !37)
!77 = !DILocation(line: 44, column: 9, scope: !37)
!78 = !DILocation(line: 46, column: 1, scope: !11)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_13_good", scope: !12, file: !12, line: 109, type: !13, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DILocation(line: 111, column: 5, scope: !79)
!81 = !DILocation(line: 112, column: 5, scope: !79)
!82 = !DILocation(line: 113, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 125, type: !84, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DISubroutineType(types: !85)
!85 = !{!86, !86, !87}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 125, type: !86)
!89 = !DILocation(line: 125, column: 14, scope: !83)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 125, type: !87)
!91 = !DILocation(line: 125, column: 27, scope: !83)
!92 = !DILocation(line: 128, column: 22, scope: !83)
!93 = !DILocation(line: 128, column: 12, scope: !83)
!94 = !DILocation(line: 128, column: 5, scope: !83)
!95 = !DILocation(line: 130, column: 5, scope: !83)
!96 = !DILocation(line: 131, column: 5, scope: !83)
!97 = !DILocation(line: 132, column: 5, scope: !83)
!98 = !DILocation(line: 135, column: 5, scope: !83)
!99 = !DILocation(line: 136, column: 5, scope: !83)
!100 = !DILocation(line: 137, column: 5, scope: !83)
!101 = !DILocation(line: 139, column: 5, scope: !83)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 53, type: !13, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!103 = !DILocalVariable(name: "data", scope: !102, file: !12, line: 55, type: !17)
!104 = !DILocation(line: 55, column: 12, scope: !102)
!105 = !DILocalVariable(name: "dataBuffer", scope: !102, file: !12, line: 56, type: !21)
!106 = !DILocation(line: 56, column: 10, scope: !102)
!107 = !DILocation(line: 57, column: 12, scope: !102)
!108 = !DILocation(line: 57, column: 10, scope: !102)
!109 = !DILocation(line: 58, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !12, line: 58, column: 8)
!111 = !DILocation(line: 58, column: 25, scope: !110)
!112 = !DILocation(line: 58, column: 8, scope: !102)
!113 = !DILocation(line: 61, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !12, line: 59, column: 5)
!115 = !DILocation(line: 62, column: 5, scope: !114)
!116 = !DILocation(line: 66, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !12, line: 64, column: 5)
!118 = !DILocation(line: 67, column: 9, scope: !117)
!119 = !DILocation(line: 67, column: 20, scope: !117)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !12, line: 70, type: !38)
!121 = distinct !DILexicalBlock(scope: !102, file: !12, line: 69, column: 5)
!122 = !DILocation(line: 70, column: 14, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !12, line: 71, type: !43)
!124 = !DILocation(line: 71, column: 16, scope: !121)
!125 = !DILocalVariable(name: "dataLen", scope: !121, file: !12, line: 71, type: !43)
!126 = !DILocation(line: 71, column: 19, scope: !121)
!127 = !DILocation(line: 72, column: 26, scope: !121)
!128 = !DILocation(line: 72, column: 19, scope: !121)
!129 = !DILocation(line: 72, column: 17, scope: !121)
!130 = !DILocation(line: 74, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !12, line: 74, column: 9)
!132 = !DILocation(line: 74, column: 14, scope: !131)
!133 = !DILocation(line: 74, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 74, column: 9)
!135 = !DILocation(line: 74, column: 25, scope: !134)
!136 = !DILocation(line: 74, column: 23, scope: !134)
!137 = !DILocation(line: 74, column: 9, scope: !131)
!138 = !DILocation(line: 76, column: 23, scope: !139)
!139 = distinct !DILexicalBlock(scope: !134, file: !12, line: 75, column: 9)
!140 = !DILocation(line: 76, column: 28, scope: !139)
!141 = !DILocation(line: 76, column: 18, scope: !139)
!142 = !DILocation(line: 76, column: 13, scope: !139)
!143 = !DILocation(line: 76, column: 21, scope: !139)
!144 = !DILocation(line: 77, column: 9, scope: !139)
!145 = !DILocation(line: 74, column: 35, scope: !134)
!146 = !DILocation(line: 74, column: 9, scope: !134)
!147 = distinct !{!147, !137, !148, !73}
!148 = !DILocation(line: 77, column: 9, scope: !131)
!149 = !DILocation(line: 78, column: 9, scope: !121)
!150 = !DILocation(line: 78, column: 20, scope: !121)
!151 = !DILocation(line: 79, column: 19, scope: !121)
!152 = !DILocation(line: 79, column: 9, scope: !121)
!153 = !DILocation(line: 81, column: 1, scope: !102)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!155 = !DILocalVariable(name: "data", scope: !154, file: !12, line: 86, type: !17)
!156 = !DILocation(line: 86, column: 12, scope: !154)
!157 = !DILocalVariable(name: "dataBuffer", scope: !154, file: !12, line: 87, type: !21)
!158 = !DILocation(line: 87, column: 10, scope: !154)
!159 = !DILocation(line: 88, column: 12, scope: !154)
!160 = !DILocation(line: 88, column: 10, scope: !154)
!161 = !DILocation(line: 89, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !154, file: !12, line: 89, column: 8)
!163 = !DILocation(line: 89, column: 25, scope: !162)
!164 = !DILocation(line: 89, column: 8, scope: !154)
!165 = !DILocation(line: 92, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !12, line: 90, column: 5)
!167 = !DILocation(line: 93, column: 9, scope: !166)
!168 = !DILocation(line: 93, column: 20, scope: !166)
!169 = !DILocation(line: 94, column: 5, scope: !166)
!170 = !DILocalVariable(name: "dest", scope: !171, file: !12, line: 96, type: !38)
!171 = distinct !DILexicalBlock(scope: !154, file: !12, line: 95, column: 5)
!172 = !DILocation(line: 96, column: 14, scope: !171)
!173 = !DILocalVariable(name: "i", scope: !171, file: !12, line: 97, type: !43)
!174 = !DILocation(line: 97, column: 16, scope: !171)
!175 = !DILocalVariable(name: "dataLen", scope: !171, file: !12, line: 97, type: !43)
!176 = !DILocation(line: 97, column: 19, scope: !171)
!177 = !DILocation(line: 98, column: 26, scope: !171)
!178 = !DILocation(line: 98, column: 19, scope: !171)
!179 = !DILocation(line: 98, column: 17, scope: !171)
!180 = !DILocation(line: 100, column: 16, scope: !181)
!181 = distinct !DILexicalBlock(scope: !171, file: !12, line: 100, column: 9)
!182 = !DILocation(line: 100, column: 14, scope: !181)
!183 = !DILocation(line: 100, column: 21, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !12, line: 100, column: 9)
!185 = !DILocation(line: 100, column: 25, scope: !184)
!186 = !DILocation(line: 100, column: 23, scope: !184)
!187 = !DILocation(line: 100, column: 9, scope: !181)
!188 = !DILocation(line: 102, column: 23, scope: !189)
!189 = distinct !DILexicalBlock(scope: !184, file: !12, line: 101, column: 9)
!190 = !DILocation(line: 102, column: 28, scope: !189)
!191 = !DILocation(line: 102, column: 18, scope: !189)
!192 = !DILocation(line: 102, column: 13, scope: !189)
!193 = !DILocation(line: 102, column: 21, scope: !189)
!194 = !DILocation(line: 103, column: 9, scope: !189)
!195 = !DILocation(line: 100, column: 35, scope: !184)
!196 = !DILocation(line: 100, column: 9, scope: !184)
!197 = distinct !{!197, !187, !198, !73}
!198 = !DILocation(line: 103, column: 9, scope: !181)
!199 = !DILocation(line: 104, column: 9, scope: !171)
!200 = !DILocation(line: 104, column: 20, scope: !171)
!201 = !DILocation(line: 105, column: 19, scope: !171)
!202 = !DILocation(line: 105, column: 9, scope: !171)
!203 = !DILocation(line: 107, column: 1, scope: !154)
