; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_badData = internal global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_goodG2BData = internal global %struct._twoIntsStruct* null, align 8, !dbg !16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_bad() #0 !dbg !26 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !30, metadata !DIExpression()), !dbg !31
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !32
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !33
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !34
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !35
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !36
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !42
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_badData, align 8, !dbg !43
  call void @badSink(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_good() #0 !dbg !46 {
entry:
  call void @goodG2B(), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !49 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !55, metadata !DIExpression()), !dbg !56
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call i64 @time(i64* noundef null), !dbg !59
  %conv = trunc i64 %call to i32, !dbg !60
  call void @srand(i32 noundef %conv), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !62
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_good(), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_bad(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !67
  ret i32 0, !dbg !68
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !69 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !70, metadata !DIExpression()), !dbg !71
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_badData, align 8, !dbg !72
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !73, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata i64* %i, metadata !79, metadata !DIExpression()), !dbg !86
  store i64 0, i64* %i, align 8, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !90
  %cmp = icmp ult i64 %1, 100, !dbg !92
  br i1 %cmp, label %for.body, label %for.end, !dbg !93

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !94
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !96
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !97
  store i32 0, i32* %intOne, align 8, !dbg !98
  %3 = load i64, i64* %i, align 8, !dbg !99
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !100
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !101
  store i32 0, i32* %intTwo, align 4, !dbg !102
  br label %for.inc, !dbg !103

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !104
  %inc = add i64 %4, 1, !dbg !104
  store i64 %inc, i64* %i, align 8, !dbg !104
  br label %for.cond, !dbg !105, !llvm.loop !106

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !109
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !109
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !109
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !109
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !109
  %call = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %7, i64 noundef 800, i64 noundef %10) #8, !dbg !109
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !110
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !110
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !111
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !112
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !112
  call void @free(i8* noundef %13), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #4

