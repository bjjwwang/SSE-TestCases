; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !25
  store i8* %arraydecay, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %call = call i8* @badSource(i8* noundef %0), !dbg !28
  store i8* %call, i8** %data, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !35
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !36
  %call2 = call i64 @strlen(i8* noundef %3), !dbg !36
  %call3 = call i8* @__strncpy_chk(i8* noundef %arraydecay1, i8* noundef %2, i64 noundef %call2, i64 noundef 50) #5, !dbg !36
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  call void @printLine(i8* noundef %4), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @badSource(i8* noundef %data) #0 !dbg !42 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i8*, i8** %data.addr, align 8, !dbg !47
  %1 = load i8*, i8** %data.addr, align 8, !dbg !47
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !47
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !47
  %3 = load i8*, i8** %data.addr, align 8, !dbg !48
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %4 = load i8*, i8** %data.addr, align 8, !dbg !50
  ret i8* %4, !dbg !51
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_good() #0 !dbg !52 {
entry:
  call void @goodG2B(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* noundef null), !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 noundef %conv), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !79
  store i8* %arraydecay, i8** %data, align 8, !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  %call = call i8* @goodG2BSource(i8* noundef %0), !dbg !82
  store i8* %call, i8** %data, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !84, metadata !DIExpression()), !dbg !86
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !86
  %arraydecay1 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !87
  %2 = load i8*, i8** %data, align 8, !dbg !87
  %3 = load i8*, i8** %data, align 8, !dbg !87
  %call2 = call i64 @strlen(i8* noundef %3), !dbg !87
  %call3 = call i8* @__strncpy_chk(i8* noundef %arraydecay1, i8* noundef %2, i64 noundef %call2, i64 noundef 50) #5, !dbg !87
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  %4 = load i8*, i8** %data, align 8, !dbg !90
  call void @printLine(i8* noundef %4), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @goodG2BSource(i8* noundef %data) #0 !dbg !93 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = load i8*, i8** %data.addr, align 8, !dbg !96
  %1 = load i8*, i8** %data.addr, align 8, !dbg !96
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !96
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !96
  %3 = load i8*, i8** %data.addr, align 8, !dbg !97
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %4 = load i8*, i8** %data.addr, align 8, !dbg !99
  ret i8* %4, !dbg !100
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_bad", scope: !12, file: !12, line: 31, type: !13, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 33, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 33, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 34, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 100)
!24 = !DILocation(line: 34, column: 10, scope: !11)
!25 = !DILocation(line: 35, column: 12, scope: !11)
!26 = !DILocation(line: 35, column: 10, scope: !11)
!27 = !DILocation(line: 36, column: 22, scope: !11)
!28 = !DILocation(line: 36, column: 12, scope: !11)
!29 = !DILocation(line: 36, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !12, line: 38, type: !32)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 38, column: 14, scope: !31)
!36 = !DILocation(line: 40, column: 9, scope: !31)
!37 = !DILocation(line: 41, column: 9, scope: !31)
!38 = !DILocation(line: 41, column: 20, scope: !31)
!39 = !DILocation(line: 42, column: 19, scope: !31)
!40 = !DILocation(line: 42, column: 9, scope: !31)
!41 = !DILocation(line: 44, column: 1, scope: !11)
!42 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 23, type: !43, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!43 = !DISubroutineType(types: !44)
!44 = !{!17, !17}
!45 = !DILocalVariable(name: "data", arg: 1, scope: !42, file: !12, line: 23, type: !17)
!46 = !DILocation(line: 23, column: 32, scope: !42)
!47 = !DILocation(line: 26, column: 5, scope: !42)
!48 = !DILocation(line: 27, column: 5, scope: !42)
!49 = !DILocation(line: 27, column: 17, scope: !42)
!50 = !DILocation(line: 28, column: 12, scope: !42)
!51 = !DILocation(line: 28, column: 5, scope: !42)
!52 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_declare_ncpy_42_good", scope: !12, file: !12, line: 74, type: !13, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!53 = !DILocation(line: 76, column: 5, scope: !52)
!54 = !DILocation(line: 77, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 89, type: !56, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 89, type: !58)
!61 = !DILocation(line: 89, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 89, type: !59)
!63 = !DILocation(line: 89, column: 27, scope: !55)
!64 = !DILocation(line: 92, column: 22, scope: !55)
!65 = !DILocation(line: 92, column: 12, scope: !55)
!66 = !DILocation(line: 92, column: 5, scope: !55)
!67 = !DILocation(line: 94, column: 5, scope: !55)
!68 = !DILocation(line: 95, column: 5, scope: !55)
!69 = !DILocation(line: 96, column: 5, scope: !55)
!70 = !DILocation(line: 99, column: 5, scope: !55)
!71 = !DILocation(line: 100, column: 5, scope: !55)
!72 = !DILocation(line: 101, column: 5, scope: !55)
!73 = !DILocation(line: 103, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!75 = !DILocalVariable(name: "data", scope: !74, file: !12, line: 61, type: !17)
!76 = !DILocation(line: 61, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBuffer", scope: !74, file: !12, line: 62, type: !21)
!78 = !DILocation(line: 62, column: 10, scope: !74)
!79 = !DILocation(line: 63, column: 12, scope: !74)
!80 = !DILocation(line: 63, column: 10, scope: !74)
!81 = !DILocation(line: 64, column: 26, scope: !74)
!82 = !DILocation(line: 64, column: 12, scope: !74)
!83 = !DILocation(line: 64, column: 10, scope: !74)
!84 = !DILocalVariable(name: "dest", scope: !85, file: !12, line: 66, type: !32)
!85 = distinct !DILexicalBlock(scope: !74, file: !12, line: 65, column: 5)
!86 = !DILocation(line: 66, column: 14, scope: !85)
!87 = !DILocation(line: 68, column: 9, scope: !85)
!88 = !DILocation(line: 69, column: 9, scope: !85)
!89 = !DILocation(line: 69, column: 20, scope: !85)
!90 = !DILocation(line: 70, column: 19, scope: !85)
!91 = !DILocation(line: 70, column: 9, scope: !85)
!92 = !DILocation(line: 72, column: 1, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2BSource", scope: !12, file: !12, line: 50, type: !43, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DILocalVariable(name: "data", arg: 1, scope: !93, file: !12, line: 50, type: !17)
!95 = !DILocation(line: 50, column: 36, scope: !93)
!96 = !DILocation(line: 53, column: 5, scope: !93)
!97 = !DILocation(line: 54, column: 5, scope: !93)
!98 = !DILocation(line: 54, column: 16, scope: !93)
!99 = !DILocation(line: 55, column: 12, scope: !93)
!100 = !DILocation(line: 55, column: 5, scope: !93)
