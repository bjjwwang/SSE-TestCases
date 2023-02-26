; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@__const.goodG2B2.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store i32* null, i32** %data, align 8, !dbg !25
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !26
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %data, align 8, !dbg !30
  %1 = load i32*, i32** %data, align 8, !dbg !31
  %cmp = icmp eq i32* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !42
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03_bad.source to i8*), i64 44, i1 false), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !49, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !51
  %call1 = call i64 @wcslen(i32* noundef %arraydecay), !dbg !52
  store i64 %call1, i64* %sourceLen, align 8, !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !57
  %4 = load i64, i64* %sourceLen, align 8, !dbg !59
  %add = add i64 %4, 1, !dbg !60
  %cmp2 = icmp ult i64 %3, %add, !dbg !61
  br i1 %cmp2, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !65
  %6 = load i32, i32* %arrayidx, align 4, !dbg !65
  %7 = load i32*, i32** %data, align 8, !dbg !66
  %8 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !66
  store i32 %6, i32* %arrayidx3, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %9, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !75
  call void @printWLine(i32* noundef %10), !dbg !76
  %11 = load i32*, i32** %data, align 8, !dbg !77
  %12 = bitcast i32* %11 to i8*, !dbg !77
  call void @free(i8* noundef %12), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare i64 @wcslen(i32* noundef) #5

declare void @printWLine(i32* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* noundef null), !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 noundef %conv), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !105, metadata !DIExpression()), !dbg !106
  store i32* null, i32** %data, align 8, !dbg !107
  %call = call i8* @malloc(i64 noundef 44) #6, !dbg !108
  %0 = bitcast i8* %call to i32*, !dbg !111
  store i32* %0, i32** %data, align 8, !dbg !112
  %1 = load i32*, i32** %data, align 8, !dbg !113
  %cmp = icmp eq i32* %1, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !119, metadata !DIExpression()), !dbg !121
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B1.source to i8*), i64 44, i1 false), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %i, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !126
  %call1 = call i64 @wcslen(i32* noundef %arraydecay), !dbg !127
  store i64 %call1, i64* %sourceLen, align 8, !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !132
  %4 = load i64, i64* %sourceLen, align 8, !dbg !134
  %add = add i64 %4, 1, !dbg !135
  %cmp2 = icmp ult i64 %3, %add, !dbg !136
  br i1 %cmp2, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !140
  %6 = load i32, i32* %arrayidx, align 4, !dbg !140
  %7 = load i32*, i32** %data, align 8, !dbg !141
  %8 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !141
  store i32 %6, i32* %arrayidx3, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %9, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !149
  call void @printWLine(i32* noundef %10), !dbg !150
  %11 = load i32*, i32** %data, align 8, !dbg !151
  %12 = bitcast i32* %11 to i8*, !dbg !151
  call void @free(i8* noundef %12), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !154 {
entry:
  %data = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !155, metadata !DIExpression()), !dbg !156
  store i32* null, i32** %data, align 8, !dbg !157
  %call = call i8* @malloc(i64 noundef 44) #6, !dbg !158
  %0 = bitcast i8* %call to i32*, !dbg !161
  store i32* %0, i32** %data, align 8, !dbg !162
  %1 = load i32*, i32** %data, align 8, !dbg !163
  %cmp = icmp eq i32* %1, null, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !167
  unreachable, !dbg !167

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !169, metadata !DIExpression()), !dbg !171
  %2 = bitcast [11 x i32]* %source to i8*, !dbg !171
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %2, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B2.source to i8*), i64 44, i1 false), !dbg !171
  call void @llvm.dbg.declare(metadata i64* %i, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !174, metadata !DIExpression()), !dbg !175
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !176
  %call1 = call i64 @wcslen(i32* noundef %arraydecay), !dbg !177
  store i64 %call1, i64* %sourceLen, align 8, !dbg !178
  store i64 0, i64* %i, align 8, !dbg !179
  br label %for.cond, !dbg !181

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i64, i64* %i, align 8, !dbg !182
  %4 = load i64, i64* %sourceLen, align 8, !dbg !184
  %add = add i64 %4, 1, !dbg !185
  %cmp2 = icmp ult i64 %3, %add, !dbg !186
  br i1 %cmp2, label %for.body, label %for.end, !dbg !187

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %5, !dbg !190
  %6 = load i32, i32* %arrayidx, align 4, !dbg !190
  %7 = load i32*, i32** %data, align 8, !dbg !191
  %8 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !191
  store i32 %6, i32* %arrayidx3, align 4, !dbg !193
  br label %for.inc, !dbg !194

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !195
  %inc = add i64 %9, 1, !dbg !195
  store i64 %inc, i64* %i, align 8, !dbg !195
  br label %for.cond, !dbg !196, !llvm.loop !197

