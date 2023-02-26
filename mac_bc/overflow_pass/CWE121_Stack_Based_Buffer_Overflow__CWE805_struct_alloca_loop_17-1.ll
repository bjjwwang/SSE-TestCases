; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_bad() #0 !dbg !19 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i1 = alloca i64, align 8
  %i9 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !33
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp slt i32 %4, 1, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !43
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %6, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !58, metadata !DIExpression()), !dbg !65
  store i64 0, i64* %i1, align 8, !dbg !66
  br label %for.cond2, !dbg !68

for.cond2:                                        ; preds = %for.inc6, %for.end
  %7 = load i64, i64* %i1, align 8, !dbg !69
  %cmp3 = icmp ult i64 %7, 100, !dbg !71
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !72

for.body4:                                        ; preds = %for.cond2
  %8 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !75
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !76
  store i32 0, i32* %intOne, align 8, !dbg !77
  %9 = load i64, i64* %i1, align 8, !dbg !78
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !79
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !80
  store i32 0, i32* %intTwo, align 4, !dbg !81
  br label %for.inc6, !dbg !82

for.inc6:                                         ; preds = %for.body4
  %10 = load i64, i64* %i1, align 8, !dbg !83
  %inc7 = add i64 %10, 1, !dbg !83
  store i64 %inc7, i64* %i1, align 8, !dbg !83
  br label %for.cond2, !dbg !84, !llvm.loop !85

for.end8:                                         ; preds = %for.cond2
  call void @llvm.dbg.declare(metadata i64* %i9, metadata !87, metadata !DIExpression()), !dbg !89
  store i64 0, i64* %i9, align 8, !dbg !90
  br label %for.cond10, !dbg !92

for.cond10:                                       ; preds = %for.inc15, %for.end8
  %11 = load i64, i64* %i9, align 8, !dbg !93
  %cmp11 = icmp ult i64 %11, 100, !dbg !95
  br i1 %cmp11, label %for.body12, label %for.end17, !dbg !96

for.body12:                                       ; preds = %for.cond10
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !97
  %13 = load i64, i64* %i9, align 8, !dbg !99
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !97
  %14 = load i64, i64* %i9, align 8, !dbg !100
  %arrayidx14 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !101
  %15 = bitcast %struct._twoIntsStruct* %arrayidx13 to i8*, !dbg !101
  %16 = bitcast %struct._twoIntsStruct* %arrayidx14 to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !101
  br label %for.inc15, !dbg !102

for.inc15:                                        ; preds = %for.body12
  %17 = load i64, i64* %i9, align 8, !dbg !103
  %inc16 = add i64 %17, 1, !dbg !103
  store i64 %inc16, i64* %i9, align 8, !dbg !103
  br label %for.cond10, !dbg !104, !llvm.loop !105

for.end17:                                        ; preds = %for.cond10
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !107
  %arrayidx18 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !107
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx18), !dbg !108
  ret void, !dbg !109
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_good() #0 !dbg !110 {
entry:
  call void @goodG2B(), !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !119, metadata !DIExpression()), !dbg !120
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !121, metadata !DIExpression()), !dbg !122
  %call = call i64 @time(i64* noundef null), !dbg !123
  %conv = trunc i64 %call to i32, !dbg !124
  call void @srand(i32 noundef %conv), !dbg !125
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !126
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_good(), !dbg !127
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !128
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !129
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_bad(), !dbg !130
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !131
  ret i32 0, !dbg !132
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !133 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i8 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %0 = alloca i8, i64 400, align 16, !dbg !140
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !141
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %2 = alloca i8, i64 800, align 16, !dbg !144
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !145
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !143
  store i32 0, i32* %h, align 4, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !149
  %cmp = icmp slt i32 %4, 1, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !153
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !157
  %inc = add nsw i32 %6, 1, !dbg !157
  store i32 %inc, i32* %h, align 4, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond1, !dbg !169

for.cond1:                                        ; preds = %for.inc5, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !170
  %cmp2 = icmp ult i64 %7, 100, !dbg !172
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !173

for.body3:                                        ; preds = %for.cond1
  %8 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !176
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !177
  store i32 0, i32* %intOne, align 8, !dbg !178
  %9 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !180
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !181
  store i32 0, i32* %intTwo, align 4, !dbg !182
  br label %for.inc5, !dbg !183

