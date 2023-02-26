; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_badSink(i32* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !24, metadata !DIExpression()), !dbg !29
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !30
  %1 = bitcast i32* %arraydecay to i8*, !dbg !30
  %2 = load i32*, i32** %data.addr, align 8, !dbg !30
  %3 = bitcast i32* %2 to i8*, !dbg !30
  %4 = load i32*, i32** %data.addr, align 8, !dbg !30
  %call = call i64 @wcslen(i32* noundef %4), !dbg !30
  %mul = mul i64 %call, 4, !dbg !30
  %call1 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 200) #5, !dbg !30
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %5 = load i32*, i32** %data.addr, align 8, !dbg !33
  call void @printWLine(i32* noundef %5), !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_bad() #0 !dbg !36 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !39, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !41, metadata !DIExpression()), !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !46
  store i32* %arraydecay, i32** %data, align 8, !dbg !47
  %0 = load i32*, i32** %data, align 8, !dbg !48
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !49
  %1 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !50
  store i32 0, i32* %arrayidx, align 4, !dbg !51
  %2 = load i32*, i32** %data, align 8, !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_badSink(i32* noundef %2), !dbg !53
  ret void, !dbg !54
}

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_goodG2BSink(i32* noundef %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !58, metadata !DIExpression()), !dbg !60
  %0 = bitcast [50 x i32]* %dest to i8*, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 200, i1 false), !dbg !60
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !61
  %1 = bitcast i32* %arraydecay to i8*, !dbg !61
  %2 = load i32*, i32** %data.addr, align 8, !dbg !61
  %3 = bitcast i32* %2 to i8*, !dbg !61
  %4 = load i32*, i32** %data.addr, align 8, !dbg !61
  %call = call i64 @wcslen(i32* noundef %4), !dbg !61
  %mul = mul i64 %call, 4, !dbg !61
  %call1 = call i8* @__memmove_chk(i8* noundef %1, i8* noundef %3, i64 noundef %mul, i64 noundef 200) #5, !dbg !61
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !62
  store i32 0, i32* %arrayidx, align 4, !dbg !63
  %5 = load i32*, i32** %data.addr, align 8, !dbg !64
  call void @printWLine(i32* noundef %5), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_good() #0 !dbg !67 {
entry:
  call void @goodG2B(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* noundef null), !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 noundef %conv), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_good(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_bad(), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !95
  store i32* %arraydecay, i32** %data, align 8, !dbg !96
  %0 = load i32*, i32** %data, align 8, !dbg !97
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !98
  %1 = load i32*, i32** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !99
  store i32 0, i32* %arrayidx, align 4, !dbg !100
  %2 = load i32*, i32** %data, align 8, !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_goodG2BSink(i32* noundef %2), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !17, line: 34, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !19, line: 106, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !{}
!22 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!23 = !DILocation(line: 23, column: 94, scope: !11)
!24 = !DILocalVariable(name: "dest", scope: !25, file: !12, line: 26, type: !26)
!25 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 26, column: 17, scope: !25)
!30 = !DILocation(line: 28, column: 9, scope: !25)
!31 = !DILocation(line: 29, column: 9, scope: !25)
!32 = !DILocation(line: 29, column: 20, scope: !25)
!33 = !DILocation(line: 30, column: 20, scope: !25)
!34 = !DILocation(line: 30, column: 9, scope: !25)
!35 = !DILocation(line: 32, column: 1, scope: !11)
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_bad", scope: !12, file: !12, line: 34, type: !37, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 36, type: !15)
!40 = !DILocation(line: 36, column: 15, scope: !36)
!41 = !DILocalVariable(name: "dataBuffer", scope: !36, file: !12, line: 37, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 37, column: 13, scope: !36)
!46 = !DILocation(line: 38, column: 12, scope: !36)
!47 = !DILocation(line: 38, column: 10, scope: !36)
!48 = !DILocation(line: 40, column: 13, scope: !36)
!49 = !DILocation(line: 40, column: 5, scope: !36)
!50 = !DILocation(line: 41, column: 5, scope: !36)
!51 = !DILocation(line: 41, column: 17, scope: !36)
!52 = !DILocation(line: 42, column: 83, scope: !36)
!53 = !DILocation(line: 42, column: 5, scope: !36)
!54 = !DILocation(line: 43, column: 1, scope: !36)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_goodG2BSink", scope: !12, file: !12, line: 49, type: !13, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!56 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !12, line: 49, type: !15)
!57 = !DILocation(line: 49, column: 98, scope: !55)
!58 = !DILocalVariable(name: "dest", scope: !59, file: !12, line: 52, type: !26)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 51, column: 5)
!60 = !DILocation(line: 52, column: 17, scope: !59)
!61 = !DILocation(line: 54, column: 9, scope: !59)
!62 = !DILocation(line: 55, column: 9, scope: !59)
!63 = !DILocation(line: 55, column: 20, scope: !59)
!64 = !DILocation(line: 56, column: 20, scope: !59)
!65 = !DILocation(line: 56, column: 9, scope: !59)
!66 = !DILocation(line: 58, column: 1, scope: !55)
!67 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_memmove_41_good", scope: !12, file: !12, line: 72, type: !37, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DILocation(line: 74, column: 5, scope: !67)
!69 = !DILocation(line: 75, column: 1, scope: !67)
!70 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 87, type: !71, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!71 = !DISubroutineType(types: !72)
!72 = !{!20, !20, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !12, line: 87, type: !20)
!77 = !DILocation(line: 87, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !12, line: 87, type: !73)
!79 = !DILocation(line: 87, column: 27, scope: !70)
!80 = !DILocation(line: 90, column: 22, scope: !70)
!81 = !DILocation(line: 90, column: 12, scope: !70)
!82 = !DILocation(line: 90, column: 5, scope: !70)
!83 = !DILocation(line: 92, column: 5, scope: !70)
!84 = !DILocation(line: 93, column: 5, scope: !70)
!85 = !DILocation(line: 94, column: 5, scope: !70)
!86 = !DILocation(line: 97, column: 5, scope: !70)
!87 = !DILocation(line: 98, column: 5, scope: !70)
!88 = !DILocation(line: 99, column: 5, scope: !70)
!89 = !DILocation(line: 101, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !37, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!91 = !DILocalVariable(name: "data", scope: !90, file: !12, line: 63, type: !15)
!92 = !DILocation(line: 63, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !12, line: 64, type: !42)
!94 = !DILocation(line: 64, column: 13, scope: !90)
!95 = !DILocation(line: 65, column: 12, scope: !90)
!96 = !DILocation(line: 65, column: 10, scope: !90)
!97 = !DILocation(line: 67, column: 13, scope: !90)
!98 = !DILocation(line: 67, column: 5, scope: !90)
!99 = !DILocation(line: 68, column: 5, scope: !90)
!100 = !DILocation(line: 68, column: 16, scope: !90)
!101 = !DILocation(line: 69, column: 87, scope: !90)
!102 = !DILocation(line: 69, column: 5, scope: !90)
!103 = !DILocation(line: 70, column: 1, scope: !90)
