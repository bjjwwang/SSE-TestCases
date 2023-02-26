; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %call = call i32 (...) @globalReturnsTrue(), !dbg !32
  %tobool = icmp ne i32 %call, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %4, i32** %data, align 8, !dbg !37
  %5 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx2, align 4, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %6, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !66
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !66
  %9 = load i32*, i32** %data, align 8, !dbg !67
  %10 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !67
  store i32 %8, i32* %arrayidx4, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %11, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !76
  store i32 0, i32* %arrayidx5, align 4, !dbg !77
  %13 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* noundef %13), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 200, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 400, align 16, !dbg !114
  %3 = bitcast i8* %2 to i32*, !dbg !115
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !113
  %call = call i32 (...) @globalReturnsFalse(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !122
  store i32* %4, i32** %data, align 8, !dbg !124
  %5 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !132
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !133
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !134
  store i32 0, i32* %arrayidx2, align 4, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !139
  %cmp = icmp ult i64 %6, 100, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !145
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !145
  %9 = load i32*, i32** %data, align 8, !dbg !146
  %10 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !146
  store i32 %8, i32* %arrayidx4, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %11, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !154
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !154
  store i32 0, i32* %arrayidx5, align 4, !dbg !155
  %13 = load i32*, i32** %data, align 8, !dbg !156
  call void @printWLine(i32* noundef %13), !dbg !157
  ret void, !dbg !158
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !159 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = alloca i8, i64 200, align 16, !dbg !164
  %1 = bitcast i8* %0 to i32*, !dbg !165
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !166, metadata !DIExpression()), !dbg !167
  %2 = alloca i8, i64 400, align 16, !dbg !168
  %3 = bitcast i8* %2 to i32*, !dbg !169
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !167
  %call = call i32 (...) @globalReturnsTrue(), !dbg !170
  %tobool = icmp ne i32 %call, 0, !dbg !170
  br i1 %tobool, label %if.then, label %if.end, !dbg !172

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !173
  store i32* %4, i32** %data, align 8, !dbg !175
  %5 = load i32*, i32** %data, align 8, !dbg !176
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !176
  store i32 0, i32* %arrayidx, align 4, !dbg !177
  br label %if.end, !dbg !178

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !184
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !185
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !186
  store i32 0, i32* %arrayidx2, align 4, !dbg !187
  store i64 0, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !190

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !191
  %cmp = icmp ult i64 %6, 100, !dbg !193
  br i1 %cmp, label %for.body, label %for.end, !dbg !194

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !197
  %8 = load i32, i32* %arrayidx3, align 4, !dbg !197
  %9 = load i32*, i32** %data, align 8, !dbg !198
  %10 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx4 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !198
  store i32 %8, i32* %arrayidx4, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %11, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !206
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !206
  store i32 0, i32* %arrayidx5, align 4, !dbg !207
  %13 = load i32*, i32** %data, align 8, !dbg !208
  call void @printWLine(i32* noundef %13), !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 42, scope: !17)
