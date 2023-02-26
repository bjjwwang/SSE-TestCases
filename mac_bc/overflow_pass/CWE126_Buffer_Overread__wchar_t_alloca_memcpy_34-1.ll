; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 200, align 16, !dbg !33
  %1 = bitcast i8* %0 to i32*, !dbg !34
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = alloca i8, i64 400, align 16, !dbg !37
  %3 = bitcast i8* %2 to i32*, !dbg !38
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !36
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !40
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !43
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !44
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !45
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !45
  store i32 0, i32* %arrayidx2, align 4, !dbg !46
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  store i32* %8, i32** %data, align 8, !dbg !48
  %9 = load i32*, i32** %data, align 8, !dbg !49
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !50
  store i32* %9, i32** %unionFirst, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !52, metadata !DIExpression()), !dbg !54
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !55
  %10 = load i32*, i32** %unionSecond, align 8, !dbg !55
  store i32* %10, i32** %data3, align 8, !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !56, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !63
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx5, align 4, !dbg !65
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %11 = bitcast i32* %arraydecay6 to i8*, !dbg !66
  %12 = load i32*, i32** %data3, align 8, !dbg !66
  %13 = bitcast i32* %12 to i8*, !dbg !66
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !66
  %mul = mul i64 %call8, 4, !dbg !66
  %call9 = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %13, i64 noundef %mul, i64 noundef 400) #4, !dbg !66
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !67
  store i32 0, i32* %arrayidx10, align 4, !dbg !68
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !69
  call void @printWLine(i32* noundef %arraydecay11), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_good() #0 !dbg !72 {
