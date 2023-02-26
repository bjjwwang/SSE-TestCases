; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_goodG2BData = internal global i32* null, align 8, !dbg !14
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_bad() #0 !dbg !24 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !28, metadata !DIExpression()), !dbg !29
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
  %2 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !71, metadata !DIExpression()), !dbg !76
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !76
  %2 = load i32*, i32** %data, align 8, !dbg !77
  %3 = bitcast i32* %2 to i8*, !dbg !77
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !77
  %4 = bitcast i32* %arraydecay to i8*, !dbg !77
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !77
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !77
  %add = add i64 %call, 1, !dbg !77
  %mul = mul i64 %add, 4, !dbg !77
  %5 = load i32*, i32** %data, align 8, !dbg !77
  %6 = bitcast i32* %5 to i8*, !dbg !77
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !77
  %call2 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #9, !dbg !77
  %8 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* noundef %8), !dbg !79
  %9 = load i32*, i32** %data, align 8, !dbg !80
  %10 = bitcast i32* %9 to i8*, !dbg !80
  call void @free(i8* noundef %10), !dbg !81
  ret void, !dbg !82
}

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
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
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
  %2 = load i32*, i32** %data, align 8, !dbg !96
  store i32* %2, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_goodG2BData, align 8, !dbg !97
  call void @goodG2BSink(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !100 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32*, i32** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_goodG2BData, align 8, !dbg !103
  store i32* %0, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !106
  %2 = load i32*, i32** %data, align 8, !dbg !107
  %3 = bitcast i32* %2 to i8*, !dbg !107
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %4 = bitcast i32* %arraydecay to i8*, !dbg !107
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !107
  %add = add i64 %call, 1, !dbg !107
  %mul = mul i64 %add, 4, !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %6 = bitcast i32* %5 to i8*, !dbg !107
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !107
  %call2 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #9, !dbg !107
  %8 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* noundef %8), !dbg !109
  %9 = load i32*, i32** %data, align 8, !dbg !110
  %10 = bitcast i32* %9 to i8*, !dbg !110
  call void @free(i8* noundef %10), !dbg !111
  ret void, !dbg !112
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_badData", scope: !2, file: !16, line: 26, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11, !12}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_goodG2BData", scope: !2, file: !16, line: 27, type: !5, isLocal: true, isDefinition: true)
!16 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"uwtable", i32 1}
!22 = !{i32 7, !"frame-pointer", i32 2}
!23 = !{!"Homebrew clang version 14.0.6"}
!24 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_bad", scope: !16, file: !16, line: 44, type: !25, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{null}
!27 = !{}
!28 = !DILocalVariable(name: "data", scope: !24, file: !16, line: 46, type: !5)
!29 = !DILocation(line: 46, column: 15, scope: !24)
!30 = !DILocation(line: 47, column: 10, scope: !24)
!31 = !DILocation(line: 49, column: 23, scope: !24)
!32 = !DILocation(line: 49, column: 12, scope: !24)
!33 = !DILocation(line: 49, column: 10, scope: !24)
!34 = !DILocation(line: 50, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !24, file: !16, line: 50, column: 9)
!36 = !DILocation(line: 50, column: 14, scope: !35)
!37 = !DILocation(line: 50, column: 9, scope: !24)
!38 = !DILocation(line: 50, column: 24, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !16, line: 50, column: 23)
!40 = !DILocation(line: 51, column: 78, scope: !24)
!41 = !DILocation(line: 51, column: 76, scope: !24)
!42 = !DILocation(line: 52, column: 5, scope: !24)
!43 = !DILocation(line: 53, column: 1, scope: !24)
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_memmove_45_good", scope: !16, file: !16, line: 84, type: !25, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!45 = !DILocation(line: 86, column: 5, scope: !44)
!46 = !DILocation(line: 87, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 98, type: !48, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !27)
!48 = !DISubroutineType(types: !49)
!49 = !{!10, !10, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !16, line: 98, type: !10)
!54 = !DILocation(line: 98, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !16, line: 98, type: !50)
!56 = !DILocation(line: 98, column: 27, scope: !47)
!57 = !DILocation(line: 101, column: 22, scope: !47)
!58 = !DILocation(line: 101, column: 12, scope: !47)
!59 = !DILocation(line: 101, column: 5, scope: !47)
!60 = !DILocation(line: 103, column: 5, scope: !47)
!61 = !DILocation(line: 104, column: 5, scope: !47)
!62 = !DILocation(line: 105, column: 5, scope: !47)
!63 = !DILocation(line: 108, column: 5, scope: !47)
!64 = !DILocation(line: 109, column: 5, scope: !47)
!65 = !DILocation(line: 110, column: 5, scope: !47)
!66 = !DILocation(line: 112, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !16, file: !16, line: 31, type: !25, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!68 = !DILocalVariable(name: "data", scope: !67, file: !16, line: 33, type: !5)
!69 = !DILocation(line: 33, column: 15, scope: !67)
!70 = !DILocation(line: 33, column: 22, scope: !67)
!71 = !DILocalVariable(name: "source", scope: !72, file: !16, line: 35, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !16, line: 34, column: 5)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 352, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 11)
!76 = !DILocation(line: 35, column: 17, scope: !72)
!77 = !DILocation(line: 38, column: 9, scope: !72)
!78 = !DILocation(line: 39, column: 20, scope: !72)
!79 = !DILocation(line: 39, column: 9, scope: !72)
!80 = !DILocation(line: 40, column: 14, scope: !72)
!81 = !DILocation(line: 40, column: 9, scope: !72)
!82 = !DILocation(line: 42, column: 1, scope: !67)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 73, type: !25, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!84 = !DILocalVariable(name: "data", scope: !83, file: !16, line: 75, type: !5)
!85 = !DILocation(line: 75, column: 15, scope: !83)
!86 = !DILocation(line: 76, column: 10, scope: !83)
!87 = !DILocation(line: 78, column: 23, scope: !83)
!88 = !DILocation(line: 78, column: 12, scope: !83)
!89 = !DILocation(line: 78, column: 10, scope: !83)
!90 = !DILocation(line: 79, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !83, file: !16, line: 79, column: 9)
!92 = !DILocation(line: 79, column: 14, scope: !91)
!93 = !DILocation(line: 79, column: 9, scope: !83)
!94 = !DILocation(line: 79, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !16, line: 79, column: 23)
!96 = !DILocation(line: 80, column: 82, scope: !83)
!97 = !DILocation(line: 80, column: 80, scope: !83)
!98 = !DILocation(line: 81, column: 5, scope: !83)
!99 = !DILocation(line: 82, column: 1, scope: !83)
!100 = distinct !DISubprogram(name: "goodG2BSink", scope: !16, file: !16, line: 60, type: !25, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !27)
!101 = !DILocalVariable(name: "data", scope: !100, file: !16, line: 62, type: !5)
!102 = !DILocation(line: 62, column: 15, scope: !100)
!103 = !DILocation(line: 62, column: 22, scope: !100)
!104 = !DILocalVariable(name: "source", scope: !105, file: !16, line: 64, type: !73)
!105 = distinct !DILexicalBlock(scope: !100, file: !16, line: 63, column: 5)
!106 = !DILocation(line: 64, column: 17, scope: !105)
!107 = !DILocation(line: 67, column: 9, scope: !105)
!108 = !DILocation(line: 68, column: 20, scope: !105)
!109 = !DILocation(line: 68, column: 9, scope: !105)
!110 = !DILocation(line: 69, column: 14, scope: !105)
!111 = !DILocation(line: 69, column: 9, scope: !105)
!112 = !DILocation(line: 71, column: 1, scope: !100)
