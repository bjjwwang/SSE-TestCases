; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  br label %while.body, !dbg !22

while.body:                                       ; preds = %entry
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !23
  %0 = bitcast i8* %call to i32*, !dbg !25
  store i32* %0, i32** %data, align 8, !dbg !26
  %1 = load i32*, i32** %data, align 8, !dbg !27
  %cmp = icmp eq i32* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %while.body
  call void @exit(i32 noundef -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !33

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %4 = bitcast i32* %3 to i8*, !dbg !40
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !40
  %5 = bitcast i32* %arraydecay to i8*, !dbg !40
  %6 = load i32*, i32** %data, align 8, !dbg !40
  %7 = bitcast i32* %6 to i8*, !dbg !40
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !40
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 40, i64 noundef %8) #9, !dbg !40
  %9 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !41
  %10 = load i32, i32* %arrayidx, align 4, !dbg !41
  call void @printIntLine(i32 noundef %10), !dbg !42
  %11 = load i32*, i32** %data, align 8, !dbg !43
  %12 = bitcast i32* %11 to i8*, !dbg !43
  call void @free(i8* noundef %12), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i32* null, i32** %data, align 8, !dbg !72
  br label %while.body, !dbg !73

while.body:                                       ; preds = %entry
  %call = call i8* @malloc(i64 noundef 40) #7, !dbg !74
  %0 = bitcast i8* %call to i32*, !dbg !76
  store i32* %0, i32** %data, align 8, !dbg !77
  %1 = load i32*, i32** %data, align 8, !dbg !78
  %cmp = icmp eq i32* %1, null, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %while.body
  call void @exit(i32 noundef -1) #8, !dbg !82
  unreachable, !dbg !82

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !84

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [10 x i32]* %source to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %4 = bitcast i32* %3 to i8*, !dbg !88
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %source, i64 0, i64 0, !dbg !88
  %5 = bitcast i32* %arraydecay to i8*, !dbg !88
  %6 = load i32*, i32** %data, align 8, !dbg !88
  %7 = bitcast i32* %6 to i8*, !dbg !88
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !88
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 40, i64 noundef %8) #9, !dbg !88
  %9 = load i32*, i32** %data, align 8, !dbg !89
  %arrayidx = getelementptr inbounds i32, i32* %9, i64 0, !dbg !89
  %10 = load i32, i32* %arrayidx, align 4, !dbg !89
  call void @printIntLine(i32 noundef %10), !dbg !90
  %11 = load i32*, i32** %data, align 8, !dbg !91
  %12 = bitcast i32* %11 to i8*, !dbg !91
  call void @free(i8* noundef %12), !dbg !92
  ret void, !dbg !93
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 11, scope: !14)
!21 = !DILocation(line: 24, column: 10, scope: !14)
!22 = !DILocation(line: 25, column: 5, scope: !14)
!23 = !DILocation(line: 28, column: 23, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 26, column: 5)
!25 = !DILocation(line: 28, column: 16, scope: !24)
!26 = !DILocation(line: 28, column: 14, scope: !24)
!27 = !DILocation(line: 29, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 29, column: 13)
!29 = !DILocation(line: 29, column: 18, scope: !28)
!30 = !DILocation(line: 29, column: 13, scope: !24)
!31 = !DILocation(line: 29, column: 28, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 29, column: 27)
!33 = !DILocation(line: 30, column: 9, scope: !24)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 33, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 32, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 10)
!39 = !DILocation(line: 33, column: 13, scope: !35)
!40 = !DILocation(line: 35, column: 9, scope: !35)
!41 = !DILocation(line: 36, column: 22, scope: !35)
!42 = !DILocation(line: 36, column: 9, scope: !35)
!43 = !DILocation(line: 37, column: 14, scope: !35)
!44 = !DILocation(line: 37, column: 9, scope: !35)
!45 = !DILocation(line: 39, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__CWE131_memcpy_16_good", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!47 = !DILocation(line: 68, column: 5, scope: !46)
!48 = !DILocation(line: 69, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 81, type: !50, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!50 = !DISubroutineType(types: !51)
!51 = !{!4, !4, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !15, line: 81, type: !4)
!56 = !DILocation(line: 81, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !15, line: 81, type: !52)
!58 = !DILocation(line: 81, column: 27, scope: !49)
!59 = !DILocation(line: 84, column: 22, scope: !49)
!60 = !DILocation(line: 84, column: 12, scope: !49)
!61 = !DILocation(line: 84, column: 5, scope: !49)
!62 = !DILocation(line: 86, column: 5, scope: !49)
!63 = !DILocation(line: 87, column: 5, scope: !49)
!64 = !DILocation(line: 88, column: 5, scope: !49)
!65 = !DILocation(line: 91, column: 5, scope: !49)
!66 = !DILocation(line: 92, column: 5, scope: !49)
!67 = !DILocation(line: 93, column: 5, scope: !49)
!68 = !DILocation(line: 95, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 46, type: !16, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!70 = !DILocalVariable(name: "data", scope: !69, file: !15, line: 48, type: !3)
!71 = !DILocation(line: 48, column: 11, scope: !69)
!72 = !DILocation(line: 49, column: 10, scope: !69)
!73 = !DILocation(line: 50, column: 5, scope: !69)
!74 = !DILocation(line: 53, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !15, line: 51, column: 5)
!76 = !DILocation(line: 53, column: 16, scope: !75)
!77 = !DILocation(line: 53, column: 14, scope: !75)
!78 = !DILocation(line: 54, column: 13, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !15, line: 54, column: 13)
!80 = !DILocation(line: 54, column: 18, scope: !79)
!81 = !DILocation(line: 54, column: 13, scope: !75)
!82 = !DILocation(line: 54, column: 28, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 54, column: 27)
!84 = !DILocation(line: 55, column: 9, scope: !75)
!85 = !DILocalVariable(name: "source", scope: !86, file: !15, line: 58, type: !36)
!86 = distinct !DILexicalBlock(scope: !69, file: !15, line: 57, column: 5)
!87 = !DILocation(line: 58, column: 13, scope: !86)
!88 = !DILocation(line: 60, column: 9, scope: !86)
!89 = !DILocation(line: 61, column: 22, scope: !86)
!90 = !DILocation(line: 61, column: 9, scope: !86)
!91 = !DILocation(line: 62, column: 14, scope: !86)
!92 = !DILocation(line: 62, column: 9, scope: !86)
!93 = !DILocation(line: 64, column: 1, scope: !69)
