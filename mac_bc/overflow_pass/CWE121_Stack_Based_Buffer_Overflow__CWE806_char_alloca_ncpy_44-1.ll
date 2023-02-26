; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !20, metadata !DIExpression()), !dbg !24
  store void (i8*)* @badSink, void (i8*)** %funcPtr, align 8, !dbg !24
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
  %6 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !33
  %7 = load i8*, i8** %data, align 8, !dbg !34
  call void %6(i8* noundef %7), !dbg !33
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i8* noundef %data) #0 !dbg !36 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !37, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !44
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !45
  %1 = load i8*, i8** %data.addr, align 8, !dbg !45
  %2 = load i8*, i8** %data.addr, align 8, !dbg !45
  %call = call i64 @strlen(i8* noundef %2), !dbg !45
  %call1 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %call, i64 noundef 50) #5, !dbg !45
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !46
  store i8 0, i8* %arrayidx, align 1, !dbg !47
  %3 = load i8*, i8** %data.addr, align 8, !dbg !48
  call void @printLine(i8* noundef %3), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_good() #0 !dbg !51 {
entry:
  call void @goodG2B(), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !54 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %funcPtr = alloca void (i8*)*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata void (i8*)** %funcPtr, metadata !76, metadata !DIExpression()), !dbg !77
  store void (i8*)* @goodG2BSink, void (i8*)** %funcPtr, align 8, !dbg !77
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
  %6 = load void (i8*)*, void (i8*)** %funcPtr, align 8, !dbg !86
  %7 = load i8*, i8** %data, align 8, !dbg !87
  call void %6(i8* noundef %7), !dbg !86
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i8* noundef %data) #0 !dbg !89 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !92, metadata !DIExpression()), !dbg !94
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !94
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !94
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !95
  %1 = load i8*, i8** %data.addr, align 8, !dbg !95
  %2 = load i8*, i8** %data.addr, align 8, !dbg !95
  %call = call i64 @strlen(i8* noundef %2), !dbg !95
  %call1 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %call, i64 noundef 50) #5, !dbg !95
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %3 = load i8*, i8** %data.addr, align 8, !dbg !98
  call void @printLine(i8* noundef %3), !dbg !99
  ret void, !dbg !100
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_bad", scope: !14, file: !14, line: 34, type: !15, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 36, type: !3)
!19 = !DILocation(line: 36, column: 12, scope: !13)
!20 = !DILocalVariable(name: "funcPtr", scope: !13, file: !14, line: 38, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !3}
!24 = !DILocation(line: 38, column: 12, scope: !13)
!25 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 39, type: !3)
!26 = !DILocation(line: 39, column: 12, scope: !13)
!27 = !DILocation(line: 39, column: 33, scope: !13)
!28 = !DILocation(line: 40, column: 12, scope: !13)
!29 = !DILocation(line: 40, column: 10, scope: !13)
!30 = !DILocation(line: 42, column: 5, scope: !13)
!31 = !DILocation(line: 43, column: 5, scope: !13)
!32 = !DILocation(line: 43, column: 17, scope: !13)
!33 = !DILocation(line: 45, column: 5, scope: !13)
!34 = !DILocation(line: 45, column: 13, scope: !13)
!35 = !DILocation(line: 46, column: 1, scope: !13)
!36 = distinct !DISubprogram(name: "badSink", scope: !14, file: !14, line: 23, type: !22, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!37 = !DILocalVariable(name: "data", arg: 1, scope: !36, file: !14, line: 23, type: !3)
!38 = !DILocation(line: 23, column: 28, scope: !36)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !14, line: 26, type: !41)
!40 = distinct !DILexicalBlock(scope: !36, file: !14, line: 25, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 26, column: 14, scope: !40)
!45 = !DILocation(line: 28, column: 9, scope: !40)
!46 = !DILocation(line: 29, column: 9, scope: !40)
!47 = !DILocation(line: 29, column: 20, scope: !40)
!48 = !DILocation(line: 30, column: 19, scope: !40)
!49 = !DILocation(line: 30, column: 9, scope: !40)
!50 = !DILocation(line: 32, column: 1, scope: !36)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncpy_44_good", scope: !14, file: !14, line: 76, type: !15, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!52 = !DILocation(line: 78, column: 5, scope: !51)
!53 = !DILocation(line: 79, column: 1, scope: !51)
!54 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 90, type: !55, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !54, file: !14, line: 90, type: !57)
!60 = !DILocation(line: 90, column: 14, scope: !54)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !54, file: !14, line: 90, type: !58)
!62 = !DILocation(line: 90, column: 27, scope: !54)
!63 = !DILocation(line: 93, column: 22, scope: !54)
!64 = !DILocation(line: 93, column: 12, scope: !54)
!65 = !DILocation(line: 93, column: 5, scope: !54)
!66 = !DILocation(line: 95, column: 5, scope: !54)
!67 = !DILocation(line: 96, column: 5, scope: !54)
!68 = !DILocation(line: 97, column: 5, scope: !54)
!69 = !DILocation(line: 100, column: 5, scope: !54)
!70 = !DILocation(line: 101, column: 5, scope: !54)
!71 = !DILocation(line: 102, column: 5, scope: !54)
!72 = !DILocation(line: 104, column: 5, scope: !54)
!73 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 64, type: !15, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!74 = !DILocalVariable(name: "data", scope: !73, file: !14, line: 66, type: !3)
!75 = !DILocation(line: 66, column: 12, scope: !73)
!76 = !DILocalVariable(name: "funcPtr", scope: !73, file: !14, line: 67, type: !21)
!77 = !DILocation(line: 67, column: 12, scope: !73)
!78 = !DILocalVariable(name: "dataBuffer", scope: !73, file: !14, line: 68, type: !3)
!79 = !DILocation(line: 68, column: 12, scope: !73)
!80 = !DILocation(line: 68, column: 33, scope: !73)
!81 = !DILocation(line: 69, column: 12, scope: !73)
!82 = !DILocation(line: 69, column: 10, scope: !73)
!83 = !DILocation(line: 71, column: 5, scope: !73)
!84 = !DILocation(line: 72, column: 5, scope: !73)
!85 = !DILocation(line: 72, column: 16, scope: !73)
!86 = !DILocation(line: 73, column: 5, scope: !73)
!87 = !DILocation(line: 73, column: 13, scope: !73)
!88 = !DILocation(line: 74, column: 1, scope: !73)
!89 = distinct !DISubprogram(name: "goodG2BSink", scope: !14, file: !14, line: 53, type: !22, scopeLine: 54, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!90 = !DILocalVariable(name: "data", arg: 1, scope: !89, file: !14, line: 53, type: !3)
!91 = !DILocation(line: 53, column: 32, scope: !89)
!92 = !DILocalVariable(name: "dest", scope: !93, file: !14, line: 56, type: !41)
!93 = distinct !DILexicalBlock(scope: !89, file: !14, line: 55, column: 5)
!94 = !DILocation(line: 56, column: 14, scope: !93)
!95 = !DILocation(line: 58, column: 9, scope: !93)
!96 = !DILocation(line: 59, column: 9, scope: !93)
!97 = !DILocation(line: 59, column: 20, scope: !93)
!98 = !DILocation(line: 60, column: 19, scope: !93)
!99 = !DILocation(line: 60, column: 9, scope: !93)
!100 = !DILocation(line: 62, column: 1, scope: !89)
