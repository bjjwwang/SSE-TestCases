; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !36, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !42
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !43
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_badData, align 8, !dbg !44
  call void @badSink(), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_good() #0 !dbg !47 {
entry:
  call void @goodG2B(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !56, metadata !DIExpression()), !dbg !57
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %call = call i64 @time(i64* noundef null), !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  call void @srand(i32 noundef %conv), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_good(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !66
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_bad(), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !68
  ret i32 0, !dbg !69
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !70 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_badData, align 8, !dbg !73
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !74, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i64* %i, metadata !77, metadata !DIExpression()), !dbg !84
  store i64 0, i64* %i, align 8, !dbg !85
  br label %for.cond, !dbg !87

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !88
  %cmp = icmp ult i64 %1, 100, !dbg !90
  br i1 %cmp, label %for.body, label %for.end, !dbg !91

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !92
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !94
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !95
  store i32 0, i32* %intOne, align 8, !dbg !96
  %3 = load i64, i64* %i, align 8, !dbg !97
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !98
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !99
  store i32 0, i32* %intTwo, align 4, !dbg !100
  br label %for.inc, !dbg !101

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !102
  %inc = add i64 %4, 1, !dbg !102
  store i64 %inc, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !103, !llvm.loop !104

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !107, metadata !DIExpression()), !dbg !109
  store i64 0, i64* %i2, align 8, !dbg !110
  br label %for.cond3, !dbg !112

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !113
  %cmp4 = icmp ult i64 %5, 100, !dbg !115
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !116

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !117
  %7 = load i64, i64* %i2, align 8, !dbg !119
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !117
  %8 = load i64, i64* %i2, align 8, !dbg !120
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !121
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !121
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !121
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !121
  br label %for.inc8, !dbg !122

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !123
  %inc9 = add i64 %11, 1, !dbg !123
  store i64 %inc9, i64* %i2, align 8, !dbg !123
  br label %for.cond3, !dbg !124, !llvm.loop !125

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !127
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !130 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !137
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !138
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !139
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_goodG2BData, align 8, !dbg !140
  call void @goodG2BSink(), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !143 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_goodG2BData, align 8, !dbg !146
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !147, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata i64* %i, metadata !150, metadata !DIExpression()), !dbg !152
  store i64 0, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !156
  %cmp = icmp ult i64 %1, 100, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !162
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !163
  store i32 0, i32* %intOne, align 8, !dbg !164
  %3 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !166
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !167
  store i32 0, i32* %intTwo, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %4, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !174, metadata !DIExpression()), !dbg !176
  store i64 0, i64* %i2, align 8, !dbg !177
  br label %for.cond3, !dbg !179

for.cond3:                                        ; preds = %for.inc8, %for.end
  %5 = load i64, i64* %i2, align 8, !dbg !180
  %cmp4 = icmp ult i64 %5, 100, !dbg !182
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !183

for.body5:                                        ; preds = %for.cond3
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !184
  %7 = load i64, i64* %i2, align 8, !dbg !186
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !184
  %8 = load i64, i64* %i2, align 8, !dbg !187
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !188
  %9 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !188
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !188
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !188
  br label %for.inc8, !dbg !189

for.inc8:                                         ; preds = %for.body5
  %11 = load i64, i64* %i2, align 8, !dbg !190
  %inc9 = add i64 %11, 1, !dbg !190
  store i64 %inc9, i64* %i2, align 8, !dbg !190
  br label %for.cond3, !dbg !191, !llvm.loop !192

