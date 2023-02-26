; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_badSink(i32* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !29
  call void @llvm.dbg.declare(metadata i64* %i, metadata !30, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !36, metadata !DIExpression()), !dbg !37
  %1 = load i32*, i32** %data.addr, align 8, !dbg !38
  %call = call i64 @wcslen(i32* noundef %1), !dbg !39
  store i64 %call, i64* %dataLen, align 8, !dbg !40
  store i64 0, i64* %i, align 8, !dbg !41
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !44
  %3 = load i64, i64* %dataLen, align 8, !dbg !46
  %cmp = icmp ult i64 %2, %3, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !49
  %5 = load i64, i64* %i, align 8, !dbg !51
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !49
  %6 = load i32, i32* %arrayidx, align 4, !dbg !49
  %7 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !53
  store i32 %6, i32* %arrayidx1, align 4, !dbg !54
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !56
  %inc = add i64 %8, 1, !dbg !56
  store i64 %inc, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !61
  store i32 0, i32* %arrayidx2, align 4, !dbg !62
  %9 = load i32*, i32** %data.addr, align 8, !dbg !63
  call void @printWLine(i32* noundef %9), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_bad() #0 !dbg !66 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !71, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !76
  store i32* %arraydecay, i32** %data, align 8, !dbg !77
  %0 = load i32*, i32** %data, align 8, !dbg !78
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !80
  store i32 0, i32* %arrayidx, align 4, !dbg !81
  %2 = load i32*, i32** %data, align 8, !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_badSink(i32* noundef %2), !dbg !83
  ret void, !dbg !84
}

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_goodG2BSink(i32* noundef %data) #0 !dbg !85 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !90
  call void @llvm.dbg.declare(metadata i64* %i, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !93, metadata !DIExpression()), !dbg !94
  %1 = load i32*, i32** %data.addr, align 8, !dbg !95
  %call = call i64 @wcslen(i32* noundef %1), !dbg !96
  store i64 %call, i64* %dataLen, align 8, !dbg !97
  store i64 0, i64* %i, align 8, !dbg !98
  br label %for.cond, !dbg !100

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !101
  %3 = load i64, i64* %dataLen, align 8, !dbg !103
  %cmp = icmp ult i64 %2, %3, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data.addr, align 8, !dbg !106
  %5 = load i64, i64* %i, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !106
  %6 = load i32, i32* %arrayidx, align 4, !dbg !106
  %7 = load i64, i64* %i, align 8, !dbg !109
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %7, !dbg !110
  store i32 %6, i32* %arrayidx1, align 4, !dbg !111
  br label %for.inc, !dbg !112

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !113
  %inc = add i64 %8, 1, !dbg !113
  store i64 %inc, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !114, !llvm.loop !115

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !117
  store i32 0, i32* %arrayidx2, align 4, !dbg !118
  %9 = load i32*, i32** %data.addr, align 8, !dbg !119
  call void @printWLine(i32* noundef %9), !dbg !120
  ret void, !dbg !121
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_good() #0 !dbg !122 {
entry:
  call void @goodG2B(), !dbg !123
  ret void, !dbg !124
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !125 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !131, metadata !DIExpression()), !dbg !132
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !133, metadata !DIExpression()), !dbg !134
  %call = call i64 @time(i64* noundef null), !dbg !135
  %conv = trunc i64 %call to i32, !dbg !136
  call void @srand(i32 noundef %conv), !dbg !137
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !138
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_good(), !dbg !139
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !140
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !141
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_bad(), !dbg !142
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !143
  ret i32 0, !dbg !144
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !145 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !150
  store i32* %arraydecay, i32** %data, align 8, !dbg !151
  %0 = load i32*, i32** %data, align 8, !dbg !152
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !153
  %1 = load i32*, i32** %data, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  %2 = load i32*, i32** %data, align 8, !dbg !156
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_goodG2BSink(i32* noundef %2), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!23 = !DILocation(line: 23, column: 91, scope: !11)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !12, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 26, column: 17, scope: !25)
!30 = !DILocalVariable(name: "i", scope: !25, file: !12, line: 27, type: !31)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !32, line: 31, baseType: !33)
!32 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !19, line: 94, baseType: !34)
!34 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!35 = !DILocation(line: 27, column: 16, scope: !25)
!36 = !DILocalVariable(name: "dataLen", scope: !25, file: !12, line: 27, type: !31)
!37 = !DILocation(line: 27, column: 19, scope: !25)
!38 = !DILocation(line: 28, column: 26, scope: !25)
!39 = !DILocation(line: 28, column: 19, scope: !25)
!40 = !DILocation(line: 28, column: 17, scope: !25)
!41 = !DILocation(line: 30, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !25, file: !12, line: 30, column: 9)
!43 = !DILocation(line: 30, column: 14, scope: !42)
!44 = !DILocation(line: 30, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 30, column: 9)
!46 = !DILocation(line: 30, column: 25, scope: !45)
!47 = !DILocation(line: 30, column: 23, scope: !45)
!48 = !DILocation(line: 30, column: 9, scope: !42)
!49 = !DILocation(line: 32, column: 23, scope: !50)
!50 = distinct !DILexicalBlock(scope: !45, file: !12, line: 31, column: 9)
!51 = !DILocation(line: 32, column: 28, scope: !50)
!52 = !DILocation(line: 32, column: 18, scope: !50)
!53 = !DILocation(line: 32, column: 13, scope: !50)
!54 = !DILocation(line: 32, column: 21, scope: !50)
!55 = !DILocation(line: 33, column: 9, scope: !50)
!56 = !DILocation(line: 30, column: 35, scope: !45)
!57 = !DILocation(line: 30, column: 9, scope: !45)
!58 = distinct !{!58, !48, !59, !60}
!59 = !DILocation(line: 33, column: 9, scope: !42)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 34, column: 9, scope: !25)
!62 = !DILocation(line: 34, column: 20, scope: !25)
!63 = !DILocation(line: 35, column: 20, scope: !25)
!64 = !DILocation(line: 35, column: 9, scope: !25)
!65 = !DILocation(line: 37, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_bad", scope: !12, file: !12, line: 39, type: !67, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 41, type: !15)
!70 = !DILocation(line: 41, column: 15, scope: !66)
!71 = !DILocalVariable(name: "dataBuffer", scope: !66, file: !12, line: 42, type: !72)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 100)
!75 = !DILocation(line: 42, column: 13, scope: !66)
!76 = !DILocation(line: 43, column: 12, scope: !66)
!77 = !DILocation(line: 43, column: 10, scope: !66)
!78 = !DILocation(line: 45, column: 13, scope: !66)
!79 = !DILocation(line: 45, column: 5, scope: !66)
!80 = !DILocation(line: 46, column: 5, scope: !66)
!81 = !DILocation(line: 46, column: 17, scope: !66)
!82 = !DILocation(line: 47, column: 80, scope: !66)
!83 = !DILocation(line: 47, column: 5, scope: !66)
!84 = !DILocation(line: 48, column: 1, scope: !66)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!86 = !DILocalVariable(name: "data", arg: 1, scope: !85, file: !12, line: 54, type: !15)
!87 = !DILocation(line: 54, column: 95, scope: !85)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !12, line: 57, type: !26)
!89 = distinct !DILexicalBlock(scope: !85, file: !12, line: 56, column: 5)
!90 = !DILocation(line: 57, column: 17, scope: !89)
!91 = !DILocalVariable(name: "i", scope: !89, file: !12, line: 58, type: !31)
!92 = !DILocation(line: 58, column: 16, scope: !89)
!93 = !DILocalVariable(name: "dataLen", scope: !89, file: !12, line: 58, type: !31)
!94 = !DILocation(line: 58, column: 19, scope: !89)
!95 = !DILocation(line: 59, column: 26, scope: !89)
!96 = !DILocation(line: 59, column: 19, scope: !89)
!97 = !DILocation(line: 59, column: 17, scope: !89)
!98 = !DILocation(line: 61, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !89, file: !12, line: 61, column: 9)
!100 = !DILocation(line: 61, column: 14, scope: !99)
!101 = !DILocation(line: 61, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 61, column: 9)
!103 = !DILocation(line: 61, column: 25, scope: !102)
!104 = !DILocation(line: 61, column: 23, scope: !102)
!105 = !DILocation(line: 61, column: 9, scope: !99)
!106 = !DILocation(line: 63, column: 23, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !12, line: 62, column: 9)
!108 = !DILocation(line: 63, column: 28, scope: !107)
!109 = !DILocation(line: 63, column: 18, scope: !107)
!110 = !DILocation(line: 63, column: 13, scope: !107)
!111 = !DILocation(line: 63, column: 21, scope: !107)
!112 = !DILocation(line: 64, column: 9, scope: !107)
!113 = !DILocation(line: 61, column: 35, scope: !102)
!114 = !DILocation(line: 61, column: 9, scope: !102)
!115 = distinct !{!115, !105, !116, !60}
!116 = !DILocation(line: 64, column: 9, scope: !99)
!117 = !DILocation(line: 65, column: 9, scope: !89)
!118 = !DILocation(line: 65, column: 20, scope: !89)
!119 = !DILocation(line: 66, column: 20, scope: !89)
!120 = !DILocation(line: 66, column: 9, scope: !89)
!121 = !DILocation(line: 68, column: 1, scope: !85)
!122 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_41_good", scope: !12, file: !12, line: 82, type: !67, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!123 = !DILocation(line: 84, column: 5, scope: !122)
!124 = !DILocation(line: 85, column: 1, scope: !122)
!125 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !126, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!126 = !DISubroutineType(types: !127)
!127 = !{!20, !20, !128}
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!131 = !DILocalVariable(name: "argc", arg: 1, scope: !125, file: !12, line: 97, type: !20)
!132 = !DILocation(line: 97, column: 14, scope: !125)
!133 = !DILocalVariable(name: "argv", arg: 2, scope: !125, file: !12, line: 97, type: !128)
!134 = !DILocation(line: 97, column: 27, scope: !125)
!135 = !DILocation(line: 100, column: 22, scope: !125)
!136 = !DILocation(line: 100, column: 12, scope: !125)
!137 = !DILocation(line: 100, column: 5, scope: !125)
!138 = !DILocation(line: 102, column: 5, scope: !125)
!139 = !DILocation(line: 103, column: 5, scope: !125)
!140 = !DILocation(line: 104, column: 5, scope: !125)
!141 = !DILocation(line: 107, column: 5, scope: !125)
!142 = !DILocation(line: 108, column: 5, scope: !125)
!143 = !DILocation(line: 109, column: 5, scope: !125)
!144 = !DILocation(line: 111, column: 5, scope: !125)
!145 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 71, type: !67, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!146 = !DILocalVariable(name: "data", scope: !145, file: !12, line: 73, type: !15)
!147 = !DILocation(line: 73, column: 15, scope: !145)
!148 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !12, line: 74, type: !72)
!149 = !DILocation(line: 74, column: 13, scope: !145)
!150 = !DILocation(line: 75, column: 12, scope: !145)
!151 = !DILocation(line: 75, column: 10, scope: !145)
!152 = !DILocation(line: 77, column: 13, scope: !145)
!153 = !DILocation(line: 77, column: 5, scope: !145)
!154 = !DILocation(line: 78, column: 5, scope: !145)
!155 = !DILocation(line: 78, column: 16, scope: !145)
!156 = !DILocation(line: 79, column: 84, scope: !145)
!157 = !DILocation(line: 79, column: 5, scope: !145)
!158 = !DILocation(line: 80, column: 1, scope: !145)
