; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %call = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !42
  %call3 = call i64 @strlen(i8* noundef %arraydecay2), !dbg !42
  %add = add i64 %call3, 1, !dbg !42
  %3 = load i8*, i8** %data, align 8, !dbg !42
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !42
  %call4 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay1, i64 noundef %add, i64 noundef %4) #5, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  call void @printLine(i8* noundef %5), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11_good() #0 !dbg !46 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !69 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i32 (...) @globalReturnsFalse(), !dbg !76
  %tobool = icmp ne i32 %call, 0, !dbg !76
  br i1 %tobool, label %if.then, label %if.else, !dbg !78

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !79
  br label %if.end, !dbg !81

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !82
  store i8* %arraydecay, i8** %data, align 8, !dbg !84
  %0 = load i8*, i8** %data, align 8, !dbg !85
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !89
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !89
  %2 = load i8*, i8** %data, align 8, !dbg !90
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !90
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !90
  %call3 = call i64 @strlen(i8* noundef %arraydecay2), !dbg !90
  %add = add i64 %call3, 1, !dbg !90
  %3 = load i8*, i8** %data, align 8, !dbg !90
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !90
  %call4 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay1, i64 noundef %add, i64 noundef %4) #5, !dbg !90
  %5 = load i8*, i8** %data, align 8, !dbg !91
  call void @printLine(i8* noundef %5), !dbg !92
  ret void, !dbg !93
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i32 (...) @globalReturnsTrue(), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i8* %arraydecay, i8** %data, align 8, !dbg !106
  %0 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  br label %if.end, !dbg !109

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !110, metadata !DIExpression()), !dbg !112
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !112
  %2 = load i8*, i8** %data, align 8, !dbg !113
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !113
  %call3 = call i64 @strlen(i8* noundef %arraydecay2), !dbg !113
  %add = add i64 %call3, 1, !dbg !113
  %3 = load i8*, i8** %data, align 8, !dbg !113
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !113
  %call4 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay1, i64 noundef %add, i64 noundef %4) #5, !dbg !113
  %5 = load i8*, i8** %data, align 8, !dbg !114
  call void @printLine(i8* noundef %5), !dbg !115
  ret void, !dbg !116
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = !DILocation(line: 33, column: 8, scope: !11)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 5)
!35 = !DILocation(line: 37, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 17, scope: !34)
!38 = !DILocation(line: 39, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 41, type: !26)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!41 = !DILocation(line: 41, column: 14, scope: !40)
!42 = !DILocation(line: 44, column: 9, scope: !40)
!43 = !DILocation(line: 45, column: 19, scope: !40)
!44 = !DILocation(line: 45, column: 9, scope: !40)
!45 = !DILocation(line: 47, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_ncpy_11_good", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!47 = !DILocation(line: 104, column: 5, scope: !46)
!48 = !DILocation(line: 105, column: 5, scope: !46)
!49 = !DILocation(line: 106, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 118, type: !51, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 118, type: !53)
!56 = !DILocation(line: 118, column: 14, scope: !50)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 118, type: !54)
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
!69 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!70 = !DILocalVariable(name: "data", scope: !69, file: !12, line: 56, type: !17)
!71 = !DILocation(line: 56, column: 12, scope: !69)
!72 = !DILocalVariable(name: "dataBadBuffer", scope: !69, file: !12, line: 57, type: !21)
!73 = !DILocation(line: 57, column: 10, scope: !69)
!74 = !DILocalVariable(name: "dataGoodBuffer", scope: !69, file: !12, line: 58, type: !26)
!75 = !DILocation(line: 58, column: 10, scope: !69)
!76 = !DILocation(line: 59, column: 8, scope: !77)
!77 = distinct !DILexicalBlock(scope: !69, file: !12, line: 59, column: 8)
!78 = !DILocation(line: 59, column: 8, scope: !69)
!79 = !DILocation(line: 62, column: 9, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 60, column: 5)
!81 = !DILocation(line: 63, column: 5, scope: !80)
!82 = !DILocation(line: 68, column: 16, scope: !83)
!83 = distinct !DILexicalBlock(scope: !77, file: !12, line: 65, column: 5)
!84 = !DILocation(line: 68, column: 14, scope: !83)
!85 = !DILocation(line: 69, column: 9, scope: !83)
!86 = !DILocation(line: 69, column: 17, scope: !83)
!87 = !DILocalVariable(name: "source", scope: !88, file: !12, line: 72, type: !26)
!88 = distinct !DILexicalBlock(scope: !69, file: !12, line: 71, column: 5)
!89 = !DILocation(line: 72, column: 14, scope: !88)
!90 = !DILocation(line: 75, column: 9, scope: !88)
!91 = !DILocation(line: 76, column: 19, scope: !88)
!92 = !DILocation(line: 76, column: 9, scope: !88)
!93 = !DILocation(line: 78, column: 1, scope: !69)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 83, type: !17)
!96 = !DILocation(line: 83, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !12, line: 84, type: !21)
!98 = !DILocation(line: 84, column: 10, scope: !94)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !12, line: 85, type: !26)
!100 = !DILocation(line: 85, column: 10, scope: !94)
!101 = !DILocation(line: 86, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !12, line: 86, column: 8)
!103 = !DILocation(line: 86, column: 8, scope: !94)
!104 = !DILocation(line: 90, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 87, column: 5)
!106 = !DILocation(line: 90, column: 14, scope: !105)
!107 = !DILocation(line: 91, column: 9, scope: !105)
!108 = !DILocation(line: 91, column: 17, scope: !105)
!109 = !DILocation(line: 92, column: 5, scope: !105)
!110 = !DILocalVariable(name: "source", scope: !111, file: !12, line: 94, type: !26)
!111 = distinct !DILexicalBlock(scope: !94, file: !12, line: 93, column: 5)
!112 = !DILocation(line: 94, column: 14, scope: !111)
!113 = !DILocation(line: 97, column: 9, scope: !111)
!114 = !DILocation(line: 98, column: 19, scope: !111)
!115 = !DILocation(line: 98, column: 9, scope: !111)
!116 = !DILocation(line: 100, column: 1, scope: !94)
