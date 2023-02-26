; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  %cmp = icmp eq i8* %0, null, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !30
  unreachable, !dbg !30

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !39
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !40
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !41
  store i8 0, i8* %arrayidx1, align 1, !dbg !42
  %2 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  %3 = load i8*, i8** %data, align 8, !dbg !43
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !43
  %call3 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef 99, i64 noundef %4) #9, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !44
  store i8 0, i8* %arrayidx4, align 1, !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* noundef %6), !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* noundef %7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i8* null, i8** %data, align 8, !dbg !77
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !78
  store i8* %call, i8** %data, align 8, !dbg !81
  %0 = load i8*, i8** %data, align 8, !dbg !82
  %cmp = icmp eq i8* %0, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !93
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx1, align 1, !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !96
  %call3 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef 99, i64 noundef %4) #9, !dbg !96
  %5 = load i8*, i8** %data, align 8, !dbg !97
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !97
  store i8 0, i8* %arrayidx4, align 1, !dbg !98
  %6 = load i8*, i8** %data, align 8, !dbg !99
  call void @printLine(i8* noundef %6), !dbg !100
  %7 = load i8*, i8** %data, align 8, !dbg !101
  call void @free(i8* noundef %7), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i8* null, i8** %data, align 8, !dbg !107
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !108
  store i8* %call, i8** %data, align 8, !dbg !111
  %0 = load i8*, i8** %data, align 8, !dbg !112
  %cmp = icmp eq i8* %0, null, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx1, align 1, !dbg !125
  %2 = load i8*, i8** %data, align 8, !dbg !126
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !126
  %3 = load i8*, i8** %data, align 8, !dbg !126
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !126
  %call3 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef 99, i64 noundef %4) #9, !dbg !126
  %5 = load i8*, i8** %data, align 8, !dbg !127
  %arrayidx4 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !127
  store i8 0, i8* %arrayidx4, align 1, !dbg !128
  %6 = load i8*, i8** %data, align 8, !dbg !129
  call void @printLine(i8* noundef %6), !dbg !130
  %7 = load i8*, i8** %data, align 8, !dbg !131
  call void @free(i8* noundef %7), !dbg !132
  ret void, !dbg !133
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 30, column: 24, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !15, line: 28, column: 5)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 8)
!25 = !DILocation(line: 30, column: 14, scope: !23)
!26 = !DILocation(line: 31, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 31, column: 13)
!28 = !DILocation(line: 31, column: 18, scope: !27)
!29 = !DILocation(line: 31, column: 13, scope: !23)
!30 = !DILocation(line: 31, column: 28, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !15, line: 31, column: 27)
!32 = !DILocation(line: 32, column: 9, scope: !23)
!33 = !DILocation(line: 32, column: 17, scope: !23)
!34 = !DILocalVariable(name: "source", scope: !35, file: !15, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 100)
!39 = !DILocation(line: 35, column: 14, scope: !35)
!40 = !DILocation(line: 36, column: 9, scope: !35)
!41 = !DILocation(line: 37, column: 9, scope: !35)
!42 = !DILocation(line: 37, column: 23, scope: !35)
!43 = !DILocation(line: 39, column: 9, scope: !35)
!44 = !DILocation(line: 40, column: 9, scope: !35)
!45 = !DILocation(line: 40, column: 21, scope: !35)
!46 = !DILocation(line: 41, column: 19, scope: !35)
!47 = !DILocation(line: 41, column: 9, scope: !35)
!48 = !DILocation(line: 42, column: 14, scope: !35)
!49 = !DILocation(line: 42, column: 9, scope: !35)
!50 = !DILocation(line: 44, column: 1, scope: !14)
!51 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_char_ncpy_02_good", scope: !15, file: !15, line: 103, type: !16, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!52 = !DILocation(line: 105, column: 5, scope: !51)
!53 = !DILocation(line: 106, column: 5, scope: !51)
!54 = !DILocation(line: 107, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 119, type: !56, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !15, line: 119, type: !58)
!61 = !DILocation(line: 119, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !15, line: 119, type: !59)
!63 = !DILocation(line: 119, column: 27, scope: !55)
!64 = !DILocation(line: 122, column: 22, scope: !55)
!65 = !DILocation(line: 122, column: 12, scope: !55)
!66 = !DILocation(line: 122, column: 5, scope: !55)
!67 = !DILocation(line: 124, column: 5, scope: !55)
!68 = !DILocation(line: 125, column: 5, scope: !55)
!69 = !DILocation(line: 126, column: 5, scope: !55)
!70 = !DILocation(line: 129, column: 5, scope: !55)
!71 = !DILocation(line: 130, column: 5, scope: !55)
!72 = !DILocation(line: 131, column: 5, scope: !55)
!73 = !DILocation(line: 133, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!75 = !DILocalVariable(name: "data", scope: !74, file: !15, line: 53, type: !3)
!76 = !DILocation(line: 53, column: 12, scope: !74)
!77 = !DILocation(line: 54, column: 10, scope: !74)
!78 = !DILocation(line: 63, column: 24, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !15, line: 61, column: 5)
!80 = distinct !DILexicalBlock(scope: !74, file: !15, line: 55, column: 8)
!81 = !DILocation(line: 63, column: 14, scope: !79)
!82 = !DILocation(line: 64, column: 13, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !15, line: 64, column: 13)
!84 = !DILocation(line: 64, column: 18, scope: !83)
!85 = !DILocation(line: 64, column: 13, scope: !79)
!86 = !DILocation(line: 64, column: 28, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !15, line: 64, column: 27)
!88 = !DILocation(line: 65, column: 9, scope: !79)
!89 = !DILocation(line: 65, column: 17, scope: !79)
!90 = !DILocalVariable(name: "source", scope: !91, file: !15, line: 68, type: !36)
!91 = distinct !DILexicalBlock(scope: !74, file: !15, line: 67, column: 5)
!92 = !DILocation(line: 68, column: 14, scope: !91)
!93 = !DILocation(line: 69, column: 9, scope: !91)
!94 = !DILocation(line: 70, column: 9, scope: !91)
!95 = !DILocation(line: 70, column: 23, scope: !91)
!96 = !DILocation(line: 72, column: 9, scope: !91)
!97 = !DILocation(line: 73, column: 9, scope: !91)
!98 = !DILocation(line: 73, column: 21, scope: !91)
!99 = !DILocation(line: 74, column: 19, scope: !91)
!100 = !DILocation(line: 74, column: 9, scope: !91)
!101 = !DILocation(line: 75, column: 14, scope: !91)
!102 = !DILocation(line: 75, column: 9, scope: !91)
!103 = !DILocation(line: 77, column: 1, scope: !74)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 80, type: !16, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!105 = !DILocalVariable(name: "data", scope: !104, file: !15, line: 82, type: !3)
!106 = !DILocation(line: 82, column: 12, scope: !104)
!107 = !DILocation(line: 83, column: 10, scope: !104)
!108 = !DILocation(line: 87, column: 24, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !15, line: 85, column: 5)
!110 = distinct !DILexicalBlock(scope: !104, file: !15, line: 84, column: 8)
!111 = !DILocation(line: 87, column: 14, scope: !109)
!112 = !DILocation(line: 88, column: 13, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 88, column: 13)
!114 = !DILocation(line: 88, column: 18, scope: !113)
!115 = !DILocation(line: 88, column: 13, scope: !109)
!116 = !DILocation(line: 88, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !15, line: 88, column: 27)
!118 = !DILocation(line: 89, column: 9, scope: !109)
!119 = !DILocation(line: 89, column: 17, scope: !109)
!120 = !DILocalVariable(name: "source", scope: !121, file: !15, line: 92, type: !36)
!121 = distinct !DILexicalBlock(scope: !104, file: !15, line: 91, column: 5)
!122 = !DILocation(line: 92, column: 14, scope: !121)
!123 = !DILocation(line: 93, column: 9, scope: !121)
!124 = !DILocation(line: 94, column: 9, scope: !121)
!125 = !DILocation(line: 94, column: 23, scope: !121)
!126 = !DILocation(line: 96, column: 9, scope: !121)
!127 = !DILocation(line: 97, column: 9, scope: !121)
!128 = !DILocation(line: 97, column: 21, scope: !121)
!129 = !DILocation(line: 98, column: 19, scope: !121)
!130 = !DILocation(line: 98, column: 9, scope: !121)
!131 = !DILocation(line: 99, column: 14, scope: !121)
!132 = !DILocation(line: 99, column: 9, scope: !121)
!133 = !DILocation(line: 101, column: 1, scope: !104)
