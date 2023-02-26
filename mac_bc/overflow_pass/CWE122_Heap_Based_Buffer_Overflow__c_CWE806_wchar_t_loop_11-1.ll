; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_bad() #0 !dbg !18 {
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
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !34
  %tobool = icmp ne i32 %call1, 0, !dbg !34
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !36

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !37
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 99), !dbg !39
  %3 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  br label %if.end4, !dbg !42

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !48
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !55, metadata !DIExpression()), !dbg !56
  %5 = load i32*, i32** %data, align 8, !dbg !57
  %call5 = call i64 @wcslen(i32* noundef %5), !dbg !58
  store i64 %call5, i64* %dataLen, align 8, !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !63
  %7 = load i64, i64* %dataLen, align 8, !dbg !65
  %cmp6 = icmp ult i64 %6, %7, !dbg !66
  br i1 %cmp6, label %for.body, label %for.end, !dbg !67

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !68
  %9 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !68
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !68
  %11 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !72
  store i32 %10, i32* %arrayidx8, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %12, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !80
  store i32 0, i32* %arrayidx9, align 4, !dbg !81
  %13 = load i32*, i32** %data, align 8, !dbg !82
  call void @printWLine(i32* noundef %13), !dbg !83
  %14 = load i32*, i32** %data, align 8, !dbg !84
  %15 = bitcast i32* %14 to i8*, !dbg !84
  call void @free(i8* noundef %15), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

declare i32 @globalReturnsTrue(...) #4

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #4

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare i64 @wcslen(i32* noundef) #4

declare void @printWLine(i32* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_good() #0 !dbg !87 {
entry:
  call void @goodG2B1(), !dbg !88
  call void @goodG2B2(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* noundef null), !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 noundef %conv), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_good(), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_bad(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !114
  %0 = bitcast i8* %call to i32*, !dbg !115
  store i32* %0, i32** %data, align 8, !dbg !116
  %1 = load i32*, i32** %data, align 8, !dbg !117
  %cmp = icmp eq i32* %1, null, !dbg !119
  br i1 %cmp, label %if.then, label %if.end, !dbg !120

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !121
  unreachable, !dbg !121

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !123
  %tobool = icmp ne i32 %call1, 0, !dbg !123
  br i1 %tobool, label %if.then2, label %if.else, !dbg !125

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  br label %if.end4, !dbg !128

if.else:                                          ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !129
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !131
  %3 = load i32*, i32** %data, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !139, metadata !DIExpression()), !dbg !140
  %5 = load i32*, i32** %data, align 8, !dbg !141
  %call5 = call i64 @wcslen(i32* noundef %5), !dbg !142
  store i64 %call5, i64* %dataLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !147
  %7 = load i64, i64* %dataLen, align 8, !dbg !149
  %cmp6 = icmp ult i64 %6, %7, !dbg !150
  br i1 %cmp6, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !152
  %9 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !152
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !152
  %11 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !156
  store i32 %10, i32* %arrayidx8, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %12, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !163
  store i32 0, i32* %arrayidx9, align 4, !dbg !164
  %13 = load i32*, i32** %data, align 8, !dbg !165
  call void @printWLine(i32* noundef %13), !dbg !166
  %14 = load i32*, i32** %data, align 8, !dbg !167
  %15 = bitcast i32* %14 to i8*, !dbg !167
  call void @free(i8* noundef %15), !dbg !168
  ret void, !dbg !169
}

declare i32 @globalReturnsFalse(...) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !170 {
entry:
  %data = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !171, metadata !DIExpression()), !dbg !172
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !173
  %0 = bitcast i8* %call to i32*, !dbg !174
  store i32* %0, i32** %data, align 8, !dbg !175
  %1 = load i32*, i32** %data, align 8, !dbg !176
  %cmp = icmp eq i32* %1, null, !dbg !178
  br i1 %cmp, label %if.then, label %if.end, !dbg !179

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !180
  unreachable, !dbg !180

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !182
  %tobool = icmp ne i32 %call1, 0, !dbg !182
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !184

if.then2:                                         ; preds = %if.end
  %2 = load i32*, i32** %data, align 8, !dbg !185
  %call3 = call i32* @wmemset(i32* noundef %2, i32 noundef 65, i64 noundef 49), !dbg !187
  %3 = load i32*, i32** %data, align 8, !dbg !188
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !188
  store i32 0, i32* %arrayidx, align 4, !dbg !189
  br label %if.end4, !dbg !190

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !191, metadata !DIExpression()), !dbg !193
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !193
  call void @llvm.dbg.declare(metadata i64* %i, metadata !194, metadata !DIExpression()), !dbg !195
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !196, metadata !DIExpression()), !dbg !197
  %5 = load i32*, i32** %data, align 8, !dbg !198
  %call5 = call i64 @wcslen(i32* noundef %5), !dbg !199
  store i64 %call5, i64* %dataLen, align 8, !dbg !200
  store i64 0, i64* %i, align 8, !dbg !201
  br label %for.cond, !dbg !203

