; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !27
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !27
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !43, metadata !DIExpression()), !dbg !44
  %5 = load i8*, i8** %data, align 8, !dbg !45
  %call1 = call i64 @strlen(i8* noundef %5), !dbg !46
  store i64 %call1, i64* %dataLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !51
  %7 = load i64, i64* %dataLen, align 8, !dbg !53
  %cmp = icmp ult i64 %6, %7, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !56
  %9 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !56
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !56
  %11 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !60
  store i8 %10, i8* %arrayidx3, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %12, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !68
  store i8 0, i8* %arrayidx4, align 1, !dbg !69
  %13 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* noundef %13), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* noundef null), !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 noundef %conv), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !100
  store i8* %arraydecay, i8** %data, align 8, !dbg !101
  %0 = load i8*, i8** %data, align 8, !dbg !102
  %1 = load i8*, i8** %data, align 8, !dbg !102
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !102
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !102
  %3 = load i8*, i8** %data, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !107
  call void @llvm.dbg.declare(metadata i64* %i, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !110, metadata !DIExpression()), !dbg !111
  %5 = load i8*, i8** %data, align 8, !dbg !112
  %call1 = call i64 @strlen(i8* noundef %5), !dbg !113
  store i64 %call1, i64* %dataLen, align 8, !dbg !114
  store i64 0, i64* %i, align 8, !dbg !115
  br label %for.cond, !dbg !117

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !118
  %7 = load i64, i64* %dataLen, align 8, !dbg !120
  %cmp = icmp ult i64 %6, %7, !dbg !121
  br i1 %cmp, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %8 = load i8*, i8** %data, align 8, !dbg !123
  %9 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !123
  %10 = load i8, i8* %arrayidx2, align 1, !dbg !123
  %11 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %11, !dbg !127
  store i8 %10, i8* %arrayidx3, align 1, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %12, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !134
  store i8 0, i8* %arrayidx4, align 1, !dbg !135
  %13 = load i8*, i8** %data, align 8, !dbg !136
  call void @printLine(i8* noundef %13), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocation(line: 27, column: 12, scope: !11)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 29, column: 5, scope: !11)
