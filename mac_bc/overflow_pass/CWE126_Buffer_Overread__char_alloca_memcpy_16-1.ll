; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_16_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !26
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !29
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !29
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !30
  store i8 0, i8* %arrayidx2, align 1, !dbg !31
  br label %while.body, !dbg !32

while.body:                                       ; preds = %entry
  %10 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  store i8* %10, i8** %data, align 8, !dbg !35
  br label %while.end, !dbg !36

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx3, align 1, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %11 = load i8*, i8** %data, align 8, !dbg !46
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !46
  %mul = mul i64 %call6, 1, !dbg !46
  %call7 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #5, !dbg !46
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx8, align 1, !dbg !48
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  call void @printLine(i8* noundef %arraydecay9), !dbg !50
  ret void, !dbg !51
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
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_memcpy_16_good() #0 !dbg !52 {
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
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_16_good(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE126_Buffer_Overread__char_alloca_memcpy_16_bad(), !dbg !71
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  %0 = alloca i8, i64 50, align 16, !dbg !79
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !78
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %1 = alloca i8, i64 100, align 16, !dbg !82
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !81
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !83
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !83
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !83
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !83
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !84
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !84
  store i8 0, i8* %arrayidx, align 1, !dbg !85
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !86
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !86
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !86
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !86
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !87
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !87
  store i8 0, i8* %arrayidx2, align 1, !dbg !88
  br label %while.body, !dbg !89

while.body:                                       ; preds = %entry
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !90
  store i8* %10, i8** %data, align 8, !dbg !92
  br label %while.end, !dbg !93

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !97
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx3, align 1, !dbg !99
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  %11 = load i8*, i8** %data, align 8, !dbg !100
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  %call6 = call i64 @strlen(i8* noundef %arraydecay5), !dbg !100
  %mul = mul i64 %call6, 1, !dbg !100
  %call7 = call i8* @__memcpy_chk(i8* noundef %arraydecay4, i8* noundef %11, i64 noundef %mul, i64 noundef 100) #5, !dbg !100
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !101
  store i8 0, i8* %arrayidx8, align 1, !dbg !102
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !103
  call void @printLine(i8* noundef %arraydecay9), !dbg !104
  ret void, !dbg !105
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_16_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_memcpy_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 5, scope: !13)
!30 = !DILocation(line: 31, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 27, scope: !13)
!32 = !DILocation(line: 32, column: 5, scope: !13)
!33 = !DILocation(line: 35, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 5)
!35 = !DILocation(line: 35, column: 14, scope: !34)
!36 = !DILocation(line: 36, column: 9, scope: !34)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !14, line: 39, type: !39)
!38 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 39, column: 14, scope: !38)
!43 = !DILocation(line: 40, column: 9, scope: !38)
!44 = !DILocation(line: 41, column: 9, scope: !38)
!45 = !DILocation(line: 41, column: 21, scope: !38)
!46 = !DILocation(line: 44, column: 9, scope: !38)
!47 = !DILocation(line: 45, column: 9, scope: !38)
!48 = !DILocation(line: 45, column: 21, scope: !38)
!49 = !DILocation(line: 46, column: 19, scope: !38)
!50 = !DILocation(line: 46, column: 9, scope: !38)
!51 = !DILocation(line: 48, column: 1, scope: !13)
!52 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_memcpy_16_good", scope: !14, file: !14, line: 82, type: !15, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!53 = !DILocation(line: 84, column: 5, scope: !52)
!54 = !DILocation(line: 85, column: 1, scope: !52)
!55 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 97, type: !56, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!56 = !DISubroutineType(types: !57)
!57 = !{!58, !58, !59}
!58 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !14, line: 97, type: !58)
!61 = !DILocation(line: 97, column: 14, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !14, line: 97, type: !59)
!63 = !DILocation(line: 97, column: 27, scope: !55)
!64 = !DILocation(line: 100, column: 22, scope: !55)
!65 = !DILocation(line: 100, column: 12, scope: !55)
!66 = !DILocation(line: 100, column: 5, scope: !55)
!67 = !DILocation(line: 102, column: 5, scope: !55)
!68 = !DILocation(line: 103, column: 5, scope: !55)
!69 = !DILocation(line: 104, column: 5, scope: !55)
!70 = !DILocation(line: 107, column: 5, scope: !55)
!71 = !DILocation(line: 108, column: 5, scope: !55)
!72 = !DILocation(line: 109, column: 5, scope: !55)
!73 = !DILocation(line: 111, column: 5, scope: !55)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!75 = !DILocalVariable(name: "data", scope: !74, file: !14, line: 57, type: !3)
!76 = !DILocation(line: 57, column: 12, scope: !74)
!77 = !DILocalVariable(name: "dataBadBuffer", scope: !74, file: !14, line: 58, type: !3)
!78 = !DILocation(line: 58, column: 12, scope: !74)
!79 = !DILocation(line: 58, column: 36, scope: !74)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !74, file: !14, line: 59, type: !3)
!81 = !DILocation(line: 59, column: 12, scope: !74)
!82 = !DILocation(line: 59, column: 37, scope: !74)
!83 = !DILocation(line: 60, column: 5, scope: !74)
!84 = !DILocation(line: 61, column: 5, scope: !74)
!85 = !DILocation(line: 61, column: 25, scope: !74)
!86 = !DILocation(line: 62, column: 5, scope: !74)
!87 = !DILocation(line: 63, column: 5, scope: !74)
!88 = !DILocation(line: 63, column: 27, scope: !74)
!89 = !DILocation(line: 64, column: 5, scope: !74)
!90 = !DILocation(line: 67, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !74, file: !14, line: 65, column: 5)
!92 = !DILocation(line: 67, column: 14, scope: !91)
!93 = !DILocation(line: 68, column: 9, scope: !91)
!94 = !DILocalVariable(name: "dest", scope: !95, file: !14, line: 71, type: !39)
!95 = distinct !DILexicalBlock(scope: !74, file: !14, line: 70, column: 5)
!96 = !DILocation(line: 71, column: 14, scope: !95)
!97 = !DILocation(line: 72, column: 9, scope: !95)
!98 = !DILocation(line: 73, column: 9, scope: !95)
!99 = !DILocation(line: 73, column: 21, scope: !95)
!100 = !DILocation(line: 76, column: 9, scope: !95)
!101 = !DILocation(line: 77, column: 9, scope: !95)
!102 = !DILocation(line: 77, column: 21, scope: !95)
!103 = !DILocation(line: 78, column: 19, scope: !95)
!104 = !DILocation(line: 78, column: 9, scope: !95)
!105 = !DILocation(line: 80, column: 1, scope: !74)
