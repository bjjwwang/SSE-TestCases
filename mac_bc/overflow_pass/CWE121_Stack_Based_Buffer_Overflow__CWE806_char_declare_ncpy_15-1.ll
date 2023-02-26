; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15_bad() #0 !dbg !11 {
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
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !35
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !36
  %6 = load i8*, i8** %data, align 8, !dbg !36
  %call2 = call i64 @strlen(i8* noundef %6), !dbg !36
  %call3 = call i8* @__strncpy_chk(i8* noundef %arraydecay1, i8* noundef %5, i64 noundef %call2, i64 noundef 50) #5, !dbg !36
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !37
  store i8 0, i8* %arrayidx4, align 1, !dbg !38
  %7 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* noundef %7), !dbg !40
  ret void, !dbg !41
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
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !70
  store i8* %arraydecay, i8** %data, align 8, !dbg !71
  %0 = load i8*, i8** %data, align 8, !dbg !72
  %1 = load i8*, i8** %data, align 8, !dbg !72
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !72
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !72
  %3 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !75, metadata !DIExpression()), !dbg !77
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !77
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !77
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !78
  %5 = load i8*, i8** %data, align 8, !dbg !78
  %6 = load i8*, i8** %data, align 8, !dbg !78
  %call2 = call i64 @strlen(i8* noundef %6), !dbg !78
  %call3 = call i8* @__strncpy_chk(i8* noundef %arraydecay1, i8* noundef %5, i64 noundef %call2, i64 noundef 50) #5, !dbg !78
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !79
  store i8 0, i8* %arrayidx4, align 1, !dbg !80
  %7 = load i8*, i8** %data, align 8, !dbg !81
  call void @printLine(i8* noundef %7), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !84 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !89
  store i8* %arraydecay, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %1 = load i8*, i8** %data, align 8, !dbg !91
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !91
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %4 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %5 = load i8*, i8** %data, align 8, !dbg !97
  %6 = load i8*, i8** %data, align 8, !dbg !97
  %call2 = call i64 @strlen(i8* noundef %6), !dbg !97
  %call3 = call i8* @__strncpy_chk(i8* noundef %arraydecay1, i8* noundef %5, i64 noundef %call2, i64 noundef 50) #5, !dbg !97
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !98
  store i8 0, i8* %arrayidx4, align 1, !dbg !99
  %7 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* noundef %7), !dbg !101
  ret void, !dbg !102
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocation(line: 27, column: 12, scope: !11)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocation(line: 32, column: 9, scope: !11)
!28 = !DILocation(line: 33, column: 9, scope: !11)
!29 = !DILocation(line: 33, column: 21, scope: !11)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 41, type: !32)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 41, column: 14, scope: !31)
!36 = !DILocation(line: 43, column: 9, scope: !31)
!37 = !DILocation(line: 44, column: 9, scope: !31)
!38 = !DILocation(line: 44, column: 20, scope: !31)
!39 = !DILocation(line: 45, column: 19, scope: !31)
!40 = !DILocation(line: 45, column: 9, scope: !31)
!41 = !DILocation(line: 47, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_15_good", scope: !12, file: !12, line: 107, type: !13, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!43 = !DILocation(line: 109, column: 5, scope: !42)
!44 = !DILocation(line: 110, column: 5, scope: !42)
!45 = !DILocation(line: 111, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 123, type: !47, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !12, line: 123, type: !49)
!52 = !DILocation(line: 123, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !12, line: 123, type: !50)
!54 = !DILocation(line: 123, column: 27, scope: !46)
!55 = !DILocation(line: 126, column: 22, scope: !46)
!56 = !DILocation(line: 126, column: 12, scope: !46)
!57 = !DILocation(line: 126, column: 5, scope: !46)
!58 = !DILocation(line: 128, column: 5, scope: !46)
!59 = !DILocation(line: 129, column: 5, scope: !46)
!60 = !DILocation(line: 130, column: 5, scope: !46)
!61 = !DILocation(line: 133, column: 5, scope: !46)
!62 = !DILocation(line: 134, column: 5, scope: !46)
!63 = !DILocation(line: 135, column: 5, scope: !46)
!64 = !DILocation(line: 137, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!66 = !DILocalVariable(name: "data", scope: !65, file: !12, line: 56, type: !17)
!67 = !DILocation(line: 56, column: 12, scope: !65)
!68 = !DILocalVariable(name: "dataBuffer", scope: !65, file: !12, line: 57, type: !21)
!69 = !DILocation(line: 57, column: 10, scope: !65)
!70 = !DILocation(line: 58, column: 12, scope: !65)
!71 = !DILocation(line: 58, column: 10, scope: !65)
!72 = !DILocation(line: 67, column: 9, scope: !65)
!73 = !DILocation(line: 68, column: 9, scope: !65)
!74 = !DILocation(line: 68, column: 20, scope: !65)
!75 = !DILocalVariable(name: "dest", scope: !76, file: !12, line: 72, type: !32)
!76 = distinct !DILexicalBlock(scope: !65, file: !12, line: 71, column: 5)
!77 = !DILocation(line: 72, column: 14, scope: !76)
!78 = !DILocation(line: 74, column: 9, scope: !76)
!79 = !DILocation(line: 75, column: 9, scope: !76)
!80 = !DILocation(line: 75, column: 20, scope: !76)
!81 = !DILocation(line: 76, column: 19, scope: !76)
!82 = !DILocation(line: 76, column: 9, scope: !76)
!83 = !DILocation(line: 78, column: 1, scope: !65)
!84 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!85 = !DILocalVariable(name: "data", scope: !84, file: !12, line: 83, type: !17)
!86 = !DILocation(line: 83, column: 12, scope: !84)
!87 = !DILocalVariable(name: "dataBuffer", scope: !84, file: !12, line: 84, type: !21)
!88 = !DILocation(line: 84, column: 10, scope: !84)
!89 = !DILocation(line: 85, column: 12, scope: !84)
!90 = !DILocation(line: 85, column: 10, scope: !84)
!91 = !DILocation(line: 90, column: 9, scope: !84)
!92 = !DILocation(line: 91, column: 9, scope: !84)
!93 = !DILocation(line: 91, column: 20, scope: !84)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !12, line: 99, type: !32)
!95 = distinct !DILexicalBlock(scope: !84, file: !12, line: 98, column: 5)
!96 = !DILocation(line: 99, column: 14, scope: !95)
!97 = !DILocation(line: 101, column: 9, scope: !95)
!98 = !DILocation(line: 102, column: 9, scope: !95)
!99 = !DILocation(line: 102, column: 20, scope: !95)
!100 = !DILocation(line: 103, column: 19, scope: !95)
!101 = !DILocation(line: 103, column: 9, scope: !95)
!102 = !DILocation(line: 105, column: 1, scope: !84)
