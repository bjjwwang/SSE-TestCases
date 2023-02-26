; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !15
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !29, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %0 = alloca i8, i64 400, align 16, !dbg !33
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !34
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !32
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !35, metadata !DIExpression()), !dbg !36
  %2 = alloca i8, i64 800, align 16, !dbg !37
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !38
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !36
  %4 = load i32, i32* @staticTrue, align 4, !dbg !39
  %tobool = icmp ne i32 %4, 0, !dbg !39
  br i1 %tobool, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !42
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !59
  store i64 0, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !62

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !63
  %cmp = icmp ult i64 %6, 100, !dbg !65
  br i1 %cmp, label %for.body, label %for.end, !dbg !66

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !69
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !70
  store i32 0, i32* %intOne, align 8, !dbg !71
  %8 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !73
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !74
  store i32 0, i32* %intTwo, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %9, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !82
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !82
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !82
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !82
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !82
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !82
  %call = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !82
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !83
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05_good() #0 !dbg !86 {
entry:
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !110 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = alloca i8, i64 400, align 16, !dbg !115
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !116
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !114
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %2 = alloca i8, i64 800, align 16, !dbg !119
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !120
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !118
  %4 = load i32, i32* @staticFalse, align 4, !dbg !121
  %tobool = icmp ne i32 %4, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.else, !dbg !123

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
  %cmp = icmp ult i64 %6, 100, !dbg !141
  br i1 %cmp, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !145
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !146
  store i32 0, i32* %intOne, align 8, !dbg !147
  %8 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !149
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !150
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
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !158
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !159
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
  %4 = load i32, i32* @staticTrue, align 4, !dbg !172
  %tobool = icmp ne i32 %4, 0, !dbg !172
  br i1 %tobool, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !175
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !177
  br label %if.end, !dbg !178

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !179, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i64* %i, metadata !182, metadata !DIExpression()), !dbg !184
  store i64 0, i64* %i, align 8, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !188
  %cmp = icmp ult i64 %6, 100, !dbg !190
  br i1 %cmp, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !194
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !195
  store i32 0, i32* %intOne, align 8, !dbg !196
  %8 = load i64, i64* %i, align 8, !dbg !197
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !198
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !199
  store i32 0, i32* %intTwo, align 4, !dbg !200
  br label %for.inc, !dbg !201

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !202
  %inc = add i64 %9, 1, !dbg !202
  store i64 %inc, i64* %i, align 8, !dbg !202
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !206
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !206
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !206
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !206
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !206
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !206
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !206
  %call = call i8* @__memmove_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !206
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !207
  %arrayidx2 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !207
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx2), !dbg !208
  ret void, !dbg !209
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!18, !19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !17, line: 23, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = !{!0, !15}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !17, line: 24, type: !11, isLocal: true, isDefinition: true)
!17 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!18 = !{i32 7, !"Dwarf Version", i32 4}
!19 = !{i32 2, !"Debug Info Version", i32 3}
!20 = !{i32 1, !"wchar_size", i32 4}
!21 = !{i32 7, !"PIC Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"Homebrew clang version 14.0.6"}
!25 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05_bad", scope: !17, file: !17, line: 28, type: !26, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !{}
!29 = !DILocalVariable(name: "data", scope: !25, file: !17, line: 30, type: !5)
!30 = !DILocation(line: 30, column: 21, scope: !25)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !25, file: !17, line: 31, type: !5)
!32 = !DILocation(line: 31, column: 21, scope: !25)
!33 = !DILocation(line: 31, column: 54, scope: !25)
!34 = !DILocation(line: 31, column: 37, scope: !25)
!35 = !DILocalVariable(name: "dataGoodBuffer", scope: !25, file: !17, line: 32, type: !5)
!36 = !DILocation(line: 32, column: 21, scope: !25)
!37 = !DILocation(line: 32, column: 55, scope: !25)
!38 = !DILocation(line: 32, column: 38, scope: !25)
!39 = !DILocation(line: 33, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !25, file: !17, line: 33, column: 8)
!41 = !DILocation(line: 33, column: 8, scope: !25)
!42 = !DILocation(line: 37, column: 16, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !17, line: 34, column: 5)
!44 = !DILocation(line: 37, column: 14, scope: !43)
!45 = !DILocation(line: 38, column: 5, scope: !43)
!46 = !DILocalVariable(name: "source", scope: !47, file: !17, line: 40, type: !48)
!47 = distinct !DILexicalBlock(scope: !25, file: !17, line: 39, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 6400, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 40, column: 23, scope: !47)
!52 = !DILocalVariable(name: "i", scope: !53, file: !17, line: 42, type: !54)
!53 = distinct !DILexicalBlock(scope: !47, file: !17, line: 41, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 31, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !57, line: 94, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!58 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 42, column: 20, scope: !53)
!60 = !DILocation(line: 44, column: 20, scope: !61)
!61 = distinct !DILexicalBlock(scope: !53, file: !17, line: 44, column: 13)
!62 = !DILocation(line: 44, column: 18, scope: !61)
!63 = !DILocation(line: 44, column: 25, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !17, line: 44, column: 13)
!65 = !DILocation(line: 44, column: 27, scope: !64)
!66 = !DILocation(line: 44, column: 13, scope: !61)
!67 = !DILocation(line: 46, column: 24, scope: !68)
!68 = distinct !DILexicalBlock(scope: !64, file: !17, line: 45, column: 13)
!69 = !DILocation(line: 46, column: 17, scope: !68)
!70 = !DILocation(line: 46, column: 27, scope: !68)
!71 = !DILocation(line: 46, column: 34, scope: !68)
!72 = !DILocation(line: 47, column: 24, scope: !68)
!73 = !DILocation(line: 47, column: 17, scope: !68)
!74 = !DILocation(line: 47, column: 27, scope: !68)
!75 = !DILocation(line: 47, column: 34, scope: !68)
!76 = !DILocation(line: 48, column: 13, scope: !68)
!77 = !DILocation(line: 44, column: 35, scope: !64)
!78 = !DILocation(line: 44, column: 13, scope: !64)
!79 = distinct !{!79, !66, !80, !81}
!80 = !DILocation(line: 48, column: 13, scope: !61)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 51, column: 9, scope: !47)
!83 = !DILocation(line: 52, column: 26, scope: !47)
!84 = !DILocation(line: 52, column: 9, scope: !47)
!85 = !DILocation(line: 54, column: 1, scope: !25)
!86 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_05_good", scope: !17, file: !17, line: 121, type: !26, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!87 = !DILocation(line: 123, column: 5, scope: !86)
!88 = !DILocation(line: 124, column: 5, scope: !86)
!89 = !DILocation(line: 125, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 137, type: !91, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !28)
!91 = !DISubroutineType(types: !92)
!92 = !{!11, !11, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !17, line: 137, type: !11)
!97 = !DILocation(line: 137, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !17, line: 137, type: !93)
!99 = !DILocation(line: 137, column: 27, scope: !90)
!100 = !DILocation(line: 140, column: 22, scope: !90)
!101 = !DILocation(line: 140, column: 12, scope: !90)
!102 = !DILocation(line: 140, column: 5, scope: !90)
!103 = !DILocation(line: 142, column: 5, scope: !90)
!104 = !DILocation(line: 143, column: 5, scope: !90)
!105 = !DILocation(line: 144, column: 5, scope: !90)
!106 = !DILocation(line: 147, column: 5, scope: !90)
!107 = !DILocation(line: 148, column: 5, scope: !90)
!108 = !DILocation(line: 149, column: 5, scope: !90)
!109 = !DILocation(line: 151, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 61, type: !26, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!111 = !DILocalVariable(name: "data", scope: !110, file: !17, line: 63, type: !5)
!112 = !DILocation(line: 63, column: 21, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !17, line: 64, type: !5)
!114 = !DILocation(line: 64, column: 21, scope: !110)
!115 = !DILocation(line: 64, column: 54, scope: !110)
!116 = !DILocation(line: 64, column: 37, scope: !110)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !17, line: 65, type: !5)
!118 = !DILocation(line: 65, column: 21, scope: !110)
!119 = !DILocation(line: 65, column: 55, scope: !110)
!120 = !DILocation(line: 65, column: 38, scope: !110)
!121 = !DILocation(line: 66, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !110, file: !17, line: 66, column: 8)
!123 = !DILocation(line: 66, column: 8, scope: !110)
!124 = !DILocation(line: 69, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !17, line: 67, column: 5)
!126 = !DILocation(line: 70, column: 5, scope: !125)
!127 = !DILocation(line: 74, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !17, line: 72, column: 5)
!129 = !DILocation(line: 74, column: 14, scope: !128)
!130 = !DILocalVariable(name: "source", scope: !131, file: !17, line: 77, type: !48)
!131 = distinct !DILexicalBlock(scope: !110, file: !17, line: 76, column: 5)
!132 = !DILocation(line: 77, column: 23, scope: !131)
!133 = !DILocalVariable(name: "i", scope: !134, file: !17, line: 79, type: !54)
!134 = distinct !DILexicalBlock(scope: !131, file: !17, line: 78, column: 9)
!135 = !DILocation(line: 79, column: 20, scope: !134)
!136 = !DILocation(line: 81, column: 20, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !17, line: 81, column: 13)
!138 = !DILocation(line: 81, column: 18, scope: !137)
!139 = !DILocation(line: 81, column: 25, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !17, line: 81, column: 13)
!141 = !DILocation(line: 81, column: 27, scope: !140)
!142 = !DILocation(line: 81, column: 13, scope: !137)
!143 = !DILocation(line: 83, column: 24, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !17, line: 82, column: 13)
!145 = !DILocation(line: 83, column: 17, scope: !144)
!146 = !DILocation(line: 83, column: 27, scope: !144)
!147 = !DILocation(line: 83, column: 34, scope: !144)
!148 = !DILocation(line: 84, column: 24, scope: !144)
!149 = !DILocation(line: 84, column: 17, scope: !144)
!150 = !DILocation(line: 84, column: 27, scope: !144)
!151 = !DILocation(line: 84, column: 34, scope: !144)
!152 = !DILocation(line: 85, column: 13, scope: !144)
!153 = !DILocation(line: 81, column: 35, scope: !140)
!154 = !DILocation(line: 81, column: 13, scope: !140)
!155 = distinct !{!155, !142, !156, !81}
!156 = !DILocation(line: 85, column: 13, scope: !137)
!157 = !DILocation(line: 88, column: 9, scope: !131)
!158 = !DILocation(line: 89, column: 26, scope: !131)
!159 = !DILocation(line: 89, column: 9, scope: !131)
!160 = !DILocation(line: 91, column: 1, scope: !110)
!161 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 94, type: !26, scopeLine: 95, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !28)
!162 = !DILocalVariable(name: "data", scope: !161, file: !17, line: 96, type: !5)
!163 = !DILocation(line: 96, column: 21, scope: !161)
!164 = !DILocalVariable(name: "dataBadBuffer", scope: !161, file: !17, line: 97, type: !5)
!165 = !DILocation(line: 97, column: 21, scope: !161)
!166 = !DILocation(line: 97, column: 54, scope: !161)
!167 = !DILocation(line: 97, column: 37, scope: !161)
!168 = !DILocalVariable(name: "dataGoodBuffer", scope: !161, file: !17, line: 98, type: !5)
!169 = !DILocation(line: 98, column: 21, scope: !161)
!170 = !DILocation(line: 98, column: 55, scope: !161)
!171 = !DILocation(line: 98, column: 38, scope: !161)
!172 = !DILocation(line: 99, column: 8, scope: !173)
!173 = distinct !DILexicalBlock(scope: !161, file: !17, line: 99, column: 8)
!174 = !DILocation(line: 99, column: 8, scope: !161)
!175 = !DILocation(line: 102, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !17, line: 100, column: 5)
!177 = !DILocation(line: 102, column: 14, scope: !176)
!178 = !DILocation(line: 103, column: 5, scope: !176)
!179 = !DILocalVariable(name: "source", scope: !180, file: !17, line: 105, type: !48)
!180 = distinct !DILexicalBlock(scope: !161, file: !17, line: 104, column: 5)
!181 = !DILocation(line: 105, column: 23, scope: !180)
!182 = !DILocalVariable(name: "i", scope: !183, file: !17, line: 107, type: !54)
!183 = distinct !DILexicalBlock(scope: !180, file: !17, line: 106, column: 9)
!184 = !DILocation(line: 107, column: 20, scope: !183)
!185 = !DILocation(line: 109, column: 20, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !17, line: 109, column: 13)
!187 = !DILocation(line: 109, column: 18, scope: !186)
!188 = !DILocation(line: 109, column: 25, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !17, line: 109, column: 13)
!190 = !DILocation(line: 109, column: 27, scope: !189)
!191 = !DILocation(line: 109, column: 13, scope: !186)
!192 = !DILocation(line: 111, column: 24, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !17, line: 110, column: 13)
!194 = !DILocation(line: 111, column: 17, scope: !193)
!195 = !DILocation(line: 111, column: 27, scope: !193)
!196 = !DILocation(line: 111, column: 34, scope: !193)
!197 = !DILocation(line: 112, column: 24, scope: !193)
!198 = !DILocation(line: 112, column: 17, scope: !193)
!199 = !DILocation(line: 112, column: 27, scope: !193)
!200 = !DILocation(line: 112, column: 34, scope: !193)
!201 = !DILocation(line: 113, column: 13, scope: !193)
!202 = !DILocation(line: 109, column: 35, scope: !189)
!203 = !DILocation(line: 109, column: 13, scope: !189)
!204 = distinct !{!204, !191, !205, !81}
!205 = !DILocation(line: 113, column: 13, scope: !186)
!206 = !DILocation(line: 116, column: 9, scope: !180)
!207 = !DILocation(line: 117, column: 26, scope: !180)
!208 = !DILocation(line: 117, column: 9, scope: !180)
!209 = !DILocation(line: 119, column: 1, scope: !161)
