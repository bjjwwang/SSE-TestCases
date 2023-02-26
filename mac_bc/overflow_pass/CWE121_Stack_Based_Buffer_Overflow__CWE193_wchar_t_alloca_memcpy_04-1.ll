; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 40, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 44, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !35
  %5 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !43
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad.source to i8*), i64 44, i1 false), !dbg !43
  %7 = load i32*, i32** %data, align 8, !dbg !44
  %8 = bitcast i32* %7 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %9 = bitcast i32* %arraydecay to i8*, !dbg !44
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !44
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !44
  %add = add i64 %call, 1, !dbg !44
  %mul = mul i64 %add, 4, !dbg !44
  %10 = load i32*, i32** %data, align 8, !dbg !44
  %11 = bitcast i32* %10 to i8*, !dbg !44
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !44
  %call2 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef %mul, i64 noundef %12) #5, !dbg !44
  %13 = load i32*, i32** %data, align 8, !dbg !45
  call void @printWLine(i32* noundef %13), !dbg !46
  ret void, !dbg !47
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_good() #0 !dbg !48 {
entry:
  call void @goodG2B1(), !dbg !49
  call void @goodG2B2(), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 40, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %2 = alloca i8, i64 44, align 16, !dbg !81
  %3 = bitcast i8* %2 to i32*, !dbg !82
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !80
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !83
  store i32* %4, i32** %data, align 8, !dbg !86
  %5 = load i32*, i32** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !87
  store i32 0, i32* %arrayidx, align 4, !dbg !88
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !91
  %7 = load i32*, i32** %data, align 8, !dbg !92
  %8 = bitcast i32* %7 to i8*, !dbg !92
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !92
  %9 = bitcast i32* %arraydecay to i8*, !dbg !92
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !92
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !92
  %add = add i64 %call, 1, !dbg !92
  %mul = mul i64 %add, 4, !dbg !92
  %10 = load i32*, i32** %data, align 8, !dbg !92
  %11 = bitcast i32* %10 to i8*, !dbg !92
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !92
  %call2 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef %mul, i64 noundef %12) #5, !dbg !92
  %13 = load i32*, i32** %data, align 8, !dbg !93
  call void @printWLine(i32* noundef %13), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 40, align 16, !dbg !101
  %1 = bitcast i8* %0 to i32*, !dbg !102
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !100
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %2 = alloca i8, i64 44, align 16, !dbg !105
  %3 = bitcast i8* %2 to i32*, !dbg !106
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !104
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !107
  store i32* %4, i32** %data, align 8, !dbg !110
  %5 = load i32*, i32** %data, align 8, !dbg !111
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !111
  store i32 0, i32* %arrayidx, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %6 = bitcast [11 x i32]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !115
  %7 = load i32*, i32** %data, align 8, !dbg !116
  %8 = bitcast i32* %7 to i8*, !dbg !116
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !116
  %9 = bitcast i32* %arraydecay to i8*, !dbg !116
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !116
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !116
  %add = add i64 %call, 1, !dbg !116
  %mul = mul i64 %add, 4, !dbg !116
  %10 = load i32*, i32** %data, align 8, !dbg !116
  %11 = bitcast i32* %10 to i8*, !dbg !116
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !116
  %call2 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef %mul, i64 noundef %12) #5, !dbg !116
  %13 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* noundef %13), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_bad", scope: !18, file: !18, line: 35, type: !19, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 37, type: !3)
