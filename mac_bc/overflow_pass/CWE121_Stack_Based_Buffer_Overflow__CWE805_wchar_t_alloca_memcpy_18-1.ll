; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  br label %source, !dbg !32

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !33), !dbg !34
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %4, i32** %data, align 8, !dbg !36
  %5 = load i32*, i32** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !39, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !45
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !46
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx2, align 4, !dbg !48
  %6 = load i32*, i32** %data, align 8, !dbg !49
  %7 = bitcast i32* %6 to i8*, !dbg !49
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !49
  %8 = bitcast i32* %arraydecay3 to i8*, !dbg !49
  %9 = load i32*, i32** %data, align 8, !dbg !49
  %10 = bitcast i32* %9 to i8*, !dbg !49
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !49
  %call4 = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #4, !dbg !49
  %12 = load i32*, i32** %data, align 8, !dbg !50
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !50
  store i32 0, i32* %arrayidx5, align 4, !dbg !51
  %13 = load i32*, i32** %data, align 8, !dbg !52
  call void @printWLine(i32* noundef %13), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18_good() #0 !dbg !55 {
entry:
  call void @goodG2B(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* noundef null), !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 noundef %conv), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 200, align 16, !dbg !83
  %1 = bitcast i8* %0 to i32*, !dbg !84
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %2 = alloca i8, i64 400, align 16, !dbg !87
  %3 = bitcast i8* %2 to i32*, !dbg !88
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !86
  br label %source, !dbg !89

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !90), !dbg !91
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !92
  store i32* %4, i32** %data, align 8, !dbg !93
  %5 = load i32*, i32** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !94
  store i32 0, i32* %arrayidx, align 4, !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !99
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !100
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !101
  store i32 0, i32* %arrayidx2, align 4, !dbg !102
  %6 = load i32*, i32** %data, align 8, !dbg !103
  %7 = bitcast i32* %6 to i8*, !dbg !103
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !103
  %8 = bitcast i32* %arraydecay3 to i8*, !dbg !103
  %9 = load i32*, i32** %data, align 8, !dbg !103
  %10 = bitcast i32* %9 to i8*, !dbg !103
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !103
  %call4 = call i8* @__memcpy_chk(i8* noundef %7, i8* noundef %8, i64 noundef 400, i64 noundef %11) #4, !dbg !103
  %12 = load i32*, i32** %data, align 8, !dbg !104
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i64 99, !dbg !104
  store i32 0, i32* %arrayidx5, align 4, !dbg !105
  %13 = load i32*, i32** %data, align 8, !dbg !106
  call void @printWLine(i32* noundef %13), !dbg !107
  ret void, !dbg !108
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 42, scope: !17)
!27 = !DILocation(line: 26, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !3)
!29 = !DILocation(line: 27, column: 15, scope: !17)
!30 = !DILocation(line: 27, column: 43, scope: !17)
!31 = !DILocation(line: 27, column: 32, scope: !17)
!32 = !DILocation(line: 28, column: 5, scope: !17)
!33 = !DILabel(scope: !17, name: "source", file: !18, line: 29)
!34 = !DILocation(line: 29, column: 1, scope: !17)
!35 = !DILocation(line: 32, column: 12, scope: !17)
!36 = !DILocation(line: 32, column: 10, scope: !17)
!37 = !DILocation(line: 33, column: 5, scope: !17)
!38 = !DILocation(line: 33, column: 13, scope: !17)
!39 = !DILocalVariable(name: "source", scope: !40, file: !18, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !17, file: !18, line: 34, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 35, column: 17, scope: !40)
!45 = !DILocation(line: 36, column: 17, scope: !40)
!46 = !DILocation(line: 36, column: 9, scope: !40)
!47 = !DILocation(line: 37, column: 9, scope: !40)
!48 = !DILocation(line: 37, column: 23, scope: !40)
!49 = !DILocation(line: 39, column: 9, scope: !40)
!50 = !DILocation(line: 40, column: 9, scope: !40)
!51 = !DILocation(line: 40, column: 21, scope: !40)
!52 = !DILocation(line: 41, column: 20, scope: !40)
!53 = !DILocation(line: 41, column: 9, scope: !40)
!54 = !DILocation(line: 43, column: 1, scope: !17)
!55 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_18_good", scope: !18, file: !18, line: 71, type: !19, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!56 = !DILocation(line: 73, column: 5, scope: !55)
!57 = !DILocation(line: 74, column: 1, scope: !55)
!58 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 86, type: !59, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!59 = !DISubroutineType(types: !60)
!60 = !{!8, !8, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !18, line: 86, type: !8)
!65 = !DILocation(line: 86, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !18, line: 86, type: !61)
!67 = !DILocation(line: 86, column: 27, scope: !58)
!68 = !DILocation(line: 89, column: 22, scope: !58)
!69 = !DILocation(line: 89, column: 12, scope: !58)
!70 = !DILocation(line: 89, column: 5, scope: !58)
!71 = !DILocation(line: 91, column: 5, scope: !58)
!72 = !DILocation(line: 92, column: 5, scope: !58)
!73 = !DILocation(line: 93, column: 5, scope: !58)
!74 = !DILocation(line: 96, column: 5, scope: !58)
!75 = !DILocation(line: 97, column: 5, scope: !58)
!76 = !DILocation(line: 98, column: 5, scope: !58)
!77 = !DILocation(line: 100, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 50, type: !19, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!79 = !DILocalVariable(name: "data", scope: !78, file: !18, line: 52, type: !3)
!80 = !DILocation(line: 52, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !18, line: 53, type: !3)
!82 = !DILocation(line: 53, column: 15, scope: !78)
!83 = !DILocation(line: 53, column: 42, scope: !78)
!84 = !DILocation(line: 53, column: 31, scope: !78)
!85 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !18, line: 54, type: !3)
!86 = !DILocation(line: 54, column: 15, scope: !78)
!87 = !DILocation(line: 54, column: 43, scope: !78)
!88 = !DILocation(line: 54, column: 32, scope: !78)
!89 = !DILocation(line: 55, column: 5, scope: !78)
!90 = !DILabel(scope: !78, name: "source", file: !18, line: 56)
!91 = !DILocation(line: 56, column: 1, scope: !78)
!92 = !DILocation(line: 58, column: 12, scope: !78)
!93 = !DILocation(line: 58, column: 10, scope: !78)
!94 = !DILocation(line: 59, column: 5, scope: !78)
!95 = !DILocation(line: 59, column: 13, scope: !78)
!96 = !DILocalVariable(name: "source", scope: !97, file: !18, line: 61, type: !41)
!97 = distinct !DILexicalBlock(scope: !78, file: !18, line: 60, column: 5)
!98 = !DILocation(line: 61, column: 17, scope: !97)
!99 = !DILocation(line: 62, column: 17, scope: !97)
!100 = !DILocation(line: 62, column: 9, scope: !97)
!101 = !DILocation(line: 63, column: 9, scope: !97)
!102 = !DILocation(line: 63, column: 23, scope: !97)
!103 = !DILocation(line: 65, column: 9, scope: !97)
!104 = !DILocation(line: 66, column: 9, scope: !97)
!105 = !DILocation(line: 66, column: 21, scope: !97)
!106 = !DILocation(line: 67, column: 20, scope: !97)
!107 = !DILocation(line: 67, column: 9, scope: !97)
!108 = !DILocation(line: 69, column: 1, scope: !78)
