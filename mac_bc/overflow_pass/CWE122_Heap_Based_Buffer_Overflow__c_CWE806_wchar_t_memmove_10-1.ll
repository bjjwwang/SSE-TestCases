; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalTrue = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %2, 0, !dbg !34
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !36

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !37
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !39
  %4 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end3, !dbg !42

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !49
  %6 = bitcast i32* %arraydecay to i8*, !dbg !49
  %7 = load i32*, i32** %data, align 8, !dbg !49
  %8 = bitcast i32* %7 to i8*, !dbg !49
  %9 = load i32*, i32** %data, align 8, !dbg !49
  %call4 = call i64 @wcslen(i32* noundef %9), !dbg !49
  %mul = mul i64 %call4, 4, !dbg !49
  %call5 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #9, !dbg !49
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !50
  store i32 0, i32* %arrayidx6, align 4, !dbg !51
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10_good() #0 !dbg !57 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10_bad(), !dbg !78
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
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !84
  %0 = bitcast i8* %call to i32*, !dbg !85
  store i32* %0, i32** %data, align 8, !dbg !86
  %1 = load i32*, i32** %data, align 8, !dbg !87
  %cmp = icmp eq i32* %1, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFalse, align 4, !dbg !93
  %tobool = icmp ne i32 %2, 0, !dbg !93
  br i1 %tobool, label %if.then1, label %if.else, !dbg !95

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end3, !dbg !98

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !99
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !101
  %4 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !104, metadata !DIExpression()), !dbg !106
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !106
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !106
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !107
  %6 = bitcast i32* %arraydecay to i8*, !dbg !107
  %7 = load i32*, i32** %data, align 8, !dbg !107
  %8 = bitcast i32* %7 to i8*, !dbg !107
  %9 = load i32*, i32** %data, align 8, !dbg !107
  %call4 = call i64 @wcslen(i32* noundef %9), !dbg !107
  %mul = mul i64 %call4, 4, !dbg !107
  %call5 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #9, !dbg !107
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !108
  store i32 0, i32* %arrayidx6, align 4, !dbg !109
  %10 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* noundef %10), !dbg !111
  %11 = load i32*, i32** %data, align 8, !dbg !112
  %12 = bitcast i32* %11 to i8*, !dbg !112
  call void @free(i8* noundef %12), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !115 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !116, metadata !DIExpression()), !dbg !117
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !118
  %0 = bitcast i8* %call to i32*, !dbg !119
  store i32* %0, i32** %data, align 8, !dbg !120
  %1 = load i32*, i32** %data, align 8, !dbg !121
  %cmp = icmp eq i32* %1, null, !dbg !123
  br i1 %cmp, label %if.then, label %if.end, !dbg !124

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalTrue, align 4, !dbg !127
  %tobool = icmp ne i32 %2, 0, !dbg !127
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !129

