; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17_bad() #0 !dbg !15 {
entry:
  %i = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i64** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 400, align 16, !dbg !27
  %1 = bitcast i8* %0 to i64*, !dbg !28
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %2 = alloca i8, i64 800, align 16, !dbg !31
  %3 = bitcast i8* %2 to i64*, !dbg !32
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !30
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !35

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !36
  %cmp = icmp slt i32 %4, 1, !dbg !38
  br i1 %cmp, label %for.body, label %for.end, !dbg !39

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !40
  store i64* %5, i64** %data, align 8, !dbg !42
  br label %for.inc, !dbg !43

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !44
  %inc = add nsw i32 %6, 1, !dbg !44
  store i32 %inc, i32* %i, align 4, !dbg !44
  br label %for.cond, !dbg !45, !llvm.loop !46

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !49, metadata !DIExpression()), !dbg !54
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !54
  %8 = load i64*, i64** %data, align 8, !dbg !55
  %9 = bitcast i64* %8 to i8*, !dbg !55
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !55
  %10 = bitcast i64* %arraydecay to i8*, !dbg !55
  %11 = load i64*, i64** %data, align 8, !dbg !55
  %12 = bitcast i64* %11 to i8*, !dbg !55
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !55
  %call = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %10, i64 noundef 800, i64 noundef %13) #5, !dbg !55
  %14 = load i64*, i64** %data, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i64, i64* %14, i64 0, !dbg !56
  %15 = load i64, i64* %arrayidx, align 8, !dbg !56
  call void @printLongLongLine(i64 noundef %15), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !62 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17_good(), !dbg !76
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17_bad(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %h = alloca i32, align 4
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i64** %data, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %0 = alloca i8, i64 400, align 16, !dbg !89
  %1 = bitcast i8* %0 to i64*, !dbg !90
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !88
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %2 = alloca i8, i64 800, align 16, !dbg !93
  %3 = bitcast i8* %2 to i64*, !dbg !94
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !92
  store i32 0, i32* %h, align 4, !dbg !95
  br label %for.cond, !dbg !97

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !98
  %cmp = icmp slt i32 %4, 1, !dbg !100
  br i1 %cmp, label %for.body, label %for.end, !dbg !101

for.body:                                         ; preds = %for.cond
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !102
  store i64* %5, i64** %data, align 8, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !106
  %inc = add nsw i32 %6, 1, !dbg !106
  store i32 %inc, i32* %h, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %7 = bitcast [100 x i64]* %source to i8*, !dbg !112
  call void @llvm.memset.p0i8.i64(i8* align 16 %7, i8 0, i64 800, i1 false), !dbg !112
  %8 = load i64*, i64** %data, align 8, !dbg !113
  %9 = bitcast i64* %8 to i8*, !dbg !113
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !113
  %10 = bitcast i64* %arraydecay to i8*, !dbg !113
  %11 = load i64*, i64** %data, align 8, !dbg !113
  %12 = bitcast i64* %11 to i8*, !dbg !113
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !113
  %call = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %10, i64 noundef 800, i64 noundef %13) #5, !dbg !113
  %14 = load i64*, i64** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i64, i64* %14, i64 0, !dbg !114
  %15 = load i64, i64* %arrayidx, align 8, !dbg !114
  call void @printLongLongLine(i64 noundef %15), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "i", scope: !15, file: !16, line: 23, type: !21)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocation(line: 23, column: 9, scope: !15)
