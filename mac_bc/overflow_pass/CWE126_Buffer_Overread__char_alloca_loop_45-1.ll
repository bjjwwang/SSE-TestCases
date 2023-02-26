; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE126_Buffer_Overread__char_alloca_loop_45_badData = internal global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE126_Buffer_Overread__char_alloca_loop_45_goodG2BData = internal global i8* null, align 8, !dbg !9

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_45_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 50, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 100, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !31
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !31
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !32
  store i8 0, i8* %arrayidx, align 1, !dbg !33
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !34
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !34
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !35
  store i8 0, i8* %arrayidx2, align 1, !dbg !36
  %10 = load i8*, i8** %dataBadBuffer, align 8, !dbg !37
  store i8* %10, i8** %data, align 8, !dbg !38
  %11 = load i8*, i8** %data, align 8, !dbg !39
  store i8* %11, i8** @CWE126_Buffer_Overread__char_alloca_loop_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* noundef null), !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 noundef %conv), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE126_Buffer_Overread__char_alloca_loop_45_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE126_Buffer_Overread__char_alloca_loop_45_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_loop_45_badData, align 8, !dbg !68
  store i8* %0, i8** %data, align 8, !dbg !67
  call void @llvm.dbg.declare(metadata i64* %i, metadata !69, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !79, metadata !DIExpression()), !dbg !83
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !84
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx, align 1, !dbg !86
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !87
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !88
  store i64 %call, i64* %destLen, align 8, !dbg !89
  store i64 0, i64* %i, align 8, !dbg !90
  br label %for.cond, !dbg !92

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !93
  %2 = load i64, i64* %destLen, align 8, !dbg !95
  %cmp = icmp ult i64 %1, %2, !dbg !96
  br i1 %cmp, label %for.body, label %for.end, !dbg !97

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !98
  %4 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !98
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !98
  %6 = load i64, i64* %i, align 8, !dbg !101
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !102
  store i8 %5, i8* %arrayidx3, align 1, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !105
  %inc = add i64 %7, 1, !dbg !105
  store i64 %inc, i64* %i, align 8, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !110
  store i8 0, i8* %arrayidx4, align 1, !dbg !111
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !112
  call void @printLine(i8* noundef %arraydecay5), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

