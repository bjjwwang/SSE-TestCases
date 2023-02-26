; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_badSink(i32* noundef %data) #0 !dbg !18 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !25, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !31
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !32
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !35
  %1 = load i32*, i32** %data.addr, align 8, !dbg !35
  %2 = bitcast i32* %1 to i8*, !dbg !35
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !35
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !35
  %mul = mul i64 %call3, 4, !dbg !35
  %call4 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #6, !dbg !35
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !36
  store i32 0, i32* %arrayidx5, align 4, !dbg !37
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !38
  call void @printWLine(i32* noundef %arraydecay6), !dbg !39
  %3 = load i32*, i32** %data.addr, align 8, !dbg !40
  %4 = bitcast i32* %3 to i8*, !dbg !40
  call void @free(i8* noundef %4), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_bad() #0 !dbg !43 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !46, metadata !DIExpression()), !dbg !47
  store i32* null, i32** %data, align 8, !dbg !48
  %call = call i8* @malloc(i64 noundef 200) #7, !dbg !49
  %0 = bitcast i8* %call to i32*, !dbg !50
  store i32* %0, i32** %data, align 8, !dbg !51
  %1 = load i32*, i32** %data, align 8, !dbg !52
  %cmp = icmp eq i32* %1, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !56
  unreachable, !dbg !56

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !58
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !59
  %3 = load i32*, i32** %data, align 8, !dbg !60
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  %4 = load i32*, i32** %data, align 8, !dbg !62
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_badSink(i32* noundef %4), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_goodG2BSink(i32* noundef %data) #0 !dbg !65 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !68, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !72
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !73
  store i32 0, i32* %arrayidx, align 4, !dbg !74
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %0 = bitcast i32* %arraydecay1 to i8*, !dbg !75
  %1 = load i32*, i32** %data.addr, align 8, !dbg !75
  %2 = bitcast i32* %1 to i8*, !dbg !75
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !75
  %call3 = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !75
  %mul = mul i64 %call3, 4, !dbg !75
  %call4 = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %2, i64 noundef %mul, i64 noundef 400) #6, !dbg !75
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !76
  store i32 0, i32* %arrayidx5, align 4, !dbg !77
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !78
  call void @printWLine(i32* noundef %arraydecay6), !dbg !79
  %3 = load i32*, i32** %data.addr, align 8, !dbg !80
  %4 = bitcast i32* %3 to i8*, !dbg !80
  call void @free(i8* noundef %4), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_good() #0 !dbg !83 {
