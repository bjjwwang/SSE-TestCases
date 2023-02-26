; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_41_badSink(i8* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !29
  %0 = load i8*, i8** %data.addr, align 8, !dbg !29
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !29
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !29
  %mul = mul i64 %call, 1, !dbg !29
  %call3 = call i8* @__memcpy_chk(i8* noundef %arraydecay1, i8* noundef %0, i64 noundef %mul, i64 noundef 100) #5, !dbg !29
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !30
  store i8 0, i8* %arrayidx4, align 1, !dbg !31
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !32
  call void @printLine(i8* noundef %arraydecay5), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !47
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !47
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !50
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx2, align 1, !dbg !52
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !53
  store i8* %arraydecay3, i8** %data, align 8, !dbg !54
  %0 = load i8*, i8** %data, align 8, !dbg !55
  call void @CWE126_Buffer_Overread__char_declare_memcpy_41_badSink(i8* noundef %0), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_41_goodG2BSink(i8* noundef %data) #0 !dbg !58 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !61, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !64
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  %0 = load i8*, i8** %data.addr, align 8, !dbg !67
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !67
  %mul = mul i64 %call, 1, !dbg !67
  %call3 = call i8* @__memcpy_chk(i8* noundef %arraydecay1, i8* noundef %0, i64 noundef %mul, i64 noundef 100) #5, !dbg !67
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !68
  store i8 0, i8* %arrayidx4, align 1, !dbg !69
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !70
  call void @printLine(i8* noundef %arraydecay5), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_41_good() #0 !dbg !73 {
entry:
  call void @goodG2B(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* noundef null), !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 noundef %conv), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE126_Buffer_Overread__char_declare_memcpy_41_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE126_Buffer_Overread__char_declare_memcpy_41_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !102
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !105
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !106
  store i8 0, i8* %arrayidx2, align 1, !dbg !107
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store i8* %arraydecay3, i8** %data, align 8, !dbg !109
  %0 = load i8*, i8** %data, align 8, !dbg !110
  call void @CWE126_Buffer_Overread__char_declare_memcpy_41_goodG2BSink(i8* noundef %0), !dbg !111
  ret void, !dbg !112
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!19 = !DILocation(line: 23, column: 68, scope: !11)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !12, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 21, scope: !21)
!29 = !DILocation(line: 31, column: 9, scope: !21)
!30 = !DILocation(line: 32, column: 9, scope: !21)
!31 = !DILocation(line: 32, column: 21, scope: !21)
!32 = !DILocation(line: 33, column: 19, scope: !21)
!33 = !DILocation(line: 33, column: 9, scope: !21)
!34 = !DILocation(line: 35, column: 1, scope: !11)
!35 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_41_bad", scope: !12, file: !12, line: 37, type: !36, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 39, type: !15)
!39 = !DILocation(line: 39, column: 12, scope: !35)
!40 = !DILocalVariable(name: "dataBadBuffer", scope: !35, file: !12, line: 40, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 40, column: 10, scope: !35)
!45 = !DILocalVariable(name: "dataGoodBuffer", scope: !35, file: !12, line: 41, type: !22)
!46 = !DILocation(line: 41, column: 10, scope: !35)
!47 = !DILocation(line: 42, column: 5, scope: !35)
!48 = !DILocation(line: 43, column: 5, scope: !35)
!49 = !DILocation(line: 43, column: 25, scope: !35)
!50 = !DILocation(line: 44, column: 5, scope: !35)
!51 = !DILocation(line: 45, column: 5, scope: !35)
!52 = !DILocation(line: 45, column: 27, scope: !35)
!53 = !DILocation(line: 47, column: 12, scope: !35)
!54 = !DILocation(line: 47, column: 10, scope: !35)
!55 = !DILocation(line: 48, column: 60, scope: !35)
!56 = !DILocation(line: 48, column: 5, scope: !35)
!57 = !DILocation(line: 49, column: 1, scope: !35)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_41_goodG2BSink", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!59 = !DILocalVariable(name: "data", arg: 1, scope: !58, file: !12, line: 55, type: !15)
!60 = !DILocation(line: 55, column: 72, scope: !58)
!61 = !DILocalVariable(name: "dest", scope: !62, file: !12, line: 58, type: !22)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 57, column: 5)
!63 = !DILocation(line: 58, column: 14, scope: !62)
!64 = !DILocation(line: 59, column: 9, scope: !62)
!65 = !DILocation(line: 60, column: 9, scope: !62)
!66 = !DILocation(line: 60, column: 21, scope: !62)
!67 = !DILocation(line: 63, column: 9, scope: !62)
!68 = !DILocation(line: 64, column: 9, scope: !62)
!69 = !DILocation(line: 64, column: 21, scope: !62)
!70 = !DILocation(line: 65, column: 19, scope: !62)
!71 = !DILocation(line: 65, column: 9, scope: !62)
!72 = !DILocation(line: 67, column: 1, scope: !58)
!73 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_41_good", scope: !12, file: !12, line: 84, type: !36, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!74 = !DILocation(line: 86, column: 5, scope: !73)
!75 = !DILocation(line: 87, column: 1, scope: !73)
!76 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !77, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !12, line: 99, type: !79)
!82 = !DILocation(line: 99, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !12, line: 99, type: !80)
!84 = !DILocation(line: 99, column: 27, scope: !76)
!85 = !DILocation(line: 102, column: 22, scope: !76)
!86 = !DILocation(line: 102, column: 12, scope: !76)
!87 = !DILocation(line: 102, column: 5, scope: !76)
!88 = !DILocation(line: 104, column: 5, scope: !76)
!89 = !DILocation(line: 105, column: 5, scope: !76)
!90 = !DILocation(line: 106, column: 5, scope: !76)
!91 = !DILocation(line: 109, column: 5, scope: !76)
!92 = !DILocation(line: 110, column: 5, scope: !76)
!93 = !DILocation(line: 111, column: 5, scope: !76)
!94 = !DILocation(line: 113, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 70, type: !36, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!96 = !DILocalVariable(name: "data", scope: !95, file: !12, line: 72, type: !15)
!97 = !DILocation(line: 72, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !12, line: 73, type: !41)
!99 = !DILocation(line: 73, column: 10, scope: !95)
!100 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !12, line: 74, type: !22)
!101 = !DILocation(line: 74, column: 10, scope: !95)
!102 = !DILocation(line: 75, column: 5, scope: !95)
!103 = !DILocation(line: 76, column: 5, scope: !95)
!104 = !DILocation(line: 76, column: 25, scope: !95)
!105 = !DILocation(line: 77, column: 5, scope: !95)
!106 = !DILocation(line: 78, column: 5, scope: !95)
!107 = !DILocation(line: 78, column: 27, scope: !95)
!108 = !DILocation(line: 80, column: 12, scope: !95)
!109 = !DILocation(line: 80, column: 10, scope: !95)
!110 = !DILocation(line: 81, column: 64, scope: !95)
!111 = !DILocation(line: 81, column: 5, scope: !95)
!112 = !DILocation(line: 82, column: 1, scope: !95)
