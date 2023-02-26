; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_06_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !33
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !37
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !38
  store i32 0, i32* %arrayidx2, align 4, !dbg !39
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !57
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !59
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx4, align 4, !dbg !61
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !63
  store i64 %call6, i64* %destLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !68
  %10 = load i64, i64* %destLen, align 8, !dbg !70
  %cmp = icmp ult i64 %9, %10, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !73
  %12 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !73
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !73
  %14 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !77
  store i32 %13, i32* %arrayidx8, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %15, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx9, align 4, !dbg !86
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  call void @printWLine(i32* noundef %arraydecay10), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_06_good() #0 !dbg !90 {
entry:
  call void @goodG2B1(), !dbg !91
  call void @goodG2B2(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* noundef null), !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 noundef %conv), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_06_good(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_06_bad(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 200, align 16, !dbg !119
  %1 = bitcast i8* %0 to i32*, !dbg !120
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = alloca i8, i64 400, align 16, !dbg !123
  %3 = bitcast i8* %2 to i32*, !dbg !124
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !122
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !125
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !126
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !129
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !130
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !131
  store i32 0, i32* %arrayidx2, align 4, !dbg !132
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !133
  store i32* %8, i32** %data, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !145
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx4, align 4, !dbg !147
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !149
  store i64 %call6, i64* %destLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !154
  %10 = load i64, i64* %destLen, align 8, !dbg !156
  %cmp = icmp ult i64 %9, %10, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !159
  %12 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !159
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !159
  %14 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !163
  store i32 %13, i32* %arrayidx8, align 4, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %15, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx9, align 4, !dbg !171
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  call void @printWLine(i32* noundef %arraydecay10), !dbg !173
  ret void, !dbg !174
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !175 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !176, metadata !DIExpression()), !dbg !177
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !178, metadata !DIExpression()), !dbg !179
  %0 = alloca i8, i64 200, align 16, !dbg !180
  %1 = bitcast i8* %0 to i32*, !dbg !181
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !179
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !182, metadata !DIExpression()), !dbg !183
  %2 = alloca i8, i64 400, align 16, !dbg !184
  %3 = bitcast i8* %2 to i32*, !dbg !185
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !183
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !186
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !187
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !188
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !188
  store i32 0, i32* %arrayidx, align 4, !dbg !189
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !190
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !191
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !192
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !192
  store i32 0, i32* %arrayidx2, align 4, !dbg !193
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !194
  store i32* %8, i32** %data, align 8, !dbg !197
  call void @llvm.dbg.declare(metadata i64* %i, metadata !198, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !201, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !203, metadata !DIExpression()), !dbg !204
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !205
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !206
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !207
  store i32 0, i32* %arrayidx4, align 4, !dbg !208
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !209
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !210
  store i64 %call6, i64* %destLen, align 8, !dbg !211
  store i64 0, i64* %i, align 8, !dbg !212
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !215
  %10 = load i64, i64* %destLen, align 8, !dbg !217
  %cmp = icmp ult i64 %9, %10, !dbg !218
  br i1 %cmp, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !220
  %12 = load i64, i64* %i, align 8, !dbg !222
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !220
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !220
  %14 = load i64, i64* %i, align 8, !dbg !223
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !224
  store i32 %13, i32* %arrayidx8, align 4, !dbg !225
  br label %for.inc, !dbg !226

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !227
  %inc = add i64 %15, 1, !dbg !227
  store i64 %inc, i64* %i, align 8, !dbg !227
  br label %for.cond, !dbg !228, !llvm.loop !229

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !231
  store i32 0, i32* %arrayidx9, align 4, !dbg !232
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !233
  call void @printWLine(i32* noundef %arraydecay10), !dbg !234
  ret void, !dbg !235
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_06_bad", scope: !18, file: !18, line: 27, type: !19, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 29, type: !3)
!23 = !DILocation(line: 29, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 30, type: !3)
!25 = !DILocation(line: 30, column: 15, scope: !17)
!26 = !DILocation(line: 30, column: 42, scope: !17)
!27 = !DILocation(line: 30, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 31, type: !3)
!29 = !DILocation(line: 31, column: 15, scope: !17)
!30 = !DILocation(line: 31, column: 43, scope: !17)
!31 = !DILocation(line: 31, column: 32, scope: !17)
!32 = !DILocation(line: 32, column: 13, scope: !17)
!33 = !DILocation(line: 32, column: 5, scope: !17)
!34 = !DILocation(line: 33, column: 5, scope: !17)
!35 = !DILocation(line: 33, column: 25, scope: !17)
!36 = !DILocation(line: 34, column: 13, scope: !17)
!37 = !DILocation(line: 34, column: 5, scope: !17)
!38 = !DILocation(line: 35, column: 5, scope: !17)
!39 = !DILocation(line: 35, column: 27, scope: !17)
!40 = !DILocation(line: 39, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !18, line: 37, column: 5)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 36, column: 8)
!43 = !DILocation(line: 39, column: 14, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !18, line: 42, type: !46)
!45 = distinct !DILexicalBlock(scope: !17, file: !18, line: 41, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !49)
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 42, column: 16, scope: !45)
!51 = !DILocalVariable(name: "destLen", scope: !45, file: !18, line: 42, type: !46)
!52 = !DILocation(line: 42, column: 19, scope: !45)
!53 = !DILocalVariable(name: "dest", scope: !45, file: !18, line: 43, type: !54)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 43, column: 17, scope: !45)
!58 = !DILocation(line: 44, column: 17, scope: !45)
!59 = !DILocation(line: 44, column: 9, scope: !45)
!60 = !DILocation(line: 45, column: 9, scope: !45)
!61 = !DILocation(line: 45, column: 21, scope: !45)
!62 = !DILocation(line: 46, column: 26, scope: !45)
!63 = !DILocation(line: 46, column: 19, scope: !45)
!64 = !DILocation(line: 46, column: 17, scope: !45)
!65 = !DILocation(line: 49, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !45, file: !18, line: 49, column: 9)
!67 = !DILocation(line: 49, column: 14, scope: !66)
!68 = !DILocation(line: 49, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !18, line: 49, column: 9)
!70 = !DILocation(line: 49, column: 25, scope: !69)
!71 = !DILocation(line: 49, column: 23, scope: !69)
!72 = !DILocation(line: 49, column: 9, scope: !66)
!73 = !DILocation(line: 51, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !18, line: 50, column: 9)
!75 = !DILocation(line: 51, column: 28, scope: !74)
!76 = !DILocation(line: 51, column: 18, scope: !74)
!77 = !DILocation(line: 51, column: 13, scope: !74)
!78 = !DILocation(line: 51, column: 21, scope: !74)
!79 = !DILocation(line: 52, column: 9, scope: !74)
!80 = !DILocation(line: 49, column: 35, scope: !69)
!81 = !DILocation(line: 49, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 52, column: 9, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 53, column: 9, scope: !45)
!86 = !DILocation(line: 53, column: 21, scope: !45)
!87 = !DILocation(line: 54, column: 20, scope: !45)
!88 = !DILocation(line: 54, column: 9, scope: !45)
!89 = !DILocation(line: 56, column: 1, scope: !17)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_06_good", scope: !18, file: !18, line: 131, type: !19, scopeLine: 132, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!91 = !DILocation(line: 133, column: 5, scope: !90)
!92 = !DILocation(line: 134, column: 5, scope: !90)
!93 = !DILocation(line: 135, column: 1, scope: !90)
!94 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 147, type: !95, scopeLine: 148, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!95 = !DISubroutineType(types: !96)
!96 = !{!8, !8, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !18, line: 147, type: !8)
!101 = !DILocation(line: 147, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !18, line: 147, type: !97)
!103 = !DILocation(line: 147, column: 27, scope: !94)
!104 = !DILocation(line: 150, column: 22, scope: !94)
!105 = !DILocation(line: 150, column: 12, scope: !94)
!106 = !DILocation(line: 150, column: 5, scope: !94)
!107 = !DILocation(line: 152, column: 5, scope: !94)
!108 = !DILocation(line: 153, column: 5, scope: !94)
!109 = !DILocation(line: 154, column: 5, scope: !94)
!110 = !DILocation(line: 157, column: 5, scope: !94)
!111 = !DILocation(line: 158, column: 5, scope: !94)
!112 = !DILocation(line: 159, column: 5, scope: !94)
!113 = !DILocation(line: 161, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 63, type: !19, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!115 = !DILocalVariable(name: "data", scope: !114, file: !18, line: 65, type: !3)
!116 = !DILocation(line: 65, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !18, line: 66, type: !3)
!118 = !DILocation(line: 66, column: 15, scope: !114)
!119 = !DILocation(line: 66, column: 42, scope: !114)
!120 = !DILocation(line: 66, column: 31, scope: !114)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !18, line: 67, type: !3)
!122 = !DILocation(line: 67, column: 15, scope: !114)
!123 = !DILocation(line: 67, column: 43, scope: !114)
!124 = !DILocation(line: 67, column: 32, scope: !114)
!125 = !DILocation(line: 68, column: 13, scope: !114)
!126 = !DILocation(line: 68, column: 5, scope: !114)
!127 = !DILocation(line: 69, column: 5, scope: !114)
!128 = !DILocation(line: 69, column: 25, scope: !114)
!129 = !DILocation(line: 70, column: 13, scope: !114)
!130 = !DILocation(line: 70, column: 5, scope: !114)
!131 = !DILocation(line: 71, column: 5, scope: !114)
!132 = !DILocation(line: 71, column: 27, scope: !114)
!133 = !DILocation(line: 80, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !135, file: !18, line: 78, column: 5)
!135 = distinct !DILexicalBlock(scope: !114, file: !18, line: 72, column: 8)
!136 = !DILocation(line: 80, column: 14, scope: !134)
!137 = !DILocalVariable(name: "i", scope: !138, file: !18, line: 83, type: !46)
!138 = distinct !DILexicalBlock(scope: !114, file: !18, line: 82, column: 5)
!139 = !DILocation(line: 83, column: 16, scope: !138)
!140 = !DILocalVariable(name: "destLen", scope: !138, file: !18, line: 83, type: !46)
!141 = !DILocation(line: 83, column: 19, scope: !138)
!142 = !DILocalVariable(name: "dest", scope: !138, file: !18, line: 84, type: !54)
!143 = !DILocation(line: 84, column: 17, scope: !138)
!144 = !DILocation(line: 85, column: 17, scope: !138)
!145 = !DILocation(line: 85, column: 9, scope: !138)
!146 = !DILocation(line: 86, column: 9, scope: !138)
!147 = !DILocation(line: 86, column: 21, scope: !138)
!148 = !DILocation(line: 87, column: 26, scope: !138)
!149 = !DILocation(line: 87, column: 19, scope: !138)
!150 = !DILocation(line: 87, column: 17, scope: !138)
!151 = !DILocation(line: 90, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !138, file: !18, line: 90, column: 9)
!153 = !DILocation(line: 90, column: 14, scope: !152)
!154 = !DILocation(line: 90, column: 21, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !18, line: 90, column: 9)
!156 = !DILocation(line: 90, column: 25, scope: !155)
!157 = !DILocation(line: 90, column: 23, scope: !155)
!158 = !DILocation(line: 90, column: 9, scope: !152)
!159 = !DILocation(line: 92, column: 23, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !18, line: 91, column: 9)
!161 = !DILocation(line: 92, column: 28, scope: !160)
!162 = !DILocation(line: 92, column: 18, scope: !160)
!163 = !DILocation(line: 92, column: 13, scope: !160)
!164 = !DILocation(line: 92, column: 21, scope: !160)
!165 = !DILocation(line: 93, column: 9, scope: !160)
!166 = !DILocation(line: 90, column: 35, scope: !155)
!167 = !DILocation(line: 90, column: 9, scope: !155)
!168 = distinct !{!168, !158, !169, !84}
!169 = !DILocation(line: 93, column: 9, scope: !152)
!170 = !DILocation(line: 94, column: 9, scope: !138)
!171 = !DILocation(line: 94, column: 21, scope: !138)
!172 = !DILocation(line: 95, column: 20, scope: !138)
!173 = !DILocation(line: 95, column: 9, scope: !138)
!174 = !DILocation(line: 97, column: 1, scope: !114)
!175 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 100, type: !19, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!176 = !DILocalVariable(name: "data", scope: !175, file: !18, line: 102, type: !3)
!177 = !DILocation(line: 102, column: 15, scope: !175)
!178 = !DILocalVariable(name: "dataBadBuffer", scope: !175, file: !18, line: 103, type: !3)
!179 = !DILocation(line: 103, column: 15, scope: !175)
!180 = !DILocation(line: 103, column: 42, scope: !175)
!181 = !DILocation(line: 103, column: 31, scope: !175)
!182 = !DILocalVariable(name: "dataGoodBuffer", scope: !175, file: !18, line: 104, type: !3)
!183 = !DILocation(line: 104, column: 15, scope: !175)
!184 = !DILocation(line: 104, column: 43, scope: !175)
!185 = !DILocation(line: 104, column: 32, scope: !175)
!186 = !DILocation(line: 105, column: 13, scope: !175)
!187 = !DILocation(line: 105, column: 5, scope: !175)
!188 = !DILocation(line: 106, column: 5, scope: !175)
!189 = !DILocation(line: 106, column: 25, scope: !175)
!190 = !DILocation(line: 107, column: 13, scope: !175)
!191 = !DILocation(line: 107, column: 5, scope: !175)
!192 = !DILocation(line: 108, column: 5, scope: !175)
!193 = !DILocation(line: 108, column: 27, scope: !175)
!194 = !DILocation(line: 112, column: 16, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !18, line: 110, column: 5)
!196 = distinct !DILexicalBlock(scope: !175, file: !18, line: 109, column: 8)
!197 = !DILocation(line: 112, column: 14, scope: !195)
!198 = !DILocalVariable(name: "i", scope: !199, file: !18, line: 115, type: !46)
!199 = distinct !DILexicalBlock(scope: !175, file: !18, line: 114, column: 5)
!200 = !DILocation(line: 115, column: 16, scope: !199)
!201 = !DILocalVariable(name: "destLen", scope: !199, file: !18, line: 115, type: !46)
!202 = !DILocation(line: 115, column: 19, scope: !199)
!203 = !DILocalVariable(name: "dest", scope: !199, file: !18, line: 116, type: !54)
!204 = !DILocation(line: 116, column: 17, scope: !199)
!205 = !DILocation(line: 117, column: 17, scope: !199)
!206 = !DILocation(line: 117, column: 9, scope: !199)
!207 = !DILocation(line: 118, column: 9, scope: !199)
!208 = !DILocation(line: 118, column: 21, scope: !199)
!209 = !DILocation(line: 119, column: 26, scope: !199)
!210 = !DILocation(line: 119, column: 19, scope: !199)
!211 = !DILocation(line: 119, column: 17, scope: !199)
!212 = !DILocation(line: 122, column: 16, scope: !213)
!213 = distinct !DILexicalBlock(scope: !199, file: !18, line: 122, column: 9)
!214 = !DILocation(line: 122, column: 14, scope: !213)
!215 = !DILocation(line: 122, column: 21, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !18, line: 122, column: 9)
!217 = !DILocation(line: 122, column: 25, scope: !216)
!218 = !DILocation(line: 122, column: 23, scope: !216)
!219 = !DILocation(line: 122, column: 9, scope: !213)
!220 = !DILocation(line: 124, column: 23, scope: !221)
!221 = distinct !DILexicalBlock(scope: !216, file: !18, line: 123, column: 9)
!222 = !DILocation(line: 124, column: 28, scope: !221)
!223 = !DILocation(line: 124, column: 18, scope: !221)
!224 = !DILocation(line: 124, column: 13, scope: !221)
!225 = !DILocation(line: 124, column: 21, scope: !221)
!226 = !DILocation(line: 125, column: 9, scope: !221)
!227 = !DILocation(line: 122, column: 35, scope: !216)
!228 = !DILocation(line: 122, column: 9, scope: !216)
!229 = distinct !{!229, !219, !230, !84}
!230 = !DILocation(line: 125, column: 9, scope: !213)
!231 = !DILocation(line: 126, column: 9, scope: !199)
!232 = !DILocation(line: 126, column: 21, scope: !199)
!233 = !DILocation(line: 127, column: 20, scope: !199)
!234 = !DILocation(line: 127, column: 9, scope: !199)
!235 = !DILocation(line: 129, column: 1, scope: !175)
