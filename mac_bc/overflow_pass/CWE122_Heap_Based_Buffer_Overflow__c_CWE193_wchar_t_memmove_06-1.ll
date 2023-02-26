; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 40) #7, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06_bad.source to i8*), i64 44, i1 false), !dbg !42
  %3 = load i32*, i32** %data, align 8, !dbg !43
  %4 = bitcast i32* %3 to i8*, !dbg !43
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %5 = bitcast i32* %arraydecay to i8*, !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !43
  %add = add i64 %call2, 1, !dbg !43
  %mul = mul i64 %add, 4, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %7 = bitcast i32* %6 to i8*, !dbg !43
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !43
  %call3 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef %mul, i64 noundef %8) #9, !dbg !43
  %9 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* noundef %9), !dbg !45
  %10 = load i32*, i32** %data, align 8, !dbg !46
  %11 = bitcast i32* %10 to i8*, !dbg !46
  call void @free(i8* noundef %11), !dbg !47
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

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @wcslen(i32* noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  store i32* null, i32** %data, align 8, !dbg !76
  %call = call i8* @malloc(i64 noundef 44) #7, !dbg !77
  %0 = bitcast i8* %call to i32*, !dbg !80
  store i32* %0, i32** %data, align 8, !dbg !81
  %1 = load i32*, i32** %data, align 8, !dbg !82
  %cmp = icmp eq i32* %1, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !90
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %4 = bitcast i32* %3 to i8*, !dbg !91
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !91
  %5 = bitcast i32* %arraydecay to i8*, !dbg !91
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !91
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !91
  %add = add i64 %call2, 1, !dbg !91
  %mul = mul i64 %add, 4, !dbg !91
  %6 = load i32*, i32** %data, align 8, !dbg !91
  %7 = bitcast i32* %6 to i8*, !dbg !91
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !91
  %call3 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef %mul, i64 noundef %8) #9, !dbg !91
  %9 = load i32*, i32** %data, align 8, !dbg !92
  call void @printWLine(i32* noundef %9), !dbg !93
  %10 = load i32*, i32** %data, align 8, !dbg !94
  %11 = bitcast i32* %10 to i8*, !dbg !94
  call void @free(i8* noundef %11), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  store i32* null, i32** %data, align 8, !dbg !100
  %call = call i8* @malloc(i64 noundef 44) #7, !dbg !101
  %0 = bitcast i8* %call to i32*, !dbg !104
  store i32* %0, i32** %data, align 8, !dbg !105
  %1 = load i32*, i32** %data, align 8, !dbg !106
  %cmp = icmp eq i32* %1, null, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !114
  %3 = load i32*, i32** %data, align 8, !dbg !115
  %4 = bitcast i32* %3 to i8*, !dbg !115
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !115
  %5 = bitcast i32* %arraydecay to i8*, !dbg !115
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !115
  %call2 = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !115
  %add = add i64 %call2, 1, !dbg !115
  %mul = mul i64 %add, 4, !dbg !115
  %6 = load i32*, i32** %data, align 8, !dbg !115
  %7 = bitcast i32* %6 to i8*, !dbg !115
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !115
  %call3 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef %mul, i64 noundef %8) #9, !dbg !115
  %9 = load i32*, i32** %data, align 8, !dbg !116
  call void @printWLine(i32* noundef %9), !dbg !117
  %10 = load i32*, i32** %data, align 8, !dbg !118
  %11 = bitcast i32* %10 to i8*, !dbg !118
  call void @free(i8* noundef %11), !dbg !119
  ret void, !dbg !120
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06_bad", scope: !19, file: !19, line: 32, type: !20, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 34, type: !3)
!24 = !DILocation(line: 34, column: 15, scope: !18)
!25 = !DILocation(line: 35, column: 10, scope: !18)
!26 = !DILocation(line: 39, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 37, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 36, column: 8)
!29 = !DILocation(line: 39, column: 16, scope: !27)
!30 = !DILocation(line: 39, column: 14, scope: !27)
!31 = !DILocation(line: 40, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !19, line: 40, column: 13)
!33 = !DILocation(line: 40, column: 18, scope: !32)
!34 = !DILocation(line: 40, column: 13, scope: !27)
!35 = !DILocation(line: 40, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 40, column: 27)
!37 = !DILocalVariable(name: "source", scope: !38, file: !19, line: 43, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 42, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 43, column: 17, scope: !38)
!43 = !DILocation(line: 46, column: 9, scope: !38)
!44 = !DILocation(line: 47, column: 20, scope: !38)
!45 = !DILocation(line: 47, column: 9, scope: !38)
!46 = !DILocation(line: 48, column: 14, scope: !38)
!47 = !DILocation(line: 48, column: 9, scope: !38)
!48 = !DILocation(line: 50, column: 1, scope: !18)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_06_good", scope: !19, file: !19, line: 103, type: !20, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!50 = !DILocation(line: 105, column: 5, scope: !49)
!51 = !DILocation(line: 106, column: 5, scope: !49)
!52 = !DILocation(line: 107, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 119, type: !54, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!54 = !DISubroutineType(types: !55)
!55 = !{!8, !8, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !19, line: 119, type: !8)
!60 = !DILocation(line: 119, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !19, line: 119, type: !56)
!62 = !DILocation(line: 119, column: 27, scope: !53)
!63 = !DILocation(line: 122, column: 22, scope: !53)
!64 = !DILocation(line: 122, column: 12, scope: !53)
!65 = !DILocation(line: 122, column: 5, scope: !53)
!66 = !DILocation(line: 124, column: 5, scope: !53)
!67 = !DILocation(line: 125, column: 5, scope: !53)
!68 = !DILocation(line: 126, column: 5, scope: !53)
!69 = !DILocation(line: 129, column: 5, scope: !53)
!70 = !DILocation(line: 130, column: 5, scope: !53)
!71 = !DILocation(line: 131, column: 5, scope: !53)
!72 = !DILocation(line: 133, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!74 = !DILocalVariable(name: "data", scope: !73, file: !19, line: 59, type: !3)
!75 = !DILocation(line: 59, column: 15, scope: !73)
!76 = !DILocation(line: 60, column: 10, scope: !73)
!77 = !DILocation(line: 69, column: 27, scope: !78)
!78 = distinct !DILexicalBlock(scope: !79, file: !19, line: 67, column: 5)
!79 = distinct !DILexicalBlock(scope: !73, file: !19, line: 61, column: 8)
!80 = !DILocation(line: 69, column: 16, scope: !78)
!81 = !DILocation(line: 69, column: 14, scope: !78)
!82 = !DILocation(line: 70, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !19, line: 70, column: 13)
!84 = !DILocation(line: 70, column: 18, scope: !83)
!85 = !DILocation(line: 70, column: 13, scope: !78)
!86 = !DILocation(line: 70, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !19, line: 70, column: 27)
!88 = !DILocalVariable(name: "source", scope: !89, file: !19, line: 73, type: !39)
!89 = distinct !DILexicalBlock(scope: !73, file: !19, line: 72, column: 5)
!90 = !DILocation(line: 73, column: 17, scope: !89)
!91 = !DILocation(line: 76, column: 9, scope: !89)
!92 = !DILocation(line: 77, column: 20, scope: !89)
!93 = !DILocation(line: 77, column: 9, scope: !89)
!94 = !DILocation(line: 78, column: 14, scope: !89)
!95 = !DILocation(line: 78, column: 9, scope: !89)
!96 = !DILocation(line: 80, column: 1, scope: !73)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!98 = !DILocalVariable(name: "data", scope: !97, file: !19, line: 85, type: !3)
!99 = !DILocation(line: 85, column: 15, scope: !97)
!100 = !DILocation(line: 86, column: 10, scope: !97)
!101 = !DILocation(line: 90, column: 27, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !19, line: 88, column: 5)
!103 = distinct !DILexicalBlock(scope: !97, file: !19, line: 87, column: 8)
!104 = !DILocation(line: 90, column: 16, scope: !102)
!105 = !DILocation(line: 90, column: 14, scope: !102)
!106 = !DILocation(line: 91, column: 13, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !19, line: 91, column: 13)
!108 = !DILocation(line: 91, column: 18, scope: !107)
!109 = !DILocation(line: 91, column: 13, scope: !102)
!110 = !DILocation(line: 91, column: 28, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !19, line: 91, column: 27)
!112 = !DILocalVariable(name: "source", scope: !113, file: !19, line: 94, type: !39)
!113 = distinct !DILexicalBlock(scope: !97, file: !19, line: 93, column: 5)
!114 = !DILocation(line: 94, column: 17, scope: !113)
!115 = !DILocation(line: 97, column: 9, scope: !113)
!116 = !DILocation(line: 98, column: 20, scope: !113)
!117 = !DILocation(line: 98, column: 9, scope: !113)
!118 = !DILocation(line: 99, column: 14, scope: !113)
!119 = !DILocation(line: 99, column: 9, scope: !113)
!120 = !DILocation(line: 101, column: 1, scope: !97)