for.end:                                          ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !199
  call void @printWLine(i32* noundef %10), !dbg !200
  %11 = load i32*, i32** %data, align 8, !dbg !201
  %12 = bitcast i32* %11 to i8*, !dbg !201
  call void @free(i8* noundef %12), !dbg !202
  ret void, !dbg !203
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9, !10}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03_bad", scope: !19, file: !19, line: 28, type: !20, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 30, type: !3)
!24 = !DILocation(line: 30, column: 15, scope: !18)
!25 = !DILocation(line: 31, column: 10, scope: !18)
!26 = !DILocation(line: 35, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !19, line: 33, column: 5)
!28 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 8)
!29 = !DILocation(line: 35, column: 16, scope: !27)
!30 = !DILocation(line: 35, column: 14, scope: !27)
!31 = !DILocation(line: 36, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !19, line: 36, column: 13)
!33 = !DILocation(line: 36, column: 18, scope: !32)
!34 = !DILocation(line: 36, column: 13, scope: !27)
!35 = !DILocation(line: 36, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 36, column: 27)
!37 = !DILocalVariable(name: "source", scope: !38, file: !19, line: 39, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 38, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DILocation(line: 39, column: 17, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !38, file: !19, line: 40, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !47)
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 40, column: 16, scope: !38)
!49 = !DILocalVariable(name: "sourceLen", scope: !38, file: !19, line: 40, type: !44)
!50 = !DILocation(line: 40, column: 19, scope: !38)
!51 = !DILocation(line: 41, column: 28, scope: !38)
!52 = !DILocation(line: 41, column: 21, scope: !38)
!53 = !DILocation(line: 41, column: 19, scope: !38)
!54 = !DILocation(line: 44, column: 16, scope: !55)
!55 = distinct !DILexicalBlock(scope: !38, file: !19, line: 44, column: 9)
!56 = !DILocation(line: 44, column: 14, scope: !55)
!57 = !DILocation(line: 44, column: 21, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !19, line: 44, column: 9)
!59 = !DILocation(line: 44, column: 25, scope: !58)
!60 = !DILocation(line: 44, column: 35, scope: !58)
!61 = !DILocation(line: 44, column: 23, scope: !58)
!62 = !DILocation(line: 44, column: 9, scope: !55)
!63 = !DILocation(line: 46, column: 30, scope: !64)
!64 = distinct !DILexicalBlock(scope: !58, file: !19, line: 45, column: 9)
!65 = !DILocation(line: 46, column: 23, scope: !64)
!66 = !DILocation(line: 46, column: 13, scope: !64)
!67 = !DILocation(line: 46, column: 18, scope: !64)
!68 = !DILocation(line: 46, column: 21, scope: !64)
!69 = !DILocation(line: 47, column: 9, scope: !64)
!70 = !DILocation(line: 44, column: 41, scope: !58)
!71 = !DILocation(line: 44, column: 9, scope: !58)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 47, column: 9, scope: !55)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 48, column: 20, scope: !38)
!76 = !DILocation(line: 48, column: 9, scope: !38)
!77 = !DILocation(line: 49, column: 14, scope: !38)
!78 = !DILocation(line: 49, column: 9, scope: !38)
!79 = !DILocation(line: 51, column: 1, scope: !18)
!80 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_wchar_t_loop_03_good", scope: !19, file: !19, line: 114, type: !20, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!81 = !DILocation(line: 116, column: 5, scope: !80)
!82 = !DILocation(line: 117, column: 5, scope: !80)
!83 = !DILocation(line: 118, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 130, type: !85, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!85 = !DISubroutineType(types: !86)
!86 = !{!8, !8, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !19, line: 130, type: !8)
!91 = !DILocation(line: 130, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !19, line: 130, type: !87)
!93 = !DILocation(line: 130, column: 27, scope: !84)
!94 = !DILocation(line: 133, column: 22, scope: !84)
!95 = !DILocation(line: 133, column: 12, scope: !84)
!96 = !DILocation(line: 133, column: 5, scope: !84)
!97 = !DILocation(line: 135, column: 5, scope: !84)
!98 = !DILocation(line: 136, column: 5, scope: !84)
!99 = !DILocation(line: 137, column: 5, scope: !84)
!100 = !DILocation(line: 140, column: 5, scope: !84)
!101 = !DILocation(line: 141, column: 5, scope: !84)
!102 = !DILocation(line: 142, column: 5, scope: !84)
!103 = !DILocation(line: 144, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!105 = !DILocalVariable(name: "data", scope: !104, file: !19, line: 60, type: !3)
!106 = !DILocation(line: 60, column: 15, scope: !104)
!107 = !DILocation(line: 61, column: 10, scope: !104)
!108 = !DILocation(line: 70, column: 27, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !19, line: 68, column: 5)
!110 = distinct !DILexicalBlock(scope: !104, file: !19, line: 62, column: 8)
!111 = !DILocation(line: 70, column: 16, scope: !109)
!112 = !DILocation(line: 70, column: 14, scope: !109)
!113 = !DILocation(line: 71, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !109, file: !19, line: 71, column: 13)
!115 = !DILocation(line: 71, column: 18, scope: !114)
!116 = !DILocation(line: 71, column: 13, scope: !109)
!117 = !DILocation(line: 71, column: 28, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !19, line: 71, column: 27)
!119 = !DILocalVariable(name: "source", scope: !120, file: !19, line: 74, type: !39)
!120 = distinct !DILexicalBlock(scope: !104, file: !19, line: 73, column: 5)
!121 = !DILocation(line: 74, column: 17, scope: !120)
!122 = !DILocalVariable(name: "i", scope: !120, file: !19, line: 75, type: !44)
!123 = !DILocation(line: 75, column: 16, scope: !120)
!124 = !DILocalVariable(name: "sourceLen", scope: !120, file: !19, line: 75, type: !44)
!125 = !DILocation(line: 75, column: 19, scope: !120)
!126 = !DILocation(line: 76, column: 28, scope: !120)
!127 = !DILocation(line: 76, column: 21, scope: !120)
!128 = !DILocation(line: 76, column: 19, scope: !120)
!129 = !DILocation(line: 79, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !120, file: !19, line: 79, column: 9)
!131 = !DILocation(line: 79, column: 14, scope: !130)
!132 = !DILocation(line: 79, column: 21, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !19, line: 79, column: 9)
!134 = !DILocation(line: 79, column: 25, scope: !133)
!135 = !DILocation(line: 79, column: 35, scope: !133)
!136 = !DILocation(line: 79, column: 23, scope: !133)
!137 = !DILocation(line: 79, column: 9, scope: !130)
!138 = !DILocation(line: 81, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !19, line: 80, column: 9)
!140 = !DILocation(line: 81, column: 23, scope: !139)
!141 = !DILocation(line: 81, column: 13, scope: !139)
!142 = !DILocation(line: 81, column: 18, scope: !139)
!143 = !DILocation(line: 81, column: 21, scope: !139)
!144 = !DILocation(line: 82, column: 9, scope: !139)
!145 = !DILocation(line: 79, column: 41, scope: !133)
!146 = !DILocation(line: 79, column: 9, scope: !133)
!147 = distinct !{!147, !137, !148, !74}
!148 = !DILocation(line: 82, column: 9, scope: !130)
!149 = !DILocation(line: 83, column: 20, scope: !120)
!150 = !DILocation(line: 83, column: 9, scope: !120)
!151 = !DILocation(line: 84, column: 14, scope: !120)
!152 = !DILocation(line: 84, column: 9, scope: !120)
!153 = !DILocation(line: 86, column: 1, scope: !104)
!154 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 89, type: !20, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!155 = !DILocalVariable(name: "data", scope: !154, file: !19, line: 91, type: !3)
!156 = !DILocation(line: 91, column: 15, scope: !154)
!157 = !DILocation(line: 92, column: 10, scope: !154)
!158 = !DILocation(line: 96, column: 27, scope: !159)
!159 = distinct !DILexicalBlock(scope: !160, file: !19, line: 94, column: 5)
!160 = distinct !DILexicalBlock(scope: !154, file: !19, line: 93, column: 8)
!161 = !DILocation(line: 96, column: 16, scope: !159)
!162 = !DILocation(line: 96, column: 14, scope: !159)
!163 = !DILocation(line: 97, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !19, line: 97, column: 13)
!165 = !DILocation(line: 97, column: 18, scope: !164)
!166 = !DILocation(line: 97, column: 13, scope: !159)
!167 = !DILocation(line: 97, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !19, line: 97, column: 27)
!169 = !DILocalVariable(name: "source", scope: !170, file: !19, line: 100, type: !39)
!170 = distinct !DILexicalBlock(scope: !154, file: !19, line: 99, column: 5)
!171 = !DILocation(line: 100, column: 17, scope: !170)
!172 = !DILocalVariable(name: "i", scope: !170, file: !19, line: 101, type: !44)
!173 = !DILocation(line: 101, column: 16, scope: !170)
!174 = !DILocalVariable(name: "sourceLen", scope: !170, file: !19, line: 101, type: !44)
!175 = !DILocation(line: 101, column: 19, scope: !170)
!176 = !DILocation(line: 102, column: 28, scope: !170)
!177 = !DILocation(line: 102, column: 21, scope: !170)
!178 = !DILocation(line: 102, column: 19, scope: !170)
!179 = !DILocation(line: 105, column: 16, scope: !180)
!180 = distinct !DILexicalBlock(scope: !170, file: !19, line: 105, column: 9)
!181 = !DILocation(line: 105, column: 14, scope: !180)
!182 = !DILocation(line: 105, column: 21, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !19, line: 105, column: 9)
!184 = !DILocation(line: 105, column: 25, scope: !183)
!185 = !DILocation(line: 105, column: 35, scope: !183)
!186 = !DILocation(line: 105, column: 23, scope: !183)
!187 = !DILocation(line: 105, column: 9, scope: !180)
!188 = !DILocation(line: 107, column: 30, scope: !189)
!189 = distinct !DILexicalBlock(scope: !183, file: !19, line: 106, column: 9)
!190 = !DILocation(line: 107, column: 23, scope: !189)
!191 = !DILocation(line: 107, column: 13, scope: !189)
!192 = !DILocation(line: 107, column: 18, scope: !189)
!193 = !DILocation(line: 107, column: 21, scope: !189)
!194 = !DILocation(line: 108, column: 9, scope: !189)
!195 = !DILocation(line: 105, column: 41, scope: !183)
!196 = !DILocation(line: 105, column: 9, scope: !183)
!197 = distinct !{!197, !187, !198, !74}
!198 = !DILocation(line: 108, column: 9, scope: !180)
!199 = !DILocation(line: 109, column: 20, scope: !170)
!200 = !DILocation(line: 109, column: 9, scope: !170)
!201 = !DILocation(line: 110, column: 14, scope: !170)
!202 = !DILocation(line: 110, column: 9, scope: !170)
!203 = !DILocation(line: 112, column: 1, scope: !154)
