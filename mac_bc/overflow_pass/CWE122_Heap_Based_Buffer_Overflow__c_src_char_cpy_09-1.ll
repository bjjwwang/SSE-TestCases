; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !29
  %tobool = icmp ne i32 %1, 0, !dbg !29
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !31

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !32
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #9, !dbg !32
  %5 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end3, !dbg !36

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %7 = load i8*, i8** %data, align 8, !dbg !43
  %call4 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !43
  %8 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* noundef %8), !dbg !45
  %9 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* noundef %9), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #4

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09_good() #0 !dbg !49 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !75
  store i8* %call, i8** %data, align 8, !dbg !76
  %0 = load i8*, i8** %data, align 8, !dbg !77
  %cmp = icmp eq i8* %0, null, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !81
  unreachable, !dbg !81

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !83
  %tobool = icmp ne i32 %1, 0, !dbg !83
  br i1 %tobool, label %if.then1, label %if.else, !dbg !85

if.then1:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end3, !dbg !88

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !89
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !89
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !89
  %5 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end3

if.end3:                                          ; preds = %if.else, %if.then1
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !96
  %7 = load i8*, i8** %data, align 8, !dbg !96
  %call4 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !96
  %8 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* noundef %8), !dbg !98
  %9 = load i8*, i8** %data, align 8, !dbg !99
  call void @free(i8* noundef %9), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !102 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !105
  store i8* %call, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %cmp = icmp eq i8* %0, null, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !111
  unreachable, !dbg !111

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !113
  %tobool = icmp ne i32 %1, 0, !dbg !113
  br i1 %tobool, label %if.then1, label %if.end3, !dbg !115

if.then1:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !116
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !116
  %call2 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !116
  %5 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  br label %if.end3, !dbg !120

