; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_bad() #0 !dbg !11 {
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
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %0, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %2 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %3, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !73
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !73
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !73
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !73
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !73
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !73
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !74
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_good() #0 !dbg !77 {
entry:
  call void @goodG2B1(), !dbg !78
  call void @goodG2B2(), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !81 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !87, metadata !DIExpression()), !dbg !88
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !89, metadata !DIExpression()), !dbg !90
  %call = call i64 @time(i64* noundef null), !dbg !91
  %conv = trunc i64 %call to i32, !dbg !92
  call void @srand(i32 noundef %conv), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !94
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_good(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_bad(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !108
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !111
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !112, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %0, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !127
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !128
  store i32 0, i32* %intOne, align 8, !dbg !129
  %2 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !131
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !132
  store i32 0, i32* %intTwo, align 4, !dbg !133
  br label %for.inc, !dbg !134

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !135
  %inc = add i64 %3, 1, !dbg !135
  store i64 %inc, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !136, !llvm.loop !137

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !139
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !139
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !139
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !139
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !139
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !139
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !139
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !140
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !150
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !153
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !154, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i64* %i, metadata !157, metadata !DIExpression()), !dbg !159
  store i64 0, i64* %i, align 8, !dbg !160
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !163
  %cmp = icmp ult i64 %0, 100, !dbg !165
  br i1 %cmp, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !167
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !169
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !170
  store i32 0, i32* %intOne, align 8, !dbg !171
  %2 = load i64, i64* %i, align 8, !dbg !172
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !173
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !174
  store i32 0, i32* %intTwo, align 4, !dbg !175
  br label %for.inc, !dbg !176

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !177
  %inc = add i64 %3, 1, !dbg !177
  store i64 %inc, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !178, !llvm.loop !179

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !181
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !181
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !181
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !181
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !181
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !181
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !182
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !182
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !183
  ret void, !dbg !184
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_bad", scope: !12, file: !12, line: 25, type: !13, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 27, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !19, line: 100, baseType: !20)
!19 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !19, line: 96, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !20, file: !19, line: 98, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !20, file: !19, line: 99, baseType: !23, size: 32, offset: 32)
!25 = !DILocation(line: 27, column: 21, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 28, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 28, column: 19, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 29, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 29, column: 19, scope: !11)
!36 = !DILocation(line: 34, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !38, file: !12, line: 31, column: 5)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 30, column: 8)
!39 = !DILocation(line: 34, column: 14, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 37, type: !32)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 36, column: 5)
!42 = !DILocation(line: 37, column: 23, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 39, type: !45)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 38, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !48, line: 94, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 39, column: 20, scope: !44)
!51 = !DILocation(line: 41, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !12, line: 41, column: 13)
!53 = !DILocation(line: 41, column: 18, scope: !52)
!54 = !DILocation(line: 41, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 41, column: 13)
!56 = !DILocation(line: 41, column: 27, scope: !55)
!57 = !DILocation(line: 41, column: 13, scope: !52)
!58 = !DILocation(line: 43, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 42, column: 13)
!60 = !DILocation(line: 43, column: 17, scope: !59)
!61 = !DILocation(line: 43, column: 27, scope: !59)
!62 = !DILocation(line: 43, column: 34, scope: !59)
!63 = !DILocation(line: 44, column: 24, scope: !59)
!64 = !DILocation(line: 44, column: 17, scope: !59)
!65 = !DILocation(line: 44, column: 27, scope: !59)
!66 = !DILocation(line: 44, column: 34, scope: !59)
!67 = !DILocation(line: 45, column: 13, scope: !59)
!68 = !DILocation(line: 41, column: 35, scope: !55)
!69 = !DILocation(line: 41, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 45, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 48, column: 9, scope: !41)
!74 = !DILocation(line: 49, column: 26, scope: !41)
!75 = !DILocation(line: 49, column: 9, scope: !41)
!76 = !DILocation(line: 51, column: 1, scope: !11)
!77 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_06_good", scope: !12, file: !12, line: 118, type: !13, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!78 = !DILocation(line: 120, column: 5, scope: !77)
!79 = !DILocation(line: 121, column: 5, scope: !77)
!80 = !DILocation(line: 122, column: 1, scope: !77)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 134, type: !82, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DISubroutineType(types: !83)
!83 = !{!23, !23, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 134, type: !23)
!88 = !DILocation(line: 134, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 134, type: !84)
!90 = !DILocation(line: 134, column: 27, scope: !81)
!91 = !DILocation(line: 137, column: 22, scope: !81)
!92 = !DILocation(line: 137, column: 12, scope: !81)
!93 = !DILocation(line: 137, column: 5, scope: !81)
!94 = !DILocation(line: 139, column: 5, scope: !81)
!95 = !DILocation(line: 140, column: 5, scope: !81)
!96 = !DILocation(line: 141, column: 5, scope: !81)
!97 = !DILocation(line: 144, column: 5, scope: !81)
!98 = !DILocation(line: 145, column: 5, scope: !81)
!99 = !DILocation(line: 146, column: 5, scope: !81)
!100 = !DILocation(line: 148, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 58, type: !13, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 60, type: !17)
!103 = !DILocation(line: 60, column: 21, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 61, type: !27)
!105 = !DILocation(line: 61, column: 19, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 62, type: !32)
!107 = !DILocation(line: 62, column: 19, scope: !101)
!108 = !DILocation(line: 71, column: 16, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !12, line: 69, column: 5)
!110 = distinct !DILexicalBlock(scope: !101, file: !12, line: 63, column: 8)
!111 = !DILocation(line: 71, column: 14, scope: !109)
!112 = !DILocalVariable(name: "source", scope: !113, file: !12, line: 74, type: !32)
!113 = distinct !DILexicalBlock(scope: !101, file: !12, line: 73, column: 5)
!114 = !DILocation(line: 74, column: 23, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 76, type: !45)
!116 = distinct !DILexicalBlock(scope: !113, file: !12, line: 75, column: 9)
!117 = !DILocation(line: 76, column: 20, scope: !116)
!118 = !DILocation(line: 78, column: 20, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 78, column: 13)
!120 = !DILocation(line: 78, column: 18, scope: !119)
!121 = !DILocation(line: 78, column: 25, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 78, column: 13)
!123 = !DILocation(line: 78, column: 27, scope: !122)
!124 = !DILocation(line: 78, column: 13, scope: !119)
!125 = !DILocation(line: 80, column: 24, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 79, column: 13)
!127 = !DILocation(line: 80, column: 17, scope: !126)
!128 = !DILocation(line: 80, column: 27, scope: !126)
!129 = !DILocation(line: 80, column: 34, scope: !126)
!130 = !DILocation(line: 81, column: 24, scope: !126)
!131 = !DILocation(line: 81, column: 17, scope: !126)
!132 = !DILocation(line: 81, column: 27, scope: !126)
!133 = !DILocation(line: 81, column: 34, scope: !126)
!134 = !DILocation(line: 82, column: 13, scope: !126)
!135 = !DILocation(line: 78, column: 35, scope: !122)
!136 = !DILocation(line: 78, column: 13, scope: !122)
!137 = distinct !{!137, !124, !138, !72}
!138 = !DILocation(line: 82, column: 13, scope: !119)
!139 = !DILocation(line: 85, column: 9, scope: !113)
!140 = !DILocation(line: 86, column: 26, scope: !113)
!141 = !DILocation(line: 86, column: 9, scope: !113)
!142 = !DILocation(line: 88, column: 1, scope: !101)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!144 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 93, type: !17)
!145 = !DILocation(line: 93, column: 21, scope: !143)
!146 = !DILocalVariable(name: "dataBadBuffer", scope: !143, file: !12, line: 94, type: !27)
!147 = !DILocation(line: 94, column: 19, scope: !143)
!148 = !DILocalVariable(name: "dataGoodBuffer", scope: !143, file: !12, line: 95, type: !32)
!149 = !DILocation(line: 95, column: 19, scope: !143)
!150 = !DILocation(line: 99, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !12, line: 97, column: 5)
!152 = distinct !DILexicalBlock(scope: !143, file: !12, line: 96, column: 8)
!153 = !DILocation(line: 99, column: 14, scope: !151)
!154 = !DILocalVariable(name: "source", scope: !155, file: !12, line: 102, type: !32)
!155 = distinct !DILexicalBlock(scope: !143, file: !12, line: 101, column: 5)
!156 = !DILocation(line: 102, column: 23, scope: !155)
!157 = !DILocalVariable(name: "i", scope: !158, file: !12, line: 104, type: !45)
!158 = distinct !DILexicalBlock(scope: !155, file: !12, line: 103, column: 9)
!159 = !DILocation(line: 104, column: 20, scope: !158)
!160 = !DILocation(line: 106, column: 20, scope: !161)
!161 = distinct !DILexicalBlock(scope: !158, file: !12, line: 106, column: 13)
!162 = !DILocation(line: 106, column: 18, scope: !161)
!163 = !DILocation(line: 106, column: 25, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !12, line: 106, column: 13)
!165 = !DILocation(line: 106, column: 27, scope: !164)
!166 = !DILocation(line: 106, column: 13, scope: !161)
!167 = !DILocation(line: 108, column: 24, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !12, line: 107, column: 13)
!169 = !DILocation(line: 108, column: 17, scope: !168)
!170 = !DILocation(line: 108, column: 27, scope: !168)
!171 = !DILocation(line: 108, column: 34, scope: !168)
!172 = !DILocation(line: 109, column: 24, scope: !168)
!173 = !DILocation(line: 109, column: 17, scope: !168)
!174 = !DILocation(line: 109, column: 27, scope: !168)
!175 = !DILocation(line: 109, column: 34, scope: !168)
!176 = !DILocation(line: 110, column: 13, scope: !168)
!177 = !DILocation(line: 106, column: 35, scope: !164)
!178 = !DILocation(line: 106, column: 13, scope: !164)
!179 = distinct !{!179, !166, !180, !72}
!180 = !DILocation(line: 110, column: 13, scope: !161)
!181 = !DILocation(line: 113, column: 9, scope: !155)
!182 = !DILocation(line: 114, column: 26, scope: !155)
!183 = !DILocation(line: 114, column: 9, scope: !155)
!184 = !DILocation(line: 116, column: 1, scope: !143)
