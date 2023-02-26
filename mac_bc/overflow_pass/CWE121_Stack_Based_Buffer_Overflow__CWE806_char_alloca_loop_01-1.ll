; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 100, align 16, !dbg !22
  store i8* %0, i8** %dataBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !25
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !25
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !25
  %5 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !33
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !41, metadata !DIExpression()), !dbg !42
  %7 = load i8*, i8** %data, align 8, !dbg !43
  %call1 = call i64 @strlen(i8* noundef %7), !dbg !44
  store i64 %call1, i64* %dataLen, align 8, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !49
  %9 = load i64, i64* %dataLen, align 8, !dbg !51
  %cmp = icmp ult i64 %8, %9, !dbg !52
  br i1 %cmp, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !54
  %11 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !54
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !54
  %13 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !58
  store i8 %12, i8* %arrayidx3, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %14, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !66
  store i8 0, i8* %arrayidx4, align 1, !dbg !67
  %15 = load i8*, i8** %data, align 8, !dbg !68
  call void @printLine(i8* noundef %15), !dbg !69
  ret void, !dbg !70
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_good() #0 !dbg !71 {
entry:
  call void @goodG2B(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* noundef null), !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 noundef %conv), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_good(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_bad(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = alloca i8, i64 100, align 16, !dbg !98
  store i8* %0, i8** %dataBuffer, align 8, !dbg !97
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !99
  store i8* %1, i8** %data, align 8, !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !101
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !106
  call void @llvm.dbg.declare(metadata i64* %i, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !109, metadata !DIExpression()), !dbg !110
  %7 = load i8*, i8** %data, align 8, !dbg !111
  %call1 = call i64 @strlen(i8* noundef %7), !dbg !112
  store i64 %call1, i64* %dataLen, align 8, !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !117
  %9 = load i64, i64* %dataLen, align 8, !dbg !119
  %cmp = icmp ult i64 %8, %9, !dbg !120
  br i1 %cmp, label %for.body, label %for.end, !dbg !121

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !122
  %11 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !122
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !122
  %13 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !126
  store i8 %12, i8* %arrayidx3, align 1, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %14, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !133
  store i8 0, i8* %arrayidx4, align 1, !dbg !134
  %15 = load i8*, i8** %data, align 8, !dbg !135
  call void @printLine(i8* noundef %15), !dbg !136
  ret void, !dbg !137
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 33, scope: !13)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 10, scope: !13)
!25 = !DILocation(line: 29, column: 5, scope: !13)
!26 = !DILocation(line: 30, column: 5, scope: !13)
!27 = !DILocation(line: 30, column: 17, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 32, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 32, column: 14, scope: !29)
!34 = !DILocalVariable(name: "i", scope: !29, file: !14, line: 33, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !36, line: 31, baseType: !37)
!36 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !38, line: 94, baseType: !39)
!38 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 33, column: 16, scope: !29)
!41 = !DILocalVariable(name: "dataLen", scope: !29, file: !14, line: 33, type: !35)
!42 = !DILocation(line: 33, column: 19, scope: !29)
!43 = !DILocation(line: 34, column: 26, scope: !29)
!44 = !DILocation(line: 34, column: 19, scope: !29)
!45 = !DILocation(line: 34, column: 17, scope: !29)
!46 = !DILocation(line: 36, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !29, file: !14, line: 36, column: 9)
!48 = !DILocation(line: 36, column: 14, scope: !47)
!49 = !DILocation(line: 36, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !14, line: 36, column: 9)
!51 = !DILocation(line: 36, column: 25, scope: !50)
!52 = !DILocation(line: 36, column: 23, scope: !50)
!53 = !DILocation(line: 36, column: 9, scope: !47)
!54 = !DILocation(line: 38, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !50, file: !14, line: 37, column: 9)
!56 = !DILocation(line: 38, column: 28, scope: !55)
!57 = !DILocation(line: 38, column: 18, scope: !55)
!58 = !DILocation(line: 38, column: 13, scope: !55)
!59 = !DILocation(line: 38, column: 21, scope: !55)
!60 = !DILocation(line: 39, column: 9, scope: !55)
!61 = !DILocation(line: 36, column: 35, scope: !50)
!62 = !DILocation(line: 36, column: 9, scope: !50)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 39, column: 9, scope: !47)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 40, column: 9, scope: !29)
!67 = !DILocation(line: 40, column: 20, scope: !29)
!68 = !DILocation(line: 41, column: 19, scope: !29)
!69 = !DILocation(line: 41, column: 9, scope: !29)
!70 = !DILocation(line: 43, column: 1, scope: !13)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_01_good", scope: !14, file: !14, line: 72, type: !15, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DILocation(line: 74, column: 5, scope: !71)
!73 = !DILocation(line: 75, column: 1, scope: !71)
!74 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !75, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !14, line: 87, type: !77)
!80 = !DILocation(line: 87, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !14, line: 87, type: !78)
!82 = !DILocation(line: 87, column: 27, scope: !74)
!83 = !DILocation(line: 90, column: 22, scope: !74)
!84 = !DILocation(line: 90, column: 12, scope: !74)
!85 = !DILocation(line: 90, column: 5, scope: !74)
!86 = !DILocation(line: 92, column: 5, scope: !74)
!87 = !DILocation(line: 93, column: 5, scope: !74)
!88 = !DILocation(line: 94, column: 5, scope: !74)
!89 = !DILocation(line: 97, column: 5, scope: !74)
!90 = !DILocation(line: 98, column: 5, scope: !74)
!91 = !DILocation(line: 99, column: 5, scope: !74)
!92 = !DILocation(line: 101, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 50, type: !15, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!94 = !DILocalVariable(name: "data", scope: !93, file: !14, line: 52, type: !3)
!95 = !DILocation(line: 52, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !14, line: 53, type: !3)
!97 = !DILocation(line: 53, column: 12, scope: !93)
!98 = !DILocation(line: 53, column: 33, scope: !93)
!99 = !DILocation(line: 54, column: 12, scope: !93)
!100 = !DILocation(line: 54, column: 10, scope: !93)
!101 = !DILocation(line: 56, column: 5, scope: !93)
!102 = !DILocation(line: 57, column: 5, scope: !93)
!103 = !DILocation(line: 57, column: 16, scope: !93)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !14, line: 59, type: !30)
!105 = distinct !DILexicalBlock(scope: !93, file: !14, line: 58, column: 5)
!106 = !DILocation(line: 59, column: 14, scope: !105)
!107 = !DILocalVariable(name: "i", scope: !105, file: !14, line: 60, type: !35)
!108 = !DILocation(line: 60, column: 16, scope: !105)
!109 = !DILocalVariable(name: "dataLen", scope: !105, file: !14, line: 60, type: !35)
!110 = !DILocation(line: 60, column: 19, scope: !105)
!111 = !DILocation(line: 61, column: 26, scope: !105)
!112 = !DILocation(line: 61, column: 19, scope: !105)
!113 = !DILocation(line: 61, column: 17, scope: !105)
!114 = !DILocation(line: 63, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !14, line: 63, column: 9)
!116 = !DILocation(line: 63, column: 14, scope: !115)
!117 = !DILocation(line: 63, column: 21, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !14, line: 63, column: 9)
!119 = !DILocation(line: 63, column: 25, scope: !118)
!120 = !DILocation(line: 63, column: 23, scope: !118)
!121 = !DILocation(line: 63, column: 9, scope: !115)
!122 = !DILocation(line: 65, column: 23, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !14, line: 64, column: 9)
!124 = !DILocation(line: 65, column: 28, scope: !123)
!125 = !DILocation(line: 65, column: 18, scope: !123)
!126 = !DILocation(line: 65, column: 13, scope: !123)
!127 = !DILocation(line: 65, column: 21, scope: !123)
!128 = !DILocation(line: 66, column: 9, scope: !123)
!129 = !DILocation(line: 63, column: 35, scope: !118)
!130 = !DILocation(line: 63, column: 9, scope: !118)
!131 = distinct !{!131, !121, !132, !65}
!132 = !DILocation(line: 66, column: 9, scope: !115)
!133 = !DILocation(line: 67, column: 9, scope: !105)
!134 = !DILocation(line: 67, column: 20, scope: !105)
!135 = !DILocation(line: 68, column: 19, scope: !105)
!136 = !DILocation(line: 68, column: 9, scope: !105)
!137 = !DILocation(line: 70, column: 1, scope: !93)
