; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !30
  %1 = load i8*, i8** %0, align 8, !dbg !31
  store i8* %1, i8** %data1, align 8, !dbg !29
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !32
  store i8* %call, i8** %data1, align 8, !dbg !33
  %2 = load i8*, i8** %data1, align 8, !dbg !34
  %cmp = icmp eq i8* %2, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !40
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %3, i8** %4, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %6 = load i8*, i8** %5, align 8, !dbg !47
  store i8* %6, i8** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !53
  %8 = load i8*, i8** %data2, align 8, !dbg !54
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !54
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !54
  %add = add i64 %call4, 1, !dbg !54
  %mul = mul i64 %add, 1, !dbg !54
  %9 = load i8*, i8** %data2, align 8, !dbg !54
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !54
  %call5 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %10) #9, !dbg !54
  %11 = load i8*, i8** %data2, align 8, !dbg !55
  call void @printLine(i8* noundef %11), !dbg !56
  %12 = load i8*, i8** %data2, align 8, !dbg !57
  call void @free(i8* noundef %12), !dbg !58
  ret void, !dbg !59
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @strlen(i8* noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_good(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !81 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !85
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !87
  store i8* null, i8** %data, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !89, metadata !DIExpression()), !dbg !91
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !92
  %1 = load i8*, i8** %0, align 8, !dbg !93
  store i8* %1, i8** %data1, align 8, !dbg !91
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !94
  store i8* %call, i8** %data1, align 8, !dbg !95
  %2 = load i8*, i8** %data1, align 8, !dbg !96
  %cmp = icmp eq i8* %2, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !102
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !103
  store i8* %3, i8** %4, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !105, metadata !DIExpression()), !dbg !107
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !108
  %6 = load i8*, i8** %5, align 8, !dbg !109
  store i8* %6, i8** %data2, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !112
  %8 = load i8*, i8** %data2, align 8, !dbg !113
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %call4 = call i64 @strlen(i8* noundef %arraydecay3), !dbg !113
  %add = add i64 %call4, 1, !dbg !113
  %mul = mul i64 %add, 1, !dbg !113
  %9 = load i8*, i8** %data2, align 8, !dbg !113
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !113
  %call5 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %10) #9, !dbg !113
  %11 = load i8*, i8** %data2, align 8, !dbg !114
  call void @printLine(i8* noundef %11), !dbg !115
  %12 = load i8*, i8** %data2, align 8, !dbg !116
  call void @free(i8* noundef %12), !dbg !117
  ret void, !dbg !118
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
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !3)
!20 = !DILocation(line: 30, column: 12, scope: !14)
!21 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 31, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!23 = !DILocation(line: 31, column: 13, scope: !14)
!24 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 32, type: !22)
!25 = !DILocation(line: 32, column: 13, scope: !14)
!26 = !DILocation(line: 33, column: 10, scope: !14)
!27 = !DILocalVariable(name: "data", scope: !28, file: !15, line: 35, type: !3)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!29 = !DILocation(line: 35, column: 16, scope: !28)
!30 = !DILocation(line: 35, column: 24, scope: !28)
!31 = !DILocation(line: 35, column: 23, scope: !28)
!32 = !DILocation(line: 37, column: 24, scope: !28)
!33 = !DILocation(line: 37, column: 14, scope: !28)
!34 = !DILocation(line: 38, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !15, line: 38, column: 13)
!36 = !DILocation(line: 38, column: 18, scope: !35)
!37 = !DILocation(line: 38, column: 13, scope: !28)
!38 = !DILocation(line: 38, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 38, column: 27)
!40 = !DILocation(line: 39, column: 21, scope: !28)
!41 = !DILocation(line: 39, column: 10, scope: !28)
!42 = !DILocation(line: 39, column: 19, scope: !28)
!43 = !DILocalVariable(name: "data", scope: !44, file: !15, line: 42, type: !3)
!44 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 5)
!45 = !DILocation(line: 42, column: 16, scope: !44)
!46 = !DILocation(line: 42, column: 24, scope: !44)
!47 = !DILocation(line: 42, column: 23, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !49, file: !15, line: 44, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !15, line: 43, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 11)
!53 = !DILocation(line: 44, column: 18, scope: !49)
!54 = !DILocation(line: 47, column: 13, scope: !49)
!55 = !DILocation(line: 48, column: 23, scope: !49)
!56 = !DILocation(line: 48, column: 13, scope: !49)
!57 = !DILocation(line: 49, column: 18, scope: !49)
!58 = !DILocation(line: 49, column: 13, scope: !49)
!59 = !DILocation(line: 52, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_32_good", scope: !15, file: !15, line: 85, type: !16, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!61 = !DILocation(line: 87, column: 5, scope: !60)
!62 = !DILocation(line: 88, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 99, type: !64, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !22}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 99, type: !66)
!68 = !DILocation(line: 99, column: 14, scope: !63)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 99, type: !22)
!70 = !DILocation(line: 99, column: 27, scope: !63)
!71 = !DILocation(line: 102, column: 22, scope: !63)
!72 = !DILocation(line: 102, column: 12, scope: !63)
!73 = !DILocation(line: 102, column: 5, scope: !63)
!74 = !DILocation(line: 104, column: 5, scope: !63)
!75 = !DILocation(line: 105, column: 5, scope: !63)
!76 = !DILocation(line: 106, column: 5, scope: !63)
!77 = !DILocation(line: 109, column: 5, scope: !63)
!78 = !DILocation(line: 110, column: 5, scope: !63)
!79 = !DILocation(line: 111, column: 5, scope: !63)
!80 = !DILocation(line: 113, column: 5, scope: !63)
!81 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!82 = !DILocalVariable(name: "data", scope: !81, file: !15, line: 61, type: !3)
!83 = !DILocation(line: 61, column: 12, scope: !81)
!84 = !DILocalVariable(name: "dataPtr1", scope: !81, file: !15, line: 62, type: !22)
!85 = !DILocation(line: 62, column: 13, scope: !81)
!86 = !DILocalVariable(name: "dataPtr2", scope: !81, file: !15, line: 63, type: !22)
!87 = !DILocation(line: 63, column: 13, scope: !81)
!88 = !DILocation(line: 64, column: 10, scope: !81)
!89 = !DILocalVariable(name: "data", scope: !90, file: !15, line: 66, type: !3)
!90 = distinct !DILexicalBlock(scope: !81, file: !15, line: 65, column: 5)
!91 = !DILocation(line: 66, column: 16, scope: !90)
!92 = !DILocation(line: 66, column: 24, scope: !90)
!93 = !DILocation(line: 66, column: 23, scope: !90)
!94 = !DILocation(line: 68, column: 24, scope: !90)
!95 = !DILocation(line: 68, column: 14, scope: !90)
!96 = !DILocation(line: 69, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !15, line: 69, column: 13)
!98 = !DILocation(line: 69, column: 18, scope: !97)
!99 = !DILocation(line: 69, column: 13, scope: !90)
!100 = !DILocation(line: 69, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !15, line: 69, column: 27)
!102 = !DILocation(line: 70, column: 21, scope: !90)
!103 = !DILocation(line: 70, column: 10, scope: !90)
!104 = !DILocation(line: 70, column: 19, scope: !90)
!105 = !DILocalVariable(name: "data", scope: !106, file: !15, line: 73, type: !3)
!106 = distinct !DILexicalBlock(scope: !81, file: !15, line: 72, column: 5)
!107 = !DILocation(line: 73, column: 16, scope: !106)
!108 = !DILocation(line: 73, column: 24, scope: !106)
!109 = !DILocation(line: 73, column: 23, scope: !106)
!110 = !DILocalVariable(name: "source", scope: !111, file: !15, line: 75, type: !50)
!111 = distinct !DILexicalBlock(scope: !106, file: !15, line: 74, column: 9)
!112 = !DILocation(line: 75, column: 18, scope: !111)
!113 = !DILocation(line: 78, column: 13, scope: !111)
!114 = !DILocation(line: 79, column: 23, scope: !111)
!115 = !DILocation(line: 79, column: 13, scope: !111)
!116 = !DILocation(line: 80, column: 18, scope: !111)
!117 = !DILocation(line: 80, column: 13, scope: !111)
!118 = !DILocation(line: 83, column: 1, scope: !81)