!28 = !DILocation(line: 30, column: 5, scope: !11)
!29 = !DILocation(line: 30, column: 17, scope: !11)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 32, type: !32)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 31, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 32, column: 14, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !12, line: 33, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 31, baseType: !39)
!38 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !40, line: 94, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 33, column: 16, scope: !31)
!43 = !DILocalVariable(name: "dataLen", scope: !31, file: !12, line: 33, type: !37)
!44 = !DILocation(line: 33, column: 19, scope: !31)
!45 = !DILocation(line: 34, column: 26, scope: !31)
!46 = !DILocation(line: 34, column: 19, scope: !31)
!47 = !DILocation(line: 34, column: 17, scope: !31)
!48 = !DILocation(line: 36, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !31, file: !12, line: 36, column: 9)
!50 = !DILocation(line: 36, column: 14, scope: !49)
!51 = !DILocation(line: 36, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !12, line: 36, column: 9)
!53 = !DILocation(line: 36, column: 25, scope: !52)
!54 = !DILocation(line: 36, column: 23, scope: !52)
!55 = !DILocation(line: 36, column: 9, scope: !49)
!56 = !DILocation(line: 38, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 37, column: 9)
!58 = !DILocation(line: 38, column: 28, scope: !57)
!59 = !DILocation(line: 38, column: 18, scope: !57)
!60 = !DILocation(line: 38, column: 13, scope: !57)
!61 = !DILocation(line: 38, column: 21, scope: !57)
!62 = !DILocation(line: 39, column: 9, scope: !57)
!63 = !DILocation(line: 36, column: 35, scope: !52)
!64 = !DILocation(line: 36, column: 9, scope: !52)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 39, column: 9, scope: !49)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 40, column: 9, scope: !31)
!69 = !DILocation(line: 40, column: 20, scope: !31)
!70 = !DILocation(line: 41, column: 19, scope: !31)
!71 = !DILocation(line: 41, column: 9, scope: !31)
!72 = !DILocation(line: 43, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_loop_01_good", scope: !12, file: !12, line: 72, type: !13, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocation(line: 74, column: 5, scope: !73)
!75 = !DILocation(line: 75, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !77, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 87, type: !79)
!82 = !DILocation(line: 87, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 87, type: !80)
!84 = !DILocation(line: 87, column: 27, scope: !76)
!85 = !DILocation(line: 90, column: 22, scope: !76)
!86 = !DILocation(line: 90, column: 12, scope: !76)
!87 = !DILocation(line: 90, column: 5, scope: !76)
!88 = !DILocation(line: 92, column: 5, scope: !76)
!89 = !DILocation(line: 93, column: 5, scope: !76)
!90 = !DILocation(line: 94, column: 5, scope: !76)
!91 = !DILocation(line: 97, column: 5, scope: !76)
!92 = !DILocation(line: 98, column: 5, scope: !76)
!93 = !DILocation(line: 99, column: 5, scope: !76)
!94 = !DILocation(line: 101, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 52, type: !17)
!97 = !DILocation(line: 52, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !12, line: 53, type: !21)
!99 = !DILocation(line: 53, column: 10, scope: !95)
!100 = !DILocation(line: 54, column: 12, scope: !95)
!101 = !DILocation(line: 54, column: 10, scope: !95)
!102 = !DILocation(line: 56, column: 5, scope: !95)
!103 = !DILocation(line: 57, column: 5, scope: !95)
!104 = !DILocation(line: 57, column: 16, scope: !95)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !12, line: 59, type: !32)
!106 = distinct !DILexicalBlock(scope: !95, file: !12, line: 58, column: 5)
!107 = !DILocation(line: 59, column: 14, scope: !106)
!108 = !DILocalVariable(name: "i", scope: !106, file: !12, line: 60, type: !37)
!109 = !DILocation(line: 60, column: 16, scope: !106)
!110 = !DILocalVariable(name: "dataLen", scope: !106, file: !12, line: 60, type: !37)
!111 = !DILocation(line: 60, column: 19, scope: !106)
!112 = !DILocation(line: 61, column: 26, scope: !106)
!113 = !DILocation(line: 61, column: 19, scope: !106)
!114 = !DILocation(line: 61, column: 17, scope: !106)
!115 = !DILocation(line: 63, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !12, line: 63, column: 9)
!117 = !DILocation(line: 63, column: 14, scope: !116)
!118 = !DILocation(line: 63, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 63, column: 9)
!120 = !DILocation(line: 63, column: 25, scope: !119)
!121 = !DILocation(line: 63, column: 23, scope: !119)
!122 = !DILocation(line: 63, column: 9, scope: !116)
!123 = !DILocation(line: 65, column: 23, scope: !124)
!124 = distinct !DILexicalBlock(scope: !119, file: !12, line: 64, column: 9)
!125 = !DILocation(line: 65, column: 28, scope: !124)
!126 = !DILocation(line: 65, column: 18, scope: !124)
!127 = !DILocation(line: 65, column: 13, scope: !124)
!128 = !DILocation(line: 65, column: 21, scope: !124)
!129 = !DILocation(line: 66, column: 9, scope: !124)
!130 = !DILocation(line: 63, column: 35, scope: !119)
!131 = !DILocation(line: 63, column: 9, scope: !119)
!132 = distinct !{!132, !122, !133, !67}
!133 = !DILocation(line: 66, column: 9, scope: !116)
!134 = !DILocation(line: 67, column: 9, scope: !106)
!135 = !DILocation(line: 67, column: 20, scope: !106)
!136 = !DILocation(line: 68, column: 19, scope: !106)
!137 = !DILocation(line: 68, column: 9, scope: !106)
!138 = !DILocation(line: 70, column: 1, scope: !95)
