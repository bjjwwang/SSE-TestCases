; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11_bad() #0 !dbg !11 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !33
  store i8* %arraydecay, i8** %data, align 8, !dbg !35
  %0 = load i8*, i8** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !36
  store i8 0, i8* %arrayidx, align 1, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !41
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !51
  %call2 = call i64 @strlen(i8* noundef %arraydecay1), !dbg !52
  store i64 %call2, i64* %sourceLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !57
  %3 = load i64, i64* %sourceLen, align 8, !dbg !59
  %add = add i64 %3, 1, !dbg !60
  %cmp = icmp ult i64 %2, %add, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !65
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !65
  %6 = load i8*, i8** %data, align 8, !dbg !66
  %7 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !66
  store i8 %5, i8* %arrayidx4, align 1, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %8, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !75
  call void @printLine(i8* noundef %9), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* noundef null), !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 noundef %conv), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11_good(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11_bad(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %call = call i32 (...) @globalReturnsFalse(), !dbg !108
  %tobool = icmp ne i32 %call, 0, !dbg !108
  br i1 %tobool, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  store i8* %arraydecay, i8** %data, align 8, !dbg !116
  %0 = load i8*, i8** %data, align 8, !dbg !117
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !126
  %call2 = call i64 @strlen(i8* noundef %arraydecay1), !dbg !127
  store i64 %call2, i64* %sourceLen, align 8, !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !132
  %3 = load i64, i64* %sourceLen, align 8, !dbg !134
  %add = add i64 %3, 1, !dbg !135
  %cmp = icmp ult i64 %2, %add, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !140
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !140
  %6 = load i8*, i8** %data, align 8, !dbg !141
  %7 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !141
  store i8 %5, i8* %arrayidx4, align 1, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %8, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !149
  call void @printLine(i8* noundef %9), !dbg !150
  ret void, !dbg !151
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !152 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !153, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  %call = call i32 (...) @globalReturnsTrue(), !dbg !159
  %tobool = icmp ne i32 %call, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !162
  store i8* %arraydecay, i8** %data, align 8, !dbg !164
  %0 = load i8*, i8** %data, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i8, i8* %0, i64 0, !dbg !165
  store i8 0, i8* %arrayidx, align 1, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !170
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !173, metadata !DIExpression()), !dbg !174
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !175
  %call2 = call i64 @strlen(i8* noundef %arraydecay1), !dbg !176
  store i64 %call2, i64* %sourceLen, align 8, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !181
  %3 = load i64, i64* %sourceLen, align 8, !dbg !183
  %add = add i64 %3, 1, !dbg !184
  %cmp = icmp ult i64 %2, %add, !dbg !185
  br i1 %cmp, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %4, !dbg !189
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !189
  %6 = load i8*, i8** %data, align 8, !dbg !190
  %7 = load i64, i64* %i, align 8, !dbg !191
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %7, !dbg !190
  store i8 %5, i8* %arrayidx4, align 1, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %8, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %9 = load i8*, i8** %data, align 8, !dbg !198
  call void @printLine(i8* noundef %9), !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!30 = !DILocation(line: 33, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 8)
!32 = !DILocation(line: 33, column: 8, scope: !11)
!33 = !DILocation(line: 37, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 34, column: 5)
!35 = !DILocation(line: 37, column: 14, scope: !34)
!36 = !DILocation(line: 38, column: 9, scope: !34)
!37 = !DILocation(line: 38, column: 17, scope: !34)
!38 = !DILocation(line: 39, column: 5, scope: !34)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 41, type: !26)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!41 = !DILocation(line: 41, column: 14, scope: !40)
!42 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 42, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !46, line: 94, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 42, column: 16, scope: !40)
!49 = !DILocalVariable(name: "sourceLen", scope: !40, file: !12, line: 42, type: !43)
!50 = !DILocation(line: 42, column: 19, scope: !40)
!51 = !DILocation(line: 43, column: 28, scope: !40)
!52 = !DILocation(line: 43, column: 21, scope: !40)
!53 = !DILocation(line: 43, column: 19, scope: !40)
!54 = !DILocation(line: 46, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !40, file: !12, line: 46, column: 9)
!56 = !DILocation(line: 46, column: 14, scope: !55)
!57 = !DILocation(line: 46, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 46, column: 9)
!59 = !DILocation(line: 46, column: 25, scope: !58)
!60 = !DILocation(line: 46, column: 35, scope: !58)
!61 = !DILocation(line: 46, column: 23, scope: !58)
!62 = !DILocation(line: 46, column: 9, scope: !55)
!63 = !DILocation(line: 48, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !12, line: 47, column: 9)
!65 = !DILocation(line: 48, column: 23, scope: !64)
!66 = !DILocation(line: 48, column: 13, scope: !64)
!67 = !DILocation(line: 48, column: 18, scope: !64)
!68 = !DILocation(line: 48, column: 21, scope: !64)
!69 = !DILocation(line: 49, column: 9, scope: !64)
!70 = !DILocation(line: 46, column: 41, scope: !58)
!71 = !DILocation(line: 46, column: 9, scope: !58)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 49, column: 9, scope: !55)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 50, column: 19, scope: !40)
!76 = !DILocation(line: 50, column: 9, scope: !40)
!77 = !DILocation(line: 52, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_11_good", scope: !12, file: !12, line: 117, type: !13, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!79 = !DILocation(line: 119, column: 5, scope: !78)
!80 = !DILocation(line: 120, column: 5, scope: !78)
!81 = !DILocation(line: 121, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 133, type: !83, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!83 = !DISubroutineType(types: !84)
!84 = !{!85, !85, !86}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !12, line: 133, type: !85)
!88 = !DILocation(line: 133, column: 14, scope: !82)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !12, line: 133, type: !86)
!90 = !DILocation(line: 133, column: 27, scope: !82)
!91 = !DILocation(line: 136, column: 22, scope: !82)
!92 = !DILocation(line: 136, column: 12, scope: !82)
!93 = !DILocation(line: 136, column: 5, scope: !82)
!94 = !DILocation(line: 138, column: 5, scope: !82)
!95 = !DILocation(line: 139, column: 5, scope: !82)
!96 = !DILocation(line: 140, column: 5, scope: !82)
!97 = !DILocation(line: 143, column: 5, scope: !82)
!98 = !DILocation(line: 144, column: 5, scope: !82)
!99 = !DILocation(line: 145, column: 5, scope: !82)
!100 = !DILocation(line: 147, column: 5, scope: !82)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 61, type: !17)
!103 = !DILocation(line: 61, column: 12, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 62, type: !21)
!105 = !DILocation(line: 62, column: 10, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 63, type: !26)
!107 = !DILocation(line: 63, column: 10, scope: !101)
!108 = !DILocation(line: 64, column: 8, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !12, line: 64, column: 8)
!110 = !DILocation(line: 64, column: 8, scope: !101)
!111 = !DILocation(line: 67, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 65, column: 5)
!113 = !DILocation(line: 68, column: 5, scope: !112)
!114 = !DILocation(line: 73, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !12, line: 70, column: 5)
!116 = !DILocation(line: 73, column: 14, scope: !115)
!117 = !DILocation(line: 74, column: 9, scope: !115)
!118 = !DILocation(line: 74, column: 17, scope: !115)
!119 = !DILocalVariable(name: "source", scope: !120, file: !12, line: 77, type: !26)
!120 = distinct !DILexicalBlock(scope: !101, file: !12, line: 76, column: 5)
!121 = !DILocation(line: 77, column: 14, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 78, type: !43)
!123 = !DILocation(line: 78, column: 16, scope: !120)
!124 = !DILocalVariable(name: "sourceLen", scope: !120, file: !12, line: 78, type: !43)
!125 = !DILocation(line: 78, column: 19, scope: !120)
!126 = !DILocation(line: 79, column: 28, scope: !120)
!127 = !DILocation(line: 79, column: 21, scope: !120)
!128 = !DILocation(line: 79, column: 19, scope: !120)
!129 = !DILocation(line: 82, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !120, file: !12, line: 82, column: 9)
!131 = !DILocation(line: 82, column: 14, scope: !130)
!132 = !DILocation(line: 82, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !12, line: 82, column: 9)
!134 = !DILocation(line: 82, column: 25, scope: !133)
!135 = !DILocation(line: 82, column: 35, scope: !133)
!136 = !DILocation(line: 82, column: 23, scope: !133)
!137 = !DILocation(line: 82, column: 9, scope: !130)
!138 = !DILocation(line: 84, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !12, line: 83, column: 9)
!140 = !DILocation(line: 84, column: 23, scope: !139)
!141 = !DILocation(line: 84, column: 13, scope: !139)
!142 = !DILocation(line: 84, column: 18, scope: !139)
!143 = !DILocation(line: 84, column: 21, scope: !139)
!144 = !DILocation(line: 85, column: 9, scope: !139)
!145 = !DILocation(line: 82, column: 41, scope: !133)
!146 = !DILocation(line: 82, column: 9, scope: !133)
!147 = distinct !{!147, !137, !148, !74}
!148 = !DILocation(line: 85, column: 9, scope: !130)
!149 = !DILocation(line: 86, column: 19, scope: !120)
!150 = !DILocation(line: 86, column: 9, scope: !120)
!151 = !DILocation(line: 88, column: 1, scope: !101)
!152 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!153 = !DILocalVariable(name: "data", scope: !152, file: !12, line: 93, type: !17)
!154 = !DILocation(line: 93, column: 12, scope: !152)
!155 = !DILocalVariable(name: "dataBadBuffer", scope: !152, file: !12, line: 94, type: !21)
!156 = !DILocation(line: 94, column: 10, scope: !152)
!157 = !DILocalVariable(name: "dataGoodBuffer", scope: !152, file: !12, line: 95, type: !26)
!158 = !DILocation(line: 95, column: 10, scope: !152)
!159 = !DILocation(line: 96, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !152, file: !12, line: 96, column: 8)
!161 = !DILocation(line: 96, column: 8, scope: !152)
!162 = !DILocation(line: 100, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !12, line: 97, column: 5)
!164 = !DILocation(line: 100, column: 14, scope: !163)
!165 = !DILocation(line: 101, column: 9, scope: !163)
!166 = !DILocation(line: 101, column: 17, scope: !163)
!167 = !DILocation(line: 102, column: 5, scope: !163)
!168 = !DILocalVariable(name: "source", scope: !169, file: !12, line: 104, type: !26)
!169 = distinct !DILexicalBlock(scope: !152, file: !12, line: 103, column: 5)
!170 = !DILocation(line: 104, column: 14, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !169, file: !12, line: 105, type: !43)
!172 = !DILocation(line: 105, column: 16, scope: !169)
!173 = !DILocalVariable(name: "sourceLen", scope: !169, file: !12, line: 105, type: !43)
!174 = !DILocation(line: 105, column: 19, scope: !169)
!175 = !DILocation(line: 106, column: 28, scope: !169)
!176 = !DILocation(line: 106, column: 21, scope: !169)
!177 = !DILocation(line: 106, column: 19, scope: !169)
!178 = !DILocation(line: 109, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !169, file: !12, line: 109, column: 9)
!180 = !DILocation(line: 109, column: 14, scope: !179)
!181 = !DILocation(line: 109, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !12, line: 109, column: 9)
!183 = !DILocation(line: 109, column: 25, scope: !182)
!184 = !DILocation(line: 109, column: 35, scope: !182)
!185 = !DILocation(line: 109, column: 23, scope: !182)
!186 = !DILocation(line: 109, column: 9, scope: !179)
!187 = !DILocation(line: 111, column: 30, scope: !188)
!188 = distinct !DILexicalBlock(scope: !182, file: !12, line: 110, column: 9)
!189 = !DILocation(line: 111, column: 23, scope: !188)
!190 = !DILocation(line: 111, column: 13, scope: !188)
!191 = !DILocation(line: 111, column: 18, scope: !188)
!192 = !DILocation(line: 111, column: 21, scope: !188)
!193 = !DILocation(line: 112, column: 9, scope: !188)
!194 = !DILocation(line: 109, column: 41, scope: !182)
!195 = !DILocation(line: 109, column: 9, scope: !182)
!196 = distinct !{!196, !186, !197, !74}
!197 = !DILocation(line: 112, column: 9, scope: !179)
!198 = !DILocation(line: 113, column: 19, scope: !169)
!199 = !DILocation(line: 113, column: 9, scope: !169)
!200 = !DILocation(line: 115, column: 1, scope: !152)
