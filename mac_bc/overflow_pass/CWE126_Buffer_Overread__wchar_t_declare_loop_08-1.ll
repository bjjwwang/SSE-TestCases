; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_08_bad() #0 !dbg !11 {
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
  %call4 = call i32 @staticReturnsTrue(), !dbg !42
  %tobool = icmp ne i32 %call4, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i32* %arraydecay5, i32** %data, align 8, !dbg !47
  br label %if.end, !dbg !48

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !58, metadata !DIExpression()), !dbg !59
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !61
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx8, align 4, !dbg !63
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !65
  store i64 %call10, i64* %destLen, align 8, !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !70
  %1 = load i64, i64* %destLen, align 8, !dbg !72
  %cmp = icmp ult i64 %0, %1, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !75
  %3 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx11 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !75
  %4 = load i32, i32* %arrayidx11, align 4, !dbg !75
  %5 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !79
  store i32 %4, i32* %arrayidx12, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %6, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !87
  store i32 0, i32* %arrayidx13, align 4, !dbg !88
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !89
  call void @printWLine(i32* noundef %arraydecay14), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_08_good() #0 !dbg !92 {
entry:
  call void @goodG2B1(), !dbg !93
  call void @goodG2B2(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* noundef null), !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 noundef %conv), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_08_good(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_08_bad(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !116 {
entry:
  ret i32 1, !dbg !119
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !127
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !128
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !129
  store i32 0, i32* %arrayidx, align 4, !dbg !130
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !131
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !132
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx3, align 4, !dbg !134
  %call4 = call i32 @staticReturnsFalse(), !dbg !135
  %tobool = icmp ne i32 %call4, 0, !dbg !135
  br i1 %tobool, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !138
  br label %if.end, !dbg !140

if.else:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !141
  store i32* %arraydecay5, i32** %data, align 8, !dbg !143
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !151
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !152
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !153
  store i32 0, i32* %arrayidx8, align 4, !dbg !154
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !155
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !156
  store i64 %call10, i64* %destLen, align 8, !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !161
  %1 = load i64, i64* %destLen, align 8, !dbg !163
  %cmp = icmp ult i64 %0, %1, !dbg !164
  br i1 %cmp, label %for.body, label %for.end, !dbg !165

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !166
  %3 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx11 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !166
  %4 = load i32, i32* %arrayidx11, align 4, !dbg !166
  %5 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !170
  store i32 %4, i32* %arrayidx12, align 4, !dbg !171
  br label %for.inc, !dbg !172

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !173
  %inc = add i64 %6, 1, !dbg !173
  store i64 %inc, i64* %i, align 8, !dbg !173
  br label %for.cond, !dbg !174, !llvm.loop !175

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !177
  store i32 0, i32* %arrayidx13, align 4, !dbg !178
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !179
  call void @printWLine(i32* noundef %arraydecay14), !dbg !180
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !182 {
entry:
  ret i32 0, !dbg !183
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !184 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !185, metadata !DIExpression()), !dbg !186
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !187, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !189, metadata !DIExpression()), !dbg !190
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !191
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !192
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !193
  store i32 0, i32* %arrayidx, align 4, !dbg !194
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !195
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !196
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !197
  store i32 0, i32* %arrayidx3, align 4, !dbg !198
  %call4 = call i32 @staticReturnsTrue(), !dbg !199
  %tobool = icmp ne i32 %call4, 0, !dbg !199
  br i1 %tobool, label %if.then, label %if.end, !dbg !201

if.then:                                          ; preds = %entry
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !202
  store i32* %arraydecay5, i32** %data, align 8, !dbg !204
  br label %if.end, !dbg !205

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !206, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !209, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !211, metadata !DIExpression()), !dbg !212
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !213
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !214
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !215
  store i32 0, i32* %arrayidx8, align 4, !dbg !216
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !217
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !218
  store i64 %call10, i64* %destLen, align 8, !dbg !219
  store i64 0, i64* %i, align 8, !dbg !220
  br label %for.cond, !dbg !222

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !223
  %1 = load i64, i64* %destLen, align 8, !dbg !225
  %cmp = icmp ult i64 %0, %1, !dbg !226
  br i1 %cmp, label %for.body, label %for.end, !dbg !227

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !228
  %3 = load i64, i64* %i, align 8, !dbg !230
  %arrayidx11 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !228
  %4 = load i32, i32* %arrayidx11, align 4, !dbg !228
  %5 = load i64, i64* %i, align 8, !dbg !231
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !232
  store i32 %4, i32* %arrayidx12, align 4, !dbg !233
  br label %for.inc, !dbg !234

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !235
  %inc = add i64 %6, 1, !dbg !235
  store i64 %inc, i64* %i, align 8, !dbg !235
  br label %for.cond, !dbg !236, !llvm.loop !237

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !239
  store i32 0, i32* %arrayidx13, align 4, !dbg !240
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !241
  call void @printWLine(i32* noundef %arraydecay14), !dbg !242
  ret void, !dbg !243
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 39, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 40, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 41, column: 13, scope: !11)
!34 = !DILocation(line: 42, column: 13, scope: !11)
!35 = !DILocation(line: 42, column: 5, scope: !11)
!36 = !DILocation(line: 43, column: 5, scope: !11)
!37 = !DILocation(line: 43, column: 25, scope: !11)
!38 = !DILocation(line: 44, column: 13, scope: !11)
!39 = !DILocation(line: 44, column: 5, scope: !11)
!40 = !DILocation(line: 45, column: 5, scope: !11)
!41 = !DILocation(line: 45, column: 27, scope: !11)
!42 = !DILocation(line: 46, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 8)
!44 = !DILocation(line: 46, column: 8, scope: !11)
!45 = !DILocation(line: 49, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !12, line: 47, column: 5)
!47 = !DILocation(line: 49, column: 14, scope: !46)
!48 = !DILocation(line: 50, column: 5, scope: !46)
!49 = !DILocalVariable(name: "i", scope: !50, file: !12, line: 52, type: !51)
!50 = distinct !DILexicalBlock(scope: !11, file: !12, line: 51, column: 5)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 31, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !54)
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 52, column: 16, scope: !50)
!56 = !DILocalVariable(name: "destLen", scope: !50, file: !12, line: 52, type: !51)
!57 = !DILocation(line: 52, column: 19, scope: !50)
!58 = !DILocalVariable(name: "dest", scope: !50, file: !12, line: 53, type: !30)
!59 = !DILocation(line: 53, column: 17, scope: !50)
!60 = !DILocation(line: 54, column: 17, scope: !50)
!61 = !DILocation(line: 54, column: 9, scope: !50)
!62 = !DILocation(line: 55, column: 9, scope: !50)
!63 = !DILocation(line: 55, column: 21, scope: !50)
!64 = !DILocation(line: 56, column: 26, scope: !50)
!65 = !DILocation(line: 56, column: 19, scope: !50)
!66 = !DILocation(line: 56, column: 17, scope: !50)
!67 = !DILocation(line: 59, column: 16, scope: !68)
!68 = distinct !DILexicalBlock(scope: !50, file: !12, line: 59, column: 9)
!69 = !DILocation(line: 59, column: 14, scope: !68)
!70 = !DILocation(line: 59, column: 21, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !12, line: 59, column: 9)
!72 = !DILocation(line: 59, column: 25, scope: !71)
!73 = !DILocation(line: 59, column: 23, scope: !71)
!74 = !DILocation(line: 59, column: 9, scope: !68)
!75 = !DILocation(line: 61, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !12, line: 60, column: 9)
!77 = !DILocation(line: 61, column: 28, scope: !76)
!78 = !DILocation(line: 61, column: 18, scope: !76)
!79 = !DILocation(line: 61, column: 13, scope: !76)
!80 = !DILocation(line: 61, column: 21, scope: !76)
!81 = !DILocation(line: 62, column: 9, scope: !76)
!82 = !DILocation(line: 59, column: 35, scope: !71)
!83 = !DILocation(line: 59, column: 9, scope: !71)
!84 = distinct !{!84, !74, !85, !86}
!85 = !DILocation(line: 62, column: 9, scope: !68)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 63, column: 9, scope: !50)
!88 = !DILocation(line: 63, column: 21, scope: !50)
!89 = !DILocation(line: 64, column: 20, scope: !50)
!90 = !DILocation(line: 64, column: 9, scope: !50)
!91 = !DILocation(line: 66, column: 1, scope: !11)
!92 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_08_good", scope: !12, file: !12, line: 141, type: !13, scopeLine: 142, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DILocation(line: 143, column: 5, scope: !92)
!94 = !DILocation(line: 144, column: 5, scope: !92)
!95 = !DILocation(line: 145, column: 1, scope: !92)
!96 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 157, type: !97, scopeLine: 158, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DISubroutineType(types: !98)
!98 = !{!22, !22, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !12, line: 157, type: !22)
!103 = !DILocation(line: 157, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !12, line: 157, type: !99)
!105 = !DILocation(line: 157, column: 27, scope: !96)
!106 = !DILocation(line: 160, column: 22, scope: !96)
!107 = !DILocation(line: 160, column: 12, scope: !96)
!108 = !DILocation(line: 160, column: 5, scope: !96)
!109 = !DILocation(line: 162, column: 5, scope: !96)
!110 = !DILocation(line: 163, column: 5, scope: !96)
!111 = !DILocation(line: 164, column: 5, scope: !96)
!112 = !DILocation(line: 167, column: 5, scope: !96)
!113 = !DILocation(line: 168, column: 5, scope: !96)
!114 = !DILocation(line: 169, column: 5, scope: !96)
!115 = !DILocation(line: 171, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !117, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!117 = !DISubroutineType(types: !118)
!118 = !{!22}
!119 = !DILocation(line: 27, column: 5, scope: !116)
!120 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 73, type: !13, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 75, type: !17)
!122 = !DILocation(line: 75, column: 15, scope: !120)
!123 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !12, line: 76, type: !25)
!124 = !DILocation(line: 76, column: 13, scope: !120)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !120, file: !12, line: 77, type: !30)
!126 = !DILocation(line: 77, column: 13, scope: !120)
!127 = !DILocation(line: 78, column: 13, scope: !120)
!128 = !DILocation(line: 78, column: 5, scope: !120)
!129 = !DILocation(line: 79, column: 5, scope: !120)
!130 = !DILocation(line: 79, column: 25, scope: !120)
!131 = !DILocation(line: 80, column: 13, scope: !120)
!132 = !DILocation(line: 80, column: 5, scope: !120)
!133 = !DILocation(line: 81, column: 5, scope: !120)
!134 = !DILocation(line: 81, column: 27, scope: !120)
!135 = !DILocation(line: 82, column: 8, scope: !136)
!136 = distinct !DILexicalBlock(scope: !120, file: !12, line: 82, column: 8)
!137 = !DILocation(line: 82, column: 8, scope: !120)
!138 = !DILocation(line: 85, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !12, line: 83, column: 5)
!140 = !DILocation(line: 86, column: 5, scope: !139)
!141 = !DILocation(line: 90, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !12, line: 88, column: 5)
!143 = !DILocation(line: 90, column: 14, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !145, file: !12, line: 93, type: !51)
!145 = distinct !DILexicalBlock(scope: !120, file: !12, line: 92, column: 5)
!146 = !DILocation(line: 93, column: 16, scope: !145)
!147 = !DILocalVariable(name: "destLen", scope: !145, file: !12, line: 93, type: !51)
!148 = !DILocation(line: 93, column: 19, scope: !145)
!149 = !DILocalVariable(name: "dest", scope: !145, file: !12, line: 94, type: !30)
!150 = !DILocation(line: 94, column: 17, scope: !145)
!151 = !DILocation(line: 95, column: 17, scope: !145)
!152 = !DILocation(line: 95, column: 9, scope: !145)
!153 = !DILocation(line: 96, column: 9, scope: !145)
!154 = !DILocation(line: 96, column: 21, scope: !145)
!155 = !DILocation(line: 97, column: 26, scope: !145)
!156 = !DILocation(line: 97, column: 19, scope: !145)
!157 = !DILocation(line: 97, column: 17, scope: !145)
!158 = !DILocation(line: 100, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !145, file: !12, line: 100, column: 9)
!160 = !DILocation(line: 100, column: 14, scope: !159)
!161 = !DILocation(line: 100, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 100, column: 9)
!163 = !DILocation(line: 100, column: 25, scope: !162)
!164 = !DILocation(line: 100, column: 23, scope: !162)
!165 = !DILocation(line: 100, column: 9, scope: !159)
!166 = !DILocation(line: 102, column: 23, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !12, line: 101, column: 9)
!168 = !DILocation(line: 102, column: 28, scope: !167)
!169 = !DILocation(line: 102, column: 18, scope: !167)
!170 = !DILocation(line: 102, column: 13, scope: !167)
!171 = !DILocation(line: 102, column: 21, scope: !167)
!172 = !DILocation(line: 103, column: 9, scope: !167)
!173 = !DILocation(line: 100, column: 35, scope: !162)
!174 = !DILocation(line: 100, column: 9, scope: !162)
!175 = distinct !{!175, !165, !176, !86}
!176 = !DILocation(line: 103, column: 9, scope: !159)
!177 = !DILocation(line: 104, column: 9, scope: !145)
!178 = !DILocation(line: 104, column: 21, scope: !145)
!179 = !DILocation(line: 105, column: 20, scope: !145)
!180 = !DILocation(line: 105, column: 9, scope: !145)
!181 = !DILocation(line: 107, column: 1, scope: !120)
!182 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !117, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!183 = !DILocation(line: 32, column: 5, scope: !182)
!184 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 110, type: !13, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!185 = !DILocalVariable(name: "data", scope: !184, file: !12, line: 112, type: !17)
!186 = !DILocation(line: 112, column: 15, scope: !184)
!187 = !DILocalVariable(name: "dataBadBuffer", scope: !184, file: !12, line: 113, type: !25)
!188 = !DILocation(line: 113, column: 13, scope: !184)
!189 = !DILocalVariable(name: "dataGoodBuffer", scope: !184, file: !12, line: 114, type: !30)
!190 = !DILocation(line: 114, column: 13, scope: !184)
!191 = !DILocation(line: 115, column: 13, scope: !184)
!192 = !DILocation(line: 115, column: 5, scope: !184)
!193 = !DILocation(line: 116, column: 5, scope: !184)
!194 = !DILocation(line: 116, column: 25, scope: !184)
!195 = !DILocation(line: 117, column: 13, scope: !184)
!196 = !DILocation(line: 117, column: 5, scope: !184)
!197 = !DILocation(line: 118, column: 5, scope: !184)
!198 = !DILocation(line: 118, column: 27, scope: !184)
!199 = !DILocation(line: 119, column: 8, scope: !200)
!200 = distinct !DILexicalBlock(scope: !184, file: !12, line: 119, column: 8)
!201 = !DILocation(line: 119, column: 8, scope: !184)
!202 = !DILocation(line: 122, column: 16, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !12, line: 120, column: 5)
!204 = !DILocation(line: 122, column: 14, scope: !203)
!205 = !DILocation(line: 123, column: 5, scope: !203)
!206 = !DILocalVariable(name: "i", scope: !207, file: !12, line: 125, type: !51)
!207 = distinct !DILexicalBlock(scope: !184, file: !12, line: 124, column: 5)
!208 = !DILocation(line: 125, column: 16, scope: !207)
!209 = !DILocalVariable(name: "destLen", scope: !207, file: !12, line: 125, type: !51)
!210 = !DILocation(line: 125, column: 19, scope: !207)
!211 = !DILocalVariable(name: "dest", scope: !207, file: !12, line: 126, type: !30)
!212 = !DILocation(line: 126, column: 17, scope: !207)
!213 = !DILocation(line: 127, column: 17, scope: !207)
!214 = !DILocation(line: 127, column: 9, scope: !207)
!215 = !DILocation(line: 128, column: 9, scope: !207)
!216 = !DILocation(line: 128, column: 21, scope: !207)
!217 = !DILocation(line: 129, column: 26, scope: !207)
!218 = !DILocation(line: 129, column: 19, scope: !207)
!219 = !DILocation(line: 129, column: 17, scope: !207)
!220 = !DILocation(line: 132, column: 16, scope: !221)
!221 = distinct !DILexicalBlock(scope: !207, file: !12, line: 132, column: 9)
!222 = !DILocation(line: 132, column: 14, scope: !221)
!223 = !DILocation(line: 132, column: 21, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !12, line: 132, column: 9)
!225 = !DILocation(line: 132, column: 25, scope: !224)
!226 = !DILocation(line: 132, column: 23, scope: !224)
!227 = !DILocation(line: 132, column: 9, scope: !221)
!228 = !DILocation(line: 134, column: 23, scope: !229)
!229 = distinct !DILexicalBlock(scope: !224, file: !12, line: 133, column: 9)
!230 = !DILocation(line: 134, column: 28, scope: !229)
!231 = !DILocation(line: 134, column: 18, scope: !229)
!232 = !DILocation(line: 134, column: 13, scope: !229)
!233 = !DILocation(line: 134, column: 21, scope: !229)
!234 = !DILocation(line: 135, column: 9, scope: !229)
!235 = !DILocation(line: 132, column: 35, scope: !224)
!236 = !DILocation(line: 132, column: 9, scope: !224)
!237 = distinct !{!237, !227, !238, !86}
!238 = !DILocation(line: 135, column: 9, scope: !221)
!239 = !DILocation(line: 136, column: 9, scope: !207)
!240 = !DILocation(line: 136, column: 21, scope: !207)
!241 = !DILocation(line: 137, column: 20, scope: !207)
!242 = !DILocation(line: 137, column: 9, scope: !207)
!243 = !DILocation(line: 139, column: 1, scope: !184)
