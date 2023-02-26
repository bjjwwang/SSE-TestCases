; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !27
  br label %while.body, !dbg !28

while.body:                                       ; preds = %entry
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !29
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !31
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %while.body
  call void @exit(i32 noundef -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !39

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !40, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %while.end
  %2 = load i64, i64* %i, align 8, !dbg !57
  %cmp1 = icmp ult i64 %2, 100, !dbg !59
  br i1 %cmp1, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !63
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !64
  store i32 0, i32* %intOne, align 8, !dbg !65
  %4 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !67
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !68
  store i32 0, i32* %intTwo, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %5, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !76, metadata !DIExpression()), !dbg !78
  store i64 0, i64* %i3, align 8, !dbg !79
  br label %for.cond4, !dbg !81

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !82
  %cmp5 = icmp ult i64 %6, 100, !dbg !84
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !85

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %8 = load i64, i64* %i3, align 8, !dbg !88
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !86
  %9 = load i64, i64* %i3, align 8, !dbg !89
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !90
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !90
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !90
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !90
  br label %for.inc9, !dbg !91

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !92
  %inc10 = add i64 %12, 1, !dbg !92
  store i64 %inc10, i64* %i3, align 8, !dbg !92
  br label %for.cond4, !dbg !93, !llvm.loop !94

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !96
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !96
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !97
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !98
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !98
  call void @free(i8* noundef %15), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare void @printStructLine(%struct._twoIntsStruct* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16_good() #0 !dbg !101 {
entry:
  call void @goodG2B(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* noundef null), !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 noundef %conv), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !117
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16_good(), !dbg !118
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16_bad(), !dbg !121
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !124 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !125, metadata !DIExpression()), !dbg !126
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !127
  br label %while.body, !dbg !128

while.body:                                       ; preds = %entry
  %call = call i8* @malloc(i64 noundef 800) #6, !dbg !129
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !131
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !132
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !133
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !135
  br i1 %cmp, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %while.body
  call void @exit(i32 noundef -1) #7, !dbg !137
  unreachable, !dbg !137

if.end:                                           ; preds = %while.body
  br label %while.end, !dbg !139

while.end:                                        ; preds = %if.end
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %while.end
  %2 = load i64, i64* %i, align 8, !dbg !149
  %cmp1 = icmp ult i64 %2, 100, !dbg !151
  br i1 %cmp1, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !153
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !155
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !156
  store i32 0, i32* %intOne, align 8, !dbg !157
  %4 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !159
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !160
  store i32 0, i32* %intTwo, align 4, !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !163
  %inc = add i64 %5, 1, !dbg !163
  store i64 %inc, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !167, metadata !DIExpression()), !dbg !169
  store i64 0, i64* %i3, align 8, !dbg !170
  br label %for.cond4, !dbg !172

for.cond4:                                        ; preds = %for.inc9, %for.end
  %6 = load i64, i64* %i3, align 8, !dbg !173
  %cmp5 = icmp ult i64 %6, 100, !dbg !175
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !176

for.body6:                                        ; preds = %for.cond4
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !177
  %8 = load i64, i64* %i3, align 8, !dbg !179
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %7, i64 %8, !dbg !177
  %9 = load i64, i64* %i3, align 8, !dbg !180
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %9, !dbg !181
  %10 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !181
  %11 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !181
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 8 %11, i64 8, i1 false), !dbg !181
  br label %for.inc9, !dbg !182

for.inc9:                                         ; preds = %for.body6
  %12 = load i64, i64* %i3, align 8, !dbg !183
  %inc10 = add i64 %12, 1, !dbg !183
  store i64 %inc10, i64* %i3, align 8, !dbg !183
  br label %for.cond4, !dbg !184, !llvm.loop !185

