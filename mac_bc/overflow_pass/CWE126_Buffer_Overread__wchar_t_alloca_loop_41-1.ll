; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_badSink(i32* noundef %data) #0 !dbg !17 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i64* %i, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !31, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !33, metadata !DIExpression()), !dbg !37
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !39
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !42
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !43
  store i64 %call2, i64* %destLen, align 8, !dbg !44
  store i64 0, i64* %i, align 8, !dbg !45
  br label %for.cond, !dbg !47

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !48
  %1 = load i64, i64* %destLen, align 8, !dbg !50
  %cmp = icmp ult i64 %0, %1, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !53
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !53
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !53
  %5 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !57
  store i32 %4, i32* %arrayidx4, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx5, align 4, !dbg !66
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  call void @printWLine(i32* noundef %arraydecay6), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_bad() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 200, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %2 = alloca i8, i64 400, align 16, !dbg !81
  %3 = bitcast i8* %2 to i32*, !dbg !82
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !80
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !83
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !84
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !85
  store i32 0, i32* %arrayidx, align 4, !dbg !86
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !87
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !88
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !89
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !89
  store i32 0, i32* %arrayidx2, align 4, !dbg !90
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !91
  store i32* %8, i32** %data, align 8, !dbg !92
  %9 = load i32*, i32** %data, align 8, !dbg !93
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_badSink(i32* noundef %9), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_goodG2BSink(i32* noundef %data) #0 !dbg !96 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i64* %i, metadata !99, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !107
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !111
  store i64 %call2, i64* %destLen, align 8, !dbg !112
  store i64 0, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !116
  %1 = load i64, i64* %destLen, align 8, !dbg !118
  %cmp = icmp ult i64 %0, %1, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !121
  %3 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !121
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !121
  %5 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !125
  store i32 %4, i32* %arrayidx4, align 4, !dbg !126
  br label %for.inc, !dbg !127

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !128
  %inc = add i64 %6, 1, !dbg !128
  store i64 %inc, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !129, !llvm.loop !130

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx5, align 4, !dbg !133
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  call void @printWLine(i32* noundef %arraydecay6), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_good() #0 !dbg !137 {
entry:
  call void @goodG2B(), !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !140 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !146, metadata !DIExpression()), !dbg !147
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !148, metadata !DIExpression()), !dbg !149
  %call = call i64 @time(i64* noundef null), !dbg !150
  %conv = trunc i64 %call to i32, !dbg !151
  call void @srand(i32 noundef %conv), !dbg !152
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !153
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_good(), !dbg !154
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !155
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !156
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_bad(), !dbg !157
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !158
  ret i32 0, !dbg !159
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !160 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  %0 = alloca i8, i64 200, align 16, !dbg !165
  %1 = bitcast i8* %0 to i32*, !dbg !166
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !164
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !167, metadata !DIExpression()), !dbg !168
  %2 = alloca i8, i64 400, align 16, !dbg !169
  %3 = bitcast i8* %2 to i32*, !dbg !170
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !168
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !171
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !172
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !173
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !173
  store i32 0, i32* %arrayidx, align 4, !dbg !174
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !175
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !176
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !177
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !177
  store i32 0, i32* %arrayidx2, align 4, !dbg !178
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !179
  store i32* %8, i32** %data, align 8, !dbg !180
  %9 = load i32*, i32** %data, align 8, !dbg !181
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_41_goodG2BSink(i32* noundef %9), !dbg !182
  ret void, !dbg !183
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_41_badSink", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null, !3}
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !17, file: !18, line: 23, type: !3)
!23 = !DILocation(line: 23, column: 71, scope: !17)
!24 = !DILocalVariable(name: "i", scope: !25, file: !18, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !17, file: !18, line: 25, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 31, baseType: !28)
!27 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !29)
!29 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 26, column: 16, scope: !25)
!31 = !DILocalVariable(name: "destLen", scope: !25, file: !18, line: 26, type: !26)
!32 = !DILocation(line: 26, column: 19, scope: !25)
!33 = !DILocalVariable(name: "dest", scope: !25, file: !18, line: 27, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 27, column: 17, scope: !25)
!38 = !DILocation(line: 28, column: 17, scope: !25)
!39 = !DILocation(line: 28, column: 9, scope: !25)
!40 = !DILocation(line: 29, column: 9, scope: !25)
!41 = !DILocation(line: 29, column: 21, scope: !25)
!42 = !DILocation(line: 30, column: 26, scope: !25)
!43 = !DILocation(line: 30, column: 19, scope: !25)
!44 = !DILocation(line: 30, column: 17, scope: !25)
!45 = !DILocation(line: 33, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !25, file: !18, line: 33, column: 9)
!47 = !DILocation(line: 33, column: 14, scope: !46)
!48 = !DILocation(line: 33, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !18, line: 33, column: 9)
!50 = !DILocation(line: 33, column: 25, scope: !49)
!51 = !DILocation(line: 33, column: 23, scope: !49)
!52 = !DILocation(line: 33, column: 9, scope: !46)
!53 = !DILocation(line: 35, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !18, line: 34, column: 9)
!55 = !DILocation(line: 35, column: 28, scope: !54)
!56 = !DILocation(line: 35, column: 18, scope: !54)
!57 = !DILocation(line: 35, column: 13, scope: !54)
!58 = !DILocation(line: 35, column: 21, scope: !54)
!59 = !DILocation(line: 36, column: 9, scope: !54)
!60 = !DILocation(line: 33, column: 35, scope: !49)
!61 = !DILocation(line: 33, column: 9, scope: !49)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 36, column: 9, scope: !46)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 37, column: 9, scope: !25)
!66 = !DILocation(line: 37, column: 21, scope: !25)
!67 = !DILocation(line: 38, column: 20, scope: !25)
!68 = !DILocation(line: 38, column: 9, scope: !25)
!69 = !DILocation(line: 40, column: 1, scope: !17)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_41_bad", scope: !18, file: !18, line: 42, type: !71, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!71 = !DISubroutineType(types: !72)
!72 = !{null}
!73 = !DILocalVariable(name: "data", scope: !70, file: !18, line: 44, type: !3)
!74 = !DILocation(line: 44, column: 15, scope: !70)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !18, line: 45, type: !3)
!76 = !DILocation(line: 45, column: 15, scope: !70)
!77 = !DILocation(line: 45, column: 42, scope: !70)
!78 = !DILocation(line: 45, column: 31, scope: !70)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !18, line: 46, type: !3)
!80 = !DILocation(line: 46, column: 15, scope: !70)
!81 = !DILocation(line: 46, column: 43, scope: !70)
!82 = !DILocation(line: 46, column: 32, scope: !70)
!83 = !DILocation(line: 47, column: 13, scope: !70)
!84 = !DILocation(line: 47, column: 5, scope: !70)
!85 = !DILocation(line: 48, column: 5, scope: !70)
!86 = !DILocation(line: 48, column: 25, scope: !70)
!87 = !DILocation(line: 49, column: 13, scope: !70)
!88 = !DILocation(line: 49, column: 5, scope: !70)
!89 = !DILocation(line: 50, column: 5, scope: !70)
!90 = !DILocation(line: 50, column: 27, scope: !70)
!91 = !DILocation(line: 52, column: 12, scope: !70)
!92 = !DILocation(line: 52, column: 10, scope: !70)
!93 = !DILocation(line: 53, column: 60, scope: !70)
!94 = !DILocation(line: 53, column: 5, scope: !70)
!95 = !DILocation(line: 54, column: 1, scope: !70)
!96 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_41_goodG2BSink", scope: !18, file: !18, line: 60, type: !19, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!97 = !DILocalVariable(name: "data", arg: 1, scope: !96, file: !18, line: 60, type: !3)
!98 = !DILocation(line: 60, column: 75, scope: !96)
!99 = !DILocalVariable(name: "i", scope: !100, file: !18, line: 63, type: !26)
!100 = distinct !DILexicalBlock(scope: !96, file: !18, line: 62, column: 5)
!101 = !DILocation(line: 63, column: 16, scope: !100)
!102 = !DILocalVariable(name: "destLen", scope: !100, file: !18, line: 63, type: !26)
!103 = !DILocation(line: 63, column: 19, scope: !100)
!104 = !DILocalVariable(name: "dest", scope: !100, file: !18, line: 64, type: !34)
!105 = !DILocation(line: 64, column: 17, scope: !100)
!106 = !DILocation(line: 65, column: 17, scope: !100)
!107 = !DILocation(line: 65, column: 9, scope: !100)
!108 = !DILocation(line: 66, column: 9, scope: !100)
!109 = !DILocation(line: 66, column: 21, scope: !100)
!110 = !DILocation(line: 67, column: 26, scope: !100)
!111 = !DILocation(line: 67, column: 19, scope: !100)
!112 = !DILocation(line: 67, column: 17, scope: !100)
!113 = !DILocation(line: 70, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !100, file: !18, line: 70, column: 9)
!115 = !DILocation(line: 70, column: 14, scope: !114)
!116 = !DILocation(line: 70, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !18, line: 70, column: 9)
!118 = !DILocation(line: 70, column: 25, scope: !117)
!119 = !DILocation(line: 70, column: 23, scope: !117)
!120 = !DILocation(line: 70, column: 9, scope: !114)
!121 = !DILocation(line: 72, column: 23, scope: !122)
!122 = distinct !DILexicalBlock(scope: !117, file: !18, line: 71, column: 9)
!123 = !DILocation(line: 72, column: 28, scope: !122)
!124 = !DILocation(line: 72, column: 18, scope: !122)
!125 = !DILocation(line: 72, column: 13, scope: !122)
!126 = !DILocation(line: 72, column: 21, scope: !122)
!127 = !DILocation(line: 73, column: 9, scope: !122)
!128 = !DILocation(line: 70, column: 35, scope: !117)
!129 = !DILocation(line: 70, column: 9, scope: !117)
!130 = distinct !{!130, !120, !131, !64}
!131 = !DILocation(line: 73, column: 9, scope: !114)
!132 = !DILocation(line: 74, column: 9, scope: !100)
!133 = !DILocation(line: 74, column: 21, scope: !100)
!134 = !DILocation(line: 75, column: 20, scope: !100)
!135 = !DILocation(line: 75, column: 9, scope: !100)
!136 = !DILocation(line: 77, column: 1, scope: !96)
!137 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_41_good", scope: !18, file: !18, line: 94, type: !71, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!138 = !DILocation(line: 96, column: 5, scope: !137)
!139 = !DILocation(line: 97, column: 1, scope: !137)
!140 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 109, type: !141, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!141 = !DISubroutineType(types: !142)
!142 = !{!8, !8, !143}
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !145, size: 64)
!145 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!146 = !DILocalVariable(name: "argc", arg: 1, scope: !140, file: !18, line: 109, type: !8)
!147 = !DILocation(line: 109, column: 14, scope: !140)
!148 = !DILocalVariable(name: "argv", arg: 2, scope: !140, file: !18, line: 109, type: !143)
!149 = !DILocation(line: 109, column: 27, scope: !140)
!150 = !DILocation(line: 112, column: 22, scope: !140)
!151 = !DILocation(line: 112, column: 12, scope: !140)
!152 = !DILocation(line: 112, column: 5, scope: !140)
!153 = !DILocation(line: 114, column: 5, scope: !140)
!154 = !DILocation(line: 115, column: 5, scope: !140)
!155 = !DILocation(line: 116, column: 5, scope: !140)
!156 = !DILocation(line: 119, column: 5, scope: !140)
!157 = !DILocation(line: 120, column: 5, scope: !140)
!158 = !DILocation(line: 121, column: 5, scope: !140)
!159 = !DILocation(line: 123, column: 5, scope: !140)
!160 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 80, type: !71, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!161 = !DILocalVariable(name: "data", scope: !160, file: !18, line: 82, type: !3)
!162 = !DILocation(line: 82, column: 15, scope: !160)
!163 = !DILocalVariable(name: "dataBadBuffer", scope: !160, file: !18, line: 83, type: !3)
!164 = !DILocation(line: 83, column: 15, scope: !160)
!165 = !DILocation(line: 83, column: 42, scope: !160)
!166 = !DILocation(line: 83, column: 31, scope: !160)
!167 = !DILocalVariable(name: "dataGoodBuffer", scope: !160, file: !18, line: 84, type: !3)
!168 = !DILocation(line: 84, column: 15, scope: !160)
!169 = !DILocation(line: 84, column: 43, scope: !160)
!170 = !DILocation(line: 84, column: 32, scope: !160)
!171 = !DILocation(line: 85, column: 13, scope: !160)
!172 = !DILocation(line: 85, column: 5, scope: !160)
!173 = !DILocation(line: 86, column: 5, scope: !160)
!174 = !DILocation(line: 86, column: 25, scope: !160)
!175 = !DILocation(line: 87, column: 13, scope: !160)
!176 = !DILocation(line: 87, column: 5, scope: !160)
!177 = !DILocation(line: 88, column: 5, scope: !160)
!178 = !DILocation(line: 88, column: 27, scope: !160)
!179 = !DILocation(line: 90, column: 12, scope: !160)
!180 = !DILocation(line: 90, column: 10, scope: !160)
!181 = !DILocation(line: 91, column: 64, scope: !160)
!182 = !DILocation(line: 91, column: 5, scope: !160)
!183 = !DILocation(line: 92, column: 1, scope: !160)
