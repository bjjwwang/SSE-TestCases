; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memmove_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memmove_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_03_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 200) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !38
  %3 = load i32*, i32** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !39
  store i32 0, i32* %arrayidx, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !47
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !48
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !49
  store i32 0, i32* %arrayidx3, align 4, !dbg !50
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !51
  %5 = load i32*, i32** %data, align 8, !dbg !51
  %6 = bitcast i32* %5 to i8*, !dbg !51
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !51
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !51
  %mul = mul i64 %call6, 4, !dbg !51
  %call7 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %6, i64 noundef %mul, i64 noundef 400) #8, !dbg !51
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx8, align 4, !dbg !53
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  call void @printWLine(i32* noundef %arraydecay9), !dbg !55
  %7 = load i32*, i32** %data, align 8, !dbg !56
  %8 = bitcast i32* %7 to i8*, !dbg !56
  call void @free(i8* noundef %8), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_03_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_03_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE126_Buffer_Overread__malloc_wchar_t_memmove_03_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !83 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !84, metadata !DIExpression()), !dbg !85
  store i32* null, i32** %data, align 8, !dbg !86
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !87
  %0 = bitcast i8* %call to i32*, !dbg !90
  store i32* %0, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %cmp = icmp eq i32* %1, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !98
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !99
  %3 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !105
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !106
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !107
  store i32 0, i32* %arrayidx3, align 4, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !109
  %5 = load i32*, i32** %data, align 8, !dbg !109
  %6 = bitcast i32* %5 to i8*, !dbg !109
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !109
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !109
  %mul = mul i64 %call6, 4, !dbg !109
  %call7 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %6, i64 noundef %mul, i64 noundef 400) #8, !dbg !109
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !110
  store i32 0, i32* %arrayidx8, align 4, !dbg !111
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !112
  call void @printWLine(i32* noundef %arraydecay9), !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  %8 = bitcast i32* %7 to i8*, !dbg !114
  call void @free(i8* noundef %8), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  store i32* null, i32** %data, align 8, !dbg !120
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !121
  %0 = bitcast i8* %call to i32*, !dbg !124
  store i32* %0, i32** %data, align 8, !dbg !125
  %1 = load i32*, i32** %data, align 8, !dbg !126
  %cmp = icmp eq i32* %1, null, !dbg !128
  br i1 %cmp, label %if.then, label %if.end, !dbg !129

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !130
  unreachable, !dbg !130

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !132
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !133
  %3 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call2 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !140
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx3, align 4, !dbg !142
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %4 = bitcast i32* %arraydecay4 to i8*, !dbg !143
  %5 = load i32*, i32** %data, align 8, !dbg !143
  %6 = bitcast i32* %5 to i8*, !dbg !143
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !143
  %mul = mul i64 %call6, 4, !dbg !143
  %call7 = call i8* @__memmove_chk(i8* noundef %4, i8* noundef %6, i64 noundef %mul, i64 noundef 400) #8, !dbg !143
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx8, align 4, !dbg !145
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  call void @printWLine(i32* noundef %arraydecay9), !dbg !147
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %8 = bitcast i32* %7 to i8*, !dbg !148
  call void @free(i8* noundef %8), !dbg !149
  ret void, !dbg !150
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memmove_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_03_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__malloc_wchar_t_memmove_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 10, scope: !18)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 28, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 8)
!29 = !DILocation(line: 30, column: 16, scope: !27)
!30 = !DILocation(line: 30, column: 14, scope: !27)
!31 = !DILocation(line: 31, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !19, line: 31, column: 13)
!33 = !DILocation(line: 31, column: 18, scope: !32)
!34 = !DILocation(line: 31, column: 13, scope: !27)
!35 = !DILocation(line: 31, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 31, column: 27)
!37 = !DILocation(line: 32, column: 17, scope: !27)
!38 = !DILocation(line: 32, column: 9, scope: !27)
!39 = !DILocation(line: 33, column: 9, scope: !27)
!40 = !DILocation(line: 33, column: 20, scope: !27)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !19, line: 36, type: !43)
!42 = distinct !DILexicalBlock(scope: !18, file: !19, line: 35, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 36, column: 17, scope: !42)
!47 = !DILocation(line: 37, column: 17, scope: !42)
!48 = !DILocation(line: 37, column: 9, scope: !42)
!49 = !DILocation(line: 38, column: 9, scope: !42)
!50 = !DILocation(line: 38, column: 21, scope: !42)
!51 = !DILocation(line: 41, column: 9, scope: !42)
!52 = !DILocation(line: 42, column: 9, scope: !42)
!53 = !DILocation(line: 42, column: 21, scope: !42)
!54 = !DILocation(line: 43, column: 20, scope: !42)
!55 = !DILocation(line: 43, column: 9, scope: !42)
!56 = !DILocation(line: 44, column: 14, scope: !42)
!57 = !DILocation(line: 44, column: 9, scope: !42)
!58 = !DILocation(line: 46, column: 1, scope: !18)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_memmove_03_good", scope: !19, file: !19, line: 109, type: !20, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!60 = !DILocation(line: 111, column: 5, scope: !59)
!61 = !DILocation(line: 112, column: 5, scope: !59)
!62 = !DILocation(line: 113, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 125, type: !64, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!64 = !DISubroutineType(types: !65)
!65 = !{!8, !8, !66}
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !19, line: 125, type: !8)
!70 = !DILocation(line: 125, column: 14, scope: !63)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !19, line: 125, type: !66)
!72 = !DILocation(line: 125, column: 27, scope: !63)
!73 = !DILocation(line: 128, column: 22, scope: !63)
!74 = !DILocation(line: 128, column: 12, scope: !63)
!75 = !DILocation(line: 128, column: 5, scope: !63)
!76 = !DILocation(line: 130, column: 5, scope: !63)
!77 = !DILocation(line: 131, column: 5, scope: !63)
!78 = !DILocation(line: 132, column: 5, scope: !63)
!79 = !DILocation(line: 135, column: 5, scope: !63)
!80 = !DILocation(line: 136, column: 5, scope: !63)
!81 = !DILocation(line: 137, column: 5, scope: !63)
!82 = !DILocation(line: 139, column: 5, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 53, type: !20, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!84 = !DILocalVariable(name: "data", scope: !83, file: !19, line: 55, type: !3)
!85 = !DILocation(line: 55, column: 15, scope: !83)
!86 = !DILocation(line: 56, column: 10, scope: !83)
!87 = !DILocation(line: 65, column: 27, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !19, line: 63, column: 5)
!89 = distinct !DILexicalBlock(scope: !83, file: !19, line: 57, column: 8)
!90 = !DILocation(line: 65, column: 16, scope: !88)
!91 = !DILocation(line: 65, column: 14, scope: !88)
!92 = !DILocation(line: 66, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !88, file: !19, line: 66, column: 13)
!94 = !DILocation(line: 66, column: 18, scope: !93)
!95 = !DILocation(line: 66, column: 13, scope: !88)
!96 = !DILocation(line: 66, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !19, line: 66, column: 27)
!98 = !DILocation(line: 67, column: 17, scope: !88)
!99 = !DILocation(line: 67, column: 9, scope: !88)
!100 = !DILocation(line: 68, column: 9, scope: !88)
!101 = !DILocation(line: 68, column: 21, scope: !88)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !19, line: 71, type: !43)
!103 = distinct !DILexicalBlock(scope: !83, file: !19, line: 70, column: 5)
!104 = !DILocation(line: 71, column: 17, scope: !103)
!105 = !DILocation(line: 72, column: 17, scope: !103)
!106 = !DILocation(line: 72, column: 9, scope: !103)
!107 = !DILocation(line: 73, column: 9, scope: !103)
!108 = !DILocation(line: 73, column: 21, scope: !103)
!109 = !DILocation(line: 76, column: 9, scope: !103)
!110 = !DILocation(line: 77, column: 9, scope: !103)
!111 = !DILocation(line: 77, column: 21, scope: !103)
!112 = !DILocation(line: 78, column: 20, scope: !103)
!113 = !DILocation(line: 78, column: 9, scope: !103)
!114 = !DILocation(line: 79, column: 14, scope: !103)
!115 = !DILocation(line: 79, column: 9, scope: !103)
!116 = !DILocation(line: 81, column: 1, scope: !83)
!117 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 84, type: !20, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!118 = !DILocalVariable(name: "data", scope: !117, file: !19, line: 86, type: !3)
!119 = !DILocation(line: 86, column: 15, scope: !117)
!120 = !DILocation(line: 87, column: 10, scope: !117)
!121 = !DILocation(line: 91, column: 27, scope: !122)
!122 = distinct !DILexicalBlock(scope: !123, file: !19, line: 89, column: 5)
!123 = distinct !DILexicalBlock(scope: !117, file: !19, line: 88, column: 8)
!124 = !DILocation(line: 91, column: 16, scope: !122)
!125 = !DILocation(line: 91, column: 14, scope: !122)
!126 = !DILocation(line: 92, column: 13, scope: !127)
!127 = distinct !DILexicalBlock(scope: !122, file: !19, line: 92, column: 13)
!128 = !DILocation(line: 92, column: 18, scope: !127)
!129 = !DILocation(line: 92, column: 13, scope: !122)
!130 = !DILocation(line: 92, column: 28, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !19, line: 92, column: 27)
!132 = !DILocation(line: 93, column: 17, scope: !122)
!133 = !DILocation(line: 93, column: 9, scope: !122)
!134 = !DILocation(line: 94, column: 9, scope: !122)
!135 = !DILocation(line: 94, column: 21, scope: !122)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !19, line: 97, type: !43)
!137 = distinct !DILexicalBlock(scope: !117, file: !19, line: 96, column: 5)
!138 = !DILocation(line: 97, column: 17, scope: !137)
!139 = !DILocation(line: 98, column: 17, scope: !137)
!140 = !DILocation(line: 98, column: 9, scope: !137)
!141 = !DILocation(line: 99, column: 9, scope: !137)
!142 = !DILocation(line: 99, column: 21, scope: !137)
!143 = !DILocation(line: 102, column: 9, scope: !137)
!144 = !DILocation(line: 103, column: 9, scope: !137)
!145 = !DILocation(line: 103, column: 21, scope: !137)
!146 = !DILocation(line: 104, column: 20, scope: !137)
!147 = !DILocation(line: 104, column: 9, scope: !137)
!148 = !DILocation(line: 105, column: 14, scope: !137)
!149 = !DILocation(line: 105, column: 9, scope: !137)
!150 = !DILocation(line: 107, column: 1, scope: !117)
