; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01_bad.source to i8*), i64 44, i1 false), !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !42
  %call1 = call i32* @wcscpy(i32* noundef %3, i32* noundef %arraydecay), !dbg !43
  %4 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* noundef %4), !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !46
  %6 = bitcast i32* %5 to i8*, !dbg !46
  call void @free(i8* noundef %6), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare i32* @wcscpy(i32* noundef, i32* noundef) #5

declare void @printWLine(i32* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i32* null, i32** %data, align 8, !dbg !75
  %call = call i8* @malloc(i64 noundef 44) #6, !dbg !76
  %0 = bitcast i8* %call to i32*, !dbg !77
  store i32* %0, i32** %data, align 8, !dbg !78
  %1 = load i32*, i32** %data, align 8, !dbg !79
  %cmp = icmp eq i32* %1, null, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !83
  unreachable, !dbg !83

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !85, metadata !DIExpression()), !dbg !87
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !87
  %3 = load i32*, i32** %data, align 8, !dbg !88
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !89
  %call1 = call i32* @wcscpy(i32* noundef %3, i32* noundef %arraydecay), !dbg !90
  %4 = load i32*, i32** %data, align 8, !dbg !91
  call void @printWLine(i32* noundef %4), !dbg !92
  %5 = load i32*, i32** %data, align 8, !dbg !93
  %6 = bitcast i32* %5 to i8*, !dbg !93
  call void @free(i8* noundef %6), !dbg !94
  ret void, !dbg !95
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01_bad", scope: !19, file: !19, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 30, type: !3)
!24 = !DILocation(line: 30, column: 15, scope: !18)
!25 = !DILocation(line: 31, column: 10, scope: !18)
!26 = !DILocation(line: 33, column: 23, scope: !18)
!27 = !DILocation(line: 33, column: 12, scope: !18)
!28 = !DILocation(line: 33, column: 10, scope: !18)
!29 = !DILocation(line: 34, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 9)
!31 = !DILocation(line: 34, column: 14, scope: !30)
!32 = !DILocation(line: 34, column: 9, scope: !18)
!33 = !DILocation(line: 34, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 34, column: 23)
!35 = !DILocalVariable(name: "source", scope: !36, file: !19, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 36, column: 17, scope: !36)
!41 = !DILocation(line: 38, column: 16, scope: !36)
!42 = !DILocation(line: 38, column: 22, scope: !36)
!43 = !DILocation(line: 38, column: 9, scope: !36)
!44 = !DILocation(line: 39, column: 20, scope: !36)
!45 = !DILocation(line: 39, column: 9, scope: !36)
!46 = !DILocation(line: 40, column: 14, scope: !36)
!47 = !DILocation(line: 40, column: 9, scope: !36)
!48 = !DILocation(line: 42, column: 1, scope: !18)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_cpy_01_good", scope: !19, file: !19, line: 65, type: !20, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!50 = !DILocation(line: 67, column: 5, scope: !49)
!51 = !DILocation(line: 68, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 80, type: !53, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!53 = !DISubroutineType(types: !54)
!54 = !{!8, !8, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !19, line: 80, type: !8)
!59 = !DILocation(line: 80, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !19, line: 80, type: !55)
!61 = !DILocation(line: 80, column: 27, scope: !52)
!62 = !DILocation(line: 83, column: 22, scope: !52)
!63 = !DILocation(line: 83, column: 12, scope: !52)
!64 = !DILocation(line: 83, column: 5, scope: !52)
!65 = !DILocation(line: 85, column: 5, scope: !52)
!66 = !DILocation(line: 86, column: 5, scope: !52)
!67 = !DILocation(line: 87, column: 5, scope: !52)
!68 = !DILocation(line: 90, column: 5, scope: !52)
!69 = !DILocation(line: 91, column: 5, scope: !52)
!70 = !DILocation(line: 92, column: 5, scope: !52)
!71 = !DILocation(line: 94, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 49, type: !20, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!73 = !DILocalVariable(name: "data", scope: !72, file: !19, line: 51, type: !3)
!74 = !DILocation(line: 51, column: 15, scope: !72)
!75 = !DILocation(line: 52, column: 10, scope: !72)
!76 = !DILocation(line: 54, column: 23, scope: !72)
!77 = !DILocation(line: 54, column: 12, scope: !72)
!78 = !DILocation(line: 54, column: 10, scope: !72)
!79 = !DILocation(line: 55, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !19, line: 55, column: 9)
!81 = !DILocation(line: 55, column: 14, scope: !80)
!82 = !DILocation(line: 55, column: 9, scope: !72)
!83 = !DILocation(line: 55, column: 24, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !19, line: 55, column: 23)
!85 = !DILocalVariable(name: "source", scope: !86, file: !19, line: 57, type: !37)
!86 = distinct !DILexicalBlock(scope: !72, file: !19, line: 56, column: 5)
!87 = !DILocation(line: 57, column: 17, scope: !86)
!88 = !DILocation(line: 59, column: 16, scope: !86)
!89 = !DILocation(line: 59, column: 22, scope: !86)
!90 = !DILocation(line: 59, column: 9, scope: !86)
!91 = !DILocation(line: 60, column: 20, scope: !86)
!92 = !DILocation(line: 60, column: 9, scope: !86)
!93 = !DILocation(line: 61, column: 14, scope: !86)
!94 = !DILocation(line: 61, column: 9, scope: !86)
!95 = !DILocation(line: 63, column: 1, scope: !72)
