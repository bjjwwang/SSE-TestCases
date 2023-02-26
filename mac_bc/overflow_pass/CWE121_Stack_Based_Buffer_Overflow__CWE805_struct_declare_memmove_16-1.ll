; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  br label %while.body, !dbg !36

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !39
  br label %while.end, !dbg !40

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !41, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %0, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !62
  store i32 0, i32* %intOne, align 8, !dbg !63
  %2 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !65
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !66
  store i32 0, i32* %intTwo, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %3, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !74
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !74
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !74
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !74
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !74
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !74
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !75
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16_good() #0 !dbg !78 {
entry:
  call void @goodG2B(), !dbg !79
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16_good(), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16_bad(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !99
  ret i32 0, !dbg !100
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !101 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  br label %while.body, !dbg !108

while.body:                                       ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !109
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !111
  br label %while.end, !dbg !112

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !113, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i64* %i, metadata !116, metadata !DIExpression()), !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !122
  %cmp = icmp ult i64 %0, 100, !dbg !124
  br i1 %cmp, label %for.body, label %for.end, !dbg !125

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !126
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !128
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !129
  store i32 0, i32* %intOne, align 8, !dbg !130
  %2 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !132
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !133
  store i32 0, i32* %intTwo, align 4, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %3, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !140
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !140
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !140
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !140
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !140
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !140
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !141
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !141
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !142
  ret void, !dbg !143
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!36 = !DILocation(line: 26, column: 5, scope: !11)
!37 = !DILocation(line: 30, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!39 = !DILocation(line: 30, column: 14, scope: !38)
!40 = !DILocation(line: 31, column: 9, scope: !38)
!41 = !DILocalVariable(name: "source", scope: !42, file: !12, line: 34, type: !32)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!43 = !DILocation(line: 34, column: 23, scope: !42)
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 36, type: !46)
!45 = distinct !DILexicalBlock(scope: !42, file: !12, line: 35, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !49, line: 94, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 36, column: 20, scope: !45)
!52 = !DILocation(line: 38, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !12, line: 38, column: 13)
!54 = !DILocation(line: 38, column: 18, scope: !53)
!55 = !DILocation(line: 38, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !12, line: 38, column: 13)
!57 = !DILocation(line: 38, column: 27, scope: !56)
!58 = !DILocation(line: 38, column: 13, scope: !53)
!59 = !DILocation(line: 40, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !12, line: 39, column: 13)
!61 = !DILocation(line: 40, column: 17, scope: !60)
!62 = !DILocation(line: 40, column: 27, scope: !60)
!63 = !DILocation(line: 40, column: 34, scope: !60)
!64 = !DILocation(line: 41, column: 24, scope: !60)
!65 = !DILocation(line: 41, column: 17, scope: !60)
!66 = !DILocation(line: 41, column: 27, scope: !60)
!67 = !DILocation(line: 41, column: 34, scope: !60)
!68 = !DILocation(line: 42, column: 13, scope: !60)
!69 = !DILocation(line: 38, column: 35, scope: !56)
!70 = !DILocation(line: 38, column: 13, scope: !56)
!71 = distinct !{!71, !58, !72, !73}
!72 = !DILocation(line: 42, column: 13, scope: !53)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 45, column: 9, scope: !42)
!75 = !DILocation(line: 46, column: 26, scope: !42)
!76 = !DILocation(line: 46, column: 9, scope: !42)
!77 = !DILocation(line: 48, column: 1, scope: !11)
!78 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_16_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!79 = !DILocation(line: 85, column: 5, scope: !78)
!80 = !DILocation(line: 86, column: 1, scope: !78)
!81 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !82, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DISubroutineType(types: !83)
!83 = !{!23, !23, !84}
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!87 = !DILocalVariable(name: "argc", arg: 1, scope: !81, file: !12, line: 98, type: !23)
!88 = !DILocation(line: 98, column: 14, scope: !81)
!89 = !DILocalVariable(name: "argv", arg: 2, scope: !81, file: !12, line: 98, type: !84)
!90 = !DILocation(line: 98, column: 27, scope: !81)
!91 = !DILocation(line: 101, column: 22, scope: !81)
!92 = !DILocation(line: 101, column: 12, scope: !81)
!93 = !DILocation(line: 101, column: 5, scope: !81)
!94 = !DILocation(line: 103, column: 5, scope: !81)
!95 = !DILocation(line: 104, column: 5, scope: !81)
!96 = !DILocation(line: 105, column: 5, scope: !81)
!97 = !DILocation(line: 108, column: 5, scope: !81)
!98 = !DILocation(line: 109, column: 5, scope: !81)
!99 = !DILocation(line: 110, column: 5, scope: !81)
!100 = !DILocation(line: 112, column: 5, scope: !81)
!101 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 57, type: !17)
!103 = !DILocation(line: 57, column: 21, scope: !101)
!104 = !DILocalVariable(name: "dataBadBuffer", scope: !101, file: !12, line: 58, type: !27)
!105 = !DILocation(line: 58, column: 19, scope: !101)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !101, file: !12, line: 59, type: !32)
!107 = !DILocation(line: 59, column: 19, scope: !101)
!108 = !DILocation(line: 60, column: 5, scope: !101)
!109 = !DILocation(line: 63, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !12, line: 61, column: 5)
!111 = !DILocation(line: 63, column: 14, scope: !110)
!112 = !DILocation(line: 64, column: 9, scope: !110)
!113 = !DILocalVariable(name: "source", scope: !114, file: !12, line: 67, type: !32)
!114 = distinct !DILexicalBlock(scope: !101, file: !12, line: 66, column: 5)
!115 = !DILocation(line: 67, column: 23, scope: !114)
!116 = !DILocalVariable(name: "i", scope: !117, file: !12, line: 69, type: !46)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 68, column: 9)
!118 = !DILocation(line: 69, column: 20, scope: !117)
!119 = !DILocation(line: 71, column: 20, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !12, line: 71, column: 13)
!121 = !DILocation(line: 71, column: 18, scope: !120)
!122 = !DILocation(line: 71, column: 25, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !12, line: 71, column: 13)
!124 = !DILocation(line: 71, column: 27, scope: !123)
!125 = !DILocation(line: 71, column: 13, scope: !120)
!126 = !DILocation(line: 73, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !12, line: 72, column: 13)
!128 = !DILocation(line: 73, column: 17, scope: !127)
!129 = !DILocation(line: 73, column: 27, scope: !127)
!130 = !DILocation(line: 73, column: 34, scope: !127)
!131 = !DILocation(line: 74, column: 24, scope: !127)
!132 = !DILocation(line: 74, column: 17, scope: !127)
!133 = !DILocation(line: 74, column: 27, scope: !127)
!134 = !DILocation(line: 74, column: 34, scope: !127)
!135 = !DILocation(line: 75, column: 13, scope: !127)
!136 = !DILocation(line: 71, column: 35, scope: !123)
!137 = !DILocation(line: 71, column: 13, scope: !123)
!138 = distinct !{!138, !125, !139, !73}
!139 = !DILocation(line: 75, column: 13, scope: !120)
!140 = !DILocation(line: 78, column: 9, scope: !114)
!141 = !DILocation(line: 79, column: 26, scope: !114)
!142 = !DILocation(line: 79, column: 9, scope: !114)
!143 = !DILocation(line: 81, column: 1, scope: !101)
