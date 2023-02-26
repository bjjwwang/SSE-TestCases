; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_bad() #0 !dbg !16 {
entry:
  %data = alloca i64*, align 8
  %source1 = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  br label %source, !dbg !24

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !25), !dbg !26
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !27
  %0 = bitcast i8* %call to i64*, !dbg !28
  store i64* %0, i64** %data, align 8, !dbg !29
  %1 = load i64*, i64** %data, align 8, !dbg !30
  %cmp = icmp eq i64* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %source
  call void @exit(i32 noundef -1) #8, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x i64]* %source1, metadata !36, metadata !DIExpression()), !dbg !41
  %2 = bitcast [100 x i64]* %source1 to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !41
  %3 = load i64*, i64** %data, align 8, !dbg !42
  %4 = bitcast i64* %3 to i8*, !dbg !42
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source1, i64 0, i64 0, !dbg !42
  %5 = bitcast i64* %arraydecay to i8*, !dbg !42
  %6 = load i64*, i64** %data, align 8, !dbg !42
  %7 = bitcast i64* %6 to i8*, !dbg !42
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !42
  %call2 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !42
  %9 = load i64*, i64** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !43
  %10 = load i64, i64* %arrayidx, align 8, !dbg !43
  call void @printLongLongLine(i64 noundef %10), !dbg !44
  %11 = load i64*, i64** %data, align 8, !dbg !45
  %12 = bitcast i64* %11 to i8*, !dbg !45
  call void @free(i8* noundef %12), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i64*, align 8
  %source1 = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !73, metadata !DIExpression()), !dbg !74
  store i64* null, i64** %data, align 8, !dbg !75
  br label %source, !dbg !76

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !77), !dbg !78
  %call = call i8* @malloc(i64 noundef 800) #7, !dbg !79
  %0 = bitcast i8* %call to i64*, !dbg !80
  store i64* %0, i64** %data, align 8, !dbg !81
  %1 = load i64*, i64** %data, align 8, !dbg !82
  %cmp = icmp eq i64* %1, null, !dbg !84
  br i1 %cmp, label %if.then, label %if.end, !dbg !85

if.then:                                          ; preds = %source
  call void @exit(i32 noundef -1) #8, !dbg !86
  unreachable, !dbg !86

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x i64]* %source1, metadata !88, metadata !DIExpression()), !dbg !90
  %2 = bitcast [100 x i64]* %source1 to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !90
  %3 = load i64*, i64** %data, align 8, !dbg !91
  %4 = bitcast i64* %3 to i8*, !dbg !91
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source1, i64 0, i64 0, !dbg !91
  %5 = bitcast i64* %arraydecay to i8*, !dbg !91
  %6 = load i64*, i64** %data, align 8, !dbg !91
  %7 = bitcast i64* %6 to i8*, !dbg !91
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !91
  %call2 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !91
  %9 = load i64*, i64** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !92
  %10 = load i64, i64* %arrayidx, align 8, !dbg !92
  call void @printLongLongLine(i64 noundef %10), !dbg !93
  %11 = load i64*, i64** %data, align 8, !dbg !94
  %12 = bitcast i64* %11 to i8*, !dbg !94
  call void @free(i8* noundef %12), !dbg !95
  ret void, !dbg !96
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_bad", scope: !17, file: !17, line: 21, type: !18, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{}
!21 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 23, type: !3)
!22 = !DILocation(line: 23, column: 15, scope: !16)
!23 = !DILocation(line: 24, column: 10, scope: !16)
!24 = !DILocation(line: 25, column: 5, scope: !16)
!25 = !DILabel(scope: !16, name: "source", file: !17, line: 26)
!26 = !DILocation(line: 26, column: 1, scope: !16)
!27 = !DILocation(line: 28, column: 23, scope: !16)
!28 = !DILocation(line: 28, column: 12, scope: !16)
!29 = !DILocation(line: 28, column: 10, scope: !16)
!30 = !DILocation(line: 29, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !16, file: !17, line: 29, column: 9)
!32 = !DILocation(line: 29, column: 14, scope: !31)
!33 = !DILocation(line: 29, column: 9, scope: !16)
!34 = !DILocation(line: 29, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 29, column: 23)
!36 = !DILocalVariable(name: "source", scope: !37, file: !17, line: 31, type: !38)
!37 = distinct !DILexicalBlock(scope: !16, file: !17, line: 30, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 31, column: 17, scope: !37)
!42 = !DILocation(line: 33, column: 9, scope: !37)
!43 = !DILocation(line: 34, column: 27, scope: !37)
!44 = !DILocation(line: 34, column: 9, scope: !37)
!45 = !DILocation(line: 35, column: 14, scope: !37)
!46 = !DILocation(line: 35, column: 9, scope: !37)
!47 = !DILocation(line: 37, column: 1, scope: !16)
!48 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_good", scope: !17, file: !17, line: 62, type: !18, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!49 = !DILocation(line: 64, column: 5, scope: !48)
!50 = !DILocation(line: 65, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 77, type: !52, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !17, line: 77, type: !54)
!59 = !DILocation(line: 77, column: 14, scope: !51)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !17, line: 77, type: !55)
!61 = !DILocation(line: 77, column: 27, scope: !51)
!62 = !DILocation(line: 80, column: 22, scope: !51)
!63 = !DILocation(line: 80, column: 12, scope: !51)
!64 = !DILocation(line: 80, column: 5, scope: !51)
!65 = !DILocation(line: 82, column: 5, scope: !51)
!66 = !DILocation(line: 83, column: 5, scope: !51)
!67 = !DILocation(line: 84, column: 5, scope: !51)
!68 = !DILocation(line: 87, column: 5, scope: !51)
!69 = !DILocation(line: 88, column: 5, scope: !51)
!70 = !DILocation(line: 89, column: 5, scope: !51)
!71 = !DILocation(line: 91, column: 5, scope: !51)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 44, type: !18, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!73 = !DILocalVariable(name: "data", scope: !72, file: !17, line: 46, type: !3)
!74 = !DILocation(line: 46, column: 15, scope: !72)
!75 = !DILocation(line: 47, column: 10, scope: !72)
!76 = !DILocation(line: 48, column: 5, scope: !72)
!77 = !DILabel(scope: !72, name: "source", file: !17, line: 49)
!78 = !DILocation(line: 49, column: 1, scope: !72)
!79 = !DILocation(line: 51, column: 23, scope: !72)
!80 = !DILocation(line: 51, column: 12, scope: !72)
!81 = !DILocation(line: 51, column: 10, scope: !72)
!82 = !DILocation(line: 52, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !72, file: !17, line: 52, column: 9)
!84 = !DILocation(line: 52, column: 14, scope: !83)
!85 = !DILocation(line: 52, column: 9, scope: !72)
!86 = !DILocation(line: 52, column: 24, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !17, line: 52, column: 23)
!88 = !DILocalVariable(name: "source", scope: !89, file: !17, line: 54, type: !38)
!89 = distinct !DILexicalBlock(scope: !72, file: !17, line: 53, column: 5)
!90 = !DILocation(line: 54, column: 17, scope: !89)
!91 = !DILocation(line: 56, column: 9, scope: !89)
!92 = !DILocation(line: 57, column: 27, scope: !89)
!93 = !DILocation(line: 57, column: 9, scope: !89)
!94 = !DILocation(line: 58, column: 14, scope: !89)
!95 = !DILocation(line: 58, column: 9, scope: !89)
!96 = !DILocation(line: 60, column: 1, scope: !72)
