; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16_bad() #0 !dbg !13 {
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
  br label %while.body, !dbg !25

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !26
  %5 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  br label %while.end, !dbg !30

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !44, metadata !DIExpression()), !dbg !45
  %7 = load i8*, i8** %data, align 8, !dbg !46
  %call1 = call i64 @strlen(i8* noundef %7), !dbg !47
  store i64 %call1, i64* %dataLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %while.end
  %8 = load i64, i64* %i, align 8, !dbg !52
  %9 = load i64, i64* %dataLen, align 8, !dbg !54
  %cmp = icmp ult i64 %8, %9, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !57
  %11 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !57
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !57
  %13 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !61
  store i8 %12, i8* %arrayidx3, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %14, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !69
  store i8 0, i8* %arrayidx4, align 1, !dbg !70
  %15 = load i8*, i8** %data, align 8, !dbg !71
  call void @printLine(i8* noundef %15), !dbg !72
  ret void, !dbg !73
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16_good() #0 !dbg !74 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* noundef null), !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 noundef %conv), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %0, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %1, i8** %data, align 8, !dbg !103
  br label %while.body, !dbg !104

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !105
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !105
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  br label %while.end, !dbg !109

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !110, metadata !DIExpression()), !dbg !112
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !115, metadata !DIExpression()), !dbg !116
  %7 = load i8*, i8** %data, align 8, !dbg !117
  %call1 = call i64 @strlen(i8* noundef %7), !dbg !118
  store i64 %call1, i64* %dataLen, align 8, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %while.end
  %8 = load i64, i64* %i, align 8, !dbg !123
  %9 = load i64, i64* %dataLen, align 8, !dbg !125
  %cmp = icmp ult i64 %8, %9, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !128
  %11 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !128
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !128
  %13 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !132
  store i8 %12, i8* %arrayidx3, align 1, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %14, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !139
  store i8 0, i8* %arrayidx4, align 1, !dbg !140
  %15 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* noundef %15), !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!25 = !DILocation(line: 28, column: 5, scope: !13)
