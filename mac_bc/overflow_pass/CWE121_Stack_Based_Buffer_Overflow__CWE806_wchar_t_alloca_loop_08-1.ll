; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 400, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBuffer, align 8, !dbg !25
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !28
  store i32* %2, i32** %data, align 8, !dbg !29
  %call = call i32 @staticReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 99), !dbg !35
  %4 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 99, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !39, metadata !DIExpression()), !dbg !44
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !51, metadata !DIExpression()), !dbg !52
  %6 = load i32*, i32** %data, align 8, !dbg !53
  %call2 = call i64 @wcslen(i32* noundef %6), !dbg !54
  store i64 %call2, i64* %dataLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !59
  %8 = load i64, i64* %dataLen, align 8, !dbg !61
  %cmp = icmp ult i64 %7, %8, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !64
  %10 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !64
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !64
  %12 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !68
  store i32 %11, i32* %arrayidx4, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %13, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !76
  store i32 0, i32* %arrayidx5, align 4, !dbg !77
  %14 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* noundef %14), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !105 {
entry:
  ret i32 1, !dbg !108
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !109 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 400, align 16, !dbg !114
  %1 = bitcast i8* %0 to i32*, !dbg !115
  store i32* %1, i32** %dataBuffer, align 8, !dbg !113
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  store i32* %2, i32** %data, align 8, !dbg !117
  %call = call i32 @staticReturnsFalse(), !dbg !118
  %tobool = icmp ne i32 %call, 0, !dbg !118
  br i1 %tobool, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !124
  %call1 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !126
  %4 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !134, metadata !DIExpression()), !dbg !135
  %6 = load i32*, i32** %data, align 8, !dbg !136
  %call2 = call i64 @wcslen(i32* noundef %6), !dbg !137
  store i64 %call2, i64* %dataLen, align 8, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !142
  %8 = load i64, i64* %dataLen, align 8, !dbg !144
  %cmp = icmp ult i64 %7, %8, !dbg !145
  br i1 %cmp, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !147
  %10 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !147
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !147
  %12 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !151
  store i32 %11, i32* %arrayidx4, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %13, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !158
  store i32 0, i32* %arrayidx5, align 4, !dbg !159
  %14 = load i32*, i32** %data, align 8, !dbg !160
  call void @printWLine(i32* noundef %14), !dbg !161
  ret void, !dbg !162
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !163 {
entry:
  ret i32 0, !dbg !164
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !165 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !168, metadata !DIExpression()), !dbg !169
  %0 = alloca i8, i64 400, align 16, !dbg !170
  %1 = bitcast i8* %0 to i32*, !dbg !171
  store i32* %1, i32** %dataBuffer, align 8, !dbg !169
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !172
  store i32* %2, i32** %data, align 8, !dbg !173
  %call = call i32 @staticReturnsTrue(), !dbg !174
  %tobool = icmp ne i32 %call, 0, !dbg !174
  br i1 %tobool, label %if.then, label %if.end, !dbg !176

if.then:                                          ; preds = %entry
  %3 = load i32*, i32** %data, align 8, !dbg !177
  %call1 = call i32* @wmemset(i32* noundef %3, i32 noundef 65, i64 noundef 49), !dbg !179
  %4 = load i32*, i32** %data, align 8, !dbg !180
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 49, !dbg !180
  store i32 0, i32* %arrayidx, align 4, !dbg !181
  br label %if.end, !dbg !182

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !183, metadata !DIExpression()), !dbg !185
  %5 = bitcast [50 x i32]* %dest to i8*, !dbg !185
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 200, i1 false), !dbg !185
  call void @llvm.dbg.declare(metadata i64* %i, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !188, metadata !DIExpression()), !dbg !189
  %6 = load i32*, i32** %data, align 8, !dbg !190
  %call2 = call i64 @wcslen(i32* noundef %6), !dbg !191
  store i64 %call2, i64* %dataLen, align 8, !dbg !192
  store i64 0, i64* %i, align 8, !dbg !193
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !196
  %8 = load i64, i64* %dataLen, align 8, !dbg !198
  %cmp = icmp ult i64 %7, %8, !dbg !199
  br i1 %cmp, label %for.body, label %for.end, !dbg !200

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %data, align 8, !dbg !201
  %10 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx3 = getelementptr inbounds i32, i32* %9, i64 %10, !dbg !201
  %11 = load i32, i32* %arrayidx3, align 4, !dbg !201
  %12 = load i64, i64* %i, align 8, !dbg !204
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %12, !dbg !205
  store i32 %11, i32* %arrayidx4, align 4, !dbg !206
  br label %for.inc, !dbg !207

