; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_bad() #0 !dbg !13 {
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
  %4 = load i32, i32* @globalFive, align 4, !dbg !28
  %cmp = icmp eq i32 %4, 5, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %5, i32** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !53
  %cmp1 = icmp ult i64 %7, 100, !dbg !55
  br i1 %cmp1, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !59
  %9 = load i32, i32* %arrayidx, align 4, !dbg !59
  %10 = load i32*, i32** %data, align 8, !dbg !60
  %11 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !60
  store i32 %9, i32* %arrayidx2, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %12, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !69
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !69
  call void @printIntLine(i32 noundef %14), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !76 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 200, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = alloca i8, i64 400, align 16, !dbg !105
  %3 = bitcast i8* %2 to i32*, !dbg !106
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !104
  %4 = load i32, i32* @globalFive, align 4, !dbg !107
  %cmp = icmp ne i32 %4, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %5, i32** %data, align 8, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !126
  %cmp1 = icmp ult i64 %7, 100, !dbg !128
  br i1 %cmp1, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !132
  %9 = load i32, i32* %arrayidx, align 4, !dbg !132
  %10 = load i32*, i32** %data, align 8, !dbg !133
  %11 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !133
  store i32 %9, i32* %arrayidx2, align 4, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %12, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !141
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !141
  call void @printIntLine(i32 noundef %14), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = alloca i8, i64 200, align 16, !dbg !149
  %1 = bitcast i8* %0 to i32*, !dbg !150
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = alloca i8, i64 400, align 16, !dbg !153
  %3 = bitcast i8* %2 to i32*, !dbg !154
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !152
  %4 = load i32, i32* @globalFive, align 4, !dbg !155
  %cmp = icmp eq i32 %4, 5, !dbg !157
  br i1 %cmp, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !159
  store i32* %5, i32** %data, align 8, !dbg !161
  br label %if.end, !dbg !162

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !163, metadata !DIExpression()), !dbg !165
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !165
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !172
  %cmp1 = icmp ult i64 %7, 100, !dbg !174
  br i1 %cmp1, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %8, !dbg !178
  %9 = load i32, i32* %arrayidx, align 4, !dbg !178
  %10 = load i32*, i32** %data, align 8, !dbg !179
  %11 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx2 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !179
  store i32 %9, i32* %arrayidx2, align 4, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %12, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %13 = load i32*, i32** %data, align 8, !dbg !187
  %arrayidx3 = getelementptr inbounds i32, i32* %13, i64 0, !dbg !187
  %14 = load i32, i32* %arrayidx3, align 4, !dbg !187
  call void @printIntLine(i32 noundef %14), !dbg !188
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_bad", scope: !14, file: !14, line: 21, type: !15, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 26, column: 18, scope: !29)
!31 = !DILocation(line: 26, column: 8, scope: !13)
!32 = !DILocation(line: 30, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !14, line: 27, column: 5)
!34 = !DILocation(line: 30, column: 14, scope: !33)
!35 = !DILocation(line: 31, column: 5, scope: !33)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 33, type: !38)
!37 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 33, column: 13, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !14, line: 35, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !14, line: 34, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !47, line: 94, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 35, column: 20, scope: !43)
!50 = !DILocation(line: 37, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !14, line: 37, column: 13)
!52 = !DILocation(line: 37, column: 18, scope: !51)
!53 = !DILocation(line: 37, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !14, line: 37, column: 13)
!55 = !DILocation(line: 37, column: 27, scope: !54)
!56 = !DILocation(line: 37, column: 13, scope: !51)
!57 = !DILocation(line: 39, column: 34, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !14, line: 38, column: 13)
!59 = !DILocation(line: 39, column: 27, scope: !58)
!60 = !DILocation(line: 39, column: 17, scope: !58)
!61 = !DILocation(line: 39, column: 22, scope: !58)
!62 = !DILocation(line: 39, column: 25, scope: !58)
!63 = !DILocation(line: 40, column: 13, scope: !58)
!64 = !DILocation(line: 37, column: 35, scope: !54)
!65 = !DILocation(line: 37, column: 13, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 40, column: 13, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 41, column: 26, scope: !43)
!70 = !DILocation(line: 41, column: 13, scope: !43)
!71 = !DILocation(line: 44, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_loop_14_good", scope: !14, file: !14, line: 105, type: !15, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocation(line: 107, column: 5, scope: !72)
!74 = !DILocation(line: 108, column: 5, scope: !72)
!75 = !DILocation(line: 109, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 121, type: !77, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DISubroutineType(types: !78)
!78 = !{!4, !4, !79}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !14, line: 121, type: !4)
!83 = !DILocation(line: 121, column: 14, scope: !76)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !14, line: 121, type: !79)
!85 = !DILocation(line: 121, column: 27, scope: !76)
!86 = !DILocation(line: 124, column: 22, scope: !76)
!87 = !DILocation(line: 124, column: 12, scope: !76)
!88 = !DILocation(line: 124, column: 5, scope: !76)
!89 = !DILocation(line: 126, column: 5, scope: !76)
!90 = !DILocation(line: 127, column: 5, scope: !76)
!91 = !DILocation(line: 128, column: 5, scope: !76)
!92 = !DILocation(line: 131, column: 5, scope: !76)
!93 = !DILocation(line: 132, column: 5, scope: !76)
!94 = !DILocation(line: 133, column: 5, scope: !76)
!95 = !DILocation(line: 135, column: 5, scope: !76)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 51, type: !15, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 53, type: !3)
!98 = !DILocation(line: 53, column: 11, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !14, line: 54, type: !3)
!100 = !DILocation(line: 54, column: 11, scope: !96)
!101 = !DILocation(line: 54, column: 34, scope: !96)
!102 = !DILocation(line: 54, column: 27, scope: !96)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !14, line: 55, type: !3)
!104 = !DILocation(line: 55, column: 11, scope: !96)
!105 = !DILocation(line: 55, column: 35, scope: !96)
!106 = !DILocation(line: 55, column: 28, scope: !96)
!107 = !DILocation(line: 56, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !96, file: !14, line: 56, column: 8)
!109 = !DILocation(line: 56, column: 18, scope: !108)
!110 = !DILocation(line: 56, column: 8, scope: !96)
!111 = !DILocation(line: 59, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !14, line: 57, column: 5)
!113 = !DILocation(line: 60, column: 5, scope: !112)
!114 = !DILocation(line: 64, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !14, line: 62, column: 5)
!116 = !DILocation(line: 64, column: 14, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !118, file: !14, line: 67, type: !38)
!118 = distinct !DILexicalBlock(scope: !96, file: !14, line: 66, column: 5)
!119 = !DILocation(line: 67, column: 13, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !14, line: 69, type: !44)
!121 = distinct !DILexicalBlock(scope: !118, file: !14, line: 68, column: 9)
!122 = !DILocation(line: 69, column: 20, scope: !121)
!123 = !DILocation(line: 71, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !14, line: 71, column: 13)
!125 = !DILocation(line: 71, column: 18, scope: !124)
!126 = !DILocation(line: 71, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !14, line: 71, column: 13)
!128 = !DILocation(line: 71, column: 27, scope: !127)
!129 = !DILocation(line: 71, column: 13, scope: !124)
!130 = !DILocation(line: 73, column: 34, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !14, line: 72, column: 13)
!132 = !DILocation(line: 73, column: 27, scope: !131)
!133 = !DILocation(line: 73, column: 17, scope: !131)
!134 = !DILocation(line: 73, column: 22, scope: !131)
!135 = !DILocation(line: 73, column: 25, scope: !131)
!136 = !DILocation(line: 74, column: 13, scope: !131)
!137 = !DILocation(line: 71, column: 35, scope: !127)
!138 = !DILocation(line: 71, column: 13, scope: !127)
!139 = distinct !{!139, !129, !140, !68}
!140 = !DILocation(line: 74, column: 13, scope: !124)
!141 = !DILocation(line: 75, column: 26, scope: !121)
!142 = !DILocation(line: 75, column: 13, scope: !121)
!143 = !DILocation(line: 78, column: 1, scope: !96)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!145 = !DILocalVariable(name: "data", scope: !144, file: !14, line: 83, type: !3)
!146 = !DILocation(line: 83, column: 11, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !14, line: 84, type: !3)
!148 = !DILocation(line: 84, column: 11, scope: !144)
!149 = !DILocation(line: 84, column: 34, scope: !144)
!150 = !DILocation(line: 84, column: 27, scope: !144)
!151 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !14, line: 85, type: !3)
!152 = !DILocation(line: 85, column: 11, scope: !144)
!153 = !DILocation(line: 85, column: 35, scope: !144)
!154 = !DILocation(line: 85, column: 28, scope: !144)
!155 = !DILocation(line: 86, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !144, file: !14, line: 86, column: 8)
!157 = !DILocation(line: 86, column: 18, scope: !156)
!158 = !DILocation(line: 86, column: 8, scope: !144)
!159 = !DILocation(line: 89, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !14, line: 87, column: 5)
!161 = !DILocation(line: 89, column: 14, scope: !160)
!162 = !DILocation(line: 90, column: 5, scope: !160)
!163 = !DILocalVariable(name: "source", scope: !164, file: !14, line: 92, type: !38)
!164 = distinct !DILexicalBlock(scope: !144, file: !14, line: 91, column: 5)
!165 = !DILocation(line: 92, column: 13, scope: !164)
!166 = !DILocalVariable(name: "i", scope: !167, file: !14, line: 94, type: !44)
!167 = distinct !DILexicalBlock(scope: !164, file: !14, line: 93, column: 9)
!168 = !DILocation(line: 94, column: 20, scope: !167)
!169 = !DILocation(line: 96, column: 20, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !14, line: 96, column: 13)
!171 = !DILocation(line: 96, column: 18, scope: !170)
!172 = !DILocation(line: 96, column: 25, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !14, line: 96, column: 13)
!174 = !DILocation(line: 96, column: 27, scope: !173)
!175 = !DILocation(line: 96, column: 13, scope: !170)
!176 = !DILocation(line: 98, column: 34, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !14, line: 97, column: 13)
!178 = !DILocation(line: 98, column: 27, scope: !177)
!179 = !DILocation(line: 98, column: 17, scope: !177)
!180 = !DILocation(line: 98, column: 22, scope: !177)
!181 = !DILocation(line: 98, column: 25, scope: !177)
!182 = !DILocation(line: 99, column: 13, scope: !177)
!183 = !DILocation(line: 96, column: 35, scope: !173)
!184 = !DILocation(line: 96, column: 13, scope: !173)
!185 = distinct !{!185, !175, !186, !68}
!186 = !DILocation(line: 99, column: 13, scope: !170)
!187 = !DILocation(line: 100, column: 26, scope: !167)
!188 = !DILocation(line: 100, column: 13, scope: !167)
!189 = !DILocation(line: 103, column: 1, scope: !144)