for.inc5:                                         ; preds = %for.body3
  %10 = load i64, i64* %i, align 8, !dbg !184
  %inc6 = add i64 %10, 1, !dbg !184
  store i64 %inc6, i64* %i, align 8, !dbg !184
  br label %for.cond1, !dbg !185, !llvm.loop !186

for.end7:                                         ; preds = %for.cond1
  call void @llvm.dbg.declare(metadata i64* %i8, metadata !188, metadata !DIExpression()), !dbg !190
  store i64 0, i64* %i8, align 8, !dbg !191
  br label %for.cond9, !dbg !193

for.cond9:                                        ; preds = %for.inc14, %for.end7
  %11 = load i64, i64* %i8, align 8, !dbg !194
  %cmp10 = icmp ult i64 %11, 100, !dbg !196
  br i1 %cmp10, label %for.body11, label %for.end16, !dbg !197

for.body11:                                       ; preds = %for.cond9
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %13 = load i64, i64* %i8, align 8, !dbg !200
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !198
  %14 = load i64, i64* %i8, align 8, !dbg !201
  %arrayidx13 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !202
  %15 = bitcast %struct._twoIntsStruct* %arrayidx12 to i8*, !dbg !202
  %16 = bitcast %struct._twoIntsStruct* %arrayidx13 to i8*, !dbg !202
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !202
  br label %for.inc14, !dbg !203

for.inc14:                                        ; preds = %for.body11
  %17 = load i64, i64* %i8, align 8, !dbg !204
  %inc15 = add i64 %17, 1, !dbg !204
  store i64 %inc15, i64* %i8, align 8, !dbg !204
  br label %for.cond9, !dbg !205, !llvm.loop !206

