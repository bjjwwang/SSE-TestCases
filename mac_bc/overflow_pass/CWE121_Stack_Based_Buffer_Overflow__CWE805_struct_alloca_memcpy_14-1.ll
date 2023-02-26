; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !29
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 800, align 16, !dbg !32
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32, i32* @globalFive, align 4, !dbg !34
  %cmp = icmp eq i32 %4, 5, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !38
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !42, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %i, metadata !48, metadata !DIExpression()), !dbg !55
  store i64 0, i64* %i, align 8, !dbg !56
  br label %for.cond, !dbg !58

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !59
  %cmp1 = icmp ult i64 %6, 100, !dbg !61
  br i1 %cmp1, label %for.body, label %for.end, !dbg !62

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !65
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !66
  store i32 0, i32* %intOne, align 8, !dbg !67
  %8 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !69
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !70
  store i32 0, i32* %intTwo, align 4, !dbg !71
  br label %for.inc, !dbg !72

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !73
  %inc = add i64 %9, 1, !dbg !73
  store i64 %inc, i64* %i, align 8, !dbg !73
  br label %for.cond, !dbg !74, !llvm.loop !75

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !78
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !78
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !78
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !78
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !78
  %call = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !78
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !79
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !79
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14_good() #0 !dbg !82 {
entry:
  call void @goodG2B1(), !dbg !83
  call void @goodG2B2(), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !86 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !94, metadata !DIExpression()), !dbg !95
  %call = call i64 @time(i64* noundef null), !dbg !96
  %conv = trunc i64 %call to i32, !dbg !97
  call void @srand(i32 noundef %conv), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !99
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14_good(), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14_bad(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !104
  ret i32 0, !dbg !105
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !106 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %0 = alloca i8, i64 400, align 16, !dbg !111
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !112
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !110
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %2 = alloca i8, i64 800, align 16, !dbg !115
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !116
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !114
  %4 = load i32, i32* @globalFive, align 4, !dbg !117
  %cmp = icmp ne i32 %4, 5, !dbg !119
  br i1 %cmp, label %if.then, label %if.else, !dbg !120

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !121
  br label %if.end, !dbg !123

if.else:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !124
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %i, metadata !130, metadata !DIExpression()), !dbg !132
  store i64 0, i64* %i, align 8, !dbg !133
  br label %for.cond, !dbg !135

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !136
  %cmp1 = icmp ult i64 %6, 100, !dbg !138
  br i1 %cmp1, label %for.body, label %for.end, !dbg !139

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !140
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !142
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !143
  store i32 0, i32* %intOne, align 8, !dbg !144
  %8 = load i64, i64* %i, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !146
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !147
  store i32 0, i32* %intTwo, align 4, !dbg !148
  br label %for.inc, !dbg !149

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !150
  %inc = add i64 %9, 1, !dbg !150
  store i64 %inc, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !151, !llvm.loop !152

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !154
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !154
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !154
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !154
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !154
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !154
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !154
  %call = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !154
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !155
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !155
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !156
  ret void, !dbg !157
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !158 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !161, metadata !DIExpression()), !dbg !162
  %0 = alloca i8, i64 400, align 16, !dbg !163
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !164
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !162
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !165, metadata !DIExpression()), !dbg !166
  %2 = alloca i8, i64 800, align 16, !dbg !167
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !168
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !166
  %4 = load i32, i32* @globalFive, align 4, !dbg !169
  %cmp = icmp eq i32 %4, 5, !dbg !171
  br i1 %cmp, label %if.then, label %if.end, !dbg !172

if.then:                                          ; preds = %entry
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !173
  store %struct._twoIntsStruct* %5, %struct._twoIntsStruct** %data, align 8, !dbg !175
  br label %if.end, !dbg !176

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !177, metadata !DIExpression()), !dbg !179
  call void @llvm.dbg.declare(metadata i64* %i, metadata !180, metadata !DIExpression()), !dbg !182
  store i64 0, i64* %i, align 8, !dbg !183
  br label %for.cond, !dbg !185

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i64, i64* %i, align 8, !dbg !186
  %cmp1 = icmp ult i64 %6, 100, !dbg !188
  br i1 %cmp1, label %for.body, label %for.end, !dbg !189

