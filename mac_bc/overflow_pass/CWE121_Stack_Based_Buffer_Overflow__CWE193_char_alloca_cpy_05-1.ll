; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !9
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 10, align 16, !dbg !28
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 11, align 16, !dbg !31
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !30
  %2 = load i32, i32* @staticTrue, align 4, !dbg !32
  %tobool = icmp ne i32 %2, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !35
  store i8* %3, i8** %data, align 8, !dbg !37
  %4 = load i8*, i8** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !46
  %6 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %7 = load i8*, i8** %data, align 8, !dbg !47
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !47
  %call = call i8* @__strcpy_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %8) #5, !dbg !47
  %9 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* noundef %9), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %0 = alloca i8, i64 10, align 16, !dbg !78
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %1 = alloca i8, i64 11, align 16, !dbg !81
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !80
  %2 = load i32, i32* @staticFalse, align 4, !dbg !82
  %tobool = icmp ne i32 %2, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !88
  store i8* %3, i8** %data, align 8, !dbg !90
  %4 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !96
  %7 = load i8*, i8** %data, align 8, !dbg !96
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !96
  %call = call i8* @__strcpy_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %8) #5, !dbg !96
  %9 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* noundef %9), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 10, align 16, !dbg !105
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %1 = alloca i8, i64 11, align 16, !dbg !108
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !107
  %2 = load i32, i32* @staticTrue, align 4, !dbg !109
  %tobool = icmp ne i32 %2, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !112
  store i8* %3, i8** %data, align 8, !dbg !114
  %4 = load i8*, i8** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !115
  store i8 0, i8* %arrayidx, align 1, !dbg !116
  br label %if.end, !dbg !117

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !120
  %6 = load i8*, i8** %data, align 8, !dbg !121
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !121
  %7 = load i8*, i8** %data, align 8, !dbg !121
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !121
  %call = call i8* @__strcpy_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %8) #5, !dbg !121
  %9 = load i8*, i8** %data, align 8, !dbg !122
  call void @printLine(i8* noundef %9), !dbg !123
  ret void, !dbg !124
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !11, line: 30, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !11, line: 31, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_bad", scope: !11, file: !11, line: 35, type: !21, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !11, line: 37, type: !5)
!25 = !DILocation(line: 37, column: 12, scope: !20)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !11, line: 38, type: !5)
!27 = !DILocation(line: 38, column: 12, scope: !20)
!28 = !DILocation(line: 38, column: 36, scope: !20)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !11, line: 39, type: !5)
!30 = !DILocation(line: 39, column: 12, scope: !20)
!31 = !DILocation(line: 39, column: 37, scope: !20)
!32 = !DILocation(line: 40, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !20, file: !11, line: 40, column: 8)
!34 = !DILocation(line: 40, column: 8, scope: !20)
!35 = !DILocation(line: 44, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !11, line: 41, column: 5)
!37 = !DILocation(line: 44, column: 14, scope: !36)
!38 = !DILocation(line: 45, column: 9, scope: !36)
!39 = !DILocation(line: 45, column: 17, scope: !36)
!40 = !DILocation(line: 46, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !11, line: 48, type: !43)
!42 = distinct !DILexicalBlock(scope: !20, file: !11, line: 47, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 11)
!46 = !DILocation(line: 48, column: 14, scope: !42)
!47 = !DILocation(line: 50, column: 9, scope: !42)
!48 = !DILocation(line: 51, column: 19, scope: !42)
!49 = !DILocation(line: 51, column: 9, scope: !42)
!50 = !DILocation(line: 53, column: 1, scope: !20)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_05_good", scope: !11, file: !11, line: 106, type: !21, scopeLine: 107, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!52 = !DILocation(line: 108, column: 5, scope: !51)
!53 = !DILocation(line: 109, column: 5, scope: !51)
!54 = !DILocation(line: 110, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 122, type: !56, scopeLine: 123, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!56 = !DISubroutineType(types: !57)
!57 = !{!12, !12, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !11, line: 122, type: !12)
!60 = !DILocation(line: 122, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !11, line: 122, type: !58)
!62 = !DILocation(line: 122, column: 27, scope: !55)
!63 = !DILocation(line: 125, column: 22, scope: !55)
!64 = !DILocation(line: 125, column: 12, scope: !55)
!65 = !DILocation(line: 125, column: 5, scope: !55)
!66 = !DILocation(line: 127, column: 5, scope: !55)
!67 = !DILocation(line: 128, column: 5, scope: !55)
!68 = !DILocation(line: 129, column: 5, scope: !55)
!69 = !DILocation(line: 132, column: 5, scope: !55)
!70 = !DILocation(line: 133, column: 5, scope: !55)
!71 = !DILocation(line: 134, column: 5, scope: !55)
!72 = !DILocation(line: 136, column: 5, scope: !55)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!74 = !DILocalVariable(name: "data", scope: !73, file: !11, line: 62, type: !5)
!75 = !DILocation(line: 62, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !11, line: 63, type: !5)
!77 = !DILocation(line: 63, column: 12, scope: !73)
!78 = !DILocation(line: 63, column: 36, scope: !73)
!79 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !11, line: 64, type: !5)
!80 = !DILocation(line: 64, column: 12, scope: !73)
!81 = !DILocation(line: 64, column: 37, scope: !73)
!82 = !DILocation(line: 65, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !73, file: !11, line: 65, column: 8)
!84 = !DILocation(line: 65, column: 8, scope: !73)
!85 = !DILocation(line: 68, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !11, line: 66, column: 5)
!87 = !DILocation(line: 69, column: 5, scope: !86)
!88 = !DILocation(line: 74, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !11, line: 71, column: 5)
!90 = !DILocation(line: 74, column: 14, scope: !89)
!91 = !DILocation(line: 75, column: 9, scope: !89)
!92 = !DILocation(line: 75, column: 17, scope: !89)
!93 = !DILocalVariable(name: "source", scope: !94, file: !11, line: 78, type: !43)
!94 = distinct !DILexicalBlock(scope: !73, file: !11, line: 77, column: 5)
!95 = !DILocation(line: 78, column: 14, scope: !94)
!96 = !DILocation(line: 80, column: 9, scope: !94)
!97 = !DILocation(line: 81, column: 19, scope: !94)
!98 = !DILocation(line: 81, column: 9, scope: !94)
!99 = !DILocation(line: 83, column: 1, scope: !73)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!101 = !DILocalVariable(name: "data", scope: !100, file: !11, line: 88, type: !5)
!102 = !DILocation(line: 88, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !11, line: 89, type: !5)
!104 = !DILocation(line: 89, column: 12, scope: !100)
!105 = !DILocation(line: 89, column: 36, scope: !100)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !11, line: 90, type: !5)
!107 = !DILocation(line: 90, column: 12, scope: !100)
!108 = !DILocation(line: 90, column: 37, scope: !100)
!109 = !DILocation(line: 91, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !100, file: !11, line: 91, column: 8)
!111 = !DILocation(line: 91, column: 8, scope: !100)
!112 = !DILocation(line: 95, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !11, line: 92, column: 5)
!114 = !DILocation(line: 95, column: 14, scope: !113)
!115 = !DILocation(line: 96, column: 9, scope: !113)
!116 = !DILocation(line: 96, column: 17, scope: !113)
!117 = !DILocation(line: 97, column: 5, scope: !113)
!118 = !DILocalVariable(name: "source", scope: !119, file: !11, line: 99, type: !43)
!119 = distinct !DILexicalBlock(scope: !100, file: !11, line: 98, column: 5)
!120 = !DILocation(line: 99, column: 14, scope: !119)
!121 = !DILocation(line: 101, column: 9, scope: !119)
!122 = !DILocation(line: 102, column: 19, scope: !119)
!123 = !DILocation(line: 102, column: 9, scope: !119)
!124 = !DILocation(line: 104, column: 1, scope: !100)
