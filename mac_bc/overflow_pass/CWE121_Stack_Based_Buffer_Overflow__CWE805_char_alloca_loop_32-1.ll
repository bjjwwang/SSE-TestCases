; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !34
  %3 = load i8*, i8** %2, align 8, !dbg !35
  store i8* %3, i8** %data1, align 8, !dbg !33
  %4 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %4, i8** %data1, align 8, !dbg !37
  %5 = load i8*, i8** %data1, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %6 = load i8*, i8** %data1, align 8, !dbg !40
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %6, i8** %7, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %9 = load i8*, i8** %8, align 8, !dbg !47
  store i8* %9, i8** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !56, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !61
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx3, align 1, !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !67
  %cmp = icmp ult i64 %10, 100, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %11, !dbg !73
  %12 = load i8, i8* %arrayidx4, align 1, !dbg !73
  %13 = load i8*, i8** %data2, align 8, !dbg !74
  %14 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !74
  store i8 %12, i8* %arrayidx5, align 1, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %15, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %16 = load i8*, i8** %data2, align 8, !dbg !83
  %arrayidx6 = getelementptr inbounds i8, i8* %16, i64 99, !dbg !83
  store i8 0, i8* %arrayidx6, align 1, !dbg !84
  %17 = load i8*, i8** %data2, align 8, !dbg !85
  call void @printLine(i8* noundef %17), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !112, metadata !DIExpression()), !dbg !113
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 50, align 16, !dbg !118
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %1 = alloca i8, i64 100, align 16, !dbg !121
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !122, metadata !DIExpression()), !dbg !124
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !125
  %3 = load i8*, i8** %2, align 8, !dbg !126
  store i8* %3, i8** %data1, align 8, !dbg !124
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  store i8* %4, i8** %data1, align 8, !dbg !128
  %5 = load i8*, i8** %data1, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  %6 = load i8*, i8** %data1, align 8, !dbg !131
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !132
  store i8* %6, i8** %7, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !134, metadata !DIExpression()), !dbg !136
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !137
  %9 = load i8*, i8** %8, align 8, !dbg !138
  store i8* %9, i8** %data2, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !144
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx3, align 1, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i64, i64* %i, align 8, !dbg !150
  %cmp = icmp ult i64 %10, 100, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %11, !dbg !156
  %12 = load i8, i8* %arrayidx4, align 1, !dbg !156
  %13 = load i8*, i8** %data2, align 8, !dbg !157
  %14 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i64 %14, !dbg !157
  store i8 %12, i8* %arrayidx5, align 1, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %15, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %16 = load i8*, i8** %data2, align 8, !dbg !165
  %arrayidx6 = getelementptr inbounds i8, i8* %16, i64 99, !dbg !165
  store i8 0, i8* %arrayidx6, align 1, !dbg !166
  %17 = load i8*, i8** %data2, align 8, !dbg !167
  call void @printLine(i8* noundef %17), !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !13)
