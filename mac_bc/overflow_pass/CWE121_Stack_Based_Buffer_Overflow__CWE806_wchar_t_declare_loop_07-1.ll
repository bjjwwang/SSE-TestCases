; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !32
  store i32* %arraydecay, i32** %data, align 8, !dbg !33
  %0 = load i32, i32* @staticFive, align 4, !dbg !34
  %cmp = icmp eq i32 %0, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 99), !dbg !40
  %2 = load i32*, i32** %data, align 8, !dbg !41
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !41
  store i32 0, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !49
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !56, metadata !DIExpression()), !dbg !57
  %4 = load i32*, i32** %data, align 8, !dbg !58
  %call1 = call i64 @wcslen(i32* noundef %4), !dbg !59
  store i64 %call1, i64* %dataLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !64
  %6 = load i64, i64* %dataLen, align 8, !dbg !66
  %cmp2 = icmp ult i64 %5, %6, !dbg !67
  br i1 %cmp2, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !69
  %8 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !69
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !69
  %10 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !73
  store i32 %9, i32* %arrayidx4, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %11, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !81
  store i32 0, i32* %arrayidx5, align 4, !dbg !82
  %12 = load i32*, i32** %data, align 8, !dbg !83
  call void @printWLine(i32* noundef %12), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_good() #0 !dbg !86 {
