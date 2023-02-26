; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !33
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx2, align 1, !dbg !35
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !36
  %cmp = icmp eq i32 %0, 5, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay3, i8** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !56
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !57
  store i8 0, i8* %arrayidx5, align 1, !dbg !58
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !60
  store i64 %call, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !65
  %2 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp7 = icmp ult i64 %1, %2, !dbg !68
  br i1 %cmp7, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !70
  %4 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !70
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !70
  %6 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !74
  store i8 %5, i8* %arrayidx9, align 1, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %7, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !82
  store i8 0, i8* %arrayidx10, align 1, !dbg !83
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  call void @printLine(i8* noundef %arraydecay11), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_13_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__char_declare_loop_13_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__char_declare_loop_13_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !117
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !120
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx2, align 1, !dbg !122
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !123
  %cmp = icmp ne i32 %0, 5, !dbg !125
  br i1 %cmp, label %if.then, label %if.else, !dbg !126

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !127
  br label %if.end, !dbg !129

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !130
  store i8* %arraydecay3, i8** %data, align 8, !dbg !132
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !140
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !141
  store i8 0, i8* %arrayidx5, align 1, !dbg !142
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !143
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !144
  store i64 %call, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !149
  %2 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp7 = icmp ult i64 %1, %2, !dbg !152
  br i1 %cmp7, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !154
  %4 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !154
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !154
  %6 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !158
  store i8 %5, i8* %arrayidx9, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %7, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx10, align 1, !dbg !166
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @printLine(i8* noundef %arraydecay11), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !173, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !175, metadata !DIExpression()), !dbg !176
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !177
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !177
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !178
  store i8 0, i8* %arrayidx, align 1, !dbg !179
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !180
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !181
  store i8 0, i8* %arrayidx2, align 1, !dbg !182
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !183
  %cmp = icmp eq i32 %0, 5, !dbg !185
  br i1 %cmp, label %if.then, label %if.end, !dbg !186

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !187
  store i8* %arraydecay3, i8** %data, align 8, !dbg !189
  br label %if.end, !dbg !190

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !191, metadata !DIExpression()), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !196, metadata !DIExpression()), !dbg !197
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !198
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !199
  store i8 0, i8* %arrayidx5, align 1, !dbg !200
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !201
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !202
  store i64 %call, i64* %destLen, align 8, !dbg !203
  store i64 0, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !207
  %2 = load i64, i64* %destLen, align 8, !dbg !209
  %cmp7 = icmp ult i64 %1, %2, !dbg !210
  br i1 %cmp7, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !212
  %4 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx8 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !212
  %5 = load i8, i8* %arrayidx8, align 1, !dbg !212
  %6 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !216
  store i8 %5, i8* %arrayidx9, align 1, !dbg !217
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !219
  %inc = add i64 %7, 1, !dbg !219
  store i64 %inc, i64* %i, align 8, !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !223
  store i8 0, i8* %arrayidx10, align 1, !dbg !224
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !225
  call void @printLine(i8* noundef %arraydecay11), !dbg !226
  ret void, !dbg !227
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 10, scope: !11)
!30 = !DILocation(line: 28, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 5, scope: !11)
!32 = !DILocation(line: 29, column: 25, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 5, scope: !11)
!35 = !DILocation(line: 31, column: 27, scope: !11)
!36 = !DILocation(line: 32, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!38 = !DILocation(line: 32, column: 25, scope: !37)
!39 = !DILocation(line: 32, column: 8, scope: !11)
!40 = !DILocation(line: 35, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 33, column: 5)
!42 = !DILocation(line: 35, column: 14, scope: !41)
!43 = !DILocation(line: 36, column: 5, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 38, type: !46)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !49, line: 94, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 38, column: 16, scope: !45)
!52 = !DILocalVariable(name: "destLen", scope: !45, file: !12, line: 38, type: !46)
!53 = !DILocation(line: 38, column: 19, scope: !45)
!54 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 39, type: !26)
!55 = !DILocation(line: 39, column: 14, scope: !45)
!56 = !DILocation(line: 40, column: 9, scope: !45)
!57 = !DILocation(line: 41, column: 9, scope: !45)
!58 = !DILocation(line: 41, column: 21, scope: !45)
!59 = !DILocation(line: 42, column: 26, scope: !45)
!60 = !DILocation(line: 42, column: 19, scope: !45)
!61 = !DILocation(line: 42, column: 17, scope: !45)
!62 = !DILocation(line: 45, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !45, file: !12, line: 45, column: 9)
!64 = !DILocation(line: 45, column: 14, scope: !63)
!65 = !DILocation(line: 45, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 45, column: 9)
!67 = !DILocation(line: 45, column: 25, scope: !66)
!68 = !DILocation(line: 45, column: 23, scope: !66)
!69 = !DILocation(line: 45, column: 9, scope: !63)
!70 = !DILocation(line: 47, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !12, line: 46, column: 9)
!72 = !DILocation(line: 47, column: 28, scope: !71)
!73 = !DILocation(line: 47, column: 18, scope: !71)
!74 = !DILocation(line: 47, column: 13, scope: !71)
!75 = !DILocation(line: 47, column: 21, scope: !71)
!76 = !DILocation(line: 48, column: 9, scope: !71)
!77 = !DILocation(line: 45, column: 35, scope: !66)
!78 = !DILocation(line: 45, column: 9, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 48, column: 9, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 49, column: 9, scope: !45)
!83 = !DILocation(line: 49, column: 21, scope: !45)
!84 = !DILocation(line: 50, column: 19, scope: !45)
!85 = !DILocation(line: 50, column: 9, scope: !45)
!86 = !DILocation(line: 52, column: 1, scope: !11)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_13_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DILocation(line: 129, column: 5, scope: !87)
!89 = !DILocation(line: 130, column: 5, scope: !87)
!90 = !DILocation(line: 131, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !92, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !94, !95}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !12, line: 143, type: !94)
!97 = !DILocation(line: 143, column: 14, scope: !91)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !12, line: 143, type: !95)
!99 = !DILocation(line: 143, column: 27, scope: !91)
!100 = !DILocation(line: 146, column: 22, scope: !91)
!101 = !DILocation(line: 146, column: 12, scope: !91)
!102 = !DILocation(line: 146, column: 5, scope: !91)
!103 = !DILocation(line: 148, column: 5, scope: !91)
!104 = !DILocation(line: 149, column: 5, scope: !91)
!105 = !DILocation(line: 150, column: 5, scope: !91)
!106 = !DILocation(line: 153, column: 5, scope: !91)
!107 = !DILocation(line: 154, column: 5, scope: !91)
!108 = !DILocation(line: 155, column: 5, scope: !91)
!109 = !DILocation(line: 157, column: 5, scope: !91)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 61, type: !17)
!112 = !DILocation(line: 61, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !12, line: 62, type: !21)
!114 = !DILocation(line: 62, column: 10, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !12, line: 63, type: !26)
!116 = !DILocation(line: 63, column: 10, scope: !110)
!117 = !DILocation(line: 64, column: 5, scope: !110)
!118 = !DILocation(line: 65, column: 5, scope: !110)
!119 = !DILocation(line: 65, column: 25, scope: !110)
!120 = !DILocation(line: 66, column: 5, scope: !110)
!121 = !DILocation(line: 67, column: 5, scope: !110)
!122 = !DILocation(line: 67, column: 27, scope: !110)
!123 = !DILocation(line: 68, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !110, file: !12, line: 68, column: 8)
!125 = !DILocation(line: 68, column: 25, scope: !124)
!126 = !DILocation(line: 68, column: 8, scope: !110)
!127 = !DILocation(line: 71, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 69, column: 5)
!129 = !DILocation(line: 72, column: 5, scope: !128)
!130 = !DILocation(line: 76, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !12, line: 74, column: 5)
!132 = !DILocation(line: 76, column: 14, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !12, line: 79, type: !46)
!134 = distinct !DILexicalBlock(scope: !110, file: !12, line: 78, column: 5)
!135 = !DILocation(line: 79, column: 16, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !12, line: 79, type: !46)
!137 = !DILocation(line: 79, column: 19, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !12, line: 80, type: !26)
!139 = !DILocation(line: 80, column: 14, scope: !134)
!140 = !DILocation(line: 81, column: 9, scope: !134)
!141 = !DILocation(line: 82, column: 9, scope: !134)
!142 = !DILocation(line: 82, column: 21, scope: !134)
!143 = !DILocation(line: 83, column: 26, scope: !134)
!144 = !DILocation(line: 83, column: 19, scope: !134)
!145 = !DILocation(line: 83, column: 17, scope: !134)
!146 = !DILocation(line: 86, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !134, file: !12, line: 86, column: 9)
!148 = !DILocation(line: 86, column: 14, scope: !147)
!149 = !DILocation(line: 86, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 86, column: 9)
!151 = !DILocation(line: 86, column: 25, scope: !150)
!152 = !DILocation(line: 86, column: 23, scope: !150)
!153 = !DILocation(line: 86, column: 9, scope: !147)
!154 = !DILocation(line: 88, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !12, line: 87, column: 9)
!156 = !DILocation(line: 88, column: 28, scope: !155)
!157 = !DILocation(line: 88, column: 18, scope: !155)
!158 = !DILocation(line: 88, column: 13, scope: !155)
!159 = !DILocation(line: 88, column: 21, scope: !155)
!160 = !DILocation(line: 89, column: 9, scope: !155)
!161 = !DILocation(line: 86, column: 35, scope: !150)
!162 = !DILocation(line: 86, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !81}
!164 = !DILocation(line: 89, column: 9, scope: !147)
!165 = !DILocation(line: 90, column: 9, scope: !134)
!166 = !DILocation(line: 90, column: 21, scope: !134)
!167 = !DILocation(line: 91, column: 19, scope: !134)
!168 = !DILocation(line: 91, column: 9, scope: !134)
!169 = !DILocation(line: 93, column: 1, scope: !110)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 96, type: !13, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!171 = !DILocalVariable(name: "data", scope: !170, file: !12, line: 98, type: !17)
!172 = !DILocation(line: 98, column: 12, scope: !170)
!173 = !DILocalVariable(name: "dataBadBuffer", scope: !170, file: !12, line: 99, type: !21)
!174 = !DILocation(line: 99, column: 10, scope: !170)
!175 = !DILocalVariable(name: "dataGoodBuffer", scope: !170, file: !12, line: 100, type: !26)
!176 = !DILocation(line: 100, column: 10, scope: !170)
!177 = !DILocation(line: 101, column: 5, scope: !170)
!178 = !DILocation(line: 102, column: 5, scope: !170)
!179 = !DILocation(line: 102, column: 25, scope: !170)
!180 = !DILocation(line: 103, column: 5, scope: !170)
!181 = !DILocation(line: 104, column: 5, scope: !170)
!182 = !DILocation(line: 104, column: 27, scope: !170)
!183 = !DILocation(line: 105, column: 8, scope: !184)
!184 = distinct !DILexicalBlock(scope: !170, file: !12, line: 105, column: 8)
!185 = !DILocation(line: 105, column: 25, scope: !184)
!186 = !DILocation(line: 105, column: 8, scope: !170)
!187 = !DILocation(line: 108, column: 16, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !12, line: 106, column: 5)
!189 = !DILocation(line: 108, column: 14, scope: !188)
!190 = !DILocation(line: 109, column: 5, scope: !188)
!191 = !DILocalVariable(name: "i", scope: !192, file: !12, line: 111, type: !46)
!192 = distinct !DILexicalBlock(scope: !170, file: !12, line: 110, column: 5)
!193 = !DILocation(line: 111, column: 16, scope: !192)
!194 = !DILocalVariable(name: "destLen", scope: !192, file: !12, line: 111, type: !46)
!195 = !DILocation(line: 111, column: 19, scope: !192)
!196 = !DILocalVariable(name: "dest", scope: !192, file: !12, line: 112, type: !26)
!197 = !DILocation(line: 112, column: 14, scope: !192)
!198 = !DILocation(line: 113, column: 9, scope: !192)
!199 = !DILocation(line: 114, column: 9, scope: !192)
!200 = !DILocation(line: 114, column: 21, scope: !192)
!201 = !DILocation(line: 115, column: 26, scope: !192)
!202 = !DILocation(line: 115, column: 19, scope: !192)
!203 = !DILocation(line: 115, column: 17, scope: !192)
!204 = !DILocation(line: 118, column: 16, scope: !205)
!205 = distinct !DILexicalBlock(scope: !192, file: !12, line: 118, column: 9)
!206 = !DILocation(line: 118, column: 14, scope: !205)
!207 = !DILocation(line: 118, column: 21, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !12, line: 118, column: 9)
!209 = !DILocation(line: 118, column: 25, scope: !208)
!210 = !DILocation(line: 118, column: 23, scope: !208)
!211 = !DILocation(line: 118, column: 9, scope: !205)
!212 = !DILocation(line: 120, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !208, file: !12, line: 119, column: 9)
!214 = !DILocation(line: 120, column: 28, scope: !213)
!215 = !DILocation(line: 120, column: 18, scope: !213)
!216 = !DILocation(line: 120, column: 13, scope: !213)
!217 = !DILocation(line: 120, column: 21, scope: !213)
!218 = !DILocation(line: 121, column: 9, scope: !213)
!219 = !DILocation(line: 118, column: 35, scope: !208)
!220 = !DILocation(line: 118, column: 9, scope: !208)
!221 = distinct !{!221, !211, !222, !81}
!222 = !DILocation(line: 121, column: 9, scope: !205)
!223 = !DILocation(line: 122, column: 9, scope: !192)
!224 = !DILocation(line: 122, column: 21, scope: !192)
!225 = !DILocation(line: 123, column: 19, scope: !192)
!226 = !DILocation(line: 123, column: 9, scope: !192)
!227 = !DILocation(line: 125, column: 1, scope: !170)