!23 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !13)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 28, type: !3)
!26 = !DILocation(line: 28, column: 12, scope: !13)
!27 = !DILocation(line: 28, column: 36, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 29, type: !3)
!29 = !DILocation(line: 29, column: 12, scope: !13)
!30 = !DILocation(line: 29, column: 37, scope: !13)
!31 = !DILocalVariable(name: "data", scope: !32, file: !14, line: 31, type: !3)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 30, column: 5)
!33 = !DILocation(line: 31, column: 16, scope: !32)
!34 = !DILocation(line: 31, column: 24, scope: !32)
!35 = !DILocation(line: 31, column: 23, scope: !32)
!36 = !DILocation(line: 34, column: 16, scope: !32)
!37 = !DILocation(line: 34, column: 14, scope: !32)
!38 = !DILocation(line: 35, column: 9, scope: !32)
!39 = !DILocation(line: 35, column: 17, scope: !32)
!40 = !DILocation(line: 36, column: 21, scope: !32)
!41 = !DILocation(line: 36, column: 10, scope: !32)
!42 = !DILocation(line: 36, column: 19, scope: !32)
!43 = !DILocalVariable(name: "data", scope: !44, file: !14, line: 39, type: !3)
!44 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!45 = !DILocation(line: 39, column: 16, scope: !44)
!46 = !DILocation(line: 39, column: 24, scope: !44)
!47 = !DILocation(line: 39, column: 23, scope: !44)
!48 = !DILocalVariable(name: "i", scope: !49, file: !14, line: 41, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !14, line: 40, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 31, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !53, line: 94, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 41, column: 20, scope: !49)
!56 = !DILocalVariable(name: "source", scope: !49, file: !14, line: 42, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 100)
!60 = !DILocation(line: 42, column: 18, scope: !49)
!61 = !DILocation(line: 43, column: 13, scope: !49)
!62 = !DILocation(line: 44, column: 13, scope: !49)
!63 = !DILocation(line: 44, column: 27, scope: !49)
!64 = !DILocation(line: 46, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !49, file: !14, line: 46, column: 13)
!66 = !DILocation(line: 46, column: 18, scope: !65)
!67 = !DILocation(line: 46, column: 25, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !14, line: 46, column: 13)
!69 = !DILocation(line: 46, column: 27, scope: !68)
!70 = !DILocation(line: 46, column: 13, scope: !65)
!71 = !DILocation(line: 48, column: 34, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !14, line: 47, column: 13)
!73 = !DILocation(line: 48, column: 27, scope: !72)
!74 = !DILocation(line: 48, column: 17, scope: !72)
!75 = !DILocation(line: 48, column: 22, scope: !72)
!76 = !DILocation(line: 48, column: 25, scope: !72)
!77 = !DILocation(line: 49, column: 13, scope: !72)
!78 = !DILocation(line: 46, column: 35, scope: !68)
!79 = !DILocation(line: 46, column: 13, scope: !68)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 49, column: 13, scope: !65)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 50, column: 13, scope: !49)
!84 = !DILocation(line: 50, column: 25, scope: !49)
!85 = !DILocation(line: 51, column: 23, scope: !49)
!86 = !DILocation(line: 51, column: 13, scope: !49)
!87 = !DILocation(line: 54, column: 1, scope: !13)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_32_good", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!89 = !DILocation(line: 95, column: 5, scope: !88)
!90 = !DILocation(line: 96, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 107, type: !92, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!92 = !DISubroutineType(types: !93)
!93 = !{!94, !94, !21}
!94 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !14, line: 107, type: !94)
!96 = !DILocation(line: 107, column: 14, scope: !91)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !14, line: 107, type: !21)
!98 = !DILocation(line: 107, column: 27, scope: !91)
!99 = !DILocation(line: 110, column: 22, scope: !91)
!100 = !DILocation(line: 110, column: 12, scope: !91)
!101 = !DILocation(line: 110, column: 5, scope: !91)
!102 = !DILocation(line: 112, column: 5, scope: !91)
!103 = !DILocation(line: 113, column: 5, scope: !91)
!104 = !DILocation(line: 114, column: 5, scope: !91)
!105 = !DILocation(line: 117, column: 5, scope: !91)
!106 = !DILocation(line: 118, column: 5, scope: !91)
!107 = !DILocation(line: 119, column: 5, scope: !91)
!108 = !DILocation(line: 121, column: 5, scope: !91)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !15, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!110 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 63, type: !3)
!111 = !DILocation(line: 63, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataPtr1", scope: !109, file: !14, line: 64, type: !21)
!113 = !DILocation(line: 64, column: 13, scope: !109)
!114 = !DILocalVariable(name: "dataPtr2", scope: !109, file: !14, line: 65, type: !21)
!115 = !DILocation(line: 65, column: 13, scope: !109)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !14, line: 66, type: !3)
!117 = !DILocation(line: 66, column: 12, scope: !109)
!118 = !DILocation(line: 66, column: 36, scope: !109)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !14, line: 67, type: !3)
!120 = !DILocation(line: 67, column: 12, scope: !109)
!121 = !DILocation(line: 67, column: 37, scope: !109)
!122 = !DILocalVariable(name: "data", scope: !123, file: !14, line: 69, type: !3)
!123 = distinct !DILexicalBlock(scope: !109, file: !14, line: 68, column: 5)
!124 = !DILocation(line: 69, column: 16, scope: !123)
!125 = !DILocation(line: 69, column: 24, scope: !123)
!126 = !DILocation(line: 69, column: 23, scope: !123)
!127 = !DILocation(line: 71, column: 16, scope: !123)
!128 = !DILocation(line: 71, column: 14, scope: !123)
!129 = !DILocation(line: 72, column: 9, scope: !123)
!130 = !DILocation(line: 72, column: 17, scope: !123)
!131 = !DILocation(line: 73, column: 21, scope: !123)
!132 = !DILocation(line: 73, column: 10, scope: !123)
!133 = !DILocation(line: 73, column: 19, scope: !123)
!134 = !DILocalVariable(name: "data", scope: !135, file: !14, line: 76, type: !3)
!135 = distinct !DILexicalBlock(scope: !109, file: !14, line: 75, column: 5)
!136 = !DILocation(line: 76, column: 16, scope: !135)
!137 = !DILocation(line: 76, column: 24, scope: !135)
!138 = !DILocation(line: 76, column: 23, scope: !135)
!139 = !DILocalVariable(name: "i", scope: !140, file: !14, line: 78, type: !50)
!140 = distinct !DILexicalBlock(scope: !135, file: !14, line: 77, column: 9)
!141 = !DILocation(line: 78, column: 20, scope: !140)
!142 = !DILocalVariable(name: "source", scope: !140, file: !14, line: 79, type: !57)
!143 = !DILocation(line: 79, column: 18, scope: !140)
!144 = !DILocation(line: 80, column: 13, scope: !140)
!145 = !DILocation(line: 81, column: 13, scope: !140)
!146 = !DILocation(line: 81, column: 27, scope: !140)
!147 = !DILocation(line: 83, column: 20, scope: !148)
!148 = distinct !DILexicalBlock(scope: !140, file: !14, line: 83, column: 13)
!149 = !DILocation(line: 83, column: 18, scope: !148)
!150 = !DILocation(line: 83, column: 25, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !14, line: 83, column: 13)
!152 = !DILocation(line: 83, column: 27, scope: !151)
!153 = !DILocation(line: 83, column: 13, scope: !148)
!154 = !DILocation(line: 85, column: 34, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !14, line: 84, column: 13)
!156 = !DILocation(line: 85, column: 27, scope: !155)
!157 = !DILocation(line: 85, column: 17, scope: !155)
!158 = !DILocation(line: 85, column: 22, scope: !155)
!159 = !DILocation(line: 85, column: 25, scope: !155)
!160 = !DILocation(line: 86, column: 13, scope: !155)
!161 = !DILocation(line: 83, column: 35, scope: !151)
!162 = !DILocation(line: 83, column: 13, scope: !151)
!163 = distinct !{!163, !153, !164, !82}
!164 = !DILocation(line: 86, column: 13, scope: !148)
!165 = !DILocation(line: 87, column: 13, scope: !140)
!166 = !DILocation(line: 87, column: 25, scope: !140)
!167 = !DILocation(line: 88, column: 23, scope: !140)
!168 = !DILocation(line: 88, column: 13, scope: !140)
!169 = !DILocation(line: 91, column: 1, scope: !109)
