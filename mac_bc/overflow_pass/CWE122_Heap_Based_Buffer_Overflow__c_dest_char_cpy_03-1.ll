; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03_bad() #0 !dbg !14 {
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
  %call3 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef %4) #9, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* noundef %5), !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* noundef %6), !dbg !47
  ret void, !dbg !48
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
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03_good() #0 !dbg !49 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i8* null, i8** %data, align 8, !dbg !75
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !76
  store i8* %call, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %cmp = icmp eq i8* %0, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !86
  store i8 0, i8* %arrayidx, align 1, !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !88, metadata !DIExpression()), !dbg !90
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !91
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !92
  store i8 0, i8* %arrayidx1, align 1, !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !94
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !94
  %3 = load i8*, i8** %data, align 8, !dbg !94
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !94
  %call3 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef %4) #9, !dbg !94
  %5 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* noundef %5), !dbg !96
  %6 = load i8*, i8** %data, align 8, !dbg !97
  call void @free(i8* noundef %6), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  store i8* null, i8** %data, align 8, !dbg !103
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !104
  store i8* %call, i8** %data, align 8, !dbg !107
  %0 = load i8*, i8** %data, align 8, !dbg !108
  %cmp = icmp eq i8* %0, null, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx1, align 1, !dbg !121
  %2 = load i8*, i8** %data, align 8, !dbg !122
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  %3 = load i8*, i8** %data, align 8, !dbg !122
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !122
  %call3 = call i8* @__strcpy_chk(i8* noundef %2, i8* noundef %arraydecay2, i64 noundef %4) #9, !dbg !122
  %5 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* noundef %5), !dbg !124
  %6 = load i8*, i8** %data, align 8, !dbg !125
  call void @free(i8* noundef %6), !dbg !126
  ret void, !dbg !127
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!44 = !DILocation(line: 40, column: 19, scope: !35)
!45 = !DILocation(line: 40, column: 9, scope: !35)
!46 = !DILocation(line: 41, column: 14, scope: !35)
!47 = !DILocation(line: 41, column: 9, scope: !35)
!48 = !DILocation(line: 43, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_03_good", scope: !15, file: !15, line: 100, type: !16, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!50 = !DILocation(line: 102, column: 5, scope: !49)
!51 = !DILocation(line: 103, column: 5, scope: !49)
!52 = !DILocation(line: 104, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 116, type: !54, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 116, type: !56)
!59 = !DILocation(line: 116, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 116, type: !57)
!61 = !DILocation(line: 116, column: 27, scope: !53)
!62 = !DILocation(line: 119, column: 22, scope: !53)
!63 = !DILocation(line: 119, column: 12, scope: !53)
!64 = !DILocation(line: 119, column: 5, scope: !53)
!65 = !DILocation(line: 121, column: 5, scope: !53)
!66 = !DILocation(line: 122, column: 5, scope: !53)
!67 = !DILocation(line: 123, column: 5, scope: !53)
!68 = !DILocation(line: 126, column: 5, scope: !53)
!69 = !DILocation(line: 127, column: 5, scope: !53)
!70 = !DILocation(line: 128, column: 5, scope: !53)
!71 = !DILocation(line: 130, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!73 = !DILocalVariable(name: "data", scope: !72, file: !15, line: 52, type: !3)
!74 = !DILocation(line: 52, column: 12, scope: !72)
!75 = !DILocation(line: 53, column: 10, scope: !72)
!76 = !DILocation(line: 62, column: 24, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !15, line: 60, column: 5)
!78 = distinct !DILexicalBlock(scope: !72, file: !15, line: 54, column: 8)
!79 = !DILocation(line: 62, column: 14, scope: !77)
!80 = !DILocation(line: 63, column: 13, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 63, column: 13)
!82 = !DILocation(line: 63, column: 18, scope: !81)
!83 = !DILocation(line: 63, column: 13, scope: !77)
!84 = !DILocation(line: 63, column: 28, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 63, column: 27)
!86 = !DILocation(line: 64, column: 9, scope: !77)
!87 = !DILocation(line: 64, column: 17, scope: !77)
!88 = !DILocalVariable(name: "source", scope: !89, file: !15, line: 67, type: !36)
!89 = distinct !DILexicalBlock(scope: !72, file: !15, line: 66, column: 5)
!90 = !DILocation(line: 67, column: 14, scope: !89)
!91 = !DILocation(line: 68, column: 9, scope: !89)
!92 = !DILocation(line: 69, column: 9, scope: !89)
!93 = !DILocation(line: 69, column: 23, scope: !89)
!94 = !DILocation(line: 71, column: 9, scope: !89)
!95 = !DILocation(line: 72, column: 19, scope: !89)
!96 = !DILocation(line: 72, column: 9, scope: !89)
!97 = !DILocation(line: 73, column: 14, scope: !89)
!98 = !DILocation(line: 73, column: 9, scope: !89)
!99 = !DILocation(line: 75, column: 1, scope: !72)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!101 = !DILocalVariable(name: "data", scope: !100, file: !15, line: 80, type: !3)
!102 = !DILocation(line: 80, column: 12, scope: !100)
!103 = !DILocation(line: 81, column: 10, scope: !100)
!104 = !DILocation(line: 85, column: 24, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !15, line: 83, column: 5)
!106 = distinct !DILexicalBlock(scope: !100, file: !15, line: 82, column: 8)
!107 = !DILocation(line: 85, column: 14, scope: !105)
!108 = !DILocation(line: 86, column: 13, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 86, column: 13)
!110 = !DILocation(line: 86, column: 18, scope: !109)
!111 = !DILocation(line: 86, column: 13, scope: !105)
!112 = !DILocation(line: 86, column: 28, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !15, line: 86, column: 27)
!114 = !DILocation(line: 87, column: 9, scope: !105)
!115 = !DILocation(line: 87, column: 17, scope: !105)
!116 = !DILocalVariable(name: "source", scope: !117, file: !15, line: 90, type: !36)
!117 = distinct !DILexicalBlock(scope: !100, file: !15, line: 89, column: 5)
!118 = !DILocation(line: 90, column: 14, scope: !117)
!119 = !DILocation(line: 91, column: 9, scope: !117)
!120 = !DILocation(line: 92, column: 9, scope: !117)
!121 = !DILocation(line: 92, column: 23, scope: !117)
!122 = !DILocation(line: 94, column: 9, scope: !117)
!123 = !DILocation(line: 95, column: 19, scope: !117)
!124 = !DILocation(line: 95, column: 9, scope: !117)
!125 = !DILocation(line: 96, column: 14, scope: !117)
!126 = !DILocation(line: 96, column: 9, scope: !117)
!127 = !DILocation(line: 98, column: 1, scope: !100)
