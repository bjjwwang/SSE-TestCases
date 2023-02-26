; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_bad() #0 !dbg !25 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 400, align 16, !dbg !33
  %1 = bitcast i8* %0 to i32*, !dbg !34
  store i32* %1, i32** %dataBuffer, align 8, !dbg !32
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !35
  store i32* %2, i32** %data, align 8, !dbg !36
  store i32 1, i32* @badStatic, align 4, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i32* @badSource(i32* noundef %3), !dbg !39
  store i32* %call, i32** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !53, metadata !DIExpression()), !dbg !54
  %5 = load i32*, i32** %data, align 8, !dbg !55
  %call1 = call i64 @wcslen(i32* noundef %5), !dbg !56
  store i64 %call1, i64* %dataLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !61
  %7 = load i64, i64* %dataLen, align 8, !dbg !63
  %cmp = icmp ult i64 %6, %7, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !66
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !66
  %10 = load i32, i32* %arrayidx, align 4, !dbg !66
  %11 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !70
  store i32 %10, i32* %arrayidx2, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %12, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !78
  store i32 0, i32* %arrayidx3, align 4, !dbg !79
  %13 = load i32*, i32** %data, align 8, !dbg !80
  call void @printWLine(i32* noundef %13), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @badSource(i32* noundef %data) #0 !dbg !83 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = load i32, i32* @badStatic, align 4, !dbg !88
  %tobool = icmp ne i32 %0, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !91
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 99), !dbg !93
  %2 = load i32*, i32** %data.addr, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end, !dbg !96

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !97
  ret i32* %3, !dbg !98
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_good() #0 !dbg !99 {
entry:
  call void @goodG2B1(), !dbg !100
  call void @goodG2B2(), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !103 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !109, metadata !DIExpression()), !dbg !110
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !111, metadata !DIExpression()), !dbg !112
  %call = call i64 @time(i64* noundef null), !dbg !113
  %conv = trunc i64 %call to i32, !dbg !114
  call void @srand(i32 noundef %conv), !dbg !115
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !116
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_good(), !dbg !117
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !118
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !119
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_bad(), !dbg !120
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !121
  ret i32 0, !dbg !122
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !123 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %0 = alloca i8, i64 400, align 16, !dbg !128
  %1 = bitcast i8* %0 to i32*, !dbg !129
  store i32* %1, i32** %dataBuffer, align 8, !dbg !127
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !130
  store i32* %2, i32** %data, align 8, !dbg !131
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !132
  %3 = load i32*, i32** %data, align 8, !dbg !133
  %call = call i32* @goodG2B1Source(i32* noundef %3), !dbg !134
  store i32* %call, i32** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !141, metadata !DIExpression()), !dbg !142
  %5 = load i32*, i32** %data, align 8, !dbg !143
  %call1 = call i64 @wcslen(i32* noundef %5), !dbg !144
  store i64 %call1, i64* %dataLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !149
  %7 = load i64, i64* %dataLen, align 8, !dbg !151
  %cmp = icmp ult i64 %6, %7, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !154
  %9 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !154
  %10 = load i32, i32* %arrayidx, align 4, !dbg !154
  %11 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !158
  store i32 %10, i32* %arrayidx2, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %12, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !165
  store i32 0, i32* %arrayidx3, align 4, !dbg !166
  %13 = load i32*, i32** %data, align 8, !dbg !167
  call void @printWLine(i32* noundef %13), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2B1Source(i32* noundef %data) #0 !dbg !170 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !171, metadata !DIExpression()), !dbg !172
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !173
  %tobool = icmp ne i32 %0, 0, !dbg !173
  br i1 %tobool, label %if.then, label %if.else, !dbg !175

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !176
  br label %if.end, !dbg !178

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !179
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !181
  %2 = load i32*, i32** %data.addr, align 8, !dbg !182
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !182
  store i32 0, i32* %arrayidx, align 4, !dbg !183
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !184
  ret i32* %3, !dbg !185
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !186 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !187, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !189, metadata !DIExpression()), !dbg !190
  %0 = alloca i8, i64 400, align 16, !dbg !191
  %1 = bitcast i8* %0 to i32*, !dbg !192
  store i32* %1, i32** %dataBuffer, align 8, !dbg !190
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !193
  store i32* %2, i32** %data, align 8, !dbg !194
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !195
  %3 = load i32*, i32** %data, align 8, !dbg !196
  %call = call i32* @goodG2B2Source(i32* noundef %3), !dbg !197
  store i32* %call, i32** %data, align 8, !dbg !198
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !199, metadata !DIExpression()), !dbg !201
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !201
  call void @llvm.dbg.declare(metadata i64* %i, metadata !202, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !204, metadata !DIExpression()), !dbg !205
  %5 = load i32*, i32** %data, align 8, !dbg !206
  %call1 = call i64 @wcslen(i32* noundef %5), !dbg !207
  store i64 %call1, i64* %dataLen, align 8, !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !212
  %7 = load i64, i64* %dataLen, align 8, !dbg !214
  %cmp = icmp ult i64 %6, %7, !dbg !215
  br i1 %cmp, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !217
  %9 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !217
  %10 = load i32, i32* %arrayidx, align 4, !dbg !217
  %11 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !221
  store i32 %10, i32* %arrayidx2, align 4, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !224
  %inc = add i64 %12, 1, !dbg !224
  store i64 %inc, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !228
  store i32 0, i32* %arrayidx3, align 4, !dbg !229
  %13 = load i32*, i32** %data, align 8, !dbg !230
  call void @printWLine(i32* noundef %13), !dbg !231
  ret void, !dbg !232
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32* @goodG2B2Source(i32* noundef %data) #0 !dbg !233 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !234, metadata !DIExpression()), !dbg !235
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !236
  %tobool = icmp ne i32 %0, 0, !dbg !236
  br i1 %tobool, label %if.then, label %if.end, !dbg !238

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !239
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !241
  %2 = load i32*, i32** %data.addr, align 8, !dbg !242
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !242
  store i32 0, i32* %arrayidx, align 4, !dbg !243
  br label %if.end, !dbg !244

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !245
  ret i32* %3, !dbg !246
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !15, line: 24, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13, !16}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !15, line: 63, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !15, line: 64, type: !10, isLocal: true, isDefinition: true)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Homebrew clang version 14.0.6"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_bad", scope: !15, file: !15, line: 37, type: !26, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !15, line: 39, type: !5)
!30 = !DILocation(line: 39, column: 15, scope: !25)
!31 = !DILocalVariable(name: "dataBuffer", scope: !25, file: !15, line: 40, type: !5)
!32 = !DILocation(line: 40, column: 15, scope: !25)
!33 = !DILocation(line: 40, column: 39, scope: !25)
!34 = !DILocation(line: 40, column: 28, scope: !25)
!35 = !DILocation(line: 41, column: 12, scope: !25)
!36 = !DILocation(line: 41, column: 10, scope: !25)
!37 = !DILocation(line: 42, column: 15, scope: !25)
!38 = !DILocation(line: 43, column: 22, scope: !25)
!39 = !DILocation(line: 43, column: 12, scope: !25)
!40 = !DILocation(line: 43, column: 10, scope: !25)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !15, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !25, file: !15, line: 44, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 45, column: 17, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !15, line: 46, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !9, line: 94, baseType: !51)
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 46, column: 16, scope: !42)
!53 = !DILocalVariable(name: "dataLen", scope: !42, file: !15, line: 46, type: !48)
!54 = !DILocation(line: 46, column: 19, scope: !42)
!55 = !DILocation(line: 47, column: 26, scope: !42)
!56 = !DILocation(line: 47, column: 19, scope: !42)
!57 = !DILocation(line: 47, column: 17, scope: !42)
!58 = !DILocation(line: 49, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !42, file: !15, line: 49, column: 9)
!60 = !DILocation(line: 49, column: 14, scope: !59)
!61 = !DILocation(line: 49, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !15, line: 49, column: 9)
!63 = !DILocation(line: 49, column: 25, scope: !62)
!64 = !DILocation(line: 49, column: 23, scope: !62)
!65 = !DILocation(line: 49, column: 9, scope: !59)
!66 = !DILocation(line: 51, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !15, line: 50, column: 9)
!68 = !DILocation(line: 51, column: 28, scope: !67)
!69 = !DILocation(line: 51, column: 18, scope: !67)
!70 = !DILocation(line: 51, column: 13, scope: !67)
!71 = !DILocation(line: 51, column: 21, scope: !67)
!72 = !DILocation(line: 52, column: 9, scope: !67)
!73 = !DILocation(line: 49, column: 35, scope: !62)
!74 = !DILocation(line: 49, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 52, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 53, column: 9, scope: !42)
!79 = !DILocation(line: 53, column: 20, scope: !42)
!80 = !DILocation(line: 54, column: 20, scope: !42)
!81 = !DILocation(line: 54, column: 9, scope: !42)
!82 = !DILocation(line: 56, column: 1, scope: !25)
!83 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 26, type: !84, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!84 = !DISubroutineType(types: !85)
!85 = !{!5, !5}
!86 = !DILocalVariable(name: "data", arg: 1, scope: !83, file: !15, line: 26, type: !5)
!87 = !DILocation(line: 26, column: 38, scope: !83)
!88 = !DILocation(line: 28, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !15, line: 28, column: 8)
!90 = !DILocation(line: 28, column: 8, scope: !83)
!91 = !DILocation(line: 31, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !15, line: 29, column: 5)
!93 = !DILocation(line: 31, column: 9, scope: !92)
!94 = !DILocation(line: 32, column: 9, scope: !92)
!95 = !DILocation(line: 32, column: 21, scope: !92)
!96 = !DILocation(line: 33, column: 5, scope: !92)
!97 = !DILocation(line: 34, column: 12, scope: !83)
!98 = !DILocation(line: 34, column: 5, scope: !83)
!99 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_21_good", scope: !15, file: !15, line: 137, type: !26, scopeLine: 138, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!100 = !DILocation(line: 139, column: 5, scope: !99)
!101 = !DILocation(line: 140, column: 5, scope: !99)
!102 = !DILocation(line: 141, column: 1, scope: !99)
!103 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 153, type: !104, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!104 = !DISubroutineType(types: !105)
!105 = !{!10, !10, !106}
!106 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !107, size: 64)
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!109 = !DILocalVariable(name: "argc", arg: 1, scope: !103, file: !15, line: 153, type: !10)
!110 = !DILocation(line: 153, column: 14, scope: !103)
!111 = !DILocalVariable(name: "argv", arg: 2, scope: !103, file: !15, line: 153, type: !106)
!112 = !DILocation(line: 153, column: 27, scope: !103)
!113 = !DILocation(line: 156, column: 22, scope: !103)
!114 = !DILocation(line: 156, column: 12, scope: !103)
!115 = !DILocation(line: 156, column: 5, scope: !103)
!116 = !DILocation(line: 158, column: 5, scope: !103)
!117 = !DILocation(line: 159, column: 5, scope: !103)
!118 = !DILocation(line: 160, column: 5, scope: !103)
!119 = !DILocation(line: 163, column: 5, scope: !103)
!120 = !DILocation(line: 164, column: 5, scope: !103)
!121 = !DILocation(line: 165, column: 5, scope: !103)
!122 = !DILocation(line: 167, column: 5, scope: !103)
!123 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 83, type: !26, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!124 = !DILocalVariable(name: "data", scope: !123, file: !15, line: 85, type: !5)
!125 = !DILocation(line: 85, column: 15, scope: !123)
!126 = !DILocalVariable(name: "dataBuffer", scope: !123, file: !15, line: 86, type: !5)
!127 = !DILocation(line: 86, column: 15, scope: !123)
!128 = !DILocation(line: 86, column: 39, scope: !123)
!129 = !DILocation(line: 86, column: 28, scope: !123)
!130 = !DILocation(line: 87, column: 12, scope: !123)
!131 = !DILocation(line: 87, column: 10, scope: !123)
!132 = !DILocation(line: 88, column: 20, scope: !123)
!133 = !DILocation(line: 89, column: 27, scope: !123)
!134 = !DILocation(line: 89, column: 12, scope: !123)
!135 = !DILocation(line: 89, column: 10, scope: !123)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !15, line: 91, type: !43)
!137 = distinct !DILexicalBlock(scope: !123, file: !15, line: 90, column: 5)
!138 = !DILocation(line: 91, column: 17, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !137, file: !15, line: 92, type: !48)
!140 = !DILocation(line: 92, column: 16, scope: !137)
!141 = !DILocalVariable(name: "dataLen", scope: !137, file: !15, line: 92, type: !48)
!142 = !DILocation(line: 92, column: 19, scope: !137)
!143 = !DILocation(line: 93, column: 26, scope: !137)
!144 = !DILocation(line: 93, column: 19, scope: !137)
!145 = !DILocation(line: 93, column: 17, scope: !137)
!146 = !DILocation(line: 95, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !137, file: !15, line: 95, column: 9)
!148 = !DILocation(line: 95, column: 14, scope: !147)
!149 = !DILocation(line: 95, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !15, line: 95, column: 9)
!151 = !DILocation(line: 95, column: 25, scope: !150)
!152 = !DILocation(line: 95, column: 23, scope: !150)
!153 = !DILocation(line: 95, column: 9, scope: !147)
!154 = !DILocation(line: 97, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !15, line: 96, column: 9)
!156 = !DILocation(line: 97, column: 28, scope: !155)
!157 = !DILocation(line: 97, column: 18, scope: !155)
!158 = !DILocation(line: 97, column: 13, scope: !155)
!159 = !DILocation(line: 97, column: 21, scope: !155)
!160 = !DILocation(line: 98, column: 9, scope: !155)
!161 = !DILocation(line: 95, column: 35, scope: !150)
!162 = !DILocation(line: 95, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !77}
!164 = !DILocation(line: 98, column: 9, scope: !147)
!165 = !DILocation(line: 99, column: 9, scope: !137)
!166 = !DILocation(line: 99, column: 20, scope: !137)
!167 = !DILocation(line: 100, column: 20, scope: !137)
!168 = !DILocation(line: 100, column: 9, scope: !137)
!169 = !DILocation(line: 102, column: 1, scope: !123)
!170 = distinct !DISubprogram(name: "goodG2B1Source", scope: !15, file: !15, line: 67, type: !84, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!171 = !DILocalVariable(name: "data", arg: 1, scope: !170, file: !15, line: 67, type: !5)
!172 = !DILocation(line: 67, column: 43, scope: !170)
!173 = !DILocation(line: 69, column: 8, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !15, line: 69, column: 8)
!175 = !DILocation(line: 69, column: 8, scope: !170)
!176 = !DILocation(line: 72, column: 9, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !15, line: 70, column: 5)
!178 = !DILocation(line: 73, column: 5, scope: !177)
!179 = !DILocation(line: 77, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !174, file: !15, line: 75, column: 5)
!181 = !DILocation(line: 77, column: 9, scope: !180)
!182 = !DILocation(line: 78, column: 9, scope: !180)
!183 = !DILocation(line: 78, column: 20, scope: !180)
!184 = !DILocation(line: 80, column: 12, scope: !170)
!185 = !DILocation(line: 80, column: 5, scope: !170)
!186 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 116, type: !26, scopeLine: 117, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!187 = !DILocalVariable(name: "data", scope: !186, file: !15, line: 118, type: !5)
!188 = !DILocation(line: 118, column: 15, scope: !186)
!189 = !DILocalVariable(name: "dataBuffer", scope: !186, file: !15, line: 119, type: !5)
!190 = !DILocation(line: 119, column: 15, scope: !186)
!191 = !DILocation(line: 119, column: 39, scope: !186)
!192 = !DILocation(line: 119, column: 28, scope: !186)
!193 = !DILocation(line: 120, column: 12, scope: !186)
!194 = !DILocation(line: 120, column: 10, scope: !186)
!195 = !DILocation(line: 121, column: 20, scope: !186)
!196 = !DILocation(line: 122, column: 27, scope: !186)
!197 = !DILocation(line: 122, column: 12, scope: !186)
!198 = !DILocation(line: 122, column: 10, scope: !186)
!199 = !DILocalVariable(name: "dest", scope: !200, file: !15, line: 124, type: !43)
!200 = distinct !DILexicalBlock(scope: !186, file: !15, line: 123, column: 5)
!201 = !DILocation(line: 124, column: 17, scope: !200)
!202 = !DILocalVariable(name: "i", scope: !200, file: !15, line: 125, type: !48)
!203 = !DILocation(line: 125, column: 16, scope: !200)
!204 = !DILocalVariable(name: "dataLen", scope: !200, file: !15, line: 125, type: !48)
!205 = !DILocation(line: 125, column: 19, scope: !200)
!206 = !DILocation(line: 126, column: 26, scope: !200)
!207 = !DILocation(line: 126, column: 19, scope: !200)
!208 = !DILocation(line: 126, column: 17, scope: !200)
!209 = !DILocation(line: 128, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !200, file: !15, line: 128, column: 9)
!211 = !DILocation(line: 128, column: 14, scope: !210)
!212 = !DILocation(line: 128, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !15, line: 128, column: 9)
!214 = !DILocation(line: 128, column: 25, scope: !213)
!215 = !DILocation(line: 128, column: 23, scope: !213)
!216 = !DILocation(line: 128, column: 9, scope: !210)
!217 = !DILocation(line: 130, column: 23, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !15, line: 129, column: 9)
!219 = !DILocation(line: 130, column: 28, scope: !218)
!220 = !DILocation(line: 130, column: 18, scope: !218)
!221 = !DILocation(line: 130, column: 13, scope: !218)
!222 = !DILocation(line: 130, column: 21, scope: !218)
!223 = !DILocation(line: 131, column: 9, scope: !218)
!224 = !DILocation(line: 128, column: 35, scope: !213)
!225 = !DILocation(line: 128, column: 9, scope: !213)
!226 = distinct !{!226, !216, !227, !77}
!227 = !DILocation(line: 131, column: 9, scope: !210)
!228 = !DILocation(line: 132, column: 9, scope: !200)
!229 = !DILocation(line: 132, column: 20, scope: !200)
!230 = !DILocation(line: 133, column: 20, scope: !200)
!231 = !DILocation(line: 133, column: 9, scope: !200)
!232 = !DILocation(line: 135, column: 1, scope: !186)
!233 = distinct !DISubprogram(name: "goodG2B2Source", scope: !15, file: !15, line: 105, type: !84, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!234 = !DILocalVariable(name: "data", arg: 1, scope: !233, file: !15, line: 105, type: !5)
!235 = !DILocation(line: 105, column: 43, scope: !233)
!236 = !DILocation(line: 107, column: 8, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !15, line: 107, column: 8)
!238 = !DILocation(line: 107, column: 8, scope: !233)
!239 = !DILocation(line: 110, column: 17, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !15, line: 108, column: 5)
!241 = !DILocation(line: 110, column: 9, scope: !240)
!242 = !DILocation(line: 111, column: 9, scope: !240)
!243 = !DILocation(line: 111, column: 20, scope: !240)
!244 = !DILocation(line: 112, column: 5, scope: !240)
!245 = !DILocation(line: 113, column: 12, scope: !233)
!246 = !DILocation(line: 113, column: 5, scope: !233)
