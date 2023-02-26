; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_bad() #0 !dbg !14 {
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
  %1 = load i8*, i8** %data, align 8, !dbg !29
  %call1 = call i8* @badSource(i8* noundef %1), !dbg !30
  store i8* %call1, i8** %data, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !37
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !38
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %call2 = call i64 @strlen(i8* noundef %4), !dbg !38
  %mul = mul i64 %call2, 1, !dbg !38
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %3, i64 noundef %mul, i64 noundef 50) #9, !dbg !38
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* noundef %5), !dbg !42
  %6 = load i8*, i8** %data, align 8, !dbg !43
  call void @free(i8* noundef %6), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @badSource(i8* noundef %data) #0 !dbg !46 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i8*, i8** %data.addr, align 8, !dbg !51
  %1 = load i8*, i8** %data.addr, align 8, !dbg !51
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !51
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #9, !dbg !51
  %3 = load i8*, i8** %data.addr, align 8, !dbg !52
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !52
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  %4 = load i8*, i8** %data.addr, align 8, !dbg !54
  ret i8* %4, !dbg !55
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !89
  %call1 = call i8* @goodG2BSource(i8* noundef %1), !dbg !90
  store i8* %call1, i8** %data, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !95
  %call2 = call i64 @strlen(i8* noundef %4), !dbg !95
  %mul = mul i64 %call2, 1, !dbg !95
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %3, i64 noundef %mul, i64 noundef 50) #9, !dbg !95
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %5 = load i8*, i8** %data, align 8, !dbg !98
  call void @printLine(i8* noundef %5), !dbg !99
  %6 = load i8*, i8** %data, align 8, !dbg !100
  call void @free(i8* noundef %6), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @goodG2BSource(i8* noundef %data) #0 !dbg !103 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i8*, i8** %data.addr, align 8, !dbg !106
  %1 = load i8*, i8** %data.addr, align 8, !dbg !106
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !106
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #9, !dbg !106
  %3 = load i8*, i8** %data.addr, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %4 = load i8*, i8** %data.addr, align 8, !dbg !109
  ret i8* %4, !dbg !110
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_bad", scope: !15, file: !15, line: 31, type: !16, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 33, type: !3)
!20 = !DILocation(line: 33, column: 12, scope: !14)
!21 = !DILocation(line: 34, column: 20, scope: !14)
!22 = !DILocation(line: 34, column: 10, scope: !14)
!23 = !DILocation(line: 35, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 9)
!25 = !DILocation(line: 35, column: 14, scope: !24)
!26 = !DILocation(line: 35, column: 9, scope: !14)
!27 = !DILocation(line: 35, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 35, column: 23)
!29 = !DILocation(line: 36, column: 22, scope: !14)
!30 = !DILocation(line: 36, column: 12, scope: !14)
!31 = !DILocation(line: 36, column: 10, scope: !14)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !15, line: 38, type: !34)
!33 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 38, column: 14, scope: !33)
!38 = !DILocation(line: 40, column: 9, scope: !33)
!39 = !DILocation(line: 41, column: 9, scope: !33)
!40 = !DILocation(line: 41, column: 20, scope: !33)
!41 = !DILocation(line: 42, column: 19, scope: !33)
!42 = !DILocation(line: 42, column: 9, scope: !33)
!43 = !DILocation(line: 43, column: 14, scope: !33)
!44 = !DILocation(line: 43, column: 9, scope: !33)
!45 = !DILocation(line: 45, column: 1, scope: !14)
!46 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !47, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!47 = !DISubroutineType(types: !48)
!48 = !{!3, !3}
!49 = !DILocalVariable(name: "data", arg: 1, scope: !46, file: !15, line: 23, type: !3)
!50 = !DILocation(line: 23, column: 32, scope: !46)
!51 = !DILocation(line: 26, column: 5, scope: !46)
!52 = !DILocation(line: 27, column: 5, scope: !46)
!53 = !DILocation(line: 27, column: 17, scope: !46)
!54 = !DILocation(line: 28, column: 12, scope: !46)
!55 = !DILocation(line: 28, column: 5, scope: !46)
!56 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!57 = !DILocation(line: 78, column: 5, scope: !56)
!58 = !DILocation(line: 79, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !60, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!60 = !DISubroutineType(types: !61)
!61 = !{!62, !62, !63}
!62 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !15, line: 91, type: !62)
!65 = !DILocation(line: 91, column: 14, scope: !59)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !15, line: 91, type: !63)
!67 = !DILocation(line: 91, column: 27, scope: !59)
!68 = !DILocation(line: 94, column: 22, scope: !59)
!69 = !DILocation(line: 94, column: 12, scope: !59)
!70 = !DILocation(line: 94, column: 5, scope: !59)
!71 = !DILocation(line: 96, column: 5, scope: !59)
!72 = !DILocation(line: 97, column: 5, scope: !59)
!73 = !DILocation(line: 98, column: 5, scope: !59)
!74 = !DILocation(line: 101, column: 5, scope: !59)
!75 = !DILocation(line: 102, column: 5, scope: !59)
!76 = !DILocation(line: 103, column: 5, scope: !59)
!77 = !DILocation(line: 105, column: 5, scope: !59)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!79 = !DILocalVariable(name: "data", scope: !78, file: !15, line: 62, type: !3)
!80 = !DILocation(line: 62, column: 12, scope: !78)
!81 = !DILocation(line: 63, column: 20, scope: !78)
!82 = !DILocation(line: 63, column: 10, scope: !78)
!83 = !DILocation(line: 64, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !78, file: !15, line: 64, column: 9)
!85 = !DILocation(line: 64, column: 14, scope: !84)
!86 = !DILocation(line: 64, column: 9, scope: !78)
!87 = !DILocation(line: 64, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !15, line: 64, column: 23)
!89 = !DILocation(line: 65, column: 26, scope: !78)
!90 = !DILocation(line: 65, column: 12, scope: !78)
!91 = !DILocation(line: 65, column: 10, scope: !78)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !15, line: 67, type: !34)
!93 = distinct !DILexicalBlock(scope: !78, file: !15, line: 66, column: 5)
!94 = !DILocation(line: 67, column: 14, scope: !93)
!95 = !DILocation(line: 69, column: 9, scope: !93)
!96 = !DILocation(line: 70, column: 9, scope: !93)
!97 = !DILocation(line: 70, column: 20, scope: !93)
!98 = !DILocation(line: 71, column: 19, scope: !93)
!99 = !DILocation(line: 71, column: 9, scope: !93)
!100 = !DILocation(line: 72, column: 14, scope: !93)
!101 = !DILocation(line: 72, column: 9, scope: !93)
!102 = !DILocation(line: 74, column: 1, scope: !78)
!103 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 51, type: !47, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !15, line: 51, type: !3)
!105 = !DILocation(line: 51, column: 36, scope: !103)
!106 = !DILocation(line: 54, column: 5, scope: !103)
!107 = !DILocation(line: 55, column: 5, scope: !103)
!108 = !DILocation(line: 55, column: 16, scope: !103)
!109 = !DILocation(line: 56, column: 12, scope: !103)
!110 = !DILocation(line: 56, column: 5, scope: !103)
