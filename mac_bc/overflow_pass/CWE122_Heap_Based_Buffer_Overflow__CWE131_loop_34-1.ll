; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion, metadata !21, metadata !DIExpression()), !dbg !27
  store i32* null, i32** %data, align 8, !dbg !28
  %call = call i8* @malloc(i64 noundef 10) #6, !dbg !29
  %0 = bitcast i8* %call to i32*, !dbg !30
  store i32* %0, i32** %data, align 8, !dbg !31
  %1 = load i32*, i32** %data, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !38
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !39
  store i32* %2, i32** %unionFirst, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !44
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !44
  store i32* %3, i32** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !61
  %cmp2 = icmp ult i64 %5, 10, !dbg !63
  br i1 %cmp2, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !67
  %7 = load i32, i32* %arrayidx, align 4, !dbg !67
  %8 = load i32*, i32** %data1, align 8, !dbg !68
  %9 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !68
  store i32 %7, i32* %arrayidx3, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %10, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !77
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !77
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !77
  call void @printIntLine(i32 noundef %12), !dbg !78
  %13 = load i32*, i32** %data1, align 8, !dbg !79
  %14 = bitcast i32* %13 to i8*, !dbg !79
  call void @free(i8* noundef %14), !dbg !80
  ret void, !dbg !81
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
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion, metadata !108, metadata !DIExpression()), !dbg !109
  store i32* null, i32** %data, align 8, !dbg !110
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !111
  %0 = bitcast i8* %call to i32*, !dbg !112
  store i32* %0, i32** %data, align 8, !dbg !113
  %1 = load i32*, i32** %data, align 8, !dbg !114
  %cmp = icmp eq i32* %1, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !120
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !121
  store i32* %2, i32** %unionFirst, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType* %myUnion to i32**, !dbg !126
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !126
  store i32* %3, i32** %data1, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  %4 = bitcast [10 x i32]* %source to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !135
  %cmp2 = icmp ult i64 %5, 10, !dbg !137
  br i1 %cmp2, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 %6, !dbg !141
  %7 = load i32, i32* %arrayidx, align 4, !dbg !141
  %8 = load i32*, i32** %data1, align 8, !dbg !142
  %9 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !142
  store i32 %7, i32* %arrayidx3, align 4, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %10, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i64 0, !dbg !150
  %12 = load i32, i32* %arrayidx4, align 4, !dbg !150
  call void @printIntLine(i32 noundef %12), !dbg !151
  %13 = load i32*, i32** %data1, align 8, !dbg !152
  %14 = bitcast i32* %13 to i8*, !dbg !152
  call void @free(i8* noundef %14), !dbg !153
  ret void, !dbg !154
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_bad", scope: !15, file: !15, line: 27, type: !16, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 29, type: !3)
!20 = !DILocation(line: 29, column: 11, scope: !14)
!21 = !DILocalVariable(name: "myUnion", scope: !14, file: !15, line: 30, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_unionType", file: !15, line: 23, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !15, line: 19, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !23, file: !15, line: 21, baseType: !3, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !23, file: !15, line: 22, baseType: !3, size: 64)
!27 = !DILocation(line: 30, column: 65, scope: !14)
!28 = !DILocation(line: 31, column: 10, scope: !14)
!29 = !DILocation(line: 33, column: 19, scope: !14)
!30 = !DILocation(line: 33, column: 12, scope: !14)
!31 = !DILocation(line: 33, column: 10, scope: !14)
!32 = !DILocation(line: 34, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!34 = !DILocation(line: 34, column: 14, scope: !33)
!35 = !DILocation(line: 34, column: 9, scope: !14)
!36 = !DILocation(line: 34, column: 24, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !15, line: 34, column: 23)
!38 = !DILocation(line: 35, column: 26, scope: !14)
!39 = !DILocation(line: 35, column: 13, scope: !14)
!40 = !DILocation(line: 35, column: 24, scope: !14)
!41 = !DILocalVariable(name: "data", scope: !42, file: !15, line: 37, type: !3)
!42 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 5)
!43 = !DILocation(line: 37, column: 15, scope: !42)
!44 = !DILocation(line: 37, column: 30, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !15, line: 39, type: !47)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 38, column: 9)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 10)
!50 = !DILocation(line: 39, column: 17, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !46, file: !15, line: 40, type: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 31, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !55, line: 94, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!56 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 40, column: 20, scope: !46)
!58 = !DILocation(line: 42, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !46, file: !15, line: 42, column: 13)
!60 = !DILocation(line: 42, column: 18, scope: !59)
!61 = !DILocation(line: 42, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !15, line: 42, column: 13)
!63 = !DILocation(line: 42, column: 27, scope: !62)
!64 = !DILocation(line: 42, column: 13, scope: !59)
!65 = !DILocation(line: 44, column: 34, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !15, line: 43, column: 13)
!67 = !DILocation(line: 44, column: 27, scope: !66)
!68 = !DILocation(line: 44, column: 17, scope: !66)
!69 = !DILocation(line: 44, column: 22, scope: !66)
!70 = !DILocation(line: 44, column: 25, scope: !66)
!71 = !DILocation(line: 45, column: 13, scope: !66)
!72 = !DILocation(line: 42, column: 34, scope: !62)
!73 = !DILocation(line: 42, column: 13, scope: !62)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 45, column: 13, scope: !59)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 46, column: 26, scope: !46)
!78 = !DILocation(line: 46, column: 13, scope: !46)
!79 = !DILocation(line: 47, column: 18, scope: !46)
!80 = !DILocation(line: 47, column: 13, scope: !46)
!81 = !DILocation(line: 50, column: 1, scope: !14)
!82 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_loop_34_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!83 = !DILocation(line: 84, column: 5, scope: !82)
!84 = !DILocation(line: 85, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !86, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!86 = !DISubroutineType(types: !87)
!87 = !{!4, !4, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !15, line: 96, type: !4)
!92 = !DILocation(line: 96, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !15, line: 96, type: !88)
!94 = !DILocation(line: 96, column: 27, scope: !85)
!95 = !DILocation(line: 99, column: 22, scope: !85)
!96 = !DILocation(line: 99, column: 12, scope: !85)
!97 = !DILocation(line: 99, column: 5, scope: !85)
!98 = !DILocation(line: 101, column: 5, scope: !85)
!99 = !DILocation(line: 102, column: 5, scope: !85)
!100 = !DILocation(line: 103, column: 5, scope: !85)
!101 = !DILocation(line: 106, column: 5, scope: !85)
!102 = !DILocation(line: 107, column: 5, scope: !85)
!103 = !DILocation(line: 108, column: 5, scope: !85)
!104 = !DILocation(line: 110, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 57, type: !16, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!106 = !DILocalVariable(name: "data", scope: !105, file: !15, line: 59, type: !3)
!107 = !DILocation(line: 59, column: 11, scope: !105)
!108 = !DILocalVariable(name: "myUnion", scope: !105, file: !15, line: 60, type: !22)
!109 = !DILocation(line: 60, column: 65, scope: !105)
!110 = !DILocation(line: 61, column: 10, scope: !105)
!111 = !DILocation(line: 63, column: 19, scope: !105)
!112 = !DILocation(line: 63, column: 12, scope: !105)
!113 = !DILocation(line: 63, column: 10, scope: !105)
!114 = !DILocation(line: 64, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !105, file: !15, line: 64, column: 9)
!116 = !DILocation(line: 64, column: 14, scope: !115)
!117 = !DILocation(line: 64, column: 9, scope: !105)
!118 = !DILocation(line: 64, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !15, line: 64, column: 23)
!120 = !DILocation(line: 65, column: 26, scope: !105)
!121 = !DILocation(line: 65, column: 13, scope: !105)
!122 = !DILocation(line: 65, column: 24, scope: !105)
!123 = !DILocalVariable(name: "data", scope: !124, file: !15, line: 67, type: !3)
!124 = distinct !DILexicalBlock(scope: !105, file: !15, line: 66, column: 5)
!125 = !DILocation(line: 67, column: 15, scope: !124)
!126 = !DILocation(line: 67, column: 30, scope: !124)
!127 = !DILocalVariable(name: "source", scope: !128, file: !15, line: 69, type: !47)
!128 = distinct !DILexicalBlock(scope: !124, file: !15, line: 68, column: 9)
!129 = !DILocation(line: 69, column: 17, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !128, file: !15, line: 70, type: !52)
!131 = !DILocation(line: 70, column: 20, scope: !128)
!132 = !DILocation(line: 72, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !128, file: !15, line: 72, column: 13)
!134 = !DILocation(line: 72, column: 18, scope: !133)
!135 = !DILocation(line: 72, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 72, column: 13)
!137 = !DILocation(line: 72, column: 27, scope: !136)
!138 = !DILocation(line: 72, column: 13, scope: !133)
!139 = !DILocation(line: 74, column: 34, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 73, column: 13)
!141 = !DILocation(line: 74, column: 27, scope: !140)
!142 = !DILocation(line: 74, column: 17, scope: !140)
!143 = !DILocation(line: 74, column: 22, scope: !140)
!144 = !DILocation(line: 74, column: 25, scope: !140)
!145 = !DILocation(line: 75, column: 13, scope: !140)
!146 = !DILocation(line: 72, column: 34, scope: !136)
!147 = !DILocation(line: 72, column: 13, scope: !136)
!148 = distinct !{!148, !138, !149, !76}
!149 = !DILocation(line: 75, column: 13, scope: !133)
!150 = !DILocation(line: 76, column: 26, scope: !128)
!151 = !DILocation(line: 76, column: 13, scope: !128)
!152 = !DILocation(line: 77, column: 18, scope: !128)
!153 = !DILocation(line: 77, column: 13, scope: !128)
!154 = !DILocation(line: 80, column: 1, scope: !105)
