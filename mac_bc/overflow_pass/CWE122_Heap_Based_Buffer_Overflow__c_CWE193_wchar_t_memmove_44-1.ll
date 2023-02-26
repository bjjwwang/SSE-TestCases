; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !25, metadata !DIExpression()), !dbg !29
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  %call = call i8* @malloc(i64 noundef 40) #7, !dbg !31
  %0 = bitcast i8* %call to i32*, !dbg !32
  store i32* %0, i32** %data, align 8, !dbg !33
  %1 = load i32*, i32** %data, align 8, !dbg !34
  %cmp = icmp eq i32* %1, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !40
  %3 = load i32*, i32** %data, align 8, !dbg !41
  call void %2(i32* noundef %3), !dbg !40
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !43 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !51
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !51
  %1 = load i32*, i32** %data.addr, align 8, !dbg !52
  %2 = bitcast i32* %1 to i8*, !dbg !52
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !52
  %3 = bitcast i32* %arraydecay to i8*, !dbg !52
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !52
  %add = add i64 %call, 1, !dbg !52
  %mul = mul i64 %add, 4, !dbg !52
  %4 = load i32*, i32** %data.addr, align 8, !dbg !52
  %5 = bitcast i32* %4 to i8*, !dbg !52
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !52
  %call2 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef %mul, i64 noundef %6) #9, !dbg !52
  %7 = load i32*, i32** %data.addr, align 8, !dbg !53
  call void @printWLine(i32* noundef %7), !dbg !54
  %8 = load i32*, i32** %data.addr, align 8, !dbg !55
  %9 = bitcast i32* %8 to i8*, !dbg !55
  call void @free(i8* noundef %9), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44_good() #0 !dbg !58 {
entry:
  call void @goodG2B(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* noundef null), !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 noundef %conv), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

declare i64 @wcslen(i32* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !84, metadata !DIExpression()), !dbg !85
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  %call = call i8* @malloc(i64 noundef 44) #7, !dbg !87
  %0 = bitcast i8* %call to i32*, !dbg !88
  store i32* %0, i32** %data, align 8, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !96
  %3 = load i32*, i32** %data, align 8, !dbg !97
  call void %2(i32* noundef %3), !dbg !96
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !99 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !102, metadata !DIExpression()), !dbg !104
  %0 = bitcast [11 x i32]* %source to i8*, !dbg !104
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !104
  %1 = load i32*, i32** %data.addr, align 8, !dbg !105
  %2 = bitcast i32* %1 to i8*, !dbg !105
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %3 = bitcast i32* %arraydecay to i8*, !dbg !105
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !105
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !105
  %add = add i64 %call, 1, !dbg !105
  %mul = mul i64 %add, 4, !dbg !105
  %4 = load i32*, i32** %data.addr, align 8, !dbg !105
  %5 = bitcast i32* %4 to i8*, !dbg !105
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !105
  %call2 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef %mul, i64 noundef %6) #9, !dbg !105
  %7 = load i32*, i32** %data.addr, align 8, !dbg !106
  call void @printWLine(i32* noundef %7), !dbg !107
  %8 = load i32*, i32** %data.addr, align 8, !dbg !108
  %9 = bitcast i32* %8 to i8*, !dbg !108
  call void @free(i8* noundef %9), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44_bad", scope: !19, file: !19, line: 40, type: !20, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 42, type: !3)