!27 = !DILocation(line: 26, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !3)
!29 = !DILocation(line: 27, column: 15, scope: !17)
!30 = !DILocation(line: 27, column: 43, scope: !17)
!31 = !DILocation(line: 27, column: 32, scope: !17)
!32 = !DILocation(line: 28, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 8)
!34 = !DILocation(line: 28, column: 8, scope: !17)
!35 = !DILocation(line: 32, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !18, line: 29, column: 5)
!37 = !DILocation(line: 32, column: 14, scope: !36)
!38 = !DILocation(line: 33, column: 9, scope: !36)
!39 = !DILocation(line: 33, column: 17, scope: !36)
!40 = !DILocation(line: 34, column: 5, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !18, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 35, column: 5)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !46)
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 36, column: 16, scope: !42)
!48 = !DILocalVariable(name: "source", scope: !42, file: !18, line: 37, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 37, column: 17, scope: !42)
!53 = !DILocation(line: 38, column: 17, scope: !42)
!54 = !DILocation(line: 38, column: 9, scope: !42)
!55 = !DILocation(line: 39, column: 9, scope: !42)
!56 = !DILocation(line: 39, column: 23, scope: !42)
!57 = !DILocation(line: 41, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !42, file: !18, line: 41, column: 9)
!59 = !DILocation(line: 41, column: 14, scope: !58)
!60 = !DILocation(line: 41, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !18, line: 41, column: 9)
!62 = !DILocation(line: 41, column: 23, scope: !61)
!63 = !DILocation(line: 41, column: 9, scope: !58)
!64 = !DILocation(line: 43, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !18, line: 42, column: 9)
!66 = !DILocation(line: 43, column: 23, scope: !65)
!67 = !DILocation(line: 43, column: 13, scope: !65)
!68 = !DILocation(line: 43, column: 18, scope: !65)
!69 = !DILocation(line: 43, column: 21, scope: !65)
!70 = !DILocation(line: 44, column: 9, scope: !65)
!71 = !DILocation(line: 41, column: 31, scope: !61)
!72 = !DILocation(line: 41, column: 9, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 44, column: 9, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 45, column: 9, scope: !42)
!77 = !DILocation(line: 45, column: 21, scope: !42)
!78 = !DILocation(line: 46, column: 20, scope: !42)
!79 = !DILocation(line: 46, column: 9, scope: !42)
!80 = !DILocation(line: 48, column: 1, scope: !17)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_11_good", scope: !18, file: !18, line: 113, type: !19, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!82 = !DILocation(line: 115, column: 5, scope: !81)
!83 = !DILocation(line: 116, column: 5, scope: !81)
!84 = !DILocation(line: 117, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 129, type: !86, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!86 = !DISubroutineType(types: !87)
!87 = !{!8, !8, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !18, line: 129, type: !8)
!92 = !DILocation(line: 129, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !18, line: 129, type: !88)
!94 = !DILocation(line: 129, column: 27, scope: !85)
!95 = !DILocation(line: 132, column: 22, scope: !85)
!96 = !DILocation(line: 132, column: 12, scope: !85)
!97 = !DILocation(line: 132, column: 5, scope: !85)
!98 = !DILocation(line: 134, column: 5, scope: !85)
!99 = !DILocation(line: 135, column: 5, scope: !85)
!100 = !DILocation(line: 136, column: 5, scope: !85)
!101 = !DILocation(line: 139, column: 5, scope: !85)
!102 = !DILocation(line: 140, column: 5, scope: !85)
!103 = !DILocation(line: 141, column: 5, scope: !85)
!104 = !DILocation(line: 143, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!106 = !DILocalVariable(name: "data", scope: !105, file: !18, line: 57, type: !3)
!107 = !DILocation(line: 57, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !18, line: 58, type: !3)
!109 = !DILocation(line: 58, column: 15, scope: !105)
!110 = !DILocation(line: 58, column: 42, scope: !105)
!111 = !DILocation(line: 58, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !18, line: 59, type: !3)
!113 = !DILocation(line: 59, column: 15, scope: !105)
!114 = !DILocation(line: 59, column: 43, scope: !105)
!115 = !DILocation(line: 59, column: 32, scope: !105)
!116 = !DILocation(line: 60, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !18, line: 60, column: 8)
!118 = !DILocation(line: 60, column: 8, scope: !105)
!119 = !DILocation(line: 63, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !18, line: 61, column: 5)
!121 = !DILocation(line: 64, column: 5, scope: !120)
!122 = !DILocation(line: 68, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !18, line: 66, column: 5)
!124 = !DILocation(line: 68, column: 14, scope: !123)
!125 = !DILocation(line: 69, column: 9, scope: !123)
!126 = !DILocation(line: 69, column: 17, scope: !123)
!127 = !DILocalVariable(name: "i", scope: !128, file: !18, line: 72, type: !43)
!128 = distinct !DILexicalBlock(scope: !105, file: !18, line: 71, column: 5)
!129 = !DILocation(line: 72, column: 16, scope: !128)
!130 = !DILocalVariable(name: "source", scope: !128, file: !18, line: 73, type: !49)
!131 = !DILocation(line: 73, column: 17, scope: !128)
!132 = !DILocation(line: 74, column: 17, scope: !128)
!133 = !DILocation(line: 74, column: 9, scope: !128)
!134 = !DILocation(line: 75, column: 9, scope: !128)
!135 = !DILocation(line: 75, column: 23, scope: !128)
!136 = !DILocation(line: 77, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !128, file: !18, line: 77, column: 9)
!138 = !DILocation(line: 77, column: 14, scope: !137)
!139 = !DILocation(line: 77, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !18, line: 77, column: 9)
!141 = !DILocation(line: 77, column: 23, scope: !140)
!142 = !DILocation(line: 77, column: 9, scope: !137)
!143 = !DILocation(line: 79, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !18, line: 78, column: 9)
!145 = !DILocation(line: 79, column: 23, scope: !144)
!146 = !DILocation(line: 79, column: 13, scope: !144)
!147 = !DILocation(line: 79, column: 18, scope: !144)
!148 = !DILocation(line: 79, column: 21, scope: !144)
!149 = !DILocation(line: 80, column: 9, scope: !144)
!150 = !DILocation(line: 77, column: 31, scope: !140)
!151 = !DILocation(line: 77, column: 9, scope: !140)
!152 = distinct !{!152, !142, !153, !75}
!153 = !DILocation(line: 80, column: 9, scope: !137)
!154 = !DILocation(line: 81, column: 9, scope: !128)
!155 = !DILocation(line: 81, column: 21, scope: !128)
!156 = !DILocation(line: 82, column: 20, scope: !128)
!157 = !DILocation(line: 82, column: 9, scope: !128)
!158 = !DILocation(line: 84, column: 1, scope: !105)
!159 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!160 = !DILocalVariable(name: "data", scope: !159, file: !18, line: 89, type: !3)
!161 = !DILocation(line: 89, column: 15, scope: !159)
!162 = !DILocalVariable(name: "dataBadBuffer", scope: !159, file: !18, line: 90, type: !3)
!163 = !DILocation(line: 90, column: 15, scope: !159)
!164 = !DILocation(line: 90, column: 42, scope: !159)
!165 = !DILocation(line: 90, column: 31, scope: !159)
!166 = !DILocalVariable(name: "dataGoodBuffer", scope: !159, file: !18, line: 91, type: !3)
!167 = !DILocation(line: 91, column: 15, scope: !159)
!168 = !DILocation(line: 91, column: 43, scope: !159)
!169 = !DILocation(line: 91, column: 32, scope: !159)
!170 = !DILocation(line: 92, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !159, file: !18, line: 92, column: 8)
!172 = !DILocation(line: 92, column: 8, scope: !159)
!173 = !DILocation(line: 95, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !18, line: 93, column: 5)
!175 = !DILocation(line: 95, column: 14, scope: !174)
!176 = !DILocation(line: 96, column: 9, scope: !174)
!177 = !DILocation(line: 96, column: 17, scope: !174)
!178 = !DILocation(line: 97, column: 5, scope: !174)
!179 = !DILocalVariable(name: "i", scope: !180, file: !18, line: 99, type: !43)
!180 = distinct !DILexicalBlock(scope: !159, file: !18, line: 98, column: 5)
!181 = !DILocation(line: 99, column: 16, scope: !180)
!182 = !DILocalVariable(name: "source", scope: !180, file: !18, line: 100, type: !49)
!183 = !DILocation(line: 100, column: 17, scope: !180)
!184 = !DILocation(line: 101, column: 17, scope: !180)
!185 = !DILocation(line: 101, column: 9, scope: !180)
!186 = !DILocation(line: 102, column: 9, scope: !180)
!187 = !DILocation(line: 102, column: 23, scope: !180)
!188 = !DILocation(line: 104, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !180, file: !18, line: 104, column: 9)
!190 = !DILocation(line: 104, column: 14, scope: !189)
!191 = !DILocation(line: 104, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !18, line: 104, column: 9)
!193 = !DILocation(line: 104, column: 23, scope: !192)
!194 = !DILocation(line: 104, column: 9, scope: !189)
!195 = !DILocation(line: 106, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !18, line: 105, column: 9)
!197 = !DILocation(line: 106, column: 23, scope: !196)
!198 = !DILocation(line: 106, column: 13, scope: !196)
!199 = !DILocation(line: 106, column: 18, scope: !196)
!200 = !DILocation(line: 106, column: 21, scope: !196)
!201 = !DILocation(line: 107, column: 9, scope: !196)
!202 = !DILocation(line: 104, column: 31, scope: !192)
!203 = !DILocation(line: 104, column: 9, scope: !192)
!204 = distinct !{!204, !194, !205, !75}
!205 = !DILocation(line: 107, column: 9, scope: !189)
!206 = !DILocation(line: 108, column: 9, scope: !180)
!207 = !DILocation(line: 108, column: 21, scope: !180)
!208 = !DILocation(line: 109, column: 20, scope: !180)
!209 = !DILocation(line: 109, column: 9, scope: !180)
!210 = !DILocation(line: 111, column: 1, scope: !159)
