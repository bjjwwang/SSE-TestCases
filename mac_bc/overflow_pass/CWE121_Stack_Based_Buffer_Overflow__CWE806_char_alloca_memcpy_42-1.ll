; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42_bad() #0 !dbg !13 {
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
  %call = call i8* @badSource(i8* noundef %2), !dbg !26
  store i8* %call, i8** %data, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !28, metadata !DIExpression()), !dbg !33
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !34
  %5 = load i8*, i8** %data, align 8, !dbg !34
  %call1 = call i64 @strlen(i8* noundef %5), !dbg !34
  %mul = mul i64 %call1, 1, !dbg !34
  %call2 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %4, i64 noundef %mul, i64 noundef 50) #5, !dbg !34
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  %6 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* noundef %6), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @badSource(i8* noundef %data) #0 !dbg !40 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i8*, i8** %data.addr, align 8, !dbg !45
  %1 = load i8*, i8** %data.addr, align 8, !dbg !45
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !45
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 99, i64 noundef %2) #5, !dbg !45
  %3 = load i8*, i8** %data.addr, align 8, !dbg !46
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 99, !dbg !46
  store i8 0, i8* %arrayidx, align 1, !dbg !47
  %4 = load i8*, i8** %data.addr, align 8, !dbg !48
  ret i8* %4, !dbg !49
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !72 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 100, align 16, !dbg !77
  store i8* %0, i8** %dataBuffer, align 8, !dbg !76
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !78
  store i8* %1, i8** %data, align 8, !dbg !79
  %2 = load i8*, i8** %data, align 8, !dbg !80
  %call = call i8* @goodG2BSource(i8* noundef %2), !dbg !81
  store i8* %call, i8** %data, align 8, !dbg !82
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !83, metadata !DIExpression()), !dbg !85
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !85
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !86
  %4 = load i8*, i8** %data, align 8, !dbg !86
  %5 = load i8*, i8** %data, align 8, !dbg !86
  %call1 = call i64 @strlen(i8* noundef %5), !dbg !86
  %mul = mul i64 %call1, 1, !dbg !86
  %call2 = call i8* @__memcpy_chk(i8* noundef %arraydecay, i8* noundef %4, i64 noundef %mul, i64 noundef 50) #5, !dbg !86
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  %6 = load i8*, i8** %data, align 8, !dbg !89
  call void @printLine(i8* noundef %6), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @goodG2BSource(i8* noundef %data) #0 !dbg !92 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = load i8*, i8** %data.addr, align 8, !dbg !95
  %1 = load i8*, i8** %data.addr, align 8, !dbg !95
  %2 = call i64 @llvm.objectsize.i64.p0i8(i8* %1, i1 false, i1 true, i1 false), !dbg !95
  %call = call i8* @__memset_chk(i8* noundef %0, i32 noundef 65, i64 noundef 49, i64 noundef %2) #5, !dbg !95
  %3 = load i8*, i8** %data.addr, align 8, !dbg !96
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !96
  store i8 0, i8* %arrayidx, align 1, !dbg !97
  %4 = load i8*, i8** %data.addr, align 8, !dbg !98
  ret i8* %4, !dbg !99
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !3)
!19 = !DILocation(line: 33, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 34, type: !3)
!21 = !DILocation(line: 34, column: 12, scope: !13)
!22 = !DILocation(line: 34, column: 33, scope: !13)
!23 = !DILocation(line: 35, column: 12, scope: !13)
!24 = !DILocation(line: 35, column: 10, scope: !13)
!25 = !DILocation(line: 36, column: 22, scope: !13)
!26 = !DILocation(line: 36, column: 12, scope: !13)
!27 = !DILocation(line: 36, column: 10, scope: !13)
!28 = !DILocalVariable(name: "dest", scope: !29, file: !14, line: 38, type: !30)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 38, column: 14, scope: !29)
!34 = !DILocation(line: 40, column: 9, scope: !29)
!35 = !DILocation(line: 41, column: 9, scope: !29)
!36 = !DILocation(line: 41, column: 20, scope: !29)
!37 = !DILocation(line: 42, column: 19, scope: !29)
!38 = !DILocation(line: 42, column: 9, scope: !29)
!39 = !DILocation(line: 44, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "badSource", scope: !14, file: !14, line: 23, type: !41, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!41 = !DISubroutineType(types: !42)
!42 = !{!3, !3}
!43 = !DILocalVariable(name: "data", arg: 1, scope: !40, file: !14, line: 23, type: !3)
!44 = !DILocation(line: 23, column: 32, scope: !40)
!45 = !DILocation(line: 26, column: 5, scope: !40)
!46 = !DILocation(line: 27, column: 5, scope: !40)
!47 = !DILocation(line: 27, column: 17, scope: !40)
!48 = !DILocation(line: 28, column: 12, scope: !40)
!49 = !DILocation(line: 28, column: 5, scope: !40)
!50 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_memcpy_42_good", scope: !14, file: !14, line: 74, type: !15, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!51 = !DILocation(line: 76, column: 5, scope: !50)
!52 = !DILocation(line: 77, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 89, type: !54, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !14, line: 89, type: !56)
!59 = !DILocation(line: 89, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !14, line: 89, type: !57)
!61 = !DILocation(line: 89, column: 27, scope: !53)
!62 = !DILocation(line: 92, column: 22, scope: !53)
!63 = !DILocation(line: 92, column: 12, scope: !53)
!64 = !DILocation(line: 92, column: 5, scope: !53)
!65 = !DILocation(line: 94, column: 5, scope: !53)
!66 = !DILocation(line: 95, column: 5, scope: !53)
!67 = !DILocation(line: 96, column: 5, scope: !53)
!68 = !DILocation(line: 99, column: 5, scope: !53)
!69 = !DILocation(line: 100, column: 5, scope: !53)
!70 = !DILocation(line: 101, column: 5, scope: !53)
!71 = !DILocation(line: 103, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 61, type: !3)
!74 = !DILocation(line: 61, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !14, line: 62, type: !3)
!76 = !DILocation(line: 62, column: 12, scope: !72)
!77 = !DILocation(line: 62, column: 33, scope: !72)
!78 = !DILocation(line: 63, column: 12, scope: !72)
!79 = !DILocation(line: 63, column: 10, scope: !72)
!80 = !DILocation(line: 64, column: 26, scope: !72)
!81 = !DILocation(line: 64, column: 12, scope: !72)
!82 = !DILocation(line: 64, column: 10, scope: !72)
!83 = !DILocalVariable(name: "dest", scope: !84, file: !14, line: 66, type: !30)
!84 = distinct !DILexicalBlock(scope: !72, file: !14, line: 65, column: 5)
!85 = !DILocation(line: 66, column: 14, scope: !84)
!86 = !DILocation(line: 68, column: 9, scope: !84)
!87 = !DILocation(line: 69, column: 9, scope: !84)
!88 = !DILocation(line: 69, column: 20, scope: !84)
!89 = !DILocation(line: 70, column: 19, scope: !84)
!90 = !DILocation(line: 70, column: 9, scope: !84)
!91 = !DILocation(line: 72, column: 1, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2BSource", scope: !14, file: !14, line: 50, type: !41, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!93 = !DILocalVariable(name: "data", arg: 1, scope: !92, file: !14, line: 50, type: !3)
!94 = !DILocation(line: 50, column: 36, scope: !92)
!95 = !DILocation(line: 53, column: 5, scope: !92)
!96 = !DILocation(line: 54, column: 5, scope: !92)
!97 = !DILocation(line: 54, column: 16, scope: !92)
!98 = !DILocation(line: 55, column: 12, scope: !92)
!99 = !DILocation(line: 55, column: 5, scope: !92)