!24 = !DILocation(line: 42, column: 15, scope: !18)
!25 = !DILocalVariable(name: "funcPtr", scope: !18, file: !19, line: 44, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !3}
!29 = !DILocation(line: 44, column: 12, scope: !18)
!30 = !DILocation(line: 45, column: 10, scope: !18)
!31 = !DILocation(line: 47, column: 23, scope: !18)
!32 = !DILocation(line: 47, column: 12, scope: !18)
!33 = !DILocation(line: 47, column: 10, scope: !18)
!34 = !DILocation(line: 48, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 48, column: 9)
!36 = !DILocation(line: 48, column: 14, scope: !35)
!37 = !DILocation(line: 48, column: 9, scope: !18)
!38 = !DILocation(line: 48, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !19, line: 48, column: 23)
!40 = !DILocation(line: 50, column: 5, scope: !18)
!41 = !DILocation(line: 50, column: 13, scope: !18)
!42 = !DILocation(line: 51, column: 1, scope: !18)
!43 = distinct !DISubprogram(name: "badSink", scope: !19, file: !19, line: 28, type: !27, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!44 = !DILocalVariable(name: "data", arg: 1, scope: !43, file: !19, line: 28, type: !3)
!45 = !DILocation(line: 28, column: 31, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !19, line: 31, type: !48)
!47 = distinct !DILexicalBlock(scope: !43, file: !19, line: 30, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 11)
!51 = !DILocation(line: 31, column: 17, scope: !47)
!52 = !DILocation(line: 34, column: 9, scope: !47)
!53 = !DILocation(line: 35, column: 20, scope: !47)
!54 = !DILocation(line: 35, column: 9, scope: !47)
!55 = !DILocation(line: 36, column: 14, scope: !47)
!56 = !DILocation(line: 36, column: 9, scope: !47)
!57 = !DILocation(line: 38, column: 1, scope: !43)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_44_good", scope: !19, file: !19, line: 81, type: !20, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!59 = !DILocation(line: 83, column: 5, scope: !58)
!60 = !DILocation(line: 84, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 95, type: !62, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!62 = !DISubroutineType(types: !63)
!63 = !{!8, !8, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !19, line: 95, type: !8)
!68 = !DILocation(line: 95, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !19, line: 95, type: !64)
!70 = !DILocation(line: 95, column: 27, scope: !61)
!71 = !DILocation(line: 98, column: 22, scope: !61)
!72 = !DILocation(line: 98, column: 12, scope: !61)
!73 = !DILocation(line: 98, column: 5, scope: !61)
!74 = !DILocation(line: 100, column: 5, scope: !61)
!75 = !DILocation(line: 101, column: 5, scope: !61)
!76 = !DILocation(line: 102, column: 5, scope: !61)
!77 = !DILocation(line: 105, column: 5, scope: !61)
!78 = !DILocation(line: 106, column: 5, scope: !61)
!79 = !DILocation(line: 107, column: 5, scope: !61)
!80 = !DILocation(line: 109, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!82 = !DILocalVariable(name: "data", scope: !81, file: !19, line: 72, type: !3)
!83 = !DILocation(line: 72, column: 15, scope: !81)
!84 = !DILocalVariable(name: "funcPtr", scope: !81, file: !19, line: 73, type: !26)
!85 = !DILocation(line: 73, column: 12, scope: !81)
!86 = !DILocation(line: 74, column: 10, scope: !81)
!87 = !DILocation(line: 76, column: 23, scope: !81)
!88 = !DILocation(line: 76, column: 12, scope: !81)
!89 = !DILocation(line: 76, column: 10, scope: !81)
!90 = !DILocation(line: 77, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !81, file: !19, line: 77, column: 9)
!92 = !DILocation(line: 77, column: 14, scope: !91)
!93 = !DILocation(line: 77, column: 9, scope: !81)
!94 = !DILocation(line: 77, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 77, column: 23)
!96 = !DILocation(line: 78, column: 5, scope: !81)
!97 = !DILocation(line: 78, column: 13, scope: !81)
!98 = !DILocation(line: 79, column: 1, scope: !81)
!99 = distinct !DISubprogram(name: "goodG2BSink", scope: !19, file: !19, line: 58, type: !27, scopeLine: 59, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!100 = !DILocalVariable(name: "data", arg: 1, scope: !99, file: !19, line: 58, type: !3)
!101 = !DILocation(line: 58, column: 35, scope: !99)
!102 = !DILocalVariable(name: "source", scope: !103, file: !19, line: 61, type: !48)
!103 = distinct !DILexicalBlock(scope: !99, file: !19, line: 60, column: 5)
!104 = !DILocation(line: 61, column: 17, scope: !103)
!105 = !DILocation(line: 64, column: 9, scope: !103)
!106 = !DILocation(line: 65, column: 20, scope: !103)
!107 = !DILocation(line: 65, column: 9, scope: !103)
!108 = !DILocation(line: 66, column: 14, scope: !103)
!109 = !DILocation(line: 66, column: 9, scope: !103)
!110 = !DILocation(line: 68, column: 1, scope: !99)
