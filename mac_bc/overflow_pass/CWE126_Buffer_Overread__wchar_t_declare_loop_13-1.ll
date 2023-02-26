; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !42
  %cmp = icmp eq i32 %0, 5, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i32* %arraydecay4, i32** %data, align 8, !dbg !48
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !59, metadata !DIExpression()), !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !62
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx7, align 4, !dbg !64
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !66
  store i64 %call9, i64* %destLen, align 8, !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !71
  %2 = load i64, i64* %destLen, align 8, !dbg !73
  %cmp10 = icmp ult i64 %1, %2, !dbg !74
  br i1 %cmp10, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !76
  %4 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !76
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !76
  %6 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !80
  store i32 %5, i32* %arrayidx12, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %7, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx13, align 4, !dbg !89
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !90
  call void @printWLine(i32* noundef %arraydecay14), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_13_good() #0 !dbg !93 {
entry:
  call void @goodG2B1(), !dbg !94
  call void @goodG2B2(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* noundef null), !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 noundef %conv), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_13_good(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_13_bad(), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !124
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !125
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !128
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !129
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx3, align 4, !dbg !131
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !132
  %cmp = icmp ne i32 %0, 5, !dbg !134
  br i1 %cmp, label %if.then, label %if.else, !dbg !135

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !136
  br label %if.end, !dbg !138

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !139
  store i32* %arraydecay4, i32** %data, align 8, !dbg !141
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !142, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !150
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx7, align 4, !dbg !152
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !154
  store i64 %call9, i64* %destLen, align 8, !dbg !155
  store i64 0, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !158

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !159
  %2 = load i64, i64* %destLen, align 8, !dbg !161
  %cmp10 = icmp ult i64 %1, %2, !dbg !162
  br i1 %cmp10, label %for.body, label %for.end, !dbg !163

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !164
  %4 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !164
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !164
  %6 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !168
  store i32 %5, i32* %arrayidx12, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %7, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !175
  store i32 0, i32* %arrayidx13, align 4, !dbg !176
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !177
  call void @printWLine(i32* noundef %arraydecay14), !dbg !178
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !180 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !185, metadata !DIExpression()), !dbg !186
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !187
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !188
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !189
  store i32 0, i32* %arrayidx, align 4, !dbg !190
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !191
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !192
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !193
  store i32 0, i32* %arrayidx3, align 4, !dbg !194
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !195
  %cmp = icmp eq i32 %0, 5, !dbg !197
  br i1 %cmp, label %if.then, label %if.end, !dbg !198

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !199
  store i32* %arraydecay4, i32** %data, align 8, !dbg !201
  br label %if.end, !dbg !202

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !203, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !206, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !208, metadata !DIExpression()), !dbg !209
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !210
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !211
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !212
  store i32 0, i32* %arrayidx7, align 4, !dbg !213
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !214
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !215
  store i64 %call9, i64* %destLen, align 8, !dbg !216
  store i64 0, i64* %i, align 8, !dbg !217
  br label %for.cond, !dbg !219

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !220
  %2 = load i64, i64* %destLen, align 8, !dbg !222
  %cmp10 = icmp ult i64 %1, %2, !dbg !223
  br i1 %cmp10, label %for.body, label %for.end, !dbg !224

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !225
  %4 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx11 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !225
  %5 = load i32, i32* %arrayidx11, align 4, !dbg !225
  %6 = load i64, i64* %i, align 8, !dbg !228
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !229
  store i32 %5, i32* %arrayidx12, align 4, !dbg !230
  br label %for.inc, !dbg !231

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !232
  %inc = add i64 %7, 1, !dbg !232
  store i64 %inc, i64* %i, align 8, !dbg !232
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !236
  store i32 0, i32* %arrayidx13, align 4, !dbg !237
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !238
  call void @printWLine(i32* noundef %arraydecay14), !dbg !239
  ret void, !dbg !240
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_13_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 13, scope: !11)
!34 = !DILocation(line: 28, column: 13, scope: !11)
!35 = !DILocation(line: 28, column: 5, scope: !11)
!36 = !DILocation(line: 29, column: 5, scope: !11)
!37 = !DILocation(line: 29, column: 25, scope: !11)
!38 = !DILocation(line: 30, column: 13, scope: !11)
!39 = !DILocation(line: 30, column: 5, scope: !11)
!40 = !DILocation(line: 31, column: 5, scope: !11)
!41 = !DILocation(line: 31, column: 27, scope: !11)
!42 = !DILocation(line: 32, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!44 = !DILocation(line: 32, column: 25, scope: !43)
!45 = !DILocation(line: 32, column: 8, scope: !11)
!46 = !DILocation(line: 35, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !12, line: 33, column: 5)
!48 = !DILocation(line: 35, column: 14, scope: !47)
!49 = !DILocation(line: 36, column: 5, scope: !47)
!50 = !DILocalVariable(name: "i", scope: !51, file: !12, line: 38, type: !52)
!51 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 31, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !55)
!55 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 38, column: 16, scope: !51)
!57 = !DILocalVariable(name: "destLen", scope: !51, file: !12, line: 38, type: !52)
!58 = !DILocation(line: 38, column: 19, scope: !51)
!59 = !DILocalVariable(name: "dest", scope: !51, file: !12, line: 39, type: !30)
!60 = !DILocation(line: 39, column: 17, scope: !51)
!61 = !DILocation(line: 40, column: 17, scope: !51)
!62 = !DILocation(line: 40, column: 9, scope: !51)
!63 = !DILocation(line: 41, column: 9, scope: !51)
!64 = !DILocation(line: 41, column: 21, scope: !51)
!65 = !DILocation(line: 42, column: 26, scope: !51)
!66 = !DILocation(line: 42, column: 19, scope: !51)
!67 = !DILocation(line: 42, column: 17, scope: !51)
!68 = !DILocation(line: 45, column: 16, scope: !69)
!69 = distinct !DILexicalBlock(scope: !51, file: !12, line: 45, column: 9)
!70 = !DILocation(line: 45, column: 14, scope: !69)
!71 = !DILocation(line: 45, column: 21, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !12, line: 45, column: 9)
!73 = !DILocation(line: 45, column: 25, scope: !72)
!74 = !DILocation(line: 45, column: 23, scope: !72)
!75 = !DILocation(line: 45, column: 9, scope: !69)
!76 = !DILocation(line: 47, column: 23, scope: !77)
!77 = distinct !DILexicalBlock(scope: !72, file: !12, line: 46, column: 9)
!78 = !DILocation(line: 47, column: 28, scope: !77)
!79 = !DILocation(line: 47, column: 18, scope: !77)
!80 = !DILocation(line: 47, column: 13, scope: !77)
!81 = !DILocation(line: 47, column: 21, scope: !77)
!82 = !DILocation(line: 48, column: 9, scope: !77)
!83 = !DILocation(line: 45, column: 35, scope: !72)
!84 = !DILocation(line: 45, column: 9, scope: !72)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 48, column: 9, scope: !69)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 49, column: 9, scope: !51)
!89 = !DILocation(line: 49, column: 21, scope: !51)
!90 = !DILocation(line: 50, column: 20, scope: !51)
!91 = !DILocation(line: 50, column: 9, scope: !51)
!92 = !DILocation(line: 52, column: 1, scope: !11)
!93 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_13_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DILocation(line: 129, column: 5, scope: !93)
!95 = !DILocation(line: 130, column: 5, scope: !93)
!96 = !DILocation(line: 131, column: 1, scope: !93)
!97 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !98, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!98 = !DISubroutineType(types: !99)
!99 = !{!22, !22, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !12, line: 143, type: !22)
!104 = !DILocation(line: 143, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !12, line: 143, type: !100)
!106 = !DILocation(line: 143, column: 27, scope: !97)
!107 = !DILocation(line: 146, column: 22, scope: !97)
!108 = !DILocation(line: 146, column: 12, scope: !97)
!109 = !DILocation(line: 146, column: 5, scope: !97)
!110 = !DILocation(line: 148, column: 5, scope: !97)
!111 = !DILocation(line: 149, column: 5, scope: !97)
!112 = !DILocation(line: 150, column: 5, scope: !97)
!113 = !DILocation(line: 153, column: 5, scope: !97)
!114 = !DILocation(line: 154, column: 5, scope: !97)
!115 = !DILocation(line: 155, column: 5, scope: !97)
!116 = !DILocation(line: 157, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!118 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 61, type: !17)
!119 = !DILocation(line: 61, column: 15, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !12, line: 62, type: !25)
!121 = !DILocation(line: 62, column: 13, scope: !117)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !12, line: 63, type: !30)
!123 = !DILocation(line: 63, column: 13, scope: !117)
!124 = !DILocation(line: 64, column: 13, scope: !117)
!125 = !DILocation(line: 64, column: 5, scope: !117)
!126 = !DILocation(line: 65, column: 5, scope: !117)
!127 = !DILocation(line: 65, column: 25, scope: !117)
!128 = !DILocation(line: 66, column: 13, scope: !117)
!129 = !DILocation(line: 66, column: 5, scope: !117)
!130 = !DILocation(line: 67, column: 5, scope: !117)
!131 = !DILocation(line: 67, column: 27, scope: !117)
!132 = !DILocation(line: 68, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !117, file: !12, line: 68, column: 8)
!134 = !DILocation(line: 68, column: 25, scope: !133)
!135 = !DILocation(line: 68, column: 8, scope: !117)
!136 = !DILocation(line: 71, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !12, line: 69, column: 5)
!138 = !DILocation(line: 72, column: 5, scope: !137)
!139 = !DILocation(line: 76, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !133, file: !12, line: 74, column: 5)
!141 = !DILocation(line: 76, column: 14, scope: !140)
!142 = !DILocalVariable(name: "i", scope: !143, file: !12, line: 79, type: !52)
!143 = distinct !DILexicalBlock(scope: !117, file: !12, line: 78, column: 5)
!144 = !DILocation(line: 79, column: 16, scope: !143)
!145 = !DILocalVariable(name: "destLen", scope: !143, file: !12, line: 79, type: !52)
!146 = !DILocation(line: 79, column: 19, scope: !143)
!147 = !DILocalVariable(name: "dest", scope: !143, file: !12, line: 80, type: !30)
!148 = !DILocation(line: 80, column: 17, scope: !143)
!149 = !DILocation(line: 81, column: 17, scope: !143)
!150 = !DILocation(line: 81, column: 9, scope: !143)
!151 = !DILocation(line: 82, column: 9, scope: !143)
!152 = !DILocation(line: 82, column: 21, scope: !143)
!153 = !DILocation(line: 83, column: 26, scope: !143)
!154 = !DILocation(line: 83, column: 19, scope: !143)
!155 = !DILocation(line: 83, column: 17, scope: !143)
!156 = !DILocation(line: 86, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !143, file: !12, line: 86, column: 9)
!158 = !DILocation(line: 86, column: 14, scope: !157)
!159 = !DILocation(line: 86, column: 21, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 86, column: 9)
!161 = !DILocation(line: 86, column: 25, scope: !160)
!162 = !DILocation(line: 86, column: 23, scope: !160)
!163 = !DILocation(line: 86, column: 9, scope: !157)
!164 = !DILocation(line: 88, column: 23, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !12, line: 87, column: 9)
!166 = !DILocation(line: 88, column: 28, scope: !165)
!167 = !DILocation(line: 88, column: 18, scope: !165)
!168 = !DILocation(line: 88, column: 13, scope: !165)
!169 = !DILocation(line: 88, column: 21, scope: !165)
!170 = !DILocation(line: 89, column: 9, scope: !165)
!171 = !DILocation(line: 86, column: 35, scope: !160)
!172 = !DILocation(line: 86, column: 9, scope: !160)
!173 = distinct !{!173, !163, !174, !87}
!174 = !DILocation(line: 89, column: 9, scope: !157)
!175 = !DILocation(line: 90, column: 9, scope: !143)
!176 = !DILocation(line: 90, column: 21, scope: !143)
!177 = !DILocation(line: 91, column: 20, scope: !143)
!178 = !DILocation(line: 91, column: 9, scope: !143)
!179 = !DILocation(line: 93, column: 1, scope: !117)
!180 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 96, type: !13, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!181 = !DILocalVariable(name: "data", scope: !180, file: !12, line: 98, type: !17)
!182 = !DILocation(line: 98, column: 15, scope: !180)
!183 = !DILocalVariable(name: "dataBadBuffer", scope: !180, file: !12, line: 99, type: !25)
!184 = !DILocation(line: 99, column: 13, scope: !180)
!185 = !DILocalVariable(name: "dataGoodBuffer", scope: !180, file: !12, line: 100, type: !30)
!186 = !DILocation(line: 100, column: 13, scope: !180)
!187 = !DILocation(line: 101, column: 13, scope: !180)
!188 = !DILocation(line: 101, column: 5, scope: !180)
!189 = !DILocation(line: 102, column: 5, scope: !180)
!190 = !DILocation(line: 102, column: 25, scope: !180)
!191 = !DILocation(line: 103, column: 13, scope: !180)
!192 = !DILocation(line: 103, column: 5, scope: !180)
!193 = !DILocation(line: 104, column: 5, scope: !180)
!194 = !DILocation(line: 104, column: 27, scope: !180)
!195 = !DILocation(line: 105, column: 8, scope: !196)
!196 = distinct !DILexicalBlock(scope: !180, file: !12, line: 105, column: 8)
!197 = !DILocation(line: 105, column: 25, scope: !196)
!198 = !DILocation(line: 105, column: 8, scope: !180)
!199 = !DILocation(line: 108, column: 16, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !12, line: 106, column: 5)
!201 = !DILocation(line: 108, column: 14, scope: !200)
!202 = !DILocation(line: 109, column: 5, scope: !200)
!203 = !DILocalVariable(name: "i", scope: !204, file: !12, line: 111, type: !52)
!204 = distinct !DILexicalBlock(scope: !180, file: !12, line: 110, column: 5)
!205 = !DILocation(line: 111, column: 16, scope: !204)
!206 = !DILocalVariable(name: "destLen", scope: !204, file: !12, line: 111, type: !52)
!207 = !DILocation(line: 111, column: 19, scope: !204)
!208 = !DILocalVariable(name: "dest", scope: !204, file: !12, line: 112, type: !30)
!209 = !DILocation(line: 112, column: 17, scope: !204)
!210 = !DILocation(line: 113, column: 17, scope: !204)
!211 = !DILocation(line: 113, column: 9, scope: !204)
!212 = !DILocation(line: 114, column: 9, scope: !204)
!213 = !DILocation(line: 114, column: 21, scope: !204)
!214 = !DILocation(line: 115, column: 26, scope: !204)
!215 = !DILocation(line: 115, column: 19, scope: !204)
!216 = !DILocation(line: 115, column: 17, scope: !204)
!217 = !DILocation(line: 118, column: 16, scope: !218)
!218 = distinct !DILexicalBlock(scope: !204, file: !12, line: 118, column: 9)
!219 = !DILocation(line: 118, column: 14, scope: !218)
!220 = !DILocation(line: 118, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !12, line: 118, column: 9)
!222 = !DILocation(line: 118, column: 25, scope: !221)
!223 = !DILocation(line: 118, column: 23, scope: !221)
!224 = !DILocation(line: 118, column: 9, scope: !218)
!225 = !DILocation(line: 120, column: 23, scope: !226)
!226 = distinct !DILexicalBlock(scope: !221, file: !12, line: 119, column: 9)
!227 = !DILocation(line: 120, column: 28, scope: !226)
!228 = !DILocation(line: 120, column: 18, scope: !226)
!229 = !DILocation(line: 120, column: 13, scope: !226)
!230 = !DILocation(line: 120, column: 21, scope: !226)
!231 = !DILocation(line: 121, column: 9, scope: !226)
!232 = !DILocation(line: 118, column: 35, scope: !221)
!233 = !DILocation(line: 118, column: 9, scope: !221)
!234 = distinct !{!234, !224, !235, !87}
!235 = !DILocation(line: 121, column: 9, scope: !218)
!236 = !DILocation(line: 122, column: 9, scope: !204)
!237 = !DILocation(line: 122, column: 21, scope: !204)
!238 = !DILocation(line: 123, column: 20, scope: !204)
!239 = !DILocation(line: 123, column: 9, scope: !204)
!240 = !DILocation(line: 125, column: 1, scope: !180)
