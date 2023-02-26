; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06_bad() #0 !dbg !18 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !23, metadata !DIExpression()), !dbg !24
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !25
  %0 = bitcast i8* %call to i32*, !dbg !26
  store i32* %0, i32** %data, align 8, !dbg !27
  %1 = load i32*, i32** %data, align 8, !dbg !28
  %cmp = icmp eq i32* %1, null, !dbg !30
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !32
  unreachable, !dbg !32

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !34
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !40, metadata !DIExpression()), !dbg !45
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !52, metadata !DIExpression()), !dbg !53
  %5 = load i32*, i32** %data, align 8, !dbg !54
  %call2 = call i64 @wcslen(i32* noundef %5), !dbg !55
  store i64 %call2, i64* %dataLen, align 8, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !60
  %7 = load i64, i64* %dataLen, align 8, !dbg !62
  %cmp3 = icmp ult i64 %6, %7, !dbg !63
  br i1 %cmp3, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !65
  %9 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !65
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !65
  %11 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !69
  store i32 %10, i32* %arrayidx5, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %12, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !77
  store i32 0, i32* %arrayidx6, align 4, !dbg !78
  %13 = load i32*, i32** %data, align 8, !dbg !79
  call void @printWLine(i32* noundef %13), !dbg !80
  %14 = load i32*, i32** %data, align 8, !dbg !81
  %15 = bitcast i32* %14 to i8*, !dbg !81
  call void @free(i8* noundef %15), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06_good() #0 !dbg !84 {
