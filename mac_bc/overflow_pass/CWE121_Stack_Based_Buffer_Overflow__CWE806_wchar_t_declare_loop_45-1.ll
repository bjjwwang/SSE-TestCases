; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_badData = internal global i32* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_goodG2BData = internal global i32* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !37
  %1 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %2 = load i32*, i32** %data, align 8, !dbg !40
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_badData, align 8, !dbg !41
  call void @badSink(), !dbg !42
  ret void, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_good() #0 !dbg !44 {
entry:
  call void @goodG2B(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_badData, align 8, !dbg !70
  store i32* %0, i32** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !71, metadata !DIExpression()), !dbg !76
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !83, metadata !DIExpression()), !dbg !84
  %2 = load i32*, i32** %data, align 8, !dbg !85
  %call = call i64 @wcslen(i32* noundef %2), !dbg !86
  store i64 %call, i64* %dataLen, align 8, !dbg !87
  store i64 0, i64* %i, align 8, !dbg !88
  br label %for.cond, !dbg !90

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !91
  %4 = load i64, i64* %dataLen, align 8, !dbg !93
  %cmp = icmp ult i64 %3, %4, !dbg !94
  br i1 %cmp, label %for.body, label %for.end, !dbg !95

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !96
  %6 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !96
  %7 = load i32, i32* %arrayidx, align 4, !dbg !96
  %8 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !100
  store i32 %7, i32* %arrayidx1, align 4, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !103
  %inc = add i64 %9, 1, !dbg !103
  store i64 %inc, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !108
  store i32 0, i32* %arrayidx2, align 4, !dbg !109
  %10 = load i32*, i32** %data, align 8, !dbg !110
  call void @printWLine(i32* noundef %10), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !118
  store i32* %arraydecay, i32** %data, align 8, !dbg !119
  %0 = load i32*, i32** %data, align 8, !dbg !120
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !121
  %1 = load i32*, i32** %data, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %2 = load i32*, i32** %data, align 8, !dbg !124
  store i32* %2, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !125
  call void @goodG2BSink(), !dbg !126
  ret void, !dbg !127
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !128 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !129, metadata !DIExpression()), !dbg !130
  %0 = load i32*, i32** @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_goodG2BData, align 8, !dbg !131
  store i32* %0, i32** %data, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !132, metadata !DIExpression()), !dbg !134
  %1 = bitcast [50 x i32]* %dest to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 200, i1 false), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %i, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !137, metadata !DIExpression()), !dbg !138
  %2 = load i32*, i32** %data, align 8, !dbg !139
  %call = call i64 @wcslen(i32* noundef %2), !dbg !140
  store i64 %call, i64* %dataLen, align 8, !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !145
  %4 = load i64, i64* %dataLen, align 8, !dbg !147
  %cmp = icmp ult i64 %3, %4, !dbg !148
  br i1 %cmp, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %data, align 8, !dbg !150
  %6 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %6, !dbg !150
  %7 = load i32, i32* %arrayidx, align 4, !dbg !150
  %8 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx1 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %8, !dbg !154
  store i32 %7, i32* %arrayidx1, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !157
  %inc = add i64 %9, 1, !dbg !157
  store i64 %inc, i64* %i, align 8, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %arrayidx2 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !161
  store i32 0, i32* %arrayidx2, align 4, !dbg !162
  %10 = load i32*, i32** %data, align 8, !dbg !163
  call void @printWLine(i32* noundef %10), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_badData", scope: !2, file: !9, line: 21, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_goodG2BData", scope: !2, file: !9, line: 22, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_bad", scope: !9, file: !9, line: 43, type: !24, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !9, line: 45, type: !10)
