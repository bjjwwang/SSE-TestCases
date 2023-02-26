; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !24, metadata !DIExpression()), !dbg !26
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !27, metadata !DIExpression()), !dbg !28
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 200, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 400, align 16, !dbg !35
  %3 = bitcast i8* %2 to i32*, !dbg !36
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !37, metadata !DIExpression()), !dbg !39
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !40
  %5 = load i32*, i32** %4, align 8, !dbg !41
  store i32* %5, i32** %data1, align 8, !dbg !39
  %6 = load i32*, i32** %dataBadBuffer, align 8, !dbg !42
  store i32* %6, i32** %data1, align 8, !dbg !43
  %7 = load i32*, i32** %data1, align 8, !dbg !44
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !44
  store i32 0, i32* %arrayidx, align 4, !dbg !45
  %8 = load i32*, i32** %data1, align 8, !dbg !46
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !47
  store i32* %8, i32** %9, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !49, metadata !DIExpression()), !dbg !51
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !52
  %11 = load i32*, i32** %10, align 8, !dbg !53
  store i32* %11, i32** %data2, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !61, metadata !DIExpression()), !dbg !65
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !66
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !67
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx3, align 4, !dbg !69
  store i64 0, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !72

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !73
  %cmp = icmp ult i64 %12, 100, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %13, !dbg !79
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !79
  %15 = load i32*, i32** %data2, align 8, !dbg !80
  %16 = load i64, i64* %i, align 8, !dbg !81
  %arrayidx5 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !80
  store i32 %14, i32* %arrayidx5, align 4, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %17, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %18 = load i32*, i32** %data2, align 8, !dbg !89
  %arrayidx6 = getelementptr inbounds i32, i32* %18, i64 99, !dbg !89
  store i32 0, i32* %arrayidx6, align 4, !dbg !90
  %19 = load i32*, i32** %data2, align 8, !dbg !91
  call void @printWLine(i32* noundef %19), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* noundef null), !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 noundef %conv), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_good(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_bad(), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !120, metadata !DIExpression()), !dbg !121
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !122, metadata !DIExpression()), !dbg !123
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = alloca i8, i64 200, align 16, !dbg !126
  %1 = bitcast i8* %0 to i32*, !dbg !127
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %2 = alloca i8, i64 400, align 16, !dbg !130
  %3 = bitcast i8* %2 to i32*, !dbg !131
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !132, metadata !DIExpression()), !dbg !134
  %4 = load i32**, i32*** %dataPtr1, align 8, !dbg !135
  %5 = load i32*, i32** %4, align 8, !dbg !136
  store i32* %5, i32** %data1, align 8, !dbg !134
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !137
  store i32* %6, i32** %data1, align 8, !dbg !138
  %7 = load i32*, i32** %data1, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  %8 = load i32*, i32** %data1, align 8, !dbg !141
  %9 = load i32**, i32*** %dataPtr1, align 8, !dbg !142
  store i32* %8, i32** %9, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !144, metadata !DIExpression()), !dbg !146
  %10 = load i32**, i32*** %dataPtr2, align 8, !dbg !147
  %11 = load i32*, i32** %10, align 8, !dbg !148
  store i32* %11, i32** %data2, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !152, metadata !DIExpression()), !dbg !153
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !154
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !155
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !156
  store i32 0, i32* %arrayidx3, align 4, !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !160

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i64, i64* %i, align 8, !dbg !161
  %cmp = icmp ult i64 %12, 100, !dbg !163
  br i1 %cmp, label %for.body, label %for.end, !dbg !164

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %13, !dbg !167
  %14 = load i32, i32* %arrayidx4, align 4, !dbg !167
  %15 = load i32*, i32** %data2, align 8, !dbg !168
  %16 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx5 = getelementptr inbounds i32, i32* %15, i64 %16, !dbg !168
  store i32 %14, i32* %arrayidx5, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %17, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  %18 = load i32*, i32** %data2, align 8, !dbg !176
  %arrayidx6 = getelementptr inbounds i32, i32* %18, i64 99, !dbg !176
  store i32 0, i32* %arrayidx6, align 4, !dbg !177
  %19 = load i32*, i32** %data2, align 8, !dbg !178
  call void @printWLine(i32* noundef %19), !dbg !179
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataPtr1", scope: !17, file: !18, line: 26, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!26 = !DILocation(line: 26, column: 16, scope: !17)
!27 = !DILocalVariable(name: "dataPtr2", scope: !17, file: !18, line: 27, type: !25)
!28 = !DILocation(line: 27, column: 16, scope: !17)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 28, type: !3)
!30 = !DILocation(line: 28, column: 15, scope: !17)
!31 = !DILocation(line: 28, column: 42, scope: !17)
!32 = !DILocation(line: 28, column: 31, scope: !17)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 29, type: !3)
!34 = !DILocation(line: 29, column: 15, scope: !17)
!35 = !DILocation(line: 29, column: 43, scope: !17)
!36 = !DILocation(line: 29, column: 32, scope: !17)
!37 = !DILocalVariable(name: "data", scope: !38, file: !18, line: 31, type: !3)
!38 = distinct !DILexicalBlock(scope: !17, file: !18, line: 30, column: 5)
!39 = !DILocation(line: 31, column: 19, scope: !38)
!40 = !DILocation(line: 31, column: 27, scope: !38)
!41 = !DILocation(line: 31, column: 26, scope: !38)
!42 = !DILocation(line: 34, column: 16, scope: !38)
!43 = !DILocation(line: 34, column: 14, scope: !38)
!44 = !DILocation(line: 35, column: 9, scope: !38)
!45 = !DILocation(line: 35, column: 17, scope: !38)
!46 = !DILocation(line: 36, column: 21, scope: !38)
!47 = !DILocation(line: 36, column: 10, scope: !38)
!48 = !DILocation(line: 36, column: 19, scope: !38)
!49 = !DILocalVariable(name: "data", scope: !50, file: !18, line: 39, type: !3)
!50 = distinct !DILexicalBlock(scope: !17, file: !18, line: 38, column: 5)
!51 = !DILocation(line: 39, column: 19, scope: !50)
!52 = !DILocation(line: 39, column: 27, scope: !50)
!53 = !DILocation(line: 39, column: 26, scope: !50)
!54 = !DILocalVariable(name: "i", scope: !55, file: !18, line: 41, type: !56)
!55 = distinct !DILexicalBlock(scope: !50, file: !18, line: 40, column: 9)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !59)
!59 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 41, column: 20, scope: !55)
!61 = !DILocalVariable(name: "source", scope: !55, file: !18, line: 42, type: !62)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 100)
!65 = !DILocation(line: 42, column: 21, scope: !55)
!66 = !DILocation(line: 43, column: 21, scope: !55)
!67 = !DILocation(line: 43, column: 13, scope: !55)
!68 = !DILocation(line: 44, column: 13, scope: !55)
!69 = !DILocation(line: 44, column: 27, scope: !55)
!70 = !DILocation(line: 46, column: 20, scope: !71)
!71 = distinct !DILexicalBlock(scope: !55, file: !18, line: 46, column: 13)
!72 = !DILocation(line: 46, column: 18, scope: !71)
!73 = !DILocation(line: 46, column: 25, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !18, line: 46, column: 13)
!75 = !DILocation(line: 46, column: 27, scope: !74)
!76 = !DILocation(line: 46, column: 13, scope: !71)
!77 = !DILocation(line: 48, column: 34, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !18, line: 47, column: 13)
!79 = !DILocation(line: 48, column: 27, scope: !78)
!80 = !DILocation(line: 48, column: 17, scope: !78)
!81 = !DILocation(line: 48, column: 22, scope: !78)
!82 = !DILocation(line: 48, column: 25, scope: !78)
!83 = !DILocation(line: 49, column: 13, scope: !78)
!84 = !DILocation(line: 46, column: 35, scope: !74)
!85 = !DILocation(line: 46, column: 13, scope: !74)
!86 = distinct !{!86, !76, !87, !88}
!87 = !DILocation(line: 49, column: 13, scope: !71)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !DILocation(line: 50, column: 13, scope: !55)
!90 = !DILocation(line: 50, column: 25, scope: !55)
!91 = !DILocation(line: 51, column: 24, scope: !55)
!92 = !DILocation(line: 51, column: 13, scope: !55)
!93 = !DILocation(line: 54, column: 1, scope: !17)
!94 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_32_good", scope: !18, file: !18, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!95 = !DILocation(line: 95, column: 5, scope: !94)
!96 = !DILocation(line: 96, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 107, type: !98, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!98 = !DISubroutineType(types: !99)
!99 = !{!8, !8, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !18, line: 107, type: !8)
!104 = !DILocation(line: 107, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !18, line: 107, type: !100)
!106 = !DILocation(line: 107, column: 27, scope: !97)
!107 = !DILocation(line: 110, column: 22, scope: !97)
!108 = !DILocation(line: 110, column: 12, scope: !97)
!109 = !DILocation(line: 110, column: 5, scope: !97)
!110 = !DILocation(line: 112, column: 5, scope: !97)
!111 = !DILocation(line: 113, column: 5, scope: !97)
!112 = !DILocation(line: 114, column: 5, scope: !97)
!113 = !DILocation(line: 117, column: 5, scope: !97)
!114 = !DILocation(line: 118, column: 5, scope: !97)
!115 = !DILocation(line: 119, column: 5, scope: !97)
!116 = !DILocation(line: 121, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!118 = !DILocalVariable(name: "data", scope: !117, file: !18, line: 63, type: !3)
!119 = !DILocation(line: 63, column: 15, scope: !117)
!120 = !DILocalVariable(name: "dataPtr1", scope: !117, file: !18, line: 64, type: !25)
!121 = !DILocation(line: 64, column: 16, scope: !117)
!122 = !DILocalVariable(name: "dataPtr2", scope: !117, file: !18, line: 65, type: !25)
!123 = !DILocation(line: 65, column: 16, scope: !117)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !18, line: 66, type: !3)
!125 = !DILocation(line: 66, column: 15, scope: !117)
!126 = !DILocation(line: 66, column: 42, scope: !117)
!127 = !DILocation(line: 66, column: 31, scope: !117)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !18, line: 67, type: !3)
!129 = !DILocation(line: 67, column: 15, scope: !117)
!130 = !DILocation(line: 67, column: 43, scope: !117)
!131 = !DILocation(line: 67, column: 32, scope: !117)
!132 = !DILocalVariable(name: "data", scope: !133, file: !18, line: 69, type: !3)
!133 = distinct !DILexicalBlock(scope: !117, file: !18, line: 68, column: 5)
!134 = !DILocation(line: 69, column: 19, scope: !133)
!135 = !DILocation(line: 69, column: 27, scope: !133)
!136 = !DILocation(line: 69, column: 26, scope: !133)
!137 = !DILocation(line: 71, column: 16, scope: !133)
!138 = !DILocation(line: 71, column: 14, scope: !133)
!139 = !DILocation(line: 72, column: 9, scope: !133)
!140 = !DILocation(line: 72, column: 17, scope: !133)
!141 = !DILocation(line: 73, column: 21, scope: !133)
!142 = !DILocation(line: 73, column: 10, scope: !133)
!143 = !DILocation(line: 73, column: 19, scope: !133)
!144 = !DILocalVariable(name: "data", scope: !145, file: !18, line: 76, type: !3)
!145 = distinct !DILexicalBlock(scope: !117, file: !18, line: 75, column: 5)
!146 = !DILocation(line: 76, column: 19, scope: !145)
!147 = !DILocation(line: 76, column: 27, scope: !145)
!148 = !DILocation(line: 76, column: 26, scope: !145)
!149 = !DILocalVariable(name: "i", scope: !150, file: !18, line: 78, type: !56)
!150 = distinct !DILexicalBlock(scope: !145, file: !18, line: 77, column: 9)
!151 = !DILocation(line: 78, column: 20, scope: !150)
!152 = !DILocalVariable(name: "source", scope: !150, file: !18, line: 79, type: !62)
!153 = !DILocation(line: 79, column: 21, scope: !150)
!154 = !DILocation(line: 80, column: 21, scope: !150)
!155 = !DILocation(line: 80, column: 13, scope: !150)
!156 = !DILocation(line: 81, column: 13, scope: !150)
!157 = !DILocation(line: 81, column: 27, scope: !150)
!158 = !DILocation(line: 83, column: 20, scope: !159)
!159 = distinct !DILexicalBlock(scope: !150, file: !18, line: 83, column: 13)
!160 = !DILocation(line: 83, column: 18, scope: !159)
!161 = !DILocation(line: 83, column: 25, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !18, line: 83, column: 13)
!163 = !DILocation(line: 83, column: 27, scope: !162)
!164 = !DILocation(line: 83, column: 13, scope: !159)
!165 = !DILocation(line: 85, column: 34, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !18, line: 84, column: 13)
!167 = !DILocation(line: 85, column: 27, scope: !166)
!168 = !DILocation(line: 85, column: 17, scope: !166)
!169 = !DILocation(line: 85, column: 22, scope: !166)
!170 = !DILocation(line: 85, column: 25, scope: !166)
!171 = !DILocation(line: 86, column: 13, scope: !166)
!172 = !DILocation(line: 83, column: 35, scope: !162)
!173 = !DILocation(line: 83, column: 13, scope: !162)
!174 = distinct !{!174, !164, !175, !88}
!175 = !DILocation(line: 86, column: 13, scope: !159)
!176 = !DILocation(line: 87, column: 13, scope: !150)
!177 = !DILocation(line: 87, column: 25, scope: !150)
!178 = !DILocation(line: 88, column: 24, scope: !150)
!179 = !DILocation(line: 88, column: 13, scope: !150)
!180 = !DILocation(line: 91, column: 1, scope: !117)
