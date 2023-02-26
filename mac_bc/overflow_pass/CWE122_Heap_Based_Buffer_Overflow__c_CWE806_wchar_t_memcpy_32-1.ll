; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !25, metadata !DIExpression()), !dbg !27
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !28, metadata !DIExpression()), !dbg !29
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !29
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !30
  %0 = bitcast i8* %call to i32*, !dbg !31
  store i32* %0, i32** %data, align 8, !dbg !32
  %1 = load i32*, i32** %data, align 8, !dbg !33
  %cmp = icmp eq i32* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !42
  %3 = load i32*, i32** %2, align 8, !dbg !43
  store i32* %3, i32** %data1, align 8, !dbg !41
  %4 = load i32*, i32** %data1, align 8, !dbg !44
  %call2 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99), !dbg !45
  %5 = load i32*, i32** %data1, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !46
  store i32 0, i32* %arrayidx, align 4, !dbg !47
  %6 = load i32*, i32** %data1, align 8, !dbg !48
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !49
  store i32* %6, i32** %7, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !51, metadata !DIExpression()), !dbg !53
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !54
  %9 = load i32*, i32** %8, align 8, !dbg !55
  store i32* %9, i32** %data3, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !56, metadata !DIExpression()), !dbg !61
  %10 = bitcast [50 x i32]* %dest to i8*, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 200, i1 false), !dbg !61
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !62
  %11 = bitcast i32* %arraydecay to i8*, !dbg !62
  %12 = load i32*, i32** %data3, align 8, !dbg !62
  %13 = bitcast i32* %12 to i8*, !dbg !62
  %14 = load i32*, i32** %data3, align 8, !dbg !62
  %call4 = call i64 @wcslen(i32* noundef %14), !dbg !62
  %mul = mul i64 %call4, 4, !dbg !62
  %call5 = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %13, i64 noundef %mul, i64 noundef 200) #9, !dbg !62
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !63
  store i32 0, i32* %arrayidx6, align 4, !dbg !64
  %15 = load i32*, i32** %data3, align 8, !dbg !65
  call void @printWLine(i32* noundef %15), !dbg !66
  %16 = load i32*, i32** %data3, align 8, !dbg !67
  %17 = bitcast i32* %16 to i8*, !dbg !67
  call void @free(i8* noundef %17), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* noundef null), !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 noundef %conv), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_good(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_bad(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !96, metadata !DIExpression()), !dbg !97
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !97
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !98, metadata !DIExpression()), !dbg !99
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !99
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !100
  %0 = bitcast i8* %call to i32*, !dbg !101
  store i32* %0, i32** %data, align 8, !dbg !102
  %1 = load i32*, i32** %data, align 8, !dbg !103
  %cmp = icmp eq i32* %1, null, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !107
  unreachable, !dbg !107

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !109, metadata !DIExpression()), !dbg !111
  %2 = load i32**, i32*** %dataPtr1, align 8, !dbg !112
  %3 = load i32*, i32** %2, align 8, !dbg !113
  store i32* %3, i32** %data1, align 8, !dbg !111
  %4 = load i32*, i32** %data1, align 8, !dbg !114
  %call2 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !115
  %5 = load i32*, i32** %data1, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !116
  store i32 0, i32* %arrayidx, align 4, !dbg !117
  %6 = load i32*, i32** %data1, align 8, !dbg !118
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !119
  store i32* %6, i32** %7, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !121, metadata !DIExpression()), !dbg !123
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !124
  %9 = load i32*, i32** %8, align 8, !dbg !125
  store i32* %9, i32** %data3, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %10 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 200, i1 false), !dbg !128
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !129
  %11 = bitcast i32* %arraydecay to i8*, !dbg !129
  %12 = load i32*, i32** %data3, align 8, !dbg !129
  %13 = bitcast i32* %12 to i8*, !dbg !129
  %14 = load i32*, i32** %data3, align 8, !dbg !129
  %call4 = call i64 @wcslen(i32* noundef %14), !dbg !129
  %mul = mul i64 %call4, 4, !dbg !129
  %call5 = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %13, i64 noundef %mul, i64 noundef 200) #9, !dbg !129
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !130
  store i32 0, i32* %arrayidx6, align 4, !dbg !131
  %15 = load i32*, i32** %data3, align 8, !dbg !132
  call void @printWLine(i32* noundef %15), !dbg !133
  %16 = load i32*, i32** %data3, align 8, !dbg !134
  %17 = bitcast i32* %16 to i8*, !dbg !134
  call void @free(i8* noundef %17), !dbg !135
  ret void, !dbg !136
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !19, line: 26, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!27 = !DILocation(line: 26, column: 16, scope: !18)
!28 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !19, line: 27, type: !26)
!29 = !DILocation(line: 27, column: 16, scope: !18)
!30 = !DILocation(line: 28, column: 23, scope: !18)
!31 = !DILocation(line: 28, column: 12, scope: !18)
!32 = !DILocation(line: 28, column: 10, scope: !18)
!33 = !DILocation(line: 29, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 9)
!35 = !DILocation(line: 29, column: 14, scope: !34)
!36 = !DILocation(line: 29, column: 9, scope: !18)
!37 = !DILocation(line: 29, column: 24, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !19, line: 29, column: 23)
!39 = !DILocalVariable(name: "data", scope: !40, file: !19, line: 31, type: !3)
!40 = distinct !DILexicalBlock(scope: !18, file: !19, line: 30, column: 5)
!41 = !DILocation(line: 31, column: 19, scope: !40)
!42 = !DILocation(line: 31, column: 27, scope: !40)
!43 = !DILocation(line: 31, column: 26, scope: !40)
!44 = !DILocation(line: 33, column: 17, scope: !40)
!45 = !DILocation(line: 33, column: 9, scope: !40)
!46 = !DILocation(line: 34, column: 9, scope: !40)
!47 = !DILocation(line: 34, column: 21, scope: !40)
!48 = !DILocation(line: 35, column: 21, scope: !40)
!49 = !DILocation(line: 35, column: 10, scope: !40)
!50 = !DILocation(line: 35, column: 19, scope: !40)
!51 = !DILocalVariable(name: "data", scope: !52, file: !19, line: 38, type: !3)
!52 = distinct !DILexicalBlock(scope: !18, file: !19, line: 37, column: 5)
!53 = !DILocation(line: 38, column: 19, scope: !52)
!54 = !DILocation(line: 38, column: 27, scope: !52)
!55 = !DILocation(line: 38, column: 26, scope: !52)
!56 = !DILocalVariable(name: "dest", scope: !57, file: !19, line: 40, type: !58)
!57 = distinct !DILexicalBlock(scope: !52, file: !19, line: 39, column: 9)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 50)
!61 = !DILocation(line: 40, column: 21, scope: !57)
!62 = !DILocation(line: 42, column: 13, scope: !57)
!63 = !DILocation(line: 43, column: 13, scope: !57)
!64 = !DILocation(line: 43, column: 24, scope: !57)
!65 = !DILocation(line: 44, column: 24, scope: !57)
!66 = !DILocation(line: 44, column: 13, scope: !57)
!67 = !DILocation(line: 45, column: 18, scope: !57)
!68 = !DILocation(line: 45, column: 13, scope: !57)
!69 = !DILocation(line: 48, column: 1, scope: !18)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memcpy_32_good", scope: !19, file: !19, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!71 = !DILocation(line: 84, column: 5, scope: !70)
!72 = !DILocation(line: 85, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 96, type: !74, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!74 = !DISubroutineType(types: !75)
!75 = !{!8, !8, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !19, line: 96, type: !8)
!80 = !DILocation(line: 96, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !19, line: 96, type: !76)
!82 = !DILocation(line: 96, column: 27, scope: !73)
!83 = !DILocation(line: 99, column: 22, scope: !73)
!84 = !DILocation(line: 99, column: 12, scope: !73)
!85 = !DILocation(line: 99, column: 5, scope: !73)
!86 = !DILocation(line: 101, column: 5, scope: !73)
!87 = !DILocation(line: 102, column: 5, scope: !73)
!88 = !DILocation(line: 103, column: 5, scope: !73)
!89 = !DILocation(line: 106, column: 5, scope: !73)
!90 = !DILocation(line: 107, column: 5, scope: !73)
!91 = !DILocation(line: 108, column: 5, scope: !73)
!92 = !DILocation(line: 110, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!94 = !DILocalVariable(name: "data", scope: !93, file: !19, line: 57, type: !3)
!95 = !DILocation(line: 57, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataPtr1", scope: !93, file: !19, line: 58, type: !26)
!97 = !DILocation(line: 58, column: 16, scope: !93)
!98 = !DILocalVariable(name: "dataPtr2", scope: !93, file: !19, line: 59, type: !26)
!99 = !DILocation(line: 59, column: 16, scope: !93)
!100 = !DILocation(line: 60, column: 23, scope: !93)
!101 = !DILocation(line: 60, column: 12, scope: !93)
!102 = !DILocation(line: 60, column: 10, scope: !93)
!103 = !DILocation(line: 61, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !93, file: !19, line: 61, column: 9)
!105 = !DILocation(line: 61, column: 14, scope: !104)
!106 = !DILocation(line: 61, column: 9, scope: !93)
!107 = !DILocation(line: 61, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !19, line: 61, column: 23)
!109 = !DILocalVariable(name: "data", scope: !110, file: !19, line: 63, type: !3)
!110 = distinct !DILexicalBlock(scope: !93, file: !19, line: 62, column: 5)
!111 = !DILocation(line: 63, column: 19, scope: !110)
!112 = !DILocation(line: 63, column: 27, scope: !110)
!113 = !DILocation(line: 63, column: 26, scope: !110)
!114 = !DILocation(line: 65, column: 17, scope: !110)
!115 = !DILocation(line: 65, column: 9, scope: !110)
!116 = !DILocation(line: 66, column: 9, scope: !110)
!117 = !DILocation(line: 66, column: 20, scope: !110)
!118 = !DILocation(line: 67, column: 21, scope: !110)
!119 = !DILocation(line: 67, column: 10, scope: !110)
!120 = !DILocation(line: 67, column: 19, scope: !110)
!121 = !DILocalVariable(name: "data", scope: !122, file: !19, line: 70, type: !3)
!122 = distinct !DILexicalBlock(scope: !93, file: !19, line: 69, column: 5)
!123 = !DILocation(line: 70, column: 19, scope: !122)
!124 = !DILocation(line: 70, column: 27, scope: !122)
!125 = !DILocation(line: 70, column: 26, scope: !122)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !19, line: 72, type: !58)
!127 = distinct !DILexicalBlock(scope: !122, file: !19, line: 71, column: 9)
!128 = !DILocation(line: 72, column: 21, scope: !127)
!129 = !DILocation(line: 74, column: 13, scope: !127)
!130 = !DILocation(line: 75, column: 13, scope: !127)
!131 = !DILocation(line: 75, column: 24, scope: !127)
!132 = !DILocation(line: 76, column: 24, scope: !127)
!133 = !DILocation(line: 76, column: 13, scope: !127)
!134 = !DILocation(line: 77, column: 18, scope: !127)
!135 = !DILocation(line: 77, column: 13, scope: !127)
!136 = !DILocation(line: 80, column: 1, scope: !93)
