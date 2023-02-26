; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_badSink(i8* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !26
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !26
  %1 = load i8*, i8** %data.addr, align 8, !dbg !27
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !27
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !27
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !27
  %add = add i64 %call, 1, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !27
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !27
  %call2 = call i8* @__strncpy_chk(i8* noundef %1, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %3) #7, !dbg !27
  %4 = load i8*, i8** %data.addr, align 8, !dbg !28
  call void @printLine(i8* noundef %4), !dbg !29
  %5 = load i8*, i8** %data.addr, align 8, !dbg !30
  call void @free(i8* noundef %5), !dbg !31
  ret void, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_bad() #0 !dbg !33 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !36, metadata !DIExpression()), !dbg !37
  store i8* null, i8** %data, align 8, !dbg !38
  %call = call i8* @malloc(i64 noundef 10) #8, !dbg !39
  store i8* %call, i8** %data, align 8, !dbg !40
  %0 = load i8*, i8** %data, align 8, !dbg !41
  %cmp = icmp eq i8* %0, null, !dbg !43
  br i1 %cmp, label %if.then, label %if.end, !dbg !44

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !45
  unreachable, !dbg !45

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !47
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_badSink(i8* noundef %1), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #5

; Function Attrs: noreturn
declare void @exit(i32 noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_goodG2BSink(i8* noundef %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !53, metadata !DIExpression()), !dbg !55
  %0 = bitcast [11 x i8]* %source to i8*, !dbg !55
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !55
  %1 = load i8*, i8** %data.addr, align 8, !dbg !56
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !56
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !56
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !56
  %add = add i64 %call, 1, !dbg !56
  %2 = load i8*, i8** %data.addr, align 8, !dbg !56
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !56
  %call2 = call i8* @__strncpy_chk(i8* noundef %1, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %3) #7, !dbg !56
  %4 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @printLine(i8* noundef %4), !dbg !58
  %5 = load i8*, i8** %data.addr, align 8, !dbg !59
  call void @free(i8* noundef %5), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_good() #0 !dbg !62 {
entry:
  call void @goodG2B(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* noundef null), !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 noundef %conv), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  store i8* null, i8** %data, align 8, !dbg !87
  %call = call i8* @malloc(i64 noundef 11) #8, !dbg !88
  store i8* %call, i8** %data, align 8, !dbg !89
  %0 = load i8*, i8** %data, align 8, !dbg !90
  %cmp = icmp eq i8* %0, null, !dbg !92
  br i1 %cmp, label %if.then, label %if.end, !dbg !93

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !94
  unreachable, !dbg !94

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_goodG2BSink(i8* noundef %1), !dbg !97
  ret void, !dbg !98
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { allocsize(0) }
attributes #9 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_badSink", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !3}
!18 = !{}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 28, type: !3)
!20 = !DILocation(line: 28, column: 78, scope: !14)
!21 = !DILocalVariable(name: "source", scope: !22, file: !15, line: 31, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 30, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 11)
!26 = !DILocation(line: 31, column: 14, scope: !22)
!27 = !DILocation(line: 34, column: 9, scope: !22)
!28 = !DILocation(line: 35, column: 19, scope: !22)
!29 = !DILocation(line: 35, column: 9, scope: !22)
!30 = !DILocation(line: 36, column: 14, scope: !22)
!31 = !DILocation(line: 36, column: 9, scope: !22)
!32 = !DILocation(line: 38, column: 1, scope: !14)
!33 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_bad", scope: !15, file: !15, line: 40, type: !34, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !DILocalVariable(name: "data", scope: !33, file: !15, line: 42, type: !3)
!37 = !DILocation(line: 42, column: 12, scope: !33)
!38 = !DILocation(line: 43, column: 10, scope: !33)
!39 = !DILocation(line: 45, column: 20, scope: !33)
!40 = !DILocation(line: 45, column: 10, scope: !33)
!41 = !DILocation(line: 46, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !15, line: 46, column: 9)
!43 = !DILocation(line: 46, column: 14, scope: !42)
!44 = !DILocation(line: 46, column: 9, scope: !33)
!45 = !DILocation(line: 46, column: 24, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !15, line: 46, column: 23)
!47 = !DILocation(line: 47, column: 70, scope: !33)
!48 = !DILocation(line: 47, column: 5, scope: !33)
!49 = !DILocation(line: 48, column: 1, scope: !33)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_goodG2BSink", scope: !15, file: !15, line: 54, type: !16, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!51 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !15, line: 54, type: !3)
!52 = !DILocation(line: 54, column: 82, scope: !50)
!53 = !DILocalVariable(name: "source", scope: !54, file: !15, line: 57, type: !23)
!54 = distinct !DILexicalBlock(scope: !50, file: !15, line: 56, column: 5)
!55 = !DILocation(line: 57, column: 14, scope: !54)
!56 = !DILocation(line: 60, column: 9, scope: !54)
!57 = !DILocation(line: 61, column: 19, scope: !54)
!58 = !DILocation(line: 61, column: 9, scope: !54)
!59 = !DILocation(line: 62, column: 14, scope: !54)
!60 = !DILocation(line: 62, column: 9, scope: !54)
!61 = !DILocation(line: 64, column: 1, scope: !50)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_41_good", scope: !15, file: !15, line: 77, type: !34, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!63 = !DILocation(line: 79, column: 5, scope: !62)
!64 = !DILocation(line: 80, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 92, type: !66, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!66 = !DISubroutineType(types: !67)
!67 = !{!68, !68, !69}
!68 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !15, line: 92, type: !68)
!71 = !DILocation(line: 92, column: 14, scope: !65)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !15, line: 92, type: !69)
!73 = !DILocation(line: 92, column: 27, scope: !65)
!74 = !DILocation(line: 95, column: 22, scope: !65)
!75 = !DILocation(line: 95, column: 12, scope: !65)
!76 = !DILocation(line: 95, column: 5, scope: !65)
!77 = !DILocation(line: 97, column: 5, scope: !65)
!78 = !DILocation(line: 98, column: 5, scope: !65)
!79 = !DILocation(line: 99, column: 5, scope: !65)
!80 = !DILocation(line: 102, column: 5, scope: !65)
!81 = !DILocation(line: 103, column: 5, scope: !65)
!82 = !DILocation(line: 104, column: 5, scope: !65)
!83 = !DILocation(line: 106, column: 5, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 67, type: !34, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!85 = !DILocalVariable(name: "data", scope: !84, file: !15, line: 69, type: !3)
!86 = !DILocation(line: 69, column: 12, scope: !84)
!87 = !DILocation(line: 70, column: 10, scope: !84)
!88 = !DILocation(line: 72, column: 20, scope: !84)
!89 = !DILocation(line: 72, column: 10, scope: !84)
!90 = !DILocation(line: 73, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !84, file: !15, line: 73, column: 9)
!92 = !DILocation(line: 73, column: 14, scope: !91)
!93 = !DILocation(line: 73, column: 9, scope: !84)
!94 = !DILocation(line: 73, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !15, line: 73, column: 23)
!96 = !DILocation(line: 74, column: 74, scope: !84)
!97 = !DILocation(line: 74, column: 5, scope: !84)
!98 = !DILocation(line: 75, column: 1, scope: !84)
