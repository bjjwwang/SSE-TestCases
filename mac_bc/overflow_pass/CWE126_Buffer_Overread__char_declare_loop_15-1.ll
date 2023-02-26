; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_15_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !30
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !30
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !33
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !33
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !34
  store i8 0, i8* %arrayidx2, align 1, !dbg !35
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store i8* %arraydecay3, i8** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !48, metadata !DIExpression()), !dbg !49
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !50
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !51
  store i8 0, i8* %arrayidx5, align 1, !dbg !52
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !53
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !54
  store i64 %call, i64* %destLen, align 8, !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !59
  %1 = load i64, i64* %destLen, align 8, !dbg !61
  %cmp = icmp ult i64 %0, %1, !dbg !62
  br i1 %cmp, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !64
  %3 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !64
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !64
  %5 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !68
  store i8 %4, i8* %arrayidx8, align 1, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %6, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !76
  store i8 0, i8* %arrayidx9, align 1, !dbg !77
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !78
  call void @printLine(i8* noundef %arraydecay10), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_15_good() #0 !dbg !81 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* noundef null), !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 noundef %conv), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE126_Buffer_Overread__char_declare_loop_15_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE126_Buffer_Overread__char_declare_loop_15_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !111
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !114
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !115
  store i8 0, i8* %arrayidx2, align 1, !dbg !116
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  store i8* %arraydecay3, i8** %data, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !124, metadata !DIExpression()), !dbg !125
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !126
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx5, align 1, !dbg !128
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !129
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !130
  store i64 %call, i64* %destLen, align 8, !dbg !131
  store i64 0, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !134

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !135
  %1 = load i64, i64* %destLen, align 8, !dbg !137
  %cmp = icmp ult i64 %0, %1, !dbg !138
  br i1 %cmp, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !140
  %3 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !140
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !140
  %5 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !144
  store i8 %4, i8* %arrayidx8, align 1, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %6, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !151
  store i8 0, i8* %arrayidx9, align 1, !dbg !152
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  call void @printLine(i8* noundef %arraydecay10), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !163
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !163
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !164
  store i8 0, i8* %arrayidx, align 1, !dbg !165
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !166
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !167
  store i8 0, i8* %arrayidx2, align 1, !dbg !168
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !169
  store i8* %arraydecay3, i8** %data, align 8, !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !176, metadata !DIExpression()), !dbg !177
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !178
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !178
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !179
  store i8 0, i8* %arrayidx5, align 1, !dbg !180
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !181
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !182
  store i64 %call, i64* %destLen, align 8, !dbg !183
  store i64 0, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !186

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !187
  %1 = load i64, i64* %destLen, align 8, !dbg !189
  %cmp = icmp ult i64 %0, %1, !dbg !190
  br i1 %cmp, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !192
  %3 = load i64, i64* %i, align 8, !dbg !194
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !192
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !192
  %5 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !196
  store i8 %4, i8* %arrayidx8, align 1, !dbg !197
  br label %for.inc, !dbg !198

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !199
  %inc = add i64 %6, 1, !dbg !199
  store i64 %inc, i64* %i, align 8, !dbg !199
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !203
  store i8 0, i8* %arrayidx9, align 1, !dbg !204
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !205
  call void @printLine(i8* noundef %arraydecay10), !dbg !206
  ret void, !dbg !207
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_15_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 25, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !21)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 400, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 50)
!24 = !DILocation(line: 26, column: 10, scope: !11)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 800, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 100)
!29 = !DILocation(line: 27, column: 10, scope: !11)
!30 = !DILocation(line: 28, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 5, scope: !11)
!32 = !DILocation(line: 29, column: 25, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 5, scope: !11)
!35 = !DILocation(line: 31, column: 27, scope: !11)
!36 = !DILocation(line: 36, column: 16, scope: !11)
!37 = !DILocation(line: 36, column: 14, scope: !11)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 44, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !41, line: 31, baseType: !42)
!41 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !43, line: 94, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!44 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!45 = !DILocation(line: 44, column: 16, scope: !39)
!46 = !DILocalVariable(name: "destLen", scope: !39, file: !12, line: 44, type: !40)
!47 = !DILocation(line: 44, column: 19, scope: !39)
!48 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 45, type: !26)
!49 = !DILocation(line: 45, column: 14, scope: !39)
!50 = !DILocation(line: 46, column: 9, scope: !39)
!51 = !DILocation(line: 47, column: 9, scope: !39)
!52 = !DILocation(line: 47, column: 21, scope: !39)
!53 = !DILocation(line: 48, column: 26, scope: !39)
!54 = !DILocation(line: 48, column: 19, scope: !39)
!55 = !DILocation(line: 48, column: 17, scope: !39)
!56 = !DILocation(line: 51, column: 16, scope: !57)
!57 = distinct !DILexicalBlock(scope: !39, file: !12, line: 51, column: 9)
!58 = !DILocation(line: 51, column: 14, scope: !57)
!59 = !DILocation(line: 51, column: 21, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 51, column: 9)
!61 = !DILocation(line: 51, column: 25, scope: !60)
!62 = !DILocation(line: 51, column: 23, scope: !60)
!63 = !DILocation(line: 51, column: 9, scope: !57)
!64 = !DILocation(line: 53, column: 23, scope: !65)
!65 = distinct !DILexicalBlock(scope: !60, file: !12, line: 52, column: 9)
!66 = !DILocation(line: 53, column: 28, scope: !65)
!67 = !DILocation(line: 53, column: 18, scope: !65)
!68 = !DILocation(line: 53, column: 13, scope: !65)
!69 = !DILocation(line: 53, column: 21, scope: !65)
!70 = !DILocation(line: 54, column: 9, scope: !65)
!71 = !DILocation(line: 51, column: 35, scope: !60)
!72 = !DILocation(line: 51, column: 9, scope: !60)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 54, column: 9, scope: !57)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 55, column: 9, scope: !39)
!77 = !DILocation(line: 55, column: 21, scope: !39)
!78 = !DILocation(line: 56, column: 19, scope: !39)
!79 = !DILocation(line: 56, column: 9, scope: !39)
!80 = !DILocation(line: 58, column: 1, scope: !11)
!81 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_15_good", scope: !12, file: !12, line: 140, type: !13, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DILocation(line: 142, column: 5, scope: !81)
!83 = !DILocation(line: 143, column: 5, scope: !81)
!84 = !DILocation(line: 144, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 156, type: !86, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!86 = !DISubroutineType(types: !87)
!87 = !{!88, !88, !89}
!88 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 156, type: !88)
!91 = !DILocation(line: 156, column: 14, scope: !85)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 156, type: !89)
!93 = !DILocation(line: 156, column: 27, scope: !85)
!94 = !DILocation(line: 159, column: 22, scope: !85)
!95 = !DILocation(line: 159, column: 12, scope: !85)
!96 = !DILocation(line: 159, column: 5, scope: !85)
!97 = !DILocation(line: 161, column: 5, scope: !85)
!98 = !DILocation(line: 162, column: 5, scope: !85)
!99 = !DILocation(line: 163, column: 5, scope: !85)
!100 = !DILocation(line: 166, column: 5, scope: !85)
!101 = !DILocation(line: 167, column: 5, scope: !85)
!102 = !DILocation(line: 168, column: 5, scope: !85)
!103 = !DILocation(line: 170, column: 5, scope: !85)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 67, type: !17)
!106 = !DILocation(line: 67, column: 12, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 68, type: !21)
!108 = !DILocation(line: 68, column: 10, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 69, type: !26)
!110 = !DILocation(line: 69, column: 10, scope: !104)
!111 = !DILocation(line: 70, column: 5, scope: !104)
!112 = !DILocation(line: 71, column: 5, scope: !104)
!113 = !DILocation(line: 71, column: 25, scope: !104)
!114 = !DILocation(line: 72, column: 5, scope: !104)
!115 = !DILocation(line: 73, column: 5, scope: !104)
!116 = !DILocation(line: 73, column: 27, scope: !104)
!117 = !DILocation(line: 82, column: 16, scope: !104)
!118 = !DILocation(line: 82, column: 14, scope: !104)
!119 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 86, type: !40)
!120 = distinct !DILexicalBlock(scope: !104, file: !12, line: 85, column: 5)
!121 = !DILocation(line: 86, column: 16, scope: !120)
!122 = !DILocalVariable(name: "destLen", scope: !120, file: !12, line: 86, type: !40)
!123 = !DILocation(line: 86, column: 19, scope: !120)
!124 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 87, type: !26)
!125 = !DILocation(line: 87, column: 14, scope: !120)
!126 = !DILocation(line: 88, column: 9, scope: !120)
!127 = !DILocation(line: 89, column: 9, scope: !120)
!128 = !DILocation(line: 89, column: 21, scope: !120)
!129 = !DILocation(line: 90, column: 26, scope: !120)
!130 = !DILocation(line: 90, column: 19, scope: !120)
!131 = !DILocation(line: 90, column: 17, scope: !120)
!132 = !DILocation(line: 93, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !120, file: !12, line: 93, column: 9)
!134 = !DILocation(line: 93, column: 14, scope: !133)
!135 = !DILocation(line: 93, column: 21, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !12, line: 93, column: 9)
!137 = !DILocation(line: 93, column: 25, scope: !136)
!138 = !DILocation(line: 93, column: 23, scope: !136)
!139 = !DILocation(line: 93, column: 9, scope: !133)
!140 = !DILocation(line: 95, column: 23, scope: !141)
!141 = distinct !DILexicalBlock(scope: !136, file: !12, line: 94, column: 9)
!142 = !DILocation(line: 95, column: 28, scope: !141)
!143 = !DILocation(line: 95, column: 18, scope: !141)
!144 = !DILocation(line: 95, column: 13, scope: !141)
!145 = !DILocation(line: 95, column: 21, scope: !141)
!146 = !DILocation(line: 96, column: 9, scope: !141)
!147 = !DILocation(line: 93, column: 35, scope: !136)
!148 = !DILocation(line: 93, column: 9, scope: !136)
!149 = distinct !{!149, !139, !150, !75}
!150 = !DILocation(line: 96, column: 9, scope: !133)
!151 = !DILocation(line: 97, column: 9, scope: !120)
!152 = !DILocation(line: 97, column: 21, scope: !120)
!153 = !DILocation(line: 98, column: 19, scope: !120)
!154 = !DILocation(line: 98, column: 9, scope: !120)
!155 = !DILocation(line: 100, column: 1, scope: !104)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!157 = !DILocalVariable(name: "data", scope: !156, file: !12, line: 105, type: !17)
!158 = !DILocation(line: 105, column: 12, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !12, line: 106, type: !21)
!160 = !DILocation(line: 106, column: 10, scope: !156)
!161 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !12, line: 107, type: !26)
!162 = !DILocation(line: 107, column: 10, scope: !156)
!163 = !DILocation(line: 108, column: 5, scope: !156)
!164 = !DILocation(line: 109, column: 5, scope: !156)
!165 = !DILocation(line: 109, column: 25, scope: !156)
!166 = !DILocation(line: 110, column: 5, scope: !156)
!167 = !DILocation(line: 111, column: 5, scope: !156)
!168 = !DILocation(line: 111, column: 27, scope: !156)
!169 = !DILocation(line: 116, column: 16, scope: !156)
!170 = !DILocation(line: 116, column: 14, scope: !156)
!171 = !DILocalVariable(name: "i", scope: !172, file: !12, line: 124, type: !40)
!172 = distinct !DILexicalBlock(scope: !156, file: !12, line: 123, column: 5)
!173 = !DILocation(line: 124, column: 16, scope: !172)
!174 = !DILocalVariable(name: "destLen", scope: !172, file: !12, line: 124, type: !40)
!175 = !DILocation(line: 124, column: 19, scope: !172)
!176 = !DILocalVariable(name: "dest", scope: !172, file: !12, line: 125, type: !26)
!177 = !DILocation(line: 125, column: 14, scope: !172)
!178 = !DILocation(line: 126, column: 9, scope: !172)
!179 = !DILocation(line: 127, column: 9, scope: !172)
!180 = !DILocation(line: 127, column: 21, scope: !172)
!181 = !DILocation(line: 128, column: 26, scope: !172)
!182 = !DILocation(line: 128, column: 19, scope: !172)
!183 = !DILocation(line: 128, column: 17, scope: !172)
!184 = !DILocation(line: 131, column: 16, scope: !185)
!185 = distinct !DILexicalBlock(scope: !172, file: !12, line: 131, column: 9)
!186 = !DILocation(line: 131, column: 14, scope: !185)
!187 = !DILocation(line: 131, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !12, line: 131, column: 9)
!189 = !DILocation(line: 131, column: 25, scope: !188)
!190 = !DILocation(line: 131, column: 23, scope: !188)
!191 = !DILocation(line: 131, column: 9, scope: !185)
!192 = !DILocation(line: 133, column: 23, scope: !193)
!193 = distinct !DILexicalBlock(scope: !188, file: !12, line: 132, column: 9)
!194 = !DILocation(line: 133, column: 28, scope: !193)
!195 = !DILocation(line: 133, column: 18, scope: !193)
!196 = !DILocation(line: 133, column: 13, scope: !193)
!197 = !DILocation(line: 133, column: 21, scope: !193)
!198 = !DILocation(line: 134, column: 9, scope: !193)
!199 = !DILocation(line: 131, column: 35, scope: !188)
!200 = !DILocation(line: 131, column: 9, scope: !188)
!201 = distinct !{!201, !191, !202, !75}
!202 = !DILocation(line: 134, column: 9, scope: !185)
!203 = !DILocation(line: 135, column: 9, scope: !172)
!204 = !DILocation(line: 135, column: 21, scope: !172)
!205 = !DILocation(line: 136, column: 19, scope: !172)
!206 = !DILocation(line: 136, column: 9, scope: !172)
!207 = !DILocation(line: 138, column: 1, scope: !156)
