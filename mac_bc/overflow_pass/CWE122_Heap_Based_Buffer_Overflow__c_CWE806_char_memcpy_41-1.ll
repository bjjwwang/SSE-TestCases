; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_badSink(i8* noundef %data) #0 !dbg !14 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !21, metadata !DIExpression()), !dbg !26
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !26
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !27
  %1 = load i8*, i8** %data.addr, align 8, !dbg !27
  %2 = load i8*, i8** %data.addr, align 8, !dbg !27
  %call = call i64 @strlen(i8* noundef %2), !dbg !27
  %mul = mul i64 %call, 1, !dbg !27
  %call1 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %mul, i64 noundef 50) #7, !dbg !27
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %3 = load i8*, i8** %data.addr, align 8, !dbg !30
  call void @printLine(i8* noundef %3), !dbg !31
  %4 = load i8*, i8** %data.addr, align 8, !dbg !32
  call void @free(i8* noundef %4), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  %call = call i8* @malloc(i64 noundef 100) #8, !dbg !40
  store i8* %call, i8** %data, align 8, !dbg !41
  %0 = load i8*, i8** %data, align 8, !dbg !42
  %cmp = icmp eq i8* %0, null, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !48
  %2 = load i8*, i8** %data, align 8, !dbg !48
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !48
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #7, !dbg !48
  %4 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %5 = load i8*, i8** %data, align 8, !dbg !51
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_badSink(i8* noundef %5), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #5

