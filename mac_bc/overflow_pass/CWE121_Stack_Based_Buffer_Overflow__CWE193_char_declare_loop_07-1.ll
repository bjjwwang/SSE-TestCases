; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !54, metadata !DIExpression()), !dbg !55
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !57
  store i64 %call, i64* %sourceLen, align 8, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !62
  %4 = load i64, i64* %sourceLen, align 8, !dbg !64
  %add = add i64 %4, 1, !dbg !65
  %cmp2 = icmp ult i64 %3, %add, !dbg !66
  br i1 %cmp2, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !70
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !70
  %7 = load i8*, i8** %data, align 8, !dbg !71
  %8 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !71
  store i8 %6, i8* %arrayidx4, align 1, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %9, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* noundef %10), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !87 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp ne i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i8* %arraydecay, i8** %data, align 8, !dbg !121
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !131
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !132
  store i64 %call, i64* %sourceLen, align 8, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !137
  %4 = load i64, i64* %sourceLen, align 8, !dbg !139
  %add = add i64 %4, 1, !dbg !140
  %cmp2 = icmp ult i64 %3, %add, !dbg !141
  br i1 %cmp2, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !145
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !145
  %7 = load i8*, i8** %data, align 8, !dbg !146
  %8 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !146
  store i8 %6, i8* %arrayidx4, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %9, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* noundef %10), !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %0 = load i32, i32* @staticFive, align 4, !dbg !164
  %cmp = icmp eq i32 %0, 5, !dbg !166
  br i1 %cmp, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !168
  store i8* %arraydecay, i8** %data, align 8, !dbg !170
  %1 = load i8*, i8** %data, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !171
  store i8 0, i8* %arrayidx, align 1, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !174, metadata !DIExpression()), !dbg !176
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !179, metadata !DIExpression()), !dbg !180
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !181
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !182
  store i64 %call, i64* %sourceLen, align 8, !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !187
  %4 = load i64, i64* %sourceLen, align 8, !dbg !189
  %add = add i64 %4, 1, !dbg !190
  %cmp2 = icmp ult i64 %3, %add, !dbg !191
  br i1 %cmp2, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %5, !dbg !195
  %6 = load i8, i8* %arrayidx3, align 1, !dbg !195
  %7 = load i8*, i8** %data, align 8, !dbg !196
  %8 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx4 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !196
  store i8 %6, i8* %arrayidx4, align 1, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %9, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !204
  call void @printLine(i8* noundef %10), !dbg !205
  ret void, !dbg !206
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 30, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_bad", scope: !7, file: !7, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 36, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DILocation(line: 36, column: 12, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !7, line: 37, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 80, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 37, column: 10, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !7, line: 38, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 38, column: 10, scope: !16)
!34 = !DILocation(line: 39, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !7, line: 39, column: 8)
!36 = !DILocation(line: 39, column: 18, scope: !35)
!37 = !DILocation(line: 39, column: 8, scope: !16)
!38 = !DILocation(line: 43, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !7, line: 40, column: 5)
!40 = !DILocation(line: 43, column: 14, scope: !39)
!41 = !DILocation(line: 44, column: 9, scope: !39)
!42 = !DILocation(line: 44, column: 17, scope: !39)
!43 = !DILocation(line: 45, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !7, line: 47, type: !30)
!45 = distinct !DILexicalBlock(scope: !16, file: !7, line: 46, column: 5)
!46 = !DILocation(line: 47, column: 14, scope: !45)
!47 = !DILocalVariable(name: "i", scope: !45, file: !7, line: 48, type: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !51, line: 94, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!52 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 48, column: 16, scope: !45)
!54 = !DILocalVariable(name: "sourceLen", scope: !45, file: !7, line: 48, type: !48)
!55 = !DILocation(line: 48, column: 19, scope: !45)
!56 = !DILocation(line: 49, column: 28, scope: !45)
!57 = !DILocation(line: 49, column: 21, scope: !45)
!58 = !DILocation(line: 49, column: 19, scope: !45)
!59 = !DILocation(line: 52, column: 16, scope: !60)
!60 = distinct !DILexicalBlock(scope: !45, file: !7, line: 52, column: 9)
!61 = !DILocation(line: 52, column: 14, scope: !60)
!62 = !DILocation(line: 52, column: 21, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !7, line: 52, column: 9)
!64 = !DILocation(line: 52, column: 25, scope: !63)
!65 = !DILocation(line: 52, column: 35, scope: !63)
!66 = !DILocation(line: 52, column: 23, scope: !63)
!67 = !DILocation(line: 52, column: 9, scope: !60)
!68 = !DILocation(line: 54, column: 30, scope: !69)
!69 = distinct !DILexicalBlock(scope: !63, file: !7, line: 53, column: 9)
!70 = !DILocation(line: 54, column: 23, scope: !69)
!71 = !DILocation(line: 54, column: 13, scope: !69)
!72 = !DILocation(line: 54, column: 18, scope: !69)
!73 = !DILocation(line: 54, column: 21, scope: !69)
!74 = !DILocation(line: 55, column: 9, scope: !69)
!75 = !DILocation(line: 52, column: 41, scope: !63)
!76 = !DILocation(line: 52, column: 9, scope: !63)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 55, column: 9, scope: !60)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 56, column: 19, scope: !45)
!81 = !DILocation(line: 56, column: 9, scope: !45)
!82 = !DILocation(line: 58, column: 1, scope: !16)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_07_good", scope: !7, file: !7, line: 123, type: !17, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!84 = !DILocation(line: 125, column: 5, scope: !83)
!85 = !DILocation(line: 126, column: 5, scope: !83)
!86 = !DILocation(line: 127, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 139, type: !88, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!88 = !DISubroutineType(types: !89)
!89 = !{!8, !8, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !7, line: 139, type: !8)
!92 = !DILocation(line: 139, column: 14, scope: !87)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !7, line: 139, type: !90)
!94 = !DILocation(line: 139, column: 27, scope: !87)
!95 = !DILocation(line: 142, column: 22, scope: !87)
!96 = !DILocation(line: 142, column: 12, scope: !87)
!97 = !DILocation(line: 142, column: 5, scope: !87)
!98 = !DILocation(line: 144, column: 5, scope: !87)
!99 = !DILocation(line: 145, column: 5, scope: !87)
!100 = !DILocation(line: 146, column: 5, scope: !87)
!101 = !DILocation(line: 149, column: 5, scope: !87)
!102 = !DILocation(line: 150, column: 5, scope: !87)
!103 = !DILocation(line: 151, column: 5, scope: !87)
!104 = !DILocation(line: 153, column: 5, scope: !87)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!106 = !DILocalVariable(name: "data", scope: !105, file: !7, line: 67, type: !21)
!107 = !DILocation(line: 67, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !7, line: 68, type: !25)
!109 = !DILocation(line: 68, column: 10, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !7, line: 69, type: !30)
!111 = !DILocation(line: 69, column: 10, scope: !105)
!112 = !DILocation(line: 70, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !7, line: 70, column: 8)
!114 = !DILocation(line: 70, column: 18, scope: !113)
!115 = !DILocation(line: 70, column: 8, scope: !105)
!116 = !DILocation(line: 73, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !7, line: 71, column: 5)
!118 = !DILocation(line: 74, column: 5, scope: !117)
!119 = !DILocation(line: 79, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !7, line: 76, column: 5)
!121 = !DILocation(line: 79, column: 14, scope: !120)
!122 = !DILocation(line: 80, column: 9, scope: !120)
!123 = !DILocation(line: 80, column: 17, scope: !120)
!124 = !DILocalVariable(name: "source", scope: !125, file: !7, line: 83, type: !30)
!125 = distinct !DILexicalBlock(scope: !105, file: !7, line: 82, column: 5)
!126 = !DILocation(line: 83, column: 14, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !125, file: !7, line: 84, type: !48)
!128 = !DILocation(line: 84, column: 16, scope: !125)
!129 = !DILocalVariable(name: "sourceLen", scope: !125, file: !7, line: 84, type: !48)
!130 = !DILocation(line: 84, column: 19, scope: !125)
!131 = !DILocation(line: 85, column: 28, scope: !125)
!132 = !DILocation(line: 85, column: 21, scope: !125)
!133 = !DILocation(line: 85, column: 19, scope: !125)
!134 = !DILocation(line: 88, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !7, line: 88, column: 9)
!136 = !DILocation(line: 88, column: 14, scope: !135)
!137 = !DILocation(line: 88, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !7, line: 88, column: 9)
!139 = !DILocation(line: 88, column: 25, scope: !138)
!140 = !DILocation(line: 88, column: 35, scope: !138)
!141 = !DILocation(line: 88, column: 23, scope: !138)
!142 = !DILocation(line: 88, column: 9, scope: !135)
!143 = !DILocation(line: 90, column: 30, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !7, line: 89, column: 9)
!145 = !DILocation(line: 90, column: 23, scope: !144)
!146 = !DILocation(line: 90, column: 13, scope: !144)
!147 = !DILocation(line: 90, column: 18, scope: !144)
!148 = !DILocation(line: 90, column: 21, scope: !144)
!149 = !DILocation(line: 91, column: 9, scope: !144)
!150 = !DILocation(line: 88, column: 41, scope: !138)
!151 = !DILocation(line: 88, column: 9, scope: !138)
!152 = distinct !{!152, !142, !153, !79}
!153 = !DILocation(line: 91, column: 9, scope: !135)
!154 = !DILocation(line: 92, column: 19, scope: !125)
!155 = !DILocation(line: 92, column: 9, scope: !125)
!156 = !DILocation(line: 94, column: 1, scope: !105)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 97, type: !17, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!158 = !DILocalVariable(name: "data", scope: !157, file: !7, line: 99, type: !21)
!159 = !DILocation(line: 99, column: 12, scope: !157)
!160 = !DILocalVariable(name: "dataBadBuffer", scope: !157, file: !7, line: 100, type: !25)
!161 = !DILocation(line: 100, column: 10, scope: !157)
!162 = !DILocalVariable(name: "dataGoodBuffer", scope: !157, file: !7, line: 101, type: !30)
!163 = !DILocation(line: 101, column: 10, scope: !157)
!164 = !DILocation(line: 102, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !157, file: !7, line: 102, column: 8)
!166 = !DILocation(line: 102, column: 18, scope: !165)
!167 = !DILocation(line: 102, column: 8, scope: !157)
!168 = !DILocation(line: 106, column: 16, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !7, line: 103, column: 5)
!170 = !DILocation(line: 106, column: 14, scope: !169)
!171 = !DILocation(line: 107, column: 9, scope: !169)
!172 = !DILocation(line: 107, column: 17, scope: !169)
!173 = !DILocation(line: 108, column: 5, scope: !169)
!174 = !DILocalVariable(name: "source", scope: !175, file: !7, line: 110, type: !30)
!175 = distinct !DILexicalBlock(scope: !157, file: !7, line: 109, column: 5)
!176 = !DILocation(line: 110, column: 14, scope: !175)
!177 = !DILocalVariable(name: "i", scope: !175, file: !7, line: 111, type: !48)
!178 = !DILocation(line: 111, column: 16, scope: !175)
!179 = !DILocalVariable(name: "sourceLen", scope: !175, file: !7, line: 111, type: !48)
!180 = !DILocation(line: 111, column: 19, scope: !175)
!181 = !DILocation(line: 112, column: 28, scope: !175)
!182 = !DILocation(line: 112, column: 21, scope: !175)
!183 = !DILocation(line: 112, column: 19, scope: !175)
!184 = !DILocation(line: 115, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !175, file: !7, line: 115, column: 9)
!186 = !DILocation(line: 115, column: 14, scope: !185)
!187 = !DILocation(line: 115, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !7, line: 115, column: 9)
!189 = !DILocation(line: 115, column: 25, scope: !188)
!190 = !DILocation(line: 115, column: 35, scope: !188)
!191 = !DILocation(line: 115, column: 23, scope: !188)
!192 = !DILocation(line: 115, column: 9, scope: !185)
!193 = !DILocation(line: 117, column: 30, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !7, line: 116, column: 9)
!195 = !DILocation(line: 117, column: 23, scope: !194)
!196 = !DILocation(line: 117, column: 13, scope: !194)
!197 = !DILocation(line: 117, column: 18, scope: !194)
!198 = !DILocation(line: 117, column: 21, scope: !194)
!199 = !DILocation(line: 118, column: 9, scope: !194)
!200 = !DILocation(line: 115, column: 41, scope: !188)
!201 = !DILocation(line: 115, column: 9, scope: !188)
!202 = distinct !{!202, !192, !203, !79}
!203 = !DILocation(line: 118, column: 9, scope: !185)
!204 = !DILocation(line: 119, column: 19, scope: !175)
!205 = !DILocation(line: 119, column: 9, scope: !175)
!206 = !DILocation(line: 121, column: 1, scope: !157)
