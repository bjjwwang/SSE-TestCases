; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !33
  %5 = load i32*, i32** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !36, metadata !DIExpression()), !dbg !38
  %6 = load i32*, i32** %data, align 8, !dbg !39
  store i32* %6, i32** %dataCopy, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !40, metadata !DIExpression()), !dbg !41
  %7 = load i32*, i32** %dataCopy, align 8, !dbg !42
  store i32* %7, i32** %data1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !50, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !56
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx2, align 4, !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !62
  %cmp = icmp ult i64 %8, 100, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !68
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !68
  %11 = load i32*, i32** %data1, align 8, !dbg !69
  %12 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !69
  store i32 %10, i32* %arrayidx4, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %13, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data1, align 8, !dbg !78
  %arrayidx5 = getelementptr inbounds i32, i32* %14, i64 99, !dbg !78
  store i32 0, i32* %arrayidx5, align 4, !dbg !79
  %15 = load i32*, i32** %data1, align 8, !dbg !80
  call void @printWLine(i32* noundef %15), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !86 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 200, align 16, !dbg !111
  %1 = bitcast i8* %0 to i32*, !dbg !112
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %2 = alloca i8, i64 400, align 16, !dbg !115
  %3 = bitcast i8* %2 to i32*, !dbg !116
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !114
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !117
  store i32* %4, i32** %data, align 8, !dbg !118
  %5 = load i32*, i32** %data, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !121, metadata !DIExpression()), !dbg !123
  %6 = load i32*, i32** %data, align 8, !dbg !124
  store i32* %6, i32** %dataCopy, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !125, metadata !DIExpression()), !dbg !126
  %7 = load i32*, i32** %dataCopy, align 8, !dbg !127
  store i32* %7, i32** %data1, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !134
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx2, align 4, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !140
  %cmp = icmp ult i64 %8, 100, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %9 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %9, !dbg !146
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !146
  %11 = load i32*, i32** %data1, align 8, !dbg !147
  %12 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !147
  store i32 %10, i32* %arrayidx4, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %13, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %14 = load i32*, i32** %data1, align 8, !dbg !155
  %arrayidx5 = getelementptr inbounds i32, i32* %14, i64 99, !dbg !155
  store i32 0, i32* %arrayidx5, align 4, !dbg !156
  %15 = load i32*, i32** %data1, align 8, !dbg !157
  call void @printWLine(i32* noundef %15), !dbg !158
  ret void, !dbg !159
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 42, scope: !17)
!27 = !DILocation(line: 26, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !3)
!29 = !DILocation(line: 27, column: 15, scope: !17)
!30 = !DILocation(line: 27, column: 43, scope: !17)
!31 = !DILocation(line: 27, column: 32, scope: !17)
!32 = !DILocation(line: 30, column: 12, scope: !17)
!33 = !DILocation(line: 30, column: 10, scope: !17)
!34 = !DILocation(line: 31, column: 5, scope: !17)
!35 = !DILocation(line: 31, column: 13, scope: !17)
!36 = !DILocalVariable(name: "dataCopy", scope: !37, file: !18, line: 33, type: !3)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 32, column: 5)
!38 = !DILocation(line: 33, column: 19, scope: !37)
!39 = !DILocation(line: 33, column: 30, scope: !37)
!40 = !DILocalVariable(name: "data", scope: !37, file: !18, line: 34, type: !3)
!41 = !DILocation(line: 34, column: 19, scope: !37)
!42 = !DILocation(line: 34, column: 26, scope: !37)
!43 = !DILocalVariable(name: "i", scope: !44, file: !18, line: 36, type: !45)
!44 = distinct !DILexicalBlock(scope: !37, file: !18, line: 35, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !48)
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 36, column: 20, scope: !44)
!50 = !DILocalVariable(name: "source", scope: !44, file: !18, line: 37, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 37, column: 21, scope: !44)
!55 = !DILocation(line: 38, column: 21, scope: !44)
!56 = !DILocation(line: 38, column: 13, scope: !44)
!57 = !DILocation(line: 39, column: 13, scope: !44)
!58 = !DILocation(line: 39, column: 27, scope: !44)
!59 = !DILocation(line: 41, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !44, file: !18, line: 41, column: 13)
!61 = !DILocation(line: 41, column: 18, scope: !60)
!62 = !DILocation(line: 41, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !18, line: 41, column: 13)
!64 = !DILocation(line: 41, column: 27, scope: !63)
!65 = !DILocation(line: 41, column: 13, scope: !60)
!66 = !DILocation(line: 43, column: 34, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !18, line: 42, column: 13)
!68 = !DILocation(line: 43, column: 27, scope: !67)
!69 = !DILocation(line: 43, column: 17, scope: !67)
!70 = !DILocation(line: 43, column: 22, scope: !67)
!71 = !DILocation(line: 43, column: 25, scope: !67)
!72 = !DILocation(line: 44, column: 13, scope: !67)
!73 = !DILocation(line: 41, column: 35, scope: !63)
!74 = !DILocation(line: 41, column: 13, scope: !63)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 44, column: 13, scope: !60)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 45, column: 13, scope: !44)
!79 = !DILocation(line: 45, column: 25, scope: !44)
!80 = !DILocation(line: 46, column: 24, scope: !44)
!81 = !DILocation(line: 46, column: 13, scope: !44)
!82 = !DILocation(line: 49, column: 1, scope: !17)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_31_good", scope: !18, file: !18, line: 83, type: !19, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!84 = !DILocation(line: 85, column: 5, scope: !83)
!85 = !DILocation(line: 86, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 97, type: !87, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!87 = !DISubroutineType(types: !88)
!88 = !{!8, !8, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !18, line: 97, type: !8)
!93 = !DILocation(line: 97, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !18, line: 97, type: !89)
!95 = !DILocation(line: 97, column: 27, scope: !86)
!96 = !DILocation(line: 100, column: 22, scope: !86)
!97 = !DILocation(line: 100, column: 12, scope: !86)
!98 = !DILocation(line: 100, column: 5, scope: !86)
!99 = !DILocation(line: 102, column: 5, scope: !86)
!100 = !DILocation(line: 103, column: 5, scope: !86)
!101 = !DILocation(line: 104, column: 5, scope: !86)
!102 = !DILocation(line: 107, column: 5, scope: !86)
!103 = !DILocation(line: 108, column: 5, scope: !86)
!104 = !DILocation(line: 109, column: 5, scope: !86)
!105 = !DILocation(line: 111, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!107 = !DILocalVariable(name: "data", scope: !106, file: !18, line: 58, type: !3)
!108 = !DILocation(line: 58, column: 15, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !18, line: 59, type: !3)
!110 = !DILocation(line: 59, column: 15, scope: !106)
!111 = !DILocation(line: 59, column: 42, scope: !106)
!112 = !DILocation(line: 59, column: 31, scope: !106)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !18, line: 60, type: !3)
!114 = !DILocation(line: 60, column: 15, scope: !106)
!115 = !DILocation(line: 60, column: 43, scope: !106)
!116 = !DILocation(line: 60, column: 32, scope: !106)
!117 = !DILocation(line: 62, column: 12, scope: !106)
!118 = !DILocation(line: 62, column: 10, scope: !106)
!119 = !DILocation(line: 63, column: 5, scope: !106)
!120 = !DILocation(line: 63, column: 13, scope: !106)
!121 = !DILocalVariable(name: "dataCopy", scope: !122, file: !18, line: 65, type: !3)
!122 = distinct !DILexicalBlock(scope: !106, file: !18, line: 64, column: 5)
!123 = !DILocation(line: 65, column: 19, scope: !122)
!124 = !DILocation(line: 65, column: 30, scope: !122)
!125 = !DILocalVariable(name: "data", scope: !122, file: !18, line: 66, type: !3)
!126 = !DILocation(line: 66, column: 19, scope: !122)
!127 = !DILocation(line: 66, column: 26, scope: !122)
!128 = !DILocalVariable(name: "i", scope: !129, file: !18, line: 68, type: !45)
!129 = distinct !DILexicalBlock(scope: !122, file: !18, line: 67, column: 9)
!130 = !DILocation(line: 68, column: 20, scope: !129)
!131 = !DILocalVariable(name: "source", scope: !129, file: !18, line: 69, type: !51)
!132 = !DILocation(line: 69, column: 21, scope: !129)
!133 = !DILocation(line: 70, column: 21, scope: !129)
!134 = !DILocation(line: 70, column: 13, scope: !129)
!135 = !DILocation(line: 71, column: 13, scope: !129)
!136 = !DILocation(line: 71, column: 27, scope: !129)
!137 = !DILocation(line: 73, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !129, file: !18, line: 73, column: 13)
!139 = !DILocation(line: 73, column: 18, scope: !138)
!140 = !DILocation(line: 73, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !18, line: 73, column: 13)
!142 = !DILocation(line: 73, column: 27, scope: !141)
!143 = !DILocation(line: 73, column: 13, scope: !138)
!144 = !DILocation(line: 75, column: 34, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !18, line: 74, column: 13)
!146 = !DILocation(line: 75, column: 27, scope: !145)
!147 = !DILocation(line: 75, column: 17, scope: !145)
!148 = !DILocation(line: 75, column: 22, scope: !145)
!149 = !DILocation(line: 75, column: 25, scope: !145)
!150 = !DILocation(line: 76, column: 13, scope: !145)
!151 = !DILocation(line: 73, column: 35, scope: !141)
!152 = !DILocation(line: 73, column: 13, scope: !141)
!153 = distinct !{!153, !143, !154, !77}
!154 = !DILocation(line: 76, column: 13, scope: !138)
!155 = !DILocation(line: 77, column: 13, scope: !129)
!156 = !DILocation(line: 77, column: 25, scope: !129)
!157 = !DILocation(line: 78, column: 24, scope: !129)
!158 = !DILocation(line: 78, column: 13, scope: !129)
!159 = !DILocation(line: 81, column: 1, scope: !106)
