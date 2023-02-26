; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion, metadata !26, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !38, metadata !DIExpression()), !dbg !42
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !45
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !46
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !48, metadata !DIExpression()), !dbg !50
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !51
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !51
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !66
  %cmp = icmp ult i64 %2, 100, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !72
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !73
  store i32 0, i32* %intOne, align 8, !dbg !74
  %4 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !76
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !77
  store i32 0, i32* %intTwo, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %5, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !85, metadata !DIExpression()), !dbg !87
  store i64 0, i64* %i3, align 8, !dbg !88
  br label %for.cond4, !dbg !90

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !91
  %cmp5 = icmp ult i64 %6, 100, !dbg !93
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !94

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !95
  %8 = load i64, i64* %i3, align 8, !dbg !97
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !95
  %9 = load i64, i64* %i3, align 8, !dbg !98
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !99
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !99
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !99
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !99
  br label %for.inc9, !dbg !100

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !101
  %inc10 = add i64 %12, 1, !dbg !101
  store i64 %inc10, i64* %i3, align 8, !dbg !101
  br label %for.cond4, !dbg !102, !llvm.loop !103

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !105
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !105
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_good() #0 !dbg !108 {
entry:
  call void @goodG2B(), !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !111 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %call = call i64 @time(i64* noundef null), !dbg !121
  %conv = trunc i64 %call to i32, !dbg !122
  call void @srand(i32 noundef %conv), !dbg !123
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !124
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_good(), !dbg !125
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !126
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !127
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_bad(), !dbg !128
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !129
  ret i32 0, !dbg !130
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !131 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !132, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !140
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !141
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !143
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !145, metadata !DIExpression()), !dbg !147
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !148
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !148
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !149, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i64* %i, metadata !152, metadata !DIExpression()), !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !158
  %cmp = icmp ult i64 %2, 100, !dbg !160
  br i1 %cmp, label %for.body, label %for.end, !dbg !161

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !164
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !165
  store i32 0, i32* %intOne, align 8, !dbg !166
  %4 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !168
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !169
  store i32 0, i32* %intTwo, align 4, !dbg !170
  br label %for.inc, !dbg !171

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !172
  %inc = add i64 %5, 1, !dbg !172
  store i64 %inc, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !173, !llvm.loop !174

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !176, metadata !DIExpression()), !dbg !178
  store i64 0, i64* %i3, align 8, !dbg !179
  br label %for.cond4, !dbg !181

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !182
  %cmp5 = icmp ult i64 %6, 100, !dbg !184
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !185

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !186
  %8 = load i64, i64* %i3, align 8, !dbg !188
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !186
  %9 = load i64, i64* %i3, align 8, !dbg !189
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !190
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !190
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !190
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !190
  br label %for.inc9, !dbg !191

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !192
  %inc10 = add i64 %12, 1, !dbg !192
  store i64 %inc10, i64* %i3, align 8, !dbg !192
  br label %for.cond4, !dbg !193, !llvm.loop !194

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !196
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !196
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !197
  ret void, !dbg !198
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_bad", scope: !12, file: !12, line: 27, type: !13, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 29, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !19, line: 100, baseType: !20)
!19 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !19, line: 96, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !20, file: !19, line: 98, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !20, file: !19, line: 99, baseType: !23, size: 32, offset: 32)
!25 = !DILocation(line: 29, column: 21, scope: !11)
!26 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_unionType", file: !12, line: 23, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 19, size: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !28, file: !12, line: 21, baseType: !17, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !28, file: !12, line: 22, baseType: !17, size: 64)
!32 = !DILocation(line: 30, column: 81, scope: !11)
!33 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 31, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 50)
!37 = !DILocation(line: 31, column: 19, scope: !11)
!38 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 32, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 32, column: 19, scope: !11)
!43 = !DILocation(line: 35, column: 12, scope: !11)
!44 = !DILocation(line: 35, column: 10, scope: !11)
!45 = !DILocation(line: 36, column: 26, scope: !11)
!46 = !DILocation(line: 36, column: 13, scope: !11)
!47 = !DILocation(line: 36, column: 24, scope: !11)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 38, type: !17)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!50 = !DILocation(line: 38, column: 25, scope: !49)
!51 = !DILocation(line: 38, column: 40, scope: !49)
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 40, type: !39)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 39, column: 9)
!54 = !DILocation(line: 40, column: 27, scope: !53)
!55 = !DILocalVariable(name: "i", scope: !56, file: !12, line: 42, type: !57)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 41, column: 13)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 31, baseType: !59)
!58 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !60, line: 94, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!61 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!62 = !DILocation(line: 42, column: 24, scope: !56)
!63 = !DILocation(line: 44, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !56, file: !12, line: 44, column: 17)
!65 = !DILocation(line: 44, column: 22, scope: !64)
!66 = !DILocation(line: 44, column: 29, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !12, line: 44, column: 17)
!68 = !DILocation(line: 44, column: 31, scope: !67)
!69 = !DILocation(line: 44, column: 17, scope: !64)
!70 = !DILocation(line: 46, column: 28, scope: !71)
!71 = distinct !DILexicalBlock(scope: !67, file: !12, line: 45, column: 17)
!72 = !DILocation(line: 46, column: 21, scope: !71)
!73 = !DILocation(line: 46, column: 31, scope: !71)
!74 = !DILocation(line: 46, column: 38, scope: !71)
!75 = !DILocation(line: 47, column: 28, scope: !71)
!76 = !DILocation(line: 47, column: 21, scope: !71)
!77 = !DILocation(line: 47, column: 31, scope: !71)
!78 = !DILocation(line: 47, column: 38, scope: !71)
!79 = !DILocation(line: 48, column: 17, scope: !71)
!80 = !DILocation(line: 44, column: 39, scope: !67)
!81 = !DILocation(line: 44, column: 17, scope: !67)
!82 = distinct !{!82, !69, !83, !84}
!83 = !DILocation(line: 48, column: 17, scope: !64)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocalVariable(name: "i", scope: !86, file: !12, line: 51, type: !57)
!86 = distinct !DILexicalBlock(scope: !53, file: !12, line: 50, column: 13)
!87 = !DILocation(line: 51, column: 24, scope: !86)
!88 = !DILocation(line: 53, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !12, line: 53, column: 17)
!90 = !DILocation(line: 53, column: 22, scope: !89)
!91 = !DILocation(line: 53, column: 29, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !12, line: 53, column: 17)
!93 = !DILocation(line: 53, column: 31, scope: !92)
!94 = !DILocation(line: 53, column: 17, scope: !89)
!95 = !DILocation(line: 55, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !12, line: 54, column: 17)
!97 = !DILocation(line: 55, column: 26, scope: !96)
!98 = !DILocation(line: 55, column: 38, scope: !96)
!99 = !DILocation(line: 55, column: 31, scope: !96)
!100 = !DILocation(line: 56, column: 17, scope: !96)
!101 = !DILocation(line: 53, column: 39, scope: !92)
!102 = !DILocation(line: 53, column: 17, scope: !92)
!103 = distinct !{!103, !94, !104, !84}
!104 = !DILocation(line: 56, column: 17, scope: !89)
!105 = !DILocation(line: 57, column: 34, scope: !86)
!106 = !DILocation(line: 57, column: 17, scope: !86)
!107 = !DILocation(line: 61, column: 1, scope: !11)
!108 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_34_good", scope: !12, file: !12, line: 103, type: !13, scopeLine: 104, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!109 = !DILocation(line: 105, column: 5, scope: !108)
!110 = !DILocation(line: 106, column: 1, scope: !108)
!111 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !112, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!112 = !DISubroutineType(types: !113)
!113 = !{!23, !23, !114}
!114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !115, size: 64)
!115 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!116 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!117 = !DILocalVariable(name: "argc", arg: 1, scope: !111, file: !12, line: 117, type: !23)
!118 = !DILocation(line: 117, column: 14, scope: !111)
!119 = !DILocalVariable(name: "argv", arg: 2, scope: !111, file: !12, line: 117, type: !114)
!120 = !DILocation(line: 117, column: 27, scope: !111)
!121 = !DILocation(line: 120, column: 22, scope: !111)
!122 = !DILocation(line: 120, column: 12, scope: !111)
!123 = !DILocation(line: 120, column: 5, scope: !111)
!124 = !DILocation(line: 122, column: 5, scope: !111)
!125 = !DILocation(line: 123, column: 5, scope: !111)
!126 = !DILocation(line: 124, column: 5, scope: !111)
!127 = !DILocation(line: 127, column: 5, scope: !111)
!128 = !DILocation(line: 128, column: 5, scope: !111)
!129 = !DILocation(line: 129, column: 5, scope: !111)
!130 = !DILocation(line: 131, column: 5, scope: !111)
!131 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!132 = !DILocalVariable(name: "data", scope: !131, file: !12, line: 70, type: !17)
!133 = !DILocation(line: 70, column: 21, scope: !131)
!134 = !DILocalVariable(name: "myUnion", scope: !131, file: !12, line: 71, type: !27)
!135 = !DILocation(line: 71, column: 81, scope: !131)
!136 = !DILocalVariable(name: "dataBadBuffer", scope: !131, file: !12, line: 72, type: !34)
!137 = !DILocation(line: 72, column: 19, scope: !131)
!138 = !DILocalVariable(name: "dataGoodBuffer", scope: !131, file: !12, line: 73, type: !39)
!139 = !DILocation(line: 73, column: 19, scope: !131)
!140 = !DILocation(line: 75, column: 12, scope: !131)
!141 = !DILocation(line: 75, column: 10, scope: !131)
!142 = !DILocation(line: 76, column: 26, scope: !131)
!143 = !DILocation(line: 76, column: 13, scope: !131)
!144 = !DILocation(line: 76, column: 24, scope: !131)
!145 = !DILocalVariable(name: "data", scope: !146, file: !12, line: 78, type: !17)
!146 = distinct !DILexicalBlock(scope: !131, file: !12, line: 77, column: 5)
!147 = !DILocation(line: 78, column: 25, scope: !146)
!148 = !DILocation(line: 78, column: 40, scope: !146)
!149 = !DILocalVariable(name: "source", scope: !150, file: !12, line: 80, type: !39)
!150 = distinct !DILexicalBlock(scope: !146, file: !12, line: 79, column: 9)
!151 = !DILocation(line: 80, column: 27, scope: !150)
!152 = !DILocalVariable(name: "i", scope: !153, file: !12, line: 82, type: !57)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 81, column: 13)
!154 = !DILocation(line: 82, column: 24, scope: !153)
!155 = !DILocation(line: 84, column: 24, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !12, line: 84, column: 17)
!157 = !DILocation(line: 84, column: 22, scope: !156)
!158 = !DILocation(line: 84, column: 29, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 84, column: 17)
!160 = !DILocation(line: 84, column: 31, scope: !159)
!161 = !DILocation(line: 84, column: 17, scope: !156)
!162 = !DILocation(line: 86, column: 28, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 85, column: 17)
!164 = !DILocation(line: 86, column: 21, scope: !163)
!165 = !DILocation(line: 86, column: 31, scope: !163)
!166 = !DILocation(line: 86, column: 38, scope: !163)
!167 = !DILocation(line: 87, column: 28, scope: !163)
!168 = !DILocation(line: 87, column: 21, scope: !163)
!169 = !DILocation(line: 87, column: 31, scope: !163)
!170 = !DILocation(line: 87, column: 38, scope: !163)
!171 = !DILocation(line: 88, column: 17, scope: !163)
!172 = !DILocation(line: 84, column: 39, scope: !159)
!173 = !DILocation(line: 84, column: 17, scope: !159)
!174 = distinct !{!174, !161, !175, !84}
!175 = !DILocation(line: 88, column: 17, scope: !156)
!176 = !DILocalVariable(name: "i", scope: !177, file: !12, line: 91, type: !57)
!177 = distinct !DILexicalBlock(scope: !150, file: !12, line: 90, column: 13)
!178 = !DILocation(line: 91, column: 24, scope: !177)
!179 = !DILocation(line: 93, column: 24, scope: !180)
!180 = distinct !DILexicalBlock(scope: !177, file: !12, line: 93, column: 17)
!181 = !DILocation(line: 93, column: 22, scope: !180)
!182 = !DILocation(line: 93, column: 29, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !12, line: 93, column: 17)
!184 = !DILocation(line: 93, column: 31, scope: !183)
!185 = !DILocation(line: 93, column: 17, scope: !180)
!186 = !DILocation(line: 95, column: 21, scope: !187)
!187 = distinct !DILexicalBlock(scope: !183, file: !12, line: 94, column: 17)
!188 = !DILocation(line: 95, column: 26, scope: !187)
!189 = !DILocation(line: 95, column: 38, scope: !187)
!190 = !DILocation(line: 95, column: 31, scope: !187)
!191 = !DILocation(line: 96, column: 17, scope: !187)
!192 = !DILocation(line: 93, column: 39, scope: !183)
!193 = !DILocation(line: 93, column: 17, scope: !183)
!194 = distinct !{!194, !185, !195, !84}
!195 = !DILocation(line: 96, column: 17, scope: !180)
!196 = !DILocation(line: 97, column: 34, scope: !177)
!197 = !DILocation(line: 97, column: 17, scope: !177)
!198 = !DILocation(line: 101, column: 1, scope: !131)
