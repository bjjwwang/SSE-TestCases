; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !9
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05_bad() #0 !dbg !19 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 200, align 16, !dbg !27
  %1 = bitcast i8* %0 to i32*, !dbg !28
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 400, align 16, !dbg !31
  %3 = bitcast i8* %2 to i32*, !dbg !32
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !30
  %4 = load i32, i32* @staticTrue, align 4, !dbg !33
  %tobool = icmp ne i32 %4, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  store i32* %5, i32** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !45
  %7 = load i32*, i32** %data, align 8, !dbg !46
  %8 = bitcast i32* %7 to i8*, !dbg !46
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %9 = bitcast i32* %arraydecay to i8*, !dbg !46
  %10 = load i32*, i32** %data, align 8, !dbg !46
  %11 = bitcast i32* %10 to i8*, !dbg !46
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !46
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !46
  %13 = load i32*, i32** %data, align 8, !dbg !47
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !47
  %14 = load i32, i32* %arrayidx, align 4, !dbg !47
  call void @printIntLine(i32 noundef %14), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05_good() #0 !dbg !50 {
entry:
  call void @goodG2B1(), !dbg !51
  call void @goodG2B2(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !74 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 200, align 16, !dbg !79
  %1 = bitcast i8* %0 to i32*, !dbg !80
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %2 = alloca i8, i64 400, align 16, !dbg !83
  %3 = bitcast i8* %2 to i32*, !dbg !84
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !82
  %4 = load i32, i32* @staticFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %4, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !91
  store i32* %5, i32** %data, align 8, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !96
  %7 = load i32*, i32** %data, align 8, !dbg !97
  %8 = bitcast i32* %7 to i8*, !dbg !97
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !97
  %9 = bitcast i32* %arraydecay to i8*, !dbg !97
  %10 = load i32*, i32** %data, align 8, !dbg !97
  %11 = bitcast i32* %10 to i8*, !dbg !97
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !97
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !97
  %13 = load i32*, i32** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !98
  %14 = load i32, i32* %arrayidx, align 4, !dbg !98
  call void @printIntLine(i32 noundef %14), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 200, align 16, !dbg !106
  %1 = bitcast i8* %0 to i32*, !dbg !107
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %2 = alloca i8, i64 400, align 16, !dbg !110
  %3 = bitcast i8* %2 to i32*, !dbg !111
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !109
  %4 = load i32, i32* @staticTrue, align 4, !dbg !112
  %tobool = icmp ne i32 %4, 0, !dbg !112
  br i1 %tobool, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !115
  store i32* %5, i32** %data, align 8, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !121
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !121
  %7 = load i32*, i32** %data, align 8, !dbg !122
  %8 = bitcast i32* %7 to i8*, !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %9 = bitcast i32* %arraydecay to i8*, !dbg !122
  %10 = load i32*, i32** %data, align 8, !dbg !122
  %11 = bitcast i32* %10 to i8*, !dbg !122
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !122
  %call = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !122
  %13 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !123
  %14 = load i32, i32* %arrayidx, align 4, !dbg !123
  call void @printIntLine(i32 noundef %14), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !11, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !11, line: 24, type: !6, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05_bad", scope: !11, file: !11, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 30, type: !5)
!24 = !DILocation(line: 30, column: 11, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !11, line: 31, type: !5)
!26 = !DILocation(line: 31, column: 11, scope: !19)
!27 = !DILocation(line: 31, column: 34, scope: !19)
!28 = !DILocation(line: 31, column: 27, scope: !19)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !11, line: 32, type: !5)
!30 = !DILocation(line: 32, column: 11, scope: !19)
!31 = !DILocation(line: 32, column: 35, scope: !19)
!32 = !DILocation(line: 32, column: 28, scope: !19)
!33 = !DILocation(line: 33, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !19, file: !11, line: 33, column: 8)
!35 = !DILocation(line: 33, column: 8, scope: !19)
!36 = !DILocation(line: 37, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !11, line: 34, column: 5)
!38 = !DILocation(line: 37, column: 14, scope: !37)
!39 = !DILocation(line: 38, column: 5, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !11, line: 40, type: !42)
!41 = distinct !DILexicalBlock(scope: !19, file: !11, line: 39, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 40, column: 13, scope: !41)
!46 = !DILocation(line: 42, column: 9, scope: !41)
!47 = !DILocation(line: 43, column: 22, scope: !41)
!48 = !DILocation(line: 43, column: 9, scope: !41)
!49 = !DILocation(line: 45, column: 1, scope: !19)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memcpy_05_good", scope: !11, file: !11, line: 94, type: !20, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!51 = !DILocation(line: 96, column: 5, scope: !50)
!52 = !DILocation(line: 97, column: 5, scope: !50)
!53 = !DILocation(line: 98, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 110, type: !55, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!55 = !DISubroutineType(types: !56)
!56 = !{!6, !6, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !11, line: 110, type: !6)
!61 = !DILocation(line: 110, column: 14, scope: !54)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !11, line: 110, type: !57)
!63 = !DILocation(line: 110, column: 27, scope: !54)
!64 = !DILocation(line: 113, column: 22, scope: !54)
!65 = !DILocation(line: 113, column: 12, scope: !54)
!66 = !DILocation(line: 113, column: 5, scope: !54)
!67 = !DILocation(line: 115, column: 5, scope: !54)
!68 = !DILocation(line: 116, column: 5, scope: !54)
!69 = !DILocation(line: 117, column: 5, scope: !54)
!70 = !DILocation(line: 120, column: 5, scope: !54)
!71 = !DILocation(line: 121, column: 5, scope: !54)
!72 = !DILocation(line: 122, column: 5, scope: !54)
!73 = !DILocation(line: 124, column: 5, scope: !54)
!74 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!75 = !DILocalVariable(name: "data", scope: !74, file: !11, line: 54, type: !5)
!76 = !DILocation(line: 54, column: 11, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !11, line: 55, type: !5)
!78 = !DILocation(line: 55, column: 11, scope: !74)
!79 = !DILocation(line: 55, column: 34, scope: !74)
!80 = !DILocation(line: 55, column: 27, scope: !74)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !11, line: 56, type: !5)
!82 = !DILocation(line: 56, column: 11, scope: !74)
!83 = !DILocation(line: 56, column: 35, scope: !74)
!84 = !DILocation(line: 56, column: 28, scope: !74)
!85 = !DILocation(line: 57, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !74, file: !11, line: 57, column: 8)
!87 = !DILocation(line: 57, column: 8, scope: !74)
!88 = !DILocation(line: 60, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !11, line: 58, column: 5)
!90 = !DILocation(line: 61, column: 5, scope: !89)
!91 = !DILocation(line: 65, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !11, line: 63, column: 5)
!93 = !DILocation(line: 65, column: 14, scope: !92)
!94 = !DILocalVariable(name: "source", scope: !95, file: !11, line: 68, type: !42)
!95 = distinct !DILexicalBlock(scope: !74, file: !11, line: 67, column: 5)
!96 = !DILocation(line: 68, column: 13, scope: !95)
!97 = !DILocation(line: 70, column: 9, scope: !95)
!98 = !DILocation(line: 71, column: 22, scope: !95)
!99 = !DILocation(line: 71, column: 9, scope: !95)
!100 = !DILocation(line: 73, column: 1, scope: !74)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 76, type: !20, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!102 = !DILocalVariable(name: "data", scope: !101, file: !11, line: 78, type: !5)
!103 = !DILocation(line: 78, column: 11, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !11, line: 79, type: !5)
!105 = !DILocation(line: 79, column: 11, scope: !101)
!106 = !DILocation(line: 79, column: 34, scope: !101)
!107 = !DILocation(line: 79, column: 27, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !11, line: 80, type: !5)
!109 = !DILocation(line: 80, column: 11, scope: !101)
!110 = !DILocation(line: 80, column: 35, scope: !101)
!111 = !DILocation(line: 80, column: 28, scope: !101)
!112 = !DILocation(line: 81, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !11, line: 81, column: 8)
!114 = !DILocation(line: 81, column: 8, scope: !101)
!115 = !DILocation(line: 84, column: 16, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !11, line: 82, column: 5)
!117 = !DILocation(line: 84, column: 14, scope: !116)
!118 = !DILocation(line: 85, column: 5, scope: !116)
!119 = !DILocalVariable(name: "source", scope: !120, file: !11, line: 87, type: !42)
!120 = distinct !DILexicalBlock(scope: !101, file: !11, line: 86, column: 5)
!121 = !DILocation(line: 87, column: 13, scope: !120)
!122 = !DILocation(line: 89, column: 9, scope: !120)
!123 = !DILocation(line: 90, column: 22, scope: !120)
!124 = !DILocation(line: 90, column: 9, scope: !120)
!125 = !DILocation(line: 92, column: 1, scope: !101)
