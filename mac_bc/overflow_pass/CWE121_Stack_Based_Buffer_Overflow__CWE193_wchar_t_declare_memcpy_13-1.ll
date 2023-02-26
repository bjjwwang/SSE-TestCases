; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %1 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13_bad.source to i8*), i64 44, i1 false), !dbg !46
  %3 = load i32*, i32** %data, align 8, !dbg !47
  %4 = bitcast i32* %3 to i8*, !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !47
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !47
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !47
  %add = add i64 %call, 1, !dbg !47
  %mul = mul i64 %add, 4, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %7 = bitcast i32* %6 to i8*, !dbg !47
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !47
  %call3 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef %mul, i64 noundef %8) #5, !dbg !47
  %9 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* noundef %9), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13_good() #0 !dbg !51 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !82
  %cmp = icmp ne i32 %0, 5, !dbg !84
  br i1 %cmp, label %if.then, label %if.else, !dbg !85

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end, !dbg !88

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !89
  store i32* %arraydecay, i32** %data, align 8, !dbg !91
  %1 = load i32*, i32** %data, align 8, !dbg !92
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !92
  store i32 0, i32* %arrayidx, align 4, !dbg !93
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !94, metadata !DIExpression()), !dbg !96
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !96
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !96
  %3 = load i32*, i32** %data, align 8, !dbg !97
  %4 = bitcast i32* %3 to i8*, !dbg !97
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !97
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !97
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !97
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !97
  %add = add i64 %call, 1, !dbg !97
  %mul = mul i64 %add, 4, !dbg !97
  %6 = load i32*, i32** %data, align 8, !dbg !97
  %7 = bitcast i32* %6 to i8*, !dbg !97
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !97
  %call3 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef %mul, i64 noundef %8) #5, !dbg !97
  %9 = load i32*, i32** %data, align 8, !dbg !98
  call void @printWLine(i32* noundef %9), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !108
  %cmp = icmp eq i32 %0, 5, !dbg !110
  br i1 %cmp, label %if.then, label %if.end, !dbg !111

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store i32* %arraydecay, i32** %data, align 8, !dbg !114
  %1 = load i32*, i32** %data, align 8, !dbg !115
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 0, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  br label %if.end, !dbg !117

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !120
  %3 = load i32*, i32** %data, align 8, !dbg !121
  %4 = bitcast i32* %3 to i8*, !dbg !121
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !121
  %5 = bitcast i32* %arraydecay1 to i8*, !dbg !121
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !121
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !121
  %add = add i64 %call, 1, !dbg !121
  %mul = mul i64 %add, 4, !dbg !121
  %6 = load i32*, i32** %data, align 8, !dbg !121
  %7 = bitcast i32* %6 to i8*, !dbg !121
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !121
  %call3 = call i8* @__memcpy_chk(i8* noundef %4, i8* noundef %5, i64 noundef %mul, i64 noundef %8) #5, !dbg !121
  %9 = load i32*, i32** %data, align 8, !dbg !122
  call void @printWLine(i32* noundef %9), !dbg !123
  ret void, !dbg !124
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 30, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 31, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 11)
!33 = !DILocation(line: 32, column: 13, scope: !11)
!34 = !DILocation(line: 33, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!36 = !DILocation(line: 33, column: 25, scope: !35)
!37 = !DILocation(line: 33, column: 8, scope: !11)
!38 = !DILocation(line: 37, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !12, line: 34, column: 5)
!40 = !DILocation(line: 37, column: 14, scope: !39)
!41 = !DILocation(line: 38, column: 9, scope: !39)
!42 = !DILocation(line: 38, column: 17, scope: !39)
!43 = !DILocation(line: 39, column: 5, scope: !39)
!44 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 41, type: !30)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!46 = !DILocation(line: 41, column: 17, scope: !45)
!47 = !DILocation(line: 44, column: 9, scope: !45)
!48 = !DILocation(line: 45, column: 20, scope: !45)
!49 = !DILocation(line: 45, column: 9, scope: !45)
!50 = !DILocation(line: 47, column: 1, scope: !11)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_memcpy_13_good", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!52 = !DILocation(line: 104, column: 5, scope: !51)
!53 = !DILocation(line: 105, column: 5, scope: !51)
!54 = !DILocation(line: 106, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 118, type: !56, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!56 = !DISubroutineType(types: !57)
!57 = !{!22, !22, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !12, line: 118, type: !22)
!62 = !DILocation(line: 118, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !12, line: 118, type: !58)
!64 = !DILocation(line: 118, column: 27, scope: !55)
!65 = !DILocation(line: 121, column: 22, scope: !55)
!66 = !DILocation(line: 121, column: 12, scope: !55)
!67 = !DILocation(line: 121, column: 5, scope: !55)
!68 = !DILocation(line: 123, column: 5, scope: !55)
!69 = !DILocation(line: 124, column: 5, scope: !55)
!70 = !DILocation(line: 125, column: 5, scope: !55)
!71 = !DILocation(line: 128, column: 5, scope: !55)
!72 = !DILocation(line: 129, column: 5, scope: !55)
!73 = !DILocation(line: 130, column: 5, scope: !55)
!74 = !DILocation(line: 132, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 56, type: !17)
!77 = !DILocation(line: 56, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !12, line: 57, type: !25)
!79 = !DILocation(line: 57, column: 13, scope: !75)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !12, line: 58, type: !30)
!81 = !DILocation(line: 58, column: 13, scope: !75)
!82 = !DILocation(line: 59, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !12, line: 59, column: 8)
!84 = !DILocation(line: 59, column: 25, scope: !83)
!85 = !DILocation(line: 59, column: 8, scope: !75)
!86 = !DILocation(line: 62, column: 9, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 60, column: 5)
!88 = !DILocation(line: 63, column: 5, scope: !87)
!89 = !DILocation(line: 68, column: 16, scope: !90)
!90 = distinct !DILexicalBlock(scope: !83, file: !12, line: 65, column: 5)
!91 = !DILocation(line: 68, column: 14, scope: !90)
!92 = !DILocation(line: 69, column: 9, scope: !90)
!93 = !DILocation(line: 69, column: 17, scope: !90)
!94 = !DILocalVariable(name: "source", scope: !95, file: !12, line: 72, type: !30)
!95 = distinct !DILexicalBlock(scope: !75, file: !12, line: 71, column: 5)
!96 = !DILocation(line: 72, column: 17, scope: !95)
!97 = !DILocation(line: 75, column: 9, scope: !95)
!98 = !DILocation(line: 76, column: 20, scope: !95)
!99 = !DILocation(line: 76, column: 9, scope: !95)
!100 = !DILocation(line: 78, column: 1, scope: !75)
!101 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 81, type: !13, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 83, type: !17)
!103 = !DILocation(line: 83, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 84, type: !25)
!105 = !DILocation(line: 84, column: 13, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 85, type: !30)
!107 = !DILocation(line: 85, column: 13, scope: !101)
!108 = !DILocation(line: 86, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !12, line: 86, column: 8)
!110 = !DILocation(line: 86, column: 25, scope: !109)
!111 = !DILocation(line: 86, column: 8, scope: !101)
!112 = !DILocation(line: 90, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !12, line: 87, column: 5)
!114 = !DILocation(line: 90, column: 14, scope: !113)
!115 = !DILocation(line: 91, column: 9, scope: !113)
!116 = !DILocation(line: 91, column: 17, scope: !113)
!117 = !DILocation(line: 92, column: 5, scope: !113)
!118 = !DILocalVariable(name: "source", scope: !119, file: !12, line: 94, type: !30)
!119 = distinct !DILexicalBlock(scope: !101, file: !12, line: 93, column: 5)
!120 = !DILocation(line: 94, column: 17, scope: !119)
!121 = !DILocation(line: 97, column: 9, scope: !119)
!122 = !DILocation(line: 98, column: 20, scope: !119)
!123 = !DILocation(line: 98, column: 9, scope: !119)
!124 = !DILocation(line: 100, column: 1, scope: !101)
