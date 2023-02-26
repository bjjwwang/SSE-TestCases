; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i1 = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %0, 1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay, i8** %data, align 8, !dbg !42
  %1 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !46
  %inc = add nsw i32 %2, 1, !dbg !46
  store i32 %inc, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !51, metadata !DIExpression()), !dbg !53
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !54, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !61, metadata !DIExpression()), !dbg !62
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !63
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !64
  store i64 %call, i64* %sourceLen, align 8, !dbg !65
  store i64 0, i64* %i1, align 8, !dbg !66
  br label %for.cond3, !dbg !68

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i1, align 8, !dbg !69
  %5 = load i64, i64* %sourceLen, align 8, !dbg !71
  %add = add i64 %5, 1, !dbg !72
  %cmp4 = icmp ult i64 %4, %add, !dbg !73
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !74

for.body5:                                        ; preds = %for.cond3
  %6 = load i64, i64* %i1, align 8, !dbg !75
  %arrayidx6 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !77
  %7 = load i8, i8* %arrayidx6, align 1, !dbg !77
  %8 = load i8*, i8** %data, align 8, !dbg !78
  %9 = load i64, i64* %i1, align 8, !dbg !79
  %arrayidx7 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !78
  store i8 %7, i8* %arrayidx7, align 1, !dbg !80
  br label %for.inc8, !dbg !81

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i1, align 8, !dbg !82
  %inc9 = add i64 %10, 1, !dbg !82
  store i64 %inc9, i64* %i1, align 8, !dbg !82
  br label %for.cond3, !dbg !83, !llvm.loop !84

for.end10:                                        ; preds = %for.cond3
  %11 = load i8*, i8** %data, align 8, !dbg !86
  call void @printLine(i8* noundef %11), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  store i32 0, i32* %h, align 4, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !122
  %cmp = icmp slt i32 %0, 1, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  store i8* %arraydecay, i8** %data, align 8, !dbg !128
  %1 = load i8*, i8** %data, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %h, align 4, !dbg !132
  %inc = add nsw i32 %2, 1, !dbg !132
  store i32 %inc, i32* %h, align 4, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !138
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !141, metadata !DIExpression()), !dbg !142
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !143
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !144
  store i64 %call, i64* %sourceLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond2, !dbg !148

for.cond2:                                        ; preds = %for.inc7, %for.end
  %4 = load i64, i64* %i, align 8, !dbg !149
  %5 = load i64, i64* %sourceLen, align 8, !dbg !151
  %add = add i64 %5, 1, !dbg !152
  %cmp3 = icmp ult i64 %4, %add, !dbg !153
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !154

for.body4:                                        ; preds = %for.cond2
  %6 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx5 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !157
  %7 = load i8, i8* %arrayidx5, align 1, !dbg !157
  %8 = load i8*, i8** %data, align 8, !dbg !158
  %9 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx6 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !158
  store i8 %7, i8* %arrayidx6, align 1, !dbg !160
  br label %for.inc7, !dbg !161

for.inc7:                                         ; preds = %for.body4
  %10 = load i64, i64* %i, align 8, !dbg !162
  %inc8 = add i64 %10, 1, !dbg !162
  store i64 %inc8, i64* %i, align 8, !dbg !162
  br label %for.cond2, !dbg !163, !llvm.loop !164

for.end9:                                         ; preds = %for.cond2
  %11 = load i8*, i8** %data, align 8, !dbg !166
  call void @printLine(i8* noundef %11), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 30, column: 9, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 31, column: 12, scope: !11)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 32, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 80, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 32, column: 10, scope: !11)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 33, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 88, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 11)
