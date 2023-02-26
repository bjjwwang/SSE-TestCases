; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_badSink(i64* noundef %data) #0 !dbg !16 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !23, metadata !DIExpression()), !dbg !28
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !28
  %1 = load i64*, i64** %data.addr, align 8, !dbg !29
  %2 = bitcast i64* %1 to i8*, !dbg !29
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !29
  %3 = bitcast i64* %arraydecay to i8*, !dbg !29
  %4 = load i64*, i64** %data.addr, align 8, !dbg !29
  %5 = bitcast i64* %4 to i8*, !dbg !29
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !29
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #7, !dbg !29
  %7 = load i64*, i64** %data.addr, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !30
  %8 = load i64, i64* %arrayidx, align 8, !dbg !30
  call void @printLongLongLine(i64 noundef %8), !dbg !31
  %9 = load i64*, i64** %data.addr, align 8, !dbg !32
  %10 = bitcast i64* %9 to i8*, !dbg !32
  call void @free(i8* noundef %10), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !38, metadata !DIExpression()), !dbg !39
  store i64* null, i64** %data, align 8, !dbg !40
  %call = call i8* @malloc(i64 noundef 400) #8, !dbg !41
  %0 = bitcast i8* %call to i64*, !dbg !42
  store i64* %0, i64** %data, align 8, !dbg !43
  %1 = load i64*, i64** %data, align 8, !dbg !44
  %cmp = icmp eq i64* %1, null, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !50
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_badSink(i64* noundef %2), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #5

