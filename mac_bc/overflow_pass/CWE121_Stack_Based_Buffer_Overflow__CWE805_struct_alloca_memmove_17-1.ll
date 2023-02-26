; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_bad() #0 !dbg !19 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !33
  %2 = alloca i8, i64 800, align 16, !dbg !34
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !35
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !33
  store i32 0, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp slt i32 %4, 1, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !43
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !45
  br label %for.inc, !dbg !46

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !47
  %inc = add nsw i32 %6, 1, !dbg !47
  store i32 %inc, i32* %i, align 4, !dbg !47
  br label %for.cond, !dbg !48, !llvm.loop !49

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !52, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !58, metadata !DIExpression()), !dbg !65
  store i64 0, i64* %i1, align 8, !dbg !66
  br label %for.cond2, !dbg !68

for.cond2:                                        ; preds = %for.inc6, %for.end
  %7 = load i64, i64* %i1, align 8, !dbg !69
  %cmp3 = icmp ult i64 %7, 100, !dbg !71
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !72

for.body4:                                        ; preds = %for.cond2
  %8 = load i64, i64* %i1, align 8, !dbg !73
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !75
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !76
  store i32 0, i32* %intOne, align 8, !dbg !77
  %9 = load i64, i64* %i1, align 8, !dbg !78
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !79
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !80
  store i32 0, i32* %intTwo, align 4, !dbg !81
  br label %for.inc6, !dbg !82

for.inc6:                                         ; preds = %for.body4
  %10 = load i64, i64* %i1, align 8, !dbg !83
  %inc7 = add i64 %10, 1, !dbg !83
  store i64 %inc7, i64* %i1, align 8, !dbg !83
  br label %for.cond2, !dbg !84, !llvm.loop !85