entry:
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !115
  store i32* %arraydecay, i32** %data, align 8, !dbg !116
  %0 = load i32, i32* @staticFive, align 4, !dbg !117
  %cmp = icmp ne i32 %0, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !124
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !126
  %2 = load i32*, i32** %data, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !129, metadata !DIExpression()), !dbg !131
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !134, metadata !DIExpression()), !dbg !135
  %4 = load i32*, i32** %data, align 8, !dbg !136
  %call1 = call i64 @wcslen(i32* noundef %4), !dbg !137
  store i64 %call1, i64* %dataLen, align 8, !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !142
  %6 = load i64, i64* %dataLen, align 8, !dbg !144
  %cmp2 = icmp ult i64 %5, %6, !dbg !145
  br i1 %cmp2, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !147
  %8 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !147
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !147
  %10 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !151
  store i32 %9, i32* %arrayidx4, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %11, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !158
  store i32 0, i32* %arrayidx5, align 4, !dbg !159
  %12 = load i32*, i32** %data, align 8, !dbg !160
  call void @printWLine(i32* noundef %12), !dbg !161
  ret void, !dbg !162
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !163 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !164, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !166, metadata !DIExpression()), !dbg !167
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !168
  store i32* %arraydecay, i32** %data, align 8, !dbg !169
  %0 = load i32, i32* @staticFive, align 4, !dbg !170
  %cmp = icmp eq i32 %0, 5, !dbg !172
  br i1 %cmp, label %if.then, label %if.end, !dbg !173

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data, align 8, !dbg !174
  %call = call i32* @wmemset(i32* noundef %1, i32 noundef 65, i64 noundef 49), !dbg !176
  %2 = load i32*, i32** %data, align 8, !dbg !177
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !177
  store i32 0, i32* %arrayidx, align 4, !dbg !178
  br label %if.end, !dbg !179

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !180, metadata !DIExpression()), !dbg !182
  %3 = bitcast [50 x i32]* %dest to i8*, !dbg !182
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 200, i1 false), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %i, metadata !183, metadata !DIExpression()), !dbg !184
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !185, metadata !DIExpression()), !dbg !186
  %4 = load i32*, i32** %data, align 8, !dbg !187
  %call1 = call i64 @wcslen(i32* noundef %4), !dbg !188
  store i64 %call1, i64* %dataLen, align 8, !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !193
  %6 = load i64, i64* %dataLen, align 8, !dbg !195
  %cmp2 = icmp ult i64 %5, %6, !dbg !196
  br i1 %cmp2, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !198
  %8 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx3 = getelementptr inbounds i32, i32* %7, i64 %8, !dbg !198
  %9 = load i32, i32* %arrayidx3, align 4, !dbg !198
  %10 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %10, !dbg !202
  store i32 %9, i32* %arrayidx4, align 4, !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %11 = load i64, i64* %i, align 8, !dbg !205
  %inc = add i64 %11, 1, !dbg !205
  store i64 %inc, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !209
  store i32 0, i32* %arrayidx5, align 4, !dbg !210
  %12 = load i32*, i32** %data, align 8, !dbg !211
  call void @printWLine(i32* noundef %12), !dbg !212
  ret void, !dbg !213
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 25, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_bad", scope: !7, file: !7, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !23, line: 34, baseType: !24)
!23 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !25, line: 106, baseType: !8)
!25 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!26 = !DILocation(line: 31, column: 15, scope: !16)
!27 = !DILocalVariable(name: "dataBuffer", scope: !16, file: !7, line: 32, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 32, column: 13, scope: !16)
!32 = !DILocation(line: 33, column: 12, scope: !16)
!33 = !DILocation(line: 33, column: 10, scope: !16)
!34 = !DILocation(line: 34, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !16, file: !7, line: 34, column: 8)
!36 = !DILocation(line: 34, column: 18, scope: !35)
!37 = !DILocation(line: 34, column: 8, scope: !16)
!38 = !DILocation(line: 37, column: 17, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !7, line: 35, column: 5)
!40 = !DILocation(line: 37, column: 9, scope: !39)
!41 = !DILocation(line: 38, column: 9, scope: !39)
!42 = !DILocation(line: 38, column: 21, scope: !39)
!43 = !DILocation(line: 39, column: 5, scope: !39)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !7, line: 41, type: !46)
!45 = distinct !DILexicalBlock(scope: !16, file: !7, line: 40, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 1600, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 50)
!49 = !DILocation(line: 41, column: 17, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !45, file: !7, line: 42, type: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 31, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !25, line: 94, baseType: !54)
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 42, column: 16, scope: !45)
!56 = !DILocalVariable(name: "dataLen", scope: !45, file: !7, line: 42, type: !51)
!57 = !DILocation(line: 42, column: 19, scope: !45)
!58 = !DILocation(line: 43, column: 26, scope: !45)
!59 = !DILocation(line: 43, column: 19, scope: !45)
!60 = !DILocation(line: 43, column: 17, scope: !45)
!61 = !DILocation(line: 45, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !45, file: !7, line: 45, column: 9)
!63 = !DILocation(line: 45, column: 14, scope: !62)
!64 = !DILocation(line: 45, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !7, line: 45, column: 9)
!66 = !DILocation(line: 45, column: 25, scope: !65)
!67 = !DILocation(line: 45, column: 23, scope: !65)
!68 = !DILocation(line: 45, column: 9, scope: !62)
!69 = !DILocation(line: 47, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !7, line: 46, column: 9)
!71 = !DILocation(line: 47, column: 28, scope: !70)
!72 = !DILocation(line: 47, column: 18, scope: !70)
!73 = !DILocation(line: 47, column: 13, scope: !70)
!74 = !DILocation(line: 47, column: 21, scope: !70)
!75 = !DILocation(line: 48, column: 9, scope: !70)
!76 = !DILocation(line: 45, column: 35, scope: !65)
!77 = !DILocation(line: 45, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 48, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 49, column: 9, scope: !45)
!82 = !DILocation(line: 49, column: 20, scope: !45)
!83 = !DILocation(line: 50, column: 20, scope: !45)
!84 = !DILocation(line: 50, column: 9, scope: !45)
!85 = !DILocation(line: 52, column: 1, scope: !16)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_07_good", scope: !7, file: !7, line: 115, type: !17, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!87 = !DILocation(line: 117, column: 5, scope: !86)
!88 = !DILocation(line: 118, column: 5, scope: !86)
!89 = !DILocation(line: 119, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 131, type: !91, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!91 = !DISubroutineType(types: !92)
!92 = !{!8, !8, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !7, line: 131, type: !8)
!97 = !DILocation(line: 131, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !7, line: 131, type: !93)
!99 = !DILocation(line: 131, column: 27, scope: !90)
!100 = !DILocation(line: 134, column: 22, scope: !90)
!101 = !DILocation(line: 134, column: 12, scope: !90)
!102 = !DILocation(line: 134, column: 5, scope: !90)
!103 = !DILocation(line: 136, column: 5, scope: !90)
!104 = !DILocation(line: 137, column: 5, scope: !90)
!105 = !DILocation(line: 138, column: 5, scope: !90)
!106 = !DILocation(line: 141, column: 5, scope: !90)
!107 = !DILocation(line: 142, column: 5, scope: !90)
!108 = !DILocation(line: 143, column: 5, scope: !90)
!109 = !DILocation(line: 145, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 59, type: !17, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!111 = !DILocalVariable(name: "data", scope: !110, file: !7, line: 61, type: !21)
!112 = !DILocation(line: 61, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !7, line: 62, type: !28)
!114 = !DILocation(line: 62, column: 13, scope: !110)
!115 = !DILocation(line: 63, column: 12, scope: !110)
!116 = !DILocation(line: 63, column: 10, scope: !110)
!117 = !DILocation(line: 64, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !110, file: !7, line: 64, column: 8)
!119 = !DILocation(line: 64, column: 18, scope: !118)
!120 = !DILocation(line: 64, column: 8, scope: !110)
!121 = !DILocation(line: 67, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !7, line: 65, column: 5)
!123 = !DILocation(line: 68, column: 5, scope: !122)
!124 = !DILocation(line: 72, column: 17, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !7, line: 70, column: 5)
!126 = !DILocation(line: 72, column: 9, scope: !125)
!127 = !DILocation(line: 73, column: 9, scope: !125)
!128 = !DILocation(line: 73, column: 20, scope: !125)
!129 = !DILocalVariable(name: "dest", scope: !130, file: !7, line: 76, type: !46)
!130 = distinct !DILexicalBlock(scope: !110, file: !7, line: 75, column: 5)
!131 = !DILocation(line: 76, column: 17, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !130, file: !7, line: 77, type: !51)
!133 = !DILocation(line: 77, column: 16, scope: !130)
!134 = !DILocalVariable(name: "dataLen", scope: !130, file: !7, line: 77, type: !51)
!135 = !DILocation(line: 77, column: 19, scope: !130)
!136 = !DILocation(line: 78, column: 26, scope: !130)
!137 = !DILocation(line: 78, column: 19, scope: !130)
!138 = !DILocation(line: 78, column: 17, scope: !130)
!139 = !DILocation(line: 80, column: 16, scope: !140)
!140 = distinct !DILexicalBlock(scope: !130, file: !7, line: 80, column: 9)
!141 = !DILocation(line: 80, column: 14, scope: !140)
!142 = !DILocation(line: 80, column: 21, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !7, line: 80, column: 9)
!144 = !DILocation(line: 80, column: 25, scope: !143)
!145 = !DILocation(line: 80, column: 23, scope: !143)
!146 = !DILocation(line: 80, column: 9, scope: !140)
!147 = !DILocation(line: 82, column: 23, scope: !148)
!148 = distinct !DILexicalBlock(scope: !143, file: !7, line: 81, column: 9)
!149 = !DILocation(line: 82, column: 28, scope: !148)
!150 = !DILocation(line: 82, column: 18, scope: !148)
!151 = !DILocation(line: 82, column: 13, scope: !148)
!152 = !DILocation(line: 82, column: 21, scope: !148)
!153 = !DILocation(line: 83, column: 9, scope: !148)
!154 = !DILocation(line: 80, column: 35, scope: !143)
!155 = !DILocation(line: 80, column: 9, scope: !143)
!156 = distinct !{!156, !146, !157, !80}
!157 = !DILocation(line: 83, column: 9, scope: !140)
!158 = !DILocation(line: 84, column: 9, scope: !130)
!159 = !DILocation(line: 84, column: 20, scope: !130)
!160 = !DILocation(line: 85, column: 20, scope: !130)
!161 = !DILocation(line: 85, column: 9, scope: !130)
!162 = !DILocation(line: 87, column: 1, scope: !110)
!163 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 90, type: !17, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!164 = !DILocalVariable(name: "data", scope: !163, file: !7, line: 92, type: !21)
!165 = !DILocation(line: 92, column: 15, scope: !163)
!166 = !DILocalVariable(name: "dataBuffer", scope: !163, file: !7, line: 93, type: !28)
!167 = !DILocation(line: 93, column: 13, scope: !163)
!168 = !DILocation(line: 94, column: 12, scope: !163)
!169 = !DILocation(line: 94, column: 10, scope: !163)
!170 = !DILocation(line: 95, column: 8, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !7, line: 95, column: 8)
!172 = !DILocation(line: 95, column: 18, scope: !171)
!173 = !DILocation(line: 95, column: 8, scope: !163)
!174 = !DILocation(line: 98, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !7, line: 96, column: 5)
!176 = !DILocation(line: 98, column: 9, scope: !175)
!177 = !DILocation(line: 99, column: 9, scope: !175)
!178 = !DILocation(line: 99, column: 20, scope: !175)
!179 = !DILocation(line: 100, column: 5, scope: !175)
!180 = !DILocalVariable(name: "dest", scope: !181, file: !7, line: 102, type: !46)
!181 = distinct !DILexicalBlock(scope: !163, file: !7, line: 101, column: 5)
!182 = !DILocation(line: 102, column: 17, scope: !181)
!183 = !DILocalVariable(name: "i", scope: !181, file: !7, line: 103, type: !51)
!184 = !DILocation(line: 103, column: 16, scope: !181)
!185 = !DILocalVariable(name: "dataLen", scope: !181, file: !7, line: 103, type: !51)
!186 = !DILocation(line: 103, column: 19, scope: !181)
!187 = !DILocation(line: 104, column: 26, scope: !181)
!188 = !DILocation(line: 104, column: 19, scope: !181)
!189 = !DILocation(line: 104, column: 17, scope: !181)
!190 = !DILocation(line: 106, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !181, file: !7, line: 106, column: 9)
!192 = !DILocation(line: 106, column: 14, scope: !191)
!193 = !DILocation(line: 106, column: 21, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !7, line: 106, column: 9)
!195 = !DILocation(line: 106, column: 25, scope: !194)
!196 = !DILocation(line: 106, column: 23, scope: !194)
!197 = !DILocation(line: 106, column: 9, scope: !191)
!198 = !DILocation(line: 108, column: 23, scope: !199)
!199 = distinct !DILexicalBlock(scope: !194, file: !7, line: 107, column: 9)
!200 = !DILocation(line: 108, column: 28, scope: !199)
!201 = !DILocation(line: 108, column: 18, scope: !199)
!202 = !DILocation(line: 108, column: 13, scope: !199)
!203 = !DILocation(line: 108, column: 21, scope: !199)
!204 = !DILocation(line: 109, column: 9, scope: !199)
!205 = !DILocation(line: 106, column: 35, scope: !194)
!206 = !DILocation(line: 106, column: 9, scope: !194)
!207 = distinct !{!207, !197, !208, !80}
!208 = !DILocation(line: 109, column: 9, scope: !191)
!209 = !DILocation(line: 110, column: 9, scope: !181)
!210 = !DILocation(line: 110, column: 20, scope: !181)
!211 = !DILocation(line: 111, column: 20, scope: !181)
!212 = !DILocation(line: 111, column: 9, scope: !181)
!213 = !DILocation(line: 113, column: 1, scope: !163)