; Function Attrs: noreturn
declare void @exit(i32 noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_goodG2BSink(i64* noundef %data) #0 !dbg !53 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !58
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !58
  %1 = load i64*, i64** %data.addr, align 8, !dbg !59
  %2 = bitcast i64* %1 to i8*, !dbg !59
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !59
  %3 = bitcast i64* %arraydecay to i8*, !dbg !59
  %4 = load i64*, i64** %data.addr, align 8, !dbg !59
  %5 = bitcast i64* %4 to i8*, !dbg !59
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !59
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #7, !dbg !59
  %7 = load i64*, i64** %data.addr, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !60
  %8 = load i64, i64* %arrayidx, align 8, !dbg !60
  call void @printLongLongLine(i64 noundef %8), !dbg !61
  %9 = load i64*, i64** %data.addr, align 8, !dbg !62
  %10 = bitcast i64* %9 to i8*, !dbg !62
  call void @free(i8* noundef %10), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_good() #0 !dbg !65 {
entry:
  call void @goodG2B(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* noundef null), !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 noundef %conv), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_good(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_bad(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !90, metadata !DIExpression()), !dbg !91
  store i64* null, i64** %data, align 8, !dbg !92
  %call = call i8* @malloc(i64 noundef 800) #8, !dbg !93
  %0 = bitcast i8* %call to i64*, !dbg !94
  store i64* %0, i64** %data, align 8, !dbg !95
  %1 = load i64*, i64** %data, align 8, !dbg !96
  %cmp = icmp eq i64* %1, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #9, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  %2 = load i64*, i64** %data, align 8, !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_goodG2BSink(i64* noundef %2), !dbg !103
  ret void, !dbg !104
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
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7, !8}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_badSink", scope: !17, file: !17, line: 21, type: !18, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null, !3}
!20 = !{}
!21 = !DILocalVariable(name: "data", arg: 1, scope: !16, file: !17, line: 21, type: !3)
!22 = !DILocation(line: 21, column: 87, scope: !16)
!23 = !DILocalVariable(name: "source", scope: !24, file: !17, line: 24, type: !25)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 23, column: 5)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 24, column: 17, scope: !24)
!29 = !DILocation(line: 26, column: 9, scope: !24)
!30 = !DILocation(line: 27, column: 27, scope: !24)
!31 = !DILocation(line: 27, column: 9, scope: !24)
!32 = !DILocation(line: 28, column: 14, scope: !24)
!33 = !DILocation(line: 28, column: 9, scope: !24)
!34 = !DILocation(line: 30, column: 1, scope: !16)
!35 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_bad", scope: !17, file: !17, line: 32, type: !36, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !17, line: 34, type: !3)
!39 = !DILocation(line: 34, column: 15, scope: !35)
!40 = !DILocation(line: 35, column: 10, scope: !35)
!41 = !DILocation(line: 37, column: 23, scope: !35)
!42 = !DILocation(line: 37, column: 12, scope: !35)
!43 = !DILocation(line: 37, column: 10, scope: !35)
!44 = !DILocation(line: 38, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !35, file: !17, line: 38, column: 9)
!46 = !DILocation(line: 38, column: 14, scope: !45)
!47 = !DILocation(line: 38, column: 9, scope: !35)
!48 = !DILocation(line: 38, column: 24, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !17, line: 38, column: 23)
!50 = !DILocation(line: 39, column: 76, scope: !35)
!51 = !DILocation(line: 39, column: 5, scope: !35)
!52 = !DILocation(line: 40, column: 1, scope: !35)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_goodG2BSink", scope: !17, file: !17, line: 46, type: !18, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!54 = !DILocalVariable(name: "data", arg: 1, scope: !53, file: !17, line: 46, type: !3)
!55 = !DILocation(line: 46, column: 91, scope: !53)
!56 = !DILocalVariable(name: "source", scope: !57, file: !17, line: 49, type: !25)
!57 = distinct !DILexicalBlock(scope: !53, file: !17, line: 48, column: 5)
!58 = !DILocation(line: 49, column: 17, scope: !57)
!59 = !DILocation(line: 51, column: 9, scope: !57)
!60 = !DILocation(line: 52, column: 27, scope: !57)
!61 = !DILocation(line: 52, column: 9, scope: !57)
!62 = !DILocation(line: 53, column: 14, scope: !57)
!63 = !DILocation(line: 53, column: 9, scope: !57)
!64 = !DILocation(line: 55, column: 1, scope: !53)
!65 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_41_good", scope: !17, file: !17, line: 68, type: !36, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!66 = !DILocation(line: 70, column: 5, scope: !65)
!67 = !DILocation(line: 71, column: 1, scope: !65)
!68 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 83, type: !69, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!69 = !DISubroutineType(types: !70)
!70 = !{!71, !71, !72}
!71 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !17, line: 83, type: !71)
!76 = !DILocation(line: 83, column: 14, scope: !68)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !17, line: 83, type: !72)
!78 = !DILocation(line: 83, column: 27, scope: !68)
!79 = !DILocation(line: 86, column: 22, scope: !68)
!80 = !DILocation(line: 86, column: 12, scope: !68)
!81 = !DILocation(line: 86, column: 5, scope: !68)
!82 = !DILocation(line: 88, column: 5, scope: !68)
!83 = !DILocation(line: 89, column: 5, scope: !68)
!84 = !DILocation(line: 90, column: 5, scope: !68)
!85 = !DILocation(line: 93, column: 5, scope: !68)
!86 = !DILocation(line: 94, column: 5, scope: !68)
!87 = !DILocation(line: 95, column: 5, scope: !68)
!88 = !DILocation(line: 97, column: 5, scope: !68)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 58, type: !36, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!90 = !DILocalVariable(name: "data", scope: !89, file: !17, line: 60, type: !3)
!91 = !DILocation(line: 60, column: 15, scope: !89)
!92 = !DILocation(line: 61, column: 10, scope: !89)
!93 = !DILocation(line: 63, column: 23, scope: !89)
!94 = !DILocation(line: 63, column: 12, scope: !89)
!95 = !DILocation(line: 63, column: 10, scope: !89)
!96 = !DILocation(line: 64, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !89, file: !17, line: 64, column: 9)
!98 = !DILocation(line: 64, column: 14, scope: !97)
!99 = !DILocation(line: 64, column: 9, scope: !89)
!100 = !DILocation(line: 64, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !17, line: 64, column: 23)
!102 = !DILocation(line: 65, column: 80, scope: !89)
!103 = !DILocation(line: 65, column: 5, scope: !89)
!104 = !DILocation(line: 66, column: 1, scope: !89)
