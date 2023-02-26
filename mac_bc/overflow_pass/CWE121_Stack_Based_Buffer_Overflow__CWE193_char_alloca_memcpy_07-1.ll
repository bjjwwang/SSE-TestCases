; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 10, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 11, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i32, i32* @staticFive, align 4, !dbg !30
  %cmp = icmp eq i32 %2, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !34
  store i8* %3, i8** %data, align 8, !dbg !36
  %4 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !45
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !46
  %add = add i64 %call, 1, !dbg !46
  %mul = mul i64 %add, 1, !dbg !46
  %7 = load i8*, i8** %data, align 8, !dbg !46
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !46
  %call2 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %8) #5, !dbg !46
  %9 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* noundef %9), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07_good() #0 !dbg !50 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 10, align 16, !dbg !77
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %1 = alloca i8, i64 11, align 16, !dbg !80
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !79
  %2 = load i32, i32* @staticFive, align 4, !dbg !81
  %cmp = icmp ne i32 %2, 5, !dbg !83
  br i1 %cmp, label %if.then, label %if.else, !dbg !84

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
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !96
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !96
  %add = add i64 %call, 1, !dbg !96
  %mul = mul i64 %add, 1, !dbg !96
  %7 = load i8*, i8** %data, align 8, !dbg !96
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !96
  %call2 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %8) #5, !dbg !96
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
  %2 = load i32, i32* @staticFive, align 4, !dbg !109
  %cmp = icmp eq i32 %2, 5, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  store i8* %3, i8** %data, align 8, !dbg !115
  %4 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !121
  %6 = load i8*, i8** %data, align 8, !dbg !122
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !122
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !122
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !122
  %add = add i64 %call, 1, !dbg !122
  %mul = mul i64 %add, 1, !dbg !122
  %7 = load i8*, i8** %data, align 8, !dbg !122
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !122
  %call2 = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %8) #5, !dbg !122
  %9 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* noundef %9), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 30, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07_bad", scope: !9, file: !9, line: 34, type: !19, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 36, type: !5)
