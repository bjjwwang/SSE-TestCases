; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_badSink(i8* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !20, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !26
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %0 = load i8*, i8** %data.addr, align 8, !dbg !29
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !29
  %1 = load i8*, i8** %data.addr, align 8, !dbg !29
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !29
  %call = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %arraydecay1, i64 noundef 100, i64 noundef %2) #5, !dbg !29
  %3 = load i8*, i8** %data.addr, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !30
  store i8 0, i8* %arrayidx2, align 1, !dbg !31
  %4 = load i8*, i8** %data.addr, align 8, !dbg !32
  call void @printLine(i8* noundef %4), !dbg !33
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_bad() #0 !dbg !35 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !45, metadata !DIExpression()), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !47
  store i8* %arraydecay, i8** %data, align 8, !dbg !48
  %0 = load i8*, i8** %data, align 8, !dbg !49
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !49
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %1 = load i8*, i8** %data, align 8, !dbg !51
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_badSink(i8* noundef %1), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_goodG2BSink(i8* noundef %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !57, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !60
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx, align 1, !dbg !62
  %0 = load i8*, i8** %data.addr, align 8, !dbg !63
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !63
  %1 = load i8*, i8** %data.addr, align 8, !dbg !63
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !63
  %call = call i8* @__memcpy_chk(i8* noundef %0, i8* noundef %arraydecay1, i64 noundef 100, i64 noundef %2) #5, !dbg !63
  %3 = load i8*, i8** %data.addr, align 8, !dbg !64
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 99, !dbg !64
  store i8 0, i8* %arrayidx2, align 1, !dbg !65
  %4 = load i8*, i8** %data.addr, align 8, !dbg !66
  call void @printLine(i8* noundef %4), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_good() #0 !dbg !69 {
entry:
  call void @goodG2B(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* noundef null), !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 noundef %conv), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_good(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_bad(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !91 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !98
  store i8* %arraydecay, i8** %data, align 8, !dbg !99
  %0 = load i8*, i8** %data, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %1 = load i8*, i8** %data, align 8, !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_goodG2BSink(i8* noundef %1), !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!19 = !DILocation(line: 23, column: 87, scope: !11)
!20 = !DILocalVariable(name: "source", scope: !21, file: !12, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 27, column: 9, scope: !21)
!27 = !DILocation(line: 28, column: 9, scope: !21)
!28 = !DILocation(line: 28, column: 23, scope: !21)
!29 = !DILocation(line: 30, column: 9, scope: !21)
!30 = !DILocation(line: 31, column: 9, scope: !21)
!31 = !DILocation(line: 31, column: 21, scope: !21)
!32 = !DILocation(line: 32, column: 19, scope: !21)
!33 = !DILocation(line: 32, column: 9, scope: !21)
!34 = !DILocation(line: 34, column: 1, scope: !11)
!35 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_bad", scope: !12, file: !12, line: 36, type: !36, scopeLine: 37, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !DILocalVariable(name: "data", scope: !35, file: !12, line: 38, type: !15)
!39 = !DILocation(line: 38, column: 12, scope: !35)
!40 = !DILocalVariable(name: "dataBadBuffer", scope: !35, file: !12, line: 39, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 39, column: 10, scope: !35)
!45 = !DILocalVariable(name: "dataGoodBuffer", scope: !35, file: !12, line: 40, type: !22)
!46 = !DILocation(line: 40, column: 10, scope: !35)
!47 = !DILocation(line: 43, column: 12, scope: !35)
!48 = !DILocation(line: 43, column: 10, scope: !35)
!49 = !DILocation(line: 44, column: 5, scope: !35)
!50 = !DILocation(line: 44, column: 13, scope: !35)
!51 = !DILocation(line: 45, column: 79, scope: !35)
!52 = !DILocation(line: 45, column: 5, scope: !35)
!53 = !DILocation(line: 46, column: 1, scope: !35)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_goodG2BSink", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!55 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !12, line: 52, type: !15)
!56 = !DILocation(line: 52, column: 91, scope: !54)
!57 = !DILocalVariable(name: "source", scope: !58, file: !12, line: 55, type: !22)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 54, column: 5)
!59 = !DILocation(line: 55, column: 14, scope: !58)
!60 = !DILocation(line: 56, column: 9, scope: !58)
!61 = !DILocation(line: 57, column: 9, scope: !58)
!62 = !DILocation(line: 57, column: 23, scope: !58)
!63 = !DILocation(line: 59, column: 9, scope: !58)
!64 = !DILocation(line: 60, column: 9, scope: !58)
!65 = !DILocation(line: 60, column: 21, scope: !58)
!66 = !DILocation(line: 61, column: 19, scope: !58)
!67 = !DILocation(line: 61, column: 9, scope: !58)
!68 = !DILocation(line: 63, column: 1, scope: !54)
!69 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_declare_memcpy_41_good", scope: !12, file: !12, line: 77, type: !36, scopeLine: 78, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!70 = !DILocation(line: 79, column: 5, scope: !69)
!71 = !DILocation(line: 80, column: 1, scope: !69)
!72 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 92, type: !73, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DISubroutineType(types: !74)
!74 = !{!75, !75, !76}
!75 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !12, line: 92, type: !75)
!78 = !DILocation(line: 92, column: 14, scope: !72)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !12, line: 92, type: !76)
!80 = !DILocation(line: 92, column: 27, scope: !72)
!81 = !DILocation(line: 95, column: 22, scope: !72)
!82 = !DILocation(line: 95, column: 12, scope: !72)
!83 = !DILocation(line: 95, column: 5, scope: !72)
!84 = !DILocation(line: 97, column: 5, scope: !72)
!85 = !DILocation(line: 98, column: 5, scope: !72)
!86 = !DILocation(line: 99, column: 5, scope: !72)
!87 = !DILocation(line: 102, column: 5, scope: !72)
!88 = !DILocation(line: 103, column: 5, scope: !72)
!89 = !DILocation(line: 104, column: 5, scope: !72)
!90 = !DILocation(line: 106, column: 5, scope: !72)
!91 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 66, type: !36, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!92 = !DILocalVariable(name: "data", scope: !91, file: !12, line: 68, type: !15)
!93 = !DILocation(line: 68, column: 12, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !12, line: 69, type: !41)
!95 = !DILocation(line: 69, column: 10, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !12, line: 70, type: !22)
!97 = !DILocation(line: 70, column: 10, scope: !91)
!98 = !DILocation(line: 72, column: 12, scope: !91)
!99 = !DILocation(line: 72, column: 10, scope: !91)
!100 = !DILocation(line: 73, column: 5, scope: !91)
!101 = !DILocation(line: 73, column: 13, scope: !91)
!102 = !DILocation(line: 74, column: 83, scope: !91)
!103 = !DILocation(line: 74, column: 5, scope: !91)
!104 = !DILocation(line: 75, column: 1, scope: !91)
