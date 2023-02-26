; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalTrue = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external global i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* @globalTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %0, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !39
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  %3 = bitcast i32* %2 to i8*, !dbg !40
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !40
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !40
  %5 = load i32*, i32** %data, align 8, !dbg !40
  %6 = bitcast i32* %5 to i8*, !dbg !40
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !40
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !40
  %8 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !41
  %9 = load i32, i32* %arrayidx, align 4, !dbg !41
  call void @printIntLine(i32 noundef %9), !dbg !42
  ret void, !dbg !43
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10_good() #0 !dbg !44 {
entry:
  call void @goodG2B1(), !dbg !45
  call void @goodG2B2(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* noundef null), !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 noundef %conv), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10_bad(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !68 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i32, i32* @globalFalse, align 4, !dbg !75
  %tobool = icmp ne i32 %0, 0, !dbg !75
  br i1 %tobool, label %if.then, label %if.else, !dbg !77

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  br label %if.end, !dbg !80

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !81
  store i32* %arraydecay, i32** %data, align 8, !dbg !83
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !84, metadata !DIExpression()), !dbg !86
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !86
  %2 = load i32*, i32** %data, align 8, !dbg !87
  %3 = bitcast i32* %2 to i8*, !dbg !87
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !87
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !87
  %5 = load i32*, i32** %data, align 8, !dbg !87
  %6 = bitcast i32* %5 to i8*, !dbg !87
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !87
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !87
  %8 = load i32*, i32** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !88
  %9 = load i32, i32* %arrayidx, align 4, !dbg !88
  call void @printIntLine(i32 noundef %9), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i32, i32* @globalTrue, align 4, !dbg !98
  %tobool = icmp ne i32 %0, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !101
  store i32* %arraydecay, i32** %data, align 8, !dbg !103
  br label %if.end, !dbg !104

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !105, metadata !DIExpression()), !dbg !107
  %1 = bitcast [100 x i32]* %source to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 400, i1 false), !dbg !107
  %2 = load i32*, i32** %data, align 8, !dbg !108
  %3 = bitcast i32* %2 to i8*, !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !108
  %4 = bitcast i32* %arraydecay1 to i8*, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !108
  %6 = bitcast i32* %5 to i8*, !dbg !108
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !108
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 400, i64 noundef %7) #5, !dbg !108
  %8 = load i32*, i32** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i32, i32* %8, i64 0, !dbg !109
  %9 = load i32, i32* %arrayidx, align 4, !dbg !109
  call void @printIntLine(i32 noundef %9), !dbg !110
  ret void, !dbg !111
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 26, column: 8, scope: !11)
!33 = !DILocation(line: 30, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 27, column: 5)
!35 = !DILocation(line: 30, column: 14, scope: !34)
!36 = !DILocation(line: 31, column: 5, scope: !34)
!37 = !DILocalVariable(name: "source", scope: !38, file: !12, line: 33, type: !26)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!39 = !DILocation(line: 33, column: 13, scope: !38)
!40 = !DILocation(line: 35, column: 9, scope: !38)
!41 = !DILocation(line: 36, column: 22, scope: !38)
!42 = !DILocation(line: 36, column: 9, scope: !38)
!43 = !DILocation(line: 38, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int_declare_memmove_10_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!45 = !DILocation(line: 89, column: 5, scope: !44)
!46 = !DILocation(line: 90, column: 5, scope: !44)
!47 = !DILocation(line: 91, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !49, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!49 = !DISubroutineType(types: !50)
!50 = !{!18, !18, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 103, type: !18)
!55 = !DILocation(line: 103, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 103, type: !51)
!57 = !DILocation(line: 103, column: 27, scope: !48)
!58 = !DILocation(line: 106, column: 22, scope: !48)
!59 = !DILocation(line: 106, column: 12, scope: !48)
!60 = !DILocation(line: 106, column: 5, scope: !48)
!61 = !DILocation(line: 108, column: 5, scope: !48)
!62 = !DILocation(line: 109, column: 5, scope: !48)
!63 = !DILocation(line: 110, column: 5, scope: !48)
!64 = !DILocation(line: 113, column: 5, scope: !48)
!65 = !DILocation(line: 114, column: 5, scope: !48)
!66 = !DILocation(line: 115, column: 5, scope: !48)
!67 = !DILocation(line: 117, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DILocalVariable(name: "data", scope: !68, file: !12, line: 47, type: !17)
!70 = !DILocation(line: 47, column: 11, scope: !68)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !68, file: !12, line: 48, type: !21)
!72 = !DILocation(line: 48, column: 9, scope: !68)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !68, file: !12, line: 49, type: !26)
!74 = !DILocation(line: 49, column: 9, scope: !68)
!75 = !DILocation(line: 50, column: 8, scope: !76)
!76 = distinct !DILexicalBlock(scope: !68, file: !12, line: 50, column: 8)
!77 = !DILocation(line: 50, column: 8, scope: !68)
!78 = !DILocation(line: 53, column: 9, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !12, line: 51, column: 5)
!80 = !DILocation(line: 54, column: 5, scope: !79)
!81 = !DILocation(line: 58, column: 16, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !12, line: 56, column: 5)
!83 = !DILocation(line: 58, column: 14, scope: !82)
!84 = !DILocalVariable(name: "source", scope: !85, file: !12, line: 61, type: !26)
!85 = distinct !DILexicalBlock(scope: !68, file: !12, line: 60, column: 5)
!86 = !DILocation(line: 61, column: 13, scope: !85)
!87 = !DILocation(line: 63, column: 9, scope: !85)
!88 = !DILocation(line: 64, column: 22, scope: !85)
!89 = !DILocation(line: 64, column: 9, scope: !85)
!90 = !DILocation(line: 66, column: 1, scope: !68)
!91 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 71, type: !17)
!93 = !DILocation(line: 71, column: 11, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 72, type: !21)
!95 = !DILocation(line: 72, column: 9, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 73, type: !26)
!97 = !DILocation(line: 73, column: 9, scope: !91)
!98 = !DILocation(line: 74, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !91, file: !12, line: 74, column: 8)
!100 = !DILocation(line: 74, column: 8, scope: !91)
!101 = !DILocation(line: 77, column: 16, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 75, column: 5)
!103 = !DILocation(line: 77, column: 14, scope: !102)
!104 = !DILocation(line: 78, column: 5, scope: !102)
!105 = !DILocalVariable(name: "source", scope: !106, file: !12, line: 80, type: !26)
!106 = distinct !DILexicalBlock(scope: !91, file: !12, line: 79, column: 5)
!107 = !DILocation(line: 80, column: 13, scope: !106)
!108 = !DILocation(line: 82, column: 9, scope: !106)
!109 = !DILocation(line: 83, column: 22, scope: !106)
!110 = !DILocation(line: 83, column: 9, scope: !106)
!111 = !DILocation(line: 85, column: 1, scope: !91)
