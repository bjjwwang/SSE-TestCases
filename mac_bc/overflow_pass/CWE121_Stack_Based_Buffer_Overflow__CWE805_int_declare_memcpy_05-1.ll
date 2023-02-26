; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !7
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !42, metadata !DIExpression()), !dbg !44
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !44
  %2 = load i32*, i32** %data, align 8, !dbg !45
  %3 = bitcast i32* %2 to i8*, !dbg !45
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !45
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %6 = bitcast i32* %5 to i8*, !dbg !45
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !45
  %call = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !45
  %8 = load i32*, i32** %data, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !46
  %9 = load i32, i32* %arrayidx, align 4, !dbg !46
  call void @printIntLine(i32 noundef %9), !dbg !47
  ret void, !dbg !48
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05_good() #0 !dbg !49 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05_bad(), !dbg !70
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
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i32, i32* @staticFalse, align 4, !dbg !80
  %tobool = icmp ne i32 %0, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !91
  %2 = load i32*, i32** %data, align 8, !dbg !92
  %3 = bitcast i32* %2 to i8*, !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !92
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !92
  %5 = load i32*, i32** %data, align 8, !dbg !92
  %6 = bitcast i32* %5 to i8*, !dbg !92
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !92
  %call = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !92
  %8 = load i32*, i32** %data, align 8, !dbg !93
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !93
  %9 = load i32, i32* %arrayidx, align 4, !dbg !93
  call void @printIntLine(i32 noundef %9), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* @staticTrue, align 4, !dbg !103
  %tobool = icmp ne i32 %0, 0, !dbg !103
  br i1 %tobool, label %if.then, label %if.end, !dbg !105

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store i32* %arraydecay, i32** %data, align 8, !dbg !108
  br label %if.end, !dbg !109

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !112
  %2 = load i32*, i32** %data, align 8, !dbg !113
  %3 = bitcast i32* %2 to i8*, !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !113
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !113
  %5 = load i32*, i32** %data, align 8, !dbg !113
  %6 = bitcast i32* %5 to i8*, !dbg !113
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !113
  %call = call i8* @__memcpy_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !113
  %8 = load i32*, i32** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !114
  %9 = load i32, i32* %arrayidx, align 4, !dbg !114
  call void @printIntLine(i32 noundef %9), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !9, line: 23, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !9, line: 24, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05_bad", scope: !9, file: !9, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 30, type: !23)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!24 = !DILocation(line: 30, column: 11, scope: !18)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 31, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 1600, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 31, column: 9, scope: !18)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 32, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 3200, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 32, column: 9, scope: !18)
!35 = !DILocation(line: 33, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !18, file: !9, line: 33, column: 8)
!37 = !DILocation(line: 33, column: 8, scope: !18)
!38 = !DILocation(line: 37, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !9, line: 34, column: 5)
!40 = !DILocation(line: 37, column: 14, scope: !39)
!41 = !DILocation(line: 38, column: 5, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !9, line: 40, type: !31)
!43 = distinct !DILexicalBlock(scope: !18, file: !9, line: 39, column: 5)
!44 = !DILocation(line: 40, column: 13, scope: !43)
!45 = !DILocation(line: 42, column: 9, scope: !43)
!46 = !DILocation(line: 43, column: 22, scope: !43)
!47 = !DILocation(line: 43, column: 9, scope: !43)
!48 = !DILocation(line: 45, column: 1, scope: !18)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memcpy_05_good", scope: !9, file: !9, line: 94, type: !19, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!50 = !DILocation(line: 96, column: 5, scope: !49)
!51 = !DILocation(line: 97, column: 5, scope: !49)
!52 = !DILocation(line: 98, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 110, type: !54, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!54 = !DISubroutineType(types: !55)
!55 = !{!10, !10, !56}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !9, line: 110, type: !10)
!60 = !DILocation(line: 110, column: 14, scope: !53)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !9, line: 110, type: !56)
!62 = !DILocation(line: 110, column: 27, scope: !53)
!63 = !DILocation(line: 113, column: 22, scope: !53)
!64 = !DILocation(line: 113, column: 12, scope: !53)
!65 = !DILocation(line: 113, column: 5, scope: !53)
!66 = !DILocation(line: 115, column: 5, scope: !53)
!67 = !DILocation(line: 116, column: 5, scope: !53)
!68 = !DILocation(line: 117, column: 5, scope: !53)
!69 = !DILocation(line: 120, column: 5, scope: !53)
!70 = !DILocation(line: 121, column: 5, scope: !53)
!71 = !DILocation(line: 122, column: 5, scope: !53)
!72 = !DILocation(line: 124, column: 5, scope: !53)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 52, type: !19, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!74 = !DILocalVariable(name: "data", scope: !73, file: !9, line: 54, type: !23)
!75 = !DILocation(line: 54, column: 11, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !9, line: 55, type: !26)
!77 = !DILocation(line: 55, column: 9, scope: !73)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !9, line: 56, type: !31)
!79 = !DILocation(line: 56, column: 9, scope: !73)
!80 = !DILocation(line: 57, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !9, line: 57, column: 8)
!82 = !DILocation(line: 57, column: 8, scope: !73)
!83 = !DILocation(line: 60, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !9, line: 58, column: 5)
!85 = !DILocation(line: 61, column: 5, scope: !84)
!86 = !DILocation(line: 65, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !9, line: 63, column: 5)
!88 = !DILocation(line: 65, column: 14, scope: !87)
!89 = !DILocalVariable(name: "source", scope: !90, file: !9, line: 68, type: !31)
!90 = distinct !DILexicalBlock(scope: !73, file: !9, line: 67, column: 5)
!91 = !DILocation(line: 68, column: 13, scope: !90)
!92 = !DILocation(line: 70, column: 9, scope: !90)
!93 = !DILocation(line: 71, column: 22, scope: !90)
!94 = !DILocation(line: 71, column: 9, scope: !90)
!95 = !DILocation(line: 73, column: 1, scope: !73)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 76, type: !19, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!97 = !DILocalVariable(name: "data", scope: !96, file: !9, line: 78, type: !23)
!98 = !DILocation(line: 78, column: 11, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !9, line: 79, type: !26)
!100 = !DILocation(line: 79, column: 9, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !9, line: 80, type: !31)
!102 = !DILocation(line: 80, column: 9, scope: !96)
!103 = !DILocation(line: 81, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !9, line: 81, column: 8)
!105 = !DILocation(line: 81, column: 8, scope: !96)
!106 = !DILocation(line: 84, column: 16, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !9, line: 82, column: 5)
!108 = !DILocation(line: 84, column: 14, scope: !107)
!109 = !DILocation(line: 85, column: 5, scope: !107)
!110 = !DILocalVariable(name: "source", scope: !111, file: !9, line: 87, type: !31)
!111 = distinct !DILexicalBlock(scope: !96, file: !9, line: 86, column: 5)
!112 = !DILocation(line: 87, column: 13, scope: !111)
!113 = !DILocation(line: 89, column: 9, scope: !111)
!114 = !DILocation(line: 90, column: 22, scope: !111)
!115 = !DILocation(line: 90, column: 9, scope: !111)
!116 = !DILocation(line: 92, column: 1, scope: !96)
