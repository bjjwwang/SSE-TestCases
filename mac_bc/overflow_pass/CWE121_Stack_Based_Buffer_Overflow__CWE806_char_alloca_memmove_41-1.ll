; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_badSink(i8* noundef %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !20, metadata !DIExpression()), !dbg !25
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !25
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !25
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !26
  %1 = load i8*, i8** %data.addr, align 8, !dbg !26
  %2 = load i8*, i8** %data.addr, align 8, !dbg !26
  %call = call i64 @strlen(i8* noundef %2), !dbg !26
  %mul = mul i64 %call, 1, !dbg !26
  %call1 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %mul, i64 noundef 50) #5, !dbg !26
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %3 = load i8*, i8** %data.addr, align 8, !dbg !29
  call void @printLine(i8* noundef %3), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_bad() #0 !dbg !32 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = alloca i8, i64 100, align 16, !dbg !39
  store i8* %0, i8** %dataBuffer, align 8, !dbg !38
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !40
  store i8* %1, i8** %data, align 8, !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !42
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !43
  store i8 0, i8* %arrayidx, align 1, !dbg !44
  %6 = load i8*, i8** %data, align 8, !dbg !45
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_badSink(i8* noundef %6), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_goodG2BSink(i8* noundef %data) #0 !dbg !48 {
entry:
  %data.addr = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !51, metadata !DIExpression()), !dbg !53
  %0 = bitcast [50 x i8]* %dest to i8*, !dbg !53
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 50, i1 false), !dbg !53
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !54
  %1 = load i8*, i8** %data.addr, align 8, !dbg !54
  %2 = load i8*, i8** %data.addr, align 8, !dbg !54
  %call = call i64 @strlen(i8* noundef %2), !dbg !54
  %mul = mul i64 %call, 1, !dbg !54
  %call1 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %1, i64 noundef %mul, i64 noundef 50) #5, !dbg !54
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !55
  store i8 0, i8* %arrayidx, align 1, !dbg !56
  %3 = load i8*, i8** %data.addr, align 8, !dbg !57
  call void @printLine(i8* noundef %3), !dbg !58
  ret void, !dbg !59
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* noundef null), !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 noundef %conv), !dbg !74
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_good(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_bad(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 100, align 16, !dbg !87
  store i8* %0, i8** %dataBuffer, align 8, !dbg !86
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !88
  store i8* %1, i8** %data, align 8, !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !90
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !90
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !90
  %5 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_goodG2BSink(i8* noundef %6), !dbg !94
  ret void, !dbg !95
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !3}
!17 = !{}
!18 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !3)
!19 = !DILocation(line: 23, column: 87, scope: !13)
!20 = !DILocalVariable(name: "dest", scope: !21, file: !14, line: 26, type: !22)
!21 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 14, scope: !21)
!26 = !DILocation(line: 28, column: 9, scope: !21)
!27 = !DILocation(line: 29, column: 9, scope: !21)
!28 = !DILocation(line: 29, column: 20, scope: !21)
!29 = !DILocation(line: 30, column: 19, scope: !21)
!30 = !DILocation(line: 30, column: 9, scope: !21)
!31 = !DILocation(line: 32, column: 1, scope: !13)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_bad", scope: !14, file: !14, line: 34, type: !33, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DILocalVariable(name: "data", scope: !32, file: !14, line: 36, type: !3)
!36 = !DILocation(line: 36, column: 12, scope: !32)
!37 = !DILocalVariable(name: "dataBuffer", scope: !32, file: !14, line: 37, type: !3)
!38 = !DILocation(line: 37, column: 12, scope: !32)
!39 = !DILocation(line: 37, column: 33, scope: !32)
!40 = !DILocation(line: 38, column: 12, scope: !32)
!41 = !DILocation(line: 38, column: 10, scope: !32)
!42 = !DILocation(line: 40, column: 5, scope: !32)
!43 = !DILocation(line: 41, column: 5, scope: !32)
!44 = !DILocation(line: 41, column: 17, scope: !32)
!45 = !DILocation(line: 42, column: 79, scope: !32)
!46 = !DILocation(line: 42, column: 5, scope: !32)
!47 = !DILocation(line: 43, column: 1, scope: !32)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_goodG2BSink", scope: !14, file: !14, line: 49, type: !15, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!49 = !DILocalVariable(name: "data", arg: 1, scope: !48, file: !14, line: 49, type: !3)
!50 = !DILocation(line: 49, column: 91, scope: !48)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !14, line: 52, type: !22)
!52 = distinct !DILexicalBlock(scope: !48, file: !14, line: 51, column: 5)
!53 = !DILocation(line: 52, column: 14, scope: !52)
!54 = !DILocation(line: 54, column: 9, scope: !52)
!55 = !DILocation(line: 55, column: 9, scope: !52)
!56 = !DILocation(line: 55, column: 20, scope: !52)
!57 = !DILocation(line: 56, column: 19, scope: !52)
!58 = !DILocation(line: 56, column: 9, scope: !52)
!59 = !DILocation(line: 58, column: 1, scope: !48)
!60 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memmove_41_good", scope: !14, file: !14, line: 72, type: !33, scopeLine: 73, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!61 = !DILocation(line: 74, column: 5, scope: !60)
!62 = !DILocation(line: 75, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 87, type: !64, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !14, line: 87, type: !66)
!69 = !DILocation(line: 87, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !14, line: 87, type: !67)
!71 = !DILocation(line: 87, column: 27, scope: !63)
!72 = !DILocation(line: 90, column: 22, scope: !63)
!73 = !DILocation(line: 90, column: 12, scope: !63)
!74 = !DILocation(line: 90, column: 5, scope: !63)
!75 = !DILocation(line: 92, column: 5, scope: !63)
!76 = !DILocation(line: 93, column: 5, scope: !63)
!77 = !DILocation(line: 94, column: 5, scope: !63)
!78 = !DILocation(line: 97, column: 5, scope: !63)
!79 = !DILocation(line: 98, column: 5, scope: !63)
!80 = !DILocation(line: 99, column: 5, scope: !63)
!81 = !DILocation(line: 101, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 61, type: !33, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!83 = !DILocalVariable(name: "data", scope: !82, file: !14, line: 63, type: !3)
!84 = !DILocation(line: 63, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataBuffer", scope: !82, file: !14, line: 64, type: !3)
!86 = !DILocation(line: 64, column: 12, scope: !82)
!87 = !DILocation(line: 64, column: 33, scope: !82)
!88 = !DILocation(line: 65, column: 12, scope: !82)
!89 = !DILocation(line: 65, column: 10, scope: !82)
!90 = !DILocation(line: 67, column: 5, scope: !82)
!91 = !DILocation(line: 68, column: 5, scope: !82)
!92 = !DILocation(line: 68, column: 16, scope: !82)
!93 = !DILocation(line: 69, column: 83, scope: !82)
!94 = !DILocation(line: 69, column: 5, scope: !82)
!95 = !DILocation(line: 70, column: 1, scope: !82)
