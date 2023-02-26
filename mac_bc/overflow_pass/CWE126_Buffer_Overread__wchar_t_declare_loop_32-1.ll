; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data4 = alloca i32*, align 8
  %data6 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !28
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
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !47, metadata !DIExpression()), !dbg !49
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !50
  %1 = load i32*, i32** %0, align 8, !dbg !51
  store i32* %1, i32** %data4, align 8, !dbg !49
  %arraydecay5 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !52
  store i32* %arraydecay5, i32** %data4, align 8, !dbg !53
  %2 = load i32*, i32** %data4, align 8, !dbg !54
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !55
  store i32* %2, i32** %3, align 8, !dbg !56
  call void @llvm.dbg.declare(metadata i32** %data6, metadata !57, metadata !DIExpression()), !dbg !59
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !60
  %5 = load i32*, i32** %4, align 8, !dbg !61
  store i32* %5, i32** %data6, align 8, !dbg !59
  call void @llvm.dbg.declare(metadata i64* %i, metadata !62, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !72
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !73
  %call8 = call i32* @wmemset(i32* noundef %arraydecay7, i32 noundef 67, i64 noundef 99), !dbg !74
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !75
  store i32 0, i32* %arrayidx9, align 4, !dbg !76
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !77
  %call11 = call i64 @wcslen(i32* noundef %arraydecay10), !dbg !78
  store i64 %call11, i64* %destLen, align 8, !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !83
  %7 = load i64, i64* %destLen, align 8, !dbg !85
  %cmp = icmp ult i64 %6, %7, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data6, align 8, !dbg !88
  %9 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !88
  %10 = load i32, i32* %arrayidx12, align 4, !dbg !88
  %11 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !92
  store i32 %10, i32* %arrayidx13, align 4, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %12, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !100
  store i32 0, i32* %arrayidx14, align 4, !dbg !101
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !102
  call void @printWLine(i32* noundef %arraydecay15), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_32_good() #0 !dbg !105 {
entry:
  call void @goodG2B(), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !108 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i64 @time(i64* noundef null), !dbg !118
  %conv = trunc i64 %call to i32, !dbg !119
  call void @srand(i32 noundef %conv), !dbg !120
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !121
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_32_good(), !dbg !122
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !123
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !124
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_32_bad(), !dbg !125
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !126
  ret i32 0, !dbg !127
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !128 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data4 = alloca i32*, align 8
  %data6 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !131, metadata !DIExpression()), !dbg !132
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !133, metadata !DIExpression()), !dbg !134
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !139
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !140
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !143
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !144
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !145
  store i32 0, i32* %arrayidx3, align 4, !dbg !146
  call void @llvm.dbg.declare(metadata i32** %data4, metadata !147, metadata !DIExpression()), !dbg !149
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !150
  %1 = load i32*, i32** %0, align 8, !dbg !151
  store i32* %1, i32** %data4, align 8, !dbg !149
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !152
  store i32* %arraydecay5, i32** %data4, align 8, !dbg !153
  %2 = load i32*, i32** %data4, align 8, !dbg !154
  %3 = load i32**, i32*** %dataPtr1, align 8, !dbg !155
  store i32* %2, i32** %3, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata i32** %data6, metadata !157, metadata !DIExpression()), !dbg !159
  %4 = load i32**, i32*** %dataPtr2, align 8, !dbg !160
  %5 = load i32*, i32** %4, align 8, !dbg !161
  store i32* %5, i32** %data6, align 8, !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !165, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !167, metadata !DIExpression()), !dbg !168
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !169
  %call8 = call i32* @wmemset(i32* noundef %arraydecay7, i32 noundef 67, i64 noundef 99), !dbg !170
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !171
  store i32 0, i32* %arrayidx9, align 4, !dbg !172
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  %call11 = call i64 @wcslen(i32* noundef %arraydecay10), !dbg !174
  store i64 %call11, i64* %destLen, align 8, !dbg !175
  store i64 0, i64* %i, align 8, !dbg !176
  br label %for.cond, !dbg !178

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !179
  %7 = load i64, i64* %destLen, align 8, !dbg !181
  %cmp = icmp ult i64 %6, %7, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data6, align 8, !dbg !184
  %9 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx12 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !184
  %10 = load i32, i32* %arrayidx12, align 4, !dbg !184
  %11 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %11, !dbg !188
  store i32 %10, i32* %arrayidx13, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %12, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %arrayidx14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !195
  store i32 0, i32* %arrayidx14, align 4, !dbg !196
  %arraydecay15 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !197
  call void @printWLine(i32* noundef %arraydecay15), !dbg !198
  ret void, !dbg !199
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!24 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!26 = !DILocation(line: 26, column: 16, scope: !11)
!27 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !25)
!28 = !DILocation(line: 27, column: 16, scope: !11)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 28, column: 13, scope: !11)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 29, column: 13, scope: !11)
!39 = !DILocation(line: 30, column: 13, scope: !11)
!40 = !DILocation(line: 30, column: 5, scope: !11)
!41 = !DILocation(line: 31, column: 5, scope: !11)
!42 = !DILocation(line: 31, column: 25, scope: !11)
!43 = !DILocation(line: 32, column: 13, scope: !11)
!44 = !DILocation(line: 32, column: 5, scope: !11)
!45 = !DILocation(line: 33, column: 5, scope: !11)
!46 = !DILocation(line: 33, column: 27, scope: !11)
!47 = !DILocalVariable(name: "data", scope: !48, file: !12, line: 35, type: !17)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!49 = !DILocation(line: 35, column: 19, scope: !48)
!50 = !DILocation(line: 35, column: 27, scope: !48)
!51 = !DILocation(line: 35, column: 26, scope: !48)
!52 = !DILocation(line: 37, column: 16, scope: !48)
!53 = !DILocation(line: 37, column: 14, scope: !48)
!54 = !DILocation(line: 38, column: 21, scope: !48)
!55 = !DILocation(line: 38, column: 10, scope: !48)
!56 = !DILocation(line: 38, column: 19, scope: !48)
!57 = !DILocalVariable(name: "data", scope: !58, file: !12, line: 41, type: !17)
!58 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!59 = !DILocation(line: 41, column: 19, scope: !58)
!60 = !DILocation(line: 41, column: 27, scope: !58)
!61 = !DILocation(line: 41, column: 26, scope: !58)
!62 = !DILocalVariable(name: "i", scope: !63, file: !12, line: 43, type: !64)
!63 = distinct !DILexicalBlock(scope: !58, file: !12, line: 42, column: 9)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !65, line: 31, baseType: !66)
!65 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !67)
!67 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!68 = !DILocation(line: 43, column: 20, scope: !63)
!69 = !DILocalVariable(name: "destLen", scope: !63, file: !12, line: 43, type: !64)
!70 = !DILocation(line: 43, column: 23, scope: !63)
!71 = !DILocalVariable(name: "dest", scope: !63, file: !12, line: 44, type: !35)
!72 = !DILocation(line: 44, column: 21, scope: !63)
!73 = !DILocation(line: 45, column: 21, scope: !63)
!74 = !DILocation(line: 45, column: 13, scope: !63)
!75 = !DILocation(line: 46, column: 13, scope: !63)
!76 = !DILocation(line: 46, column: 25, scope: !63)
!77 = !DILocation(line: 47, column: 30, scope: !63)
!78 = !DILocation(line: 47, column: 23, scope: !63)
!79 = !DILocation(line: 47, column: 21, scope: !63)
!80 = !DILocation(line: 50, column: 20, scope: !81)
!81 = distinct !DILexicalBlock(scope: !63, file: !12, line: 50, column: 13)
!82 = !DILocation(line: 50, column: 18, scope: !81)
!83 = !DILocation(line: 50, column: 25, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !12, line: 50, column: 13)
!85 = !DILocation(line: 50, column: 29, scope: !84)
!86 = !DILocation(line: 50, column: 27, scope: !84)
!87 = !DILocation(line: 50, column: 13, scope: !81)
!88 = !DILocation(line: 52, column: 27, scope: !89)
!89 = distinct !DILexicalBlock(scope: !84, file: !12, line: 51, column: 13)
!90 = !DILocation(line: 52, column: 32, scope: !89)
!91 = !DILocation(line: 52, column: 22, scope: !89)
!92 = !DILocation(line: 52, column: 17, scope: !89)
!93 = !DILocation(line: 52, column: 25, scope: !89)
!94 = !DILocation(line: 53, column: 13, scope: !89)
!95 = !DILocation(line: 50, column: 39, scope: !84)
!96 = !DILocation(line: 50, column: 13, scope: !84)
!97 = distinct !{!97, !87, !98, !99}
!98 = !DILocation(line: 53, column: 13, scope: !81)
!99 = !{!"llvm.loop.mustprogress"}
!100 = !DILocation(line: 54, column: 13, scope: !63)
!101 = !DILocation(line: 54, column: 25, scope: !63)
!102 = !DILocation(line: 55, column: 24, scope: !63)
!103 = !DILocation(line: 55, column: 13, scope: !63)
!104 = !DILocation(line: 58, column: 1, scope: !11)
!105 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_32_good", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!106 = !DILocation(line: 104, column: 5, scope: !105)
!107 = !DILocation(line: 105, column: 1, scope: !105)
!108 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 116, type: !109, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!109 = !DISubroutineType(types: !110)
!110 = !{!22, !22, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!114 = !DILocalVariable(name: "argc", arg: 1, scope: !108, file: !12, line: 116, type: !22)
!115 = !DILocation(line: 116, column: 14, scope: !108)
!116 = !DILocalVariable(name: "argv", arg: 2, scope: !108, file: !12, line: 116, type: !111)
!117 = !DILocation(line: 116, column: 27, scope: !108)
!118 = !DILocation(line: 119, column: 22, scope: !108)
!119 = !DILocation(line: 119, column: 12, scope: !108)
!120 = !DILocation(line: 119, column: 5, scope: !108)
!121 = !DILocation(line: 121, column: 5, scope: !108)
!122 = !DILocation(line: 122, column: 5, scope: !108)
!123 = !DILocation(line: 123, column: 5, scope: !108)
!124 = !DILocation(line: 126, column: 5, scope: !108)
!125 = !DILocation(line: 127, column: 5, scope: !108)
!126 = !DILocation(line: 128, column: 5, scope: !108)
!127 = !DILocation(line: 130, column: 5, scope: !108)
!128 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!129 = !DILocalVariable(name: "data", scope: !128, file: !12, line: 67, type: !17)
!130 = !DILocation(line: 67, column: 15, scope: !128)
!131 = !DILocalVariable(name: "dataPtr1", scope: !128, file: !12, line: 68, type: !25)
!132 = !DILocation(line: 68, column: 16, scope: !128)
!133 = !DILocalVariable(name: "dataPtr2", scope: !128, file: !12, line: 69, type: !25)
!134 = !DILocation(line: 69, column: 16, scope: !128)
!135 = !DILocalVariable(name: "dataBadBuffer", scope: !128, file: !12, line: 70, type: !30)
!136 = !DILocation(line: 70, column: 13, scope: !128)
!137 = !DILocalVariable(name: "dataGoodBuffer", scope: !128, file: !12, line: 71, type: !35)
!138 = !DILocation(line: 71, column: 13, scope: !128)
!139 = !DILocation(line: 72, column: 13, scope: !128)
!140 = !DILocation(line: 72, column: 5, scope: !128)
!141 = !DILocation(line: 73, column: 5, scope: !128)
!142 = !DILocation(line: 73, column: 25, scope: !128)
!143 = !DILocation(line: 74, column: 13, scope: !128)
!144 = !DILocation(line: 74, column: 5, scope: !128)
!145 = !DILocation(line: 75, column: 5, scope: !128)
!146 = !DILocation(line: 75, column: 27, scope: !128)
!147 = !DILocalVariable(name: "data", scope: !148, file: !12, line: 77, type: !17)
!148 = distinct !DILexicalBlock(scope: !128, file: !12, line: 76, column: 5)
!149 = !DILocation(line: 77, column: 19, scope: !148)
!150 = !DILocation(line: 77, column: 27, scope: !148)
!151 = !DILocation(line: 77, column: 26, scope: !148)
!152 = !DILocation(line: 79, column: 16, scope: !148)
!153 = !DILocation(line: 79, column: 14, scope: !148)
!154 = !DILocation(line: 80, column: 21, scope: !148)
!155 = !DILocation(line: 80, column: 10, scope: !148)
!156 = !DILocation(line: 80, column: 19, scope: !148)
!157 = !DILocalVariable(name: "data", scope: !158, file: !12, line: 83, type: !17)
!158 = distinct !DILexicalBlock(scope: !128, file: !12, line: 82, column: 5)
!159 = !DILocation(line: 83, column: 19, scope: !158)
!160 = !DILocation(line: 83, column: 27, scope: !158)
!161 = !DILocation(line: 83, column: 26, scope: !158)
!162 = !DILocalVariable(name: "i", scope: !163, file: !12, line: 85, type: !64)
!163 = distinct !DILexicalBlock(scope: !158, file: !12, line: 84, column: 9)
!164 = !DILocation(line: 85, column: 20, scope: !163)
!165 = !DILocalVariable(name: "destLen", scope: !163, file: !12, line: 85, type: !64)
!166 = !DILocation(line: 85, column: 23, scope: !163)
!167 = !DILocalVariable(name: "dest", scope: !163, file: !12, line: 86, type: !35)
!168 = !DILocation(line: 86, column: 21, scope: !163)
!169 = !DILocation(line: 87, column: 21, scope: !163)
!170 = !DILocation(line: 87, column: 13, scope: !163)
!171 = !DILocation(line: 88, column: 13, scope: !163)
!172 = !DILocation(line: 88, column: 25, scope: !163)
!173 = !DILocation(line: 89, column: 30, scope: !163)
!174 = !DILocation(line: 89, column: 23, scope: !163)
!175 = !DILocation(line: 89, column: 21, scope: !163)
!176 = !DILocation(line: 92, column: 20, scope: !177)
!177 = distinct !DILexicalBlock(scope: !163, file: !12, line: 92, column: 13)
!178 = !DILocation(line: 92, column: 18, scope: !177)
!179 = !DILocation(line: 92, column: 25, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !12, line: 92, column: 13)
!181 = !DILocation(line: 92, column: 29, scope: !180)
!182 = !DILocation(line: 92, column: 27, scope: !180)
!183 = !DILocation(line: 92, column: 13, scope: !177)
!184 = !DILocation(line: 94, column: 27, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !12, line: 93, column: 13)
!186 = !DILocation(line: 94, column: 32, scope: !185)
!187 = !DILocation(line: 94, column: 22, scope: !185)
!188 = !DILocation(line: 94, column: 17, scope: !185)
!189 = !DILocation(line: 94, column: 25, scope: !185)
!190 = !DILocation(line: 95, column: 13, scope: !185)
!191 = !DILocation(line: 92, column: 39, scope: !180)
!192 = !DILocation(line: 92, column: 13, scope: !180)
!193 = distinct !{!193, !183, !194, !99}
!194 = !DILocation(line: 95, column: 13, scope: !177)
!195 = !DILocation(line: 96, column: 13, scope: !163)
!196 = !DILocation(line: 96, column: 25, scope: !163)
!197 = !DILocation(line: 97, column: 24, scope: !163)
!198 = !DILocation(line: 97, column: 13, scope: !163)
!199 = !DILocation(line: 100, column: 1, scope: !128)
