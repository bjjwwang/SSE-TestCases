; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  %3 = bitcast i32* %2 to i8*, !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !41
  %5 = load i32*, i32** %data, align 8, !dbg !41
  %6 = bitcast i32* %5 to i8*, !dbg !41
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !41
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !41
  %8 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !42
  %9 = load i32, i32* %arrayidx, align 4, !dbg !42
  call void @printIntLine(i32 noundef %9), !dbg !43
  ret void, !dbg !44
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !76
  %cmp = icmp ne i32 %0, 5, !dbg !78
  br i1 %cmp, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !80
  br label %if.end, !dbg !82

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !83
  store i32* %arraydecay, i32** %data, align 8, !dbg !85
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !88
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !88
  %2 = load i32*, i32** %data, align 8, !dbg !89
  %3 = bitcast i32* %2 to i8*, !dbg !89
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !89
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !89
  %5 = load i32*, i32** %data, align 8, !dbg !89
  %6 = bitcast i32* %5 to i8*, !dbg !89
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !89
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !89
  %8 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !90
  %9 = load i32, i32* %arrayidx, align 4, !dbg !90
  call void @printIntLine(i32 noundef %9), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !100
  %cmp = icmp eq i32 %0, 5, !dbg !102
  br i1 %cmp, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i32* %arraydecay, i32** %data, align 8, !dbg !106
  br label %if.end, !dbg !107

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !110
  %2 = load i32*, i32** %data, align 8, !dbg !111
  %3 = bitcast i32* %2 to i8*, !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !111
  %5 = load i32*, i32** %data, align 8, !dbg !111
  %6 = bitcast i32* %5 to i8*, !dbg !111
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !111
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !111
  %8 = load i32*, i32** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !112
  %9 = load i32, i32* %arrayidx, align 4, !dbg !112
  call void @printIntLine(i32 noundef %9), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 23, column: 11, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 24, column: 9, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 25, column: 9, scope: !11)
!30 = !DILocation(line: 26, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!32 = !DILocation(line: 26, column: 25, scope: !31)
!33 = !DILocation(line: 26, column: 8, scope: !11)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 27, column: 5)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 5, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 33, type: !26)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!40 = !DILocation(line: 33, column: 13, scope: !39)
!41 = !DILocation(line: 35, column: 9, scope: !39)
!42 = !DILocation(line: 36, column: 22, scope: !39)
!43 = !DILocation(line: 36, column: 9, scope: !39)
!44 = !DILocation(line: 38, column: 1, scope: !11)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_13_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!46 = !DILocation(line: 89, column: 5, scope: !45)
!47 = !DILocation(line: 90, column: 5, scope: !45)
!48 = !DILocation(line: 91, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !50, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DISubroutineType(types: !51)
!51 = !{!18, !18, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !12, line: 103, type: !18)
!56 = !DILocation(line: 103, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !12, line: 103, type: !52)
!58 = !DILocation(line: 103, column: 27, scope: !49)
!59 = !DILocation(line: 106, column: 22, scope: !49)
!60 = !DILocation(line: 106, column: 12, scope: !49)
!61 = !DILocation(line: 106, column: 5, scope: !49)
!62 = !DILocation(line: 108, column: 5, scope: !49)
!63 = !DILocation(line: 109, column: 5, scope: !49)
!64 = !DILocation(line: 110, column: 5, scope: !49)
!65 = !DILocation(line: 113, column: 5, scope: !49)
!66 = !DILocation(line: 114, column: 5, scope: !49)
!67 = !DILocation(line: 115, column: 5, scope: !49)
!68 = !DILocation(line: 117, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 47, type: !17)
!71 = !DILocation(line: 47, column: 11, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !12, line: 48, type: !21)
!73 = !DILocation(line: 48, column: 9, scope: !69)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !12, line: 49, type: !26)
!75 = !DILocation(line: 49, column: 9, scope: !69)
!76 = !DILocation(line: 50, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !69, file: !12, line: 50, column: 8)
!78 = !DILocation(line: 50, column: 25, scope: !77)
!79 = !DILocation(line: 50, column: 8, scope: !69)
!80 = !DILocation(line: 53, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !12, line: 51, column: 5)
!82 = !DILocation(line: 54, column: 5, scope: !81)
!83 = !DILocation(line: 58, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !12, line: 56, column: 5)
!85 = !DILocation(line: 58, column: 14, scope: !84)
!86 = !DILocalVariable(name: "source", scope: !87, file: !12, line: 61, type: !26)
!87 = distinct !DILexicalBlock(scope: !69, file: !12, line: 60, column: 5)
!88 = !DILocation(line: 61, column: 13, scope: !87)
!89 = !DILocation(line: 63, column: 9, scope: !87)
!90 = !DILocation(line: 64, column: 22, scope: !87)
!91 = !DILocation(line: 64, column: 9, scope: !87)
!92 = !DILocation(line: 66, column: 1, scope: !69)
!93 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 71, type: !17)
!95 = !DILocation(line: 71, column: 11, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 72, type: !21)
!97 = !DILocation(line: 72, column: 9, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 73, type: !26)
!99 = !DILocation(line: 73, column: 9, scope: !93)
!100 = !DILocation(line: 74, column: 8, scope: !101)
!101 = distinct !DILexicalBlock(scope: !93, file: !12, line: 74, column: 8)
!102 = !DILocation(line: 74, column: 25, scope: !101)
!103 = !DILocation(line: 74, column: 8, scope: !93)
!104 = !DILocation(line: 77, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !12, line: 75, column: 5)
!106 = !DILocation(line: 77, column: 14, scope: !105)
!107 = !DILocation(line: 78, column: 5, scope: !105)
!108 = !DILocalVariable(name: "source", scope: !109, file: !12, line: 80, type: !26)
!109 = distinct !DILexicalBlock(scope: !93, file: !12, line: 79, column: 5)
!110 = !DILocation(line: 80, column: 13, scope: !109)
!111 = !DILocation(line: 82, column: 9, scope: !109)
!112 = !DILocation(line: 83, column: 22, scope: !109)
!113 = !DILocation(line: 83, column: 9, scope: !109)
!114 = !DILocation(line: 85, column: 1, scope: !93)
