; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @globalFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !54
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx2, align 4, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !60
  %cmp3 = icmp ult i64 %2, 100, !dbg !62
  br i1 %cmp3, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !66
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !66
  %5 = load i32*, i32** %data, align 8, !dbg !67
  %6 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !67
  store i32 %4, i32* %arrayidx5, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %7, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !76
  store i32 0, i32* %arrayidx6, align 4, !dbg !77
  %9 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* noundef %9), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_good() #0 !dbg !81 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_bad(), !dbg !102
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32, i32* @globalFive, align 4, !dbg !112
  %cmp = icmp ne i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i32* %arraydecay, i32** %data, align 8, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !129
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !130
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx2, align 4, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !136
  %cmp3 = icmp ult i64 %2, 100, !dbg !138
  br i1 %cmp3, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !142
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !142
  %5 = load i32*, i32** %data, align 8, !dbg !143
  %6 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !143
  store i32 %4, i32* %arrayidx5, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %7, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !151
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !151
  store i32 0, i32* %arrayidx6, align 4, !dbg !152
  %9 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* noundef %9), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = load i32, i32* @globalFive, align 4, !dbg !163
  %cmp = icmp eq i32 %0, 5, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !167
  store i32* %arraydecay, i32** %data, align 8, !dbg !169
  %1 = load i32*, i32** %data, align 8, !dbg !170
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !170
  store i32 0, i32* %arrayidx, align 4, !dbg !171
  br label %if.end, !dbg !172

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !173, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !176, metadata !DIExpression()), !dbg !177
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !178
  %call = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 67, i64 noundef 99), !dbg !179
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !180
  store i32 0, i32* %arrayidx2, align 4, !dbg !181
  store i64 0, i64* %i, align 8, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !185
  %cmp3 = icmp ult i64 %2, 100, !dbg !187
  br i1 %cmp3, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !191
  %4 = load i32, i32* %arrayidx4, align 4, !dbg !191
  %5 = load i32*, i32** %data, align 8, !dbg !192
  %6 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx5 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !192
  store i32 %4, i32* %arrayidx5, align 4, !dbg !194
  br label %for.inc, !dbg !195

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !196
  %inc = add i64 %7, 1, !dbg !196
  store i64 %inc, i64* %i, align 8, !dbg !196
  br label %for.cond, !dbg !197, !llvm.loop !198

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !200
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !200
  store i32 0, i32* %arrayidx6, align 4, !dbg !201
  %9 = load i32*, i32** %data, align 8, !dbg !202
  call void @printWLine(i32* noundef %9), !dbg !203
  ret void, !dbg !204
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 28, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!36 = !DILocation(line: 28, column: 18, scope: !35)
!37 = !DILocation(line: 28, column: 8, scope: !11)
!38 = !DILocation(line: 32, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 29, column: 5)
!40 = !DILocation(line: 32, column: 14, scope: !39)
!41 = !DILocation(line: 33, column: 9, scope: !39)
!42 = !DILocation(line: 33, column: 17, scope: !39)
!43 = !DILocation(line: 34, column: 5, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 36, type: !46)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !49)
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 36, column: 16, scope: !45)
!51 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 37, type: !30)
!52 = !DILocation(line: 37, column: 17, scope: !45)
!53 = !DILocation(line: 38, column: 17, scope: !45)
!54 = !DILocation(line: 38, column: 9, scope: !45)
!55 = !DILocation(line: 39, column: 9, scope: !45)
!56 = !DILocation(line: 39, column: 23, scope: !45)
!57 = !DILocation(line: 41, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !45, file: !12, line: 41, column: 9)
!59 = !DILocation(line: 41, column: 14, scope: !58)
!60 = !DILocation(line: 41, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !12, line: 41, column: 9)
!62 = !DILocation(line: 41, column: 23, scope: !61)
!63 = !DILocation(line: 41, column: 9, scope: !58)
!64 = !DILocation(line: 43, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !12, line: 42, column: 9)
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
!76 = !DILocation(line: 45, column: 9, scope: !45)
!77 = !DILocation(line: 45, column: 21, scope: !45)
!78 = !DILocation(line: 46, column: 20, scope: !45)
!79 = !DILocation(line: 46, column: 9, scope: !45)
!80 = !DILocation(line: 48, column: 1, scope: !11)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_14_good", scope: !12, file: !12, line: 113, type: !13, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DILocation(line: 115, column: 5, scope: !81)
!83 = !DILocation(line: 116, column: 5, scope: !81)
!84 = !DILocation(line: 117, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 129, type: !86, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!86 = !DISubroutineType(types: !87)
!87 = !{!22, !22, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 129, type: !22)
!92 = !DILocation(line: 129, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 129, type: !88)
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
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 57, type: !17)
!107 = !DILocation(line: 57, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 58, type: !25)
!109 = !DILocation(line: 58, column: 13, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 59, type: !30)
!111 = !DILocation(line: 59, column: 13, scope: !105)
!112 = !DILocation(line: 60, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !12, line: 60, column: 8)
!114 = !DILocation(line: 60, column: 18, scope: !113)
!115 = !DILocation(line: 60, column: 8, scope: !105)
!116 = !DILocation(line: 63, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 61, column: 5)
!118 = !DILocation(line: 64, column: 5, scope: !117)
!119 = !DILocation(line: 68, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !12, line: 66, column: 5)
!121 = !DILocation(line: 68, column: 14, scope: !120)
!122 = !DILocation(line: 69, column: 9, scope: !120)
!123 = !DILocation(line: 69, column: 17, scope: !120)
!124 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 72, type: !46)
!125 = distinct !DILexicalBlock(scope: !105, file: !12, line: 71, column: 5)
!126 = !DILocation(line: 72, column: 16, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !125, file: !12, line: 73, type: !30)
!128 = !DILocation(line: 73, column: 17, scope: !125)
!129 = !DILocation(line: 74, column: 17, scope: !125)
!130 = !DILocation(line: 74, column: 9, scope: !125)
!131 = !DILocation(line: 75, column: 9, scope: !125)
!132 = !DILocation(line: 75, column: 23, scope: !125)
!133 = !DILocation(line: 77, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !12, line: 77, column: 9)
!135 = !DILocation(line: 77, column: 14, scope: !134)
!136 = !DILocation(line: 77, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !12, line: 77, column: 9)
!138 = !DILocation(line: 77, column: 23, scope: !137)
!139 = !DILocation(line: 77, column: 9, scope: !134)
!140 = !DILocation(line: 79, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !12, line: 78, column: 9)
!142 = !DILocation(line: 79, column: 23, scope: !141)
!143 = !DILocation(line: 79, column: 13, scope: !141)
!144 = !DILocation(line: 79, column: 18, scope: !141)
!145 = !DILocation(line: 79, column: 21, scope: !141)
!146 = !DILocation(line: 80, column: 9, scope: !141)
!147 = !DILocation(line: 77, column: 31, scope: !137)
!148 = !DILocation(line: 77, column: 9, scope: !137)
!149 = distinct !{!149, !139, !150, !75}
!150 = !DILocation(line: 80, column: 9, scope: !134)
!151 = !DILocation(line: 81, column: 9, scope: !125)
!152 = !DILocation(line: 81, column: 21, scope: !125)
!153 = !DILocation(line: 82, column: 20, scope: !125)
!154 = !DILocation(line: 82, column: 9, scope: !125)
!155 = !DILocation(line: 84, column: 1, scope: !105)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!157 = !DILocalVariable(name: "data", scope: !156, file: !12, line: 89, type: !17)
!158 = !DILocation(line: 89, column: 15, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !12, line: 90, type: !25)
!160 = !DILocation(line: 90, column: 13, scope: !156)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !12, line: 91, type: !30)
!162 = !DILocation(line: 91, column: 13, scope: !156)
!163 = !DILocation(line: 92, column: 8, scope: !164)
!164 = distinct !DILexicalBlock(scope: !156, file: !12, line: 92, column: 8)
!165 = !DILocation(line: 92, column: 18, scope: !164)
!166 = !DILocation(line: 92, column: 8, scope: !156)
!167 = !DILocation(line: 95, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !12, line: 93, column: 5)
!169 = !DILocation(line: 95, column: 14, scope: !168)
!170 = !DILocation(line: 96, column: 9, scope: !168)
!171 = !DILocation(line: 96, column: 17, scope: !168)
!172 = !DILocation(line: 97, column: 5, scope: !168)
!173 = !DILocalVariable(name: "i", scope: !174, file: !12, line: 99, type: !46)
!174 = distinct !DILexicalBlock(scope: !156, file: !12, line: 98, column: 5)
!175 = !DILocation(line: 99, column: 16, scope: !174)
!176 = !DILocalVariable(name: "source", scope: !174, file: !12, line: 100, type: !30)
!177 = !DILocation(line: 100, column: 17, scope: !174)
!178 = !DILocation(line: 101, column: 17, scope: !174)
!179 = !DILocation(line: 101, column: 9, scope: !174)
!180 = !DILocation(line: 102, column: 9, scope: !174)
!181 = !DILocation(line: 102, column: 23, scope: !174)
!182 = !DILocation(line: 104, column: 16, scope: !183)
!183 = distinct !DILexicalBlock(scope: !174, file: !12, line: 104, column: 9)
!184 = !DILocation(line: 104, column: 14, scope: !183)
!185 = !DILocation(line: 104, column: 21, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !12, line: 104, column: 9)
!187 = !DILocation(line: 104, column: 23, scope: !186)
!188 = !DILocation(line: 104, column: 9, scope: !183)
!189 = !DILocation(line: 106, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !12, line: 105, column: 9)
!191 = !DILocation(line: 106, column: 23, scope: !190)
!192 = !DILocation(line: 106, column: 13, scope: !190)
!193 = !DILocation(line: 106, column: 18, scope: !190)
!194 = !DILocation(line: 106, column: 21, scope: !190)
!195 = !DILocation(line: 107, column: 9, scope: !190)
!196 = !DILocation(line: 104, column: 31, scope: !186)
!197 = !DILocation(line: 104, column: 9, scope: !186)
!198 = distinct !{!198, !188, !199, !75}
!199 = !DILocation(line: 107, column: 9, scope: !183)
!200 = !DILocation(line: 108, column: 9, scope: !174)
!201 = !DILocation(line: 108, column: 21, scope: !174)
!202 = !DILocation(line: 109, column: 20, scope: !174)
!203 = !DILocation(line: 109, column: 9, scope: !174)
!204 = !DILocation(line: 111, column: 1, scope: !156)
