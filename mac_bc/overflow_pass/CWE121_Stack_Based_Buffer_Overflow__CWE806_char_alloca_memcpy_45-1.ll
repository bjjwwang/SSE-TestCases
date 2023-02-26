; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_goodG2BData = internal global i8* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 100, align 16, !dbg !27
  store i8* %0, i8** %dataBuffer, align 8, !dbg !26
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !28
  store i8* %1, i8** %data, align 8, !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !30
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !30
  %5 = load i8*, i8** %data, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %6 = load i8*, i8** %data, align 8, !dbg !33
  store i8* %6, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_badData, align 8, !dbg !34
  call void @badSink(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_good() #0 !dbg !37 {
entry:
  call void @goodG2B(), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !45, metadata !DIExpression()), !dbg !46
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i64 @time(i64* noundef null), !dbg !49
  %conv = trunc i64 %call to i32, !dbg !50
  call void @srand(i32 noundef %conv), !dbg !51
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !52
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_good(), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !54
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !55
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_bad(), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !57
  ret i32 0, !dbg !58
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !59 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !60, metadata !DIExpression()), !dbg !61
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_badData, align 8, !dbg !62
  store i8* %0, i8** %data, align 8, !dbg !61
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !63, metadata !DIExpression()), !dbg !68
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !68
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !68
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !69
  %2 = load i8*, i8** %data, align 8, !dbg !69
  %3 = load i8*, i8** %data, align 8, !dbg !69
  %call = call i64 @strlen(i8* noundef %3), !dbg !69
  %mul = mul i64 %call, 1, !dbg !69
  %call1 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %2, i64 noundef %mul, i64 noundef 50) #5, !dbg !69
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !70
  store i8 0, i8* %arrayidx, align 1, !dbg !71
  %4 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* noundef %4), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 100, align 16, !dbg !80
  store i8* %0, i8** %dataBuffer, align 8, !dbg !79
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !81
  store i8* %1, i8** %data, align 8, !dbg !82
  %2 = load i8*, i8** %data, align 8, !dbg !83
  %3 = load i8*, i8** %data, align 8, !dbg !83
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !83
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !83
  %5 = load i8*, i8** %data, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %6 = load i8*, i8** %data, align 8, !dbg !86
  store i8* %6, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_goodG2BData, align 8, !dbg !87
  call void @goodG2BSink(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !90 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_goodG2BData, align 8, !dbg !93
  store i8* %0, i8** %data, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %2 = load i8*, i8** %data, align 8, !dbg !97
  %3 = load i8*, i8** %data, align 8, !dbg !97
  %call = call i64 @strlen(i8* noundef %3), !dbg !97
  %mul = mul i64 %call, 1, !dbg !97
  %call1 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %2, i64 noundef %mul, i64 noundef 50) #5, !dbg !97
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %4 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* noundef %4), !dbg !101
  ret void, !dbg !102
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
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_badData", scope: !2, file: !11, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_goodG2BData", scope: !2, file: !11, line: 22, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_bad", scope: !11, file: !11, line: 38, type: !20, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 40, type: !5)
!24 = !DILocation(line: 40, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBuffer", scope: !19, file: !11, line: 41, type: !5)
!26 = !DILocation(line: 41, column: 12, scope: !19)
!27 = !DILocation(line: 41, column: 33, scope: !19)
!28 = !DILocation(line: 42, column: 12, scope: !19)
!29 = !DILocation(line: 42, column: 10, scope: !19)
!30 = !DILocation(line: 44, column: 5, scope: !19)
!31 = !DILocation(line: 45, column: 5, scope: !19)
!32 = !DILocation(line: 45, column: 17, scope: !19)
!33 = !DILocation(line: 46, column: 80, scope: !19)
!34 = !DILocation(line: 46, column: 78, scope: !19)
!35 = !DILocation(line: 47, column: 5, scope: !19)
!36 = !DILocation(line: 48, column: 1, scope: !19)
!37 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_45_good", scope: !11, file: !11, line: 79, type: !20, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!38 = !DILocation(line: 81, column: 5, scope: !37)
!39 = !DILocation(line: 82, column: 1, scope: !37)
!40 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 93, type: !41, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !43, !44}
!43 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!45 = !DILocalVariable(name: "argc", arg: 1, scope: !40, file: !11, line: 93, type: !43)
!46 = !DILocation(line: 93, column: 14, scope: !40)
!47 = !DILocalVariable(name: "argv", arg: 2, scope: !40, file: !11, line: 93, type: !44)
!48 = !DILocation(line: 93, column: 27, scope: !40)
!49 = !DILocation(line: 96, column: 22, scope: !40)
!50 = !DILocation(line: 96, column: 12, scope: !40)
!51 = !DILocation(line: 96, column: 5, scope: !40)
!52 = !DILocation(line: 98, column: 5, scope: !40)
!53 = !DILocation(line: 99, column: 5, scope: !40)
!54 = !DILocation(line: 100, column: 5, scope: !40)
!55 = !DILocation(line: 103, column: 5, scope: !40)
!56 = !DILocation(line: 104, column: 5, scope: !40)
!57 = !DILocation(line: 105, column: 5, scope: !40)
!58 = !DILocation(line: 107, column: 5, scope: !40)
!59 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!60 = !DILocalVariable(name: "data", scope: !59, file: !11, line: 28, type: !5)
!61 = !DILocation(line: 28, column: 12, scope: !59)
!62 = !DILocation(line: 28, column: 19, scope: !59)
!63 = !DILocalVariable(name: "dest", scope: !64, file: !11, line: 30, type: !65)
!64 = distinct !DILexicalBlock(scope: !59, file: !11, line: 29, column: 5)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 50)
!68 = !DILocation(line: 30, column: 14, scope: !64)
!69 = !DILocation(line: 32, column: 9, scope: !64)
!70 = !DILocation(line: 33, column: 9, scope: !64)
!71 = !DILocation(line: 33, column: 20, scope: !64)
!72 = !DILocation(line: 34, column: 19, scope: !64)
!73 = !DILocation(line: 34, column: 9, scope: !64)
!74 = !DILocation(line: 36, column: 1, scope: !59)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 67, type: !20, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!76 = !DILocalVariable(name: "data", scope: !75, file: !11, line: 69, type: !5)
!77 = !DILocation(line: 69, column: 12, scope: !75)
!78 = !DILocalVariable(name: "dataBuffer", scope: !75, file: !11, line: 70, type: !5)
!79 = !DILocation(line: 70, column: 12, scope: !75)
!80 = !DILocation(line: 70, column: 33, scope: !75)
!81 = !DILocation(line: 71, column: 12, scope: !75)
!82 = !DILocation(line: 71, column: 10, scope: !75)
!83 = !DILocation(line: 73, column: 5, scope: !75)
!84 = !DILocation(line: 74, column: 5, scope: !75)
!85 = !DILocation(line: 74, column: 16, scope: !75)
!86 = !DILocation(line: 75, column: 84, scope: !75)
!87 = !DILocation(line: 75, column: 82, scope: !75)
!88 = !DILocation(line: 76, column: 5, scope: !75)
!89 = !DILocation(line: 77, column: 1, scope: !75)
!90 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 55, type: !20, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!91 = !DILocalVariable(name: "data", scope: !90, file: !11, line: 57, type: !5)
!92 = !DILocation(line: 57, column: 12, scope: !90)
!93 = !DILocation(line: 57, column: 19, scope: !90)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !11, line: 59, type: !65)
!95 = distinct !DILexicalBlock(scope: !90, file: !11, line: 58, column: 5)
!96 = !DILocation(line: 59, column: 14, scope: !95)
!97 = !DILocation(line: 61, column: 9, scope: !95)
!98 = !DILocation(line: 62, column: 9, scope: !95)
!99 = !DILocation(line: 62, column: 20, scope: !95)
!100 = !DILocation(line: 63, column: 19, scope: !95)
!101 = !DILocation(line: 63, column: 9, scope: !95)
!102 = !DILocation(line: 65, column: 1, scope: !90)
