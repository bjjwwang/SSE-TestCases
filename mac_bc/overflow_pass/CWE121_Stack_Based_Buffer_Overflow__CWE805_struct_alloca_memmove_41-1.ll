; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_badSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !19 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
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
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !62
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !62
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !62
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !62
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !62
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !62
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !62
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !62
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !63
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_bad() #0 !dbg !66 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %0 = alloca i8, i64 400, align 16, !dbg !73
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !74
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !75, metadata !DIExpression()), !dbg !76
  %2 = alloca i8, i64 800, align 16, !dbg !77
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !78
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !76
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !79
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !80
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_badSink(%struct._twoIntsStruct* noundef %5), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_goodG2BSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !84 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  store i64 0, i64* %i, align 8, !dbg !93
  br label %for.cond, !dbg !95

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !96
  %cmp = icmp ult i64 %0, 100, !dbg !98
  br i1 %cmp, label %for.body, label %for.end, !dbg !99

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !100
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !102
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !103
  store i32 0, i32* %intOne, align 8, !dbg !104
  %2 = load i64, i64* %i, align 8, !dbg !105
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !106
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !107
  store i32 0, i32* %intTwo, align 4, !dbg !108
  br label %for.inc, !dbg !109

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !110
  %inc = add i64 %3, 1, !dbg !110
  store i64 %inc, i64* %i, align 8, !dbg !110
  br label %for.cond, !dbg !111, !llvm.loop !112

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !114
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !114
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !114
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !114
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !114
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !114
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !114
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !114
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !115
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !115
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_good() #0 !dbg !118 {
entry:
  call void @goodG2B(), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !121 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !127, metadata !DIExpression()), !dbg !128
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !129, metadata !DIExpression()), !dbg !130
  %call = call i64 @time(i64* noundef null), !dbg !131
  %conv = trunc i64 %call to i32, !dbg !132
  call void @srand(i32 noundef %conv), !dbg !133
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !134
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_good(), !dbg !135
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !136
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !137
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_bad(), !dbg !138
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !139
  ret i32 0, !dbg !140
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !141 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = alloca i8, i64 400, align 16, !dbg !146
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !147
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %2 = alloca i8, i64 800, align 16, !dbg !150
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !151
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !149
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !152
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !153
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !154
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_goodG2BSink(%struct._twoIntsStruct* noundef %5), !dbg !155
  ret void, !dbg !156
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_badSink", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null, !3}
!23 = !{}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !19, file: !20, line: 21, type: !3)
!25 = !DILocation(line: 21, column: 98, scope: !19)
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
!62 = !DILocation(line: 35, column: 9, scope: !27)
!63 = !DILocation(line: 36, column: 26, scope: !27)
!64 = !DILocation(line: 36, column: 9, scope: !27)
!65 = !DILocation(line: 38, column: 1, scope: !19)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_bad", scope: !20, file: !20, line: 40, type: !67, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !DILocalVariable(name: "data", scope: !66, file: !20, line: 42, type: !3)
!70 = !DILocation(line: 42, column: 21, scope: !66)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !20, line: 43, type: !3)
!72 = !DILocation(line: 43, column: 21, scope: !66)
!73 = !DILocation(line: 43, column: 54, scope: !66)
!74 = !DILocation(line: 43, column: 37, scope: !66)
!75 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !20, line: 44, type: !3)
!76 = !DILocation(line: 44, column: 21, scope: !66)
!77 = !DILocation(line: 44, column: 55, scope: !66)
!78 = !DILocation(line: 44, column: 38, scope: !66)
!79 = !DILocation(line: 47, column: 12, scope: !66)
!80 = !DILocation(line: 47, column: 10, scope: !66)
!81 = !DILocation(line: 48, column: 81, scope: !66)
!82 = !DILocation(line: 48, column: 5, scope: !66)
!83 = !DILocation(line: 49, column: 1, scope: !66)
!84 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_goodG2BSink", scope: !20, file: !20, line: 55, type: !21, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!85 = !DILocalVariable(name: "data", arg: 1, scope: !84, file: !20, line: 55, type: !3)
!86 = !DILocation(line: 55, column: 102, scope: !84)
!87 = !DILocalVariable(name: "source", scope: !88, file: !20, line: 58, type: !28)
!88 = distinct !DILexicalBlock(scope: !84, file: !20, line: 57, column: 5)
!89 = !DILocation(line: 58, column: 23, scope: !88)
!90 = !DILocalVariable(name: "i", scope: !91, file: !20, line: 60, type: !34)
!91 = distinct !DILexicalBlock(scope: !88, file: !20, line: 59, column: 9)
!92 = !DILocation(line: 60, column: 20, scope: !91)
!93 = !DILocation(line: 62, column: 20, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !20, line: 62, column: 13)
!95 = !DILocation(line: 62, column: 18, scope: !94)
!96 = !DILocation(line: 62, column: 25, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !20, line: 62, column: 13)
!98 = !DILocation(line: 62, column: 27, scope: !97)
!99 = !DILocation(line: 62, column: 13, scope: !94)
!100 = !DILocation(line: 64, column: 24, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !20, line: 63, column: 13)
!102 = !DILocation(line: 64, column: 17, scope: !101)
!103 = !DILocation(line: 64, column: 27, scope: !101)
!104 = !DILocation(line: 64, column: 34, scope: !101)
!105 = !DILocation(line: 65, column: 24, scope: !101)
!106 = !DILocation(line: 65, column: 17, scope: !101)
!107 = !DILocation(line: 65, column: 27, scope: !101)
!108 = !DILocation(line: 65, column: 34, scope: !101)
!109 = !DILocation(line: 66, column: 13, scope: !101)
!110 = !DILocation(line: 62, column: 35, scope: !97)
!111 = !DILocation(line: 62, column: 13, scope: !97)
!112 = distinct !{!112, !99, !113, !61}
!113 = !DILocation(line: 66, column: 13, scope: !94)
!114 = !DILocation(line: 69, column: 9, scope: !88)
!115 = !DILocation(line: 70, column: 26, scope: !88)
!116 = !DILocation(line: 70, column: 9, scope: !88)
!117 = !DILocation(line: 72, column: 1, scope: !84)
!118 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_41_good", scope: !20, file: !20, line: 85, type: !67, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!119 = !DILocation(line: 87, column: 5, scope: !118)
!120 = !DILocation(line: 88, column: 1, scope: !118)
!121 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 100, type: !122, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!122 = !DISubroutineType(types: !123)
!123 = !{!9, !9, !124}
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!127 = !DILocalVariable(name: "argc", arg: 1, scope: !121, file: !20, line: 100, type: !9)
!128 = !DILocation(line: 100, column: 14, scope: !121)
!129 = !DILocalVariable(name: "argv", arg: 2, scope: !121, file: !20, line: 100, type: !124)
!130 = !DILocation(line: 100, column: 27, scope: !121)
!131 = !DILocation(line: 103, column: 22, scope: !121)
!132 = !DILocation(line: 103, column: 12, scope: !121)
!133 = !DILocation(line: 103, column: 5, scope: !121)
!134 = !DILocation(line: 105, column: 5, scope: !121)
!135 = !DILocation(line: 106, column: 5, scope: !121)
!136 = !DILocation(line: 107, column: 5, scope: !121)
!137 = !DILocation(line: 110, column: 5, scope: !121)
!138 = !DILocation(line: 111, column: 5, scope: !121)
!139 = !DILocation(line: 112, column: 5, scope: !121)
!140 = !DILocation(line: 114, column: 5, scope: !121)
!141 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 75, type: !67, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!142 = !DILocalVariable(name: "data", scope: !141, file: !20, line: 77, type: !3)
!143 = !DILocation(line: 77, column: 21, scope: !141)
!144 = !DILocalVariable(name: "dataBadBuffer", scope: !141, file: !20, line: 78, type: !3)
!145 = !DILocation(line: 78, column: 21, scope: !141)
!146 = !DILocation(line: 78, column: 54, scope: !141)
!147 = !DILocation(line: 78, column: 37, scope: !141)
!148 = !DILocalVariable(name: "dataGoodBuffer", scope: !141, file: !20, line: 79, type: !3)
!149 = !DILocation(line: 79, column: 21, scope: !141)
!150 = !DILocation(line: 79, column: 55, scope: !141)
!151 = !DILocation(line: 79, column: 38, scope: !141)
!152 = !DILocation(line: 81, column: 12, scope: !141)
!153 = !DILocation(line: 81, column: 10, scope: !141)
!154 = !DILocation(line: 82, column: 85, scope: !141)
!155 = !DILocation(line: 82, column: 5, scope: !141)
!156 = !DILocation(line: 83, column: 1, scope: !141)
