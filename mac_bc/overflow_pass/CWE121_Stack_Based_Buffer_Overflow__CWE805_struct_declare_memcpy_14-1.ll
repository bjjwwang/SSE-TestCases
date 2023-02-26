; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %0 = load i32, i32* @globalFive, align 4, !dbg !36
  %cmp = icmp eq i32 %0, 5, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !44, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !58
  %cmp1 = icmp ult i64 %1, 100, !dbg !60
  br i1 %cmp1, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !64
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !65
  store i32 0, i32* %intOne, align 8, !dbg !66
  %3 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !68
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !69
  store i32 0, i32* %intTwo, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %4, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !77
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !77
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !77
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !77
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !77
  %call = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %7, i64 noundef 800, i64 noundef %10) #4, !dbg !77
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !110, metadata !DIExpression()), !dbg !111
  %0 = load i32, i32* @globalFive, align 4, !dbg !112
  %cmp = icmp ne i32 %0, 5, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !116
  br label %if.end, !dbg !118

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !119
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata i64* %i, metadata !125, metadata !DIExpression()), !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !131
  %cmp1 = icmp ult i64 %1, 100, !dbg !133
  br i1 %cmp1, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !137
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !138
  store i32 0, i32* %intOne, align 8, !dbg !139
  %3 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !141
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !142
  store i32 0, i32* %intTwo, align 4, !dbg !143
  br label %for.inc, !dbg !144

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !145
  %inc = add i64 %4, 1, !dbg !145
  store i64 %inc, i64* %i, align 8, !dbg !145
  br label %for.cond, !dbg !146, !llvm.loop !147

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !149
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !149
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !149
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !149
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !149
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !149
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !149
  %call = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %7, i64 noundef 800, i64 noundef %10) #4, !dbg !149
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !150
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = load i32, i32* @globalFive, align 4, !dbg !160
  %cmp = icmp eq i32 %0, 5, !dbg !162
  br i1 %cmp, label %if.then, label %if.end, !dbg !163

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !164
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !168, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %i, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !177
  %cmp1 = icmp ult i64 %1, 100, !dbg !179
  br i1 %cmp1, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !183
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !184
  store i32 0, i32* %intOne, align 8, !dbg !185
  %3 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !187
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !188
  store i32 0, i32* %intTwo, align 4, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !191
  %inc = add i64 %4, 1, !dbg !191
  store i64 %inc, i64* %i, align 8, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !195
  %6 = bitcast %struct._twoIntsStruct* %5 to i8*, !dbg !195
  %arraydecay3 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !195
  %7 = bitcast %struct._twoIntsStruct* %arraydecay3 to i8*, !dbg !195
  %8 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !195
  %9 = bitcast %struct._twoIntsStruct* %8 to i8*, !dbg !195
  %10 = call i64 @llvm.objectsize.i64.p0i8(i8* %9, i1 false, i1 true, i1 false), !dbg !195
  %call = call i8* @__memcpy_chk(i8* noundef %6, i8* noundef %7, i64 noundef 800, i64 noundef %10) #4, !dbg !195
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !196
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !196
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !197
  ret void, !dbg !198
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!36 = !DILocation(line: 26, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!38 = !DILocation(line: 26, column: 18, scope: !37)
!39 = !DILocation(line: 26, column: 8, scope: !11)
!40 = !DILocation(line: 30, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !12, line: 27, column: 5)
!42 = !DILocation(line: 30, column: 14, scope: !41)
!43 = !DILocation(line: 31, column: 5, scope: !41)
!44 = !DILocalVariable(name: "source", scope: !45, file: !12, line: 33, type: !32)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!46 = !DILocation(line: 33, column: 23, scope: !45)
!47 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 35, type: !49)
!48 = distinct !DILexicalBlock(scope: !45, file: !12, line: 34, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 31, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !52, line: 94, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!53 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 35, column: 20, scope: !48)
!55 = !DILocation(line: 37, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !48, file: !12, line: 37, column: 13)
!57 = !DILocation(line: 37, column: 18, scope: !56)
!58 = !DILocation(line: 37, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !12, line: 37, column: 13)
!60 = !DILocation(line: 37, column: 27, scope: !59)
!61 = !DILocation(line: 37, column: 13, scope: !56)
!62 = !DILocation(line: 39, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !12, line: 38, column: 13)
!64 = !DILocation(line: 39, column: 17, scope: !63)
!65 = !DILocation(line: 39, column: 27, scope: !63)
!66 = !DILocation(line: 39, column: 34, scope: !63)
!67 = !DILocation(line: 40, column: 24, scope: !63)
!68 = !DILocation(line: 40, column: 17, scope: !63)
!69 = !DILocation(line: 40, column: 27, scope: !63)
!70 = !DILocation(line: 40, column: 34, scope: !63)
!71 = !DILocation(line: 41, column: 13, scope: !63)
!72 = !DILocation(line: 37, column: 35, scope: !59)
!73 = !DILocation(line: 37, column: 13, scope: !59)
!74 = distinct !{!74, !61, !75, !76}
!75 = !DILocation(line: 41, column: 13, scope: !56)
!76 = !{!"llvm.loop.mustprogress"}
!77 = !DILocation(line: 44, column: 9, scope: !45)
!78 = !DILocation(line: 45, column: 26, scope: !45)
!79 = !DILocation(line: 45, column: 9, scope: !45)
!80 = !DILocation(line: 47, column: 1, scope: !11)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_14_good", scope: !12, file: !12, line: 114, type: !13, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!82 = !DILocation(line: 116, column: 5, scope: !81)
!83 = !DILocation(line: 117, column: 5, scope: !81)
!84 = !DILocation(line: 118, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 130, type: !86, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!86 = !DISubroutineType(types: !87)
!87 = !{!23, !23, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !12, line: 130, type: !23)
!92 = !DILocation(line: 130, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !12, line: 130, type: !88)
!94 = !DILocation(line: 130, column: 27, scope: !85)
!95 = !DILocation(line: 133, column: 22, scope: !85)
!96 = !DILocation(line: 133, column: 12, scope: !85)
!97 = !DILocation(line: 133, column: 5, scope: !85)
!98 = !DILocation(line: 135, column: 5, scope: !85)
!99 = !DILocation(line: 136, column: 5, scope: !85)
!100 = !DILocation(line: 137, column: 5, scope: !85)
!101 = !DILocation(line: 140, column: 5, scope: !85)
!102 = !DILocation(line: 141, column: 5, scope: !85)
!103 = !DILocation(line: 142, column: 5, scope: !85)
!104 = !DILocation(line: 144, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!106 = !DILocalVariable(name: "data", scope: !105, file: !12, line: 56, type: !17)
!107 = !DILocation(line: 56, column: 21, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !12, line: 57, type: !27)
!109 = !DILocation(line: 57, column: 19, scope: !105)
!110 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !12, line: 58, type: !32)
!111 = !DILocation(line: 58, column: 19, scope: !105)
!112 = !DILocation(line: 59, column: 8, scope: !113)
!113 = distinct !DILexicalBlock(scope: !105, file: !12, line: 59, column: 8)
!114 = !DILocation(line: 59, column: 18, scope: !113)
!115 = !DILocation(line: 59, column: 8, scope: !105)
!116 = !DILocation(line: 62, column: 9, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !12, line: 60, column: 5)
!118 = !DILocation(line: 63, column: 5, scope: !117)
!119 = !DILocation(line: 67, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !113, file: !12, line: 65, column: 5)
!121 = !DILocation(line: 67, column: 14, scope: !120)
!122 = !DILocalVariable(name: "source", scope: !123, file: !12, line: 70, type: !32)
!123 = distinct !DILexicalBlock(scope: !105, file: !12, line: 69, column: 5)
!124 = !DILocation(line: 70, column: 23, scope: !123)
!125 = !DILocalVariable(name: "i", scope: !126, file: !12, line: 72, type: !49)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 71, column: 9)
!127 = !DILocation(line: 72, column: 20, scope: !126)
!128 = !DILocation(line: 74, column: 20, scope: !129)
!129 = distinct !DILexicalBlock(scope: !126, file: !12, line: 74, column: 13)
!130 = !DILocation(line: 74, column: 18, scope: !129)
!131 = !DILocation(line: 74, column: 25, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 74, column: 13)
!133 = !DILocation(line: 74, column: 27, scope: !132)
!134 = !DILocation(line: 74, column: 13, scope: !129)
!135 = !DILocation(line: 76, column: 24, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 75, column: 13)
!137 = !DILocation(line: 76, column: 17, scope: !136)
!138 = !DILocation(line: 76, column: 27, scope: !136)
!139 = !DILocation(line: 76, column: 34, scope: !136)
!140 = !DILocation(line: 77, column: 24, scope: !136)
!141 = !DILocation(line: 77, column: 17, scope: !136)
!142 = !DILocation(line: 77, column: 27, scope: !136)
!143 = !DILocation(line: 77, column: 34, scope: !136)
!144 = !DILocation(line: 78, column: 13, scope: !136)
!145 = !DILocation(line: 74, column: 35, scope: !132)
!146 = !DILocation(line: 74, column: 13, scope: !132)
!147 = distinct !{!147, !134, !148, !76}
!148 = !DILocation(line: 78, column: 13, scope: !129)
!149 = !DILocation(line: 81, column: 9, scope: !123)
!150 = !DILocation(line: 82, column: 26, scope: !123)
!151 = !DILocation(line: 82, column: 9, scope: !123)
!152 = !DILocation(line: 84, column: 1, scope: !105)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!154 = !DILocalVariable(name: "data", scope: !153, file: !12, line: 89, type: !17)
!155 = !DILocation(line: 89, column: 21, scope: !153)
!156 = !DILocalVariable(name: "dataBadBuffer", scope: !153, file: !12, line: 90, type: !27)
!157 = !DILocation(line: 90, column: 19, scope: !153)
!158 = !DILocalVariable(name: "dataGoodBuffer", scope: !153, file: !12, line: 91, type: !32)
!159 = !DILocation(line: 91, column: 19, scope: !153)
!160 = !DILocation(line: 92, column: 8, scope: !161)
!161 = distinct !DILexicalBlock(scope: !153, file: !12, line: 92, column: 8)
!162 = !DILocation(line: 92, column: 18, scope: !161)
!163 = !DILocation(line: 92, column: 8, scope: !153)
!164 = !DILocation(line: 95, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !12, line: 93, column: 5)
!166 = !DILocation(line: 95, column: 14, scope: !165)
!167 = !DILocation(line: 96, column: 5, scope: !165)
!168 = !DILocalVariable(name: "source", scope: !169, file: !12, line: 98, type: !32)
!169 = distinct !DILexicalBlock(scope: !153, file: !12, line: 97, column: 5)
!170 = !DILocation(line: 98, column: 23, scope: !169)
!171 = !DILocalVariable(name: "i", scope: !172, file: !12, line: 100, type: !49)
!172 = distinct !DILexicalBlock(scope: !169, file: !12, line: 99, column: 9)
!173 = !DILocation(line: 100, column: 20, scope: !172)
!174 = !DILocation(line: 102, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !12, line: 102, column: 13)
!176 = !DILocation(line: 102, column: 18, scope: !175)
!177 = !DILocation(line: 102, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !12, line: 102, column: 13)
!179 = !DILocation(line: 102, column: 27, scope: !178)
!180 = !DILocation(line: 102, column: 13, scope: !175)
!181 = !DILocation(line: 104, column: 24, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !12, line: 103, column: 13)
!183 = !DILocation(line: 104, column: 17, scope: !182)
!184 = !DILocation(line: 104, column: 27, scope: !182)
!185 = !DILocation(line: 104, column: 34, scope: !182)
!186 = !DILocation(line: 105, column: 24, scope: !182)
!187 = !DILocation(line: 105, column: 17, scope: !182)
!188 = !DILocation(line: 105, column: 27, scope: !182)
!189 = !DILocation(line: 105, column: 34, scope: !182)
!190 = !DILocation(line: 106, column: 13, scope: !182)
!191 = !DILocation(line: 102, column: 35, scope: !178)
!192 = !DILocation(line: 102, column: 13, scope: !178)
!193 = distinct !{!193, !180, !194, !76}
!194 = !DILocation(line: 106, column: 13, scope: !175)
!195 = !DILocation(line: 109, column: 9, scope: !169)
!196 = !DILocation(line: 110, column: 26, scope: !169)
!197 = !DILocation(line: 110, column: 9, scope: !169)
!198 = !DILocation(line: 112, column: 1, scope: !153)