!23 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 24, type: !3)
!24 = !DILocation(line: 24, column: 15, scope: !15)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 25, type: !3)
!26 = !DILocation(line: 25, column: 15, scope: !15)
!27 = !DILocation(line: 25, column: 42, scope: !15)
!28 = !DILocation(line: 25, column: 31, scope: !15)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 26, type: !3)
!30 = !DILocation(line: 26, column: 15, scope: !15)
!31 = !DILocation(line: 26, column: 43, scope: !15)
!32 = !DILocation(line: 26, column: 32, scope: !15)
!33 = !DILocation(line: 27, column: 11, scope: !34)
!34 = distinct !DILexicalBlock(scope: !15, file: !16, line: 27, column: 5)
!35 = !DILocation(line: 27, column: 9, scope: !34)
!36 = !DILocation(line: 27, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !34, file: !16, line: 27, column: 5)
!38 = !DILocation(line: 27, column: 18, scope: !37)
!39 = !DILocation(line: 27, column: 5, scope: !34)
!40 = !DILocation(line: 31, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !16, line: 28, column: 5)
!42 = !DILocation(line: 31, column: 14, scope: !41)
!43 = !DILocation(line: 32, column: 5, scope: !41)
!44 = !DILocation(line: 27, column: 24, scope: !37)
!45 = !DILocation(line: 27, column: 5, scope: !37)
!46 = distinct !{!46, !39, !47, !48}
!47 = !DILocation(line: 32, column: 5, scope: !34)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocalVariable(name: "source", scope: !50, file: !16, line: 34, type: !51)
!50 = distinct !DILexicalBlock(scope: !15, file: !16, line: 33, column: 5)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 34, column: 17, scope: !50)
!55 = !DILocation(line: 36, column: 9, scope: !50)
!56 = !DILocation(line: 37, column: 27, scope: !50)
!57 = !DILocation(line: 37, column: 9, scope: !50)
!58 = !DILocation(line: 39, column: 1, scope: !15)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_memmove_17_good", scope: !16, file: !16, line: 65, type: !17, scopeLine: 66, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!60 = !DILocation(line: 67, column: 5, scope: !59)
!61 = !DILocation(line: 68, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 80, type: !63, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!63 = !DISubroutineType(types: !64)
!64 = !{!21, !21, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !16, line: 80, type: !21)
!69 = !DILocation(line: 80, column: 14, scope: !62)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !16, line: 80, type: !65)
!71 = !DILocation(line: 80, column: 27, scope: !62)
!72 = !DILocation(line: 83, column: 22, scope: !62)
!73 = !DILocation(line: 83, column: 12, scope: !62)
!74 = !DILocation(line: 83, column: 5, scope: !62)
!75 = !DILocation(line: 85, column: 5, scope: !62)
!76 = !DILocation(line: 86, column: 5, scope: !62)
!77 = !DILocation(line: 87, column: 5, scope: !62)
!78 = !DILocation(line: 90, column: 5, scope: !62)
!79 = !DILocation(line: 91, column: 5, scope: !62)
!80 = !DILocation(line: 92, column: 5, scope: !62)
!81 = !DILocation(line: 94, column: 5, scope: !62)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !16, file: !16, line: 46, type: !17, scopeLine: 47, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!83 = !DILocalVariable(name: "h", scope: !82, file: !16, line: 48, type: !21)
!84 = !DILocation(line: 48, column: 9, scope: !82)
!85 = !DILocalVariable(name: "data", scope: !82, file: !16, line: 49, type: !3)
!86 = !DILocation(line: 49, column: 15, scope: !82)
!87 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !16, line: 50, type: !3)
!88 = !DILocation(line: 50, column: 15, scope: !82)
!89 = !DILocation(line: 50, column: 42, scope: !82)
!90 = !DILocation(line: 50, column: 31, scope: !82)
!91 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !16, line: 51, type: !3)
!92 = !DILocation(line: 51, column: 15, scope: !82)
!93 = !DILocation(line: 51, column: 43, scope: !82)
!94 = !DILocation(line: 51, column: 32, scope: !82)
!95 = !DILocation(line: 52, column: 11, scope: !96)
!96 = distinct !DILexicalBlock(scope: !82, file: !16, line: 52, column: 5)
!97 = !DILocation(line: 52, column: 9, scope: !96)
!98 = !DILocation(line: 52, column: 16, scope: !99)
!99 = distinct !DILexicalBlock(scope: !96, file: !16, line: 52, column: 5)
!100 = !DILocation(line: 52, column: 18, scope: !99)
!101 = !DILocation(line: 52, column: 5, scope: !96)
!102 = !DILocation(line: 55, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !16, line: 53, column: 5)
!104 = !DILocation(line: 55, column: 14, scope: !103)
!105 = !DILocation(line: 56, column: 5, scope: !103)
!106 = !DILocation(line: 52, column: 24, scope: !99)
!107 = !DILocation(line: 52, column: 5, scope: !99)
!108 = distinct !{!108, !101, !109, !48}
!109 = !DILocation(line: 56, column: 5, scope: !96)
!110 = !DILocalVariable(name: "source", scope: !111, file: !16, line: 58, type: !51)
!111 = distinct !DILexicalBlock(scope: !82, file: !16, line: 57, column: 5)
!112 = !DILocation(line: 58, column: 17, scope: !111)
!113 = !DILocation(line: 60, column: 9, scope: !111)
!114 = !DILocation(line: 61, column: 27, scope: !111)
!115 = !DILocation(line: 61, column: 9, scope: !111)
!116 = !DILocation(line: 63, column: 1, scope: !82)
