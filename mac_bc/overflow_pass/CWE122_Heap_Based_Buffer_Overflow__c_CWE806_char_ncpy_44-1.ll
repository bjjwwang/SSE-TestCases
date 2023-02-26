; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  %0 = load i8*, i8** %data, align 8, !dbg !28
  %cmp = icmp eq i8* %0, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !34
  %2 = load i8*, i8** %data, align 8, !dbg !34
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !34
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %5 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !37
  %6 = load i8*, i8** %data, align 8, !dbg !38
  call void %5(i8* noundef %6), !dbg !37
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i8* noundef %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !41, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !48
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !49
  %1 = load i8*, i8** %data.addr, align 8, !dbg !49
  %2 = load i8*, i8** %data.addr, align 8, !dbg !49
  %call = call i64 @strlen(i8* noundef %2), !dbg !49
  %call1 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %call, i64 noundef 50) #9, !dbg !49
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !50
  store i8 0, i8* %arrayidx, align 1, !dbg !51
  %3 = load i8*, i8** %data.addr, align 8, !dbg !52
  call void @printLine(i8* noundef %3), !dbg !53
  %4 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @free(i8* noundef %4), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44_good() #0 !dbg !57 {
entry:
  call void @goodG2B(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !82, metadata !DIExpression()), !dbg !83
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !83
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !84
  store i8* %call, i8** %data, align 8, !dbg !85
  %0 = load i8*, i8** %data, align 8, !dbg !86
  %cmp = icmp eq i8* %0, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !92
  %2 = load i8*, i8** %data, align 8, !dbg !92
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !92
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !92
  %4 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %5 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !96
  call void %5(i8* noundef %6), !dbg !95
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i8* noundef %data) #0 !dbg !98 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !101, metadata !DIExpression()), !dbg !103
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !103
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !104
  %1 = load i8*, i8** %data.addr, align 8, !dbg !104
  %2 = load i8*, i8** %data.addr, align 8, !dbg !104
  %call = call i64 @strlen(i8* noundef %2), !dbg !104
  %call1 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %call, i64 noundef 50) #9, !dbg !104
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %3 = load i8*, i8** %data.addr, align 8, !dbg !107
  call void @printLine(i8* noundef %3), !dbg !108
  %4 = load i8*, i8** %data.addr, align 8, !dbg !109
  call void @free(i8* noundef %4), !dbg !110
  ret void, !dbg !111
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn writeonly }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44_bad", scope: !15, file: !15, line: 35, type: !16, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 37, type: !3)
!20 = !DILocation(line: 37, column: 12, scope: !14)
!21 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 39, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !3}
!25 = !DILocation(line: 39, column: 12, scope: !14)
!26 = !DILocation(line: 40, column: 20, scope: !14)
!27 = !DILocation(line: 40, column: 10, scope: !14)
!28 = !DILocation(line: 41, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!30 = !DILocation(line: 41, column: 14, scope: !29)
!31 = !DILocation(line: 41, column: 9, scope: !14)
!32 = !DILocation(line: 41, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 41, column: 23)
!34 = !DILocation(line: 43, column: 5, scope: !14)
!35 = !DILocation(line: 44, column: 5, scope: !14)
!36 = !DILocation(line: 44, column: 17, scope: !14)
!37 = !DILocation(line: 46, column: 5, scope: !14)
!38 = !DILocation(line: 46, column: 13, scope: !14)
!39 = !DILocation(line: 47, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 23, type: !23, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !15, line: 23, type: !3)
!42 = !DILocation(line: 23, column: 28, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 26, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 25, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 26, column: 14, scope: !44)
!49 = !DILocation(line: 28, column: 9, scope: !44)
!50 = !DILocation(line: 29, column: 9, scope: !44)
!51 = !DILocation(line: 29, column: 20, scope: !44)
!52 = !DILocation(line: 30, column: 19, scope: !44)
!53 = !DILocation(line: 30, column: 9, scope: !44)
!54 = !DILocation(line: 31, column: 14, scope: !44)
!55 = !DILocation(line: 31, column: 9, scope: !44)
!56 = !DILocation(line: 33, column: 1, scope: !40)
!57 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_44_good", scope: !15, file: !15, line: 78, type: !16, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!58 = !DILocation(line: 80, column: 5, scope: !57)
!59 = !DILocation(line: 81, column: 1, scope: !57)
!60 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !61, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!61 = !DISubroutineType(types: !62)
!62 = !{!63, !63, !64}
!63 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !15, line: 92, type: !63)
!66 = !DILocation(line: 92, column: 14, scope: !60)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !15, line: 92, type: !64)
!68 = !DILocation(line: 92, column: 27, scope: !60)
!69 = !DILocation(line: 95, column: 22, scope: !60)
!70 = !DILocation(line: 95, column: 12, scope: !60)
!71 = !DILocation(line: 95, column: 5, scope: !60)
!72 = !DILocation(line: 97, column: 5, scope: !60)
!73 = !DILocation(line: 98, column: 5, scope: !60)
!74 = !DILocation(line: 99, column: 5, scope: !60)
!75 = !DILocation(line: 102, column: 5, scope: !60)
!76 = !DILocation(line: 103, column: 5, scope: !60)
!77 = !DILocation(line: 104, column: 5, scope: !60)
!78 = !DILocation(line: 106, column: 5, scope: !60)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 66, type: !16, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!80 = !DILocalVariable(name: "data", scope: !79, file: !15, line: 68, type: !3)
!81 = !DILocation(line: 68, column: 12, scope: !79)
!82 = !DILocalVariable(name: "funcPtr", scope: !79, file: !15, line: 69, type: !22)
!83 = !DILocation(line: 69, column: 12, scope: !79)
!84 = !DILocation(line: 70, column: 20, scope: !79)
!85 = !DILocation(line: 70, column: 10, scope: !79)
!86 = !DILocation(line: 71, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !15, line: 71, column: 9)
!88 = !DILocation(line: 71, column: 14, scope: !87)
!89 = !DILocation(line: 71, column: 9, scope: !79)
!90 = !DILocation(line: 71, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 71, column: 23)
!92 = !DILocation(line: 73, column: 5, scope: !79)
!93 = !DILocation(line: 74, column: 5, scope: !79)
!94 = !DILocation(line: 74, column: 16, scope: !79)
!95 = !DILocation(line: 75, column: 5, scope: !79)
!96 = !DILocation(line: 75, column: 13, scope: !79)
!97 = !DILocation(line: 76, column: 1, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 54, type: !23, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!99 = !DILocalVariable(name: "data", arg: 1, scope: !98, file: !15, line: 54, type: !3)
!100 = !DILocation(line: 54, column: 32, scope: !98)
!101 = !DILocalVariable(name: "dest", scope: !102, file: !15, line: 57, type: !45)
!102 = distinct !DILexicalBlock(scope: !98, file: !15, line: 56, column: 5)
!103 = !DILocation(line: 57, column: 14, scope: !102)
!104 = !DILocation(line: 59, column: 9, scope: !102)
!105 = !DILocation(line: 60, column: 9, scope: !102)
!106 = !DILocation(line: 60, column: 20, scope: !102)
!107 = !DILocation(line: 61, column: 19, scope: !102)
!108 = !DILocation(line: 61, column: 9, scope: !102)
!109 = !DILocation(line: 62, column: 14, scope: !102)
!110 = !DILocation(line: 62, column: 9, scope: !102)
!111 = !DILocation(line: 64, column: 1, scope: !98)
