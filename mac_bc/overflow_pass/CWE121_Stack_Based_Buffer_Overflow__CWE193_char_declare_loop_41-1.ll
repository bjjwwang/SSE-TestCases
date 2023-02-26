; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink(i8* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !25
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !25
  call void @llvm.dbg.declare(metadata i64* %i, metadata !26, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !33, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !35
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !36
  store i64 %call, i64* %sourceLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !41
  %2 = load i64, i64* %sourceLen, align 8, !dbg !43
  %add = add i64 %2, 1, !dbg !44
  %cmp = icmp ult i64 %1, %add, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !49
  %4 = load i8, i8* %arrayidx, align 1, !dbg !49
  %5 = load i8*, i8** %data.addr, align 8, !dbg !50
  %6 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !50
  store i8 %4, i8* %arrayidx1, align 1, !dbg !52
  br label %for.inc, !dbg !53

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !54
  %inc = add i64 %7, 1, !dbg !54
  store i64 %inc, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !55, !llvm.loop !56

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !59
  call void @printLine(i8* noundef %8), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_bad() #0 !dbg !62 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !67, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !74
  store i8* %arraydecay, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  %1 = load i8*, i8** %data, align 8, !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink(i8* noundef %1), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink(i8* noundef %data) #0 !dbg !81 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !86
  call void @llvm.dbg.declare(metadata i64* %i, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !89, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !91
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !92
  store i64 %call, i64* %sourceLen, align 8, !dbg !93
  store i64 0, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !96

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !97
  %2 = load i64, i64* %sourceLen, align 8, !dbg !99
  %add = add i64 %2, 1, !dbg !100
  %cmp = icmp ult i64 %1, %add, !dbg !101
  br i1 %cmp, label %for.body, label %for.end, !dbg !102

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !103
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %3, !dbg !105
  %4 = load i8, i8* %arrayidx, align 1, !dbg !105
  %5 = load i8*, i8** %data.addr, align 8, !dbg !106
  %6 = load i64, i64* %i, align 8, !dbg !107
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !106
  store i8 %4, i8* %arrayidx1, align 1, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %7, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %data.addr, align 8, !dbg !114
  call void @printLine(i8* noundef %8), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_good() #0 !dbg !117 {
entry:
  call void @goodG2B(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !120 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !125, metadata !DIExpression()), !dbg !126
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !127, metadata !DIExpression()), !dbg !128
  %call = call i64 @time(i64* noundef null), !dbg !129
  %conv = trunc i64 %call to i32, !dbg !130
  call void @srand(i32 noundef %conv), !dbg !131
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !132
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_good(), !dbg !133
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !134
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !135
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_bad(), !dbg !136
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !137
  ret i32 0, !dbg !138
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !139 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !146
  store i8* %arraydecay, i8** %data, align 8, !dbg !147
  %0 = load i8*, i8** %data, align 8, !dbg !148
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %1 = load i8*, i8** %data, align 8, !dbg !150
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink(i8* noundef %1), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_badSink", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 28, type: !15)
!19 = !DILocation(line: 28, column: 85, scope: !11)
!20 = !DILocalVariable(name: "source", scope: !21, file: !12, line: 31, type: !22)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 88, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 11)
!25 = !DILocation(line: 31, column: 14, scope: !21)
!26 = !DILocalVariable(name: "i", scope: !21, file: !12, line: 32, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !28, line: 31, baseType: !29)
!28 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !30, line: 94, baseType: !31)
!30 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!31 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!32 = !DILocation(line: 32, column: 16, scope: !21)
!33 = !DILocalVariable(name: "sourceLen", scope: !21, file: !12, line: 32, type: !27)
!34 = !DILocation(line: 32, column: 19, scope: !21)
!35 = !DILocation(line: 33, column: 28, scope: !21)
!36 = !DILocation(line: 33, column: 21, scope: !21)
!37 = !DILocation(line: 33, column: 19, scope: !21)
!38 = !DILocation(line: 36, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !21, file: !12, line: 36, column: 9)
!40 = !DILocation(line: 36, column: 14, scope: !39)
!41 = !DILocation(line: 36, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 36, column: 9)
!43 = !DILocation(line: 36, column: 25, scope: !42)
!44 = !DILocation(line: 36, column: 35, scope: !42)
!45 = !DILocation(line: 36, column: 23, scope: !42)
!46 = !DILocation(line: 36, column: 9, scope: !39)
!47 = !DILocation(line: 38, column: 30, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !12, line: 37, column: 9)
!49 = !DILocation(line: 38, column: 23, scope: !48)
!50 = !DILocation(line: 38, column: 13, scope: !48)
!51 = !DILocation(line: 38, column: 18, scope: !48)
!52 = !DILocation(line: 38, column: 21, scope: !48)
!53 = !DILocation(line: 39, column: 9, scope: !48)
!54 = !DILocation(line: 36, column: 41, scope: !42)
!55 = !DILocation(line: 36, column: 9, scope: !42)
!56 = distinct !{!56, !46, !57, !58}
!57 = !DILocation(line: 39, column: 9, scope: !39)
!58 = !{!"llvm.loop.mustprogress"}
!59 = !DILocation(line: 40, column: 19, scope: !21)
!60 = !DILocation(line: 40, column: 9, scope: !21)
!61 = !DILocation(line: 42, column: 1, scope: !11)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_bad", scope: !12, file: !12, line: 44, type: !63, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!63 = !DISubroutineType(types: !64)
!64 = !{null}
!65 = !DILocalVariable(name: "data", scope: !62, file: !12, line: 46, type: !15)
!66 = !DILocation(line: 46, column: 12, scope: !62)
!67 = !DILocalVariable(name: "dataBadBuffer", scope: !62, file: !12, line: 47, type: !68)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 10)
!71 = !DILocation(line: 47, column: 10, scope: !62)
!72 = !DILocalVariable(name: "dataGoodBuffer", scope: !62, file: !12, line: 48, type: !22)
!73 = !DILocation(line: 48, column: 10, scope: !62)
!74 = !DILocation(line: 51, column: 12, scope: !62)
!75 = !DILocation(line: 51, column: 10, scope: !62)
!76 = !DILocation(line: 52, column: 5, scope: !62)
!77 = !DILocation(line: 52, column: 13, scope: !62)
!78 = !DILocation(line: 53, column: 77, scope: !62)
!79 = !DILocation(line: 53, column: 5, scope: !62)
!80 = !DILocation(line: 54, column: 1, scope: !62)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!82 = !DILocalVariable(name: "data", arg: 1, scope: !81, file: !12, line: 60, type: !15)
!83 = !DILocation(line: 60, column: 89, scope: !81)
!84 = !DILocalVariable(name: "source", scope: !85, file: !12, line: 63, type: !22)
!85 = distinct !DILexicalBlock(scope: !81, file: !12, line: 62, column: 5)
!86 = !DILocation(line: 63, column: 14, scope: !85)
!87 = !DILocalVariable(name: "i", scope: !85, file: !12, line: 64, type: !27)
!88 = !DILocation(line: 64, column: 16, scope: !85)
!89 = !DILocalVariable(name: "sourceLen", scope: !85, file: !12, line: 64, type: !27)
!90 = !DILocation(line: 64, column: 19, scope: !85)
!91 = !DILocation(line: 65, column: 28, scope: !85)
!92 = !DILocation(line: 65, column: 21, scope: !85)
!93 = !DILocation(line: 65, column: 19, scope: !85)
!94 = !DILocation(line: 68, column: 16, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !12, line: 68, column: 9)
!96 = !DILocation(line: 68, column: 14, scope: !95)
!97 = !DILocation(line: 68, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !12, line: 68, column: 9)
!99 = !DILocation(line: 68, column: 25, scope: !98)
!100 = !DILocation(line: 68, column: 35, scope: !98)
!101 = !DILocation(line: 68, column: 23, scope: !98)
!102 = !DILocation(line: 68, column: 9, scope: !95)
!103 = !DILocation(line: 70, column: 30, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !12, line: 69, column: 9)
!105 = !DILocation(line: 70, column: 23, scope: !104)
!106 = !DILocation(line: 70, column: 13, scope: !104)
!107 = !DILocation(line: 70, column: 18, scope: !104)
!108 = !DILocation(line: 70, column: 21, scope: !104)
!109 = !DILocation(line: 71, column: 9, scope: !104)
!110 = !DILocation(line: 68, column: 41, scope: !98)
!111 = !DILocation(line: 68, column: 9, scope: !98)
!112 = distinct !{!112, !102, !113, !58}
!113 = !DILocation(line: 71, column: 9, scope: !95)
!114 = !DILocation(line: 72, column: 19, scope: !85)
!115 = !DILocation(line: 72, column: 9, scope: !85)
!116 = !DILocation(line: 74, column: 1, scope: !81)
!117 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_41_good", scope: !12, file: !12, line: 89, type: !63, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!118 = !DILocation(line: 91, column: 5, scope: !117)
!119 = !DILocation(line: 92, column: 1, scope: !117)
!120 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 104, type: !121, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!121 = !DISubroutineType(types: !122)
!122 = !{!123, !123, !124}
!123 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!125 = !DILocalVariable(name: "argc", arg: 1, scope: !120, file: !12, line: 104, type: !123)
!126 = !DILocation(line: 104, column: 14, scope: !120)
!127 = !DILocalVariable(name: "argv", arg: 2, scope: !120, file: !12, line: 104, type: !124)
!128 = !DILocation(line: 104, column: 27, scope: !120)
!129 = !DILocation(line: 107, column: 22, scope: !120)
!130 = !DILocation(line: 107, column: 12, scope: !120)
!131 = !DILocation(line: 107, column: 5, scope: !120)
!132 = !DILocation(line: 109, column: 5, scope: !120)
!133 = !DILocation(line: 110, column: 5, scope: !120)
!134 = !DILocation(line: 111, column: 5, scope: !120)
!135 = !DILocation(line: 114, column: 5, scope: !120)
!136 = !DILocation(line: 115, column: 5, scope: !120)
!137 = !DILocation(line: 116, column: 5, scope: !120)
!138 = !DILocation(line: 118, column: 5, scope: !120)
!139 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 77, type: !63, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!140 = !DILocalVariable(name: "data", scope: !139, file: !12, line: 79, type: !15)
!141 = !DILocation(line: 79, column: 12, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !12, line: 80, type: !68)
!143 = !DILocation(line: 80, column: 10, scope: !139)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !12, line: 81, type: !22)
!145 = !DILocation(line: 81, column: 10, scope: !139)
!146 = !DILocation(line: 84, column: 12, scope: !139)
!147 = !DILocation(line: 84, column: 10, scope: !139)
!148 = !DILocation(line: 85, column: 5, scope: !139)
!149 = !DILocation(line: 85, column: 13, scope: !139)
!150 = !DILocation(line: 86, column: 81, scope: !139)
!151 = !DILocation(line: 86, column: 5, scope: !139)
!152 = !DILocation(line: 87, column: 1, scope: !139)
