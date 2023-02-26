; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !40
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !43
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !45
  store i32 0, i32* %arrayidx3, align 4, !dbg !46
  %0 = load i32, i32* @staticTrue, align 4, !dbg !47
  %tobool = icmp ne i32 %0, 0, !dbg !47
  br i1 %tobool, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !50
  store i32* %arraydecay4, i32** %data, align 8, !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !63, metadata !DIExpression()), !dbg !64
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !65
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !66
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx7, align 4, !dbg !68
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !70
  store i64 %call9, i64* %destLen, align 8, !dbg !71
  store i64 0, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !74

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !75
  %2 = load i64, i64* %destLen, align 8, !dbg !77
  %cmp = icmp ult i64 %1, %2, !dbg !78
  br i1 %cmp, label %for.body, label %for.end, !dbg !79

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !80
  %4 = load i64, i64* %i, align 8, !dbg !82
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !80
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !80
  %6 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !84
  store i32 %5, i32* %arrayidx11, align 4, !dbg !85
  br label %for.inc, !dbg !86

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !87
  %inc = add i64 %7, 1, !dbg !87
  store i64 %inc, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !88, !llvm.loop !89

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !92
  store i32 0, i32* %arrayidx12, align 4, !dbg !93
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !94
  call void @printWLine(i32* noundef %arraydecay13), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_05_good() #0 !dbg !97 {
