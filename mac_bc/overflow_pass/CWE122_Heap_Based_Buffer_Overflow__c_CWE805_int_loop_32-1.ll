; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !30
  %1 = load i32*, i32** %0, align 8, !dbg !31
  store i32* %1, i32** %data1, align 8, !dbg !29
  %call = call i8* @malloc(i64 noundef 200) #6, !dbg !32
  %2 = bitcast i8* %call to i32*, !dbg !33
  store i32* %2, i32** %data1, align 8, !dbg !34
  %3 = load i32*, i32** %data1, align 8, !dbg !35
  %cmp = icmp eq i32* %3, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !41
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  store i32* %4, i32** %5, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !44, metadata !DIExpression()), !dbg !46
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !47
  %7 = load i32*, i32** %6, align 8, !dbg !48
  store i32* %7, i32** %data2, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %8 = bitcast [100 x i32]* %source to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 400, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !66
  %cmp3 = icmp ult i64 %9, 100, !dbg !68
  br i1 %cmp3, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %10, !dbg !72
  %11 = load i32, i32* %arrayidx, align 4, !dbg !72
  %12 = load i32*, i32** %data2, align 8, !dbg !73
  %13 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !73
  store i32 %11, i32* %arrayidx4, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %14, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !82
  %arrayidx5 = getelementptr inbounds i32, i32* %15, i64 0, !dbg !82
  %16 = load i32, i32* %arrayidx5, align 4, !dbg !82
  call void @printIntLine(i32 noundef %16), !dbg !83
  %17 = load i32*, i32** %data2, align 8, !dbg !84
  %18 = bitcast i32* %17 to i8*, !dbg !84
  call void @free(i8* noundef %18), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare void @printIntLine(i32 noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data2 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !113, metadata !DIExpression()), !dbg !114
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !115, metadata !DIExpression()), !dbg !116
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !116
  store i32* null, i32** %data, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !118, metadata !DIExpression()), !dbg !120
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !121
  %1 = load i32*, i32** %0, align 8, !dbg !122
  store i32* %1, i32** %data1, align 8, !dbg !120
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !123
  %2 = bitcast i8* %call to i32*, !dbg !124
  store i32* %2, i32** %data1, align 8, !dbg !125
  %3 = load i32*, i32** %data1, align 8, !dbg !126
  %cmp = icmp eq i32* %3, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !132
  %5 = load i32**, i32*** %dataPtr1, align 8, !dbg !133
  store i32* %4, i32** %5, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i32** %data2, metadata !135, metadata !DIExpression()), !dbg !137
  %6 = load i32**, i32*** %dataPtr2, align 8, !dbg !138
  %7 = load i32*, i32** %6, align 8, !dbg !139
  store i32* %7, i32** %data2, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %8 = bitcast [100 x i32]* %source to i8*, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 400, i1 false), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, i64* %i, align 8, !dbg !149
  %cmp3 = icmp ult i64 %9, 100, !dbg !151
  br i1 %cmp3, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %10, !dbg !155
  %11 = load i32, i32* %arrayidx, align 4, !dbg !155
  %12 = load i32*, i32** %data2, align 8, !dbg !156
  %13 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx4 = getelementptr inbounds i32, i32* %12, i64 %13, !dbg !156
  store i32 %11, i32* %arrayidx4, align 4, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !160
  %inc = add i64 %14, 1, !dbg !160
  store i64 %inc, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %15 = load i32*, i32** %data2, align 8, !dbg !164
  %arrayidx5 = getelementptr inbounds i32, i32* %15, i64 0, !dbg !164
  %16 = load i32, i32* %arrayidx5, align 4, !dbg !164
  call void @printIntLine(i32 noundef %16), !dbg !165
  %17 = load i32*, i32** %data2, align 8, !dbg !166
  %18 = bitcast i32* %17 to i8*, !dbg !166
  call void @free(i8* noundef %18), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 11, scope: !14)
