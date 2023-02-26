; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion, metadata !26, metadata !DIExpression()), !dbg !32
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
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !44
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !46, metadata !DIExpression()), !dbg !48
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !49
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
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !86
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !86
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !86
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !86
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !86
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !86
  %16 = call i64 @llvm.objectsize.i64.p0i8(i8* %15, i1 false, i1 true, i1 false), !dbg !86
  %call = call i8* @__memmove_chk(i8* noundef %12, i8* noundef %13, i64 noundef 800, i64 noundef %16) #4, !dbg !86
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !87
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !87
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 400, align 16, !dbg !120
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !121
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %2 = alloca i8, i64 800, align 16, !dbg !124
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !125
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !123
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !126
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !127
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !129
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !131, metadata !DIExpression()), !dbg !133
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !134
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !134
  store %struct._twoIntsStruct* %6, %struct._twoIntsStruct** %data1, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !135, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i64, i64* %i, align 8, !dbg !144
  %cmp = icmp ult i64 %7, 100, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %8 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !150
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !151
  store i32 0, i32* %intOne, align 8, !dbg !152
  %9 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !154
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !155
  store i32 0, i32* %intTwo, align 4, !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !158
  %inc = add i64 %10, 1, !dbg !158
  store i64 %inc, i64* %i, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !162
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !162
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !162
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !162
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !162
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !162
  %16 = call i64 @llvm.objectsize.i64.p0i8(i8* %15, i1 false, i1 true, i1 false), !dbg !162
  %call = call i8* @__memmove_chk(i8* noundef %12, i8* noundef %13, i64 noundef 800, i64 noundef %16) #4, !dbg !162
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !163
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !163
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !164
  ret void, !dbg !165
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_bad", scope: !20, file: !20, line: 27, type: !21, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 29, type: !3)
!25 = !DILocation(line: 29, column: 21, scope: !19)
!26 = !DILocalVariable(name: "myUnion", scope: !19, file: !20, line: 30, type: !27)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_unionType", file: !20, line: 23, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !20, line: 19, size: 64, elements: !29)
!29 = !{!30, !31}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !28, file: !20, line: 21, baseType: !3, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !28, file: !20, line: 22, baseType: !3, size: 64)
!32 = !DILocation(line: 30, column: 83, scope: !19)
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
!86 = !DILocation(line: 51, column: 13, scope: !51)
!87 = !DILocation(line: 52, column: 30, scope: !51)
!88 = !DILocation(line: 52, column: 13, scope: !51)
!89 = !DILocation(line: 55, column: 1, scope: !19)
!90 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_34_good", scope: !20, file: !20, line: 91, type: !21, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!91 = !DILocation(line: 93, column: 5, scope: !90)
!92 = !DILocation(line: 94, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 105, type: !94, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!94 = !DISubroutineType(types: !95)
!95 = !{!9, !9, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !20, line: 105, type: !9)
!100 = !DILocation(line: 105, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !20, line: 105, type: !96)
!102 = !DILocation(line: 105, column: 27, scope: !93)
!103 = !DILocation(line: 108, column: 22, scope: !93)
!104 = !DILocation(line: 108, column: 12, scope: !93)
!105 = !DILocation(line: 108, column: 5, scope: !93)
!106 = !DILocation(line: 110, column: 5, scope: !93)
!107 = !DILocation(line: 111, column: 5, scope: !93)
!108 = !DILocation(line: 112, column: 5, scope: !93)
!109 = !DILocation(line: 115, column: 5, scope: !93)
!110 = !DILocation(line: 116, column: 5, scope: !93)
!111 = !DILocation(line: 117, column: 5, scope: !93)
!112 = !DILocation(line: 119, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 62, type: !21, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!114 = !DILocalVariable(name: "data", scope: !113, file: !20, line: 64, type: !3)
!115 = !DILocation(line: 64, column: 21, scope: !113)
!116 = !DILocalVariable(name: "myUnion", scope: !113, file: !20, line: 65, type: !27)
!117 = !DILocation(line: 65, column: 83, scope: !113)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !20, line: 66, type: !3)
!119 = !DILocation(line: 66, column: 21, scope: !113)
!120 = !DILocation(line: 66, column: 54, scope: !113)
!121 = !DILocation(line: 66, column: 37, scope: !113)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !20, line: 67, type: !3)
!123 = !DILocation(line: 67, column: 21, scope: !113)
!124 = !DILocation(line: 67, column: 55, scope: !113)
!125 = !DILocation(line: 67, column: 38, scope: !113)
!126 = !DILocation(line: 69, column: 12, scope: !113)
!127 = !DILocation(line: 69, column: 10, scope: !113)
!128 = !DILocation(line: 70, column: 26, scope: !113)
!129 = !DILocation(line: 70, column: 13, scope: !113)
!130 = !DILocation(line: 70, column: 24, scope: !113)
!131 = !DILocalVariable(name: "data", scope: !132, file: !20, line: 72, type: !3)
!132 = distinct !DILexicalBlock(scope: !113, file: !20, line: 71, column: 5)
!133 = !DILocation(line: 72, column: 25, scope: !132)
!134 = !DILocation(line: 72, column: 40, scope: !132)
!135 = !DILocalVariable(name: "source", scope: !136, file: !20, line: 74, type: !52)
!136 = distinct !DILexicalBlock(scope: !132, file: !20, line: 73, column: 9)
!137 = !DILocation(line: 74, column: 27, scope: !136)
!138 = !DILocalVariable(name: "i", scope: !139, file: !20, line: 76, type: !58)
!139 = distinct !DILexicalBlock(scope: !136, file: !20, line: 75, column: 13)
!140 = !DILocation(line: 76, column: 24, scope: !139)
!141 = !DILocation(line: 78, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !20, line: 78, column: 17)
!143 = !DILocation(line: 78, column: 22, scope: !142)
!144 = !DILocation(line: 78, column: 29, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !20, line: 78, column: 17)
!146 = !DILocation(line: 78, column: 31, scope: !145)
!147 = !DILocation(line: 78, column: 17, scope: !142)
!148 = !DILocation(line: 80, column: 28, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !20, line: 79, column: 17)
!150 = !DILocation(line: 80, column: 21, scope: !149)
!151 = !DILocation(line: 80, column: 31, scope: !149)
!152 = !DILocation(line: 80, column: 38, scope: !149)
!153 = !DILocation(line: 81, column: 28, scope: !149)
!154 = !DILocation(line: 81, column: 21, scope: !149)
!155 = !DILocation(line: 81, column: 31, scope: !149)
!156 = !DILocation(line: 81, column: 38, scope: !149)
!157 = !DILocation(line: 82, column: 17, scope: !149)
!158 = !DILocation(line: 78, column: 39, scope: !145)
!159 = !DILocation(line: 78, column: 17, scope: !145)
!160 = distinct !{!160, !147, !161, !85}
!161 = !DILocation(line: 82, column: 17, scope: !142)
!162 = !DILocation(line: 85, column: 13, scope: !136)
!163 = !DILocation(line: 86, column: 30, scope: !136)
!164 = !DILocation(line: 86, column: 13, scope: !136)
!165 = !DILocation(line: 89, column: 1, scope: !113)
