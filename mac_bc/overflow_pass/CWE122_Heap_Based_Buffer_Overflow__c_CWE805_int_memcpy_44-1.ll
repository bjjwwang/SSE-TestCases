; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44_bad() #0 !dbg !14 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !21, metadata !DIExpression()), !dbg !25
  store void (i32*)* @badSink, void (i32*)** %funcPtr, align 8, !dbg !25
  store i32* null, i32** %data, align 8, !dbg !26
  %call = call i8* @malloc(i64 noundef 200) #7, !dbg !27
  %0 = bitcast i8* %call to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !36
  %3 = load i32*, i32** %data, align 8, !dbg !37
  call void %2(i32* noundef %3), !dbg !36
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32* noundef %data) #0 !dbg !39 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !40, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !47
  %1 = load i32*, i32** %data.addr, align 8, !dbg !48
  %2 = bitcast i32* %1 to i8*, !dbg !48
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !48
  %3 = bitcast i32* %arraydecay to i8*, !dbg !48
  %4 = load i32*, i32** %data.addr, align 8, !dbg !48
  %5 = bitcast i32* %4 to i8*, !dbg !48
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !48
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #9, !dbg !48
  %7 = load i32*, i32** %data.addr, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !49
  %8 = load i32, i32* %arrayidx, align 4, !dbg !49
  call void @printIntLine(i32 noundef %8), !dbg !50
  %9 = load i32*, i32** %data.addr, align 8, !dbg !51
  %10 = bitcast i32* %9 to i8*, !dbg !51
  call void @free(i8* noundef %10), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44_good() #0 !dbg !54 {
entry:
  call void @goodG2B(), !dbg !55
  ret void, !dbg !56
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !57 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44_good(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44_bad(), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !75
  ret i32 0, !dbg !76
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i32*, align 8
  %funcPtr = alloca void (i32*)*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata void (i32*)** %funcPtr, metadata !80, metadata !DIExpression()), !dbg !81
  store void (i32*)* @goodG2BSink, void (i32*)** %funcPtr, align 8, !dbg !81
  store i32* null, i32** %data, align 8, !dbg !82
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !83
  %0 = bitcast i8* %call to i32*, !dbg !84
  store i32* %0, i32** %data, align 8, !dbg !85
  %1 = load i32*, i32** %data, align 8, !dbg !86
  %cmp = icmp eq i32* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load void (i32*)*, void (i32*)** %funcPtr, align 8, !dbg !92
  %3 = load i32*, i32** %data, align 8, !dbg !93
  call void %2(i32* noundef %3), !dbg !92
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32* noundef %data) #0 !dbg !95 {
entry:
  %data.addr = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %0 = bitcast [100 x i32]* %source to i8*, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 400, i1 false), !dbg !100
  %1 = load i32*, i32** %data.addr, align 8, !dbg !101
  %2 = bitcast i32* %1 to i8*, !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !101
  %3 = bitcast i32* %arraydecay to i8*, !dbg !101
  %4 = load i32*, i32** %data.addr, align 8, !dbg !101
  %5 = bitcast i32* %4 to i8*, !dbg !101
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !101
  %call = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %3, i64 noundef 400, i64 noundef %6) #9, !dbg !101
  %7 = load i32*, i32** %data.addr, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %7, i64 0, !dbg !102
  %8 = load i32, i32* %arrayidx, align 4, !dbg !102
  call void @printIntLine(i32 noundef %8), !dbg !103
  %9 = load i32*, i32** %data.addr, align 8, !dbg !104
  %10 = bitcast i32* %9 to i8*, !dbg !104
  call void @free(i8* noundef %10), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44_bad", scope: !15, file: !15, line: 32, type: !16, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 34, type: !3)
