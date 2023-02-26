; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_badSink(i32* noundef %data) #0 !dbg !11 {
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
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_bad() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !82
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !83
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !84
  store i32 0, i32* %arrayidx, align 4, !dbg !85
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !87
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !88
  store i32 0, i32* %arrayidx3, align 4, !dbg !89
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !90
  store i32* %arraydecay4, i32** %data, align 8, !dbg !91
  %0 = load i32*, i32** %data, align 8, !dbg !92
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_badSink(i32* noundef %0), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_goodG2BSink(i32* noundef %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i64* %i, metadata !98, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !106
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !110
  store i64 %call2, i64* %destLen, align 8, !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !115
  %1 = load i64, i64* %destLen, align 8, !dbg !117
  %cmp = icmp ult i64 %0, %1, !dbg !118
  br i1 %cmp, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data.addr, align 8, !dbg !120
  %3 = load i64, i64* %i, align 8, !dbg !122
  %arrayidx3 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !120
  %4 = load i32, i32* %arrayidx3, align 4, !dbg !120
  %5 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !124
  store i32 %4, i32* %arrayidx4, align 4, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !127
  %inc = add i64 %6, 1, !dbg !127
  store i64 %inc, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !131
  store i32 0, i32* %arrayidx5, align 4, !dbg !132
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !133
  call void @printWLine(i32* noundef %arraydecay6), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_good() #0 !dbg !136 {
entry:
  call void @goodG2B(), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !139 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !145, metadata !DIExpression()), !dbg !146
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !147, metadata !DIExpression()), !dbg !148
  %call = call i64 @time(i64* noundef null), !dbg !149
  %conv = trunc i64 %call to i32, !dbg !150
  call void @srand(i32 noundef %conv), !dbg !151
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !152
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_good(), !dbg !153
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !154
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !155
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_bad(), !dbg !156
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !157
  ret i32 0, !dbg !158
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !159 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !166
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !167
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !168
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !170
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !171
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !172
  store i32 0, i32* %arrayidx3, align 4, !dbg !173
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !174
  store i32* %arraydecay4, i32** %data, align 8, !dbg !175
  %0 = load i32*, i32** %data, align 8, !dbg !176
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_41_goodG2BSink(i32* noundef %0), !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 34, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !19, line: 106, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!23 = !DILocation(line: 23, column: 72, scope: !11)
!24 = !DILocalVariable(name: "i", scope: !25, file: !12, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !27, line: 31, baseType: !28)
!27 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !19, line: 94, baseType: !29)
!29 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!30 = !DILocation(line: 26, column: 16, scope: !25)
!31 = !DILocalVariable(name: "destLen", scope: !25, file: !12, line: 26, type: !26)
!32 = !DILocation(line: 26, column: 19, scope: !25)
!33 = !DILocalVariable(name: "dest", scope: !25, file: !12, line: 27, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !35)
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
!46 = distinct !DILexicalBlock(scope: !25, file: !12, line: 33, column: 9)
!47 = !DILocation(line: 33, column: 14, scope: !46)
!48 = !DILocation(line: 33, column: 21, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 33, column: 9)
!50 = !DILocation(line: 33, column: 25, scope: !49)
!51 = !DILocation(line: 33, column: 23, scope: !49)
!52 = !DILocation(line: 33, column: 9, scope: !46)
!53 = !DILocation(line: 35, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !49, file: !12, line: 34, column: 9)
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
!69 = !DILocation(line: 40, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_41_bad", scope: !12, file: !12, line: 42, type: !71, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!71 = !DISubroutineType(types: !72)
!72 = !{null}
!73 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 44, type: !15)
!74 = !DILocation(line: 44, column: 15, scope: !70)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 45, type: !76)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 50)
!79 = !DILocation(line: 45, column: 13, scope: !70)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 46, type: !34)
!81 = !DILocation(line: 46, column: 13, scope: !70)
!82 = !DILocation(line: 47, column: 13, scope: !70)
!83 = !DILocation(line: 47, column: 5, scope: !70)
!84 = !DILocation(line: 48, column: 5, scope: !70)
!85 = !DILocation(line: 48, column: 25, scope: !70)
!86 = !DILocation(line: 49, column: 13, scope: !70)
!87 = !DILocation(line: 49, column: 5, scope: !70)
!88 = !DILocation(line: 50, column: 5, scope: !70)
!89 = !DILocation(line: 50, column: 27, scope: !70)
!90 = !DILocation(line: 52, column: 12, scope: !70)
!91 = !DILocation(line: 52, column: 10, scope: !70)
!92 = !DILocation(line: 53, column: 61, scope: !70)
!93 = !DILocation(line: 53, column: 5, scope: !70)
!94 = !DILocation(line: 54, column: 1, scope: !70)
!95 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !12, line: 60, type: !15)
!97 = !DILocation(line: 60, column: 76, scope: !95)
!98 = !DILocalVariable(name: "i", scope: !99, file: !12, line: 63, type: !26)
!99 = distinct !DILexicalBlock(scope: !95, file: !12, line: 62, column: 5)
!100 = !DILocation(line: 63, column: 16, scope: !99)
!101 = !DILocalVariable(name: "destLen", scope: !99, file: !12, line: 63, type: !26)
!102 = !DILocation(line: 63, column: 19, scope: !99)
!103 = !DILocalVariable(name: "dest", scope: !99, file: !12, line: 64, type: !34)
!104 = !DILocation(line: 64, column: 17, scope: !99)
!105 = !DILocation(line: 65, column: 17, scope: !99)
!106 = !DILocation(line: 65, column: 9, scope: !99)
!107 = !DILocation(line: 66, column: 9, scope: !99)
!108 = !DILocation(line: 66, column: 21, scope: !99)
!109 = !DILocation(line: 67, column: 26, scope: !99)
!110 = !DILocation(line: 67, column: 19, scope: !99)
!111 = !DILocation(line: 67, column: 17, scope: !99)
!112 = !DILocation(line: 70, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !99, file: !12, line: 70, column: 9)
!114 = !DILocation(line: 70, column: 14, scope: !113)
!115 = !DILocation(line: 70, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 70, column: 9)
!117 = !DILocation(line: 70, column: 25, scope: !116)
!118 = !DILocation(line: 70, column: 23, scope: !116)
!119 = !DILocation(line: 70, column: 9, scope: !113)
!120 = !DILocation(line: 72, column: 23, scope: !121)
!121 = distinct !DILexicalBlock(scope: !116, file: !12, line: 71, column: 9)
!122 = !DILocation(line: 72, column: 28, scope: !121)
!123 = !DILocation(line: 72, column: 18, scope: !121)
!124 = !DILocation(line: 72, column: 13, scope: !121)
!125 = !DILocation(line: 72, column: 21, scope: !121)
!126 = !DILocation(line: 73, column: 9, scope: !121)
!127 = !DILocation(line: 70, column: 35, scope: !116)
!128 = !DILocation(line: 70, column: 9, scope: !116)
!129 = distinct !{!129, !119, !130, !64}
!130 = !DILocation(line: 73, column: 9, scope: !113)
!131 = !DILocation(line: 74, column: 9, scope: !99)
!132 = !DILocation(line: 74, column: 21, scope: !99)
!133 = !DILocation(line: 75, column: 20, scope: !99)
!134 = !DILocation(line: 75, column: 9, scope: !99)
!135 = !DILocation(line: 77, column: 1, scope: !95)
!136 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_41_good", scope: !12, file: !12, line: 94, type: !71, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!137 = !DILocation(line: 96, column: 5, scope: !136)
!138 = !DILocation(line: 97, column: 1, scope: !136)
!139 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !140, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!140 = !DISubroutineType(types: !141)
!141 = !{!20, !20, !142}
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!144 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!145 = !DILocalVariable(name: "argc", arg: 1, scope: !139, file: !12, line: 109, type: !20)
!146 = !DILocation(line: 109, column: 14, scope: !139)
!147 = !DILocalVariable(name: "argv", arg: 2, scope: !139, file: !12, line: 109, type: !142)
!148 = !DILocation(line: 109, column: 27, scope: !139)
!149 = !DILocation(line: 112, column: 22, scope: !139)
!150 = !DILocation(line: 112, column: 12, scope: !139)
!151 = !DILocation(line: 112, column: 5, scope: !139)
!152 = !DILocation(line: 114, column: 5, scope: !139)
!153 = !DILocation(line: 115, column: 5, scope: !139)
!154 = !DILocation(line: 116, column: 5, scope: !139)
!155 = !DILocation(line: 119, column: 5, scope: !139)
!156 = !DILocation(line: 120, column: 5, scope: !139)
!157 = !DILocation(line: 121, column: 5, scope: !139)
!158 = !DILocation(line: 123, column: 5, scope: !139)
!159 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 80, type: !71, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!160 = !DILocalVariable(name: "data", scope: !159, file: !12, line: 82, type: !15)
!161 = !DILocation(line: 82, column: 15, scope: !159)
!162 = !DILocalVariable(name: "dataBadBuffer", scope: !159, file: !12, line: 83, type: !76)
!163 = !DILocation(line: 83, column: 13, scope: !159)
!164 = !DILocalVariable(name: "dataGoodBuffer", scope: !159, file: !12, line: 84, type: !34)
!165 = !DILocation(line: 84, column: 13, scope: !159)
!166 = !DILocation(line: 85, column: 13, scope: !159)
!167 = !DILocation(line: 85, column: 5, scope: !159)
!168 = !DILocation(line: 86, column: 5, scope: !159)
!169 = !DILocation(line: 86, column: 25, scope: !159)
!170 = !DILocation(line: 87, column: 13, scope: !159)
!171 = !DILocation(line: 87, column: 5, scope: !159)
!172 = !DILocation(line: 88, column: 5, scope: !159)
!173 = !DILocation(line: 88, column: 27, scope: !159)
!174 = !DILocation(line: 90, column: 12, scope: !159)
!175 = !DILocation(line: 90, column: 10, scope: !159)
!176 = !DILocation(line: 91, column: 65, scope: !159)
!177 = !DILocation(line: 91, column: 5, scope: !159)
!178 = !DILocation(line: 92, column: 1, scope: !159)
