; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  %1 = load i32*, i32** %0, align 8, !dbg !43
  store i32* %1, i32** %data1, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !44
  store i32* %arraydecay, i32** %data1, align 8, !dbg !45
  %2 = load i32*, i32** %data1, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %3 = load i32*, i32** %data1, align 8, !dbg !48
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !49
  store i32* %3, i32** %4, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !51, metadata !DIExpression()), !dbg !53
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !54
  %6 = load i32*, i32** %5, align 8, !dbg !55
  store i32* %6, i32** %data2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !62
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !63, metadata !DIExpression()), !dbg !64
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !65
  %call = call i32* @wmemset(i32* noundef %arraydecay3, i32 noundef 67, i64 noundef 99), !dbg !66
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx4, align 4, !dbg !68
  store i64 0, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !72
  %cmp = icmp ult i64 %7, 100, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !78
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !78
  %10 = load i32*, i32** %data2, align 8, !dbg !79
  %11 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !79
  store i32 %9, i32* %arrayidx6, align 4, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %12, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !88
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !88
  store i32 0, i32* %arrayidx7, align 4, !dbg !89
  %14 = load i32*, i32** %data2, align 8, !dbg !90
  call void @printWLine(i32* noundef %14), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* noundef null), !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 noundef %conv), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_good(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_bad(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !116 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !119, metadata !DIExpression()), !dbg !120
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !121, metadata !DIExpression()), !dbg !122
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !127, metadata !DIExpression()), !dbg !129
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !130
  %1 = load i32*, i32** %0, align 8, !dbg !131
  store i32* %1, i32** %data1, align 8, !dbg !129
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !132
  store i32* %arraydecay, i32** %data1, align 8, !dbg !133
  %2 = load i32*, i32** %data1, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  %3 = load i32*, i32** %data1, align 8, !dbg !136
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !137
  store i32* %3, i32** %4, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !139, metadata !DIExpression()), !dbg !141
  %5 = load i32**, i32*** %dataPtr2, align 8, !dbg !142
  %6 = load i32*, i32** %5, align 8, !dbg !143
  store i32* %6, i32** %data2, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !147, metadata !DIExpression()), !dbg !148
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !149
  %call = call i32* @wmemset(i32* noundef %arraydecay3, i32 noundef 67, i64 noundef 99), !dbg !150
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx4, align 4, !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !156
  %cmp = icmp ult i64 %7, 100, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !162
  %9 = load i32, i32* %arrayidx5, align 4, !dbg !162
  %10 = load i32*, i32** %data2, align 8, !dbg !163
  %11 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx6 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !163
  store i32 %9, i32* %arrayidx6, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %12, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data2, align 8, !dbg !171
  %arrayidx7 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !171
  store i32 0, i32* %arrayidx7, align 4, !dbg !172
  %14 = load i32*, i32** %data2, align 8, !dbg !173
  call void @printWLine(i32* noundef %14), !dbg !174
  ret void, !dbg !175
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!24 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!26 = !DILocation(line: 26, column: 16, scope: !11)
!27 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !25)
!28 = !DILocation(line: 27, column: 16, scope: !11)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 28, column: 13, scope: !11)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 29, column: 13, scope: !11)
!39 = !DILocalVariable(name: "data", scope: !40, file: !12, line: 31, type: !17)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 5)
!41 = !DILocation(line: 31, column: 19, scope: !40)
!42 = !DILocation(line: 31, column: 27, scope: !40)
!43 = !DILocation(line: 31, column: 26, scope: !40)
!44 = !DILocation(line: 34, column: 16, scope: !40)
!45 = !DILocation(line: 34, column: 14, scope: !40)
!46 = !DILocation(line: 35, column: 9, scope: !40)
!47 = !DILocation(line: 35, column: 17, scope: !40)
!48 = !DILocation(line: 36, column: 21, scope: !40)
!49 = !DILocation(line: 36, column: 10, scope: !40)
!50 = !DILocation(line: 36, column: 19, scope: !40)
!51 = !DILocalVariable(name: "data", scope: !52, file: !12, line: 39, type: !17)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!53 = !DILocation(line: 39, column: 19, scope: !52)
!54 = !DILocation(line: 39, column: 27, scope: !52)
!55 = !DILocation(line: 39, column: 26, scope: !52)
!56 = !DILocalVariable(name: "i", scope: !57, file: !12, line: 41, type: !58)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 40, column: 9)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 31, baseType: !60)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !61)
!61 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 41, column: 20, scope: !57)
!63 = !DILocalVariable(name: "source", scope: !57, file: !12, line: 42, type: !35)
!64 = !DILocation(line: 42, column: 21, scope: !57)
!65 = !DILocation(line: 43, column: 21, scope: !57)
!66 = !DILocation(line: 43, column: 13, scope: !57)
!67 = !DILocation(line: 44, column: 13, scope: !57)
!68 = !DILocation(line: 44, column: 27, scope: !57)
!69 = !DILocation(line: 46, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !57, file: !12, line: 46, column: 13)
!71 = !DILocation(line: 46, column: 18, scope: !70)
!72 = !DILocation(line: 46, column: 25, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !12, line: 46, column: 13)
!74 = !DILocation(line: 46, column: 27, scope: !73)
!75 = !DILocation(line: 46, column: 13, scope: !70)
!76 = !DILocation(line: 48, column: 34, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !12, line: 47, column: 13)
!78 = !DILocation(line: 48, column: 27, scope: !77)
!79 = !DILocation(line: 48, column: 17, scope: !77)
!80 = !DILocation(line: 48, column: 22, scope: !77)
!81 = !DILocation(line: 48, column: 25, scope: !77)
!82 = !DILocation(line: 49, column: 13, scope: !77)
!83 = !DILocation(line: 46, column: 35, scope: !73)
!84 = !DILocation(line: 46, column: 13, scope: !73)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 49, column: 13, scope: !70)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 50, column: 13, scope: !57)
!89 = !DILocation(line: 50, column: 25, scope: !57)
!90 = !DILocation(line: 51, column: 24, scope: !57)
!91 = !DILocation(line: 51, column: 13, scope: !57)
!92 = !DILocation(line: 54, column: 1, scope: !11)
!93 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_32_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DILocation(line: 95, column: 5, scope: !93)
!95 = !DILocation(line: 96, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !97, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DISubroutineType(types: !98)
!98 = !{!22, !22, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !12, line: 107, type: !22)
!103 = !DILocation(line: 107, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !12, line: 107, type: !99)
!105 = !DILocation(line: 107, column: 27, scope: !96)
!106 = !DILocation(line: 110, column: 22, scope: !96)
!107 = !DILocation(line: 110, column: 12, scope: !96)
!108 = !DILocation(line: 110, column: 5, scope: !96)
!109 = !DILocation(line: 112, column: 5, scope: !96)
!110 = !DILocation(line: 113, column: 5, scope: !96)
!111 = !DILocation(line: 114, column: 5, scope: !96)
!112 = !DILocation(line: 117, column: 5, scope: !96)
!113 = !DILocation(line: 118, column: 5, scope: !96)
!114 = !DILocation(line: 119, column: 5, scope: !96)
!115 = !DILocation(line: 121, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 63, type: !17)
!118 = !DILocation(line: 63, column: 15, scope: !116)
!119 = !DILocalVariable(name: "dataPtr1", scope: !116, file: !12, line: 64, type: !25)
!120 = !DILocation(line: 64, column: 16, scope: !116)
!121 = !DILocalVariable(name: "dataPtr2", scope: !116, file: !12, line: 65, type: !25)
!122 = !DILocation(line: 65, column: 16, scope: !116)
!123 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !12, line: 66, type: !30)
!124 = !DILocation(line: 66, column: 13, scope: !116)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !12, line: 67, type: !35)
!126 = !DILocation(line: 67, column: 13, scope: !116)
!127 = !DILocalVariable(name: "data", scope: !128, file: !12, line: 69, type: !17)
!128 = distinct !DILexicalBlock(scope: !116, file: !12, line: 68, column: 5)
!129 = !DILocation(line: 69, column: 19, scope: !128)
!130 = !DILocation(line: 69, column: 27, scope: !128)
!131 = !DILocation(line: 69, column: 26, scope: !128)
!132 = !DILocation(line: 71, column: 16, scope: !128)
!133 = !DILocation(line: 71, column: 14, scope: !128)
!134 = !DILocation(line: 72, column: 9, scope: !128)
!135 = !DILocation(line: 72, column: 17, scope: !128)
!136 = !DILocation(line: 73, column: 21, scope: !128)
!137 = !DILocation(line: 73, column: 10, scope: !128)
!138 = !DILocation(line: 73, column: 19, scope: !128)
!139 = !DILocalVariable(name: "data", scope: !140, file: !12, line: 76, type: !17)
!140 = distinct !DILexicalBlock(scope: !116, file: !12, line: 75, column: 5)
!141 = !DILocation(line: 76, column: 19, scope: !140)
!142 = !DILocation(line: 76, column: 27, scope: !140)
!143 = !DILocation(line: 76, column: 26, scope: !140)
!144 = !DILocalVariable(name: "i", scope: !145, file: !12, line: 78, type: !58)
!145 = distinct !DILexicalBlock(scope: !140, file: !12, line: 77, column: 9)
!146 = !DILocation(line: 78, column: 20, scope: !145)
!147 = !DILocalVariable(name: "source", scope: !145, file: !12, line: 79, type: !35)
!148 = !DILocation(line: 79, column: 21, scope: !145)
!149 = !DILocation(line: 80, column: 21, scope: !145)
!150 = !DILocation(line: 80, column: 13, scope: !145)
!151 = !DILocation(line: 81, column: 13, scope: !145)
!152 = !DILocation(line: 81, column: 27, scope: !145)
!153 = !DILocation(line: 83, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !145, file: !12, line: 83, column: 13)
!155 = !DILocation(line: 83, column: 18, scope: !154)
!156 = !DILocation(line: 83, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !12, line: 83, column: 13)
!158 = !DILocation(line: 83, column: 27, scope: !157)
!159 = !DILocation(line: 83, column: 13, scope: !154)
!160 = !DILocation(line: 85, column: 34, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !12, line: 84, column: 13)
!162 = !DILocation(line: 85, column: 27, scope: !161)
!163 = !DILocation(line: 85, column: 17, scope: !161)
!164 = !DILocation(line: 85, column: 22, scope: !161)
!165 = !DILocation(line: 85, column: 25, scope: !161)
!166 = !DILocation(line: 86, column: 13, scope: !161)
!167 = !DILocation(line: 83, column: 35, scope: !157)
!168 = !DILocation(line: 83, column: 13, scope: !157)
!169 = distinct !{!169, !159, !170, !87}
!170 = !DILocation(line: 86, column: 13, scope: !154)
!171 = !DILocation(line: 87, column: 13, scope: !145)
!172 = !DILocation(line: 87, column: 25, scope: !145)
!173 = !DILocation(line: 88, column: 24, scope: !145)
!174 = !DILocation(line: 88, column: 13, scope: !145)
!175 = !DILocation(line: 91, column: 1, scope: !116)
