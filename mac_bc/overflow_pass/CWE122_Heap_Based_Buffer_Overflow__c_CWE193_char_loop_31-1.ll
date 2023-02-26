; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 10) #6, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  %0 = load i8*, i8** %data, align 8, !dbg !24
  %cmp = icmp eq i8* %0, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !30, metadata !DIExpression()), !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %1, i8** %dataCopy, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !35
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !36
  store i8* %2, i8** %data1, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !52
  %call2 = call i64 @strlen(i8* noundef %arraydecay), !dbg !53
  store i64 %call2, i64* %sourceLen, align 8, !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !58
  %5 = load i64, i64* %sourceLen, align 8, !dbg !60
  %add = add i64 %5, 1, !dbg !61
  %cmp3 = icmp ult i64 %4, %add, !dbg !62
  br i1 %cmp3, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !66
  %7 = load i8, i8* %arrayidx, align 1, !dbg !66
  %8 = load i8*, i8** %data1, align 8, !dbg !67
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !67
  store i8 %7, i8* %arrayidx4, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %10, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
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

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare i64 @strlen(i8* noundef) #5

declare void @printLine(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31_good() #0 !dbg !81 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31_bad(), !dbg !100
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
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store i8* null, i8** %data, align 8, !dbg !106
  %call = call i8* @malloc(i64 noundef 11) #6, !dbg !107
  store i8* %call, i8** %data, align 8, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %cmp = icmp eq i8* %0, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !115, metadata !DIExpression()), !dbg !117
  %1 = load i8*, i8** %data, align 8, !dbg !118
  store i8* %1, i8** %dataCopy, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !119, metadata !DIExpression()), !dbg !120
  %2 = load i8*, i8** %dataCopy, align 8, !dbg !121
  store i8* %2, i8** %data1, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %3 = bitcast [11 x i8]* %source to i8*, !dbg !124
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %3, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !127, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !129
  %call2 = call i64 @strlen(i8* noundef %arraydecay), !dbg !130
  store i64 %call2, i64* %sourceLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !135
  %5 = load i64, i64* %sourceLen, align 8, !dbg !137
  %add = add i64 %5, 1, !dbg !138
  %cmp3 = icmp ult i64 %4, %add, !dbg !139
  br i1 %cmp3, label %for.body, label %for.end, !dbg !140

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !141
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %6, !dbg !143
  %7 = load i8, i8* %arrayidx, align 1, !dbg !143
  %8 = load i8*, i8** %data1, align 8, !dbg !144
  %9 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx4 = getelementptr inbounds i8, i8* %8, i64 %9, !dbg !144
  store i8 %7, i8* %arrayidx4, align 1, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %10, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
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
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !3)
!20 = !DILocation(line: 30, column: 12, scope: !14)
!21 = !DILocation(line: 31, column: 10, scope: !14)
!22 = !DILocation(line: 33, column: 20, scope: !14)
!23 = !DILocation(line: 33, column: 10, scope: !14)
!24 = !DILocation(line: 34, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 9)
!26 = !DILocation(line: 34, column: 14, scope: !25)
!27 = !DILocation(line: 34, column: 9, scope: !14)
!28 = !DILocation(line: 34, column: 24, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 34, column: 23)
!30 = !DILocalVariable(name: "dataCopy", scope: !31, file: !15, line: 36, type: !3)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 5)
!32 = !DILocation(line: 36, column: 16, scope: !31)
!33 = !DILocation(line: 36, column: 27, scope: !31)
!34 = !DILocalVariable(name: "data", scope: !31, file: !15, line: 37, type: !3)
!35 = !DILocation(line: 37, column: 16, scope: !31)
!36 = !DILocation(line: 37, column: 23, scope: !31)
!37 = !DILocalVariable(name: "source", scope: !38, file: !15, line: 39, type: !39)
!38 = distinct !DILexicalBlock(scope: !31, file: !15, line: 38, column: 9)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 39, column: 18, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !15, line: 40, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !47, line: 94, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 40, column: 20, scope: !38)
!50 = !DILocalVariable(name: "sourceLen", scope: !38, file: !15, line: 40, type: !44)
!51 = !DILocation(line: 40, column: 23, scope: !38)
!52 = !DILocation(line: 41, column: 32, scope: !38)
!53 = !DILocation(line: 41, column: 25, scope: !38)
!54 = !DILocation(line: 41, column: 23, scope: !38)
!55 = !DILocation(line: 44, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !38, file: !15, line: 44, column: 13)
!57 = !DILocation(line: 44, column: 18, scope: !56)
!58 = !DILocation(line: 44, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !15, line: 44, column: 13)
!60 = !DILocation(line: 44, column: 29, scope: !59)
!61 = !DILocation(line: 44, column: 39, scope: !59)
!62 = !DILocation(line: 44, column: 27, scope: !59)
!63 = !DILocation(line: 44, column: 13, scope: !56)
!64 = !DILocation(line: 46, column: 34, scope: !65)
!65 = distinct !DILexicalBlock(scope: !59, file: !15, line: 45, column: 13)
!66 = !DILocation(line: 46, column: 27, scope: !65)
!67 = !DILocation(line: 46, column: 17, scope: !65)
!68 = !DILocation(line: 46, column: 22, scope: !65)
!69 = !DILocation(line: 46, column: 25, scope: !65)
!70 = !DILocation(line: 47, column: 13, scope: !65)
!71 = !DILocation(line: 44, column: 45, scope: !59)
!72 = !DILocation(line: 44, column: 13, scope: !59)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 47, column: 13, scope: !56)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 48, column: 23, scope: !38)
!77 = !DILocation(line: 48, column: 13, scope: !38)
!78 = !DILocation(line: 49, column: 18, scope: !38)
!79 = !DILocation(line: 49, column: 13, scope: !38)
!80 = !DILocation(line: 52, column: 1, scope: !14)
!81 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_loop_31_good", scope: !15, file: !15, line: 85, type: !16, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!82 = !DILocation(line: 87, column: 5, scope: !81)
!83 = !DILocation(line: 88, column: 1, scope: !81)
!84 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !85, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!85 = !DISubroutineType(types: !86)
!86 = !{!87, !87, !88}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !15, line: 99, type: !87)
!90 = !DILocation(line: 99, column: 14, scope: !84)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !15, line: 99, type: !88)
!92 = !DILocation(line: 99, column: 27, scope: !84)
!93 = !DILocation(line: 102, column: 22, scope: !84)
!94 = !DILocation(line: 102, column: 12, scope: !84)
!95 = !DILocation(line: 102, column: 5, scope: !84)
!96 = !DILocation(line: 104, column: 5, scope: !84)
!97 = !DILocation(line: 105, column: 5, scope: !84)
!98 = !DILocation(line: 106, column: 5, scope: !84)
!99 = !DILocation(line: 109, column: 5, scope: !84)
!100 = !DILocation(line: 110, column: 5, scope: !84)
!101 = !DILocation(line: 111, column: 5, scope: !84)
!102 = !DILocation(line: 113, column: 5, scope: !84)
!103 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!104 = !DILocalVariable(name: "data", scope: !103, file: !15, line: 61, type: !3)
!105 = !DILocation(line: 61, column: 12, scope: !103)
!106 = !DILocation(line: 62, column: 10, scope: !103)
!107 = !DILocation(line: 64, column: 20, scope: !103)
!108 = !DILocation(line: 64, column: 10, scope: !103)
!109 = !DILocation(line: 65, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !15, line: 65, column: 9)
!111 = !DILocation(line: 65, column: 14, scope: !110)
!112 = !DILocation(line: 65, column: 9, scope: !103)
!113 = !DILocation(line: 65, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !15, line: 65, column: 23)
!115 = !DILocalVariable(name: "dataCopy", scope: !116, file: !15, line: 67, type: !3)
!116 = distinct !DILexicalBlock(scope: !103, file: !15, line: 66, column: 5)
!117 = !DILocation(line: 67, column: 16, scope: !116)
!118 = !DILocation(line: 67, column: 27, scope: !116)
!119 = !DILocalVariable(name: "data", scope: !116, file: !15, line: 68, type: !3)
!120 = !DILocation(line: 68, column: 16, scope: !116)
!121 = !DILocation(line: 68, column: 23, scope: !116)
!122 = !DILocalVariable(name: "source", scope: !123, file: !15, line: 70, type: !39)
!123 = distinct !DILexicalBlock(scope: !116, file: !15, line: 69, column: 9)
!124 = !DILocation(line: 70, column: 18, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !123, file: !15, line: 71, type: !44)
!126 = !DILocation(line: 71, column: 20, scope: !123)
!127 = !DILocalVariable(name: "sourceLen", scope: !123, file: !15, line: 71, type: !44)
!128 = !DILocation(line: 71, column: 23, scope: !123)
!129 = !DILocation(line: 72, column: 32, scope: !123)
!130 = !DILocation(line: 72, column: 25, scope: !123)
!131 = !DILocation(line: 72, column: 23, scope: !123)
!132 = !DILocation(line: 75, column: 20, scope: !133)
!133 = distinct !DILexicalBlock(scope: !123, file: !15, line: 75, column: 13)
!134 = !DILocation(line: 75, column: 18, scope: !133)
!135 = !DILocation(line: 75, column: 25, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 75, column: 13)
!137 = !DILocation(line: 75, column: 29, scope: !136)
!138 = !DILocation(line: 75, column: 39, scope: !136)
!139 = !DILocation(line: 75, column: 27, scope: !136)
!140 = !DILocation(line: 75, column: 13, scope: !133)
!141 = !DILocation(line: 77, column: 34, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !15, line: 76, column: 13)
!143 = !DILocation(line: 77, column: 27, scope: !142)
!144 = !DILocation(line: 77, column: 17, scope: !142)
!145 = !DILocation(line: 77, column: 22, scope: !142)
!146 = !DILocation(line: 77, column: 25, scope: !142)
!147 = !DILocation(line: 78, column: 13, scope: !142)
!148 = !DILocation(line: 75, column: 45, scope: !136)
!149 = !DILocation(line: 75, column: 13, scope: !136)
!150 = distinct !{!150, !140, !151, !75}
!151 = !DILocation(line: 78, column: 13, scope: !133)
!152 = !DILocation(line: 79, column: 23, scope: !123)
!153 = !DILocation(line: 79, column: 13, scope: !123)
!154 = !DILocation(line: 80, column: 18, scope: !123)
!155 = !DILocation(line: 80, column: 13, scope: !123)
!156 = !DILocation(line: 83, column: 1, scope: !103)
