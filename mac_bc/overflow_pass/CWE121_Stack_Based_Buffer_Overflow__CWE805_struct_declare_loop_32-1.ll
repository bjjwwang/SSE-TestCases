; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !26, metadata !DIExpression()), !dbg !28
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !41, metadata !DIExpression()), !dbg !43
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !44
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !45
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !43
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data1, align 8, !dbg !47
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !48
  %3 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !49
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %3, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !51, metadata !DIExpression()), !dbg !53
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !54
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !55
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data2, align 8, !dbg !53
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !56, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i64* %i, metadata !59, metadata !DIExpression()), !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !70
  %cmp = icmp ult i64 %6, 100, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !76
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !77
  store i32 0, i32* %intOne, align 8, !dbg !78
  %8 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !80
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !81
  store i32 0, i32* %intTwo, align 4, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %9, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !89, metadata !DIExpression()), !dbg !91
  store i64 0, i64* %i4, align 8, !dbg !92
  br label %for.cond5, !dbg !94

for.cond5:                                        ; preds = %for.inc10, %for.end
  %10 = load i64, i64* %i4, align 8, !dbg !95
  %cmp6 = icmp ult i64 %10, 100, !dbg !97
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !98

for.body7:                                        ; preds = %for.cond5
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !99
  %12 = load i64, i64* %i4, align 8, !dbg !101
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !99
  %13 = load i64, i64* %i4, align 8, !dbg !102
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !103
  %14 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !103
  %15 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !103
  br label %for.inc10, !dbg !104

for.inc10:                                        ; preds = %for.body7
  %16 = load i64, i64* %i4, align 8, !dbg !105
  %inc11 = add i64 %16, 1, !dbg !105
  store i64 %inc11, i64* %i4, align 8, !dbg !105
  br label %for.cond5, !dbg !106, !llvm.loop !107

for.end12:                                        ; preds = %for.cond5
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !109
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !109
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx13), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_good() #0 !dbg !112 {
entry:
  call void @goodG2B(), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call i64 @time(i64* noundef null), !dbg !125
  %conv = trunc i64 %call to i32, !dbg !126
  call void @srand(i32 noundef %conv), !dbg !127
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !128
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_good(), !dbg !129
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !131
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_bad(), !dbg !132
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !133
  ret i32 0, !dbg !134
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !135 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !138, metadata !DIExpression()), !dbg !139
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !140, metadata !DIExpression()), !dbg !141
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !146, metadata !DIExpression()), !dbg !148
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !149
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !150
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !148
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !151
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data1, align 8, !dbg !152
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !153
  %3 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !154
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %3, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !156, metadata !DIExpression()), !dbg !158
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !159
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !160
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data2, align 8, !dbg !158
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i64* %i, metadata !164, metadata !DIExpression()), !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !170
  %cmp = icmp ult i64 %6, 100, !dbg !172
  br i1 %cmp, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !176
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !177
  store i32 0, i32* %intOne, align 8, !dbg !178
  %8 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !180
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !181
  store i32 0, i32* %intTwo, align 4, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %9, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !188, metadata !DIExpression()), !dbg !190
  store i64 0, i64* %i4, align 8, !dbg !191
  br label %for.cond5, !dbg !193

for.cond5:                                        ; preds = %for.inc10, %for.end
  %10 = load i64, i64* %i4, align 8, !dbg !194
  %cmp6 = icmp ult i64 %10, 100, !dbg !196
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !197

for.body7:                                        ; preds = %for.cond5
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !198
  %12 = load i64, i64* %i4, align 8, !dbg !200
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 %12, !dbg !198
  %13 = load i64, i64* %i4, align 8, !dbg !201
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !202
  %14 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !202
  %15 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !202
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %14, i8* align 8 %15, i64 8, i1 false), !dbg !202
  br label %for.inc10, !dbg !203

