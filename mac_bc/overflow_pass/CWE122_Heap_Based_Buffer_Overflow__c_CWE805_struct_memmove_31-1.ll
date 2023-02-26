; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !27
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !28
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !29
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !37, metadata !DIExpression()), !dbg !39
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !40
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !41, metadata !DIExpression()), !dbg !42
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !43
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !44, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !61
  %cmp2 = icmp ult i64 %4, 100, !dbg !63
  br i1 %cmp2, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !67
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !68
  store i32 0, i32* %intOne, align 8, !dbg !69
  %6 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !71
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !72
  store i32 0, i32* %intTwo, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %7, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !80
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !80
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !80
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !80
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !80
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !80
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !80
  %call4 = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %10, i64 noundef 800, i64 noundef %13) #8, !dbg !80
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !81
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !81
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !82
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !83
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !83
  call void @free(i8* noundef %16), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31_good() #0 !dbg !86 {
entry:
  call void @goodG2B(), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !89 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataCopy = alloca %struct._twoIntsStruct*, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !110, metadata !DIExpression()), !dbg !111
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %call = call i8* @malloc(i64 noundef 800) #6, !dbg !113
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !114
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !115
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !116
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataCopy, metadata !122, metadata !DIExpression()), !dbg !124
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !125
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !124
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !126, metadata !DIExpression()), !dbg !127
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataCopy, align 8, !dbg !128
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !129, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  store i64 0, i64* %i, align 8, !dbg !135
  br label %for.cond, !dbg !137

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !138
  %cmp2 = icmp ult i64 %4, 100, !dbg !140
  br i1 %cmp2, label %for.body, label %for.end, !dbg !141

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !144
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !145
  store i32 0, i32* %intOne, align 8, !dbg !146
  %6 = load i64, i64* %i, align 8, !dbg !147
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !148
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !149
  store i32 0, i32* %intTwo, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !152
  %inc = add i64 %7, 1, !dbg !152
  store i64 %inc, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !156
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !156
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !156
  %10 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !156
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !156
  %12 = bitcast %struct._twoIntsStruct* %11 to i8*, !dbg !156
  %13 = call i64 @llvm.objectsize.i64.p0i8(i8* %12, i1 false, i1 true, i1 false), !dbg !156
  %call4 = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %10, i64 noundef 800, i64 noundef %13) #8, !dbg !156
  %14 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !157
  %arrayidx5 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %14, i64 0, !dbg !157
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx5), !dbg !158
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !159
  %16 = bitcast %struct._twoIntsStruct* %15 to i8*, !dbg !159
  call void @free(i8* noundef %16), !dbg !160
  ret void, !dbg !161
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!21 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !3)
!26 = !DILocation(line: 23, column: 21, scope: !20)
!27 = !DILocation(line: 24, column: 10, scope: !20)
!28 = !DILocation(line: 26, column: 29, scope: !20)
!29 = !DILocation(line: 26, column: 12, scope: !20)
!30 = !DILocation(line: 26, column: 10, scope: !20)
!31 = !DILocation(line: 27, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !21, line: 27, column: 9)
!33 = !DILocation(line: 27, column: 14, scope: !32)
!34 = !DILocation(line: 27, column: 9, scope: !20)
!35 = !DILocation(line: 27, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !21, line: 27, column: 23)
!37 = !DILocalVariable(name: "dataCopy", scope: !38, file: !21, line: 29, type: !3)
!38 = distinct !DILexicalBlock(scope: !20, file: !21, line: 28, column: 5)
!39 = !DILocation(line: 29, column: 25, scope: !38)
!40 = !DILocation(line: 29, column: 36, scope: !38)
!41 = !DILocalVariable(name: "data", scope: !38, file: !21, line: 30, type: !3)
!42 = !DILocation(line: 30, column: 25, scope: !38)
!43 = !DILocation(line: 30, column: 32, scope: !38)
!44 = !DILocalVariable(name: "source", scope: !45, file: !21, line: 32, type: !46)
!45 = distinct !DILexicalBlock(scope: !38, file: !21, line: 31, column: 9)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 32, column: 27, scope: !45)
!50 = !DILocalVariable(name: "i", scope: !51, file: !21, line: 34, type: !52)
!51 = distinct !DILexicalBlock(scope: !45, file: !21, line: 33, column: 13)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 31, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !55, line: 94, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!56 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 34, column: 24, scope: !51)
!58 = !DILocation(line: 36, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !51, file: !21, line: 36, column: 17)
!60 = !DILocation(line: 36, column: 22, scope: !59)
!61 = !DILocation(line: 36, column: 29, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !21, line: 36, column: 17)
!63 = !DILocation(line: 36, column: 31, scope: !62)
!64 = !DILocation(line: 36, column: 17, scope: !59)
!65 = !DILocation(line: 38, column: 28, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !21, line: 37, column: 17)
!67 = !DILocation(line: 38, column: 21, scope: !66)
!68 = !DILocation(line: 38, column: 31, scope: !66)
!69 = !DILocation(line: 38, column: 38, scope: !66)
!70 = !DILocation(line: 39, column: 28, scope: !66)
!71 = !DILocation(line: 39, column: 21, scope: !66)
!72 = !DILocation(line: 39, column: 31, scope: !66)
!73 = !DILocation(line: 39, column: 38, scope: !66)
!74 = !DILocation(line: 40, column: 17, scope: !66)
!75 = !DILocation(line: 36, column: 39, scope: !62)
!76 = !DILocation(line: 36, column: 17, scope: !62)
!77 = distinct !{!77, !64, !78, !79}
!78 = !DILocation(line: 40, column: 17, scope: !59)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocation(line: 43, column: 13, scope: !45)
!81 = !DILocation(line: 44, column: 30, scope: !45)
!82 = !DILocation(line: 44, column: 13, scope: !45)
!83 = !DILocation(line: 45, column: 18, scope: !45)
!84 = !DILocation(line: 45, column: 13, scope: !45)
!85 = !DILocation(line: 48, column: 1, scope: !20)
!86 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_31_good", scope: !21, file: !21, line: 84, type: !22, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!87 = !DILocation(line: 86, column: 5, scope: !86)
!88 = !DILocation(line: 87, column: 1, scope: !86)
!89 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 98, type: !90, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!90 = !DISubroutineType(types: !91)
!91 = !{!9, !9, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !21, line: 98, type: !9)
!96 = !DILocation(line: 98, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !21, line: 98, type: !92)
!98 = !DILocation(line: 98, column: 27, scope: !89)
!99 = !DILocation(line: 101, column: 22, scope: !89)
!100 = !DILocation(line: 101, column: 12, scope: !89)
!101 = !DILocation(line: 101, column: 5, scope: !89)
!102 = !DILocation(line: 103, column: 5, scope: !89)
!103 = !DILocation(line: 104, column: 5, scope: !89)
!104 = !DILocation(line: 105, column: 5, scope: !89)
!105 = !DILocation(line: 108, column: 5, scope: !89)
!106 = !DILocation(line: 109, column: 5, scope: !89)
!107 = !DILocation(line: 110, column: 5, scope: !89)
!108 = !DILocation(line: 112, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 55, type: !22, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !24)
!110 = !DILocalVariable(name: "data", scope: !109, file: !21, line: 57, type: !3)
!111 = !DILocation(line: 57, column: 21, scope: !109)
!112 = !DILocation(line: 58, column: 10, scope: !109)
!113 = !DILocation(line: 60, column: 29, scope: !109)
!114 = !DILocation(line: 60, column: 12, scope: !109)
!115 = !DILocation(line: 60, column: 10, scope: !109)
!116 = !DILocation(line: 61, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !109, file: !21, line: 61, column: 9)
!118 = !DILocation(line: 61, column: 14, scope: !117)
!119 = !DILocation(line: 61, column: 9, scope: !109)
!120 = !DILocation(line: 61, column: 24, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !21, line: 61, column: 23)
!122 = !DILocalVariable(name: "dataCopy", scope: !123, file: !21, line: 63, type: !3)
!123 = distinct !DILexicalBlock(scope: !109, file: !21, line: 62, column: 5)
!124 = !DILocation(line: 63, column: 25, scope: !123)
!125 = !DILocation(line: 63, column: 36, scope: !123)
!126 = !DILocalVariable(name: "data", scope: !123, file: !21, line: 64, type: !3)
!127 = !DILocation(line: 64, column: 25, scope: !123)
!128 = !DILocation(line: 64, column: 32, scope: !123)
!129 = !DILocalVariable(name: "source", scope: !130, file: !21, line: 66, type: !46)
!130 = distinct !DILexicalBlock(scope: !123, file: !21, line: 65, column: 9)
!131 = !DILocation(line: 66, column: 27, scope: !130)
!132 = !DILocalVariable(name: "i", scope: !133, file: !21, line: 68, type: !52)
!133 = distinct !DILexicalBlock(scope: !130, file: !21, line: 67, column: 13)
!134 = !DILocation(line: 68, column: 24, scope: !133)
!135 = !DILocation(line: 70, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !21, line: 70, column: 17)
!137 = !DILocation(line: 70, column: 22, scope: !136)
!138 = !DILocation(line: 70, column: 29, scope: !139)
!139 = distinct !DILexicalBlock(scope: !136, file: !21, line: 70, column: 17)
!140 = !DILocation(line: 70, column: 31, scope: !139)
!141 = !DILocation(line: 70, column: 17, scope: !136)
!142 = !DILocation(line: 72, column: 28, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !21, line: 71, column: 17)
!144 = !DILocation(line: 72, column: 21, scope: !143)
!145 = !DILocation(line: 72, column: 31, scope: !143)
!146 = !DILocation(line: 72, column: 38, scope: !143)
!147 = !DILocation(line: 73, column: 28, scope: !143)
!148 = !DILocation(line: 73, column: 21, scope: !143)
!149 = !DILocation(line: 73, column: 31, scope: !143)
!150 = !DILocation(line: 73, column: 38, scope: !143)
!151 = !DILocation(line: 74, column: 17, scope: !143)
!152 = !DILocation(line: 70, column: 39, scope: !139)
!153 = !DILocation(line: 70, column: 17, scope: !139)
!154 = distinct !{!154, !141, !155, !79}
!155 = !DILocation(line: 74, column: 17, scope: !136)
!156 = !DILocation(line: 77, column: 13, scope: !130)
!157 = !DILocation(line: 78, column: 30, scope: !130)
!158 = !DILocation(line: 78, column: 13, scope: !130)
!159 = !DILocation(line: 79, column: 18, scope: !130)
!160 = !DILocation(line: 79, column: 13, scope: !130)
!161 = !DILocation(line: 82, column: 1, scope: !109)
