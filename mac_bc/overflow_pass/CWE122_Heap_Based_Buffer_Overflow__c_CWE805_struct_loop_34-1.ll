; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }
%union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType = type { %struct._twoIntsStruct* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion, metadata !27, metadata !DIExpression()), !dbg !33
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !35
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !36
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !37
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !38
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !42
  unreachable, !dbg !42

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !44
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !45
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !47, metadata !DIExpression()), !dbg !49
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !50
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !50
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i, metadata !57, metadata !DIExpression()), !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !68
  %cmp2 = icmp ult i64 %4, 100, !dbg !70
  br i1 %cmp2, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !74
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !75
  store i32 0, i32* %intOne, align 8, !dbg !76
  %6 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !78
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !79
  store i32 0, i32* %intTwo, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %7, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !87, metadata !DIExpression()), !dbg !89
  store i64 0, i64* %i4, align 8, !dbg !90
  br label %for.cond5, !dbg !92

for.cond5:                                        ; preds = %for.inc10, %for.end
  %8 = load i64, i64* %i4, align 8, !dbg !93
  %cmp6 = icmp ult i64 %8, 100, !dbg !95
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !96

for.body7:                                        ; preds = %for.cond5
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !97
  %10 = load i64, i64* %i4, align 8, !dbg !99
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !97
  %11 = load i64, i64* %i4, align 8, !dbg !100
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !101
  %12 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !101
  %13 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !101
  br label %for.inc10, !dbg !102

for.inc10:                                        ; preds = %for.body7
  %14 = load i64, i64* %i4, align 8, !dbg !103
  %inc11 = add i64 %14, 1, !dbg !103
  store i64 %inc11, i64* %i4, align 8, !dbg !103
  br label %for.cond5, !dbg !104, !llvm.loop !105

for.end12:                                        ; preds = %for.cond5
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !107
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !107
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx13), !dbg !108
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !109
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !109
  call void @free(i8* noundef %17), !dbg !110
  ret void, !dbg !111
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_good() #0 !dbg !112 {
entry:
  call void @goodG2B(), !dbg !113
  ret void, !dbg !114
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !115 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !121, metadata !DIExpression()), !dbg !122
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !123, metadata !DIExpression()), !dbg !124
  %call = call i64 @time(i64* noundef null), !dbg !125
  %conv = trunc i64 %call to i32, !dbg !126
  call void @srand(i32 noundef %conv), !dbg !127
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !128
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_good(), !dbg !129
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !130
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !131
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_bad(), !dbg !132
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !133
  ret i32 0, !dbg !134
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !135 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %myUnion = alloca %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType, align 8
  %data1 = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i4 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion, metadata !138, metadata !DIExpression()), !dbg !139
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !140
  %call = call i8* @malloc(i64 noundef 800) #6, !dbg !141
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !142
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !146
  br i1 %cmp, label %if.then, label %if.end, !dbg !147

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %entry
  %2 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !150
  %unionFirst = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !151
  store %struct._twoIntsStruct* %2, %struct._twoIntsStruct** %unionFirst, align 8, !dbg !152
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data1, metadata !153, metadata !DIExpression()), !dbg !155
  %unionSecond = bitcast %union.CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType* %myUnion to %struct._twoIntsStruct**, !dbg !156
  %3 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %unionSecond, align 8, !dbg !156
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %data1, align 8, !dbg !155
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !162
  store i64 0, i64* %i, align 8, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !166
  %cmp2 = icmp ult i64 %4, 100, !dbg !168
  br i1 %cmp2, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !170
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %5, !dbg !172
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !173
  store i32 0, i32* %intOne, align 8, !dbg !174
  %6 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !176
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx3, i32 0, i32 1, !dbg !177
  store i32 0, i32* %intTwo, align 4, !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %7 = load i64, i64* %i, align 8, !dbg !180
  %inc = add i64 %7, 1, !dbg !180
  store i64 %inc, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !184, metadata !DIExpression()), !dbg !186
  store i64 0, i64* %i4, align 8, !dbg !187
  br label %for.cond5, !dbg !189

for.cond5:                                        ; preds = %for.inc10, %for.end
  %8 = load i64, i64* %i4, align 8, !dbg !190
  %cmp6 = icmp ult i64 %8, 100, !dbg !192
  br i1 %cmp6, label %for.body7, label %for.end12, !dbg !193