for.end8:                                         ; preds = %for.cond2
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !87
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !87
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !87
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !87
  %16 = call i64 @llvm.objectsize.i64.p0i8(i8* %15, i1 false, i1 true, i1 false), !dbg !87
  %call = call i8* @__memmove_chk(i8* noundef %12, i8* noundef %13, i64 noundef 800, i64 noundef %16) #4, !dbg !87
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !88
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !88
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx9), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* noundef null), !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 noundef %conv), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_good(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_bad(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = alloca i8, i64 400, align 16, !dbg !121
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !122
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !120
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  %2 = alloca i8, i64 800, align 16, !dbg !125
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !126
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !124
  store i32 0, i32* %h, align 4, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %h, align 4, !dbg !130
  %cmp = icmp slt i32 %4, 1, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !134
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %h, align 4, !dbg !138
  %inc = add nsw i32 %6, 1, !dbg !138
  store i32 %inc, i32* %h, align 4, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  store i64 0, i64* %i, align 8, !dbg !148
  br label %for.cond1, !dbg !150

for.cond1:                                        ; preds = %for.inc5, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !151
  %cmp2 = icmp ult i64 %7, 100, !dbg !153
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !154

for.body3:                                        ; preds = %for.cond1
  %8 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !157
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !158
  store i32 0, i32* %intOne, align 8, !dbg !159
  %9 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !161
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !162
  store i32 0, i32* %intTwo, align 4, !dbg !163
  br label %for.inc5, !dbg !164

for.inc5:                                         ; preds = %for.body3
  %10 = load i64, i64* %i, align 8, !dbg !165
  %inc6 = add i64 %10, 1, !dbg !165
  store i64 %inc6, i64* %i, align 8, !dbg !165
  br label %for.cond1, !dbg !166, !llvm.loop !167

for.end7:                                         ; preds = %for.cond1
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !169
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !169
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !169
  %13 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !169
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !169
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !169
  %16 = call i64 @llvm.objectsize.i64.p0i8(i8* %15, i1 false, i1 true, i1 false), !dbg !169
  %call = call i8* @__memmove_chk(i8* noundef %12, i8* noundef %13, i64 noundef 800, i64 noundef %16) #4, !dbg !169
  %17 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !170
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %17, i64 0, !dbg !170
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx8), !dbg !171
  ret void, !dbg !172
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "i", scope: !19, file: !20, line: 23, type: !9)
!25 = !DILocation(line: 23, column: 9, scope: !19)
!26 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 24, type: !3)
!27 = !DILocation(line: 24, column: 21, scope: !19)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 25, type: !3)
!29 = !DILocation(line: 25, column: 21, scope: !19)
!30 = !DILocation(line: 25, column: 54, scope: !19)
!31 = !DILocation(line: 25, column: 37, scope: !19)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 26, type: !3)
!33 = !DILocation(line: 26, column: 21, scope: !19)
!34 = !DILocation(line: 26, column: 55, scope: !19)
!35 = !DILocation(line: 26, column: 38, scope: !19)
!36 = !DILocation(line: 27, column: 11, scope: !37)
!37 = distinct !DILexicalBlock(scope: !19, file: !20, line: 27, column: 5)
!38 = !DILocation(line: 27, column: 9, scope: !37)
!39 = !DILocation(line: 27, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !20, line: 27, column: 5)
!41 = !DILocation(line: 27, column: 18, scope: !40)
!42 = !DILocation(line: 27, column: 5, scope: !37)
!43 = !DILocation(line: 31, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !20, line: 28, column: 5)
!45 = !DILocation(line: 31, column: 14, scope: !44)
!46 = !DILocation(line: 32, column: 5, scope: !44)
!47 = !DILocation(line: 27, column: 24, scope: !40)
!48 = !DILocation(line: 27, column: 5, scope: !40)
!49 = distinct !{!49, !42, !50, !51}
!50 = !DILocation(line: 32, column: 5, scope: !37)
!51 = !{!"llvm.loop.mustprogress"}
!52 = !DILocalVariable(name: "source", scope: !53, file: !20, line: 34, type: !54)
!53 = distinct !DILexicalBlock(scope: !19, file: !20, line: 33, column: 5)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 100)
!57 = !DILocation(line: 34, column: 23, scope: !53)
!58 = !DILocalVariable(name: "i", scope: !59, file: !20, line: 36, type: !60)
!59 = distinct !DILexicalBlock(scope: !53, file: !20, line: 35, column: 9)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !61, line: 31, baseType: !62)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !63, line: 94, baseType: !64)
!63 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!64 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!65 = !DILocation(line: 36, column: 20, scope: !59)
!66 = !DILocation(line: 38, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !59, file: !20, line: 38, column: 13)
!68 = !DILocation(line: 38, column: 18, scope: !67)
!69 = !DILocation(line: 38, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !20, line: 38, column: 13)
!71 = !DILocation(line: 38, column: 27, scope: !70)
!72 = !DILocation(line: 38, column: 13, scope: !67)
!73 = !DILocation(line: 40, column: 24, scope: !74)
!74 = distinct !DILexicalBlock(scope: !70, file: !20, line: 39, column: 13)
!75 = !DILocation(line: 40, column: 17, scope: !74)
!76 = !DILocation(line: 40, column: 27, scope: !74)
!77 = !DILocation(line: 40, column: 34, scope: !74)
!78 = !DILocation(line: 41, column: 24, scope: !74)
!79 = !DILocation(line: 41, column: 17, scope: !74)
!80 = !DILocation(line: 41, column: 27, scope: !74)
!81 = !DILocation(line: 41, column: 34, scope: !74)
!82 = !DILocation(line: 42, column: 13, scope: !74)
!83 = !DILocation(line: 38, column: 35, scope: !70)
!84 = !DILocation(line: 38, column: 13, scope: !70)
!85 = distinct !{!85, !72, !86, !51}
!86 = !DILocation(line: 42, column: 13, scope: !67)
!87 = !DILocation(line: 45, column: 9, scope: !53)
!88 = !DILocation(line: 46, column: 26, scope: !53)
!89 = !DILocation(line: 46, column: 9, scope: !53)
!90 = !DILocation(line: 48, column: 1, scope: !19)
!91 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_17_good", scope: !20, file: !20, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!92 = !DILocation(line: 85, column: 5, scope: !91)
!93 = !DILocation(line: 86, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 98, type: !95, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!95 = !DISubroutineType(types: !96)
!96 = !{!9, !9, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !20, line: 98, type: !9)
!101 = !DILocation(line: 98, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !20, line: 98, type: !97)
!103 = !DILocation(line: 98, column: 27, scope: !94)
!104 = !DILocation(line: 101, column: 22, scope: !94)
!105 = !DILocation(line: 101, column: 12, scope: !94)
!106 = !DILocation(line: 101, column: 5, scope: !94)
!107 = !DILocation(line: 103, column: 5, scope: !94)
!108 = !DILocation(line: 104, column: 5, scope: !94)
!109 = !DILocation(line: 105, column: 5, scope: !94)
!110 = !DILocation(line: 108, column: 5, scope: !94)
!111 = !DILocation(line: 109, column: 5, scope: !94)
!112 = !DILocation(line: 110, column: 5, scope: !94)
!113 = !DILocation(line: 112, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!115 = !DILocalVariable(name: "h", scope: !114, file: !20, line: 57, type: !9)
!116 = !DILocation(line: 57, column: 9, scope: !114)
!117 = !DILocalVariable(name: "data", scope: !114, file: !20, line: 58, type: !3)
!118 = !DILocation(line: 58, column: 21, scope: !114)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !20, line: 59, type: !3)
!120 = !DILocation(line: 59, column: 21, scope: !114)
!121 = !DILocation(line: 59, column: 54, scope: !114)
!122 = !DILocation(line: 59, column: 37, scope: !114)
!123 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !20, line: 60, type: !3)
!124 = !DILocation(line: 60, column: 21, scope: !114)
!125 = !DILocation(line: 60, column: 55, scope: !114)
!126 = !DILocation(line: 60, column: 38, scope: !114)
!127 = !DILocation(line: 61, column: 11, scope: !128)
!128 = distinct !DILexicalBlock(scope: !114, file: !20, line: 61, column: 5)
!129 = !DILocation(line: 61, column: 9, scope: !128)
!130 = !DILocation(line: 61, column: 16, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !20, line: 61, column: 5)
!132 = !DILocation(line: 61, column: 18, scope: !131)
!133 = !DILocation(line: 61, column: 5, scope: !128)
!134 = !DILocation(line: 64, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !20, line: 62, column: 5)
!136 = !DILocation(line: 64, column: 14, scope: !135)
!137 = !DILocation(line: 65, column: 5, scope: !135)
!138 = !DILocation(line: 61, column: 24, scope: !131)
!139 = !DILocation(line: 61, column: 5, scope: !131)
!140 = distinct !{!140, !133, !141, !51}
!141 = !DILocation(line: 65, column: 5, scope: !128)
!142 = !DILocalVariable(name: "source", scope: !143, file: !20, line: 67, type: !54)
!143 = distinct !DILexicalBlock(scope: !114, file: !20, line: 66, column: 5)
!144 = !DILocation(line: 67, column: 23, scope: !143)
!145 = !DILocalVariable(name: "i", scope: !146, file: !20, line: 69, type: !60)
!146 = distinct !DILexicalBlock(scope: !143, file: !20, line: 68, column: 9)
!147 = !DILocation(line: 69, column: 20, scope: !146)
!148 = !DILocation(line: 71, column: 20, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !20, line: 71, column: 13)
!150 = !DILocation(line: 71, column: 18, scope: !149)
!151 = !DILocation(line: 71, column: 25, scope: !152)
!152 = distinct !DILexicalBlock(scope: !149, file: !20, line: 71, column: 13)
!153 = !DILocation(line: 71, column: 27, scope: !152)
!154 = !DILocation(line: 71, column: 13, scope: !149)
!155 = !DILocation(line: 73, column: 24, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !20, line: 72, column: 13)
!157 = !DILocation(line: 73, column: 17, scope: !156)
!158 = !DILocation(line: 73, column: 27, scope: !156)
!159 = !DILocation(line: 73, column: 34, scope: !156)
!160 = !DILocation(line: 74, column: 24, scope: !156)
!161 = !DILocation(line: 74, column: 17, scope: !156)
!162 = !DILocation(line: 74, column: 27, scope: !156)
!163 = !DILocation(line: 74, column: 34, scope: !156)
!164 = !DILocation(line: 75, column: 13, scope: !156)
!165 = !DILocation(line: 71, column: 35, scope: !152)
!166 = !DILocation(line: 71, column: 13, scope: !152)
!167 = distinct !{!167, !154, !168, !51}
!168 = !DILocation(line: 75, column: 13, scope: !149)
!169 = !DILocation(line: 78, column: 9, scope: !143)
!170 = !DILocation(line: 79, column: 26, scope: !143)
!171 = !DILocation(line: 79, column: 9, scope: !143)
!172 = !DILocation(line: 81, column: 1, scope: !114)