!23 = !DILocation(line: 37, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 38, type: !3)
!25 = !DILocation(line: 38, column: 15, scope: !17)
!26 = !DILocation(line: 38, column: 42, scope: !17)
!27 = !DILocation(line: 38, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 39, type: !3)
!29 = !DILocation(line: 39, column: 15, scope: !17)
!30 = !DILocation(line: 39, column: 43, scope: !17)
!31 = !DILocation(line: 39, column: 32, scope: !17)
!32 = !DILocation(line: 44, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !18, line: 41, column: 5)
!34 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 8)
!35 = !DILocation(line: 44, column: 14, scope: !33)
!36 = !DILocation(line: 45, column: 9, scope: !33)
!37 = !DILocation(line: 45, column: 17, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !18, line: 48, type: !40)
!39 = distinct !DILexicalBlock(scope: !17, file: !18, line: 47, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DILocation(line: 48, column: 17, scope: !39)
!44 = !DILocation(line: 51, column: 9, scope: !39)
!45 = !DILocation(line: 52, column: 20, scope: !39)
!46 = !DILocation(line: 52, column: 9, scope: !39)
!47 = !DILocation(line: 54, column: 1, scope: !17)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_04_good", scope: !18, file: !18, line: 109, type: !19, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!49 = !DILocation(line: 111, column: 5, scope: !48)
!50 = !DILocation(line: 112, column: 5, scope: !48)
!51 = !DILocation(line: 113, column: 1, scope: !48)
!52 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 125, type: !53, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!53 = !DISubroutineType(types: !54)
!54 = !{!8, !8, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !18, line: 125, type: !8)
!59 = !DILocation(line: 125, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !18, line: 125, type: !55)
!61 = !DILocation(line: 125, column: 27, scope: !52)
!62 = !DILocation(line: 128, column: 22, scope: !52)
!63 = !DILocation(line: 128, column: 12, scope: !52)
!64 = !DILocation(line: 128, column: 5, scope: !52)
!65 = !DILocation(line: 130, column: 5, scope: !52)
!66 = !DILocation(line: 131, column: 5, scope: !52)
!67 = !DILocation(line: 132, column: 5, scope: !52)
!68 = !DILocation(line: 135, column: 5, scope: !52)
!69 = !DILocation(line: 136, column: 5, scope: !52)
!70 = !DILocation(line: 137, column: 5, scope: !52)
!71 = !DILocation(line: 139, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 61, type: !19, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!73 = !DILocalVariable(name: "data", scope: !72, file: !18, line: 63, type: !3)
!74 = !DILocation(line: 63, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !18, line: 64, type: !3)
!76 = !DILocation(line: 64, column: 15, scope: !72)
!77 = !DILocation(line: 64, column: 42, scope: !72)
!78 = !DILocation(line: 64, column: 31, scope: !72)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !18, line: 65, type: !3)
!80 = !DILocation(line: 65, column: 15, scope: !72)
!81 = !DILocation(line: 65, column: 43, scope: !72)
!82 = !DILocation(line: 65, column: 32, scope: !72)
!83 = !DILocation(line: 75, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !85, file: !18, line: 72, column: 5)
!85 = distinct !DILexicalBlock(scope: !72, file: !18, line: 66, column: 8)
!86 = !DILocation(line: 75, column: 14, scope: !84)
!87 = !DILocation(line: 76, column: 9, scope: !84)
!88 = !DILocation(line: 76, column: 17, scope: !84)
!89 = !DILocalVariable(name: "source", scope: !90, file: !18, line: 79, type: !40)
!90 = distinct !DILexicalBlock(scope: !72, file: !18, line: 78, column: 5)
!91 = !DILocation(line: 79, column: 17, scope: !90)
!92 = !DILocation(line: 82, column: 9, scope: !90)
!93 = !DILocation(line: 83, column: 20, scope: !90)
!94 = !DILocation(line: 83, column: 9, scope: !90)
!95 = !DILocation(line: 85, column: 1, scope: !72)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 88, type: !19, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!97 = !DILocalVariable(name: "data", scope: !96, file: !18, line: 90, type: !3)
!98 = !DILocation(line: 90, column: 15, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !18, line: 91, type: !3)
!100 = !DILocation(line: 91, column: 15, scope: !96)
!101 = !DILocation(line: 91, column: 42, scope: !96)
!102 = !DILocation(line: 91, column: 31, scope: !96)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !18, line: 92, type: !3)
!104 = !DILocation(line: 92, column: 15, scope: !96)
!105 = !DILocation(line: 92, column: 43, scope: !96)
!106 = !DILocation(line: 92, column: 32, scope: !96)
!107 = !DILocation(line: 97, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !109, file: !18, line: 94, column: 5)
!109 = distinct !DILexicalBlock(scope: !96, file: !18, line: 93, column: 8)
!110 = !DILocation(line: 97, column: 14, scope: !108)
!111 = !DILocation(line: 98, column: 9, scope: !108)
!112 = !DILocation(line: 98, column: 17, scope: !108)
!113 = !DILocalVariable(name: "source", scope: !114, file: !18, line: 101, type: !40)
!114 = distinct !DILexicalBlock(scope: !96, file: !18, line: 100, column: 5)
!115 = !DILocation(line: 101, column: 17, scope: !114)
!116 = !DILocation(line: 104, column: 9, scope: !114)
!117 = !DILocation(line: 105, column: 20, scope: !114)
!118 = !DILocation(line: 105, column: 9, scope: !114)
!119 = !DILocation(line: 107, column: 1, scope: !96)
