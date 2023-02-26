; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_TRUE = external constant i32, align 4
@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 40, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 44, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !32
  %tobool = icmp ne i32 %4, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  store i32* %5, i32** %data, align 8, !dbg !37
  %6 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !46
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09_bad.source to i8*), i64 44, i1 false), !dbg !46
  %8 = load i32*, i32** %data, align 8, !dbg !47
  %9 = bitcast i32* %8 to i8*, !dbg !47
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !47
  %10 = bitcast i32* %arraydecay to i8*, !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !47
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !47
  %add = add i64 %call, 1, !dbg !47
  %mul = mul i64 %add, 4, !dbg !47
  %11 = load i32*, i32** %data, align 8, !dbg !47
  %12 = bitcast i32* %11 to i8*, !dbg !47
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !47
  %call2 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %10, i64 noundef %mul, i64 noundef %13) #5, !dbg !47
  %14 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* noundef %14), !dbg !49
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09_good() #0 !dbg !51 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09_bad(), !dbg !72
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
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 40, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %2 = alloca i8, i64 44, align 16, !dbg !84
  %3 = bitcast i8* %2 to i32*, !dbg !85
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !83
  %4 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !86
  %tobool = icmp ne i32 %4, 0, !dbg !86
  br i1 %tobool, label %if.then, label %if.else, !dbg !88

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  br label %if.end, !dbg !91

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !92
  store i32* %5, i32** %data, align 8, !dbg !94
  %6 = load i32*, i32** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !95
  store i32 0, i32* %arrayidx, align 4, !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !97, metadata !DIExpression()), !dbg !99
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !99
  %8 = load i32*, i32** %data, align 8, !dbg !100
  %9 = bitcast i32* %8 to i8*, !dbg !100
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !100
  %10 = bitcast i32* %arraydecay to i8*, !dbg !100
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !100
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !100
  %add = add i64 %call, 1, !dbg !100
  %mul = mul i64 %add, 4, !dbg !100
  %11 = load i32*, i32** %data, align 8, !dbg !100
  %12 = bitcast i32* %11 to i8*, !dbg !100
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !100
  %call2 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %10, i64 noundef %mul, i64 noundef %13) #5, !dbg !100
  %14 = load i32*, i32** %data, align 8, !dbg !101
  call void @printWLine(i32* noundef %14), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %0 = alloca i8, i64 40, align 16, !dbg !109
  %1 = bitcast i8* %0 to i32*, !dbg !110
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %2 = alloca i8, i64 44, align 16, !dbg !113
  %3 = bitcast i8* %2 to i32*, !dbg !114
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !112
  %4 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !115
  %tobool = icmp ne i32 %4, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !118
  store i32* %5, i32** %data, align 8, !dbg !120
  %6 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  br label %if.end, !dbg !123

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  %7 = bitcast [11 x i32]* %source to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %7, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !126
  %8 = load i32*, i32** %data, align 8, !dbg !127
  %9 = bitcast i32* %8 to i8*, !dbg !127
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !127
  %10 = bitcast i32* %arraydecay to i8*, !dbg !127
  %arraydecay1 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !127
  %call = call i64 @wcslen(i32* noundef %arraydecay1), !dbg !127
  %add = add i64 %call, 1, !dbg !127
  %mul = mul i64 %add, 4, !dbg !127
  %11 = load i32*, i32** %data, align 8, !dbg !127
  %12 = bitcast i32* %11 to i8*, !dbg !127
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !127
  %call2 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %10, i64 noundef %mul, i64 noundef %13) #5, !dbg !127
  %14 = load i32*, i32** %data, align 8, !dbg !128
  call void @printWLine(i32* noundef %14), !dbg !129
  ret void, !dbg !130
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09_bad", scope: !18, file: !18, line: 28, type: !19, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 30, type: !3)
!23 = !DILocation(line: 30, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 31, type: !3)
!25 = !DILocation(line: 31, column: 15, scope: !17)
!26 = !DILocation(line: 31, column: 42, scope: !17)
!27 = !DILocation(line: 31, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 32, type: !3)
!29 = !DILocation(line: 32, column: 15, scope: !17)
!30 = !DILocation(line: 32, column: 43, scope: !17)
!31 = !DILocation(line: 32, column: 32, scope: !17)
!32 = !DILocation(line: 33, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !17, file: !18, line: 33, column: 8)
!34 = !DILocation(line: 33, column: 8, scope: !17)
!35 = !DILocation(line: 37, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !18, line: 34, column: 5)
!37 = !DILocation(line: 37, column: 14, scope: !36)
!38 = !DILocation(line: 38, column: 9, scope: !36)
!39 = !DILocation(line: 38, column: 17, scope: !36)
!40 = !DILocation(line: 39, column: 5, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !42, file: !18, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 40, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 11)
!46 = !DILocation(line: 41, column: 17, scope: !42)
!47 = !DILocation(line: 44, column: 9, scope: !42)
!48 = !DILocation(line: 45, column: 20, scope: !42)
!49 = !DILocation(line: 45, column: 9, scope: !42)
!50 = !DILocation(line: 47, column: 1, scope: !17)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_alloca_memcpy_09_good", scope: !18, file: !18, line: 102, type: !19, scopeLine: 103, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!52 = !DILocation(line: 104, column: 5, scope: !51)
!53 = !DILocation(line: 105, column: 5, scope: !51)
!54 = !DILocation(line: 106, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 118, type: !56, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!56 = !DISubroutineType(types: !57)
!57 = !{!8, !8, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !18, line: 118, type: !8)
!62 = !DILocation(line: 118, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !18, line: 118, type: !58)
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
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!76 = !DILocalVariable(name: "data", scope: !75, file: !18, line: 56, type: !3)
!77 = !DILocation(line: 56, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !18, line: 57, type: !3)
!79 = !DILocation(line: 57, column: 15, scope: !75)
!80 = !DILocation(line: 57, column: 42, scope: !75)
!81 = !DILocation(line: 57, column: 31, scope: !75)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !18, line: 58, type: !3)
!83 = !DILocation(line: 58, column: 15, scope: !75)
!84 = !DILocation(line: 58, column: 43, scope: !75)
!85 = !DILocation(line: 58, column: 32, scope: !75)
!86 = !DILocation(line: 59, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !75, file: !18, line: 59, column: 8)
!88 = !DILocation(line: 59, column: 8, scope: !75)
!89 = !DILocation(line: 62, column: 9, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !18, line: 60, column: 5)
!91 = !DILocation(line: 63, column: 5, scope: !90)
!92 = !DILocation(line: 68, column: 16, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !18, line: 65, column: 5)
!94 = !DILocation(line: 68, column: 14, scope: !93)
!95 = !DILocation(line: 69, column: 9, scope: !93)
!96 = !DILocation(line: 69, column: 17, scope: !93)
!97 = !DILocalVariable(name: "source", scope: !98, file: !18, line: 72, type: !43)
!98 = distinct !DILexicalBlock(scope: !75, file: !18, line: 71, column: 5)
!99 = !DILocation(line: 72, column: 17, scope: !98)
!100 = !DILocation(line: 75, column: 9, scope: !98)
!101 = !DILocation(line: 76, column: 20, scope: !98)
!102 = !DILocation(line: 76, column: 9, scope: !98)
!103 = !DILocation(line: 78, column: 1, scope: !75)
!104 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 81, type: !19, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!105 = !DILocalVariable(name: "data", scope: !104, file: !18, line: 83, type: !3)
!106 = !DILocation(line: 83, column: 15, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !18, line: 84, type: !3)
!108 = !DILocation(line: 84, column: 15, scope: !104)
!109 = !DILocation(line: 84, column: 42, scope: !104)
!110 = !DILocation(line: 84, column: 31, scope: !104)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !18, line: 85, type: !3)
!112 = !DILocation(line: 85, column: 15, scope: !104)
!113 = !DILocation(line: 85, column: 43, scope: !104)
!114 = !DILocation(line: 85, column: 32, scope: !104)
!115 = !DILocation(line: 86, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !104, file: !18, line: 86, column: 8)
!117 = !DILocation(line: 86, column: 8, scope: !104)
!118 = !DILocation(line: 90, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !18, line: 87, column: 5)
!120 = !DILocation(line: 90, column: 14, scope: !119)
!121 = !DILocation(line: 91, column: 9, scope: !119)
!122 = !DILocation(line: 91, column: 17, scope: !119)
!123 = !DILocation(line: 92, column: 5, scope: !119)
!124 = !DILocalVariable(name: "source", scope: !125, file: !18, line: 94, type: !43)
!125 = distinct !DILexicalBlock(scope: !104, file: !18, line: 93, column: 5)
!126 = !DILocation(line: 94, column: 17, scope: !125)
!127 = !DILocation(line: 97, column: 9, scope: !125)
!128 = !DILocation(line: 98, column: 20, scope: !125)
!129 = !DILocation(line: 98, column: 9, scope: !125)
!130 = !DILocation(line: 100, column: 1, scope: !104)
