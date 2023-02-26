; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  store i8* %2, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* noundef null), !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 noundef %conv), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_good(), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_bad(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata i64* %i, metadata !65, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !73, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !78
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx, align 1, !dbg !80
  store i64 0, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !83

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !84
  %cmp = icmp ult i64 %1, 100, !dbg !86
  br i1 %cmp, label %for.body, label %for.end, !dbg !87

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !88
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !90
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %5 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !91
  store i8 %3, i8* %arrayidx2, align 1, !dbg !93
  br label %for.inc, !dbg !94

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !95
  %inc = add i64 %6, 1, !dbg !95
  store i64 %inc, i64* %i, align 8, !dbg !95
  br label %for.cond, !dbg !96, !llvm.loop !97

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !100
  store i8 0, i8* %arrayidx3, align 1, !dbg !101
  %8 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* noundef %8), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 50, align 16, !dbg !110
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %1 = alloca i8, i64 100, align 16, !dbg !113
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !112
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !114
  store i8* %2, i8** %data, align 8, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %4 = load i8*, i8** %data, align 8, !dbg !118
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_goodG2BData, align 8, !dbg !119
  call void @goodG2BSink(), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !122 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_goodG2BData, align 8, !dbg !125
  store i8* %0, i8** %data, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !129, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  store i64 0, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !136

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !137
  %cmp = icmp ult i64 %1, 100, !dbg !139
  br i1 %cmp, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !143
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !143
  %4 = load i8*, i8** %data, align 8, !dbg !144
  %5 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !144
  store i8 %3, i8* %arrayidx2, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %6, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !152
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !152
  store i8 0, i8* %arrayidx3, align 1, !dbg !153
  %8 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* noundef %8), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_badData", scope: !2, file: !11, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_goodG2BData", scope: !2, file: !11, line: 22, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_bad", scope: !11, file: !11, line: 44, type: !20, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 46, type: !5)
