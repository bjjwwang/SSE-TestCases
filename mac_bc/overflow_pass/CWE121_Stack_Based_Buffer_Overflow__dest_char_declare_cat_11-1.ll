; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %call = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !42
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !43
  store i8 0, i8* %arrayidx2, align 1, !dbg !44
  %1 = load i8*, i8** %data, align 8, !dbg !45
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  %2 = load i8*, i8** %data, align 8, !dbg !45
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !45
  %call4 = call i8* @__strcat_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef %3) #5, !dbg !45
  %4 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* noundef %4), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11_good() #0 !dbg !49 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i32 (...) @globalReturnsFalse(), !dbg !79
  %tobool = icmp ne i32 %call, 0, !dbg !79
  br i1 %tobool, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !85
  store i8* %arraydecay, i8** %data, align 8, !dbg !87
  %0 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !93
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !94
  store i8 0, i8* %arrayidx2, align 1, !dbg !95
  %1 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !96
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !96
  %call4 = call i8* @__strcat_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef %3) #5, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* noundef %4), !dbg !98
  ret void, !dbg !99
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i32 (...) @globalReturnsTrue(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx2, align 1, !dbg !121
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !122
  %2 = load i8*, i8** %data, align 8, !dbg !122
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !122
  %call4 = call i8* @__strcat_chk(i8* noundef %1, i8* noundef %arraydecay3, i64 noundef %3) #5, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* noundef %4), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 10, scope: !11)
!30 = !DILocation(line: 28, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 8)
!32 = !DILocation(line: 28, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 14, scope: !34)
!36 = !DILocation(line: 33, column: 9, scope: !34)
!37 = !DILocation(line: 33, column: 17, scope: !34)
!38 = !DILocation(line: 34, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 36, type: !26)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!41 = !DILocation(line: 36, column: 14, scope: !40)
!42 = !DILocation(line: 37, column: 9, scope: !40)
!43 = !DILocation(line: 38, column: 9, scope: !40)
!44 = !DILocation(line: 38, column: 23, scope: !40)
!45 = !DILocation(line: 40, column: 9, scope: !40)
!46 = !DILocation(line: 41, column: 19, scope: !40)
!47 = !DILocation(line: 41, column: 9, scope: !40)
!48 = !DILocation(line: 43, column: 1, scope: !11)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_11_good", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!50 = !DILocation(line: 100, column: 5, scope: !49)
!51 = !DILocation(line: 101, column: 5, scope: !49)
!52 = !DILocation(line: 102, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 114, type: !54, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !12, line: 114, type: !56)
!59 = !DILocation(line: 114, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !12, line: 114, type: !57)
!61 = !DILocation(line: 114, column: 27, scope: !53)
!62 = !DILocation(line: 117, column: 22, scope: !53)
!63 = !DILocation(line: 117, column: 12, scope: !53)
!64 = !DILocation(line: 117, column: 5, scope: !53)
!65 = !DILocation(line: 119, column: 5, scope: !53)
!66 = !DILocation(line: 120, column: 5, scope: !53)
!67 = !DILocation(line: 121, column: 5, scope: !53)
!68 = !DILocation(line: 124, column: 5, scope: !53)
!69 = !DILocation(line: 125, column: 5, scope: !53)
!70 = !DILocation(line: 126, column: 5, scope: !53)
!71 = !DILocation(line: 128, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!73 = !DILocalVariable(name: "data", scope: !72, file: !12, line: 52, type: !17)
!74 = !DILocation(line: 52, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !12, line: 53, type: !21)
!76 = !DILocation(line: 53, column: 10, scope: !72)
!77 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !12, line: 54, type: !26)
!78 = !DILocation(line: 54, column: 10, scope: !72)
!79 = !DILocation(line: 55, column: 8, scope: !80)
!80 = distinct !DILexicalBlock(scope: !72, file: !12, line: 55, column: 8)
!81 = !DILocation(line: 55, column: 8, scope: !72)
!82 = !DILocation(line: 58, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !12, line: 56, column: 5)
!84 = !DILocation(line: 59, column: 5, scope: !83)
!85 = !DILocation(line: 63, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !80, file: !12, line: 61, column: 5)
!87 = !DILocation(line: 63, column: 14, scope: !86)
!88 = !DILocation(line: 64, column: 9, scope: !86)
!89 = !DILocation(line: 64, column: 17, scope: !86)
!90 = !DILocalVariable(name: "source", scope: !91, file: !12, line: 67, type: !26)
!91 = distinct !DILexicalBlock(scope: !72, file: !12, line: 66, column: 5)
!92 = !DILocation(line: 67, column: 14, scope: !91)
!93 = !DILocation(line: 68, column: 9, scope: !91)
!94 = !DILocation(line: 69, column: 9, scope: !91)
!95 = !DILocation(line: 69, column: 23, scope: !91)
!96 = !DILocation(line: 71, column: 9, scope: !91)
!97 = !DILocation(line: 72, column: 19, scope: !91)
!98 = !DILocation(line: 72, column: 9, scope: !91)
!99 = !DILocation(line: 74, column: 1, scope: !72)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 77, type: !13, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 79, type: !17)
!102 = !DILocation(line: 79, column: 12, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 80, type: !21)
!104 = !DILocation(line: 80, column: 10, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 81, type: !26)
!106 = !DILocation(line: 81, column: 10, scope: !100)
!107 = !DILocation(line: 82, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 82, column: 8)
!109 = !DILocation(line: 82, column: 8, scope: !100)
!110 = !DILocation(line: 85, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 83, column: 5)
!112 = !DILocation(line: 85, column: 14, scope: !111)
!113 = !DILocation(line: 86, column: 9, scope: !111)
!114 = !DILocation(line: 86, column: 17, scope: !111)
!115 = !DILocation(line: 87, column: 5, scope: !111)
!116 = !DILocalVariable(name: "source", scope: !117, file: !12, line: 89, type: !26)
!117 = distinct !DILexicalBlock(scope: !100, file: !12, line: 88, column: 5)
!118 = !DILocation(line: 89, column: 14, scope: !117)
!119 = !DILocation(line: 90, column: 9, scope: !117)
!120 = !DILocation(line: 91, column: 9, scope: !117)
!121 = !DILocation(line: 91, column: 23, scope: !117)
!122 = !DILocation(line: 93, column: 9, scope: !117)
!123 = !DILocation(line: 94, column: 19, scope: !117)
!124 = !DILocation(line: 94, column: 9, scope: !117)
!125 = !DILocation(line: 96, column: 1, scope: !100)