entry:
  call void @goodG2B(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !106 {
entry:
  %data = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !107, metadata !DIExpression()), !dbg !108
  store i32* null, i32** %data, align 8, !dbg !109
  %call = call i8* @malloc(i64 noundef 400) #7, !dbg !110
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %data, align 8, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !119
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !120
  %3 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %4 = load i32*, i32** %data, align 8, !dbg !123
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_goodG2BSink(i32* noundef %4), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_badSink", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null, !3}
!22 = !{}
!23 = !DILocalVariable(name: "data", arg: 1, scope: !18, file: !19, line: 23, type: !3)
!24 = !DILocation(line: 23, column: 73, scope: !18)
!25 = !DILocalVariable(name: "dest", scope: !26, file: !19, line: 26, type: !27)
!26 = distinct !DILexicalBlock(scope: !18, file: !19, line: 25, column: 5)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 26, column: 17, scope: !26)
!31 = !DILocation(line: 27, column: 17, scope: !26)
!32 = !DILocation(line: 27, column: 9, scope: !26)
!33 = !DILocation(line: 28, column: 9, scope: !26)
!34 = !DILocation(line: 28, column: 21, scope: !26)
!35 = !DILocation(line: 31, column: 9, scope: !26)
!36 = !DILocation(line: 32, column: 9, scope: !26)
!37 = !DILocation(line: 32, column: 21, scope: !26)
!38 = !DILocation(line: 33, column: 20, scope: !26)
!39 = !DILocation(line: 33, column: 9, scope: !26)
!40 = !DILocation(line: 34, column: 14, scope: !26)
!41 = !DILocation(line: 34, column: 9, scope: !26)
!42 = !DILocation(line: 36, column: 1, scope: !18)
!43 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_bad", scope: !19, file: !19, line: 38, type: !44, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!44 = !DISubroutineType(types: !45)
!45 = !{null}
!46 = !DILocalVariable(name: "data", scope: !43, file: !19, line: 40, type: !3)
!47 = !DILocation(line: 40, column: 15, scope: !43)
!48 = !DILocation(line: 41, column: 10, scope: !43)
!49 = !DILocation(line: 43, column: 23, scope: !43)
!50 = !DILocation(line: 43, column: 12, scope: !43)
!51 = !DILocation(line: 43, column: 10, scope: !43)
!52 = !DILocation(line: 44, column: 9, scope: !53)
!53 = distinct !DILexicalBlock(scope: !43, file: !19, line: 44, column: 9)
!54 = !DILocation(line: 44, column: 14, scope: !53)
!55 = !DILocation(line: 44, column: 9, scope: !43)
!56 = !DILocation(line: 44, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !19, line: 44, column: 23)
!58 = !DILocation(line: 45, column: 13, scope: !43)
!59 = !DILocation(line: 45, column: 5, scope: !43)
!60 = !DILocation(line: 46, column: 5, scope: !43)
!61 = !DILocation(line: 46, column: 16, scope: !43)
!62 = !DILocation(line: 47, column: 62, scope: !43)
!63 = !DILocation(line: 47, column: 5, scope: !43)
!64 = !DILocation(line: 48, column: 1, scope: !43)
!65 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_goodG2BSink", scope: !19, file: !19, line: 54, type: !20, scopeLine: 55, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!66 = !DILocalVariable(name: "data", arg: 1, scope: !65, file: !19, line: 54, type: !3)
!67 = !DILocation(line: 54, column: 77, scope: !65)
!68 = !DILocalVariable(name: "dest", scope: !69, file: !19, line: 57, type: !27)
!69 = distinct !DILexicalBlock(scope: !65, file: !19, line: 56, column: 5)
!70 = !DILocation(line: 57, column: 17, scope: !69)
!71 = !DILocation(line: 58, column: 17, scope: !69)
!72 = !DILocation(line: 58, column: 9, scope: !69)
!73 = !DILocation(line: 59, column: 9, scope: !69)
!74 = !DILocation(line: 59, column: 21, scope: !69)
!75 = !DILocation(line: 62, column: 9, scope: !69)
!76 = !DILocation(line: 63, column: 9, scope: !69)
!77 = !DILocation(line: 63, column: 21, scope: !69)
!78 = !DILocation(line: 64, column: 20, scope: !69)
!79 = !DILocation(line: 64, column: 9, scope: !69)
!80 = !DILocation(line: 65, column: 14, scope: !69)
!81 = !DILocation(line: 65, column: 9, scope: !69)
!82 = !DILocation(line: 67, column: 1, scope: !65)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memcpy_41_good", scope: !19, file: !19, line: 82, type: !44, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!84 = !DILocation(line: 84, column: 5, scope: !83)
!85 = !DILocation(line: 85, column: 1, scope: !83)
!86 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 97, type: !87, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!87 = !DISubroutineType(types: !88)
!88 = !{!8, !8, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !19, line: 97, type: !8)
!93 = !DILocation(line: 97, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !19, line: 97, type: !89)
!95 = !DILocation(line: 97, column: 27, scope: !86)
!96 = !DILocation(line: 100, column: 22, scope: !86)
!97 = !DILocation(line: 100, column: 12, scope: !86)
!98 = !DILocation(line: 100, column: 5, scope: !86)
!99 = !DILocation(line: 102, column: 5, scope: !86)
!100 = !DILocation(line: 103, column: 5, scope: !86)
!101 = !DILocation(line: 104, column: 5, scope: !86)
!102 = !DILocation(line: 107, column: 5, scope: !86)
!103 = !DILocation(line: 108, column: 5, scope: !86)
!104 = !DILocation(line: 109, column: 5, scope: !86)
!105 = !DILocation(line: 111, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 70, type: !44, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!107 = !DILocalVariable(name: "data", scope: !106, file: !19, line: 72, type: !3)
!108 = !DILocation(line: 72, column: 15, scope: !106)
!109 = !DILocation(line: 73, column: 10, scope: !106)
!110 = !DILocation(line: 75, column: 23, scope: !106)
!111 = !DILocation(line: 75, column: 12, scope: !106)
!112 = !DILocation(line: 75, column: 10, scope: !106)
!113 = !DILocation(line: 76, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !19, line: 76, column: 9)
!115 = !DILocation(line: 76, column: 14, scope: !114)
!116 = !DILocation(line: 76, column: 9, scope: !106)
!117 = !DILocation(line: 76, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !19, line: 76, column: 23)
!119 = !DILocation(line: 77, column: 13, scope: !106)
!120 = !DILocation(line: 77, column: 5, scope: !106)
!121 = !DILocation(line: 78, column: 5, scope: !106)
!122 = !DILocation(line: 78, column: 17, scope: !106)
!123 = !DILocation(line: 79, column: 66, scope: !106)
!124 = !DILocation(line: 79, column: 5, scope: !106)
!125 = !DILocation(line: 80, column: 1, scope: !106)
