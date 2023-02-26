; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !35
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %data, align 8, !dbg !39
  %call2 = call i32* @wmemset(i32* noundef %5, i32 noundef 65, i64 noundef 49), !dbg !41
  %6 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 49, !dbg !42
  store i32 0, i32* %arrayidx3, align 4, !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !49
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !50
  %8 = bitcast i32* %arraydecay to i8*, !dbg !50
  %9 = load i32*, i32** %data, align 8, !dbg !50
  %10 = bitcast i32* %9 to i8*, !dbg !50
  %11 = load i32*, i32** %data, align 8, !dbg !50
  %call4 = call i64 @wcslen(i32* noundef %11), !dbg !50
  %mul = mul i64 %call4, 4, !dbg !50
  %call5 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %10, i64 noundef %mul, i64 noundef 200) #5, !dbg !50
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !51
  store i32 0, i32* %arrayidx6, align 4, !dbg !52
  %12 = load i32*, i32** %data, align 8, !dbg !53
  call void @printWLine(i32* noundef %12), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12_good() #0 !dbg !56 {
entry:
  call void @goodG2B(), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !59 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !65, metadata !DIExpression()), !dbg !66
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !67, metadata !DIExpression()), !dbg !68
  %call = call i64 @time(i64* noundef null), !dbg !69
  %conv = trunc i64 %call to i32, !dbg !70
  call void @srand(i32 noundef %conv), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12_good(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12_bad(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !77
  ret i32 0, !dbg !78
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %0 = alloca i8, i64 400, align 16, !dbg !84
  %1 = bitcast i8* %0 to i32*, !dbg !85
  store i32* %1, i32** %dataBuffer, align 8, !dbg !83
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !86
  store i32* %2, i32** %data, align 8, !dbg !87
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !88
  %tobool = icmp ne i32 %call, 0, !dbg !88
  br i1 %tobool, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !91
  %call1 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !93
  %4 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  br label %if.end, !dbg !96

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %data, align 8, !dbg !97
  %call2 = call i32* @wmemset(i32* noundef %5, i32 noundef 65, i64 noundef 49), !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx3 = getelementptr inbounds i32, i32* %6, i64 49, !dbg !100
  store i32 0, i32* %arrayidx3, align 4, !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !102, metadata !DIExpression()), !dbg !104
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !104
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !104
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !105
  %8 = bitcast i32* %arraydecay to i8*, !dbg !105
  %9 = load i32*, i32** %data, align 8, !dbg !105
  %10 = bitcast i32* %9 to i8*, !dbg !105
  %11 = load i32*, i32** %data, align 8, !dbg !105
  %call4 = call i64 @wcslen(i32* noundef %11), !dbg !105
  %mul = mul i64 %call4, 4, !dbg !105
  %call5 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %10, i64 noundef %mul, i64 noundef 200) #5, !dbg !105
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !106
  store i32 0, i32* %arrayidx6, align 4, !dbg !107
  %12 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* noundef %12), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 39, scope: !17)