!20 = !DILocation(line: 34, column: 11, scope: !14)
!21 = !DILocalVariable(name: "funcPtr", scope: !14, file: !15, line: 36, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DISubroutineType(types: !24)
!24 = !{null, !3}
!25 = !DILocation(line: 36, column: 12, scope: !14)
!26 = !DILocation(line: 37, column: 10, scope: !14)
!27 = !DILocation(line: 39, column: 19, scope: !14)
!28 = !DILocation(line: 39, column: 12, scope: !14)
!29 = !DILocation(line: 39, column: 10, scope: !14)
!30 = !DILocation(line: 40, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 40, column: 9)
!32 = !DILocation(line: 40, column: 14, scope: !31)
!33 = !DILocation(line: 40, column: 9, scope: !14)
!34 = !DILocation(line: 40, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !15, line: 40, column: 23)
!36 = !DILocation(line: 42, column: 5, scope: !14)
!37 = !DILocation(line: 42, column: 13, scope: !14)
!38 = !DILocation(line: 43, column: 1, scope: !14)
!39 = distinct !DISubprogram(name: "badSink", scope: !15, file: !15, line: 21, type: !23, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!40 = !DILocalVariable(name: "data", arg: 1, scope: !39, file: !15, line: 21, type: !3)
!41 = !DILocation(line: 21, column: 27, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !15, line: 24, type: !44)
!43 = distinct !DILexicalBlock(scope: !39, file: !15, line: 23, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 24, column: 13, scope: !43)
!48 = !DILocation(line: 26, column: 9, scope: !43)
!49 = !DILocation(line: 27, column: 22, scope: !43)
!50 = !DILocation(line: 27, column: 9, scope: !43)
!51 = !DILocation(line: 28, column: 14, scope: !43)
!52 = !DILocation(line: 28, column: 9, scope: !43)
!53 = !DILocation(line: 30, column: 1, scope: !39)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int_memcpy_44_good", scope: !15, file: !15, line: 72, type: !16, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!55 = !DILocation(line: 74, column: 5, scope: !54)
!56 = !DILocation(line: 75, column: 1, scope: !54)
!57 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 86, type: !58, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!58 = !DISubroutineType(types: !59)
!59 = !{!4, !4, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !DILocalVariable(name: "argc", arg: 1, scope: !57, file: !15, line: 86, type: !4)
!64 = !DILocation(line: 86, column: 14, scope: !57)
!65 = !DILocalVariable(name: "argv", arg: 2, scope: !57, file: !15, line: 86, type: !60)
!66 = !DILocation(line: 86, column: 27, scope: !57)
!67 = !DILocation(line: 89, column: 22, scope: !57)
!68 = !DILocation(line: 89, column: 12, scope: !57)
!69 = !DILocation(line: 89, column: 5, scope: !57)
!70 = !DILocation(line: 91, column: 5, scope: !57)
!71 = !DILocation(line: 92, column: 5, scope: !57)
!72 = !DILocation(line: 93, column: 5, scope: !57)
!73 = !DILocation(line: 96, column: 5, scope: !57)
!74 = !DILocation(line: 97, column: 5, scope: !57)
!75 = !DILocation(line: 98, column: 5, scope: !57)
!76 = !DILocation(line: 100, column: 5, scope: !57)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 61, type: !16, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!78 = !DILocalVariable(name: "data", scope: !77, file: !15, line: 63, type: !3)
!79 = !DILocation(line: 63, column: 11, scope: !77)
!80 = !DILocalVariable(name: "funcPtr", scope: !77, file: !15, line: 64, type: !22)
!81 = !DILocation(line: 64, column: 12, scope: !77)
!82 = !DILocation(line: 65, column: 10, scope: !77)
!83 = !DILocation(line: 67, column: 19, scope: !77)
!84 = !DILocation(line: 67, column: 12, scope: !77)
!85 = !DILocation(line: 67, column: 10, scope: !77)
!86 = !DILocation(line: 68, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !77, file: !15, line: 68, column: 9)
!88 = !DILocation(line: 68, column: 14, scope: !87)
!89 = !DILocation(line: 68, column: 9, scope: !77)
!90 = !DILocation(line: 68, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 68, column: 23)
!92 = !DILocation(line: 69, column: 5, scope: !77)
!93 = !DILocation(line: 69, column: 13, scope: !77)
!94 = !DILocation(line: 70, column: 1, scope: !77)
!95 = distinct !DISubprogram(name: "goodG2BSink", scope: !15, file: !15, line: 50, type: !23, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!96 = !DILocalVariable(name: "data", arg: 1, scope: !95, file: !15, line: 50, type: !3)
!97 = !DILocation(line: 50, column: 31, scope: !95)
!98 = !DILocalVariable(name: "source", scope: !99, file: !15, line: 53, type: !44)
!99 = distinct !DILexicalBlock(scope: !95, file: !15, line: 52, column: 5)
!100 = !DILocation(line: 53, column: 13, scope: !99)
!101 = !DILocation(line: 55, column: 9, scope: !99)
!102 = !DILocation(line: 56, column: 22, scope: !99)
!103 = !DILocation(line: 56, column: 9, scope: !99)
!104 = !DILocation(line: 57, column: 14, scope: !99)
!105 = !DILocation(line: 57, column: 9, scope: !99)
!106 = !DILocation(line: 59, column: 1, scope: !95)
