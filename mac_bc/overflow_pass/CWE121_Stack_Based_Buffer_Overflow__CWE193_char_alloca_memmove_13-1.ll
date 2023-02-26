; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13_bad() #0 !dbg !13 {
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
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !26
  %cmp = icmp eq i32 %2, 5, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  store i8* %3, i8** %data, align 8, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !42
  %add = add i64 %call, 1, !dbg !42
  %mul = mul i64 %add, 1, !dbg !42
  %7 = load i8*, i8** %data, align 8, !dbg !42
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !42
  %call2 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %8) #5, !dbg !42
  %9 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* noundef %9), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @strlen(i8* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = alloca i8, i64 10, align 16, !dbg !74
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %1 = alloca i8, i64 11, align 16, !dbg !77
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !76
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !78
  %cmp = icmp ne i32 %2, 5, !dbg !80
  br i1 %cmp, label %if.then, label %if.else, !dbg !81

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !84

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !85
  store i8* %3, i8** %data, align 8, !dbg !87
  %4 = load i8*, i8** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !88
  store i8 0, i8* %arrayidx, align 1, !dbg !89
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !90, metadata !DIExpression()), !dbg !92
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !92
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !93
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !93
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !93
  %add = add i64 %call, 1, !dbg !93
  %mul = mul i64 %add, 1, !dbg !93
  %7 = load i8*, i8** %data, align 8, !dbg !93
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !93
  %call2 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %8) #5, !dbg !93
  %9 = load i8*, i8** %data, align 8, !dbg !94
  call void @printLine(i8* noundef %9), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %0 = alloca i8, i64 10, align 16, !dbg !102
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !101
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %1 = alloca i8, i64 11, align 16, !dbg !105
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !104
  %2 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !106
  %cmp = icmp eq i32 %2, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !110
  store i8* %3, i8** %data, align 8, !dbg !112
  %4 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %5 = bitcast [11 x i8]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !118
  %6 = load i8*, i8** %data, align 8, !dbg !119
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !119
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !119
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !119
  %add = add i64 %call, 1, !dbg !119
  %mul = mul i64 %add, 1, !dbg !119
  %7 = load i8*, i8** %data, align 8, !dbg !119
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !119
  %call2 = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %8) #5, !dbg !119
  %9 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* noundef %9), !dbg !121
  ret void, !dbg !122
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 31, type: !3)
!21 = !DILocation(line: 31, column: 12, scope: !13)
!22 = !DILocation(line: 31, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 12, scope: !13)
!25 = !DILocation(line: 32, column: 37, scope: !13)
!26 = !DILocation(line: 33, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 33, column: 8)
!28 = !DILocation(line: 33, column: 25, scope: !27)
!29 = !DILocation(line: 33, column: 8, scope: !13)
!30 = !DILocation(line: 37, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !14, line: 34, column: 5)
!32 = !DILocation(line: 37, column: 14, scope: !31)
!33 = !DILocation(line: 38, column: 9, scope: !31)
!34 = !DILocation(line: 38, column: 17, scope: !31)
!35 = !DILocation(line: 39, column: 5, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !14, line: 41, type: !38)
!37 = distinct !DILexicalBlock(scope: !13, file: !14, line: 40, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DILocation(line: 41, column: 14, scope: !37)
!42 = !DILocation(line: 44, column: 9, scope: !37)
!43 = !DILocation(line: 45, column: 19, scope: !37)
!44 = !DILocation(line: 45, column: 9, scope: !37)
!45 = !DILocation(line: 47, column: 1, scope: !13)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_memmove_13_good", scope: !14, file: !14, line: 102, type: !15, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!47 = !DILocation(line: 104, column: 5, scope: !46)
!48 = !DILocation(line: 105, column: 5, scope: !46)
!49 = !DILocation(line: 106, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 118, type: !51, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !14, line: 118, type: !53)
!56 = !DILocation(line: 118, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !14, line: 118, type: !54)
!58 = !DILocation(line: 118, column: 27, scope: !50)
!59 = !DILocation(line: 121, column: 22, scope: !50)
!60 = !DILocation(line: 121, column: 12, scope: !50)
!61 = !DILocation(line: 121, column: 5, scope: !50)
!62 = !DILocation(line: 123, column: 5, scope: !50)
!63 = !DILocation(line: 124, column: 5, scope: !50)
!64 = !DILocation(line: 125, column: 5, scope: !50)
!65 = !DILocation(line: 128, column: 5, scope: !50)
!66 = !DILocation(line: 129, column: 5, scope: !50)
!67 = !DILocation(line: 130, column: 5, scope: !50)
!68 = !DILocation(line: 132, column: 5, scope: !50)
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 54, type: !15, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!70 = !DILocalVariable(name: "data", scope: !69, file: !14, line: 56, type: !3)
!71 = !DILocation(line: 56, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !14, line: 57, type: !3)
!73 = !DILocation(line: 57, column: 12, scope: !69)
!74 = !DILocation(line: 57, column: 36, scope: !69)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !14, line: 58, type: !3)
!76 = !DILocation(line: 58, column: 12, scope: !69)
!77 = !DILocation(line: 58, column: 37, scope: !69)
!78 = !DILocation(line: 59, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !69, file: !14, line: 59, column: 8)
!80 = !DILocation(line: 59, column: 25, scope: !79)
!81 = !DILocation(line: 59, column: 8, scope: !69)
!82 = !DILocation(line: 62, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !14, line: 60, column: 5)
!84 = !DILocation(line: 63, column: 5, scope: !83)
!85 = !DILocation(line: 68, column: 16, scope: !86)
!86 = distinct !DILexicalBlock(scope: !79, file: !14, line: 65, column: 5)
!87 = !DILocation(line: 68, column: 14, scope: !86)
!88 = !DILocation(line: 69, column: 9, scope: !86)
!89 = !DILocation(line: 69, column: 17, scope: !86)
!90 = !DILocalVariable(name: "source", scope: !91, file: !14, line: 72, type: !38)
!91 = distinct !DILexicalBlock(scope: !69, file: !14, line: 71, column: 5)
!92 = !DILocation(line: 72, column: 14, scope: !91)
!93 = !DILocation(line: 75, column: 9, scope: !91)
!94 = !DILocation(line: 76, column: 19, scope: !91)
!95 = !DILocation(line: 76, column: 9, scope: !91)
!96 = !DILocation(line: 78, column: 1, scope: !69)
!97 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 81, type: !15, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!98 = !DILocalVariable(name: "data", scope: !97, file: !14, line: 83, type: !3)
!99 = !DILocation(line: 83, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !14, line: 84, type: !3)
!101 = !DILocation(line: 84, column: 12, scope: !97)
!102 = !DILocation(line: 84, column: 36, scope: !97)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !14, line: 85, type: !3)
!104 = !DILocation(line: 85, column: 12, scope: !97)
!105 = !DILocation(line: 85, column: 37, scope: !97)
!106 = !DILocation(line: 86, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !97, file: !14, line: 86, column: 8)
!108 = !DILocation(line: 86, column: 25, scope: !107)
!109 = !DILocation(line: 86, column: 8, scope: !97)
!110 = !DILocation(line: 90, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !14, line: 87, column: 5)
!112 = !DILocation(line: 90, column: 14, scope: !111)
!113 = !DILocation(line: 91, column: 9, scope: !111)
!114 = !DILocation(line: 91, column: 17, scope: !111)
!115 = !DILocation(line: 92, column: 5, scope: !111)
!116 = !DILocalVariable(name: "source", scope: !117, file: !14, line: 94, type: !38)
!117 = distinct !DILexicalBlock(scope: !97, file: !14, line: 93, column: 5)
!118 = !DILocation(line: 94, column: 14, scope: !117)
!119 = !DILocation(line: 97, column: 9, scope: !117)
!120 = !DILocation(line: 98, column: 19, scope: !117)
!121 = !DILocation(line: 98, column: 9, scope: !117)
!122 = !DILocation(line: 100, column: 1, scope: !97)
