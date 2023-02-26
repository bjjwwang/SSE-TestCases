; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 50, align 16, !dbg !28
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 100, align 16, !dbg !31
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
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !47
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !48
  store i8 0, i8* %arrayidx1, align 1, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !50
  %6 = load i8*, i8** %data, align 8, !dbg !50
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !50
  %call = call i8* @__strncpy_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 99, i64 noundef %7) #5, !dbg !50
  %8 = load i8*, i8** %data, align 8, !dbg !51
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !51
  store i8 0, i8* %arrayidx3, align 1, !dbg !52
  %9 = load i8*, i8** %data, align 8, !dbg !53
  call void @printLine(i8* noundef %9), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_good() #0 !dbg !56 {
entry:
  call void @goodG2B1(), !dbg !57
  call void @goodG2B2(), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !60 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_good(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_bad(), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !78 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  %0 = alloca i8, i64 50, align 16, !dbg !83
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %1 = alloca i8, i64 100, align 16, !dbg !86
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !85
  %2 = load i32, i32* @staticFalse, align 4, !dbg !87
  %tobool = icmp ne i32 %2, 0, !dbg !87
  br i1 %tobool, label %if.then, label %if.else, !dbg !89

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end, !dbg !92

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !93
  store i8* %3, i8** %data, align 8, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx1, align 1, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  %6 = load i8*, i8** %data, align 8, !dbg !104
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !104
  %call = call i8* @__strncpy_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 99, i64 noundef %7) #5, !dbg !104
  %8 = load i8*, i8** %data, align 8, !dbg !105
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !105
  store i8 0, i8* %arrayidx3, align 1, !dbg !106
  %9 = load i8*, i8** %data, align 8, !dbg !107
  call void @printLine(i8* noundef %9), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !110 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 50, align 16, !dbg !115
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %1 = alloca i8, i64 100, align 16, !dbg !118
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !117
  %2 = load i32, i32* @staticTrue, align 4, !dbg !119
  %tobool = icmp ne i32 %2, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  store i8* %3, i8** %data, align 8, !dbg !124
  %4 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  br label %if.end, !dbg !127

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !131
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx1, align 1, !dbg !133
  %5 = load i8*, i8** %data, align 8, !dbg !134
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !134
  %6 = load i8*, i8** %data, align 8, !dbg !134
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !134
  %call = call i8* @__strncpy_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef 99, i64 noundef %7) #5, !dbg !134
  %8 = load i8*, i8** %data, align 8, !dbg !135
  %arrayidx3 = getelementptr inbounds i8, i8* %8, i64 99, !dbg !135
  store i8 0, i8* %arrayidx3, align 1, !dbg !136
  %9 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* noundef %9), !dbg !138
  ret void, !dbg !139
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !11, line: 26, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_bad", scope: !11, file: !11, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !11, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !20)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !11, line: 33, type: !5)
!27 = !DILocation(line: 33, column: 12, scope: !20)
!28 = !DILocation(line: 33, column: 36, scope: !20)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !11, line: 34, type: !5)
!30 = !DILocation(line: 34, column: 12, scope: !20)
!31 = !DILocation(line: 34, column: 37, scope: !20)
!32 = !DILocation(line: 35, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !20, file: !11, line: 35, column: 8)
!34 = !DILocation(line: 35, column: 8, scope: !20)
!35 = !DILocation(line: 39, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !11, line: 36, column: 5)
!37 = !DILocation(line: 39, column: 14, scope: !36)
!38 = !DILocation(line: 40, column: 9, scope: !36)
!39 = !DILocation(line: 40, column: 17, scope: !36)
!40 = !DILocation(line: 41, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !11, line: 43, type: !43)
!42 = distinct !DILexicalBlock(scope: !20, file: !11, line: 42, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 43, column: 14, scope: !42)
!47 = !DILocation(line: 44, column: 9, scope: !42)
!48 = !DILocation(line: 45, column: 9, scope: !42)
!49 = !DILocation(line: 45, column: 23, scope: !42)
!50 = !DILocation(line: 47, column: 9, scope: !42)
!51 = !DILocation(line: 48, column: 9, scope: !42)
!52 = !DILocation(line: 48, column: 21, scope: !42)
!53 = !DILocation(line: 49, column: 19, scope: !42)
!54 = !DILocation(line: 49, column: 9, scope: !42)
!55 = !DILocation(line: 51, column: 1, scope: !20)
!56 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_ncpy_05_good", scope: !11, file: !11, line: 108, type: !21, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!57 = !DILocation(line: 110, column: 5, scope: !56)
!58 = !DILocation(line: 111, column: 5, scope: !56)
!59 = !DILocation(line: 112, column: 1, scope: !56)
!60 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 124, type: !61, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!61 = !DISubroutineType(types: !62)
!62 = !{!12, !12, !63}
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !60, file: !11, line: 124, type: !12)
!65 = !DILocation(line: 124, column: 14, scope: !60)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !60, file: !11, line: 124, type: !63)
!67 = !DILocation(line: 124, column: 27, scope: !60)
!68 = !DILocation(line: 127, column: 22, scope: !60)
!69 = !DILocation(line: 127, column: 12, scope: !60)
!70 = !DILocation(line: 127, column: 5, scope: !60)
!71 = !DILocation(line: 129, column: 5, scope: !60)
!72 = !DILocation(line: 130, column: 5, scope: !60)
!73 = !DILocation(line: 131, column: 5, scope: !60)
!74 = !DILocation(line: 134, column: 5, scope: !60)
!75 = !DILocation(line: 135, column: 5, scope: !60)
!76 = !DILocation(line: 136, column: 5, scope: !60)
!77 = !DILocation(line: 138, column: 5, scope: !60)
!78 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 58, type: !21, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!79 = !DILocalVariable(name: "data", scope: !78, file: !11, line: 60, type: !5)
!80 = !DILocation(line: 60, column: 12, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !11, line: 61, type: !5)
!82 = !DILocation(line: 61, column: 12, scope: !78)
!83 = !DILocation(line: 61, column: 36, scope: !78)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !11, line: 62, type: !5)
!85 = !DILocation(line: 62, column: 12, scope: !78)
!86 = !DILocation(line: 62, column: 37, scope: !78)
!87 = !DILocation(line: 63, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !78, file: !11, line: 63, column: 8)
!89 = !DILocation(line: 63, column: 8, scope: !78)
!90 = !DILocation(line: 66, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !11, line: 64, column: 5)
!92 = !DILocation(line: 67, column: 5, scope: !91)
!93 = !DILocation(line: 71, column: 16, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !11, line: 69, column: 5)
!95 = !DILocation(line: 71, column: 14, scope: !94)
!96 = !DILocation(line: 72, column: 9, scope: !94)
!97 = !DILocation(line: 72, column: 17, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !11, line: 75, type: !43)
!99 = distinct !DILexicalBlock(scope: !78, file: !11, line: 74, column: 5)
!100 = !DILocation(line: 75, column: 14, scope: !99)
!101 = !DILocation(line: 76, column: 9, scope: !99)
!102 = !DILocation(line: 77, column: 9, scope: !99)
!103 = !DILocation(line: 77, column: 23, scope: !99)
!104 = !DILocation(line: 79, column: 9, scope: !99)
!105 = !DILocation(line: 80, column: 9, scope: !99)
!106 = !DILocation(line: 80, column: 21, scope: !99)
!107 = !DILocation(line: 81, column: 19, scope: !99)
!108 = !DILocation(line: 81, column: 9, scope: !99)
!109 = !DILocation(line: 83, column: 1, scope: !78)
!110 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 86, type: !21, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!111 = !DILocalVariable(name: "data", scope: !110, file: !11, line: 88, type: !5)
!112 = !DILocation(line: 88, column: 12, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !11, line: 89, type: !5)
!114 = !DILocation(line: 89, column: 12, scope: !110)
!115 = !DILocation(line: 89, column: 36, scope: !110)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !11, line: 90, type: !5)
!117 = !DILocation(line: 90, column: 12, scope: !110)
!118 = !DILocation(line: 90, column: 37, scope: !110)
!119 = !DILocation(line: 91, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !11, line: 91, column: 8)
!121 = !DILocation(line: 91, column: 8, scope: !110)
!122 = !DILocation(line: 94, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !11, line: 92, column: 5)
!124 = !DILocation(line: 94, column: 14, scope: !123)
!125 = !DILocation(line: 95, column: 9, scope: !123)
!126 = !DILocation(line: 95, column: 17, scope: !123)
!127 = !DILocation(line: 96, column: 5, scope: !123)
!128 = !DILocalVariable(name: "source", scope: !129, file: !11, line: 98, type: !43)
!129 = distinct !DILexicalBlock(scope: !110, file: !11, line: 97, column: 5)
!130 = !DILocation(line: 98, column: 14, scope: !129)
!131 = !DILocation(line: 99, column: 9, scope: !129)
!132 = !DILocation(line: 100, column: 9, scope: !129)
!133 = !DILocation(line: 100, column: 23, scope: !129)
!134 = !DILocation(line: 102, column: 9, scope: !129)
!135 = !DILocation(line: 103, column: 9, scope: !129)
!136 = !DILocation(line: 103, column: 21, scope: !129)
!137 = !DILocation(line: 104, column: 19, scope: !129)
!138 = !DILocation(line: 104, column: 9, scope: !129)
!139 = !DILocation(line: 106, column: 1, scope: !110)