declare void @free(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !116, metadata !DIExpression()), !dbg !117
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !118
  %call = call i8* @malloc(i64 noundef 800) #6, !dbg !119
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !120
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !121
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !122
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !128
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_goodG2BData, align 8, !dbg !129
  call void @goodG2BSink(), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !132 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_goodG2BData, align 8, !dbg !135
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !145
  %cmp = icmp ult i64 %1, 100, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !151
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !152
  store i32 0, i32* %intOne, align 8, !dbg !153
  %3 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !155
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !156
  store i32 0, i32* %intTwo, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %4, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !163
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !163
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !163
  %7 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !163
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !163
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !163
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !163
  %call = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %7, i64 noundef 800, i64 noundef %10) #8, !dbg !163
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !164
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !164
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !165
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !166
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !166
  call void @free(i8* noundef %13), !dbg !167
  ret void, !dbg !168
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_badData", scope: !2, file: !18, line: 19, type: !5, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !15, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !13, !14}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!0, !16}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_goodG2BData", scope: !2, file: !18, line: 20, type: !5, isLocal: true, isDefinition: true)
!18 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"PIC Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Homebrew clang version 14.0.6"}
!26 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_bad", scope: !18, file: !18, line: 45, type: !27, scopeLine: 46, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !29)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !{}
!30 = !DILocalVariable(name: "data", scope: !26, file: !18, line: 47, type: !5)
!31 = !DILocation(line: 47, column: 21, scope: !26)
!32 = !DILocation(line: 48, column: 10, scope: !26)
!33 = !DILocation(line: 50, column: 29, scope: !26)
!34 = !DILocation(line: 50, column: 12, scope: !26)
!35 = !DILocation(line: 50, column: 10, scope: !26)
!36 = !DILocation(line: 51, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !26, file: !18, line: 51, column: 9)
!38 = !DILocation(line: 51, column: 14, scope: !37)
!39 = !DILocation(line: 51, column: 9, scope: !26)
!40 = !DILocation(line: 51, column: 24, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !18, line: 51, column: 23)
!42 = !DILocation(line: 52, column: 76, scope: !26)
!43 = !DILocation(line: 52, column: 74, scope: !26)
!44 = !DILocation(line: 53, column: 5, scope: !26)
!45 = !DILocation(line: 54, column: 1, scope: !26)
!46 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memcpy_45_good", scope: !18, file: !18, line: 93, type: !27, scopeLine: 94, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !29)
!47 = !DILocation(line: 95, column: 5, scope: !46)
!48 = !DILocation(line: 96, column: 1, scope: !46)
!49 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 107, type: !50, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !29)
!50 = !DISubroutineType(types: !51)
!51 = !{!11, !11, !52}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!55 = !DILocalVariable(name: "argc", arg: 1, scope: !49, file: !18, line: 107, type: !11)
!56 = !DILocation(line: 107, column: 14, scope: !49)
!57 = !DILocalVariable(name: "argv", arg: 2, scope: !49, file: !18, line: 107, type: !52)
!58 = !DILocation(line: 107, column: 27, scope: !49)
!59 = !DILocation(line: 110, column: 22, scope: !49)
!60 = !DILocation(line: 110, column: 12, scope: !49)
!61 = !DILocation(line: 110, column: 5, scope: !49)
!62 = !DILocation(line: 112, column: 5, scope: !49)
!63 = !DILocation(line: 113, column: 5, scope: !49)
!64 = !DILocation(line: 114, column: 5, scope: !49)
!65 = !DILocation(line: 117, column: 5, scope: !49)
!66 = !DILocation(line: 118, column: 5, scope: !49)
!67 = !DILocation(line: 119, column: 5, scope: !49)
!68 = !DILocation(line: 121, column: 5, scope: !49)
!69 = distinct !DISubprogram(name: "badSink", scope: !18, file: !18, line: 24, type: !27, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !29)
!70 = !DILocalVariable(name: "data", scope: !69, file: !18, line: 26, type: !5)
!71 = !DILocation(line: 26, column: 21, scope: !69)
!72 = !DILocation(line: 26, column: 28, scope: !69)
!73 = !DILocalVariable(name: "source", scope: !74, file: !18, line: 28, type: !75)
!74 = distinct !DILexicalBlock(scope: !69, file: !18, line: 27, column: 5)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 100)
!78 = !DILocation(line: 28, column: 23, scope: !74)
!79 = !DILocalVariable(name: "i", scope: !80, file: !18, line: 30, type: !81)
!80 = distinct !DILexicalBlock(scope: !74, file: !18, line: 29, column: 9)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !82, line: 31, baseType: !83)
!82 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !84, line: 94, baseType: !85)
!84 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!85 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!86 = !DILocation(line: 30, column: 20, scope: !80)
!87 = !DILocation(line: 32, column: 20, scope: !88)
!88 = distinct !DILexicalBlock(scope: !80, file: !18, line: 32, column: 13)
!89 = !DILocation(line: 32, column: 18, scope: !88)
!90 = !DILocation(line: 32, column: 25, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !18, line: 32, column: 13)
!92 = !DILocation(line: 32, column: 27, scope: !91)
!93 = !DILocation(line: 32, column: 13, scope: !88)
!94 = !DILocation(line: 34, column: 24, scope: !95)
!95 = distinct !DILexicalBlock(scope: !91, file: !18, line: 33, column: 13)
!96 = !DILocation(line: 34, column: 17, scope: !95)
!97 = !DILocation(line: 34, column: 27, scope: !95)
!98 = !DILocation(line: 34, column: 34, scope: !95)
!99 = !DILocation(line: 35, column: 24, scope: !95)
!100 = !DILocation(line: 35, column: 17, scope: !95)
!101 = !DILocation(line: 35, column: 27, scope: !95)
!102 = !DILocation(line: 35, column: 34, scope: !95)
!103 = !DILocation(line: 36, column: 13, scope: !95)
!104 = !DILocation(line: 32, column: 35, scope: !91)
!105 = !DILocation(line: 32, column: 13, scope: !91)
!106 = distinct !{!106, !93, !107, !108}
!107 = !DILocation(line: 36, column: 13, scope: !88)
!108 = !{!"llvm.loop.mustprogress"}
!109 = !DILocation(line: 39, column: 9, scope: !74)
!110 = !DILocation(line: 40, column: 26, scope: !74)
!111 = !DILocation(line: 40, column: 9, scope: !74)
!112 = !DILocation(line: 41, column: 14, scope: !74)
!113 = !DILocation(line: 41, column: 9, scope: !74)
!114 = !DILocation(line: 43, column: 1, scope: !69)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 82, type: !27, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !29)
!116 = !DILocalVariable(name: "data", scope: !115, file: !18, line: 84, type: !5)
!117 = !DILocation(line: 84, column: 21, scope: !115)
!118 = !DILocation(line: 85, column: 10, scope: !115)
!119 = !DILocation(line: 87, column: 29, scope: !115)
!120 = !DILocation(line: 87, column: 12, scope: !115)
!121 = !DILocation(line: 87, column: 10, scope: !115)
!122 = !DILocation(line: 88, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !18, line: 88, column: 9)
!124 = !DILocation(line: 88, column: 14, scope: !123)
!125 = !DILocation(line: 88, column: 9, scope: !115)
!126 = !DILocation(line: 88, column: 24, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !18, line: 88, column: 23)
!128 = !DILocation(line: 89, column: 80, scope: !115)
!129 = !DILocation(line: 89, column: 78, scope: !115)
!130 = !DILocation(line: 90, column: 5, scope: !115)
!131 = !DILocation(line: 91, column: 1, scope: !115)
!132 = distinct !DISubprogram(name: "goodG2BSink", scope: !18, file: !18, line: 61, type: !27, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !29)
!133 = !DILocalVariable(name: "data", scope: !132, file: !18, line: 63, type: !5)
!134 = !DILocation(line: 63, column: 21, scope: !132)
!135 = !DILocation(line: 63, column: 28, scope: !132)
!136 = !DILocalVariable(name: "source", scope: !137, file: !18, line: 65, type: !75)
!137 = distinct !DILexicalBlock(scope: !132, file: !18, line: 64, column: 5)
!138 = !DILocation(line: 65, column: 23, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !18, line: 67, type: !81)
!140 = distinct !DILexicalBlock(scope: !137, file: !18, line: 66, column: 9)
!141 = !DILocation(line: 67, column: 20, scope: !140)
!142 = !DILocation(line: 69, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !18, line: 69, column: 13)
!144 = !DILocation(line: 69, column: 18, scope: !143)
!145 = !DILocation(line: 69, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !18, line: 69, column: 13)
!147 = !DILocation(line: 69, column: 27, scope: !146)
!148 = !DILocation(line: 69, column: 13, scope: !143)
!149 = !DILocation(line: 71, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !18, line: 70, column: 13)
!151 = !DILocation(line: 71, column: 17, scope: !150)
!152 = !DILocation(line: 71, column: 27, scope: !150)
!153 = !DILocation(line: 71, column: 34, scope: !150)
!154 = !DILocation(line: 72, column: 24, scope: !150)
!155 = !DILocation(line: 72, column: 17, scope: !150)
!156 = !DILocation(line: 72, column: 27, scope: !150)
!157 = !DILocation(line: 72, column: 34, scope: !150)
!158 = !DILocation(line: 73, column: 13, scope: !150)
!159 = !DILocation(line: 69, column: 35, scope: !146)
!160 = !DILocation(line: 69, column: 13, scope: !146)
!161 = distinct !{!161, !148, !162, !108}
!162 = !DILocation(line: 73, column: 13, scope: !143)
!163 = !DILocation(line: 76, column: 9, scope: !137)
!164 = !DILocation(line: 77, column: 26, scope: !137)
!165 = !DILocation(line: 77, column: 9, scope: !137)
!166 = !DILocation(line: 78, column: 14, scope: !137)
!167 = !DILocation(line: 78, column: 9, scope: !137)
!168 = !DILocation(line: 80, column: 1, scope: !132)