!27 = !DILocation(line: 26, column: 28, scope: !17)
!28 = !DILocation(line: 27, column: 12, scope: !17)
!29 = !DILocation(line: 27, column: 10, scope: !17)
!30 = !DILocation(line: 28, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !17, file: !18, line: 28, column: 8)
!32 = !DILocation(line: 28, column: 8, scope: !17)
!33 = !DILocation(line: 31, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !18, line: 29, column: 5)
!35 = !DILocation(line: 31, column: 9, scope: !34)
!36 = !DILocation(line: 32, column: 9, scope: !34)
!37 = !DILocation(line: 32, column: 21, scope: !34)
!38 = !DILocation(line: 33, column: 5, scope: !34)
!39 = !DILocation(line: 37, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !31, file: !18, line: 35, column: 5)
!41 = !DILocation(line: 37, column: 9, scope: !40)
!42 = !DILocation(line: 38, column: 9, scope: !40)
!43 = !DILocation(line: 38, column: 20, scope: !40)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !18, line: 41, type: !46)
!45 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 41, column: 17, scope: !45)
!50 = !DILocation(line: 43, column: 9, scope: !45)
!51 = !DILocation(line: 44, column: 9, scope: !45)
!52 = !DILocation(line: 44, column: 20, scope: !45)
!53 = !DILocation(line: 45, column: 20, scope: !45)
!54 = !DILocation(line: 45, column: 9, scope: !45)
!55 = !DILocation(line: 47, column: 1, scope: !17)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_12_good", scope: !18, file: !18, line: 81, type: !19, scopeLine: 82, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!57 = !DILocation(line: 83, column: 5, scope: !56)
!58 = !DILocation(line: 84, column: 1, scope: !56)
!59 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 96, type: !60, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!60 = !DISubroutineType(types: !61)
!61 = !{!8, !8, !62}
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DILocalVariable(name: "argc", arg: 1, scope: !59, file: !18, line: 96, type: !8)
!66 = !DILocation(line: 96, column: 14, scope: !59)
!67 = !DILocalVariable(name: "argv", arg: 2, scope: !59, file: !18, line: 96, type: !62)
!68 = !DILocation(line: 96, column: 27, scope: !59)
!69 = !DILocation(line: 99, column: 22, scope: !59)
!70 = !DILocation(line: 99, column: 12, scope: !59)
!71 = !DILocation(line: 99, column: 5, scope: !59)
!72 = !DILocation(line: 101, column: 5, scope: !59)
!73 = !DILocation(line: 102, column: 5, scope: !59)
!74 = !DILocation(line: 103, column: 5, scope: !59)
!75 = !DILocation(line: 106, column: 5, scope: !59)
!76 = !DILocation(line: 107, column: 5, scope: !59)
!77 = !DILocation(line: 108, column: 5, scope: !59)
!78 = !DILocation(line: 110, column: 5, scope: !59)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!80 = !DILocalVariable(name: "data", scope: !79, file: !18, line: 57, type: !3)
!81 = !DILocation(line: 57, column: 15, scope: !79)
!82 = !DILocalVariable(name: "dataBuffer", scope: !79, file: !18, line: 58, type: !3)
!83 = !DILocation(line: 58, column: 15, scope: !79)
!84 = !DILocation(line: 58, column: 39, scope: !79)
!85 = !DILocation(line: 58, column: 28, scope: !79)
!86 = !DILocation(line: 59, column: 12, scope: !79)
!87 = !DILocation(line: 59, column: 10, scope: !79)
!88 = !DILocation(line: 60, column: 8, scope: !89)
!89 = distinct !DILexicalBlock(scope: !79, file: !18, line: 60, column: 8)
!90 = !DILocation(line: 60, column: 8, scope: !79)
!91 = !DILocation(line: 63, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !18, line: 61, column: 5)
!93 = !DILocation(line: 63, column: 9, scope: !92)
!94 = !DILocation(line: 64, column: 9, scope: !92)
!95 = !DILocation(line: 64, column: 20, scope: !92)
!96 = !DILocation(line: 65, column: 5, scope: !92)
!97 = !DILocation(line: 69, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !89, file: !18, line: 67, column: 5)
!99 = !DILocation(line: 69, column: 9, scope: !98)
!100 = !DILocation(line: 70, column: 9, scope: !98)
!101 = !DILocation(line: 70, column: 20, scope: !98)
!102 = !DILocalVariable(name: "dest", scope: !103, file: !18, line: 73, type: !46)
!103 = distinct !DILexicalBlock(scope: !79, file: !18, line: 72, column: 5)
!104 = !DILocation(line: 73, column: 17, scope: !103)
!105 = !DILocation(line: 75, column: 9, scope: !103)
!106 = !DILocation(line: 76, column: 9, scope: !103)
!107 = !DILocation(line: 76, column: 20, scope: !103)
!108 = !DILocation(line: 77, column: 20, scope: !103)
!109 = !DILocation(line: 77, column: 9, scope: !103)
!110 = !DILocation(line: 79, column: 1, scope: !79)
