; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !11
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_bad() #0 !dbg !22 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i64*, !dbg !31
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to i64*, !dbg !35
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !33
  %4 = load i32, i32* @staticTrue, align 4, !dbg !36
  %tobool = icmp ne i32 %4, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !39
  store i64* %5, i64** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !43, metadata !DIExpression()), !dbg !48
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !48
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %i, metadata !49, metadata !DIExpression()), !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !60
  %cmp = icmp ult i64 %7, 100, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !66
  %9 = load i64, i64* %arrayidx, align 8, !dbg !66
  %10 = load i64*, i64** %data, align 8, !dbg !67
  %11 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx1 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !67
  store i64 %9, i64* %arrayidx1, align 8, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %12, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !76
  %14 = load i64, i64* %arrayidx2, align 8, !dbg !76
  call void @printLongLongLine(i64 noundef %14), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* noundef null), !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 noundef %conv), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %0 = alloca i8, i64 400, align 16, !dbg !108
  %1 = bitcast i8* %0 to i64*, !dbg !109
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %2 = alloca i8, i64 800, align 16, !dbg !112
  %3 = bitcast i8* %2 to i64*, !dbg !113
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !111
  %4 = load i32, i32* @staticFalse, align 4, !dbg !114
  %tobool = icmp ne i32 %4, 0, !dbg !114
  br i1 %tobool, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !117
  br label %if.end, !dbg !119

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !120
  store i64* %5, i64** %data, align 8, !dbg !122
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !123, metadata !DIExpression()), !dbg !125
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %i, metadata !126, metadata !DIExpression()), !dbg !128
  store i64 0, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !131

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !132
  %cmp = icmp ult i64 %7, 100, !dbg !134
  br i1 %cmp, label %for.body, label %for.end, !dbg !135

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !138
  %9 = load i64, i64* %arrayidx, align 8, !dbg !138
  %10 = load i64*, i64** %data, align 8, !dbg !139
  %11 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx1 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !139
  store i64 %9, i64* %arrayidx1, align 8, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %12, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !147
  %arrayidx2 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !147
  %14 = load i64, i64* %arrayidx2, align 8, !dbg !147
  call void @printLongLongLine(i64 noundef %14), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !150 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %0 = alloca i8, i64 400, align 16, !dbg !155
  %1 = bitcast i8* %0 to i64*, !dbg !156
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !154
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !157, metadata !DIExpression()), !dbg !158
  %2 = alloca i8, i64 800, align 16, !dbg !159
  %3 = bitcast i8* %2 to i64*, !dbg !160
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !158
  %4 = load i32, i32* @staticTrue, align 4, !dbg !161
  %tobool = icmp ne i32 %4, 0, !dbg !161
  br i1 %tobool, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !164
  store i64* %5, i64** %data, align 8, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !177
  %cmp = icmp ult i64 %7, 100, !dbg !179
  br i1 %cmp, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !183
  %9 = load i64, i64* %arrayidx, align 8, !dbg !183
  %10 = load i64*, i64** %data, align 8, !dbg !184
  %11 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx1 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !184
  store i64 %9, i64* %arrayidx1, align 8, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %12, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !192
  %arrayidx2 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !192
  %14 = load i64, i64* %arrayidx2, align 8, !dbg !192
  call void @printLongLongLine(i64 noundef %14), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !13, line: 23, type: !14, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !10, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !9}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !7, line: 30, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!8 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{!0, !11}
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !13, line: 24, type: !14, isLocal: true, isDefinition: true)
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{i32 7, !"Dwarf Version", i32 4}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 1}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"Homebrew clang version 14.0.6"}
!22 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_bad", scope: !13, file: !13, line: 28, type: !23, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{null}
!25 = !{}
!26 = !DILocalVariable(name: "data", scope: !22, file: !13, line: 30, type: !5)
!27 = !DILocation(line: 30, column: 15, scope: !22)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !22, file: !13, line: 31, type: !5)
!29 = !DILocation(line: 31, column: 15, scope: !22)
!30 = !DILocation(line: 31, column: 42, scope: !22)
!31 = !DILocation(line: 31, column: 31, scope: !22)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !22, file: !13, line: 32, type: !5)
!33 = !DILocation(line: 32, column: 15, scope: !22)
!34 = !DILocation(line: 32, column: 43, scope: !22)
!35 = !DILocation(line: 32, column: 32, scope: !22)
!36 = !DILocation(line: 33, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !13, line: 33, column: 8)
!38 = !DILocation(line: 33, column: 8, scope: !22)
!39 = !DILocation(line: 37, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !13, line: 34, column: 5)
!41 = !DILocation(line: 37, column: 14, scope: !40)
!42 = !DILocation(line: 38, column: 5, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !13, line: 40, type: !45)
!44 = distinct !DILexicalBlock(scope: !22, file: !13, line: 39, column: 5)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 100)
!48 = !DILocation(line: 40, column: 17, scope: !44)
!49 = !DILocalVariable(name: "i", scope: !50, file: !13, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !44, file: !13, line: 41, column: 9)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !52, line: 31, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !54, line: 94, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!55 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 42, column: 20, scope: !50)
!57 = !DILocation(line: 44, column: 20, scope: !58)
!58 = distinct !DILexicalBlock(scope: !50, file: !13, line: 44, column: 13)
!59 = !DILocation(line: 44, column: 18, scope: !58)
!60 = !DILocation(line: 44, column: 25, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !13, line: 44, column: 13)
!62 = !DILocation(line: 44, column: 27, scope: !61)
!63 = !DILocation(line: 44, column: 13, scope: !58)
!64 = !DILocation(line: 46, column: 34, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !13, line: 45, column: 13)
!66 = !DILocation(line: 46, column: 27, scope: !65)
!67 = !DILocation(line: 46, column: 17, scope: !65)
!68 = !DILocation(line: 46, column: 22, scope: !65)
!69 = !DILocation(line: 46, column: 25, scope: !65)
!70 = !DILocation(line: 47, column: 13, scope: !65)
!71 = !DILocation(line: 44, column: 35, scope: !61)
!72 = !DILocation(line: 44, column: 13, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 47, column: 13, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 48, column: 31, scope: !50)
!77 = !DILocation(line: 48, column: 13, scope: !50)
!78 = !DILocation(line: 51, column: 1, scope: !22)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_05_good", scope: !13, file: !13, line: 112, type: !23, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!80 = !DILocation(line: 114, column: 5, scope: !79)
!81 = !DILocation(line: 115, column: 5, scope: !79)
!82 = !DILocation(line: 116, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 128, type: !84, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !25)
!84 = !DISubroutineType(types: !85)
!85 = !{!14, !14, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !13, line: 128, type: !14)
!90 = !DILocation(line: 128, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !13, line: 128, type: !86)
!92 = !DILocation(line: 128, column: 27, scope: !83)
!93 = !DILocation(line: 131, column: 22, scope: !83)
!94 = !DILocation(line: 131, column: 12, scope: !83)
!95 = !DILocation(line: 131, column: 5, scope: !83)
!96 = !DILocation(line: 133, column: 5, scope: !83)
!97 = !DILocation(line: 134, column: 5, scope: !83)
!98 = !DILocation(line: 135, column: 5, scope: !83)
!99 = !DILocation(line: 138, column: 5, scope: !83)
!100 = !DILocation(line: 139, column: 5, scope: !83)
!101 = !DILocation(line: 140, column: 5, scope: !83)
!102 = !DILocation(line: 142, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 58, type: !23, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!104 = !DILocalVariable(name: "data", scope: !103, file: !13, line: 60, type: !5)
!105 = !DILocation(line: 60, column: 15, scope: !103)
!106 = !DILocalVariable(name: "dataBadBuffer", scope: !103, file: !13, line: 61, type: !5)
!107 = !DILocation(line: 61, column: 15, scope: !103)
!108 = !DILocation(line: 61, column: 42, scope: !103)
!109 = !DILocation(line: 61, column: 31, scope: !103)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !103, file: !13, line: 62, type: !5)
!111 = !DILocation(line: 62, column: 15, scope: !103)
!112 = !DILocation(line: 62, column: 43, scope: !103)
!113 = !DILocation(line: 62, column: 32, scope: !103)
!114 = !DILocation(line: 63, column: 8, scope: !115)
!115 = distinct !DILexicalBlock(scope: !103, file: !13, line: 63, column: 8)
!116 = !DILocation(line: 63, column: 8, scope: !103)
!117 = !DILocation(line: 66, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !13, line: 64, column: 5)
!119 = !DILocation(line: 67, column: 5, scope: !118)
!120 = !DILocation(line: 71, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !115, file: !13, line: 69, column: 5)
!122 = !DILocation(line: 71, column: 14, scope: !121)
!123 = !DILocalVariable(name: "source", scope: !124, file: !13, line: 74, type: !45)
!124 = distinct !DILexicalBlock(scope: !103, file: !13, line: 73, column: 5)
!125 = !DILocation(line: 74, column: 17, scope: !124)
!126 = !DILocalVariable(name: "i", scope: !127, file: !13, line: 76, type: !51)
!127 = distinct !DILexicalBlock(scope: !124, file: !13, line: 75, column: 9)
!128 = !DILocation(line: 76, column: 20, scope: !127)
!129 = !DILocation(line: 78, column: 20, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !13, line: 78, column: 13)
!131 = !DILocation(line: 78, column: 18, scope: !130)
!132 = !DILocation(line: 78, column: 25, scope: !133)
!133 = distinct !DILexicalBlock(scope: !130, file: !13, line: 78, column: 13)
!134 = !DILocation(line: 78, column: 27, scope: !133)
!135 = !DILocation(line: 78, column: 13, scope: !130)
!136 = !DILocation(line: 80, column: 34, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !13, line: 79, column: 13)
!138 = !DILocation(line: 80, column: 27, scope: !137)
!139 = !DILocation(line: 80, column: 17, scope: !137)
!140 = !DILocation(line: 80, column: 22, scope: !137)
!141 = !DILocation(line: 80, column: 25, scope: !137)
!142 = !DILocation(line: 81, column: 13, scope: !137)
!143 = !DILocation(line: 78, column: 35, scope: !133)
!144 = !DILocation(line: 78, column: 13, scope: !133)
!145 = distinct !{!145, !135, !146, !75}
!146 = !DILocation(line: 81, column: 13, scope: !130)
!147 = !DILocation(line: 82, column: 31, scope: !127)
!148 = !DILocation(line: 82, column: 13, scope: !127)
!149 = !DILocation(line: 85, column: 1, scope: !103)
!150 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 88, type: !23, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !25)
!151 = !DILocalVariable(name: "data", scope: !150, file: !13, line: 90, type: !5)
!152 = !DILocation(line: 90, column: 15, scope: !150)
!153 = !DILocalVariable(name: "dataBadBuffer", scope: !150, file: !13, line: 91, type: !5)
!154 = !DILocation(line: 91, column: 15, scope: !150)
!155 = !DILocation(line: 91, column: 42, scope: !150)
!156 = !DILocation(line: 91, column: 31, scope: !150)
!157 = !DILocalVariable(name: "dataGoodBuffer", scope: !150, file: !13, line: 92, type: !5)
!158 = !DILocation(line: 92, column: 15, scope: !150)
!159 = !DILocation(line: 92, column: 43, scope: !150)
!160 = !DILocation(line: 92, column: 32, scope: !150)
!161 = !DILocation(line: 93, column: 8, scope: !162)
!162 = distinct !DILexicalBlock(scope: !150, file: !13, line: 93, column: 8)
!163 = !DILocation(line: 93, column: 8, scope: !150)
!164 = !DILocation(line: 96, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !13, line: 94, column: 5)
!166 = !DILocation(line: 96, column: 14, scope: !165)
!167 = !DILocation(line: 97, column: 5, scope: !165)
!168 = !DILocalVariable(name: "source", scope: !169, file: !13, line: 99, type: !45)
!169 = distinct !DILexicalBlock(scope: !150, file: !13, line: 98, column: 5)
!170 = !DILocation(line: 99, column: 17, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !172, file: !13, line: 101, type: !51)
!172 = distinct !DILexicalBlock(scope: !169, file: !13, line: 100, column: 9)
!173 = !DILocation(line: 101, column: 20, scope: !172)
!174 = !DILocation(line: 103, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !13, line: 103, column: 13)
!176 = !DILocation(line: 103, column: 18, scope: !175)
!177 = !DILocation(line: 103, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !13, line: 103, column: 13)
!179 = !DILocation(line: 103, column: 27, scope: !178)
!180 = !DILocation(line: 103, column: 13, scope: !175)
!181 = !DILocation(line: 105, column: 34, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !13, line: 104, column: 13)
!183 = !DILocation(line: 105, column: 27, scope: !182)
!184 = !DILocation(line: 105, column: 17, scope: !182)
!185 = !DILocation(line: 105, column: 22, scope: !182)
!186 = !DILocation(line: 105, column: 25, scope: !182)
!187 = !DILocation(line: 106, column: 13, scope: !182)
!188 = !DILocation(line: 103, column: 35, scope: !178)
!189 = !DILocation(line: 103, column: 13, scope: !178)
!190 = distinct !{!190, !180, !191, !75}
!191 = !DILocation(line: 106, column: 13, scope: !175)
!192 = !DILocation(line: 107, column: 31, scope: !172)
!193 = !DILocation(line: 107, column: 13, scope: !172)
!194 = !DILocation(line: 110, column: 1, scope: !150)
