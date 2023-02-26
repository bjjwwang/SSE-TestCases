; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_badSink(i64* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !27
  call void @llvm.dbg.declare(metadata i64* %i, metadata !28, metadata !DIExpression()), !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %1, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !45
  %3 = load i64, i64* %arrayidx, align 8, !dbg !45
  %4 = load i64*, i64** %data.addr, align 8, !dbg !46
  %5 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !46
  store i64 %3, i64* %arrayidx1, align 8, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %6, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !55
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !55
  call void @printLongLongLine(i64 noundef %8), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_bad() #0 !dbg !58 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !61, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !63, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !70
  store i64* %arraydecay, i64** %data, align 8, !dbg !71
  %0 = load i64*, i64** %data, align 8, !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_badSink(i64* noundef %0), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_goodG2BSink(i64* noundef %data) #0 !dbg !75 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !78, metadata !DIExpression()), !dbg !80
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !80
  call void @llvm.dbg.declare(metadata i64* %i, metadata !81, metadata !DIExpression()), !dbg !83
  store i64 0, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !86

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !87
  %cmp = icmp ult i64 %1, 100, !dbg !89
  br i1 %cmp, label %for.body, label %for.end, !dbg !90

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %2, !dbg !93
  %3 = load i64, i64* %arrayidx, align 8, !dbg !93
  %4 = load i64*, i64** %data.addr, align 8, !dbg !94
  %5 = load i64, i64* %i, align 8, !dbg !95
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 %5, !dbg !94
  store i64 %3, i64* %arrayidx1, align 8, !dbg !96
  br label %for.inc, !dbg !97

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !98
  %inc = add i64 %6, 1, !dbg !98
  store i64 %inc, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !99, !llvm.loop !100

for.end:                                          ; preds = %for.cond
  %7 = load i64*, i64** %data.addr, align 8, !dbg !102
  %arrayidx2 = getelementptr inbounds i64, i64* %7, i64 0, !dbg !102
  %8 = load i64, i64* %arrayidx2, align 8, !dbg !102
  call void @printLongLongLine(i64 noundef %8), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_good() #0 !dbg !105 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %call = call i64 @time(i64* noundef null), !dbg !119
  %conv = trunc i64 %call to i32, !dbg !120
  call void @srand(i32 noundef %conv), !dbg !121
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !122
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_good(), !dbg !123
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !124
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !125
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_bad(), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !127
  ret i32 0, !dbg !128
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !129 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !136
  store i64* %arraydecay, i64** %data, align 8, !dbg !137
  %0 = load i64*, i64** %data, align 8, !dbg !138
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_goodG2BSink(i64* noundef %0), !dbg !139
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_badSink", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !17, line: 30, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!18 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!19 = !{}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 21, type: !15)
!21 = !DILocation(line: 21, column: 91, scope: !11)
!22 = !DILocalVariable(name: "source", scope: !23, file: !12, line: 24, type: !24)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 6400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 24, column: 17, scope: !23)
!28 = !DILocalVariable(name: "i", scope: !29, file: !12, line: 26, type: !30)
!29 = distinct !DILexicalBlock(scope: !23, file: !12, line: 25, column: 9)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !31, line: 31, baseType: !32)
!31 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !33, line: 94, baseType: !34)
!33 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 26, column: 20, scope: !29)
!36 = !DILocation(line: 28, column: 20, scope: !37)
!37 = distinct !DILexicalBlock(scope: !29, file: !12, line: 28, column: 13)
!38 = !DILocation(line: 28, column: 18, scope: !37)
!39 = !DILocation(line: 28, column: 25, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 28, column: 13)
!41 = !DILocation(line: 28, column: 27, scope: !40)
!42 = !DILocation(line: 28, column: 13, scope: !37)
!43 = !DILocation(line: 30, column: 34, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 29, column: 13)
!45 = !DILocation(line: 30, column: 27, scope: !44)
!46 = !DILocation(line: 30, column: 17, scope: !44)
!47 = !DILocation(line: 30, column: 22, scope: !44)
!48 = !DILocation(line: 30, column: 25, scope: !44)
!49 = !DILocation(line: 31, column: 13, scope: !44)
!50 = !DILocation(line: 28, column: 35, scope: !40)
!51 = !DILocation(line: 28, column: 13, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 31, column: 13, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 32, column: 31, scope: !29)
!56 = !DILocation(line: 32, column: 13, scope: !29)
!57 = !DILocation(line: 35, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_bad", scope: !12, file: !12, line: 37, type: !59, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!59 = !DISubroutineType(types: !60)
!60 = !{null}
!61 = !DILocalVariable(name: "data", scope: !58, file: !12, line: 39, type: !15)
!62 = !DILocation(line: 39, column: 15, scope: !58)
!63 = !DILocalVariable(name: "dataBadBuffer", scope: !58, file: !12, line: 40, type: !64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 50)
!67 = !DILocation(line: 40, column: 13, scope: !58)
!68 = !DILocalVariable(name: "dataGoodBuffer", scope: !58, file: !12, line: 41, type: !24)
!69 = !DILocation(line: 41, column: 13, scope: !58)
!70 = !DILocation(line: 44, column: 12, scope: !58)
!71 = !DILocation(line: 44, column: 10, scope: !58)
!72 = !DILocation(line: 45, column: 80, scope: !58)
!73 = !DILocation(line: 45, column: 5, scope: !58)
!74 = !DILocation(line: 46, column: 1, scope: !58)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!76 = !DILocalVariable(name: "data", arg: 1, scope: !75, file: !12, line: 52, type: !15)
!77 = !DILocation(line: 52, column: 95, scope: !75)
!78 = !DILocalVariable(name: "source", scope: !79, file: !12, line: 55, type: !24)
!79 = distinct !DILexicalBlock(scope: !75, file: !12, line: 54, column: 5)
!80 = !DILocation(line: 55, column: 17, scope: !79)
!81 = !DILocalVariable(name: "i", scope: !82, file: !12, line: 57, type: !30)
!82 = distinct !DILexicalBlock(scope: !79, file: !12, line: 56, column: 9)
!83 = !DILocation(line: 57, column: 20, scope: !82)
!84 = !DILocation(line: 59, column: 20, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !12, line: 59, column: 13)
!86 = !DILocation(line: 59, column: 18, scope: !85)
!87 = !DILocation(line: 59, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !12, line: 59, column: 13)
!89 = !DILocation(line: 59, column: 27, scope: !88)
!90 = !DILocation(line: 59, column: 13, scope: !85)
!91 = !DILocation(line: 61, column: 34, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !12, line: 60, column: 13)
!93 = !DILocation(line: 61, column: 27, scope: !92)
!94 = !DILocation(line: 61, column: 17, scope: !92)
!95 = !DILocation(line: 61, column: 22, scope: !92)
!96 = !DILocation(line: 61, column: 25, scope: !92)
!97 = !DILocation(line: 62, column: 13, scope: !92)
!98 = !DILocation(line: 59, column: 35, scope: !88)
!99 = !DILocation(line: 59, column: 13, scope: !88)
!100 = distinct !{!100, !90, !101, !54}
!101 = !DILocation(line: 62, column: 13, scope: !85)
!102 = !DILocation(line: 63, column: 31, scope: !82)
!103 = !DILocation(line: 63, column: 13, scope: !82)
!104 = !DILocation(line: 66, column: 1, scope: !75)
!105 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_loop_41_good", scope: !12, file: !12, line: 79, type: !59, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!106 = !DILocation(line: 81, column: 5, scope: !105)
!107 = !DILocation(line: 82, column: 1, scope: !105)
!108 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 94, type: !109, scopeLine: 95, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!109 = !DISubroutineType(types: !110)
!110 = !{!111, !111, !112}
!111 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!114 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!115 = !DILocalVariable(name: "argc", arg: 1, scope: !108, file: !12, line: 94, type: !111)
!116 = !DILocation(line: 94, column: 14, scope: !108)
!117 = !DILocalVariable(name: "argv", arg: 2, scope: !108, file: !12, line: 94, type: !112)
!118 = !DILocation(line: 94, column: 27, scope: !108)
!119 = !DILocation(line: 97, column: 22, scope: !108)
!120 = !DILocation(line: 97, column: 12, scope: !108)
!121 = !DILocation(line: 97, column: 5, scope: !108)
!122 = !DILocation(line: 99, column: 5, scope: !108)
!123 = !DILocation(line: 100, column: 5, scope: !108)
!124 = !DILocation(line: 101, column: 5, scope: !108)
!125 = !DILocation(line: 104, column: 5, scope: !108)
!126 = !DILocation(line: 105, column: 5, scope: !108)
!127 = !DILocation(line: 106, column: 5, scope: !108)
!128 = !DILocation(line: 108, column: 5, scope: !108)
!129 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 69, type: !59, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!130 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 71, type: !15)
!131 = !DILocation(line: 71, column: 15, scope: !129)
!132 = !DILocalVariable(name: "dataBadBuffer", scope: !129, file: !12, line: 72, type: !64)
!133 = !DILocation(line: 72, column: 13, scope: !129)
!134 = !DILocalVariable(name: "dataGoodBuffer", scope: !129, file: !12, line: 73, type: !24)
!135 = !DILocation(line: 73, column: 13, scope: !129)
!136 = !DILocation(line: 75, column: 12, scope: !129)
!137 = !DILocation(line: 75, column: 10, scope: !129)
!138 = !DILocation(line: 76, column: 84, scope: !129)
!139 = !DILocation(line: 76, column: 5, scope: !129)
!140 = !DILocation(line: 77, column: 1, scope: !129)
