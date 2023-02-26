; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !34, metadata !DIExpression()), !dbg !36
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !37
  %2 = load i8*, i8** %1, align 8, !dbg !38
  store i8* %2, i8** %data1, align 8, !dbg !36
  %3 = load i8*, i8** %data1, align 8, !dbg !39
  %4 = load i8*, i8** %data1, align 8, !dbg !39
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !39
  %call2 = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 99, i64 noundef %5) #9, !dbg !39
  %6 = load i8*, i8** %data1, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 99, !dbg !40
  store i8 0, i8* %arrayidx, align 1, !dbg !41
  %7 = load i8*, i8** %data1, align 8, !dbg !42
  %8 = load i8**, i8*** %dataPtr1, align 8, !dbg !43
  store i8* %7, i8** %8, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !45, metadata !DIExpression()), !dbg !47
  %9 = load i8**, i8*** %dataPtr2, align 8, !dbg !48
  %10 = load i8*, i8** %9, align 8, !dbg !49
  store i8* %10, i8** %data3, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !55
  %11 = bitcast [50 x i8]* %dest to i8*, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 50, i1 false), !dbg !55
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !56
  %12 = load i8*, i8** %data3, align 8, !dbg !56
  %13 = load i8*, i8** %data3, align 8, !dbg !56
  %call4 = call i64 @strlen(i8* noundef %13), !dbg !56
  %mul = mul i64 %call4, 1, !dbg !56
  %call5 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %12, i64 noundef %mul, i64 noundef 50) #9, !dbg !56
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !57
  store i8 0, i8* %arrayidx6, align 1, !dbg !58
  %14 = load i8*, i8** %data3, align 8, !dbg !59
  call void @printLine(i8* noundef %14), !dbg !60
  %15 = load i8*, i8** %data3, align 8, !dbg !61
  call void @free(i8* noundef %15), !dbg !62
  ret void, !dbg !63
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
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32_good() #0 !dbg !64 {
entry:
  call void @goodG2B(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* noundef null), !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 noundef %conv), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !91
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !92
  store i8* %call, i8** %data, align 8, !dbg !93
  %0 = load i8*, i8** %data, align 8, !dbg !94
  %cmp = icmp eq i8* %0, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !100, metadata !DIExpression()), !dbg !102
  %1 = load i8**, i8*** %dataPtr1, align 8, !dbg !103
  %2 = load i8*, i8** %1, align 8, !dbg !104
  store i8* %2, i8** %data1, align 8, !dbg !102
  %3 = load i8*, i8** %data1, align 8, !dbg !105
  %4 = load i8*, i8** %data1, align 8, !dbg !105
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !105
  %call2 = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #9, !dbg !105
  %6 = load i8*, i8** %data1, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  %7 = load i8*, i8** %data1, align 8, !dbg !108
  %8 = load i8**, i8*** %dataPtr1, align 8, !dbg !109
  store i8* %7, i8** %8, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !111, metadata !DIExpression()), !dbg !113
  %9 = load i8**, i8*** %dataPtr2, align 8, !dbg !114
  %10 = load i8*, i8** %9, align 8, !dbg !115
  store i8* %10, i8** %data3, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %11 = bitcast [50 x i8]* %dest to i8*, !dbg !118
  call void @llvm.memset.p0i8.i64(i8* align 16 %11, i8 0, i64 50, i1 false), !dbg !118
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !119
  %12 = load i8*, i8** %data3, align 8, !dbg !119
  %13 = load i8*, i8** %data3, align 8, !dbg !119
  %call4 = call i64 @strlen(i8* noundef %13), !dbg !119
  %mul = mul i64 %call4, 1, !dbg !119
  %call5 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %12, i64 noundef %mul, i64 noundef 50) #9, !dbg !119
  %arrayidx6 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !120
  store i8 0, i8* %arrayidx6, align 1, !dbg !121
  %14 = load i8*, i8** %data3, align 8, !dbg !122
  call void @printLine(i8* noundef %14), !dbg !123
  %15 = load i8*, i8** %data3, align 8, !dbg !124
  call void @free(i8* noundef %15), !dbg !125
  ret void, !dbg !126
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!23 = !DILocation(line: 26, column: 13, scope: !14)
!24 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 13, scope: !14)
!26 = !DILocation(line: 28, column: 20, scope: !14)
!27 = !DILocation(line: 28, column: 10, scope: !14)
!28 = !DILocation(line: 29, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 9)
!30 = !DILocation(line: 29, column: 14, scope: !29)
!31 = !DILocation(line: 29, column: 9, scope: !14)
!32 = !DILocation(line: 29, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 29, column: 23)
!34 = !DILocalVariable(name: "data", scope: !35, file: !15, line: 31, type: !3)
!35 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!36 = !DILocation(line: 31, column: 16, scope: !35)
!37 = !DILocation(line: 31, column: 24, scope: !35)
!38 = !DILocation(line: 31, column: 23, scope: !35)
!39 = !DILocation(line: 33, column: 9, scope: !35)
!40 = !DILocation(line: 34, column: 9, scope: !35)
!41 = !DILocation(line: 34, column: 21, scope: !35)
!42 = !DILocation(line: 35, column: 21, scope: !35)
!43 = !DILocation(line: 35, column: 10, scope: !35)
!44 = !DILocation(line: 35, column: 19, scope: !35)
!45 = !DILocalVariable(name: "data", scope: !46, file: !15, line: 38, type: !3)
!46 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!47 = !DILocation(line: 38, column: 16, scope: !46)
!48 = !DILocation(line: 38, column: 24, scope: !46)
!49 = !DILocation(line: 38, column: 23, scope: !46)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !15, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !46, file: !15, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 50)
!55 = !DILocation(line: 40, column: 18, scope: !51)
!56 = !DILocation(line: 42, column: 13, scope: !51)
!57 = !DILocation(line: 43, column: 13, scope: !51)
!58 = !DILocation(line: 43, column: 24, scope: !51)
!59 = !DILocation(line: 44, column: 23, scope: !51)
!60 = !DILocation(line: 44, column: 13, scope: !51)
!61 = !DILocation(line: 45, column: 18, scope: !51)
!62 = !DILocation(line: 45, column: 13, scope: !51)
!63 = !DILocation(line: 48, column: 1, scope: !14)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_32_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!65 = !DILocation(line: 84, column: 5, scope: !64)
!66 = !DILocation(line: 85, column: 1, scope: !64)
!67 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !68, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!68 = !DISubroutineType(types: !69)
!69 = !{!70, !70, !22}
!70 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !15, line: 96, type: !70)
!72 = !DILocation(line: 96, column: 14, scope: !67)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !15, line: 96, type: !22)
!74 = !DILocation(line: 96, column: 27, scope: !67)
!75 = !DILocation(line: 99, column: 22, scope: !67)
!76 = !DILocation(line: 99, column: 12, scope: !67)
!77 = !DILocation(line: 99, column: 5, scope: !67)
!78 = !DILocation(line: 101, column: 5, scope: !67)
!79 = !DILocation(line: 102, column: 5, scope: !67)
!80 = !DILocation(line: 103, column: 5, scope: !67)
!81 = !DILocation(line: 106, column: 5, scope: !67)
!82 = !DILocation(line: 107, column: 5, scope: !67)
!83 = !DILocation(line: 108, column: 5, scope: !67)
!84 = !DILocation(line: 110, column: 5, scope: !67)
!85 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 55, type: !16, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!86 = !DILocalVariable(name: "data", scope: !85, file: !15, line: 57, type: !3)
!87 = !DILocation(line: 57, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataPtr1", scope: !85, file: !15, line: 58, type: !22)
!89 = !DILocation(line: 58, column: 13, scope: !85)
!90 = !DILocalVariable(name: "dataPtr2", scope: !85, file: !15, line: 59, type: !22)
!91 = !DILocation(line: 59, column: 13, scope: !85)
!92 = !DILocation(line: 60, column: 20, scope: !85)
!93 = !DILocation(line: 60, column: 10, scope: !85)
!94 = !DILocation(line: 61, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !85, file: !15, line: 61, column: 9)
!96 = !DILocation(line: 61, column: 14, scope: !95)
!97 = !DILocation(line: 61, column: 9, scope: !85)
!98 = !DILocation(line: 61, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 61, column: 23)
!100 = !DILocalVariable(name: "data", scope: !101, file: !15, line: 63, type: !3)
!101 = distinct !DILexicalBlock(scope: !85, file: !15, line: 62, column: 5)
!102 = !DILocation(line: 63, column: 16, scope: !101)
!103 = !DILocation(line: 63, column: 24, scope: !101)
!104 = !DILocation(line: 63, column: 23, scope: !101)
!105 = !DILocation(line: 65, column: 9, scope: !101)
!106 = !DILocation(line: 66, column: 9, scope: !101)
!107 = !DILocation(line: 66, column: 20, scope: !101)
!108 = !DILocation(line: 67, column: 21, scope: !101)
!109 = !DILocation(line: 67, column: 10, scope: !101)
!110 = !DILocation(line: 67, column: 19, scope: !101)
!111 = !DILocalVariable(name: "data", scope: !112, file: !15, line: 70, type: !3)
!112 = distinct !DILexicalBlock(scope: !85, file: !15, line: 69, column: 5)
!113 = !DILocation(line: 70, column: 16, scope: !112)
!114 = !DILocation(line: 70, column: 24, scope: !112)
!115 = !DILocation(line: 70, column: 23, scope: !112)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !15, line: 72, type: !52)
!117 = distinct !DILexicalBlock(scope: !112, file: !15, line: 71, column: 9)
!118 = !DILocation(line: 72, column: 18, scope: !117)
!119 = !DILocation(line: 74, column: 13, scope: !117)
!120 = !DILocation(line: 75, column: 13, scope: !117)
!121 = !DILocation(line: 75, column: 24, scope: !117)
!122 = !DILocation(line: 76, column: 23, scope: !117)
!123 = !DILocation(line: 76, column: 13, scope: !117)
!124 = !DILocation(line: 77, column: 18, scope: !117)
!125 = !DILocation(line: 77, column: 13, scope: !117)
!126 = !DILocation(line: 80, column: 1, scope: !85)
