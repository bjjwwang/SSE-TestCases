; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
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
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !54
  %cmp1 = icmp ult i64 %2, 100, !dbg !56
  br i1 %cmp1, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %4 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %5, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !73
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !73
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !73
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !73
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !73
  %call3 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #8, !dbg !73
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !74
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !75
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !76
  call void @free(i8* noundef %14), !dbg !77
  ret void, !dbg !78
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15_good() #0 !dbg !79 {
entry:
  call void @goodG2B1(), !dbg !80
  call void @goodG2B2(), !dbg !81
  ret void, !dbg !82
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !83 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !89, metadata !DIExpression()), !dbg !90
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !91, metadata !DIExpression()), !dbg !92
  %call = call i64 @time(i64* noundef null), !dbg !93
  %conv = trunc i64 %call to i32, !dbg !94
  call void @srand(i32 noundef %conv), !dbg !95
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !96
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15_good(), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !99
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15_bad(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !101
  ret i32 0, !dbg !102
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !103 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !104, metadata !DIExpression()), !dbg !105
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !106
  %call = call i8* @malloc(i64 noundef 800) #6, !dbg !107
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !108
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !110
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !112
  br i1 %cmp, label %if.then, label %if.end, !dbg !113

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !116, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !125
  %cmp1 = icmp ult i64 %2, 100, !dbg !127
  br i1 %cmp1, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !131
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !132
  store i32 0, i32* %intOne, align 8, !dbg !133
  %4 = load i64, i64* %i, align 8, !dbg !134
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !135
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !136
  store i32 0, i32* %intTwo, align 4, !dbg !137
  br label %for.inc, !dbg !138

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !139
  %inc = add i64 %5, 1, !dbg !139
  store i64 %inc, i64* %i, align 8, !dbg !139
  br label %for.cond, !dbg !140, !llvm.loop !141

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !143
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !143
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !143
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !143
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !143
  %call3 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #8, !dbg !143
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !144
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !144
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !145
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !146
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !146
  call void @free(i8* noundef %14), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !150, metadata !DIExpression()), !dbg !151
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %call = call i8* @malloc(i64 noundef 800) #6, !dbg !153
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !154
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !156
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !158
  br i1 %cmp, label %if.then, label %if.end, !dbg !159

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !160
  unreachable, !dbg !160

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata i64* %i, metadata !165, metadata !DIExpression()), !dbg !167
  store i64 0, i64* %i, align 8, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !171
  %cmp1 = icmp ult i64 %2, 100, !dbg !173
  br i1 %cmp1, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !177
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !178
  store i32 0, i32* %intOne, align 8, !dbg !179
  %4 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !181
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !182
  store i32 0, i32* %intTwo, align 4, !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !185
  %inc = add i64 %5, 1, !dbg !185
  store i64 %inc, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !189
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !189
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !189
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !189
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !189
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !189
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !189
  %call3 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #8, !dbg !189
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !190
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !190
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !191
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !192
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !192
  call void @free(i8* noundef %14), !dbg !193
  ret void, !dbg !194
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!21 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !3)
!26 = !DILocation(line: 23, column: 21, scope: !20)
!27 = !DILocation(line: 24, column: 10, scope: !20)
!28 = !DILocation(line: 29, column: 33, scope: !20)
!29 = !DILocation(line: 29, column: 16, scope: !20)
!30 = !DILocation(line: 29, column: 14, scope: !20)
!31 = !DILocation(line: 30, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !21, line: 30, column: 13)
!33 = !DILocation(line: 30, column: 18, scope: !32)
!34 = !DILocation(line: 30, column: 13, scope: !20)
!35 = !DILocation(line: 30, column: 28, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !21, line: 30, column: 27)
!37 = !DILocalVariable(name: "source", scope: !38, file: !21, line: 38, type: !39)
!38 = distinct !DILexicalBlock(scope: !20, file: !21, line: 37, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 38, column: 23, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !21, line: 40, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !21, line: 39, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !48, line: 94, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 40, column: 20, scope: !44)
!51 = !DILocation(line: 42, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !21, line: 42, column: 13)
!53 = !DILocation(line: 42, column: 18, scope: !52)
!54 = !DILocation(line: 42, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !21, line: 42, column: 13)
!56 = !DILocation(line: 42, column: 27, scope: !55)
!57 = !DILocation(line: 42, column: 13, scope: !52)
!58 = !DILocation(line: 44, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !21, line: 43, column: 13)
!60 = !DILocation(line: 44, column: 17, scope: !59)
!61 = !DILocation(line: 44, column: 27, scope: !59)
!62 = !DILocation(line: 44, column: 34, scope: !59)
!63 = !DILocation(line: 45, column: 24, scope: !59)
!64 = !DILocation(line: 45, column: 17, scope: !59)
!65 = !DILocation(line: 45, column: 27, scope: !59)
!66 = !DILocation(line: 45, column: 34, scope: !59)
!67 = !DILocation(line: 46, column: 13, scope: !59)
!68 = !DILocation(line: 42, column: 35, scope: !55)
!69 = !DILocation(line: 42, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 46, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 49, column: 9, scope: !38)
!74 = !DILocation(line: 50, column: 26, scope: !38)
!75 = !DILocation(line: 50, column: 9, scope: !38)
!76 = !DILocation(line: 51, column: 14, scope: !38)
!77 = !DILocation(line: 51, column: 9, scope: !38)
!78 = !DILocation(line: 53, column: 1, scope: !20)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_15_good", scope: !21, file: !21, line: 129, type: !22, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!80 = !DILocation(line: 131, column: 5, scope: !79)
!81 = !DILocation(line: 132, column: 5, scope: !79)
!82 = !DILocation(line: 133, column: 1, scope: !79)
!83 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 145, type: !84, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!84 = !DISubroutineType(types: !85)
!85 = !{!9, !9, !86}
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!89 = !DILocalVariable(name: "argc", arg: 1, scope: !83, file: !21, line: 145, type: !9)
!90 = !DILocation(line: 145, column: 14, scope: !83)
!91 = !DILocalVariable(name: "argv", arg: 2, scope: !83, file: !21, line: 145, type: !86)
!92 = !DILocation(line: 145, column: 27, scope: !83)
!93 = !DILocation(line: 148, column: 22, scope: !83)
!94 = !DILocation(line: 148, column: 12, scope: !83)
!95 = !DILocation(line: 148, column: 5, scope: !83)
!96 = !DILocation(line: 150, column: 5, scope: !83)
!97 = !DILocation(line: 151, column: 5, scope: !83)
!98 = !DILocation(line: 152, column: 5, scope: !83)
!99 = !DILocation(line: 155, column: 5, scope: !83)
!100 = !DILocation(line: 156, column: 5, scope: !83)
!101 = !DILocation(line: 157, column: 5, scope: !83)
!102 = !DILocation(line: 159, column: 5, scope: !83)
!103 = distinct !DISubprogram(name: "goodG2B1", scope: !21, file: !21, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !24)
!104 = !DILocalVariable(name: "data", scope: !103, file: !21, line: 62, type: !3)
!105 = !DILocation(line: 62, column: 21, scope: !103)
!106 = !DILocation(line: 63, column: 10, scope: !103)
!107 = !DILocation(line: 72, column: 33, scope: !103)
!108 = !DILocation(line: 72, column: 16, scope: !103)
!109 = !DILocation(line: 72, column: 14, scope: !103)
!110 = !DILocation(line: 73, column: 13, scope: !111)
!111 = distinct !DILexicalBlock(scope: !103, file: !21, line: 73, column: 13)
!112 = !DILocation(line: 73, column: 18, scope: !111)
!113 = !DILocation(line: 73, column: 13, scope: !103)
!114 = !DILocation(line: 73, column: 28, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !21, line: 73, column: 27)
!116 = !DILocalVariable(name: "source", scope: !117, file: !21, line: 77, type: !39)
!117 = distinct !DILexicalBlock(scope: !103, file: !21, line: 76, column: 5)
!118 = !DILocation(line: 77, column: 23, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !21, line: 79, type: !45)
!120 = distinct !DILexicalBlock(scope: !117, file: !21, line: 78, column: 9)
!121 = !DILocation(line: 79, column: 20, scope: !120)
!122 = !DILocation(line: 81, column: 20, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !21, line: 81, column: 13)
!124 = !DILocation(line: 81, column: 18, scope: !123)
!125 = !DILocation(line: 81, column: 25, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !21, line: 81, column: 13)
!127 = !DILocation(line: 81, column: 27, scope: !126)
!128 = !DILocation(line: 81, column: 13, scope: !123)
!129 = !DILocation(line: 83, column: 24, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !21, line: 82, column: 13)
!131 = !DILocation(line: 83, column: 17, scope: !130)
!132 = !DILocation(line: 83, column: 27, scope: !130)
!133 = !DILocation(line: 83, column: 34, scope: !130)
!134 = !DILocation(line: 84, column: 24, scope: !130)
!135 = !DILocation(line: 84, column: 17, scope: !130)
!136 = !DILocation(line: 84, column: 27, scope: !130)
!137 = !DILocation(line: 84, column: 34, scope: !130)
!138 = !DILocation(line: 85, column: 13, scope: !130)
!139 = !DILocation(line: 81, column: 35, scope: !126)
!140 = !DILocation(line: 81, column: 13, scope: !126)
!141 = distinct !{!141, !128, !142, !72}
!142 = !DILocation(line: 85, column: 13, scope: !123)
!143 = !DILocation(line: 88, column: 9, scope: !117)
!144 = !DILocation(line: 89, column: 26, scope: !117)
!145 = !DILocation(line: 89, column: 9, scope: !117)
!146 = !DILocation(line: 90, column: 14, scope: !117)
!147 = !DILocation(line: 90, column: 9, scope: !117)
!148 = !DILocation(line: 92, column: 1, scope: !103)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !21, file: !21, line: 95, type: !22, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !24)
!150 = !DILocalVariable(name: "data", scope: !149, file: !21, line: 97, type: !3)
!151 = !DILocation(line: 97, column: 21, scope: !149)
!152 = !DILocation(line: 98, column: 10, scope: !149)
!153 = !DILocation(line: 103, column: 33, scope: !149)
!154 = !DILocation(line: 103, column: 16, scope: !149)
!155 = !DILocation(line: 103, column: 14, scope: !149)
!156 = !DILocation(line: 104, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !149, file: !21, line: 104, column: 13)
!158 = !DILocation(line: 104, column: 18, scope: !157)
!159 = !DILocation(line: 104, column: 13, scope: !149)
!160 = !DILocation(line: 104, column: 28, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !21, line: 104, column: 27)
!162 = !DILocalVariable(name: "source", scope: !163, file: !21, line: 112, type: !39)
!163 = distinct !DILexicalBlock(scope: !149, file: !21, line: 111, column: 5)
!164 = !DILocation(line: 112, column: 23, scope: !163)
!165 = !DILocalVariable(name: "i", scope: !166, file: !21, line: 114, type: !45)
!166 = distinct !DILexicalBlock(scope: !163, file: !21, line: 113, column: 9)
!167 = !DILocation(line: 114, column: 20, scope: !166)
!168 = !DILocation(line: 116, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !21, line: 116, column: 13)
!170 = !DILocation(line: 116, column: 18, scope: !169)
!171 = !DILocation(line: 116, column: 25, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !21, line: 116, column: 13)
!173 = !DILocation(line: 116, column: 27, scope: !172)
!174 = !DILocation(line: 116, column: 13, scope: !169)
!175 = !DILocation(line: 118, column: 24, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !21, line: 117, column: 13)
!177 = !DILocation(line: 118, column: 17, scope: !176)
!178 = !DILocation(line: 118, column: 27, scope: !176)
!179 = !DILocation(line: 118, column: 34, scope: !176)
!180 = !DILocation(line: 119, column: 24, scope: !176)
!181 = !DILocation(line: 119, column: 17, scope: !176)
!182 = !DILocation(line: 119, column: 27, scope: !176)
!183 = !DILocation(line: 119, column: 34, scope: !176)
!184 = !DILocation(line: 120, column: 13, scope: !176)
!185 = !DILocation(line: 116, column: 35, scope: !172)
!186 = !DILocation(line: 116, column: 13, scope: !172)
!187 = distinct !{!187, !174, !188, !72}
!188 = !DILocation(line: 120, column: 13, scope: !169)
!189 = !DILocation(line: 123, column: 9, scope: !163)
!190 = !DILocation(line: 124, column: 26, scope: !163)
!191 = !DILocation(line: 124, column: 9, scope: !163)
!192 = !DILocation(line: 125, column: 14, scope: !163)
!193 = !DILocation(line: 125, column: 9, scope: !163)
!194 = !DILocation(line: 127, column: 1, scope: !149)
