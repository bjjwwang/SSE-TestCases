; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 10, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 11, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !27
  %3 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !45
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !46
  store i64 %call, i64* %sourceLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !51
  %6 = load i64, i64* %sourceLen, align 8, !dbg !53
  %add = add i64 %6, 1, !dbg !54
  %cmp = icmp ult i64 %5, %add, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !59
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !59
  %9 = load i8*, i8** %data, align 8, !dbg !60
  %10 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !60
  store i8 %8, i8* %arrayidx2, align 1, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %11, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* noundef %12), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* noundef null), !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 noundef %conv), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 10, align 16, !dbg !100
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %1 = alloca i8, i64 11, align 16, !dbg !103
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !102
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !104
  store i8* %2, i8** %data, align 8, !dbg !105
  %3 = load i8*, i8** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !107
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !110
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !115
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !116
  store i64 %call, i64* %sourceLen, align 8, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !121
  %6 = load i64, i64* %sourceLen, align 8, !dbg !123
  %add = add i64 %6, 1, !dbg !124
  %cmp = icmp ult i64 %5, %add, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !129
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !129
  %9 = load i8*, i8** %data, align 8, !dbg !130
  %10 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !130
  store i8 %8, i8* %arrayidx2, align 1, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %11, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* noundef %12), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = alloca i8, i64 10, align 16, !dbg !146
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %1 = alloca i8, i64 11, align 16, !dbg !149
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !148
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !150
  store i8* %2, i8** %data, align 8, !dbg !151
  %3 = load i8*, i8** %data, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  %4 = bitcast [11 x i8]* %source to i8*, !dbg !156
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !161
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !162
  store i64 %call, i64* %sourceLen, align 8, !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !167
  %6 = load i64, i64* %sourceLen, align 8, !dbg !169
  %add = add i64 %6, 1, !dbg !170
  %cmp = icmp ult i64 %5, %add, !dbg !171
  br i1 %cmp, label %for.body, label %for.end, !dbg !172

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %7, !dbg !175
  %8 = load i8, i8* %arrayidx1, align 1, !dbg !175
  %9 = load i8*, i8** %data, align 8, !dbg !176
  %10 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 %10, !dbg !176
  store i8 %8, i8* %arrayidx2, align 1, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !180
  %inc = add i64 %11, 1, !dbg !180
  store i64 %inc, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %12 = load i8*, i8** %data, align 8, !dbg !184
  call void @printLine(i8* noundef %12), !dbg !185
  ret void, !dbg !186
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!26 = !DILocation(line: 38, column: 16, scope: !13)
!27 = !DILocation(line: 38, column: 14, scope: !13)
!28 = !DILocation(line: 39, column: 9, scope: !13)
!29 = !DILocation(line: 39, column: 17, scope: !13)
!30 = !DILocalVariable(name: "source", scope: !31, file: !14, line: 47, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 46, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 47, column: 14, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !14, line: 48, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 31, baseType: !39)
!38 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !40, line: 94, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 48, column: 16, scope: !31)
!43 = !DILocalVariable(name: "sourceLen", scope: !31, file: !14, line: 48, type: !37)
!44 = !DILocation(line: 48, column: 19, scope: !31)
!45 = !DILocation(line: 49, column: 28, scope: !31)
!46 = !DILocation(line: 49, column: 21, scope: !31)
!47 = !DILocation(line: 49, column: 19, scope: !31)
!48 = !DILocation(line: 52, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !31, file: !14, line: 52, column: 9)
!50 = !DILocation(line: 52, column: 14, scope: !49)
!51 = !DILocation(line: 52, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 52, column: 9)
!53 = !DILocation(line: 52, column: 25, scope: !52)
!54 = !DILocation(line: 52, column: 35, scope: !52)
!55 = !DILocation(line: 52, column: 23, scope: !52)
!56 = !DILocation(line: 52, column: 9, scope: !49)
!57 = !DILocation(line: 54, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !14, line: 53, column: 9)
!59 = !DILocation(line: 54, column: 23, scope: !58)
!60 = !DILocation(line: 54, column: 13, scope: !58)
!61 = !DILocation(line: 54, column: 18, scope: !58)
!62 = !DILocation(line: 54, column: 21, scope: !58)
!63 = !DILocation(line: 55, column: 9, scope: !58)
!64 = !DILocation(line: 52, column: 41, scope: !52)
!65 = !DILocation(line: 52, column: 9, scope: !52)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 55, column: 9, scope: !49)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 56, column: 19, scope: !31)
!70 = !DILocation(line: 56, column: 9, scope: !31)
!71 = !DILocation(line: 58, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_15_good", scope: !14, file: !14, line: 130, type: !15, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocation(line: 132, column: 5, scope: !72)
!74 = !DILocation(line: 133, column: 5, scope: !72)
!75 = !DILocation(line: 134, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 146, type: !77, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !14, line: 146, type: !79)
!82 = !DILocation(line: 146, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !14, line: 146, type: !80)
!84 = !DILocation(line: 146, column: 27, scope: !76)
!85 = !DILocation(line: 149, column: 22, scope: !76)
!86 = !DILocation(line: 149, column: 12, scope: !76)
!87 = !DILocation(line: 149, column: 5, scope: !76)
!88 = !DILocation(line: 151, column: 5, scope: !76)
!89 = !DILocation(line: 152, column: 5, scope: !76)
!90 = !DILocation(line: 153, column: 5, scope: !76)
!91 = !DILocation(line: 156, column: 5, scope: !76)
!92 = !DILocation(line: 157, column: 5, scope: !76)
!93 = !DILocation(line: 158, column: 5, scope: !76)
!94 = !DILocation(line: 160, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 67, type: !3)
!97 = !DILocation(line: 67, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !14, line: 68, type: !3)
!99 = !DILocation(line: 68, column: 12, scope: !95)
!100 = !DILocation(line: 68, column: 36, scope: !95)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !14, line: 69, type: !3)
!102 = !DILocation(line: 69, column: 12, scope: !95)
!103 = !DILocation(line: 69, column: 37, scope: !95)
!104 = !DILocation(line: 79, column: 16, scope: !95)
!105 = !DILocation(line: 79, column: 14, scope: !95)
!106 = !DILocation(line: 80, column: 9, scope: !95)
!107 = !DILocation(line: 80, column: 17, scope: !95)
!108 = !DILocalVariable(name: "source", scope: !109, file: !14, line: 84, type: !32)
!109 = distinct !DILexicalBlock(scope: !95, file: !14, line: 83, column: 5)
!110 = !DILocation(line: 84, column: 14, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !109, file: !14, line: 85, type: !37)
!112 = !DILocation(line: 85, column: 16, scope: !109)
!113 = !DILocalVariable(name: "sourceLen", scope: !109, file: !14, line: 85, type: !37)
!114 = !DILocation(line: 85, column: 19, scope: !109)
!115 = !DILocation(line: 86, column: 28, scope: !109)
!116 = !DILocation(line: 86, column: 21, scope: !109)
!117 = !DILocation(line: 86, column: 19, scope: !109)
!118 = !DILocation(line: 89, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !14, line: 89, column: 9)
!120 = !DILocation(line: 89, column: 14, scope: !119)
!121 = !DILocation(line: 89, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !14, line: 89, column: 9)
!123 = !DILocation(line: 89, column: 25, scope: !122)
!124 = !DILocation(line: 89, column: 35, scope: !122)
!125 = !DILocation(line: 89, column: 23, scope: !122)
!126 = !DILocation(line: 89, column: 9, scope: !119)
!127 = !DILocation(line: 91, column: 30, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !14, line: 90, column: 9)
!129 = !DILocation(line: 91, column: 23, scope: !128)
!130 = !DILocation(line: 91, column: 13, scope: !128)
!131 = !DILocation(line: 91, column: 18, scope: !128)
!132 = !DILocation(line: 91, column: 21, scope: !128)
!133 = !DILocation(line: 92, column: 9, scope: !128)
!134 = !DILocation(line: 89, column: 41, scope: !122)
!135 = !DILocation(line: 89, column: 9, scope: !122)
!136 = distinct !{!136, !126, !137, !68}
!137 = !DILocation(line: 92, column: 9, scope: !119)
!138 = !DILocation(line: 93, column: 19, scope: !109)
!139 = !DILocation(line: 93, column: 9, scope: !109)
!140 = !DILocation(line: 95, column: 1, scope: !95)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 98, type: !15, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!142 = !DILocalVariable(name: "data", scope: !141, file: !14, line: 100, type: !3)
!143 = !DILocation(line: 100, column: 12, scope: !141)
!144 = !DILocalVariable(name: "dataBadBuffer", scope: !141, file: !14, line: 101, type: !3)
!145 = !DILocation(line: 101, column: 12, scope: !141)
!146 = !DILocation(line: 101, column: 36, scope: !141)
!147 = !DILocalVariable(name: "dataGoodBuffer", scope: !141, file: !14, line: 102, type: !3)
!148 = !DILocation(line: 102, column: 12, scope: !141)
!149 = !DILocation(line: 102, column: 37, scope: !141)
!150 = !DILocation(line: 108, column: 16, scope: !141)
!151 = !DILocation(line: 108, column: 14, scope: !141)
!152 = !DILocation(line: 109, column: 9, scope: !141)
!153 = !DILocation(line: 109, column: 17, scope: !141)
!154 = !DILocalVariable(name: "source", scope: !155, file: !14, line: 117, type: !32)
!155 = distinct !DILexicalBlock(scope: !141, file: !14, line: 116, column: 5)
!156 = !DILocation(line: 117, column: 14, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !155, file: !14, line: 118, type: !37)
!158 = !DILocation(line: 118, column: 16, scope: !155)
!159 = !DILocalVariable(name: "sourceLen", scope: !155, file: !14, line: 118, type: !37)
!160 = !DILocation(line: 118, column: 19, scope: !155)
!161 = !DILocation(line: 119, column: 28, scope: !155)
!162 = !DILocation(line: 119, column: 21, scope: !155)
!163 = !DILocation(line: 119, column: 19, scope: !155)
!164 = !DILocation(line: 122, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !155, file: !14, line: 122, column: 9)
!166 = !DILocation(line: 122, column: 14, scope: !165)
!167 = !DILocation(line: 122, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !14, line: 122, column: 9)
!169 = !DILocation(line: 122, column: 25, scope: !168)
!170 = !DILocation(line: 122, column: 35, scope: !168)
!171 = !DILocation(line: 122, column: 23, scope: !168)
!172 = !DILocation(line: 122, column: 9, scope: !165)
!173 = !DILocation(line: 124, column: 30, scope: !174)
!174 = distinct !DILexicalBlock(scope: !168, file: !14, line: 123, column: 9)
!175 = !DILocation(line: 124, column: 23, scope: !174)
!176 = !DILocation(line: 124, column: 13, scope: !174)
!177 = !DILocation(line: 124, column: 18, scope: !174)
!178 = !DILocation(line: 124, column: 21, scope: !174)
!179 = !DILocation(line: 125, column: 9, scope: !174)
!180 = !DILocation(line: 122, column: 41, scope: !168)
!181 = !DILocation(line: 122, column: 9, scope: !168)
!182 = distinct !{!182, !172, !183, !68}
!183 = !DILocation(line: 125, column: 9, scope: !165)
!184 = !DILocation(line: 126, column: 19, scope: !155)
!185 = !DILocation(line: 126, column: 9, scope: !155)
!186 = !DILocation(line: 128, column: 1, scope: !141)
