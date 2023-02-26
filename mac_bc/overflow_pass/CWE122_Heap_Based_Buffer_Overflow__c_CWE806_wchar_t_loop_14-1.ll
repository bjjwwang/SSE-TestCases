; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14_bad() #0 !dbg !18 {
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
  %2 = load i32, i32* @globalFive, align 4, !dbg !34
  %cmp1 = icmp eq i32 %2, 5, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !37

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !40
  %4 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end4, !dbg !43

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !57
  %6 = load i32*, i32** %data, align 8, !dbg !58
  %call5 = call i64 @wcslen(i32* noundef %6), !dbg !59
  store i64 %call5, i64* %dataLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !64
  %8 = load i64, i64* %dataLen, align 8, !dbg !66
  %cmp6 = icmp ult i64 %7, %8, !dbg !67
  br i1 %cmp6, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !69
  %10 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !69
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !69
  %12 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !73
  store i32 %11, i32* %arrayidx8, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %13, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !81
  store i32 0, i32* %arrayidx9, align 4, !dbg !82
  %14 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* noundef %14), !dbg !84
  %15 = load i32*, i32** %data, align 8, !dbg !85
  %16 = bitcast i32* %15 to i8*, !dbg !85
  call void @free(i8* noundef %16), !dbg !86
  ret void, !dbg !87
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14_good() #0 !dbg !88 {
entry:
  call void @goodG2B1(), !dbg !89
  call void @goodG2B2(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !92 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* noundef null), !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 noundef %conv), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14_good(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14_bad(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !115
  %0 = bitcast i8* %call to i32*, !dbg !116
  store i32* %0, i32** %data, align 8, !dbg !117
  %1 = load i32*, i32** %data, align 8, !dbg !118
  %cmp = icmp eq i32* %1, null, !dbg !120
  br i1 %cmp, label %if.then, label %if.end, !dbg !121

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !122
  unreachable, !dbg !122

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !124
  %cmp1 = icmp ne i32 %2, 5, !dbg !126
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !127

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !128
  br label %if.end4, !dbg !130

if.else:                                          ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !131
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !133
  %4 = load i32*, i32** %data, align 8, !dbg !134
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !134
  store i32 0, i32* %arrayidx, align 4, !dbg !135
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !136, metadata !DIExpression()), !dbg !138
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !138
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !141, metadata !DIExpression()), !dbg !142
  %6 = load i32*, i32** %data, align 8, !dbg !143
  %call5 = call i64 @wcslen(i32* noundef %6), !dbg !144
  store i64 %call5, i64* %dataLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !149
  %8 = load i64, i64* %dataLen, align 8, !dbg !151
  %cmp6 = icmp ult i64 %7, %8, !dbg !152
  br i1 %cmp6, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !154
  %10 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !154
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !154
  %12 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !158
  store i32 %11, i32* %arrayidx8, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %13, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !165
  store i32 0, i32* %arrayidx9, align 4, !dbg !166
  %14 = load i32*, i32** %data, align 8, !dbg !167
  call void @printWLine(i32* noundef %14), !dbg !168
  %15 = load i32*, i32** %data, align 8, !dbg !169
  %16 = bitcast i32* %15 to i8*, !dbg !169
  call void @free(i8* noundef %16), !dbg !170
  ret void, !dbg !171
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !172 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !173, metadata !DIExpression()), !dbg !174
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !175
  %0 = bitcast i8* %call to i32*, !dbg !176
  store i32* %0, i32** %data, align 8, !dbg !177
  %1 = load i32*, i32** %data, align 8, !dbg !178
  %cmp = icmp eq i32* %1, null, !dbg !180
  br i1 %cmp, label %if.then, label %if.end, !dbg !181

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !182
  unreachable, !dbg !182

if.end:                                           ; preds = %entry
  %2 = load i32, i32* @globalFive, align 4, !dbg !184
  %cmp1 = icmp eq i32 %2, 5, !dbg !186
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !187

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %data, align 8, !dbg !188
  %call3 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !190
  %4 = load i32*, i32** %data, align 8, !dbg !191
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !191
  store i32 0, i32* %arrayidx, align 4, !dbg !192
  br label %if.end4, !dbg !193

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !194, metadata !DIExpression()), !dbg !196
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !196
  call void @llvm.dbg.declare(metadata i64* %i, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !199, metadata !DIExpression()), !dbg !200
  %6 = load i32*, i32** %data, align 8, !dbg !201
  %call5 = call i64 @wcslen(i32* noundef %6), !dbg !202
  store i64 %call5, i64* %dataLen, align 8, !dbg !203
  store i64 0, i64* %i, align 8, !dbg !204
  br label %for.cond, !dbg !206

