; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_badSink(i8* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i64* %i, metadata !20, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !28, metadata !DIExpression()), !dbg !32
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !33
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  store i64 0, i64* %i, align 8, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !39
  %cmp = icmp ult i64 %0, 100, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !43
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !45
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !45
  %3 = load i8*, i8** %data.addr, align 8, !dbg !46
  %4 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !46
  store i8 %2, i8* %arrayidx2, align 1, !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !50
  %inc = add i64 %5, 1, !dbg !50
  store i64 %inc, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !55
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !55
  store i8 0, i8* %arrayidx3, align 1, !dbg !56
  %7 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @printLine(i8* noundef %7), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_bad() #0 !dbg !60 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !65, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !72
  store i8* %arraydecay, i8** %data, align 8, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !74
  store i8 0, i8* %arrayidx, align 1, !dbg !75
  %1 = load i8*, i8** %data, align 8, !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_badSink(i8* noundef %1), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_goodG2BSink(i8* noundef %data) #0 !dbg !79 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i64* %i, metadata !82, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !85, metadata !DIExpression()), !dbg !86
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !87
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !93
  %cmp = icmp ult i64 %0, 100, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !99
  %2 = load i8, i8* %arrayidx1, align 1, !dbg !99
  %3 = load i8*, i8** %data.addr, align 8, !dbg !100
  %4 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !100
  store i8 %2, i8* %arrayidx2, align 1, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %5, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data.addr, align 8, !dbg !108
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !108
  store i8 0, i8* %arrayidx3, align 1, !dbg !109
  %7 = load i8*, i8** %data.addr, align 8, !dbg !110
  call void @printLine(i8* noundef %7), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_good() #0 !dbg !113 {
