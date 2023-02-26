; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_badSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !11 {
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_bad() #0 !dbg !66 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !69, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !71, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !78
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !80
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_badSink(%struct._twoIntsStruct* noundef %0), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_goodG2BSink(%struct._twoIntsStruct* noundef %data) #0 !dbg !83 {
entry:
  %data.addr = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  store %struct._twoIntsStruct* %data, %struct._twoIntsStruct** %data.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data.addr, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !86, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i64* %i, metadata !89, metadata !DIExpression()), !dbg !91
  store i64 0, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !94

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !95
  %cmp = icmp ult i64 %0, 100, !dbg !97
  br i1 %cmp, label %for.body, label %for.end, !dbg !98

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !101
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !102
  store i32 0, i32* %intOne, align 8, !dbg !103
  %2 = load i64, i64* %i, align 8, !dbg !104
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !105
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !106
  store i32 0, i32* %intTwo, align 4, !dbg !107
  br label %for.inc, !dbg !108

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !109
  %inc = add i64 %3, 1, !dbg !109
  store i64 %inc, i64* %i, align 8, !dbg !109
  br label %for.cond, !dbg !110, !llvm.loop !111

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !113
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !113
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !113
  %6 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !113
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !113
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !113
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !113
  %call = call i8* @__memmove_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !113
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data.addr, align 8, !dbg !114
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !114
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_good() #0 !dbg !117 {
entry:
  call void @goodG2B(), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !120 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !126, metadata !DIExpression()), !dbg !127
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !128, metadata !DIExpression()), !dbg !129
  %call = call i64 @time(i64* noundef null), !dbg !130
  %conv = trunc i64 %call to i32, !dbg !131
  call void @srand(i32 noundef %conv), !dbg !132
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !133
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_good(), !dbg !134
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !135
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !136
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_bad(), !dbg !137
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !138
  ret i32 0, !dbg !139
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !140 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !147
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !148
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !149
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_goodG2BSink(%struct._twoIntsStruct* noundef %0), !dbg !150
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_badSink", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !17, line: 100, baseType: !18)
!17 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !17, line: 96, size: 64, elements: !19)
!19 = !{!20, !22}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !18, file: !17, line: 98, baseType: !21, size: 32)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !18, file: !17, line: 99, baseType: !21, size: 32, offset: 32)
!23 = !{}
!24 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 21, type: !15)
!25 = !DILocation(line: 21, column: 99, scope: !11)
!26 = !DILocalVariable(name: "source", scope: !27, file: !12, line: 24, type: !28)
!27 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 5)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 24, column: 23, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !12, line: 26, type: !34)
!33 = distinct !DILexicalBlock(scope: !27, file: !12, line: 25, column: 9)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 31, baseType: !36)
!35 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !37, line: 94, baseType: !38)
!37 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 26, column: 20, scope: !33)
!40 = !DILocation(line: 28, column: 20, scope: !41)
!41 = distinct !DILexicalBlock(scope: !33, file: !12, line: 28, column: 13)
!42 = !DILocation(line: 28, column: 18, scope: !41)
!43 = !DILocation(line: 28, column: 25, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 28, column: 13)
!45 = !DILocation(line: 28, column: 27, scope: !44)
!46 = !DILocation(line: 28, column: 13, scope: !41)
!47 = !DILocation(line: 30, column: 24, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !12, line: 29, column: 13)
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
!65 = !DILocation(line: 38, column: 1, scope: !11)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_bad", scope: !12, file: !12, line: 40, type: !67, scopeLine: 41, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!67 = !DISubroutineType(types: !68)
!68 = !{null}
!69 = !DILocalVariable(name: "data", scope: !66, file: !12, line: 42, type: !15)
!70 = !DILocation(line: 42, column: 21, scope: !66)
!71 = !DILocalVariable(name: "dataBadBuffer", scope: !66, file: !12, line: 43, type: !72)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 50)
!75 = !DILocation(line: 43, column: 19, scope: !66)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !66, file: !12, line: 44, type: !28)
!77 = !DILocation(line: 44, column: 19, scope: !66)
!78 = !DILocation(line: 47, column: 12, scope: !66)
!79 = !DILocation(line: 47, column: 10, scope: !66)
!80 = !DILocation(line: 48, column: 82, scope: !66)
!81 = !DILocation(line: 48, column: 5, scope: !66)
!82 = !DILocation(line: 49, column: 1, scope: !66)
!83 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_goodG2BSink", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!84 = !DILocalVariable(name: "data", arg: 1, scope: !83, file: !12, line: 55, type: !15)
!85 = !DILocation(line: 55, column: 103, scope: !83)
!86 = !DILocalVariable(name: "source", scope: !87, file: !12, line: 58, type: !28)
!87 = distinct !DILexicalBlock(scope: !83, file: !12, line: 57, column: 5)
!88 = !DILocation(line: 58, column: 23, scope: !87)
!89 = !DILocalVariable(name: "i", scope: !90, file: !12, line: 60, type: !34)
!90 = distinct !DILexicalBlock(scope: !87, file: !12, line: 59, column: 9)
!91 = !DILocation(line: 60, column: 20, scope: !90)
!92 = !DILocation(line: 62, column: 20, scope: !93)
!93 = distinct !DILexicalBlock(scope: !90, file: !12, line: 62, column: 13)
!94 = !DILocation(line: 62, column: 18, scope: !93)
!95 = !DILocation(line: 62, column: 25, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !12, line: 62, column: 13)
!97 = !DILocation(line: 62, column: 27, scope: !96)
!98 = !DILocation(line: 62, column: 13, scope: !93)
!99 = !DILocation(line: 64, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 63, column: 13)
!101 = !DILocation(line: 64, column: 17, scope: !100)
!102 = !DILocation(line: 64, column: 27, scope: !100)
!103 = !DILocation(line: 64, column: 34, scope: !100)
!104 = !DILocation(line: 65, column: 24, scope: !100)
!105 = !DILocation(line: 65, column: 17, scope: !100)
!106 = !DILocation(line: 65, column: 27, scope: !100)
!107 = !DILocation(line: 65, column: 34, scope: !100)
!108 = !DILocation(line: 66, column: 13, scope: !100)
!109 = !DILocation(line: 62, column: 35, scope: !96)
!110 = !DILocation(line: 62, column: 13, scope: !96)
!111 = distinct !{!111, !98, !112, !61}
!112 = !DILocation(line: 66, column: 13, scope: !93)
!113 = !DILocation(line: 69, column: 9, scope: !87)
!114 = !DILocation(line: 70, column: 26, scope: !87)
!115 = !DILocation(line: 70, column: 9, scope: !87)
!116 = !DILocation(line: 72, column: 1, scope: !83)
!117 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_41_good", scope: !12, file: !12, line: 85, type: !67, scopeLine: 86, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!118 = !DILocation(line: 87, column: 5, scope: !117)
!119 = !DILocation(line: 88, column: 1, scope: !117)
!120 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 100, type: !121, scopeLine: 101, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!121 = !DISubroutineType(types: !122)
!122 = !{!21, !21, !123}
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !125, size: 64)
!125 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!126 = !DILocalVariable(name: "argc", arg: 1, scope: !120, file: !12, line: 100, type: !21)
!127 = !DILocation(line: 100, column: 14, scope: !120)
!128 = !DILocalVariable(name: "argv", arg: 2, scope: !120, file: !12, line: 100, type: !123)
!129 = !DILocation(line: 100, column: 27, scope: !120)
!130 = !DILocation(line: 103, column: 22, scope: !120)
!131 = !DILocation(line: 103, column: 12, scope: !120)
!132 = !DILocation(line: 103, column: 5, scope: !120)
!133 = !DILocation(line: 105, column: 5, scope: !120)
!134 = !DILocation(line: 106, column: 5, scope: !120)
!135 = !DILocation(line: 107, column: 5, scope: !120)
!136 = !DILocation(line: 110, column: 5, scope: !120)
!137 = !DILocation(line: 111, column: 5, scope: !120)
!138 = !DILocation(line: 112, column: 5, scope: !120)
!139 = !DILocation(line: 114, column: 5, scope: !120)
!140 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 75, type: !67, scopeLine: 76, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!141 = !DILocalVariable(name: "data", scope: !140, file: !12, line: 77, type: !15)
!142 = !DILocation(line: 77, column: 21, scope: !140)
!143 = !DILocalVariable(name: "dataBadBuffer", scope: !140, file: !12, line: 78, type: !72)
!144 = !DILocation(line: 78, column: 19, scope: !140)
!145 = !DILocalVariable(name: "dataGoodBuffer", scope: !140, file: !12, line: 79, type: !28)
!146 = !DILocation(line: 79, column: 19, scope: !140)
!147 = !DILocation(line: 81, column: 12, scope: !140)
!148 = !DILocation(line: 81, column: 10, scope: !140)
!149 = !DILocation(line: 82, column: 86, scope: !140)
!150 = !DILocation(line: 82, column: 5, scope: !140)
!151 = !DILocation(line: 83, column: 1, scope: !140)