for.cond:                                         ; preds = %for.inc, %if.end4
  %7 = load i64, i64* %i, align 8, !dbg !207
  %8 = load i64, i64* %dataLen, align 8, !dbg !209
  %cmp6 = icmp ult i64 %7, %8, !dbg !210
  br i1 %cmp6, label %for.body, label %for.end, !dbg !211

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !212
  %10 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !212
  %11 = load i32, i32* %arrayidx7, align 4, !dbg !212
  %12 = load i64, i64* %i, align 8, !dbg !215
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !216
  store i32 %11, i32* %arrayidx8, align 4, !dbg !217
  br label %for.inc, !dbg !218

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !219
  %inc = add i64 %13, 1, !dbg !219
  store i64 %inc, i64* %i, align 8, !dbg !219
  br label %for.cond, !dbg !220, !llvm.loop !221

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !223
  store i32 0, i32* %arrayidx9, align 4, !dbg !224
  %14 = load i32*, i32** %data, align 8, !dbg !225
  call void @printWLine(i32* noundef %14), !dbg !226
  %15 = load i32*, i32** %data, align 8, !dbg !227
  %16 = bitcast i32* %15 to i8*, !dbg !227
  call void @free(i8* noundef %16), !dbg !228
  ret void, !dbg !229
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 25, type: !3)
!24 = !DILocation(line: 25, column: 15, scope: !18)
!25 = !DILocation(line: 26, column: 23, scope: !18)
!26 = !DILocation(line: 26, column: 12, scope: !18)
!27 = !DILocation(line: 26, column: 10, scope: !18)
!28 = !DILocation(line: 27, column: 9, scope: !29)
!29 = distinct !DILexicalBlock(scope: !18, file: !19, line: 27, column: 9)
!30 = !DILocation(line: 27, column: 14, scope: !29)
!31 = !DILocation(line: 27, column: 9, scope: !18)
!32 = !DILocation(line: 27, column: 24, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !19, line: 27, column: 23)
!34 = !DILocation(line: 28, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !18, file: !19, line: 28, column: 8)
!36 = !DILocation(line: 28, column: 18, scope: !35)
!37 = !DILocation(line: 28, column: 8, scope: !18)
!38 = !DILocation(line: 31, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !19, line: 29, column: 5)
!40 = !DILocation(line: 31, column: 9, scope: !39)
!41 = !DILocation(line: 32, column: 9, scope: !39)
!42 = !DILocation(line: 32, column: 21, scope: !39)
!43 = !DILocation(line: 33, column: 5, scope: !39)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !19, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 35, column: 17, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !45, file: !19, line: 36, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 31, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !54)
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 36, column: 16, scope: !45)
!56 = !DILocalVariable(name: "dataLen", scope: !45, file: !19, line: 36, type: !51)
!57 = !DILocation(line: 36, column: 19, scope: !45)
!58 = !DILocation(line: 37, column: 26, scope: !45)
!59 = !DILocation(line: 37, column: 19, scope: !45)
!60 = !DILocation(line: 37, column: 17, scope: !45)
!61 = !DILocation(line: 39, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !45, file: !19, line: 39, column: 9)
!63 = !DILocation(line: 39, column: 14, scope: !62)
!64 = !DILocation(line: 39, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !19, line: 39, column: 9)
!66 = !DILocation(line: 39, column: 25, scope: !65)
!67 = !DILocation(line: 39, column: 23, scope: !65)
!68 = !DILocation(line: 39, column: 9, scope: !62)
!69 = !DILocation(line: 41, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !19, line: 40, column: 9)
!71 = !DILocation(line: 41, column: 28, scope: !70)
!72 = !DILocation(line: 41, column: 18, scope: !70)
!73 = !DILocation(line: 41, column: 13, scope: !70)
!74 = !DILocation(line: 41, column: 21, scope: !70)
!75 = !DILocation(line: 42, column: 9, scope: !70)
!76 = !DILocation(line: 39, column: 35, scope: !65)
!77 = !DILocation(line: 39, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 42, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 43, column: 9, scope: !45)
!82 = !DILocation(line: 43, column: 20, scope: !45)
!83 = !DILocation(line: 44, column: 20, scope: !45)
!84 = !DILocation(line: 44, column: 9, scope: !45)
!85 = !DILocation(line: 45, column: 14, scope: !45)
!86 = !DILocation(line: 45, column: 9, scope: !45)
!87 = !DILocation(line: 47, column: 1, scope: !18)
!88 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_14_good", scope: !19, file: !19, line: 112, type: !20, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!89 = !DILocation(line: 114, column: 5, scope: !88)
!90 = !DILocation(line: 115, column: 5, scope: !88)
!91 = !DILocation(line: 116, column: 1, scope: !88)
!92 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 128, type: !93, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!93 = !DISubroutineType(types: !94)
!94 = !{!8, !8, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !19, line: 128, type: !8)
!99 = !DILocation(line: 128, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !19, line: 128, type: !95)
!101 = !DILocation(line: 128, column: 27, scope: !92)
!102 = !DILocation(line: 131, column: 22, scope: !92)
!103 = !DILocation(line: 131, column: 12, scope: !92)
!104 = !DILocation(line: 131, column: 5, scope: !92)
!105 = !DILocation(line: 133, column: 5, scope: !92)
!106 = !DILocation(line: 134, column: 5, scope: !92)
!107 = !DILocation(line: 135, column: 5, scope: !92)
!108 = !DILocation(line: 138, column: 5, scope: !92)
!109 = !DILocation(line: 139, column: 5, scope: !92)
!110 = !DILocation(line: 140, column: 5, scope: !92)
!111 = !DILocation(line: 142, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!113 = !DILocalVariable(name: "data", scope: !112, file: !19, line: 56, type: !3)
!114 = !DILocation(line: 56, column: 15, scope: !112)
!115 = !DILocation(line: 57, column: 23, scope: !112)
!116 = !DILocation(line: 57, column: 12, scope: !112)
!117 = !DILocation(line: 57, column: 10, scope: !112)
!118 = !DILocation(line: 58, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !112, file: !19, line: 58, column: 9)
!120 = !DILocation(line: 58, column: 14, scope: !119)
!121 = !DILocation(line: 58, column: 9, scope: !112)
!122 = !DILocation(line: 58, column: 24, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !19, line: 58, column: 23)
!124 = !DILocation(line: 59, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !112, file: !19, line: 59, column: 8)
!126 = !DILocation(line: 59, column: 18, scope: !125)
!127 = !DILocation(line: 59, column: 8, scope: !112)
!128 = !DILocation(line: 62, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !19, line: 60, column: 5)
!130 = !DILocation(line: 63, column: 5, scope: !129)
!131 = !DILocation(line: 67, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !19, line: 65, column: 5)
!133 = !DILocation(line: 67, column: 9, scope: !132)
!134 = !DILocation(line: 68, column: 9, scope: !132)
!135 = !DILocation(line: 68, column: 20, scope: !132)
!136 = !DILocalVariable(name: "dest", scope: !137, file: !19, line: 71, type: !46)
!137 = distinct !DILexicalBlock(scope: !112, file: !19, line: 70, column: 5)
!138 = !DILocation(line: 71, column: 17, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !137, file: !19, line: 72, type: !51)
!140 = !DILocation(line: 72, column: 16, scope: !137)
!141 = !DILocalVariable(name: "dataLen", scope: !137, file: !19, line: 72, type: !51)
!142 = !DILocation(line: 72, column: 19, scope: !137)
!143 = !DILocation(line: 73, column: 26, scope: !137)
!144 = !DILocation(line: 73, column: 19, scope: !137)
!145 = !DILocation(line: 73, column: 17, scope: !137)
!146 = !DILocation(line: 75, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !137, file: !19, line: 75, column: 9)
!148 = !DILocation(line: 75, column: 14, scope: !147)
!149 = !DILocation(line: 75, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !19, line: 75, column: 9)
!151 = !DILocation(line: 75, column: 25, scope: !150)
!152 = !DILocation(line: 75, column: 23, scope: !150)
!153 = !DILocation(line: 75, column: 9, scope: !147)
!154 = !DILocation(line: 77, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !19, line: 76, column: 9)
!156 = !DILocation(line: 77, column: 28, scope: !155)
!157 = !DILocation(line: 77, column: 18, scope: !155)
!158 = !DILocation(line: 77, column: 13, scope: !155)
!159 = !DILocation(line: 77, column: 21, scope: !155)
!160 = !DILocation(line: 78, column: 9, scope: !155)
!161 = !DILocation(line: 75, column: 35, scope: !150)
!162 = !DILocation(line: 75, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !80}
!164 = !DILocation(line: 78, column: 9, scope: !147)
!165 = !DILocation(line: 79, column: 9, scope: !137)
!166 = !DILocation(line: 79, column: 20, scope: !137)
!167 = !DILocation(line: 80, column: 20, scope: !137)
!168 = !DILocation(line: 80, column: 9, scope: !137)
!169 = !DILocation(line: 81, column: 14, scope: !137)
!170 = !DILocation(line: 81, column: 9, scope: !137)
!171 = !DILocation(line: 83, column: 1, scope: !112)
!172 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!173 = !DILocalVariable(name: "data", scope: !172, file: !19, line: 88, type: !3)
!174 = !DILocation(line: 88, column: 15, scope: !172)
!175 = !DILocation(line: 89, column: 23, scope: !172)
!176 = !DILocation(line: 89, column: 12, scope: !172)
!177 = !DILocation(line: 89, column: 10, scope: !172)
!178 = !DILocation(line: 90, column: 9, scope: !179)
!179 = distinct !DILexicalBlock(scope: !172, file: !19, line: 90, column: 9)
!180 = !DILocation(line: 90, column: 14, scope: !179)
!181 = !DILocation(line: 90, column: 9, scope: !172)
!182 = !DILocation(line: 90, column: 24, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !19, line: 90, column: 23)
!184 = !DILocation(line: 91, column: 8, scope: !185)
!185 = distinct !DILexicalBlock(scope: !172, file: !19, line: 91, column: 8)
!186 = !DILocation(line: 91, column: 18, scope: !185)
!187 = !DILocation(line: 91, column: 8, scope: !172)
!188 = !DILocation(line: 94, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !19, line: 92, column: 5)
!190 = !DILocation(line: 94, column: 9, scope: !189)
!191 = !DILocation(line: 95, column: 9, scope: !189)
!192 = !DILocation(line: 95, column: 20, scope: !189)
!193 = !DILocation(line: 96, column: 5, scope: !189)
!194 = !DILocalVariable(name: "dest", scope: !195, file: !19, line: 98, type: !46)
!195 = distinct !DILexicalBlock(scope: !172, file: !19, line: 97, column: 5)
!196 = !DILocation(line: 98, column: 17, scope: !195)
!197 = !DILocalVariable(name: "i", scope: !195, file: !19, line: 99, type: !51)
!198 = !DILocation(line: 99, column: 16, scope: !195)
!199 = !DILocalVariable(name: "dataLen", scope: !195, file: !19, line: 99, type: !51)
!200 = !DILocation(line: 99, column: 19, scope: !195)
!201 = !DILocation(line: 100, column: 26, scope: !195)
!202 = !DILocation(line: 100, column: 19, scope: !195)
!203 = !DILocation(line: 100, column: 17, scope: !195)
!204 = !DILocation(line: 102, column: 16, scope: !205)
!205 = distinct !DILexicalBlock(scope: !195, file: !19, line: 102, column: 9)
!206 = !DILocation(line: 102, column: 14, scope: !205)
!207 = !DILocation(line: 102, column: 21, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !19, line: 102, column: 9)
!209 = !DILocation(line: 102, column: 25, scope: !208)
!210 = !DILocation(line: 102, column: 23, scope: !208)
!211 = !DILocation(line: 102, column: 9, scope: !205)
!212 = !DILocation(line: 104, column: 23, scope: !213)
!213 = distinct !DILexicalBlock(scope: !208, file: !19, line: 103, column: 9)
!214 = !DILocation(line: 104, column: 28, scope: !213)
!215 = !DILocation(line: 104, column: 18, scope: !213)
!216 = !DILocation(line: 104, column: 13, scope: !213)
!217 = !DILocation(line: 104, column: 21, scope: !213)
!218 = !DILocation(line: 105, column: 9, scope: !213)
!219 = !DILocation(line: 102, column: 35, scope: !208)
!220 = !DILocation(line: 102, column: 9, scope: !208)
!221 = distinct !{!221, !211, !222, !80}
!222 = !DILocation(line: 105, column: 9, scope: !205)
!223 = !DILocation(line: 106, column: 9, scope: !195)
!224 = !DILocation(line: 106, column: 20, scope: !195)
!225 = !DILocation(line: 107, column: 20, scope: !195)
!226 = !DILocation(line: 107, column: 9, scope: !195)
!227 = !DILocation(line: 108, column: 14, scope: !195)
!228 = !DILocation(line: 108, column: 9, scope: !195)
!229 = !DILocation(line: 110, column: 1, scope: !172)