for.end10:                                        ; preds = %for.cond3
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !194
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !194
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !195
  ret void, !dbg !196
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_badData", scope: !2, file: !9, line: 19, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_goodG2BData", scope: !2, file: !9, line: 20, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !12, line: 100, baseType: !13)
!12 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !12, line: 96, size: 64, elements: !14)
!14 = !{!15, !17}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !13, file: !12, line: 98, baseType: !16, size: 32)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !13, file: !12, line: 99, baseType: !16, size: 32, offset: 32)
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Homebrew clang version 14.0.6"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_bad", scope: !9, file: !9, line: 50, type: !26, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !9, line: 52, type: !10)
!30 = !DILocation(line: 52, column: 21, scope: !25)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !25, file: !9, line: 53, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 53, column: 19, scope: !25)
!36 = !DILocalVariable(name: "dataGoodBuffer", scope: !25, file: !9, line: 54, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 6400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 54, column: 19, scope: !25)
!41 = !DILocation(line: 57, column: 12, scope: !25)
!42 = !DILocation(line: 57, column: 10, scope: !25)
!43 = !DILocation(line: 58, column: 81, scope: !25)
!44 = !DILocation(line: 58, column: 79, scope: !25)
!45 = !DILocation(line: 59, column: 5, scope: !25)
!46 = !DILocation(line: 60, column: 1, scope: !25)
!47 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_45_good", scope: !9, file: !9, line: 104, type: !26, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!48 = !DILocation(line: 106, column: 5, scope: !47)
!49 = !DILocation(line: 107, column: 1, scope: !47)
!50 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 118, type: !51, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!51 = !DISubroutineType(types: !52)
!52 = !{!16, !16, !53}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!56 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !9, line: 118, type: !16)
!57 = !DILocation(line: 118, column: 14, scope: !50)
!58 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !9, line: 118, type: !53)
!59 = !DILocation(line: 118, column: 27, scope: !50)
!60 = !DILocation(line: 121, column: 22, scope: !50)
!61 = !DILocation(line: 121, column: 12, scope: !50)
!62 = !DILocation(line: 121, column: 5, scope: !50)
!63 = !DILocation(line: 123, column: 5, scope: !50)
!64 = !DILocation(line: 124, column: 5, scope: !50)
!65 = !DILocation(line: 125, column: 5, scope: !50)
!66 = !DILocation(line: 128, column: 5, scope: !50)
!67 = !DILocation(line: 129, column: 5, scope: !50)
!68 = !DILocation(line: 130, column: 5, scope: !50)
!69 = !DILocation(line: 132, column: 5, scope: !50)
!70 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 24, type: !26, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!71 = !DILocalVariable(name: "data", scope: !70, file: !9, line: 26, type: !10)
!72 = !DILocation(line: 26, column: 21, scope: !70)
!73 = !DILocation(line: 26, column: 28, scope: !70)
!74 = !DILocalVariable(name: "source", scope: !75, file: !9, line: 28, type: !37)
!75 = distinct !DILexicalBlock(scope: !70, file: !9, line: 27, column: 5)
!76 = !DILocation(line: 28, column: 23, scope: !75)
!77 = !DILocalVariable(name: "i", scope: !78, file: !9, line: 30, type: !79)
!78 = distinct !DILexicalBlock(scope: !75, file: !9, line: 29, column: 9)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !80, line: 31, baseType: !81)
!80 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !82, line: 94, baseType: !83)
!82 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!83 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!84 = !DILocation(line: 30, column: 20, scope: !78)
!85 = !DILocation(line: 32, column: 20, scope: !86)
!86 = distinct !DILexicalBlock(scope: !78, file: !9, line: 32, column: 13)
!87 = !DILocation(line: 32, column: 18, scope: !86)
!88 = !DILocation(line: 32, column: 25, scope: !89)
!89 = distinct !DILexicalBlock(scope: !86, file: !9, line: 32, column: 13)
!90 = !DILocation(line: 32, column: 27, scope: !89)
!91 = !DILocation(line: 32, column: 13, scope: !86)
!92 = !DILocation(line: 34, column: 24, scope: !93)
!93 = distinct !DILexicalBlock(scope: !89, file: !9, line: 33, column: 13)
!94 = !DILocation(line: 34, column: 17, scope: !93)
!95 = !DILocation(line: 34, column: 27, scope: !93)
!96 = !DILocation(line: 34, column: 34, scope: !93)
!97 = !DILocation(line: 35, column: 24, scope: !93)
!98 = !DILocation(line: 35, column: 17, scope: !93)
!99 = !DILocation(line: 35, column: 27, scope: !93)
!100 = !DILocation(line: 35, column: 34, scope: !93)
!101 = !DILocation(line: 36, column: 13, scope: !93)
!102 = !DILocation(line: 32, column: 35, scope: !89)
!103 = !DILocation(line: 32, column: 13, scope: !89)
!104 = distinct !{!104, !91, !105, !106}
!105 = !DILocation(line: 36, column: 13, scope: !86)
!106 = !{!"llvm.loop.mustprogress"}
!107 = !DILocalVariable(name: "i", scope: !108, file: !9, line: 39, type: !79)
!108 = distinct !DILexicalBlock(scope: !75, file: !9, line: 38, column: 9)
!109 = !DILocation(line: 39, column: 20, scope: !108)
!110 = !DILocation(line: 41, column: 20, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !9, line: 41, column: 13)
!112 = !DILocation(line: 41, column: 18, scope: !111)
!113 = !DILocation(line: 41, column: 25, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !9, line: 41, column: 13)
!115 = !DILocation(line: 41, column: 27, scope: !114)
!116 = !DILocation(line: 41, column: 13, scope: !111)
!117 = !DILocation(line: 43, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !9, line: 42, column: 13)
!119 = !DILocation(line: 43, column: 22, scope: !118)
!120 = !DILocation(line: 43, column: 34, scope: !118)
!121 = !DILocation(line: 43, column: 27, scope: !118)
!122 = !DILocation(line: 44, column: 13, scope: !118)
!123 = !DILocation(line: 41, column: 35, scope: !114)
!124 = !DILocation(line: 41, column: 13, scope: !114)
!125 = distinct !{!125, !116, !126, !106}
!126 = !DILocation(line: 44, column: 13, scope: !111)
!127 = !DILocation(line: 45, column: 30, scope: !108)
!128 = !DILocation(line: 45, column: 13, scope: !108)
!129 = !DILocation(line: 48, column: 1, scope: !70)
!130 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 93, type: !26, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!131 = !DILocalVariable(name: "data", scope: !130, file: !9, line: 95, type: !10)
!132 = !DILocation(line: 95, column: 21, scope: !130)
!133 = !DILocalVariable(name: "dataBadBuffer", scope: !130, file: !9, line: 96, type: !32)
!134 = !DILocation(line: 96, column: 19, scope: !130)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !130, file: !9, line: 97, type: !37)
!136 = !DILocation(line: 97, column: 19, scope: !130)
!137 = !DILocation(line: 99, column: 12, scope: !130)
!138 = !DILocation(line: 99, column: 10, scope: !130)
!139 = !DILocation(line: 100, column: 85, scope: !130)
!140 = !DILocation(line: 100, column: 83, scope: !130)
!141 = !DILocation(line: 101, column: 5, scope: !130)
!142 = !DILocation(line: 102, column: 1, scope: !130)
!143 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 67, type: !26, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!144 = !DILocalVariable(name: "data", scope: !143, file: !9, line: 69, type: !10)
!145 = !DILocation(line: 69, column: 21, scope: !143)
!146 = !DILocation(line: 69, column: 28, scope: !143)
!147 = !DILocalVariable(name: "source", scope: !148, file: !9, line: 71, type: !37)
!148 = distinct !DILexicalBlock(scope: !143, file: !9, line: 70, column: 5)
!149 = !DILocation(line: 71, column: 23, scope: !148)
!150 = !DILocalVariable(name: "i", scope: !151, file: !9, line: 73, type: !79)
!151 = distinct !DILexicalBlock(scope: !148, file: !9, line: 72, column: 9)
!152 = !DILocation(line: 73, column: 20, scope: !151)
!153 = !DILocation(line: 75, column: 20, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !9, line: 75, column: 13)
!155 = !DILocation(line: 75, column: 18, scope: !154)
!156 = !DILocation(line: 75, column: 25, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !9, line: 75, column: 13)
!158 = !DILocation(line: 75, column: 27, scope: !157)
!159 = !DILocation(line: 75, column: 13, scope: !154)
!160 = !DILocation(line: 77, column: 24, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !9, line: 76, column: 13)
!162 = !DILocation(line: 77, column: 17, scope: !161)
!163 = !DILocation(line: 77, column: 27, scope: !161)
!164 = !DILocation(line: 77, column: 34, scope: !161)
!165 = !DILocation(line: 78, column: 24, scope: !161)
!166 = !DILocation(line: 78, column: 17, scope: !161)
!167 = !DILocation(line: 78, column: 27, scope: !161)
!168 = !DILocation(line: 78, column: 34, scope: !161)
!169 = !DILocation(line: 79, column: 13, scope: !161)
!170 = !DILocation(line: 75, column: 35, scope: !157)
!171 = !DILocation(line: 75, column: 13, scope: !157)
!172 = distinct !{!172, !159, !173, !106}
!173 = !DILocation(line: 79, column: 13, scope: !154)
!174 = !DILocalVariable(name: "i", scope: !175, file: !9, line: 82, type: !79)
!175 = distinct !DILexicalBlock(scope: !148, file: !9, line: 81, column: 9)
!176 = !DILocation(line: 82, column: 20, scope: !175)
!177 = !DILocation(line: 84, column: 20, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !9, line: 84, column: 13)
!179 = !DILocation(line: 84, column: 18, scope: !178)
!180 = !DILocation(line: 84, column: 25, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !9, line: 84, column: 13)
!182 = !DILocation(line: 84, column: 27, scope: !181)
!183 = !DILocation(line: 84, column: 13, scope: !178)
!184 = !DILocation(line: 86, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !9, line: 85, column: 13)
!186 = !DILocation(line: 86, column: 22, scope: !185)
!187 = !DILocation(line: 86, column: 34, scope: !185)
!188 = !DILocation(line: 86, column: 27, scope: !185)
!189 = !DILocation(line: 87, column: 13, scope: !185)
!190 = !DILocation(line: 84, column: 35, scope: !181)
!191 = !DILocation(line: 84, column: 13, scope: !181)
!192 = distinct !{!192, !183, !193, !106}
!193 = !DILocation(line: 87, column: 13, scope: !178)
!194 = !DILocation(line: 88, column: 30, scope: !175)
!195 = !DILocation(line: 88, column: 13, scope: !175)
!196 = !DILocation(line: 91, column: 1, scope: !143)
