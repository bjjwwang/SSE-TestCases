; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_05_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 200, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 400, align 16, !dbg !35
  %3 = bitcast i8* %2 to i32*, !dbg !36
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !34
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !38
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !41
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !42
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !43
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !43
  store i32 0, i32* %arrayidx2, align 4, !dbg !44
  %8 = load i32, i32* @staticTrue, align 4, !dbg !45
  %tobool = icmp ne i32 %8, 0, !dbg !45
  br i1 %tobool, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !48
  store i32* %9, i32** %data, align 8, !dbg !50
  br label %if.end, !dbg !51

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !61, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !67
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx4, align 4, !dbg !69
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !71
  store i64 %call6, i64* %destLen, align 8, !dbg !72
  store i64 0, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !75

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !76
  %11 = load i64, i64* %destLen, align 8, !dbg !78
  %cmp = icmp ult i64 %10, %11, !dbg !79
  br i1 %cmp, label %for.body, label %for.end, !dbg !80

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !81
  %13 = load i64, i64* %i, align 8, !dbg !83
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !81
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !81
  %15 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !85
  store i32 %14, i32* %arrayidx8, align 4, !dbg !86
  br label %for.inc, !dbg !87

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !88
  %inc = add i64 %16, 1, !dbg !88
  store i64 %inc, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !89, !llvm.loop !90

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !93
  store i32 0, i32* %arrayidx9, align 4, !dbg !94
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !95
  call void @printWLine(i32* noundef %arraydecay10), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_05_good() #0 !dbg !98 {
entry:
  call void @goodG2B1(), !dbg !99
  call void @goodG2B2(), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !108, metadata !DIExpression()), !dbg !109
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !110, metadata !DIExpression()), !dbg !111
  %call = call i64 @time(i64* noundef null), !dbg !112
  %conv = trunc i64 %call to i32, !dbg !113
  call void @srand(i32 noundef %conv), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !115
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_05_good(), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !117
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !118
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_05_bad(), !dbg !119
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !120
  ret i32 0, !dbg !121
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !122 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = alloca i8, i64 200, align 16, !dbg !127
  %1 = bitcast i8* %0 to i32*, !dbg !128
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !129, metadata !DIExpression()), !dbg !130
  %2 = alloca i8, i64 400, align 16, !dbg !131
  %3 = bitcast i8* %2 to i32*, !dbg !132
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !130
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !133
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !134
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !135
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !135
  store i32 0, i32* %arrayidx, align 4, !dbg !136
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !137
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !138
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !139
  store i32 0, i32* %arrayidx2, align 4, !dbg !140
  %8 = load i32, i32* @staticFalse, align 4, !dbg !141
  %tobool = icmp ne i32 %8, 0, !dbg !141
  br i1 %tobool, label %if.then, label %if.else, !dbg !143

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !144
  br label %if.end, !dbg !146

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !147
  store i32* %9, i32** %data, align 8, !dbg !149
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !155, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !158
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !159
  store i32 0, i32* %arrayidx4, align 4, !dbg !160
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !162
  store i64 %call6, i64* %destLen, align 8, !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !167
  %11 = load i64, i64* %destLen, align 8, !dbg !169
  %cmp = icmp ult i64 %10, %11, !dbg !170
  br i1 %cmp, label %for.body, label %for.end, !dbg !171

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !172
  %13 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !172
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !172
  %15 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !176
  store i32 %14, i32* %arrayidx8, align 4, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !179
  %inc = add i64 %16, 1, !dbg !179
  store i64 %inc, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !183
  store i32 0, i32* %arrayidx9, align 4, !dbg !184
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !185
  call void @printWLine(i32* noundef %arraydecay10), !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !188 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !191, metadata !DIExpression()), !dbg !192
  %0 = alloca i8, i64 200, align 16, !dbg !193
  %1 = bitcast i8* %0 to i32*, !dbg !194
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !192
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !195, metadata !DIExpression()), !dbg !196
  %2 = alloca i8, i64 400, align 16, !dbg !197
  %3 = bitcast i8* %2 to i32*, !dbg !198
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !196
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !199
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !200
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !201
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !201
  store i32 0, i32* %arrayidx, align 4, !dbg !202
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !203
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !204
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !205
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !205
  store i32 0, i32* %arrayidx2, align 4, !dbg !206
  %8 = load i32, i32* @staticTrue, align 4, !dbg !207
  %tobool = icmp ne i32 %8, 0, !dbg !207
  br i1 %tobool, label %if.then, label %if.end, !dbg !209

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !210
  store i32* %9, i32** %data, align 8, !dbg !212
  br label %if.end, !dbg !213

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !214, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !219, metadata !DIExpression()), !dbg !220
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !221
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !222
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !223
  store i32 0, i32* %arrayidx4, align 4, !dbg !224
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !225
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !226
  store i64 %call6, i64* %destLen, align 8, !dbg !227
  store i64 0, i64* %i, align 8, !dbg !228
  br label %for.cond, !dbg !230

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i64, i64* %i, align 8, !dbg !231
  %11 = load i64, i64* %destLen, align 8, !dbg !233
  %cmp = icmp ult i64 %10, %11, !dbg !234
  br i1 %cmp, label %for.body, label %for.end, !dbg !235

