; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !27
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !27
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !32, metadata !DIExpression()), !dbg !37
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !37
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !37
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !38
  %5 = load i8*, i8** %data, align 8, !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !38
  %call2 = call i64 @strlen(i8* noundef %6), !dbg !38
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %5, i64 noundef %call2, i64 noundef 50) #5, !dbg !38
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !39
  store i8 0, i8* %arrayidx4, align 1, !dbg !40
  %7 = load i8*, i8** %data, align 8, !dbg !41
  call void @printLine(i8* noundef %7), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_good() #0 !dbg !44 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !72
  store i8* %arraydecay, i8** %data, align 8, !dbg !73
  %0 = load i8*, i8** %data, align 8, !dbg !74
  %1 = load i8*, i8** %data, align 8, !dbg !74
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !74
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !74
  %3 = load i8*, i8** %data, align 8, !dbg !77
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !77
  store i8 0, i8* %arrayidx, align 1, !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !79, metadata !DIExpression()), !dbg !81
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !81
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !82
  %5 = load i8*, i8** %data, align 8, !dbg !82
  %6 = load i8*, i8** %data, align 8, !dbg !82
  %call2 = call i64 @strlen(i8* noundef %6), !dbg !82
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %5, i64 noundef %call2, i64 noundef 50) #5, !dbg !82
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !83
  store i8 0, i8* %arrayidx4, align 1, !dbg !84
  %7 = load i8*, i8** %data, align 8, !dbg !85
  call void @printLine(i8* noundef %7), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !88 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !93
  store i8* %arraydecay, i8** %data, align 8, !dbg !94
  %0 = load i8*, i8** %data, align 8, !dbg !95
  %1 = load i8*, i8** %data, align 8, !dbg !95
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !95
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !95
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !100, metadata !DIExpression()), !dbg !102
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !102
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !103
  %5 = load i8*, i8** %data, align 8, !dbg !103
  %6 = load i8*, i8** %data, align 8, !dbg !103
  %call2 = call i64 @strlen(i8* noundef %6), !dbg !103
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay1, i8* noundef %5, i64 noundef %call2, i64 noundef 50) #5, !dbg !103
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !104
  store i8 0, i8* %arrayidx4, align 1, !dbg !105
  %7 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* noundef %7), !dbg !107
  ret void, !dbg !108
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_bad", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 32, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 32, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 33, column: 10, scope: !11)
!25 = !DILocation(line: 34, column: 12, scope: !11)
!26 = !DILocation(line: 34, column: 10, scope: !11)
!27 = !DILocation(line: 38, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !12, line: 36, column: 5)
!29 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 8)
!30 = !DILocation(line: 39, column: 9, scope: !28)
!31 = !DILocation(line: 39, column: 21, scope: !28)
!32 = !DILocalVariable(name: "dest", scope: !33, file: !12, line: 42, type: !34)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 41, column: 5)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 42, column: 14, scope: !33)
!38 = !DILocation(line: 44, column: 9, scope: !33)
!39 = !DILocation(line: 45, column: 9, scope: !33)
!40 = !DILocation(line: 45, column: 20, scope: !33)
!41 = !DILocation(line: 46, column: 19, scope: !33)
!42 = !DILocation(line: 46, column: 9, scope: !33)
!43 = !DILocation(line: 48, column: 1, scope: !11)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncat_04_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!45 = !DILocation(line: 103, column: 5, scope: !44)
!46 = !DILocation(line: 104, column: 5, scope: !44)
!47 = !DILocation(line: 105, column: 1, scope: !44)
!48 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !49, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !12, line: 117, type: !51)
!54 = !DILocation(line: 117, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !12, line: 117, type: !52)
!56 = !DILocation(line: 117, column: 27, scope: !48)
!57 = !DILocation(line: 120, column: 22, scope: !48)
!58 = !DILocation(line: 120, column: 12, scope: !48)
!59 = !DILocation(line: 120, column: 5, scope: !48)
!60 = !DILocation(line: 122, column: 5, scope: !48)
!61 = !DILocation(line: 123, column: 5, scope: !48)
!62 = !DILocation(line: 124, column: 5, scope: !48)
!63 = !DILocation(line: 127, column: 5, scope: !48)
!64 = !DILocation(line: 128, column: 5, scope: !48)
!65 = !DILocation(line: 129, column: 5, scope: !48)
!66 = !DILocation(line: 131, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!68 = !DILocalVariable(name: "data", scope: !67, file: !12, line: 57, type: !17)
!69 = !DILocation(line: 57, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !12, line: 58, type: !21)
!71 = !DILocation(line: 58, column: 10, scope: !67)
!72 = !DILocation(line: 59, column: 12, scope: !67)
!73 = !DILocation(line: 59, column: 10, scope: !67)
!74 = !DILocation(line: 68, column: 9, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !12, line: 66, column: 5)
!76 = distinct !DILexicalBlock(scope: !67, file: !12, line: 60, column: 8)
!77 = !DILocation(line: 69, column: 9, scope: !75)
!78 = !DILocation(line: 69, column: 20, scope: !75)
!79 = !DILocalVariable(name: "dest", scope: !80, file: !12, line: 72, type: !34)
!80 = distinct !DILexicalBlock(scope: !67, file: !12, line: 71, column: 5)
!81 = !DILocation(line: 72, column: 14, scope: !80)
!82 = !DILocation(line: 74, column: 9, scope: !80)
!83 = !DILocation(line: 75, column: 9, scope: !80)
!84 = !DILocation(line: 75, column: 20, scope: !80)
!85 = !DILocation(line: 76, column: 19, scope: !80)
!86 = !DILocation(line: 76, column: 9, scope: !80)
!87 = !DILocation(line: 78, column: 1, scope: !67)
!88 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!89 = !DILocalVariable(name: "data", scope: !88, file: !12, line: 83, type: !17)
!90 = !DILocation(line: 83, column: 12, scope: !88)
!91 = !DILocalVariable(name: "dataBuffer", scope: !88, file: !12, line: 84, type: !21)
!92 = !DILocation(line: 84, column: 10, scope: !88)
!93 = !DILocation(line: 85, column: 12, scope: !88)
!94 = !DILocation(line: 85, column: 10, scope: !88)
!95 = !DILocation(line: 89, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !12, line: 87, column: 5)
!97 = distinct !DILexicalBlock(scope: !88, file: !12, line: 86, column: 8)
!98 = !DILocation(line: 90, column: 9, scope: !96)
!99 = !DILocation(line: 90, column: 20, scope: !96)
!100 = !DILocalVariable(name: "dest", scope: !101, file: !12, line: 93, type: !34)
!101 = distinct !DILexicalBlock(scope: !88, file: !12, line: 92, column: 5)
!102 = !DILocation(line: 93, column: 14, scope: !101)
!103 = !DILocation(line: 95, column: 9, scope: !101)
!104 = !DILocation(line: 96, column: 9, scope: !101)
!105 = !DILocation(line: 96, column: 20, scope: !101)
!106 = !DILocation(line: 97, column: 19, scope: !101)
!107 = !DILocation(line: 97, column: 9, scope: !101)
!108 = !DILocation(line: 99, column: 1, scope: !88)
