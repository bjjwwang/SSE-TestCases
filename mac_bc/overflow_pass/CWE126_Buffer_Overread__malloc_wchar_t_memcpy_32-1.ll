; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !25, metadata !DIExpression()), !dbg !27
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !28, metadata !DIExpression()), !dbg !29
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !29
  store i32* null, i32** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !34
  %1 = load i32*, i32** %0, align 8, !dbg !35
  store i32* %1, i32** %data1, align 8, !dbg !33
  %call = call i8* @malloc(i64 noundef 200) #6, !dbg !36
  %2 = bitcast i8* %call to i32*, !dbg !37
  store i32* %2, i32** %data1, align 8, !dbg !38
  %3 = load i32*, i32** %data1, align 8, !dbg !39
  %cmp = icmp eq i32* %3, null, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !45
  %call2 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !46
  %5 = load i32*, i32** %data1, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !47
  store i32 0, i32* %arrayidx, align 4, !dbg !48
  %6 = load i32*, i32** %data1, align 8, !dbg !49
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !50
  store i32* %6, i32** %7, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !52, metadata !DIExpression()), !dbg !54
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !55
  %9 = load i32*, i32** %8, align 8, !dbg !56
  store i32* %9, i32** %data3, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !57, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !64
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !65
  store i32 0, i32* %arrayidx5, align 4, !dbg !66
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %10 = bitcast i32* %arraydecay6 to i8*, !dbg !67
  %11 = load i32*, i32** %data3, align 8, !dbg !67
  %12 = bitcast i32* %11 to i8*, !dbg !67
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !67
  %mul = mul i64 %call8, 4, !dbg !67
  %call9 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %12, i64 noundef %mul, i64 noundef 400) #8, !dbg !67
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx10, align 4, !dbg !69
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  call void @printWLine(i32* noundef %arraydecay11), !dbg !71
  %13 = load i32*, i32** %data3, align 8, !dbg !72
  %14 = bitcast i32* %13 to i8*, !dbg !72
  call void @free(i8* noundef %14), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32_good() #0 !dbg !75 {
