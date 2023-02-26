; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !29
  store i32* %arraydecay, i32** %data, align 8, !dbg !30
  br label %source, !dbg !31

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !32), !dbg !33
  %0 = load i32*, i32** %data, align 8, !dbg !34
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !35
  %1 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !50, metadata !DIExpression()), !dbg !51
  %3 = load i32*, i32** %data, align 8, !dbg !52
  %call1 = call i64 @wcslen(i32* noundef %3), !dbg !53
  store i64 %call1, i64* %dataLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %source
  %4 = load i64, i64* %i, align 8, !dbg !58
  %5 = load i64, i64* %dataLen, align 8, !dbg !60
  %cmp = icmp ult i64 %4, %5, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !63
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !63
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !67
  store i32 %8, i32* %arrayidx3, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %10, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !75
  store i32 0, i32* %arrayidx4, align 4, !dbg !76
  %11 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* noundef %11), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18_good() #0 !dbg !80 {
entry:
  call void @goodG2B(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* noundef null), !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 noundef %conv), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !108
  store i32* %arraydecay, i32** %data, align 8, !dbg !109
  br label %source, !dbg !110

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !111), !dbg !112
  %0 = load i32*, i32** %data, align 8, !dbg !113
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %2 = bitcast [50 x i32]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 200, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !122, metadata !DIExpression()), !dbg !123
  %3 = load i32*, i32** %data, align 8, !dbg !124
  %call1 = call i64 @wcslen(i32* noundef %3), !dbg !125
  store i64 %call1, i64* %dataLen, align 8, !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %source
  %4 = load i64, i64* %i, align 8, !dbg !130
  %5 = load i64, i64* %dataLen, align 8, !dbg !132
  %cmp = icmp ult i64 %4, %5, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !135
  %7 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !135
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !135
  %9 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %9, !dbg !139
  store i32 %8, i32* %arrayidx3, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %10, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !146
  store i32 0, i32* %arrayidx4, align 4, !dbg !147
  %11 = load i32*, i32** %data, align 8, !dbg !148
  call void @printWLine(i32* noundef %11), !dbg !149
  ret void, !dbg !150
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocation(line: 27, column: 12, scope: !11)
!30 = !DILocation(line: 27, column: 10, scope: !11)
!31 = !DILocation(line: 28, column: 5, scope: !11)
!32 = !DILabel(scope: !11, name: "source", file: !12, line: 29)
!33 = !DILocation(line: 29, column: 1, scope: !11)
!34 = !DILocation(line: 31, column: 13, scope: !11)
!35 = !DILocation(line: 31, column: 5, scope: !11)
!36 = !DILocation(line: 32, column: 5, scope: !11)
!37 = !DILocation(line: 32, column: 17, scope: !11)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 34, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 34, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 35, type: !45)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !48)
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 35, column: 16, scope: !39)
!50 = !DILocalVariable(name: "dataLen", scope: !39, file: !12, line: 35, type: !45)
!51 = !DILocation(line: 35, column: 19, scope: !39)
!52 = !DILocation(line: 36, column: 26, scope: !39)
!53 = !DILocation(line: 36, column: 19, scope: !39)
!54 = !DILocation(line: 36, column: 17, scope: !39)
!55 = !DILocation(line: 38, column: 16, scope: !56)
!56 = distinct !DILexicalBlock(scope: !39, file: !12, line: 38, column: 9)
!57 = !DILocation(line: 38, column: 14, scope: !56)
!58 = !DILocation(line: 38, column: 21, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 38, column: 9)
!60 = !DILocation(line: 38, column: 25, scope: !59)
!61 = !DILocation(line: 38, column: 23, scope: !59)
!62 = !DILocation(line: 38, column: 9, scope: !56)
!63 = !DILocation(line: 40, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !59, file: !12, line: 39, column: 9)
!65 = !DILocation(line: 40, column: 28, scope: !64)
!66 = !DILocation(line: 40, column: 18, scope: !64)
!67 = !DILocation(line: 40, column: 13, scope: !64)
!68 = !DILocation(line: 40, column: 21, scope: !64)
!69 = !DILocation(line: 41, column: 9, scope: !64)
!70 = !DILocation(line: 38, column: 35, scope: !59)
!71 = !DILocation(line: 38, column: 9, scope: !59)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 41, column: 9, scope: !56)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 42, column: 9, scope: !39)
!76 = !DILocation(line: 42, column: 20, scope: !39)
!77 = !DILocation(line: 43, column: 20, scope: !39)
!78 = !DILocation(line: 43, column: 9, scope: !39)
!79 = !DILocation(line: 45, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_18_good", scope: !12, file: !12, line: 76, type: !13, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocation(line: 78, column: 5, scope: !80)
!82 = !DILocation(line: 79, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 91, type: !84, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DISubroutineType(types: !85)
!85 = !{!22, !22, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !12, line: 91, type: !22)
!90 = !DILocation(line: 91, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !12, line: 91, type: !86)
!92 = !DILocation(line: 91, column: 27, scope: !83)
!93 = !DILocation(line: 94, column: 22, scope: !83)
!94 = !DILocation(line: 94, column: 12, scope: !83)
!95 = !DILocation(line: 94, column: 5, scope: !83)
!96 = !DILocation(line: 96, column: 5, scope: !83)
!97 = !DILocation(line: 97, column: 5, scope: !83)
!98 = !DILocation(line: 98, column: 5, scope: !83)
!99 = !DILocation(line: 101, column: 5, scope: !83)
!100 = !DILocation(line: 102, column: 5, scope: !83)
!101 = !DILocation(line: 103, column: 5, scope: !83)
!102 = !DILocation(line: 105, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!104 = !DILocalVariable(name: "data", scope: !103, file: !12, line: 54, type: !17)
!105 = !DILocation(line: 54, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBuffer", scope: !103, file: !12, line: 55, type: !25)
!107 = !DILocation(line: 55, column: 13, scope: !103)
!108 = !DILocation(line: 56, column: 12, scope: !103)
!109 = !DILocation(line: 56, column: 10, scope: !103)
!110 = !DILocation(line: 57, column: 5, scope: !103)
!111 = !DILabel(scope: !103, name: "source", file: !12, line: 58)
!112 = !DILocation(line: 58, column: 1, scope: !103)
!113 = !DILocation(line: 60, column: 13, scope: !103)
!114 = !DILocation(line: 60, column: 5, scope: !103)
!115 = !DILocation(line: 61, column: 5, scope: !103)
!116 = !DILocation(line: 61, column: 16, scope: !103)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !12, line: 63, type: !40)
!118 = distinct !DILexicalBlock(scope: !103, file: !12, line: 62, column: 5)
!119 = !DILocation(line: 63, column: 17, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !118, file: !12, line: 64, type: !45)
!121 = !DILocation(line: 64, column: 16, scope: !118)
!122 = !DILocalVariable(name: "dataLen", scope: !118, file: !12, line: 64, type: !45)
!123 = !DILocation(line: 64, column: 19, scope: !118)
!124 = !DILocation(line: 65, column: 26, scope: !118)
!125 = !DILocation(line: 65, column: 19, scope: !118)
!126 = !DILocation(line: 65, column: 17, scope: !118)
!127 = !DILocation(line: 67, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !118, file: !12, line: 67, column: 9)
!129 = !DILocation(line: 67, column: 14, scope: !128)
!130 = !DILocation(line: 67, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 67, column: 9)
!132 = !DILocation(line: 67, column: 25, scope: !131)
!133 = !DILocation(line: 67, column: 23, scope: !131)
!134 = !DILocation(line: 67, column: 9, scope: !128)
!135 = !DILocation(line: 69, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !131, file: !12, line: 68, column: 9)
!137 = !DILocation(line: 69, column: 28, scope: !136)
!138 = !DILocation(line: 69, column: 18, scope: !136)
!139 = !DILocation(line: 69, column: 13, scope: !136)
!140 = !DILocation(line: 69, column: 21, scope: !136)
!141 = !DILocation(line: 70, column: 9, scope: !136)
!142 = !DILocation(line: 67, column: 35, scope: !131)
!143 = !DILocation(line: 67, column: 9, scope: !131)
!144 = distinct !{!144, !134, !145, !74}
!145 = !DILocation(line: 70, column: 9, scope: !128)
!146 = !DILocation(line: 71, column: 9, scope: !118)
!147 = !DILocation(line: 71, column: 20, scope: !118)
!148 = !DILocation(line: 72, column: 20, scope: !118)
!149 = !DILocation(line: 72, column: 9, scope: !118)
!150 = !DILocation(line: 74, column: 1, scope: !103)
