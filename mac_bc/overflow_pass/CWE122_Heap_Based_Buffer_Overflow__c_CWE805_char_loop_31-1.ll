; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 50) #6, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  %0 = load i8*, i8** %data, align 8, !dbg !24
  %cmp = icmp eq i8* %0, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !32, metadata !DIExpression()), !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %2, i8** %dataCopy, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !36, metadata !DIExpression()), !dbg !37
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !38
  store i8* %3, i8** %data1, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx2, align 1, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !58
  %cmp3 = icmp ult i64 %4, 100, !dbg !60
  br i1 %cmp3, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !64
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !64
  %7 = load i8*, i8** %data1, align 8, !dbg !65
  %8 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !65
  store i8 %6, i8* %arrayidx5, align 1, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %9, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !74
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !74
  store i8 0, i8* %arrayidx6, align 1, !dbg !75
  %11 = load i8*, i8** %data1, align 8, !dbg !76
  call void @printLine(i8* noundef %11), !dbg !77
  %12 = load i8*, i8** %data1, align 8, !dbg !78
  call void @free(i8* noundef %12), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare void @printLine(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31_good() #0 !dbg !81 {
entry:
  call void @goodG2B(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* noundef null), !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 noundef %conv), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !103 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %call = call i8* @malloc(i64 noundef 100) #6, !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %cmp = icmp eq i8* %0, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !117, metadata !DIExpression()), !dbg !119
  %2 = load i8*, i8** %data, align 8, !dbg !120
  store i8* %2, i8** %dataCopy, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !121, metadata !DIExpression()), !dbg !122
  %3 = load i8*, i8** %dataCopy, align 8, !dbg !123
  store i8* %3, i8** %data1, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !129
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !130
  store i8 0, i8* %arrayidx2, align 1, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !135
  %cmp3 = icmp ult i64 %4, 100, !dbg !137
  br i1 %cmp3, label %for.body, label %for.end, !dbg !138

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !141
  %6 = load i8, i8* %arrayidx4, align 1, !dbg !141
  %7 = load i8*, i8** %data1, align 8, !dbg !142
  %8 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx5 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !142
  store i8 %6, i8* %arrayidx5, align 1, !dbg !144
  br label %for.inc, !dbg !145

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !146
  %inc = add i64 %9, 1, !dbg !146
  store i64 %inc, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !147, !llvm.loop !148

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data1, align 8, !dbg !150
  %arrayidx6 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !150
  store i8 0, i8* %arrayidx6, align 1, !dbg !151
  %11 = load i8*, i8** %data1, align 8, !dbg !152
  call void @printLine(i8* noundef %11), !dbg !153
  %12 = load i8*, i8** %data1, align 8, !dbg !154
  call void @free(i8* noundef %12), !dbg !155
  ret void, !dbg !156
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 28, column: 20, scope: !14)
!23 = !DILocation(line: 28, column: 10, scope: !14)
!24 = !DILocation(line: 29, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!26 = !DILocation(line: 29, column: 14, scope: !25)
!27 = !DILocation(line: 29, column: 9, scope: !14)
!28 = !DILocation(line: 29, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 29, column: 23)
!30 = !DILocation(line: 30, column: 5, scope: !14)
!31 = !DILocation(line: 30, column: 13, scope: !14)
!32 = !DILocalVariable(name: "dataCopy", scope: !33, file: !15, line: 32, type: !3)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 31, column: 5)
!34 = !DILocation(line: 32, column: 16, scope: !33)
!35 = !DILocation(line: 32, column: 27, scope: !33)
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 33, type: !3)
!37 = !DILocation(line: 33, column: 16, scope: !33)
!38 = !DILocation(line: 33, column: 23, scope: !33)
!39 = !DILocalVariable(name: "i", scope: !40, file: !15, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !33, file: !15, line: 34, column: 9)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !42, line: 31, baseType: !43)
!42 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !44, line: 94, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!45 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!46 = !DILocation(line: 35, column: 20, scope: !40)
!47 = !DILocalVariable(name: "source", scope: !40, file: !15, line: 36, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 36, column: 18, scope: !40)
!52 = !DILocation(line: 37, column: 13, scope: !40)
!53 = !DILocation(line: 38, column: 13, scope: !40)
!54 = !DILocation(line: 38, column: 27, scope: !40)
!55 = !DILocation(line: 40, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !15, line: 40, column: 13)
!57 = !DILocation(line: 40, column: 18, scope: !56)
!58 = !DILocation(line: 40, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !15, line: 40, column: 13)
!60 = !DILocation(line: 40, column: 27, scope: !59)
!61 = !DILocation(line: 40, column: 13, scope: !56)
!62 = !DILocation(line: 42, column: 34, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !15, line: 41, column: 13)
!64 = !DILocation(line: 42, column: 27, scope: !63)
!65 = !DILocation(line: 42, column: 17, scope: !63)
!66 = !DILocation(line: 42, column: 22, scope: !63)
!67 = !DILocation(line: 42, column: 25, scope: !63)
!68 = !DILocation(line: 43, column: 13, scope: !63)
!69 = !DILocation(line: 40, column: 35, scope: !59)
!70 = !DILocation(line: 40, column: 13, scope: !59)
!71 = distinct !{!71, !61, !72, !73}
!72 = !DILocation(line: 43, column: 13, scope: !56)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 44, column: 13, scope: !40)
!75 = !DILocation(line: 44, column: 25, scope: !40)
!76 = !DILocation(line: 45, column: 23, scope: !40)
!77 = !DILocation(line: 45, column: 13, scope: !40)
!78 = !DILocation(line: 46, column: 18, scope: !40)
!79 = !DILocation(line: 46, column: 13, scope: !40)
!80 = !DILocation(line: 49, column: 1, scope: !14)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_loop_31_good", scope: !15, file: !15, line: 84, type: !16, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!82 = !DILocation(line: 86, column: 5, scope: !81)
!83 = !DILocation(line: 87, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 98, type: !85, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !15, line: 98, type: !87)
!90 = !DILocation(line: 98, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !15, line: 98, type: !88)
!92 = !DILocation(line: 98, column: 27, scope: !84)
!93 = !DILocation(line: 101, column: 22, scope: !84)
!94 = !DILocation(line: 101, column: 12, scope: !84)
!95 = !DILocation(line: 101, column: 5, scope: !84)
!96 = !DILocation(line: 103, column: 5, scope: !84)
!97 = !DILocation(line: 104, column: 5, scope: !84)
!98 = !DILocation(line: 105, column: 5, scope: !84)
!99 = !DILocation(line: 108, column: 5, scope: !84)
!100 = !DILocation(line: 109, column: 5, scope: !84)
!101 = !DILocation(line: 110, column: 5, scope: !84)
!102 = !DILocation(line: 112, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 56, type: !16, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 58, type: !3)
!105 = !DILocation(line: 58, column: 12, scope: !103)
!106 = !DILocation(line: 59, column: 10, scope: !103)
!107 = !DILocation(line: 61, column: 20, scope: !103)
!108 = !DILocation(line: 61, column: 10, scope: !103)
!109 = !DILocation(line: 62, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !15, line: 62, column: 9)
!111 = !DILocation(line: 62, column: 14, scope: !110)
!112 = !DILocation(line: 62, column: 9, scope: !103)
!113 = !DILocation(line: 62, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 62, column: 23)
!115 = !DILocation(line: 63, column: 5, scope: !103)
!116 = !DILocation(line: 63, column: 13, scope: !103)
!117 = !DILocalVariable(name: "dataCopy", scope: !118, file: !15, line: 65, type: !3)
!118 = distinct !DILexicalBlock(scope: !103, file: !15, line: 64, column: 5)
!119 = !DILocation(line: 65, column: 16, scope: !118)
!120 = !DILocation(line: 65, column: 27, scope: !118)
!121 = !DILocalVariable(name: "data", scope: !118, file: !15, line: 66, type: !3)
!122 = !DILocation(line: 66, column: 16, scope: !118)
!123 = !DILocation(line: 66, column: 23, scope: !118)
!124 = !DILocalVariable(name: "i", scope: !125, file: !15, line: 68, type: !41)
!125 = distinct !DILexicalBlock(scope: !118, file: !15, line: 67, column: 9)
!126 = !DILocation(line: 68, column: 20, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !125, file: !15, line: 69, type: !48)
!128 = !DILocation(line: 69, column: 18, scope: !125)
!129 = !DILocation(line: 70, column: 13, scope: !125)
!130 = !DILocation(line: 71, column: 13, scope: !125)
!131 = !DILocation(line: 71, column: 27, scope: !125)
!132 = !DILocation(line: 73, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !125, file: !15, line: 73, column: 13)
!134 = !DILocation(line: 73, column: 18, scope: !133)
!135 = !DILocation(line: 73, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 73, column: 13)
!137 = !DILocation(line: 73, column: 27, scope: !136)
!138 = !DILocation(line: 73, column: 13, scope: !133)
!139 = !DILocation(line: 75, column: 34, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !15, line: 74, column: 13)
!141 = !DILocation(line: 75, column: 27, scope: !140)
!142 = !DILocation(line: 75, column: 17, scope: !140)
!143 = !DILocation(line: 75, column: 22, scope: !140)
!144 = !DILocation(line: 75, column: 25, scope: !140)
!145 = !DILocation(line: 76, column: 13, scope: !140)
!146 = !DILocation(line: 73, column: 35, scope: !136)
!147 = !DILocation(line: 73, column: 13, scope: !136)
!148 = distinct !{!148, !138, !149, !73}
!149 = !DILocation(line: 76, column: 13, scope: !133)
!150 = !DILocation(line: 77, column: 13, scope: !125)
!151 = !DILocation(line: 77, column: 25, scope: !125)
!152 = !DILocation(line: 78, column: 23, scope: !125)
!153 = !DILocation(line: 78, column: 13, scope: !125)
!154 = !DILocation(line: 79, column: 18, scope: !125)
!155 = !DILocation(line: 79, column: 13, scope: !125)
!156 = !DILocation(line: 82, column: 1, scope: !103)
