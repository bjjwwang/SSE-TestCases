; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !7
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i32* %arraydecay, i32** %data, align 8, !dbg !40
  %0 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  %1 = load i32*, i32** %data, align 8, !dbg !43
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_badData, align 8, !dbg !44
  call void @badSink(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !70 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_badData, align 8, !dbg !73
  store i32* %0, i32** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !74, metadata !DIExpression()), !dbg !76
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.badSink.source to i8*), i64 44, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !85
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !86
  store i64 %call, i64* %sourceLen, align 8, !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !91
  %3 = load i64, i64* %sourceLen, align 8, !dbg !93
  %add = add i64 %3, 1, !dbg !94
  %cmp = icmp ult i64 %2, %add, !dbg !95
  br i1 %cmp, label %for.body, label %for.end, !dbg !96

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !99
  %5 = load i32, i32* %arrayidx, align 4, !dbg !99
  %6 = load i32*, i32** %data, align 8, !dbg !100
  %7 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !100
  store i32 %5, i32* %arrayidx1, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %8, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* noundef %9), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i32* %arraydecay, i32** %data, align 8, !dbg !120
  %0 = load i32*, i32** %data, align 8, !dbg !121
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !121
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %1 = load i32*, i32** %data, align 8, !dbg !123
  store i32* %1, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !124
  call void @goodG2BSink(), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !127 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !130
  store i32* %0, i32** %data, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  %1 = bitcast [11 x i32]* %source to i8*, !dbg !133
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 16 bitcast ([11 x i32]* @__const.goodG2BSink.source to i8*), i64 44, i1 false), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !136, metadata !DIExpression()), !dbg !137
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !138
  %call = call i64 @wcslen(i32* noundef %arraydecay), !dbg !139
  store i64 %call, i64* %sourceLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !144
  %3 = load i64, i64* %sourceLen, align 8, !dbg !146
  %add = add i64 %3, 1, !dbg !147
  %cmp = icmp ult i64 %2, %add, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %4, !dbg !152
  %5 = load i32, i32* %arrayidx, align 4, !dbg !152
  %6 = load i32*, i32** %data, align 8, !dbg !153
  %7 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx1 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !153
  store i32 %5, i32* %arrayidx1, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %8, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !161
  call void @printWLine(i32* noundef %9), !dbg !162
  ret void, !dbg !163
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_badData", scope: !2, file: !9, line: 26, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_goodG2BData", scope: !2, file: !9, line: 27, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 34, baseType: !13)
!12 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !14, line: 106, baseType: !15)
!14 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_bad", scope: !9, file: !9, line: 48, type: !24, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !9, line: 50, type: !10)
!28 = !DILocation(line: 50, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !9, line: 51, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 320, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 51, column: 13, scope: !23)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !9, line: 52, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 352, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 52, column: 13, scope: !23)
!39 = !DILocation(line: 55, column: 12, scope: !23)
!40 = !DILocation(line: 55, column: 10, scope: !23)
!41 = !DILocation(line: 56, column: 5, scope: !23)
!42 = !DILocation(line: 56, column: 13, scope: !23)
!43 = !DILocation(line: 57, column: 82, scope: !23)
!44 = !DILocation(line: 57, column: 80, scope: !23)
!45 = !DILocation(line: 58, column: 5, scope: !23)
!46 = !DILocation(line: 59, column: 1, scope: !23)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_45_good", scope: !9, file: !9, line: 96, type: !24, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!48 = !DILocation(line: 98, column: 5, scope: !47)
!49 = !DILocation(line: 99, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 110, type: !51, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!51 = !DISubroutineType(types: !52)
!52 = !{!15, !15, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !9, line: 110, type: !15)
!57 = !DILocation(line: 110, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !9, line: 110, type: !53)
!59 = !DILocation(line: 110, column: 27, scope: !50)
!60 = !DILocation(line: 113, column: 22, scope: !50)
!61 = !DILocation(line: 113, column: 12, scope: !50)
!62 = !DILocation(line: 113, column: 5, scope: !50)
!63 = !DILocation(line: 115, column: 5, scope: !50)
!64 = !DILocation(line: 116, column: 5, scope: !50)
!65 = !DILocation(line: 117, column: 5, scope: !50)
!66 = !DILocation(line: 120, column: 5, scope: !50)
!67 = !DILocation(line: 121, column: 5, scope: !50)
!68 = !DILocation(line: 122, column: 5, scope: !50)
!69 = !DILocation(line: 124, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 31, type: !24, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!71 = !DILocalVariable(name: "data", scope: !70, file: !9, line: 33, type: !10)
!72 = !DILocation(line: 33, column: 15, scope: !70)
!73 = !DILocation(line: 33, column: 22, scope: !70)
!74 = !DILocalVariable(name: "source", scope: !75, file: !9, line: 35, type: !35)
!75 = distinct !DILexicalBlock(scope: !70, file: !9, line: 34, column: 5)
!76 = !DILocation(line: 35, column: 17, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !75, file: !9, line: 36, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !79, line: 31, baseType: !80)
!79 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !14, line: 94, baseType: !81)
!81 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!82 = !DILocation(line: 36, column: 16, scope: !75)
!83 = !DILocalVariable(name: "sourceLen", scope: !75, file: !9, line: 36, type: !78)
!84 = !DILocation(line: 36, column: 19, scope: !75)
!85 = !DILocation(line: 37, column: 28, scope: !75)
!86 = !DILocation(line: 37, column: 21, scope: !75)
!87 = !DILocation(line: 37, column: 19, scope: !75)
!88 = !DILocation(line: 40, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !75, file: !9, line: 40, column: 9)
!90 = !DILocation(line: 40, column: 14, scope: !89)
!91 = !DILocation(line: 40, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !9, line: 40, column: 9)
!93 = !DILocation(line: 40, column: 25, scope: !92)
!94 = !DILocation(line: 40, column: 35, scope: !92)
!95 = !DILocation(line: 40, column: 23, scope: !92)
!96 = !DILocation(line: 40, column: 9, scope: !89)
!97 = !DILocation(line: 42, column: 30, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !9, line: 41, column: 9)
!99 = !DILocation(line: 42, column: 23, scope: !98)
!100 = !DILocation(line: 42, column: 13, scope: !98)
!101 = !DILocation(line: 42, column: 18, scope: !98)
!102 = !DILocation(line: 42, column: 21, scope: !98)
!103 = !DILocation(line: 43, column: 9, scope: !98)
!104 = !DILocation(line: 40, column: 41, scope: !92)
!105 = !DILocation(line: 40, column: 9, scope: !92)
!106 = distinct !{!106, !96, !107, !108}
!107 = !DILocation(line: 43, column: 9, scope: !89)
!108 = !{!"llvm.loop.mustprogress"}
!109 = !DILocation(line: 44, column: 20, scope: !75)
!110 = !DILocation(line: 44, column: 9, scope: !75)
!111 = !DILocation(line: 46, column: 1, scope: !70)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 83, type: !24, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!113 = !DILocalVariable(name: "data", scope: !112, file: !9, line: 85, type: !10)
!114 = !DILocation(line: 85, column: 15, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !9, line: 86, type: !30)
!116 = !DILocation(line: 86, column: 13, scope: !112)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !9, line: 87, type: !35)
!118 = !DILocation(line: 87, column: 13, scope: !112)
!119 = !DILocation(line: 90, column: 12, scope: !112)
!120 = !DILocation(line: 90, column: 10, scope: !112)
!121 = !DILocation(line: 91, column: 5, scope: !112)
!122 = !DILocation(line: 91, column: 13, scope: !112)
!123 = !DILocation(line: 92, column: 86, scope: !112)
!124 = !DILocation(line: 92, column: 84, scope: !112)
!125 = !DILocation(line: 93, column: 5, scope: !112)
!126 = !DILocation(line: 94, column: 1, scope: !112)
!127 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 66, type: !24, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!128 = !DILocalVariable(name: "data", scope: !127, file: !9, line: 68, type: !10)
!129 = !DILocation(line: 68, column: 15, scope: !127)
!130 = !DILocation(line: 68, column: 22, scope: !127)
!131 = !DILocalVariable(name: "source", scope: !132, file: !9, line: 70, type: !35)
!132 = distinct !DILexicalBlock(scope: !127, file: !9, line: 69, column: 5)
!133 = !DILocation(line: 70, column: 17, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !132, file: !9, line: 71, type: !78)
!135 = !DILocation(line: 71, column: 16, scope: !132)
!136 = !DILocalVariable(name: "sourceLen", scope: !132, file: !9, line: 71, type: !78)
!137 = !DILocation(line: 71, column: 19, scope: !132)
!138 = !DILocation(line: 72, column: 28, scope: !132)
!139 = !DILocation(line: 72, column: 21, scope: !132)
!140 = !DILocation(line: 72, column: 19, scope: !132)
!141 = !DILocation(line: 75, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !132, file: !9, line: 75, column: 9)
!143 = !DILocation(line: 75, column: 14, scope: !142)
!144 = !DILocation(line: 75, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !9, line: 75, column: 9)
!146 = !DILocation(line: 75, column: 25, scope: !145)
!147 = !DILocation(line: 75, column: 35, scope: !145)
!148 = !DILocation(line: 75, column: 23, scope: !145)
!149 = !DILocation(line: 75, column: 9, scope: !142)
!150 = !DILocation(line: 77, column: 30, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !9, line: 76, column: 9)
!152 = !DILocation(line: 77, column: 23, scope: !151)
!153 = !DILocation(line: 77, column: 13, scope: !151)
!154 = !DILocation(line: 77, column: 18, scope: !151)
!155 = !DILocation(line: 77, column: 21, scope: !151)
!156 = !DILocation(line: 78, column: 9, scope: !151)
!157 = !DILocation(line: 75, column: 41, scope: !145)
!158 = !DILocation(line: 75, column: 9, scope: !145)
!159 = distinct !{!159, !149, !160, !108}
!160 = !DILocation(line: 78, column: 9, scope: !142)
!161 = !DILocation(line: 79, column: 20, scope: !132)
!162 = !DILocation(line: 79, column: 9, scope: !132)
!163 = !DILocation(line: 81, column: 1, scope: !127)
