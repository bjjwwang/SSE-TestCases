; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 200, align 16, !dbg !25
  %1 = bitcast i8* %0 to i32*, !dbg !26
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %2 = alloca i8, i64 400, align 16, !dbg !29
  %3 = bitcast i8* %2 to i32*, !dbg !30
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !28
  %4 = load i32, i32* @staticFive, align 4, !dbg !31
  %cmp = icmp eq i32 %4, 5, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %5, i32** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !44
  %7 = load i32*, i32** %data, align 8, !dbg !45
  %8 = bitcast i32* %7 to i8*, !dbg !45
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %9 = bitcast i32* %arraydecay to i8*, !dbg !45
  %10 = load i32*, i32** %data, align 8, !dbg !45
  %11 = bitcast i32* %10 to i8*, !dbg !45
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !45
  %call = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !45
  %13 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !46
  %14 = load i32, i32* %arrayidx, align 4, !dbg !46
  call void @printIntLine(i32 noundef %14), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printIntLine(i32 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 200, align 16, !dbg !78
  %1 = bitcast i8* %0 to i32*, !dbg !79
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %2 = alloca i8, i64 400, align 16, !dbg !82
  %3 = bitcast i8* %2 to i32*, !dbg !83
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !81
  %4 = load i32, i32* @staticFive, align 4, !dbg !84
  %cmp = icmp ne i32 %4, 5, !dbg !86
  br i1 %cmp, label %if.then, label %if.else, !dbg !87

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
  %call = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !97
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
  %4 = load i32, i32* @staticFive, align 4, !dbg !112
  %cmp = icmp eq i32 %4, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !116
  store i32* %5, i32** %data, align 8, !dbg !118
  br label %if.end, !dbg !119

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %6 = bitcast [100 x i32]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 400, i1 false), !dbg !122
  %7 = load i32*, i32** %data, align 8, !dbg !123
  %8 = bitcast i32* %7 to i8*, !dbg !123
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !123
  %9 = bitcast i32* %arraydecay to i8*, !dbg !123
  %10 = load i32*, i32** %data, align 8, !dbg !123
  %11 = bitcast i32* %10 to i8*, !dbg !123
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !123
  %call = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #5, !dbg !123
  %13 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %13, i64 0, !dbg !124
  %14 = load i32, i32* %arrayidx, align 4, !dbg !124
  call void @printIntLine(i32 noundef %14), !dbg !125
  ret void, !dbg !126
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 23, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07_bad", scope: !9, file: !9, line: 27, type: !18, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !{}
!21 = !DILocalVariable(name: "data", scope: !17, file: !9, line: 29, type: !5)
!22 = !DILocation(line: 29, column: 11, scope: !17)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !9, line: 30, type: !5)
!24 = !DILocation(line: 30, column: 11, scope: !17)
!25 = !DILocation(line: 30, column: 34, scope: !17)
!26 = !DILocation(line: 30, column: 27, scope: !17)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !9, line: 31, type: !5)
!28 = !DILocation(line: 31, column: 11, scope: !17)
!29 = !DILocation(line: 31, column: 35, scope: !17)
!30 = !DILocation(line: 31, column: 28, scope: !17)
!31 = !DILocation(line: 32, column: 8, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !9, line: 32, column: 8)
!33 = !DILocation(line: 32, column: 18, scope: !32)
!34 = !DILocation(line: 32, column: 8, scope: !17)
!35 = !DILocation(line: 36, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !9, line: 33, column: 5)
!37 = !DILocation(line: 36, column: 14, scope: !36)
!38 = !DILocation(line: 37, column: 5, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !9, line: 39, type: !41)
!40 = distinct !DILexicalBlock(scope: !17, file: !9, line: 38, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 39, column: 13, scope: !40)
!45 = !DILocation(line: 41, column: 9, scope: !40)
!46 = !DILocation(line: 42, column: 22, scope: !40)
!47 = !DILocation(line: 42, column: 9, scope: !40)
!48 = !DILocation(line: 44, column: 1, scope: !17)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_alloca_memmove_07_good", scope: !9, file: !9, line: 93, type: !18, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!50 = !DILocation(line: 95, column: 5, scope: !49)
!51 = !DILocation(line: 96, column: 5, scope: !49)
!52 = !DILocation(line: 97, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 109, type: !54, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!54 = !DISubroutineType(types: !55)
!55 = !{!6, !6, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !9, line: 109, type: !6)
!60 = !DILocation(line: 109, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !9, line: 109, type: !56)
!62 = !DILocation(line: 109, column: 27, scope: !53)
!63 = !DILocation(line: 112, column: 22, scope: !53)
!64 = !DILocation(line: 112, column: 12, scope: !53)
!65 = !DILocation(line: 112, column: 5, scope: !53)
!66 = !DILocation(line: 114, column: 5, scope: !53)
!67 = !DILocation(line: 115, column: 5, scope: !53)
!68 = !DILocation(line: 116, column: 5, scope: !53)
!69 = !DILocation(line: 119, column: 5, scope: !53)
!70 = !DILocation(line: 120, column: 5, scope: !53)
!71 = !DILocation(line: 121, column: 5, scope: !53)
!72 = !DILocation(line: 123, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 51, type: !18, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !20)
!74 = !DILocalVariable(name: "data", scope: !73, file: !9, line: 53, type: !5)
!75 = !DILocation(line: 53, column: 11, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !9, line: 54, type: !5)
!77 = !DILocation(line: 54, column: 11, scope: !73)
!78 = !DILocation(line: 54, column: 34, scope: !73)
!79 = !DILocation(line: 54, column: 27, scope: !73)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !9, line: 55, type: !5)
!81 = !DILocation(line: 55, column: 11, scope: !73)
!82 = !DILocation(line: 55, column: 35, scope: !73)
!83 = !DILocation(line: 55, column: 28, scope: !73)
!84 = !DILocation(line: 56, column: 8, scope: !85)
!85 = distinct !DILexicalBlock(scope: !73, file: !9, line: 56, column: 8)
!86 = !DILocation(line: 56, column: 18, scope: !85)
!87 = !DILocation(line: 56, column: 8, scope: !73)
!88 = !DILocation(line: 59, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !9, line: 57, column: 5)
!90 = !DILocation(line: 60, column: 5, scope: !89)
!91 = !DILocation(line: 64, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !85, file: !9, line: 62, column: 5)
!93 = !DILocation(line: 64, column: 14, scope: !92)
!94 = !DILocalVariable(name: "source", scope: !95, file: !9, line: 67, type: !41)
!95 = distinct !DILexicalBlock(scope: !73, file: !9, line: 66, column: 5)
!96 = !DILocation(line: 67, column: 13, scope: !95)
!97 = !DILocation(line: 69, column: 9, scope: !95)
!98 = !DILocation(line: 70, column: 22, scope: !95)
!99 = !DILocation(line: 70, column: 9, scope: !95)
!100 = !DILocation(line: 72, column: 1, scope: !73)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 75, type: !18, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !20)
!102 = !DILocalVariable(name: "data", scope: !101, file: !9, line: 77, type: !5)
!103 = !DILocation(line: 77, column: 11, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !9, line: 78, type: !5)
!105 = !DILocation(line: 78, column: 11, scope: !101)
!106 = !DILocation(line: 78, column: 34, scope: !101)
!107 = !DILocation(line: 78, column: 27, scope: !101)
!108 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !9, line: 79, type: !5)
!109 = !DILocation(line: 79, column: 11, scope: !101)
!110 = !DILocation(line: 79, column: 35, scope: !101)
!111 = !DILocation(line: 79, column: 28, scope: !101)
!112 = !DILocation(line: 80, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !101, file: !9, line: 80, column: 8)
!114 = !DILocation(line: 80, column: 18, scope: !113)
!115 = !DILocation(line: 80, column: 8, scope: !101)
!116 = !DILocation(line: 83, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !9, line: 81, column: 5)
!118 = !DILocation(line: 83, column: 14, scope: !117)
!119 = !DILocation(line: 84, column: 5, scope: !117)
!120 = !DILocalVariable(name: "source", scope: !121, file: !9, line: 86, type: !41)
!121 = distinct !DILexicalBlock(scope: !101, file: !9, line: 85, column: 5)
!122 = !DILocation(line: 86, column: 13, scope: !121)
!123 = !DILocation(line: 88, column: 9, scope: !121)
!124 = !DILocation(line: 89, column: 22, scope: !121)
!125 = !DILocation(line: 89, column: 9, scope: !121)
!126 = !DILocation(line: 91, column: 1, scope: !101)