entry:
  call void @goodG2B(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !75 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* noundef null), !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 noundef %conv), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %data3 = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 200, align 16, !dbg !102
  %1 = bitcast i8* %0 to i32*, !dbg !103
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %2 = alloca i8, i64 400, align 16, !dbg !106
  %3 = bitcast i8* %2 to i32*, !dbg !107
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !105
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !108
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !109
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !110
  store i32 0, i32* %arrayidx, align 4, !dbg !111
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !113
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !114
  store i32 0, i32* %arrayidx2, align 4, !dbg !115
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !116
  store i32* %8, i32** %data, align 8, !dbg !117
  %9 = load i32*, i32** %data, align 8, !dbg !118
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !119
  store i32* %9, i32** %unionFirst, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata i32** %data3, metadata !121, metadata !DIExpression()), !dbg !123
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType* %myUnion to i32**, !dbg !124
  %10 = load i32*, i32** %unionSecond, align 8, !dbg !124
  store i32* %10, i32** %data3, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !125, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !128
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !129
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx5, align 4, !dbg !131
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %11 = bitcast i32* %arraydecay6 to i8*, !dbg !132
  %12 = load i32*, i32** %data3, align 8, !dbg !132
  %13 = bitcast i32* %12 to i8*, !dbg !132
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !132
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !132
  %mul = mul i64 %call8, 4, !dbg !132
  %call9 = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %13, i64 noundef %mul, i64 noundef 400) #4, !dbg !132
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !133
  store i32 0, i32* %arrayidx10, align 4, !dbg !134
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !135
  call void @printWLine(i32* noundef %arraydecay11), !dbg !136
  ret void, !dbg !137
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_bad", scope: !18, file: !18, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 31, type: !3)
!23 = !DILocation(line: 31, column: 15, scope: !17)
!24 = !DILocalVariable(name: "myUnion", scope: !17, file: !18, line: 32, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_unionType", file: !18, line: 25, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !18, line: 21, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !18, line: 23, baseType: !3, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !18, line: 24, baseType: !3, size: 64)
!30 = !DILocation(line: 32, column: 64, scope: !17)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 33, type: !3)
!32 = !DILocation(line: 33, column: 15, scope: !17)
!33 = !DILocation(line: 33, column: 42, scope: !17)
!34 = !DILocation(line: 33, column: 31, scope: !17)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 34, type: !3)
!36 = !DILocation(line: 34, column: 15, scope: !17)
!37 = !DILocation(line: 34, column: 43, scope: !17)
!38 = !DILocation(line: 34, column: 32, scope: !17)
!39 = !DILocation(line: 35, column: 13, scope: !17)
!40 = !DILocation(line: 35, column: 5, scope: !17)
!41 = !DILocation(line: 36, column: 5, scope: !17)
!42 = !DILocation(line: 36, column: 25, scope: !17)
!43 = !DILocation(line: 37, column: 13, scope: !17)
!44 = !DILocation(line: 37, column: 5, scope: !17)
!45 = !DILocation(line: 38, column: 5, scope: !17)
!46 = !DILocation(line: 38, column: 27, scope: !17)
!47 = !DILocation(line: 40, column: 12, scope: !17)
!48 = !DILocation(line: 40, column: 10, scope: !17)
!49 = !DILocation(line: 41, column: 26, scope: !17)
!50 = !DILocation(line: 41, column: 13, scope: !17)
!51 = !DILocation(line: 41, column: 24, scope: !17)
!52 = !DILocalVariable(name: "data", scope: !53, file: !18, line: 43, type: !3)
!53 = distinct !DILexicalBlock(scope: !17, file: !18, line: 42, column: 5)
!54 = !DILocation(line: 43, column: 19, scope: !53)
!55 = !DILocation(line: 43, column: 34, scope: !53)
!56 = !DILocalVariable(name: "dest", scope: !57, file: !18, line: 45, type: !58)
!57 = distinct !DILexicalBlock(scope: !53, file: !18, line: 44, column: 9)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 100)
!61 = !DILocation(line: 45, column: 21, scope: !57)
!62 = !DILocation(line: 46, column: 21, scope: !57)
!63 = !DILocation(line: 46, column: 13, scope: !57)
!64 = !DILocation(line: 47, column: 13, scope: !57)
!65 = !DILocation(line: 47, column: 25, scope: !57)
!66 = !DILocation(line: 50, column: 13, scope: !57)
!67 = !DILocation(line: 51, column: 13, scope: !57)
!68 = !DILocation(line: 51, column: 25, scope: !57)
!69 = !DILocation(line: 52, column: 24, scope: !57)
!70 = !DILocation(line: 52, column: 13, scope: !57)
!71 = !DILocation(line: 55, column: 1, scope: !17)
!72 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_34_good", scope: !18, file: !18, line: 90, type: !19, scopeLine: 91, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!73 = !DILocation(line: 92, column: 5, scope: !72)
!74 = !DILocation(line: 93, column: 1, scope: !72)
!75 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 104, type: !76, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!76 = !DISubroutineType(types: !77)
!77 = !{!8, !8, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !18, line: 104, type: !8)
!82 = !DILocation(line: 104, column: 14, scope: !75)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !18, line: 104, type: !78)
!84 = !DILocation(line: 104, column: 27, scope: !75)
!85 = !DILocation(line: 107, column: 22, scope: !75)
!86 = !DILocation(line: 107, column: 12, scope: !75)
!87 = !DILocation(line: 107, column: 5, scope: !75)
!88 = !DILocation(line: 109, column: 5, scope: !75)
!89 = !DILocation(line: 110, column: 5, scope: !75)
!90 = !DILocation(line: 111, column: 5, scope: !75)
!91 = !DILocation(line: 114, column: 5, scope: !75)
!92 = !DILocation(line: 115, column: 5, scope: !75)
!93 = !DILocation(line: 116, column: 5, scope: !75)
!94 = !DILocation(line: 118, column: 5, scope: !75)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 62, type: !19, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!96 = !DILocalVariable(name: "data", scope: !95, file: !18, line: 64, type: !3)
!97 = !DILocation(line: 64, column: 15, scope: !95)
!98 = !DILocalVariable(name: "myUnion", scope: !95, file: !18, line: 65, type: !25)
!99 = !DILocation(line: 65, column: 64, scope: !95)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !18, line: 66, type: !3)
!101 = !DILocation(line: 66, column: 15, scope: !95)
!102 = !DILocation(line: 66, column: 42, scope: !95)
!103 = !DILocation(line: 66, column: 31, scope: !95)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !18, line: 67, type: !3)
!105 = !DILocation(line: 67, column: 15, scope: !95)
!106 = !DILocation(line: 67, column: 43, scope: !95)
!107 = !DILocation(line: 67, column: 32, scope: !95)
!108 = !DILocation(line: 68, column: 13, scope: !95)
!109 = !DILocation(line: 68, column: 5, scope: !95)
!110 = !DILocation(line: 69, column: 5, scope: !95)
!111 = !DILocation(line: 69, column: 25, scope: !95)
!112 = !DILocation(line: 70, column: 13, scope: !95)
!113 = !DILocation(line: 70, column: 5, scope: !95)
!114 = !DILocation(line: 71, column: 5, scope: !95)
!115 = !DILocation(line: 71, column: 27, scope: !95)
!116 = !DILocation(line: 73, column: 12, scope: !95)
!117 = !DILocation(line: 73, column: 10, scope: !95)
!118 = !DILocation(line: 74, column: 26, scope: !95)
!119 = !DILocation(line: 74, column: 13, scope: !95)
!120 = !DILocation(line: 74, column: 24, scope: !95)
!121 = !DILocalVariable(name: "data", scope: !122, file: !18, line: 76, type: !3)
!122 = distinct !DILexicalBlock(scope: !95, file: !18, line: 75, column: 5)
!123 = !DILocation(line: 76, column: 19, scope: !122)
!124 = !DILocation(line: 76, column: 34, scope: !122)
!125 = !DILocalVariable(name: "dest", scope: !126, file: !18, line: 78, type: !58)
!126 = distinct !DILexicalBlock(scope: !122, file: !18, line: 77, column: 9)
!127 = !DILocation(line: 78, column: 21, scope: !126)
!128 = !DILocation(line: 79, column: 21, scope: !126)
!129 = !DILocation(line: 79, column: 13, scope: !126)
!130 = !DILocation(line: 80, column: 13, scope: !126)
!131 = !DILocation(line: 80, column: 25, scope: !126)
!132 = !DILocation(line: 83, column: 13, scope: !126)
!133 = !DILocation(line: 84, column: 13, scope: !126)
!134 = !DILocation(line: 84, column: 25, scope: !126)
!135 = !DILocation(line: 85, column: 24, scope: !126)
!136 = !DILocation(line: 85, column: 13, scope: !126)
!137 = !DILocation(line: 88, column: 1, scope: !95)
