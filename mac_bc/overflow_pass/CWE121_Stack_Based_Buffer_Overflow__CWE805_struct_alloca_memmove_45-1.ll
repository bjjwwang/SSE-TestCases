; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !15

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 400, align 16, !dbg !33
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !34
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = alloca i8, i64 800, align 16, !dbg !37
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !36
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !39
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !40
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_badData, align 8, !dbg !42
  call void @badSink(), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !54, metadata !DIExpression()), !dbg !55
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !56, metadata !DIExpression()), !dbg !57
  %call = call i64 @time(i64* noundef null), !dbg !58
  %conv = trunc i64 %call to i32, !dbg !59
  call void @srand(i32 noundef %conv), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !61
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_good(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_bad(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !66
  ret i32 0, !dbg !67
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !68 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !69, metadata !DIExpression()), !dbg !70
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_badData, align 8, !dbg !71
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !72, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i64* %i, metadata !78, metadata !DIExpression()), !dbg !85
  store i64 0, i64* %i, align 8, !dbg !86
  br label %for.cond, !dbg !88

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !89
  %cmp = icmp ult i64 %1, 100, !dbg !91
  br i1 %cmp, label %for.body, label %for.end, !dbg !92

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !93
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !95
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !96
  store i32 0, i32* %intOne, align 8, !dbg !97
  %3 = load i64, i64* %i, align 8, !dbg !98
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !99
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !100
  store i32 0, i32* %intTwo, align 4, !dbg !101
  br label %for.inc, !dbg !102

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !103
  %inc = add i64 %4, 1, !dbg !103
  store i64 %inc, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !108
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !108
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !108
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !108
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !108
  %call = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %7, i64 noundef 800, i64 noundef %10) #4, !dbg !108
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !109
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 400, align 16, !dbg !117
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !118
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %2 = alloca i8, i64 800, align 16, !dbg !121
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !122
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !120
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !123
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !124
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_goodG2BData, align 8, !dbg !126
  call void @goodG2BSink(), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !129 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !130, metadata !DIExpression()), !dbg !131
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_goodG2BData, align 8, !dbg !132
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !138
  store i64 0, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !141

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !142
  %cmp = icmp ult i64 %1, 100, !dbg !144
  br i1 %cmp, label %for.body, label %for.end, !dbg !145

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !146
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !148
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !149
  store i32 0, i32* %intOne, align 8, !dbg !150
  %3 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !152
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !153
  store i32 0, i32* %intTwo, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %4, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !160
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !160
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !160
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !160
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !160
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !160
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !160
  %call = call i8* @__memmove_chk(i8* noundef %6, i8* noundef %7, i64 noundef 800, i64 noundef %10) #4, !dbg !160
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !161
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !161
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !162
  ret void, !dbg !163
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_badData", scope: !2, file: !17, line: 19, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !13}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_goodG2BData", scope: !2, file: !17, line: 20, type: !5, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Homebrew clang version 14.0.6"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_bad", scope: !17, file: !17, line: 44, type: !26, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !17, line: 46, type: !5)
!30 = !DILocation(line: 46, column: 21, scope: !25)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !25, file: !17, line: 47, type: !5)
!32 = !DILocation(line: 47, column: 21, scope: !25)
!33 = !DILocation(line: 47, column: 54, scope: !25)
!34 = !DILocation(line: 47, column: 37, scope: !25)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !25, file: !17, line: 48, type: !5)
!36 = !DILocation(line: 48, column: 21, scope: !25)
!37 = !DILocation(line: 48, column: 55, scope: !25)
!38 = !DILocation(line: 48, column: 38, scope: !25)
!39 = !DILocation(line: 51, column: 12, scope: !25)
!40 = !DILocation(line: 51, column: 10, scope: !25)
!41 = !DILocation(line: 52, column: 83, scope: !25)
!42 = !DILocation(line: 52, column: 81, scope: !25)
!43 = !DILocation(line: 53, column: 5, scope: !25)
!44 = !DILocation(line: 54, column: 1, scope: !25)
!45 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_45_good", scope: !17, file: !17, line: 92, type: !26, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!46 = !DILocation(line: 94, column: 5, scope: !45)
!47 = !DILocation(line: 95, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 106, type: !49, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!49 = !DISubroutineType(types: !50)
!50 = !{!11, !11, !51}
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !17, line: 106, type: !11)
!55 = !DILocation(line: 106, column: 14, scope: !48)
!56 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !17, line: 106, type: !51)
!57 = !DILocation(line: 106, column: 27, scope: !48)
!58 = !DILocation(line: 109, column: 22, scope: !48)
!59 = !DILocation(line: 109, column: 12, scope: !48)
!60 = !DILocation(line: 109, column: 5, scope: !48)
!61 = !DILocation(line: 111, column: 5, scope: !48)
!62 = !DILocation(line: 112, column: 5, scope: !48)
!63 = !DILocation(line: 113, column: 5, scope: !48)
!64 = !DILocation(line: 116, column: 5, scope: !48)
!65 = !DILocation(line: 117, column: 5, scope: !48)
!66 = !DILocation(line: 118, column: 5, scope: !48)
!67 = !DILocation(line: 120, column: 5, scope: !48)
!68 = distinct !DISubprogram(name: "badSink", scope: !17, file: !17, line: 24, type: !26, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!69 = !DILocalVariable(name: "data", scope: !68, file: !17, line: 26, type: !5)
!70 = !DILocation(line: 26, column: 21, scope: !68)
!71 = !DILocation(line: 26, column: 28, scope: !68)
!72 = !DILocalVariable(name: "source", scope: !73, file: !17, line: 28, type: !74)
!73 = distinct !DILexicalBlock(scope: !68, file: !17, line: 27, column: 5)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 100)
!77 = !DILocation(line: 28, column: 23, scope: !73)
!78 = !DILocalVariable(name: "i", scope: !79, file: !17, line: 30, type: !80)
!79 = distinct !DILexicalBlock(scope: !73, file: !17, line: 29, column: 9)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !81, line: 31, baseType: !82)
!81 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !83, line: 94, baseType: !84)
!83 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!84 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!85 = !DILocation(line: 30, column: 20, scope: !79)
!86 = !DILocation(line: 32, column: 20, scope: !87)
!87 = distinct !DILexicalBlock(scope: !79, file: !17, line: 32, column: 13)
!88 = !DILocation(line: 32, column: 18, scope: !87)
!89 = !DILocation(line: 32, column: 25, scope: !90)
!90 = distinct !DILexicalBlock(scope: !87, file: !17, line: 32, column: 13)
!91 = !DILocation(line: 32, column: 27, scope: !90)
!92 = !DILocation(line: 32, column: 13, scope: !87)
!93 = !DILocation(line: 34, column: 24, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !17, line: 33, column: 13)
!95 = !DILocation(line: 34, column: 17, scope: !94)
!96 = !DILocation(line: 34, column: 27, scope: !94)
!97 = !DILocation(line: 34, column: 34, scope: !94)
!98 = !DILocation(line: 35, column: 24, scope: !94)
!99 = !DILocation(line: 35, column: 17, scope: !94)
!100 = !DILocation(line: 35, column: 27, scope: !94)
!101 = !DILocation(line: 35, column: 34, scope: !94)
!102 = !DILocation(line: 36, column: 13, scope: !94)
!103 = !DILocation(line: 32, column: 35, scope: !90)
!104 = !DILocation(line: 32, column: 13, scope: !90)
!105 = distinct !{!105, !92, !106, !107}
!106 = !DILocation(line: 36, column: 13, scope: !87)
!107 = !{!"llvm.loop.mustprogress"}
!108 = !DILocation(line: 39, column: 9, scope: !73)
!109 = !DILocation(line: 40, column: 26, scope: !73)
!110 = !DILocation(line: 40, column: 9, scope: !73)
!111 = !DILocation(line: 42, column: 1, scope: !68)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 81, type: !26, scopeLine: 82, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!113 = !DILocalVariable(name: "data", scope: !112, file: !17, line: 83, type: !5)
!114 = !DILocation(line: 83, column: 21, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !17, line: 84, type: !5)
!116 = !DILocation(line: 84, column: 21, scope: !112)
!117 = !DILocation(line: 84, column: 54, scope: !112)
!118 = !DILocation(line: 84, column: 37, scope: !112)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !17, line: 85, type: !5)
!120 = !DILocation(line: 85, column: 21, scope: !112)
!121 = !DILocation(line: 85, column: 55, scope: !112)
!122 = !DILocation(line: 85, column: 38, scope: !112)
!123 = !DILocation(line: 87, column: 12, scope: !112)
!124 = !DILocation(line: 87, column: 10, scope: !112)
!125 = !DILocation(line: 88, column: 87, scope: !112)
!126 = !DILocation(line: 88, column: 85, scope: !112)
!127 = !DILocation(line: 89, column: 5, scope: !112)
!128 = !DILocation(line: 90, column: 1, scope: !112)
!129 = distinct !DISubprogram(name: "goodG2BSink", scope: !17, file: !17, line: 61, type: !26, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!130 = !DILocalVariable(name: "data", scope: !129, file: !17, line: 63, type: !5)
!131 = !DILocation(line: 63, column: 21, scope: !129)
!132 = !DILocation(line: 63, column: 28, scope: !129)
!133 = !DILocalVariable(name: "source", scope: !134, file: !17, line: 65, type: !74)
!134 = distinct !DILexicalBlock(scope: !129, file: !17, line: 64, column: 5)
!135 = !DILocation(line: 65, column: 23, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !137, file: !17, line: 67, type: !80)
!137 = distinct !DILexicalBlock(scope: !134, file: !17, line: 66, column: 9)
!138 = !DILocation(line: 67, column: 20, scope: !137)
!139 = !DILocation(line: 69, column: 20, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !17, line: 69, column: 13)
!141 = !DILocation(line: 69, column: 18, scope: !140)
!142 = !DILocation(line: 69, column: 25, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !17, line: 69, column: 13)
!144 = !DILocation(line: 69, column: 27, scope: !143)
!145 = !DILocation(line: 69, column: 13, scope: !140)
!146 = !DILocation(line: 71, column: 24, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !17, line: 70, column: 13)
!148 = !DILocation(line: 71, column: 17, scope: !147)
!149 = !DILocation(line: 71, column: 27, scope: !147)
!150 = !DILocation(line: 71, column: 34, scope: !147)
!151 = !DILocation(line: 72, column: 24, scope: !147)
!152 = !DILocation(line: 72, column: 17, scope: !147)
!153 = !DILocation(line: 72, column: 27, scope: !147)
!154 = !DILocation(line: 72, column: 34, scope: !147)
!155 = !DILocation(line: 73, column: 13, scope: !147)
!156 = !DILocation(line: 69, column: 35, scope: !143)
!157 = !DILocation(line: 69, column: 13, scope: !143)
!158 = distinct !{!158, !145, !159, !107}
!159 = !DILocation(line: 73, column: 13, scope: !140)
!160 = !DILocation(line: 76, column: 9, scope: !134)
!161 = !DILocation(line: 77, column: 26, scope: !134)
!162 = !DILocation(line: 77, column: 9, scope: !134)
!163 = !DILocation(line: 79, column: 1, scope: !129)
