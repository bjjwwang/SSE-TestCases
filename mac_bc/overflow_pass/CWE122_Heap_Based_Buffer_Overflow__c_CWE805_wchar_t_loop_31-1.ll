; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 200) #5, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !27
  store i32* %0, i32** %data, align 8, !dbg !28
  %1 = load i32*, i32** %data, align 8, !dbg !29
  %cmp = icmp eq i32* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !37, metadata !DIExpression()), !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %3, i32** %dataCopy, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !41, metadata !DIExpression()), !dbg !42
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !43
  store i32* %4, i32** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !57
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx3, align 4, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !63
  %cmp4 = icmp ult i64 %5, 100, !dbg !65
  br i1 %cmp4, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !69
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !69
  %8 = load i32*, i32** %data1, align 8, !dbg !70
  %9 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !70
  store i32 %7, i32* %arrayidx6, align 4, !dbg !72
  br label %for.inc, !dbg !73

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !74
  %inc = add i64 %10, 1, !dbg !74
  store i64 %inc, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !75, !llvm.loop !76

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !79
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !79
  store i32 0, i32* %arrayidx7, align 4, !dbg !80
  %12 = load i32*, i32** %data1, align 8, !dbg !81
  call void @printWLine(i32* noundef %12), !dbg !82
  %13 = load i32*, i32** %data1, align 8, !dbg !83
  %14 = bitcast i32* %13 to i8*, !dbg !83
  call void @free(i8* noundef %14), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store i32* null, i32** %data, align 8, !dbg !112
  %call = call i8* @malloc(i64 noundef 400) #5, !dbg !113
  %0 = bitcast i8* %call to i32*, !dbg !114
  store i32* %0, i32** %data, align 8, !dbg !115
  %1 = load i32*, i32** %data, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #6, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 0, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !124, metadata !DIExpression()), !dbg !126
  %3 = load i32*, i32** %data, align 8, !dbg !127
  store i32* %3, i32** %dataCopy, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !128, metadata !DIExpression()), !dbg !129
  %4 = load i32*, i32** %dataCopy, align 8, !dbg !130
  store i32* %4, i32** %data1, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !134, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !136
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !137
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx3, align 4, !dbg !139
  store i64 0, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !143
  %cmp4 = icmp ult i64 %5, 100, !dbg !145
  br i1 %cmp4, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !149
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !149
  %8 = load i32*, i32** %data1, align 8, !dbg !150
  %9 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !150
  store i32 %7, i32* %arrayidx6, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %10, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !158
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !158
  store i32 0, i32* %arrayidx7, align 4, !dbg !159
  %12 = load i32*, i32** %data1, align 8, !dbg !160
  call void @printWLine(i32* noundef %12), !dbg !161
  %13 = load i32*, i32** %data1, align 8, !dbg !162
  %14 = bitcast i32* %13 to i8*, !dbg !162
  call void @free(i8* noundef %14), !dbg !163
  ret void, !dbg !164
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 28, column: 23, scope: !18)
!27 = !DILocation(line: 28, column: 12, scope: !18)
!28 = !DILocation(line: 28, column: 10, scope: !18)
!29 = !DILocation(line: 29, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 9)
!31 = !DILocation(line: 29, column: 14, scope: !30)
!32 = !DILocation(line: 29, column: 9, scope: !18)
!33 = !DILocation(line: 29, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !19, line: 29, column: 23)
!35 = !DILocation(line: 30, column: 5, scope: !18)
!36 = !DILocation(line: 30, column: 13, scope: !18)
!37 = !DILocalVariable(name: "dataCopy", scope: !38, file: !19, line: 32, type: !3)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 5)
!39 = !DILocation(line: 32, column: 19, scope: !38)
!40 = !DILocation(line: 32, column: 30, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !19, line: 33, type: !3)
!42 = !DILocation(line: 33, column: 19, scope: !38)
!43 = !DILocation(line: 33, column: 26, scope: !38)
!44 = !DILocalVariable(name: "i", scope: !45, file: !19, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !38, file: !19, line: 34, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !49)
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 20, scope: !45)
!51 = !DILocalVariable(name: "source", scope: !45, file: !19, line: 36, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 36, column: 21, scope: !45)
!56 = !DILocation(line: 37, column: 21, scope: !45)
!57 = !DILocation(line: 37, column: 13, scope: !45)
!58 = !DILocation(line: 38, column: 13, scope: !45)
!59 = !DILocation(line: 38, column: 27, scope: !45)
!60 = !DILocation(line: 40, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !45, file: !19, line: 40, column: 13)
!62 = !DILocation(line: 40, column: 18, scope: !61)
!63 = !DILocation(line: 40, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !19, line: 40, column: 13)
!65 = !DILocation(line: 40, column: 27, scope: !64)
!66 = !DILocation(line: 40, column: 13, scope: !61)
!67 = !DILocation(line: 42, column: 34, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !19, line: 41, column: 13)
!69 = !DILocation(line: 42, column: 27, scope: !68)
!70 = !DILocation(line: 42, column: 17, scope: !68)
!71 = !DILocation(line: 42, column: 22, scope: !68)
!72 = !DILocation(line: 42, column: 25, scope: !68)
!73 = !DILocation(line: 43, column: 13, scope: !68)
!74 = !DILocation(line: 40, column: 35, scope: !64)
!75 = !DILocation(line: 40, column: 13, scope: !64)
!76 = distinct !{!76, !66, !77, !78}
!77 = !DILocation(line: 43, column: 13, scope: !61)
!78 = !{!"llvm.loop.mustprogress"}
!79 = !DILocation(line: 44, column: 13, scope: !45)
!80 = !DILocation(line: 44, column: 25, scope: !45)
!81 = !DILocation(line: 45, column: 24, scope: !45)
!82 = !DILocation(line: 45, column: 13, scope: !45)
!83 = !DILocation(line: 46, column: 18, scope: !45)
!84 = !DILocation(line: 46, column: 13, scope: !45)
!85 = !DILocation(line: 49, column: 1, scope: !18)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_wchar_t_loop_31_good", scope: !19, file: !19, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!87 = !DILocation(line: 86, column: 5, scope: !86)
!88 = !DILocation(line: 87, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 98, type: !90, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!90 = !DISubroutineType(types: !91)
!91 = !{!8, !8, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !19, line: 98, type: !8)
!96 = !DILocation(line: 98, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !19, line: 98, type: !92)
!98 = !DILocation(line: 98, column: 27, scope: !89)
!99 = !DILocation(line: 101, column: 22, scope: !89)
!100 = !DILocation(line: 101, column: 12, scope: !89)
!101 = !DILocation(line: 101, column: 5, scope: !89)
!102 = !DILocation(line: 103, column: 5, scope: !89)
!103 = !DILocation(line: 104, column: 5, scope: !89)
!104 = !DILocation(line: 105, column: 5, scope: !89)
!105 = !DILocation(line: 108, column: 5, scope: !89)
!106 = !DILocation(line: 109, column: 5, scope: !89)
!107 = !DILocation(line: 110, column: 5, scope: !89)
!108 = !DILocation(line: 112, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 56, type: !20, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!110 = !DILocalVariable(name: "data", scope: !109, file: !19, line: 58, type: !3)
!111 = !DILocation(line: 58, column: 15, scope: !109)
!112 = !DILocation(line: 59, column: 10, scope: !109)
!113 = !DILocation(line: 61, column: 23, scope: !109)
!114 = !DILocation(line: 61, column: 12, scope: !109)
!115 = !DILocation(line: 61, column: 10, scope: !109)
!116 = !DILocation(line: 62, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !19, line: 62, column: 9)
!118 = !DILocation(line: 62, column: 14, scope: !117)
!119 = !DILocation(line: 62, column: 9, scope: !109)
!120 = !DILocation(line: 62, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !19, line: 62, column: 23)
!122 = !DILocation(line: 63, column: 5, scope: !109)
!123 = !DILocation(line: 63, column: 13, scope: !109)
!124 = !DILocalVariable(name: "dataCopy", scope: !125, file: !19, line: 65, type: !3)
!125 = distinct !DILexicalBlock(scope: !109, file: !19, line: 64, column: 5)
!126 = !DILocation(line: 65, column: 19, scope: !125)
!127 = !DILocation(line: 65, column: 30, scope: !125)
!128 = !DILocalVariable(name: "data", scope: !125, file: !19, line: 66, type: !3)
!129 = !DILocation(line: 66, column: 19, scope: !125)
!130 = !DILocation(line: 66, column: 26, scope: !125)
!131 = !DILocalVariable(name: "i", scope: !132, file: !19, line: 68, type: !46)
!132 = distinct !DILexicalBlock(scope: !125, file: !19, line: 67, column: 9)
!133 = !DILocation(line: 68, column: 20, scope: !132)
!134 = !DILocalVariable(name: "source", scope: !132, file: !19, line: 69, type: !52)
!135 = !DILocation(line: 69, column: 21, scope: !132)
!136 = !DILocation(line: 70, column: 21, scope: !132)
!137 = !DILocation(line: 70, column: 13, scope: !132)
!138 = !DILocation(line: 71, column: 13, scope: !132)
!139 = !DILocation(line: 71, column: 27, scope: !132)
!140 = !DILocation(line: 73, column: 20, scope: !141)
!141 = distinct !DILexicalBlock(scope: !132, file: !19, line: 73, column: 13)
!142 = !DILocation(line: 73, column: 18, scope: !141)
!143 = !DILocation(line: 73, column: 25, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !19, line: 73, column: 13)
!145 = !DILocation(line: 73, column: 27, scope: !144)
!146 = !DILocation(line: 73, column: 13, scope: !141)
!147 = !DILocation(line: 75, column: 34, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !19, line: 74, column: 13)
!149 = !DILocation(line: 75, column: 27, scope: !148)
!150 = !DILocation(line: 75, column: 17, scope: !148)
!151 = !DILocation(line: 75, column: 22, scope: !148)
!152 = !DILocation(line: 75, column: 25, scope: !148)
!153 = !DILocation(line: 76, column: 13, scope: !148)
!154 = !DILocation(line: 73, column: 35, scope: !144)
!155 = !DILocation(line: 73, column: 13, scope: !144)
!156 = distinct !{!156, !146, !157, !78}
!157 = !DILocation(line: 76, column: 13, scope: !141)
!158 = !DILocation(line: 77, column: 13, scope: !132)
!159 = !DILocation(line: 77, column: 25, scope: !132)
!160 = !DILocation(line: 78, column: 24, scope: !132)
!161 = !DILocation(line: 78, column: 13, scope: !132)
!162 = !DILocation(line: 79, column: 18, scope: !132)
!163 = !DILocation(line: 79, column: 13, scope: !132)
!164 = !DILocation(line: 82, column: 1, scope: !109)
