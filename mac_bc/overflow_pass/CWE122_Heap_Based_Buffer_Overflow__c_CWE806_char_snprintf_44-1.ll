; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_bad() #0 !dbg !14 {
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
  %call = call i64 @strlen(i8* noundef %1), !dbg !49
  %2 = load i8*, i8** %data.addr, align 8, !dbg !49
  %call1 = call i32 (i8*, i64, i32, i64, i8*, ...) @__snprintf_chk(i8* noundef %arraydecay, i64 noundef %call, i32 noundef 0, i64 noundef 50, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* noundef %2), !dbg !49
  %3 = load i8*, i8** %data.addr, align 8, !dbg !50
  call void @printLine(i8* noundef %3), !dbg !51
  %4 = load i8*, i8** %data.addr, align 8, !dbg !52
  call void @free(i8* noundef %4), !dbg !53
  ret void, !dbg !54
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !63, metadata !DIExpression()), !dbg !64
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %call = call i64 @time(i64* noundef null), !dbg !67
  %conv = trunc i64 %call to i32, !dbg !68
  call void @srand(i32 noundef %conv), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

declare i32 @__snprintf_chk(i8* noundef, i64 noundef, i32 noundef, i64 noundef, i8* noundef, ...) #5

declare i64 @strlen(i8* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !80, metadata !DIExpression()), !dbg !81
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !81
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !82
  store i8* %call, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %cmp = icmp eq i8* %0, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !90
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %5 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !93
  %6 = load i8*, i8** %data, align 8, !dbg !94
  call void %5(i8* noundef %6), !dbg !93
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i8* noundef %data) #0 !dbg !96 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !99, metadata !DIExpression()), !dbg !101
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !101
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !102
  %1 = load i8*, i8** %data.addr, align 8, !dbg !102
  %call = call i64 @strlen(i8* noundef %1), !dbg !102
  %2 = load i8*, i8** %data.addr, align 8, !dbg !102
  %call1 = call i32 (i8*, i64, i32, i64, i8*, ...) @__snprintf_chk(i8* noundef %arraydecay, i64 noundef %call, i32 noundef 0, i64 noundef 50, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0), i8* noundef %2), !dbg !102
  %3 = load i8*, i8** %data.addr, align 8, !dbg !103
  call void @printLine(i8* noundef %3), !dbg !104
  %4 = load i8*, i8** %data.addr, align 8, !dbg !105
  call void @free(i8* noundef %4), !dbg !106
  ret void, !dbg !107
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_bad", scope: !15, file: !15, line: 40, type: !16, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 42, type: !3)
!20 = !DILocation(line: 42, column: 12, scope: !14)
!21 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 44, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !3}
!25 = !DILocation(line: 44, column: 12, scope: !14)
!26 = !DILocation(line: 45, column: 20, scope: !14)
!27 = !DILocation(line: 45, column: 10, scope: !14)
!28 = !DILocation(line: 46, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !14, file: !15, line: 46, column: 9)
!30 = !DILocation(line: 46, column: 14, scope: !29)
!31 = !DILocation(line: 46, column: 9, scope: !14)
!32 = !DILocation(line: 46, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !15, line: 46, column: 23)
!34 = !DILocation(line: 48, column: 5, scope: !14)
!35 = !DILocation(line: 49, column: 5, scope: !14)
!36 = !DILocation(line: 49, column: 17, scope: !14)
!37 = !DILocation(line: 51, column: 5, scope: !14)
!38 = !DILocation(line: 51, column: 13, scope: !14)
!39 = !DILocation(line: 52, column: 1, scope: !14)
!40 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 29, type: !23, scopeLine: 30, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!41 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !15, line: 29, type: !3)
!42 = !DILocation(line: 29, column: 28, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !15, line: 32, type: !45)
!44 = distinct !DILexicalBlock(scope: !40, file: !15, line: 31, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 32, column: 14, scope: !44)
!49 = !DILocation(line: 34, column: 9, scope: !44)
!50 = !DILocation(line: 35, column: 19, scope: !44)
!51 = !DILocation(line: 35, column: 9, scope: !44)
!52 = !DILocation(line: 36, column: 14, scope: !44)
!53 = !DILocation(line: 36, column: 9, scope: !44)
!54 = !DILocation(line: 38, column: 1, scope: !40)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_44_good", scope: !15, file: !15, line: 82, type: !16, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!56 = !DILocation(line: 84, column: 5, scope: !55)
!57 = !DILocation(line: 85, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 96, type: !59, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!59 = !DISubroutineType(types: !60)
!60 = !{!61, !61, !62}
!61 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !15, line: 96, type: !61)
!64 = !DILocation(line: 96, column: 14, scope: !58)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !15, line: 96, type: !62)
!66 = !DILocation(line: 96, column: 27, scope: !58)
!67 = !DILocation(line: 99, column: 22, scope: !58)
!68 = !DILocation(line: 99, column: 12, scope: !58)
!69 = !DILocation(line: 99, column: 5, scope: !58)
!70 = !DILocation(line: 101, column: 5, scope: !58)
!71 = !DILocation(line: 102, column: 5, scope: !58)
!72 = !DILocation(line: 103, column: 5, scope: !58)
!73 = !DILocation(line: 106, column: 5, scope: !58)
!74 = !DILocation(line: 107, column: 5, scope: !58)
!75 = !DILocation(line: 108, column: 5, scope: !58)
!76 = !DILocation(line: 110, column: 5, scope: !58)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 70, type: !16, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 72, type: !3)
!79 = !DILocation(line: 72, column: 12, scope: !77)
!80 = !DILocalVariable(name: "funcPtr", scope: !77, file: !15, line: 73, type: !22)
!81 = !DILocation(line: 73, column: 12, scope: !77)
!82 = !DILocation(line: 74, column: 20, scope: !77)
!83 = !DILocation(line: 74, column: 10, scope: !77)
!84 = !DILocation(line: 75, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !15, line: 75, column: 9)
!86 = !DILocation(line: 75, column: 14, scope: !85)
!87 = !DILocation(line: 75, column: 9, scope: !77)
!88 = !DILocation(line: 75, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !15, line: 75, column: 23)
!90 = !DILocation(line: 77, column: 5, scope: !77)
!91 = !DILocation(line: 78, column: 5, scope: !77)
!92 = !DILocation(line: 78, column: 16, scope: !77)
!93 = !DILocation(line: 79, column: 5, scope: !77)
!94 = !DILocation(line: 79, column: 13, scope: !77)
!95 = !DILocation(line: 80, column: 1, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 59, type: !23, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!97 = !DILocalVariable(name: "data", arg: 1, scope: !96, file: !15, line: 59, type: !3)
!98 = !DILocation(line: 59, column: 32, scope: !96)
!99 = !DILocalVariable(name: "dest", scope: !100, file: !15, line: 62, type: !45)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 61, column: 5)
!101 = !DILocation(line: 62, column: 14, scope: !100)
!102 = !DILocation(line: 64, column: 9, scope: !100)
!103 = !DILocation(line: 65, column: 19, scope: !100)
!104 = !DILocation(line: 65, column: 9, scope: !100)
!105 = !DILocation(line: 66, column: 14, scope: !100)
!106 = !DILocation(line: 66, column: 9, scope: !100)
!107 = !DILocation(line: 68, column: 1, scope: !96)
