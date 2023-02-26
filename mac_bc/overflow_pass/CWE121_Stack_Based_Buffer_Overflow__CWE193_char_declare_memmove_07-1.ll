; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !20, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay, i8** %data, align 8, !dbg !40
  %1 = load i8*, i8** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !41
  store i8 0, i8* %arrayidx, align 1, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !46
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !47
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !47
  %add = add i64 %call, 1, !dbg !47
  %mul = mul i64 %add, 1, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !47
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* noundef %6), !dbg !49
  ret void, !dbg !50
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !59, metadata !DIExpression()), !dbg !60
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !61, metadata !DIExpression()), !dbg !62
  %call = call i64 @time(i64* noundef null), !dbg !63
  %conv = trunc i64 %call to i32, !dbg !64
  call void @srand(i32 noundef %conv), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07_good(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07_bad(), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !73 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = load i32, i32* @staticFive, align 4, !dbg !80
  %cmp = icmp ne i32 %0, 5, !dbg !82
  br i1 %cmp, label %if.then, label %if.else, !dbg !83

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !84
  br label %if.end, !dbg !86

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !87
  store i8* %arraydecay, i8** %data, align 8, !dbg !89
  %1 = load i8*, i8** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !94
  %3 = load i8*, i8** %data, align 8, !dbg !95
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !95
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !95
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !95
  %add = add i64 %call, 1, !dbg !95
  %mul = mul i64 %add, 1, !dbg !95
  %4 = load i8*, i8** %data, align 8, !dbg !95
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !95
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !95
  %6 = load i8*, i8** %data, align 8, !dbg !96
  call void @printLine(i8* noundef %6), !dbg !97
  ret void, !dbg !98
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !99 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %0 = load i32, i32* @staticFive, align 4, !dbg !106
  %cmp = icmp eq i32 %0, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i8* %arraydecay, i8** %data, align 8, !dbg !112
  %1 = load i8*, i8** %data, align 8, !dbg !113
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 0, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  br label %if.end, !dbg !115

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  %2 = bitcast [11 x i8]* %source to i8*, !dbg !118
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %2, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !118
  %3 = load i8*, i8** %data, align 8, !dbg !119
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !119
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !119
  %call = call i64 @strlen(i8* noundef %arraydecay2), !dbg !119
  %add = add i64 %call, 1, !dbg !119
  %mul = mul i64 %add, 1, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !119
  %5 = call i64 @llvm.objectsize.i64.p0i8(i8* %4, i1 false, i1 true, i1 false), !dbg !119
  %call3 = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %arraydecay1, i64 noundef %mul, i64 noundef %5) #5, !dbg !119
  %6 = load i8*, i8** %data, align 8, !dbg !120
  call void @printLine(i8* noundef %6), !dbg !121
  ret void, !dbg !122
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 30, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07_bad", scope: !7, file: !7, line: 34, type: !17, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 36, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!23 = !DILocation(line: 36, column: 12, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !7, line: 37, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 80, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 37, column: 10, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !7, line: 38, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 88, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 38, column: 10, scope: !16)
!34 = !DILocation(line: 39, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !7, line: 39, column: 8)
!36 = !DILocation(line: 39, column: 18, scope: !35)
!37 = !DILocation(line: 39, column: 8, scope: !16)
!38 = !DILocation(line: 43, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !7, line: 40, column: 5)
!40 = !DILocation(line: 43, column: 14, scope: !39)
!41 = !DILocation(line: 44, column: 9, scope: !39)
!42 = !DILocation(line: 44, column: 17, scope: !39)
!43 = !DILocation(line: 45, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !7, line: 47, type: !30)
!45 = distinct !DILexicalBlock(scope: !16, file: !7, line: 46, column: 5)
!46 = !DILocation(line: 47, column: 14, scope: !45)
!47 = !DILocation(line: 50, column: 9, scope: !45)
!48 = !DILocation(line: 51, column: 19, scope: !45)
!49 = !DILocation(line: 51, column: 9, scope: !45)
!50 = !DILocation(line: 53, column: 1, scope: !16)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_memmove_07_good", scope: !7, file: !7, line: 108, type: !17, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!52 = !DILocation(line: 110, column: 5, scope: !51)
!53 = !DILocation(line: 111, column: 5, scope: !51)
!54 = !DILocation(line: 112, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 124, type: !56, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!56 = !DISubroutineType(types: !57)
!57 = !{!8, !8, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!59 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !7, line: 124, type: !8)
!60 = !DILocation(line: 124, column: 14, scope: !55)
!61 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !7, line: 124, type: !58)
!62 = !DILocation(line: 124, column: 27, scope: !55)
!63 = !DILocation(line: 127, column: 22, scope: !55)
!64 = !DILocation(line: 127, column: 12, scope: !55)
!65 = !DILocation(line: 127, column: 5, scope: !55)
!66 = !DILocation(line: 129, column: 5, scope: !55)
!67 = !DILocation(line: 130, column: 5, scope: !55)
!68 = !DILocation(line: 131, column: 5, scope: !55)
!69 = !DILocation(line: 134, column: 5, scope: !55)
!70 = !DILocation(line: 135, column: 5, scope: !55)
!71 = !DILocation(line: 136, column: 5, scope: !55)
!72 = !DILocation(line: 138, column: 5, scope: !55)
!73 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!74 = !DILocalVariable(name: "data", scope: !73, file: !7, line: 62, type: !21)
!75 = !DILocation(line: 62, column: 12, scope: !73)
!76 = !DILocalVariable(name: "dataBadBuffer", scope: !73, file: !7, line: 63, type: !25)
!77 = !DILocation(line: 63, column: 10, scope: !73)
!78 = !DILocalVariable(name: "dataGoodBuffer", scope: !73, file: !7, line: 64, type: !30)
!79 = !DILocation(line: 64, column: 10, scope: !73)
!80 = !DILocation(line: 65, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !73, file: !7, line: 65, column: 8)
!82 = !DILocation(line: 65, column: 18, scope: !81)
!83 = !DILocation(line: 65, column: 8, scope: !73)
!84 = !DILocation(line: 68, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !7, line: 66, column: 5)
!86 = !DILocation(line: 69, column: 5, scope: !85)
!87 = !DILocation(line: 74, column: 16, scope: !88)
!88 = distinct !DILexicalBlock(scope: !81, file: !7, line: 71, column: 5)
!89 = !DILocation(line: 74, column: 14, scope: !88)
!90 = !DILocation(line: 75, column: 9, scope: !88)
!91 = !DILocation(line: 75, column: 17, scope: !88)
!92 = !DILocalVariable(name: "source", scope: !93, file: !7, line: 78, type: !30)
!93 = distinct !DILexicalBlock(scope: !73, file: !7, line: 77, column: 5)
!94 = !DILocation(line: 78, column: 14, scope: !93)
!95 = !DILocation(line: 81, column: 9, scope: !93)
!96 = !DILocation(line: 82, column: 19, scope: !93)
!97 = !DILocation(line: 82, column: 9, scope: !93)
!98 = !DILocation(line: 84, column: 1, scope: !73)
!99 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 87, type: !17, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!100 = !DILocalVariable(name: "data", scope: !99, file: !7, line: 89, type: !21)
!101 = !DILocation(line: 89, column: 12, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !7, line: 90, type: !25)
!103 = !DILocation(line: 90, column: 10, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !7, line: 91, type: !30)
!105 = !DILocation(line: 91, column: 10, scope: !99)
!106 = !DILocation(line: 92, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !99, file: !7, line: 92, column: 8)
!108 = !DILocation(line: 92, column: 18, scope: !107)
!109 = !DILocation(line: 92, column: 8, scope: !99)
!110 = !DILocation(line: 96, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !7, line: 93, column: 5)
!112 = !DILocation(line: 96, column: 14, scope: !111)
!113 = !DILocation(line: 97, column: 9, scope: !111)
!114 = !DILocation(line: 97, column: 17, scope: !111)
!115 = !DILocation(line: 98, column: 5, scope: !111)
!116 = !DILocalVariable(name: "source", scope: !117, file: !7, line: 100, type: !30)
!117 = distinct !DILexicalBlock(scope: !99, file: !7, line: 99, column: 5)
!118 = !DILocation(line: 100, column: 14, scope: !117)
!119 = !DILocation(line: 103, column: 9, scope: !117)
!120 = !DILocation(line: 104, column: 19, scope: !117)
!121 = !DILocation(line: 104, column: 9, scope: !117)
!122 = !DILocation(line: 106, column: 1, scope: !99)
