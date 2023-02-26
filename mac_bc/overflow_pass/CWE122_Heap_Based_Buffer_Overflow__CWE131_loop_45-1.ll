; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !10

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %call = call i8* @malloc(i64 noundef 10) #6, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !36
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_badData, align 8, !dbg !37
  call void @badSink(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* noundef null), !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 noundef %conv), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_good(), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_bad(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !63 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_badData, align 8, !dbg !66
  store i32* %0, i32** %data, align 8, !dbg !65
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !67, metadata !DIExpression()), !dbg !72
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !72
  call void @llvm.dbg.declare(metadata i64* %i, metadata !73, metadata !DIExpression()), !dbg !79
  store i64 0, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !82

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !83
  %cmp = icmp ult i64 %2, 10, !dbg !85
  br i1 %cmp, label %for.body, label %for.end, !dbg !86

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !87
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !89
  %4 = load i32, i32* %arrayidx, align 4, !dbg !89
  %5 = load i32*, i32** %data, align 8, !dbg !90
  %6 = load i64, i64* %i, align 8, !dbg !91
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !90
  store i32 %4, i32* %arrayidx1, align 4, !dbg !92
  br label %for.inc, !dbg !93

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !94
  %inc = add i64 %7, 1, !dbg !94
  store i64 %inc, i64* %i, align 8, !dbg !94
  br label %for.cond, !dbg !95, !llvm.loop !96

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !99
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !99
  call void @printIntLine(i32 noundef %9), !dbg !100
  %10 = load i32*, i32** %data, align 8, !dbg !101
  %11 = bitcast i32* %10 to i8*, !dbg !101
  call void @free(i8* noundef %11), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare void @printIntLine(i32 noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* null, i32** %data, align 8, !dbg !107
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !108
  %0 = bitcast i8* %call to i32*, !dbg !109
  store i32* %0, i32** %data, align 8, !dbg !110
  %1 = load i32*, i32** %data, align 8, !dbg !111
  %cmp = icmp eq i32* %1, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !117
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData, align 8, !dbg !118
  call void @goodG2BSink(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData, align 8, !dbg !124
  store i32* %0, i32** %data, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  %1 = bitcast [10 x i32]* %source to i8*, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %2, 10, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %3, !dbg !139
  %4 = load i32, i32* %arrayidx, align 4, !dbg !139
  %5 = load i32*, i32** %data, align 8, !dbg !140
  %6 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx1 = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !140
  store i32 %4, i32* %arrayidx1, align 4, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %7, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !148
  %arrayidx2 = getelementptr inbounds i32, i32* %8, i64 0, !dbg !148
  %9 = load i32, i32* %arrayidx2, align 4, !dbg !148
  call void @printIntLine(i32 noundef %9), !dbg !149
  %10 = load i32*, i32** %data, align 8, !dbg !150
  %11 = bitcast i32* %10 to i8*, !dbg !150
  call void @free(i8* noundef %11), !dbg !151
  ret void, !dbg !152
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_badData", scope: !2, file: !12, line: 19, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_goodG2BData", scope: !2, file: !12, line: 20, type: !5, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_bad", scope: !12, file: !12, line: 40, type: !21, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 42, type: !5)
!25 = !DILocation(line: 42, column: 11, scope: !20)
!26 = !DILocation(line: 43, column: 10, scope: !20)
!27 = !DILocation(line: 45, column: 19, scope: !20)
!28 = !DILocation(line: 45, column: 12, scope: !20)
!29 = !DILocation(line: 45, column: 10, scope: !20)
!30 = !DILocation(line: 46, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !20, file: !12, line: 46, column: 9)
!32 = !DILocation(line: 46, column: 14, scope: !31)
!33 = !DILocation(line: 46, column: 9, scope: !20)
!34 = !DILocation(line: 46, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 46, column: 23)
!36 = !DILocation(line: 47, column: 65, scope: !20)
!37 = !DILocation(line: 47, column: 63, scope: !20)
!38 = !DILocation(line: 48, column: 5, scope: !20)
!39 = !DILocation(line: 49, column: 1, scope: !20)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_45_good", scope: !12, file: !12, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!41 = !DILocation(line: 85, column: 5, scope: !40)
!42 = !DILocation(line: 86, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !44, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!44 = !DISubroutineType(types: !45)
!45 = !{!6, !6, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !12, line: 97, type: !6)
!50 = !DILocation(line: 97, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !12, line: 97, type: !46)
!52 = !DILocation(line: 97, column: 27, scope: !43)
!53 = !DILocation(line: 100, column: 22, scope: !43)
!54 = !DILocation(line: 100, column: 12, scope: !43)
!55 = !DILocation(line: 100, column: 5, scope: !43)
!56 = !DILocation(line: 102, column: 5, scope: !43)
!57 = !DILocation(line: 103, column: 5, scope: !43)
!58 = !DILocation(line: 104, column: 5, scope: !43)
!59 = !DILocation(line: 107, column: 5, scope: !43)
!60 = !DILocation(line: 108, column: 5, scope: !43)
!61 = !DILocation(line: 109, column: 5, scope: !43)
!62 = !DILocation(line: 111, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!64 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 26, type: !5)
!65 = !DILocation(line: 26, column: 11, scope: !63)
!66 = !DILocation(line: 26, column: 18, scope: !63)
!67 = !DILocalVariable(name: "source", scope: !68, file: !12, line: 28, type: !69)
!68 = distinct !DILexicalBlock(scope: !63, file: !12, line: 27, column: 5)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 320, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 10)
!72 = !DILocation(line: 28, column: 13, scope: !68)
!73 = !DILocalVariable(name: "i", scope: !68, file: !12, line: 29, type: !74)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !75, line: 31, baseType: !76)
!75 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !77, line: 94, baseType: !78)
!77 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!78 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!79 = !DILocation(line: 29, column: 16, scope: !68)
!80 = !DILocation(line: 31, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !68, file: !12, line: 31, column: 9)
!82 = !DILocation(line: 31, column: 14, scope: !81)
!83 = !DILocation(line: 31, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !12, line: 31, column: 9)
!85 = !DILocation(line: 31, column: 23, scope: !84)
!86 = !DILocation(line: 31, column: 9, scope: !81)
!87 = !DILocation(line: 33, column: 30, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !12, line: 32, column: 9)
!89 = !DILocation(line: 33, column: 23, scope: !88)
!90 = !DILocation(line: 33, column: 13, scope: !88)
!91 = !DILocation(line: 33, column: 18, scope: !88)
!92 = !DILocation(line: 33, column: 21, scope: !88)
!93 = !DILocation(line: 34, column: 9, scope: !88)
!94 = !DILocation(line: 31, column: 30, scope: !84)
!95 = !DILocation(line: 31, column: 9, scope: !84)
!96 = distinct !{!96, !86, !97, !98}
!97 = !DILocation(line: 34, column: 9, scope: !81)
!98 = !{!"llvm.loop.mustprogress"}
!99 = !DILocation(line: 35, column: 22, scope: !68)
!100 = !DILocation(line: 35, column: 9, scope: !68)
!101 = !DILocation(line: 36, column: 14, scope: !68)
!102 = !DILocation(line: 36, column: 9, scope: !68)
!103 = !DILocation(line: 38, column: 1, scope: !63)
!104 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 72, type: !21, scopeLine: 73, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 74, type: !5)
!106 = !DILocation(line: 74, column: 11, scope: !104)
!107 = !DILocation(line: 75, column: 10, scope: !104)
!108 = !DILocation(line: 77, column: 19, scope: !104)
!109 = !DILocation(line: 77, column: 12, scope: !104)
!110 = !DILocation(line: 77, column: 10, scope: !104)
!111 = !DILocation(line: 78, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 78, column: 9)
!113 = !DILocation(line: 78, column: 14, scope: !112)
!114 = !DILocation(line: 78, column: 9, scope: !104)
!115 = !DILocation(line: 78, column: 24, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !12, line: 78, column: 23)
!117 = !DILocation(line: 79, column: 69, scope: !104)
!118 = !DILocation(line: 79, column: 67, scope: !104)
!119 = !DILocation(line: 80, column: 5, scope: !104)
!120 = !DILocation(line: 81, column: 1, scope: !104)
!121 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 56, type: !21, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!122 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 58, type: !5)
!123 = !DILocation(line: 58, column: 11, scope: !121)
!124 = !DILocation(line: 58, column: 18, scope: !121)
!125 = !DILocalVariable(name: "source", scope: !126, file: !12, line: 60, type: !69)
!126 = distinct !DILexicalBlock(scope: !121, file: !12, line: 59, column: 5)
!127 = !DILocation(line: 60, column: 13, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 61, type: !74)
!129 = !DILocation(line: 61, column: 16, scope: !126)
!130 = !DILocation(line: 63, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !126, file: !12, line: 63, column: 9)
!132 = !DILocation(line: 63, column: 14, scope: !131)
!133 = !DILocation(line: 63, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 63, column: 9)
!135 = !DILocation(line: 63, column: 23, scope: !134)
!136 = !DILocation(line: 63, column: 9, scope: !131)
!137 = !DILocation(line: 65, column: 30, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 64, column: 9)
!139 = !DILocation(line: 65, column: 23, scope: !138)
!140 = !DILocation(line: 65, column: 13, scope: !138)
!141 = !DILocation(line: 65, column: 18, scope: !138)
!142 = !DILocation(line: 65, column: 21, scope: !138)
!143 = !DILocation(line: 66, column: 9, scope: !138)
!144 = !DILocation(line: 63, column: 30, scope: !134)
!145 = !DILocation(line: 63, column: 9, scope: !134)
!146 = distinct !{!146, !136, !147, !98}
!147 = !DILocation(line: 66, column: 9, scope: !131)
!148 = !DILocation(line: 67, column: 22, scope: !126)
!149 = !DILocation(line: 67, column: 9, scope: !126)
!150 = !DILocation(line: 68, column: 14, scope: !126)
!151 = !DILocation(line: 68, column: 9, scope: !126)
!152 = !DILocation(line: 70, column: 1, scope: !121)
