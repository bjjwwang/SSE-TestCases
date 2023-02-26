; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01_bad() #0 !dbg !16 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i64* null, i64** %data, align 8, !dbg !23
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !24
  %0 = bitcast i8* %call to i64*, !dbg !25
  store i64* %0, i64** %data, align 8, !dbg !26
  %1 = load i64*, i64** %data, align 8, !dbg !27
  %cmp = icmp eq i64* %1, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !38
  %3 = load i64*, i64** %data, align 8, !dbg !39
  %4 = bitcast i64* %3 to i8*, !dbg !39
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !39
  %5 = bitcast i64* %arraydecay to i8*, !dbg !39
  %6 = load i64*, i64** %data, align 8, !dbg !39
  %7 = bitcast i64* %6 to i8*, !dbg !39
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !39
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !39
  %9 = load i64*, i64** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !40
  %10 = load i64, i64* %arrayidx, align 8, !dbg !40
  call void @printLongLongLine(i64 noundef %10), !dbg !41
  %11 = load i64*, i64** %data, align 8, !dbg !42
  %12 = bitcast i64* %11 to i8*, !dbg !42
  call void @free(i8* noundef %12), !dbg !43
  ret void, !dbg !44
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

declare void @printLine(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !69 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !70, metadata !DIExpression()), !dbg !71
  store i64* null, i64** %data, align 8, !dbg !72
  %call = call i8* @malloc(i64 noundef 800) #7, !dbg !73
  %0 = bitcast i8* %call to i64*, !dbg !74
  store i64* %0, i64** %data, align 8, !dbg !75
  %1 = load i64*, i64** %data, align 8, !dbg !76
  %cmp = icmp eq i64* %1, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !82, metadata !DIExpression()), !dbg !84
  %2 = bitcast [100 x i64]* %source to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !84
  %3 = load i64*, i64** %data, align 8, !dbg !85
  %4 = bitcast i64* %3 to i8*, !dbg !85
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !85
  %5 = bitcast i64* %arraydecay to i8*, !dbg !85
  %6 = load i64*, i64** %data, align 8, !dbg !85
  %7 = bitcast i64* %6 to i8*, !dbg !85
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !85
  %call1 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef 800, i64 noundef %8) #9, !dbg !85
  %9 = load i64*, i64** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i64, i64* %9, i64 0, !dbg !86
  %10 = load i64, i64* %arrayidx, align 8, !dbg !86
  call void @printLongLongLine(i64 noundef %10), !dbg !87
  %11 = load i64*, i64** %data, align 8, !dbg !88
  %12 = bitcast i64* %11 to i8*, !dbg !88
  call void @free(i8* noundef %12), !dbg !89
  ret void, !dbg !90
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!16 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01_bad", scope: !17, file: !17, line: 21, type: !18, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!17 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{}
!21 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 23, type: !3)
!22 = !DILocation(line: 23, column: 15, scope: !16)
!23 = !DILocation(line: 24, column: 10, scope: !16)
!24 = !DILocation(line: 26, column: 23, scope: !16)
!25 = !DILocation(line: 26, column: 12, scope: !16)
!26 = !DILocation(line: 26, column: 10, scope: !16)
!27 = !DILocation(line: 27, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 9)
!29 = !DILocation(line: 27, column: 14, scope: !28)
!30 = !DILocation(line: 27, column: 9, scope: !16)
!31 = !DILocation(line: 27, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !17, line: 27, column: 23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !17, line: 29, type: !35)
!34 = distinct !DILexicalBlock(scope: !16, file: !17, line: 28, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 29, column: 17, scope: !34)
!39 = !DILocation(line: 31, column: 9, scope: !34)
!40 = !DILocation(line: 32, column: 27, scope: !34)
!41 = !DILocation(line: 32, column: 9, scope: !34)
!42 = !DILocation(line: 33, column: 14, scope: !34)
!43 = !DILocation(line: 33, column: 9, scope: !34)
!44 = !DILocation(line: 35, column: 1, scope: !16)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_01_good", scope: !17, file: !17, line: 58, type: !18, scopeLine: 59, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!46 = !DILocation(line: 60, column: 5, scope: !45)
!47 = !DILocation(line: 61, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 73, type: !49, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !20)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !17, line: 73, type: !51)
!56 = !DILocation(line: 73, column: 14, scope: !48)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !17, line: 73, type: !52)
!58 = !DILocation(line: 73, column: 27, scope: !48)
!59 = !DILocation(line: 76, column: 22, scope: !48)
!60 = !DILocation(line: 76, column: 12, scope: !48)
!61 = !DILocation(line: 76, column: 5, scope: !48)
!62 = !DILocation(line: 78, column: 5, scope: !48)
!63 = !DILocation(line: 79, column: 5, scope: !48)
!64 = !DILocation(line: 80, column: 5, scope: !48)
!65 = !DILocation(line: 83, column: 5, scope: !48)
!66 = !DILocation(line: 84, column: 5, scope: !48)
!67 = !DILocation(line: 85, column: 5, scope: !48)
!68 = !DILocation(line: 87, column: 5, scope: !48)
!69 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 42, type: !18, scopeLine: 43, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !20)
!70 = !DILocalVariable(name: "data", scope: !69, file: !17, line: 44, type: !3)
!71 = !DILocation(line: 44, column: 15, scope: !69)
!72 = !DILocation(line: 45, column: 10, scope: !69)
!73 = !DILocation(line: 47, column: 23, scope: !69)
!74 = !DILocation(line: 47, column: 12, scope: !69)
!75 = !DILocation(line: 47, column: 10, scope: !69)
!76 = !DILocation(line: 48, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !69, file: !17, line: 48, column: 9)
!78 = !DILocation(line: 48, column: 14, scope: !77)
!79 = !DILocation(line: 48, column: 9, scope: !69)
!80 = !DILocation(line: 48, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !17, line: 48, column: 23)
!82 = !DILocalVariable(name: "source", scope: !83, file: !17, line: 50, type: !35)
!83 = distinct !DILexicalBlock(scope: !69, file: !17, line: 49, column: 5)
!84 = !DILocation(line: 50, column: 17, scope: !83)
!85 = !DILocation(line: 52, column: 9, scope: !83)
!86 = !DILocation(line: 53, column: 27, scope: !83)
!87 = !DILocation(line: 53, column: 9, scope: !83)
!88 = !DILocation(line: 54, column: 14, scope: !83)
!89 = !DILocation(line: 54, column: 9, scope: !83)
!90 = !DILocation(line: 56, column: 1, scope: !69)
