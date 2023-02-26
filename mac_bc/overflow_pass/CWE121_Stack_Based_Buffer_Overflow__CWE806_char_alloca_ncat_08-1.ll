; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08_bad() #0 !dbg !13 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !25
  %tobool = icmp ne i32 %call, 0, !dbg !25
  br i1 %tobool, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !28
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !28
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !28
  %5 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !33, metadata !DIExpression()), !dbg !38
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !38
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !38
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !39
  %7 = load i8*, i8** %data, align 8, !dbg !39
  %8 = load i8*, i8** %data, align 8, !dbg !39
  %call2 = call i64 @strlen(i8* noundef %8), !dbg !39
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call2, i64 noundef 50) #5, !dbg !39
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !40
  store i8 0, i8* %arrayidx4, align 1, !dbg !41
  %9 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %9), !dbg !43
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
declare i8* @__strncat_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08_good() #0 !dbg !45 {
entry:
  call void @goodG2B1(), !dbg !46
  call void @goodG2B2(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* noundef null), !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 noundef %conv), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08_bad(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !68 {
entry:
  ret i32 1, !dbg !71
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !72 {
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
  %call = call i32 @staticReturnsFalse(), !dbg !80
  %tobool = icmp ne i32 %call, 0, !dbg !80
  br i1 %tobool, label %if.then, label %if.else, !dbg !82

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  br label %if.end, !dbg !85

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !86
  %3 = load i8*, i8** %data, align 8, !dbg !86
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !86
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !86
  %5 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !90, metadata !DIExpression()), !dbg !92
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !92
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !93
  %7 = load i8*, i8** %data, align 8, !dbg !93
  %8 = load i8*, i8** %data, align 8, !dbg !93
  %call2 = call i64 @strlen(i8* noundef %8), !dbg !93
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call2, i64 noundef 50) #5, !dbg !93
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !94
  store i8 0, i8* %arrayidx4, align 1, !dbg !95
  %9 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* noundef %9), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !99 {
entry:
  ret i32 0, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %0, i8** %dataBuffer, align 8, !dbg !105
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !107
  store i8* %1, i8** %data, align 8, !dbg !108
  %call = call i32 @staticReturnsTrue(), !dbg !109
  %tobool = icmp ne i32 %call, 0, !dbg !109
  br i1 %tobool, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %data, align 8, !dbg !112
  %3 = load i8*, i8** %data, align 8, !dbg !112
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !112
  %call1 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !114
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  br label %if.end, !dbg !116

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !120
  %7 = load i8*, i8** %data, align 8, !dbg !120
  %8 = load i8*, i8** %data, align 8, !dbg !120
  %call2 = call i64 @strlen(i8* noundef %8), !dbg !120
  %call3 = call i8* @__strncat_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call2, i64 noundef 50) #5, !dbg !120
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !121
  store i8 0, i8* %arrayidx4, align 1, !dbg !122
  %9 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* noundef %9), !dbg !124
  ret void, !dbg !125
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08_bad", scope: !14, file: !14, line: 37, type: !15, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 39, type: !3)
!19 = !DILocation(line: 39, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 40, type: !3)
!21 = !DILocation(line: 40, column: 12, scope: !13)
!22 = !DILocation(line: 40, column: 33, scope: !13)
!23 = !DILocation(line: 41, column: 12, scope: !13)
!24 = !DILocation(line: 41, column: 10, scope: !13)
!25 = !DILocation(line: 42, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !13, file: !14, line: 42, column: 8)
!27 = !DILocation(line: 42, column: 8, scope: !13)
!28 = !DILocation(line: 45, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !14, line: 43, column: 5)
!30 = !DILocation(line: 46, column: 9, scope: !29)
!31 = !DILocation(line: 46, column: 21, scope: !29)
!32 = !DILocation(line: 47, column: 5, scope: !29)
!33 = !DILocalVariable(name: "dest", scope: !34, file: !14, line: 49, type: !35)
!34 = distinct !DILexicalBlock(scope: !13, file: !14, line: 48, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 50)
!38 = !DILocation(line: 49, column: 14, scope: !34)
!39 = !DILocation(line: 51, column: 9, scope: !34)
!40 = !DILocation(line: 52, column: 9, scope: !34)
!41 = !DILocation(line: 52, column: 20, scope: !34)
!42 = !DILocation(line: 53, column: 19, scope: !34)
!43 = !DILocation(line: 53, column: 9, scope: !34)
!44 = !DILocation(line: 55, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_ncat_08_good", scope: !14, file: !14, line: 108, type: !15, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocation(line: 110, column: 5, scope: !45)
!47 = !DILocation(line: 111, column: 5, scope: !45)
!48 = !DILocation(line: 112, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 124, type: !50, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 124, type: !52)
!55 = !DILocation(line: 124, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 124, type: !53)
!57 = !DILocation(line: 124, column: 27, scope: !49)
!58 = !DILocation(line: 127, column: 22, scope: !49)
!59 = !DILocation(line: 127, column: 12, scope: !49)
!60 = !DILocation(line: 127, column: 5, scope: !49)
!61 = !DILocation(line: 129, column: 5, scope: !49)
!62 = !DILocation(line: 130, column: 5, scope: !49)
!63 = !DILocation(line: 131, column: 5, scope: !49)
!64 = !DILocation(line: 134, column: 5, scope: !49)
!65 = !DILocation(line: 135, column: 5, scope: !49)
!66 = !DILocation(line: 136, column: 5, scope: !49)
!67 = !DILocation(line: 138, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 25, type: !69, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DISubroutineType(types: !70)
!70 = !{!52}
!71 = !DILocation(line: 27, column: 5, scope: !68)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 62, type: !15, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 64, type: !3)
!74 = !DILocation(line: 64, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBuffer", scope: !72, file: !14, line: 65, type: !3)
!76 = !DILocation(line: 65, column: 12, scope: !72)
!77 = !DILocation(line: 65, column: 33, scope: !72)
!78 = !DILocation(line: 66, column: 12, scope: !72)
!79 = !DILocation(line: 66, column: 10, scope: !72)
!80 = !DILocation(line: 67, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !72, file: !14, line: 67, column: 8)
!82 = !DILocation(line: 67, column: 8, scope: !72)
!83 = !DILocation(line: 70, column: 9, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !14, line: 68, column: 5)
!85 = !DILocation(line: 71, column: 5, scope: !84)
!86 = !DILocation(line: 75, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !81, file: !14, line: 73, column: 5)
!88 = !DILocation(line: 76, column: 9, scope: !87)
!89 = !DILocation(line: 76, column: 20, scope: !87)
!90 = !DILocalVariable(name: "dest", scope: !91, file: !14, line: 79, type: !35)
!91 = distinct !DILexicalBlock(scope: !72, file: !14, line: 78, column: 5)
!92 = !DILocation(line: 79, column: 14, scope: !91)
!93 = !DILocation(line: 81, column: 9, scope: !91)
!94 = !DILocation(line: 82, column: 9, scope: !91)
!95 = !DILocation(line: 82, column: 20, scope: !91)
!96 = !DILocation(line: 83, column: 19, scope: !91)
!97 = !DILocation(line: 83, column: 9, scope: !91)
!98 = !DILocation(line: 85, column: 1, scope: !72)
!99 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 30, type: !69, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!100 = !DILocation(line: 32, column: 5, scope: !99)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 90, type: !3)
!103 = !DILocation(line: 90, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !14, line: 91, type: !3)
!105 = !DILocation(line: 91, column: 12, scope: !101)
!106 = !DILocation(line: 91, column: 33, scope: !101)
!107 = !DILocation(line: 92, column: 12, scope: !101)
!108 = !DILocation(line: 92, column: 10, scope: !101)
!109 = !DILocation(line: 93, column: 8, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !14, line: 93, column: 8)
!111 = !DILocation(line: 93, column: 8, scope: !101)
!112 = !DILocation(line: 96, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !14, line: 94, column: 5)
!114 = !DILocation(line: 97, column: 9, scope: !113)
!115 = !DILocation(line: 97, column: 20, scope: !113)
!116 = !DILocation(line: 98, column: 5, scope: !113)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !14, line: 100, type: !35)
!118 = distinct !DILexicalBlock(scope: !101, file: !14, line: 99, column: 5)
!119 = !DILocation(line: 100, column: 14, scope: !118)
!120 = !DILocation(line: 102, column: 9, scope: !118)
!121 = !DILocation(line: 103, column: 9, scope: !118)
!122 = !DILocation(line: 103, column: 20, scope: !118)
!123 = !DILocation(line: 104, column: 19, scope: !118)
!124 = !DILocation(line: 104, column: 9, scope: !118)
!125 = !DILocation(line: 106, column: 1, scope: !101)
