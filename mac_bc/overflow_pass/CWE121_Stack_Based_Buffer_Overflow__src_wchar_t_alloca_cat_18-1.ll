; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18_bad() #0 !dbg !17 {
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
  br label %source, !dbg !30

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !31), !dbg !32
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !34
  %4 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !43
  %6 = load i32*, i32** %data, align 8, !dbg !44
  %call1 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %6), !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !46
  call void @printWLine(i32* noundef %7), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32* @wcscat(i32* noundef, i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18_good() #0 !dbg !49 {
entry:
  call void @goodG2B(), !dbg !50
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
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 400, align 16, !dbg !77
  %1 = bitcast i8* %0 to i32*, !dbg !78
  store i32* %1, i32** %dataBuffer, align 8, !dbg !76
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !79
  store i32* %2, i32** %data, align 8, !dbg !80
  br label %source, !dbg !81

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !82), !dbg !83
  %3 = load i32*, i32** %data, align 8, !dbg !84
  %call = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !85
  %4 = load i32*, i32** %data, align 8, !dbg !86
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !86
  store i32 0, i32* %arrayidx, align 4, !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !88, metadata !DIExpression()), !dbg !90
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !90
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !91
  %6 = load i32*, i32** %data, align 8, !dbg !92
  %call1 = call i32* @wcscat(i32* noundef %arraydecay, i32* noundef %6), !dbg !93
  %7 = load i32*, i32** %data, align 8, !dbg !94
  call void @printWLine(i32* noundef %7), !dbg !95
  ret void, !dbg !96
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 28, column: 5, scope: !17)
!31 = !DILabel(scope: !17, name: "source", file: !18, line: 29)
!32 = !DILocation(line: 29, column: 1, scope: !17)
!33 = !DILocation(line: 31, column: 13, scope: !17)
!34 = !DILocation(line: 31, column: 5, scope: !17)
!35 = !DILocation(line: 32, column: 5, scope: !17)
!36 = !DILocation(line: 32, column: 17, scope: !17)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !18, line: 34, type: !39)
!38 = distinct !DILexicalBlock(scope: !17, file: !18, line: 33, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 34, column: 17, scope: !38)
!43 = !DILocation(line: 36, column: 16, scope: !38)
!44 = !DILocation(line: 36, column: 22, scope: !38)
!45 = !DILocation(line: 36, column: 9, scope: !38)
!46 = !DILocation(line: 37, column: 20, scope: !38)
!47 = !DILocation(line: 37, column: 9, scope: !38)
!48 = !DILocation(line: 39, column: 1, scope: !17)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_18_good", scope: !18, file: !18, line: 64, type: !19, scopeLine: 65, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!50 = !DILocation(line: 66, column: 5, scope: !49)
!51 = !DILocation(line: 67, column: 1, scope: !49)
!52 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 79, type: !53, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!53 = !DISubroutineType(types: !54)
!54 = !{!8, !8, !55}
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !52, file: !18, line: 79, type: !8)
!59 = !DILocation(line: 79, column: 14, scope: !52)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !52, file: !18, line: 79, type: !55)
!61 = !DILocation(line: 79, column: 27, scope: !52)
!62 = !DILocation(line: 82, column: 22, scope: !52)
!63 = !DILocation(line: 82, column: 12, scope: !52)
!64 = !DILocation(line: 82, column: 5, scope: !52)
!65 = !DILocation(line: 84, column: 5, scope: !52)
!66 = !DILocation(line: 85, column: 5, scope: !52)
!67 = !DILocation(line: 86, column: 5, scope: !52)
!68 = !DILocation(line: 89, column: 5, scope: !52)
!69 = !DILocation(line: 90, column: 5, scope: !52)
!70 = !DILocation(line: 91, column: 5, scope: !52)
!71 = !DILocation(line: 93, column: 5, scope: !52)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 46, type: !19, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!73 = !DILocalVariable(name: "data", scope: !72, file: !18, line: 48, type: !3)
!74 = !DILocation(line: 48, column: 15, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !18, line: 49, type: !3)
!76 = !DILocation(line: 49, column: 15, scope: !72)
!77 = !DILocation(line: 49, column: 39, scope: !72)
!78 = !DILocation(line: 49, column: 28, scope: !72)
!79 = !DILocation(line: 50, column: 12, scope: !72)
!80 = !DILocation(line: 50, column: 10, scope: !72)
!81 = !DILocation(line: 51, column: 5, scope: !72)
!82 = !DILabel(scope: !72, name: "source", file: !18, line: 52)
!83 = !DILocation(line: 52, column: 1, scope: !72)
!84 = !DILocation(line: 54, column: 13, scope: !72)
!85 = !DILocation(line: 54, column: 5, scope: !72)
!86 = !DILocation(line: 55, column: 5, scope: !72)
!87 = !DILocation(line: 55, column: 16, scope: !72)
!88 = !DILocalVariable(name: "dest", scope: !89, file: !18, line: 57, type: !39)
!89 = distinct !DILexicalBlock(scope: !72, file: !18, line: 56, column: 5)
!90 = !DILocation(line: 57, column: 17, scope: !89)
!91 = !DILocation(line: 59, column: 16, scope: !89)
!92 = !DILocation(line: 59, column: 22, scope: !89)
!93 = !DILocation(line: 59, column: 9, scope: !89)
!94 = !DILocation(line: 60, column: 20, scope: !89)
!95 = !DILocation(line: 60, column: 9, scope: !89)
!96 = !DILocation(line: 62, column: 1, scope: !72)