for.end11:                                        ; preds = %for.cond4
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !187
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %13, i64 0, !dbg !187
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !188
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !189
  %15 = bitcast %struct._twoIntsStruct* %14 to i8*, !dbg !189
  call void @free(i8* noundef %15), !dbg !190
  ret void, !dbg !191
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !11, !12}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 100, baseType: !6)
!5 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 96, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 98, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 99, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!21 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !3)
!26 = !DILocation(line: 23, column: 21, scope: !20)
!27 = !DILocation(line: 24, column: 10, scope: !20)
!28 = !DILocation(line: 25, column: 5, scope: !20)
!29 = !DILocation(line: 28, column: 33, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !21, line: 26, column: 5)
!31 = !DILocation(line: 28, column: 16, scope: !30)
!32 = !DILocation(line: 28, column: 14, scope: !30)
!33 = !DILocation(line: 29, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !21, line: 29, column: 13)
!35 = !DILocation(line: 29, column: 18, scope: !34)
!36 = !DILocation(line: 29, column: 13, scope: !30)
!37 = !DILocation(line: 29, column: 28, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !21, line: 29, column: 27)
!39 = !DILocation(line: 30, column: 9, scope: !30)
!40 = !DILocalVariable(name: "source", scope: !41, file: !21, line: 33, type: !42)
!41 = distinct !DILexicalBlock(scope: !20, file: !21, line: 32, column: 5)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 100)
!45 = !DILocation(line: 33, column: 23, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !47, file: !21, line: 35, type: !48)
!47 = distinct !DILexicalBlock(scope: !41, file: !21, line: 34, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !51, line: 94, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!52 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 35, column: 20, scope: !47)
!54 = !DILocation(line: 37, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !21, line: 37, column: 13)
!56 = !DILocation(line: 37, column: 18, scope: !55)
!57 = !DILocation(line: 37, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !21, line: 37, column: 13)
!59 = !DILocation(line: 37, column: 27, scope: !58)
!60 = !DILocation(line: 37, column: 13, scope: !55)
!61 = !DILocation(line: 39, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !21, line: 38, column: 13)
!63 = !DILocation(line: 39, column: 17, scope: !62)
!64 = !DILocation(line: 39, column: 27, scope: !62)
!65 = !DILocation(line: 39, column: 34, scope: !62)
!66 = !DILocation(line: 40, column: 24, scope: !62)
!67 = !DILocation(line: 40, column: 17, scope: !62)
!68 = !DILocation(line: 40, column: 27, scope: !62)
!69 = !DILocation(line: 40, column: 34, scope: !62)
!70 = !DILocation(line: 41, column: 13, scope: !62)
!71 = !DILocation(line: 37, column: 35, scope: !58)
!72 = !DILocation(line: 37, column: 13, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 41, column: 13, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocalVariable(name: "i", scope: !77, file: !21, line: 44, type: !48)
!77 = distinct !DILexicalBlock(scope: !41, file: !21, line: 43, column: 9)
!78 = !DILocation(line: 44, column: 20, scope: !77)
!79 = !DILocation(line: 46, column: 20, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !21, line: 46, column: 13)
!81 = !DILocation(line: 46, column: 18, scope: !80)
!82 = !DILocation(line: 46, column: 25, scope: !83)
!83 = distinct !DILexicalBlock(scope: !80, file: !21, line: 46, column: 13)
!84 = !DILocation(line: 46, column: 27, scope: !83)
!85 = !DILocation(line: 46, column: 13, scope: !80)
!86 = !DILocation(line: 48, column: 17, scope: !87)
!87 = distinct !DILexicalBlock(scope: !83, file: !21, line: 47, column: 13)
!88 = !DILocation(line: 48, column: 22, scope: !87)
!89 = !DILocation(line: 48, column: 34, scope: !87)
!90 = !DILocation(line: 48, column: 27, scope: !87)
!91 = !DILocation(line: 49, column: 13, scope: !87)
!92 = !DILocation(line: 46, column: 35, scope: !83)
!93 = !DILocation(line: 46, column: 13, scope: !83)
!94 = distinct !{!94, !85, !95, !75}
!95 = !DILocation(line: 49, column: 13, scope: !80)
!96 = !DILocation(line: 50, column: 30, scope: !77)
!97 = !DILocation(line: 50, column: 13, scope: !77)
!98 = !DILocation(line: 51, column: 18, scope: !77)
!99 = !DILocation(line: 51, column: 13, scope: !77)
!100 = !DILocation(line: 54, column: 1, scope: !20)
!101 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_16_good", scope: !21, file: !21, line: 96, type: !22, scopeLine: 97, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!102 = !DILocation(line: 98, column: 5, scope: !101)
!103 = !DILocation(line: 99, column: 1, scope: !101)
!104 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 111, type: !105, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!105 = !DISubroutineType(types: !106)
!106 = !{!9, !9, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !21, line: 111, type: !9)
!111 = !DILocation(line: 111, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !21, line: 111, type: !107)
!113 = !DILocation(line: 111, column: 27, scope: !104)
!114 = !DILocation(line: 114, column: 22, scope: !104)
!115 = !DILocation(line: 114, column: 12, scope: !104)
!116 = !DILocation(line: 114, column: 5, scope: !104)
!117 = !DILocation(line: 116, column: 5, scope: !104)
!118 = !DILocation(line: 117, column: 5, scope: !104)
!119 = !DILocation(line: 118, column: 5, scope: !104)
!120 = !DILocation(line: 121, column: 5, scope: !104)
!121 = !DILocation(line: 122, column: 5, scope: !104)
!122 = !DILocation(line: 123, column: 5, scope: !104)
!123 = !DILocation(line: 125, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 61, type: !22, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !24)
!125 = !DILocalVariable(name: "data", scope: !124, file: !21, line: 63, type: !3)
!126 = !DILocation(line: 63, column: 21, scope: !124)
!127 = !DILocation(line: 64, column: 10, scope: !124)
!128 = !DILocation(line: 65, column: 5, scope: !124)
!129 = !DILocation(line: 68, column: 33, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !21, line: 66, column: 5)
!131 = !DILocation(line: 68, column: 16, scope: !130)
!132 = !DILocation(line: 68, column: 14, scope: !130)
!133 = !DILocation(line: 69, column: 13, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !21, line: 69, column: 13)
!135 = !DILocation(line: 69, column: 18, scope: !134)
!136 = !DILocation(line: 69, column: 13, scope: !130)
!137 = !DILocation(line: 69, column: 28, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !21, line: 69, column: 27)
!139 = !DILocation(line: 70, column: 9, scope: !130)
!140 = !DILocalVariable(name: "source", scope: !141, file: !21, line: 73, type: !42)
!141 = distinct !DILexicalBlock(scope: !124, file: !21, line: 72, column: 5)
!142 = !DILocation(line: 73, column: 23, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !144, file: !21, line: 75, type: !48)
!144 = distinct !DILexicalBlock(scope: !141, file: !21, line: 74, column: 9)
!145 = !DILocation(line: 75, column: 20, scope: !144)
!146 = !DILocation(line: 77, column: 20, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !21, line: 77, column: 13)
!148 = !DILocation(line: 77, column: 18, scope: !147)
!149 = !DILocation(line: 77, column: 25, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !21, line: 77, column: 13)
!151 = !DILocation(line: 77, column: 27, scope: !150)
!152 = !DILocation(line: 77, column: 13, scope: !147)
!153 = !DILocation(line: 79, column: 24, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !21, line: 78, column: 13)
!155 = !DILocation(line: 79, column: 17, scope: !154)
!156 = !DILocation(line: 79, column: 27, scope: !154)
!157 = !DILocation(line: 79, column: 34, scope: !154)
!158 = !DILocation(line: 80, column: 24, scope: !154)
!159 = !DILocation(line: 80, column: 17, scope: !154)
!160 = !DILocation(line: 80, column: 27, scope: !154)
!161 = !DILocation(line: 80, column: 34, scope: !154)
!162 = !DILocation(line: 81, column: 13, scope: !154)
!163 = !DILocation(line: 77, column: 35, scope: !150)
!164 = !DILocation(line: 77, column: 13, scope: !150)
!165 = distinct !{!165, !152, !166, !75}
!166 = !DILocation(line: 81, column: 13, scope: !147)
!167 = !DILocalVariable(name: "i", scope: !168, file: !21, line: 84, type: !48)
!168 = distinct !DILexicalBlock(scope: !141, file: !21, line: 83, column: 9)
!169 = !DILocation(line: 84, column: 20, scope: !168)
!170 = !DILocation(line: 86, column: 20, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !21, line: 86, column: 13)
!172 = !DILocation(line: 86, column: 18, scope: !171)
!173 = !DILocation(line: 86, column: 25, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !21, line: 86, column: 13)
!175 = !DILocation(line: 86, column: 27, scope: !174)
!176 = !DILocation(line: 86, column: 13, scope: !171)
!177 = !DILocation(line: 88, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !21, line: 87, column: 13)
!179 = !DILocation(line: 88, column: 22, scope: !178)
!180 = !DILocation(line: 88, column: 34, scope: !178)
!181 = !DILocation(line: 88, column: 27, scope: !178)
!182 = !DILocation(line: 89, column: 13, scope: !178)
!183 = !DILocation(line: 86, column: 35, scope: !174)
!184 = !DILocation(line: 86, column: 13, scope: !174)
!185 = distinct !{!185, !176, !186, !75}
!186 = !DILocation(line: 89, column: 13, scope: !171)
!187 = !DILocation(line: 90, column: 30, scope: !168)
!188 = !DILocation(line: 90, column: 13, scope: !168)
!189 = !DILocation(line: 91, column: 18, scope: !168)
!190 = !DILocation(line: 91, column: 13, scope: !168)
!191 = !DILocation(line: 94, column: 1, scope: !124)