entry:
  call void @goodG2B1(), !dbg !98
  call void @goodG2B2(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* noundef null), !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 noundef %conv), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_05_good(), !dbg !115
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_05_bad(), !dbg !118
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !128
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !129
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !130
  store i32 0, i32* %arrayidx, align 4, !dbg !131
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !132
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !133
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx3, align 4, !dbg !135
  %0 = load i32, i32* @staticFalse, align 4, !dbg !136
  %tobool = icmp ne i32 %0, 0, !dbg !136
  br i1 %tobool, label %if.then, label %if.else, !dbg !138

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !139
  br label %if.end, !dbg !141

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !142
  store i32* %arraydecay4, i32** %data, align 8, !dbg !144
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !153
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx7, align 4, !dbg !155
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !156
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !157
  store i64 %call9, i64* %destLen, align 8, !dbg !158
  store i64 0, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !161

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !162
  %2 = load i64, i64* %destLen, align 8, !dbg !164
  %cmp = icmp ult i64 %1, %2, !dbg !165
  br i1 %cmp, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !167
  %4 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !167
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !167
  %6 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !171
  store i32 %5, i32* %arrayidx11, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %7, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !178
  store i32 0, i32* %arrayidx12, align 4, !dbg !179
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !180
  call void @printWLine(i32* noundef %arraydecay13), !dbg !181
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !183 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !188, metadata !DIExpression()), !dbg !189
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !190
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !191
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !192
  store i32 0, i32* %arrayidx, align 4, !dbg !193
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !194
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !195
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !196
  store i32 0, i32* %arrayidx3, align 4, !dbg !197
  %0 = load i32, i32* @staticTrue, align 4, !dbg !198
  %tobool = icmp ne i32 %0, 0, !dbg !198
  br i1 %tobool, label %if.then, label %if.end, !dbg !200

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !201
  store i32* %arraydecay4, i32** %data, align 8, !dbg !203
  br label %if.end, !dbg !204

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !205, metadata !DIExpression()), !dbg !207
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !210, metadata !DIExpression()), !dbg !211
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !212
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !213
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !214
  store i32 0, i32* %arrayidx7, align 4, !dbg !215
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !216
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !217
  store i64 %call9, i64* %destLen, align 8, !dbg !218
  store i64 0, i64* %i, align 8, !dbg !219
  br label %for.cond, !dbg !221

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !222
  %2 = load i64, i64* %destLen, align 8, !dbg !224
  %cmp = icmp ult i64 %1, %2, !dbg !225
  br i1 %cmp, label %for.body, label %for.end, !dbg !226

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %data, align 8, !dbg !227
  %4 = load i64, i64* %i, align 8, !dbg !229
  %arrayidx10 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !227
  %5 = load i32, i32* %arrayidx10, align 4, !dbg !227
  %6 = load i64, i64* %i, align 8, !dbg !230
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %6, !dbg !231
  store i32 %5, i32* %arrayidx11, align 4, !dbg !232
  br label %for.inc, !dbg !233

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !234
  %inc = add i64 %7, 1, !dbg !234
  store i64 %inc, i64* %i, align 8, !dbg !234
  br label %for.cond, !dbg !235, !llvm.loop !236

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !238
  store i32 0, i32* %arrayidx12, align 4, !dbg !239
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !240
  call void @printWLine(i32* noundef %arraydecay13), !dbg !241
  ret void, !dbg !242
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 26, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_05_bad", scope: !9, file: !9, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 32, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !25, line: 34, baseType: !26)
!25 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !27, line: 106, baseType: !10)
!27 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!28 = !DILocation(line: 32, column: 15, scope: !18)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 1600, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 33, column: 13, scope: !18)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 34, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 34, column: 13, scope: !18)
!39 = !DILocation(line: 35, column: 13, scope: !18)
!40 = !DILocation(line: 35, column: 5, scope: !18)
!41 = !DILocation(line: 36, column: 5, scope: !18)
!42 = !DILocation(line: 36, column: 25, scope: !18)
!43 = !DILocation(line: 37, column: 13, scope: !18)
!44 = !DILocation(line: 37, column: 5, scope: !18)
!45 = !DILocation(line: 38, column: 5, scope: !18)
!46 = !DILocation(line: 38, column: 27, scope: !18)
!47 = !DILocation(line: 39, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !18, file: !9, line: 39, column: 8)
!49 = !DILocation(line: 39, column: 8, scope: !18)
!50 = !DILocation(line: 42, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !9, line: 40, column: 5)
!52 = !DILocation(line: 42, column: 14, scope: !51)
!53 = !DILocation(line: 43, column: 5, scope: !51)
!54 = !DILocalVariable(name: "i", scope: !55, file: !9, line: 45, type: !56)
!55 = distinct !DILexicalBlock(scope: !18, file: !9, line: 44, column: 5)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !27, line: 94, baseType: !59)
!59 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 45, column: 16, scope: !55)
!61 = !DILocalVariable(name: "destLen", scope: !55, file: !9, line: 45, type: !56)
!62 = !DILocation(line: 45, column: 19, scope: !55)
!63 = !DILocalVariable(name: "dest", scope: !55, file: !9, line: 46, type: !35)
!64 = !DILocation(line: 46, column: 17, scope: !55)
!65 = !DILocation(line: 47, column: 17, scope: !55)
!66 = !DILocation(line: 47, column: 9, scope: !55)
!67 = !DILocation(line: 48, column: 9, scope: !55)
!68 = !DILocation(line: 48, column: 21, scope: !55)
!69 = !DILocation(line: 49, column: 26, scope: !55)
!70 = !DILocation(line: 49, column: 19, scope: !55)
!71 = !DILocation(line: 49, column: 17, scope: !55)
!72 = !DILocation(line: 52, column: 16, scope: !73)
!73 = distinct !DILexicalBlock(scope: !55, file: !9, line: 52, column: 9)
!74 = !DILocation(line: 52, column: 14, scope: !73)
!75 = !DILocation(line: 52, column: 21, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !9, line: 52, column: 9)
!77 = !DILocation(line: 52, column: 25, scope: !76)
!78 = !DILocation(line: 52, column: 23, scope: !76)
!79 = !DILocation(line: 52, column: 9, scope: !73)
!80 = !DILocation(line: 54, column: 23, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !9, line: 53, column: 9)
!82 = !DILocation(line: 54, column: 28, scope: !81)
!83 = !DILocation(line: 54, column: 18, scope: !81)
!84 = !DILocation(line: 54, column: 13, scope: !81)
!85 = !DILocation(line: 54, column: 21, scope: !81)
!86 = !DILocation(line: 55, column: 9, scope: !81)
!87 = !DILocation(line: 52, column: 35, scope: !76)
!88 = !DILocation(line: 52, column: 9, scope: !76)
!89 = distinct !{!89, !79, !90, !91}
!90 = !DILocation(line: 55, column: 9, scope: !73)
!91 = !{!"llvm.loop.mustprogress"}
!92 = !DILocation(line: 56, column: 9, scope: !55)
!93 = !DILocation(line: 56, column: 21, scope: !55)
!94 = !DILocation(line: 57, column: 20, scope: !55)
!95 = !DILocation(line: 57, column: 9, scope: !55)
!96 = !DILocation(line: 59, column: 1, scope: !18)
!97 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_05_good", scope: !9, file: !9, line: 134, type: !19, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!98 = !DILocation(line: 136, column: 5, scope: !97)
!99 = !DILocation(line: 137, column: 5, scope: !97)
!100 = !DILocation(line: 138, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 150, type: !102, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!102 = !DISubroutineType(types: !103)
!103 = !{!10, !10, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !9, line: 150, type: !10)
!108 = !DILocation(line: 150, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !9, line: 150, type: !104)
!110 = !DILocation(line: 150, column: 27, scope: !101)
!111 = !DILocation(line: 153, column: 22, scope: !101)
!112 = !DILocation(line: 153, column: 12, scope: !101)
!113 = !DILocation(line: 153, column: 5, scope: !101)
!114 = !DILocation(line: 155, column: 5, scope: !101)
!115 = !DILocation(line: 156, column: 5, scope: !101)
!116 = !DILocation(line: 157, column: 5, scope: !101)
!117 = !DILocation(line: 160, column: 5, scope: !101)
!118 = !DILocation(line: 161, column: 5, scope: !101)
!119 = !DILocation(line: 162, column: 5, scope: !101)
!120 = !DILocation(line: 164, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 66, type: !19, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!122 = !DILocalVariable(name: "data", scope: !121, file: !9, line: 68, type: !23)
!123 = !DILocation(line: 68, column: 15, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !9, line: 69, type: !30)
!125 = !DILocation(line: 69, column: 13, scope: !121)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !9, line: 70, type: !35)
!127 = !DILocation(line: 70, column: 13, scope: !121)
!128 = !DILocation(line: 71, column: 13, scope: !121)
!129 = !DILocation(line: 71, column: 5, scope: !121)
!130 = !DILocation(line: 72, column: 5, scope: !121)
!131 = !DILocation(line: 72, column: 25, scope: !121)
!132 = !DILocation(line: 73, column: 13, scope: !121)
!133 = !DILocation(line: 73, column: 5, scope: !121)
!134 = !DILocation(line: 74, column: 5, scope: !121)
!135 = !DILocation(line: 74, column: 27, scope: !121)
!136 = !DILocation(line: 75, column: 8, scope: !137)
!137 = distinct !DILexicalBlock(scope: !121, file: !9, line: 75, column: 8)
!138 = !DILocation(line: 75, column: 8, scope: !121)
!139 = !DILocation(line: 78, column: 9, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !9, line: 76, column: 5)
!141 = !DILocation(line: 79, column: 5, scope: !140)
!142 = !DILocation(line: 83, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !9, line: 81, column: 5)
!144 = !DILocation(line: 83, column: 14, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !9, line: 86, type: !56)
!146 = distinct !DILexicalBlock(scope: !121, file: !9, line: 85, column: 5)
!147 = !DILocation(line: 86, column: 16, scope: !146)
!148 = !DILocalVariable(name: "destLen", scope: !146, file: !9, line: 86, type: !56)
!149 = !DILocation(line: 86, column: 19, scope: !146)
!150 = !DILocalVariable(name: "dest", scope: !146, file: !9, line: 87, type: !35)
!151 = !DILocation(line: 87, column: 17, scope: !146)
!152 = !DILocation(line: 88, column: 17, scope: !146)
!153 = !DILocation(line: 88, column: 9, scope: !146)
!154 = !DILocation(line: 89, column: 9, scope: !146)
!155 = !DILocation(line: 89, column: 21, scope: !146)
!156 = !DILocation(line: 90, column: 26, scope: !146)
!157 = !DILocation(line: 90, column: 19, scope: !146)
!158 = !DILocation(line: 90, column: 17, scope: !146)
!159 = !DILocation(line: 93, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !146, file: !9, line: 93, column: 9)
!161 = !DILocation(line: 93, column: 14, scope: !160)
!162 = !DILocation(line: 93, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !9, line: 93, column: 9)
!164 = !DILocation(line: 93, column: 25, scope: !163)
!165 = !DILocation(line: 93, column: 23, scope: !163)
!166 = !DILocation(line: 93, column: 9, scope: !160)
!167 = !DILocation(line: 95, column: 23, scope: !168)
!168 = distinct !DILexicalBlock(scope: !163, file: !9, line: 94, column: 9)
!169 = !DILocation(line: 95, column: 28, scope: !168)
!170 = !DILocation(line: 95, column: 18, scope: !168)
!171 = !DILocation(line: 95, column: 13, scope: !168)
!172 = !DILocation(line: 95, column: 21, scope: !168)
!173 = !DILocation(line: 96, column: 9, scope: !168)
!174 = !DILocation(line: 93, column: 35, scope: !163)
!175 = !DILocation(line: 93, column: 9, scope: !163)
!176 = distinct !{!176, !166, !177, !91}
!177 = !DILocation(line: 96, column: 9, scope: !160)
!178 = !DILocation(line: 97, column: 9, scope: !146)
!179 = !DILocation(line: 97, column: 21, scope: !146)
!180 = !DILocation(line: 98, column: 20, scope: !146)
!181 = !DILocation(line: 98, column: 9, scope: !146)
!182 = !DILocation(line: 100, column: 1, scope: !121)
!183 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 103, type: !19, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!184 = !DILocalVariable(name: "data", scope: !183, file: !9, line: 105, type: !23)
!185 = !DILocation(line: 105, column: 15, scope: !183)
!186 = !DILocalVariable(name: "dataBadBuffer", scope: !183, file: !9, line: 106, type: !30)
!187 = !DILocation(line: 106, column: 13, scope: !183)
!188 = !DILocalVariable(name: "dataGoodBuffer", scope: !183, file: !9, line: 107, type: !35)
!189 = !DILocation(line: 107, column: 13, scope: !183)
!190 = !DILocation(line: 108, column: 13, scope: !183)
!191 = !DILocation(line: 108, column: 5, scope: !183)
!192 = !DILocation(line: 109, column: 5, scope: !183)
!193 = !DILocation(line: 109, column: 25, scope: !183)
!194 = !DILocation(line: 110, column: 13, scope: !183)
!195 = !DILocation(line: 110, column: 5, scope: !183)
!196 = !DILocation(line: 111, column: 5, scope: !183)
!197 = !DILocation(line: 111, column: 27, scope: !183)
!198 = !DILocation(line: 112, column: 8, scope: !199)
!199 = distinct !DILexicalBlock(scope: !183, file: !9, line: 112, column: 8)
!200 = !DILocation(line: 112, column: 8, scope: !183)
!201 = !DILocation(line: 115, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !9, line: 113, column: 5)
!203 = !DILocation(line: 115, column: 14, scope: !202)
!204 = !DILocation(line: 116, column: 5, scope: !202)
!205 = !DILocalVariable(name: "i", scope: !206, file: !9, line: 118, type: !56)
!206 = distinct !DILexicalBlock(scope: !183, file: !9, line: 117, column: 5)
!207 = !DILocation(line: 118, column: 16, scope: !206)
!208 = !DILocalVariable(name: "destLen", scope: !206, file: !9, line: 118, type: !56)
!209 = !DILocation(line: 118, column: 19, scope: !206)
!210 = !DILocalVariable(name: "dest", scope: !206, file: !9, line: 119, type: !35)
!211 = !DILocation(line: 119, column: 17, scope: !206)
!212 = !DILocation(line: 120, column: 17, scope: !206)
!213 = !DILocation(line: 120, column: 9, scope: !206)
!214 = !DILocation(line: 121, column: 9, scope: !206)
!215 = !DILocation(line: 121, column: 21, scope: !206)
!216 = !DILocation(line: 122, column: 26, scope: !206)
!217 = !DILocation(line: 122, column: 19, scope: !206)
!218 = !DILocation(line: 122, column: 17, scope: !206)
!219 = !DILocation(line: 125, column: 16, scope: !220)
!220 = distinct !DILexicalBlock(scope: !206, file: !9, line: 125, column: 9)
!221 = !DILocation(line: 125, column: 14, scope: !220)
!222 = !DILocation(line: 125, column: 21, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !9, line: 125, column: 9)
!224 = !DILocation(line: 125, column: 25, scope: !223)
!225 = !DILocation(line: 125, column: 23, scope: !223)
!226 = !DILocation(line: 125, column: 9, scope: !220)
!227 = !DILocation(line: 127, column: 23, scope: !228)
!228 = distinct !DILexicalBlock(scope: !223, file: !9, line: 126, column: 9)
!229 = !DILocation(line: 127, column: 28, scope: !228)
!230 = !DILocation(line: 127, column: 18, scope: !228)
!231 = !DILocation(line: 127, column: 13, scope: !228)
!232 = !DILocation(line: 127, column: 21, scope: !228)
!233 = !DILocation(line: 128, column: 9, scope: !228)
!234 = !DILocation(line: 125, column: 35, scope: !223)
!235 = !DILocation(line: 125, column: 9, scope: !223)
!236 = distinct !{!236, !226, !237, !91}
!237 = !DILocation(line: 128, column: 9, scope: !220)
!238 = !DILocation(line: 129, column: 9, scope: !206)
!239 = !DILocation(line: 129, column: 21, scope: !206)
!240 = !DILocation(line: 130, column: 20, scope: !206)
!241 = !DILocation(line: 130, column: 9, scope: !206)
!242 = !DILocation(line: 132, column: 1, scope: !183)
