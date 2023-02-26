; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06_bad.source to i8*), i64 44, i1 false), !dbg !42
  %2 = load i32*, i32** %data, align 8, !dbg !43
  %3 = bitcast i32* %2 to i8*, !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !43
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !43
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !43
  %add = add i64 %call, 1, !dbg !43
  %mul = mul i64 %add, 4, !dbg !43
  %5 = load i32*, i32** %data, align 8, !dbg !43
  %6 = bitcast i32* %5 to i8*, !dbg !43
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !43
  %call3 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !43
  %8 = load i32*, i32** %data, align 8, !dbg !44
  call void @printWLine(i32* noundef %8), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !78
  store i32* %arraydecay, i32** %data, align 8, !dbg !81
  %0 = load i32*, i32** %data, align 8, !dbg !82
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !82
  store i32 0, i32* %arrayidx, align 4, !dbg !83
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !86
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !86
  %2 = load i32*, i32** %data, align 8, !dbg !87
  %3 = bitcast i32* %2 to i8*, !dbg !87
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !87
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !87
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !87
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !87
  %add = add i64 %call, 1, !dbg !87
  %mul = mul i64 %add, 4, !dbg !87
  %5 = load i32*, i32** %data, align 8, !dbg !87
  %6 = bitcast i32* %5 to i8*, !dbg !87
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !87
  %call3 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !87
  %8 = load i32*, i32** %data, align 8, !dbg !88
  call void @printWLine(i32* noundef %8), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !106
  %2 = load i32*, i32** %data, align 8, !dbg !107
  %3 = bitcast i32* %2 to i8*, !dbg !107
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !107
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !107
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !107
  %add = add i64 %call, 1, !dbg !107
  %mul = mul i64 %add, 4, !dbg !107
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %6 = bitcast i32* %5 to i8*, !dbg !107
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !107
  %call3 = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !107
  %8 = load i32*, i32** %data, align 8, !dbg !108
  call void @printWLine(i32* noundef %8), !dbg !109
  ret void, !dbg !110
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06_bad", scope: !12, file: !12, line: 32, type: !13, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 34, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 34, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 35, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 35, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 36, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 36, column: 13, scope: !11)
!34 = !DILocation(line: 41, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !12, line: 38, column: 5)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 8)
!37 = !DILocation(line: 41, column: 14, scope: !35)
!38 = !DILocation(line: 42, column: 9, scope: !35)
!39 = !DILocation(line: 42, column: 17, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 45, type: !30)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 44, column: 5)
!42 = !DILocation(line: 45, column: 17, scope: !41)
!43 = !DILocation(line: 48, column: 9, scope: !41)
!44 = !DILocation(line: 49, column: 20, scope: !41)
!45 = !DILocation(line: 49, column: 9, scope: !41)
!46 = !DILocation(line: 51, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_06_good", scope: !12, file: !12, line: 106, type: !13, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!48 = !DILocation(line: 108, column: 5, scope: !47)
!49 = !DILocation(line: 109, column: 5, scope: !47)
!50 = !DILocation(line: 110, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 122, type: !52, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DISubroutineType(types: !53)
!53 = !{!22, !22, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 122, type: !22)
!58 = !DILocation(line: 122, column: 14, scope: !51)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 122, type: !54)
!60 = !DILocation(line: 122, column: 27, scope: !51)
!61 = !DILocation(line: 125, column: 22, scope: !51)
!62 = !DILocation(line: 125, column: 12, scope: !51)
!63 = !DILocation(line: 125, column: 5, scope: !51)
!64 = !DILocation(line: 127, column: 5, scope: !51)
!65 = !DILocation(line: 128, column: 5, scope: !51)
!66 = !DILocation(line: 129, column: 5, scope: !51)
!67 = !DILocation(line: 132, column: 5, scope: !51)
!68 = !DILocation(line: 133, column: 5, scope: !51)
!69 = !DILocation(line: 134, column: 5, scope: !51)
!70 = !DILocation(line: 136, column: 5, scope: !51)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 60, type: !17)
!73 = !DILocation(line: 60, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !12, line: 61, type: !25)
!75 = !DILocation(line: 61, column: 13, scope: !71)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !12, line: 62, type: !30)
!77 = !DILocation(line: 62, column: 13, scope: !71)
!78 = !DILocation(line: 72, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !12, line: 69, column: 5)
!80 = distinct !DILexicalBlock(scope: !71, file: !12, line: 63, column: 8)
!81 = !DILocation(line: 72, column: 14, scope: !79)
!82 = !DILocation(line: 73, column: 9, scope: !79)
!83 = !DILocation(line: 73, column: 17, scope: !79)
!84 = !DILocalVariable(name: "source", scope: !85, file: !12, line: 76, type: !30)
!85 = distinct !DILexicalBlock(scope: !71, file: !12, line: 75, column: 5)
!86 = !DILocation(line: 76, column: 17, scope: !85)
!87 = !DILocation(line: 79, column: 9, scope: !85)
!88 = !DILocation(line: 80, column: 20, scope: !85)
!89 = !DILocation(line: 80, column: 9, scope: !85)
!90 = !DILocation(line: 82, column: 1, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 85, type: !13, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 87, type: !17)
!93 = !DILocation(line: 87, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 88, type: !25)
!95 = !DILocation(line: 88, column: 13, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 89, type: !30)
!97 = !DILocation(line: 89, column: 13, scope: !91)
!98 = !DILocation(line: 94, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !12, line: 91, column: 5)
!100 = distinct !DILexicalBlock(scope: !91, file: !12, line: 90, column: 8)
!101 = !DILocation(line: 94, column: 14, scope: !99)
!102 = !DILocation(line: 95, column: 9, scope: !99)
!103 = !DILocation(line: 95, column: 17, scope: !99)
!104 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 98, type: !30)
!105 = distinct !DILexicalBlock(scope: !91, file: !12, line: 97, column: 5)
!106 = !DILocation(line: 98, column: 17, scope: !105)
!107 = !DILocation(line: 101, column: 9, scope: !105)
!108 = !DILocation(line: 102, column: 20, scope: !105)
!109 = !DILocation(line: 102, column: 9, scope: !105)
!110 = !DILocation(line: 104, column: 1, scope: !91)
