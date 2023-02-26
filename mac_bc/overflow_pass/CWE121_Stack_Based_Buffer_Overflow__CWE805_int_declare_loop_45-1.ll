; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  %0 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %0, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_badData, align 8, !dbg !38
  call void @badSink(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_good() #0 !dbg !41 {
entry:
  call void @goodG2B(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* noundef null), !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 noundef %conv), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_good(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_bad(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !64 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_badData, align 8, !dbg !67
  store i32* %0, i32** %data, align 8, !dbg !66
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !68, metadata !DIExpression()), !dbg !70
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !71, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !81

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !82
  %cmp = icmp ult i64 %2, 100, !dbg !84
  br i1 %cmp, label %for.body, label %for.end, !dbg !85

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !86
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !88
  %4 = load i32, i32* %arrayidx, align 4, !dbg !88
  %5 = load i32*, i32** %data, align 8, !dbg !89
  %6 = load i64, i64* %i, align 8, !dbg !90
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !89
  store i32 %4, i32* %arrayidx1, align 4, !dbg !91
  br label %for.inc, !dbg !92

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !93
  %inc = add i64 %7, 1, !dbg !93
  store i64 %inc, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !94, !llvm.loop !95

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !98
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !98
  call void @printIntLine(i32 noundef %9), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !109
  %0 = load i32*, i32** %data, align 8, !dbg !110
  store i32* %0, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_goodG2BData, align 8, !dbg !111
  call void @goodG2BSink(), !dbg !112
  ret void, !dbg !113
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_goodG2BData, align 8, !dbg !117
  store i32* %0, i32** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !120
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %2, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %3, !dbg !133
  %4 = load i32, i32* %arrayidx, align 4, !dbg !133
  %5 = load i32*, i32** %data, align 8, !dbg !134
  %6 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !134
  store i32 %4, i32* %arrayidx1, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %7, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !142
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !142
  call void @printIntLine(i32 noundef %9), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_badData", scope: !2, file: !9, line: 19, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_goodG2BData", scope: !2, file: !9, line: 20, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_bad", scope: !9, file: !9, line: 41, type: !20, scopeLine: 42, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !9, line: 43, type: !10)
!24 = !DILocation(line: 43, column: 11, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !9, line: 44, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 44, column: 9, scope: !19)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !9, line: 45, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 45, column: 9, scope: !19)
!35 = !DILocation(line: 48, column: 12, scope: !19)
!36 = !DILocation(line: 48, column: 10, scope: !19)
!37 = !DILocation(line: 49, column: 78, scope: !19)
!38 = !DILocation(line: 49, column: 76, scope: !19)
!39 = !DILocation(line: 50, column: 5, scope: !19)
!40 = !DILocation(line: 51, column: 1, scope: !19)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_loop_45_good", scope: !9, file: !9, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!42 = !DILocation(line: 88, column: 5, scope: !41)
!43 = !DILocation(line: 89, column: 1, scope: !41)
!44 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 100, type: !45, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!45 = !DISubroutineType(types: !46)
!46 = !{!11, !11, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !9, line: 100, type: !11)
!51 = !DILocation(line: 100, column: 14, scope: !44)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !9, line: 100, type: !47)
!53 = !DILocation(line: 100, column: 27, scope: !44)
!54 = !DILocation(line: 103, column: 22, scope: !44)
!55 = !DILocation(line: 103, column: 12, scope: !44)
!56 = !DILocation(line: 103, column: 5, scope: !44)
!57 = !DILocation(line: 105, column: 5, scope: !44)
!58 = !DILocation(line: 106, column: 5, scope: !44)
!59 = !DILocation(line: 107, column: 5, scope: !44)
!60 = !DILocation(line: 110, column: 5, scope: !44)
!61 = !DILocation(line: 111, column: 5, scope: !44)
!62 = !DILocation(line: 112, column: 5, scope: !44)
!63 = !DILocation(line: 114, column: 5, scope: !44)
!64 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 24, type: !20, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!65 = !DILocalVariable(name: "data", scope: !64, file: !9, line: 26, type: !10)
!66 = !DILocation(line: 26, column: 11, scope: !64)
!67 = !DILocation(line: 26, column: 18, scope: !64)
!68 = !DILocalVariable(name: "source", scope: !69, file: !9, line: 28, type: !31)
!69 = distinct !DILexicalBlock(scope: !64, file: !9, line: 27, column: 5)
!70 = !DILocation(line: 28, column: 13, scope: !69)
!71 = !DILocalVariable(name: "i", scope: !72, file: !9, line: 30, type: !73)
!72 = distinct !DILexicalBlock(scope: !69, file: !9, line: 29, column: 9)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !74, line: 31, baseType: !75)
!74 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !76, line: 94, baseType: !77)
!76 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!77 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!78 = !DILocation(line: 30, column: 20, scope: !72)
!79 = !DILocation(line: 32, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !9, line: 32, column: 13)
!81 = !DILocation(line: 32, column: 18, scope: !80)
!82 = !DILocation(line: 32, column: 25, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !9, line: 32, column: 13)
!84 = !DILocation(line: 32, column: 27, scope: !83)
!85 = !DILocation(line: 32, column: 13, scope: !80)
!86 = !DILocation(line: 34, column: 34, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !9, line: 33, column: 13)
!88 = !DILocation(line: 34, column: 27, scope: !87)
!89 = !DILocation(line: 34, column: 17, scope: !87)
!90 = !DILocation(line: 34, column: 22, scope: !87)
!91 = !DILocation(line: 34, column: 25, scope: !87)
!92 = !DILocation(line: 35, column: 13, scope: !87)
!93 = !DILocation(line: 32, column: 35, scope: !83)
!94 = !DILocation(line: 32, column: 13, scope: !83)
!95 = distinct !{!95, !85, !96, !97}
!96 = !DILocation(line: 35, column: 13, scope: !80)
!97 = !{!"llvm.loop.mustprogress"}
!98 = !DILocation(line: 36, column: 26, scope: !72)
!99 = !DILocation(line: 36, column: 13, scope: !72)
!100 = !DILocation(line: 39, column: 1, scope: !64)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 75, type: !20, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!102 = !DILocalVariable(name: "data", scope: !101, file: !9, line: 77, type: !10)
!103 = !DILocation(line: 77, column: 11, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !9, line: 78, type: !26)
!105 = !DILocation(line: 78, column: 9, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !9, line: 79, type: !31)
!107 = !DILocation(line: 79, column: 9, scope: !101)
!108 = !DILocation(line: 81, column: 12, scope: !101)
!109 = !DILocation(line: 81, column: 10, scope: !101)
!110 = !DILocation(line: 82, column: 82, scope: !101)
!111 = !DILocation(line: 82, column: 80, scope: !101)
!112 = !DILocation(line: 83, column: 5, scope: !101)
!113 = !DILocation(line: 84, column: 1, scope: !101)
!114 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!115 = !DILocalVariable(name: "data", scope: !114, file: !9, line: 60, type: !10)
!116 = !DILocation(line: 60, column: 11, scope: !114)
!117 = !DILocation(line: 60, column: 18, scope: !114)
!118 = !DILocalVariable(name: "source", scope: !119, file: !9, line: 62, type: !31)
!119 = distinct !DILexicalBlock(scope: !114, file: !9, line: 61, column: 5)
!120 = !DILocation(line: 62, column: 13, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !9, line: 64, type: !73)
!122 = distinct !DILexicalBlock(scope: !119, file: !9, line: 63, column: 9)
!123 = !DILocation(line: 64, column: 20, scope: !122)
!124 = !DILocation(line: 66, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !9, line: 66, column: 13)
!126 = !DILocation(line: 66, column: 18, scope: !125)
!127 = !DILocation(line: 66, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !9, line: 66, column: 13)
!129 = !DILocation(line: 66, column: 27, scope: !128)
!130 = !DILocation(line: 66, column: 13, scope: !125)
!131 = !DILocation(line: 68, column: 34, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !9, line: 67, column: 13)
!133 = !DILocation(line: 68, column: 27, scope: !132)
!134 = !DILocation(line: 68, column: 17, scope: !132)
!135 = !DILocation(line: 68, column: 22, scope: !132)
!136 = !DILocation(line: 68, column: 25, scope: !132)
!137 = !DILocation(line: 69, column: 13, scope: !132)
!138 = !DILocation(line: 66, column: 35, scope: !128)
!139 = !DILocation(line: 66, column: 13, scope: !128)
!140 = distinct !{!140, !130, !141, !97}
!141 = !DILocation(line: 69, column: 13, scope: !125)
!142 = !DILocation(line: 70, column: 26, scope: !122)
!143 = !DILocation(line: 70, column: 13, scope: !122)
!144 = !DILocation(line: 73, column: 1, scope: !114)
