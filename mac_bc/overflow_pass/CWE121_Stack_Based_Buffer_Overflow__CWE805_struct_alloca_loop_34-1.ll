; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion, metadata !26, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %0 = alloca i8, i64 400, align 16, !dbg !35
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !36
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !34
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !37, metadata !DIExpression()), !dbg !38
  %2 = alloca i8, i64 800, align 16, !dbg !39
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !40
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !38
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !41
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !42
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !44
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !46, metadata !DIExpression()), !dbg !48
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !49
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !49
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !50, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata i64* %i, metadata !56, metadata !DIExpression()), !dbg !63
  store i64 0, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !66

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !67
  %cmp = icmp ult i64 %7, 100, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !73
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !74
  store i32 0, i32* %intOne, align 8, !dbg !75
  %9 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !77
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !78
  store i32 0, i32* %intTwo, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %10, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !86, metadata !DIExpression()), !dbg !88
  store i64 0, i64* %i3, align 8, !dbg !89
  br label %for.cond4, !dbg !91

for.cond4:                                        ; preds = %for.inc9, %for.end
  %11 = load i64, i64* %i3, align 8, !dbg !92
  %cmp5 = icmp ult i64 %11, 100, !dbg !94
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !95

for.body6:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !96
  %13 = load i64, i64* %i3, align 8, !dbg !98
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !96
  %14 = load i64, i64* %i3, align 8, !dbg !99
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !100
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !100
  %16 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !100
  br label %for.inc9, !dbg !101

for.inc9:                                         ; preds = %for.body6
  %17 = load i64, i64* %i3, align 8, !dbg !102
  %inc10 = add i64 %17, 1, !dbg !102
  store i64 %inc10, i64* %i3, align 8, !dbg !102
  br label %for.cond4, !dbg !103, !llvm.loop !104

for.end11:                                        ; preds = %for.cond4
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !106
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !106
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !107
  ret void, !dbg !108
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_good() #0 !dbg !109 {
entry:
  call void @goodG2B(), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !112 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !120, metadata !DIExpression()), !dbg !121
  %call = call i64 @time(i64* noundef null), !dbg !122
  %conv = trunc i64 %call to i32, !dbg !123
  call void @srand(i32 noundef %conv), !dbg !124
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !125
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_good(), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !127
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !128
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_bad(), !dbg !129
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !130
  ret i32 0, !dbg !131
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !132 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = alloca i8, i64 400, align 16, !dbg !139
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !140
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %2 = alloca i8, i64 800, align 16, !dbg !143
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !144
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !142
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !145
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !146
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !147
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !148
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !149
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !150, metadata !DIExpression()), !dbg !152
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !153
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !153
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !163
  %cmp = icmp ult i64 %7, 100, !dbg !165
  br i1 %cmp, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !169
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !170
  store i32 0, i32* %intOne, align 8, !dbg !171
  %9 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !173
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !174
  store i32 0, i32* %intTwo, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %10, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !181, metadata !DIExpression()), !dbg !183
  store i64 0, i64* %i3, align 8, !dbg !184
  br label %for.cond4, !dbg !186

for.cond4:                                        ; preds = %for.inc9, %for.end
  %11 = load i64, i64* %i3, align 8, !dbg !187
  %cmp5 = icmp ult i64 %11, 100, !dbg !189
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !190

for.body6:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !191
  %13 = load i64, i64* %i3, align 8, !dbg !193
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 %13, !dbg !191
  %14 = load i64, i64* %i3, align 8, !dbg !194
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %14, !dbg !195
  %15 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !195
  %16 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !195
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %15, i8* align 8 %16, i64 8, i1 false), !dbg !195
  br label %for.inc9, !dbg !196

for.inc9:                                         ; preds = %for.body6
  %17 = load i64, i64* %i3, align 8, !dbg !197
  %inc10 = add i64 %17, 1, !dbg !197
  store i64 %inc10, i64* %i3, align 8, !dbg !197
  br label %for.cond4, !dbg !198, !llvm.loop !199