if.then1:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !130
  %call2 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !132
  %4 = load i32*, i32** %data, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  br label %if.end3, !dbg !135

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !138
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !139
  %6 = bitcast i32* %arraydecay to i8*, !dbg !139
  %7 = load i32*, i32** %data, align 8, !dbg !139
  %8 = bitcast i32* %7 to i8*, !dbg !139
  %9 = load i32*, i32** %data, align 8, !dbg !139
  %call4 = call i64 @wcslen(i32* noundef %9), !dbg !139
  %mul = mul i64 %call4, 4, !dbg !139
  %call5 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %8, i64 noundef %mul, i64 noundef 200) #9, !dbg !139
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !140
  store i32 0, i32* %arrayidx6, align 4, !dbg !141
  %10 = load i32*, i32** %data, align 8, !dbg !142
  call void @printWLine(i32* noundef %10), !dbg !143
  %11 = load i32*, i32** %data, align 8, !dbg !144
  %12 = bitcast i32* %11 to i8*, !dbg !144
  call void @free(i8* noundef %12), !dbg !145
  ret void, !dbg !146
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 23, scope: !18)
!26 = !DILocation(line: 26, column: 12, scope: !18)
!27 = !DILocation(line: 26, column: 10, scope: !18)
!28 = !DILocation(line: 27, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 9)
!30 = !DILocation(line: 27, column: 14, scope: !29)
!31 = !DILocation(line: 27, column: 9, scope: !18)
!32 = !DILocation(line: 27, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 27, column: 23)
!34 = !DILocation(line: 28, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 8)
!36 = !DILocation(line: 28, column: 8, scope: !18)
!37 = !DILocation(line: 31, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !19, line: 29, column: 5)
!39 = !DILocation(line: 31, column: 9, scope: !38)
!40 = !DILocation(line: 32, column: 9, scope: !38)
!41 = !DILocation(line: 32, column: 21, scope: !38)
!42 = !DILocation(line: 33, column: 5, scope: !38)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !19, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 35, column: 17, scope: !44)
!49 = !DILocation(line: 37, column: 9, scope: !44)
!50 = !DILocation(line: 38, column: 9, scope: !44)
!51 = !DILocation(line: 38, column: 20, scope: !44)
!52 = !DILocation(line: 39, column: 20, scope: !44)
!53 = !DILocation(line: 39, column: 9, scope: !44)
!54 = !DILocation(line: 40, column: 14, scope: !44)
!55 = !DILocation(line: 40, column: 9, scope: !44)
!56 = !DILocation(line: 42, column: 1, scope: !18)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_memmove_10_good", scope: !19, file: !19, line: 97, type: !20, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!58 = !DILocation(line: 99, column: 5, scope: !57)
!59 = !DILocation(line: 100, column: 5, scope: !57)
!60 = !DILocation(line: 101, column: 1, scope: !57)
!61 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 113, type: !62, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!62 = !DISubroutineType(types: !63)
!63 = !{!8, !8, !64}
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !19, line: 113, type: !8)
!68 = !DILocation(line: 113, column: 14, scope: !61)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !19, line: 113, type: !64)
!70 = !DILocation(line: 113, column: 27, scope: !61)
!71 = !DILocation(line: 116, column: 22, scope: !61)
!72 = !DILocation(line: 116, column: 12, scope: !61)
!73 = !DILocation(line: 116, column: 5, scope: !61)
!74 = !DILocation(line: 118, column: 5, scope: !61)
!75 = !DILocation(line: 119, column: 5, scope: !61)
!76 = !DILocation(line: 120, column: 5, scope: !61)
!77 = !DILocation(line: 123, column: 5, scope: !61)
!78 = !DILocation(line: 124, column: 5, scope: !61)
!79 = !DILocation(line: 125, column: 5, scope: !61)
!80 = !DILocation(line: 127, column: 5, scope: !61)
!81 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 49, type: !20, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!82 = !DILocalVariable(name: "data", scope: !81, file: !19, line: 51, type: !3)
!83 = !DILocation(line: 51, column: 15, scope: !81)
!84 = !DILocation(line: 52, column: 23, scope: !81)
!85 = !DILocation(line: 52, column: 12, scope: !81)
!86 = !DILocation(line: 52, column: 10, scope: !81)
!87 = !DILocation(line: 53, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !19, line: 53, column: 9)
!89 = !DILocation(line: 53, column: 14, scope: !88)
!90 = !DILocation(line: 53, column: 9, scope: !81)
!91 = !DILocation(line: 53, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !19, line: 53, column: 23)
!93 = !DILocation(line: 54, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !81, file: !19, line: 54, column: 8)
!95 = !DILocation(line: 54, column: 8, scope: !81)
!96 = !DILocation(line: 57, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !19, line: 55, column: 5)
!98 = !DILocation(line: 58, column: 5, scope: !97)
!99 = !DILocation(line: 62, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !19, line: 60, column: 5)
!101 = !DILocation(line: 62, column: 9, scope: !100)
!102 = !DILocation(line: 63, column: 9, scope: !100)
!103 = !DILocation(line: 63, column: 20, scope: !100)
!104 = !DILocalVariable(name: "dest", scope: !105, file: !19, line: 66, type: !45)
!105 = distinct !DILexicalBlock(scope: !81, file: !19, line: 65, column: 5)
!106 = !DILocation(line: 66, column: 17, scope: !105)
!107 = !DILocation(line: 68, column: 9, scope: !105)
!108 = !DILocation(line: 69, column: 9, scope: !105)
!109 = !DILocation(line: 69, column: 20, scope: !105)
!110 = !DILocation(line: 70, column: 20, scope: !105)
!111 = !DILocation(line: 70, column: 9, scope: !105)
!112 = !DILocation(line: 71, column: 14, scope: !105)
!113 = !DILocation(line: 71, column: 9, scope: !105)
!114 = !DILocation(line: 73, column: 1, scope: !81)
!115 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 76, type: !20, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!116 = !DILocalVariable(name: "data", scope: !115, file: !19, line: 78, type: !3)
!117 = !DILocation(line: 78, column: 15, scope: !115)
!118 = !DILocation(line: 79, column: 23, scope: !115)
!119 = !DILocation(line: 79, column: 12, scope: !115)
!120 = !DILocation(line: 79, column: 10, scope: !115)
!121 = !DILocation(line: 80, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !115, file: !19, line: 80, column: 9)
!123 = !DILocation(line: 80, column: 14, scope: !122)
!124 = !DILocation(line: 80, column: 9, scope: !115)
!125 = !DILocation(line: 80, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !19, line: 80, column: 23)
!127 = !DILocation(line: 81, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !115, file: !19, line: 81, column: 8)
!129 = !DILocation(line: 81, column: 8, scope: !115)
!130 = !DILocation(line: 84, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !19, line: 82, column: 5)
!132 = !DILocation(line: 84, column: 9, scope: !131)
!133 = !DILocation(line: 85, column: 9, scope: !131)
!134 = !DILocation(line: 85, column: 20, scope: !131)
!135 = !DILocation(line: 86, column: 5, scope: !131)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !19, line: 88, type: !45)
!137 = distinct !DILexicalBlock(scope: !115, file: !19, line: 87, column: 5)
!138 = !DILocation(line: 88, column: 17, scope: !137)
!139 = !DILocation(line: 90, column: 9, scope: !137)
!140 = !DILocation(line: 91, column: 9, scope: !137)
!141 = !DILocation(line: 91, column: 20, scope: !137)
!142 = !DILocation(line: 92, column: 20, scope: !137)
!143 = !DILocation(line: 92, column: 9, scope: !137)
!144 = !DILocation(line: 93, column: 14, scope: !137)
!145 = !DILocation(line: 93, column: 9, scope: !137)
!146 = !DILocation(line: 95, column: 1, scope: !115)