for.inc10:                                        ; preds = %for.body7
  %16 = load i64, i64* %i4, align 8, !dbg !204
  %inc11 = add i64 %16, 1, !dbg !204
  store i64 %inc11, i64* %i4, align 8, !dbg !204
  br label %for.cond5, !dbg !205, !llvm.loop !206

for.end12:                                        ; preds = %for.cond5
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !208
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !208
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx13), !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !19, line: 100, baseType: !20)
!19 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !19, line: 96, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !20, file: !19, line: 98, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !20, file: !19, line: 99, baseType: !23, size: 32, offset: 32)
!25 = !DILocation(line: 23, column: 21, scope: !11)
!26 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 24, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!28 = !DILocation(line: 24, column: 22, scope: !11)
!29 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 25, type: !27)
!30 = !DILocation(line: 25, column: 22, scope: !11)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 26, column: 19, scope: !11)
!36 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 27, column: 19, scope: !11)
!41 = !DILocalVariable(name: "data", scope: !42, file: !12, line: 29, type: !17)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 28, column: 5)
!43 = !DILocation(line: 29, column: 25, scope: !42)
!44 = !DILocation(line: 29, column: 33, scope: !42)
!45 = !DILocation(line: 29, column: 32, scope: !42)
!46 = !DILocation(line: 32, column: 16, scope: !42)
!47 = !DILocation(line: 32, column: 14, scope: !42)
!48 = !DILocation(line: 33, column: 21, scope: !42)
!49 = !DILocation(line: 33, column: 10, scope: !42)
!50 = !DILocation(line: 33, column: 19, scope: !42)
!51 = !DILocalVariable(name: "data", scope: !52, file: !12, line: 36, type: !17)
!52 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!53 = !DILocation(line: 36, column: 25, scope: !52)
!54 = !DILocation(line: 36, column: 33, scope: !52)
!55 = !DILocation(line: 36, column: 32, scope: !52)
!56 = !DILocalVariable(name: "source", scope: !57, file: !12, line: 38, type: !37)
!57 = distinct !DILexicalBlock(scope: !52, file: !12, line: 37, column: 9)
!58 = !DILocation(line: 38, column: 27, scope: !57)
!59 = !DILocalVariable(name: "i", scope: !60, file: !12, line: 40, type: !61)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 39, column: 13)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !62, line: 31, baseType: !63)
!62 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !64, line: 94, baseType: !65)
!64 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!65 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!66 = !DILocation(line: 40, column: 24, scope: !60)
!67 = !DILocation(line: 42, column: 24, scope: !68)
!68 = distinct !DILexicalBlock(scope: !60, file: !12, line: 42, column: 17)
!69 = !DILocation(line: 42, column: 22, scope: !68)
!70 = !DILocation(line: 42, column: 29, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !12, line: 42, column: 17)
!72 = !DILocation(line: 42, column: 31, scope: !71)
!73 = !DILocation(line: 42, column: 17, scope: !68)
!74 = !DILocation(line: 44, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !12, line: 43, column: 17)
!76 = !DILocation(line: 44, column: 21, scope: !75)
!77 = !DILocation(line: 44, column: 31, scope: !75)
!78 = !DILocation(line: 44, column: 38, scope: !75)
!79 = !DILocation(line: 45, column: 28, scope: !75)
!80 = !DILocation(line: 45, column: 21, scope: !75)
!81 = !DILocation(line: 45, column: 31, scope: !75)
!82 = !DILocation(line: 45, column: 38, scope: !75)
!83 = !DILocation(line: 46, column: 17, scope: !75)
!84 = !DILocation(line: 42, column: 39, scope: !71)
!85 = !DILocation(line: 42, column: 17, scope: !71)
!86 = distinct !{!86, !73, !87, !88}
!87 = !DILocation(line: 46, column: 17, scope: !68)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !DILocalVariable(name: "i", scope: !90, file: !12, line: 49, type: !61)
!90 = distinct !DILexicalBlock(scope: !57, file: !12, line: 48, column: 13)
!91 = !DILocation(line: 49, column: 24, scope: !90)
!92 = !DILocation(line: 51, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 51, column: 17)
!94 = !DILocation(line: 51, column: 22, scope: !93)
!95 = !DILocation(line: 51, column: 29, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 51, column: 17)
!97 = !DILocation(line: 51, column: 31, scope: !96)
!98 = !DILocation(line: 51, column: 17, scope: !93)
!99 = !DILocation(line: 53, column: 21, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 52, column: 17)
!101 = !DILocation(line: 53, column: 26, scope: !100)
!102 = !DILocation(line: 53, column: 38, scope: !100)
!103 = !DILocation(line: 53, column: 31, scope: !100)
!104 = !DILocation(line: 54, column: 17, scope: !100)
!105 = !DILocation(line: 51, column: 39, scope: !96)
!106 = !DILocation(line: 51, column: 17, scope: !96)
!107 = distinct !{!107, !98, !108, !88}
!108 = !DILocation(line: 54, column: 17, scope: !93)
!109 = !DILocation(line: 55, column: 34, scope: !90)
!110 = !DILocation(line: 55, column: 17, scope: !90)
!111 = !DILocation(line: 59, column: 1, scope: !11)
!112 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_32_good", scope: !12, file: !12, line: 105, type: !13, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!113 = !DILocation(line: 107, column: 5, scope: !112)
!114 = !DILocation(line: 108, column: 1, scope: !112)
!115 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 119, type: !116, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!116 = !DISubroutineType(types: !117)
!117 = !{!23, !23, !118}
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!121 = !DILocalVariable(name: "argc", arg: 1, scope: !115, file: !12, line: 119, type: !23)
!122 = !DILocation(line: 119, column: 14, scope: !115)
!123 = !DILocalVariable(name: "argv", arg: 2, scope: !115, file: !12, line: 119, type: !118)
!124 = !DILocation(line: 119, column: 27, scope: !115)
!125 = !DILocation(line: 122, column: 22, scope: !115)
!126 = !DILocation(line: 122, column: 12, scope: !115)
!127 = !DILocation(line: 122, column: 5, scope: !115)
!128 = !DILocation(line: 124, column: 5, scope: !115)
!129 = !DILocation(line: 125, column: 5, scope: !115)
!130 = !DILocation(line: 126, column: 5, scope: !115)
!131 = !DILocation(line: 129, column: 5, scope: !115)
!132 = !DILocation(line: 130, column: 5, scope: !115)
!133 = !DILocation(line: 131, column: 5, scope: !115)
!134 = !DILocation(line: 133, column: 5, scope: !115)
!135 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 66, type: !13, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!136 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 68, type: !17)
!137 = !DILocation(line: 68, column: 21, scope: !135)
!138 = !DILocalVariable(name: "dataPtr1", scope: !135, file: !12, line: 69, type: !27)
!139 = !DILocation(line: 69, column: 22, scope: !135)
!140 = !DILocalVariable(name: "dataPtr2", scope: !135, file: !12, line: 70, type: !27)
!141 = !DILocation(line: 70, column: 22, scope: !135)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !135, file: !12, line: 71, type: !32)
!143 = !DILocation(line: 71, column: 19, scope: !135)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !135, file: !12, line: 72, type: !37)
!145 = !DILocation(line: 72, column: 19, scope: !135)
!146 = !DILocalVariable(name: "data", scope: !147, file: !12, line: 74, type: !17)
!147 = distinct !DILexicalBlock(scope: !135, file: !12, line: 73, column: 5)
!148 = !DILocation(line: 74, column: 25, scope: !147)
!149 = !DILocation(line: 74, column: 33, scope: !147)
!150 = !DILocation(line: 74, column: 32, scope: !147)
!151 = !DILocation(line: 76, column: 16, scope: !147)
!152 = !DILocation(line: 76, column: 14, scope: !147)
!153 = !DILocation(line: 77, column: 21, scope: !147)
!154 = !DILocation(line: 77, column: 10, scope: !147)
!155 = !DILocation(line: 77, column: 19, scope: !147)
!156 = !DILocalVariable(name: "data", scope: !157, file: !12, line: 80, type: !17)
!157 = distinct !DILexicalBlock(scope: !135, file: !12, line: 79, column: 5)
!158 = !DILocation(line: 80, column: 25, scope: !157)
!159 = !DILocation(line: 80, column: 33, scope: !157)
!160 = !DILocation(line: 80, column: 32, scope: !157)
!161 = !DILocalVariable(name: "source", scope: !162, file: !12, line: 82, type: !37)
!162 = distinct !DILexicalBlock(scope: !157, file: !12, line: 81, column: 9)
!163 = !DILocation(line: 82, column: 27, scope: !162)
!164 = !DILocalVariable(name: "i", scope: !165, file: !12, line: 84, type: !61)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 83, column: 13)
!166 = !DILocation(line: 84, column: 24, scope: !165)
!167 = !DILocation(line: 86, column: 24, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 86, column: 17)
!169 = !DILocation(line: 86, column: 22, scope: !168)
!170 = !DILocation(line: 86, column: 29, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 86, column: 17)
!172 = !DILocation(line: 86, column: 31, scope: !171)
!173 = !DILocation(line: 86, column: 17, scope: !168)
!174 = !DILocation(line: 88, column: 28, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !12, line: 87, column: 17)
!176 = !DILocation(line: 88, column: 21, scope: !175)
!177 = !DILocation(line: 88, column: 31, scope: !175)
!178 = !DILocation(line: 88, column: 38, scope: !175)
!179 = !DILocation(line: 89, column: 28, scope: !175)
!180 = !DILocation(line: 89, column: 21, scope: !175)
!181 = !DILocation(line: 89, column: 31, scope: !175)
!182 = !DILocation(line: 89, column: 38, scope: !175)
!183 = !DILocation(line: 90, column: 17, scope: !175)
!184 = !DILocation(line: 86, column: 39, scope: !171)
!185 = !DILocation(line: 86, column: 17, scope: !171)
!186 = distinct !{!186, !173, !187, !88}
!187 = !DILocation(line: 90, column: 17, scope: !168)
!188 = !DILocalVariable(name: "i", scope: !189, file: !12, line: 93, type: !61)
!189 = distinct !DILexicalBlock(scope: !162, file: !12, line: 92, column: 13)
!190 = !DILocation(line: 93, column: 24, scope: !189)
!191 = !DILocation(line: 95, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !12, line: 95, column: 17)
!193 = !DILocation(line: 95, column: 22, scope: !192)
!194 = !DILocation(line: 95, column: 29, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !12, line: 95, column: 17)
!196 = !DILocation(line: 95, column: 31, scope: !195)
!197 = !DILocation(line: 95, column: 17, scope: !192)
!198 = !DILocation(line: 97, column: 21, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !12, line: 96, column: 17)
!200 = !DILocation(line: 97, column: 26, scope: !199)
!201 = !DILocation(line: 97, column: 38, scope: !199)
!202 = !DILocation(line: 97, column: 31, scope: !199)
!203 = !DILocation(line: 98, column: 17, scope: !199)
!204 = !DILocation(line: 95, column: 39, scope: !195)
!205 = !DILocation(line: 95, column: 17, scope: !195)
!206 = distinct !{!206, !197, !207, !88}
!207 = !DILocation(line: 98, column: 17, scope: !192)
!208 = !DILocation(line: 99, column: 34, scope: !189)
!209 = !DILocation(line: 99, column: 17, scope: !189)
!210 = !DILocation(line: 103, column: 1, scope: !135)