for.body:                                         ; preds = %for.cond
  %7 = load i64, i64* %i, align 8, !dbg !190
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !192
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !193
  store i32 0, i32* %intOne, align 8, !dbg !194
  %8 = load i64, i64* %i, align 8, !dbg !195
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !196
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !197
  store i32 0, i32* %intTwo, align 4, !dbg !198
  br label %for.inc, !dbg !199

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !200
  %inc = add i64 %9, 1, !dbg !200
  store i64 %inc, i64* %i, align 8, !dbg !200
  br label %for.cond, !dbg !201, !llvm.loop !202

for.end:                                          ; preds = %for.cond
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !204
  %11 = bitcast %struct._twoIntsStruct* %10 to i8*, !dbg !204
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !204
  %12 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !204
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !204
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !204
  %15 = call i64 @llvm.objectsize.i64.p0i8(i8* %14, i1 false, i1 true, i1 false), !dbg !204
  %call = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %12, i64 noundef 800, i64 noundef %15) #4, !dbg !204
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !205
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !205
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !206
  ret void, !dbg !207
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !11}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 100, baseType: !6)
!5 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 96, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 98, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 99, baseType: !9, size: 32, offset: 32)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"PIC Level", i32 2}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"Homebrew clang version 14.0.6"}
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 23, type: !3)
!25 = !DILocation(line: 23, column: 21, scope: !19)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 24, type: !3)
!27 = !DILocation(line: 24, column: 21, scope: !19)
!28 = !DILocation(line: 24, column: 54, scope: !19)
!29 = !DILocation(line: 24, column: 37, scope: !19)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 25, type: !3)
!31 = !DILocation(line: 25, column: 21, scope: !19)
!32 = !DILocation(line: 25, column: 55, scope: !19)
!33 = !DILocation(line: 25, column: 38, scope: !19)
!34 = !DILocation(line: 26, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !19, file: !20, line: 26, column: 8)
!36 = !DILocation(line: 26, column: 18, scope: !35)
!37 = !DILocation(line: 26, column: 8, scope: !19)
!38 = !DILocation(line: 30, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !20, line: 27, column: 5)
!40 = !DILocation(line: 30, column: 14, scope: !39)
!41 = !DILocation(line: 31, column: 5, scope: !39)
!42 = !DILocalVariable(name: "source", scope: !43, file: !20, line: 33, type: !44)
!43 = distinct !DILexicalBlock(scope: !19, file: !20, line: 32, column: 5)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 100)
!47 = !DILocation(line: 33, column: 23, scope: !43)
!48 = !DILocalVariable(name: "i", scope: !49, file: !20, line: 35, type: !50)
!49 = distinct !DILexicalBlock(scope: !43, file: !20, line: 34, column: 9)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !51, line: 31, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !53, line: 94, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!54 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!55 = !DILocation(line: 35, column: 20, scope: !49)
!56 = !DILocation(line: 37, column: 20, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !20, line: 37, column: 13)
!58 = !DILocation(line: 37, column: 18, scope: !57)
!59 = !DILocation(line: 37, column: 25, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !20, line: 37, column: 13)
!61 = !DILocation(line: 37, column: 27, scope: !60)
!62 = !DILocation(line: 37, column: 13, scope: !57)
!63 = !DILocation(line: 39, column: 24, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !20, line: 38, column: 13)
!65 = !DILocation(line: 39, column: 17, scope: !64)
!66 = !DILocation(line: 39, column: 27, scope: !64)
!67 = !DILocation(line: 39, column: 34, scope: !64)
!68 = !DILocation(line: 40, column: 24, scope: !64)
!69 = !DILocation(line: 40, column: 17, scope: !64)
!70 = !DILocation(line: 40, column: 27, scope: !64)
!71 = !DILocation(line: 40, column: 34, scope: !64)
!72 = !DILocation(line: 41, column: 13, scope: !64)
!73 = !DILocation(line: 37, column: 35, scope: !60)
!74 = !DILocation(line: 37, column: 13, scope: !60)
!75 = distinct !{!75, !62, !76, !77}
!76 = !DILocation(line: 41, column: 13, scope: !57)
!77 = !{!"llvm.loop.mustprogress"}
!78 = !DILocation(line: 44, column: 9, scope: !43)
!79 = !DILocation(line: 45, column: 26, scope: !43)
!80 = !DILocation(line: 45, column: 9, scope: !43)
!81 = !DILocation(line: 47, column: 1, scope: !19)
!82 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memcpy_14_good", scope: !20, file: !20, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!83 = !DILocation(line: 116, column: 5, scope: !82)
!84 = !DILocation(line: 117, column: 5, scope: !82)
!85 = !DILocation(line: 118, column: 1, scope: !82)
!86 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 130, type: !87, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!87 = !DISubroutineType(types: !88)
!88 = !{!9, !9, !89}
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!92 = !DILocalVariable(name: "argc", arg: 1, scope: !86, file: !20, line: 130, type: !9)
!93 = !DILocation(line: 130, column: 14, scope: !86)
!94 = !DILocalVariable(name: "argv", arg: 2, scope: !86, file: !20, line: 130, type: !89)
!95 = !DILocation(line: 130, column: 27, scope: !86)
!96 = !DILocation(line: 133, column: 22, scope: !86)
!97 = !DILocation(line: 133, column: 12, scope: !86)
!98 = !DILocation(line: 133, column: 5, scope: !86)
!99 = !DILocation(line: 135, column: 5, scope: !86)
!100 = !DILocation(line: 136, column: 5, scope: !86)
!101 = !DILocation(line: 137, column: 5, scope: !86)
!102 = !DILocation(line: 140, column: 5, scope: !86)
!103 = !DILocation(line: 141, column: 5, scope: !86)
!104 = !DILocation(line: 142, column: 5, scope: !86)
!105 = !DILocation(line: 144, column: 5, scope: !86)
!106 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!107 = !DILocalVariable(name: "data", scope: !106, file: !20, line: 56, type: !3)
!108 = !DILocation(line: 56, column: 21, scope: !106)
!109 = !DILocalVariable(name: "dataBadBuffer", scope: !106, file: !20, line: 57, type: !3)
!110 = !DILocation(line: 57, column: 21, scope: !106)
!111 = !DILocation(line: 57, column: 54, scope: !106)
!112 = !DILocation(line: 57, column: 37, scope: !106)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !106, file: !20, line: 58, type: !3)
!114 = !DILocation(line: 58, column: 21, scope: !106)
!115 = !DILocation(line: 58, column: 55, scope: !106)
!116 = !DILocation(line: 58, column: 38, scope: !106)
!117 = !DILocation(line: 59, column: 8, scope: !118)
!118 = distinct !DILexicalBlock(scope: !106, file: !20, line: 59, column: 8)
!119 = !DILocation(line: 59, column: 18, scope: !118)
!120 = !DILocation(line: 59, column: 8, scope: !106)
!121 = !DILocation(line: 62, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !20, line: 60, column: 5)
!123 = !DILocation(line: 63, column: 5, scope: !122)
!124 = !DILocation(line: 67, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !20, line: 65, column: 5)
!126 = !DILocation(line: 67, column: 14, scope: !125)
!127 = !DILocalVariable(name: "source", scope: !128, file: !20, line: 70, type: !44)
!128 = distinct !DILexicalBlock(scope: !106, file: !20, line: 69, column: 5)
!129 = !DILocation(line: 70, column: 23, scope: !128)
!130 = !DILocalVariable(name: "i", scope: !131, file: !20, line: 72, type: !50)
!131 = distinct !DILexicalBlock(scope: !128, file: !20, line: 71, column: 9)
!132 = !DILocation(line: 72, column: 20, scope: !131)
!133 = !DILocation(line: 74, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !20, line: 74, column: 13)
!135 = !DILocation(line: 74, column: 18, scope: !134)
!136 = !DILocation(line: 74, column: 25, scope: !137)
!137 = distinct !DILexicalBlock(scope: !134, file: !20, line: 74, column: 13)
!138 = !DILocation(line: 74, column: 27, scope: !137)
!139 = !DILocation(line: 74, column: 13, scope: !134)
!140 = !DILocation(line: 76, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !20, line: 75, column: 13)
!142 = !DILocation(line: 76, column: 17, scope: !141)
!143 = !DILocation(line: 76, column: 27, scope: !141)
!144 = !DILocation(line: 76, column: 34, scope: !141)
!145 = !DILocation(line: 77, column: 24, scope: !141)
!146 = !DILocation(line: 77, column: 17, scope: !141)
!147 = !DILocation(line: 77, column: 27, scope: !141)
!148 = !DILocation(line: 77, column: 34, scope: !141)
!149 = !DILocation(line: 78, column: 13, scope: !141)
!150 = !DILocation(line: 74, column: 35, scope: !137)
!151 = !DILocation(line: 74, column: 13, scope: !137)
!152 = distinct !{!152, !139, !153, !77}
!153 = !DILocation(line: 78, column: 13, scope: !134)
!154 = !DILocation(line: 81, column: 9, scope: !128)
!155 = !DILocation(line: 82, column: 26, scope: !128)
!156 = !DILocation(line: 82, column: 9, scope: !128)
!157 = !DILocation(line: 84, column: 1, scope: !106)
!158 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!159 = !DILocalVariable(name: "data", scope: !158, file: !20, line: 89, type: !3)
!160 = !DILocation(line: 89, column: 21, scope: !158)
!161 = !DILocalVariable(name: "dataBadBuffer", scope: !158, file: !20, line: 90, type: !3)
!162 = !DILocation(line: 90, column: 21, scope: !158)
!163 = !DILocation(line: 90, column: 54, scope: !158)
!164 = !DILocation(line: 90, column: 37, scope: !158)
!165 = !DILocalVariable(name: "dataGoodBuffer", scope: !158, file: !20, line: 91, type: !3)
!166 = !DILocation(line: 91, column: 21, scope: !158)
!167 = !DILocation(line: 91, column: 55, scope: !158)
!168 = !DILocation(line: 91, column: 38, scope: !158)
!169 = !DILocation(line: 92, column: 8, scope: !170)
!170 = distinct !DILexicalBlock(scope: !158, file: !20, line: 92, column: 8)
!171 = !DILocation(line: 92, column: 18, scope: !170)
!172 = !DILocation(line: 92, column: 8, scope: !158)
!173 = !DILocation(line: 95, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !20, line: 93, column: 5)
!175 = !DILocation(line: 95, column: 14, scope: !174)
!176 = !DILocation(line: 96, column: 5, scope: !174)
!177 = !DILocalVariable(name: "source", scope: !178, file: !20, line: 98, type: !44)
!178 = distinct !DILexicalBlock(scope: !158, file: !20, line: 97, column: 5)
!179 = !DILocation(line: 98, column: 23, scope: !178)
!180 = !DILocalVariable(name: "i", scope: !181, file: !20, line: 100, type: !50)
!181 = distinct !DILexicalBlock(scope: !178, file: !20, line: 99, column: 9)
!182 = !DILocation(line: 100, column: 20, scope: !181)
!183 = !DILocation(line: 102, column: 20, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !20, line: 102, column: 13)
!185 = !DILocation(line: 102, column: 18, scope: !184)
!186 = !DILocation(line: 102, column: 25, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !20, line: 102, column: 13)
!188 = !DILocation(line: 102, column: 27, scope: !187)
!189 = !DILocation(line: 102, column: 13, scope: !184)
!190 = !DILocation(line: 104, column: 24, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !20, line: 103, column: 13)
!192 = !DILocation(line: 104, column: 17, scope: !191)
!193 = !DILocation(line: 104, column: 27, scope: !191)
!194 = !DILocation(line: 104, column: 34, scope: !191)
!195 = !DILocation(line: 105, column: 24, scope: !191)
!196 = !DILocation(line: 105, column: 17, scope: !191)
!197 = !DILocation(line: 105, column: 27, scope: !191)
!198 = !DILocation(line: 105, column: 34, scope: !191)
!199 = !DILocation(line: 106, column: 13, scope: !191)
!200 = !DILocation(line: 102, column: 35, scope: !187)
!201 = !DILocation(line: 102, column: 13, scope: !187)
!202 = distinct !{!202, !189, !203, !77}
!203 = !DILocation(line: 106, column: 13, scope: !184)
!204 = !DILocation(line: 109, column: 9, scope: !178)
!205 = !DILocation(line: 110, column: 26, scope: !178)
!206 = !DILocation(line: 110, column: 9, scope: !178)
!207 = !DILocation(line: 112, column: 1, scope: !158)
