; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_goodG2BData = internal global i8* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !32
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* noundef null), !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 noundef %conv), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_good(), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_bad(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !65, metadata !DIExpression()), !dbg !70
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !70
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !70
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !71
  %2 = load i8*, i8** %data, align 8, !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !71
  %call = call i64 @strlen(i8* noundef %3), !dbg !71
  %mul = mul i64 %call, 1, !dbg !71
  %call1 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %2, i64 noundef %mul, i64 noundef 50) #5, !dbg !71
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  %4 = load i8*, i8** %data, align 8, !dbg !74
  call void @printLine(i8* noundef %4), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !77 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !82
  store i8* %arraydecay, i8** %data, align 8, !dbg !83
  %0 = load i8*, i8** %data, align 8, !dbg !84
  %1 = load i8*, i8** %data, align 8, !dbg !84
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !84
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !84
  %3 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !87
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_goodG2BData, align 8, !dbg !88
  call void @goodG2BSink(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_goodG2BData, align 8, !dbg !94
  store i8* %0, i8** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !97
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !98
  %2 = load i8*, i8** %data, align 8, !dbg !98
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %call = call i64 @strlen(i8* noundef %3), !dbg !98
  %mul = mul i64 %call, 1, !dbg !98
  %call1 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %2, i64 noundef %mul, i64 noundef 50) #5, !dbg !98
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* noundef %4), !dbg !102
  ret void, !dbg !103
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_badData", scope: !2, file: !9, line: 21, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_goodG2BData", scope: !2, file: !9, line: 22, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_bad", scope: !9, file: !9, line: 38, type: !20, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !9, line: 40, type: !10)
!24 = !DILocation(line: 40, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !9, line: 41, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 41, column: 10, scope: !19)
!30 = !DILocation(line: 42, column: 12, scope: !19)
!31 = !DILocation(line: 42, column: 10, scope: !19)
!32 = !DILocation(line: 44, column: 5, scope: !19)
!33 = !DILocation(line: 45, column: 5, scope: !19)
!34 = !DILocation(line: 45, column: 17, scope: !19)
!35 = !DILocation(line: 46, column: 81, scope: !19)
!36 = !DILocation(line: 46, column: 79, scope: !19)
!37 = !DILocation(line: 47, column: 5, scope: !19)
!38 = !DILocation(line: 48, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_memcpy_45_good", scope: !9, file: !9, line: 79, type: !20, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!40 = !DILocation(line: 81, column: 5, scope: !39)
!41 = !DILocation(line: 82, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 93, type: !43, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !9, line: 93, type: !45)
!48 = !DILocation(line: 93, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !9, line: 93, type: !46)
!50 = !DILocation(line: 93, column: 27, scope: !42)
!51 = !DILocation(line: 96, column: 22, scope: !42)
!52 = !DILocation(line: 96, column: 12, scope: !42)
!53 = !DILocation(line: 96, column: 5, scope: !42)
!54 = !DILocation(line: 98, column: 5, scope: !42)
!55 = !DILocation(line: 99, column: 5, scope: !42)
!56 = !DILocation(line: 100, column: 5, scope: !42)
!57 = !DILocation(line: 103, column: 5, scope: !42)
!58 = !DILocation(line: 104, column: 5, scope: !42)
!59 = !DILocation(line: 105, column: 5, scope: !42)
!60 = !DILocation(line: 107, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!62 = !DILocalVariable(name: "data", scope: !61, file: !9, line: 28, type: !10)
!63 = !DILocation(line: 28, column: 12, scope: !61)
!64 = !DILocation(line: 28, column: 19, scope: !61)
!65 = !DILocalVariable(name: "dest", scope: !66, file: !9, line: 30, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !9, line: 29, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 400, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 50)
!70 = !DILocation(line: 30, column: 14, scope: !66)
!71 = !DILocation(line: 32, column: 9, scope: !66)
!72 = !DILocation(line: 33, column: 9, scope: !66)
!73 = !DILocation(line: 33, column: 20, scope: !66)
!74 = !DILocation(line: 34, column: 19, scope: !66)
!75 = !DILocation(line: 34, column: 9, scope: !66)
!76 = !DILocation(line: 36, column: 1, scope: !61)
!77 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!78 = !DILocalVariable(name: "data", scope: !77, file: !9, line: 69, type: !10)
!79 = !DILocation(line: 69, column: 12, scope: !77)
!80 = !DILocalVariable(name: "dataBuffer", scope: !77, file: !9, line: 70, type: !26)
!81 = !DILocation(line: 70, column: 10, scope: !77)
!82 = !DILocation(line: 71, column: 12, scope: !77)
!83 = !DILocation(line: 71, column: 10, scope: !77)
!84 = !DILocation(line: 73, column: 5, scope: !77)
!85 = !DILocation(line: 74, column: 5, scope: !77)
!86 = !DILocation(line: 74, column: 16, scope: !77)
!87 = !DILocation(line: 75, column: 85, scope: !77)
!88 = !DILocation(line: 75, column: 83, scope: !77)
!89 = !DILocation(line: 76, column: 5, scope: !77)
!90 = !DILocation(line: 77, column: 1, scope: !77)
!91 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!92 = !DILocalVariable(name: "data", scope: !91, file: !9, line: 57, type: !10)
!93 = !DILocation(line: 57, column: 12, scope: !91)
!94 = !DILocation(line: 57, column: 19, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !96, file: !9, line: 59, type: !67)
!96 = distinct !DILexicalBlock(scope: !91, file: !9, line: 58, column: 5)
!97 = !DILocation(line: 59, column: 14, scope: !96)
!98 = !DILocation(line: 61, column: 9, scope: !96)
!99 = !DILocation(line: 62, column: 9, scope: !96)
!100 = !DILocation(line: 62, column: 20, scope: !96)
!101 = !DILocation(line: 63, column: 19, scope: !96)
!102 = !DILocation(line: 63, column: 9, scope: !96)
!103 = !DILocation(line: 65, column: 1, scope: !91)
