; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 40, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 44, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  br label %while.body, !dbg !32

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !33
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %while.end, !dbg !38

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !44
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad.source to i8*), i64 44, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !51, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !53
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !54
  store i64 %call, i64* %sourceLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %while.end
  %7 = load i64, i64* %i, align 8, !dbg !59
  %8 = load i64, i64* %sourceLen, align 8, !dbg !61
  %add = add i64 %8, 1, !dbg !62
  %cmp = icmp ult i64 %7, %add, !dbg !63
  br i1 %cmp, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !67
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !67
  %11 = load i32*, i32** %data, align 8, !dbg !68
  %12 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !68
  store i32 %10, i32* %arrayidx2, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %13, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !77
  call void @printWLine(i32* noundef %14), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_good() #0 !dbg !80 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 40, align 16, !dbg !108
  %1 = bitcast i8* %0 to i32*, !dbg !109
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %2 = alloca i8, i64 44, align 16, !dbg !112
  %3 = bitcast i8* %2 to i32*, !dbg !113
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !111
  br label %while.body, !dbg !114

while.body:                                       ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !115
  store i32* %4, i32** %data, align 8, !dbg !117
  %5 = load i32*, i32** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !118
  store i32 0, i32* %arrayidx, align 4, !dbg !119
  br label %while.end, !dbg !120

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !128
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !129
  store i64 %call, i64* %sourceLen, align 8, !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %while.end
  %7 = load i64, i64* %i, align 8, !dbg !134
  %8 = load i64, i64* %sourceLen, align 8, !dbg !136
  %add = add i64 %8, 1, !dbg !137
  %cmp = icmp ult i64 %7, %add, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %9, !dbg !142
  %10 = load i32, i32* %arrayidx1, align 4, !dbg !142
  %11 = load i32*, i32** %data, align 8, !dbg !143
  %12 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx2 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !143
  store i32 %10, i32* %arrayidx2, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %13, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* noundef %14), !dbg !152
  ret void, !dbg !153
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 30, type: !3)
!23 = !DILocation(line: 30, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 31, type: !3)
!25 = !DILocation(line: 31, column: 15, scope: !17)
!26 = !DILocation(line: 31, column: 42, scope: !17)
!27 = !DILocation(line: 31, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 32, type: !3)
!29 = !DILocation(line: 32, column: 15, scope: !17)
!30 = !DILocation(line: 32, column: 43, scope: !17)
!31 = !DILocation(line: 32, column: 32, scope: !17)
!32 = !DILocation(line: 33, column: 5, scope: !17)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 34, column: 5)
!35 = !DILocation(line: 37, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 17, scope: !34)
!38 = !DILocation(line: 39, column: 9, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !18, line: 42, type: !41)
!40 = distinct !DILexicalBlock(scope: !17, file: !18, line: 41, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DILocation(line: 42, column: 17, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !18, line: 43, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !49)
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 43, column: 16, scope: !40)
!51 = !DILocalVariable(name: "sourceLen", scope: !40, file: !18, line: 43, type: !46)
!52 = !DILocation(line: 43, column: 19, scope: !40)
!53 = !DILocation(line: 44, column: 28, scope: !40)
!54 = !DILocation(line: 44, column: 21, scope: !40)
!55 = !DILocation(line: 44, column: 19, scope: !40)
!56 = !DILocation(line: 47, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !40, file: !18, line: 47, column: 9)
!58 = !DILocation(line: 47, column: 14, scope: !57)
!59 = !DILocation(line: 47, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !18, line: 47, column: 9)
!61 = !DILocation(line: 47, column: 25, scope: !60)
!62 = !DILocation(line: 47, column: 35, scope: !60)
!63 = !DILocation(line: 47, column: 23, scope: !60)
!64 = !DILocation(line: 47, column: 9, scope: !57)
!65 = !DILocation(line: 49, column: 30, scope: !66)
!66 = distinct !DILexicalBlock(scope: !60, file: !18, line: 48, column: 9)
!67 = !DILocation(line: 49, column: 23, scope: !66)
!68 = !DILocation(line: 49, column: 13, scope: !66)
!69 = !DILocation(line: 49, column: 18, scope: !66)
!70 = !DILocation(line: 49, column: 21, scope: !66)
!71 = !DILocation(line: 50, column: 9, scope: !66)
!72 = !DILocation(line: 47, column: 41, scope: !60)
!73 = !DILocation(line: 47, column: 9, scope: !60)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 50, column: 9, scope: !57)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 51, column: 20, scope: !40)
!78 = !DILocation(line: 51, column: 9, scope: !40)
!79 = !DILocation(line: 53, column: 1, scope: !17)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_loop_16_good", scope: !18, file: !18, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!81 = !DILocation(line: 89, column: 5, scope: !80)
!82 = !DILocation(line: 90, column: 1, scope: !80)
!83 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 102, type: !84, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!84 = !DISubroutineType(types: !85)
!85 = !{!8, !8, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !18, line: 102, type: !8)
!90 = !DILocation(line: 102, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !18, line: 102, type: !86)
!92 = !DILocation(line: 102, column: 27, scope: !83)
!93 = !DILocation(line: 105, column: 22, scope: !83)
!94 = !DILocation(line: 105, column: 12, scope: !83)
!95 = !DILocation(line: 105, column: 5, scope: !83)
!96 = !DILocation(line: 107, column: 5, scope: !83)
!97 = !DILocation(line: 108, column: 5, scope: !83)
!98 = !DILocation(line: 109, column: 5, scope: !83)
!99 = !DILocation(line: 112, column: 5, scope: !83)
!100 = !DILocation(line: 113, column: 5, scope: !83)
!101 = !DILocation(line: 114, column: 5, scope: !83)
!102 = !DILocation(line: 116, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!104 = !DILocalVariable(name: "data", scope: !103, file: !18, line: 62, type: !3)
!105 = !DILocation(line: 62, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !18, line: 63, type: !3)
!107 = !DILocation(line: 63, column: 15, scope: !103)
!108 = !DILocation(line: 63, column: 42, scope: !103)
!109 = !DILocation(line: 63, column: 31, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !18, line: 64, type: !3)
!111 = !DILocation(line: 64, column: 15, scope: !103)
!112 = !DILocation(line: 64, column: 43, scope: !103)
!113 = !DILocation(line: 64, column: 32, scope: !103)
!114 = !DILocation(line: 65, column: 5, scope: !103)
!115 = !DILocation(line: 69, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !103, file: !18, line: 66, column: 5)
!117 = !DILocation(line: 69, column: 14, scope: !116)
!118 = !DILocation(line: 70, column: 9, scope: !116)
!119 = !DILocation(line: 70, column: 17, scope: !116)
!120 = !DILocation(line: 71, column: 9, scope: !116)
!121 = !DILocalVariable(name: "source", scope: !122, file: !18, line: 74, type: !41)
!122 = distinct !DILexicalBlock(scope: !103, file: !18, line: 73, column: 5)
!123 = !DILocation(line: 74, column: 17, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !122, file: !18, line: 75, type: !46)
!125 = !DILocation(line: 75, column: 16, scope: !122)
!126 = !DILocalVariable(name: "sourceLen", scope: !122, file: !18, line: 75, type: !46)
!127 = !DILocation(line: 75, column: 19, scope: !122)
!128 = !DILocation(line: 76, column: 28, scope: !122)
!129 = !DILocation(line: 76, column: 21, scope: !122)
!130 = !DILocation(line: 76, column: 19, scope: !122)
!131 = !DILocation(line: 79, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !122, file: !18, line: 79, column: 9)
!133 = !DILocation(line: 79, column: 14, scope: !132)
!134 = !DILocation(line: 79, column: 21, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !18, line: 79, column: 9)
!136 = !DILocation(line: 79, column: 25, scope: !135)
!137 = !DILocation(line: 79, column: 35, scope: !135)
!138 = !DILocation(line: 79, column: 23, scope: !135)
!139 = !DILocation(line: 79, column: 9, scope: !132)
!140 = !DILocation(line: 81, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !18, line: 80, column: 9)
!142 = !DILocation(line: 81, column: 23, scope: !141)
!143 = !DILocation(line: 81, column: 13, scope: !141)
!144 = !DILocation(line: 81, column: 18, scope: !141)
!145 = !DILocation(line: 81, column: 21, scope: !141)
!146 = !DILocation(line: 82, column: 9, scope: !141)
!147 = !DILocation(line: 79, column: 41, scope: !135)
!148 = !DILocation(line: 79, column: 9, scope: !135)
!149 = distinct !{!149, !139, !150, !76}
!150 = !DILocation(line: 82, column: 9, scope: !132)
!151 = !DILocation(line: 83, column: 20, scope: !122)
!152 = !DILocation(line: 83, column: 9, scope: !122)
!153 = !DILocation(line: 85, column: 1, scope: !103)
