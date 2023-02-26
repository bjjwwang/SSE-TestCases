; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i8* %arraydecay, i8** %data, align 8, !dbg !36
  %1 = load i8*, i8** %data, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !43
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !43
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !43
  %add = add i64 %call, 1, !dbg !43
  %mul = mul i64 %add, 1, !dbg !43
  %4 = load i8*, i8** %data, align 8, !dbg !43
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !43
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !43
  %6 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* noundef %6), !dbg !45
  ret void, !dbg !46
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13_good() #0 !dbg !47 {
entry:
  call void @goodG2B1(), !dbg !48
  call void @goodG2B2(), !dbg !49
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !70 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !71, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !77
  %cmp = icmp ne i32 %0, 5, !dbg !79
  br i1 %cmp, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  br label %if.end, !dbg !83

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !84
  store i8* %arraydecay, i8** %data, align 8, !dbg !86
  %1 = load i8*, i8** %data, align 8, !dbg !87
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !87
  store i8 0, i8* %arrayidx, align 1, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !89, metadata !DIExpression()), !dbg !91
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !91
  %3 = load i8*, i8** %data, align 8, !dbg !92
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !92
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !92
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !92
  %add = add i64 %call, 1, !dbg !92
  %mul = mul i64 %add, 1, !dbg !92
  %4 = load i8*, i8** %data, align 8, !dbg !92
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !92
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !92
  %6 = load i8*, i8** %data, align 8, !dbg !93
  call void @printLine(i8* noundef %6), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !103
  %cmp = icmp eq i32 %0, 5, !dbg !105
  br i1 %cmp, label %if.then, label %if.end, !dbg !106

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !107
  store i8* %arraydecay, i8** %data, align 8, !dbg !109
  %1 = load i8*, i8** %data, align 8, !dbg !110
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  br label %if.end, !dbg !112

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !116
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !116
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !116
  %add = add i64 %call, 1, !dbg !116
  %mul = mul i64 %add, 1, !dbg !116
  %4 = load i8*, i8** %data, align 8, !dbg !116
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !116
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !116
  %6 = load i8*, i8** %data, align 8, !dbg !117
  call void @printLine(i8* noundef %6), !dbg !118
  ret void, !dbg !119
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 30, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 80, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 10)
!24 = !DILocation(line: 31, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 32, column: 10, scope: !11)
!30 = !DILocation(line: 33, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!32 = !DILocation(line: 33, column: 25, scope: !31)
!33 = !DILocation(line: 33, column: 8, scope: !11)
!34 = !DILocation(line: 37, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 5)
!36 = !DILocation(line: 37, column: 14, scope: !35)
!37 = !DILocation(line: 38, column: 9, scope: !35)
!38 = !DILocation(line: 38, column: 17, scope: !35)
!39 = !DILocation(line: 39, column: 5, scope: !35)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 41, type: !26)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!42 = !DILocation(line: 41, column: 14, scope: !41)
!43 = !DILocation(line: 44, column: 9, scope: !41)
!44 = !DILocation(line: 45, column: 19, scope: !41)
!45 = !DILocation(line: 45, column: 9, scope: !41)
!46 = !DILocation(line: 47, column: 1, scope: !11)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_13_good", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!48 = !DILocation(line: 104, column: 5, scope: !47)
!49 = !DILocation(line: 105, column: 5, scope: !47)
!50 = !DILocation(line: 106, column: 1, scope: !47)
!51 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 118, type: !52, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DISubroutineType(types: !53)
!53 = !{!54, !54, !55}
!54 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !51, file: !12, line: 118, type: !54)
!57 = !DILocation(line: 118, column: 14, scope: !51)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !51, file: !12, line: 118, type: !55)
!59 = !DILocation(line: 118, column: 27, scope: !51)
!60 = !DILocation(line: 121, column: 22, scope: !51)
!61 = !DILocation(line: 121, column: 12, scope: !51)
!62 = !DILocation(line: 121, column: 5, scope: !51)
!63 = !DILocation(line: 123, column: 5, scope: !51)
!64 = !DILocation(line: 124, column: 5, scope: !51)
!65 = !DILocation(line: 125, column: 5, scope: !51)
!66 = !DILocation(line: 128, column: 5, scope: !51)
!67 = !DILocation(line: 129, column: 5, scope: !51)
!68 = !DILocation(line: 130, column: 5, scope: !51)
!69 = !DILocation(line: 132, column: 5, scope: !51)
!70 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!71 = !DILocalVariable(name: "data", scope: !70, file: !12, line: 56, type: !17)
!72 = !DILocation(line: 56, column: 12, scope: !70)
!73 = !DILocalVariable(name: "dataBadBuffer", scope: !70, file: !12, line: 57, type: !21)
!74 = !DILocation(line: 57, column: 10, scope: !70)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !70, file: !12, line: 58, type: !26)
!76 = !DILocation(line: 58, column: 10, scope: !70)
!77 = !DILocation(line: 59, column: 8, scope: !78)
!78 = distinct !DILexicalBlock(scope: !70, file: !12, line: 59, column: 8)
!79 = !DILocation(line: 59, column: 25, scope: !78)
!80 = !DILocation(line: 59, column: 8, scope: !70)
!81 = !DILocation(line: 62, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !12, line: 60, column: 5)
!83 = !DILocation(line: 63, column: 5, scope: !82)
!84 = !DILocation(line: 68, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !78, file: !12, line: 65, column: 5)
!86 = !DILocation(line: 68, column: 14, scope: !85)
!87 = !DILocation(line: 69, column: 9, scope: !85)
!88 = !DILocation(line: 69, column: 17, scope: !85)
!89 = !DILocalVariable(name: "source", scope: !90, file: !12, line: 72, type: !26)
!90 = distinct !DILexicalBlock(scope: !70, file: !12, line: 71, column: 5)
!91 = !DILocation(line: 72, column: 14, scope: !90)
!92 = !DILocation(line: 75, column: 9, scope: !90)
!93 = !DILocation(line: 76, column: 19, scope: !90)
!94 = !DILocation(line: 76, column: 9, scope: !90)
!95 = !DILocation(line: 78, column: 1, scope: !70)
!96 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 83, type: !17)
!98 = !DILocation(line: 83, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 84, type: !21)
!100 = !DILocation(line: 84, column: 10, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 85, type: !26)
!102 = !DILocation(line: 85, column: 10, scope: !96)
!103 = !DILocation(line: 86, column: 8, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !12, line: 86, column: 8)
!105 = !DILocation(line: 86, column: 25, scope: !104)
!106 = !DILocation(line: 86, column: 8, scope: !96)
!107 = !DILocation(line: 90, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !12, line: 87, column: 5)
!109 = !DILocation(line: 90, column: 14, scope: !108)
!110 = !DILocation(line: 91, column: 9, scope: !108)
!111 = !DILocation(line: 91, column: 17, scope: !108)
!112 = !DILocation(line: 92, column: 5, scope: !108)
!113 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 94, type: !26)
!114 = distinct !DILexicalBlock(scope: !96, file: !12, line: 93, column: 5)
!115 = !DILocation(line: 94, column: 14, scope: !114)
!116 = !DILocation(line: 97, column: 9, scope: !114)
!117 = !DILocation(line: 98, column: 19, scope: !114)
!118 = !DILocation(line: 98, column: 9, scope: !114)
!119 = !DILocation(line: 100, column: 1, scope: !96)
