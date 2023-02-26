; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03_bad() #0 !dbg !19 {
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
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %5, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !62
  store i32 0, i32* %intOne, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !65
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !66
  store i32 0, i32* %intTwo, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %8, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !74
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !74
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !74
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !74
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !74
  %call = call i8* @__memmove_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !74
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !75
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03_good() #0 !dbg !78 {
entry:
  call void @goodG2B1(), !dbg !79
  call void @goodG2B2(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* noundef null), !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 noundef %conv), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03_good(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03_bad(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !102 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %0 = alloca i8, i64 400, align 16, !dbg !107
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !108
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %2 = alloca i8, i64 800, align 16, !dbg !111
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !112
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !110
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !113
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !117, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i64* %i, metadata !120, metadata !DIExpression()), !dbg !122
  store i64 0, i64* %i, align 8, !dbg !123
  br label %for.cond, !dbg !125

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !126
  %cmp = icmp ult i64 %5, 100, !dbg !128
  br i1 %cmp, label %for.body, label %for.end, !dbg !129

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !132
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !133
  store i32 0, i32* %intOne, align 8, !dbg !134
  %7 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !136
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !137
  store i32 0, i32* %intTwo, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %8, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !144
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !144
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !144
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !144
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !144
  %call = call i8* @__memmove_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !144
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !145
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !146
  ret void, !dbg !147
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !148 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  %0 = alloca i8, i64 400, align 16, !dbg !153
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !154
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %2 = alloca i8, i64 800, align 16, !dbg !157
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !158
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !156
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !159
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !163, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !168
  store i64 0, i64* %i, align 8, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !172
  %cmp = icmp ult i64 %5, 100, !dbg !174
  br i1 %cmp, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !178
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !179
  store i32 0, i32* %intOne, align 8, !dbg !180
  %7 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !182
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !183
  store i32 0, i32* %intTwo, align 4, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %8, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !190
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !190
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !190
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !190
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !190
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !190
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !190
  %call = call i8* @__memmove_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !190
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !191
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !192
  ret void, !dbg !193
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 30, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !20, line: 27, column: 5)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!37 = !DILocation(line: 30, column: 14, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !20, line: 33, type: !40)
!39 = distinct !DILexicalBlock(scope: !19, file: !20, line: 32, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 33, column: 23, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !20, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !20, line: 34, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !49, line: 94, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 35, column: 20, scope: !45)
!52 = !DILocation(line: 37, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !20, line: 37, column: 13)
!54 = !DILocation(line: 37, column: 18, scope: !53)
!55 = !DILocation(line: 37, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !20, line: 37, column: 13)
!57 = !DILocation(line: 37, column: 27, scope: !56)
!58 = !DILocation(line: 37, column: 13, scope: !53)
!59 = !DILocation(line: 39, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !20, line: 38, column: 13)
!61 = !DILocation(line: 39, column: 17, scope: !60)
!62 = !DILocation(line: 39, column: 27, scope: !60)
!63 = !DILocation(line: 39, column: 34, scope: !60)
!64 = !DILocation(line: 40, column: 24, scope: !60)
!65 = !DILocation(line: 40, column: 17, scope: !60)
!66 = !DILocation(line: 40, column: 27, scope: !60)
!67 = !DILocation(line: 40, column: 34, scope: !60)
!68 = !DILocation(line: 41, column: 13, scope: !60)
!69 = !DILocation(line: 37, column: 35, scope: !56)
!70 = !DILocation(line: 37, column: 13, scope: !56)
!71 = distinct !{!71, !58, !72, !73}
!72 = !DILocation(line: 41, column: 13, scope: !53)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 44, column: 9, scope: !39)
!75 = !DILocation(line: 45, column: 26, scope: !39)
!76 = !DILocation(line: 45, column: 9, scope: !39)
!77 = !DILocation(line: 47, column: 1, scope: !19)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_03_good", scope: !20, file: !20, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!79 = !DILocation(line: 116, column: 5, scope: !78)
!80 = !DILocation(line: 117, column: 5, scope: !78)
!81 = !DILocation(line: 118, column: 1, scope: !78)
!82 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 130, type: !83, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!83 = !DISubroutineType(types: !84)
!84 = !{!9, !9, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !20, line: 130, type: !9)
!89 = !DILocation(line: 130, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !20, line: 130, type: !85)
!91 = !DILocation(line: 130, column: 27, scope: !82)
!92 = !DILocation(line: 133, column: 22, scope: !82)
!93 = !DILocation(line: 133, column: 12, scope: !82)
!94 = !DILocation(line: 133, column: 5, scope: !82)
!95 = !DILocation(line: 135, column: 5, scope: !82)
!96 = !DILocation(line: 136, column: 5, scope: !82)
!97 = !DILocation(line: 137, column: 5, scope: !82)
!98 = !DILocation(line: 140, column: 5, scope: !82)
!99 = !DILocation(line: 141, column: 5, scope: !82)
!100 = !DILocation(line: 142, column: 5, scope: !82)
!101 = !DILocation(line: 144, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!103 = !DILocalVariable(name: "data", scope: !102, file: !20, line: 56, type: !3)
!104 = !DILocation(line: 56, column: 21, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !20, line: 57, type: !3)
!106 = !DILocation(line: 57, column: 21, scope: !102)
!107 = !DILocation(line: 57, column: 54, scope: !102)
!108 = !DILocation(line: 57, column: 37, scope: !102)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !20, line: 58, type: !3)
!110 = !DILocation(line: 58, column: 21, scope: !102)
!111 = !DILocation(line: 58, column: 55, scope: !102)
!112 = !DILocation(line: 58, column: 38, scope: !102)
!113 = !DILocation(line: 67, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !115, file: !20, line: 65, column: 5)
!115 = distinct !DILexicalBlock(scope: !102, file: !20, line: 59, column: 8)
!116 = !DILocation(line: 67, column: 14, scope: !114)
!117 = !DILocalVariable(name: "source", scope: !118, file: !20, line: 70, type: !40)
!118 = distinct !DILexicalBlock(scope: !102, file: !20, line: 69, column: 5)
!119 = !DILocation(line: 70, column: 23, scope: !118)
!120 = !DILocalVariable(name: "i", scope: !121, file: !20, line: 72, type: !46)
!121 = distinct !DILexicalBlock(scope: !118, file: !20, line: 71, column: 9)
!122 = !DILocation(line: 72, column: 20, scope: !121)
!123 = !DILocation(line: 74, column: 20, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !20, line: 74, column: 13)
!125 = !DILocation(line: 74, column: 18, scope: !124)
!126 = !DILocation(line: 74, column: 25, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !20, line: 74, column: 13)
!128 = !DILocation(line: 74, column: 27, scope: !127)
!129 = !DILocation(line: 74, column: 13, scope: !124)
!130 = !DILocation(line: 76, column: 24, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !20, line: 75, column: 13)
!132 = !DILocation(line: 76, column: 17, scope: !131)
!133 = !DILocation(line: 76, column: 27, scope: !131)
!134 = !DILocation(line: 76, column: 34, scope: !131)
!135 = !DILocation(line: 77, column: 24, scope: !131)
!136 = !DILocation(line: 77, column: 17, scope: !131)
!137 = !DILocation(line: 77, column: 27, scope: !131)
!138 = !DILocation(line: 77, column: 34, scope: !131)
!139 = !DILocation(line: 78, column: 13, scope: !131)
!140 = !DILocation(line: 74, column: 35, scope: !127)
!141 = !DILocation(line: 74, column: 13, scope: !127)
!142 = distinct !{!142, !129, !143, !73}
!143 = !DILocation(line: 78, column: 13, scope: !124)
!144 = !DILocation(line: 81, column: 9, scope: !118)
!145 = !DILocation(line: 82, column: 26, scope: !118)
!146 = !DILocation(line: 82, column: 9, scope: !118)
!147 = !DILocation(line: 84, column: 1, scope: !102)
!148 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!149 = !DILocalVariable(name: "data", scope: !148, file: !20, line: 89, type: !3)
!150 = !DILocation(line: 89, column: 21, scope: !148)
!151 = !DILocalVariable(name: "dataBadBuffer", scope: !148, file: !20, line: 90, type: !3)
!152 = !DILocation(line: 90, column: 21, scope: !148)
!153 = !DILocation(line: 90, column: 54, scope: !148)
!154 = !DILocation(line: 90, column: 37, scope: !148)
!155 = !DILocalVariable(name: "dataGoodBuffer", scope: !148, file: !20, line: 91, type: !3)
!156 = !DILocation(line: 91, column: 21, scope: !148)
!157 = !DILocation(line: 91, column: 55, scope: !148)
!158 = !DILocation(line: 91, column: 38, scope: !148)
!159 = !DILocation(line: 95, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !161, file: !20, line: 93, column: 5)
!161 = distinct !DILexicalBlock(scope: !148, file: !20, line: 92, column: 8)
!162 = !DILocation(line: 95, column: 14, scope: !160)
!163 = !DILocalVariable(name: "source", scope: !164, file: !20, line: 98, type: !40)
!164 = distinct !DILexicalBlock(scope: !148, file: !20, line: 97, column: 5)
!165 = !DILocation(line: 98, column: 23, scope: !164)
!166 = !DILocalVariable(name: "i", scope: !167, file: !20, line: 100, type: !46)
!167 = distinct !DILexicalBlock(scope: !164, file: !20, line: 99, column: 9)
!168 = !DILocation(line: 100, column: 20, scope: !167)
!169 = !DILocation(line: 102, column: 20, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !20, line: 102, column: 13)
!171 = !DILocation(line: 102, column: 18, scope: !170)
!172 = !DILocation(line: 102, column: 25, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !20, line: 102, column: 13)
!174 = !DILocation(line: 102, column: 27, scope: !173)
!175 = !DILocation(line: 102, column: 13, scope: !170)
!176 = !DILocation(line: 104, column: 24, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !20, line: 103, column: 13)
!178 = !DILocation(line: 104, column: 17, scope: !177)
!179 = !DILocation(line: 104, column: 27, scope: !177)
!180 = !DILocation(line: 104, column: 34, scope: !177)
!181 = !DILocation(line: 105, column: 24, scope: !177)
!182 = !DILocation(line: 105, column: 17, scope: !177)
!183 = !DILocation(line: 105, column: 27, scope: !177)
!184 = !DILocation(line: 105, column: 34, scope: !177)
!185 = !DILocation(line: 106, column: 13, scope: !177)
!186 = !DILocation(line: 102, column: 35, scope: !173)
!187 = !DILocation(line: 102, column: 13, scope: !173)
!188 = distinct !{!188, !175, !189, !73}
!189 = !DILocation(line: 106, column: 13, scope: !170)
!190 = !DILocation(line: 109, column: 9, scope: !164)
!191 = !DILocation(line: 110, column: 26, scope: !164)
!192 = !DILocation(line: 110, column: 9, scope: !164)
!193 = !DILocation(line: 112, column: 1, scope: !148)