if.end3:                                          ; preds = %if.then1, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !123
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !124
  %7 = load i8*, i8** %data, align 8, !dbg !124
  %call4 = call i8* @__strcpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef 50) #9, !dbg !124
  %8 = load i8*, i8** %data, align 8, !dbg !125
  call void @printLine(i8* noundef %8), !dbg !126
  %9 = load i8*, i8** %data, align 8, !dbg !127
  call void @free(i8* noundef %9), !dbg !128
  ret void, !dbg !129
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 20, scope: !14)
!22 = !DILocation(line: 26, column: 10, scope: !14)
!23 = !DILocation(line: 27, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!25 = !DILocation(line: 27, column: 14, scope: !24)
!26 = !DILocation(line: 27, column: 9, scope: !14)
!27 = !DILocation(line: 27, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 27, column: 23)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 8, scope: !14)
!32 = !DILocation(line: 31, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !15, line: 29, column: 5)
!34 = !DILocation(line: 32, column: 9, scope: !33)
!35 = !DILocation(line: 32, column: 21, scope: !33)
!36 = !DILocation(line: 33, column: 5, scope: !33)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 35, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 35, column: 14, scope: !38)
!43 = !DILocation(line: 37, column: 9, scope: !38)
!44 = !DILocation(line: 38, column: 19, scope: !38)
!45 = !DILocation(line: 38, column: 9, scope: !38)
!46 = !DILocation(line: 39, column: 14, scope: !38)
!47 = !DILocation(line: 39, column: 9, scope: !38)
!48 = !DILocation(line: 41, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cpy_09_good", scope: !15, file: !15, line: 94, type: !16, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!50 = !DILocation(line: 96, column: 5, scope: !49)
!51 = !DILocation(line: 97, column: 5, scope: !49)
!52 = !DILocation(line: 98, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 110, type: !54, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 110, type: !56)
!59 = !DILocation(line: 110, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 110, type: !57)
!61 = !DILocation(line: 110, column: 27, scope: !53)
!62 = !DILocation(line: 113, column: 22, scope: !53)
!63 = !DILocation(line: 113, column: 12, scope: !53)
!64 = !DILocation(line: 113, column: 5, scope: !53)
!65 = !DILocation(line: 115, column: 5, scope: !53)
!66 = !DILocation(line: 116, column: 5, scope: !53)
!67 = !DILocation(line: 117, column: 5, scope: !53)
!68 = !DILocation(line: 120, column: 5, scope: !53)
!69 = !DILocation(line: 121, column: 5, scope: !53)
!70 = !DILocation(line: 122, column: 5, scope: !53)
!71 = !DILocation(line: 124, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!73 = !DILocalVariable(name: "data", scope: !72, file: !15, line: 50, type: !3)
!74 = !DILocation(line: 50, column: 12, scope: !72)
!75 = !DILocation(line: 51, column: 20, scope: !72)
!76 = !DILocation(line: 51, column: 10, scope: !72)
!77 = !DILocation(line: 52, column: 9, scope: !78)
!78 = distinct !DILexicalBlock(scope: !72, file: !15, line: 52, column: 9)
!79 = !DILocation(line: 52, column: 14, scope: !78)
!80 = !DILocation(line: 52, column: 9, scope: !72)
!81 = !DILocation(line: 52, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !15, line: 52, column: 23)
!83 = !DILocation(line: 53, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !72, file: !15, line: 53, column: 8)
!85 = !DILocation(line: 53, column: 8, scope: !72)
!86 = !DILocation(line: 56, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !15, line: 54, column: 5)
!88 = !DILocation(line: 57, column: 5, scope: !87)
!89 = !DILocation(line: 61, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !84, file: !15, line: 59, column: 5)
!91 = !DILocation(line: 62, column: 9, scope: !90)
!92 = !DILocation(line: 62, column: 20, scope: !90)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !15, line: 65, type: !39)
!94 = distinct !DILexicalBlock(scope: !72, file: !15, line: 64, column: 5)
!95 = !DILocation(line: 65, column: 14, scope: !94)
!96 = !DILocation(line: 67, column: 9, scope: !94)
!97 = !DILocation(line: 68, column: 19, scope: !94)
!98 = !DILocation(line: 68, column: 9, scope: !94)
!99 = !DILocation(line: 69, column: 14, scope: !94)
!100 = !DILocation(line: 69, column: 9, scope: !94)
!101 = !DILocation(line: 71, column: 1, scope: !72)
!102 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 74, type: !16, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!103 = !DILocalVariable(name: "data", scope: !102, file: !15, line: 76, type: !3)
!104 = !DILocation(line: 76, column: 12, scope: !102)
!105 = !DILocation(line: 77, column: 20, scope: !102)
!106 = !DILocation(line: 77, column: 10, scope: !102)
!107 = !DILocation(line: 78, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !15, line: 78, column: 9)
!109 = !DILocation(line: 78, column: 14, scope: !108)
!110 = !DILocation(line: 78, column: 9, scope: !102)
!111 = !DILocation(line: 78, column: 24, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !15, line: 78, column: 23)
!113 = !DILocation(line: 79, column: 8, scope: !114)
!114 = distinct !DILexicalBlock(scope: !102, file: !15, line: 79, column: 8)
!115 = !DILocation(line: 79, column: 8, scope: !102)
!116 = !DILocation(line: 82, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !15, line: 80, column: 5)
!118 = !DILocation(line: 83, column: 9, scope: !117)
!119 = !DILocation(line: 83, column: 20, scope: !117)
!120 = !DILocation(line: 84, column: 5, scope: !117)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !15, line: 86, type: !39)
!122 = distinct !DILexicalBlock(scope: !102, file: !15, line: 85, column: 5)
!123 = !DILocation(line: 86, column: 14, scope: !122)
!124 = !DILocation(line: 88, column: 9, scope: !122)
!125 = !DILocation(line: 89, column: 19, scope: !122)
!126 = !DILocation(line: 89, column: 9, scope: !122)
!127 = !DILocation(line: 90, column: 14, scope: !122)
!128 = !DILocation(line: 90, column: 9, scope: !122)
!129 = !DILocation(line: 92, column: 1, scope: !102)
