; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 40) #7, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !35, metadata !DIExpression()), !dbg !37
  %2 = load i32*, i32** %data, align 8, !dbg !38
  store i32* %2, i32** %dataCopy, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !40
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !41
  store i32* %3, i32** %data1, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !47
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad.source to i8*), i64 44, i1 false), !dbg !47
  %5 = load i32*, i32** %data1, align 8, !dbg !48
  %6 = bitcast i32* %5 to i8*, !dbg !48
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %7 = bitcast i32* %arraydecay to i8*, !dbg !48
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !48
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !48
  %add = add i64 %call3, 1, !dbg !48
  %mul = mul i64 %add, 4, !dbg !48
  %8 = load i32*, i32** %data1, align 8, !dbg !48
  %9 = bitcast i32* %8 to i8*, !dbg !48
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !48
  %call4 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %7, i64 noundef %mul, i64 noundef %10) #9, !dbg !48
  %11 = load i32*, i32** %data1, align 8, !dbg !49
  call void @printWLine(i32* noundef %11), !dbg !50
  %12 = load i32*, i32** %data1, align 8, !dbg !51
  %13 = bitcast i32* %12 to i8*, !dbg !51
  call void @free(i8* noundef %13), !dbg !52
  ret void, !dbg !53
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !57 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* noundef null), !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 noundef %conv), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i32* null, i32** %data, align 8, !dbg !80
  %call = call i8* @malloc(i64 noundef 44) #7, !dbg !81
  %0 = bitcast i8* %call to i32*, !dbg !82
  store i32* %0, i32** %data, align 8, !dbg !83
  %1 = load i32*, i32** %data, align 8, !dbg !84
  %cmp = icmp eq i32* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !90, metadata !DIExpression()), !dbg !92
  %2 = load i32*, i32** %data, align 8, !dbg !93
  store i32* %2, i32** %dataCopy, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !94, metadata !DIExpression()), !dbg !95
  %3 = load i32*, i32** %dataCopy, align 8, !dbg !96
  store i32* %3, i32** %data1, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %4 = bitcast [11 x i32]* %source to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %4, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !99
  %5 = load i32*, i32** %data1, align 8, !dbg !100
  %6 = bitcast i32* %5 to i8*, !dbg !100
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !100
  %7 = bitcast i32* %arraydecay to i8*, !dbg !100
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !100
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !100
  %add = add i64 %call3, 1, !dbg !100
  %mul = mul i64 %add, 4, !dbg !100
  %8 = load i32*, i32** %data1, align 8, !dbg !100
  %9 = bitcast i32* %8 to i8*, !dbg !100
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !100
  %call4 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %7, i64 noundef %mul, i64 noundef %10) #9, !dbg !100
  %11 = load i32*, i32** %data1, align 8, !dbg !101
  call void @printWLine(i32* noundef %11), !dbg !102
  %12 = load i32*, i32** %data1, align 8, !dbg !103
  %13 = bitcast i32* %12 to i8*, !dbg !103
  call void @free(i8* noundef %13), !dbg !104
  ret void, !dbg !105
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_bad", scope: !19, file: !19, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!35 = !DILocalVariable(name: "dataCopy", scope: !36, file: !19, line: 36, type: !3)
!36 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!37 = !DILocation(line: 36, column: 19, scope: !36)
!38 = !DILocation(line: 36, column: 30, scope: !36)
!39 = !DILocalVariable(name: "data", scope: !36, file: !19, line: 37, type: !3)
!40 = !DILocation(line: 37, column: 19, scope: !36)
!41 = !DILocation(line: 37, column: 26, scope: !36)
!42 = !DILocalVariable(name: "source", scope: !43, file: !19, line: 39, type: !44)
!43 = distinct !DILexicalBlock(scope: !36, file: !19, line: 38, column: 9)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 11)
!47 = !DILocation(line: 39, column: 21, scope: !43)
!48 = !DILocation(line: 42, column: 13, scope: !43)
!49 = !DILocation(line: 43, column: 24, scope: !43)
!50 = !DILocation(line: 43, column: 13, scope: !43)
!51 = !DILocation(line: 44, column: 18, scope: !43)
!52 = !DILocation(line: 44, column: 13, scope: !43)
!53 = !DILocation(line: 47, column: 1, scope: !18)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_31_good", scope: !19, file: !19, line: 75, type: !20, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!55 = !DILocation(line: 77, column: 5, scope: !54)
!56 = !DILocation(line: 78, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 89, type: !58, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!58 = !DISubroutineType(types: !59)
!59 = !{!8, !8, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !19, line: 89, type: !8)
!64 = !DILocation(line: 89, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !19, line: 89, type: !60)
!66 = !DILocation(line: 89, column: 27, scope: !57)
!67 = !DILocation(line: 92, column: 22, scope: !57)
!68 = !DILocation(line: 92, column: 12, scope: !57)
!69 = !DILocation(line: 92, column: 5, scope: !57)
!70 = !DILocation(line: 94, column: 5, scope: !57)
!71 = !DILocation(line: 95, column: 5, scope: !57)
!72 = !DILocation(line: 96, column: 5, scope: !57)
!73 = !DILocation(line: 99, column: 5, scope: !57)
!74 = !DILocation(line: 100, column: 5, scope: !57)
!75 = !DILocation(line: 101, column: 5, scope: !57)
!76 = !DILocation(line: 103, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!78 = !DILocalVariable(name: "data", scope: !77, file: !19, line: 56, type: !3)
!79 = !DILocation(line: 56, column: 15, scope: !77)
!80 = !DILocation(line: 57, column: 10, scope: !77)
!81 = !DILocation(line: 59, column: 23, scope: !77)
!82 = !DILocation(line: 59, column: 12, scope: !77)
!83 = !DILocation(line: 59, column: 10, scope: !77)
!84 = !DILocation(line: 60, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !19, line: 60, column: 9)
!86 = !DILocation(line: 60, column: 14, scope: !85)
!87 = !DILocation(line: 60, column: 9, scope: !77)
!88 = !DILocation(line: 60, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !19, line: 60, column: 23)
!90 = !DILocalVariable(name: "dataCopy", scope: !91, file: !19, line: 62, type: !3)
!91 = distinct !DILexicalBlock(scope: !77, file: !19, line: 61, column: 5)
!92 = !DILocation(line: 62, column: 19, scope: !91)
!93 = !DILocation(line: 62, column: 30, scope: !91)
!94 = !DILocalVariable(name: "data", scope: !91, file: !19, line: 63, type: !3)
!95 = !DILocation(line: 63, column: 19, scope: !91)
!96 = !DILocation(line: 63, column: 26, scope: !91)
!97 = !DILocalVariable(name: "source", scope: !98, file: !19, line: 65, type: !44)
!98 = distinct !DILexicalBlock(scope: !91, file: !19, line: 64, column: 9)
!99 = !DILocation(line: 65, column: 21, scope: !98)
!100 = !DILocation(line: 68, column: 13, scope: !98)
!101 = !DILocation(line: 69, column: 24, scope: !98)
!102 = !DILocation(line: 69, column: 13, scope: !98)
!103 = !DILocation(line: 70, column: 18, scope: !98)
!104 = !DILocation(line: 70, column: 13, scope: !98)
!105 = !DILocation(line: 73, column: 1, scope: !77)
