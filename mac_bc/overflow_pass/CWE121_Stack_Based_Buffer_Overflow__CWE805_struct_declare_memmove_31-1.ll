; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !38, metadata !DIExpression()), !dbg !40
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !41
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !42, metadata !DIExpression()), !dbg !43
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !44
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !45, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !59
  %cmp = icmp ult i64 %2, 100, !dbg !61
  br i1 %cmp, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !65
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !66
  store i32 0, i32* %intOne, align 8, !dbg !67
  %4 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !69
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !70
  store i32 0, i32* %intTwo, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %5, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !78
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !78
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !78
  %8 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !78
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !78
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !78
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !78
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #4, !dbg !78
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !79
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31_good() #0 !dbg !82 {
entry:
  call void @goodG2B(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* noundef null), !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 noundef %conv), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !105 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !112
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !114, metadata !DIExpression()), !dbg !116
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !117
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !118, metadata !DIExpression()), !dbg !119
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !120
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %data1, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i64* %i, metadata !124, metadata !DIExpression()), !dbg !126
  store i64 0, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !130
  %cmp = icmp ult i64 %2, 100, !dbg !132
  br i1 %cmp, label %for.body, label %for.end, !dbg !133

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !136
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !137
  store i32 0, i32* %intOne, align 8, !dbg !138
  %4 = load i64, i64* %i, align 8, !dbg !139
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !140
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !141
  store i32 0, i32* %intTwo, align 4, !dbg !142
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !144
  %inc = add i64 %5, 1, !dbg !144
  store i64 %inc, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !148
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !148
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !148
  %8 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !148
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !148
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !148
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !148
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #4, !dbg !148
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !149
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !150
  ret void, !dbg !151
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!36 = !DILocation(line: 28, column: 12, scope: !11)
!37 = !DILocation(line: 28, column: 10, scope: !11)
!38 = !DILocalVariable(name: "dataCopy", scope: !39, file: !12, line: 30, type: !17)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 5)
!40 = !DILocation(line: 30, column: 25, scope: !39)
!41 = !DILocation(line: 30, column: 36, scope: !39)
!42 = !DILocalVariable(name: "data", scope: !39, file: !12, line: 31, type: !17)
!43 = !DILocation(line: 31, column: 25, scope: !39)
!44 = !DILocation(line: 31, column: 32, scope: !39)
!45 = !DILocalVariable(name: "source", scope: !46, file: !12, line: 33, type: !32)
!46 = distinct !DILexicalBlock(scope: !39, file: !12, line: 32, column: 9)
!47 = !DILocation(line: 33, column: 27, scope: !46)
!48 = !DILocalVariable(name: "i", scope: !49, file: !12, line: 35, type: !50)
!49 = distinct !DILexicalBlock(scope: !46, file: !12, line: 34, column: 13)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 31, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !53, line: 94, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 35, column: 24, scope: !49)
!56 = !DILocation(line: 37, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !12, line: 37, column: 17)
!58 = !DILocation(line: 37, column: 22, scope: !57)
!59 = !DILocation(line: 37, column: 29, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !12, line: 37, column: 17)
!61 = !DILocation(line: 37, column: 31, scope: !60)
!62 = !DILocation(line: 37, column: 17, scope: !57)
!63 = !DILocation(line: 39, column: 28, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !12, line: 38, column: 17)
!65 = !DILocation(line: 39, column: 21, scope: !64)
!66 = !DILocation(line: 39, column: 31, scope: !64)
!67 = !DILocation(line: 39, column: 38, scope: !64)
!68 = !DILocation(line: 40, column: 28, scope: !64)
!69 = !DILocation(line: 40, column: 21, scope: !64)
!70 = !DILocation(line: 40, column: 31, scope: !64)
!71 = !DILocation(line: 40, column: 38, scope: !64)
!72 = !DILocation(line: 41, column: 17, scope: !64)
!73 = !DILocation(line: 37, column: 39, scope: !60)
!74 = !DILocation(line: 37, column: 17, scope: !60)
!75 = distinct !{!75, !62, !76, !77}
!76 = !DILocation(line: 41, column: 17, scope: !57)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 44, column: 13, scope: !46)
!79 = !DILocation(line: 45, column: 30, scope: !46)
!80 = !DILocation(line: 45, column: 13, scope: !46)
!81 = !DILocation(line: 48, column: 1, scope: !11)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_31_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!83 = !DILocation(line: 85, column: 5, scope: !82)
!84 = !DILocation(line: 86, column: 1, scope: !82)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 97, type: !86, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!86 = !DISubroutineType(types: !87)
!87 = !{!23, !23, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 97, type: !23)
!92 = !DILocation(line: 97, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 97, type: !88)
!94 = !DILocation(line: 97, column: 27, scope: !85)
!95 = !DILocation(line: 100, column: 22, scope: !85)
!96 = !DILocation(line: 100, column: 12, scope: !85)
!97 = !DILocation(line: 100, column: 5, scope: !85)
!98 = !DILocation(line: 102, column: 5, scope: !85)
!99 = !DILocation(line: 103, column: 5, scope: !85)
!100 = !DILocation(line: 104, column: 5, scope: !85)
!101 = !DILocation(line: 107, column: 5, scope: !85)
!102 = !DILocation(line: 108, column: 5, scope: !85)
!103 = !DILocation(line: 109, column: 5, scope: !85)
!104 = !DILocation(line: 111, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 57, type: !17)
!107 = !DILocation(line: 57, column: 21, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 58, type: !27)
!109 = !DILocation(line: 58, column: 19, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 59, type: !32)
!111 = !DILocation(line: 59, column: 19, scope: !105)
!112 = !DILocation(line: 61, column: 12, scope: !105)
!113 = !DILocation(line: 61, column: 10, scope: !105)
!114 = !DILocalVariable(name: "dataCopy", scope: !115, file: !12, line: 63, type: !17)
!115 = distinct !DILexicalBlock(scope: !105, file: !12, line: 62, column: 5)
!116 = !DILocation(line: 63, column: 25, scope: !115)
!117 = !DILocation(line: 63, column: 36, scope: !115)
!118 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 64, type: !17)
!119 = !DILocation(line: 64, column: 25, scope: !115)
!120 = !DILocation(line: 64, column: 32, scope: !115)
!121 = !DILocalVariable(name: "source", scope: !122, file: !12, line: 66, type: !32)
!122 = distinct !DILexicalBlock(scope: !115, file: !12, line: 65, column: 9)
!123 = !DILocation(line: 66, column: 27, scope: !122)
!124 = !DILocalVariable(name: "i", scope: !125, file: !12, line: 68, type: !50)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 67, column: 13)
!126 = !DILocation(line: 68, column: 24, scope: !125)
!127 = !DILocation(line: 70, column: 24, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 70, column: 17)
!129 = !DILocation(line: 70, column: 22, scope: !128)
!130 = !DILocation(line: 70, column: 29, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 70, column: 17)
!132 = !DILocation(line: 70, column: 31, scope: !131)
!133 = !DILocation(line: 70, column: 17, scope: !128)
!134 = !DILocation(line: 72, column: 28, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 71, column: 17)
!136 = !DILocation(line: 72, column: 21, scope: !135)
!137 = !DILocation(line: 72, column: 31, scope: !135)
!138 = !DILocation(line: 72, column: 38, scope: !135)
!139 = !DILocation(line: 73, column: 28, scope: !135)
!140 = !DILocation(line: 73, column: 21, scope: !135)
!141 = !DILocation(line: 73, column: 31, scope: !135)
!142 = !DILocation(line: 73, column: 38, scope: !135)
!143 = !DILocation(line: 74, column: 17, scope: !135)
!144 = !DILocation(line: 70, column: 39, scope: !131)
!145 = !DILocation(line: 70, column: 17, scope: !131)
!146 = distinct !{!146, !133, !147, !77}
!147 = !DILocation(line: 74, column: 17, scope: !128)
!148 = !DILocation(line: 77, column: 13, scope: !122)
!149 = !DILocation(line: 78, column: 30, scope: !122)
!150 = !DILocation(line: 78, column: 13, scope: !122)
!151 = !DILocation(line: 81, column: 1, scope: !105)