for.end16:                                        ; preds = %for.cond9
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !208
  %arrayidx17 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !208
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx17), !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !11}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 100, baseType: !6)
!5 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 96, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 98, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 99, baseType: !9, size: 32, offset: 32)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "i", scope: !19, file: !20, line: 23, type: !9)
!25 = !DILocation(line: 23, column: 9, scope: !19)
!26 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 24, type: !3)
!27 = !DILocation(line: 24, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 25, type: !3)
!29 = !DILocation(line: 25, column: 21, scope: !19)
!30 = !DILocation(line: 25, column: 54, scope: !19)
!31 = !DILocation(line: 25, column: 37, scope: !19)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 26, type: !3)
!33 = !DILocation(line: 26, column: 21, scope: !19)
!34 = !DILocation(line: 26, column: 55, scope: !19)
!35 = !DILocation(line: 26, column: 38, scope: !19)
!36 = !DILocation(line: 27, column: 11, scope: !37)
!37 = distinct !DILexicalBlock(scope: !19, file: !20, line: 27, column: 5)
!38 = !DILocation(line: 27, column: 9, scope: !37)
!39 = !DILocation(line: 27, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !20, line: 27, column: 5)
!41 = !DILocation(line: 27, column: 18, scope: !40)
!42 = !DILocation(line: 27, column: 5, scope: !37)
!43 = !DILocation(line: 31, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !20, line: 28, column: 5)
!45 = !DILocation(line: 31, column: 14, scope: !44)
!46 = !DILocation(line: 32, column: 5, scope: !44)
!47 = !DILocation(line: 27, column: 24, scope: !40)
!48 = !DILocation(line: 27, column: 5, scope: !40)
!49 = distinct !{!49, !42, !50, !51}
!50 = !DILocation(line: 32, column: 5, scope: !37)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "source", scope: !53, file: !20, line: 34, type: !54)
!53 = distinct !DILexicalBlock(scope: !19, file: !20, line: 33, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 34, column: 23, scope: !53)
!58 = !DILocalVariable(name: "i", scope: !59, file: !20, line: 36, type: !60)
!59 = distinct !DILexicalBlock(scope: !53, file: !20, line: 35, column: 9)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !61, line: 31, baseType: !62)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !63, line: 94, baseType: !64)
!63 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!64 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!65 = !DILocation(line: 36, column: 20, scope: !59)
!66 = !DILocation(line: 38, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !59, file: !20, line: 38, column: 13)
!68 = !DILocation(line: 38, column: 18, scope: !67)
!69 = !DILocation(line: 38, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !20, line: 38, column: 13)
!71 = !DILocation(line: 38, column: 27, scope: !70)
!72 = !DILocation(line: 38, column: 13, scope: !67)
!73 = !DILocation(line: 40, column: 24, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !20, line: 39, column: 13)
!75 = !DILocation(line: 40, column: 17, scope: !74)
!76 = !DILocation(line: 40, column: 27, scope: !74)
!77 = !DILocation(line: 40, column: 34, scope: !74)
!78 = !DILocation(line: 41, column: 24, scope: !74)
!79 = !DILocation(line: 41, column: 17, scope: !74)
!80 = !DILocation(line: 41, column: 27, scope: !74)
!81 = !DILocation(line: 41, column: 34, scope: !74)
!82 = !DILocation(line: 42, column: 13, scope: !74)
!83 = !DILocation(line: 38, column: 35, scope: !70)
!84 = !DILocation(line: 38, column: 13, scope: !70)
!85 = distinct !{!85, !72, !86, !51}
!86 = !DILocation(line: 42, column: 13, scope: !67)
!87 = !DILocalVariable(name: "i", scope: !88, file: !20, line: 45, type: !60)
!88 = distinct !DILexicalBlock(scope: !53, file: !20, line: 44, column: 9)
!89 = !DILocation(line: 45, column: 20, scope: !88)
!90 = !DILocation(line: 47, column: 20, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !20, line: 47, column: 13)
!92 = !DILocation(line: 47, column: 18, scope: !91)
!93 = !DILocation(line: 47, column: 25, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !20, line: 47, column: 13)
!95 = !DILocation(line: 47, column: 27, scope: !94)
!96 = !DILocation(line: 47, column: 13, scope: !91)
!97 = !DILocation(line: 49, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !20, line: 48, column: 13)
!99 = !DILocation(line: 49, column: 22, scope: !98)
!100 = !DILocation(line: 49, column: 34, scope: !98)
!101 = !DILocation(line: 49, column: 27, scope: !98)
!102 = !DILocation(line: 50, column: 13, scope: !98)
!103 = !DILocation(line: 47, column: 35, scope: !94)
!104 = !DILocation(line: 47, column: 13, scope: !94)
!105 = distinct !{!105, !96, !106, !51}
!106 = !DILocation(line: 50, column: 13, scope: !91)
!107 = !DILocation(line: 51, column: 30, scope: !88)
!108 = !DILocation(line: 51, column: 13, scope: !88)
!109 = !DILocation(line: 54, column: 1, scope: !19)
!110 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_17_good", scope: !20, file: !20, line: 95, type: !21, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!111 = !DILocation(line: 97, column: 5, scope: !110)
!112 = !DILocation(line: 98, column: 1, scope: !110)
!113 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 110, type: !114, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!114 = !DISubroutineType(types: !115)
!115 = !{!9, !9, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !118, size: 64)
!118 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!119 = !DILocalVariable(name: "argc", arg: 1, scope: !113, file: !20, line: 110, type: !9)
!120 = !DILocation(line: 110, column: 14, scope: !113)
!121 = !DILocalVariable(name: "argv", arg: 2, scope: !113, file: !20, line: 110, type: !116)
!122 = !DILocation(line: 110, column: 27, scope: !113)
!123 = !DILocation(line: 113, column: 22, scope: !113)
!124 = !DILocation(line: 113, column: 12, scope: !113)
!125 = !DILocation(line: 113, column: 5, scope: !113)
!126 = !DILocation(line: 115, column: 5, scope: !113)
!127 = !DILocation(line: 116, column: 5, scope: !113)
!128 = !DILocation(line: 117, column: 5, scope: !113)
!129 = !DILocation(line: 120, column: 5, scope: !113)
!130 = !DILocation(line: 121, column: 5, scope: !113)
!131 = !DILocation(line: 122, column: 5, scope: !113)
!132 = !DILocation(line: 124, column: 5, scope: !113)
!133 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 61, type: !21, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!134 = !DILocalVariable(name: "h", scope: !133, file: !20, line: 63, type: !9)
!135 = !DILocation(line: 63, column: 9, scope: !133)
!136 = !DILocalVariable(name: "data", scope: !133, file: !20, line: 64, type: !3)
!137 = !DILocation(line: 64, column: 21, scope: !133)
!138 = !DILocalVariable(name: "dataBadBuffer", scope: !133, file: !20, line: 65, type: !3)
!139 = !DILocation(line: 65, column: 21, scope: !133)
!140 = !DILocation(line: 65, column: 54, scope: !133)
!141 = !DILocation(line: 65, column: 37, scope: !133)
!142 = !DILocalVariable(name: "dataGoodBuffer", scope: !133, file: !20, line: 66, type: !3)
!143 = !DILocation(line: 66, column: 21, scope: !133)
!144 = !DILocation(line: 66, column: 55, scope: !133)
!145 = !DILocation(line: 66, column: 38, scope: !133)
!146 = !DILocation(line: 67, column: 11, scope: !147)
!147 = distinct !DILexicalBlock(scope: !133, file: !20, line: 67, column: 5)
!148 = !DILocation(line: 67, column: 9, scope: !147)
!149 = !DILocation(line: 67, column: 16, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !20, line: 67, column: 5)
!151 = !DILocation(line: 67, column: 18, scope: !150)
!152 = !DILocation(line: 67, column: 5, scope: !147)
!153 = !DILocation(line: 70, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !20, line: 68, column: 5)
!155 = !DILocation(line: 70, column: 14, scope: !154)
!156 = !DILocation(line: 71, column: 5, scope: !154)
!157 = !DILocation(line: 67, column: 24, scope: !150)
!158 = !DILocation(line: 67, column: 5, scope: !150)
!159 = distinct !{!159, !152, !160, !51}
!160 = !DILocation(line: 71, column: 5, scope: !147)
!161 = !DILocalVariable(name: "source", scope: !162, file: !20, line: 73, type: !54)
!162 = distinct !DILexicalBlock(scope: !133, file: !20, line: 72, column: 5)
!163 = !DILocation(line: 73, column: 23, scope: !162)
!164 = !DILocalVariable(name: "i", scope: !165, file: !20, line: 75, type: !60)
!165 = distinct !DILexicalBlock(scope: !162, file: !20, line: 74, column: 9)
!166 = !DILocation(line: 75, column: 20, scope: !165)
!167 = !DILocation(line: 77, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !20, line: 77, column: 13)
!169 = !DILocation(line: 77, column: 18, scope: !168)
!170 = !DILocation(line: 77, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !20, line: 77, column: 13)
!172 = !DILocation(line: 77, column: 27, scope: !171)
!173 = !DILocation(line: 77, column: 13, scope: !168)
!174 = !DILocation(line: 79, column: 24, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !20, line: 78, column: 13)
!176 = !DILocation(line: 79, column: 17, scope: !175)
!177 = !DILocation(line: 79, column: 27, scope: !175)
!178 = !DILocation(line: 79, column: 34, scope: !175)
!179 = !DILocation(line: 80, column: 24, scope: !175)
!180 = !DILocation(line: 80, column: 17, scope: !175)
!181 = !DILocation(line: 80, column: 27, scope: !175)
!182 = !DILocation(line: 80, column: 34, scope: !175)
!183 = !DILocation(line: 81, column: 13, scope: !175)
!184 = !DILocation(line: 77, column: 35, scope: !171)
!185 = !DILocation(line: 77, column: 13, scope: !171)
!186 = distinct !{!186, !173, !187, !51}
!187 = !DILocation(line: 81, column: 13, scope: !168)
!188 = !DILocalVariable(name: "i", scope: !189, file: !20, line: 84, type: !60)
!189 = distinct !DILexicalBlock(scope: !162, file: !20, line: 83, column: 9)
!190 = !DILocation(line: 84, column: 20, scope: !189)
!191 = !DILocation(line: 86, column: 20, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !20, line: 86, column: 13)
!193 = !DILocation(line: 86, column: 18, scope: !192)
!194 = !DILocation(line: 86, column: 25, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !20, line: 86, column: 13)
!196 = !DILocation(line: 86, column: 27, scope: !195)
!197 = !DILocation(line: 86, column: 13, scope: !192)
!198 = !DILocation(line: 88, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !20, line: 87, column: 13)
!200 = !DILocation(line: 88, column: 22, scope: !199)
!201 = !DILocation(line: 88, column: 34, scope: !199)
!202 = !DILocation(line: 88, column: 27, scope: !199)
!203 = !DILocation(line: 89, column: 13, scope: !199)
!204 = !DILocation(line: 86, column: 35, scope: !195)
!205 = !DILocation(line: 86, column: 13, scope: !195)
!206 = distinct !{!206, !197, !207, !51}
!207 = !DILocation(line: 89, column: 13, scope: !192)
!208 = !DILocation(line: 90, column: 30, scope: !189)
!209 = !DILocation(line: 90, column: 13, scope: !189)
!210 = !DILocation(line: 93, column: 1, scope: !133)