entry:
  call void @goodG2B(), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !116 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call i64 @time(i64* noundef null), !dbg !125
  %conv = trunc i64 %call to i32, !dbg !126
  call void @srand(i32 noundef %conv), !dbg !127
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !128
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_good(), !dbg !129
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !131
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_bad(), !dbg !132
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !133
  ret i32 0, !dbg !134
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !135 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !142
  store i8* %arraydecay, i8** %data, align 8, !dbg !143
  %0 = load i8*, i8** %data, align 8, !dbg !144
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !144
  store i8 0, i8* %arrayidx, align 1, !dbg !145
  %1 = load i8*, i8** %data, align 8, !dbg !146
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_goodG2BSink(i8* noundef %1), !dbg !147
  ret void, !dbg !148
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!19 = !DILocation(line: 23, column: 85, scope: !11)
!20 = !DILocalVariable(name: "i", scope: !21, file: !12, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !23, line: 31, baseType: !24)
!23 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !25, line: 94, baseType: !26)
!25 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!26 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!27 = !DILocation(line: 26, column: 16, scope: !21)
!28 = !DILocalVariable(name: "source", scope: !21, file: !12, line: 27, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 100)
!32 = !DILocation(line: 27, column: 14, scope: !21)
!33 = !DILocation(line: 28, column: 9, scope: !21)
!34 = !DILocation(line: 29, column: 9, scope: !21)
!35 = !DILocation(line: 29, column: 23, scope: !21)
!36 = !DILocation(line: 31, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !21, file: !12, line: 31, column: 9)
!38 = !DILocation(line: 31, column: 14, scope: !37)
!39 = !DILocation(line: 31, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 31, column: 9)
!41 = !DILocation(line: 31, column: 23, scope: !40)
!42 = !DILocation(line: 31, column: 9, scope: !37)
!43 = !DILocation(line: 33, column: 30, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !12, line: 32, column: 9)
!45 = !DILocation(line: 33, column: 23, scope: !44)
!46 = !DILocation(line: 33, column: 13, scope: !44)
!47 = !DILocation(line: 33, column: 18, scope: !44)
!48 = !DILocation(line: 33, column: 21, scope: !44)
!49 = !DILocation(line: 34, column: 9, scope: !44)
!50 = !DILocation(line: 31, column: 31, scope: !40)
!51 = !DILocation(line: 31, column: 9, scope: !40)
!52 = distinct !{!52, !42, !53, !54}
!53 = !DILocation(line: 34, column: 9, scope: !37)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 35, column: 9, scope: !21)
!56 = !DILocation(line: 35, column: 21, scope: !21)
!57 = !DILocation(line: 36, column: 19, scope: !21)
!58 = !DILocation(line: 36, column: 9, scope: !21)
!59 = !DILocation(line: 38, column: 1, scope: !11)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_bad", scope: !12, file: !12, line: 40, type: !61, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !DILocalVariable(name: "data", scope: !60, file: !12, line: 42, type: !15)
!64 = !DILocation(line: 42, column: 12, scope: !60)
!65 = !DILocalVariable(name: "dataBadBuffer", scope: !60, file: !12, line: 43, type: !66)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 50)
!69 = !DILocation(line: 43, column: 10, scope: !60)
!70 = !DILocalVariable(name: "dataGoodBuffer", scope: !60, file: !12, line: 44, type: !29)
!71 = !DILocation(line: 44, column: 10, scope: !60)
!72 = !DILocation(line: 47, column: 12, scope: !60)
!73 = !DILocation(line: 47, column: 10, scope: !60)
!74 = !DILocation(line: 48, column: 5, scope: !60)
!75 = !DILocation(line: 48, column: 13, scope: !60)
!76 = !DILocation(line: 49, column: 77, scope: !60)
!77 = !DILocation(line: 49, column: 5, scope: !60)
!78 = !DILocation(line: 50, column: 1, scope: !60)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!80 = !DILocalVariable(name: "data", arg: 1, scope: !79, file: !12, line: 56, type: !15)
!81 = !DILocation(line: 56, column: 89, scope: !79)
!82 = !DILocalVariable(name: "i", scope: !83, file: !12, line: 59, type: !22)
!83 = distinct !DILexicalBlock(scope: !79, file: !12, line: 58, column: 5)
!84 = !DILocation(line: 59, column: 16, scope: !83)
!85 = !DILocalVariable(name: "source", scope: !83, file: !12, line: 60, type: !29)
!86 = !DILocation(line: 60, column: 14, scope: !83)
!87 = !DILocation(line: 61, column: 9, scope: !83)
!88 = !DILocation(line: 62, column: 9, scope: !83)
!89 = !DILocation(line: 62, column: 23, scope: !83)
!90 = !DILocation(line: 64, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !12, line: 64, column: 9)
!92 = !DILocation(line: 64, column: 14, scope: !91)
!93 = !DILocation(line: 64, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !12, line: 64, column: 9)
!95 = !DILocation(line: 64, column: 23, scope: !94)
!96 = !DILocation(line: 64, column: 9, scope: !91)
!97 = !DILocation(line: 66, column: 30, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !12, line: 65, column: 9)
!99 = !DILocation(line: 66, column: 23, scope: !98)
!100 = !DILocation(line: 66, column: 13, scope: !98)
!101 = !DILocation(line: 66, column: 18, scope: !98)
!102 = !DILocation(line: 66, column: 21, scope: !98)
!103 = !DILocation(line: 67, column: 9, scope: !98)
!104 = !DILocation(line: 64, column: 31, scope: !94)
!105 = !DILocation(line: 64, column: 9, scope: !94)
!106 = distinct !{!106, !96, !107, !54}
!107 = !DILocation(line: 67, column: 9, scope: !91)
!108 = !DILocation(line: 68, column: 9, scope: !83)
!109 = !DILocation(line: 68, column: 21, scope: !83)
!110 = !DILocation(line: 69, column: 19, scope: !83)
!111 = !DILocation(line: 69, column: 9, scope: !83)
!112 = !DILocation(line: 71, column: 1, scope: !79)
!113 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_loop_41_good", scope: !12, file: !12, line: 85, type: !61, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!114 = !DILocation(line: 87, column: 5, scope: !113)
!115 = !DILocation(line: 88, column: 1, scope: !113)
!116 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !117, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!117 = !DISubroutineType(types: !118)
!118 = !{!119, !119, !120}
!119 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!121 = !DILocalVariable(name: "argc", arg: 1, scope: !116, file: !12, line: 100, type: !119)
!122 = !DILocation(line: 100, column: 14, scope: !116)
!123 = !DILocalVariable(name: "argv", arg: 2, scope: !116, file: !12, line: 100, type: !120)
!124 = !DILocation(line: 100, column: 27, scope: !116)
!125 = !DILocation(line: 103, column: 22, scope: !116)
!126 = !DILocation(line: 103, column: 12, scope: !116)
!127 = !DILocation(line: 103, column: 5, scope: !116)
!128 = !DILocation(line: 105, column: 5, scope: !116)
!129 = !DILocation(line: 106, column: 5, scope: !116)
!130 = !DILocation(line: 107, column: 5, scope: !116)
!131 = !DILocation(line: 110, column: 5, scope: !116)
!132 = !DILocation(line: 111, column: 5, scope: !116)
!133 = !DILocation(line: 112, column: 5, scope: !116)
!134 = !DILocation(line: 114, column: 5, scope: !116)
!135 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 74, type: !61, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!136 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 76, type: !15)
!137 = !DILocation(line: 76, column: 12, scope: !135)
!138 = !DILocalVariable(name: "dataBadBuffer", scope: !135, file: !12, line: 77, type: !66)
!139 = !DILocation(line: 77, column: 10, scope: !135)
!140 = !DILocalVariable(name: "dataGoodBuffer", scope: !135, file: !12, line: 78, type: !29)
!141 = !DILocation(line: 78, column: 10, scope: !135)
!142 = !DILocation(line: 80, column: 12, scope: !135)
!143 = !DILocation(line: 80, column: 10, scope: !135)
!144 = !DILocation(line: 81, column: 5, scope: !135)
!145 = !DILocation(line: 81, column: 13, scope: !135)
!146 = !DILocation(line: 82, column: 81, scope: !135)
!147 = !DILocation(line: 82, column: 5, scope: !135)
!148 = !DILocation(line: 83, column: 1, scope: !135)
