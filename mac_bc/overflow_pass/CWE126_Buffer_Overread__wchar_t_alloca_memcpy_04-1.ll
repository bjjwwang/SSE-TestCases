; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !33
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !37
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !38
  store i32 0, i32* %arrayidx2, align 4, !dbg !39
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !51
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx4, align 4, !dbg !53
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !54
  %10 = load i32*, i32** %data, align 8, !dbg !54
  %11 = bitcast i32* %10 to i8*, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !54
  %mul = mul i64 %call7, 4, !dbg !54
  %call8 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !54
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx9, align 4, !dbg !56
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  call void @printWLine(i32* noundef %arraydecay10), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04_good() #0 !dbg !60 {
entry:
  call void @goodG2B1(), !dbg !61
  call void @goodG2B2(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !70, metadata !DIExpression()), !dbg !71
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !72, metadata !DIExpression()), !dbg !73
  %call = call i64 @time(i64* noundef null), !dbg !74
  %conv = trunc i64 %call to i32, !dbg !75
  call void @srand(i32 noundef %conv), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04_good(), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04_bad(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !82
  ret i32 0, !dbg !83
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !84 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 200, align 16, !dbg !89
  %1 = bitcast i8* %0 to i32*, !dbg !90
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = alloca i8, i64 400, align 16, !dbg !93
  %3 = bitcast i8* %2 to i32*, !dbg !94
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !92
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !95
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !96
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !97
  store i32 0, i32* %arrayidx, align 4, !dbg !98
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !100
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !101
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !101
  store i32 0, i32* %arrayidx2, align 4, !dbg !102
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !103
  store i32* %8, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !110
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !111
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !112
  store i32 0, i32* %arrayidx4, align 4, !dbg !113
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !114
  %10 = load i32*, i32** %data, align 8, !dbg !114
  %11 = bitcast i32* %10 to i8*, !dbg !114
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !114
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !114
  %mul = mul i64 %call7, 4, !dbg !114
  %call8 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !114
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !115
  store i32 0, i32* %arrayidx9, align 4, !dbg !116
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !117
  call void @printWLine(i32* noundef %arraydecay10), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !120 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %0 = alloca i8, i64 200, align 16, !dbg !125
  %1 = bitcast i8* %0 to i32*, !dbg !126
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !127, metadata !DIExpression()), !dbg !128
  %2 = alloca i8, i64 400, align 16, !dbg !129
  %3 = bitcast i8* %2 to i32*, !dbg !130
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !128
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !131
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !132
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !133
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !133
  store i32 0, i32* %arrayidx, align 4, !dbg !134
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !135
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !136
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !137
  store i32 0, i32* %arrayidx2, align 4, !dbg !138
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !139
  store i32* %8, i32** %data, align 8, !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !143, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !146
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !147
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !148
  store i32 0, i32* %arrayidx4, align 4, !dbg !149
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %9 = bitcast i32* %arraydecay5 to i8*, !dbg !150
  %10 = load i32*, i32** %data, align 8, !dbg !150
  %11 = bitcast i32* %10 to i8*, !dbg !150
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !150
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !150
  %mul = mul i64 %call7, 4, !dbg !150
  %call8 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !150
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !151
  store i32 0, i32* %arrayidx9, align 4, !dbg !152
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !153
  call void @printWLine(i32* noundef %arraydecay10), !dbg !154
  ret void, !dbg !155
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04_bad", scope: !18, file: !18, line: 30, type: !19, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 32, type: !3)
!23 = !DILocation(line: 32, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 33, type: !3)
!25 = !DILocation(line: 33, column: 15, scope: !17)
!26 = !DILocation(line: 33, column: 42, scope: !17)
!27 = !DILocation(line: 33, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 34, type: !3)
!29 = !DILocation(line: 34, column: 15, scope: !17)
!30 = !DILocation(line: 34, column: 43, scope: !17)
!31 = !DILocation(line: 34, column: 32, scope: !17)
!32 = !DILocation(line: 35, column: 13, scope: !17)
!33 = !DILocation(line: 35, column: 5, scope: !17)
!34 = !DILocation(line: 36, column: 5, scope: !17)
!35 = !DILocation(line: 36, column: 25, scope: !17)
!36 = !DILocation(line: 37, column: 13, scope: !17)
!37 = !DILocation(line: 37, column: 5, scope: !17)
!38 = !DILocation(line: 38, column: 5, scope: !17)
!39 = !DILocation(line: 38, column: 27, scope: !17)
!40 = !DILocation(line: 42, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !18, line: 40, column: 5)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 39, column: 8)
!43 = !DILocation(line: 42, column: 14, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !18, line: 45, type: !46)
!45 = distinct !DILexicalBlock(scope: !17, file: !18, line: 44, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 45, column: 17, scope: !45)
!50 = !DILocation(line: 46, column: 17, scope: !45)
!51 = !DILocation(line: 46, column: 9, scope: !45)
!52 = !DILocation(line: 47, column: 9, scope: !45)
!53 = !DILocation(line: 47, column: 21, scope: !45)
!54 = !DILocation(line: 50, column: 9, scope: !45)
!55 = !DILocation(line: 51, column: 9, scope: !45)
!56 = !DILocation(line: 51, column: 21, scope: !45)
!57 = !DILocation(line: 52, column: 20, scope: !45)
!58 = !DILocation(line: 52, column: 9, scope: !45)
!59 = !DILocation(line: 54, column: 1, scope: !17)
!60 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_04_good", scope: !18, file: !18, line: 119, type: !19, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!61 = !DILocation(line: 121, column: 5, scope: !60)
!62 = !DILocation(line: 122, column: 5, scope: !60)
!63 = !DILocation(line: 123, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 135, type: !65, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DISubroutineType(types: !66)
!66 = !{!8, !8, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!70 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !18, line: 135, type: !8)
!71 = !DILocation(line: 135, column: 14, scope: !64)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !18, line: 135, type: !67)
!73 = !DILocation(line: 135, column: 27, scope: !64)
!74 = !DILocation(line: 138, column: 22, scope: !64)
!75 = !DILocation(line: 138, column: 12, scope: !64)
!76 = !DILocation(line: 138, column: 5, scope: !64)
!77 = !DILocation(line: 140, column: 5, scope: !64)
!78 = !DILocation(line: 141, column: 5, scope: !64)
!79 = !DILocation(line: 142, column: 5, scope: !64)
!80 = !DILocation(line: 145, column: 5, scope: !64)
!81 = !DILocation(line: 146, column: 5, scope: !64)
!82 = !DILocation(line: 147, column: 5, scope: !64)
!83 = !DILocation(line: 149, column: 5, scope: !64)
!84 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!85 = !DILocalVariable(name: "data", scope: !84, file: !18, line: 63, type: !3)
!86 = !DILocation(line: 63, column: 15, scope: !84)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !84, file: !18, line: 64, type: !3)
!88 = !DILocation(line: 64, column: 15, scope: !84)
!89 = !DILocation(line: 64, column: 42, scope: !84)
!90 = !DILocation(line: 64, column: 31, scope: !84)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !84, file: !18, line: 65, type: !3)
!92 = !DILocation(line: 65, column: 15, scope: !84)
!93 = !DILocation(line: 65, column: 43, scope: !84)
!94 = !DILocation(line: 65, column: 32, scope: !84)
!95 = !DILocation(line: 66, column: 13, scope: !84)
!96 = !DILocation(line: 66, column: 5, scope: !84)
!97 = !DILocation(line: 67, column: 5, scope: !84)
!98 = !DILocation(line: 67, column: 25, scope: !84)
!99 = !DILocation(line: 68, column: 13, scope: !84)
!100 = !DILocation(line: 68, column: 5, scope: !84)
!101 = !DILocation(line: 69, column: 5, scope: !84)
!102 = !DILocation(line: 69, column: 27, scope: !84)
!103 = !DILocation(line: 78, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !105, file: !18, line: 76, column: 5)
!105 = distinct !DILexicalBlock(scope: !84, file: !18, line: 70, column: 8)
!106 = !DILocation(line: 78, column: 14, scope: !104)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !18, line: 81, type: !46)
!108 = distinct !DILexicalBlock(scope: !84, file: !18, line: 80, column: 5)
!109 = !DILocation(line: 81, column: 17, scope: !108)
!110 = !DILocation(line: 82, column: 17, scope: !108)
!111 = !DILocation(line: 82, column: 9, scope: !108)
!112 = !DILocation(line: 83, column: 9, scope: !108)
!113 = !DILocation(line: 83, column: 21, scope: !108)
!114 = !DILocation(line: 86, column: 9, scope: !108)
!115 = !DILocation(line: 87, column: 9, scope: !108)
!116 = !DILocation(line: 87, column: 21, scope: !108)
!117 = !DILocation(line: 88, column: 20, scope: !108)
!118 = !DILocation(line: 88, column: 9, scope: !108)
!119 = !DILocation(line: 90, column: 1, scope: !84)
!120 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 93, type: !19, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!121 = !DILocalVariable(name: "data", scope: !120, file: !18, line: 95, type: !3)
!122 = !DILocation(line: 95, column: 15, scope: !120)
!123 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !18, line: 96, type: !3)
!124 = !DILocation(line: 96, column: 15, scope: !120)
!125 = !DILocation(line: 96, column: 42, scope: !120)
!126 = !DILocation(line: 96, column: 31, scope: !120)
!127 = !DILocalVariable(name: "dataGoodBuffer", scope: !120, file: !18, line: 97, type: !3)
!128 = !DILocation(line: 97, column: 15, scope: !120)
!129 = !DILocation(line: 97, column: 43, scope: !120)
!130 = !DILocation(line: 97, column: 32, scope: !120)
!131 = !DILocation(line: 98, column: 13, scope: !120)
!132 = !DILocation(line: 98, column: 5, scope: !120)
!133 = !DILocation(line: 99, column: 5, scope: !120)
!134 = !DILocation(line: 99, column: 25, scope: !120)
!135 = !DILocation(line: 100, column: 13, scope: !120)
!136 = !DILocation(line: 100, column: 5, scope: !120)
!137 = !DILocation(line: 101, column: 5, scope: !120)
!138 = !DILocation(line: 101, column: 27, scope: !120)
!139 = !DILocation(line: 105, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !18, line: 103, column: 5)
!141 = distinct !DILexicalBlock(scope: !120, file: !18, line: 102, column: 8)
!142 = !DILocation(line: 105, column: 14, scope: !140)
!143 = !DILocalVariable(name: "dest", scope: !144, file: !18, line: 108, type: !46)
!144 = distinct !DILexicalBlock(scope: !120, file: !18, line: 107, column: 5)
!145 = !DILocation(line: 108, column: 17, scope: !144)
!146 = !DILocation(line: 109, column: 17, scope: !144)
!147 = !DILocation(line: 109, column: 9, scope: !144)
!148 = !DILocation(line: 110, column: 9, scope: !144)
!149 = !DILocation(line: 110, column: 21, scope: !144)
!150 = !DILocation(line: 113, column: 9, scope: !144)
!151 = !DILocation(line: 114, column: 9, scope: !144)
!152 = !DILocation(line: 114, column: 21, scope: !144)
!153 = !DILocation(line: 115, column: 20, scope: !144)
!154 = !DILocation(line: 115, column: 9, scope: !144)
!155 = !DILocation(line: 117, column: 1, scope: !120)
