; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 200) #6, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !26
  %1 = load i32*, i32** %data, align 8, !dbg !27
  %cmp = icmp eq i32* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !50
  %cmp1 = icmp ult i64 %3, 100, !dbg !52
  br i1 %cmp1, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !54
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !56
  %5 = load i32, i32* %arrayidx, align 4, !dbg !56
  %6 = load i32*, i32** %data, align 8, !dbg !57
  %7 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !57
  store i32 %5, i32* %arrayidx2, align 4, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %8, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !66
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !66
  call void @printIntLine(i32 noundef %10), !dbg !67
  %11 = load i32*, i32** %data, align 8, !dbg !68
  %12 = bitcast i32* %11 to i8*, !dbg !68
  call void @free(i8* noundef %12), !dbg !69
  ret void, !dbg !70
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06_good() #0 !dbg !71 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  store i32* null, i32** %data, align 8, !dbg !98
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !99
  %0 = bitcast i8* %call to i32*, !dbg !102
  store i32* %0, i32** %data, align 8, !dbg !103
  %1 = load i32*, i32** %data, align 8, !dbg !104
  %cmp = icmp eq i32* %1, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %i, metadata !113, metadata !DIExpression()), !dbg !115
  store i64 0, i64* %i, align 8, !dbg !116
  br label %for.cond, !dbg !118

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !119
  %cmp1 = icmp ult i64 %3, 100, !dbg !121
  br i1 %cmp1, label %for.body, label %for.end, !dbg !122

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !123
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !125
  %5 = load i32, i32* %arrayidx, align 4, !dbg !125
  %6 = load i32*, i32** %data, align 8, !dbg !126
  %7 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !126
  store i32 %5, i32* %arrayidx2, align 4, !dbg !128
  br label %for.inc, !dbg !129

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !130
  %inc = add i64 %8, 1, !dbg !130
  store i64 %inc, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !131, !llvm.loop !132

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !134
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !134
  call void @printIntLine(i32 noundef %10), !dbg !135
  %11 = load i32*, i32** %data, align 8, !dbg !136
  %12 = bitcast i32* %11 to i8*, !dbg !136
  call void @free(i8* noundef %12), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  store i32* null, i32** %data, align 8, !dbg !142
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !143
  %0 = bitcast i8* %call to i32*, !dbg !146
  store i32* %0, i32** %data, align 8, !dbg !147
  %1 = load i32*, i32** %data, align 8, !dbg !148
  %cmp = icmp eq i32* %1, null, !dbg !150
  br i1 %cmp, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !152
  unreachable, !dbg !152

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  %2 = bitcast [100 x i32]* %source to i8*, !dbg !156
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 400, i1 false), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !163
  %cmp1 = icmp ult i64 %3, 100, !dbg !165
  br i1 %cmp1, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !169
  %5 = load i32, i32* %arrayidx, align 4, !dbg !169
  %6 = load i32*, i32** %data, align 8, !dbg !170
  %7 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !170
  store i32 %5, i32* %arrayidx2, align 4, !dbg !172
  br label %for.inc, !dbg !173

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !174
  %inc = add i64 %8, 1, !dbg !174
  store i64 %inc, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !175, !llvm.loop !176

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !178
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 0, !dbg !178
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !178
  call void @printIntLine(i32 noundef %10), !dbg !179
  %11 = load i32*, i32** %data, align 8, !dbg !180
  %12 = bitcast i32* %11 to i8*, !dbg !180
  call void @free(i8* noundef %12), !dbg !181
  ret void, !dbg !182
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06_bad", scope: !15, file: !15, line: 25, type: !16, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 27, type: !3)
!20 = !DILocation(line: 27, column: 11, scope: !14)
!21 = !DILocation(line: 28, column: 10, scope: !14)
!22 = !DILocation(line: 32, column: 23, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 30, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 8)
!25 = !DILocation(line: 32, column: 16, scope: !23)
!26 = !DILocation(line: 32, column: 14, scope: !23)
!27 = !DILocation(line: 33, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !15, line: 33, column: 13)
!29 = !DILocation(line: 33, column: 18, scope: !28)
!30 = !DILocation(line: 33, column: 13, scope: !23)
!31 = !DILocation(line: 33, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 33, column: 27)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 36, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 36, column: 13, scope: !34)
!39 = !DILocalVariable(name: "i", scope: !40, file: !15, line: 38, type: !41)
!40 = distinct !DILexicalBlock(scope: !34, file: !15, line: 37, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 31, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !44, line: 94, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 38, column: 20, scope: !40)
!47 = !DILocation(line: 40, column: 20, scope: !48)
!48 = distinct !DILexicalBlock(scope: !40, file: !15, line: 40, column: 13)
!49 = !DILocation(line: 40, column: 18, scope: !48)
!50 = !DILocation(line: 40, column: 25, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !15, line: 40, column: 13)
!52 = !DILocation(line: 40, column: 27, scope: !51)
!53 = !DILocation(line: 40, column: 13, scope: !48)
!54 = !DILocation(line: 42, column: 34, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !15, line: 41, column: 13)
!56 = !DILocation(line: 42, column: 27, scope: !55)
!57 = !DILocation(line: 42, column: 17, scope: !55)
!58 = !DILocation(line: 42, column: 22, scope: !55)
!59 = !DILocation(line: 42, column: 25, scope: !55)
!60 = !DILocation(line: 43, column: 13, scope: !55)
!61 = !DILocation(line: 40, column: 35, scope: !51)
!62 = !DILocation(line: 40, column: 13, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 43, column: 13, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 44, column: 26, scope: !40)
!67 = !DILocation(line: 44, column: 13, scope: !40)
!68 = !DILocation(line: 45, column: 18, scope: !40)
!69 = !DILocation(line: 45, column: 13, scope: !40)
!70 = !DILocation(line: 48, column: 1, scope: !14)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_loop_06_good", scope: !15, file: !15, line: 111, type: !16, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!72 = !DILocation(line: 113, column: 5, scope: !71)
!73 = !DILocation(line: 114, column: 5, scope: !71)
!74 = !DILocation(line: 115, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 127, type: !76, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!76 = !DISubroutineType(types: !77)
!77 = !{!4, !4, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !15, line: 127, type: !4)
!82 = !DILocation(line: 127, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !15, line: 127, type: !78)
!84 = !DILocation(line: 127, column: 27, scope: !75)
!85 = !DILocation(line: 130, column: 22, scope: !75)
!86 = !DILocation(line: 130, column: 12, scope: !75)
!87 = !DILocation(line: 130, column: 5, scope: !75)
!88 = !DILocation(line: 132, column: 5, scope: !75)
!89 = !DILocation(line: 133, column: 5, scope: !75)
!90 = !DILocation(line: 134, column: 5, scope: !75)
!91 = !DILocation(line: 137, column: 5, scope: !75)
!92 = !DILocation(line: 138, column: 5, scope: !75)
!93 = !DILocation(line: 139, column: 5, scope: !75)
!94 = !DILocation(line: 141, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!96 = !DILocalVariable(name: "data", scope: !95, file: !15, line: 57, type: !3)
!97 = !DILocation(line: 57, column: 11, scope: !95)
!98 = !DILocation(line: 58, column: 10, scope: !95)
!99 = !DILocation(line: 67, column: 23, scope: !100)
!100 = distinct !DILexicalBlock(scope: !101, file: !15, line: 65, column: 5)
!101 = distinct !DILexicalBlock(scope: !95, file: !15, line: 59, column: 8)
!102 = !DILocation(line: 67, column: 16, scope: !100)
!103 = !DILocation(line: 67, column: 14, scope: !100)
!104 = !DILocation(line: 68, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !15, line: 68, column: 13)
!106 = !DILocation(line: 68, column: 18, scope: !105)
!107 = !DILocation(line: 68, column: 13, scope: !100)
!108 = !DILocation(line: 68, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 68, column: 27)
!110 = !DILocalVariable(name: "source", scope: !111, file: !15, line: 71, type: !35)
!111 = distinct !DILexicalBlock(scope: !95, file: !15, line: 70, column: 5)
!112 = !DILocation(line: 71, column: 13, scope: !111)
!113 = !DILocalVariable(name: "i", scope: !114, file: !15, line: 73, type: !41)
!114 = distinct !DILexicalBlock(scope: !111, file: !15, line: 72, column: 9)
!115 = !DILocation(line: 73, column: 20, scope: !114)
!116 = !DILocation(line: 75, column: 20, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !15, line: 75, column: 13)
!118 = !DILocation(line: 75, column: 18, scope: !117)
!119 = !DILocation(line: 75, column: 25, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !15, line: 75, column: 13)
!121 = !DILocation(line: 75, column: 27, scope: !120)
!122 = !DILocation(line: 75, column: 13, scope: !117)
!123 = !DILocation(line: 77, column: 34, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 76, column: 13)
!125 = !DILocation(line: 77, column: 27, scope: !124)
!126 = !DILocation(line: 77, column: 17, scope: !124)
!127 = !DILocation(line: 77, column: 22, scope: !124)
!128 = !DILocation(line: 77, column: 25, scope: !124)
!129 = !DILocation(line: 78, column: 13, scope: !124)
!130 = !DILocation(line: 75, column: 35, scope: !120)
!131 = !DILocation(line: 75, column: 13, scope: !120)
!132 = distinct !{!132, !122, !133, !65}
!133 = !DILocation(line: 78, column: 13, scope: !117)
!134 = !DILocation(line: 79, column: 26, scope: !114)
!135 = !DILocation(line: 79, column: 13, scope: !114)
!136 = !DILocation(line: 80, column: 18, scope: !114)
!137 = !DILocation(line: 80, column: 13, scope: !114)
!138 = !DILocation(line: 83, column: 1, scope: !95)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!140 = !DILocalVariable(name: "data", scope: !139, file: !15, line: 88, type: !3)
!141 = !DILocation(line: 88, column: 11, scope: !139)
!142 = !DILocation(line: 89, column: 10, scope: !139)
!143 = !DILocation(line: 93, column: 23, scope: !144)
!144 = distinct !DILexicalBlock(scope: !145, file: !15, line: 91, column: 5)
!145 = distinct !DILexicalBlock(scope: !139, file: !15, line: 90, column: 8)
!146 = !DILocation(line: 93, column: 16, scope: !144)
!147 = !DILocation(line: 93, column: 14, scope: !144)
!148 = !DILocation(line: 94, column: 13, scope: !149)
!149 = distinct !DILexicalBlock(scope: !144, file: !15, line: 94, column: 13)
!150 = !DILocation(line: 94, column: 18, scope: !149)
!151 = !DILocation(line: 94, column: 13, scope: !144)
!152 = !DILocation(line: 94, column: 28, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !15, line: 94, column: 27)
!154 = !DILocalVariable(name: "source", scope: !155, file: !15, line: 97, type: !35)
!155 = distinct !DILexicalBlock(scope: !139, file: !15, line: 96, column: 5)
!156 = !DILocation(line: 97, column: 13, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !15, line: 99, type: !41)
!158 = distinct !DILexicalBlock(scope: !155, file: !15, line: 98, column: 9)
!159 = !DILocation(line: 99, column: 20, scope: !158)
!160 = !DILocation(line: 101, column: 20, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !15, line: 101, column: 13)
!162 = !DILocation(line: 101, column: 18, scope: !161)
!163 = !DILocation(line: 101, column: 25, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !15, line: 101, column: 13)
!165 = !DILocation(line: 101, column: 27, scope: !164)
!166 = !DILocation(line: 101, column: 13, scope: !161)
!167 = !DILocation(line: 103, column: 34, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !15, line: 102, column: 13)
!169 = !DILocation(line: 103, column: 27, scope: !168)
!170 = !DILocation(line: 103, column: 17, scope: !168)
!171 = !DILocation(line: 103, column: 22, scope: !168)
!172 = !DILocation(line: 103, column: 25, scope: !168)
!173 = !DILocation(line: 104, column: 13, scope: !168)
!174 = !DILocation(line: 101, column: 35, scope: !164)
!175 = !DILocation(line: 101, column: 13, scope: !164)
!176 = distinct !{!176, !166, !177, !65}
!177 = !DILocation(line: 104, column: 13, scope: !161)
!178 = !DILocation(line: 105, column: 26, scope: !158)
!179 = !DILocation(line: 105, column: 13, scope: !158)
!180 = !DILocation(line: 106, column: 18, scope: !158)
!181 = !DILocation(line: 106, column: 13, scope: !158)
!182 = !DILocation(line: 109, column: 1, scope: !139)
