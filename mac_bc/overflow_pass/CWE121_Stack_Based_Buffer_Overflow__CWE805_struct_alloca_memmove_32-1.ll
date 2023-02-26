; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !26, metadata !DIExpression()), !dbg !28
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !29, metadata !DIExpression()), !dbg !30
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 400, align 16, !dbg !33
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !34
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = alloca i8, i64 800, align 16, !dbg !37
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !39, metadata !DIExpression()), !dbg !41
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !42
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !43
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data1, align 8, !dbg !41
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !44
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !45
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !46
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !47
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %8, align 8, !dbg !48
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !49, metadata !DIExpression()), !dbg !51
  %9 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !52
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %9, align 8, !dbg !53
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data2, align 8, !dbg !51
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !54, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %i, metadata !60, metadata !DIExpression()), !dbg !67
  store i64 0, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !70

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !71
  %cmp = icmp ult i64 %11, 100, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %12 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !77
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !78
  store i32 0, i32* %intOne, align 8, !dbg !79
  %13 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !81
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !82
  store i32 0, i32* %intTwo, align 4, !dbg !83
  br label %for.inc, !dbg !84

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !85
  %inc = add i64 %14, 1, !dbg !85
  store i64 %inc, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !86, !llvm.loop !87

for.end:                                          ; preds = %for.cond
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !90
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !90
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !90
  %17 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !90
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !90
  %19 = bitcast %struct._twoIntsStruct* %18 to i8*, !dbg !90
  %20 = call i64 @llvm.objectsize.i64.p0i8(i8* %19, i1 false, i1 true, i1 false), !dbg !90
  %call = call i8* @__memmove_chk(i8* noundef %16, i8* noundef %17, i64 noundef 800, i64 noundef %20) #4, !dbg !90
  %21 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !91
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %21, i64 0, !dbg !91
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* noundef null), !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 noundef %conv), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32_good(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32_bad(), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataPtr1 = alloca %struct._twoIntsStruct**, align 8
  %dataPtr2 = alloca %struct._twoIntsStruct**, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %data2 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !120, metadata !DIExpression()), !dbg !121
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !121
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !122, metadata !DIExpression()), !dbg !123
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = alloca i8, i64 400, align 16, !dbg !126
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !127
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %2 = alloca i8, i64 800, align 16, !dbg !130
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !131
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !132, metadata !DIExpression()), !dbg !134
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !135
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !136
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data1, align 8, !dbg !134
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !137
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !138
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !139
  %8 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !140
  store %struct._twoIntsStruct* %7, %struct._twoIntsStruct** %8, align 8, !dbg !141
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !142, metadata !DIExpression()), !dbg !144
  %9 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !145
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %9, align 8, !dbg !146
  store %struct._twoIntsStruct* %10, %struct._twoIntsStruct** %data2, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !156
  %cmp = icmp ult i64 %11, 100, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %12 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !162
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !163
  store i32 0, i32* %intOne, align 8, !dbg !164
  %13 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %13, !dbg !166
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !167
  store i32 0, i32* %intTwo, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %14, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !174
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !174
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !174
  %17 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !174
  %18 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !174
  %19 = bitcast %struct._twoIntsStruct* %18 to i8*, !dbg !174
  %20 = call i64 @llvm.objectsize.i64.p0i8(i8* %19, i1 false, i1 true, i1 false), !dbg !174
  %call = call i8* @__memmove_chk(i8* noundef %16, i8* noundef %17, i64 noundef 800, i64 noundef %20) #4, !dbg !174
  %21 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !175
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %21, i64 0, !dbg !175
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !176
  ret void, !dbg !177
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !3)
!25 = !DILocation(line: 23, column: 21, scope: !19)
!26 = !DILocalVariable(name: "dataPtr1", scope: !19, file: !20, line: 24, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!28 = !DILocation(line: 24, column: 22, scope: !19)
!29 = !DILocalVariable(name: "dataPtr2", scope: !19, file: !20, line: 25, type: !27)
!30 = !DILocation(line: 25, column: 22, scope: !19)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 26, type: !3)
!32 = !DILocation(line: 26, column: 21, scope: !19)
!33 = !DILocation(line: 26, column: 54, scope: !19)
!34 = !DILocation(line: 26, column: 37, scope: !19)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 27, type: !3)
!36 = !DILocation(line: 27, column: 21, scope: !19)
!37 = !DILocation(line: 27, column: 55, scope: !19)
!38 = !DILocation(line: 27, column: 38, scope: !19)
!39 = !DILocalVariable(name: "data", scope: !40, file: !20, line: 29, type: !3)
!40 = distinct !DILexicalBlock(scope: !19, file: !20, line: 28, column: 5)
!41 = !DILocation(line: 29, column: 25, scope: !40)
!42 = !DILocation(line: 29, column: 33, scope: !40)
!43 = !DILocation(line: 29, column: 32, scope: !40)
!44 = !DILocation(line: 32, column: 16, scope: !40)
!45 = !DILocation(line: 32, column: 14, scope: !40)
!46 = !DILocation(line: 33, column: 21, scope: !40)
!47 = !DILocation(line: 33, column: 10, scope: !40)
!48 = !DILocation(line: 33, column: 19, scope: !40)
!49 = !DILocalVariable(name: "data", scope: !50, file: !20, line: 36, type: !3)
!50 = distinct !DILexicalBlock(scope: !19, file: !20, line: 35, column: 5)
!51 = !DILocation(line: 36, column: 25, scope: !50)
!52 = !DILocation(line: 36, column: 33, scope: !50)
!53 = !DILocation(line: 36, column: 32, scope: !50)
!54 = !DILocalVariable(name: "source", scope: !55, file: !20, line: 38, type: !56)
!55 = distinct !DILexicalBlock(scope: !50, file: !20, line: 37, column: 9)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 38, column: 27, scope: !55)
!60 = !DILocalVariable(name: "i", scope: !61, file: !20, line: 40, type: !62)
!61 = distinct !DILexicalBlock(scope: !55, file: !20, line: 39, column: 13)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !63, line: 31, baseType: !64)
!63 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !65, line: 94, baseType: !66)
!65 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!66 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!67 = !DILocation(line: 40, column: 24, scope: !61)
!68 = !DILocation(line: 42, column: 24, scope: !69)
!69 = distinct !DILexicalBlock(scope: !61, file: !20, line: 42, column: 17)
!70 = !DILocation(line: 42, column: 22, scope: !69)
!71 = !DILocation(line: 42, column: 29, scope: !72)
!72 = distinct !DILexicalBlock(scope: !69, file: !20, line: 42, column: 17)
!73 = !DILocation(line: 42, column: 31, scope: !72)
!74 = !DILocation(line: 42, column: 17, scope: !69)
!75 = !DILocation(line: 44, column: 28, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !20, line: 43, column: 17)
!77 = !DILocation(line: 44, column: 21, scope: !76)
!78 = !DILocation(line: 44, column: 31, scope: !76)
!79 = !DILocation(line: 44, column: 38, scope: !76)
!80 = !DILocation(line: 45, column: 28, scope: !76)
!81 = !DILocation(line: 45, column: 21, scope: !76)
!82 = !DILocation(line: 45, column: 31, scope: !76)
!83 = !DILocation(line: 45, column: 38, scope: !76)
!84 = !DILocation(line: 46, column: 17, scope: !76)
!85 = !DILocation(line: 42, column: 39, scope: !72)
!86 = !DILocation(line: 42, column: 17, scope: !72)
!87 = distinct !{!87, !74, !88, !89}
!88 = !DILocation(line: 46, column: 17, scope: !69)
!89 = !{!"llvm.loop.mustprogress"}
!90 = !DILocation(line: 49, column: 13, scope: !55)
!91 = !DILocation(line: 50, column: 30, scope: !55)
!92 = !DILocation(line: 50, column: 13, scope: !55)
!93 = !DILocation(line: 53, column: 1, scope: !19)
!94 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_32_good", scope: !20, file: !20, line: 93, type: !21, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!95 = !DILocation(line: 95, column: 5, scope: !94)
!96 = !DILocation(line: 96, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 107, type: !98, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!98 = !DISubroutineType(types: !99)
!99 = !{!9, !9, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !20, line: 107, type: !9)
!104 = !DILocation(line: 107, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !20, line: 107, type: !100)
!106 = !DILocation(line: 107, column: 27, scope: !97)
!107 = !DILocation(line: 110, column: 22, scope: !97)
!108 = !DILocation(line: 110, column: 12, scope: !97)
!109 = !DILocation(line: 110, column: 5, scope: !97)
!110 = !DILocation(line: 112, column: 5, scope: !97)
!111 = !DILocation(line: 113, column: 5, scope: !97)
!112 = !DILocation(line: 114, column: 5, scope: !97)
!113 = !DILocation(line: 117, column: 5, scope: !97)
!114 = !DILocation(line: 118, column: 5, scope: !97)
!115 = !DILocation(line: 119, column: 5, scope: !97)
!116 = !DILocation(line: 121, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!118 = !DILocalVariable(name: "data", scope: !117, file: !20, line: 62, type: !3)
!119 = !DILocation(line: 62, column: 21, scope: !117)
!120 = !DILocalVariable(name: "dataPtr1", scope: !117, file: !20, line: 63, type: !27)
!121 = !DILocation(line: 63, column: 22, scope: !117)
!122 = !DILocalVariable(name: "dataPtr2", scope: !117, file: !20, line: 64, type: !27)
!123 = !DILocation(line: 64, column: 22, scope: !117)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !20, line: 65, type: !3)
!125 = !DILocation(line: 65, column: 21, scope: !117)
!126 = !DILocation(line: 65, column: 54, scope: !117)
!127 = !DILocation(line: 65, column: 37, scope: !117)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !20, line: 66, type: !3)
!129 = !DILocation(line: 66, column: 21, scope: !117)
!130 = !DILocation(line: 66, column: 55, scope: !117)
!131 = !DILocation(line: 66, column: 38, scope: !117)
!132 = !DILocalVariable(name: "data", scope: !133, file: !20, line: 68, type: !3)
!133 = distinct !DILexicalBlock(scope: !117, file: !20, line: 67, column: 5)
!134 = !DILocation(line: 68, column: 25, scope: !133)
!135 = !DILocation(line: 68, column: 33, scope: !133)
!136 = !DILocation(line: 68, column: 32, scope: !133)
!137 = !DILocation(line: 70, column: 16, scope: !133)
!138 = !DILocation(line: 70, column: 14, scope: !133)
!139 = !DILocation(line: 71, column: 21, scope: !133)
!140 = !DILocation(line: 71, column: 10, scope: !133)
!141 = !DILocation(line: 71, column: 19, scope: !133)
!142 = !DILocalVariable(name: "data", scope: !143, file: !20, line: 74, type: !3)
!143 = distinct !DILexicalBlock(scope: !117, file: !20, line: 73, column: 5)
!144 = !DILocation(line: 74, column: 25, scope: !143)
!145 = !DILocation(line: 74, column: 33, scope: !143)
!146 = !DILocation(line: 74, column: 32, scope: !143)
!147 = !DILocalVariable(name: "source", scope: !148, file: !20, line: 76, type: !56)
!148 = distinct !DILexicalBlock(scope: !143, file: !20, line: 75, column: 9)
!149 = !DILocation(line: 76, column: 27, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !151, file: !20, line: 78, type: !62)
!151 = distinct !DILexicalBlock(scope: !148, file: !20, line: 77, column: 13)
!152 = !DILocation(line: 78, column: 24, scope: !151)
!153 = !DILocation(line: 80, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !20, line: 80, column: 17)
!155 = !DILocation(line: 80, column: 22, scope: !154)
!156 = !DILocation(line: 80, column: 29, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !20, line: 80, column: 17)
!158 = !DILocation(line: 80, column: 31, scope: !157)
!159 = !DILocation(line: 80, column: 17, scope: !154)
!160 = !DILocation(line: 82, column: 28, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !20, line: 81, column: 17)
!162 = !DILocation(line: 82, column: 21, scope: !161)
!163 = !DILocation(line: 82, column: 31, scope: !161)
!164 = !DILocation(line: 82, column: 38, scope: !161)
!165 = !DILocation(line: 83, column: 28, scope: !161)
!166 = !DILocation(line: 83, column: 21, scope: !161)
!167 = !DILocation(line: 83, column: 31, scope: !161)
!168 = !DILocation(line: 83, column: 38, scope: !161)
!169 = !DILocation(line: 84, column: 17, scope: !161)
!170 = !DILocation(line: 80, column: 39, scope: !157)
!171 = !DILocation(line: 80, column: 17, scope: !157)
!172 = distinct !{!172, !159, !173, !89}
!173 = !DILocation(line: 84, column: 17, scope: !154)
!174 = !DILocation(line: 87, column: 13, scope: !148)
!175 = !DILocation(line: 88, column: 30, scope: !148)
!176 = !DILocation(line: 88, column: 13, scope: !148)
!177 = !DILocation(line: 91, column: 1, scope: !117)
