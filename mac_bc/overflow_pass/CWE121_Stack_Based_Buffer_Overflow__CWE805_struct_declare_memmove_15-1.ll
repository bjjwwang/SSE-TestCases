; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !38, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i64* %i, metadata !41, metadata !DIExpression()), !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %0, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !58
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !59
  store i32 0, i32* %intOne, align 8, !dbg !60
  %2 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !62
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !63
  store i32 0, i32* %intTwo, align 4, !dbg !64
  br label %for.inc, !dbg !65

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !66
  %inc = add i64 %3, 1, !dbg !66
  store i64 %inc, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !67, !llvm.loop !68

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !71
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !71
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !71
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !71
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !71
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !71
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !72
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15_good() #0 !dbg !75 {
entry:
  call void @goodG2B1(), !dbg !76
  call void @goodG2B2(), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !79 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !85, metadata !DIExpression()), !dbg !86
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !87, metadata !DIExpression()), !dbg !88
  %call = call i64 @time(i64* noundef null), !dbg !89
  %conv = trunc i64 %call to i32, !dbg !90
  call void @srand(i32 noundef %conv), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15_good(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !95
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15_bad(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !97
  ret i32 0, !dbg !98
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !99 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !106
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !107
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i64* %i, metadata !111, metadata !DIExpression()), !dbg !113
  store i64 0, i64* %i, align 8, !dbg !114
  br label %for.cond, !dbg !116

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !117
  %cmp = icmp ult i64 %0, 100, !dbg !119
  br i1 %cmp, label %for.body, label %for.end, !dbg !120

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !121
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !123
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !124
  store i32 0, i32* %intOne, align 8, !dbg !125
  %2 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !127
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !128
  store i32 0, i32* %intTwo, align 4, !dbg !129
  br label %for.inc, !dbg !130

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !131
  %inc = add i64 %3, 1, !dbg !131
  store i64 %inc, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !132, !llvm.loop !133

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !135
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !135
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !135
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !135
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !135
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !135
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !135
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !136
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !136
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !146
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata i64* %i, metadata !151, metadata !DIExpression()), !dbg !153
  store i64 0, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !156

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !157
  %cmp = icmp ult i64 %0, 100, !dbg !159
  br i1 %cmp, label %for.body, label %for.end, !dbg !160

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !163
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !164
  store i32 0, i32* %intOne, align 8, !dbg !165
  %2 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !167
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !168
  store i32 0, i32* %intTwo, align 4, !dbg !169
  br label %for.inc, !dbg !170

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !171
  %inc = add i64 %3, 1, !dbg !171
  store i64 %inc, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !172, !llvm.loop !173

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !175
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !175
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !175
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !175
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !175
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !175
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !175
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !175
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !176
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !176
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !177
  ret void, !dbg !178
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 24, column: 19, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 25, column: 19, scope: !11)
!36 = !DILocation(line: 31, column: 16, scope: !11)
!37 = !DILocation(line: 31, column: 14, scope: !11)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 39, type: !32)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!40 = !DILocation(line: 39, column: 23, scope: !39)
!41 = !DILocalVariable(name: "i", scope: !42, file: !12, line: 41, type: !43)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 40, column: 9)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 31, baseType: !45)
!44 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !46, line: 94, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 41, column: 20, scope: !42)
!49 = !DILocation(line: 43, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !42, file: !12, line: 43, column: 13)
!51 = !DILocation(line: 43, column: 18, scope: !50)
!52 = !DILocation(line: 43, column: 25, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 43, column: 13)
!54 = !DILocation(line: 43, column: 27, scope: !53)
!55 = !DILocation(line: 43, column: 13, scope: !50)
!56 = !DILocation(line: 45, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 44, column: 13)
!58 = !DILocation(line: 45, column: 17, scope: !57)
!59 = !DILocation(line: 45, column: 27, scope: !57)
!60 = !DILocation(line: 45, column: 34, scope: !57)
!61 = !DILocation(line: 46, column: 24, scope: !57)
!62 = !DILocation(line: 46, column: 17, scope: !57)
!63 = !DILocation(line: 46, column: 27, scope: !57)
!64 = !DILocation(line: 46, column: 34, scope: !57)
!65 = !DILocation(line: 47, column: 13, scope: !57)
!66 = !DILocation(line: 43, column: 35, scope: !53)
!67 = !DILocation(line: 43, column: 13, scope: !53)
!68 = distinct !{!68, !55, !69, !70}
!69 = !DILocation(line: 47, column: 13, scope: !50)
!70 = !{!"llvm.loop.mustprogress"}
!71 = !DILocation(line: 50, column: 9, scope: !39)
!72 = !DILocation(line: 51, column: 26, scope: !39)
!73 = !DILocation(line: 51, column: 9, scope: !39)
!74 = !DILocation(line: 53, column: 1, scope: !11)
!75 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_15_good", scope: !12, file: !12, line: 127, type: !13, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DILocation(line: 129, column: 5, scope: !75)
!77 = !DILocation(line: 130, column: 5, scope: !75)
!78 = !DILocation(line: 131, column: 1, scope: !75)
!79 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 143, type: !80, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!80 = !DISubroutineType(types: !81)
!81 = !{!23, !23, !82}
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!85 = !DILocalVariable(name: "argc", arg: 1, scope: !79, file: !12, line: 143, type: !23)
!86 = !DILocation(line: 143, column: 14, scope: !79)
!87 = !DILocalVariable(name: "argv", arg: 2, scope: !79, file: !12, line: 143, type: !82)
!88 = !DILocation(line: 143, column: 27, scope: !79)
!89 = !DILocation(line: 146, column: 22, scope: !79)
!90 = !DILocation(line: 146, column: 12, scope: !79)
!91 = !DILocation(line: 146, column: 5, scope: !79)
!92 = !DILocation(line: 148, column: 5, scope: !79)
!93 = !DILocation(line: 149, column: 5, scope: !79)
!94 = !DILocation(line: 150, column: 5, scope: !79)
!95 = !DILocation(line: 153, column: 5, scope: !79)
!96 = !DILocation(line: 154, column: 5, scope: !79)
!97 = !DILocation(line: 155, column: 5, scope: !79)
!98 = !DILocation(line: 157, column: 5, scope: !79)
!99 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!100 = !DILocalVariable(name: "data", scope: !99, file: !12, line: 62, type: !17)
!101 = !DILocation(line: 62, column: 21, scope: !99)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !99, file: !12, line: 63, type: !27)
!103 = !DILocation(line: 63, column: 19, scope: !99)
!104 = !DILocalVariable(name: "dataGoodBuffer", scope: !99, file: !12, line: 64, type: !32)
!105 = !DILocation(line: 64, column: 19, scope: !99)
!106 = !DILocation(line: 73, column: 16, scope: !99)
!107 = !DILocation(line: 73, column: 14, scope: !99)
!108 = !DILocalVariable(name: "source", scope: !109, file: !12, line: 77, type: !32)
!109 = distinct !DILexicalBlock(scope: !99, file: !12, line: 76, column: 5)
!110 = !DILocation(line: 77, column: 23, scope: !109)
!111 = !DILocalVariable(name: "i", scope: !112, file: !12, line: 79, type: !43)
!112 = distinct !DILexicalBlock(scope: !109, file: !12, line: 78, column: 9)
!113 = !DILocation(line: 79, column: 20, scope: !112)
!114 = !DILocation(line: 81, column: 20, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 81, column: 13)
!116 = !DILocation(line: 81, column: 18, scope: !115)
!117 = !DILocation(line: 81, column: 25, scope: !118)
!118 = distinct !DILexicalBlock(scope: !115, file: !12, line: 81, column: 13)
!119 = !DILocation(line: 81, column: 27, scope: !118)
!120 = !DILocation(line: 81, column: 13, scope: !115)
!121 = !DILocation(line: 83, column: 24, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 82, column: 13)
!123 = !DILocation(line: 83, column: 17, scope: !122)
!124 = !DILocation(line: 83, column: 27, scope: !122)
!125 = !DILocation(line: 83, column: 34, scope: !122)
!126 = !DILocation(line: 84, column: 24, scope: !122)
!127 = !DILocation(line: 84, column: 17, scope: !122)
!128 = !DILocation(line: 84, column: 27, scope: !122)
!129 = !DILocation(line: 84, column: 34, scope: !122)
!130 = !DILocation(line: 85, column: 13, scope: !122)
!131 = !DILocation(line: 81, column: 35, scope: !118)
!132 = !DILocation(line: 81, column: 13, scope: !118)
!133 = distinct !{!133, !120, !134, !70}
!134 = !DILocation(line: 85, column: 13, scope: !115)
!135 = !DILocation(line: 88, column: 9, scope: !109)
!136 = !DILocation(line: 89, column: 26, scope: !109)
!137 = !DILocation(line: 89, column: 9, scope: !109)
!138 = !DILocation(line: 91, column: 1, scope: !99)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 94, type: !13, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!140 = !DILocalVariable(name: "data", scope: !139, file: !12, line: 96, type: !17)
!141 = !DILocation(line: 96, column: 21, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !12, line: 97, type: !27)
!143 = !DILocation(line: 97, column: 19, scope: !139)
!144 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !12, line: 98, type: !32)
!145 = !DILocation(line: 98, column: 19, scope: !139)
!146 = !DILocation(line: 103, column: 16, scope: !139)
!147 = !DILocation(line: 103, column: 14, scope: !139)
!148 = !DILocalVariable(name: "source", scope: !149, file: !12, line: 111, type: !32)
!149 = distinct !DILexicalBlock(scope: !139, file: !12, line: 110, column: 5)
!150 = !DILocation(line: 111, column: 23, scope: !149)
!151 = !DILocalVariable(name: "i", scope: !152, file: !12, line: 113, type: !43)
!152 = distinct !DILexicalBlock(scope: !149, file: !12, line: 112, column: 9)
!153 = !DILocation(line: 113, column: 20, scope: !152)
!154 = !DILocation(line: 115, column: 20, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !12, line: 115, column: 13)
!156 = !DILocation(line: 115, column: 18, scope: !155)
!157 = !DILocation(line: 115, column: 25, scope: !158)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 115, column: 13)
!159 = !DILocation(line: 115, column: 27, scope: !158)
!160 = !DILocation(line: 115, column: 13, scope: !155)
!161 = !DILocation(line: 117, column: 24, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !12, line: 116, column: 13)
!163 = !DILocation(line: 117, column: 17, scope: !162)
!164 = !DILocation(line: 117, column: 27, scope: !162)
!165 = !DILocation(line: 117, column: 34, scope: !162)
!166 = !DILocation(line: 118, column: 24, scope: !162)
!167 = !DILocation(line: 118, column: 17, scope: !162)
!168 = !DILocation(line: 118, column: 27, scope: !162)
!169 = !DILocation(line: 118, column: 34, scope: !162)
!170 = !DILocation(line: 119, column: 13, scope: !162)
!171 = !DILocation(line: 115, column: 35, scope: !158)
!172 = !DILocation(line: 115, column: 13, scope: !158)
!173 = distinct !{!173, !160, !174, !70}
!174 = !DILocation(line: 119, column: 13, scope: !155)
!175 = !DILocation(line: 122, column: 9, scope: !149)
!176 = !DILocation(line: 123, column: 26, scope: !149)
!177 = !DILocation(line: 123, column: 9, scope: !149)
!178 = !DILocation(line: 125, column: 1, scope: !139)
