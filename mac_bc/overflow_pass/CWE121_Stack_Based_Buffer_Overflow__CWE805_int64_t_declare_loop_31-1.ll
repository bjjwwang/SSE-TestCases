; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  store i64* %arraydecay, i64** %data, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %0 = load i64*, i64** %data, align 8, !dbg !37
  store i64* %0, i64** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %1 = load i64*, i64** %dataCopy, align 8, !dbg !40
  store i64* %1, i64** %data1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %3, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !61
  %5 = load i64, i64* %arrayidx, align 8, !dbg !61
  %6 = load i64*, i64** %data1, align 8, !dbg !62
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !62
  store i64 %5, i64* %arrayidx2, align 8, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %8, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data1, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !71
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !71
  call void @printLongLongLine(i64 noundef %10), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %dataCopy = alloca i64*, align 8
  %data1 = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i64* %arraydecay, i64** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata i64** %dataCopy, metadata !107, metadata !DIExpression()), !dbg !109
  %0 = load i64*, i64** %data, align 8, !dbg !110
  store i64* %0, i64** %dataCopy, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i64** %data1, metadata !111, metadata !DIExpression()), !dbg !112
  %1 = load i64*, i64** %dataCopy, align 8, !dbg !113
  store i64* %1, i64** %data1, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !116
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !123
  %cmp = icmp ult i64 %3, 100, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %4, !dbg !129
  %5 = load i64, i64* %arrayidx, align 8, !dbg !129
  %6 = load i64*, i64** %data1, align 8, !dbg !130
  %7 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 %7, !dbg !130
  store i64 %5, i64* %arrayidx2, align 8, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %8, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %9 = load i64*, i64** %data1, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds i64, i64* %9, i64 0, !dbg !138
  %10 = load i64, i64* %arrayidx3, align 8, !dbg !138
  call void @printLongLongLine(i64 noundef %10), !dbg !139
  ret void, !dbg !140
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 23, column: 15, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 24, column: 13, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 25, column: 13, scope: !11)
!32 = !DILocation(line: 28, column: 12, scope: !11)
!33 = !DILocation(line: 28, column: 10, scope: !11)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !12, line: 30, type: !17)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!36 = !DILocation(line: 30, column: 19, scope: !35)
!37 = !DILocation(line: 30, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 31, type: !17)
!39 = !DILocation(line: 31, column: 19, scope: !35)
!40 = !DILocation(line: 31, column: 26, scope: !35)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 33, type: !28)
!42 = distinct !DILexicalBlock(scope: !35, file: !12, line: 32, column: 9)
!43 = !DILocation(line: 33, column: 21, scope: !42)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 34, column: 13)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !49, line: 94, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 35, column: 24, scope: !45)
!52 = !DILocation(line: 37, column: 24, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !12, line: 37, column: 17)
!54 = !DILocation(line: 37, column: 22, scope: !53)
!55 = !DILocation(line: 37, column: 29, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 37, column: 17)
!57 = !DILocation(line: 37, column: 31, scope: !56)
!58 = !DILocation(line: 37, column: 17, scope: !53)
!59 = !DILocation(line: 39, column: 38, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 38, column: 17)
!61 = !DILocation(line: 39, column: 31, scope: !60)
!62 = !DILocation(line: 39, column: 21, scope: !60)
!63 = !DILocation(line: 39, column: 26, scope: !60)
!64 = !DILocation(line: 39, column: 29, scope: !60)
!65 = !DILocation(line: 40, column: 17, scope: !60)
!66 = !DILocation(line: 37, column: 39, scope: !56)
!67 = !DILocation(line: 37, column: 17, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 40, column: 17, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 41, column: 35, scope: !45)
!72 = !DILocation(line: 41, column: 17, scope: !45)
!73 = !DILocation(line: 45, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_31_good", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DILocation(line: 79, column: 5, scope: !74)
!76 = !DILocation(line: 80, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !78, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 91, type: !80)
!85 = !DILocation(line: 91, column: 14, scope: !77)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 91, type: !81)
!87 = !DILocation(line: 91, column: 27, scope: !77)
!88 = !DILocation(line: 94, column: 22, scope: !77)
!89 = !DILocation(line: 94, column: 12, scope: !77)
!90 = !DILocation(line: 94, column: 5, scope: !77)
!91 = !DILocation(line: 96, column: 5, scope: !77)
!92 = !DILocation(line: 97, column: 5, scope: !77)
!93 = !DILocation(line: 98, column: 5, scope: !77)
!94 = !DILocation(line: 101, column: 5, scope: !77)
!95 = !DILocation(line: 102, column: 5, scope: !77)
!96 = !DILocation(line: 103, column: 5, scope: !77)
!97 = !DILocation(line: 105, column: 5, scope: !77)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 54, type: !17)
!100 = !DILocation(line: 54, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 55, type: !23)
!102 = !DILocation(line: 55, column: 13, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 56, type: !28)
!104 = !DILocation(line: 56, column: 13, scope: !98)
!105 = !DILocation(line: 58, column: 12, scope: !98)
!106 = !DILocation(line: 58, column: 10, scope: !98)
!107 = !DILocalVariable(name: "dataCopy", scope: !108, file: !12, line: 60, type: !17)
!108 = distinct !DILexicalBlock(scope: !98, file: !12, line: 59, column: 5)
!109 = !DILocation(line: 60, column: 19, scope: !108)
!110 = !DILocation(line: 60, column: 30, scope: !108)
!111 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 61, type: !17)
!112 = !DILocation(line: 61, column: 19, scope: !108)
!113 = !DILocation(line: 61, column: 26, scope: !108)
!114 = !DILocalVariable(name: "source", scope: !115, file: !12, line: 63, type: !28)
!115 = distinct !DILexicalBlock(scope: !108, file: !12, line: 62, column: 9)
!116 = !DILocation(line: 63, column: 21, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !118, file: !12, line: 65, type: !46)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 64, column: 13)
!119 = !DILocation(line: 65, column: 24, scope: !118)
!120 = !DILocation(line: 67, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 67, column: 17)
!122 = !DILocation(line: 67, column: 22, scope: !121)
!123 = !DILocation(line: 67, column: 29, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 67, column: 17)
!125 = !DILocation(line: 67, column: 31, scope: !124)
!126 = !DILocation(line: 67, column: 17, scope: !121)
!127 = !DILocation(line: 69, column: 38, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 68, column: 17)
!129 = !DILocation(line: 69, column: 31, scope: !128)
!130 = !DILocation(line: 69, column: 21, scope: !128)
!131 = !DILocation(line: 69, column: 26, scope: !128)
!132 = !DILocation(line: 69, column: 29, scope: !128)
!133 = !DILocation(line: 70, column: 17, scope: !128)
!134 = !DILocation(line: 67, column: 39, scope: !124)
!135 = !DILocation(line: 67, column: 17, scope: !124)
!136 = distinct !{!136, !126, !137, !70}
!137 = !DILocation(line: 70, column: 17, scope: !121)
!138 = !DILocation(line: 71, column: 35, scope: !118)
!139 = !DILocation(line: 71, column: 17, scope: !118)
!140 = !DILocation(line: 75, column: 1, scope: !98)
