; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_goodG2BData = internal global i8* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i8* %arraydecay, i8** %data, align 8, !dbg !36
  %0 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %1 = load i8*, i8** %data, align 8, !dbg !39
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* noundef null), !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 noundef %conv), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_badData, align 8, !dbg !68
  store i8* %0, i8** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !69, metadata !DIExpression()), !dbg !71
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !72
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !72
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  %1 = load i8*, i8** %data, align 8, !dbg !75
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !75
  %2 = load i8*, i8** %data, align 8, !dbg !75
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !75
  %call = call i8* @__strcat_chk(i8* noundef %1, i8* noundef %arraydecay1, i64 noundef %3) #5, !dbg !75
  %4 = load i8*, i8** %data, align 8, !dbg !76
  call void @printLine(i8* noundef %4), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !79 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !80, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !84, metadata !DIExpression()), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  store i8* %arraydecay, i8** %data, align 8, !dbg !87
  %0 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  store i8* %1, i8** @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_goodG2BData, align 8, !dbg !91
  call void @goodG2BSink(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_goodG2BData, align 8, !dbg !97
  store i8* %0, i8** %data, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !101
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !102
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %1 = load i8*, i8** %data, align 8, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !104
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !104
  %call = call i8* @__strcat_chk(i8* noundef %1, i8* noundef %arraydecay1, i64 noundef %3) #5, !dbg !104
  %4 = load i8*, i8** %data, align 8, !dbg !105
  call void @printLine(i8* noundef %4), !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_badData", scope: !2, file: !9, line: 21, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_goodG2BData", scope: !2, file: !9, line: 22, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_bad", scope: !9, file: !9, line: 39, type: !20, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !9, line: 41, type: !10)
!24 = !DILocation(line: 41, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !9, line: 42, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 42, column: 10, scope: !19)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !9, line: 43, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 43, column: 10, scope: !19)
!35 = !DILocation(line: 46, column: 12, scope: !19)
!36 = !DILocation(line: 46, column: 10, scope: !19)
!37 = !DILocation(line: 47, column: 5, scope: !19)
!38 = !DILocation(line: 47, column: 13, scope: !19)
!39 = !DILocation(line: 48, column: 76, scope: !19)
!40 = !DILocation(line: 48, column: 74, scope: !19)
!41 = !DILocation(line: 49, column: 5, scope: !19)
!42 = !DILocation(line: 50, column: 1, scope: !19)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_char_declare_cat_45_good", scope: !9, file: !9, line: 82, type: !20, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!44 = !DILocation(line: 84, column: 5, scope: !43)
!45 = !DILocation(line: 85, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 96, type: !47, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !9, line: 96, type: !49)
!52 = !DILocation(line: 96, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !9, line: 96, type: !50)
!54 = !DILocation(line: 96, column: 27, scope: !46)
!55 = !DILocation(line: 99, column: 22, scope: !46)
!56 = !DILocation(line: 99, column: 12, scope: !46)
!57 = !DILocation(line: 99, column: 5, scope: !46)
!58 = !DILocation(line: 101, column: 5, scope: !46)
!59 = !DILocation(line: 102, column: 5, scope: !46)
!60 = !DILocation(line: 103, column: 5, scope: !46)
!61 = !DILocation(line: 106, column: 5, scope: !46)
!62 = !DILocation(line: 107, column: 5, scope: !46)
!63 = !DILocation(line: 108, column: 5, scope: !46)
!64 = !DILocation(line: 110, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!66 = !DILocalVariable(name: "data", scope: !65, file: !9, line: 28, type: !10)
!67 = !DILocation(line: 28, column: 12, scope: !65)
!68 = !DILocation(line: 28, column: 19, scope: !65)
!69 = !DILocalVariable(name: "source", scope: !70, file: !9, line: 30, type: !31)
!70 = distinct !DILexicalBlock(scope: !65, file: !9, line: 29, column: 5)
!71 = !DILocation(line: 30, column: 14, scope: !70)
!72 = !DILocation(line: 31, column: 9, scope: !70)
!73 = !DILocation(line: 32, column: 9, scope: !70)
!74 = !DILocation(line: 32, column: 23, scope: !70)
!75 = !DILocation(line: 34, column: 9, scope: !70)
!76 = !DILocation(line: 35, column: 19, scope: !70)
!77 = !DILocation(line: 35, column: 9, scope: !70)
!78 = !DILocation(line: 37, column: 1, scope: !65)
!79 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 70, type: !20, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!80 = !DILocalVariable(name: "data", scope: !79, file: !9, line: 72, type: !10)
!81 = !DILocation(line: 72, column: 12, scope: !79)
!82 = !DILocalVariable(name: "dataBadBuffer", scope: !79, file: !9, line: 73, type: !26)
!83 = !DILocation(line: 73, column: 10, scope: !79)
!84 = !DILocalVariable(name: "dataGoodBuffer", scope: !79, file: !9, line: 74, type: !31)
!85 = !DILocation(line: 74, column: 10, scope: !79)
!86 = !DILocation(line: 76, column: 12, scope: !79)
!87 = !DILocation(line: 76, column: 10, scope: !79)
!88 = !DILocation(line: 77, column: 5, scope: !79)
!89 = !DILocation(line: 77, column: 13, scope: !79)
!90 = !DILocation(line: 78, column: 80, scope: !79)
!91 = !DILocation(line: 78, column: 78, scope: !79)
!92 = !DILocation(line: 79, column: 5, scope: !79)
!93 = !DILocation(line: 80, column: 1, scope: !79)
!94 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 57, type: !20, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!95 = !DILocalVariable(name: "data", scope: !94, file: !9, line: 59, type: !10)
!96 = !DILocation(line: 59, column: 12, scope: !94)
!97 = !DILocation(line: 59, column: 19, scope: !94)
!98 = !DILocalVariable(name: "source", scope: !99, file: !9, line: 61, type: !31)
!99 = distinct !DILexicalBlock(scope: !94, file: !9, line: 60, column: 5)
!100 = !DILocation(line: 61, column: 14, scope: !99)
!101 = !DILocation(line: 62, column: 9, scope: !99)
!102 = !DILocation(line: 63, column: 9, scope: !99)
!103 = !DILocation(line: 63, column: 23, scope: !99)
!104 = !DILocation(line: 65, column: 9, scope: !99)
!105 = !DILocation(line: 66, column: 19, scope: !99)
!106 = !DILocation(line: 66, column: 9, scope: !99)
!107 = !DILocation(line: 68, column: 1, scope: !94)
