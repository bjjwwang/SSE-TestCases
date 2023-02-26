; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_03_bad() #0 !dbg !11 {
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
  store i8* %arraydecay3, i8** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !51
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !52
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !52
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx5, align 1, !dbg !54
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !56
  store i64 %call, i64* %destLen, align 8, !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !61
  %1 = load i64, i64* %destLen, align 8, !dbg !63
  %cmp = icmp ult i64 %0, %1, !dbg !64
  br i1 %cmp, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !66
  %3 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !66
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !66
  %5 = load i64, i64* %i, align 8, !dbg !69
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !70
  store i8 %4, i8* %arrayidx8, align 1, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %6, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !78
  store i8 0, i8* %arrayidx9, align 1, !dbg !79
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !80
  call void @printLine(i8* noundef %arraydecay10), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_declare_loop_03_good() #0 !dbg !83 {
entry:
  call void @goodG2B1(), !dbg !84
  call void @goodG2B2(), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE126_Buffer_Overread__char_declare_loop_03_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__char_declare_loop_03_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !113
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !113
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !114
  store i8 0, i8* %arrayidx, align 1, !dbg !115
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !116
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !117
  store i8 0, i8* %arrayidx2, align 1, !dbg !118
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store i8* %arraydecay3, i8** %data, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !129
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !130
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !131
  store i8 0, i8* %arrayidx5, align 1, !dbg !132
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !133
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !134
  store i64 %call, i64* %destLen, align 8, !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !139
  %1 = load i64, i64* %destLen, align 8, !dbg !141
  %cmp = icmp ult i64 %0, %1, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !144
  %3 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !144
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !144
  %5 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !148
  store i8 %4, i8* %arrayidx8, align 1, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %6, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !155
  store i8 0, i8* %arrayidx9, align 1, !dbg !156
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !157
  call void @printLine(i8* noundef %arraydecay10), !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !160 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !161, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !165, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !167
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !168
  store i8 0, i8* %arrayidx, align 1, !dbg !169
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !170
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !170
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !171
  store i8 0, i8* %arrayidx2, align 1, !dbg !172
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !173
  store i8* %arraydecay3, i8** %data, align 8, !dbg !176
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !182, metadata !DIExpression()), !dbg !183
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !184
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !184
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !185
  store i8 0, i8* %arrayidx5, align 1, !dbg !186
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !187
  %call = call i64 @strlen(i8* noundef %arraydecay6), !dbg !188
  store i64 %call, i64* %destLen, align 8, !dbg !189
  store i64 0, i64* %i, align 8, !dbg !190
  br label %for.cond, !dbg !192

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !193
  %1 = load i64, i64* %destLen, align 8, !dbg !195
  %cmp = icmp ult i64 %0, %1, !dbg !196
  br i1 %cmp, label %for.body, label %for.end, !dbg !197

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !198
  %3 = load i64, i64* %i, align 8, !dbg !200
  %arrayidx7 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !198
  %4 = load i8, i8* %arrayidx7, align 1, !dbg !198
  %5 = load i64, i64* %i, align 8, !dbg !201
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !202
  store i8 %4, i8* %arrayidx8, align 1, !dbg !203
  br label %for.inc, !dbg !204

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !205
  %inc = add i64 %6, 1, !dbg !205
  store i64 %inc, i64* %i, align 8, !dbg !205
  br label %for.cond, !dbg !206, !llvm.loop !207

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !209
  store i8 0, i8* %arrayidx9, align 1, !dbg !210
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !211
  call void @printLine(i8* noundef %arraydecay10), !dbg !212
  ret void, !dbg !213
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_03_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_declare_loop_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !38, file: !12, line: 33, column: 5)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!39 = !DILocation(line: 35, column: 14, scope: !37)
!40 = !DILocalVariable(name: "i", scope: !41, file: !12, line: 38, type: !42)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 31, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !45, line: 94, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 38, column: 16, scope: !41)
!48 = !DILocalVariable(name: "destLen", scope: !41, file: !12, line: 38, type: !42)
!49 = !DILocation(line: 38, column: 19, scope: !41)
!50 = !DILocalVariable(name: "dest", scope: !41, file: !12, line: 39, type: !26)
!51 = !DILocation(line: 39, column: 14, scope: !41)
!52 = !DILocation(line: 40, column: 9, scope: !41)
!53 = !DILocation(line: 41, column: 9, scope: !41)
!54 = !DILocation(line: 41, column: 21, scope: !41)
!55 = !DILocation(line: 42, column: 26, scope: !41)
!56 = !DILocation(line: 42, column: 19, scope: !41)
!57 = !DILocation(line: 42, column: 17, scope: !41)
!58 = !DILocation(line: 45, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !41, file: !12, line: 45, column: 9)
!60 = !DILocation(line: 45, column: 14, scope: !59)
!61 = !DILocation(line: 45, column: 21, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !12, line: 45, column: 9)
!63 = !DILocation(line: 45, column: 25, scope: !62)
!64 = !DILocation(line: 45, column: 23, scope: !62)
!65 = !DILocation(line: 45, column: 9, scope: !59)
!66 = !DILocation(line: 47, column: 23, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !12, line: 46, column: 9)
!68 = !DILocation(line: 47, column: 28, scope: !67)
!69 = !DILocation(line: 47, column: 18, scope: !67)
!70 = !DILocation(line: 47, column: 13, scope: !67)
!71 = !DILocation(line: 47, column: 21, scope: !67)
!72 = !DILocation(line: 48, column: 9, scope: !67)
!73 = !DILocation(line: 45, column: 35, scope: !62)
!74 = !DILocation(line: 45, column: 9, scope: !62)
!75 = distinct !{!75, !65, !76, !77}
!76 = !DILocation(line: 48, column: 9, scope: !59)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 49, column: 9, scope: !41)
!79 = !DILocation(line: 49, column: 21, scope: !41)
!80 = !DILocation(line: 50, column: 19, scope: !41)
!81 = !DILocation(line: 50, column: 9, scope: !41)
!82 = !DILocation(line: 52, column: 1, scope: !11)
!83 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_03_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!84 = !DILocation(line: 129, column: 5, scope: !83)
!85 = !DILocation(line: 130, column: 5, scope: !83)
!86 = !DILocation(line: 131, column: 1, scope: !83)
!87 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !88, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DISubroutineType(types: !89)
!89 = !{!90, !90, !91}
!90 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !87, file: !12, line: 143, type: !90)
!93 = !DILocation(line: 143, column: 14, scope: !87)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !87, file: !12, line: 143, type: !91)
!95 = !DILocation(line: 143, column: 27, scope: !87)
!96 = !DILocation(line: 146, column: 22, scope: !87)
!97 = !DILocation(line: 146, column: 12, scope: !87)
!98 = !DILocation(line: 146, column: 5, scope: !87)
!99 = !DILocation(line: 148, column: 5, scope: !87)
!100 = !DILocation(line: 149, column: 5, scope: !87)
!101 = !DILocation(line: 150, column: 5, scope: !87)
!102 = !DILocation(line: 153, column: 5, scope: !87)
!103 = !DILocation(line: 154, column: 5, scope: !87)
!104 = !DILocation(line: 155, column: 5, scope: !87)
!105 = !DILocation(line: 157, column: 5, scope: !87)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!107 = !DILocalVariable(name: "data", scope: !106, file: !12, line: 61, type: !17)
!108 = !DILocation(line: 61, column: 12, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !12, line: 62, type: !21)
!110 = !DILocation(line: 62, column: 10, scope: !106)
!111 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !12, line: 63, type: !26)
!112 = !DILocation(line: 63, column: 10, scope: !106)
!113 = !DILocation(line: 64, column: 5, scope: !106)
!114 = !DILocation(line: 65, column: 5, scope: !106)
!115 = !DILocation(line: 65, column: 25, scope: !106)
!116 = !DILocation(line: 66, column: 5, scope: !106)
!117 = !DILocation(line: 67, column: 5, scope: !106)
!118 = !DILocation(line: 67, column: 27, scope: !106)
!119 = !DILocation(line: 76, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !12, line: 74, column: 5)
!121 = distinct !DILexicalBlock(scope: !106, file: !12, line: 68, column: 8)
!122 = !DILocation(line: 76, column: 14, scope: !120)
!123 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 79, type: !42)
!124 = distinct !DILexicalBlock(scope: !106, file: !12, line: 78, column: 5)
!125 = !DILocation(line: 79, column: 16, scope: !124)
!126 = !DILocalVariable(name: "destLen", scope: !124, file: !12, line: 79, type: !42)
!127 = !DILocation(line: 79, column: 19, scope: !124)
!128 = !DILocalVariable(name: "dest", scope: !124, file: !12, line: 80, type: !26)
!129 = !DILocation(line: 80, column: 14, scope: !124)
!130 = !DILocation(line: 81, column: 9, scope: !124)
!131 = !DILocation(line: 82, column: 9, scope: !124)
!132 = !DILocation(line: 82, column: 21, scope: !124)
!133 = !DILocation(line: 83, column: 26, scope: !124)
!134 = !DILocation(line: 83, column: 19, scope: !124)
!135 = !DILocation(line: 83, column: 17, scope: !124)
!136 = !DILocation(line: 86, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !12, line: 86, column: 9)
!138 = !DILocation(line: 86, column: 14, scope: !137)
!139 = !DILocation(line: 86, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !12, line: 86, column: 9)
!141 = !DILocation(line: 86, column: 25, scope: !140)
!142 = !DILocation(line: 86, column: 23, scope: !140)
!143 = !DILocation(line: 86, column: 9, scope: !137)
!144 = !DILocation(line: 88, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !12, line: 87, column: 9)
!146 = !DILocation(line: 88, column: 28, scope: !145)
!147 = !DILocation(line: 88, column: 18, scope: !145)
!148 = !DILocation(line: 88, column: 13, scope: !145)
!149 = !DILocation(line: 88, column: 21, scope: !145)
!150 = !DILocation(line: 89, column: 9, scope: !145)
!151 = !DILocation(line: 86, column: 35, scope: !140)
!152 = !DILocation(line: 86, column: 9, scope: !140)
!153 = distinct !{!153, !143, !154, !77}
!154 = !DILocation(line: 89, column: 9, scope: !137)
!155 = !DILocation(line: 90, column: 9, scope: !124)
!156 = !DILocation(line: 90, column: 21, scope: !124)
!157 = !DILocation(line: 91, column: 19, scope: !124)
!158 = !DILocation(line: 91, column: 9, scope: !124)
!159 = !DILocation(line: 93, column: 1, scope: !106)
!160 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 96, type: !13, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!161 = !DILocalVariable(name: "data", scope: !160, file: !12, line: 98, type: !17)
!162 = !DILocation(line: 98, column: 12, scope: !160)
!163 = !DILocalVariable(name: "dataBadBuffer", scope: !160, file: !12, line: 99, type: !21)
!164 = !DILocation(line: 99, column: 10, scope: !160)
!165 = !DILocalVariable(name: "dataGoodBuffer", scope: !160, file: !12, line: 100, type: !26)
!166 = !DILocation(line: 100, column: 10, scope: !160)
!167 = !DILocation(line: 101, column: 5, scope: !160)
!168 = !DILocation(line: 102, column: 5, scope: !160)
!169 = !DILocation(line: 102, column: 25, scope: !160)
!170 = !DILocation(line: 103, column: 5, scope: !160)
!171 = !DILocation(line: 104, column: 5, scope: !160)
!172 = !DILocation(line: 104, column: 27, scope: !160)
!173 = !DILocation(line: 108, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !12, line: 106, column: 5)
!175 = distinct !DILexicalBlock(scope: !160, file: !12, line: 105, column: 8)
!176 = !DILocation(line: 108, column: 14, scope: !174)
!177 = !DILocalVariable(name: "i", scope: !178, file: !12, line: 111, type: !42)
!178 = distinct !DILexicalBlock(scope: !160, file: !12, line: 110, column: 5)
!179 = !DILocation(line: 111, column: 16, scope: !178)
!180 = !DILocalVariable(name: "destLen", scope: !178, file: !12, line: 111, type: !42)
!181 = !DILocation(line: 111, column: 19, scope: !178)
!182 = !DILocalVariable(name: "dest", scope: !178, file: !12, line: 112, type: !26)
!183 = !DILocation(line: 112, column: 14, scope: !178)
!184 = !DILocation(line: 113, column: 9, scope: !178)
!185 = !DILocation(line: 114, column: 9, scope: !178)
!186 = !DILocation(line: 114, column: 21, scope: !178)
!187 = !DILocation(line: 115, column: 26, scope: !178)
!188 = !DILocation(line: 115, column: 19, scope: !178)
!189 = !DILocation(line: 115, column: 17, scope: !178)
!190 = !DILocation(line: 118, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !178, file: !12, line: 118, column: 9)
!192 = !DILocation(line: 118, column: 14, scope: !191)
!193 = !DILocation(line: 118, column: 21, scope: !194)
!194 = distinct !DILexicalBlock(scope: !191, file: !12, line: 118, column: 9)
!195 = !DILocation(line: 118, column: 25, scope: !194)
!196 = !DILocation(line: 118, column: 23, scope: !194)
!197 = !DILocation(line: 118, column: 9, scope: !191)
!198 = !DILocation(line: 120, column: 23, scope: !199)
!199 = distinct !DILexicalBlock(scope: !194, file: !12, line: 119, column: 9)
!200 = !DILocation(line: 120, column: 28, scope: !199)
!201 = !DILocation(line: 120, column: 18, scope: !199)
!202 = !DILocation(line: 120, column: 13, scope: !199)
!203 = !DILocation(line: 120, column: 21, scope: !199)
!204 = !DILocation(line: 121, column: 9, scope: !199)
!205 = !DILocation(line: 118, column: 35, scope: !194)
!206 = !DILocation(line: 118, column: 9, scope: !194)
!207 = distinct !{!207, !197, !208, !77}
!208 = !DILocation(line: 121, column: 9, scope: !191)
!209 = !DILocation(line: 122, column: 9, scope: !178)
!210 = !DILocation(line: 122, column: 21, scope: !178)
!211 = !DILocation(line: 123, column: 19, scope: !178)
!212 = !DILocation(line: 123, column: 9, scope: !178)
!213 = !DILocation(line: 125, column: 1, scope: !160)
