; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %call = call i32 (...) @globalReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !29
  store i8* %2, i8** %data, align 8, !dbg !31
  %3 = load i8*, i8** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !43, metadata !DIExpression()), !dbg !47
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !48
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !49
  store i8 0, i8* %arrayidx1, align 1, !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %4, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !60
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !60
  %7 = load i8*, i8** %data, align 8, !dbg !61
  %8 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !61
  store i8 %6, i8* %arrayidx3, align 1, !dbg !63
  br label %for.inc, !dbg !64

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !65
  %inc = add i64 %9, 1, !dbg !65
  store i64 %inc, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !66, !llvm.loop !67

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !70
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !70
  store i8 0, i8* %arrayidx4, align 1, !dbg !71
  %11 = load i8*, i8** %data, align 8, !dbg !72
  call void @printLine(i8* noundef %11), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11_good() #0 !dbg !75 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11_good(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11_bad(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = alloca i8, i64 50, align 16, !dbg !103
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %1 = alloca i8, i64 100, align 16, !dbg !106
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !105
  %call = call i32 (...) @globalReturnsFalse(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !113
  store i8* %2, i8** %data, align 8, !dbg !115
  %3 = load i8*, i8** %data, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !123
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !124
  store i8 0, i8* %arrayidx1, align 1, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %4, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !135
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !135
  %7 = load i8*, i8** %data, align 8, !dbg !136
  %8 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !136
  store i8 %6, i8* %arrayidx3, align 1, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %9, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !144
  store i8 0, i8* %arrayidx4, align 1, !dbg !145
  %11 = load i8*, i8** %data, align 8, !dbg !146
  call void @printLine(i8* noundef %11), !dbg !147
  ret void, !dbg !148
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = alloca i8, i64 50, align 16, !dbg !154
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !153
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %1 = alloca i8, i64 100, align 16, !dbg !157
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !156
  %call = call i32 (...) @globalReturnsTrue(), !dbg !158
  %tobool = icmp ne i32 %call, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !161
  store i8* %2, i8** %data, align 8, !dbg !163
  %3 = load i8*, i8** %data, align 8, !dbg !164
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !164
  store i8 0, i8* %arrayidx, align 1, !dbg !165
  br label %if.end, !dbg !166

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !167, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !170, metadata !DIExpression()), !dbg !171
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !172
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !172
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !173
  store i8 0, i8* %arrayidx1, align 1, !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !178
  %cmp = icmp ult i64 %4, 100, !dbg !180
  br i1 %cmp, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !184
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !184
  %7 = load i8*, i8** %data, align 8, !dbg !185
  %8 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !185
  store i8 %6, i8* %arrayidx3, align 1, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !189
  %inc = add i64 %9, 1, !dbg !189
  store i64 %inc, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !193
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !193
  store i8 0, i8* %arrayidx4, align 1, !dbg !194
  %11 = load i8*, i8** %data, align 8, !dbg !195
  call void @printLine(i8* noundef %11), !dbg !196
  ret void, !dbg !197
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 28, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!28 = !DILocation(line: 28, column: 8, scope: !13)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 29, column: 5)
!31 = !DILocation(line: 32, column: 14, scope: !30)
!32 = !DILocation(line: 33, column: 9, scope: !30)
!33 = !DILocation(line: 33, column: 17, scope: !30)
!34 = !DILocation(line: 34, column: 5, scope: !30)
!35 = !DILocalVariable(name: "i", scope: !36, file: !14, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 31, baseType: !39)
!38 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !40, line: 94, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 36, column: 16, scope: !36)
!43 = !DILocalVariable(name: "source", scope: !36, file: !14, line: 37, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 37, column: 14, scope: !36)
!48 = !DILocation(line: 38, column: 9, scope: !36)
!49 = !DILocation(line: 39, column: 9, scope: !36)
!50 = !DILocation(line: 39, column: 23, scope: !36)
!51 = !DILocation(line: 41, column: 16, scope: !52)
!52 = distinct !DILexicalBlock(scope: !36, file: !14, line: 41, column: 9)
!53 = !DILocation(line: 41, column: 14, scope: !52)
!54 = !DILocation(line: 41, column: 21, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !14, line: 41, column: 9)
!56 = !DILocation(line: 41, column: 23, scope: !55)
!57 = !DILocation(line: 41, column: 9, scope: !52)
!58 = !DILocation(line: 43, column: 30, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !14, line: 42, column: 9)
!60 = !DILocation(line: 43, column: 23, scope: !59)
!61 = !DILocation(line: 43, column: 13, scope: !59)
!62 = !DILocation(line: 43, column: 18, scope: !59)
!63 = !DILocation(line: 43, column: 21, scope: !59)
!64 = !DILocation(line: 44, column: 9, scope: !59)
!65 = !DILocation(line: 41, column: 31, scope: !55)
!66 = !DILocation(line: 41, column: 9, scope: !55)
!67 = distinct !{!67, !57, !68, !69}
!68 = !DILocation(line: 44, column: 9, scope: !52)
!69 = !{!"llvm.loop.mustprogress"}
!70 = !DILocation(line: 45, column: 9, scope: !36)
!71 = !DILocation(line: 45, column: 21, scope: !36)
!72 = !DILocation(line: 46, column: 19, scope: !36)
!73 = !DILocation(line: 46, column: 9, scope: !36)
!74 = !DILocation(line: 48, column: 1, scope: !13)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_11_good", scope: !14, file: !14, line: 113, type: !15, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!76 = !DILocation(line: 115, column: 5, scope: !75)
!77 = !DILocation(line: 116, column: 5, scope: !75)
!78 = !DILocation(line: 117, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 129, type: !80, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!80 = !DISubroutineType(types: !81)
!81 = !{!82, !82, !83}
!82 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !14, line: 129, type: !82)
!85 = !DILocation(line: 129, column: 14, scope: !79)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !14, line: 129, type: !83)
!87 = !DILocation(line: 129, column: 27, scope: !79)
!88 = !DILocation(line: 132, column: 22, scope: !79)
!89 = !DILocation(line: 132, column: 12, scope: !79)
!90 = !DILocation(line: 132, column: 5, scope: !79)
!91 = !DILocation(line: 134, column: 5, scope: !79)
!92 = !DILocation(line: 135, column: 5, scope: !79)
!93 = !DILocation(line: 136, column: 5, scope: !79)
!94 = !DILocation(line: 139, column: 5, scope: !79)
!95 = !DILocation(line: 140, column: 5, scope: !79)
!96 = !DILocation(line: 141, column: 5, scope: !79)
!97 = !DILocation(line: 143, column: 5, scope: !79)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!99 = !DILocalVariable(name: "data", scope: !98, file: !14, line: 57, type: !3)
!100 = !DILocation(line: 57, column: 12, scope: !98)
!101 = !DILocalVariable(name: "dataBadBuffer", scope: !98, file: !14, line: 58, type: !3)
!102 = !DILocation(line: 58, column: 12, scope: !98)
!103 = !DILocation(line: 58, column: 36, scope: !98)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !98, file: !14, line: 59, type: !3)
!105 = !DILocation(line: 59, column: 12, scope: !98)
!106 = !DILocation(line: 59, column: 37, scope: !98)
!107 = !DILocation(line: 60, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !98, file: !14, line: 60, column: 8)
!109 = !DILocation(line: 60, column: 8, scope: !98)
!110 = !DILocation(line: 63, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !14, line: 61, column: 5)
!112 = !DILocation(line: 64, column: 5, scope: !111)
!113 = !DILocation(line: 68, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !14, line: 66, column: 5)
!115 = !DILocation(line: 68, column: 14, scope: !114)
!116 = !DILocation(line: 69, column: 9, scope: !114)
!117 = !DILocation(line: 69, column: 17, scope: !114)
!118 = !DILocalVariable(name: "i", scope: !119, file: !14, line: 72, type: !37)
!119 = distinct !DILexicalBlock(scope: !98, file: !14, line: 71, column: 5)
!120 = !DILocation(line: 72, column: 16, scope: !119)
!121 = !DILocalVariable(name: "source", scope: !119, file: !14, line: 73, type: !44)
!122 = !DILocation(line: 73, column: 14, scope: !119)
!123 = !DILocation(line: 74, column: 9, scope: !119)
!124 = !DILocation(line: 75, column: 9, scope: !119)
!125 = !DILocation(line: 75, column: 23, scope: !119)
!126 = !DILocation(line: 77, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !119, file: !14, line: 77, column: 9)
!128 = !DILocation(line: 77, column: 14, scope: !127)
!129 = !DILocation(line: 77, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !14, line: 77, column: 9)
!131 = !DILocation(line: 77, column: 23, scope: !130)
!132 = !DILocation(line: 77, column: 9, scope: !127)
!133 = !DILocation(line: 79, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !14, line: 78, column: 9)
!135 = !DILocation(line: 79, column: 23, scope: !134)
!136 = !DILocation(line: 79, column: 13, scope: !134)
!137 = !DILocation(line: 79, column: 18, scope: !134)
!138 = !DILocation(line: 79, column: 21, scope: !134)
!139 = !DILocation(line: 80, column: 9, scope: !134)
!140 = !DILocation(line: 77, column: 31, scope: !130)
!141 = !DILocation(line: 77, column: 9, scope: !130)
!142 = distinct !{!142, !132, !143, !69}
!143 = !DILocation(line: 80, column: 9, scope: !127)
!144 = !DILocation(line: 81, column: 9, scope: !119)
!145 = !DILocation(line: 81, column: 21, scope: !119)
!146 = !DILocation(line: 82, column: 19, scope: !119)
!147 = !DILocation(line: 82, column: 9, scope: !119)
!148 = !DILocation(line: 84, column: 1, scope: !98)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!150 = !DILocalVariable(name: "data", scope: !149, file: !14, line: 89, type: !3)
!151 = !DILocation(line: 89, column: 12, scope: !149)
!152 = !DILocalVariable(name: "dataBadBuffer", scope: !149, file: !14, line: 90, type: !3)
!153 = !DILocation(line: 90, column: 12, scope: !149)
!154 = !DILocation(line: 90, column: 36, scope: !149)
!155 = !DILocalVariable(name: "dataGoodBuffer", scope: !149, file: !14, line: 91, type: !3)
!156 = !DILocation(line: 91, column: 12, scope: !149)
!157 = !DILocation(line: 91, column: 37, scope: !149)
!158 = !DILocation(line: 92, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !149, file: !14, line: 92, column: 8)
!160 = !DILocation(line: 92, column: 8, scope: !149)
!161 = !DILocation(line: 95, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !14, line: 93, column: 5)
!163 = !DILocation(line: 95, column: 14, scope: !162)
!164 = !DILocation(line: 96, column: 9, scope: !162)
!165 = !DILocation(line: 96, column: 17, scope: !162)
!166 = !DILocation(line: 97, column: 5, scope: !162)
!167 = !DILocalVariable(name: "i", scope: !168, file: !14, line: 99, type: !37)
!168 = distinct !DILexicalBlock(scope: !149, file: !14, line: 98, column: 5)
!169 = !DILocation(line: 99, column: 16, scope: !168)
!170 = !DILocalVariable(name: "source", scope: !168, file: !14, line: 100, type: !44)
!171 = !DILocation(line: 100, column: 14, scope: !168)
!172 = !DILocation(line: 101, column: 9, scope: !168)
!173 = !DILocation(line: 102, column: 9, scope: !168)
!174 = !DILocation(line: 102, column: 23, scope: !168)
!175 = !DILocation(line: 104, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !168, file: !14, line: 104, column: 9)
!177 = !DILocation(line: 104, column: 14, scope: !176)
!178 = !DILocation(line: 104, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !14, line: 104, column: 9)
!180 = !DILocation(line: 104, column: 23, scope: !179)
!181 = !DILocation(line: 104, column: 9, scope: !176)
!182 = !DILocation(line: 106, column: 30, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !14, line: 105, column: 9)
!184 = !DILocation(line: 106, column: 23, scope: !183)
!185 = !DILocation(line: 106, column: 13, scope: !183)
!186 = !DILocation(line: 106, column: 18, scope: !183)
!187 = !DILocation(line: 106, column: 21, scope: !183)
!188 = !DILocation(line: 107, column: 9, scope: !183)
!189 = !DILocation(line: 104, column: 31, scope: !179)
!190 = !DILocation(line: 104, column: 9, scope: !179)
!191 = distinct !{!191, !181, !192, !69}
!192 = !DILocation(line: 107, column: 9, scope: !176)
!193 = !DILocation(line: 108, column: 9, scope: !168)
!194 = !DILocation(line: 108, column: 21, scope: !168)
!195 = !DILocation(line: 109, column: 19, scope: !168)
!196 = !DILocation(line: 109, column: 9, scope: !168)
!197 = !DILocation(line: 111, column: 1, scope: !149)
