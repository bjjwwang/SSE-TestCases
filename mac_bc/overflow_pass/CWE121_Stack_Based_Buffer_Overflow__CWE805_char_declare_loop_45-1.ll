; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay, i8** %data, align 8, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %1 = load i8*, i8** %data, align 8, !dbg !39
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* noundef null), !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 noundef %conv), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_badData, align 8, !dbg !68
  store i8* %0, i8** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !79
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !80
  store i8 0, i8* %arrayidx, align 1, !dbg !81
  store i64 0, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !84

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !85
  %cmp = icmp ult i64 %1, 100, !dbg !87
  br i1 %cmp, label %for.body, label %for.end, !dbg !88

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !91
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %5 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !92
  store i8 %3, i8* %arrayidx2, align 1, !dbg !94
  br label %for.inc, !dbg !95

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !96
  %inc = add i64 %6, 1, !dbg !96
  store i64 %inc, i64* %i, align 8, !dbg !96
  br label %for.cond, !dbg !97, !llvm.loop !98

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !101
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !101
  store i8 0, i8* %arrayidx3, align 1, !dbg !102
  %8 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* noundef %8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i8* %arraydecay, i8** %data, align 8, !dbg !114
  %0 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  %1 = load i8*, i8** %data, align 8, !dbg !117
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_goodG2BData, align 8, !dbg !118
  call void @goodG2BSink(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !121 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_goodG2BData, align 8, !dbg !124
  store i8* %0, i8** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !136
  %cmp = icmp ult i64 %1, 100, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %2, !dbg !142
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !142
  %4 = load i8*, i8** %data, align 8, !dbg !143
  %5 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !143
  store i8 %3, i8* %arrayidx2, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %6, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %7 = load i8*, i8** %data, align 8, !dbg !151
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !151
  store i8 0, i8* %arrayidx3, align 1, !dbg !152
  %8 = load i8*, i8** %data, align 8, !dbg !153
  call void @printLine(i8* noundef %8), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_badData", scope: !2, file: !9, line: 21, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_goodG2BData", scope: !2, file: !9, line: 22, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_bad", scope: !9, file: !9, line: 44, type: !20, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !9, line: 46, type: !10)
!24 = !DILocation(line: 46, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !9, line: 47, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 47, column: 10, scope: !19)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !9, line: 48, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 48, column: 10, scope: !19)
!35 = !DILocation(line: 51, column: 12, scope: !19)
!36 = !DILocation(line: 51, column: 10, scope: !19)
!37 = !DILocation(line: 52, column: 5, scope: !19)
!38 = !DILocation(line: 52, column: 13, scope: !19)
!39 = !DILocation(line: 53, column: 79, scope: !19)
!40 = !DILocation(line: 53, column: 77, scope: !19)
!41 = !DILocation(line: 54, column: 5, scope: !19)
!42 = !DILocation(line: 55, column: 1, scope: !19)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_45_good", scope: !9, file: !9, line: 92, type: !20, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!44 = !DILocation(line: 94, column: 5, scope: !43)
!45 = !DILocation(line: 95, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 106, type: !47, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !9, line: 106, type: !49)
!52 = !DILocation(line: 106, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !9, line: 106, type: !50)
!54 = !DILocation(line: 106, column: 27, scope: !46)
!55 = !DILocation(line: 109, column: 22, scope: !46)
!56 = !DILocation(line: 109, column: 12, scope: !46)
!57 = !DILocation(line: 109, column: 5, scope: !46)
!58 = !DILocation(line: 111, column: 5, scope: !46)
!59 = !DILocation(line: 112, column: 5, scope: !46)
!60 = !DILocation(line: 113, column: 5, scope: !46)
!61 = !DILocation(line: 116, column: 5, scope: !46)
!62 = !DILocation(line: 117, column: 5, scope: !46)
!63 = !DILocation(line: 118, column: 5, scope: !46)
!64 = !DILocation(line: 120, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!66 = !DILocalVariable(name: "data", scope: !65, file: !9, line: 28, type: !10)
!67 = !DILocation(line: 28, column: 12, scope: !65)
!68 = !DILocation(line: 28, column: 19, scope: !65)
!69 = !DILocalVariable(name: "i", scope: !70, file: !9, line: 30, type: !71)
!70 = distinct !DILexicalBlock(scope: !65, file: !9, line: 29, column: 5)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !72, line: 31, baseType: !73)
!72 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !74, line: 94, baseType: !75)
!74 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!75 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!76 = !DILocation(line: 30, column: 16, scope: !70)
!77 = !DILocalVariable(name: "source", scope: !70, file: !9, line: 31, type: !31)
!78 = !DILocation(line: 31, column: 14, scope: !70)
!79 = !DILocation(line: 32, column: 9, scope: !70)
!80 = !DILocation(line: 33, column: 9, scope: !70)
!81 = !DILocation(line: 33, column: 23, scope: !70)
!82 = !DILocation(line: 35, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !70, file: !9, line: 35, column: 9)
!84 = !DILocation(line: 35, column: 14, scope: !83)
!85 = !DILocation(line: 35, column: 21, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !9, line: 35, column: 9)
!87 = !DILocation(line: 35, column: 23, scope: !86)
!88 = !DILocation(line: 35, column: 9, scope: !83)
!89 = !DILocation(line: 37, column: 30, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !9, line: 36, column: 9)
!91 = !DILocation(line: 37, column: 23, scope: !90)
!92 = !DILocation(line: 37, column: 13, scope: !90)
!93 = !DILocation(line: 37, column: 18, scope: !90)
!94 = !DILocation(line: 37, column: 21, scope: !90)
!95 = !DILocation(line: 38, column: 9, scope: !90)
!96 = !DILocation(line: 35, column: 31, scope: !86)
!97 = !DILocation(line: 35, column: 9, scope: !86)
!98 = distinct !{!98, !88, !99, !100}
!99 = !DILocation(line: 38, column: 9, scope: !83)
!100 = !{!"llvm.loop.mustprogress"}
!101 = !DILocation(line: 39, column: 9, scope: !70)
!102 = !DILocation(line: 39, column: 21, scope: !70)
!103 = !DILocation(line: 40, column: 19, scope: !70)
!104 = !DILocation(line: 40, column: 9, scope: !70)
!105 = !DILocation(line: 42, column: 1, scope: !65)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!107 = !DILocalVariable(name: "data", scope: !106, file: !9, line: 82, type: !10)
!108 = !DILocation(line: 82, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !9, line: 83, type: !26)
!110 = !DILocation(line: 83, column: 10, scope: !106)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !9, line: 84, type: !31)
!112 = !DILocation(line: 84, column: 10, scope: !106)
!113 = !DILocation(line: 86, column: 12, scope: !106)
!114 = !DILocation(line: 86, column: 10, scope: !106)
!115 = !DILocation(line: 87, column: 5, scope: !106)
!116 = !DILocation(line: 87, column: 13, scope: !106)
!117 = !DILocation(line: 88, column: 83, scope: !106)
!118 = !DILocation(line: 88, column: 81, scope: !106)
!119 = !DILocation(line: 89, column: 5, scope: !106)
!120 = !DILocation(line: 90, column: 1, scope: !106)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!122 = !DILocalVariable(name: "data", scope: !121, file: !9, line: 64, type: !10)
!123 = !DILocation(line: 64, column: 12, scope: !121)
!124 = !DILocation(line: 64, column: 19, scope: !121)
!125 = !DILocalVariable(name: "i", scope: !126, file: !9, line: 66, type: !71)
!126 = distinct !DILexicalBlock(scope: !121, file: !9, line: 65, column: 5)
!127 = !DILocation(line: 66, column: 16, scope: !126)
!128 = !DILocalVariable(name: "source", scope: !126, file: !9, line: 67, type: !31)
!129 = !DILocation(line: 67, column: 14, scope: !126)
!130 = !DILocation(line: 68, column: 9, scope: !126)
!131 = !DILocation(line: 69, column: 9, scope: !126)
!132 = !DILocation(line: 69, column: 23, scope: !126)
!133 = !DILocation(line: 71, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !126, file: !9, line: 71, column: 9)
!135 = !DILocation(line: 71, column: 14, scope: !134)
!136 = !DILocation(line: 71, column: 21, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !9, line: 71, column: 9)
!138 = !DILocation(line: 71, column: 23, scope: !137)
!139 = !DILocation(line: 71, column: 9, scope: !134)
!140 = !DILocation(line: 73, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !9, line: 72, column: 9)
!142 = !DILocation(line: 73, column: 23, scope: !141)
!143 = !DILocation(line: 73, column: 13, scope: !141)
!144 = !DILocation(line: 73, column: 18, scope: !141)
!145 = !DILocation(line: 73, column: 21, scope: !141)
!146 = !DILocation(line: 74, column: 9, scope: !141)
!147 = !DILocation(line: 71, column: 31, scope: !137)
!148 = !DILocation(line: 71, column: 9, scope: !137)
!149 = distinct !{!149, !139, !150, !100}
!150 = !DILocation(line: 74, column: 9, scope: !134)
!151 = !DILocation(line: 75, column: 9, scope: !126)
!152 = !DILocation(line: 75, column: 21, scope: !126)
!153 = !DILocation(line: 76, column: 19, scope: !126)
!154 = !DILocation(line: 76, column: 9, scope: !126)
!155 = !DILocation(line: 78, column: 1, scope: !121)
