; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06_bad() #0 !dbg !16 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !24
  %0 = bitcast i8* %call to i64*, !dbg !27
  store i64* %0, i64** %data, align 8, !dbg !28
  %1 = load i64*, i64** %data, align 8, !dbg !29
  %cmp = icmp eq i64* %1, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !33
  unreachable, !dbg !33

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !40
  %3 = load i64*, i64** %data, align 8, !dbg !41
  %4 = bitcast i64* %3 to i8*, !dbg !41
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !41
  %5 = bitcast i64* %arraydecay to i8*, !dbg !41
  %6 = load i64*, i64** %data, align 8, !dbg !41
  %7 = bitcast i64* %6 to i8*, !dbg !41
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !41
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !41
  %9 = load i64*, i64** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !42
  %10 = load i64, i64* %arrayidx, align 8, !dbg !42
  call void @printLongLongLine(i64 noundef %10), !dbg !43
  %11 = load i64*, i64** %data, align 8, !dbg !44
  %12 = bitcast i64* %11 to i8*, !dbg !44
  call void @free(i8* noundef %12), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i64* null, i64** %data, align 8, !dbg !75
  %call = call i8* @malloc(i64 noundef 800) #7, !dbg !76
  %0 = bitcast i8* %call to i64*, !dbg !79
  store i64* %0, i64** %data, align 8, !dbg !80
  %1 = load i64*, i64** %data, align 8, !dbg !81
  %cmp = icmp eq i64* %1, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !89
  %3 = load i64*, i64** %data, align 8, !dbg !90
  %4 = bitcast i64* %3 to i8*, !dbg !90
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !90
  %5 = bitcast i64* %arraydecay to i8*, !dbg !90
  %6 = load i64*, i64** %data, align 8, !dbg !90
  %7 = bitcast i64* %6 to i8*, !dbg !90
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !90
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !90
  %9 = load i64*, i64** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !91
  %10 = load i64, i64* %arrayidx, align 8, !dbg !91
  call void @printLongLongLine(i64 noundef %10), !dbg !92
  %11 = load i64*, i64** %data, align 8, !dbg !93
  %12 = bitcast i64* %11 to i8*, !dbg !93
  call void @free(i8* noundef %12), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !97, metadata !DIExpression()), !dbg !98
  store i64* null, i64** %data, align 8, !dbg !99
  %call = call i8* @malloc(i64 noundef 800) #7, !dbg !100
  %0 = bitcast i8* %call to i64*, !dbg !103
  store i64* %0, i64** %data, align 8, !dbg !104
  %1 = load i64*, i64** %data, align 8, !dbg !105
  %cmp = icmp eq i64* %1, null, !dbg !107
  br i1 %cmp, label %if.then, label %if.end, !dbg !108

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !109
  unreachable, !dbg !109

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !113
  %3 = load i64*, i64** %data, align 8, !dbg !114
  %4 = bitcast i64* %3 to i8*, !dbg !114
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !114
  %5 = bitcast i64* %arraydecay to i8*, !dbg !114
  %6 = load i64*, i64** %data, align 8, !dbg !114
  %7 = bitcast i64* %6 to i8*, !dbg !114
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !114
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !114
  %9 = load i64*, i64** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !115
  %10 = load i64, i64* %arrayidx, align 8, !dbg !115
  call void @printLongLongLine(i64 noundef %10), !dbg !116
  %11 = load i64*, i64** %data, align 8, !dbg !117
  %12 = bitcast i64* %11 to i8*, !dbg !117
  call void @free(i8* noundef %12), !dbg !118
  ret void, !dbg !119
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
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06_bad", scope: !17, file: !17, line: 25, type: !18, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{}
!21 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 27, type: !3)
!22 = !DILocation(line: 27, column: 15, scope: !16)
!23 = !DILocation(line: 28, column: 10, scope: !16)
!24 = !DILocation(line: 32, column: 27, scope: !25)
!25 = distinct !DILexicalBlock(scope: !26, file: !17, line: 30, column: 5)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 8)
!27 = !DILocation(line: 32, column: 16, scope: !25)
!28 = !DILocation(line: 32, column: 14, scope: !25)
!29 = !DILocation(line: 33, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !17, line: 33, column: 13)
!31 = !DILocation(line: 33, column: 18, scope: !30)
!32 = !DILocation(line: 33, column: 13, scope: !25)
!33 = !DILocation(line: 33, column: 28, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !17, line: 33, column: 27)
!35 = !DILocalVariable(name: "source", scope: !36, file: !17, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !16, file: !17, line: 35, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 36, column: 17, scope: !36)
!41 = !DILocation(line: 38, column: 9, scope: !36)
!42 = !DILocation(line: 39, column: 27, scope: !36)
!43 = !DILocation(line: 39, column: 9, scope: !36)
!44 = !DILocation(line: 40, column: 14, scope: !36)
!45 = !DILocation(line: 40, column: 9, scope: !36)
!46 = !DILocation(line: 42, column: 1, scope: !16)
!47 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_06_good", scope: !17, file: !17, line: 93, type: !18, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!48 = !DILocation(line: 95, column: 5, scope: !47)
!49 = !DILocation(line: 96, column: 5, scope: !47)
!50 = !DILocation(line: 97, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 109, type: !52, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !17, line: 109, type: !54)
!59 = !DILocation(line: 109, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !17, line: 109, type: !55)
!61 = !DILocation(line: 109, column: 27, scope: !51)
!62 = !DILocation(line: 112, column: 22, scope: !51)
!63 = !DILocation(line: 112, column: 12, scope: !51)
!64 = !DILocation(line: 112, column: 5, scope: !51)
!65 = !DILocation(line: 114, column: 5, scope: !51)
!66 = !DILocation(line: 115, column: 5, scope: !51)
!67 = !DILocation(line: 116, column: 5, scope: !51)
!68 = !DILocation(line: 119, column: 5, scope: !51)
!69 = !DILocation(line: 120, column: 5, scope: !51)
!70 = !DILocation(line: 121, column: 5, scope: !51)
!71 = !DILocation(line: 123, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 49, type: !18, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!73 = !DILocalVariable(name: "data", scope: !72, file: !17, line: 51, type: !3)
!74 = !DILocation(line: 51, column: 15, scope: !72)
!75 = !DILocation(line: 52, column: 10, scope: !72)
!76 = !DILocation(line: 61, column: 27, scope: !77)
!77 = distinct !DILexicalBlock(scope: !78, file: !17, line: 59, column: 5)
!78 = distinct !DILexicalBlock(scope: !72, file: !17, line: 53, column: 8)
!79 = !DILocation(line: 61, column: 16, scope: !77)
!80 = !DILocation(line: 61, column: 14, scope: !77)
!81 = !DILocation(line: 62, column: 13, scope: !82)
!82 = distinct !DILexicalBlock(scope: !77, file: !17, line: 62, column: 13)
!83 = !DILocation(line: 62, column: 18, scope: !82)
!84 = !DILocation(line: 62, column: 13, scope: !77)
!85 = !DILocation(line: 62, column: 28, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !17, line: 62, column: 27)
!87 = !DILocalVariable(name: "source", scope: !88, file: !17, line: 65, type: !37)
!88 = distinct !DILexicalBlock(scope: !72, file: !17, line: 64, column: 5)
!89 = !DILocation(line: 65, column: 17, scope: !88)
!90 = !DILocation(line: 67, column: 9, scope: !88)
!91 = !DILocation(line: 68, column: 27, scope: !88)
!92 = !DILocation(line: 68, column: 9, scope: !88)
!93 = !DILocation(line: 69, column: 14, scope: !88)
!94 = !DILocation(line: 69, column: 9, scope: !88)
!95 = !DILocation(line: 71, column: 1, scope: !72)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 74, type: !18, scopeLine: 75, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!97 = !DILocalVariable(name: "data", scope: !96, file: !17, line: 76, type: !3)
!98 = !DILocation(line: 76, column: 15, scope: !96)
!99 = !DILocation(line: 77, column: 10, scope: !96)
!100 = !DILocation(line: 81, column: 27, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !17, line: 79, column: 5)
!102 = distinct !DILexicalBlock(scope: !96, file: !17, line: 78, column: 8)
!103 = !DILocation(line: 81, column: 16, scope: !101)
!104 = !DILocation(line: 81, column: 14, scope: !101)
!105 = !DILocation(line: 82, column: 13, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !17, line: 82, column: 13)
!107 = !DILocation(line: 82, column: 18, scope: !106)
!108 = !DILocation(line: 82, column: 13, scope: !101)
!109 = !DILocation(line: 82, column: 28, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !17, line: 82, column: 27)
!111 = !DILocalVariable(name: "source", scope: !112, file: !17, line: 85, type: !37)
!112 = distinct !DILexicalBlock(scope: !96, file: !17, line: 84, column: 5)
!113 = !DILocation(line: 85, column: 17, scope: !112)
!114 = !DILocation(line: 87, column: 9, scope: !112)
!115 = !DILocation(line: 88, column: 27, scope: !112)
!116 = !DILocation(line: 88, column: 9, scope: !112)
!117 = !DILocation(line: 89, column: 14, scope: !112)
!118 = !DILocation(line: 89, column: 9, scope: !112)
!119 = !DILocation(line: 91, column: 1, scope: !96)
