; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16_bad() #0 !dbg !19 {
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
  br label %while.body, !dbg !34

while.body:                                       ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !35
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !37
  br label %while.end, !dbg !38

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !39, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !52
  store i64 0, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !56
  %cmp = icmp ult i64 %5, 100, !dbg !58
  br i1 %cmp, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !62
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !63
  store i32 0, i32* %intOne, align 8, !dbg !64
  %7 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !66
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !67
  store i32 0, i32* %intTwo, align 4, !dbg !68
  br label %for.inc, !dbg !69

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !70
  %inc = add i64 %8, 1, !dbg !70
  store i64 %inc, i64* %i, align 8, !dbg !70
  br label %for.cond, !dbg !71, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !75
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !75
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !75
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !75
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !75
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !75
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !76
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16_good(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16_bad(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !102 {
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
  br label %while.body, !dbg !113

while.body:                                       ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !114
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !116
  br label %while.end, !dbg !117

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !118, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata i64* %i, metadata !121, metadata !DIExpression()), !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %while.end
  %5 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %5, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !133
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !134
  store i32 0, i32* %intOne, align 8, !dbg !135
  %7 = load i64, i64* %i, align 8, !dbg !136
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !137
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !138
  store i32 0, i32* %intTwo, align 4, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !141
  %inc = add i64 %8, 1, !dbg !141
  store i64 %inc, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !145
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !145
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !145
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !145
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !145
  %call = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !145
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !146
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !146
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !147
  ret void, !dbg !148
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = !DILocation(line: 26, column: 5, scope: !19)
!35 = !DILocation(line: 30, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 27, column: 5)
!37 = !DILocation(line: 30, column: 14, scope: !36)
!38 = !DILocation(line: 31, column: 9, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !20, line: 34, type: !41)
!40 = distinct !DILexicalBlock(scope: !19, file: !20, line: 33, column: 5)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 34, column: 23, scope: !40)
!45 = !DILocalVariable(name: "i", scope: !46, file: !20, line: 36, type: !47)
!46 = distinct !DILexicalBlock(scope: !40, file: !20, line: 35, column: 9)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !50, line: 94, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 36, column: 20, scope: !46)
!53 = !DILocation(line: 38, column: 20, scope: !54)
!54 = distinct !DILexicalBlock(scope: !46, file: !20, line: 38, column: 13)
!55 = !DILocation(line: 38, column: 18, scope: !54)
!56 = !DILocation(line: 38, column: 25, scope: !57)
!57 = distinct !DILexicalBlock(scope: !54, file: !20, line: 38, column: 13)
!58 = !DILocation(line: 38, column: 27, scope: !57)
!59 = !DILocation(line: 38, column: 13, scope: !54)
!60 = !DILocation(line: 40, column: 24, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !20, line: 39, column: 13)
!62 = !DILocation(line: 40, column: 17, scope: !61)
!63 = !DILocation(line: 40, column: 27, scope: !61)
!64 = !DILocation(line: 40, column: 34, scope: !61)
!65 = !DILocation(line: 41, column: 24, scope: !61)
!66 = !DILocation(line: 41, column: 17, scope: !61)
!67 = !DILocation(line: 41, column: 27, scope: !61)
!68 = !DILocation(line: 41, column: 34, scope: !61)
!69 = !DILocation(line: 42, column: 13, scope: !61)
!70 = !DILocation(line: 38, column: 35, scope: !57)
!71 = !DILocation(line: 38, column: 13, scope: !57)
!72 = distinct !{!72, !59, !73, !74}
!73 = !DILocation(line: 42, column: 13, scope: !54)
!74 = !{!"llvm.loop.mustprogress"}
!75 = !DILocation(line: 45, column: 9, scope: !40)
!76 = !DILocation(line: 46, column: 26, scope: !40)
!77 = !DILocation(line: 46, column: 9, scope: !40)
!78 = !DILocation(line: 48, column: 1, scope: !19)
!79 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_16_good", scope: !20, file: !20, line: 83, type: !21, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!80 = !DILocation(line: 85, column: 5, scope: !79)
!81 = !DILocation(line: 86, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 98, type: !83, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!83 = !DISubroutineType(types: !84)
!84 = !{!9, !9, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !20, line: 98, type: !9)
!89 = !DILocation(line: 98, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !20, line: 98, type: !85)
!91 = !DILocation(line: 98, column: 27, scope: !82)
!92 = !DILocation(line: 101, column: 22, scope: !82)
!93 = !DILocation(line: 101, column: 12, scope: !82)
!94 = !DILocation(line: 101, column: 5, scope: !82)
!95 = !DILocation(line: 103, column: 5, scope: !82)
!96 = !DILocation(line: 104, column: 5, scope: !82)
!97 = !DILocation(line: 105, column: 5, scope: !82)
!98 = !DILocation(line: 108, column: 5, scope: !82)
!99 = !DILocation(line: 109, column: 5, scope: !82)
!100 = !DILocation(line: 110, column: 5, scope: !82)
!101 = !DILocation(line: 112, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 55, type: !21, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!103 = !DILocalVariable(name: "data", scope: !102, file: !20, line: 57, type: !3)
!104 = !DILocation(line: 57, column: 21, scope: !102)
!105 = !DILocalVariable(name: "dataBadBuffer", scope: !102, file: !20, line: 58, type: !3)
!106 = !DILocation(line: 58, column: 21, scope: !102)
!107 = !DILocation(line: 58, column: 54, scope: !102)
!108 = !DILocation(line: 58, column: 37, scope: !102)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !102, file: !20, line: 59, type: !3)
!110 = !DILocation(line: 59, column: 21, scope: !102)
!111 = !DILocation(line: 59, column: 55, scope: !102)
!112 = !DILocation(line: 59, column: 38, scope: !102)
!113 = !DILocation(line: 60, column: 5, scope: !102)
!114 = !DILocation(line: 63, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !102, file: !20, line: 61, column: 5)
!116 = !DILocation(line: 63, column: 14, scope: !115)
!117 = !DILocation(line: 64, column: 9, scope: !115)
!118 = !DILocalVariable(name: "source", scope: !119, file: !20, line: 67, type: !41)
!119 = distinct !DILexicalBlock(scope: !102, file: !20, line: 66, column: 5)
!120 = !DILocation(line: 67, column: 23, scope: !119)
!121 = !DILocalVariable(name: "i", scope: !122, file: !20, line: 69, type: !47)
!122 = distinct !DILexicalBlock(scope: !119, file: !20, line: 68, column: 9)
!123 = !DILocation(line: 69, column: 20, scope: !122)
!124 = !DILocation(line: 71, column: 20, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !20, line: 71, column: 13)
!126 = !DILocation(line: 71, column: 18, scope: !125)
!127 = !DILocation(line: 71, column: 25, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !20, line: 71, column: 13)
!129 = !DILocation(line: 71, column: 27, scope: !128)
!130 = !DILocation(line: 71, column: 13, scope: !125)
!131 = !DILocation(line: 73, column: 24, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !20, line: 72, column: 13)
!133 = !DILocation(line: 73, column: 17, scope: !132)
!134 = !DILocation(line: 73, column: 27, scope: !132)
!135 = !DILocation(line: 73, column: 34, scope: !132)
!136 = !DILocation(line: 74, column: 24, scope: !132)
!137 = !DILocation(line: 74, column: 17, scope: !132)
!138 = !DILocation(line: 74, column: 27, scope: !132)
!139 = !DILocation(line: 74, column: 34, scope: !132)
!140 = !DILocation(line: 75, column: 13, scope: !132)
!141 = !DILocation(line: 71, column: 35, scope: !128)
!142 = !DILocation(line: 71, column: 13, scope: !128)
!143 = distinct !{!143, !130, !144, !74}
!144 = !DILocation(line: 75, column: 13, scope: !125)
!145 = !DILocation(line: 78, column: 9, scope: !119)
!146 = !DILocation(line: 79, column: 26, scope: !119)
!147 = !DILocation(line: 79, column: 9, scope: !119)
!148 = !DILocation(line: 81, column: 1, scope: !102)
