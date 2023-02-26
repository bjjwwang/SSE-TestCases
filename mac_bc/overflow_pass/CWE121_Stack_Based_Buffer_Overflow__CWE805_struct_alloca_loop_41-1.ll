; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_badSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !19 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !26, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !39
  store i64 0, i64* %i, align 8, !dbg !40
  br label %for.cond, !dbg !42

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !43
  %cmp = icmp ult i64 %0, 100, !dbg !45
  br i1 %cmp, label %for.body, label %for.end, !dbg !46

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !47
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !49
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !50
  store i32 0, i32* %intOne, align 8, !dbg !51
  %2 = load i64, i64* %i, align 8, !dbg !52
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !53
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !54
  store i32 0, i32* %intTwo, align 4, !dbg !55
  br label %for.inc, !dbg !56

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !57
  %inc = add i64 %3, 1, !dbg !57
  store i64 %inc, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !58, !llvm.loop !59

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !62, metadata !DIExpression()), !dbg !64
  store i64 0, i64* %i2, align 8, !dbg !65
  br label %for.cond3, !dbg !67

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !68
  %cmp4 = icmp ult i64 %4, 100, !dbg !70
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !71

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !72
  %6 = load i64, i64* %i2, align 8, !dbg !74
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !72
  %7 = load i64, i64* %i2, align 8, !dbg !75
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !76
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !76
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !76
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !76
  br label %for.inc8, !dbg !77

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !78
  %inc9 = add i64 %10, 1, !dbg !78
  store i64 %inc9, i64* %i2, align 8, !dbg !78
  br label %for.cond3, !dbg !79, !llvm.loop !80

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !82
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !82
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_bad() #0 !dbg !85 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 400, align 16, !dbg !92
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !93
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = alloca i8, i64 800, align 16, !dbg !96
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !97
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !95
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !98
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !99
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_badSink(%struct._twoIntsStruct* noundef %5), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_goodG2BSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !103 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !106, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i64* %i, metadata !109, metadata !DIExpression()), !dbg !111
  store i64 0, i64* %i, align 8, !dbg !112
  br label %for.cond, !dbg !114

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !115
  %cmp = icmp ult i64 %0, 100, !dbg !117
  br i1 %cmp, label %for.body, label %for.end, !dbg !118

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !119
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !121
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !122
  store i32 0, i32* %intOne, align 8, !dbg !123
  %2 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !125
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !126
  store i32 0, i32* %intTwo, align 4, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !129
  %inc = add i64 %3, 1, !dbg !129
  store i64 %inc, i64* %i, align 8, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !133, metadata !DIExpression()), !dbg !135
  store i64 0, i64* %i2, align 8, !dbg !136
  br label %for.cond3, !dbg !138

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !139
  %cmp4 = icmp ult i64 %4, 100, !dbg !141
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !142

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !143
  %6 = load i64, i64* %i2, align 8, !dbg !145
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !143
  %7 = load i64, i64* %i2, align 8, !dbg !146
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !147
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !147
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !147
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !147
  br label %for.inc8, !dbg !148

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !149
  %inc9 = add i64 %10, 1, !dbg !149
  store i64 %inc9, i64* %i2, align 8, !dbg !149
  br label %for.cond3, !dbg !150, !llvm.loop !151

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !153
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !153
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_good() #0 !dbg !156 {
entry:
  call void @goodG2B(), !dbg !157
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !159 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !165, metadata !DIExpression()), !dbg !166
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !167, metadata !DIExpression()), !dbg !168
  %call = call i64 @time(i64* noundef null), !dbg !169
  %conv = trunc i64 %call to i32, !dbg !170
  call void @srand(i32 noundef %conv), !dbg !171
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !172
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_good(), !dbg !173
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !174
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !175
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_bad(), !dbg !176
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !177
  ret i32 0, !dbg !178
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !179 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !182, metadata !DIExpression()), !dbg !183
  %0 = alloca i8, i64 400, align 16, !dbg !184
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !185
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !183
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !186, metadata !DIExpression()), !dbg !187
  %2 = alloca i8, i64 800, align 16, !dbg !188
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !189
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !187
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !190
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !192
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_goodG2BSink(%struct._twoIntsStruct* noundef %5), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_badSink", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null, !3}
!23 = !{}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !20, line: 21, type: !3)
!25 = !DILocation(line: 21, column: 95, scope: !19)
!26 = !DILocalVariable(name: "source", scope: !27, file: !20, line: 24, type: !28)
!27 = distinct !DILexicalBlock(scope: !19, file: !20, line: 23, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 24, column: 23, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !20, line: 26, type: !34)
!33 = distinct !DILexicalBlock(scope: !27, file: !20, line: 25, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 31, baseType: !36)
!35 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !37, line: 94, baseType: !38)
!37 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 26, column: 20, scope: !33)
!40 = !DILocation(line: 28, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !20, line: 28, column: 13)
!42 = !DILocation(line: 28, column: 18, scope: !41)
!43 = !DILocation(line: 28, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !20, line: 28, column: 13)
!45 = !DILocation(line: 28, column: 27, scope: !44)
!46 = !DILocation(line: 28, column: 13, scope: !41)
!47 = !DILocation(line: 30, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !20, line: 29, column: 13)
!49 = !DILocation(line: 30, column: 17, scope: !48)
!50 = !DILocation(line: 30, column: 27, scope: !48)
!51 = !DILocation(line: 30, column: 34, scope: !48)
!52 = !DILocation(line: 31, column: 24, scope: !48)
!53 = !DILocation(line: 31, column: 17, scope: !48)
!54 = !DILocation(line: 31, column: 27, scope: !48)
!55 = !DILocation(line: 31, column: 34, scope: !48)
!56 = !DILocation(line: 32, column: 13, scope: !48)
!57 = !DILocation(line: 28, column: 35, scope: !44)
!58 = !DILocation(line: 28, column: 13, scope: !44)
!59 = distinct !{!59, !46, !60, !61}
!60 = !DILocation(line: 32, column: 13, scope: !41)
!61 = !{!"llvm.loop.mustprogress"}
!62 = !DILocalVariable(name: "i", scope: !63, file: !20, line: 35, type: !34)
!63 = distinct !DILexicalBlock(scope: !27, file: !20, line: 34, column: 9)
!64 = !DILocation(line: 35, column: 20, scope: !63)
!65 = !DILocation(line: 37, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !20, line: 37, column: 13)
!67 = !DILocation(line: 37, column: 18, scope: !66)
!68 = !DILocation(line: 37, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !20, line: 37, column: 13)
!70 = !DILocation(line: 37, column: 27, scope: !69)
!71 = !DILocation(line: 37, column: 13, scope: !66)
!72 = !DILocation(line: 39, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !20, line: 38, column: 13)
!74 = !DILocation(line: 39, column: 22, scope: !73)
!75 = !DILocation(line: 39, column: 34, scope: !73)
!76 = !DILocation(line: 39, column: 27, scope: !73)
!77 = !DILocation(line: 40, column: 13, scope: !73)
!78 = !DILocation(line: 37, column: 35, scope: !69)
!79 = !DILocation(line: 37, column: 13, scope: !69)
!80 = distinct !{!80, !71, !81, !61}
!81 = !DILocation(line: 40, column: 13, scope: !66)
!82 = !DILocation(line: 41, column: 30, scope: !63)
!83 = !DILocation(line: 41, column: 13, scope: !63)
!84 = !DILocation(line: 44, column: 1, scope: !19)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_bad", scope: !20, file: !20, line: 46, type: !86, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!86 = !DISubroutineType(types: !87)
!87 = !{null}
!88 = !DILocalVariable(name: "data", scope: !85, file: !20, line: 48, type: !3)
!89 = !DILocation(line: 48, column: 21, scope: !85)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !20, line: 49, type: !3)
!91 = !DILocation(line: 49, column: 21, scope: !85)
!92 = !DILocation(line: 49, column: 54, scope: !85)
!93 = !DILocation(line: 49, column: 37, scope: !85)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !20, line: 50, type: !3)
!95 = !DILocation(line: 50, column: 21, scope: !85)
!96 = !DILocation(line: 50, column: 55, scope: !85)
!97 = !DILocation(line: 50, column: 38, scope: !85)
!98 = !DILocation(line: 53, column: 12, scope: !85)
!99 = !DILocation(line: 53, column: 10, scope: !85)
!100 = !DILocation(line: 54, column: 78, scope: !85)
!101 = !DILocation(line: 54, column: 5, scope: !85)
!102 = !DILocation(line: 55, column: 1, scope: !85)
!103 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_goodG2BSink", scope: !20, file: !20, line: 61, type: !21, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!104 = !DILocalVariable(name: "data", arg: 1, scope: !103, file: !20, line: 61, type: !3)
!105 = !DILocation(line: 61, column: 99, scope: !103)
!106 = !DILocalVariable(name: "source", scope: !107, file: !20, line: 64, type: !28)
!107 = distinct !DILexicalBlock(scope: !103, file: !20, line: 63, column: 5)
!108 = !DILocation(line: 64, column: 23, scope: !107)
!109 = !DILocalVariable(name: "i", scope: !110, file: !20, line: 66, type: !34)
!110 = distinct !DILexicalBlock(scope: !107, file: !20, line: 65, column: 9)
!111 = !DILocation(line: 66, column: 20, scope: !110)
!112 = !DILocation(line: 68, column: 20, scope: !113)
!113 = distinct !DILexicalBlock(scope: !110, file: !20, line: 68, column: 13)
!114 = !DILocation(line: 68, column: 18, scope: !113)
!115 = !DILocation(line: 68, column: 25, scope: !116)
!116 = distinct !DILexicalBlock(scope: !113, file: !20, line: 68, column: 13)
!117 = !DILocation(line: 68, column: 27, scope: !116)
!118 = !DILocation(line: 68, column: 13, scope: !113)
!119 = !DILocation(line: 70, column: 24, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !20, line: 69, column: 13)
!121 = !DILocation(line: 70, column: 17, scope: !120)
!122 = !DILocation(line: 70, column: 27, scope: !120)
!123 = !DILocation(line: 70, column: 34, scope: !120)
!124 = !DILocation(line: 71, column: 24, scope: !120)
!125 = !DILocation(line: 71, column: 17, scope: !120)
!126 = !DILocation(line: 71, column: 27, scope: !120)
!127 = !DILocation(line: 71, column: 34, scope: !120)
!128 = !DILocation(line: 72, column: 13, scope: !120)
!129 = !DILocation(line: 68, column: 35, scope: !116)
!130 = !DILocation(line: 68, column: 13, scope: !116)
!131 = distinct !{!131, !118, !132, !61}
!132 = !DILocation(line: 72, column: 13, scope: !113)
!133 = !DILocalVariable(name: "i", scope: !134, file: !20, line: 75, type: !34)
!134 = distinct !DILexicalBlock(scope: !107, file: !20, line: 74, column: 9)
!135 = !DILocation(line: 75, column: 20, scope: !134)
!136 = !DILocation(line: 77, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !20, line: 77, column: 13)
!138 = !DILocation(line: 77, column: 18, scope: !137)
!139 = !DILocation(line: 77, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !20, line: 77, column: 13)
!141 = !DILocation(line: 77, column: 27, scope: !140)
!142 = !DILocation(line: 77, column: 13, scope: !137)
!143 = !DILocation(line: 79, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !20, line: 78, column: 13)
!145 = !DILocation(line: 79, column: 22, scope: !144)
!146 = !DILocation(line: 79, column: 34, scope: !144)
!147 = !DILocation(line: 79, column: 27, scope: !144)
!148 = !DILocation(line: 80, column: 13, scope: !144)
!149 = !DILocation(line: 77, column: 35, scope: !140)
!150 = !DILocation(line: 77, column: 13, scope: !140)
!151 = distinct !{!151, !142, !152, !61}
!152 = !DILocation(line: 80, column: 13, scope: !137)
!153 = !DILocation(line: 81, column: 30, scope: !134)
!154 = !DILocation(line: 81, column: 13, scope: !134)
!155 = !DILocation(line: 84, column: 1, scope: !103)
!156 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_41_good", scope: !20, file: !20, line: 97, type: !86, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!157 = !DILocation(line: 99, column: 5, scope: !156)
!158 = !DILocation(line: 100, column: 1, scope: !156)
!159 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 112, type: !160, scopeLine: 113, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!160 = !DISubroutineType(types: !161)
!161 = !{!9, !9, !162}
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64)
!164 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!165 = !DILocalVariable(name: "argc", arg: 1, scope: !159, file: !20, line: 112, type: !9)
!166 = !DILocation(line: 112, column: 14, scope: !159)
!167 = !DILocalVariable(name: "argv", arg: 2, scope: !159, file: !20, line: 112, type: !162)
!168 = !DILocation(line: 112, column: 27, scope: !159)
!169 = !DILocation(line: 115, column: 22, scope: !159)
!170 = !DILocation(line: 115, column: 12, scope: !159)
!171 = !DILocation(line: 115, column: 5, scope: !159)
!172 = !DILocation(line: 117, column: 5, scope: !159)
!173 = !DILocation(line: 118, column: 5, scope: !159)
!174 = !DILocation(line: 119, column: 5, scope: !159)
!175 = !DILocation(line: 122, column: 5, scope: !159)
!176 = !DILocation(line: 123, column: 5, scope: !159)
!177 = !DILocation(line: 124, column: 5, scope: !159)
!178 = !DILocation(line: 126, column: 5, scope: !159)
!179 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 87, type: !86, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!180 = !DILocalVariable(name: "data", scope: !179, file: !20, line: 89, type: !3)
!181 = !DILocation(line: 89, column: 21, scope: !179)
!182 = !DILocalVariable(name: "dataBadBuffer", scope: !179, file: !20, line: 90, type: !3)
!183 = !DILocation(line: 90, column: 21, scope: !179)
!184 = !DILocation(line: 90, column: 54, scope: !179)
!185 = !DILocation(line: 90, column: 37, scope: !179)
!186 = !DILocalVariable(name: "dataGoodBuffer", scope: !179, file: !20, line: 91, type: !3)
!187 = !DILocation(line: 91, column: 21, scope: !179)
!188 = !DILocation(line: 91, column: 55, scope: !179)
!189 = !DILocation(line: 91, column: 38, scope: !179)
!190 = !DILocation(line: 93, column: 12, scope: !179)
!191 = !DILocation(line: 93, column: 10, scope: !179)
!192 = !DILocation(line: 94, column: 82, scope: !179)
!193 = !DILocation(line: 94, column: 5, scope: !179)
!194 = !DILocation(line: 95, column: 1, scope: !179)
