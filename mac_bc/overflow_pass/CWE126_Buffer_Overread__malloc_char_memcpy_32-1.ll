; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_char_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_memcpy_32_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !21, metadata !DIExpression()), !dbg !23
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !24, metadata !DIExpression()), !dbg !25
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !25
  store i8* null, i8** %data, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !27, metadata !DIExpression()), !dbg !29
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !30
  %1 = load i8*, i8** %0, align 8, !dbg !31
  store i8* %1, i8** %data1, align 8, !dbg !29
  %call = call i8* @malloc(i64 noundef 50) #7, !dbg !32
  store i8* %call, i8** %data1, align 8, !dbg !33
  %2 = load i8*, i8** %data1, align 8, !dbg !34
  %cmp = icmp eq i8* %2, null, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !38
  unreachable, !dbg !38

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !40
  %4 = load i8*, i8** %data1, align 8, !dbg !40
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !40
  %call2 = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 49, i64 noundef %5) #9, !dbg !40
  %6 = load i8*, i8** %data1, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 49, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  %7 = load i8*, i8** %data1, align 8, !dbg !43
  %8 = load i8**, i8*** %dataPtr1, align 8, !dbg !44
  store i8* %7, i8** %8, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !46, metadata !DIExpression()), !dbg !48
  %9 = load i8**, i8*** %dataPtr2, align 8, !dbg !49
  %10 = load i8*, i8** %9, align 8, !dbg !50
  store i8* %10, i8** %data3, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !57
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx4, align 1, !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %11 = load i8*, i8** %data3, align 8, !dbg !60
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !60
  %mul = mul i64 %call7, 1, !dbg !60
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay5, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #9, !dbg !60
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx9, align 1, !dbg !62
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !63
  call void @printLine(i8* noundef %arraydecay10), !dbg !64
  %12 = load i8*, i8** %data3, align 8, !dbg !65
  call void @free(i8* noundef %12), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_char_memcpy_32_good() #0 !dbg !68 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* noundef null), !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 noundef %conv), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_32_good(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__malloc_char_memcpy_32_bad(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %data1 = alloca i8*, align 8
  %data3 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !95
  store i8* null, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !97, metadata !DIExpression()), !dbg !99
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !100
  %1 = load i8*, i8** %0, align 8, !dbg !101
  store i8* %1, i8** %data1, align 8, !dbg !99
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !102
  store i8* %call, i8** %data1, align 8, !dbg !103
  %2 = load i8*, i8** %data1, align 8, !dbg !104
  %cmp = icmp eq i8* %2, null, !dbg !106
  br i1 %cmp, label %if.then, label %if.end, !dbg !107

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %entry
  %3 = load i8*, i8** %data1, align 8, !dbg !110
  %4 = load i8*, i8** %data1, align 8, !dbg !110
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !110
  %call2 = call i8* @__memset_chk(i8* noundef %3, i32 noundef 65, i64 noundef 99, i64 noundef %5) #9, !dbg !110
  %6 = load i8*, i8** %data1, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i8, i8* %6, i64 99, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %7 = load i8*, i8** %data1, align 8, !dbg !113
  %8 = load i8**, i8*** %dataPtr1, align 8, !dbg !114
  store i8* %7, i8** %8, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !116, metadata !DIExpression()), !dbg !118
  %9 = load i8**, i8*** %dataPtr2, align 8, !dbg !119
  %10 = load i8*, i8** %9, align 8, !dbg !120
  store i8* %10, i8** %data3, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx4, align 1, !dbg !126
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  %11 = load i8*, i8** %data3, align 8, !dbg !127
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  %call7 = call i64 @strlen(i8* noundef %arraydecay6), !dbg !127
  %mul = mul i64 %call7, 1, !dbg !127
  %call8 = call i8* @__memcpy_chk(i8* noundef %arraydecay5, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #9, !dbg !127
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx9, align 1, !dbg !129
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @printLine(i8* noundef %arraydecay10), !dbg !131
  %12 = load i8*, i8** %data3, align 8, !dbg !132
  call void @free(i8* noundef %12), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_32_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_char_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocalVariable(name: "dataPtr1", scope: !14, file: !15, line: 26, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!23 = !DILocation(line: 26, column: 13, scope: !14)
!24 = !DILocalVariable(name: "dataPtr2", scope: !14, file: !15, line: 27, type: !22)
!25 = !DILocation(line: 27, column: 13, scope: !14)
!26 = !DILocation(line: 28, column: 10, scope: !14)
!27 = !DILocalVariable(name: "data", scope: !28, file: !15, line: 30, type: !3)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 29, column: 5)
!29 = !DILocation(line: 30, column: 16, scope: !28)
!30 = !DILocation(line: 30, column: 24, scope: !28)
!31 = !DILocation(line: 30, column: 23, scope: !28)
!32 = !DILocation(line: 32, column: 24, scope: !28)
!33 = !DILocation(line: 32, column: 14, scope: !28)
!34 = !DILocation(line: 33, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !15, line: 33, column: 13)
!36 = !DILocation(line: 33, column: 18, scope: !35)
!37 = !DILocation(line: 33, column: 13, scope: !28)
!38 = !DILocation(line: 33, column: 28, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !15, line: 33, column: 27)
!40 = !DILocation(line: 34, column: 9, scope: !28)
!41 = !DILocation(line: 35, column: 9, scope: !28)
!42 = !DILocation(line: 35, column: 20, scope: !28)
!43 = !DILocation(line: 36, column: 21, scope: !28)
!44 = !DILocation(line: 36, column: 10, scope: !28)
!45 = !DILocation(line: 36, column: 19, scope: !28)
!46 = !DILocalVariable(name: "data", scope: !47, file: !15, line: 39, type: !3)
!47 = distinct !DILexicalBlock(scope: !14, file: !15, line: 38, column: 5)
!48 = !DILocation(line: 39, column: 16, scope: !47)
!49 = !DILocation(line: 39, column: 24, scope: !47)
!50 = !DILocation(line: 39, column: 23, scope: !47)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !15, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !47, file: !15, line: 40, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 41, column: 18, scope: !52)
!57 = !DILocation(line: 42, column: 13, scope: !52)
!58 = !DILocation(line: 43, column: 13, scope: !52)
!59 = !DILocation(line: 43, column: 25, scope: !52)
!60 = !DILocation(line: 46, column: 13, scope: !52)
!61 = !DILocation(line: 47, column: 13, scope: !52)
!62 = !DILocation(line: 47, column: 25, scope: !52)
!63 = !DILocation(line: 48, column: 23, scope: !52)
!64 = !DILocation(line: 48, column: 13, scope: !52)
!65 = !DILocation(line: 49, column: 18, scope: !52)
!66 = !DILocation(line: 49, column: 13, scope: !52)
!67 = !DILocation(line: 52, column: 1, scope: !14)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_char_memcpy_32_good", scope: !15, file: !15, line: 90, type: !16, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!69 = !DILocation(line: 92, column: 5, scope: !68)
!70 = !DILocation(line: 93, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 104, type: !72, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !22}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !15, line: 104, type: !74)
!76 = !DILocation(line: 104, column: 14, scope: !71)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !15, line: 104, type: !22)
!78 = !DILocation(line: 104, column: 27, scope: !71)
!79 = !DILocation(line: 107, column: 22, scope: !71)
!80 = !DILocation(line: 107, column: 12, scope: !71)
!81 = !DILocation(line: 107, column: 5, scope: !71)
!82 = !DILocation(line: 109, column: 5, scope: !71)
!83 = !DILocation(line: 110, column: 5, scope: !71)
!84 = !DILocation(line: 111, column: 5, scope: !71)
!85 = !DILocation(line: 114, column: 5, scope: !71)
!86 = !DILocation(line: 115, column: 5, scope: !71)
!87 = !DILocation(line: 116, column: 5, scope: !71)
!88 = !DILocation(line: 118, column: 5, scope: !71)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!90 = !DILocalVariable(name: "data", scope: !89, file: !15, line: 61, type: !3)
!91 = !DILocation(line: 61, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataPtr1", scope: !89, file: !15, line: 62, type: !22)
!93 = !DILocation(line: 62, column: 13, scope: !89)
!94 = !DILocalVariable(name: "dataPtr2", scope: !89, file: !15, line: 63, type: !22)
!95 = !DILocation(line: 63, column: 13, scope: !89)
!96 = !DILocation(line: 64, column: 10, scope: !89)
!97 = !DILocalVariable(name: "data", scope: !98, file: !15, line: 66, type: !3)
!98 = distinct !DILexicalBlock(scope: !89, file: !15, line: 65, column: 5)
!99 = !DILocation(line: 66, column: 16, scope: !98)
!100 = !DILocation(line: 66, column: 24, scope: !98)
!101 = !DILocation(line: 66, column: 23, scope: !98)
!102 = !DILocation(line: 68, column: 24, scope: !98)
!103 = !DILocation(line: 68, column: 14, scope: !98)
!104 = !DILocation(line: 69, column: 13, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !15, line: 69, column: 13)
!106 = !DILocation(line: 69, column: 18, scope: !105)
!107 = !DILocation(line: 69, column: 13, scope: !98)
!108 = !DILocation(line: 69, column: 28, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !15, line: 69, column: 27)
!110 = !DILocation(line: 70, column: 9, scope: !98)
!111 = !DILocation(line: 71, column: 9, scope: !98)
!112 = !DILocation(line: 71, column: 21, scope: !98)
!113 = !DILocation(line: 72, column: 21, scope: !98)
!114 = !DILocation(line: 72, column: 10, scope: !98)
!115 = !DILocation(line: 72, column: 19, scope: !98)
!116 = !DILocalVariable(name: "data", scope: !117, file: !15, line: 75, type: !3)
!117 = distinct !DILexicalBlock(scope: !89, file: !15, line: 74, column: 5)
!118 = !DILocation(line: 75, column: 16, scope: !117)
!119 = !DILocation(line: 75, column: 24, scope: !117)
!120 = !DILocation(line: 75, column: 23, scope: !117)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !15, line: 77, type: !53)
!122 = distinct !DILexicalBlock(scope: !117, file: !15, line: 76, column: 9)
!123 = !DILocation(line: 77, column: 18, scope: !122)
!124 = !DILocation(line: 78, column: 13, scope: !122)
!125 = !DILocation(line: 79, column: 13, scope: !122)
!126 = !DILocation(line: 79, column: 25, scope: !122)
!127 = !DILocation(line: 82, column: 13, scope: !122)
!128 = !DILocation(line: 83, column: 13, scope: !122)
!129 = !DILocation(line: 83, column: 25, scope: !122)
!130 = !DILocation(line: 84, column: 23, scope: !122)
!131 = !DILocation(line: 84, column: 13, scope: !122)
!132 = !DILocation(line: 85, column: 18, scope: !122)
!133 = !DILocation(line: 85, column: 13, scope: !122)
!134 = !DILocation(line: 88, column: 1, scope: !89)
