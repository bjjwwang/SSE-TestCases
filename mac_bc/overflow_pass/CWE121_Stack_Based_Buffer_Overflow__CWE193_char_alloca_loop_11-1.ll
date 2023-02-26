; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 10, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 11, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !50
  %call1 = call i64 @strlen(i8* noundef %arraydecay), !dbg !51
  store i64 %call1, i64* %sourceLen, align 8, !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !56
  %6 = load i64, i64* %sourceLen, align 8, !dbg !58
  %add = add i64 %6, 1, !dbg !59
  %cmp = icmp ult i64 %5, %add, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !64
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !64
  %9 = load i8*, i8** %data, align 8, !dbg !65
  %10 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !65
  store i8 %8, i8* %arrayidx3, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %11, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* noundef %12), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* noundef null), !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 noundef %conv), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_good(), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 10, align 16, !dbg !105
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %1 = alloca i8, i64 11, align 16, !dbg !108
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !107
  %call = call i32 (...) @globalReturnsFalse(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.else, !dbg !111

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !112
  br label %if.end, !dbg !114

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !115
  store i8* %2, i8** %data, align 8, !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !127
  %call1 = call i64 @strlen(i8* noundef %arraydecay), !dbg !128
  store i64 %call1, i64* %sourceLen, align 8, !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !133
  %6 = load i64, i64* %sourceLen, align 8, !dbg !135
  %add = add i64 %6, 1, !dbg !136
  %cmp = icmp ult i64 %5, %add, !dbg !137
  br i1 %cmp, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !141
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !141
  %9 = load i8*, i8** %data, align 8, !dbg !142
  %10 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !142
  store i8 %8, i8* %arrayidx3, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %11, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !150
  call void @printLine(i8* noundef %12), !dbg !151
  ret void, !dbg !152
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %0 = alloca i8, i64 10, align 16, !dbg !158
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !157
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %1 = alloca i8, i64 11, align 16, !dbg !161
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !160
  %call = call i32 (...) @globalReturnsTrue(), !dbg !162
  %tobool = icmp ne i32 %call, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !165
  store i8* %2, i8** %data, align 8, !dbg !167
  %3 = load i8*, i8** %data, align 8, !dbg !168
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  br label %if.end, !dbg !170

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !171, metadata !DIExpression()), !dbg !173
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !173
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !173
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !176, metadata !DIExpression()), !dbg !177
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !178
  %call1 = call i64 @strlen(i8* noundef %arraydecay), !dbg !179
  store i64 %call1, i64* %sourceLen, align 8, !dbg !180
  store i64 0, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !183

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !184
  %6 = load i64, i64* %sourceLen, align 8, !dbg !186
  %add = add i64 %6, 1, !dbg !187
  %cmp = icmp ult i64 %5, %add, !dbg !188
  br i1 %cmp, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !192
  %8 = load i8, i8* %arrayidx2, align 1, !dbg !192
  %9 = load i8*, i8** %data, align 8, !dbg !193
  %10 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx3 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !193
  store i8 %8, i8* %arrayidx3, align 1, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %11, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !201
  call void @printLine(i8* noundef %12), !dbg !202
  ret void, !dbg !203
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !3)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocation(line: 31, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 12, scope: !13)
!25 = !DILocation(line: 32, column: 37, scope: !13)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 8, scope: !13)
!29 = !DILocation(line: 37, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 34, column: 5)
!31 = !DILocation(line: 37, column: 14, scope: !30)
!32 = !DILocation(line: 38, column: 9, scope: !30)
!33 = !DILocation(line: 38, column: 17, scope: !30)
!34 = !DILocation(line: 39, column: 5, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 41, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 41, column: 14, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 42, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 31, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !45, line: 94, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 42, column: 16, scope: !36)
!48 = !DILocalVariable(name: "sourceLen", scope: !36, file: !14, line: 42, type: !42)
!49 = !DILocation(line: 42, column: 19, scope: !36)
!50 = !DILocation(line: 43, column: 28, scope: !36)
!51 = !DILocation(line: 43, column: 21, scope: !36)
!52 = !DILocation(line: 43, column: 19, scope: !36)
!53 = !DILocation(line: 46, column: 16, scope: !54)
!54 = distinct !DILexicalBlock(scope: !36, file: !14, line: 46, column: 9)
!55 = !DILocation(line: 46, column: 14, scope: !54)
!56 = !DILocation(line: 46, column: 21, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !14, line: 46, column: 9)
!58 = !DILocation(line: 46, column: 25, scope: !57)
!59 = !DILocation(line: 46, column: 35, scope: !57)
!60 = !DILocation(line: 46, column: 23, scope: !57)
!61 = !DILocation(line: 46, column: 9, scope: !54)
!62 = !DILocation(line: 48, column: 30, scope: !63)
!63 = distinct !DILexicalBlock(scope: !57, file: !14, line: 47, column: 9)
!64 = !DILocation(line: 48, column: 23, scope: !63)
!65 = !DILocation(line: 48, column: 13, scope: !63)
!66 = !DILocation(line: 48, column: 18, scope: !63)
!67 = !DILocation(line: 48, column: 21, scope: !63)
!68 = !DILocation(line: 49, column: 9, scope: !63)
!69 = !DILocation(line: 46, column: 41, scope: !57)
!70 = !DILocation(line: 46, column: 9, scope: !57)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 49, column: 9, scope: !54)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 50, column: 19, scope: !36)
!75 = !DILocation(line: 50, column: 9, scope: !36)
!76 = !DILocation(line: 52, column: 1, scope: !13)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_11_good", scope: !14, file: !14, line: 117, type: !15, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!78 = !DILocation(line: 119, column: 5, scope: !77)
!79 = !DILocation(line: 120, column: 5, scope: !77)
!80 = !DILocation(line: 121, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 133, type: !82, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!82 = !DISubroutineType(types: !83)
!83 = !{!84, !84, !85}
!84 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !14, line: 133, type: !84)
!87 = !DILocation(line: 133, column: 14, scope: !81)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !14, line: 133, type: !85)
!89 = !DILocation(line: 133, column: 27, scope: !81)
!90 = !DILocation(line: 136, column: 22, scope: !81)
!91 = !DILocation(line: 136, column: 12, scope: !81)
!92 = !DILocation(line: 136, column: 5, scope: !81)
!93 = !DILocation(line: 138, column: 5, scope: !81)
!94 = !DILocation(line: 139, column: 5, scope: !81)
!95 = !DILocation(line: 140, column: 5, scope: !81)
!96 = !DILocation(line: 143, column: 5, scope: !81)
!97 = !DILocation(line: 144, column: 5, scope: !81)
!98 = !DILocation(line: 145, column: 5, scope: !81)
!99 = !DILocation(line: 147, column: 5, scope: !81)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!101 = !DILocalVariable(name: "data", scope: !100, file: !14, line: 61, type: !3)
!102 = !DILocation(line: 61, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !14, line: 62, type: !3)
!104 = !DILocation(line: 62, column: 12, scope: !100)
!105 = !DILocation(line: 62, column: 36, scope: !100)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !14, line: 63, type: !3)
!107 = !DILocation(line: 63, column: 12, scope: !100)
!108 = !DILocation(line: 63, column: 37, scope: !100)
!109 = !DILocation(line: 64, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !100, file: !14, line: 64, column: 8)
!111 = !DILocation(line: 64, column: 8, scope: !100)
!112 = !DILocation(line: 67, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !14, line: 65, column: 5)
!114 = !DILocation(line: 68, column: 5, scope: !113)
!115 = !DILocation(line: 73, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !110, file: !14, line: 70, column: 5)
!117 = !DILocation(line: 73, column: 14, scope: !116)
!118 = !DILocation(line: 74, column: 9, scope: !116)
!119 = !DILocation(line: 74, column: 17, scope: !116)
!120 = !DILocalVariable(name: "source", scope: !121, file: !14, line: 77, type: !37)
!121 = distinct !DILexicalBlock(scope: !100, file: !14, line: 76, column: 5)
!122 = !DILocation(line: 77, column: 14, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !121, file: !14, line: 78, type: !42)
!124 = !DILocation(line: 78, column: 16, scope: !121)
!125 = !DILocalVariable(name: "sourceLen", scope: !121, file: !14, line: 78, type: !42)
!126 = !DILocation(line: 78, column: 19, scope: !121)
!127 = !DILocation(line: 79, column: 28, scope: !121)
!128 = !DILocation(line: 79, column: 21, scope: !121)
!129 = !DILocation(line: 79, column: 19, scope: !121)
!130 = !DILocation(line: 82, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !121, file: !14, line: 82, column: 9)
!132 = !DILocation(line: 82, column: 14, scope: !131)
!133 = !DILocation(line: 82, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !14, line: 82, column: 9)
!135 = !DILocation(line: 82, column: 25, scope: !134)
!136 = !DILocation(line: 82, column: 35, scope: !134)
!137 = !DILocation(line: 82, column: 23, scope: !134)
!138 = !DILocation(line: 82, column: 9, scope: !131)
!139 = !DILocation(line: 84, column: 30, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !14, line: 83, column: 9)
!141 = !DILocation(line: 84, column: 23, scope: !140)
!142 = !DILocation(line: 84, column: 13, scope: !140)
!143 = !DILocation(line: 84, column: 18, scope: !140)
!144 = !DILocation(line: 84, column: 21, scope: !140)
!145 = !DILocation(line: 85, column: 9, scope: !140)
!146 = !DILocation(line: 82, column: 41, scope: !134)
!147 = !DILocation(line: 82, column: 9, scope: !134)
!148 = distinct !{!148, !138, !149, !73}
!149 = !DILocation(line: 85, column: 9, scope: !131)
!150 = !DILocation(line: 86, column: 19, scope: !121)
!151 = !DILocation(line: 86, column: 9, scope: !121)
!152 = !DILocation(line: 88, column: 1, scope: !100)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!154 = !DILocalVariable(name: "data", scope: !153, file: !14, line: 93, type: !3)
!155 = !DILocation(line: 93, column: 12, scope: !153)
!156 = !DILocalVariable(name: "dataBadBuffer", scope: !153, file: !14, line: 94, type: !3)
!157 = !DILocation(line: 94, column: 12, scope: !153)
!158 = !DILocation(line: 94, column: 36, scope: !153)
!159 = !DILocalVariable(name: "dataGoodBuffer", scope: !153, file: !14, line: 95, type: !3)
!160 = !DILocation(line: 95, column: 12, scope: !153)
!161 = !DILocation(line: 95, column: 37, scope: !153)
!162 = !DILocation(line: 96, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !153, file: !14, line: 96, column: 8)
!164 = !DILocation(line: 96, column: 8, scope: !153)
!165 = !DILocation(line: 100, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !14, line: 97, column: 5)
!167 = !DILocation(line: 100, column: 14, scope: !166)
!168 = !DILocation(line: 101, column: 9, scope: !166)
!169 = !DILocation(line: 101, column: 17, scope: !166)
!170 = !DILocation(line: 102, column: 5, scope: !166)
!171 = !DILocalVariable(name: "source", scope: !172, file: !14, line: 104, type: !37)
!172 = distinct !DILexicalBlock(scope: !153, file: !14, line: 103, column: 5)
!173 = !DILocation(line: 104, column: 14, scope: !172)
!174 = !DILocalVariable(name: "i", scope: !172, file: !14, line: 105, type: !42)
!175 = !DILocation(line: 105, column: 16, scope: !172)
!176 = !DILocalVariable(name: "sourceLen", scope: !172, file: !14, line: 105, type: !42)
!177 = !DILocation(line: 105, column: 19, scope: !172)
!178 = !DILocation(line: 106, column: 28, scope: !172)
!179 = !DILocation(line: 106, column: 21, scope: !172)
!180 = !DILocation(line: 106, column: 19, scope: !172)
!181 = !DILocation(line: 109, column: 16, scope: !182)
!182 = distinct !DILexicalBlock(scope: !172, file: !14, line: 109, column: 9)
!183 = !DILocation(line: 109, column: 14, scope: !182)
!184 = !DILocation(line: 109, column: 21, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !14, line: 109, column: 9)
!186 = !DILocation(line: 109, column: 25, scope: !185)
!187 = !DILocation(line: 109, column: 35, scope: !185)
!188 = !DILocation(line: 109, column: 23, scope: !185)
!189 = !DILocation(line: 109, column: 9, scope: !182)
!190 = !DILocation(line: 111, column: 30, scope: !191)
!191 = distinct !DILexicalBlock(scope: !185, file: !14, line: 110, column: 9)
!192 = !DILocation(line: 111, column: 23, scope: !191)
!193 = !DILocation(line: 111, column: 13, scope: !191)
!194 = !DILocation(line: 111, column: 18, scope: !191)
!195 = !DILocation(line: 111, column: 21, scope: !191)
!196 = !DILocation(line: 112, column: 9, scope: !191)
!197 = !DILocation(line: 109, column: 41, scope: !185)
!198 = !DILocation(line: 109, column: 9, scope: !185)
!199 = distinct !{!199, !189, !200, !73}
!200 = !DILocation(line: 112, column: 9, scope: !182)
!201 = !DILocation(line: 113, column: 19, scope: !172)
!202 = !DILocation(line: 113, column: 9, scope: !172)
!203 = !DILocation(line: 115, column: 1, scope: !153)
