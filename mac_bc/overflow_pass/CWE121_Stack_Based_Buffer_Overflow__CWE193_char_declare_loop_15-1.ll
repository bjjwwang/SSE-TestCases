; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  store i8* %arraydecay, i8** %data, align 8, !dbg !31
  %0 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !34, metadata !DIExpression()), !dbg !36
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !36
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !36
  call void @llvm.dbg.declare(metadata i64* %i, metadata !37, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !46
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !47
  store i64 %call, i64* %sourceLen, align 8, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !52
  %3 = load i64, i64* %sourceLen, align 8, !dbg !54
  %add = add i64 %3, 1, !dbg !55
  %cmp = icmp ult i64 %2, %add, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !60
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !60
  %6 = load i8*, i8** %data, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !61
  store i8 %5, i8* %arrayidx3, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %8, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* noundef %9), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* noundef null), !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 noundef %conv), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !103
  store i8* %arraydecay, i8** %data, align 8, !dbg !104
  %0 = load i8*, i8** %data, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !105
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !107, metadata !DIExpression()), !dbg !109
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !109
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !112, metadata !DIExpression()), !dbg !113
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !114
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !115
  store i64 %call, i64* %sourceLen, align 8, !dbg !116
  store i64 0, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !119

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !120
  %3 = load i64, i64* %sourceLen, align 8, !dbg !122
  %add = add i64 %3, 1, !dbg !123
  %cmp = icmp ult i64 %2, %add, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !128
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !128
  %6 = load i8*, i8** %data, align 8, !dbg !129
  %7 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !129
  store i8 %5, i8* %arrayidx3, align 1, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !133
  %inc = add i64 %8, 1, !dbg !133
  store i64 %inc, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !137
  call void @printLine(i8* noundef %9), !dbg !138
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !140 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !147
  store i8* %arraydecay, i8** %data, align 8, !dbg !148
  %0 = load i8*, i8** %data, align 8, !dbg !149
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !151, metadata !DIExpression()), !dbg !153
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !153
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !153
  call void @llvm.dbg.declare(metadata i64* %i, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !156, metadata !DIExpression()), !dbg !157
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !158
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !159
  store i64 %call, i64* %sourceLen, align 8, !dbg !160
  store i64 0, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !163

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !164
  %3 = load i64, i64* %sourceLen, align 8, !dbg !166
  %add = add i64 %3, 1, !dbg !167
  %cmp = icmp ult i64 %2, %add, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !172
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !172
  %6 = load i8*, i8** %data, align 8, !dbg !173
  %7 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !173
  store i8 %5, i8* %arrayidx3, align 1, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %8, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !181
  call void @printLine(i8* noundef %9), !dbg !182
  ret void, !dbg !183
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 38, column: 16, scope: !11)
!31 = !DILocation(line: 38, column: 14, scope: !11)
!32 = !DILocation(line: 39, column: 9, scope: !11)
!33 = !DILocation(line: 39, column: 17, scope: !11)
!34 = !DILocalVariable(name: "source", scope: !35, file: !12, line: 47, type: !26)
!35 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!36 = !DILocation(line: 47, column: 14, scope: !35)
!37 = !DILocalVariable(name: "i", scope: !35, file: !12, line: 48, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 31, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !41, line: 94, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!42 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 48, column: 16, scope: !35)
!44 = !DILocalVariable(name: "sourceLen", scope: !35, file: !12, line: 48, type: !38)
!45 = !DILocation(line: 48, column: 19, scope: !35)
!46 = !DILocation(line: 49, column: 28, scope: !35)
!47 = !DILocation(line: 49, column: 21, scope: !35)
!48 = !DILocation(line: 49, column: 19, scope: !35)
!49 = !DILocation(line: 52, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !35, file: !12, line: 52, column: 9)
!51 = !DILocation(line: 52, column: 14, scope: !50)
!52 = !DILocation(line: 52, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 52, column: 9)
!54 = !DILocation(line: 52, column: 25, scope: !53)
!55 = !DILocation(line: 52, column: 35, scope: !53)
!56 = !DILocation(line: 52, column: 23, scope: !53)
!57 = !DILocation(line: 52, column: 9, scope: !50)
!58 = !DILocation(line: 54, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !53, file: !12, line: 53, column: 9)
!60 = !DILocation(line: 54, column: 23, scope: !59)
!61 = !DILocation(line: 54, column: 13, scope: !59)
!62 = !DILocation(line: 54, column: 18, scope: !59)
!63 = !DILocation(line: 54, column: 21, scope: !59)
!64 = !DILocation(line: 55, column: 9, scope: !59)
!65 = !DILocation(line: 52, column: 41, scope: !53)
!66 = !DILocation(line: 52, column: 9, scope: !53)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 55, column: 9, scope: !50)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 56, column: 19, scope: !35)
!71 = !DILocation(line: 56, column: 9, scope: !35)
!72 = !DILocation(line: 58, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_15_good", scope: !12, file: !12, line: 130, type: !13, scopeLine: 131, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!74 = !DILocation(line: 132, column: 5, scope: !73)
!75 = !DILocation(line: 133, column: 5, scope: !73)
!76 = !DILocation(line: 134, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 146, type: !78, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 146, type: !80)
!83 = !DILocation(line: 146, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 146, type: !81)
!85 = !DILocation(line: 146, column: 27, scope: !77)
!86 = !DILocation(line: 149, column: 22, scope: !77)
!87 = !DILocation(line: 149, column: 12, scope: !77)
!88 = !DILocation(line: 149, column: 5, scope: !77)
!89 = !DILocation(line: 151, column: 5, scope: !77)
!90 = !DILocation(line: 152, column: 5, scope: !77)
!91 = !DILocation(line: 153, column: 5, scope: !77)
!92 = !DILocation(line: 156, column: 5, scope: !77)
!93 = !DILocation(line: 157, column: 5, scope: !77)
!94 = !DILocation(line: 158, column: 5, scope: !77)
!95 = !DILocation(line: 160, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocalVariable(name: "data", scope: !96, file: !12, line: 67, type: !17)
!98 = !DILocation(line: 67, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBadBuffer", scope: !96, file: !12, line: 68, type: !21)
!100 = !DILocation(line: 68, column: 10, scope: !96)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !96, file: !12, line: 69, type: !26)
!102 = !DILocation(line: 69, column: 10, scope: !96)
!103 = !DILocation(line: 79, column: 16, scope: !96)
!104 = !DILocation(line: 79, column: 14, scope: !96)
!105 = !DILocation(line: 80, column: 9, scope: !96)
!106 = !DILocation(line: 80, column: 17, scope: !96)
!107 = !DILocalVariable(name: "source", scope: !108, file: !12, line: 84, type: !26)
!108 = distinct !DILexicalBlock(scope: !96, file: !12, line: 83, column: 5)
!109 = !DILocation(line: 84, column: 14, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !108, file: !12, line: 85, type: !38)
!111 = !DILocation(line: 85, column: 16, scope: !108)
!112 = !DILocalVariable(name: "sourceLen", scope: !108, file: !12, line: 85, type: !38)
!113 = !DILocation(line: 85, column: 19, scope: !108)
!114 = !DILocation(line: 86, column: 28, scope: !108)
!115 = !DILocation(line: 86, column: 21, scope: !108)
!116 = !DILocation(line: 86, column: 19, scope: !108)
!117 = !DILocation(line: 89, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !12, line: 89, column: 9)
!119 = !DILocation(line: 89, column: 14, scope: !118)
!120 = !DILocation(line: 89, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !12, line: 89, column: 9)
!122 = !DILocation(line: 89, column: 25, scope: !121)
!123 = !DILocation(line: 89, column: 35, scope: !121)
!124 = !DILocation(line: 89, column: 23, scope: !121)
!125 = !DILocation(line: 89, column: 9, scope: !118)
!126 = !DILocation(line: 91, column: 30, scope: !127)
!127 = distinct !DILexicalBlock(scope: !121, file: !12, line: 90, column: 9)
!128 = !DILocation(line: 91, column: 23, scope: !127)
!129 = !DILocation(line: 91, column: 13, scope: !127)
!130 = !DILocation(line: 91, column: 18, scope: !127)
!131 = !DILocation(line: 91, column: 21, scope: !127)
!132 = !DILocation(line: 92, column: 9, scope: !127)
!133 = !DILocation(line: 89, column: 41, scope: !121)
!134 = !DILocation(line: 89, column: 9, scope: !121)
!135 = distinct !{!135, !125, !136, !69}
!136 = !DILocation(line: 92, column: 9, scope: !118)
!137 = !DILocation(line: 93, column: 19, scope: !108)
!138 = !DILocation(line: 93, column: 9, scope: !108)
!139 = !DILocation(line: 95, column: 1, scope: !96)
!140 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 98, type: !13, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!141 = !DILocalVariable(name: "data", scope: !140, file: !12, line: 100, type: !17)
!142 = !DILocation(line: 100, column: 12, scope: !140)
!143 = !DILocalVariable(name: "dataBadBuffer", scope: !140, file: !12, line: 101, type: !21)
!144 = !DILocation(line: 101, column: 10, scope: !140)
!145 = !DILocalVariable(name: "dataGoodBuffer", scope: !140, file: !12, line: 102, type: !26)
!146 = !DILocation(line: 102, column: 10, scope: !140)
!147 = !DILocation(line: 108, column: 16, scope: !140)
!148 = !DILocation(line: 108, column: 14, scope: !140)
!149 = !DILocation(line: 109, column: 9, scope: !140)
!150 = !DILocation(line: 109, column: 17, scope: !140)
!151 = !DILocalVariable(name: "source", scope: !152, file: !12, line: 117, type: !26)
!152 = distinct !DILexicalBlock(scope: !140, file: !12, line: 116, column: 5)
!153 = !DILocation(line: 117, column: 14, scope: !152)
!154 = !DILocalVariable(name: "i", scope: !152, file: !12, line: 118, type: !38)
!155 = !DILocation(line: 118, column: 16, scope: !152)
!156 = !DILocalVariable(name: "sourceLen", scope: !152, file: !12, line: 118, type: !38)
!157 = !DILocation(line: 118, column: 19, scope: !152)
!158 = !DILocation(line: 119, column: 28, scope: !152)
!159 = !DILocation(line: 119, column: 21, scope: !152)
!160 = !DILocation(line: 119, column: 19, scope: !152)
!161 = !DILocation(line: 122, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !152, file: !12, line: 122, column: 9)
!163 = !DILocation(line: 122, column: 14, scope: !162)
!164 = !DILocation(line: 122, column: 21, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 122, column: 9)
!166 = !DILocation(line: 122, column: 25, scope: !165)
!167 = !DILocation(line: 122, column: 35, scope: !165)
!168 = !DILocation(line: 122, column: 23, scope: !165)
!169 = !DILocation(line: 122, column: 9, scope: !162)
!170 = !DILocation(line: 124, column: 30, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !12, line: 123, column: 9)
!172 = !DILocation(line: 124, column: 23, scope: !171)
!173 = !DILocation(line: 124, column: 13, scope: !171)
!174 = !DILocation(line: 124, column: 18, scope: !171)
!175 = !DILocation(line: 124, column: 21, scope: !171)
!176 = !DILocation(line: 125, column: 9, scope: !171)
!177 = !DILocation(line: 122, column: 41, scope: !165)
!178 = !DILocation(line: 122, column: 9, scope: !165)
!179 = distinct !{!179, !169, !180, !69}
!180 = !DILocation(line: 125, column: 9, scope: !162)
!181 = !DILocation(line: 126, column: 19, scope: !152)
!182 = !DILocation(line: 126, column: 9, scope: !152)
!183 = !DILocation(line: 128, column: 1, scope: !140)
