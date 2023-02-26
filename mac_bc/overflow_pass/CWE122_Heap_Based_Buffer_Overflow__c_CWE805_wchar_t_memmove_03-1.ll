; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 200) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx2, align 4, !dbg !48
  %3 = load i32*, i32** %data, align 8, !dbg !49
  %4 = bitcast i32* %3 to i8*, !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !49
  %6 = load i32*, i32** %data, align 8, !dbg !49
  %7 = bitcast i32* %6 to i8*, !dbg !49
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !49
  %call4 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 400, i64 noundef %8) #8, !dbg !49
  %9 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !50
  store i32 0, i32* %arrayidx5, align 4, !dbg !51
  %10 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* noundef %10), !dbg !53
  %11 = load i32*, i32** %data, align 8, !dbg !54
  %12 = bitcast i32* %11 to i8*, !dbg !54
  call void @free(i8* noundef %12), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03_good() #0 !dbg !57 {
entry:
  call void @goodG2B1(), !dbg !58
  call void @goodG2B2(), !dbg !59
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !81 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  store i32* null, i32** %data, align 8, !dbg !84
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !85
  %0 = bitcast i8* %call to i32*, !dbg !88
  store i32* %0, i32** %data, align 8, !dbg !89
  %1 = load i32*, i32** %data, align 8, !dbg !90
  %cmp = icmp eq i32* %1, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !102
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !103
  store i32 0, i32* %arrayidx2, align 4, !dbg !104
  %3 = load i32*, i32** %data, align 8, !dbg !105
  %4 = bitcast i32* %3 to i8*, !dbg !105
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !105
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !105
  %7 = bitcast i32* %6 to i8*, !dbg !105
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !105
  %call4 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 400, i64 noundef %8) #8, !dbg !105
  %9 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !106
  store i32 0, i32* %arrayidx5, align 4, !dbg !107
  %10 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* noundef %10), !dbg !109
  %11 = load i32*, i32** %data, align 8, !dbg !110
  %12 = bitcast i32* %11 to i8*, !dbg !110
  call void @free(i8* noundef %12), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  store i32* null, i32** %data, align 8, !dbg !116
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !117
  %0 = bitcast i8* %call to i32*, !dbg !120
  store i32* %0, i32** %data, align 8, !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %cmp = icmp eq i32* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call1 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !134
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx2, align 4, !dbg !136
  %3 = load i32*, i32** %data, align 8, !dbg !137
  %4 = bitcast i32* %3 to i8*, !dbg !137
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !137
  %5 = bitcast i32* %arraydecay3 to i8*, !dbg !137
  %6 = load i32*, i32** %data, align 8, !dbg !137
  %7 = bitcast i32* %6 to i8*, !dbg !137
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !137
  %call4 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 400, i64 noundef %8) #8, !dbg !137
  %9 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx5 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !138
  store i32 0, i32* %arrayidx5, align 4, !dbg !139
  %10 = load i32*, i32** %data, align 8, !dbg !140
  call void @printWLine(i32* noundef %10), !dbg !141
  %11 = load i32*, i32** %data, align 8, !dbg !142
  %12 = bitcast i32* %11 to i8*, !dbg !142
  call void @free(i8* noundef %12), !dbg !143
  ret void, !dbg !144
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 28, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 8)
!29 = !DILocation(line: 30, column: 16, scope: !27)
!30 = !DILocation(line: 30, column: 14, scope: !27)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !19, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !27)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 9, scope: !27)
!38 = !DILocation(line: 32, column: 17, scope: !27)
!39 = !DILocalVariable(name: "source", scope: !40, file: !19, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 35, column: 17, scope: !40)
!45 = !DILocation(line: 36, column: 17, scope: !40)
!46 = !DILocation(line: 36, column: 9, scope: !40)
!47 = !DILocation(line: 37, column: 9, scope: !40)
!48 = !DILocation(line: 37, column: 23, scope: !40)
!49 = !DILocation(line: 39, column: 9, scope: !40)
!50 = !DILocation(line: 40, column: 9, scope: !40)
!51 = !DILocation(line: 40, column: 21, scope: !40)
!52 = !DILocation(line: 41, column: 20, scope: !40)
!53 = !DILocation(line: 41, column: 9, scope: !40)
!54 = !DILocation(line: 42, column: 14, scope: !40)
!55 = !DILocation(line: 42, column: 9, scope: !40)
!56 = !DILocation(line: 44, column: 1, scope: !18)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_memmove_03_good", scope: !19, file: !19, line: 103, type: !20, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!58 = !DILocation(line: 105, column: 5, scope: !57)
!59 = !DILocation(line: 106, column: 5, scope: !57)
!60 = !DILocation(line: 107, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 119, type: !62, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!62 = !DISubroutineType(types: !63)
!63 = !{!8, !8, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !19, line: 119, type: !8)
!68 = !DILocation(line: 119, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !19, line: 119, type: !64)
!70 = !DILocation(line: 119, column: 27, scope: !61)
!71 = !DILocation(line: 122, column: 22, scope: !61)
!72 = !DILocation(line: 122, column: 12, scope: !61)
!73 = !DILocation(line: 122, column: 5, scope: !61)
!74 = !DILocation(line: 124, column: 5, scope: !61)
!75 = !DILocation(line: 125, column: 5, scope: !61)
!76 = !DILocation(line: 126, column: 5, scope: !61)
!77 = !DILocation(line: 129, column: 5, scope: !61)
!78 = !DILocation(line: 130, column: 5, scope: !61)
!79 = !DILocation(line: 131, column: 5, scope: !61)
!80 = !DILocation(line: 133, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 51, type: !20, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!82 = !DILocalVariable(name: "data", scope: !81, file: !19, line: 53, type: !3)
!83 = !DILocation(line: 53, column: 15, scope: !81)
!84 = !DILocation(line: 54, column: 10, scope: !81)
!85 = !DILocation(line: 63, column: 27, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !19, line: 61, column: 5)
!87 = distinct !DILexicalBlock(scope: !81, file: !19, line: 55, column: 8)
!88 = !DILocation(line: 63, column: 16, scope: !86)
!89 = !DILocation(line: 63, column: 14, scope: !86)
!90 = !DILocation(line: 64, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !86, file: !19, line: 64, column: 13)
!92 = !DILocation(line: 64, column: 18, scope: !91)
!93 = !DILocation(line: 64, column: 13, scope: !86)
!94 = !DILocation(line: 64, column: 28, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !19, line: 64, column: 27)
!96 = !DILocation(line: 65, column: 9, scope: !86)
!97 = !DILocation(line: 65, column: 17, scope: !86)
!98 = !DILocalVariable(name: "source", scope: !99, file: !19, line: 68, type: !41)
!99 = distinct !DILexicalBlock(scope: !81, file: !19, line: 67, column: 5)
!100 = !DILocation(line: 68, column: 17, scope: !99)
!101 = !DILocation(line: 69, column: 17, scope: !99)
!102 = !DILocation(line: 69, column: 9, scope: !99)
!103 = !DILocation(line: 70, column: 9, scope: !99)
!104 = !DILocation(line: 70, column: 23, scope: !99)
!105 = !DILocation(line: 72, column: 9, scope: !99)
!106 = !DILocation(line: 73, column: 9, scope: !99)
!107 = !DILocation(line: 73, column: 21, scope: !99)
!108 = !DILocation(line: 74, column: 20, scope: !99)
!109 = !DILocation(line: 74, column: 9, scope: !99)
!110 = !DILocation(line: 75, column: 14, scope: !99)
!111 = !DILocation(line: 75, column: 9, scope: !99)
!112 = !DILocation(line: 77, column: 1, scope: !81)
!113 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 80, type: !20, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!114 = !DILocalVariable(name: "data", scope: !113, file: !19, line: 82, type: !3)
!115 = !DILocation(line: 82, column: 15, scope: !113)
!116 = !DILocation(line: 83, column: 10, scope: !113)
!117 = !DILocation(line: 87, column: 27, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !19, line: 85, column: 5)
!119 = distinct !DILexicalBlock(scope: !113, file: !19, line: 84, column: 8)
!120 = !DILocation(line: 87, column: 16, scope: !118)
!121 = !DILocation(line: 87, column: 14, scope: !118)
!122 = !DILocation(line: 88, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !19, line: 88, column: 13)
!124 = !DILocation(line: 88, column: 18, scope: !123)
!125 = !DILocation(line: 88, column: 13, scope: !118)
!126 = !DILocation(line: 88, column: 28, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !19, line: 88, column: 27)
!128 = !DILocation(line: 89, column: 9, scope: !118)
!129 = !DILocation(line: 89, column: 17, scope: !118)
!130 = !DILocalVariable(name: "source", scope: !131, file: !19, line: 92, type: !41)
!131 = distinct !DILexicalBlock(scope: !113, file: !19, line: 91, column: 5)
!132 = !DILocation(line: 92, column: 17, scope: !131)
!133 = !DILocation(line: 93, column: 17, scope: !131)
!134 = !DILocation(line: 93, column: 9, scope: !131)
!135 = !DILocation(line: 94, column: 9, scope: !131)
!136 = !DILocation(line: 94, column: 23, scope: !131)
!137 = !DILocation(line: 96, column: 9, scope: !131)
!138 = !DILocation(line: 97, column: 9, scope: !131)
!139 = !DILocation(line: 97, column: 21, scope: !131)
!140 = !DILocation(line: 98, column: 20, scope: !131)
!141 = !DILocation(line: 98, column: 9, scope: !131)
!142 = !DILocation(line: 99, column: 14, scope: !131)
!143 = !DILocation(line: 99, column: 9, scope: !131)
!144 = !DILocation(line: 101, column: 1, scope: !113)