entry:
  call void @goodG2B1(), !dbg !85
  call void @goodG2B2(), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !88 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !94, metadata !DIExpression()), !dbg !95
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !96, metadata !DIExpression()), !dbg !97
  %call = call i64 @time(i64* noundef null), !dbg !98
  %conv = trunc i64 %call to i32, !dbg !99
  call void @srand(i32 noundef %conv), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !101
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06_good(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06_bad(), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !106
  ret i32 0, !dbg !107
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !111
  %0 = bitcast i8* %call to i32*, !dbg !112
  store i32* %0, i32** %data, align 8, !dbg !113
  %1 = load i32*, i32** %data, align 8, !dbg !114
  %cmp = icmp eq i32* %1, null, !dbg !116
  br i1 %cmp, label %if.then, label %if.end, !dbg !117

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !118
  unreachable, !dbg !118

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !120
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !123
  %3 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !126, metadata !DIExpression()), !dbg !128
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !128
  call void @llvm.dbg.declare(metadata i64* %i, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !131, metadata !DIExpression()), !dbg !132
  %5 = load i32*, i32** %data, align 8, !dbg !133
  %call2 = call i64 @wcslen(i32* noundef %5), !dbg !134
  store i64 %call2, i64* %dataLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !139
  %7 = load i64, i64* %dataLen, align 8, !dbg !141
  %cmp3 = icmp ult i64 %6, %7, !dbg !142
  br i1 %cmp3, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !144
  %9 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !144
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !144
  %11 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !148
  store i32 %10, i32* %arrayidx5, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %12, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !155
  store i32 0, i32* %arrayidx6, align 4, !dbg !156
  %13 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* noundef %13), !dbg !158
  %14 = load i32*, i32** %data, align 8, !dbg !159
  %15 = bitcast i32* %14 to i8*, !dbg !159
  call void @free(i8* noundef %15), !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !162 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !163, metadata !DIExpression()), !dbg !164
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !165
  %0 = bitcast i8* %call to i32*, !dbg !166
  store i32* %0, i32** %data, align 8, !dbg !167
  %1 = load i32*, i32** %data, align 8, !dbg !168
  %cmp = icmp eq i32* %1, null, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !172
  unreachable, !dbg !172

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %data, align 8, !dbg !174
  %call1 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !177
  %3 = load i32*, i32** %data, align 8, !dbg !178
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !178
  store i32 0, i32* %arrayidx, align 4, !dbg !179
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !180, metadata !DIExpression()), !dbg !182
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !182
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %i, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !185, metadata !DIExpression()), !dbg !186
  %5 = load i32*, i32** %data, align 8, !dbg !187
  %call2 = call i64 @wcslen(i32* noundef %5), !dbg !188
  store i64 %call2, i64* %dataLen, align 8, !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !193
  %7 = load i64, i64* %dataLen, align 8, !dbg !195
  %cmp3 = icmp ult i64 %6, %7, !dbg !196
  br i1 %cmp3, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !198
  %9 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !198
  %10 = load i32, i32* %arrayidx4, align 4, !dbg !198
  %11 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !202
  store i32 %10, i32* %arrayidx5, align 4, !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !205
  %inc = add i64 %12, 1, !dbg !205
  store i64 %inc, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !209
  store i32 0, i32* %arrayidx6, align 4, !dbg !210
  %13 = load i32*, i32** %data, align 8, !dbg !211
  call void @printWLine(i32* noundef %13), !dbg !212
  %14 = load i32*, i32** %data, align 8, !dbg !213
  %15 = bitcast i32* %14 to i8*, !dbg !213
  call void @free(i8* noundef %15), !dbg !214
  ret void, !dbg !215
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06_bad", scope: !19, file: !19, line: 27, type: !20, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 29, type: !3)
!24 = !DILocation(line: 29, column: 15, scope: !18)
!25 = !DILocation(line: 30, column: 23, scope: !18)
!26 = !DILocation(line: 30, column: 12, scope: !18)
!27 = !DILocation(line: 30, column: 10, scope: !18)
!28 = !DILocation(line: 31, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 31, column: 9)
!30 = !DILocation(line: 31, column: 14, scope: !29)
!31 = !DILocation(line: 31, column: 9, scope: !18)
!32 = !DILocation(line: 31, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 31, column: 23)
!34 = !DILocation(line: 35, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !19, line: 33, column: 5)
!36 = distinct !DILexicalBlock(scope: !18, file: !19, line: 32, column: 8)
!37 = !DILocation(line: 35, column: 9, scope: !35)
!38 = !DILocation(line: 36, column: 9, scope: !35)
!39 = !DILocation(line: 36, column: 21, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !19, line: 39, type: !42)
!41 = distinct !DILexicalBlock(scope: !18, file: !19, line: 38, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 50)
!45 = !DILocation(line: 39, column: 17, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !19, line: 40, type: !47)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !50)
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 40, column: 16, scope: !41)
!52 = !DILocalVariable(name: "dataLen", scope: !41, file: !19, line: 40, type: !47)
!53 = !DILocation(line: 40, column: 19, scope: !41)
!54 = !DILocation(line: 41, column: 26, scope: !41)
!55 = !DILocation(line: 41, column: 19, scope: !41)
!56 = !DILocation(line: 41, column: 17, scope: !41)
!57 = !DILocation(line: 43, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !41, file: !19, line: 43, column: 9)
!59 = !DILocation(line: 43, column: 14, scope: !58)
!60 = !DILocation(line: 43, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !19, line: 43, column: 9)
!62 = !DILocation(line: 43, column: 25, scope: !61)
!63 = !DILocation(line: 43, column: 23, scope: !61)
!64 = !DILocation(line: 43, column: 9, scope: !58)
!65 = !DILocation(line: 45, column: 23, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !19, line: 44, column: 9)
!67 = !DILocation(line: 45, column: 28, scope: !66)
!68 = !DILocation(line: 45, column: 18, scope: !66)
!69 = !DILocation(line: 45, column: 13, scope: !66)
!70 = !DILocation(line: 45, column: 21, scope: !66)
!71 = !DILocation(line: 46, column: 9, scope: !66)
!72 = !DILocation(line: 43, column: 35, scope: !61)
!73 = !DILocation(line: 43, column: 9, scope: !61)
!74 = distinct !{!74, !64, !75, !76}
!75 = !DILocation(line: 46, column: 9, scope: !58)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 47, column: 9, scope: !41)
!78 = !DILocation(line: 47, column: 20, scope: !41)
!79 = !DILocation(line: 48, column: 20, scope: !41)
!80 = !DILocation(line: 48, column: 9, scope: !41)
!81 = !DILocation(line: 49, column: 14, scope: !41)
!82 = !DILocation(line: 49, column: 9, scope: !41)
!83 = !DILocation(line: 51, column: 1, scope: !18)
!84 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_06_good", scope: !19, file: !19, line: 116, type: !20, scopeLine: 117, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!85 = !DILocation(line: 118, column: 5, scope: !84)
!86 = !DILocation(line: 119, column: 5, scope: !84)
!87 = !DILocation(line: 120, column: 1, scope: !84)
!88 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 132, type: !89, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!89 = !DISubroutineType(types: !90)
!90 = !{!8, !8, !91}
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DILocalVariable(name: "argc", arg: 1, scope: !88, file: !19, line: 132, type: !8)
!95 = !DILocation(line: 132, column: 14, scope: !88)
!96 = !DILocalVariable(name: "argv", arg: 2, scope: !88, file: !19, line: 132, type: !91)
!97 = !DILocation(line: 132, column: 27, scope: !88)
!98 = !DILocation(line: 135, column: 22, scope: !88)
!99 = !DILocation(line: 135, column: 12, scope: !88)
!100 = !DILocation(line: 135, column: 5, scope: !88)
!101 = !DILocation(line: 137, column: 5, scope: !88)
!102 = !DILocation(line: 138, column: 5, scope: !88)
!103 = !DILocation(line: 139, column: 5, scope: !88)
!104 = !DILocation(line: 142, column: 5, scope: !88)
!105 = !DILocation(line: 143, column: 5, scope: !88)
!106 = !DILocation(line: 144, column: 5, scope: !88)
!107 = !DILocation(line: 146, column: 5, scope: !88)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 58, type: !20, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!109 = !DILocalVariable(name: "data", scope: !108, file: !19, line: 60, type: !3)
!110 = !DILocation(line: 60, column: 15, scope: !108)
!111 = !DILocation(line: 61, column: 23, scope: !108)
!112 = !DILocation(line: 61, column: 12, scope: !108)
!113 = !DILocation(line: 61, column: 10, scope: !108)
!114 = !DILocation(line: 62, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !19, line: 62, column: 9)
!116 = !DILocation(line: 62, column: 14, scope: !115)
!117 = !DILocation(line: 62, column: 9, scope: !108)
!118 = !DILocation(line: 62, column: 24, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !19, line: 62, column: 23)
!120 = !DILocation(line: 71, column: 17, scope: !121)
!121 = distinct !DILexicalBlock(scope: !122, file: !19, line: 69, column: 5)
!122 = distinct !DILexicalBlock(scope: !108, file: !19, line: 63, column: 8)
!123 = !DILocation(line: 71, column: 9, scope: !121)
!124 = !DILocation(line: 72, column: 9, scope: !121)
!125 = !DILocation(line: 72, column: 20, scope: !121)
!126 = !DILocalVariable(name: "dest", scope: !127, file: !19, line: 75, type: !42)
!127 = distinct !DILexicalBlock(scope: !108, file: !19, line: 74, column: 5)
!128 = !DILocation(line: 75, column: 17, scope: !127)
!129 = !DILocalVariable(name: "i", scope: !127, file: !19, line: 76, type: !47)
!130 = !DILocation(line: 76, column: 16, scope: !127)
!131 = !DILocalVariable(name: "dataLen", scope: !127, file: !19, line: 76, type: !47)
!132 = !DILocation(line: 76, column: 19, scope: !127)
!133 = !DILocation(line: 77, column: 26, scope: !127)
!134 = !DILocation(line: 77, column: 19, scope: !127)
!135 = !DILocation(line: 77, column: 17, scope: !127)
!136 = !DILocation(line: 79, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !127, file: !19, line: 79, column: 9)
!138 = !DILocation(line: 79, column: 14, scope: !137)
!139 = !DILocation(line: 79, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !19, line: 79, column: 9)
!141 = !DILocation(line: 79, column: 25, scope: !140)
!142 = !DILocation(line: 79, column: 23, scope: !140)
!143 = !DILocation(line: 79, column: 9, scope: !137)
!144 = !DILocation(line: 81, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !19, line: 80, column: 9)
!146 = !DILocation(line: 81, column: 28, scope: !145)
!147 = !DILocation(line: 81, column: 18, scope: !145)
!148 = !DILocation(line: 81, column: 13, scope: !145)
!149 = !DILocation(line: 81, column: 21, scope: !145)
!150 = !DILocation(line: 82, column: 9, scope: !145)
!151 = !DILocation(line: 79, column: 35, scope: !140)
!152 = !DILocation(line: 79, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !76}
!154 = !DILocation(line: 82, column: 9, scope: !137)
!155 = !DILocation(line: 83, column: 9, scope: !127)
!156 = !DILocation(line: 83, column: 20, scope: !127)
!157 = !DILocation(line: 84, column: 20, scope: !127)
!158 = !DILocation(line: 84, column: 9, scope: !127)
!159 = !DILocation(line: 85, column: 14, scope: !127)
!160 = !DILocation(line: 85, column: 9, scope: !127)
!161 = !DILocation(line: 87, column: 1, scope: !108)
!162 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 90, type: !20, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!163 = !DILocalVariable(name: "data", scope: !162, file: !19, line: 92, type: !3)
!164 = !DILocation(line: 92, column: 15, scope: !162)
!165 = !DILocation(line: 93, column: 23, scope: !162)
!166 = !DILocation(line: 93, column: 12, scope: !162)
!167 = !DILocation(line: 93, column: 10, scope: !162)
!168 = !DILocation(line: 94, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !162, file: !19, line: 94, column: 9)
!170 = !DILocation(line: 94, column: 14, scope: !169)
!171 = !DILocation(line: 94, column: 9, scope: !162)
!172 = !DILocation(line: 94, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !19, line: 94, column: 23)
!174 = !DILocation(line: 98, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !176, file: !19, line: 96, column: 5)
!176 = distinct !DILexicalBlock(scope: !162, file: !19, line: 95, column: 8)
!177 = !DILocation(line: 98, column: 9, scope: !175)
!178 = !DILocation(line: 99, column: 9, scope: !175)
!179 = !DILocation(line: 99, column: 20, scope: !175)
!180 = !DILocalVariable(name: "dest", scope: !181, file: !19, line: 102, type: !42)
!181 = distinct !DILexicalBlock(scope: !162, file: !19, line: 101, column: 5)
!182 = !DILocation(line: 102, column: 17, scope: !181)
!183 = !DILocalVariable(name: "i", scope: !181, file: !19, line: 103, type: !47)
!184 = !DILocation(line: 103, column: 16, scope: !181)
!185 = !DILocalVariable(name: "dataLen", scope: !181, file: !19, line: 103, type: !47)
!186 = !DILocation(line: 103, column: 19, scope: !181)
!187 = !DILocation(line: 104, column: 26, scope: !181)
!188 = !DILocation(line: 104, column: 19, scope: !181)
!189 = !DILocation(line: 104, column: 17, scope: !181)
!190 = !DILocation(line: 106, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !181, file: !19, line: 106, column: 9)
!192 = !DILocation(line: 106, column: 14, scope: !191)
!193 = !DILocation(line: 106, column: 21, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !19, line: 106, column: 9)
!195 = !DILocation(line: 106, column: 25, scope: !194)
!196 = !DILocation(line: 106, column: 23, scope: !194)
!197 = !DILocation(line: 106, column: 9, scope: !191)
!198 = !DILocation(line: 108, column: 23, scope: !199)
!199 = distinct !DILexicalBlock(scope: !194, file: !19, line: 107, column: 9)
!200 = !DILocation(line: 108, column: 28, scope: !199)
!201 = !DILocation(line: 108, column: 18, scope: !199)
!202 = !DILocation(line: 108, column: 13, scope: !199)
!203 = !DILocation(line: 108, column: 21, scope: !199)
!204 = !DILocation(line: 109, column: 9, scope: !199)
!205 = !DILocation(line: 106, column: 35, scope: !194)
!206 = !DILocation(line: 106, column: 9, scope: !194)
!207 = distinct !{!207, !197, !208, !76}
!208 = !DILocation(line: 109, column: 9, scope: !191)
!209 = !DILocation(line: 110, column: 9, scope: !181)
!210 = !DILocation(line: 110, column: 20, scope: !181)
!211 = !DILocation(line: 111, column: 20, scope: !181)
!212 = !DILocation(line: 111, column: 9, scope: !181)
!213 = !DILocation(line: 112, column: 14, scope: !181)
!214 = !DILocation(line: 112, column: 9, scope: !181)
!215 = !DILocation(line: 114, column: 1, scope: !162)
