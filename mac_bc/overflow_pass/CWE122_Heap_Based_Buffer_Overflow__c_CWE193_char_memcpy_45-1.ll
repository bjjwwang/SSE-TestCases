; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_goodG2BData = internal global i8* null, align 8, !dbg !10
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !27
  store i8* %call, i8** %data, align 8, !dbg !28
  %0 = load i8*, i8** %data, align 8, !dbg !29
  %cmp = icmp eq i8* %0, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %1, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* noundef null), !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 noundef %conv), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_good(), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_bad(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !65, metadata !DIExpression()), !dbg !70
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !70
  %2 = load i8*, i8** %data, align 8, !dbg !71
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !71
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !71
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !71
  %add = add i64 %call, 1, !dbg !71
  %mul = mul i64 %add, 1, !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !71
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !71
  %call2 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %4) #9, !dbg !71
  %5 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* noundef %5), !dbg !73
  %6 = load i8*, i8** %data, align 8, !dbg !74
  call void @free(i8* noundef %6), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #6

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  store i8* null, i8** %data, align 8, !dbg !80
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  %cmp = icmp eq i8* %0, null, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !87
  unreachable, !dbg !87

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !89
  store i8* %1, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_goodG2BData, align 8, !dbg !90
  call void @goodG2BSink(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_goodG2BData, align 8, !dbg !96
  store i8* %0, i8** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !99
  %2 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !100
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !100
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !100
  %add = add i64 %call, 1, !dbg !100
  %mul = mul i64 %add, 1, !dbg !100
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !100
  %call2 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %4) #9, !dbg !100
  %5 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* noundef %5), !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* noundef %6), !dbg !104
  ret void, !dbg !105
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_badData", scope: !2, file: !12, line: 26, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_goodG2BData", scope: !2, file: !12, line: 27, type: !5, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_bad", scope: !12, file: !12, line: 44, type: !21, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !12, line: 46, type: !5)
!25 = !DILocation(line: 46, column: 12, scope: !20)
!26 = !DILocation(line: 47, column: 10, scope: !20)
!27 = !DILocation(line: 49, column: 20, scope: !20)
!28 = !DILocation(line: 49, column: 10, scope: !20)
!29 = !DILocation(line: 50, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !12, line: 50, column: 9)
!31 = !DILocation(line: 50, column: 14, scope: !30)
!32 = !DILocation(line: 50, column: 9, scope: !20)
!33 = !DILocation(line: 50, column: 24, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !12, line: 50, column: 23)
!35 = !DILocation(line: 51, column: 74, scope: !20)
!36 = !DILocation(line: 51, column: 72, scope: !20)
!37 = !DILocation(line: 52, column: 5, scope: !20)
!38 = !DILocation(line: 53, column: 1, scope: !20)
!39 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_45_good", scope: !12, file: !12, line: 84, type: !21, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!40 = !DILocation(line: 86, column: 5, scope: !39)
!41 = !DILocation(line: 87, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !43, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !12, line: 98, type: !45)
!48 = !DILocation(line: 98, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !12, line: 98, type: !46)
!50 = !DILocation(line: 98, column: 27, scope: !42)
!51 = !DILocation(line: 101, column: 22, scope: !42)
!52 = !DILocation(line: 101, column: 12, scope: !42)
!53 = !DILocation(line: 101, column: 5, scope: !42)
!54 = !DILocation(line: 103, column: 5, scope: !42)
!55 = !DILocation(line: 104, column: 5, scope: !42)
!56 = !DILocation(line: 105, column: 5, scope: !42)
!57 = !DILocation(line: 108, column: 5, scope: !42)
!58 = !DILocation(line: 109, column: 5, scope: !42)
!59 = !DILocation(line: 110, column: 5, scope: !42)
!60 = !DILocation(line: 112, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !12, file: !12, line: 31, type: !21, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!62 = !DILocalVariable(name: "data", scope: !61, file: !12, line: 33, type: !5)
!63 = !DILocation(line: 33, column: 12, scope: !61)
!64 = !DILocation(line: 33, column: 19, scope: !61)
!65 = !DILocalVariable(name: "source", scope: !66, file: !12, line: 35, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !12, line: 34, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 11)
!70 = !DILocation(line: 35, column: 14, scope: !66)
!71 = !DILocation(line: 38, column: 9, scope: !66)
!72 = !DILocation(line: 39, column: 19, scope: !66)
!73 = !DILocation(line: 39, column: 9, scope: !66)
!74 = !DILocation(line: 40, column: 14, scope: !66)
!75 = !DILocation(line: 40, column: 9, scope: !66)
!76 = !DILocation(line: 42, column: 1, scope: !61)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 73, type: !21, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!78 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 75, type: !5)
!79 = !DILocation(line: 75, column: 12, scope: !77)
!80 = !DILocation(line: 76, column: 10, scope: !77)
!81 = !DILocation(line: 78, column: 20, scope: !77)
!82 = !DILocation(line: 78, column: 10, scope: !77)
!83 = !DILocation(line: 79, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !12, line: 79, column: 9)
!85 = !DILocation(line: 79, column: 14, scope: !84)
!86 = !DILocation(line: 79, column: 9, scope: !77)
!87 = !DILocation(line: 79, column: 24, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !12, line: 79, column: 23)
!89 = !DILocation(line: 80, column: 78, scope: !77)
!90 = !DILocation(line: 80, column: 76, scope: !77)
!91 = !DILocation(line: 81, column: 5, scope: !77)
!92 = !DILocation(line: 82, column: 1, scope: !77)
!93 = distinct !DISubprogram(name: "goodG2BSink", scope: !12, file: !12, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 62, type: !5)
!95 = !DILocation(line: 62, column: 12, scope: !93)
!96 = !DILocation(line: 62, column: 19, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !12, line: 64, type: !67)
!98 = distinct !DILexicalBlock(scope: !93, file: !12, line: 63, column: 5)
!99 = !DILocation(line: 64, column: 14, scope: !98)
!100 = !DILocation(line: 67, column: 9, scope: !98)
!101 = !DILocation(line: 68, column: 19, scope: !98)
!102 = !DILocation(line: 68, column: 9, scope: !98)
!103 = !DILocation(line: 69, column: 14, scope: !98)
!104 = !DILocation(line: 69, column: 9, scope: !98)
!105 = !DILocation(line: 71, column: 1, scope: !93)
