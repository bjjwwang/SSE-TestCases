; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 50, align 16, !dbg !29
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %1 = alloca i8, i64 100, align 16, !dbg !32
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !31
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %2, i8** %data, align 8, !dbg !34
  %3 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !38
  store i8* %4, i8** %unionFirst, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !40, metadata !DIExpression()), !dbg !42
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !43
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !43
  store i8* %5, i8** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !52, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx2, align 1, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !63
  %cmp = icmp ult i64 %6, 100, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !69
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !69
  %9 = load i8*, i8** %data1, align 8, !dbg !70
  %10 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !70
  store i8 %8, i8* %arrayidx4, align 1, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %11, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !79
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !79
  store i8 0, i8* %arrayidx5, align 1, !dbg !80
  %13 = load i8*, i8** %data1, align 8, !dbg !81
  call void @printLine(i8* noundef %13), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_good() #0 !dbg !84 {
entry:
  call void @goodG2B(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = alloca i8, i64 50, align 16, !dbg !113
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %1 = alloca i8, i64 100, align 16, !dbg !116
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !115
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !117
  store i8* %2, i8** %data, align 8, !dbg !118
  %3 = load i8*, i8** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !122
  store i8* %4, i8** %unionFirst, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType* %myUnion to i8**, !dbg !127
  %5 = load i8*, i8** %unionSecond, align 8, !dbg !127
  store i8* %5, i8** %data1, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !133
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !133
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !134
  store i8 0, i8* %arrayidx2, align 1, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !139
  %cmp = icmp ult i64 %6, 100, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %7, !dbg !145
  %8 = load i8, i8* %arrayidx3, align 1, !dbg !145
  %9 = load i8*, i8** %data1, align 8, !dbg !146
  %10 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx4 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !146
  store i8 %8, i8* %arrayidx4, align 1, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %11, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data1, align 8, !dbg !154
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 99, !dbg !154
  store i8 0, i8* %arrayidx5, align 1, !dbg !155
  %13 = load i8*, i8** %data1, align 8, !dbg !156
  call void @printLine(i8* noundef %13), !dbg !157
  ret void, !dbg !158
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_bad", scope: !14, file: !14, line: 29, type: !15, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !3)
!19 = !DILocation(line: 31, column: 12, scope: !13)
!20 = !DILocalVariable(name: "myUnion", scope: !13, file: !14, line: 32, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_unionType", file: !14, line: 25, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !14, line: 21, size: 64, elements: !23)
!23 = !{!24, !25}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !22, file: !14, line: 23, baseType: !3, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !22, file: !14, line: 24, baseType: !3, size: 64)
!26 = !DILocation(line: 32, column: 78, scope: !13)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !3)
!28 = !DILocation(line: 33, column: 12, scope: !13)
!29 = !DILocation(line: 33, column: 36, scope: !13)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !3)
!31 = !DILocation(line: 34, column: 12, scope: !13)
!32 = !DILocation(line: 34, column: 37, scope: !13)
!33 = !DILocation(line: 37, column: 12, scope: !13)
!34 = !DILocation(line: 37, column: 10, scope: !13)
!35 = !DILocation(line: 38, column: 5, scope: !13)
!36 = !DILocation(line: 38, column: 13, scope: !13)
!37 = !DILocation(line: 39, column: 26, scope: !13)
!38 = !DILocation(line: 39, column: 13, scope: !13)
!39 = !DILocation(line: 39, column: 24, scope: !13)
!40 = !DILocalVariable(name: "data", scope: !41, file: !14, line: 41, type: !3)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!42 = !DILocation(line: 41, column: 16, scope: !41)
!43 = !DILocation(line: 41, column: 31, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !14, line: 43, type: !46)
!45 = distinct !DILexicalBlock(scope: !41, file: !14, line: 42, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !49, line: 94, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 43, column: 20, scope: !45)
!52 = !DILocalVariable(name: "source", scope: !45, file: !14, line: 44, type: !53)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 44, column: 18, scope: !45)
!57 = !DILocation(line: 45, column: 13, scope: !45)
!58 = !DILocation(line: 46, column: 13, scope: !45)
!59 = !DILocation(line: 46, column: 27, scope: !45)
!60 = !DILocation(line: 48, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !45, file: !14, line: 48, column: 13)
!62 = !DILocation(line: 48, column: 18, scope: !61)
!63 = !DILocation(line: 48, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !14, line: 48, column: 13)
!65 = !DILocation(line: 48, column: 27, scope: !64)
!66 = !DILocation(line: 48, column: 13, scope: !61)
!67 = !DILocation(line: 50, column: 34, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !14, line: 49, column: 13)
!69 = !DILocation(line: 50, column: 27, scope: !68)
!70 = !DILocation(line: 50, column: 17, scope: !68)
!71 = !DILocation(line: 50, column: 22, scope: !68)
!72 = !DILocation(line: 50, column: 25, scope: !68)
!73 = !DILocation(line: 51, column: 13, scope: !68)
!74 = !DILocation(line: 48, column: 35, scope: !64)
!75 = !DILocation(line: 48, column: 13, scope: !64)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 51, column: 13, scope: !61)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 52, column: 13, scope: !45)
!80 = !DILocation(line: 52, column: 25, scope: !45)
!81 = !DILocation(line: 53, column: 23, scope: !45)
!82 = !DILocation(line: 53, column: 13, scope: !45)
!83 = !DILocation(line: 56, column: 1, scope: !13)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_34_good", scope: !14, file: !14, line: 91, type: !15, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!85 = !DILocation(line: 93, column: 5, scope: !84)
!86 = !DILocation(line: 94, column: 1, scope: !84)
!87 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 105, type: !88, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90, !91}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !14, line: 105, type: !90)
!93 = !DILocation(line: 105, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !14, line: 105, type: !91)
!95 = !DILocation(line: 105, column: 27, scope: !87)
!96 = !DILocation(line: 108, column: 22, scope: !87)
!97 = !DILocation(line: 108, column: 12, scope: !87)
!98 = !DILocation(line: 108, column: 5, scope: !87)
!99 = !DILocation(line: 110, column: 5, scope: !87)
!100 = !DILocation(line: 111, column: 5, scope: !87)
!101 = !DILocation(line: 112, column: 5, scope: !87)
!102 = !DILocation(line: 115, column: 5, scope: !87)
!103 = !DILocation(line: 116, column: 5, scope: !87)
!104 = !DILocation(line: 117, column: 5, scope: !87)
!105 = !DILocation(line: 119, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 63, type: !15, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!107 = !DILocalVariable(name: "data", scope: !106, file: !14, line: 65, type: !3)
!108 = !DILocation(line: 65, column: 12, scope: !106)
!109 = !DILocalVariable(name: "myUnion", scope: !106, file: !14, line: 66, type: !21)
!110 = !DILocation(line: 66, column: 78, scope: !106)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !14, line: 67, type: !3)
!112 = !DILocation(line: 67, column: 12, scope: !106)
!113 = !DILocation(line: 67, column: 36, scope: !106)
!114 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !14, line: 68, type: !3)
!115 = !DILocation(line: 68, column: 12, scope: !106)
!116 = !DILocation(line: 68, column: 37, scope: !106)
!117 = !DILocation(line: 70, column: 12, scope: !106)
!118 = !DILocation(line: 70, column: 10, scope: !106)
!119 = !DILocation(line: 71, column: 5, scope: !106)
!120 = !DILocation(line: 71, column: 13, scope: !106)
!121 = !DILocation(line: 72, column: 26, scope: !106)
!122 = !DILocation(line: 72, column: 13, scope: !106)
!123 = !DILocation(line: 72, column: 24, scope: !106)
!124 = !DILocalVariable(name: "data", scope: !125, file: !14, line: 74, type: !3)
!125 = distinct !DILexicalBlock(scope: !106, file: !14, line: 73, column: 5)
!126 = !DILocation(line: 74, column: 16, scope: !125)
!127 = !DILocation(line: 74, column: 31, scope: !125)
!128 = !DILocalVariable(name: "i", scope: !129, file: !14, line: 76, type: !46)
!129 = distinct !DILexicalBlock(scope: !125, file: !14, line: 75, column: 9)
!130 = !DILocation(line: 76, column: 20, scope: !129)
!131 = !DILocalVariable(name: "source", scope: !129, file: !14, line: 77, type: !53)
!132 = !DILocation(line: 77, column: 18, scope: !129)
!133 = !DILocation(line: 78, column: 13, scope: !129)
!134 = !DILocation(line: 79, column: 13, scope: !129)
!135 = !DILocation(line: 79, column: 27, scope: !129)
!136 = !DILocation(line: 81, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !129, file: !14, line: 81, column: 13)
!138 = !DILocation(line: 81, column: 18, scope: !137)
!139 = !DILocation(line: 81, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !14, line: 81, column: 13)
!141 = !DILocation(line: 81, column: 27, scope: !140)
!142 = !DILocation(line: 81, column: 13, scope: !137)
!143 = !DILocation(line: 83, column: 34, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !14, line: 82, column: 13)
!145 = !DILocation(line: 83, column: 27, scope: !144)
!146 = !DILocation(line: 83, column: 17, scope: !144)
!147 = !DILocation(line: 83, column: 22, scope: !144)
!148 = !DILocation(line: 83, column: 25, scope: !144)
!149 = !DILocation(line: 84, column: 13, scope: !144)
!150 = !DILocation(line: 81, column: 35, scope: !140)
!151 = !DILocation(line: 81, column: 13, scope: !140)
!152 = distinct !{!152, !142, !153, !78}
!153 = !DILocation(line: 84, column: 13, scope: !137)
!154 = !DILocation(line: 85, column: 13, scope: !129)
!155 = !DILocation(line: 85, column: 25, scope: !129)
!156 = !DILocation(line: 86, column: 23, scope: !129)
!157 = !DILocation(line: 86, column: 13, scope: !129)
!158 = !DILocation(line: 89, column: 1, scope: !106)