!32 = !DILocation(line: 33, column: 10, scope: !11)
!33 = !DILocation(line: 34, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!35 = !DILocation(line: 34, column: 9, scope: !34)
!36 = !DILocation(line: 34, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !12, line: 34, column: 5)
!38 = !DILocation(line: 34, column: 18, scope: !37)
!39 = !DILocation(line: 34, column: 5, scope: !34)
!40 = !DILocation(line: 38, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 35, column: 5)
!42 = !DILocation(line: 38, column: 14, scope: !41)
!43 = !DILocation(line: 39, column: 9, scope: !41)
!44 = !DILocation(line: 39, column: 17, scope: !41)
!45 = !DILocation(line: 40, column: 5, scope: !41)
!46 = !DILocation(line: 34, column: 24, scope: !37)
!47 = !DILocation(line: 34, column: 5, scope: !37)
!48 = distinct !{!48, !39, !49, !50}
!49 = !DILocation(line: 40, column: 5, scope: !34)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocalVariable(name: "source", scope: !52, file: !12, line: 42, type: !29)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!53 = !DILocation(line: 42, column: 14, scope: !52)
!54 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 43, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 31, baseType: !57)
!56 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !58, line: 94, baseType: !59)
!58 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!59 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 43, column: 16, scope: !52)
!61 = !DILocalVariable(name: "sourceLen", scope: !52, file: !12, line: 43, type: !55)
!62 = !DILocation(line: 43, column: 19, scope: !52)
!63 = !DILocation(line: 44, column: 28, scope: !52)
!64 = !DILocation(line: 44, column: 21, scope: !52)
!65 = !DILocation(line: 44, column: 19, scope: !52)
!66 = !DILocation(line: 47, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !52, file: !12, line: 47, column: 9)
!68 = !DILocation(line: 47, column: 14, scope: !67)
!69 = !DILocation(line: 47, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !12, line: 47, column: 9)
!71 = !DILocation(line: 47, column: 25, scope: !70)
!72 = !DILocation(line: 47, column: 35, scope: !70)
!73 = !DILocation(line: 47, column: 23, scope: !70)
!74 = !DILocation(line: 47, column: 9, scope: !67)
!75 = !DILocation(line: 49, column: 30, scope: !76)
!76 = distinct !DILexicalBlock(scope: !70, file: !12, line: 48, column: 9)
!77 = !DILocation(line: 49, column: 23, scope: !76)
!78 = !DILocation(line: 49, column: 13, scope: !76)
!79 = !DILocation(line: 49, column: 18, scope: !76)
!80 = !DILocation(line: 49, column: 21, scope: !76)
!81 = !DILocation(line: 50, column: 9, scope: !76)
!82 = !DILocation(line: 47, column: 41, scope: !70)
!83 = !DILocation(line: 47, column: 9, scope: !70)
!84 = distinct !{!84, !74, !85, !50}
!85 = !DILocation(line: 50, column: 9, scope: !67)
!86 = !DILocation(line: 51, column: 19, scope: !52)
!87 = !DILocation(line: 51, column: 9, scope: !52)
!88 = !DILocation(line: 53, column: 1, scope: !11)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_17_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!90 = !DILocation(line: 89, column: 5, scope: !89)
!91 = !DILocation(line: 90, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !93, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DISubroutineType(types: !94)
!94 = !{!17, !17, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 102, type: !17)
!97 = !DILocation(line: 102, column: 14, scope: !92)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 102, type: !95)
!99 = !DILocation(line: 102, column: 27, scope: !92)
!100 = !DILocation(line: 105, column: 22, scope: !92)
!101 = !DILocation(line: 105, column: 12, scope: !92)
!102 = !DILocation(line: 105, column: 5, scope: !92)
!103 = !DILocation(line: 107, column: 5, scope: !92)
!104 = !DILocation(line: 108, column: 5, scope: !92)
!105 = !DILocation(line: 109, column: 5, scope: !92)
!106 = !DILocation(line: 112, column: 5, scope: !92)
!107 = !DILocation(line: 113, column: 5, scope: !92)
!108 = !DILocation(line: 114, column: 5, scope: !92)
!109 = !DILocation(line: 116, column: 5, scope: !92)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!111 = !DILocalVariable(name: "h", scope: !110, file: !12, line: 62, type: !17)
!112 = !DILocation(line: 62, column: 9, scope: !110)
!113 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 63, type: !20)
!114 = !DILocation(line: 63, column: 12, scope: !110)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !12, line: 64, type: !24)
!116 = !DILocation(line: 64, column: 10, scope: !110)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !12, line: 65, type: !29)
!118 = !DILocation(line: 65, column: 10, scope: !110)
!119 = !DILocation(line: 66, column: 11, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !12, line: 66, column: 5)
!121 = !DILocation(line: 66, column: 9, scope: !120)
!122 = !DILocation(line: 66, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 66, column: 5)
!124 = !DILocation(line: 66, column: 18, scope: !123)
!125 = !DILocation(line: 66, column: 5, scope: !120)
!126 = !DILocation(line: 70, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 67, column: 5)
!128 = !DILocation(line: 70, column: 14, scope: !127)
!129 = !DILocation(line: 71, column: 9, scope: !127)
!130 = !DILocation(line: 71, column: 17, scope: !127)
!131 = !DILocation(line: 72, column: 5, scope: !127)
!132 = !DILocation(line: 66, column: 24, scope: !123)
!133 = !DILocation(line: 66, column: 5, scope: !123)
!134 = distinct !{!134, !125, !135, !50}
!135 = !DILocation(line: 72, column: 5, scope: !120)
!136 = !DILocalVariable(name: "source", scope: !137, file: !12, line: 74, type: !29)
!137 = distinct !DILexicalBlock(scope: !110, file: !12, line: 73, column: 5)
!138 = !DILocation(line: 74, column: 14, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !137, file: !12, line: 75, type: !55)
!140 = !DILocation(line: 75, column: 16, scope: !137)
!141 = !DILocalVariable(name: "sourceLen", scope: !137, file: !12, line: 75, type: !55)
!142 = !DILocation(line: 75, column: 19, scope: !137)
!143 = !DILocation(line: 76, column: 28, scope: !137)
!144 = !DILocation(line: 76, column: 21, scope: !137)
!145 = !DILocation(line: 76, column: 19, scope: !137)
!146 = !DILocation(line: 79, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !137, file: !12, line: 79, column: 9)
!148 = !DILocation(line: 79, column: 14, scope: !147)
!149 = !DILocation(line: 79, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !12, line: 79, column: 9)
!151 = !DILocation(line: 79, column: 25, scope: !150)
!152 = !DILocation(line: 79, column: 35, scope: !150)
!153 = !DILocation(line: 79, column: 23, scope: !150)
!154 = !DILocation(line: 79, column: 9, scope: !147)
!155 = !DILocation(line: 81, column: 30, scope: !156)
!156 = distinct !DILexicalBlock(scope: !150, file: !12, line: 80, column: 9)
!157 = !DILocation(line: 81, column: 23, scope: !156)
!158 = !DILocation(line: 81, column: 13, scope: !156)
!159 = !DILocation(line: 81, column: 18, scope: !156)
!160 = !DILocation(line: 81, column: 21, scope: !156)
!161 = !DILocation(line: 82, column: 9, scope: !156)
!162 = !DILocation(line: 79, column: 41, scope: !150)
!163 = !DILocation(line: 79, column: 9, scope: !150)
!164 = distinct !{!164, !154, !165, !50}
!165 = !DILocation(line: 82, column: 9, scope: !147)
!166 = !DILocation(line: 83, column: 19, scope: !137)
!167 = !DILocation(line: 83, column: 9, scope: !137)
!168 = !DILocation(line: 85, column: 1, scope: !110)
