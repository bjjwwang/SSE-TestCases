; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 100, align 16, !dbg !22
  store i8* %0, i8** %dataBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !25
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !25
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !25
  %5 = load i8*, i8** %data, align 8, !dbg !26
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !26
  store i8 0, i8* %arrayidx, align 1, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !34
  %7 = load i8*, i8** %data, align 8, !dbg !34
  %8 = load i8*, i8** %data, align 8, !dbg !34
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !34
  %mul = mul i64 %call1, 1, !dbg !34
  %call2 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #5, !dbg !34
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx3, align 1, !dbg !36
  %9 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* noundef %9), !dbg !38
  ret void, !dbg !39
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
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15_good() #0 !dbg !40 {
entry:
  call void @goodG2B1(), !dbg !41
  call void @goodG2B2(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* noundef null), !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 noundef %conv), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15_good(), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15_bad(), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = alloca i8, i64 100, align 16, !dbg !68
  store i8* %0, i8** %dataBuffer, align 8, !dbg !67
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !69
  store i8* %1, i8** %data, align 8, !dbg !70
  %2 = load i8*, i8** %data, align 8, !dbg !71
  %3 = load i8*, i8** %data, align 8, !dbg !71
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !71
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !71
  %5 = load i8*, i8** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !72
  store i8 0, i8* %arrayidx, align 1, !dbg !73
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !74, metadata !DIExpression()), !dbg !76
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !76
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !77
  %7 = load i8*, i8** %data, align 8, !dbg !77
  %8 = load i8*, i8** %data, align 8, !dbg !77
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !77
  %mul = mul i64 %call1, 1, !dbg !77
  %call2 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #5, !dbg !77
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !78
  store i8 0, i8* %arrayidx3, align 1, !dbg !79
  %9 = load i8*, i8** %data, align 8, !dbg !80
  call void @printLine(i8* noundef %9), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !83 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  %0 = alloca i8, i64 100, align 16, !dbg !88
  store i8* %0, i8** %dataBuffer, align 8, !dbg !87
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !89
  store i8* %1, i8** %data, align 8, !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !91
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !91
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !91
  %5 = load i8*, i8** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !92
  store i8 0, i8* %arrayidx, align 1, !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !96
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !97
  %7 = load i8*, i8** %data, align 8, !dbg !97
  %8 = load i8*, i8** %data, align 8, !dbg !97
  %call1 = call i64 @strlen(i8* noundef %8), !dbg !97
  %mul = mul i64 %call1, 1, !dbg !97
  %call2 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %mul, i64 noundef 50) #5, !dbg !97
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !98
  store i8 0, i8* %arrayidx3, align 1, !dbg !99
  %9 = load i8*, i8** %data, align 8, !dbg !100
  call void @printLine(i8* noundef %9), !dbg !101
  ret void, !dbg !102
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 33, scope: !13)
!23 = !DILocation(line: 27, column: 12, scope: !13)
!24 = !DILocation(line: 27, column: 10, scope: !13)
!25 = !DILocation(line: 32, column: 9, scope: !13)
!26 = !DILocation(line: 33, column: 9, scope: !13)
!27 = !DILocation(line: 33, column: 21, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 41, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 41, column: 14, scope: !29)
!34 = !DILocation(line: 43, column: 9, scope: !29)
!35 = !DILocation(line: 44, column: 9, scope: !29)
!36 = !DILocation(line: 44, column: 20, scope: !29)
!37 = !DILocation(line: 45, column: 19, scope: !29)
!38 = !DILocation(line: 45, column: 9, scope: !29)
!39 = !DILocation(line: 47, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_15_good", scope: !14, file: !14, line: 107, type: !15, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!41 = !DILocation(line: 109, column: 5, scope: !40)
!42 = !DILocation(line: 110, column: 5, scope: !40)
!43 = !DILocation(line: 111, column: 1, scope: !40)
!44 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 123, type: !45, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!45 = !DISubroutineType(types: !46)
!46 = !{!47, !47, !48}
!47 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !44, file: !14, line: 123, type: !47)
!50 = !DILocation(line: 123, column: 14, scope: !44)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !44, file: !14, line: 123, type: !48)
!52 = !DILocation(line: 123, column: 27, scope: !44)
!53 = !DILocation(line: 126, column: 22, scope: !44)
!54 = !DILocation(line: 126, column: 12, scope: !44)
!55 = !DILocation(line: 126, column: 5, scope: !44)
!56 = !DILocation(line: 128, column: 5, scope: !44)
!57 = !DILocation(line: 129, column: 5, scope: !44)
!58 = !DILocation(line: 130, column: 5, scope: !44)
!59 = !DILocation(line: 133, column: 5, scope: !44)
!60 = !DILocation(line: 134, column: 5, scope: !44)
!61 = !DILocation(line: 135, column: 5, scope: !44)
!62 = !DILocation(line: 137, column: 5, scope: !44)
!63 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 56, type: !3)
!65 = !DILocation(line: 56, column: 12, scope: !63)
!66 = !DILocalVariable(name: "dataBuffer", scope: !63, file: !14, line: 57, type: !3)
!67 = !DILocation(line: 57, column: 12, scope: !63)
!68 = !DILocation(line: 57, column: 33, scope: !63)
!69 = !DILocation(line: 58, column: 12, scope: !63)
!70 = !DILocation(line: 58, column: 10, scope: !63)
!71 = !DILocation(line: 67, column: 9, scope: !63)
!72 = !DILocation(line: 68, column: 9, scope: !63)
!73 = !DILocation(line: 68, column: 20, scope: !63)
!74 = !DILocalVariable(name: "dest", scope: !75, file: !14, line: 72, type: !30)
!75 = distinct !DILexicalBlock(scope: !63, file: !14, line: 71, column: 5)
!76 = !DILocation(line: 72, column: 14, scope: !75)
!77 = !DILocation(line: 74, column: 9, scope: !75)
!78 = !DILocation(line: 75, column: 9, scope: !75)
!79 = !DILocation(line: 75, column: 20, scope: !75)
!80 = !DILocation(line: 76, column: 19, scope: !75)
!81 = !DILocation(line: 76, column: 9, scope: !75)
!82 = !DILocation(line: 78, column: 1, scope: !63)
!83 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!84 = !DILocalVariable(name: "data", scope: !83, file: !14, line: 83, type: !3)
!85 = !DILocation(line: 83, column: 12, scope: !83)
!86 = !DILocalVariable(name: "dataBuffer", scope: !83, file: !14, line: 84, type: !3)
!87 = !DILocation(line: 84, column: 12, scope: !83)
!88 = !DILocation(line: 84, column: 33, scope: !83)
!89 = !DILocation(line: 85, column: 12, scope: !83)
!90 = !DILocation(line: 85, column: 10, scope: !83)
!91 = !DILocation(line: 90, column: 9, scope: !83)
!92 = !DILocation(line: 91, column: 9, scope: !83)
!93 = !DILocation(line: 91, column: 20, scope: !83)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !14, line: 99, type: !30)
!95 = distinct !DILexicalBlock(scope: !83, file: !14, line: 98, column: 5)
!96 = !DILocation(line: 99, column: 14, scope: !95)
!97 = !DILocation(line: 101, column: 9, scope: !95)
!98 = !DILocation(line: 102, column: 9, scope: !95)
!99 = !DILocation(line: 102, column: 20, scope: !95)
!100 = !DILocation(line: 103, column: 19, scope: !95)
!101 = !DILocation(line: 103, column: 9, scope: !95)
!102 = !DILocation(line: 105, column: 1, scope: !83)