!23 = !DILocation(line: 36, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 37, type: !5)
!25 = !DILocation(line: 37, column: 12, scope: !18)
!26 = !DILocation(line: 37, column: 36, scope: !18)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 38, type: !5)
!28 = !DILocation(line: 38, column: 12, scope: !18)
!29 = !DILocation(line: 38, column: 37, scope: !18)
!30 = !DILocation(line: 39, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !18, file: !9, line: 39, column: 8)
!32 = !DILocation(line: 39, column: 18, scope: !31)
!33 = !DILocation(line: 39, column: 8, scope: !18)
!34 = !DILocation(line: 43, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !9, line: 40, column: 5)
!36 = !DILocation(line: 43, column: 14, scope: !35)
!37 = !DILocation(line: 44, column: 9, scope: !35)
!38 = !DILocation(line: 44, column: 17, scope: !35)
!39 = !DILocation(line: 45, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !9, line: 47, type: !42)
!41 = distinct !DILexicalBlock(scope: !18, file: !9, line: 46, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 11)
!45 = !DILocation(line: 47, column: 14, scope: !41)
!46 = !DILocation(line: 50, column: 9, scope: !41)
!47 = !DILocation(line: 51, column: 19, scope: !41)
!48 = !DILocation(line: 51, column: 9, scope: !41)
!49 = !DILocation(line: 53, column: 1, scope: !18)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memcpy_07_good", scope: !9, file: !9, line: 108, type: !19, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!51 = !DILocation(line: 110, column: 5, scope: !50)
!52 = !DILocation(line: 111, column: 5, scope: !50)
!53 = !DILocation(line: 112, column: 1, scope: !50)
!54 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 124, type: !55, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!55 = !DISubroutineType(types: !56)
!56 = !{!10, !10, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !9, line: 124, type: !10)
!59 = !DILocation(line: 124, column: 14, scope: !54)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !9, line: 124, type: !57)
!61 = !DILocation(line: 124, column: 27, scope: !54)
!62 = !DILocation(line: 127, column: 22, scope: !54)
!63 = !DILocation(line: 127, column: 12, scope: !54)
!64 = !DILocation(line: 127, column: 5, scope: !54)
!65 = !DILocation(line: 129, column: 5, scope: !54)
!66 = !DILocation(line: 130, column: 5, scope: !54)
!67 = !DILocation(line: 131, column: 5, scope: !54)
!68 = !DILocation(line: 134, column: 5, scope: !54)
!69 = !DILocation(line: 135, column: 5, scope: !54)
!70 = !DILocation(line: 136, column: 5, scope: !54)
!71 = !DILocation(line: 138, column: 5, scope: !54)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!73 = !DILocalVariable(name: "data", scope: !72, file: !9, line: 62, type: !5)
!74 = !DILocation(line: 62, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !9, line: 63, type: !5)
!76 = !DILocation(line: 63, column: 12, scope: !72)
!77 = !DILocation(line: 63, column: 36, scope: !72)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !9, line: 64, type: !5)
!79 = !DILocation(line: 64, column: 12, scope: !72)
!80 = !DILocation(line: 64, column: 37, scope: !72)
!81 = !DILocation(line: 65, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !9, line: 65, column: 8)
!83 = !DILocation(line: 65, column: 18, scope: !82)
!84 = !DILocation(line: 65, column: 8, scope: !72)
!85 = !DILocation(line: 68, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !9, line: 66, column: 5)
!87 = !DILocation(line: 69, column: 5, scope: !86)
!88 = !DILocation(line: 74, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !82, file: !9, line: 71, column: 5)
!90 = !DILocation(line: 74, column: 14, scope: !89)
!91 = !DILocation(line: 75, column: 9, scope: !89)
!92 = !DILocation(line: 75, column: 17, scope: !89)
!93 = !DILocalVariable(name: "source", scope: !94, file: !9, line: 78, type: !42)
!94 = distinct !DILexicalBlock(scope: !72, file: !9, line: 77, column: 5)
!95 = !DILocation(line: 78, column: 14, scope: !94)
!96 = !DILocation(line: 81, column: 9, scope: !94)
!97 = !DILocation(line: 82, column: 19, scope: !94)
!98 = !DILocation(line: 82, column: 9, scope: !94)
!99 = !DILocation(line: 84, column: 1, scope: !72)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 87, type: !19, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!101 = !DILocalVariable(name: "data", scope: !100, file: !9, line: 89, type: !5)
!102 = !DILocation(line: 89, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !9, line: 90, type: !5)
!104 = !DILocation(line: 90, column: 12, scope: !100)
!105 = !DILocation(line: 90, column: 36, scope: !100)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !9, line: 91, type: !5)
!107 = !DILocation(line: 91, column: 12, scope: !100)
!108 = !DILocation(line: 91, column: 37, scope: !100)
!109 = !DILocation(line: 92, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !100, file: !9, line: 92, column: 8)
!111 = !DILocation(line: 92, column: 18, scope: !110)
!112 = !DILocation(line: 92, column: 8, scope: !100)
!113 = !DILocation(line: 96, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !9, line: 93, column: 5)
!115 = !DILocation(line: 96, column: 14, scope: !114)
!116 = !DILocation(line: 97, column: 9, scope: !114)
!117 = !DILocation(line: 97, column: 17, scope: !114)
!118 = !DILocation(line: 98, column: 5, scope: !114)
!119 = !DILocalVariable(name: "source", scope: !120, file: !9, line: 100, type: !42)
!120 = distinct !DILexicalBlock(scope: !100, file: !9, line: 99, column: 5)
!121 = !DILocation(line: 100, column: 14, scope: !120)
!122 = !DILocation(line: 103, column: 9, scope: !120)
!123 = !DILocation(line: 104, column: 19, scope: !120)
!124 = !DILocation(line: 104, column: 9, scope: !120)
!125 = !DILocation(line: 106, column: 1, scope: !100)
