; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %3 = load i32*, i32** %data, align 8, !dbg !30
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !31
  %4 = load i32*, i32** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !32
  store i32 0, i32* %arrayidx, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !34, metadata !DIExpression()), !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  store i32* %5, i32** %dataCopy, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !38, metadata !DIExpression()), !dbg !39
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !40
  store i32* %6, i32** %data1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !47
  %8 = bitcast i32* %arraydecay to i8*, !dbg !47
  %9 = load i32*, i32** %data1, align 8, !dbg !47
  %10 = bitcast i32* %9 to i8*, !dbg !47
  %11 = load i32*, i32** %data1, align 8, !dbg !47
  %call2 = call i64 @wcslen(i32* noundef %11), !dbg !47
  %mul = mul i64 %call2, 4, !dbg !47
  %call3 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %10, i64 noundef %mul, i64 noundef 200) #5, !dbg !47
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !48
  store i32 0, i32* %arrayidx4, align 4, !dbg !49
  %12 = load i32*, i32** %data1, align 8, !dbg !50
  call void @printWLine(i32* noundef %12), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataCopy = alloca i32*, align 8
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 400, align 16, !dbg !81
  %1 = bitcast i8* %0 to i32*, !dbg !82
  store i32* %1, i32** %dataBuffer, align 8, !dbg !80
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !83
  store i32* %2, i32** %data, align 8, !dbg !84
  %3 = load i32*, i32** %data, align 8, !dbg !85
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !86
  %4 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !89, metadata !DIExpression()), !dbg !91
  %5 = load i32*, i32** %data, align 8, !dbg !92
  store i32* %5, i32** %dataCopy, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !93, metadata !DIExpression()), !dbg !94
  %6 = load i32*, i32** %dataCopy, align 8, !dbg !95
  store i32* %6, i32** %data1, align 8, !dbg !94
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %7 = bitcast [50 x i32]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 200, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !99
  %8 = bitcast i32* %arraydecay to i8*, !dbg !99
  %9 = load i32*, i32** %data1, align 8, !dbg !99
  %10 = bitcast i32* %9 to i8*, !dbg !99
  %11 = load i32*, i32** %data1, align 8, !dbg !99
  %call2 = call i64 @wcslen(i32* noundef %11), !dbg !99
  %mul = mul i64 %call2, 4, !dbg !99
  %call3 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %10, i64 noundef %mul, i64 noundef 200) #5, !dbg !99
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !100
  store i32 0, i32* %arrayidx4, align 4, !dbg !101
  %12 = load i32*, i32** %data1, align 8, !dbg !102
  call void @printWLine(i32* noundef %12), !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 29, column: 13, scope: !17)
!31 = !DILocation(line: 29, column: 5, scope: !17)
!32 = !DILocation(line: 30, column: 5, scope: !17)
!33 = !DILocation(line: 30, column: 17, scope: !17)
!34 = !DILocalVariable(name: "dataCopy", scope: !35, file: !18, line: 32, type: !3)
!35 = distinct !DILexicalBlock(scope: !17, file: !18, line: 31, column: 5)
!36 = !DILocation(line: 32, column: 19, scope: !35)
!37 = !DILocation(line: 32, column: 30, scope: !35)
!38 = !DILocalVariable(name: "data", scope: !35, file: !18, line: 33, type: !3)
!39 = !DILocation(line: 33, column: 19, scope: !35)
!40 = !DILocation(line: 33, column: 26, scope: !35)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !18, line: 35, type: !43)
!42 = distinct !DILexicalBlock(scope: !35, file: !18, line: 34, column: 9)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 35, column: 21, scope: !42)
!47 = !DILocation(line: 37, column: 13, scope: !42)
!48 = !DILocation(line: 38, column: 13, scope: !42)
!49 = !DILocation(line: 38, column: 24, scope: !42)
!50 = !DILocation(line: 39, column: 24, scope: !42)
!51 = !DILocation(line: 39, column: 13, scope: !42)
!52 = !DILocation(line: 42, column: 1, scope: !17)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_31_good", scope: !18, file: !18, line: 70, type: !19, scopeLine: 71, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!54 = !DILocation(line: 72, column: 5, scope: !53)
!55 = !DILocation(line: 73, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 84, type: !57, scopeLine: 85, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!57 = !DISubroutineType(types: !58)
!58 = !{!8, !8, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !18, line: 84, type: !8)
!63 = !DILocation(line: 84, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !18, line: 84, type: !59)
!65 = !DILocation(line: 84, column: 27, scope: !56)
!66 = !DILocation(line: 87, column: 22, scope: !56)
!67 = !DILocation(line: 87, column: 12, scope: !56)
!68 = !DILocation(line: 87, column: 5, scope: !56)
!69 = !DILocation(line: 89, column: 5, scope: !56)
!70 = !DILocation(line: 90, column: 5, scope: !56)
!71 = !DILocation(line: 91, column: 5, scope: !56)
!72 = !DILocation(line: 94, column: 5, scope: !56)
!73 = !DILocation(line: 95, column: 5, scope: !56)
!74 = !DILocation(line: 96, column: 5, scope: !56)
!75 = !DILocation(line: 98, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 49, type: !19, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!77 = !DILocalVariable(name: "data", scope: !76, file: !18, line: 51, type: !3)
!78 = !DILocation(line: 51, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBuffer", scope: !76, file: !18, line: 52, type: !3)
!80 = !DILocation(line: 52, column: 15, scope: !76)
!81 = !DILocation(line: 52, column: 39, scope: !76)
!82 = !DILocation(line: 52, column: 28, scope: !76)
!83 = !DILocation(line: 53, column: 12, scope: !76)
!84 = !DILocation(line: 53, column: 10, scope: !76)
!85 = !DILocation(line: 55, column: 13, scope: !76)
!86 = !DILocation(line: 55, column: 5, scope: !76)
!87 = !DILocation(line: 56, column: 5, scope: !76)
!88 = !DILocation(line: 56, column: 16, scope: !76)
!89 = !DILocalVariable(name: "dataCopy", scope: !90, file: !18, line: 58, type: !3)
!90 = distinct !DILexicalBlock(scope: !76, file: !18, line: 57, column: 5)
!91 = !DILocation(line: 58, column: 19, scope: !90)
!92 = !DILocation(line: 58, column: 30, scope: !90)
!93 = !DILocalVariable(name: "data", scope: !90, file: !18, line: 59, type: !3)
!94 = !DILocation(line: 59, column: 19, scope: !90)
!95 = !DILocation(line: 59, column: 26, scope: !90)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !18, line: 61, type: !43)
!97 = distinct !DILexicalBlock(scope: !90, file: !18, line: 60, column: 9)
!98 = !DILocation(line: 61, column: 21, scope: !97)
!99 = !DILocation(line: 63, column: 13, scope: !97)
!100 = !DILocation(line: 64, column: 13, scope: !97)
!101 = !DILocation(line: 64, column: 24, scope: !97)
!102 = !DILocation(line: 65, column: 24, scope: !97)
!103 = !DILocation(line: 65, column: 13, scope: !97)
!104 = !DILocation(line: 68, column: 1, scope: !76)