declare i64 @strlen(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 50, align 16, !dbg !120
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %1 = alloca i8, i64 100, align 16, !dbg !123
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !122
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !124
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !124
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !124
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !124
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !127
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !127
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !128
  store i8 0, i8* %arrayidx2, align 1, !dbg !129
  %10 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !130
  store i8* %10, i8** %data, align 8, !dbg !131
  %11 = load i8*, i8** %data, align 8, !dbg !132
  store i8* %11, i8** @CWE126_Buffer_Overread__char_alloca_loop_45_goodG2BData, align 8, !dbg !133
  call void @goodG2BSink(), !dbg !134
  ret void, !dbg !135
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !136 {
entry:
  %data = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = load i8*, i8** @CWE126_Buffer_Overread__char_alloca_loop_45_goodG2BData, align 8, !dbg !139
  store i8* %0, i8** %data, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !147
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !148
  store i8 0, i8* %arrayidx, align 1, !dbg !149
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  %call = call i64 @strlen(i8* noundef %arraydecay1), !dbg !151
  store i64 %call, i64* %destLen, align 8, !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !156
  %2 = load i64, i64* %destLen, align 8, !dbg !158
  %cmp = icmp ult i64 %1, %2, !dbg !159
  br i1 %cmp, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %data, align 8, !dbg !161
  %4 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx2 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !161
  %5 = load i8, i8* %arrayidx2, align 1, !dbg !161
  %6 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %6, !dbg !165
  store i8 %5, i8* %arrayidx3, align 1, !dbg !166
  br label %for.inc, !dbg !167

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !168
  %inc = add i64 %7, 1, !dbg !168
  store i64 %inc, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !169, !llvm.loop !170

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !172
  store i8 0, i8* %arrayidx4, align 1, !dbg !173
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !174
  call void @printLine(i8* noundef %arraydecay5), !dbg !175
  ret void, !dbg !176
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_alloca_loop_45_badData", scope: !2, file: !11, line: 21, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "CWE126_Buffer_Overread__char_alloca_loop_45_goodG2BData", scope: !2, file: !11, line: 22, type: !5, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_45_bad", scope: !11, file: !11, line: 46, type: !20, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !{}
!23 = !DILocalVariable(name: "data", scope: !19, file: !11, line: 48, type: !5)
!24 = !DILocation(line: 48, column: 12, scope: !19)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !11, line: 49, type: !5)
!26 = !DILocation(line: 49, column: 12, scope: !19)
!27 = !DILocation(line: 49, column: 36, scope: !19)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !11, line: 50, type: !5)
!29 = !DILocation(line: 50, column: 12, scope: !19)
!30 = !DILocation(line: 50, column: 37, scope: !19)
!31 = !DILocation(line: 51, column: 5, scope: !19)
!32 = !DILocation(line: 52, column: 5, scope: !19)
!33 = !DILocation(line: 52, column: 25, scope: !19)
!34 = !DILocation(line: 53, column: 5, scope: !19)
!35 = !DILocation(line: 54, column: 5, scope: !19)
!36 = !DILocation(line: 54, column: 27, scope: !19)
!37 = !DILocation(line: 56, column: 12, scope: !19)
!38 = !DILocation(line: 56, column: 10, scope: !19)
!39 = !DILocation(line: 57, column: 59, scope: !19)
!40 = !DILocation(line: 57, column: 57, scope: !19)
!41 = !DILocation(line: 58, column: 5, scope: !19)
!42 = !DILocation(line: 59, column: 1, scope: !19)
!43 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_45_good", scope: !11, file: !11, line: 101, type: !20, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!44 = !DILocation(line: 103, column: 5, scope: !43)
!45 = !DILocation(line: 104, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 115, type: !47, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !22)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !11, line: 115, type: !49)
!52 = !DILocation(line: 115, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !11, line: 115, type: !50)
!54 = !DILocation(line: 115, column: 27, scope: !46)
!55 = !DILocation(line: 118, column: 22, scope: !46)
!56 = !DILocation(line: 118, column: 12, scope: !46)
!57 = !DILocation(line: 118, column: 5, scope: !46)
!58 = !DILocation(line: 120, column: 5, scope: !46)
!59 = !DILocation(line: 121, column: 5, scope: !46)
!60 = !DILocation(line: 122, column: 5, scope: !46)
!61 = !DILocation(line: 125, column: 5, scope: !46)
!62 = !DILocation(line: 126, column: 5, scope: !46)
!63 = !DILocation(line: 127, column: 5, scope: !46)
!64 = !DILocation(line: 129, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "badSink", scope: !11, file: !11, line: 26, type: !20, scopeLine: 27, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!66 = !DILocalVariable(name: "data", scope: !65, file: !11, line: 28, type: !5)
!67 = !DILocation(line: 28, column: 12, scope: !65)
!68 = !DILocation(line: 28, column: 19, scope: !65)
!69 = !DILocalVariable(name: "i", scope: !70, file: !11, line: 30, type: !71)
!70 = distinct !DILexicalBlock(scope: !65, file: !11, line: 29, column: 5)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !72, line: 31, baseType: !73)
!72 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !74, line: 94, baseType: !75)
!74 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!75 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!76 = !DILocation(line: 30, column: 16, scope: !70)
!77 = !DILocalVariable(name: "destLen", scope: !70, file: !11, line: 30, type: !71)
!78 = !DILocation(line: 30, column: 19, scope: !70)
!79 = !DILocalVariable(name: "dest", scope: !70, file: !11, line: 31, type: !80)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 100)
!83 = !DILocation(line: 31, column: 14, scope: !70)
!84 = !DILocation(line: 32, column: 9, scope: !70)
!85 = !DILocation(line: 33, column: 9, scope: !70)
!86 = !DILocation(line: 33, column: 21, scope: !70)
!87 = !DILocation(line: 34, column: 26, scope: !70)
!88 = !DILocation(line: 34, column: 19, scope: !70)
!89 = !DILocation(line: 34, column: 17, scope: !70)
!90 = !DILocation(line: 37, column: 16, scope: !91)
!91 = distinct !DILexicalBlock(scope: !70, file: !11, line: 37, column: 9)
!92 = !DILocation(line: 37, column: 14, scope: !91)
!93 = !DILocation(line: 37, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !11, line: 37, column: 9)
!95 = !DILocation(line: 37, column: 25, scope: !94)
!96 = !DILocation(line: 37, column: 23, scope: !94)
!97 = !DILocation(line: 37, column: 9, scope: !91)
!98 = !DILocation(line: 39, column: 23, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !11, line: 38, column: 9)
!100 = !DILocation(line: 39, column: 28, scope: !99)
!101 = !DILocation(line: 39, column: 18, scope: !99)
!102 = !DILocation(line: 39, column: 13, scope: !99)
!103 = !DILocation(line: 39, column: 21, scope: !99)
!104 = !DILocation(line: 40, column: 9, scope: !99)
!105 = !DILocation(line: 37, column: 35, scope: !94)
!106 = !DILocation(line: 37, column: 9, scope: !94)
!107 = distinct !{!107, !97, !108, !109}
!108 = !DILocation(line: 40, column: 9, scope: !91)
!109 = !{!"llvm.loop.mustprogress"}
!110 = !DILocation(line: 41, column: 9, scope: !70)
!111 = !DILocation(line: 41, column: 21, scope: !70)
!112 = !DILocation(line: 42, column: 19, scope: !70)
!113 = !DILocation(line: 42, column: 9, scope: !70)
!114 = !DILocation(line: 44, column: 1, scope: !65)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !11, file: !11, line: 86, type: !20, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!116 = !DILocalVariable(name: "data", scope: !115, file: !11, line: 88, type: !5)
!117 = !DILocation(line: 88, column: 12, scope: !115)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !11, line: 89, type: !5)
!119 = !DILocation(line: 89, column: 12, scope: !115)
!120 = !DILocation(line: 89, column: 36, scope: !115)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !11, line: 90, type: !5)
!122 = !DILocation(line: 90, column: 12, scope: !115)
!123 = !DILocation(line: 90, column: 37, scope: !115)
!124 = !DILocation(line: 91, column: 5, scope: !115)
!125 = !DILocation(line: 92, column: 5, scope: !115)
!126 = !DILocation(line: 92, column: 25, scope: !115)
!127 = !DILocation(line: 93, column: 5, scope: !115)
!128 = !DILocation(line: 94, column: 5, scope: !115)
!129 = !DILocation(line: 94, column: 27, scope: !115)
!130 = !DILocation(line: 96, column: 12, scope: !115)
!131 = !DILocation(line: 96, column: 10, scope: !115)
!132 = !DILocation(line: 97, column: 63, scope: !115)
!133 = !DILocation(line: 97, column: 61, scope: !115)
!134 = !DILocation(line: 98, column: 5, scope: !115)
!135 = !DILocation(line: 99, column: 1, scope: !115)
!136 = distinct !DISubprogram(name: "goodG2BSink", scope: !11, file: !11, line: 66, type: !20, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !22)
!137 = !DILocalVariable(name: "data", scope: !136, file: !11, line: 68, type: !5)
!138 = !DILocation(line: 68, column: 12, scope: !136)
!139 = !DILocation(line: 68, column: 19, scope: !136)
!140 = !DILocalVariable(name: "i", scope: !141, file: !11, line: 70, type: !71)
!141 = distinct !DILexicalBlock(scope: !136, file: !11, line: 69, column: 5)
!142 = !DILocation(line: 70, column: 16, scope: !141)
!143 = !DILocalVariable(name: "destLen", scope: !141, file: !11, line: 70, type: !71)
!144 = !DILocation(line: 70, column: 19, scope: !141)
!145 = !DILocalVariable(name: "dest", scope: !141, file: !11, line: 71, type: !80)
!146 = !DILocation(line: 71, column: 14, scope: !141)
!147 = !DILocation(line: 72, column: 9, scope: !141)
!148 = !DILocation(line: 73, column: 9, scope: !141)
!149 = !DILocation(line: 73, column: 21, scope: !141)
!150 = !DILocation(line: 74, column: 26, scope: !141)
!151 = !DILocation(line: 74, column: 19, scope: !141)
!152 = !DILocation(line: 74, column: 17, scope: !141)
!153 = !DILocation(line: 77, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !141, file: !11, line: 77, column: 9)
!155 = !DILocation(line: 77, column: 14, scope: !154)
!156 = !DILocation(line: 77, column: 21, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !11, line: 77, column: 9)
!158 = !DILocation(line: 77, column: 25, scope: !157)
!159 = !DILocation(line: 77, column: 23, scope: !157)
!160 = !DILocation(line: 77, column: 9, scope: !154)
!161 = !DILocation(line: 79, column: 23, scope: !162)
!162 = distinct !DILexicalBlock(scope: !157, file: !11, line: 78, column: 9)
!163 = !DILocation(line: 79, column: 28, scope: !162)
!164 = !DILocation(line: 79, column: 18, scope: !162)
!165 = !DILocation(line: 79, column: 13, scope: !162)
!166 = !DILocation(line: 79, column: 21, scope: !162)
!167 = !DILocation(line: 80, column: 9, scope: !162)
!168 = !DILocation(line: 77, column: 35, scope: !157)
!169 = !DILocation(line: 77, column: 9, scope: !157)
!170 = distinct !{!170, !160, !171, !109}
!171 = !DILocation(line: 80, column: 9, scope: !154)
!172 = !DILocation(line: 81, column: 9, scope: !141)
!173 = !DILocation(line: 81, column: 21, scope: !141)
!174 = !DILocation(line: 82, column: 19, scope: !141)
!175 = !DILocation(line: 82, column: 9, scope: !141)
!176 = !DILocation(line: 84, column: 1, scope: !136)
