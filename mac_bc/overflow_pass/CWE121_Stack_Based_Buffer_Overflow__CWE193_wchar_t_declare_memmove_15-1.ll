; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15_bad.source to i8*), i64 44, i1 false), !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  %3 = bitcast i32* %2 to i8*, !dbg !41
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !41
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !41
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !41
  %add = add i64 %call, 1, !dbg !41
  %mul = mul i64 %add, 4, !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !41
  %6 = bitcast i32* %5 to i8*, !dbg !41
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !41
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !41
  %8 = load i32*, i32** %data, align 8, !dbg !42
  call void @printWLine(i32* noundef %8), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !76
  store i32* %arraydecay, i32** %data, align 8, !dbg !77
  %0 = load i32*, i32** %data, align 8, !dbg !78
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !78
  store i32 0, i32* %arrayidx, align 4, !dbg !79
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !80, metadata !DIExpression()), !dbg !82
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !82
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !82
  %2 = load i32*, i32** %data, align 8, !dbg !83
  %3 = bitcast i32* %2 to i8*, !dbg !83
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !83
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !83
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !83
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !83
  %add = add i64 %call, 1, !dbg !83
  %mul = mul i64 %add, 4, !dbg !83
  %5 = load i32*, i32** %data, align 8, !dbg !83
  %6 = bitcast i32* %5 to i8*, !dbg !83
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !83
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !83
  %8 = load i32*, i32** %data, align 8, !dbg !84
  call void @printWLine(i32* noundef %8), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !94
  store i32* %arraydecay, i32** %data, align 8, !dbg !95
  %0 = load i32*, i32** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !96
  store i32 0, i32* %arrayidx, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !100
  %2 = load i32*, i32** %data, align 8, !dbg !101
  %3 = bitcast i32* %2 to i8*, !dbg !101
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !101
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !101
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !101
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !101
  %add = add i64 %call, 1, !dbg !101
  %mul = mul i64 %add, 4, !dbg !101
  %5 = load i32*, i32** %data, align 8, !dbg !101
  %6 = bitcast i32* %5 to i8*, !dbg !101
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !101
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef %mul, i64 noundef %7) #5, !dbg !101
  %8 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* noundef %8), !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 30, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 31, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 32, column: 13, scope: !11)
!34 = !DILocation(line: 38, column: 16, scope: !11)
!35 = !DILocation(line: 38, column: 14, scope: !11)
!36 = !DILocation(line: 39, column: 9, scope: !11)
!37 = !DILocation(line: 39, column: 17, scope: !11)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 47, type: !30)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!40 = !DILocation(line: 47, column: 17, scope: !39)
!41 = !DILocation(line: 50, column: 9, scope: !39)
!42 = !DILocation(line: 51, column: 20, scope: !39)
!43 = !DILocation(line: 51, column: 9, scope: !39)
!44 = !DILocation(line: 53, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memmove_15_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!46 = !DILocation(line: 117, column: 5, scope: !45)
!47 = !DILocation(line: 118, column: 5, scope: !45)
!48 = !DILocation(line: 119, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !50, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DISubroutineType(types: !51)
!51 = !{!22, !22, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 131, type: !22)
!56 = !DILocation(line: 131, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 131, type: !52)
!58 = !DILocation(line: 131, column: 27, scope: !49)
!59 = !DILocation(line: 134, column: 22, scope: !49)
!60 = !DILocation(line: 134, column: 12, scope: !49)
!61 = !DILocation(line: 134, column: 5, scope: !49)
!62 = !DILocation(line: 136, column: 5, scope: !49)
!63 = !DILocation(line: 137, column: 5, scope: !49)
!64 = !DILocation(line: 138, column: 5, scope: !49)
!65 = !DILocation(line: 141, column: 5, scope: !49)
!66 = !DILocation(line: 142, column: 5, scope: !49)
!67 = !DILocation(line: 143, column: 5, scope: !49)
!68 = !DILocation(line: 145, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 62, type: !17)
!71 = !DILocation(line: 62, column: 15, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !12, line: 63, type: !25)
!73 = !DILocation(line: 63, column: 13, scope: !69)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !12, line: 64, type: !30)
!75 = !DILocation(line: 64, column: 13, scope: !69)
!76 = !DILocation(line: 74, column: 16, scope: !69)
!77 = !DILocation(line: 74, column: 14, scope: !69)
!78 = !DILocation(line: 75, column: 9, scope: !69)
!79 = !DILocation(line: 75, column: 17, scope: !69)
!80 = !DILocalVariable(name: "source", scope: !81, file: !12, line: 79, type: !30)
!81 = distinct !DILexicalBlock(scope: !69, file: !12, line: 78, column: 5)
!82 = !DILocation(line: 79, column: 17, scope: !81)
!83 = !DILocation(line: 82, column: 9, scope: !81)
!84 = !DILocation(line: 83, column: 20, scope: !81)
!85 = !DILocation(line: 83, column: 9, scope: !81)
!86 = !DILocation(line: 85, column: 1, scope: !69)
!87 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DILocalVariable(name: "data", scope: !87, file: !12, line: 90, type: !17)
!89 = !DILocation(line: 90, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !12, line: 91, type: !25)
!91 = !DILocation(line: 91, column: 13, scope: !87)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !12, line: 92, type: !30)
!93 = !DILocation(line: 92, column: 13, scope: !87)
!94 = !DILocation(line: 98, column: 16, scope: !87)
!95 = !DILocation(line: 98, column: 14, scope: !87)
!96 = !DILocation(line: 99, column: 9, scope: !87)
!97 = !DILocation(line: 99, column: 17, scope: !87)
!98 = !DILocalVariable(name: "source", scope: !99, file: !12, line: 107, type: !30)
!99 = distinct !DILexicalBlock(scope: !87, file: !12, line: 106, column: 5)
!100 = !DILocation(line: 107, column: 17, scope: !99)
!101 = !DILocation(line: 110, column: 9, scope: !99)
!102 = !DILocation(line: 111, column: 20, scope: !99)
!103 = !DILocation(line: 111, column: 9, scope: !99)
!104 = !DILocation(line: 113, column: 1, scope: !87)
