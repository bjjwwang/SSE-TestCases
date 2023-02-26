; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i32* null, i32** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 200) #7, !dbg !22
  %0 = bitcast i8* %call to i32*, !dbg !23
  store i32* %0, i32** %data, align 8, !dbg !24
  %1 = load i32*, i32** %data, align 8, !dbg !25
  %cmp = icmp eq i32* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !29
  unreachable, !dbg !29

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !31, metadata !DIExpression()), !dbg !33
  %2 = load i32*, i32** %data, align 8, !dbg !34
  store i32* %2, i32** %dataCopy, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !35, metadata !DIExpression()), !dbg !36
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !37
  store i32* %3, i32** %data1, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !43
  %5 = load i32*, i32** %data1, align 8, !dbg !44
  %6 = bitcast i32* %5 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %7 = bitcast i32* %arraydecay to i8*, !dbg !44
  %8 = load i32*, i32** %data1, align 8, !dbg !44
  %9 = bitcast i32* %8 to i8*, !dbg !44
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !44
  %call2 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %7, i64 noundef 400, i64 noundef %10) #9, !dbg !44
  %11 = load i32*, i32** %data1, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 0, !dbg !45
  %12 = load i32, i32* %arrayidx, align 4, !dbg !45
  call void @printIntLine(i32 noundef %12), !dbg !46
  %13 = load i32*, i32** %data1, align 8, !dbg !47
  %14 = bitcast i32* %13 to i8*, !dbg !47
  call void @free(i8* noundef %14), !dbg !48
  ret void, !dbg !49
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !77
  %0 = bitcast i8* %call to i32*, !dbg !78
  store i32* %0, i32** %data, align 8, !dbg !79
  %1 = load i32*, i32** %data, align 8, !dbg !80
  %cmp = icmp eq i32* %1, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !86, metadata !DIExpression()), !dbg !88
  %2 = load i32*, i32** %data, align 8, !dbg !89
  store i32* %2, i32** %dataCopy, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !90, metadata !DIExpression()), !dbg !91
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !92
  store i32* %3, i32** %data1, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %4 = bitcast [100 x i32]* %source to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 400, i1 false), !dbg !95
  %5 = load i32*, i32** %data1, align 8, !dbg !96
  %6 = bitcast i32* %5 to i8*, !dbg !96
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !96
  %7 = bitcast i32* %arraydecay to i8*, !dbg !96
  %8 = load i32*, i32** %data1, align 8, !dbg !96
  %9 = bitcast i32* %8 to i8*, !dbg !96
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !96
  %call2 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %7, i64 noundef 400, i64 noundef %10) #9, !dbg !96
  %11 = load i32*, i32** %data1, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %11, i64 0, !dbg !97
  %12 = load i32, i32* %arrayidx, align 4, !dbg !97
  call void @printIntLine(i32 noundef %12), !dbg !98
  %13 = load i32*, i32** %data1, align 8, !dbg !99
  %14 = bitcast i32* %13 to i8*, !dbg !99
  call void @free(i8* noundef %14), !dbg !100
  ret void, !dbg !101
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31_bad", scope: !15, file: !15, line: 21, type: !16, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 11, scope: !14)
!21 = !DILocation(line: 24, column: 10, scope: !14)
!22 = !DILocation(line: 26, column: 19, scope: !14)
!23 = !DILocation(line: 26, column: 12, scope: !14)
!24 = !DILocation(line: 26, column: 10, scope: !14)
!25 = !DILocation(line: 27, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!27 = !DILocation(line: 27, column: 14, scope: !26)
!28 = !DILocation(line: 27, column: 9, scope: !14)
!29 = !DILocation(line: 27, column: 24, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !15, line: 27, column: 23)
!31 = !DILocalVariable(name: "dataCopy", scope: !32, file: !15, line: 29, type: !3)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 5)
!33 = !DILocation(line: 29, column: 15, scope: !32)
!34 = !DILocation(line: 29, column: 26, scope: !32)
!35 = !DILocalVariable(name: "data", scope: !32, file: !15, line: 30, type: !3)
!36 = !DILocation(line: 30, column: 15, scope: !32)
!37 = !DILocation(line: 30, column: 22, scope: !32)
!38 = !DILocalVariable(name: "source", scope: !39, file: !15, line: 32, type: !40)
!39 = distinct !DILexicalBlock(scope: !32, file: !15, line: 31, column: 9)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 32, column: 17, scope: !39)
!44 = !DILocation(line: 34, column: 13, scope: !39)
!45 = !DILocation(line: 35, column: 26, scope: !39)
!46 = !DILocation(line: 35, column: 13, scope: !39)
!47 = !DILocation(line: 36, column: 18, scope: !39)
!48 = !DILocation(line: 36, column: 13, scope: !39)
!49 = !DILocation(line: 39, column: 1, scope: !14)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_31_good", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!51 = !DILocation(line: 68, column: 5, scope: !50)
!52 = !DILocation(line: 69, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 80, type: !54, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!54 = !DISubroutineType(types: !55)
!55 = !{!4, !4, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 80, type: !4)
!60 = !DILocation(line: 80, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 80, type: !56)
!62 = !DILocation(line: 80, column: 27, scope: !53)
!63 = !DILocation(line: 83, column: 22, scope: !53)
!64 = !DILocation(line: 83, column: 12, scope: !53)
!65 = !DILocation(line: 83, column: 5, scope: !53)
!66 = !DILocation(line: 85, column: 5, scope: !53)
!67 = !DILocation(line: 86, column: 5, scope: !53)
!68 = !DILocation(line: 87, column: 5, scope: !53)
!69 = !DILocation(line: 90, column: 5, scope: !53)
!70 = !DILocation(line: 91, column: 5, scope: !53)
!71 = !DILocation(line: 92, column: 5, scope: !53)
!72 = !DILocation(line: 94, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 46, type: !16, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!74 = !DILocalVariable(name: "data", scope: !73, file: !15, line: 48, type: !3)
!75 = !DILocation(line: 48, column: 11, scope: !73)
!76 = !DILocation(line: 49, column: 10, scope: !73)
!77 = !DILocation(line: 51, column: 19, scope: !73)
!78 = !DILocation(line: 51, column: 12, scope: !73)
!79 = !DILocation(line: 51, column: 10, scope: !73)
!80 = !DILocation(line: 52, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !15, line: 52, column: 9)
!82 = !DILocation(line: 52, column: 14, scope: !81)
!83 = !DILocation(line: 52, column: 9, scope: !73)
!84 = !DILocation(line: 52, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 52, column: 23)
!86 = !DILocalVariable(name: "dataCopy", scope: !87, file: !15, line: 54, type: !3)
!87 = distinct !DILexicalBlock(scope: !73, file: !15, line: 53, column: 5)
!88 = !DILocation(line: 54, column: 15, scope: !87)
!89 = !DILocation(line: 54, column: 26, scope: !87)
!90 = !DILocalVariable(name: "data", scope: !87, file: !15, line: 55, type: !3)
!91 = !DILocation(line: 55, column: 15, scope: !87)
!92 = !DILocation(line: 55, column: 22, scope: !87)
!93 = !DILocalVariable(name: "source", scope: !94, file: !15, line: 57, type: !40)
!94 = distinct !DILexicalBlock(scope: !87, file: !15, line: 56, column: 9)
!95 = !DILocation(line: 57, column: 17, scope: !94)
!96 = !DILocation(line: 59, column: 13, scope: !94)
!97 = !DILocation(line: 60, column: 26, scope: !94)
!98 = !DILocation(line: 60, column: 13, scope: !94)
!99 = !DILocation(line: 61, column: 18, scope: !94)
!100 = !DILocation(line: 61, column: 13, scope: !94)
!101 = !DILocation(line: 64, column: 1, scope: !73)
