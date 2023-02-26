; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.badSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !9
@__const.goodG2BSink.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 11, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  store i8* %2, i8** %data, align 8, !dbg !32
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %4 = load i8*, i8** %data, align 8, !dbg !35
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_badData, align 8, !dbg !36
  call void @badSink(), !dbg !37
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_good() #0 !dbg !39 {
entry:
  call void @goodG2B(), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* noundef null), !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 noundef %conv), !dbg !53
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_good(), !dbg !55
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_bad(), !dbg !58
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !61 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !62, metadata !DIExpression()), !dbg !63
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_badData, align 8, !dbg !64
  store i8* %0, i8** %data, align 8, !dbg !63
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !65, metadata !DIExpression()), !dbg !70
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !70
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.badSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !70
  call void @llvm.dbg.declare(metadata i64* %i, metadata !71, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !78, metadata !DIExpression()), !dbg !79
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !80
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !81
  store i64 %call, i64* %sourceLen, align 8, !dbg !82
  store i64 0, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !85

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !86
  %3 = load i64, i64* %sourceLen, align 8, !dbg !88
  %add = add i64 %3, 1, !dbg !89
  %cmp = icmp ult i64 %2, %add, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !94
  %5 = load i8, i8* %arrayidx, align 1, !dbg !94
  %6 = load i8*, i8** %data, align 8, !dbg !95
  %7 = load i64, i64* %i, align 8, !dbg !96
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !95
  store i8 %5, i8* %arrayidx1, align 1, !dbg !97
  br label %for.inc, !dbg !98

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !99
  %inc = add i64 %8, 1, !dbg !99
  store i64 %inc, i64* %i, align 8, !dbg !99
  br label %for.cond, !dbg !100, !llvm.loop !101

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !104
  call void @printLine(i8* noundef %9), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !107 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = alloca i8, i64 10, align 16, !dbg !112
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %1 = alloca i8, i64 11, align 16, !dbg !115
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !114
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !116
  store i8* %2, i8** %data, align 8, !dbg !117
  %3 = load i8*, i8** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !118
  store i8 0, i8* %arrayidx, align 1, !dbg !119
  %4 = load i8*, i8** %data, align 8, !dbg !120
  store i8* %4, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_goodG2BData, align 8, !dbg !121
  call void @goodG2BSink(), !dbg !122
  ret void, !dbg !123
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !124 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !125, metadata !DIExpression()), !dbg !126
  %0 = load i8*, i8** @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_goodG2BData, align 8, !dbg !127
  store i8* %0, i8** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !128, metadata !DIExpression()), !dbg !130
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !130
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2BSink.source, i32 0, i32 0), i64 11, i1 false), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !133, metadata !DIExpression()), !dbg !134
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !135
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !136
  store i64 %call, i64* %sourceLen, align 8, !dbg !137
  store i64 0, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !140

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !141
  %3 = load i64, i64* %sourceLen, align 8, !dbg !143
  %add = add i64 %3, 1, !dbg !144
  %cmp = icmp ult i64 %2, %add, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !149
  %5 = load i8, i8* %arrayidx, align 1, !dbg !149
  %6 = load i8*, i8** %data, align 8, !dbg !150
  %7 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !150
  store i8 %5, i8* %arrayidx1, align 1, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %8, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !158
  call void @printLine(i8* noundef %9), !dbg !159
  ret void, !dbg !160
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_badData", scope: !2, file: !11, line: 26, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_goodG2BData", scope: !2, file: !11, line: 27, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_bad", scope: !11, file: !11, line: 48, type: !20, scopeLine: 49, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 50, type: !5)
!24 = !DILocation(line: 50, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !11, line: 51, type: !5)
!26 = !DILocation(line: 51, column: 12, scope: !19)
!27 = !DILocation(line: 51, column: 36, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !11, line: 52, type: !5)
!29 = !DILocation(line: 52, column: 12, scope: !19)
!30 = !DILocation(line: 52, column: 37, scope: !19)
!31 = !DILocation(line: 55, column: 12, scope: !19)
!32 = !DILocation(line: 55, column: 10, scope: !19)
!33 = !DILocation(line: 56, column: 5, scope: !19)
!34 = !DILocation(line: 56, column: 13, scope: !19)
!35 = !DILocation(line: 57, column: 78, scope: !19)
!36 = !DILocation(line: 57, column: 76, scope: !19)
!37 = !DILocation(line: 58, column: 5, scope: !19)
!38 = !DILocation(line: 59, column: 1, scope: !19)
!39 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_45_good", scope: !11, file: !11, line: 96, type: !20, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!40 = !DILocation(line: 98, column: 5, scope: !39)
!41 = !DILocation(line: 99, column: 1, scope: !39)
!42 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 110, type: !43, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !45, !46}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !42, file: !11, line: 110, type: !45)
!48 = !DILocation(line: 110, column: 14, scope: !42)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !42, file: !11, line: 110, type: !46)
!50 = !DILocation(line: 110, column: 27, scope: !42)
!51 = !DILocation(line: 113, column: 22, scope: !42)
!52 = !DILocation(line: 113, column: 12, scope: !42)
!53 = !DILocation(line: 113, column: 5, scope: !42)
!54 = !DILocation(line: 115, column: 5, scope: !42)
!55 = !DILocation(line: 116, column: 5, scope: !42)
!56 = !DILocation(line: 117, column: 5, scope: !42)
!57 = !DILocation(line: 120, column: 5, scope: !42)
!58 = !DILocation(line: 121, column: 5, scope: !42)
!59 = !DILocation(line: 122, column: 5, scope: !42)
!60 = !DILocation(line: 124, column: 5, scope: !42)
!61 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 31, type: !20, scopeLine: 32, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!62 = !DILocalVariable(name: "data", scope: !61, file: !11, line: 33, type: !5)
!63 = !DILocation(line: 33, column: 12, scope: !61)
!64 = !DILocation(line: 33, column: 19, scope: !61)
!65 = !DILocalVariable(name: "source", scope: !66, file: !11, line: 35, type: !67)
!66 = distinct !DILexicalBlock(scope: !61, file: !11, line: 34, column: 5)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 88, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 11)
!70 = !DILocation(line: 35, column: 14, scope: !66)
!71 = !DILocalVariable(name: "i", scope: !66, file: !11, line: 36, type: !72)
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !73, line: 31, baseType: !74)
!73 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !75, line: 94, baseType: !76)
!75 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!76 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!77 = !DILocation(line: 36, column: 16, scope: !66)
!78 = !DILocalVariable(name: "sourceLen", scope: !66, file: !11, line: 36, type: !72)
!79 = !DILocation(line: 36, column: 19, scope: !66)
!80 = !DILocation(line: 37, column: 28, scope: !66)
!81 = !DILocation(line: 37, column: 21, scope: !66)
!82 = !DILocation(line: 37, column: 19, scope: !66)
!83 = !DILocation(line: 40, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !66, file: !11, line: 40, column: 9)
!85 = !DILocation(line: 40, column: 14, scope: !84)
!86 = !DILocation(line: 40, column: 21, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !11, line: 40, column: 9)
!88 = !DILocation(line: 40, column: 25, scope: !87)
!89 = !DILocation(line: 40, column: 35, scope: !87)
!90 = !DILocation(line: 40, column: 23, scope: !87)
!91 = !DILocation(line: 40, column: 9, scope: !84)
!92 = !DILocation(line: 42, column: 30, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !11, line: 41, column: 9)
!94 = !DILocation(line: 42, column: 23, scope: !93)
!95 = !DILocation(line: 42, column: 13, scope: !93)
!96 = !DILocation(line: 42, column: 18, scope: !93)
!97 = !DILocation(line: 42, column: 21, scope: !93)
!98 = !DILocation(line: 43, column: 9, scope: !93)
!99 = !DILocation(line: 40, column: 41, scope: !87)
!100 = !DILocation(line: 40, column: 9, scope: !87)
!101 = distinct !{!101, !91, !102, !103}
!102 = !DILocation(line: 43, column: 9, scope: !84)
!103 = !{!"llvm.loop.mustprogress"}
!104 = !DILocation(line: 44, column: 19, scope: !66)
!105 = !DILocation(line: 44, column: 9, scope: !66)
!106 = !DILocation(line: 46, column: 1, scope: !61)
!107 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 83, type: !20, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!108 = !DILocalVariable(name: "data", scope: !107, file: !11, line: 85, type: !5)
!109 = !DILocation(line: 85, column: 12, scope: !107)
!110 = !DILocalVariable(name: "dataBadBuffer", scope: !107, file: !11, line: 86, type: !5)
!111 = !DILocation(line: 86, column: 12, scope: !107)
!112 = !DILocation(line: 86, column: 36, scope: !107)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !107, file: !11, line: 87, type: !5)
!114 = !DILocation(line: 87, column: 12, scope: !107)
!115 = !DILocation(line: 87, column: 37, scope: !107)
!116 = !DILocation(line: 90, column: 12, scope: !107)
!117 = !DILocation(line: 90, column: 10, scope: !107)
!118 = !DILocation(line: 91, column: 5, scope: !107)
!119 = !DILocation(line: 91, column: 13, scope: !107)
!120 = !DILocation(line: 92, column: 82, scope: !107)
!121 = !DILocation(line: 92, column: 80, scope: !107)
!122 = !DILocation(line: 93, column: 5, scope: !107)
!123 = !DILocation(line: 94, column: 1, scope: !107)
!124 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!125 = !DILocalVariable(name: "data", scope: !124, file: !11, line: 68, type: !5)
!126 = !DILocation(line: 68, column: 12, scope: !124)
!127 = !DILocation(line: 68, column: 19, scope: !124)
!128 = !DILocalVariable(name: "source", scope: !129, file: !11, line: 70, type: !67)
!129 = distinct !DILexicalBlock(scope: !124, file: !11, line: 69, column: 5)
!130 = !DILocation(line: 70, column: 14, scope: !129)
!131 = !DILocalVariable(name: "i", scope: !129, file: !11, line: 71, type: !72)
!132 = !DILocation(line: 71, column: 16, scope: !129)
!133 = !DILocalVariable(name: "sourceLen", scope: !129, file: !11, line: 71, type: !72)
!134 = !DILocation(line: 71, column: 19, scope: !129)
!135 = !DILocation(line: 72, column: 28, scope: !129)
!136 = !DILocation(line: 72, column: 21, scope: !129)
!137 = !DILocation(line: 72, column: 19, scope: !129)
!138 = !DILocation(line: 75, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !129, file: !11, line: 75, column: 9)
!140 = !DILocation(line: 75, column: 14, scope: !139)
!141 = !DILocation(line: 75, column: 21, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !11, line: 75, column: 9)
!143 = !DILocation(line: 75, column: 25, scope: !142)
!144 = !DILocation(line: 75, column: 35, scope: !142)
!145 = !DILocation(line: 75, column: 23, scope: !142)
!146 = !DILocation(line: 75, column: 9, scope: !139)
!147 = !DILocation(line: 77, column: 30, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !11, line: 76, column: 9)
!149 = !DILocation(line: 77, column: 23, scope: !148)
!150 = !DILocation(line: 77, column: 13, scope: !148)
!151 = !DILocation(line: 77, column: 18, scope: !148)
!152 = !DILocation(line: 77, column: 21, scope: !148)
!153 = !DILocation(line: 78, column: 9, scope: !148)
!154 = !DILocation(line: 75, column: 41, scope: !142)
!155 = !DILocation(line: 75, column: 9, scope: !142)
!156 = distinct !{!156, !146, !157, !103}
!157 = !DILocation(line: 78, column: 9, scope: !139)
!158 = !DILocation(line: 79, column: 19, scope: !129)
!159 = !DILocation(line: 79, column: 9, scope: !129)
!160 = !DILocation(line: 81, column: 1, scope: !124)
