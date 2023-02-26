; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_badSink(i8* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !21, metadata !DIExpression()), !dbg !26
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !27
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %0 = load i8*, i8** %data.addr, align 8, !dbg !30
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !30
  %1 = load i8*, i8** %data.addr, align 8, !dbg !30
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !30
  %call = call i8* @__strcpy_chk(i8* noundef %0, i8* noundef %arraydecay1, i64 noundef %2) #7, !dbg !30
  %3 = load i8*, i8** %data.addr, align 8, !dbg !31
  call void @printLine(i8* noundef %3), !dbg !32
  %4 = load i8*, i8** %data.addr, align 8, !dbg !33
  call void @free(i8* noundef %4), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !39, metadata !DIExpression()), !dbg !40
  store i8* null, i8** %data, align 8, !dbg !41
  %call = call i8* @malloc(i64 noundef 50) #8, !dbg !42
  store i8* %call, i8** %data, align 8, !dbg !43
  %0 = load i8*, i8** %data, align 8, !dbg !44
  %cmp = icmp eq i8* %0, null, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !50
  store i8 0, i8* %arrayidx, align 1, !dbg !51
  %2 = load i8*, i8** %data, align 8, !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_badSink(i8* noundef %2), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #5

; Function Attrs: noreturn
declare void @exit(i32 noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_goodG2BSink(i8* noundef %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !58, metadata !DIExpression()), !dbg !60
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !61
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx, align 1, !dbg !63
  %0 = load i8*, i8** %data.addr, align 8, !dbg !64
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !64
  %1 = load i8*, i8** %data.addr, align 8, !dbg !64
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !64
  %call = call i8* @__strcpy_chk(i8* noundef %0, i8* noundef %arraydecay1, i64 noundef %2) #7, !dbg !64
  %3 = load i8*, i8** %data.addr, align 8, !dbg !65
  call void @printLine(i8* noundef %3), !dbg !66
  %4 = load i8*, i8** %data.addr, align 8, !dbg !67
  call void @free(i8* noundef %4), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* noundef null), !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 noundef %conv), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_good(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_bad(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  store i8* null, i8** %data, align 8, !dbg !95
  %call = call i8* @malloc(i64 noundef 100) #8, !dbg !96
  store i8* %call, i8** %data, align 8, !dbg !97
  %0 = load i8*, i8** %data, align 8, !dbg !98
  %cmp = icmp eq i8* %0, null, !dbg !100
  br i1 %cmp, label %if.then, label %if.end, !dbg !101

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !102
  unreachable, !dbg !102

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %2 = load i8*, i8** %data, align 8, !dbg !106
  call void @CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_goodG2BSink(i8* noundef %2), !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !3}
!18 = !{}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 75, scope: !14)
!21 = !DILocalVariable(name: "source", scope: !22, file: !15, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 100)
!26 = !DILocation(line: 26, column: 14, scope: !22)
!27 = !DILocation(line: 27, column: 9, scope: !22)
!28 = !DILocation(line: 28, column: 9, scope: !22)
!29 = !DILocation(line: 28, column: 23, scope: !22)
!30 = !DILocation(line: 30, column: 9, scope: !22)
!31 = !DILocation(line: 31, column: 19, scope: !22)
!32 = !DILocation(line: 31, column: 9, scope: !22)
!33 = !DILocation(line: 32, column: 14, scope: !22)
!34 = !DILocation(line: 32, column: 9, scope: !22)
!35 = !DILocation(line: 34, column: 1, scope: !14)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_bad", scope: !15, file: !15, line: 36, type: !37, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !15, line: 38, type: !3)
!40 = !DILocation(line: 38, column: 12, scope: !36)
!41 = !DILocation(line: 39, column: 10, scope: !36)
!42 = !DILocation(line: 41, column: 20, scope: !36)
!43 = !DILocation(line: 41, column: 10, scope: !36)
!44 = !DILocation(line: 42, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !36, file: !15, line: 42, column: 9)
!46 = !DILocation(line: 42, column: 14, scope: !45)
!47 = !DILocation(line: 42, column: 9, scope: !36)
!48 = !DILocation(line: 42, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !15, line: 42, column: 23)
!50 = !DILocation(line: 43, column: 5, scope: !36)
!51 = !DILocation(line: 43, column: 13, scope: !36)
!52 = !DILocation(line: 44, column: 67, scope: !36)
!53 = !DILocation(line: 44, column: 5, scope: !36)
!54 = !DILocation(line: 45, column: 1, scope: !36)
!55 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_goodG2BSink", scope: !15, file: !15, line: 51, type: !16, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!56 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !15, line: 51, type: !3)
!57 = !DILocation(line: 51, column: 79, scope: !55)
!58 = !DILocalVariable(name: "source", scope: !59, file: !15, line: 54, type: !23)
!59 = distinct !DILexicalBlock(scope: !55, file: !15, line: 53, column: 5)
!60 = !DILocation(line: 54, column: 14, scope: !59)
!61 = !DILocation(line: 55, column: 9, scope: !59)
!62 = !DILocation(line: 56, column: 9, scope: !59)
!63 = !DILocation(line: 56, column: 23, scope: !59)
!64 = !DILocation(line: 58, column: 9, scope: !59)
!65 = !DILocation(line: 59, column: 19, scope: !59)
!66 = !DILocation(line: 59, column: 9, scope: !59)
!67 = !DILocation(line: 60, column: 14, scope: !59)
!68 = !DILocation(line: 60, column: 9, scope: !59)
!69 = !DILocation(line: 62, column: 1, scope: !55)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_dest_char_cpy_41_good", scope: !15, file: !15, line: 76, type: !37, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!71 = !DILocation(line: 78, column: 5, scope: !70)
!72 = !DILocation(line: 79, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !74, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!74 = !DISubroutineType(types: !75)
!75 = !{!76, !76, !77}
!76 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !15, line: 91, type: !76)
!79 = !DILocation(line: 91, column: 14, scope: !73)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !15, line: 91, type: !77)
!81 = !DILocation(line: 91, column: 27, scope: !73)
!82 = !DILocation(line: 94, column: 22, scope: !73)
!83 = !DILocation(line: 94, column: 12, scope: !73)
!84 = !DILocation(line: 94, column: 5, scope: !73)
!85 = !DILocation(line: 96, column: 5, scope: !73)
!86 = !DILocation(line: 97, column: 5, scope: !73)
!87 = !DILocation(line: 98, column: 5, scope: !73)
!88 = !DILocation(line: 101, column: 5, scope: !73)
!89 = !DILocation(line: 102, column: 5, scope: !73)
!90 = !DILocation(line: 103, column: 5, scope: !73)
!91 = !DILocation(line: 105, column: 5, scope: !73)
!92 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 65, type: !37, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!93 = !DILocalVariable(name: "data", scope: !92, file: !15, line: 67, type: !3)
!94 = !DILocation(line: 67, column: 12, scope: !92)
!95 = !DILocation(line: 68, column: 10, scope: !92)
!96 = !DILocation(line: 70, column: 20, scope: !92)
!97 = !DILocation(line: 70, column: 10, scope: !92)
!98 = !DILocation(line: 71, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !92, file: !15, line: 71, column: 9)
!100 = !DILocation(line: 71, column: 14, scope: !99)
!101 = !DILocation(line: 71, column: 9, scope: !92)
!102 = !DILocation(line: 71, column: 24, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !15, line: 71, column: 23)
!104 = !DILocation(line: 72, column: 5, scope: !92)
!105 = !DILocation(line: 72, column: 13, scope: !92)
!106 = !DILocation(line: 73, column: 71, scope: !92)
!107 = !DILocation(line: 73, column: 5, scope: !92)
!108 = !DILocation(line: 74, column: 1, scope: !92)
