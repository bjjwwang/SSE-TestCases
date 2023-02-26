; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad.source to i8*), i64 44, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !47, metadata !DIExpression()), !dbg !48
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !49
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !50
  store i64 %call, i64* %sourceLen, align 8, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !55
  %3 = load i64, i64* %sourceLen, align 8, !dbg !57
  %add = add i64 %3, 1, !dbg !58
  %cmp = icmp ult i64 %2, %add, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !63
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !63
  %6 = load i32*, i32** %data, align 8, !dbg !64
  %7 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !64
  store i32 %5, i32* %arrayidx3, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %8, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* noundef %9), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_good(), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  %0 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !109
  store i32 0, i32* %arrayidx, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !118
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !119
  store i64 %call, i64* %sourceLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !124
  %3 = load i64, i64* %sourceLen, align 8, !dbg !126
  %add = add i64 %3, 1, !dbg !127
  %cmp = icmp ult i64 %2, %add, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !132
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !132
  %6 = load i32*, i32** %data, align 8, !dbg !133
  %7 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !133
  store i32 %5, i32* %arrayidx3, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %8, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !141
  call void @printWLine(i32* noundef %9), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !151
  store i32* %arraydecay, i32** %data, align 8, !dbg !152
  %0 = load i32*, i32** %data, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !153
  store i32 0, i32* %arrayidx, align 4, !dbg !154
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !155, metadata !DIExpression()), !dbg !157
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !157
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !157
  call void @llvm.dbg.declare(metadata i64* %i, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !160, metadata !DIExpression()), !dbg !161
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !162
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !163
  store i64 %call, i64* %sourceLen, align 8, !dbg !164
  store i64 0, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !167

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !168
  %3 = load i64, i64* %sourceLen, align 8, !dbg !170
  %add = add i64 %3, 1, !dbg !171
  %cmp = icmp ult i64 %2, %add, !dbg !172
  br i1 %cmp, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !176
  %5 = load i32, i32* %arrayidx2, align 4, !dbg !176
  %6 = load i32*, i32** %data, align 8, !dbg !177
  %7 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !177
  store i32 %5, i32* %arrayidx3, align 4, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %8, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !185
  call void @printWLine(i32* noundef %9), !dbg !186
  ret void, !dbg !187
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 30, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 31, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 32, column: 13, scope: !11)
!34 = !DILocation(line: 38, column: 16, scope: !11)
!35 = !DILocation(line: 38, column: 14, scope: !11)
!36 = !DILocation(line: 39, column: 9, scope: !11)
!37 = !DILocation(line: 39, column: 17, scope: !11)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 47, type: !30)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!40 = !DILocation(line: 47, column: 17, scope: !39)
!41 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 48, type: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 31, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !45)
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 48, column: 16, scope: !39)
!47 = !DILocalVariable(name: "sourceLen", scope: !39, file: !12, line: 48, type: !42)
!48 = !DILocation(line: 48, column: 19, scope: !39)
!49 = !DILocation(line: 49, column: 28, scope: !39)
!50 = !DILocation(line: 49, column: 21, scope: !39)
!51 = !DILocation(line: 49, column: 19, scope: !39)
!52 = !DILocation(line: 52, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !39, file: !12, line: 52, column: 9)
!54 = !DILocation(line: 52, column: 14, scope: !53)
!55 = !DILocation(line: 52, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 52, column: 9)
!57 = !DILocation(line: 52, column: 25, scope: !56)
!58 = !DILocation(line: 52, column: 35, scope: !56)
!59 = !DILocation(line: 52, column: 23, scope: !56)
!60 = !DILocation(line: 52, column: 9, scope: !53)
!61 = !DILocation(line: 54, column: 30, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !12, line: 53, column: 9)
!63 = !DILocation(line: 54, column: 23, scope: !62)
!64 = !DILocation(line: 54, column: 13, scope: !62)
!65 = !DILocation(line: 54, column: 18, scope: !62)
!66 = !DILocation(line: 54, column: 21, scope: !62)
!67 = !DILocation(line: 55, column: 9, scope: !62)
!68 = !DILocation(line: 52, column: 41, scope: !56)
!69 = !DILocation(line: 52, column: 9, scope: !56)
!70 = distinct !{!70, !60, !71, !72}
!71 = !DILocation(line: 55, column: 9, scope: !53)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 56, column: 20, scope: !39)
!74 = !DILocation(line: 56, column: 9, scope: !39)
!75 = !DILocation(line: 58, column: 1, scope: !11)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_15_good", scope: !12, file: !12, line: 130, type: !13, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!77 = !DILocation(line: 132, column: 5, scope: !76)
!78 = !DILocation(line: 133, column: 5, scope: !76)
!79 = !DILocation(line: 134, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 146, type: !81, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DISubroutineType(types: !82)
!82 = !{!22, !22, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !12, line: 146, type: !22)
!87 = !DILocation(line: 146, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !12, line: 146, type: !83)
!89 = !DILocation(line: 146, column: 27, scope: !80)
!90 = !DILocation(line: 149, column: 22, scope: !80)
!91 = !DILocation(line: 149, column: 12, scope: !80)
!92 = !DILocation(line: 149, column: 5, scope: !80)
!93 = !DILocation(line: 151, column: 5, scope: !80)
!94 = !DILocation(line: 152, column: 5, scope: !80)
!95 = !DILocation(line: 153, column: 5, scope: !80)
!96 = !DILocation(line: 156, column: 5, scope: !80)
!97 = !DILocation(line: 157, column: 5, scope: !80)
!98 = !DILocation(line: 158, column: 5, scope: !80)
!99 = !DILocation(line: 160, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 67, type: !17)
!102 = !DILocation(line: 67, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 68, type: !25)
!104 = !DILocation(line: 68, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 69, type: !30)
!106 = !DILocation(line: 69, column: 13, scope: !100)
!107 = !DILocation(line: 79, column: 16, scope: !100)
!108 = !DILocation(line: 79, column: 14, scope: !100)
!109 = !DILocation(line: 80, column: 9, scope: !100)
!110 = !DILocation(line: 80, column: 17, scope: !100)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 84, type: !30)
!112 = distinct !DILexicalBlock(scope: !100, file: !12, line: 83, column: 5)
!113 = !DILocation(line: 84, column: 17, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 85, type: !42)
!115 = !DILocation(line: 85, column: 16, scope: !112)
!116 = !DILocalVariable(name: "sourceLen", scope: !112, file: !12, line: 85, type: !42)
!117 = !DILocation(line: 85, column: 19, scope: !112)
!118 = !DILocation(line: 86, column: 28, scope: !112)
!119 = !DILocation(line: 86, column: 21, scope: !112)
!120 = !DILocation(line: 86, column: 19, scope: !112)
!121 = !DILocation(line: 89, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !12, line: 89, column: 9)
!123 = !DILocation(line: 89, column: 14, scope: !122)
!124 = !DILocation(line: 89, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 89, column: 9)
!126 = !DILocation(line: 89, column: 25, scope: !125)
!127 = !DILocation(line: 89, column: 35, scope: !125)
!128 = !DILocation(line: 89, column: 23, scope: !125)
!129 = !DILocation(line: 89, column: 9, scope: !122)
!130 = !DILocation(line: 91, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !12, line: 90, column: 9)
!132 = !DILocation(line: 91, column: 23, scope: !131)
!133 = !DILocation(line: 91, column: 13, scope: !131)
!134 = !DILocation(line: 91, column: 18, scope: !131)
!135 = !DILocation(line: 91, column: 21, scope: !131)
!136 = !DILocation(line: 92, column: 9, scope: !131)
!137 = !DILocation(line: 89, column: 41, scope: !125)
!138 = !DILocation(line: 89, column: 9, scope: !125)
!139 = distinct !{!139, !129, !140, !72}
!140 = !DILocation(line: 92, column: 9, scope: !122)
!141 = !DILocation(line: 93, column: 20, scope: !112)
!142 = !DILocation(line: 93, column: 9, scope: !112)
!143 = !DILocation(line: 95, column: 1, scope: !100)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!145 = !DILocalVariable(name: "data", scope: !144, file: !12, line: 100, type: !17)
!146 = !DILocation(line: 100, column: 15, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !12, line: 101, type: !25)
!148 = !DILocation(line: 101, column: 13, scope: !144)
!149 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !12, line: 102, type: !30)
!150 = !DILocation(line: 102, column: 13, scope: !144)
!151 = !DILocation(line: 108, column: 16, scope: !144)
!152 = !DILocation(line: 108, column: 14, scope: !144)
!153 = !DILocation(line: 109, column: 9, scope: !144)
!154 = !DILocation(line: 109, column: 17, scope: !144)
!155 = !DILocalVariable(name: "source", scope: !156, file: !12, line: 117, type: !30)
!156 = distinct !DILexicalBlock(scope: !144, file: !12, line: 116, column: 5)
!157 = !DILocation(line: 117, column: 17, scope: !156)
!158 = !DILocalVariable(name: "i", scope: !156, file: !12, line: 118, type: !42)
!159 = !DILocation(line: 118, column: 16, scope: !156)
!160 = !DILocalVariable(name: "sourceLen", scope: !156, file: !12, line: 118, type: !42)
!161 = !DILocation(line: 118, column: 19, scope: !156)
!162 = !DILocation(line: 119, column: 28, scope: !156)
!163 = !DILocation(line: 119, column: 21, scope: !156)
!164 = !DILocation(line: 119, column: 19, scope: !156)
!165 = !DILocation(line: 122, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !156, file: !12, line: 122, column: 9)
!167 = !DILocation(line: 122, column: 14, scope: !166)
!168 = !DILocation(line: 122, column: 21, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !12, line: 122, column: 9)
!170 = !DILocation(line: 122, column: 25, scope: !169)
!171 = !DILocation(line: 122, column: 35, scope: !169)
!172 = !DILocation(line: 122, column: 23, scope: !169)
!173 = !DILocation(line: 122, column: 9, scope: !166)
!174 = !DILocation(line: 124, column: 30, scope: !175)
!175 = distinct !DILexicalBlock(scope: !169, file: !12, line: 123, column: 9)
!176 = !DILocation(line: 124, column: 23, scope: !175)
!177 = !DILocation(line: 124, column: 13, scope: !175)
!178 = !DILocation(line: 124, column: 18, scope: !175)
!179 = !DILocation(line: 124, column: 21, scope: !175)
!180 = !DILocation(line: 125, column: 9, scope: !175)
!181 = !DILocation(line: 122, column: 41, scope: !169)
!182 = !DILocation(line: 122, column: 9, scope: !169)
!183 = distinct !{!183, !173, !184, !72}
!184 = !DILocation(line: 125, column: 9, scope: !166)
!185 = !DILocation(line: 126, column: 20, scope: !156)
!186 = !DILocation(line: 126, column: 9, scope: !156)
!187 = !DILocation(line: 128, column: 1, scope: !144)
