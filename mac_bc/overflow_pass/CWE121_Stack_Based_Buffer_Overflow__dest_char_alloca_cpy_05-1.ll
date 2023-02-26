; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05_bad() #0 !dbg !20 {
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
  %call = call i8* @__strcpy_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef %7) #5, !dbg !50
  %8 = load i8*, i8** %data, align 8, !dbg !51
  call void @printLine(i8* noundef %8), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* noundef null), !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 noundef %conv), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05_good(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05_bad(), !dbg !73
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  %0 = alloca i8, i64 50, align 16, !dbg !81
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %1 = alloca i8, i64 100, align 16, !dbg !84
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !83
  %2 = load i32, i32* @staticFalse, align 4, !dbg !85
  %tobool = icmp ne i32 %2, 0, !dbg !85
  br i1 %tobool, label %if.then, label %if.else, !dbg !87

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !88
  br label %if.end, !dbg !90

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !91
  store i8* %3, i8** %data, align 8, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !94
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !94
  store i8 0, i8* %arrayidx, align 1, !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !96, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx1, align 1, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !102
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !102
  %call = call i8* @__strcpy_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef %7) #5, !dbg !102
  %8 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* noundef %8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 50, align 16, !dbg !111
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %1 = alloca i8, i64 100, align 16, !dbg !114
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !113
  %2 = load i32, i32* @staticTrue, align 4, !dbg !115
  %tobool = icmp ne i32 %2, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !118
  store i8* %3, i8** %data, align 8, !dbg !120
  %4 = load i8*, i8** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !127
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx1, align 1, !dbg !129
  %5 = load i8*, i8** %data, align 8, !dbg !130
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !130
  %6 = load i8*, i8** %data, align 8, !dbg !130
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !130
  %call = call i8* @__strcpy_chk(i8* noundef %5, i8* noundef %arraydecay2, i64 noundef %7) #5, !dbg !130
  %8 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* noundef %8), !dbg !132
  ret void, !dbg !133
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
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !11, line: 26, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05_bad", scope: !11, file: !11, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
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
!51 = !DILocation(line: 48, column: 19, scope: !42)
!52 = !DILocation(line: 48, column: 9, scope: !42)
!53 = !DILocation(line: 50, column: 1, scope: !20)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_alloca_cpy_05_good", scope: !11, file: !11, line: 105, type: !21, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!55 = !DILocation(line: 107, column: 5, scope: !54)
!56 = !DILocation(line: 108, column: 5, scope: !54)
!57 = !DILocation(line: 109, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 121, type: !59, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!59 = !DISubroutineType(types: !60)
!60 = !{!12, !12, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !11, line: 121, type: !12)
!63 = !DILocation(line: 121, column: 14, scope: !58)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !11, line: 121, type: !61)
!65 = !DILocation(line: 121, column: 27, scope: !58)
!66 = !DILocation(line: 124, column: 22, scope: !58)
!67 = !DILocation(line: 124, column: 12, scope: !58)
!68 = !DILocation(line: 124, column: 5, scope: !58)
!69 = !DILocation(line: 126, column: 5, scope: !58)
!70 = !DILocation(line: 127, column: 5, scope: !58)
!71 = !DILocation(line: 128, column: 5, scope: !58)
!72 = !DILocation(line: 131, column: 5, scope: !58)
!73 = !DILocation(line: 132, column: 5, scope: !58)
!74 = !DILocation(line: 133, column: 5, scope: !58)
!75 = !DILocation(line: 135, column: 5, scope: !58)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 57, type: !21, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!77 = !DILocalVariable(name: "data", scope: !76, file: !11, line: 59, type: !5)
!78 = !DILocation(line: 59, column: 12, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !11, line: 60, type: !5)
!80 = !DILocation(line: 60, column: 12, scope: !76)
!81 = !DILocation(line: 60, column: 36, scope: !76)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !11, line: 61, type: !5)
!83 = !DILocation(line: 61, column: 12, scope: !76)
!84 = !DILocation(line: 61, column: 37, scope: !76)
!85 = !DILocation(line: 62, column: 8, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !11, line: 62, column: 8)
!87 = !DILocation(line: 62, column: 8, scope: !76)
!88 = !DILocation(line: 65, column: 9, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !11, line: 63, column: 5)
!90 = !DILocation(line: 66, column: 5, scope: !89)
!91 = !DILocation(line: 70, column: 16, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !11, line: 68, column: 5)
!93 = !DILocation(line: 70, column: 14, scope: !92)
!94 = !DILocation(line: 71, column: 9, scope: !92)
!95 = !DILocation(line: 71, column: 17, scope: !92)
!96 = !DILocalVariable(name: "source", scope: !97, file: !11, line: 74, type: !43)
!97 = distinct !DILexicalBlock(scope: !76, file: !11, line: 73, column: 5)
!98 = !DILocation(line: 74, column: 14, scope: !97)
!99 = !DILocation(line: 75, column: 9, scope: !97)
!100 = !DILocation(line: 76, column: 9, scope: !97)
!101 = !DILocation(line: 76, column: 23, scope: !97)
!102 = !DILocation(line: 78, column: 9, scope: !97)
!103 = !DILocation(line: 79, column: 19, scope: !97)
!104 = !DILocation(line: 79, column: 9, scope: !97)
!105 = !DILocation(line: 81, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 84, type: !21, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!107 = !DILocalVariable(name: "data", scope: !106, file: !11, line: 86, type: !5)
!108 = !DILocation(line: 86, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !11, line: 87, type: !5)
!110 = !DILocation(line: 87, column: 12, scope: !106)
!111 = !DILocation(line: 87, column: 36, scope: !106)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !11, line: 88, type: !5)
!113 = !DILocation(line: 88, column: 12, scope: !106)
!114 = !DILocation(line: 88, column: 37, scope: !106)
!115 = !DILocation(line: 89, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !106, file: !11, line: 89, column: 8)
!117 = !DILocation(line: 89, column: 8, scope: !106)
!118 = !DILocation(line: 92, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !11, line: 90, column: 5)
!120 = !DILocation(line: 92, column: 14, scope: !119)
!121 = !DILocation(line: 93, column: 9, scope: !119)
!122 = !DILocation(line: 93, column: 17, scope: !119)
!123 = !DILocation(line: 94, column: 5, scope: !119)
!124 = !DILocalVariable(name: "source", scope: !125, file: !11, line: 96, type: !43)
!125 = distinct !DILexicalBlock(scope: !106, file: !11, line: 95, column: 5)
!126 = !DILocation(line: 96, column: 14, scope: !125)
!127 = !DILocation(line: 97, column: 9, scope: !125)
!128 = !DILocation(line: 98, column: 9, scope: !125)
!129 = !DILocation(line: 98, column: 23, scope: !125)
!130 = !DILocation(line: 100, column: 9, scope: !125)
!131 = !DILocation(line: 101, column: 19, scope: !125)
!132 = !DILocation(line: 101, column: 9, scope: !125)
!133 = !DILocation(line: 103, column: 1, scope: !106)
