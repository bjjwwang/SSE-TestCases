; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06_bad() #0 !dbg !11 {
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
  store i8* %arraydecay, i8** %data, align 8, !dbg !33
  %0 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !36, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !38
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !46, metadata !DIExpression()), !dbg !47
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !48
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !49
  store i64 %call, i64* %sourceLen, align 8, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !54
  %3 = load i64, i64* %sourceLen, align 8, !dbg !56
  %add = add i64 %3, 1, !dbg !57
  %cmp = icmp ult i64 %2, %add, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !62
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !62
  %6 = load i8*, i8** %data, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !63
  store i8 %5, i8* %arrayidx3, align 1, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %8, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* noundef %9), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* noundef null), !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 noundef %conv), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !105
  store i8* %arraydecay, i8** %data, align 8, !dbg !108
  %0 = load i8*, i8** %data, align 8, !dbg !109
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !111, metadata !DIExpression()), !dbg !113
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !116, metadata !DIExpression()), !dbg !117
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !118
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !119
  store i64 %call, i64* %sourceLen, align 8, !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !124
  %3 = load i64, i64* %sourceLen, align 8, !dbg !126
  %add = add i64 %3, 1, !dbg !127
  %cmp = icmp ult i64 %2, %add, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !132
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !132
  %6 = load i8*, i8** %data, align 8, !dbg !133
  %7 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !133
  store i8 %5, i8* %arrayidx3, align 1, !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !137
  %inc = add i64 %8, 1, !dbg !137
  store i64 %inc, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !141
  call void @printLine(i8* noundef %9), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !149, metadata !DIExpression()), !dbg !150
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !151
  store i8* %arraydecay, i8** %data, align 8, !dbg !154
  %0 = load i8*, i8** %data, align 8, !dbg !155
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !155
  store i8 0, i8* %arrayidx, align 1, !dbg !156
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !157, metadata !DIExpression()), !dbg !159
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !159
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !162, metadata !DIExpression()), !dbg !163
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !164
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !165
  store i64 %call, i64* %sourceLen, align 8, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !170
  %3 = load i64, i64* %sourceLen, align 8, !dbg !172
  %add = add i64 %3, 1, !dbg !173
  %cmp = icmp ult i64 %2, %add, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx2 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !178
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !178
  %6 = load i8*, i8** %data, align 8, !dbg !179
  %7 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx3 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !179
  store i8 %5, i8* %arrayidx3, align 1, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !183
  %inc = add i64 %8, 1, !dbg !183
  store i64 %inc, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !187
  call void @printLine(i8* noundef %9), !dbg !188
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06_bad", scope: !12, file: !12, line: 32, type: !13, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 34, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 34, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 35, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 80, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 10)
!24 = !DILocation(line: 35, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 36, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DILocation(line: 36, column: 10, scope: !11)
!30 = !DILocation(line: 41, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !12, line: 38, column: 5)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 8)
!33 = !DILocation(line: 41, column: 14, scope: !31)
!34 = !DILocation(line: 42, column: 9, scope: !31)
!35 = !DILocation(line: 42, column: 17, scope: !31)
!36 = !DILocalVariable(name: "source", scope: !37, file: !12, line: 45, type: !26)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 44, column: 5)
!38 = !DILocation(line: 45, column: 14, scope: !37)
!39 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 46, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !43, line: 94, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 46, column: 16, scope: !37)
!46 = !DILocalVariable(name: "sourceLen", scope: !37, file: !12, line: 46, type: !40)
!47 = !DILocation(line: 46, column: 19, scope: !37)
!48 = !DILocation(line: 47, column: 28, scope: !37)
!49 = !DILocation(line: 47, column: 21, scope: !37)
!50 = !DILocation(line: 47, column: 19, scope: !37)
!51 = !DILocation(line: 50, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !37, file: !12, line: 50, column: 9)
!53 = !DILocation(line: 50, column: 14, scope: !52)
!54 = !DILocation(line: 50, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 50, column: 9)
!56 = !DILocation(line: 50, column: 25, scope: !55)
!57 = !DILocation(line: 50, column: 35, scope: !55)
!58 = !DILocation(line: 50, column: 23, scope: !55)
!59 = !DILocation(line: 50, column: 9, scope: !52)
!60 = !DILocation(line: 52, column: 30, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !12, line: 51, column: 9)
!62 = !DILocation(line: 52, column: 23, scope: !61)
!63 = !DILocation(line: 52, column: 13, scope: !61)
!64 = !DILocation(line: 52, column: 18, scope: !61)
!65 = !DILocation(line: 52, column: 21, scope: !61)
!66 = !DILocation(line: 53, column: 9, scope: !61)
!67 = !DILocation(line: 50, column: 41, scope: !55)
!68 = !DILocation(line: 50, column: 9, scope: !55)
!69 = distinct !{!69, !59, !70, !71}
!70 = !DILocation(line: 53, column: 9, scope: !52)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 54, column: 19, scope: !37)
!73 = !DILocation(line: 54, column: 9, scope: !37)
!74 = !DILocation(line: 56, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_06_good", scope: !12, file: !12, line: 121, type: !13, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DILocation(line: 123, column: 5, scope: !75)
!77 = !DILocation(line: 124, column: 5, scope: !75)
!78 = !DILocation(line: 125, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 137, type: !80, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 137, type: !82)
!85 = !DILocation(line: 137, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 137, type: !83)
!87 = !DILocation(line: 137, column: 27, scope: !79)
!88 = !DILocation(line: 140, column: 22, scope: !79)
!89 = !DILocation(line: 140, column: 12, scope: !79)
!90 = !DILocation(line: 140, column: 5, scope: !79)
!91 = !DILocation(line: 142, column: 5, scope: !79)
!92 = !DILocation(line: 143, column: 5, scope: !79)
!93 = !DILocation(line: 144, column: 5, scope: !79)
!94 = !DILocation(line: 147, column: 5, scope: !79)
!95 = !DILocation(line: 148, column: 5, scope: !79)
!96 = !DILocation(line: 149, column: 5, scope: !79)
!97 = !DILocation(line: 151, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 65, type: !17)
!100 = !DILocation(line: 65, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !12, line: 66, type: !21)
!102 = !DILocation(line: 66, column: 10, scope: !98)
!103 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !12, line: 67, type: !26)
!104 = !DILocation(line: 67, column: 10, scope: !98)
!105 = !DILocation(line: 77, column: 16, scope: !106)
!106 = distinct !DILexicalBlock(scope: !107, file: !12, line: 74, column: 5)
!107 = distinct !DILexicalBlock(scope: !98, file: !12, line: 68, column: 8)
!108 = !DILocation(line: 77, column: 14, scope: !106)
!109 = !DILocation(line: 78, column: 9, scope: !106)
!110 = !DILocation(line: 78, column: 17, scope: !106)
!111 = !DILocalVariable(name: "source", scope: !112, file: !12, line: 81, type: !26)
!112 = distinct !DILexicalBlock(scope: !98, file: !12, line: 80, column: 5)
!113 = !DILocation(line: 81, column: 14, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 82, type: !40)
!115 = !DILocation(line: 82, column: 16, scope: !112)
!116 = !DILocalVariable(name: "sourceLen", scope: !112, file: !12, line: 82, type: !40)
!117 = !DILocation(line: 82, column: 19, scope: !112)
!118 = !DILocation(line: 83, column: 28, scope: !112)
!119 = !DILocation(line: 83, column: 21, scope: !112)
!120 = !DILocation(line: 83, column: 19, scope: !112)
!121 = !DILocation(line: 86, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !112, file: !12, line: 86, column: 9)
!123 = !DILocation(line: 86, column: 14, scope: !122)
!124 = !DILocation(line: 86, column: 21, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 86, column: 9)
!126 = !DILocation(line: 86, column: 25, scope: !125)
!127 = !DILocation(line: 86, column: 35, scope: !125)
!128 = !DILocation(line: 86, column: 23, scope: !125)
!129 = !DILocation(line: 86, column: 9, scope: !122)
!130 = !DILocation(line: 88, column: 30, scope: !131)
!131 = distinct !DILexicalBlock(scope: !125, file: !12, line: 87, column: 9)
!132 = !DILocation(line: 88, column: 23, scope: !131)
!133 = !DILocation(line: 88, column: 13, scope: !131)
!134 = !DILocation(line: 88, column: 18, scope: !131)
!135 = !DILocation(line: 88, column: 21, scope: !131)
!136 = !DILocation(line: 89, column: 9, scope: !131)
!137 = !DILocation(line: 86, column: 41, scope: !125)
!138 = !DILocation(line: 86, column: 9, scope: !125)
!139 = distinct !{!139, !129, !140, !71}
!140 = !DILocation(line: 89, column: 9, scope: !122)
!141 = !DILocation(line: 90, column: 19, scope: !112)
!142 = !DILocation(line: 90, column: 9, scope: !112)
!143 = !DILocation(line: 92, column: 1, scope: !98)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!145 = !DILocalVariable(name: "data", scope: !144, file: !12, line: 97, type: !17)
!146 = !DILocation(line: 97, column: 12, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !12, line: 98, type: !21)
!148 = !DILocation(line: 98, column: 10, scope: !144)
!149 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !12, line: 99, type: !26)
!150 = !DILocation(line: 99, column: 10, scope: !144)
!151 = !DILocation(line: 104, column: 16, scope: !152)
!152 = distinct !DILexicalBlock(scope: !153, file: !12, line: 101, column: 5)
!153 = distinct !DILexicalBlock(scope: !144, file: !12, line: 100, column: 8)
!154 = !DILocation(line: 104, column: 14, scope: !152)
!155 = !DILocation(line: 105, column: 9, scope: !152)
!156 = !DILocation(line: 105, column: 17, scope: !152)
!157 = !DILocalVariable(name: "source", scope: !158, file: !12, line: 108, type: !26)
!158 = distinct !DILexicalBlock(scope: !144, file: !12, line: 107, column: 5)
!159 = !DILocation(line: 108, column: 14, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !158, file: !12, line: 109, type: !40)
!161 = !DILocation(line: 109, column: 16, scope: !158)
!162 = !DILocalVariable(name: "sourceLen", scope: !158, file: !12, line: 109, type: !40)
!163 = !DILocation(line: 109, column: 19, scope: !158)
!164 = !DILocation(line: 110, column: 28, scope: !158)
!165 = !DILocation(line: 110, column: 21, scope: !158)
!166 = !DILocation(line: 110, column: 19, scope: !158)
!167 = !DILocation(line: 113, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !158, file: !12, line: 113, column: 9)
!169 = !DILocation(line: 113, column: 14, scope: !168)
!170 = !DILocation(line: 113, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 113, column: 9)
!172 = !DILocation(line: 113, column: 25, scope: !171)
!173 = !DILocation(line: 113, column: 35, scope: !171)
!174 = !DILocation(line: 113, column: 23, scope: !171)
!175 = !DILocation(line: 113, column: 9, scope: !168)
!176 = !DILocation(line: 115, column: 30, scope: !177)
!177 = distinct !DILexicalBlock(scope: !171, file: !12, line: 114, column: 9)
!178 = !DILocation(line: 115, column: 23, scope: !177)
!179 = !DILocation(line: 115, column: 13, scope: !177)
!180 = !DILocation(line: 115, column: 18, scope: !177)
!181 = !DILocation(line: 115, column: 21, scope: !177)
!182 = !DILocation(line: 116, column: 9, scope: !177)
!183 = !DILocation(line: 113, column: 41, scope: !171)
!184 = !DILocation(line: 113, column: 9, scope: !171)
!185 = distinct !{!185, !175, !186, !71}
!186 = !DILocation(line: 116, column: 9, scope: !168)
!187 = !DILocation(line: 117, column: 19, scope: !158)
!188 = !DILocation(line: 117, column: 9, scope: !158)
!189 = !DILocation(line: 119, column: 1, scope: !144)
