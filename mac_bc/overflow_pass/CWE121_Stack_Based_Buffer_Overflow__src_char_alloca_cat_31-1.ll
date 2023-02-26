; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
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
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !28, metadata !DIExpression()), !dbg !30
  %6 = load i8*, i8** %data, align 8, !dbg !31
  store i8* %6, i8** %dataCopy, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !32, metadata !DIExpression()), !dbg !33
  %7 = load i8*, i8** %dataCopy, align 8, !dbg !34
  store i8* %7, i8** %data1, align 8, !dbg !33
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %9 = load i8*, i8** %data1, align 8, !dbg !41
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %9, i64 noundef 50) #5, !dbg !41
  %10 = load i8*, i8** %data1, align 8, !dbg !42
  call void @printLine(i8* noundef %10), !dbg !43
  ret void, !dbg !44
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
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #2

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dataCopy = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = alloca i8, i64 100, align 16, !dbg !72
  store i8* %0, i8** %dataBuffer, align 8, !dbg !71
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !73
  store i8* %1, i8** %data, align 8, !dbg !74
  %2 = load i8*, i8** %data, align 8, !dbg !75
  %3 = load i8*, i8** %data, align 8, !dbg !75
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !75
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !75
  %5 = load i8*, i8** %data, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  call void @llvm.dbg.declare(metadata i8** %dataCopy, metadata !78, metadata !DIExpression()), !dbg !80
  %6 = load i8*, i8** %data, align 8, !dbg !81
  store i8* %6, i8** %dataCopy, align 8, !dbg !80
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !82, metadata !DIExpression()), !dbg !83
  %7 = load i8*, i8** %dataCopy, align 8, !dbg !84
  store i8* %7, i8** %data1, align 8, !dbg !83
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !85, metadata !DIExpression()), !dbg !87
  %8 = bitcast [50 x i8]* %dest to i8*, !dbg !87
  call void @llvm.memset.p0i8.i64(i8* align 16 %8, i8 0, i64 50, i1 false), !dbg !87
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !88
  %9 = load i8*, i8** %data1, align 8, !dbg !88
  %call2 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %9, i64 noundef 50) #5, !dbg !88
  %10 = load i8*, i8** %data1, align 8, !dbg !89
  call void @printLine(i8* noundef %10), !dbg !90
  ret void, !dbg !91
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!25 = !DILocation(line: 29, column: 5, scope: !13)
!26 = !DILocation(line: 30, column: 5, scope: !13)
!27 = !DILocation(line: 30, column: 17, scope: !13)
!28 = !DILocalVariable(name: "dataCopy", scope: !29, file: !14, line: 32, type: !3)
!29 = distinct !DILexicalBlock(scope: !13, file: !14, line: 31, column: 5)
!30 = !DILocation(line: 32, column: 16, scope: !29)
!31 = !DILocation(line: 32, column: 27, scope: !29)
!32 = !DILocalVariable(name: "data", scope: !29, file: !14, line: 33, type: !3)
!33 = !DILocation(line: 33, column: 16, scope: !29)
!34 = !DILocation(line: 33, column: 23, scope: !29)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !14, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !29, file: !14, line: 34, column: 9)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 35, column: 18, scope: !36)
!41 = !DILocation(line: 37, column: 13, scope: !36)
!42 = !DILocation(line: 38, column: 23, scope: !36)
!43 = !DILocation(line: 38, column: 13, scope: !36)
!44 = !DILocation(line: 41, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_char_alloca_cat_31_good", scope: !14, file: !14, line: 68, type: !15, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocation(line: 70, column: 5, scope: !45)
!47 = !DILocation(line: 71, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 82, type: !49, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !14, line: 82, type: !51)
!54 = !DILocation(line: 82, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !14, line: 82, type: !52)
!56 = !DILocation(line: 82, column: 27, scope: !48)
!57 = !DILocation(line: 85, column: 22, scope: !48)
!58 = !DILocation(line: 85, column: 12, scope: !48)
!59 = !DILocation(line: 85, column: 5, scope: !48)
!60 = !DILocation(line: 87, column: 5, scope: !48)
!61 = !DILocation(line: 88, column: 5, scope: !48)
!62 = !DILocation(line: 89, column: 5, scope: !48)
!63 = !DILocation(line: 92, column: 5, scope: !48)
!64 = !DILocation(line: 93, column: 5, scope: !48)
!65 = !DILocation(line: 94, column: 5, scope: !48)
!66 = !DILocation(line: 96, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!68 = !DILocalVariable(name: "data", scope: !67, file: !14, line: 50, type: !3)
!69 = !DILocation(line: 50, column: 12, scope: !67)
!70 = !DILocalVariable(name: "dataBuffer", scope: !67, file: !14, line: 51, type: !3)
!71 = !DILocation(line: 51, column: 12, scope: !67)
!72 = !DILocation(line: 51, column: 33, scope: !67)
!73 = !DILocation(line: 52, column: 12, scope: !67)
!74 = !DILocation(line: 52, column: 10, scope: !67)
!75 = !DILocation(line: 54, column: 5, scope: !67)
!76 = !DILocation(line: 55, column: 5, scope: !67)
!77 = !DILocation(line: 55, column: 16, scope: !67)
!78 = !DILocalVariable(name: "dataCopy", scope: !79, file: !14, line: 57, type: !3)
!79 = distinct !DILexicalBlock(scope: !67, file: !14, line: 56, column: 5)
!80 = !DILocation(line: 57, column: 16, scope: !79)
!81 = !DILocation(line: 57, column: 27, scope: !79)
!82 = !DILocalVariable(name: "data", scope: !79, file: !14, line: 58, type: !3)
!83 = !DILocation(line: 58, column: 16, scope: !79)
!84 = !DILocation(line: 58, column: 23, scope: !79)
!85 = !DILocalVariable(name: "dest", scope: !86, file: !14, line: 60, type: !37)
!86 = distinct !DILexicalBlock(scope: !79, file: !14, line: 59, column: 9)
!87 = !DILocation(line: 60, column: 18, scope: !86)
!88 = !DILocation(line: 62, column: 13, scope: !86)
!89 = !DILocation(line: 63, column: 23, scope: !86)
!90 = !DILocation(line: 63, column: 13, scope: !86)
!91 = !DILocation(line: 66, column: 1, scope: !67)