for.body7:                                        ; preds = %for.cond5
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !194
  %10 = load i64, i64* %i4, align 8, !dbg !196
  %arrayidx8 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %9, i64 %10, !dbg !194
  %11 = load i64, i64* %i4, align 8, !dbg !197
  %arrayidx9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %11, !dbg !198
  %12 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !198
  %13 = bitcast %struct._twoIntsStruct* %arrayidx9 to i8*, !dbg !198
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %12, i8* align 8 %13, i64 8, i1 false), !dbg !198
  br label %for.inc10, !dbg !199

for.inc10:                                        ; preds = %for.body7
  %14 = load i64, i64* %i4, align 8, !dbg !200
  %inc11 = add i64 %14, 1, !dbg !200
  store i64 %inc11, i64* %i4, align 8, !dbg !200
  br label %for.cond5, !dbg !201, !llvm.loop !202

for.end12:                                        ; preds = %for.cond5
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !204
  %arrayidx13 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !204
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx13), !dbg !205
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data1, align 8, !dbg !206
  %17 = bitcast %struct._twoIntsStruct* %16 to i8*, !dbg !206
  call void @free(i8* noundef %17), !dbg !207
  ret void, !dbg !208
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_bad", scope: !21, file: !21, line: 27, type: !22, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!21 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 29, type: !3)
!26 = !DILocation(line: 29, column: 21, scope: !20)
!27 = !DILocalVariable(name: "myUnion", scope: !20, file: !21, line: 30, type: !28)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_unionType", file: !21, line: 23, baseType: !29)
!29 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !21, line: 19, size: 64, elements: !30)
!30 = !{!31, !32}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !29, file: !21, line: 21, baseType: !3, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !29, file: !21, line: 22, baseType: !3, size: 64)
!33 = !DILocation(line: 30, column: 74, scope: !20)
!34 = !DILocation(line: 31, column: 10, scope: !20)
!35 = !DILocation(line: 33, column: 29, scope: !20)
!36 = !DILocation(line: 33, column: 12, scope: !20)
!37 = !DILocation(line: 33, column: 10, scope: !20)
!38 = !DILocation(line: 34, column: 9, scope: !39)
!39 = distinct !DILexicalBlock(scope: !20, file: !21, line: 34, column: 9)
!40 = !DILocation(line: 34, column: 14, scope: !39)
!41 = !DILocation(line: 34, column: 9, scope: !20)
!42 = !DILocation(line: 34, column: 24, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !21, line: 34, column: 23)
!44 = !DILocation(line: 35, column: 26, scope: !20)
!45 = !DILocation(line: 35, column: 13, scope: !20)
!46 = !DILocation(line: 35, column: 24, scope: !20)
!47 = !DILocalVariable(name: "data", scope: !48, file: !21, line: 37, type: !3)
!48 = distinct !DILexicalBlock(scope: !20, file: !21, line: 36, column: 5)
!49 = !DILocation(line: 37, column: 25, scope: !48)
!50 = !DILocation(line: 37, column: 40, scope: !48)
!51 = !DILocalVariable(name: "source", scope: !52, file: !21, line: 39, type: !53)
!52 = distinct !DILexicalBlock(scope: !48, file: !21, line: 38, column: 9)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 39, column: 27, scope: !52)
!57 = !DILocalVariable(name: "i", scope: !58, file: !21, line: 41, type: !59)
!58 = distinct !DILexicalBlock(scope: !52, file: !21, line: 40, column: 13)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 31, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !62, line: 94, baseType: !63)
!62 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!63 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!64 = !DILocation(line: 41, column: 24, scope: !58)
!65 = !DILocation(line: 43, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !58, file: !21, line: 43, column: 17)
!67 = !DILocation(line: 43, column: 22, scope: !66)
!68 = !DILocation(line: 43, column: 29, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !21, line: 43, column: 17)
!70 = !DILocation(line: 43, column: 31, scope: !69)
!71 = !DILocation(line: 43, column: 17, scope: !66)
!72 = !DILocation(line: 45, column: 28, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !21, line: 44, column: 17)
!74 = !DILocation(line: 45, column: 21, scope: !73)
!75 = !DILocation(line: 45, column: 31, scope: !73)
!76 = !DILocation(line: 45, column: 38, scope: !73)
!77 = !DILocation(line: 46, column: 28, scope: !73)
!78 = !DILocation(line: 46, column: 21, scope: !73)
!79 = !DILocation(line: 46, column: 31, scope: !73)
!80 = !DILocation(line: 46, column: 38, scope: !73)
!81 = !DILocation(line: 47, column: 17, scope: !73)
!82 = !DILocation(line: 43, column: 39, scope: !69)
!83 = !DILocation(line: 43, column: 17, scope: !69)
!84 = distinct !{!84, !71, !85, !86}
!85 = !DILocation(line: 47, column: 17, scope: !66)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocalVariable(name: "i", scope: !88, file: !21, line: 50, type: !59)
!88 = distinct !DILexicalBlock(scope: !52, file: !21, line: 49, column: 13)
!89 = !DILocation(line: 50, column: 24, scope: !88)
!90 = !DILocation(line: 52, column: 24, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !21, line: 52, column: 17)
!92 = !DILocation(line: 52, column: 22, scope: !91)
!93 = !DILocation(line: 52, column: 29, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !21, line: 52, column: 17)
!95 = !DILocation(line: 52, column: 31, scope: !94)
!96 = !DILocation(line: 52, column: 17, scope: !91)
!97 = !DILocation(line: 54, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !21, line: 53, column: 17)
!99 = !DILocation(line: 54, column: 26, scope: !98)
!100 = !DILocation(line: 54, column: 38, scope: !98)
!101 = !DILocation(line: 54, column: 31, scope: !98)
!102 = !DILocation(line: 55, column: 17, scope: !98)
!103 = !DILocation(line: 52, column: 39, scope: !94)
!104 = !DILocation(line: 52, column: 17, scope: !94)
!105 = distinct !{!105, !96, !106, !86}
!106 = !DILocation(line: 55, column: 17, scope: !91)
!107 = !DILocation(line: 56, column: 34, scope: !88)
!108 = !DILocation(line: 56, column: 17, scope: !88)
!109 = !DILocation(line: 57, column: 22, scope: !88)
!110 = !DILocation(line: 57, column: 17, scope: !88)
!111 = !DILocation(line: 61, column: 1, scope: !20)
!112 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_34_good", scope: !21, file: !21, line: 104, type: !22, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!113 = !DILocation(line: 106, column: 5, scope: !112)
!114 = !DILocation(line: 107, column: 1, scope: !112)
!115 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 118, type: !116, scopeLine: 119, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!116 = !DISubroutineType(types: !117)
!117 = !{!9, !9, !118}
!118 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !119, size: 64)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!121 = !DILocalVariable(name: "argc", arg: 1, scope: !115, file: !21, line: 118, type: !9)
!122 = !DILocation(line: 118, column: 14, scope: !115)
!123 = !DILocalVariable(name: "argv", arg: 2, scope: !115, file: !21, line: 118, type: !118)
!124 = !DILocation(line: 118, column: 27, scope: !115)
!125 = !DILocation(line: 121, column: 22, scope: !115)
!126 = !DILocation(line: 121, column: 12, scope: !115)
!127 = !DILocation(line: 121, column: 5, scope: !115)
!128 = !DILocation(line: 123, column: 5, scope: !115)
!129 = !DILocation(line: 124, column: 5, scope: !115)
!130 = !DILocation(line: 125, column: 5, scope: !115)
!131 = !DILocation(line: 128, column: 5, scope: !115)
!132 = !DILocation(line: 129, column: 5, scope: !115)
!133 = !DILocation(line: 130, column: 5, scope: !115)
!134 = !DILocation(line: 132, column: 5, scope: !115)
!135 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 68, type: !22, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !24)
!136 = !DILocalVariable(name: "data", scope: !135, file: !21, line: 70, type: !3)
!137 = !DILocation(line: 70, column: 21, scope: !135)
!138 = !DILocalVariable(name: "myUnion", scope: !135, file: !21, line: 71, type: !28)
!139 = !DILocation(line: 71, column: 74, scope: !135)
!140 = !DILocation(line: 72, column: 10, scope: !135)
!141 = !DILocation(line: 74, column: 29, scope: !135)
!142 = !DILocation(line: 74, column: 12, scope: !135)
!143 = !DILocation(line: 74, column: 10, scope: !135)
!144 = !DILocation(line: 75, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !21, line: 75, column: 9)
!146 = !DILocation(line: 75, column: 14, scope: !145)
!147 = !DILocation(line: 75, column: 9, scope: !135)
!148 = !DILocation(line: 75, column: 24, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !21, line: 75, column: 23)
!150 = !DILocation(line: 76, column: 26, scope: !135)
!151 = !DILocation(line: 76, column: 13, scope: !135)
!152 = !DILocation(line: 76, column: 24, scope: !135)
!153 = !DILocalVariable(name: "data", scope: !154, file: !21, line: 78, type: !3)
!154 = distinct !DILexicalBlock(scope: !135, file: !21, line: 77, column: 5)
!155 = !DILocation(line: 78, column: 25, scope: !154)
!156 = !DILocation(line: 78, column: 40, scope: !154)
!157 = !DILocalVariable(name: "source", scope: !158, file: !21, line: 80, type: !53)
!158 = distinct !DILexicalBlock(scope: !154, file: !21, line: 79, column: 9)
!159 = !DILocation(line: 80, column: 27, scope: !158)
!160 = !DILocalVariable(name: "i", scope: !161, file: !21, line: 82, type: !59)
!161 = distinct !DILexicalBlock(scope: !158, file: !21, line: 81, column: 13)
!162 = !DILocation(line: 82, column: 24, scope: !161)
!163 = !DILocation(line: 84, column: 24, scope: !164)
!164 = distinct !DILexicalBlock(scope: !161, file: !21, line: 84, column: 17)
!165 = !DILocation(line: 84, column: 22, scope: !164)
!166 = !DILocation(line: 84, column: 29, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !21, line: 84, column: 17)
!168 = !DILocation(line: 84, column: 31, scope: !167)
!169 = !DILocation(line: 84, column: 17, scope: !164)
!170 = !DILocation(line: 86, column: 28, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !21, line: 85, column: 17)
!172 = !DILocation(line: 86, column: 21, scope: !171)
!173 = !DILocation(line: 86, column: 31, scope: !171)
!174 = !DILocation(line: 86, column: 38, scope: !171)
!175 = !DILocation(line: 87, column: 28, scope: !171)
!176 = !DILocation(line: 87, column: 21, scope: !171)
!177 = !DILocation(line: 87, column: 31, scope: !171)
!178 = !DILocation(line: 87, column: 38, scope: !171)
!179 = !DILocation(line: 88, column: 17, scope: !171)
!180 = !DILocation(line: 84, column: 39, scope: !167)
!181 = !DILocation(line: 84, column: 17, scope: !167)
!182 = distinct !{!182, !169, !183, !86}
!183 = !DILocation(line: 88, column: 17, scope: !164)
!184 = !DILocalVariable(name: "i", scope: !185, file: !21, line: 91, type: !59)
!185 = distinct !DILexicalBlock(scope: !158, file: !21, line: 90, column: 13)
!186 = !DILocation(line: 91, column: 24, scope: !185)
!187 = !DILocation(line: 93, column: 24, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !21, line: 93, column: 17)
!189 = !DILocation(line: 93, column: 22, scope: !188)
!190 = !DILocation(line: 93, column: 29, scope: !191)
!191 = distinct !DILexicalBlock(scope: !188, file: !21, line: 93, column: 17)
!192 = !DILocation(line: 93, column: 31, scope: !191)
!193 = !DILocation(line: 93, column: 17, scope: !188)
!194 = !DILocation(line: 95, column: 21, scope: !195)
!195 = distinct !DILexicalBlock(scope: !191, file: !21, line: 94, column: 17)
!196 = !DILocation(line: 95, column: 26, scope: !195)
!197 = !DILocation(line: 95, column: 38, scope: !195)
!198 = !DILocation(line: 95, column: 31, scope: !195)
!199 = !DILocation(line: 96, column: 17, scope: !195)
!200 = !DILocation(line: 93, column: 39, scope: !191)
!201 = !DILocation(line: 93, column: 17, scope: !191)
!202 = distinct !{!202, !193, !203, !86}
!203 = !DILocation(line: 96, column: 17, scope: !188)
!204 = !DILocation(line: 97, column: 34, scope: !185)
!205 = !DILocation(line: 97, column: 17, scope: !185)
!206 = !DILocation(line: 98, column: 22, scope: !185)
!207 = !DILocation(line: 98, column: 17, scope: !185)
!208 = !DILocation(line: 102, column: 1, scope: !135)