for.body:                                         ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !236
  %13 = load i64, i64* %i, align 8, !dbg !238
  %arrayidx7 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !236
  %14 = load i32, i32* %arrayidx7, align 4, !dbg !236
  %15 = load i64, i64* %i, align 8, !dbg !239
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %15, !dbg !240
  store i32 %14, i32* %arrayidx8, align 4, !dbg !241
  br label %for.inc, !dbg !242

for.inc:                                          ; preds = %for.body
  %16 = load i64, i64* %i, align 8, !dbg !243
  %inc = add i64 %16, 1, !dbg !243
  store i64 %inc, i64* %i, align 8, !dbg !243
  br label %for.cond, !dbg !244, !llvm.loop !245

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !247
  store i32 0, i32* %arrayidx9, align 4, !dbg !248
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !249
  call void @printWLine(i32* noundef %arraydecay10), !dbg !250
  ret void, !dbg !251
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_05_bad", scope: !15, file: !15, line: 30, type: !24, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 32, type: !5)
!28 = !DILocation(line: 32, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !15, line: 33, type: !5)
!30 = !DILocation(line: 33, column: 15, scope: !23)
!31 = !DILocation(line: 33, column: 42, scope: !23)
!32 = !DILocation(line: 33, column: 31, scope: !23)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !15, line: 34, type: !5)
!34 = !DILocation(line: 34, column: 15, scope: !23)
!35 = !DILocation(line: 34, column: 43, scope: !23)
!36 = !DILocation(line: 34, column: 32, scope: !23)
!37 = !DILocation(line: 35, column: 13, scope: !23)
!38 = !DILocation(line: 35, column: 5, scope: !23)
!39 = !DILocation(line: 36, column: 5, scope: !23)
!40 = !DILocation(line: 36, column: 25, scope: !23)
!41 = !DILocation(line: 37, column: 13, scope: !23)
!42 = !DILocation(line: 37, column: 5, scope: !23)
!43 = !DILocation(line: 38, column: 5, scope: !23)
!44 = !DILocation(line: 38, column: 27, scope: !23)
!45 = !DILocation(line: 39, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !23, file: !15, line: 39, column: 8)
!47 = !DILocation(line: 39, column: 8, scope: !23)
!48 = !DILocation(line: 42, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !15, line: 40, column: 5)
!50 = !DILocation(line: 42, column: 14, scope: !49)
!51 = !DILocation(line: 43, column: 5, scope: !49)
!52 = !DILocalVariable(name: "i", scope: !53, file: !15, line: 45, type: !54)
!53 = distinct !DILexicalBlock(scope: !23, file: !15, line: 44, column: 5)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 31, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !9, line: 94, baseType: !57)
!57 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 45, column: 16, scope: !53)
!59 = !DILocalVariable(name: "destLen", scope: !53, file: !15, line: 45, type: !54)
!60 = !DILocation(line: 45, column: 19, scope: !53)
!61 = !DILocalVariable(name: "dest", scope: !53, file: !15, line: 46, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 100)
!65 = !DILocation(line: 46, column: 17, scope: !53)
!66 = !DILocation(line: 47, column: 17, scope: !53)
!67 = !DILocation(line: 47, column: 9, scope: !53)
!68 = !DILocation(line: 48, column: 9, scope: !53)
!69 = !DILocation(line: 48, column: 21, scope: !53)
!70 = !DILocation(line: 49, column: 26, scope: !53)
!71 = !DILocation(line: 49, column: 19, scope: !53)
!72 = !DILocation(line: 49, column: 17, scope: !53)
!73 = !DILocation(line: 52, column: 16, scope: !74)
!74 = distinct !DILexicalBlock(scope: !53, file: !15, line: 52, column: 9)
!75 = !DILocation(line: 52, column: 14, scope: !74)
!76 = !DILocation(line: 52, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !15, line: 52, column: 9)
!78 = !DILocation(line: 52, column: 25, scope: !77)
!79 = !DILocation(line: 52, column: 23, scope: !77)
!80 = !DILocation(line: 52, column: 9, scope: !74)
!81 = !DILocation(line: 54, column: 23, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !15, line: 53, column: 9)
!83 = !DILocation(line: 54, column: 28, scope: !82)
!84 = !DILocation(line: 54, column: 18, scope: !82)
!85 = !DILocation(line: 54, column: 13, scope: !82)
!86 = !DILocation(line: 54, column: 21, scope: !82)
!87 = !DILocation(line: 55, column: 9, scope: !82)
!88 = !DILocation(line: 52, column: 35, scope: !77)
!89 = !DILocation(line: 52, column: 9, scope: !77)
!90 = distinct !{!90, !80, !91, !92}
!91 = !DILocation(line: 55, column: 9, scope: !74)
!92 = !{!"llvm.loop.mustprogress"}
!93 = !DILocation(line: 56, column: 9, scope: !53)
!94 = !DILocation(line: 56, column: 21, scope: !53)
!95 = !DILocation(line: 57, column: 20, scope: !53)
!96 = !DILocation(line: 57, column: 9, scope: !53)
!97 = !DILocation(line: 59, column: 1, scope: !23)
!98 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_05_good", scope: !15, file: !15, line: 134, type: !24, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!99 = !DILocation(line: 136, column: 5, scope: !98)
!100 = !DILocation(line: 137, column: 5, scope: !98)
!101 = !DILocation(line: 138, column: 1, scope: !98)
!102 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 150, type: !103, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!103 = !DISubroutineType(types: !104)
!104 = !{!10, !10, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!108 = !DILocalVariable(name: "argc", arg: 1, scope: !102, file: !15, line: 150, type: !10)
!109 = !DILocation(line: 150, column: 14, scope: !102)
!110 = !DILocalVariable(name: "argv", arg: 2, scope: !102, file: !15, line: 150, type: !105)
!111 = !DILocation(line: 150, column: 27, scope: !102)
!112 = !DILocation(line: 153, column: 22, scope: !102)
!113 = !DILocation(line: 153, column: 12, scope: !102)
!114 = !DILocation(line: 153, column: 5, scope: !102)
!115 = !DILocation(line: 155, column: 5, scope: !102)
!116 = !DILocation(line: 156, column: 5, scope: !102)
!117 = !DILocation(line: 157, column: 5, scope: !102)
!118 = !DILocation(line: 160, column: 5, scope: !102)
!119 = !DILocation(line: 161, column: 5, scope: !102)
!120 = !DILocation(line: 162, column: 5, scope: !102)
!121 = !DILocation(line: 164, column: 5, scope: !102)
!122 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 66, type: !24, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!123 = !DILocalVariable(name: "data", scope: !122, file: !15, line: 68, type: !5)
!124 = !DILocation(line: 68, column: 15, scope: !122)
!125 = !DILocalVariable(name: "dataBadBuffer", scope: !122, file: !15, line: 69, type: !5)
!126 = !DILocation(line: 69, column: 15, scope: !122)
!127 = !DILocation(line: 69, column: 42, scope: !122)
!128 = !DILocation(line: 69, column: 31, scope: !122)
!129 = !DILocalVariable(name: "dataGoodBuffer", scope: !122, file: !15, line: 70, type: !5)
!130 = !DILocation(line: 70, column: 15, scope: !122)
!131 = !DILocation(line: 70, column: 43, scope: !122)
!132 = !DILocation(line: 70, column: 32, scope: !122)
!133 = !DILocation(line: 71, column: 13, scope: !122)
!134 = !DILocation(line: 71, column: 5, scope: !122)
!135 = !DILocation(line: 72, column: 5, scope: !122)
!136 = !DILocation(line: 72, column: 25, scope: !122)
!137 = !DILocation(line: 73, column: 13, scope: !122)
!138 = !DILocation(line: 73, column: 5, scope: !122)
!139 = !DILocation(line: 74, column: 5, scope: !122)
!140 = !DILocation(line: 74, column: 27, scope: !122)
!141 = !DILocation(line: 75, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !122, file: !15, line: 75, column: 8)
!143 = !DILocation(line: 75, column: 8, scope: !122)
!144 = !DILocation(line: 78, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !15, line: 76, column: 5)
!146 = !DILocation(line: 79, column: 5, scope: !145)
!147 = !DILocation(line: 83, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !15, line: 81, column: 5)
!149 = !DILocation(line: 83, column: 14, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !151, file: !15, line: 86, type: !54)
!151 = distinct !DILexicalBlock(scope: !122, file: !15, line: 85, column: 5)
!152 = !DILocation(line: 86, column: 16, scope: !151)
!153 = !DILocalVariable(name: "destLen", scope: !151, file: !15, line: 86, type: !54)
!154 = !DILocation(line: 86, column: 19, scope: !151)
!155 = !DILocalVariable(name: "dest", scope: !151, file: !15, line: 87, type: !62)
!156 = !DILocation(line: 87, column: 17, scope: !151)
!157 = !DILocation(line: 88, column: 17, scope: !151)
!158 = !DILocation(line: 88, column: 9, scope: !151)
!159 = !DILocation(line: 89, column: 9, scope: !151)
!160 = !DILocation(line: 89, column: 21, scope: !151)
!161 = !DILocation(line: 90, column: 26, scope: !151)
!162 = !DILocation(line: 90, column: 19, scope: !151)
!163 = !DILocation(line: 90, column: 17, scope: !151)
!164 = !DILocation(line: 93, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !151, file: !15, line: 93, column: 9)
!166 = !DILocation(line: 93, column: 14, scope: !165)
!167 = !DILocation(line: 93, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !15, line: 93, column: 9)
!169 = !DILocation(line: 93, column: 25, scope: !168)
!170 = !DILocation(line: 93, column: 23, scope: !168)
!171 = !DILocation(line: 93, column: 9, scope: !165)
!172 = !DILocation(line: 95, column: 23, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !15, line: 94, column: 9)
!174 = !DILocation(line: 95, column: 28, scope: !173)
!175 = !DILocation(line: 95, column: 18, scope: !173)
!176 = !DILocation(line: 95, column: 13, scope: !173)
!177 = !DILocation(line: 95, column: 21, scope: !173)
!178 = !DILocation(line: 96, column: 9, scope: !173)
!179 = !DILocation(line: 93, column: 35, scope: !168)
!180 = !DILocation(line: 93, column: 9, scope: !168)
!181 = distinct !{!181, !171, !182, !92}
!182 = !DILocation(line: 96, column: 9, scope: !165)
!183 = !DILocation(line: 97, column: 9, scope: !151)
!184 = !DILocation(line: 97, column: 21, scope: !151)
!185 = !DILocation(line: 98, column: 20, scope: !151)
!186 = !DILocation(line: 98, column: 9, scope: !151)
!187 = !DILocation(line: 100, column: 1, scope: !122)
!188 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 103, type: !24, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!189 = !DILocalVariable(name: "data", scope: !188, file: !15, line: 105, type: !5)
!190 = !DILocation(line: 105, column: 15, scope: !188)
!191 = !DILocalVariable(name: "dataBadBuffer", scope: !188, file: !15, line: 106, type: !5)
!192 = !DILocation(line: 106, column: 15, scope: !188)
!193 = !DILocation(line: 106, column: 42, scope: !188)
!194 = !DILocation(line: 106, column: 31, scope: !188)
!195 = !DILocalVariable(name: "dataGoodBuffer", scope: !188, file: !15, line: 107, type: !5)
!196 = !DILocation(line: 107, column: 15, scope: !188)
!197 = !DILocation(line: 107, column: 43, scope: !188)
!198 = !DILocation(line: 107, column: 32, scope: !188)
!199 = !DILocation(line: 108, column: 13, scope: !188)
!200 = !DILocation(line: 108, column: 5, scope: !188)
!201 = !DILocation(line: 109, column: 5, scope: !188)
!202 = !DILocation(line: 109, column: 25, scope: !188)
!203 = !DILocation(line: 110, column: 13, scope: !188)
!204 = !DILocation(line: 110, column: 5, scope: !188)
!205 = !DILocation(line: 111, column: 5, scope: !188)
!206 = !DILocation(line: 111, column: 27, scope: !188)
!207 = !DILocation(line: 112, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !188, file: !15, line: 112, column: 8)
!209 = !DILocation(line: 112, column: 8, scope: !188)
!210 = !DILocation(line: 115, column: 16, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !15, line: 113, column: 5)
!212 = !DILocation(line: 115, column: 14, scope: !211)
!213 = !DILocation(line: 116, column: 5, scope: !211)
!214 = !DILocalVariable(name: "i", scope: !215, file: !15, line: 118, type: !54)
!215 = distinct !DILexicalBlock(scope: !188, file: !15, line: 117, column: 5)
!216 = !DILocation(line: 118, column: 16, scope: !215)
!217 = !DILocalVariable(name: "destLen", scope: !215, file: !15, line: 118, type: !54)
!218 = !DILocation(line: 118, column: 19, scope: !215)
!219 = !DILocalVariable(name: "dest", scope: !215, file: !15, line: 119, type: !62)
!220 = !DILocation(line: 119, column: 17, scope: !215)
!221 = !DILocation(line: 120, column: 17, scope: !215)
!222 = !DILocation(line: 120, column: 9, scope: !215)
!223 = !DILocation(line: 121, column: 9, scope: !215)
!224 = !DILocation(line: 121, column: 21, scope: !215)
!225 = !DILocation(line: 122, column: 26, scope: !215)
!226 = !DILocation(line: 122, column: 19, scope: !215)
!227 = !DILocation(line: 122, column: 17, scope: !215)
!228 = !DILocation(line: 125, column: 16, scope: !229)
!229 = distinct !DILexicalBlock(scope: !215, file: !15, line: 125, column: 9)
!230 = !DILocation(line: 125, column: 14, scope: !229)
!231 = !DILocation(line: 125, column: 21, scope: !232)
!232 = distinct !DILexicalBlock(scope: !229, file: !15, line: 125, column: 9)
!233 = !DILocation(line: 125, column: 25, scope: !232)
!234 = !DILocation(line: 125, column: 23, scope: !232)
!235 = !DILocation(line: 125, column: 9, scope: !229)
!236 = !DILocation(line: 127, column: 23, scope: !237)
!237 = distinct !DILexicalBlock(scope: !232, file: !15, line: 126, column: 9)
!238 = !DILocation(line: 127, column: 28, scope: !237)
!239 = !DILocation(line: 127, column: 18, scope: !237)
!240 = !DILocation(line: 127, column: 13, scope: !237)
!241 = !DILocation(line: 127, column: 21, scope: !237)
!242 = !DILocation(line: 128, column: 9, scope: !237)
!243 = !DILocation(line: 125, column: 35, scope: !232)
!244 = !DILocation(line: 125, column: 9, scope: !232)
!245 = distinct !{!245, !235, !246, !92}
!246 = !DILocation(line: 128, column: 9, scope: !229)
!247 = !DILocation(line: 129, column: 9, scope: !215)
!248 = !DILocation(line: 129, column: 21, scope: !215)
!249 = !DILocation(line: 130, column: 20, scope: !215)
!250 = !DILocation(line: 130, column: 9, scope: !215)
!251 = !DILocation(line: 132, column: 1, scope: !188)
