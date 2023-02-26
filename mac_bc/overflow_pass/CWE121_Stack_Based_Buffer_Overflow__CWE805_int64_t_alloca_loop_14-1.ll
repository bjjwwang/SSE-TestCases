; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_bad() #0 !dbg !15 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = alloca i8, i64 400, align 16, !dbg !24
  %1 = bitcast i8* %0 to i64*, !dbg !25
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !23
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = alloca i8, i64 800, align 16, !dbg !28
  %3 = bitcast i8* %2 to i64*, !dbg !29
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !27
  %4 = load i32, i32* @globalFive, align 4, !dbg !30
  %cmp = icmp eq i32 %4, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataBadBuffer, align 8, !dbg !34
  store i64* %5, i64** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !55
  %cmp1 = icmp ult i64 %7, 100, !dbg !57
  br i1 %cmp1, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !61
  %9 = load i64, i64* %arrayidx, align 8, !dbg !61
  %10 = load i64*, i64** %data, align 8, !dbg !62
  %11 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !62
  store i64 %9, i64* %arrayidx2, align 8, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %12, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !71
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !71
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !71
  call void @printLongLongLine(i64 noundef %14), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLongLongLine(i64 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* noundef null), !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 noundef %conv), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 400, align 16, !dbg !104
  %1 = bitcast i8* %0 to i64*, !dbg !105
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = alloca i8, i64 800, align 16, !dbg !108
  %3 = bitcast i8* %2 to i64*, !dbg !109
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !107
  %4 = load i32, i32* @globalFive, align 4, !dbg !110
  %cmp = icmp ne i32 %4, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !117
  store i64* %5, i64** %data, align 8, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !122
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !129
  %cmp1 = icmp ult i64 %7, 100, !dbg !131
  br i1 %cmp1, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !135
  %9 = load i64, i64* %arrayidx, align 8, !dbg !135
  %10 = load i64*, i64** %data, align 8, !dbg !136
  %11 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !136
  store i64 %9, i64* %arrayidx2, align 8, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %12, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !144
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !144
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !144
  call void @printLongLongLine(i64 noundef %14), !dbg !145
  ret void, !dbg !146
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca i64*, align 8
  %dataGoodBuffer = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i64** %dataBadBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %0 = alloca i8, i64 400, align 16, !dbg !152
  %1 = bitcast i8* %0 to i64*, !dbg !153
  store i64* %1, i64** %dataBadBuffer, align 8, !dbg !151
  call void @llvm.dbg.declare(metadata i64** %dataGoodBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  %2 = alloca i8, i64 800, align 16, !dbg !156
  %3 = bitcast i8* %2 to i64*, !dbg !157
  store i64* %3, i64** %dataGoodBuffer, align 8, !dbg !155
  %4 = load i32, i32* @globalFive, align 4, !dbg !158
  %cmp = icmp eq i32 %4, 5, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %5 = load i64*, i64** %dataGoodBuffer, align 8, !dbg !162
  store i64* %5, i64** %data, align 8, !dbg !164
  br label %if.end, !dbg !165

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !166, metadata !DIExpression()), !dbg !168
  %6 = bitcast [100 x i64]* %source to i8*, !dbg !168
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 800, i1 false), !dbg !168
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %7 = load i64, i64* %i, align 8, !dbg !175
  %cmp1 = icmp ult i64 %7, 100, !dbg !177
  br i1 %cmp1, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 %8, !dbg !181
  %9 = load i64, i64* %arrayidx, align 8, !dbg !181
  %10 = load i64*, i64** %data, align 8, !dbg !182
  %11 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx2 = getelementptr inbounds i64, i64* %10, i64 %11, !dbg !182
  store i64 %9, i64* %arrayidx2, align 8, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %12, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %13 = load i64*, i64** %data, align 8, !dbg !190
  %arrayidx3 = getelementptr inbounds i64, i64* %13, i64 0, !dbg !190
  %14 = load i64, i64* %arrayidx3, align 8, !dbg !190
  call void @printLongLongLine(i64 noundef %14), !dbg !191
  ret void, !dbg !192
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !7}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !5, line: 30, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!6 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"Homebrew clang version 14.0.6"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_bad", scope: !16, file: !16, line: 21, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 23, type: !3)
!21 = !DILocation(line: 23, column: 15, scope: !15)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 24, type: !3)
!23 = !DILocation(line: 24, column: 15, scope: !15)
!24 = !DILocation(line: 24, column: 42, scope: !15)
!25 = !DILocation(line: 24, column: 31, scope: !15)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 25, type: !3)
!27 = !DILocation(line: 25, column: 15, scope: !15)
!28 = !DILocation(line: 25, column: 43, scope: !15)
!29 = !DILocation(line: 25, column: 32, scope: !15)
!30 = !DILocation(line: 26, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 26, column: 8)
!32 = !DILocation(line: 26, column: 18, scope: !31)
!33 = !DILocation(line: 26, column: 8, scope: !15)
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !16, line: 27, column: 5)
!36 = !DILocation(line: 30, column: 14, scope: !35)
!37 = !DILocation(line: 31, column: 5, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 33, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 32, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 33, column: 17, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !16, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !16, line: 34, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !49, line: 94, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 35, column: 20, scope: !45)
!52 = !DILocation(line: 37, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !16, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 18, scope: !53)
!55 = !DILocation(line: 37, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !16, line: 37, column: 13)
!57 = !DILocation(line: 37, column: 27, scope: !56)
!58 = !DILocation(line: 37, column: 13, scope: !53)
!59 = !DILocation(line: 39, column: 34, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !16, line: 38, column: 13)
!61 = !DILocation(line: 39, column: 27, scope: !60)
!62 = !DILocation(line: 39, column: 17, scope: !60)
!63 = !DILocation(line: 39, column: 22, scope: !60)
!64 = !DILocation(line: 39, column: 25, scope: !60)
!65 = !DILocation(line: 40, column: 13, scope: !60)
!66 = !DILocation(line: 37, column: 35, scope: !56)
!67 = !DILocation(line: 37, column: 13, scope: !56)
!68 = distinct !{!68, !58, !69, !70}
!69 = !DILocation(line: 40, column: 13, scope: !53)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 41, column: 31, scope: !45)
!72 = !DILocation(line: 41, column: 13, scope: !45)
!73 = !DILocation(line: 44, column: 1, scope: !15)
!74 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_alloca_loop_14_good", scope: !16, file: !16, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!75 = !DILocation(line: 107, column: 5, scope: !74)
!76 = !DILocation(line: 108, column: 5, scope: !74)
!77 = !DILocation(line: 109, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 121, type: !79, scopeLine: 122, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!79 = !DISubroutineType(types: !80)
!80 = !{!81, !81, !82}
!81 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !16, line: 121, type: !81)
!86 = !DILocation(line: 121, column: 14, scope: !78)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !16, line: 121, type: !82)
!88 = !DILocation(line: 121, column: 27, scope: !78)
!89 = !DILocation(line: 124, column: 22, scope: !78)
!90 = !DILocation(line: 124, column: 12, scope: !78)
!91 = !DILocation(line: 124, column: 5, scope: !78)
!92 = !DILocation(line: 126, column: 5, scope: !78)
!93 = !DILocation(line: 127, column: 5, scope: !78)
!94 = !DILocation(line: 128, column: 5, scope: !78)
!95 = !DILocation(line: 131, column: 5, scope: !78)
!96 = !DILocation(line: 132, column: 5, scope: !78)
!97 = !DILocation(line: 133, column: 5, scope: !78)
!98 = !DILocation(line: 135, column: 5, scope: !78)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 51, type: !17, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!100 = !DILocalVariable(name: "data", scope: !99, file: !16, line: 53, type: !3)
!101 = !DILocation(line: 53, column: 15, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !16, line: 54, type: !3)
!103 = !DILocation(line: 54, column: 15, scope: !99)
!104 = !DILocation(line: 54, column: 42, scope: !99)
!105 = !DILocation(line: 54, column: 31, scope: !99)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !16, line: 55, type: !3)
!107 = !DILocation(line: 55, column: 15, scope: !99)
!108 = !DILocation(line: 55, column: 43, scope: !99)
!109 = !DILocation(line: 55, column: 32, scope: !99)
!110 = !DILocation(line: 56, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !99, file: !16, line: 56, column: 8)
!112 = !DILocation(line: 56, column: 18, scope: !111)
!113 = !DILocation(line: 56, column: 8, scope: !99)
!114 = !DILocation(line: 59, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !16, line: 57, column: 5)
!116 = !DILocation(line: 60, column: 5, scope: !115)
!117 = !DILocation(line: 64, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !16, line: 62, column: 5)
!119 = !DILocation(line: 64, column: 14, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !121, file: !16, line: 67, type: !40)
!121 = distinct !DILexicalBlock(scope: !99, file: !16, line: 66, column: 5)
!122 = !DILocation(line: 67, column: 17, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !16, line: 69, type: !46)
!124 = distinct !DILexicalBlock(scope: !121, file: !16, line: 68, column: 9)
!125 = !DILocation(line: 69, column: 20, scope: !124)
!126 = !DILocation(line: 71, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !16, line: 71, column: 13)
!128 = !DILocation(line: 71, column: 18, scope: !127)
!129 = !DILocation(line: 71, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !16, line: 71, column: 13)
!131 = !DILocation(line: 71, column: 27, scope: !130)
!132 = !DILocation(line: 71, column: 13, scope: !127)
!133 = !DILocation(line: 73, column: 34, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !16, line: 72, column: 13)
!135 = !DILocation(line: 73, column: 27, scope: !134)
!136 = !DILocation(line: 73, column: 17, scope: !134)
!137 = !DILocation(line: 73, column: 22, scope: !134)
!138 = !DILocation(line: 73, column: 25, scope: !134)
!139 = !DILocation(line: 74, column: 13, scope: !134)
!140 = !DILocation(line: 71, column: 35, scope: !130)
!141 = !DILocation(line: 71, column: 13, scope: !130)
!142 = distinct !{!142, !132, !143, !70}
!143 = !DILocation(line: 74, column: 13, scope: !127)
!144 = !DILocation(line: 75, column: 31, scope: !124)
!145 = !DILocation(line: 75, column: 13, scope: !124)
!146 = !DILocation(line: 78, column: 1, scope: !99)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 81, type: !17, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!148 = !DILocalVariable(name: "data", scope: !147, file: !16, line: 83, type: !3)
!149 = !DILocation(line: 83, column: 15, scope: !147)
!150 = !DILocalVariable(name: "dataBadBuffer", scope: !147, file: !16, line: 84, type: !3)
!151 = !DILocation(line: 84, column: 15, scope: !147)
!152 = !DILocation(line: 84, column: 42, scope: !147)
!153 = !DILocation(line: 84, column: 31, scope: !147)
!154 = !DILocalVariable(name: "dataGoodBuffer", scope: !147, file: !16, line: 85, type: !3)
!155 = !DILocation(line: 85, column: 15, scope: !147)
!156 = !DILocation(line: 85, column: 43, scope: !147)
!157 = !DILocation(line: 85, column: 32, scope: !147)
!158 = !DILocation(line: 86, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !147, file: !16, line: 86, column: 8)
!160 = !DILocation(line: 86, column: 18, scope: !159)
!161 = !DILocation(line: 86, column: 8, scope: !147)
!162 = !DILocation(line: 89, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !16, line: 87, column: 5)
!164 = !DILocation(line: 89, column: 14, scope: !163)
!165 = !DILocation(line: 90, column: 5, scope: !163)
!166 = !DILocalVariable(name: "source", scope: !167, file: !16, line: 92, type: !40)
!167 = distinct !DILexicalBlock(scope: !147, file: !16, line: 91, column: 5)
!168 = !DILocation(line: 92, column: 17, scope: !167)
!169 = !DILocalVariable(name: "i", scope: !170, file: !16, line: 94, type: !46)
!170 = distinct !DILexicalBlock(scope: !167, file: !16, line: 93, column: 9)
!171 = !DILocation(line: 94, column: 20, scope: !170)
!172 = !DILocation(line: 96, column: 20, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !16, line: 96, column: 13)
!174 = !DILocation(line: 96, column: 18, scope: !173)
!175 = !DILocation(line: 96, column: 25, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !16, line: 96, column: 13)
!177 = !DILocation(line: 96, column: 27, scope: !176)
!178 = !DILocation(line: 96, column: 13, scope: !173)
!179 = !DILocation(line: 98, column: 34, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !16, line: 97, column: 13)
!181 = !DILocation(line: 98, column: 27, scope: !180)
!182 = !DILocation(line: 98, column: 17, scope: !180)
!183 = !DILocation(line: 98, column: 22, scope: !180)
!184 = !DILocation(line: 98, column: 25, scope: !180)
!185 = !DILocation(line: 99, column: 13, scope: !180)
!186 = !DILocation(line: 96, column: 35, scope: !176)
!187 = !DILocation(line: 96, column: 13, scope: !176)
!188 = distinct !{!188, !178, !189, !70}
!189 = !DILocation(line: 99, column: 13, scope: !173)
!190 = !DILocation(line: 100, column: 31, scope: !170)
!191 = !DILocation(line: 100, column: 13, scope: !170)
!192 = !DILocation(line: 103, column: 1, scope: !147)