; Function Attrs: noreturn
declare void @exit(i32 noundef) #6

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_goodG2BSink(i8* noundef %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !57, metadata !DIExpression()), !dbg !59
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !59
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !60
  %1 = load i8*, i8** %data.addr, align 8, !dbg !60
  %2 = load i8*, i8** %data.addr, align 8, !dbg !60
  %call = call i64 @strlen(i8* noundef %2), !dbg !60
  %mul = mul i64 %call, 1, !dbg !60
  %call1 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %mul, i64 noundef 50) #7, !dbg !60
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  %3 = load i8*, i8** %data.addr, align 8, !dbg !63
  call void @printLine(i8* noundef %3), !dbg !64
  %4 = load i8*, i8** %data.addr, align 8, !dbg !65
  call void @free(i8* noundef %4), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* noundef null), !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 noundef %conv), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_good(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_bad(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i8* @malloc(i64 noundef 100) #8, !dbg !93
  store i8* %call, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %cmp = icmp eq i8* %0, null, !dbg !97
  br i1 %cmp, label %if.then, label %if.end, !dbg !98

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !99
  unreachable, !dbg !99

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !101
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !101
  %call1 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #7, !dbg !101
  %4 = load i8*, i8** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_goodG2BSink(i8* noundef %5), !dbg !105
  ret void, !dbg !106
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_badSink", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null, !3}
!18 = !{}
!19 = !DILocalVariable(name: "data", arg: 1, scope: !14, file: !15, line: 23, type: !3)
!20 = !DILocation(line: 23, column: 80, scope: !14)
!21 = !DILocalVariable(name: "dest", scope: !22, file: !15, line: 26, type: !23)
!22 = distinct !DILexicalBlock(scope: !14, file: !15, line: 25, column: 5)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 26, column: 14, scope: !22)
!27 = !DILocation(line: 28, column: 9, scope: !22)
!28 = !DILocation(line: 29, column: 9, scope: !22)
!29 = !DILocation(line: 29, column: 20, scope: !22)
!30 = !DILocation(line: 30, column: 19, scope: !22)
!31 = !DILocation(line: 30, column: 9, scope: !22)
!32 = !DILocation(line: 31, column: 14, scope: !22)
!33 = !DILocation(line: 31, column: 9, scope: !22)
!34 = !DILocation(line: 33, column: 1, scope: !14)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_bad", scope: !15, file: !15, line: 35, type: !36, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !15, line: 37, type: !3)
!39 = !DILocation(line: 37, column: 12, scope: !35)
!40 = !DILocation(line: 38, column: 20, scope: !35)
!41 = !DILocation(line: 38, column: 10, scope: !35)
!42 = !DILocation(line: 39, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !35, file: !15, line: 39, column: 9)
!44 = !DILocation(line: 39, column: 14, scope: !43)
!45 = !DILocation(line: 39, column: 9, scope: !35)
!46 = !DILocation(line: 39, column: 24, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !15, line: 39, column: 23)
!48 = !DILocation(line: 41, column: 5, scope: !35)
!49 = !DILocation(line: 42, column: 5, scope: !35)
!50 = !DILocation(line: 42, column: 17, scope: !35)
!51 = !DILocation(line: 43, column: 72, scope: !35)
!52 = !DILocation(line: 43, column: 5, scope: !35)
!53 = !DILocation(line: 44, column: 1, scope: !35)
!54 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_goodG2BSink", scope: !15, file: !15, line: 50, type: !16, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !15, line: 50, type: !3)
!56 = !DILocation(line: 50, column: 84, scope: !54)
!57 = !DILocalVariable(name: "dest", scope: !58, file: !15, line: 53, type: !23)
!58 = distinct !DILexicalBlock(scope: !54, file: !15, line: 52, column: 5)
!59 = !DILocation(line: 53, column: 14, scope: !58)
!60 = !DILocation(line: 55, column: 9, scope: !58)
!61 = !DILocation(line: 56, column: 9, scope: !58)
!62 = !DILocation(line: 56, column: 20, scope: !58)
!63 = !DILocation(line: 57, column: 19, scope: !58)
!64 = !DILocation(line: 57, column: 9, scope: !58)
!65 = !DILocation(line: 58, column: 14, scope: !58)
!66 = !DILocation(line: 58, column: 9, scope: !58)
!67 = !DILocation(line: 60, column: 1, scope: !54)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memcpy_41_good", scope: !15, file: !15, line: 74, type: !36, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!69 = !DILocation(line: 76, column: 5, scope: !68)
!70 = !DILocation(line: 77, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 89, type: !72, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !75}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 89, type: !74)
!77 = !DILocation(line: 89, column: 14, scope: !71)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 89, type: !75)
!79 = !DILocation(line: 89, column: 27, scope: !71)
!80 = !DILocation(line: 92, column: 22, scope: !71)
!81 = !DILocation(line: 92, column: 12, scope: !71)
!82 = !DILocation(line: 92, column: 5, scope: !71)
!83 = !DILocation(line: 94, column: 5, scope: !71)
!84 = !DILocation(line: 95, column: 5, scope: !71)
!85 = !DILocation(line: 96, column: 5, scope: !71)
!86 = !DILocation(line: 99, column: 5, scope: !71)
!87 = !DILocation(line: 100, column: 5, scope: !71)
!88 = !DILocation(line: 101, column: 5, scope: !71)
!89 = !DILocation(line: 103, column: 5, scope: !71)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 63, type: !36, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!91 = !DILocalVariable(name: "data", scope: !90, file: !15, line: 65, type: !3)
!92 = !DILocation(line: 65, column: 12, scope: !90)
!93 = !DILocation(line: 66, column: 20, scope: !90)
!94 = !DILocation(line: 66, column: 10, scope: !90)
!95 = !DILocation(line: 67, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !15, line: 67, column: 9)
!97 = !DILocation(line: 67, column: 14, scope: !96)
!98 = !DILocation(line: 67, column: 9, scope: !90)
!99 = !DILocation(line: 67, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !15, line: 67, column: 23)
!101 = !DILocation(line: 69, column: 5, scope: !90)
!102 = !DILocation(line: 70, column: 5, scope: !90)
!103 = !DILocation(line: 70, column: 16, scope: !90)
!104 = !DILocation(line: 71, column: 76, scope: !90)
!105 = !DILocation(line: 71, column: 5, scope: !90)
!106 = !DILocation(line: 72, column: 1, scope: !90)
