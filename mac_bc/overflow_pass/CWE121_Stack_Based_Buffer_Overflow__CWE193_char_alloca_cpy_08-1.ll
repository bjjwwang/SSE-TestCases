; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 10, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 11, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %call = call i32 @staticReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !40
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !40
  %5 = load i8*, i8** %data, align 8, !dbg !41
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !41
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !41
  %call1 = call i8* @__strcpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %7) #5, !dbg !41
  %8 = load i8*, i8** %data, align 8, !dbg !42
  call void @printLine(i8* noundef %8), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__strcpy_chk(i8* noundef, i8* noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_good() #0 !dbg !45 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad(), !dbg !65
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = alloca i8, i64 10, align 16, !dbg !77
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !76
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %1 = alloca i8, i64 11, align 16, !dbg !80
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !79
  %call = call i32 @staticReturnsFalse(), !dbg !81
  %tobool = icmp ne i32 %call, 0, !dbg !81
  br i1 %tobool, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !87
  store i8* %2, i8** %data, align 8, !dbg !89
  %3 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !94
  %5 = load i8*, i8** %data, align 8, !dbg !95
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !95
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !95
  %call1 = call i8* @__strcpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %7) #5, !dbg !95
  %8 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* noundef %8), !dbg !97
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
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = alloca i8, i64 10, align 16, !dbg !106
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %1 = alloca i8, i64 11, align 16, !dbg !109
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !108
  %call = call i32 @staticReturnsTrue(), !dbg !110
  %tobool = icmp ne i32 %call, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  store i8* %2, i8** %data, align 8, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end, !dbg !118

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !121
  %5 = load i8*, i8** %data, align 8, !dbg !122
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !122
  %6 = load i8*, i8** %data, align 8, !dbg !122
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !122
  %call1 = call i8* @__strcpy_chk(i8* noundef %5, i8* noundef %arraydecay, i64 noundef %7) #5, !dbg !122
  %8 = load i8*, i8** %data, align 8, !dbg !123
  call void @printLine(i8* noundef %8), !dbg !124
  ret void, !dbg !125
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_bad", scope: !14, file: !14, line: 42, type: !15, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 44, type: !3)
!19 = !DILocation(line: 44, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 45, type: !3)
!21 = !DILocation(line: 45, column: 12, scope: !13)
!22 = !DILocation(line: 45, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 46, type: !3)
!24 = !DILocation(line: 46, column: 12, scope: !13)
!25 = !DILocation(line: 46, column: 37, scope: !13)
!26 = !DILocation(line: 47, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 47, column: 8)
!28 = !DILocation(line: 47, column: 8, scope: !13)
!29 = !DILocation(line: 51, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 48, column: 5)
!31 = !DILocation(line: 51, column: 14, scope: !30)
!32 = !DILocation(line: 52, column: 9, scope: !30)
!33 = !DILocation(line: 52, column: 17, scope: !30)
!34 = !DILocation(line: 53, column: 5, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 55, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 54, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 55, column: 14, scope: !36)
!41 = !DILocation(line: 57, column: 9, scope: !36)
!42 = !DILocation(line: 58, column: 19, scope: !36)
!43 = !DILocation(line: 58, column: 9, scope: !36)
!44 = !DILocation(line: 60, column: 1, scope: !13)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_cpy_08_good", scope: !14, file: !14, line: 113, type: !15, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!46 = !DILocation(line: 115, column: 5, scope: !45)
!47 = !DILocation(line: 116, column: 5, scope: !45)
!48 = !DILocation(line: 117, column: 1, scope: !45)
!49 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 129, type: !50, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!50 = !DISubroutineType(types: !51)
!51 = !{!52, !52, !53}
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !14, line: 129, type: !52)
!55 = !DILocation(line: 129, column: 14, scope: !49)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !14, line: 129, type: !53)
!57 = !DILocation(line: 129, column: 27, scope: !49)
!58 = !DILocation(line: 132, column: 22, scope: !49)
!59 = !DILocation(line: 132, column: 12, scope: !49)
!60 = !DILocation(line: 132, column: 5, scope: !49)
!61 = !DILocation(line: 134, column: 5, scope: !49)
!62 = !DILocation(line: 135, column: 5, scope: !49)
!63 = !DILocation(line: 136, column: 5, scope: !49)
!64 = !DILocation(line: 139, column: 5, scope: !49)
!65 = !DILocation(line: 140, column: 5, scope: !49)
!66 = !DILocation(line: 141, column: 5, scope: !49)
!67 = !DILocation(line: 143, column: 5, scope: !49)
!68 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !14, file: !14, line: 30, type: !69, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!69 = !DISubroutineType(types: !70)
!70 = !{!52}
!71 = !DILocation(line: 32, column: 5, scope: !68)
!72 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 67, type: !15, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocalVariable(name: "data", scope: !72, file: !14, line: 69, type: !3)
!74 = !DILocation(line: 69, column: 12, scope: !72)
!75 = !DILocalVariable(name: "dataBadBuffer", scope: !72, file: !14, line: 70, type: !3)
!76 = !DILocation(line: 70, column: 12, scope: !72)
!77 = !DILocation(line: 70, column: 36, scope: !72)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !72, file: !14, line: 71, type: !3)
!79 = !DILocation(line: 71, column: 12, scope: !72)
!80 = !DILocation(line: 71, column: 37, scope: !72)
!81 = !DILocation(line: 72, column: 8, scope: !82)
!82 = distinct !DILexicalBlock(scope: !72, file: !14, line: 72, column: 8)
!83 = !DILocation(line: 72, column: 8, scope: !72)
!84 = !DILocation(line: 75, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !14, line: 73, column: 5)
!86 = !DILocation(line: 76, column: 5, scope: !85)
!87 = !DILocation(line: 81, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !14, line: 78, column: 5)
!89 = !DILocation(line: 81, column: 14, scope: !88)
!90 = !DILocation(line: 82, column: 9, scope: !88)
!91 = !DILocation(line: 82, column: 17, scope: !88)
!92 = !DILocalVariable(name: "source", scope: !93, file: !14, line: 85, type: !37)
!93 = distinct !DILexicalBlock(scope: !72, file: !14, line: 84, column: 5)
!94 = !DILocation(line: 85, column: 14, scope: !93)
!95 = !DILocation(line: 87, column: 9, scope: !93)
!96 = !DILocation(line: 88, column: 19, scope: !93)
!97 = !DILocation(line: 88, column: 9, scope: !93)
!98 = !DILocation(line: 90, column: 1, scope: !72)
!99 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !14, file: !14, line: 35, type: !69, scopeLine: 36, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!100 = !DILocation(line: 37, column: 5, scope: !99)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 93, type: !15, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!102 = !DILocalVariable(name: "data", scope: !101, file: !14, line: 95, type: !3)
!103 = !DILocation(line: 95, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !14, line: 96, type: !3)
!105 = !DILocation(line: 96, column: 12, scope: !101)
!106 = !DILocation(line: 96, column: 36, scope: !101)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !14, line: 97, type: !3)
!108 = !DILocation(line: 97, column: 12, scope: !101)
!109 = !DILocation(line: 97, column: 37, scope: !101)
!110 = !DILocation(line: 98, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !14, line: 98, column: 8)
!112 = !DILocation(line: 98, column: 8, scope: !101)
!113 = !DILocation(line: 102, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !14, line: 99, column: 5)
!115 = !DILocation(line: 102, column: 14, scope: !114)
!116 = !DILocation(line: 103, column: 9, scope: !114)
!117 = !DILocation(line: 103, column: 17, scope: !114)
!118 = !DILocation(line: 104, column: 5, scope: !114)
!119 = !DILocalVariable(name: "source", scope: !120, file: !14, line: 106, type: !37)
!120 = distinct !DILexicalBlock(scope: !101, file: !14, line: 105, column: 5)
!121 = !DILocation(line: 106, column: 14, scope: !120)
!122 = !DILocation(line: 108, column: 9, scope: !120)
!123 = !DILocation(line: 109, column: 19, scope: !120)
!124 = !DILocation(line: 109, column: 9, scope: !120)
!125 = !DILocation(line: 111, column: 1, scope: !101)