entry:
  call void @goodG2B(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataPtr1 = alloca i32**, align 8
  %dataPtr2 = alloca i32**, align 8
  %data1 = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i32*** %dataPtr1, metadata !101, metadata !DIExpression()), !dbg !102
  store i32** %data, i32*** %dataPtr1, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i32*** %dataPtr2, metadata !103, metadata !DIExpression()), !dbg !104
  store i32** %data, i32*** %dataPtr2, align 8, !dbg !104
  store i32* null, i32** %data, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !106, metadata !DIExpression()), !dbg !108
  %0 = load i32**, i32*** %dataPtr1, align 8, !dbg !109
  %1 = load i32*, i32** %0, align 8, !dbg !110
  store i32* %1, i32** %data1, align 8, !dbg !108
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !111
  %2 = bitcast i8* %call to i32*, !dbg !112
  store i32* %2, i32** %data1, align 8, !dbg !113
  %3 = load i32*, i32** %data1, align 8, !dbg !114
  %cmp = icmp eq i32* %3, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %4 = load i32*, i32** %data1, align 8, !dbg !120
  %call2 = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 99), !dbg !121
  %5 = load i32*, i32** %data1, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 99, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %6 = load i32*, i32** %data1, align 8, !dbg !124
  %7 = load i32**, i32*** %dataPtr1, align 8, !dbg !125
  store i32* %6, i32** %7, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !127, metadata !DIExpression()), !dbg !129
  %8 = load i32**, i32*** %dataPtr2, align 8, !dbg !130
  %9 = load i32*, i32** %8, align 8, !dbg !131
  store i32* %9, i32** %data3, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !132, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !136
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !137
  store i32 0, i32* %arrayidx5, align 4, !dbg !138
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %10 = bitcast i32* %arraydecay6 to i8*, !dbg !139
  %11 = load i32*, i32** %data3, align 8, !dbg !139
  %12 = bitcast i32* %11 to i8*, !dbg !139
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !139
  %mul = mul i64 %call8, 4, !dbg !139
  %call9 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %12, i64 noundef %mul, i64 noundef 400) #8, !dbg !139
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !140
  store i32 0, i32* %arrayidx10, align 4, !dbg !141
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !142
  call void @printWLine(i32* noundef %arraydecay11), !dbg !143
  %13 = load i32*, i32** %data3, align 8, !dbg !144
  %14 = bitcast i32* %13 to i8*, !dbg !144
  call void @free(i8* noundef %14), !dbg !145
  ret void, !dbg !146
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocalVariable(name: "dataPtr1", scope: !18, file: !19, line: 26, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!27 = !DILocation(line: 26, column: 16, scope: !18)
!28 = !DILocalVariable(name: "dataPtr2", scope: !18, file: !19, line: 27, type: !26)
!29 = !DILocation(line: 27, column: 16, scope: !18)
!30 = !DILocation(line: 28, column: 10, scope: !18)
!31 = !DILocalVariable(name: "data", scope: !32, file: !19, line: 30, type: !3)
!32 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 5)
!33 = !DILocation(line: 30, column: 19, scope: !32)
!34 = !DILocation(line: 30, column: 27, scope: !32)
!35 = !DILocation(line: 30, column: 26, scope: !32)
!36 = !DILocation(line: 32, column: 27, scope: !32)
!37 = !DILocation(line: 32, column: 16, scope: !32)
!38 = !DILocation(line: 32, column: 14, scope: !32)
!39 = !DILocation(line: 33, column: 13, scope: !40)
!40 = distinct !DILexicalBlock(scope: !32, file: !19, line: 33, column: 13)
!41 = !DILocation(line: 33, column: 18, scope: !40)
!42 = !DILocation(line: 33, column: 13, scope: !32)
!43 = !DILocation(line: 33, column: 28, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !19, line: 33, column: 27)
!45 = !DILocation(line: 34, column: 17, scope: !32)
!46 = !DILocation(line: 34, column: 9, scope: !32)
!47 = !DILocation(line: 35, column: 9, scope: !32)
!48 = !DILocation(line: 35, column: 20, scope: !32)
!49 = !DILocation(line: 36, column: 21, scope: !32)
!50 = !DILocation(line: 36, column: 10, scope: !32)
!51 = !DILocation(line: 36, column: 19, scope: !32)
!52 = !DILocalVariable(name: "data", scope: !53, file: !19, line: 39, type: !3)
!53 = distinct !DILexicalBlock(scope: !18, file: !19, line: 38, column: 5)
!54 = !DILocation(line: 39, column: 19, scope: !53)
!55 = !DILocation(line: 39, column: 27, scope: !53)
!56 = !DILocation(line: 39, column: 26, scope: !53)
!57 = !DILocalVariable(name: "dest", scope: !58, file: !19, line: 41, type: !59)
!58 = distinct !DILexicalBlock(scope: !53, file: !19, line: 40, column: 9)
!59 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !60)
!60 = !{!61}
!61 = !DISubrange(count: 100)
!62 = !DILocation(line: 41, column: 21, scope: !58)
!63 = !DILocation(line: 42, column: 21, scope: !58)
!64 = !DILocation(line: 42, column: 13, scope: !58)
!65 = !DILocation(line: 43, column: 13, scope: !58)
!66 = !DILocation(line: 43, column: 25, scope: !58)
!67 = !DILocation(line: 46, column: 13, scope: !58)
!68 = !DILocation(line: 47, column: 13, scope: !58)
!69 = !DILocation(line: 47, column: 25, scope: !58)
!70 = !DILocation(line: 48, column: 24, scope: !58)
!71 = !DILocation(line: 48, column: 13, scope: !58)
!72 = !DILocation(line: 49, column: 18, scope: !58)
!73 = !DILocation(line: 49, column: 13, scope: !58)
!74 = !DILocation(line: 52, column: 1, scope: !18)
!75 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_32_good", scope: !19, file: !19, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!76 = !DILocation(line: 92, column: 5, scope: !75)
!77 = !DILocation(line: 93, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 104, type: !79, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!79 = !DISubroutineType(types: !80)
!80 = !{!8, !8, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !19, line: 104, type: !8)
!85 = !DILocation(line: 104, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !19, line: 104, type: !81)
!87 = !DILocation(line: 104, column: 27, scope: !78)
!88 = !DILocation(line: 107, column: 22, scope: !78)
!89 = !DILocation(line: 107, column: 12, scope: !78)
!90 = !DILocation(line: 107, column: 5, scope: !78)
!91 = !DILocation(line: 109, column: 5, scope: !78)
!92 = !DILocation(line: 110, column: 5, scope: !78)
!93 = !DILocation(line: 111, column: 5, scope: !78)
!94 = !DILocation(line: 114, column: 5, scope: !78)
!95 = !DILocation(line: 115, column: 5, scope: !78)
!96 = !DILocation(line: 116, column: 5, scope: !78)
!97 = !DILocation(line: 118, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!99 = !DILocalVariable(name: "data", scope: !98, file: !19, line: 61, type: !3)
!100 = !DILocation(line: 61, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataPtr1", scope: !98, file: !19, line: 62, type: !26)
!102 = !DILocation(line: 62, column: 16, scope: !98)
!103 = !DILocalVariable(name: "dataPtr2", scope: !98, file: !19, line: 63, type: !26)
!104 = !DILocation(line: 63, column: 16, scope: !98)
!105 = !DILocation(line: 64, column: 10, scope: !98)
!106 = !DILocalVariable(name: "data", scope: !107, file: !19, line: 66, type: !3)
!107 = distinct !DILexicalBlock(scope: !98, file: !19, line: 65, column: 5)
!108 = !DILocation(line: 66, column: 19, scope: !107)
!109 = !DILocation(line: 66, column: 27, scope: !107)
!110 = !DILocation(line: 66, column: 26, scope: !107)
!111 = !DILocation(line: 68, column: 27, scope: !107)
!112 = !DILocation(line: 68, column: 16, scope: !107)
!113 = !DILocation(line: 68, column: 14, scope: !107)
!114 = !DILocation(line: 69, column: 13, scope: !115)
!115 = distinct !DILexicalBlock(scope: !107, file: !19, line: 69, column: 13)
!116 = !DILocation(line: 69, column: 18, scope: !115)
!117 = !DILocation(line: 69, column: 13, scope: !107)
!118 = !DILocation(line: 69, column: 28, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !19, line: 69, column: 27)
!120 = !DILocation(line: 70, column: 17, scope: !107)
!121 = !DILocation(line: 70, column: 9, scope: !107)
!122 = !DILocation(line: 71, column: 9, scope: !107)
!123 = !DILocation(line: 71, column: 21, scope: !107)
!124 = !DILocation(line: 72, column: 21, scope: !107)
!125 = !DILocation(line: 72, column: 10, scope: !107)
!126 = !DILocation(line: 72, column: 19, scope: !107)
!127 = !DILocalVariable(name: "data", scope: !128, file: !19, line: 75, type: !3)
!128 = distinct !DILexicalBlock(scope: !98, file: !19, line: 74, column: 5)
!129 = !DILocation(line: 75, column: 19, scope: !128)
!130 = !DILocation(line: 75, column: 27, scope: !128)
!131 = !DILocation(line: 75, column: 26, scope: !128)
!132 = !DILocalVariable(name: "dest", scope: !133, file: !19, line: 77, type: !59)
!133 = distinct !DILexicalBlock(scope: !128, file: !19, line: 76, column: 9)
!134 = !DILocation(line: 77, column: 21, scope: !133)
!135 = !DILocation(line: 78, column: 21, scope: !133)
!136 = !DILocation(line: 78, column: 13, scope: !133)
!137 = !DILocation(line: 79, column: 13, scope: !133)
!138 = !DILocation(line: 79, column: 25, scope: !133)
!139 = !DILocation(line: 82, column: 13, scope: !133)
!140 = !DILocation(line: 83, column: 13, scope: !133)
!141 = !DILocation(line: 83, column: 25, scope: !133)
!142 = !DILocation(line: 84, column: 24, scope: !133)
!143 = !DILocation(line: 84, column: 13, scope: !133)
!144 = !DILocation(line: 85, column: 18, scope: !133)
!145 = !DILocation(line: 85, column: 13, scope: !133)
!146 = !DILocation(line: 88, column: 1, scope: !98)