!26 = !DILocation(line: 31, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!28 = !DILocation(line: 32, column: 9, scope: !27)
!29 = !DILocation(line: 32, column: 21, scope: !27)
!30 = !DILocation(line: 33, column: 9, scope: !27)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !14, line: 36, type: !33)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 36, column: 14, scope: !32)
!37 = !DILocalVariable(name: "i", scope: !32, file: !14, line: 37, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 31, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !41, line: 94, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 37, column: 16, scope: !32)
!44 = !DILocalVariable(name: "dataLen", scope: !32, file: !14, line: 37, type: !38)
!45 = !DILocation(line: 37, column: 19, scope: !32)
!46 = !DILocation(line: 38, column: 26, scope: !32)
!47 = !DILocation(line: 38, column: 19, scope: !32)
!48 = !DILocation(line: 38, column: 17, scope: !32)
!49 = !DILocation(line: 40, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !32, file: !14, line: 40, column: 9)
!51 = !DILocation(line: 40, column: 14, scope: !50)
!52 = !DILocation(line: 40, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !14, line: 40, column: 9)
!54 = !DILocation(line: 40, column: 25, scope: !53)
!55 = !DILocation(line: 40, column: 23, scope: !53)
!56 = !DILocation(line: 40, column: 9, scope: !50)
!57 = !DILocation(line: 42, column: 23, scope: !58)
!58 = distinct !DILexicalBlock(scope: !53, file: !14, line: 41, column: 9)
!59 = !DILocation(line: 42, column: 28, scope: !58)
!60 = !DILocation(line: 42, column: 18, scope: !58)
!61 = !DILocation(line: 42, column: 13, scope: !58)
!62 = !DILocation(line: 42, column: 21, scope: !58)
!63 = !DILocation(line: 43, column: 9, scope: !58)
!64 = !DILocation(line: 40, column: 35, scope: !53)
!65 = !DILocation(line: 40, column: 9, scope: !53)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 43, column: 9, scope: !50)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 44, column: 9, scope: !32)
!70 = !DILocation(line: 44, column: 20, scope: !32)
!71 = !DILocation(line: 45, column: 19, scope: !32)
!72 = !DILocation(line: 45, column: 9, scope: !32)
!73 = !DILocation(line: 47, column: 1, scope: !13)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_16_good", scope: !14, file: !14, line: 80, type: !15, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DILocation(line: 82, column: 5, scope: !74)
!76 = !DILocation(line: 83, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 95, type: !78, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !14, line: 95, type: !80)
!83 = !DILocation(line: 95, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !14, line: 95, type: !81)
!85 = !DILocation(line: 95, column: 27, scope: !77)
!86 = !DILocation(line: 98, column: 22, scope: !77)
!87 = !DILocation(line: 98, column: 12, scope: !77)
!88 = !DILocation(line: 98, column: 5, scope: !77)
!89 = !DILocation(line: 100, column: 5, scope: !77)
!90 = !DILocation(line: 101, column: 5, scope: !77)
!91 = !DILocation(line: 102, column: 5, scope: !77)
!92 = !DILocation(line: 105, column: 5, scope: !77)
!93 = !DILocation(line: 106, column: 5, scope: !77)
!94 = !DILocation(line: 107, column: 5, scope: !77)
!95 = !DILocation(line: 109, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 56, type: !3)
!98 = !DILocation(line: 56, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !14, line: 57, type: !3)
!100 = !DILocation(line: 57, column: 12, scope: !96)
!101 = !DILocation(line: 57, column: 33, scope: !96)
!102 = !DILocation(line: 58, column: 12, scope: !96)
!103 = !DILocation(line: 58, column: 10, scope: !96)
!104 = !DILocation(line: 59, column: 5, scope: !96)
!105 = !DILocation(line: 62, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !96, file: !14, line: 60, column: 5)
!107 = !DILocation(line: 63, column: 9, scope: !106)
!108 = !DILocation(line: 63, column: 20, scope: !106)
!109 = !DILocation(line: 64, column: 9, scope: !106)
!110 = !DILocalVariable(name: "dest", scope: !111, file: !14, line: 67, type: !33)
!111 = distinct !DILexicalBlock(scope: !96, file: !14, line: 66, column: 5)
!112 = !DILocation(line: 67, column: 14, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !111, file: !14, line: 68, type: !38)
!114 = !DILocation(line: 68, column: 16, scope: !111)
!115 = !DILocalVariable(name: "dataLen", scope: !111, file: !14, line: 68, type: !38)
!116 = !DILocation(line: 68, column: 19, scope: !111)
!117 = !DILocation(line: 69, column: 26, scope: !111)
!118 = !DILocation(line: 69, column: 19, scope: !111)
!119 = !DILocation(line: 69, column: 17, scope: !111)
!120 = !DILocation(line: 71, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !111, file: !14, line: 71, column: 9)
!122 = !DILocation(line: 71, column: 14, scope: !121)
!123 = !DILocation(line: 71, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !14, line: 71, column: 9)
!125 = !DILocation(line: 71, column: 25, scope: !124)
!126 = !DILocation(line: 71, column: 23, scope: !124)
!127 = !DILocation(line: 71, column: 9, scope: !121)
!128 = !DILocation(line: 73, column: 23, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !14, line: 72, column: 9)
!130 = !DILocation(line: 73, column: 28, scope: !129)
!131 = !DILocation(line: 73, column: 18, scope: !129)
!132 = !DILocation(line: 73, column: 13, scope: !129)
!133 = !DILocation(line: 73, column: 21, scope: !129)
!134 = !DILocation(line: 74, column: 9, scope: !129)
!135 = !DILocation(line: 71, column: 35, scope: !124)
!136 = !DILocation(line: 71, column: 9, scope: !124)
!137 = distinct !{!137, !127, !138, !68}
!138 = !DILocation(line: 74, column: 9, scope: !121)
!139 = !DILocation(line: 75, column: 9, scope: !111)
!140 = !DILocation(line: 75, column: 20, scope: !111)
!141 = !DILocation(line: 76, column: 19, scope: !111)
!142 = !DILocation(line: 76, column: 9, scope: !111)
!143 = !DILocation(line: 78, column: 1, scope: !96)
