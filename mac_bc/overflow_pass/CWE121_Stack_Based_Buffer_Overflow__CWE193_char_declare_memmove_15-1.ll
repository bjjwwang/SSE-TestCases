; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !36
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  %2 = load i8*, i8** %data, align 8, !dbg !37
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !37
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !37
  %add = add i64 %call, 1, !dbg !37
  %mul = mul i64 %add, 1, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !37
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !37
  %call3 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %4) #5, !dbg !37
  %5 = load i8*, i8** %data, align 8, !dbg !38
  call void @printLine(i8* noundef %5), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_good() #0 !dbg !41 {
entry:
  call void @goodG2B1(), !dbg !42
  call void @goodG2B2(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !50, metadata !DIExpression()), !dbg !51
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %call = call i64 @time(i64* noundef null), !dbg !54
  %conv = trunc i64 %call to i32, !dbg !55
  call void @srand(i32 noundef %conv), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_good(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !62
  ret i32 0, !dbg !63
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !64 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !65, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !71
  store i8* %arraydecay, i8** %data, align 8, !dbg !72
  %0 = load i8*, i8** %data, align 8, !dbg !73
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !73
  store i8 0, i8* %arrayidx, align 1, !dbg !74
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !75, metadata !DIExpression()), !dbg !77
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !77
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !77
  %2 = load i8*, i8** %data, align 8, !dbg !78
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !78
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !78
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !78
  %add = add i64 %call, 1, !dbg !78
  %mul = mul i64 %add, 1, !dbg !78
  %3 = load i8*, i8** %data, align 8, !dbg !78
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !78
  %call3 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %4) #5, !dbg !78
  %5 = load i8*, i8** %data, align 8, !dbg !79
  call void @printLine(i8* noundef %5), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !89
  store i8* %arraydecay, i8** %data, align 8, !dbg !90
  %0 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !93, metadata !DIExpression()), !dbg !95
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !95
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !95
  %2 = load i8*, i8** %data, align 8, !dbg !96
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !96
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !96
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !96
  %add = add i64 %call, 1, !dbg !96
  %mul = mul i64 %add, 1, !dbg !96
  %3 = load i8*, i8** %data, align 8, !dbg !96
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !96
  %call3 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %4) #5, !dbg !96
  %5 = load i8*, i8** %data, align 8, !dbg !97
  call void @printLine(i8* noundef %5), !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 30, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 80, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 10)
!24 = !DILocation(line: 31, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 32, column: 10, scope: !11)
!30 = !DILocation(line: 38, column: 16, scope: !11)
!31 = !DILocation(line: 38, column: 14, scope: !11)
!32 = !DILocation(line: 39, column: 9, scope: !11)
!33 = !DILocation(line: 39, column: 17, scope: !11)
!34 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 47, type: !26)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!36 = !DILocation(line: 47, column: 14, scope: !35)
!37 = !DILocation(line: 50, column: 9, scope: !35)
!38 = !DILocation(line: 51, column: 19, scope: !35)
!39 = !DILocation(line: 51, column: 9, scope: !35)
!40 = !DILocation(line: 53, column: 1, scope: !11)
!41 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_15_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!42 = !DILocation(line: 117, column: 5, scope: !41)
!43 = !DILocation(line: 118, column: 5, scope: !41)
!44 = !DILocation(line: 119, column: 1, scope: !41)
!45 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !46, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !48, !49}
!48 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!50 = !DILocalVariable(name: "argc", arg: 1, scope: !45, file: !12, line: 131, type: !48)
!51 = !DILocation(line: 131, column: 14, scope: !45)
!52 = !DILocalVariable(name: "argv", arg: 2, scope: !45, file: !12, line: 131, type: !49)
!53 = !DILocation(line: 131, column: 27, scope: !45)
!54 = !DILocation(line: 134, column: 22, scope: !45)
!55 = !DILocation(line: 134, column: 12, scope: !45)
!56 = !DILocation(line: 134, column: 5, scope: !45)
!57 = !DILocation(line: 136, column: 5, scope: !45)
!58 = !DILocation(line: 137, column: 5, scope: !45)
!59 = !DILocation(line: 138, column: 5, scope: !45)
!60 = !DILocation(line: 141, column: 5, scope: !45)
!61 = !DILocation(line: 142, column: 5, scope: !45)
!62 = !DILocation(line: 143, column: 5, scope: !45)
!63 = !DILocation(line: 145, column: 5, scope: !45)
!64 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!65 = !DILocalVariable(name: "data", scope: !64, file: !12, line: 62, type: !17)
!66 = !DILocation(line: 62, column: 12, scope: !64)
!67 = !DILocalVariable(name: "dataBadBuffer", scope: !64, file: !12, line: 63, type: !21)
!68 = !DILocation(line: 63, column: 10, scope: !64)
!69 = !DILocalVariable(name: "dataGoodBuffer", scope: !64, file: !12, line: 64, type: !26)
!70 = !DILocation(line: 64, column: 10, scope: !64)
!71 = !DILocation(line: 74, column: 16, scope: !64)
!72 = !DILocation(line: 74, column: 14, scope: !64)
!73 = !DILocation(line: 75, column: 9, scope: !64)
!74 = !DILocation(line: 75, column: 17, scope: !64)
!75 = !DILocalVariable(name: "source", scope: !76, file: !12, line: 79, type: !26)
!76 = distinct !DILexicalBlock(scope: !64, file: !12, line: 78, column: 5)
!77 = !DILocation(line: 79, column: 14, scope: !76)
!78 = !DILocation(line: 82, column: 9, scope: !76)
!79 = !DILocation(line: 83, column: 19, scope: !76)
!80 = !DILocation(line: 83, column: 9, scope: !76)
!81 = !DILocation(line: 85, column: 1, scope: !64)
!82 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 90, type: !17)
!84 = !DILocation(line: 90, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 91, type: !21)
!86 = !DILocation(line: 91, column: 10, scope: !82)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 92, type: !26)
!88 = !DILocation(line: 92, column: 10, scope: !82)
!89 = !DILocation(line: 98, column: 16, scope: !82)
!90 = !DILocation(line: 98, column: 14, scope: !82)
!91 = !DILocation(line: 99, column: 9, scope: !82)
!92 = !DILocation(line: 99, column: 17, scope: !82)
!93 = !DILocalVariable(name: "source", scope: !94, file: !12, line: 107, type: !26)
!94 = distinct !DILexicalBlock(scope: !82, file: !12, line: 106, column: 5)
!95 = !DILocation(line: 107, column: 14, scope: !94)
!96 = !DILocation(line: 110, column: 9, scope: !94)
!97 = !DILocation(line: 111, column: 19, scope: !94)
!98 = !DILocation(line: 111, column: 9, scope: !94)
!99 = !DILocation(line: 113, column: 1, scope: !82)
