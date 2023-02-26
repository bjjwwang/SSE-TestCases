; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  br label %while.body, !dbg !26

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  store i8* %2, i8** %data, align 8, !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %while.end, !dbg !32

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !33, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !39
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx1, align 1, !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !42
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !42
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !42
  %7 = load i8*, i8** %data, align 8, !dbg !43
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !43
  store i8 0, i8* %arrayidx3, align 1, !dbg !44
  %8 = load i8*, i8** %data, align 8, !dbg !45
  call void @printLine(i8* noundef %8), !dbg !46
  ret void, !dbg !47
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16_good() #0 !dbg !48 {
entry:
  call void @goodG2B(), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !51 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = alloca i8, i64 50, align 16, !dbg !75
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %1 = alloca i8, i64 100, align 16, !dbg !78
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !77
  br label %while.body, !dbg !79

while.body:                                       ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !80
  store i8* %2, i8** %data, align 8, !dbg !82
  %3 = load i8*, i8** %data, align 8, !dbg !83
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !83
  store i8 0, i8* %arrayidx, align 1, !dbg !84
  br label %while.end, !dbg !85

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !89
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !90
  store i8 0, i8* %arrayidx1, align 1, !dbg !91
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !92
  %5 = load i8*, i8** %data, align 8, !dbg !92
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !92
  %call = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %arraydecay2, i64 noundef 100, i64 noundef %6) #5, !dbg !92
  %7 = load i8*, i8** %data, align 8, !dbg !93
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 99, !dbg !93
  store i8 0, i8* %arrayidx3, align 1, !dbg !94
  %8 = load i8*, i8** %data, align 8, !dbg !95
  call void @printLine(i8* noundef %8), !dbg !96
  ret void, !dbg !97
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 32, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 5)
!29 = !DILocation(line: 32, column: 14, scope: !28)
!30 = !DILocation(line: 33, column: 9, scope: !28)
!31 = !DILocation(line: 33, column: 17, scope: !28)
!32 = !DILocation(line: 34, column: 9, scope: !28)
!33 = !DILocalVariable(name: "source", scope: !34, file: !14, line: 37, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 36, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 37, column: 14, scope: !34)
!39 = !DILocation(line: 38, column: 9, scope: !34)
!40 = !DILocation(line: 39, column: 9, scope: !34)
!41 = !DILocation(line: 39, column: 23, scope: !34)
!42 = !DILocation(line: 41, column: 9, scope: !34)
!43 = !DILocation(line: 42, column: 9, scope: !34)
!44 = !DILocation(line: 42, column: 21, scope: !34)
!45 = !DILocation(line: 43, column: 19, scope: !34)
!46 = !DILocation(line: 43, column: 9, scope: !34)
!47 = !DILocation(line: 45, column: 1, scope: !13)
!48 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_memcpy_16_good", scope: !14, file: !14, line: 75, type: !15, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!49 = !DILocation(line: 77, column: 5, scope: !48)
!50 = !DILocation(line: 78, column: 1, scope: !48)
!51 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 90, type: !52, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !14, line: 90, type: !54)
!57 = !DILocation(line: 90, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !14, line: 90, type: !55)
!59 = !DILocation(line: 90, column: 27, scope: !51)
!60 = !DILocation(line: 93, column: 22, scope: !51)
!61 = !DILocation(line: 93, column: 12, scope: !51)
!62 = !DILocation(line: 93, column: 5, scope: !51)
!63 = !DILocation(line: 95, column: 5, scope: !51)
!64 = !DILocation(line: 96, column: 5, scope: !51)
!65 = !DILocation(line: 97, column: 5, scope: !51)
!66 = !DILocation(line: 100, column: 5, scope: !51)
!67 = !DILocation(line: 101, column: 5, scope: !51)
!68 = !DILocation(line: 102, column: 5, scope: !51)
!69 = !DILocation(line: 104, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 52, type: !15, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!71 = !DILocalVariable(name: "data", scope: !70, file: !14, line: 54, type: !3)
!72 = !DILocation(line: 54, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !14, line: 55, type: !3)
!74 = !DILocation(line: 55, column: 12, scope: !70)
!75 = !DILocation(line: 55, column: 36, scope: !70)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !14, line: 56, type: !3)
!77 = !DILocation(line: 56, column: 12, scope: !70)
!78 = !DILocation(line: 56, column: 37, scope: !70)
!79 = !DILocation(line: 57, column: 5, scope: !70)
!80 = !DILocation(line: 60, column: 16, scope: !81)
!81 = distinct !DILexicalBlock(scope: !70, file: !14, line: 58, column: 5)
!82 = !DILocation(line: 60, column: 14, scope: !81)
!83 = !DILocation(line: 61, column: 9, scope: !81)
!84 = !DILocation(line: 61, column: 17, scope: !81)
!85 = !DILocation(line: 62, column: 9, scope: !81)
!86 = !DILocalVariable(name: "source", scope: !87, file: !14, line: 65, type: !35)
!87 = distinct !DILexicalBlock(scope: !70, file: !14, line: 64, column: 5)
!88 = !DILocation(line: 65, column: 14, scope: !87)
!89 = !DILocation(line: 66, column: 9, scope: !87)
!90 = !DILocation(line: 67, column: 9, scope: !87)
!91 = !DILocation(line: 67, column: 23, scope: !87)
!92 = !DILocation(line: 69, column: 9, scope: !87)
!93 = !DILocation(line: 70, column: 9, scope: !87)
!94 = !DILocation(line: 70, column: 21, scope: !87)
!95 = !DILocation(line: 71, column: 19, scope: !87)
!96 = !DILocation(line: 71, column: 9, scope: !87)
!97 = !DILocation(line: 73, column: 1, scope: !70)