!28 = !DILocation(line: 45, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !9, line: 46, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 46, column: 13, scope: !23)
!34 = !DILocation(line: 47, column: 12, scope: !23)
!35 = !DILocation(line: 47, column: 10, scope: !23)
!36 = !DILocation(line: 49, column: 13, scope: !23)
!37 = !DILocation(line: 49, column: 5, scope: !23)
!38 = !DILocation(line: 50, column: 5, scope: !23)
!39 = !DILocation(line: 50, column: 17, scope: !23)
!40 = !DILocation(line: 51, column: 82, scope: !23)
!41 = !DILocation(line: 51, column: 80, scope: !23)
!42 = !DILocation(line: 52, column: 5, scope: !23)
!43 = !DILocation(line: 53, column: 1, scope: !23)
!44 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_45_good", scope: !9, file: !9, line: 89, type: !24, scopeLine: 90, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!45 = !DILocation(line: 91, column: 5, scope: !44)
!46 = !DILocation(line: 92, column: 1, scope: !44)
!47 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 103, type: !48, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!48 = !DISubroutineType(types: !49)
!49 = !{!15, !15, !50}
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !47, file: !9, line: 103, type: !15)
!54 = !DILocation(line: 103, column: 14, scope: !47)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !47, file: !9, line: 103, type: !50)
!56 = !DILocation(line: 103, column: 27, scope: !47)
!57 = !DILocation(line: 106, column: 22, scope: !47)
!58 = !DILocation(line: 106, column: 12, scope: !47)
!59 = !DILocation(line: 106, column: 5, scope: !47)
!60 = !DILocation(line: 108, column: 5, scope: !47)
!61 = !DILocation(line: 109, column: 5, scope: !47)
!62 = !DILocation(line: 110, column: 5, scope: !47)
!63 = !DILocation(line: 113, column: 5, scope: !47)
!64 = !DILocation(line: 114, column: 5, scope: !47)
!65 = !DILocation(line: 115, column: 5, scope: !47)
!66 = !DILocation(line: 117, column: 5, scope: !47)
!67 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 26, type: !24, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!68 = !DILocalVariable(name: "data", scope: !67, file: !9, line: 28, type: !10)
!69 = !DILocation(line: 28, column: 15, scope: !67)
!70 = !DILocation(line: 28, column: 22, scope: !67)
!71 = !DILocalVariable(name: "dest", scope: !72, file: !9, line: 30, type: !73)
!72 = distinct !DILexicalBlock(scope: !67, file: !9, line: 29, column: 5)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 1600, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 50)
!76 = !DILocation(line: 30, column: 17, scope: !72)
!77 = !DILocalVariable(name: "i", scope: !72, file: !9, line: 31, type: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !79, line: 31, baseType: !80)
!79 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !14, line: 94, baseType: !81)
!81 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!82 = !DILocation(line: 31, column: 16, scope: !72)
!83 = !DILocalVariable(name: "dataLen", scope: !72, file: !9, line: 31, type: !78)
!84 = !DILocation(line: 31, column: 19, scope: !72)
!85 = !DILocation(line: 32, column: 26, scope: !72)
!86 = !DILocation(line: 32, column: 19, scope: !72)
!87 = !DILocation(line: 32, column: 17, scope: !72)
!88 = !DILocation(line: 34, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !72, file: !9, line: 34, column: 9)
!90 = !DILocation(line: 34, column: 14, scope: !89)
!91 = !DILocation(line: 34, column: 21, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !9, line: 34, column: 9)
!93 = !DILocation(line: 34, column: 25, scope: !92)
!94 = !DILocation(line: 34, column: 23, scope: !92)
!95 = !DILocation(line: 34, column: 9, scope: !89)
!96 = !DILocation(line: 36, column: 23, scope: !97)
!97 = distinct !DILexicalBlock(scope: !92, file: !9, line: 35, column: 9)
!98 = !DILocation(line: 36, column: 28, scope: !97)
!99 = !DILocation(line: 36, column: 18, scope: !97)
!100 = !DILocation(line: 36, column: 13, scope: !97)
!101 = !DILocation(line: 36, column: 21, scope: !97)
!102 = !DILocation(line: 37, column: 9, scope: !97)
!103 = !DILocation(line: 34, column: 35, scope: !92)
!104 = !DILocation(line: 34, column: 9, scope: !92)
!105 = distinct !{!105, !95, !106, !107}
!106 = !DILocation(line: 37, column: 9, scope: !89)
!107 = !{!"llvm.loop.mustprogress"}
!108 = !DILocation(line: 38, column: 9, scope: !72)
!109 = !DILocation(line: 38, column: 20, scope: !72)
!110 = !DILocation(line: 39, column: 20, scope: !72)
!111 = !DILocation(line: 39, column: 9, scope: !72)
!112 = !DILocation(line: 41, column: 1, scope: !67)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 77, type: !24, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!114 = !DILocalVariable(name: "data", scope: !113, file: !9, line: 79, type: !10)
!115 = !DILocation(line: 79, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBuffer", scope: !113, file: !9, line: 80, type: !30)
!117 = !DILocation(line: 80, column: 13, scope: !113)
!118 = !DILocation(line: 81, column: 12, scope: !113)
!119 = !DILocation(line: 81, column: 10, scope: !113)
!120 = !DILocation(line: 83, column: 13, scope: !113)
!121 = !DILocation(line: 83, column: 5, scope: !113)
!122 = !DILocation(line: 84, column: 5, scope: !113)
!123 = !DILocation(line: 84, column: 16, scope: !113)
!124 = !DILocation(line: 85, column: 86, scope: !113)
!125 = !DILocation(line: 85, column: 84, scope: !113)
!126 = !DILocation(line: 86, column: 5, scope: !113)
!127 = !DILocation(line: 87, column: 1, scope: !113)
!128 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 60, type: !24, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!129 = !DILocalVariable(name: "data", scope: !128, file: !9, line: 62, type: !10)
!130 = !DILocation(line: 62, column: 15, scope: !128)
!131 = !DILocation(line: 62, column: 22, scope: !128)
!132 = !DILocalVariable(name: "dest", scope: !133, file: !9, line: 64, type: !73)
!133 = distinct !DILexicalBlock(scope: !128, file: !9, line: 63, column: 5)
!134 = !DILocation(line: 64, column: 17, scope: !133)
!135 = !DILocalVariable(name: "i", scope: !133, file: !9, line: 65, type: !78)
!136 = !DILocation(line: 65, column: 16, scope: !133)
!137 = !DILocalVariable(name: "dataLen", scope: !133, file: !9, line: 65, type: !78)
!138 = !DILocation(line: 65, column: 19, scope: !133)
!139 = !DILocation(line: 66, column: 26, scope: !133)
!140 = !DILocation(line: 66, column: 19, scope: !133)
!141 = !DILocation(line: 66, column: 17, scope: !133)
!142 = !DILocation(line: 68, column: 16, scope: !143)
!143 = distinct !DILexicalBlock(scope: !133, file: !9, line: 68, column: 9)
!144 = !DILocation(line: 68, column: 14, scope: !143)
!145 = !DILocation(line: 68, column: 21, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !9, line: 68, column: 9)
!147 = !DILocation(line: 68, column: 25, scope: !146)
!148 = !DILocation(line: 68, column: 23, scope: !146)
!149 = !DILocation(line: 68, column: 9, scope: !143)
!150 = !DILocation(line: 70, column: 23, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !9, line: 69, column: 9)
!152 = !DILocation(line: 70, column: 28, scope: !151)
!153 = !DILocation(line: 70, column: 18, scope: !151)
!154 = !DILocation(line: 70, column: 13, scope: !151)
!155 = !DILocation(line: 70, column: 21, scope: !151)
!156 = !DILocation(line: 71, column: 9, scope: !151)
!157 = !DILocation(line: 68, column: 35, scope: !146)
!158 = !DILocation(line: 68, column: 9, scope: !146)
!159 = distinct !{!159, !149, !160, !107}
!160 = !DILocation(line: 71, column: 9, scope: !143)
!161 = !DILocation(line: 72, column: 9, scope: !133)
!162 = !DILocation(line: 72, column: 20, scope: !133)
!163 = !DILocation(line: 73, column: 20, scope: !133)
!164 = !DILocation(line: 73, column: 9, scope: !133)
!165 = !DILocation(line: 75, column: 1, scope: !128)
