; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07_bad() #0 !dbg !23 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 400, align 16, !dbg !31
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 800, align 16, !dbg !35
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !36
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !34
  %4 = load i32, i32* @staticFive, align 4, !dbg !37
  %cmp = icmp eq i32 %4, 5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !41
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !58
  store i64 0, i64* %i, align 8, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !62
  %cmp1 = icmp ult i64 %6, 100, !dbg !64
  br i1 %cmp1, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !68
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !69
  store i32 0, i32* %intOne, align 8, !dbg !70
  %8 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !72
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !73
  store i32 0, i32* %intTwo, align 4, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %9, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !81
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !81
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !81
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !81
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !81
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !81
  %call = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !81
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !82
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07_good() #0 !dbg !85 {
entry:
  call void @goodG2B1(), !dbg !86
  call void @goodG2B2(), !dbg !87
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !109 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 400, align 16, !dbg !114
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !115
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %2 = alloca i8, i64 800, align 16, !dbg !118
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !119
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !117
  %4 = load i32, i32* @staticFive, align 4, !dbg !120
  %cmp = icmp ne i32 %4, 5, !dbg !122
  br i1 %cmp, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !124
  br label %if.end, !dbg !126

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !127
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !129
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !130, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  store i64 0, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !139
  %cmp1 = icmp ult i64 %6, 100, !dbg !141
  br i1 %cmp1, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !145
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !146
  store i32 0, i32* %intOne, align 8, !dbg !147
  %8 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !149
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !150
  store i32 0, i32* %intTwo, align 4, !dbg !151
  br label %for.inc, !dbg !152

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !153
  %inc = add i64 %9, 1, !dbg !153
  store i64 %inc, i64* %i, align 8, !dbg !153
  br label %for.cond, !dbg !154, !llvm.loop !155

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !157
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !157
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !157
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !157
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !157
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !157
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !157
  %call = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !157
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !158
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !158
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !161 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = alloca i8, i64 400, align 16, !dbg !166
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !167
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !165
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !168, metadata !DIExpression()), !dbg !169
  %2 = alloca i8, i64 800, align 16, !dbg !170
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !171
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !169
  %4 = load i32, i32* @staticFive, align 4, !dbg !172
  %cmp = icmp eq i32 %4, 5, !dbg !174
  br i1 %cmp, label %if.then, label %if.end, !dbg !175

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !176
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !178
  br label %if.end, !dbg !179

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !180, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i64* %i, metadata !183, metadata !DIExpression()), !dbg !185
  store i64 0, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !188

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !189
  %cmp1 = icmp ult i64 %6, 100, !dbg !191
  br i1 %cmp1, label %for.body, label %for.end, !dbg !192

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !193
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !195
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !196
  store i32 0, i32* %intOne, align 8, !dbg !197
  %8 = load i64, i64* %i, align 8, !dbg !198
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !199
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !200
  store i32 0, i32* %intTwo, align 4, !dbg !201
  br label %for.inc, !dbg !202

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !203
  %inc = add i64 %9, 1, !dbg !203
  store i64 %inc, i64* %i, align 8, !dbg !203
  br label %for.cond, !dbg !204, !llvm.loop !205

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !207
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !207
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !207
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !207
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !207
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !207
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !207
  %call = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !207
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !208
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !208
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !209
  ret void, !dbg !210
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !15, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !13}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !7, line: 100, baseType: !8)
!7 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !7, line: 96, size: 64, elements: !9)
!9 = !{!10, !12}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !8, file: !7, line: 98, baseType: !11, size: 32)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !8, file: !7, line: 99, baseType: !11, size: 32, offset: 32)
!13 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!14 = !{!0}
!15 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07_bad", scope: !15, file: !15, line: 27, type: !24, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 29, type: !5)
!28 = !DILocation(line: 29, column: 21, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !15, line: 30, type: !5)
!30 = !DILocation(line: 30, column: 21, scope: !23)
!31 = !DILocation(line: 30, column: 54, scope: !23)
!32 = !DILocation(line: 30, column: 37, scope: !23)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !15, line: 31, type: !5)
!34 = !DILocation(line: 31, column: 21, scope: !23)
!35 = !DILocation(line: 31, column: 55, scope: !23)
!36 = !DILocation(line: 31, column: 38, scope: !23)
!37 = !DILocation(line: 32, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !23, file: !15, line: 32, column: 8)
!39 = !DILocation(line: 32, column: 18, scope: !38)
!40 = !DILocation(line: 32, column: 8, scope: !23)
!41 = !DILocation(line: 36, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !15, line: 33, column: 5)
!43 = !DILocation(line: 36, column: 14, scope: !42)
!44 = !DILocation(line: 37, column: 5, scope: !42)
!45 = !DILocalVariable(name: "source", scope: !46, file: !15, line: 39, type: !47)
!46 = distinct !DILexicalBlock(scope: !23, file: !15, line: 38, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 39, column: 23, scope: !46)
!51 = !DILocalVariable(name: "i", scope: !52, file: !15, line: 41, type: !53)
!52 = distinct !DILexicalBlock(scope: !46, file: !15, line: 40, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 31, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !56, line: 94, baseType: !57)
!56 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!57 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 41, column: 20, scope: !52)
!59 = !DILocation(line: 43, column: 20, scope: !60)
!60 = distinct !DILexicalBlock(scope: !52, file: !15, line: 43, column: 13)
!61 = !DILocation(line: 43, column: 18, scope: !60)
!62 = !DILocation(line: 43, column: 25, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !15, line: 43, column: 13)
!64 = !DILocation(line: 43, column: 27, scope: !63)
!65 = !DILocation(line: 43, column: 13, scope: !60)
!66 = !DILocation(line: 45, column: 24, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !15, line: 44, column: 13)
!68 = !DILocation(line: 45, column: 17, scope: !67)
!69 = !DILocation(line: 45, column: 27, scope: !67)
!70 = !DILocation(line: 45, column: 34, scope: !67)
!71 = !DILocation(line: 46, column: 24, scope: !67)
!72 = !DILocation(line: 46, column: 17, scope: !67)
!73 = !DILocation(line: 46, column: 27, scope: !67)
!74 = !DILocation(line: 46, column: 34, scope: !67)
!75 = !DILocation(line: 47, column: 13, scope: !67)
!76 = !DILocation(line: 43, column: 35, scope: !63)
!77 = !DILocation(line: 43, column: 13, scope: !63)
!78 = distinct !{!78, !65, !79, !80}
!79 = !DILocation(line: 47, column: 13, scope: !60)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 50, column: 9, scope: !46)
!82 = !DILocation(line: 51, column: 26, scope: !46)
!83 = !DILocation(line: 51, column: 9, scope: !46)
!84 = !DILocation(line: 53, column: 1, scope: !23)
!85 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_07_good", scope: !15, file: !15, line: 120, type: !24, scopeLine: 121, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!86 = !DILocation(line: 122, column: 5, scope: !85)
!87 = !DILocation(line: 123, column: 5, scope: !85)
!88 = !DILocation(line: 124, column: 1, scope: !85)
!89 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 136, type: !90, scopeLine: 137, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!90 = !DISubroutineType(types: !91)
!91 = !{!11, !11, !92}
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !93, size: 64)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !89, file: !15, line: 136, type: !11)
!96 = !DILocation(line: 136, column: 14, scope: !89)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !89, file: !15, line: 136, type: !92)
!98 = !DILocation(line: 136, column: 27, scope: !89)
!99 = !DILocation(line: 139, column: 22, scope: !89)
!100 = !DILocation(line: 139, column: 12, scope: !89)
!101 = !DILocation(line: 139, column: 5, scope: !89)
!102 = !DILocation(line: 141, column: 5, scope: !89)
!103 = !DILocation(line: 142, column: 5, scope: !89)
!104 = !DILocation(line: 143, column: 5, scope: !89)
!105 = !DILocation(line: 146, column: 5, scope: !89)
!106 = !DILocation(line: 147, column: 5, scope: !89)
!107 = !DILocation(line: 148, column: 5, scope: !89)
!108 = !DILocation(line: 150, column: 5, scope: !89)
!109 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 60, type: !24, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!110 = !DILocalVariable(name: "data", scope: !109, file: !15, line: 62, type: !5)
!111 = !DILocation(line: 62, column: 21, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !15, line: 63, type: !5)
!113 = !DILocation(line: 63, column: 21, scope: !109)
!114 = !DILocation(line: 63, column: 54, scope: !109)
!115 = !DILocation(line: 63, column: 37, scope: !109)
!116 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !15, line: 64, type: !5)
!117 = !DILocation(line: 64, column: 21, scope: !109)
!118 = !DILocation(line: 64, column: 55, scope: !109)
!119 = !DILocation(line: 64, column: 38, scope: !109)
!120 = !DILocation(line: 65, column: 8, scope: !121)
!121 = distinct !DILexicalBlock(scope: !109, file: !15, line: 65, column: 8)
!122 = !DILocation(line: 65, column: 18, scope: !121)
!123 = !DILocation(line: 65, column: 8, scope: !109)
!124 = !DILocation(line: 68, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !15, line: 66, column: 5)
!126 = !DILocation(line: 69, column: 5, scope: !125)
!127 = !DILocation(line: 73, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !15, line: 71, column: 5)
!129 = !DILocation(line: 73, column: 14, scope: !128)
!130 = !DILocalVariable(name: "source", scope: !131, file: !15, line: 76, type: !47)
!131 = distinct !DILexicalBlock(scope: !109, file: !15, line: 75, column: 5)
!132 = !DILocation(line: 76, column: 23, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !15, line: 78, type: !53)
!134 = distinct !DILexicalBlock(scope: !131, file: !15, line: 77, column: 9)
!135 = !DILocation(line: 78, column: 20, scope: !134)
!136 = !DILocation(line: 80, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !15, line: 80, column: 13)
!138 = !DILocation(line: 80, column: 18, scope: !137)
!139 = !DILocation(line: 80, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !15, line: 80, column: 13)
!141 = !DILocation(line: 80, column: 27, scope: !140)
!142 = !DILocation(line: 80, column: 13, scope: !137)
!143 = !DILocation(line: 82, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !15, line: 81, column: 13)
!145 = !DILocation(line: 82, column: 17, scope: !144)
!146 = !DILocation(line: 82, column: 27, scope: !144)
!147 = !DILocation(line: 82, column: 34, scope: !144)
!148 = !DILocation(line: 83, column: 24, scope: !144)
!149 = !DILocation(line: 83, column: 17, scope: !144)
!150 = !DILocation(line: 83, column: 27, scope: !144)
!151 = !DILocation(line: 83, column: 34, scope: !144)
!152 = !DILocation(line: 84, column: 13, scope: !144)
!153 = !DILocation(line: 80, column: 35, scope: !140)
!154 = !DILocation(line: 80, column: 13, scope: !140)
!155 = distinct !{!155, !142, !156, !80}
!156 = !DILocation(line: 84, column: 13, scope: !137)
!157 = !DILocation(line: 87, column: 9, scope: !131)
!158 = !DILocation(line: 88, column: 26, scope: !131)
!159 = !DILocation(line: 88, column: 9, scope: !131)
!160 = !DILocation(line: 90, column: 1, scope: !109)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 93, type: !24, scopeLine: 94, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!162 = !DILocalVariable(name: "data", scope: !161, file: !15, line: 95, type: !5)
!163 = !DILocation(line: 95, column: 21, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !15, line: 96, type: !5)
!165 = !DILocation(line: 96, column: 21, scope: !161)
!166 = !DILocation(line: 96, column: 54, scope: !161)
!167 = !DILocation(line: 96, column: 37, scope: !161)
!168 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !15, line: 97, type: !5)
!169 = !DILocation(line: 97, column: 21, scope: !161)
!170 = !DILocation(line: 97, column: 55, scope: !161)
!171 = !DILocation(line: 97, column: 38, scope: !161)
!172 = !DILocation(line: 98, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !15, line: 98, column: 8)
!174 = !DILocation(line: 98, column: 18, scope: !173)
!175 = !DILocation(line: 98, column: 8, scope: !161)
!176 = !DILocation(line: 101, column: 16, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !15, line: 99, column: 5)
!178 = !DILocation(line: 101, column: 14, scope: !177)
!179 = !DILocation(line: 102, column: 5, scope: !177)
!180 = !DILocalVariable(name: "source", scope: !181, file: !15, line: 104, type: !47)
!181 = distinct !DILexicalBlock(scope: !161, file: !15, line: 103, column: 5)
!182 = !DILocation(line: 104, column: 23, scope: !181)
!183 = !DILocalVariable(name: "i", scope: !184, file: !15, line: 106, type: !53)
!184 = distinct !DILexicalBlock(scope: !181, file: !15, line: 105, column: 9)
!185 = !DILocation(line: 106, column: 20, scope: !184)
!186 = !DILocation(line: 108, column: 20, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !15, line: 108, column: 13)
!188 = !DILocation(line: 108, column: 18, scope: !187)
!189 = !DILocation(line: 108, column: 25, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !15, line: 108, column: 13)
!191 = !DILocation(line: 108, column: 27, scope: !190)
!192 = !DILocation(line: 108, column: 13, scope: !187)
!193 = !DILocation(line: 110, column: 24, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !15, line: 109, column: 13)
!195 = !DILocation(line: 110, column: 17, scope: !194)
!196 = !DILocation(line: 110, column: 27, scope: !194)
!197 = !DILocation(line: 110, column: 34, scope: !194)
!198 = !DILocation(line: 111, column: 24, scope: !194)
!199 = !DILocation(line: 111, column: 17, scope: !194)
!200 = !DILocation(line: 111, column: 27, scope: !194)
!201 = !DILocation(line: 111, column: 34, scope: !194)
!202 = !DILocation(line: 112, column: 13, scope: !194)
!203 = !DILocation(line: 108, column: 35, scope: !190)
!204 = !DILocation(line: 108, column: 13, scope: !190)
!205 = distinct !{!205, !192, !206, !80}
!206 = !DILocation(line: 112, column: 13, scope: !187)
!207 = !DILocation(line: 115, column: 9, scope: !181)
!208 = !DILocation(line: 116, column: 26, scope: !181)
!209 = !DILocation(line: 116, column: 9, scope: !181)
!210 = !DILocation(line: 118, column: 1, scope: !161)
