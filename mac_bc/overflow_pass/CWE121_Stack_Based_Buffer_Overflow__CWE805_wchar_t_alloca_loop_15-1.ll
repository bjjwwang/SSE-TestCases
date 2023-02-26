; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
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
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !49
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !50
  store i32 0, i32* %arrayidx1, align 4, !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %6, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !61
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !61
  %9 = load i32*, i32** %data, align 8, !dbg !62
  %10 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !62
  store i32 %8, i32* %arrayidx3, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %11, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !71
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !71
  store i32 0, i32* %arrayidx4, align 4, !dbg !72
  %13 = load i32*, i32** %data, align 8, !dbg !73
  call void @printWLine(i32* noundef %13), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* noundef null), !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 noundef %conv), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_good(), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_bad(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 200, align 16, !dbg !105
  %1 = bitcast i8* %0 to i32*, !dbg !106
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = alloca i8, i64 400, align 16, !dbg !109
  %3 = bitcast i8* %2 to i32*, !dbg !110
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !108
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !111
  store i32* %4, i32** %data, align 8, !dbg !112
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !113
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !120
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !121
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx1, align 4, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %6, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !133
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !133
  %9 = load i32*, i32** %data, align 8, !dbg !134
  %10 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !134
  store i32 %8, i32* %arrayidx3, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %11, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !142
  store i32 0, i32* %arrayidx4, align 4, !dbg !143
  %13 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* noundef %13), !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = alloca i8, i64 200, align 16, !dbg !152
  %1 = bitcast i8* %0 to i32*, !dbg !153
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %2 = alloca i8, i64 400, align 16, !dbg !156
  %3 = bitcast i8* %2 to i32*, !dbg !157
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !155
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !158
  store i32* %4, i32** %data, align 8, !dbg !159
  %5 = load i32*, i32** %data, align 8, !dbg !160
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !161
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !165, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !167
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !168
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx1, align 4, !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !174
  %cmp = icmp ult i64 %6, 100, !dbg !176
  br i1 %cmp, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !180
  %8 = load i32, i32* %arrayidx2, align 4, !dbg !180
  %9 = load i32*, i32** %data, align 8, !dbg !181
  %10 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !181
  store i32 %8, i32* %arrayidx3, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %11, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !189
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !189
  store i32 0, i32* %arrayidx4, align 4, !dbg !190
  %13 = load i32*, i32** %data, align 8, !dbg !191
  call void @printWLine(i32* noundef %13), !dbg !192
  ret void, !dbg !193
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 33, column: 16, scope: !17)
!33 = !DILocation(line: 33, column: 14, scope: !17)
!34 = !DILocation(line: 34, column: 9, scope: !17)
!35 = !DILocation(line: 34, column: 17, scope: !17)
!36 = !DILocalVariable(name: "i", scope: !37, file: !18, line: 42, type: !38)
!37 = distinct !DILexicalBlock(scope: !17, file: !18, line: 41, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 31, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !41)
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 42, column: 16, scope: !37)
!43 = !DILocalVariable(name: "source", scope: !37, file: !18, line: 43, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 43, column: 17, scope: !37)
!48 = !DILocation(line: 44, column: 17, scope: !37)
!49 = !DILocation(line: 44, column: 9, scope: !37)
!50 = !DILocation(line: 45, column: 9, scope: !37)
!51 = !DILocation(line: 45, column: 23, scope: !37)
!52 = !DILocation(line: 47, column: 16, scope: !53)
!53 = distinct !DILexicalBlock(scope: !37, file: !18, line: 47, column: 9)
!54 = !DILocation(line: 47, column: 14, scope: !53)
!55 = !DILocation(line: 47, column: 21, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !18, line: 47, column: 9)
!57 = !DILocation(line: 47, column: 23, scope: !56)
!58 = !DILocation(line: 47, column: 9, scope: !53)
!59 = !DILocation(line: 49, column: 30, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !18, line: 48, column: 9)
!61 = !DILocation(line: 49, column: 23, scope: !60)
!62 = !DILocation(line: 49, column: 13, scope: !60)
!63 = !DILocation(line: 49, column: 18, scope: !60)
!64 = !DILocation(line: 49, column: 21, scope: !60)
!65 = !DILocation(line: 50, column: 9, scope: !60)
!66 = !DILocation(line: 47, column: 31, scope: !56)
!67 = !DILocation(line: 47, column: 9, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 50, column: 9, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 51, column: 9, scope: !37)
!72 = !DILocation(line: 51, column: 21, scope: !37)
!73 = !DILocation(line: 52, column: 20, scope: !37)
!74 = !DILocation(line: 52, column: 9, scope: !37)
!75 = !DILocation(line: 54, column: 1, scope: !17)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_loop_15_good", scope: !18, file: !18, line: 126, type: !19, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!77 = !DILocation(line: 128, column: 5, scope: !76)
!78 = !DILocation(line: 129, column: 5, scope: !76)
!79 = !DILocation(line: 130, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 142, type: !81, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!81 = !DISubroutineType(types: !82)
!82 = !{!8, !8, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !18, line: 142, type: !8)
!87 = !DILocation(line: 142, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !18, line: 142, type: !83)
!89 = !DILocation(line: 142, column: 27, scope: !80)
!90 = !DILocation(line: 145, column: 22, scope: !80)
!91 = !DILocation(line: 145, column: 12, scope: !80)
!92 = !DILocation(line: 145, column: 5, scope: !80)
!93 = !DILocation(line: 147, column: 5, scope: !80)
!94 = !DILocation(line: 148, column: 5, scope: !80)
!95 = !DILocation(line: 149, column: 5, scope: !80)
!96 = !DILocation(line: 152, column: 5, scope: !80)
!97 = !DILocation(line: 153, column: 5, scope: !80)
!98 = !DILocation(line: 154, column: 5, scope: !80)
!99 = !DILocation(line: 156, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!101 = !DILocalVariable(name: "data", scope: !100, file: !18, line: 63, type: !3)
!102 = !DILocation(line: 63, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !18, line: 64, type: !3)
!104 = !DILocation(line: 64, column: 15, scope: !100)
!105 = !DILocation(line: 64, column: 42, scope: !100)
!106 = !DILocation(line: 64, column: 31, scope: !100)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !18, line: 65, type: !3)
!108 = !DILocation(line: 65, column: 15, scope: !100)
!109 = !DILocation(line: 65, column: 43, scope: !100)
!110 = !DILocation(line: 65, column: 32, scope: !100)
!111 = !DILocation(line: 74, column: 16, scope: !100)
!112 = !DILocation(line: 74, column: 14, scope: !100)
!113 = !DILocation(line: 75, column: 9, scope: !100)
!114 = !DILocation(line: 75, column: 17, scope: !100)
!115 = !DILocalVariable(name: "i", scope: !116, file: !18, line: 79, type: !38)
!116 = distinct !DILexicalBlock(scope: !100, file: !18, line: 78, column: 5)
!117 = !DILocation(line: 79, column: 16, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !18, line: 80, type: !44)
!119 = !DILocation(line: 80, column: 17, scope: !116)
!120 = !DILocation(line: 81, column: 17, scope: !116)
!121 = !DILocation(line: 81, column: 9, scope: !116)
!122 = !DILocation(line: 82, column: 9, scope: !116)
!123 = !DILocation(line: 82, column: 23, scope: !116)
!124 = !DILocation(line: 84, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !116, file: !18, line: 84, column: 9)
!126 = !DILocation(line: 84, column: 14, scope: !125)
!127 = !DILocation(line: 84, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !18, line: 84, column: 9)
!129 = !DILocation(line: 84, column: 23, scope: !128)
!130 = !DILocation(line: 84, column: 9, scope: !125)
!131 = !DILocation(line: 86, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !18, line: 85, column: 9)
!133 = !DILocation(line: 86, column: 23, scope: !132)
!134 = !DILocation(line: 86, column: 13, scope: !132)
!135 = !DILocation(line: 86, column: 18, scope: !132)
!136 = !DILocation(line: 86, column: 21, scope: !132)
!137 = !DILocation(line: 87, column: 9, scope: !132)
!138 = !DILocation(line: 84, column: 31, scope: !128)
!139 = !DILocation(line: 84, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !70}
!141 = !DILocation(line: 87, column: 9, scope: !125)
!142 = !DILocation(line: 88, column: 9, scope: !116)
!143 = !DILocation(line: 88, column: 21, scope: !116)
!144 = !DILocation(line: 89, column: 20, scope: !116)
!145 = !DILocation(line: 89, column: 9, scope: !116)
!146 = !DILocation(line: 91, column: 1, scope: !100)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!148 = !DILocalVariable(name: "data", scope: !147, file: !18, line: 96, type: !3)
!149 = !DILocation(line: 96, column: 15, scope: !147)
!150 = !DILocalVariable(name: "dataBadBuffer", scope: !147, file: !18, line: 97, type: !3)
!151 = !DILocation(line: 97, column: 15, scope: !147)
!152 = !DILocation(line: 97, column: 42, scope: !147)
!153 = !DILocation(line: 97, column: 31, scope: !147)
!154 = !DILocalVariable(name: "dataGoodBuffer", scope: !147, file: !18, line: 98, type: !3)
!155 = !DILocation(line: 98, column: 15, scope: !147)
!156 = !DILocation(line: 98, column: 43, scope: !147)
!157 = !DILocation(line: 98, column: 32, scope: !147)
!158 = !DILocation(line: 103, column: 16, scope: !147)
!159 = !DILocation(line: 103, column: 14, scope: !147)
!160 = !DILocation(line: 104, column: 9, scope: !147)
!161 = !DILocation(line: 104, column: 17, scope: !147)
!162 = !DILocalVariable(name: "i", scope: !163, file: !18, line: 112, type: !38)
!163 = distinct !DILexicalBlock(scope: !147, file: !18, line: 111, column: 5)
!164 = !DILocation(line: 112, column: 16, scope: !163)
!165 = !DILocalVariable(name: "source", scope: !163, file: !18, line: 113, type: !44)
!166 = !DILocation(line: 113, column: 17, scope: !163)
!167 = !DILocation(line: 114, column: 17, scope: !163)
!168 = !DILocation(line: 114, column: 9, scope: !163)
!169 = !DILocation(line: 115, column: 9, scope: !163)
!170 = !DILocation(line: 115, column: 23, scope: !163)
!171 = !DILocation(line: 117, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !163, file: !18, line: 117, column: 9)
!173 = !DILocation(line: 117, column: 14, scope: !172)
!174 = !DILocation(line: 117, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !18, line: 117, column: 9)
!176 = !DILocation(line: 117, column: 23, scope: !175)
!177 = !DILocation(line: 117, column: 9, scope: !172)
!178 = !DILocation(line: 119, column: 30, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !18, line: 118, column: 9)
!180 = !DILocation(line: 119, column: 23, scope: !179)
!181 = !DILocation(line: 119, column: 13, scope: !179)
!182 = !DILocation(line: 119, column: 18, scope: !179)
!183 = !DILocation(line: 119, column: 21, scope: !179)
!184 = !DILocation(line: 120, column: 9, scope: !179)
!185 = !DILocation(line: 117, column: 31, scope: !175)
!186 = !DILocation(line: 117, column: 9, scope: !175)
!187 = distinct !{!187, !177, !188, !70}
!188 = !DILocation(line: 120, column: 9, scope: !172)
!189 = !DILocation(line: 121, column: 9, scope: !163)
!190 = !DILocation(line: 121, column: 21, scope: !163)
!191 = !DILocation(line: 122, column: 20, scope: !163)
!192 = !DILocation(line: 122, column: 9, scope: !163)
!193 = !DILocation(line: 124, column: 1, scope: !147)