for.end11:                                        ; preds = %for.cond4
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !201
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %18, i64 0, !dbg !201
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !202
  ret void, !dbg !203
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_bad", scope: !20, file: !20, line: 27, type: !21, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 29, type: !3)
!25 = !DILocation(line: 29, column: 21, scope: !19)
!26 = !DILocalVariable(name: "myUnion", scope: !19, file: !20, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_unionType", file: !20, line: 23, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !20, line: 19, size: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !28, file: !20, line: 21, baseType: !3, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !28, file: !20, line: 22, baseType: !3, size: 64)
!32 = !DILocation(line: 30, column: 80, scope: !19)
!33 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 31, type: !3)
!34 = !DILocation(line: 31, column: 21, scope: !19)
!35 = !DILocation(line: 31, column: 54, scope: !19)
!36 = !DILocation(line: 31, column: 37, scope: !19)
!37 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 32, type: !3)
!38 = !DILocation(line: 32, column: 21, scope: !19)
!39 = !DILocation(line: 32, column: 55, scope: !19)
!40 = !DILocation(line: 32, column: 38, scope: !19)
!41 = !DILocation(line: 35, column: 12, scope: !19)
!42 = !DILocation(line: 35, column: 10, scope: !19)
!43 = !DILocation(line: 36, column: 26, scope: !19)
!44 = !DILocation(line: 36, column: 13, scope: !19)
!45 = !DILocation(line: 36, column: 24, scope: !19)
!46 = !DILocalVariable(name: "data", scope: !47, file: !20, line: 38, type: !3)
!47 = distinct !DILexicalBlock(scope: !19, file: !20, line: 37, column: 5)
!48 = !DILocation(line: 38, column: 25, scope: !47)
!49 = !DILocation(line: 38, column: 40, scope: !47)
!50 = !DILocalVariable(name: "source", scope: !51, file: !20, line: 40, type: !52)
!51 = distinct !DILexicalBlock(scope: !47, file: !20, line: 39, column: 9)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 40, column: 27, scope: !51)
!56 = !DILocalVariable(name: "i", scope: !57, file: !20, line: 42, type: !58)
!57 = distinct !DILexicalBlock(scope: !51, file: !20, line: 41, column: 13)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 31, baseType: !60)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !61, line: 94, baseType: !62)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!62 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!63 = !DILocation(line: 42, column: 24, scope: !57)
!64 = !DILocation(line: 44, column: 24, scope: !65)
!65 = distinct !DILexicalBlock(scope: !57, file: !20, line: 44, column: 17)
!66 = !DILocation(line: 44, column: 22, scope: !65)
!67 = !DILocation(line: 44, column: 29, scope: !68)
!68 = distinct !DILexicalBlock(scope: !65, file: !20, line: 44, column: 17)
!69 = !DILocation(line: 44, column: 31, scope: !68)
!70 = !DILocation(line: 44, column: 17, scope: !65)
!71 = !DILocation(line: 46, column: 28, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !20, line: 45, column: 17)
!73 = !DILocation(line: 46, column: 21, scope: !72)
!74 = !DILocation(line: 46, column: 31, scope: !72)
!75 = !DILocation(line: 46, column: 38, scope: !72)
!76 = !DILocation(line: 47, column: 28, scope: !72)
!77 = !DILocation(line: 47, column: 21, scope: !72)
!78 = !DILocation(line: 47, column: 31, scope: !72)
!79 = !DILocation(line: 47, column: 38, scope: !72)
!80 = !DILocation(line: 48, column: 17, scope: !72)
!81 = !DILocation(line: 44, column: 39, scope: !68)
!82 = !DILocation(line: 44, column: 17, scope: !68)
!83 = distinct !{!83, !70, !84, !85}
!84 = !DILocation(line: 48, column: 17, scope: !65)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocalVariable(name: "i", scope: !87, file: !20, line: 51, type: !58)
!87 = distinct !DILexicalBlock(scope: !51, file: !20, line: 50, column: 13)
!88 = !DILocation(line: 51, column: 24, scope: !87)
!89 = !DILocation(line: 53, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !20, line: 53, column: 17)
!91 = !DILocation(line: 53, column: 22, scope: !90)
!92 = !DILocation(line: 53, column: 29, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !20, line: 53, column: 17)
!94 = !DILocation(line: 53, column: 31, scope: !93)
!95 = !DILocation(line: 53, column: 17, scope: !90)
!96 = !DILocation(line: 55, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !20, line: 54, column: 17)
!98 = !DILocation(line: 55, column: 26, scope: !97)
!99 = !DILocation(line: 55, column: 38, scope: !97)
!100 = !DILocation(line: 55, column: 31, scope: !97)
!101 = !DILocation(line: 56, column: 17, scope: !97)
!102 = !DILocation(line: 53, column: 39, scope: !93)
!103 = !DILocation(line: 53, column: 17, scope: !93)
!104 = distinct !{!104, !95, !105, !85}
!105 = !DILocation(line: 56, column: 17, scope: !90)
!106 = !DILocation(line: 57, column: 34, scope: !87)
!107 = !DILocation(line: 57, column: 17, scope: !87)
!108 = !DILocation(line: 61, column: 1, scope: !19)
!109 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_34_good", scope: !20, file: !20, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!110 = !DILocation(line: 105, column: 5, scope: !109)
!111 = !DILocation(line: 106, column: 1, scope: !109)
!112 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 117, type: !113, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!113 = !DISubroutineType(types: !114)
!114 = !{!9, !9, !115}
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!118 = !DILocalVariable(name: "argc", arg: 1, scope: !112, file: !20, line: 117, type: !9)
!119 = !DILocation(line: 117, column: 14, scope: !112)
!120 = !DILocalVariable(name: "argv", arg: 2, scope: !112, file: !20, line: 117, type: !115)
!121 = !DILocation(line: 117, column: 27, scope: !112)
!122 = !DILocation(line: 120, column: 22, scope: !112)
!123 = !DILocation(line: 120, column: 12, scope: !112)
!124 = !DILocation(line: 120, column: 5, scope: !112)
!125 = !DILocation(line: 122, column: 5, scope: !112)
!126 = !DILocation(line: 123, column: 5, scope: !112)
!127 = !DILocation(line: 124, column: 5, scope: !112)
!128 = !DILocation(line: 127, column: 5, scope: !112)
!129 = !DILocation(line: 128, column: 5, scope: !112)
!130 = !DILocation(line: 129, column: 5, scope: !112)
!131 = !DILocation(line: 131, column: 5, scope: !112)
!132 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 68, type: !21, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!133 = !DILocalVariable(name: "data", scope: !132, file: !20, line: 70, type: !3)
!134 = !DILocation(line: 70, column: 21, scope: !132)
!135 = !DILocalVariable(name: "myUnion", scope: !132, file: !20, line: 71, type: !27)
!136 = !DILocation(line: 71, column: 80, scope: !132)
!137 = !DILocalVariable(name: "dataBadBuffer", scope: !132, file: !20, line: 72, type: !3)
!138 = !DILocation(line: 72, column: 21, scope: !132)
!139 = !DILocation(line: 72, column: 54, scope: !132)
!140 = !DILocation(line: 72, column: 37, scope: !132)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !132, file: !20, line: 73, type: !3)
!142 = !DILocation(line: 73, column: 21, scope: !132)
!143 = !DILocation(line: 73, column: 55, scope: !132)
!144 = !DILocation(line: 73, column: 38, scope: !132)
!145 = !DILocation(line: 75, column: 12, scope: !132)
!146 = !DILocation(line: 75, column: 10, scope: !132)
!147 = !DILocation(line: 76, column: 26, scope: !132)
!148 = !DILocation(line: 76, column: 13, scope: !132)
!149 = !DILocation(line: 76, column: 24, scope: !132)
!150 = !DILocalVariable(name: "data", scope: !151, file: !20, line: 78, type: !3)
!151 = distinct !DILexicalBlock(scope: !132, file: !20, line: 77, column: 5)
!152 = !DILocation(line: 78, column: 25, scope: !151)
!153 = !DILocation(line: 78, column: 40, scope: !151)
!154 = !DILocalVariable(name: "source", scope: !155, file: !20, line: 80, type: !52)
!155 = distinct !DILexicalBlock(scope: !151, file: !20, line: 79, column: 9)
!156 = !DILocation(line: 80, column: 27, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !20, line: 82, type: !58)
!158 = distinct !DILexicalBlock(scope: !155, file: !20, line: 81, column: 13)
!159 = !DILocation(line: 82, column: 24, scope: !158)
!160 = !DILocation(line: 84, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !20, line: 84, column: 17)
!162 = !DILocation(line: 84, column: 22, scope: !161)
!163 = !DILocation(line: 84, column: 29, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !20, line: 84, column: 17)
!165 = !DILocation(line: 84, column: 31, scope: !164)
!166 = !DILocation(line: 84, column: 17, scope: !161)
!167 = !DILocation(line: 86, column: 28, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !20, line: 85, column: 17)
!169 = !DILocation(line: 86, column: 21, scope: !168)
!170 = !DILocation(line: 86, column: 31, scope: !168)
!171 = !DILocation(line: 86, column: 38, scope: !168)
!172 = !DILocation(line: 87, column: 28, scope: !168)
!173 = !DILocation(line: 87, column: 21, scope: !168)
!174 = !DILocation(line: 87, column: 31, scope: !168)
!175 = !DILocation(line: 87, column: 38, scope: !168)
!176 = !DILocation(line: 88, column: 17, scope: !168)
!177 = !DILocation(line: 84, column: 39, scope: !164)
!178 = !DILocation(line: 84, column: 17, scope: !164)
!179 = distinct !{!179, !166, !180, !85}
!180 = !DILocation(line: 88, column: 17, scope: !161)
!181 = !DILocalVariable(name: "i", scope: !182, file: !20, line: 91, type: !58)
!182 = distinct !DILexicalBlock(scope: !155, file: !20, line: 90, column: 13)
!183 = !DILocation(line: 91, column: 24, scope: !182)
!184 = !DILocation(line: 93, column: 24, scope: !185)
!185 = distinct !DILexicalBlock(scope: !182, file: !20, line: 93, column: 17)
!186 = !DILocation(line: 93, column: 22, scope: !185)
!187 = !DILocation(line: 93, column: 29, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !20, line: 93, column: 17)
!189 = !DILocation(line: 93, column: 31, scope: !188)
!190 = !DILocation(line: 93, column: 17, scope: !185)
!191 = !DILocation(line: 95, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !20, line: 94, column: 17)
!193 = !DILocation(line: 95, column: 26, scope: !192)
!194 = !DILocation(line: 95, column: 38, scope: !192)
!195 = !DILocation(line: 95, column: 31, scope: !192)
!196 = !DILocation(line: 96, column: 17, scope: !192)
!197 = !DILocation(line: 93, column: 39, scope: !188)
!198 = !DILocation(line: 93, column: 17, scope: !188)
!199 = distinct !{!199, !190, !200, !85}
!200 = !DILocation(line: 96, column: 17, scope: !185)
!201 = !DILocation(line: 97, column: 34, scope: !182)
!202 = !DILocation(line: 97, column: 17, scope: !182)
!203 = !DILocation(line: 101, column: 1, scope: !132)