!24 = !DILocation(line: 46, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !11, line: 47, type: !5)
!26 = !DILocation(line: 47, column: 12, scope: !19)
!27 = !DILocation(line: 47, column: 36, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !11, line: 48, type: !5)
!29 = !DILocation(line: 48, column: 12, scope: !19)
!30 = !DILocation(line: 48, column: 37, scope: !19)
!31 = !DILocation(line: 51, column: 12, scope: !19)
!32 = !DILocation(line: 51, column: 10, scope: !19)
!33 = !DILocation(line: 52, column: 5, scope: !19)
!34 = !DILocation(line: 52, column: 13, scope: !19)
!35 = !DILocation(line: 53, column: 78, scope: !19)
!36 = !DILocation(line: 53, column: 76, scope: !19)
!37 = !DILocation(line: 54, column: 5, scope: !19)
!38 = !DILocation(line: 55, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_45_good", scope: !11, file: !11, line: 92, type: !20, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!40 = !DILocation(line: 94, column: 5, scope: !39)
!41 = !DILocation(line: 95, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 106, type: !43, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !11, line: 106, type: !45)
!48 = !DILocation(line: 106, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !11, line: 106, type: !46)
!50 = !DILocation(line: 106, column: 27, scope: !42)
!51 = !DILocation(line: 109, column: 22, scope: !42)
!52 = !DILocation(line: 109, column: 12, scope: !42)
!53 = !DILocation(line: 109, column: 5, scope: !42)
!54 = !DILocation(line: 111, column: 5, scope: !42)
!55 = !DILocation(line: 112, column: 5, scope: !42)
!56 = !DILocation(line: 113, column: 5, scope: !42)
!57 = !DILocation(line: 116, column: 5, scope: !42)
!58 = !DILocation(line: 117, column: 5, scope: !42)
!59 = !DILocation(line: 118, column: 5, scope: !42)
!60 = !DILocation(line: 120, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!62 = !DILocalVariable(name: "data", scope: !61, file: !11, line: 28, type: !5)
!63 = !DILocation(line: 28, column: 12, scope: !61)
!64 = !DILocation(line: 28, column: 19, scope: !61)
!65 = !DILocalVariable(name: "i", scope: !66, file: !11, line: 30, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !11, line: 29, column: 5)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !68, line: 31, baseType: !69)
!68 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !70, line: 94, baseType: !71)
!70 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!71 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!72 = !DILocation(line: 30, column: 16, scope: !66)
!73 = !DILocalVariable(name: "source", scope: !66, file: !11, line: 31, type: !74)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 100)
!77 = !DILocation(line: 31, column: 14, scope: !66)
!78 = !DILocation(line: 32, column: 9, scope: !66)
!79 = !DILocation(line: 33, column: 9, scope: !66)
!80 = !DILocation(line: 33, column: 23, scope: !66)
!81 = !DILocation(line: 35, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !66, file: !11, line: 35, column: 9)
!83 = !DILocation(line: 35, column: 14, scope: !82)
!84 = !DILocation(line: 35, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !11, line: 35, column: 9)
!86 = !DILocation(line: 35, column: 23, scope: !85)
!87 = !DILocation(line: 35, column: 9, scope: !82)
!88 = !DILocation(line: 37, column: 30, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !11, line: 36, column: 9)
!90 = !DILocation(line: 37, column: 23, scope: !89)
!91 = !DILocation(line: 37, column: 13, scope: !89)
!92 = !DILocation(line: 37, column: 18, scope: !89)
!93 = !DILocation(line: 37, column: 21, scope: !89)
!94 = !DILocation(line: 38, column: 9, scope: !89)
!95 = !DILocation(line: 35, column: 31, scope: !85)
!96 = !DILocation(line: 35, column: 9, scope: !85)
!97 = distinct !{!97, !87, !98, !99}
!98 = !DILocation(line: 38, column: 9, scope: !82)
!99 = !{!"llvm.loop.mustprogress"}
!100 = !DILocation(line: 39, column: 9, scope: !66)
!101 = !DILocation(line: 39, column: 21, scope: !66)
!102 = !DILocation(line: 40, column: 19, scope: !66)
!103 = !DILocation(line: 40, column: 9, scope: !66)
!104 = !DILocation(line: 42, column: 1, scope: !61)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!106 = !DILocalVariable(name: "data", scope: !105, file: !11, line: 82, type: !5)
!107 = !DILocation(line: 82, column: 12, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !11, line: 83, type: !5)
!109 = !DILocation(line: 83, column: 12, scope: !105)
!110 = !DILocation(line: 83, column: 36, scope: !105)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !11, line: 84, type: !5)
!112 = !DILocation(line: 84, column: 12, scope: !105)
!113 = !DILocation(line: 84, column: 37, scope: !105)
!114 = !DILocation(line: 86, column: 12, scope: !105)
!115 = !DILocation(line: 86, column: 10, scope: !105)
!116 = !DILocation(line: 87, column: 5, scope: !105)
!117 = !DILocation(line: 87, column: 13, scope: !105)
!118 = !DILocation(line: 88, column: 82, scope: !105)
!119 = !DILocation(line: 88, column: 80, scope: !105)
!120 = !DILocation(line: 89, column: 5, scope: !105)
!121 = !DILocation(line: 90, column: 1, scope: !105)
!122 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!123 = !DILocalVariable(name: "data", scope: !122, file: !11, line: 64, type: !5)
!124 = !DILocation(line: 64, column: 12, scope: !122)
!125 = !DILocation(line: 64, column: 19, scope: !122)
!126 = !DILocalVariable(name: "i", scope: !127, file: !11, line: 66, type: !67)
!127 = distinct !DILexicalBlock(scope: !122, file: !11, line: 65, column: 5)
!128 = !DILocation(line: 66, column: 16, scope: !127)
!129 = !DILocalVariable(name: "source", scope: !127, file: !11, line: 67, type: !74)
!130 = !DILocation(line: 67, column: 14, scope: !127)
!131 = !DILocation(line: 68, column: 9, scope: !127)
!132 = !DILocation(line: 69, column: 9, scope: !127)
!133 = !DILocation(line: 69, column: 23, scope: !127)
!134 = !DILocation(line: 71, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !127, file: !11, line: 71, column: 9)
!136 = !DILocation(line: 71, column: 14, scope: !135)
!137 = !DILocation(line: 71, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !11, line: 71, column: 9)
!139 = !DILocation(line: 71, column: 23, scope: !138)
!140 = !DILocation(line: 71, column: 9, scope: !135)
!141 = !DILocation(line: 73, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !11, line: 72, column: 9)
!143 = !DILocation(line: 73, column: 23, scope: !142)
!144 = !DILocation(line: 73, column: 13, scope: !142)
!145 = !DILocation(line: 73, column: 18, scope: !142)
!146 = !DILocation(line: 73, column: 21, scope: !142)
!147 = !DILocation(line: 74, column: 9, scope: !142)
!148 = !DILocation(line: 71, column: 31, scope: !138)
!149 = !DILocation(line: 71, column: 9, scope: !138)
!150 = distinct !{!150, !140, !151, !99}
!151 = !DILocation(line: 74, column: 9, scope: !135)
!152 = !DILocation(line: 75, column: 9, scope: !127)
!153 = !DILocation(line: 75, column: 21, scope: !127)
!154 = !DILocation(line: 76, column: 19, scope: !127)
!155 = !DILocation(line: 76, column: 9, scope: !127)
!156 = !DILocation(line: 78, column: 1, scope: !122)
