; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !29
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 800, align 16, !dbg !32
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !31
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !34
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !35
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !53
  %cmp = icmp ult i64 %5, 100, !dbg !55
  br i1 %cmp, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !59
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !60
  store i32 0, i32* %intOne, align 8, !dbg !61
  %7 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !63
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !64
  store i32 0, i32* %intTwo, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !67
  %inc = add i64 %8, 1, !dbg !67
  store i64 %inc, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !72
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !72
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !72
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !72
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !72
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !72
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !73
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15_good() #0 !dbg !76 {
entry:
  call void @goodG2B1(), !dbg !77
  call void @goodG2B2(), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !80 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !86, metadata !DIExpression()), !dbg !87
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !88, metadata !DIExpression()), !dbg !89
  %call = call i64 @time(i64* noundef null), !dbg !90
  %conv = trunc i64 %call to i32, !dbg !91
  call void @srand(i32 noundef %conv), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !93
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15_good(), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !96
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15_bad(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !98
  ret i32 0, !dbg !99
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !100 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  %0 = alloca i8, i64 400, align 16, !dbg !105
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !106
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  %2 = alloca i8, i64 800, align 16, !dbg !109
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !110
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !108
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !111
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !112
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !122
  %cmp = icmp ult i64 %5, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !128
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !129
  store i32 0, i32* %intOne, align 8, !dbg !130
  %7 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !132
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !133
  store i32 0, i32* %intTwo, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %8, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !140
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !140
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !140
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !140
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !140
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !140
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !141
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !141
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !142
  ret void, !dbg !143
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !144 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !145, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %0 = alloca i8, i64 400, align 16, !dbg !149
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !150
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %2 = alloca i8, i64 800, align 16, !dbg !153
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !154
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !152
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !155
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !156
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !162
  store i64 0, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !166
  %cmp = icmp ult i64 %5, 100, !dbg !168
  br i1 %cmp, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !172
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !173
  store i32 0, i32* %intOne, align 8, !dbg !174
  %7 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !176
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !177
  store i32 0, i32* %intTwo, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !180
  %inc = add i64 %8, 1, !dbg !180
  store i64 %inc, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !184
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !184
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !184
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !184
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !184
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !184
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !185
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !185
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !186
  ret void, !dbg !187
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !3)
!25 = !DILocation(line: 23, column: 21, scope: !19)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !3)
!27 = !DILocation(line: 24, column: 21, scope: !19)
!28 = !DILocation(line: 24, column: 54, scope: !19)
!29 = !DILocation(line: 24, column: 37, scope: !19)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !3)
!31 = !DILocation(line: 25, column: 21, scope: !19)
!32 = !DILocation(line: 25, column: 55, scope: !19)
!33 = !DILocation(line: 25, column: 38, scope: !19)
!34 = !DILocation(line: 31, column: 16, scope: !19)
!35 = !DILocation(line: 31, column: 14, scope: !19)
!36 = !DILocalVariable(name: "source", scope: !37, file: !20, line: 39, type: !38)
!37 = distinct !DILexicalBlock(scope: !19, file: !20, line: 38, column: 5)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 100)
!41 = !DILocation(line: 39, column: 23, scope: !37)
!42 = !DILocalVariable(name: "i", scope: !43, file: !20, line: 41, type: !44)
!43 = distinct !DILexicalBlock(scope: !37, file: !20, line: 40, column: 9)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !47, line: 94, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!48 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DILocation(line: 41, column: 20, scope: !43)
!50 = !DILocation(line: 43, column: 20, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !20, line: 43, column: 13)
!52 = !DILocation(line: 43, column: 18, scope: !51)
!53 = !DILocation(line: 43, column: 25, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !20, line: 43, column: 13)
!55 = !DILocation(line: 43, column: 27, scope: !54)
!56 = !DILocation(line: 43, column: 13, scope: !51)
!57 = !DILocation(line: 45, column: 24, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !20, line: 44, column: 13)
!59 = !DILocation(line: 45, column: 17, scope: !58)
!60 = !DILocation(line: 45, column: 27, scope: !58)
!61 = !DILocation(line: 45, column: 34, scope: !58)
!62 = !DILocation(line: 46, column: 24, scope: !58)
!63 = !DILocation(line: 46, column: 17, scope: !58)
!64 = !DILocation(line: 46, column: 27, scope: !58)
!65 = !DILocation(line: 46, column: 34, scope: !58)
!66 = !DILocation(line: 47, column: 13, scope: !58)
!67 = !DILocation(line: 43, column: 35, scope: !54)
!68 = !DILocation(line: 43, column: 13, scope: !54)
!69 = distinct !{!69, !56, !70, !71}
!70 = !DILocation(line: 47, column: 13, scope: !51)
!71 = !{!"llvm.loop.mustprogress"}
!72 = !DILocation(line: 50, column: 9, scope: !37)
!73 = !DILocation(line: 51, column: 26, scope: !37)
!74 = !DILocation(line: 51, column: 9, scope: !37)
!75 = !DILocation(line: 53, column: 1, scope: !19)
!76 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_15_good", scope: !20, file: !20, line: 127, type: !21, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!77 = !DILocation(line: 129, column: 5, scope: !76)
!78 = !DILocation(line: 130, column: 5, scope: !76)
!79 = !DILocation(line: 131, column: 1, scope: !76)
!80 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 143, type: !81, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!81 = !DISubroutineType(types: !82)
!82 = !{!9, !9, !83}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!86 = !DILocalVariable(name: "argc", arg: 1, scope: !80, file: !20, line: 143, type: !9)
!87 = !DILocation(line: 143, column: 14, scope: !80)
!88 = !DILocalVariable(name: "argv", arg: 2, scope: !80, file: !20, line: 143, type: !83)
!89 = !DILocation(line: 143, column: 27, scope: !80)
!90 = !DILocation(line: 146, column: 22, scope: !80)
!91 = !DILocation(line: 146, column: 12, scope: !80)
!92 = !DILocation(line: 146, column: 5, scope: !80)
!93 = !DILocation(line: 148, column: 5, scope: !80)
!94 = !DILocation(line: 149, column: 5, scope: !80)
!95 = !DILocation(line: 150, column: 5, scope: !80)
!96 = !DILocation(line: 153, column: 5, scope: !80)
!97 = !DILocation(line: 154, column: 5, scope: !80)
!98 = !DILocation(line: 155, column: 5, scope: !80)
!99 = !DILocation(line: 157, column: 5, scope: !80)
!100 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 60, type: !21, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!101 = !DILocalVariable(name: "data", scope: !100, file: !20, line: 62, type: !3)
!102 = !DILocation(line: 62, column: 21, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !20, line: 63, type: !3)
!104 = !DILocation(line: 63, column: 21, scope: !100)
!105 = !DILocation(line: 63, column: 54, scope: !100)
!106 = !DILocation(line: 63, column: 37, scope: !100)
!107 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !20, line: 64, type: !3)
!108 = !DILocation(line: 64, column: 21, scope: !100)
!109 = !DILocation(line: 64, column: 55, scope: !100)
!110 = !DILocation(line: 64, column: 38, scope: !100)
!111 = !DILocation(line: 73, column: 16, scope: !100)
!112 = !DILocation(line: 73, column: 14, scope: !100)
!113 = !DILocalVariable(name: "source", scope: !114, file: !20, line: 77, type: !38)
!114 = distinct !DILexicalBlock(scope: !100, file: !20, line: 76, column: 5)
!115 = !DILocation(line: 77, column: 23, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !20, line: 79, type: !44)
!117 = distinct !DILexicalBlock(scope: !114, file: !20, line: 78, column: 9)
!118 = !DILocation(line: 79, column: 20, scope: !117)
!119 = !DILocation(line: 81, column: 20, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !20, line: 81, column: 13)
!121 = !DILocation(line: 81, column: 18, scope: !120)
!122 = !DILocation(line: 81, column: 25, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !20, line: 81, column: 13)
!124 = !DILocation(line: 81, column: 27, scope: !123)
!125 = !DILocation(line: 81, column: 13, scope: !120)
!126 = !DILocation(line: 83, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !20, line: 82, column: 13)
!128 = !DILocation(line: 83, column: 17, scope: !127)
!129 = !DILocation(line: 83, column: 27, scope: !127)
!130 = !DILocation(line: 83, column: 34, scope: !127)
!131 = !DILocation(line: 84, column: 24, scope: !127)
!132 = !DILocation(line: 84, column: 17, scope: !127)
!133 = !DILocation(line: 84, column: 27, scope: !127)
!134 = !DILocation(line: 84, column: 34, scope: !127)
!135 = !DILocation(line: 85, column: 13, scope: !127)
!136 = !DILocation(line: 81, column: 35, scope: !123)
!137 = !DILocation(line: 81, column: 13, scope: !123)
!138 = distinct !{!138, !125, !139, !71}
!139 = !DILocation(line: 85, column: 13, scope: !120)
!140 = !DILocation(line: 88, column: 9, scope: !114)
!141 = !DILocation(line: 89, column: 26, scope: !114)
!142 = !DILocation(line: 89, column: 9, scope: !114)
!143 = !DILocation(line: 91, column: 1, scope: !100)
!144 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 94, type: !21, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!145 = !DILocalVariable(name: "data", scope: !144, file: !20, line: 96, type: !3)
!146 = !DILocation(line: 96, column: 21, scope: !144)
!147 = !DILocalVariable(name: "dataBadBuffer", scope: !144, file: !20, line: 97, type: !3)
!148 = !DILocation(line: 97, column: 21, scope: !144)
!149 = !DILocation(line: 97, column: 54, scope: !144)
!150 = !DILocation(line: 97, column: 37, scope: !144)
!151 = !DILocalVariable(name: "dataGoodBuffer", scope: !144, file: !20, line: 98, type: !3)
!152 = !DILocation(line: 98, column: 21, scope: !144)
!153 = !DILocation(line: 98, column: 55, scope: !144)
!154 = !DILocation(line: 98, column: 38, scope: !144)
!155 = !DILocation(line: 103, column: 16, scope: !144)
!156 = !DILocation(line: 103, column: 14, scope: !144)
!157 = !DILocalVariable(name: "source", scope: !158, file: !20, line: 111, type: !38)
!158 = distinct !DILexicalBlock(scope: !144, file: !20, line: 110, column: 5)
!159 = !DILocation(line: 111, column: 23, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !161, file: !20, line: 113, type: !44)
!161 = distinct !DILexicalBlock(scope: !158, file: !20, line: 112, column: 9)
!162 = !DILocation(line: 113, column: 20, scope: !161)
!163 = !DILocation(line: 115, column: 20, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !20, line: 115, column: 13)
!165 = !DILocation(line: 115, column: 18, scope: !164)
!166 = !DILocation(line: 115, column: 25, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !20, line: 115, column: 13)
!168 = !DILocation(line: 115, column: 27, scope: !167)
!169 = !DILocation(line: 115, column: 13, scope: !164)
!170 = !DILocation(line: 117, column: 24, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !20, line: 116, column: 13)
!172 = !DILocation(line: 117, column: 17, scope: !171)
!173 = !DILocation(line: 117, column: 27, scope: !171)
!174 = !DILocation(line: 117, column: 34, scope: !171)
!175 = !DILocation(line: 118, column: 24, scope: !171)
!176 = !DILocation(line: 118, column: 17, scope: !171)
!177 = !DILocation(line: 118, column: 27, scope: !171)
!178 = !DILocation(line: 118, column: 34, scope: !171)
!179 = !DILocation(line: 119, column: 13, scope: !171)
!180 = !DILocation(line: 115, column: 35, scope: !167)
!181 = !DILocation(line: 115, column: 13, scope: !167)
!182 = distinct !{!182, !169, !183, !71}
!183 = !DILocation(line: 119, column: 13, scope: !164)
!184 = !DILocation(line: 122, column: 9, scope: !158)
!185 = !DILocation(line: 123, column: 26, scope: !158)
!186 = !DILocation(line: 123, column: 9, scope: !158)
!187 = !DILocation(line: 125, column: 1, scope: !144)