for.inc:                                          ; preds = %for.body
  %13 = load i64, i64* %i, align 8, !dbg !208
  %inc = add i64 %13, 1, !dbg !208
  store i64 %inc, i64* %i, align 8, !dbg !208
  br label %for.cond, !dbg !209, !llvm.loop !210

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !212
  store i32 0, i32* %arrayidx5, align 4, !dbg !213
  %14 = load i32*, i32** %data, align 8, !dbg !214
  call void @printWLine(i32* noundef %14), !dbg !215
  ret void, !dbg !216
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_bad", scope: !18, file: !18, line: 37, type: !19, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 39, type: !3)
!23 = !DILocation(line: 39, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBuffer", scope: !17, file: !18, line: 40, type: !3)
!25 = !DILocation(line: 40, column: 15, scope: !17)
!26 = !DILocation(line: 40, column: 39, scope: !17)
!27 = !DILocation(line: 40, column: 28, scope: !17)
!28 = !DILocation(line: 41, column: 12, scope: !17)
!29 = !DILocation(line: 41, column: 10, scope: !17)
!30 = !DILocation(line: 42, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !17, file: !18, line: 42, column: 8)
!32 = !DILocation(line: 42, column: 8, scope: !17)
!33 = !DILocation(line: 45, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !18, line: 43, column: 5)
!35 = !DILocation(line: 45, column: 9, scope: !34)
!36 = !DILocation(line: 46, column: 9, scope: !34)
!37 = !DILocation(line: 46, column: 21, scope: !34)
!38 = !DILocation(line: 47, column: 5, scope: !34)
!39 = !DILocalVariable(name: "dest", scope: !40, file: !18, line: 49, type: !41)
!40 = distinct !DILexicalBlock(scope: !17, file: !18, line: 48, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 50)
!44 = !DILocation(line: 49, column: 17, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !40, file: !18, line: 50, type: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !49)
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 50, column: 16, scope: !40)
!51 = !DILocalVariable(name: "dataLen", scope: !40, file: !18, line: 50, type: !46)
!52 = !DILocation(line: 50, column: 19, scope: !40)
!53 = !DILocation(line: 51, column: 26, scope: !40)
!54 = !DILocation(line: 51, column: 19, scope: !40)
!55 = !DILocation(line: 51, column: 17, scope: !40)
!56 = !DILocation(line: 53, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !40, file: !18, line: 53, column: 9)
!58 = !DILocation(line: 53, column: 14, scope: !57)
!59 = !DILocation(line: 53, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !18, line: 53, column: 9)
!61 = !DILocation(line: 53, column: 25, scope: !60)
!62 = !DILocation(line: 53, column: 23, scope: !60)
!63 = !DILocation(line: 53, column: 9, scope: !57)
!64 = !DILocation(line: 55, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !18, line: 54, column: 9)
!66 = !DILocation(line: 55, column: 28, scope: !65)
!67 = !DILocation(line: 55, column: 18, scope: !65)
!68 = !DILocation(line: 55, column: 13, scope: !65)
!69 = !DILocation(line: 55, column: 21, scope: !65)
!70 = !DILocation(line: 56, column: 9, scope: !65)
!71 = !DILocation(line: 53, column: 35, scope: !60)
!72 = !DILocation(line: 53, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 56, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 57, column: 9, scope: !40)
!77 = !DILocation(line: 57, column: 20, scope: !40)
!78 = !DILocation(line: 58, column: 20, scope: !40)
!79 = !DILocation(line: 58, column: 9, scope: !40)
!80 = !DILocation(line: 60, column: 1, scope: !17)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_loop_08_good", scope: !18, file: !18, line: 123, type: !19, scopeLine: 124, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!82 = !DILocation(line: 125, column: 5, scope: !81)
!83 = !DILocation(line: 126, column: 5, scope: !81)
!84 = !DILocation(line: 127, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 139, type: !86, scopeLine: 140, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!86 = !DISubroutineType(types: !87)
!87 = !{!8, !8, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !18, line: 139, type: !8)
!92 = !DILocation(line: 139, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !18, line: 139, type: !88)
!94 = !DILocation(line: 139, column: 27, scope: !85)
!95 = !DILocation(line: 142, column: 22, scope: !85)
!96 = !DILocation(line: 142, column: 12, scope: !85)
!97 = !DILocation(line: 142, column: 5, scope: !85)
!98 = !DILocation(line: 144, column: 5, scope: !85)
!99 = !DILocation(line: 145, column: 5, scope: !85)
!100 = !DILocation(line: 146, column: 5, scope: !85)
!101 = !DILocation(line: 149, column: 5, scope: !85)
!102 = !DILocation(line: 150, column: 5, scope: !85)
!103 = !DILocation(line: 151, column: 5, scope: !85)
!104 = !DILocation(line: 153, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !18, file: !18, line: 25, type: !106, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!106 = !DISubroutineType(types: !107)
!107 = !{!8}
!108 = !DILocation(line: 27, column: 5, scope: !105)
!109 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 67, type: !19, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!110 = !DILocalVariable(name: "data", scope: !109, file: !18, line: 69, type: !3)
!111 = !DILocation(line: 69, column: 15, scope: !109)
!112 = !DILocalVariable(name: "dataBuffer", scope: !109, file: !18, line: 70, type: !3)
!113 = !DILocation(line: 70, column: 15, scope: !109)
!114 = !DILocation(line: 70, column: 39, scope: !109)
!115 = !DILocation(line: 70, column: 28, scope: !109)
!116 = !DILocation(line: 71, column: 12, scope: !109)
!117 = !DILocation(line: 71, column: 10, scope: !109)
!118 = !DILocation(line: 72, column: 8, scope: !119)
!119 = distinct !DILexicalBlock(scope: !109, file: !18, line: 72, column: 8)
!120 = !DILocation(line: 72, column: 8, scope: !109)
!121 = !DILocation(line: 75, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !18, line: 73, column: 5)
!123 = !DILocation(line: 76, column: 5, scope: !122)
!124 = !DILocation(line: 80, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !119, file: !18, line: 78, column: 5)
!126 = !DILocation(line: 80, column: 9, scope: !125)
!127 = !DILocation(line: 81, column: 9, scope: !125)
!128 = !DILocation(line: 81, column: 20, scope: !125)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !18, line: 84, type: !41)
!130 = distinct !DILexicalBlock(scope: !109, file: !18, line: 83, column: 5)
!131 = !DILocation(line: 84, column: 17, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !130, file: !18, line: 85, type: !46)
!133 = !DILocation(line: 85, column: 16, scope: !130)
!134 = !DILocalVariable(name: "dataLen", scope: !130, file: !18, line: 85, type: !46)
!135 = !DILocation(line: 85, column: 19, scope: !130)
!136 = !DILocation(line: 86, column: 26, scope: !130)
!137 = !DILocation(line: 86, column: 19, scope: !130)
!138 = !DILocation(line: 86, column: 17, scope: !130)
!139 = !DILocation(line: 88, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !18, line: 88, column: 9)
!141 = !DILocation(line: 88, column: 14, scope: !140)
!142 = !DILocation(line: 88, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !18, line: 88, column: 9)
!144 = !DILocation(line: 88, column: 25, scope: !143)
!145 = !DILocation(line: 88, column: 23, scope: !143)
!146 = !DILocation(line: 88, column: 9, scope: !140)
!147 = !DILocation(line: 90, column: 23, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !18, line: 89, column: 9)
!149 = !DILocation(line: 90, column: 28, scope: !148)
!150 = !DILocation(line: 90, column: 18, scope: !148)
!151 = !DILocation(line: 90, column: 13, scope: !148)
!152 = !DILocation(line: 90, column: 21, scope: !148)
!153 = !DILocation(line: 91, column: 9, scope: !148)
!154 = !DILocation(line: 88, column: 35, scope: !143)
!155 = !DILocation(line: 88, column: 9, scope: !143)
!156 = distinct !{!156, !146, !157, !75}
!157 = !DILocation(line: 91, column: 9, scope: !140)
!158 = !DILocation(line: 92, column: 9, scope: !130)
!159 = !DILocation(line: 92, column: 20, scope: !130)
!160 = !DILocation(line: 93, column: 20, scope: !130)
!161 = !DILocation(line: 93, column: 9, scope: !130)
!162 = !DILocation(line: 95, column: 1, scope: !109)
!163 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !18, file: !18, line: 30, type: !106, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!164 = !DILocation(line: 32, column: 5, scope: !163)
!165 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 98, type: !19, scopeLine: 99, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!166 = !DILocalVariable(name: "data", scope: !165, file: !18, line: 100, type: !3)
!167 = !DILocation(line: 100, column: 15, scope: !165)
!168 = !DILocalVariable(name: "dataBuffer", scope: !165, file: !18, line: 101, type: !3)
!169 = !DILocation(line: 101, column: 15, scope: !165)
!170 = !DILocation(line: 101, column: 39, scope: !165)
!171 = !DILocation(line: 101, column: 28, scope: !165)
!172 = !DILocation(line: 102, column: 12, scope: !165)
!173 = !DILocation(line: 102, column: 10, scope: !165)
!174 = !DILocation(line: 103, column: 8, scope: !175)
!175 = distinct !DILexicalBlock(scope: !165, file: !18, line: 103, column: 8)
!176 = !DILocation(line: 103, column: 8, scope: !165)
!177 = !DILocation(line: 106, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !18, line: 104, column: 5)
!179 = !DILocation(line: 106, column: 9, scope: !178)
!180 = !DILocation(line: 107, column: 9, scope: !178)
!181 = !DILocation(line: 107, column: 20, scope: !178)
!182 = !DILocation(line: 108, column: 5, scope: !178)
!183 = !DILocalVariable(name: "dest", scope: !184, file: !18, line: 110, type: !41)
!184 = distinct !DILexicalBlock(scope: !165, file: !18, line: 109, column: 5)
!185 = !DILocation(line: 110, column: 17, scope: !184)
!186 = !DILocalVariable(name: "i", scope: !184, file: !18, line: 111, type: !46)
!187 = !DILocation(line: 111, column: 16, scope: !184)
!188 = !DILocalVariable(name: "dataLen", scope: !184, file: !18, line: 111, type: !46)
!189 = !DILocation(line: 111, column: 19, scope: !184)
!190 = !DILocation(line: 112, column: 26, scope: !184)
!191 = !DILocation(line: 112, column: 19, scope: !184)
!192 = !DILocation(line: 112, column: 17, scope: !184)
!193 = !DILocation(line: 114, column: 16, scope: !194)
!194 = distinct !DILexicalBlock(scope: !184, file: !18, line: 114, column: 9)
!195 = !DILocation(line: 114, column: 14, scope: !194)
!196 = !DILocation(line: 114, column: 21, scope: !197)
!197 = distinct !DILexicalBlock(scope: !194, file: !18, line: 114, column: 9)
!198 = !DILocation(line: 114, column: 25, scope: !197)
!199 = !DILocation(line: 114, column: 23, scope: !197)
!200 = !DILocation(line: 114, column: 9, scope: !194)
!201 = !DILocation(line: 116, column: 23, scope: !202)
!202 = distinct !DILexicalBlock(scope: !197, file: !18, line: 115, column: 9)
!203 = !DILocation(line: 116, column: 28, scope: !202)
!204 = !DILocation(line: 116, column: 18, scope: !202)
!205 = !DILocation(line: 116, column: 13, scope: !202)
!206 = !DILocation(line: 116, column: 21, scope: !202)
!207 = !DILocation(line: 117, column: 9, scope: !202)
!208 = !DILocation(line: 114, column: 35, scope: !197)
!209 = !DILocation(line: 114, column: 9, scope: !197)
!210 = distinct !{!210, !200, !211, !75}
!211 = !DILocation(line: 117, column: 9, scope: !194)
!212 = !DILocation(line: 118, column: 9, scope: !184)
!213 = !DILocation(line: 118, column: 20, scope: !184)
!214 = !DILocation(line: 119, column: 20, scope: !184)
!215 = !DILocation(line: 119, column: 9, scope: !184)
!216 = !DILocation(line: 121, column: 1, scope: !165)
