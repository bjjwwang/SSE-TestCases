; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_memcpy_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data3 = alloca i8*, align 8
  %data5 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !38
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !39
  store i8 0, i8* %arrayidx2, align 1, !dbg !40
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !41, metadata !DIExpression()), !dbg !43
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !44
  %1 = load i8*, i8** %0, align 8, !dbg !45
  store i8* %1, i8** %data3, align 8, !dbg !43
  %arraydecay4 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i8* %arraydecay4, i8** %data3, align 8, !dbg !47
  %2 = load i8*, i8** %data3, align 8, !dbg !48
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !49
  store i8* %2, i8** %3, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i8** %data5, metadata !51, metadata !DIExpression()), !dbg !53
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !54
  %5 = load i8*, i8** %4, align 8, !dbg !55
  store i8* %5, i8** %data5, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !56, metadata !DIExpression()), !dbg !58
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay6, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx7, align 1, !dbg !61
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %6 = load i8*, i8** %data5, align 8, !dbg !62
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %call = call i64 @strlen(i8* noundef %arraydecay9), !dbg !62
  %mul = mul i64 %call, 1, !dbg !62
  %call10 = call i8* @__memcpy_chk(i8* noundef %arraydecay8, i8* noundef %6, i64 noundef %mul, i64 noundef 100) #5, !dbg !62
  %arrayidx11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !63
  store i8 0, i8* %arrayidx11, align 1, !dbg !64
  %arraydecay12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !65
  call void @printLine(i8* noundef %arraydecay12), !dbg !66
  ret void, !dbg !67
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
define void @CWE126_Buffer_Overread__char_declare_memcpy_32_good() #0 !dbg !68 {
entry:
  call void @goodG2B(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !75, metadata !DIExpression()), !dbg !76
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i64 @time(i64* noundef null), !dbg !79
  %conv = trunc i64 %call to i32, !dbg !80
  call void @srand(i32 noundef %conv), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !82
  call void @CWE126_Buffer_Overread__char_declare_memcpy_32_good(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !85
  call void @CWE126_Buffer_Overread__char_declare_memcpy_32_bad(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  ret i32 0, !dbg !88
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !89 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data3 = alloca i8*, align 8
  %data5 = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !90, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !100
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !100
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !102
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !103
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !104
  store i8 0, i8* %arrayidx2, align 1, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %data3, metadata !106, metadata !DIExpression()), !dbg !108
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !109
  %1 = load i8*, i8** %0, align 8, !dbg !110
  store i8* %1, i8** %data3, align 8, !dbg !108
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay4, i8** %data3, align 8, !dbg !112
  %2 = load i8*, i8** %data3, align 8, !dbg !113
  %3 = load i8**, i8*** %dataPtr1, align 8, !dbg !114
  store i8* %2, i8** %3, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %data5, metadata !116, metadata !DIExpression()), !dbg !118
  %4 = load i8**, i8*** %dataPtr2, align 8, !dbg !119
  %5 = load i8*, i8** %4, align 8, !dbg !120
  store i8* %5, i8** %data5, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !121, metadata !DIExpression()), !dbg !123
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay6, i8 67, i64 99, i1 false), !dbg !124
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !125
  store i8 0, i8* %arrayidx7, align 1, !dbg !126
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  %6 = load i8*, i8** %data5, align 8, !dbg !127
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !127
  %call = call i64 @strlen(i8* noundef %arraydecay9), !dbg !127
  %mul = mul i64 %call, 1, !dbg !127
  %call10 = call i8* @__memcpy_chk(i8* noundef %arraydecay8, i8* noundef %6, i64 noundef %mul, i64 noundef 100) #5, !dbg !127
  %arrayidx11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx11, align 1, !dbg !129
  %arraydecay12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @printLine(i8* noundef %arraydecay12), !dbg !131
  ret void, !dbg !132
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_32_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_memcpy_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 26, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!22 = !DILocation(line: 26, column: 13, scope: !11)
!23 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 27, type: !21)
!24 = !DILocation(line: 27, column: 13, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 50)
!29 = !DILocation(line: 28, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 100)
!34 = !DILocation(line: 29, column: 10, scope: !11)
!35 = !DILocation(line: 30, column: 5, scope: !11)
!36 = !DILocation(line: 31, column: 5, scope: !11)
!37 = !DILocation(line: 31, column: 25, scope: !11)
!38 = !DILocation(line: 32, column: 5, scope: !11)
!39 = !DILocation(line: 33, column: 5, scope: !11)
!40 = !DILocation(line: 33, column: 27, scope: !11)
!41 = !DILocalVariable(name: "data", scope: !42, file: !12, line: 35, type: !17)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!43 = !DILocation(line: 35, column: 16, scope: !42)
!44 = !DILocation(line: 35, column: 24, scope: !42)
!45 = !DILocation(line: 35, column: 23, scope: !42)
!46 = !DILocation(line: 37, column: 16, scope: !42)
!47 = !DILocation(line: 37, column: 14, scope: !42)
!48 = !DILocation(line: 38, column: 21, scope: !42)
!49 = !DILocation(line: 38, column: 10, scope: !42)
!50 = !DILocation(line: 38, column: 19, scope: !42)
!51 = !DILocalVariable(name: "data", scope: !52, file: !12, line: 41, type: !17)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!53 = !DILocation(line: 41, column: 16, scope: !52)
!54 = !DILocation(line: 41, column: 24, scope: !52)
!55 = !DILocation(line: 41, column: 23, scope: !52)
!56 = !DILocalVariable(name: "dest", scope: !57, file: !12, line: 43, type: !31)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 42, column: 9)
!58 = !DILocation(line: 43, column: 18, scope: !57)
!59 = !DILocation(line: 44, column: 13, scope: !57)
!60 = !DILocation(line: 45, column: 13, scope: !57)
!61 = !DILocation(line: 45, column: 25, scope: !57)
!62 = !DILocation(line: 48, column: 13, scope: !57)
!63 = !DILocation(line: 49, column: 13, scope: !57)
!64 = !DILocation(line: 49, column: 25, scope: !57)
!65 = !DILocation(line: 50, column: 23, scope: !57)
!66 = !DILocation(line: 50, column: 13, scope: !57)
!67 = !DILocation(line: 53, column: 1, scope: !11)
!68 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_32_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!69 = !DILocation(line: 94, column: 5, scope: !68)
!70 = !DILocation(line: 95, column: 1, scope: !68)
!71 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !72, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DISubroutineType(types: !73)
!73 = !{!74, !74, !21}
!74 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!75 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !12, line: 106, type: !74)
!76 = !DILocation(line: 106, column: 14, scope: !71)
!77 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !12, line: 106, type: !21)
!78 = !DILocation(line: 106, column: 27, scope: !71)
!79 = !DILocation(line: 109, column: 22, scope: !71)
!80 = !DILocation(line: 109, column: 12, scope: !71)
!81 = !DILocation(line: 109, column: 5, scope: !71)
!82 = !DILocation(line: 111, column: 5, scope: !71)
!83 = !DILocation(line: 112, column: 5, scope: !71)
!84 = !DILocation(line: 113, column: 5, scope: !71)
!85 = !DILocation(line: 116, column: 5, scope: !71)
!86 = !DILocation(line: 117, column: 5, scope: !71)
!87 = !DILocation(line: 118, column: 5, scope: !71)
!88 = !DILocation(line: 120, column: 5, scope: !71)
!89 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!90 = !DILocalVariable(name: "data", scope: !89, file: !12, line: 62, type: !17)
!91 = !DILocation(line: 62, column: 12, scope: !89)
!92 = !DILocalVariable(name: "dataPtr1", scope: !89, file: !12, line: 63, type: !21)
!93 = !DILocation(line: 63, column: 13, scope: !89)
!94 = !DILocalVariable(name: "dataPtr2", scope: !89, file: !12, line: 64, type: !21)
!95 = !DILocation(line: 64, column: 13, scope: !89)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !89, file: !12, line: 65, type: !26)
!97 = !DILocation(line: 65, column: 10, scope: !89)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !89, file: !12, line: 66, type: !31)
!99 = !DILocation(line: 66, column: 10, scope: !89)
!100 = !DILocation(line: 67, column: 5, scope: !89)
!101 = !DILocation(line: 68, column: 5, scope: !89)
!102 = !DILocation(line: 68, column: 25, scope: !89)
!103 = !DILocation(line: 69, column: 5, scope: !89)
!104 = !DILocation(line: 70, column: 5, scope: !89)
!105 = !DILocation(line: 70, column: 27, scope: !89)
!106 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 72, type: !17)
!107 = distinct !DILexicalBlock(scope: !89, file: !12, line: 71, column: 5)
!108 = !DILocation(line: 72, column: 16, scope: !107)
!109 = !DILocation(line: 72, column: 24, scope: !107)
!110 = !DILocation(line: 72, column: 23, scope: !107)
!111 = !DILocation(line: 74, column: 16, scope: !107)
!112 = !DILocation(line: 74, column: 14, scope: !107)
!113 = !DILocation(line: 75, column: 21, scope: !107)
!114 = !DILocation(line: 75, column: 10, scope: !107)
!115 = !DILocation(line: 75, column: 19, scope: !107)
!116 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 78, type: !17)
!117 = distinct !DILexicalBlock(scope: !89, file: !12, line: 77, column: 5)
!118 = !DILocation(line: 78, column: 16, scope: !117)
!119 = !DILocation(line: 78, column: 24, scope: !117)
!120 = !DILocation(line: 78, column: 23, scope: !117)
!121 = !DILocalVariable(name: "dest", scope: !122, file: !12, line: 80, type: !31)
!122 = distinct !DILexicalBlock(scope: !117, file: !12, line: 79, column: 9)
!123 = !DILocation(line: 80, column: 18, scope: !122)
!124 = !DILocation(line: 81, column: 13, scope: !122)
!125 = !DILocation(line: 82, column: 13, scope: !122)
!126 = !DILocation(line: 82, column: 25, scope: !122)
!127 = !DILocation(line: 85, column: 13, scope: !122)
!128 = !DILocation(line: 86, column: 13, scope: !122)
!129 = !DILocation(line: 86, column: 25, scope: !122)
!130 = !DILocation(line: 87, column: 23, scope: !122)
!131 = !DILocation(line: 87, column: 13, scope: !122)
!132 = !DILocation(line: 90, column: 1, scope: !89)
