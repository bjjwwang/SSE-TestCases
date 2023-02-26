; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 200, align 16, !dbg !22
  %1 = bitcast i8* %0 to i32*, !dbg !23
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = alloca i8, i64 400, align 16, !dbg !26
  %3 = bitcast i8* %2 to i32*, !dbg !27
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !25
  %call = call i32 (...) @globalReturnsTrue(), !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  store i32* %4, i32** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %6, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !58
  %8 = load i32, i32* %arrayidx, align 4, !dbg !58
  %9 = load i32*, i32** %data, align 8, !dbg !59
  %10 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !59
  store i32 %8, i32* %arrayidx1, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %11, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !68
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !68
  call void @printIntLine(i32 noundef %13), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !75 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 200, align 16, !dbg !100
  %1 = bitcast i8* %0 to i32*, !dbg !101
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %2 = alloca i8, i64 400, align 16, !dbg !104
  %3 = bitcast i8* %2 to i32*, !dbg !105
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !103
  %call = call i32 (...) @globalReturnsFalse(), !dbg !106
  %tobool = icmp ne i32 %call, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  store i32* %4, i32** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !124
  %cmp = icmp ult i64 %6, 100, !dbg !126
  br i1 %cmp, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !130
  %8 = load i32, i32* %arrayidx, align 4, !dbg !130
  %9 = load i32*, i32** %data, align 8, !dbg !131
  %10 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !131
  store i32 %8, i32* %arrayidx1, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %11, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !139
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !139
  call void @printIntLine(i32 noundef %13), !dbg !140
  ret void, !dbg !141
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !142 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = alloca i8, i64 200, align 16, !dbg !147
  %1 = bitcast i8* %0 to i32*, !dbg !148
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !146
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %2 = alloca i8, i64 400, align 16, !dbg !151
  %3 = bitcast i8* %2 to i32*, !dbg !152
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !150
  %call = call i32 (...) @globalReturnsTrue(), !dbg !153
  %tobool = icmp ne i32 %call, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !156
  store i32* %4, i32** %data, align 8, !dbg !158
  br label %if.end, !dbg !159

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !160, metadata !DIExpression()), !dbg !162
  %5 = bitcast [100 x i32]* %source to i8*, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 400, i1 false), !dbg !162
  call void @llvm.dbg.declare(metadata i64* %i, metadata !163, metadata !DIExpression()), !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !169
  %cmp = icmp ult i64 %6, 100, !dbg !171
  br i1 %cmp, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %7, !dbg !175
  %8 = load i32, i32* %arrayidx, align 4, !dbg !175
  %9 = load i32*, i32** %data, align 8, !dbg !176
  %10 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx1 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !176
  store i32 %8, i32* %arrayidx1, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !180
  %inc = add i64 %11, 1, !dbg !180
  store i64 %inc, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %12 = load i32*, i32** %data, align 8, !dbg !184
  %arrayidx2 = getelementptr inbounds i32, i32* %12, i64 0, !dbg !184
  %13 = load i32, i32* %arrayidx2, align 4, !dbg !184
  call void @printIntLine(i32 noundef %13), !dbg !185
  ret void, !dbg !186
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 11, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 24, type: !3)
!21 = !DILocation(line: 24, column: 11, scope: !13)
!22 = !DILocation(line: 24, column: 34, scope: !13)
!23 = !DILocation(line: 24, column: 27, scope: !13)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 25, type: !3)
!25 = !DILocation(line: 25, column: 11, scope: !13)
!26 = !DILocation(line: 25, column: 35, scope: !13)
!27 = !DILocation(line: 25, column: 28, scope: !13)
!28 = !DILocation(line: 26, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 26, column: 8)
!30 = !DILocation(line: 26, column: 8, scope: !13)
!31 = !DILocation(line: 30, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !29, file: !14, line: 27, column: 5)
!33 = !DILocation(line: 30, column: 14, scope: !32)
!34 = !DILocation(line: 31, column: 5, scope: !32)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 33, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 33, column: 13, scope: !36)
!41 = !DILocalVariable(name: "i", scope: !42, file: !14, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !36, file: !14, line: 34, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !46, line: 94, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 35, column: 20, scope: !42)
!49 = !DILocation(line: 37, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !14, line: 37, column: 13)
!51 = !DILocation(line: 37, column: 18, scope: !50)
!52 = !DILocation(line: 37, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !14, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 27, scope: !53)
!55 = !DILocation(line: 37, column: 13, scope: !50)
!56 = !DILocation(line: 39, column: 34, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !14, line: 38, column: 13)
!58 = !DILocation(line: 39, column: 27, scope: !57)
!59 = !DILocation(line: 39, column: 17, scope: !57)
!60 = !DILocation(line: 39, column: 22, scope: !57)
!61 = !DILocation(line: 39, column: 25, scope: !57)
!62 = !DILocation(line: 40, column: 13, scope: !57)
!63 = !DILocation(line: 37, column: 35, scope: !53)
!64 = !DILocation(line: 37, column: 13, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 40, column: 13, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 41, column: 26, scope: !42)
!69 = !DILocation(line: 41, column: 13, scope: !42)
!70 = !DILocation(line: 44, column: 1, scope: !13)
!71 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_11_good", scope: !14, file: !14, line: 105, type: !15, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!72 = !DILocation(line: 107, column: 5, scope: !71)
!73 = !DILocation(line: 108, column: 5, scope: !71)
!74 = !DILocation(line: 109, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !76, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!76 = !DISubroutineType(types: !77)
!77 = !{!4, !4, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !14, line: 121, type: !4)
!82 = !DILocation(line: 121, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !14, line: 121, type: !78)
!84 = !DILocation(line: 121, column: 27, scope: !75)
!85 = !DILocation(line: 124, column: 22, scope: !75)
!86 = !DILocation(line: 124, column: 12, scope: !75)
!87 = !DILocation(line: 124, column: 5, scope: !75)
!88 = !DILocation(line: 126, column: 5, scope: !75)
!89 = !DILocation(line: 127, column: 5, scope: !75)
!90 = !DILocation(line: 128, column: 5, scope: !75)
!91 = !DILocation(line: 131, column: 5, scope: !75)
!92 = !DILocation(line: 132, column: 5, scope: !75)
!93 = !DILocation(line: 133, column: 5, scope: !75)
!94 = !DILocation(line: 135, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 53, type: !3)
!97 = !DILocation(line: 53, column: 11, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !14, line: 54, type: !3)
!99 = !DILocation(line: 54, column: 11, scope: !95)
!100 = !DILocation(line: 54, column: 34, scope: !95)
!101 = !DILocation(line: 54, column: 27, scope: !95)
!102 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !14, line: 55, type: !3)
!103 = !DILocation(line: 55, column: 11, scope: !95)
!104 = !DILocation(line: 55, column: 35, scope: !95)
!105 = !DILocation(line: 55, column: 28, scope: !95)
!106 = !DILocation(line: 56, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !95, file: !14, line: 56, column: 8)
!108 = !DILocation(line: 56, column: 8, scope: !95)
!109 = !DILocation(line: 59, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !14, line: 57, column: 5)
!111 = !DILocation(line: 60, column: 5, scope: !110)
!112 = !DILocation(line: 64, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !14, line: 62, column: 5)
!114 = !DILocation(line: 64, column: 14, scope: !113)
!115 = !DILocalVariable(name: "source", scope: !116, file: !14, line: 67, type: !37)
!116 = distinct !DILexicalBlock(scope: !95, file: !14, line: 66, column: 5)
!117 = !DILocation(line: 67, column: 13, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !14, line: 69, type: !43)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 68, column: 9)
!120 = !DILocation(line: 69, column: 20, scope: !119)
!121 = !DILocation(line: 71, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !14, line: 71, column: 13)
!123 = !DILocation(line: 71, column: 18, scope: !122)
!124 = !DILocation(line: 71, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !14, line: 71, column: 13)
!126 = !DILocation(line: 71, column: 27, scope: !125)
!127 = !DILocation(line: 71, column: 13, scope: !122)
!128 = !DILocation(line: 73, column: 34, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !14, line: 72, column: 13)
!130 = !DILocation(line: 73, column: 27, scope: !129)
!131 = !DILocation(line: 73, column: 17, scope: !129)
!132 = !DILocation(line: 73, column: 22, scope: !129)
!133 = !DILocation(line: 73, column: 25, scope: !129)
!134 = !DILocation(line: 74, column: 13, scope: !129)
!135 = !DILocation(line: 71, column: 35, scope: !125)
!136 = !DILocation(line: 71, column: 13, scope: !125)
!137 = distinct !{!137, !127, !138, !67}
!138 = !DILocation(line: 74, column: 13, scope: !122)
!139 = !DILocation(line: 75, column: 26, scope: !119)
!140 = !DILocation(line: 75, column: 13, scope: !119)
!141 = !DILocation(line: 78, column: 1, scope: !95)
!142 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!143 = !DILocalVariable(name: "data", scope: !142, file: !14, line: 83, type: !3)
!144 = !DILocation(line: 83, column: 11, scope: !142)
!145 = !DILocalVariable(name: "dataBadBuffer", scope: !142, file: !14, line: 84, type: !3)
!146 = !DILocation(line: 84, column: 11, scope: !142)
!147 = !DILocation(line: 84, column: 34, scope: !142)
!148 = !DILocation(line: 84, column: 27, scope: !142)
!149 = !DILocalVariable(name: "dataGoodBuffer", scope: !142, file: !14, line: 85, type: !3)
!150 = !DILocation(line: 85, column: 11, scope: !142)
!151 = !DILocation(line: 85, column: 35, scope: !142)
!152 = !DILocation(line: 85, column: 28, scope: !142)
!153 = !DILocation(line: 86, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !142, file: !14, line: 86, column: 8)
!155 = !DILocation(line: 86, column: 8, scope: !142)
!156 = !DILocation(line: 89, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !14, line: 87, column: 5)
!158 = !DILocation(line: 89, column: 14, scope: !157)
!159 = !DILocation(line: 90, column: 5, scope: !157)
!160 = !DILocalVariable(name: "source", scope: !161, file: !14, line: 92, type: !37)
!161 = distinct !DILexicalBlock(scope: !142, file: !14, line: 91, column: 5)
!162 = !DILocation(line: 92, column: 13, scope: !161)
!163 = !DILocalVariable(name: "i", scope: !164, file: !14, line: 94, type: !43)
!164 = distinct !DILexicalBlock(scope: !161, file: !14, line: 93, column: 9)
!165 = !DILocation(line: 94, column: 20, scope: !164)
!166 = !DILocation(line: 96, column: 20, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !14, line: 96, column: 13)
!168 = !DILocation(line: 96, column: 18, scope: !167)
!169 = !DILocation(line: 96, column: 25, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !14, line: 96, column: 13)
!171 = !DILocation(line: 96, column: 27, scope: !170)
!172 = !DILocation(line: 96, column: 13, scope: !167)
!173 = !DILocation(line: 98, column: 34, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !14, line: 97, column: 13)
!175 = !DILocation(line: 98, column: 27, scope: !174)
!176 = !DILocation(line: 98, column: 17, scope: !174)
!177 = !DILocation(line: 98, column: 22, scope: !174)
!178 = !DILocation(line: 98, column: 25, scope: !174)
!179 = !DILocation(line: 99, column: 13, scope: !174)
!180 = !DILocation(line: 96, column: 35, scope: !170)
!181 = !DILocation(line: 96, column: 13, scope: !170)
!182 = distinct !{!182, !172, !183, !67}
!183 = !DILocation(line: 99, column: 13, scope: !167)
!184 = !DILocation(line: 100, column: 26, scope: !164)
!185 = !DILocation(line: 100, column: 13, scope: !164)
!186 = !DILocation(line: 103, column: 1, scope: !142)
