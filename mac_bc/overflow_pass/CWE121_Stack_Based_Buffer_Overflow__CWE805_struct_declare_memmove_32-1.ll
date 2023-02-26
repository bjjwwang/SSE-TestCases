; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_bad() #0 !dbg !11 {
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
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !89
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !89
  %arraydecay4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !89
  %12 = bitcast %struct._twoIntsStruct* %arraydecay4 to i8*, !dbg !89
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !89
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !89
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !89
  %call = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !89
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !90
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !90
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_good() #0 !dbg !93 {
entry:
  call void @goodG2B(), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !96 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !102, metadata !DIExpression()), !dbg !103
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !104, metadata !DIExpression()), !dbg !105
  %call = call i64 @time(i64* noundef null), !dbg !106
  %conv = trunc i64 %call to i32, !dbg !107
  call void @srand(i32 noundef %conv), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_good(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !112
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_bad(), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !114
  ret i32 0, !dbg !115
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !116 {
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
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr1, metadata !119, metadata !DIExpression()), !dbg !120
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct*** %dataPtr2, metadata !121, metadata !DIExpression()), !dbg !122
  store %struct._twoIntsStruct** %data, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !127, metadata !DIExpression()), !dbg !129
  %0 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !130
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %0, align 8, !dbg !131
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !129
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !132
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data1, align 8, !dbg !133
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !134
  %3 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr1, align 8, !dbg !135
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %3, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data2, metadata !137, metadata !DIExpression()), !dbg !139
  %4 = load %struct._twoIntsStruct**, %struct._twoIntsStruct*** %dataPtr2, align 8, !dbg !140
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %4, align 8, !dbg !141
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data2, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !150

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !151
  %cmp = icmp ult i64 %6, 100, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !157
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !158
  store i32 0, i32* %intOne, align 8, !dbg !159
  %8 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !161
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !162
  store i32 0, i32* %intTwo, align 4, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %9, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !169
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !169
  %arraydecay4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !169
  %12 = bitcast %struct._twoIntsStruct* %arraydecay4 to i8*, !dbg !169
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !169
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !169
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !169
  %call = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !169
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data2, align 8, !dbg !170
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !170
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!89 = !DILocation(line: 49, column: 13, scope: !57)
!90 = !DILocation(line: 50, column: 30, scope: !57)
!91 = !DILocation(line: 50, column: 13, scope: !57)
!92 = !DILocation(line: 53, column: 1, scope: !11)
!93 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_32_good", scope: !12, file: !12, line: 93, type: !13, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DILocation(line: 95, column: 5, scope: !93)
!95 = !DILocation(line: 96, column: 1, scope: !93)
!96 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !97, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DISubroutineType(types: !98)
!98 = !{!23, !23, !99}
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!102 = !DILocalVariable(name: "argc", arg: 1, scope: !96, file: !12, line: 107, type: !23)
!103 = !DILocation(line: 107, column: 14, scope: !96)
!104 = !DILocalVariable(name: "argv", arg: 2, scope: !96, file: !12, line: 107, type: !99)
!105 = !DILocation(line: 107, column: 27, scope: !96)
!106 = !DILocation(line: 110, column: 22, scope: !96)
!107 = !DILocation(line: 110, column: 12, scope: !96)
!108 = !DILocation(line: 110, column: 5, scope: !96)
!109 = !DILocation(line: 112, column: 5, scope: !96)
!110 = !DILocation(line: 113, column: 5, scope: !96)
!111 = !DILocation(line: 114, column: 5, scope: !96)
!112 = !DILocation(line: 117, column: 5, scope: !96)
!113 = !DILocation(line: 118, column: 5, scope: !96)
!114 = !DILocation(line: 119, column: 5, scope: !96)
!115 = !DILocation(line: 121, column: 5, scope: !96)
!116 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!117 = !DILocalVariable(name: "data", scope: !116, file: !12, line: 62, type: !17)
!118 = !DILocation(line: 62, column: 21, scope: !116)
!119 = !DILocalVariable(name: "dataPtr1", scope: !116, file: !12, line: 63, type: !27)
!120 = !DILocation(line: 63, column: 22, scope: !116)
!121 = !DILocalVariable(name: "dataPtr2", scope: !116, file: !12, line: 64, type: !27)
!122 = !DILocation(line: 64, column: 22, scope: !116)
!123 = !DILocalVariable(name: "dataBadBuffer", scope: !116, file: !12, line: 65, type: !32)
!124 = !DILocation(line: 65, column: 19, scope: !116)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !116, file: !12, line: 66, type: !37)
!126 = !DILocation(line: 66, column: 19, scope: !116)
!127 = !DILocalVariable(name: "data", scope: !128, file: !12, line: 68, type: !17)
!128 = distinct !DILexicalBlock(scope: !116, file: !12, line: 67, column: 5)
!129 = !DILocation(line: 68, column: 25, scope: !128)
!130 = !DILocation(line: 68, column: 33, scope: !128)
!131 = !DILocation(line: 68, column: 32, scope: !128)
!132 = !DILocation(line: 70, column: 16, scope: !128)
!133 = !DILocation(line: 70, column: 14, scope: !128)
!134 = !DILocation(line: 71, column: 21, scope: !128)
!135 = !DILocation(line: 71, column: 10, scope: !128)
!136 = !DILocation(line: 71, column: 19, scope: !128)
!137 = !DILocalVariable(name: "data", scope: !138, file: !12, line: 74, type: !17)
!138 = distinct !DILexicalBlock(scope: !116, file: !12, line: 73, column: 5)
!139 = !DILocation(line: 74, column: 25, scope: !138)
!140 = !DILocation(line: 74, column: 33, scope: !138)
!141 = !DILocation(line: 74, column: 32, scope: !138)
!142 = !DILocalVariable(name: "source", scope: !143, file: !12, line: 76, type: !37)
!143 = distinct !DILexicalBlock(scope: !138, file: !12, line: 75, column: 9)
!144 = !DILocation(line: 76, column: 27, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 78, type: !61)
!146 = distinct !DILexicalBlock(scope: !143, file: !12, line: 77, column: 13)
!147 = !DILocation(line: 78, column: 24, scope: !146)
!148 = !DILocation(line: 80, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !12, line: 80, column: 17)
!150 = !DILocation(line: 80, column: 22, scope: !149)
!151 = !DILocation(line: 80, column: 29, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !12, line: 80, column: 17)
!153 = !DILocation(line: 80, column: 31, scope: !152)
!154 = !DILocation(line: 80, column: 17, scope: !149)
!155 = !DILocation(line: 82, column: 28, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !12, line: 81, column: 17)
!157 = !DILocation(line: 82, column: 21, scope: !156)
!158 = !DILocation(line: 82, column: 31, scope: !156)
!159 = !DILocation(line: 82, column: 38, scope: !156)
!160 = !DILocation(line: 83, column: 28, scope: !156)
!161 = !DILocation(line: 83, column: 21, scope: !156)
!162 = !DILocation(line: 83, column: 31, scope: !156)
!163 = !DILocation(line: 83, column: 38, scope: !156)
!164 = !DILocation(line: 84, column: 17, scope: !156)
!165 = !DILocation(line: 80, column: 39, scope: !152)
!166 = !DILocation(line: 80, column: 17, scope: !152)
!167 = distinct !{!167, !154, !168, !88}
!168 = !DILocation(line: 84, column: 17, scope: !149)
!169 = !DILocation(line: 87, column: 13, scope: !143)
!170 = !DILocation(line: 88, column: 30, scope: !143)
!171 = !DILocation(line: 88, column: 13, scope: !143)
!172 = !DILocation(line: 91, column: 1, scope: !116)