for.cond:                                         ; preds = %for.inc, %if.end4
  %6 = load i64, i64* %i, align 8, !dbg !204
  %7 = load i64, i64* %dataLen, align 8, !dbg !206
  %cmp6 = icmp ult i64 %6, %7, !dbg !207
  br i1 %cmp6, label %for.body, label %for.end, !dbg !208

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data, align 8, !dbg !209
  %9 = load i64, i64* %i, align 8, !dbg !211
  %arrayidx7 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !209
  %10 = load i32, i32* %arrayidx7, align 4, !dbg !209
  %11 = load i64, i64* %i, align 8, !dbg !212
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !213
  store i32 %10, i32* %arrayidx8, align 4, !dbg !214
  br label %for.inc, !dbg !215

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !216
  %inc = add i64 %12, 1, !dbg !216
  store i64 %inc, i64* %i, align 8, !dbg !216
  br label %for.cond, !dbg !217, !llvm.loop !218

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !220
  store i32 0, i32* %arrayidx9, align 4, !dbg !221
  %13 = load i32*, i32** %data, align 8, !dbg !222
  call void @printWLine(i32* noundef %13), !dbg !223
  %14 = load i32*, i32** %data, align 8, !dbg !224
  %15 = bitcast i32* %14 to i8*, !dbg !224
  call void @free(i8* noundef %15), !dbg !225
  ret void, !dbg !226
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_bad", scope: !19, file: !19, line: 23, type: !20, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!19 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!36 = !DILocation(line: 28, column: 8, scope: !18)
!37 = !DILocation(line: 31, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !19, line: 29, column: 5)
!39 = !DILocation(line: 31, column: 9, scope: !38)
!40 = !DILocation(line: 32, column: 9, scope: !38)
!41 = !DILocation(line: 32, column: 21, scope: !38)
!42 = !DILocation(line: 33, column: 5, scope: !38)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !19, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !18, file: !19, line: 34, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 50)
!48 = !DILocation(line: 35, column: 17, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !44, file: !19, line: 36, type: !50)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 31, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !53)
!53 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 36, column: 16, scope: !44)
!55 = !DILocalVariable(name: "dataLen", scope: !44, file: !19, line: 36, type: !50)
!56 = !DILocation(line: 36, column: 19, scope: !44)
!57 = !DILocation(line: 37, column: 26, scope: !44)
!58 = !DILocation(line: 37, column: 19, scope: !44)
!59 = !DILocation(line: 37, column: 17, scope: !44)
!60 = !DILocation(line: 39, column: 16, scope: !61)
!61 = distinct !DILexicalBlock(scope: !44, file: !19, line: 39, column: 9)
!62 = !DILocation(line: 39, column: 14, scope: !61)
!63 = !DILocation(line: 39, column: 21, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !19, line: 39, column: 9)
!65 = !DILocation(line: 39, column: 25, scope: !64)
!66 = !DILocation(line: 39, column: 23, scope: !64)
!67 = !DILocation(line: 39, column: 9, scope: !61)
!68 = !DILocation(line: 41, column: 23, scope: !69)
!69 = distinct !DILexicalBlock(scope: !64, file: !19, line: 40, column: 9)
!70 = !DILocation(line: 41, column: 28, scope: !69)
!71 = !DILocation(line: 41, column: 18, scope: !69)
!72 = !DILocation(line: 41, column: 13, scope: !69)
!73 = !DILocation(line: 41, column: 21, scope: !69)
!74 = !DILocation(line: 42, column: 9, scope: !69)
!75 = !DILocation(line: 39, column: 35, scope: !64)
!76 = !DILocation(line: 39, column: 9, scope: !64)
!77 = distinct !{!77, !67, !78, !79}
!78 = !DILocation(line: 42, column: 9, scope: !61)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 43, column: 9, scope: !44)
!81 = !DILocation(line: 43, column: 20, scope: !44)
!82 = !DILocation(line: 44, column: 20, scope: !44)
!83 = !DILocation(line: 44, column: 9, scope: !44)
!84 = !DILocation(line: 45, column: 14, scope: !44)
!85 = !DILocation(line: 45, column: 9, scope: !44)
!86 = !DILocation(line: 47, column: 1, scope: !18)
!87 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_wchar_t_loop_11_good", scope: !19, file: !19, line: 112, type: !20, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!88 = !DILocation(line: 114, column: 5, scope: !87)
!89 = !DILocation(line: 115, column: 5, scope: !87)
!90 = !DILocation(line: 116, column: 1, scope: !87)
!91 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 128, type: !92, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !22)
!92 = !DISubroutineType(types: !93)
!93 = !{!8, !8, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !19, line: 128, type: !8)
!98 = !DILocation(line: 128, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !19, line: 128, type: !94)
!100 = !DILocation(line: 128, column: 27, scope: !91)
!101 = !DILocation(line: 131, column: 22, scope: !91)
!102 = !DILocation(line: 131, column: 12, scope: !91)
!103 = !DILocation(line: 131, column: 5, scope: !91)
!104 = !DILocation(line: 133, column: 5, scope: !91)
!105 = !DILocation(line: 134, column: 5, scope: !91)
!106 = !DILocation(line: 135, column: 5, scope: !91)
!107 = !DILocation(line: 138, column: 5, scope: !91)
!108 = !DILocation(line: 139, column: 5, scope: !91)
!109 = !DILocation(line: 140, column: 5, scope: !91)
!110 = !DILocation(line: 142, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B1", scope: !19, file: !19, line: 54, type: !20, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!112 = !DILocalVariable(name: "data", scope: !111, file: !19, line: 56, type: !3)
!113 = !DILocation(line: 56, column: 15, scope: !111)
!114 = !DILocation(line: 57, column: 23, scope: !111)
!115 = !DILocation(line: 57, column: 12, scope: !111)
!116 = !DILocation(line: 57, column: 10, scope: !111)
!117 = !DILocation(line: 58, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !19, line: 58, column: 9)
!119 = !DILocation(line: 58, column: 14, scope: !118)
!120 = !DILocation(line: 58, column: 9, scope: !111)
!121 = !DILocation(line: 58, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !19, line: 58, column: 23)
!123 = !DILocation(line: 59, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !111, file: !19, line: 59, column: 8)
!125 = !DILocation(line: 59, column: 8, scope: !111)
!126 = !DILocation(line: 62, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !19, line: 60, column: 5)
!128 = !DILocation(line: 63, column: 5, scope: !127)
!129 = !DILocation(line: 67, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !19, line: 65, column: 5)
!131 = !DILocation(line: 67, column: 9, scope: !130)
!132 = !DILocation(line: 68, column: 9, scope: !130)
!133 = !DILocation(line: 68, column: 20, scope: !130)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !19, line: 71, type: !45)
!135 = distinct !DILexicalBlock(scope: !111, file: !19, line: 70, column: 5)
!136 = !DILocation(line: 71, column: 17, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !135, file: !19, line: 72, type: !50)
!138 = !DILocation(line: 72, column: 16, scope: !135)
!139 = !DILocalVariable(name: "dataLen", scope: !135, file: !19, line: 72, type: !50)
!140 = !DILocation(line: 72, column: 19, scope: !135)
!141 = !DILocation(line: 73, column: 26, scope: !135)
!142 = !DILocation(line: 73, column: 19, scope: !135)
!143 = !DILocation(line: 73, column: 17, scope: !135)
!144 = !DILocation(line: 75, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !19, line: 75, column: 9)
!146 = !DILocation(line: 75, column: 14, scope: !145)
!147 = !DILocation(line: 75, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !19, line: 75, column: 9)
!149 = !DILocation(line: 75, column: 25, scope: !148)
!150 = !DILocation(line: 75, column: 23, scope: !148)
!151 = !DILocation(line: 75, column: 9, scope: !145)
!152 = !DILocation(line: 77, column: 23, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !19, line: 76, column: 9)
!154 = !DILocation(line: 77, column: 28, scope: !153)
!155 = !DILocation(line: 77, column: 18, scope: !153)
!156 = !DILocation(line: 77, column: 13, scope: !153)
!157 = !DILocation(line: 77, column: 21, scope: !153)
!158 = !DILocation(line: 78, column: 9, scope: !153)
!159 = !DILocation(line: 75, column: 35, scope: !148)
!160 = !DILocation(line: 75, column: 9, scope: !148)
!161 = distinct !{!161, !151, !162, !79}
!162 = !DILocation(line: 78, column: 9, scope: !145)
!163 = !DILocation(line: 79, column: 9, scope: !135)
!164 = !DILocation(line: 79, column: 20, scope: !135)
!165 = !DILocation(line: 80, column: 20, scope: !135)
!166 = !DILocation(line: 80, column: 9, scope: !135)
!167 = !DILocation(line: 81, column: 14, scope: !135)
!168 = !DILocation(line: 81, column: 9, scope: !135)
!169 = !DILocation(line: 83, column: 1, scope: !111)
!170 = distinct !DISubprogram(name: "goodG2B2", scope: !19, file: !19, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !22)
!171 = !DILocalVariable(name: "data", scope: !170, file: !19, line: 88, type: !3)
!172 = !DILocation(line: 88, column: 15, scope: !170)
!173 = !DILocation(line: 89, column: 23, scope: !170)
!174 = !DILocation(line: 89, column: 12, scope: !170)
!175 = !DILocation(line: 89, column: 10, scope: !170)
!176 = !DILocation(line: 90, column: 9, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !19, line: 90, column: 9)
!178 = !DILocation(line: 90, column: 14, scope: !177)
!179 = !DILocation(line: 90, column: 9, scope: !170)
!180 = !DILocation(line: 90, column: 24, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !19, line: 90, column: 23)
!182 = !DILocation(line: 91, column: 8, scope: !183)
!183 = distinct !DILexicalBlock(scope: !170, file: !19, line: 91, column: 8)
!184 = !DILocation(line: 91, column: 8, scope: !170)
!185 = !DILocation(line: 94, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !19, line: 92, column: 5)
!187 = !DILocation(line: 94, column: 9, scope: !186)
!188 = !DILocation(line: 95, column: 9, scope: !186)
!189 = !DILocation(line: 95, column: 20, scope: !186)
!190 = !DILocation(line: 96, column: 5, scope: !186)
!191 = !DILocalVariable(name: "dest", scope: !192, file: !19, line: 98, type: !45)
!192 = distinct !DILexicalBlock(scope: !170, file: !19, line: 97, column: 5)
!193 = !DILocation(line: 98, column: 17, scope: !192)
!194 = !DILocalVariable(name: "i", scope: !192, file: !19, line: 99, type: !50)
!195 = !DILocation(line: 99, column: 16, scope: !192)
!196 = !DILocalVariable(name: "dataLen", scope: !192, file: !19, line: 99, type: !50)
!197 = !DILocation(line: 99, column: 19, scope: !192)
!198 = !DILocation(line: 100, column: 26, scope: !192)
!199 = !DILocation(line: 100, column: 19, scope: !192)
!200 = !DILocation(line: 100, column: 17, scope: !192)
!201 = !DILocation(line: 102, column: 16, scope: !202)
!202 = distinct !DILexicalBlock(scope: !192, file: !19, line: 102, column: 9)
!203 = !DILocation(line: 102, column: 14, scope: !202)
!204 = !DILocation(line: 102, column: 21, scope: !205)
!205 = distinct !DILexicalBlock(scope: !202, file: !19, line: 102, column: 9)
!206 = !DILocation(line: 102, column: 25, scope: !205)
!207 = !DILocation(line: 102, column: 23, scope: !205)
!208 = !DILocation(line: 102, column: 9, scope: !202)
!209 = !DILocation(line: 104, column: 23, scope: !210)
!210 = distinct !DILexicalBlock(scope: !205, file: !19, line: 103, column: 9)
!211 = !DILocation(line: 104, column: 28, scope: !210)
!212 = !DILocation(line: 104, column: 18, scope: !210)
!213 = !DILocation(line: 104, column: 13, scope: !210)
!214 = !DILocation(line: 104, column: 21, scope: !210)
!215 = !DILocation(line: 105, column: 9, scope: !210)
!216 = !DILocation(line: 102, column: 35, scope: !205)
!217 = !DILocation(line: 102, column: 9, scope: !205)
!218 = distinct !{!218, !208, !219, !79}
!219 = !DILocation(line: 105, column: 9, scope: !202)
!220 = !DILocation(line: 106, column: 9, scope: !192)
!221 = !DILocation(line: 106, column: 20, scope: !192)
!222 = !DILocation(line: 107, column: 20, scope: !192)
!223 = !DILocation(line: 107, column: 9, scope: !192)
!224 = !DILocation(line: 108, column: 14, scope: !192)
!225 = !DILocation(line: 108, column: 9, scope: !192)
!226 = !DILocation(line: 110, column: 1, scope: !170)