!21 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 24, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!23 = !DILocation(line: 24, column: 12, scope: !14)
!24 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 25, type: !22)
!25 = !DILocation(line: 25, column: 12, scope: !14)
!26 = !DILocation(line: 26, column: 10, scope: !14)
!27 = !DILocalVariable(name: "data", scope: !28, file: !15, line: 28, type: !3)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 5)
!29 = !DILocation(line: 28, column: 15, scope: !28)
!30 = !DILocation(line: 28, column: 23, scope: !28)
!31 = !DILocation(line: 28, column: 22, scope: !28)
!32 = !DILocation(line: 30, column: 23, scope: !28)
!33 = !DILocation(line: 30, column: 16, scope: !28)
!34 = !DILocation(line: 30, column: 14, scope: !28)
!35 = !DILocation(line: 31, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !28, file: !15, line: 31, column: 13)
!37 = !DILocation(line: 31, column: 18, scope: !36)
!38 = !DILocation(line: 31, column: 13, scope: !28)
!39 = !DILocation(line: 31, column: 28, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !15, line: 31, column: 27)
!41 = !DILocation(line: 32, column: 21, scope: !28)
!42 = !DILocation(line: 32, column: 10, scope: !28)
!43 = !DILocation(line: 32, column: 19, scope: !28)
!44 = !DILocalVariable(name: "data", scope: !45, file: !15, line: 35, type: !3)
!45 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!46 = !DILocation(line: 35, column: 15, scope: !45)
!47 = !DILocation(line: 35, column: 23, scope: !45)
!48 = !DILocation(line: 35, column: 22, scope: !45)
!49 = !DILocalVariable(name: "source", scope: !50, file: !15, line: 37, type: !51)
!50 = distinct !DILexicalBlock(scope: !45, file: !15, line: 36, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 37, column: 17, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !56, file: !15, line: 39, type: !57)
!56 = distinct !DILexicalBlock(scope: !50, file: !15, line: 38, column: 13)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 31, baseType: !59)
!58 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !60, line: 94, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!61 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 39, column: 24, scope: !56)
!63 = !DILocation(line: 41, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !56, file: !15, line: 41, column: 17)
!65 = !DILocation(line: 41, column: 22, scope: !64)
!66 = !DILocation(line: 41, column: 29, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !15, line: 41, column: 17)
!68 = !DILocation(line: 41, column: 31, scope: !67)
!69 = !DILocation(line: 41, column: 17, scope: !64)
!70 = !DILocation(line: 43, column: 38, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !15, line: 42, column: 17)
!72 = !DILocation(line: 43, column: 31, scope: !71)
!73 = !DILocation(line: 43, column: 21, scope: !71)
!74 = !DILocation(line: 43, column: 26, scope: !71)
!75 = !DILocation(line: 43, column: 29, scope: !71)
!76 = !DILocation(line: 44, column: 17, scope: !71)
!77 = !DILocation(line: 41, column: 39, scope: !67)
!78 = !DILocation(line: 41, column: 17, scope: !67)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 44, column: 17, scope: !64)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 45, column: 30, scope: !56)
!83 = !DILocation(line: 45, column: 17, scope: !56)
!84 = !DILocation(line: 46, column: 22, scope: !56)
!85 = !DILocation(line: 46, column: 17, scope: !56)
!86 = !DILocation(line: 50, column: 1, scope: !14)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_32_good", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!88 = !DILocation(line: 90, column: 5, scope: !87)
!89 = !DILocation(line: 91, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 102, type: !91, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!91 = !DISubroutineType(types: !92)
!92 = !{!4, !4, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !15, line: 102, type: !4)
!97 = !DILocation(line: 102, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !15, line: 102, type: !93)
!99 = !DILocation(line: 102, column: 27, scope: !90)
!100 = !DILocation(line: 105, column: 22, scope: !90)
!101 = !DILocation(line: 105, column: 12, scope: !90)
!102 = !DILocation(line: 105, column: 5, scope: !90)
!103 = !DILocation(line: 107, column: 5, scope: !90)
!104 = !DILocation(line: 108, column: 5, scope: !90)
!105 = !DILocation(line: 109, column: 5, scope: !90)
!106 = !DILocation(line: 112, column: 5, scope: !90)
!107 = !DILocation(line: 113, column: 5, scope: !90)
!108 = !DILocation(line: 114, column: 5, scope: !90)
!109 = !DILocation(line: 116, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!111 = !DILocalVariable(name: "data", scope: !110, file: !15, line: 59, type: !3)
!112 = !DILocation(line: 59, column: 11, scope: !110)
!113 = !DILocalVariable(name: "dataPtr1", scope: !110, file: !15, line: 60, type: !22)
!114 = !DILocation(line: 60, column: 12, scope: !110)
!115 = !DILocalVariable(name: "dataPtr2", scope: !110, file: !15, line: 61, type: !22)
!116 = !DILocation(line: 61, column: 12, scope: !110)
!117 = !DILocation(line: 62, column: 10, scope: !110)
!118 = !DILocalVariable(name: "data", scope: !119, file: !15, line: 64, type: !3)
!119 = distinct !DILexicalBlock(scope: !110, file: !15, line: 63, column: 5)
!120 = !DILocation(line: 64, column: 15, scope: !119)
!121 = !DILocation(line: 64, column: 23, scope: !119)
!122 = !DILocation(line: 64, column: 22, scope: !119)
!123 = !DILocation(line: 66, column: 23, scope: !119)
!124 = !DILocation(line: 66, column: 16, scope: !119)
!125 = !DILocation(line: 66, column: 14, scope: !119)
!126 = !DILocation(line: 67, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !119, file: !15, line: 67, column: 13)
!128 = !DILocation(line: 67, column: 18, scope: !127)
!129 = !DILocation(line: 67, column: 13, scope: !119)
!130 = !DILocation(line: 67, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !15, line: 67, column: 27)
!132 = !DILocation(line: 68, column: 21, scope: !119)
!133 = !DILocation(line: 68, column: 10, scope: !119)
!134 = !DILocation(line: 68, column: 19, scope: !119)
!135 = !DILocalVariable(name: "data", scope: !136, file: !15, line: 71, type: !3)
!136 = distinct !DILexicalBlock(scope: !110, file: !15, line: 70, column: 5)
!137 = !DILocation(line: 71, column: 15, scope: !136)
!138 = !DILocation(line: 71, column: 23, scope: !136)
!139 = !DILocation(line: 71, column: 22, scope: !136)
!140 = !DILocalVariable(name: "source", scope: !141, file: !15, line: 73, type: !51)
!141 = distinct !DILexicalBlock(scope: !136, file: !15, line: 72, column: 9)
!142 = !DILocation(line: 73, column: 17, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !15, line: 75, type: !57)
!144 = distinct !DILexicalBlock(scope: !141, file: !15, line: 74, column: 13)
!145 = !DILocation(line: 75, column: 24, scope: !144)
!146 = !DILocation(line: 77, column: 24, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !15, line: 77, column: 17)
!148 = !DILocation(line: 77, column: 22, scope: !147)
!149 = !DILocation(line: 77, column: 29, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !15, line: 77, column: 17)
!151 = !DILocation(line: 77, column: 31, scope: !150)
!152 = !DILocation(line: 77, column: 17, scope: !147)
!153 = !DILocation(line: 79, column: 38, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !15, line: 78, column: 17)
!155 = !DILocation(line: 79, column: 31, scope: !154)
!156 = !DILocation(line: 79, column: 21, scope: !154)
!157 = !DILocation(line: 79, column: 26, scope: !154)
!158 = !DILocation(line: 79, column: 29, scope: !154)
!159 = !DILocation(line: 80, column: 17, scope: !154)
!160 = !DILocation(line: 77, column: 39, scope: !150)
!161 = !DILocation(line: 77, column: 17, scope: !150)
!162 = distinct !{!162, !152, !163, !81}
!163 = !DILocation(line: 80, column: 17, scope: !147)
!164 = !DILocation(line: 81, column: 30, scope: !144)
!165 = !DILocation(line: 81, column: 17, scope: !144)
!166 = !DILocation(line: 82, column: 22, scope: !144)
!167 = !DILocation(line: 82, column: 17, scope: !144)
!168 = !DILocation(line: 86, column: 1, scope: !110)
