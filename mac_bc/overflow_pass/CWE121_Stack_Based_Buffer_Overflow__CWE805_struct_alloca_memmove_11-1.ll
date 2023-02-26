; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11_bad() #0 !dbg !19 {
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
  %call = call i32 (...) @globalReturnsTrue(), !dbg !34
  %tobool = icmp ne i32 %call, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !37
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !39
  br label %if.end, !dbg !40

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !41, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !54
  store i64 0, i64* %i, align 8, !dbg !55
  br label %for.cond, !dbg !57

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !58
  %cmp = icmp ult i64 %5, 100, !dbg !60
  br i1 %cmp, label %for.body, label %for.end, !dbg !61

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !62
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !64
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !65
  store i32 0, i32* %intOne, align 8, !dbg !66
  %7 = load i64, i64* %i, align 8, !dbg !67
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !68
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !69
  store i32 0, i32* %intTwo, align 4, !dbg !70
  br label %for.inc, !dbg !71

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !72
  %inc = add i64 %8, 1, !dbg !72
  store i64 %inc, i64* %i, align 8, !dbg !72
  br label %for.cond, !dbg !73, !llvm.loop !74

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !77
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !77
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !77
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !77
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !77
  %call2 = call i8* @__memmove_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !77
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !78
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !78
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11_good() #0 !dbg !81 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11_good(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11_bad(), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 400, align 16, !dbg !110
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !111
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 800, align 16, !dbg !114
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !115
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !113
  %call = call i32 (...) @globalReturnsFalse(), !dbg !116
  %tobool = icmp ne i32 %call, 0, !dbg !116
  br i1 %tobool, label %if.then, label %if.else, !dbg !118

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !119
  br label %if.end, !dbg !121

if.else:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !122
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !125, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  store i64 0, i64* %i, align 8, !dbg !131
  br label %for.cond, !dbg !133

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !134
  %cmp = icmp ult i64 %5, 100, !dbg !136
  br i1 %cmp, label %for.body, label %for.end, !dbg !137

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !140
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !141
  store i32 0, i32* %intOne, align 8, !dbg !142
  %7 = load i64, i64* %i, align 8, !dbg !143
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !144
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !145
  store i32 0, i32* %intTwo, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !148
  %inc = add i64 %8, 1, !dbg !148
  store i64 %inc, i64* %i, align 8, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !152
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !152
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !152
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !152
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !152
  %call2 = call i8* @__memmove_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !152
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !153
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !153
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !154
  ret void, !dbg !155
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !156 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !157, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = alloca i8, i64 400, align 16, !dbg !161
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !162
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !160
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !163, metadata !DIExpression()), !dbg !164
  %2 = alloca i8, i64 800, align 16, !dbg !165
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !166
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !164
  %call = call i32 (...) @globalReturnsTrue(), !dbg !167
  %tobool = icmp ne i32 %call, 0, !dbg !167
  br i1 %tobool, label %if.then, label %if.end, !dbg !169

if.then:                                          ; preds = %entry
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !170
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !174, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i64* %i, metadata !177, metadata !DIExpression()), !dbg !179
  store i64 0, i64* %i, align 8, !dbg !180
  br label %for.cond, !dbg !182

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !183
  %cmp = icmp ult i64 %5, 100, !dbg !185
  br i1 %cmp, label %for.body, label %for.end, !dbg !186

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !189
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !190
  store i32 0, i32* %intOne, align 8, !dbg !191
  %7 = load i64, i64* %i, align 8, !dbg !192
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !193
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !194
  store i32 0, i32* %intTwo, align 4, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !197
  %inc = add i64 %8, 1, !dbg !197
  store i64 %inc, i64* %i, align 8, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !201
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !201
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !201
  %11 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !201
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !201
  %13 = bitcast %struct._twoIntsStruct* %12 to i8*, !dbg !201
  %14 = call i64 @llvm.objectsize.i64.p0i8(i8* %13, i1 false, i1 true, i1 false), !dbg !201
  %call2 = call i8* @__memmove_chk(i8* noundef %10, i8* noundef %11, i64 noundef 800, i64 noundef %14) #4, !dbg !201
  %15 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !202
  %arrayidx3 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %15, i64 0, !dbg !202
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx3), !dbg !203
  ret void, !dbg !204
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11_bad", scope: !20, file: !20, line: 21, type: !21, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!36 = !DILocation(line: 26, column: 8, scope: !19)
!37 = !DILocation(line: 30, column: 16, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !20, line: 27, column: 5)
!39 = !DILocation(line: 30, column: 14, scope: !38)
!40 = !DILocation(line: 31, column: 5, scope: !38)
!41 = !DILocalVariable(name: "source", scope: !42, file: !20, line: 33, type: !43)
!42 = distinct !DILexicalBlock(scope: !19, file: !20, line: 32, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 100)
!46 = !DILocation(line: 33, column: 23, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !48, file: !20, line: 35, type: !49)
!48 = distinct !DILexicalBlock(scope: !42, file: !20, line: 34, column: 9)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 31, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !52, line: 94, baseType: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!53 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!54 = !DILocation(line: 35, column: 20, scope: !48)
!55 = !DILocation(line: 37, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !48, file: !20, line: 37, column: 13)
!57 = !DILocation(line: 37, column: 18, scope: !56)
!58 = !DILocation(line: 37, column: 25, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !20, line: 37, column: 13)
!60 = !DILocation(line: 37, column: 27, scope: !59)
!61 = !DILocation(line: 37, column: 13, scope: !56)
!62 = !DILocation(line: 39, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !20, line: 38, column: 13)
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
!77 = !DILocation(line: 44, column: 9, scope: !42)
!78 = !DILocation(line: 45, column: 26, scope: !42)
!79 = !DILocation(line: 45, column: 9, scope: !42)
!80 = !DILocation(line: 47, column: 1, scope: !19)
!81 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_memmove_11_good", scope: !20, file: !20, line: 114, type: !21, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!82 = !DILocation(line: 116, column: 5, scope: !81)
!83 = !DILocation(line: 117, column: 5, scope: !81)
!84 = !DILocation(line: 118, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 130, type: !86, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!86 = !DISubroutineType(types: !87)
!87 = !{!9, !9, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !20, line: 130, type: !9)
!92 = !DILocation(line: 130, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !20, line: 130, type: !88)
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
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!106 = !DILocalVariable(name: "data", scope: !105, file: !20, line: 56, type: !3)
!107 = !DILocation(line: 56, column: 21, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !20, line: 57, type: !3)
!109 = !DILocation(line: 57, column: 21, scope: !105)
!110 = !DILocation(line: 57, column: 54, scope: !105)
!111 = !DILocation(line: 57, column: 37, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !20, line: 58, type: !3)
!113 = !DILocation(line: 58, column: 21, scope: !105)
!114 = !DILocation(line: 58, column: 55, scope: !105)
!115 = !DILocation(line: 58, column: 38, scope: !105)
!116 = !DILocation(line: 59, column: 8, scope: !117)
!117 = distinct !DILexicalBlock(scope: !105, file: !20, line: 59, column: 8)
!118 = !DILocation(line: 59, column: 8, scope: !105)
!119 = !DILocation(line: 62, column: 9, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !20, line: 60, column: 5)
!121 = !DILocation(line: 63, column: 5, scope: !120)
!122 = !DILocation(line: 67, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !117, file: !20, line: 65, column: 5)
!124 = !DILocation(line: 67, column: 14, scope: !123)
!125 = !DILocalVariable(name: "source", scope: !126, file: !20, line: 70, type: !43)
!126 = distinct !DILexicalBlock(scope: !105, file: !20, line: 69, column: 5)
!127 = !DILocation(line: 70, column: 23, scope: !126)
!128 = !DILocalVariable(name: "i", scope: !129, file: !20, line: 72, type: !49)
!129 = distinct !DILexicalBlock(scope: !126, file: !20, line: 71, column: 9)
!130 = !DILocation(line: 72, column: 20, scope: !129)
!131 = !DILocation(line: 74, column: 20, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !20, line: 74, column: 13)
!133 = !DILocation(line: 74, column: 18, scope: !132)
!134 = !DILocation(line: 74, column: 25, scope: !135)
!135 = distinct !DILexicalBlock(scope: !132, file: !20, line: 74, column: 13)
!136 = !DILocation(line: 74, column: 27, scope: !135)
!137 = !DILocation(line: 74, column: 13, scope: !132)
!138 = !DILocation(line: 76, column: 24, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !20, line: 75, column: 13)
!140 = !DILocation(line: 76, column: 17, scope: !139)
!141 = !DILocation(line: 76, column: 27, scope: !139)
!142 = !DILocation(line: 76, column: 34, scope: !139)
!143 = !DILocation(line: 77, column: 24, scope: !139)
!144 = !DILocation(line: 77, column: 17, scope: !139)
!145 = !DILocation(line: 77, column: 27, scope: !139)
!146 = !DILocation(line: 77, column: 34, scope: !139)
!147 = !DILocation(line: 78, column: 13, scope: !139)
!148 = !DILocation(line: 74, column: 35, scope: !135)
!149 = !DILocation(line: 74, column: 13, scope: !135)
!150 = distinct !{!150, !137, !151, !76}
!151 = !DILocation(line: 78, column: 13, scope: !132)
!152 = !DILocation(line: 81, column: 9, scope: !126)
!153 = !DILocation(line: 82, column: 26, scope: !126)
!154 = !DILocation(line: 82, column: 9, scope: !126)
!155 = !DILocation(line: 84, column: 1, scope: !105)
!156 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 87, type: !21, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!157 = !DILocalVariable(name: "data", scope: !156, file: !20, line: 89, type: !3)
!158 = !DILocation(line: 89, column: 21, scope: !156)
!159 = !DILocalVariable(name: "dataBadBuffer", scope: !156, file: !20, line: 90, type: !3)
!160 = !DILocation(line: 90, column: 21, scope: !156)
!161 = !DILocation(line: 90, column: 54, scope: !156)
!162 = !DILocation(line: 90, column: 37, scope: !156)
!163 = !DILocalVariable(name: "dataGoodBuffer", scope: !156, file: !20, line: 91, type: !3)
!164 = !DILocation(line: 91, column: 21, scope: !156)
!165 = !DILocation(line: 91, column: 55, scope: !156)
!166 = !DILocation(line: 91, column: 38, scope: !156)
!167 = !DILocation(line: 92, column: 8, scope: !168)
!168 = distinct !DILexicalBlock(scope: !156, file: !20, line: 92, column: 8)
!169 = !DILocation(line: 92, column: 8, scope: !156)
!170 = !DILocation(line: 95, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !20, line: 93, column: 5)
!172 = !DILocation(line: 95, column: 14, scope: !171)
!173 = !DILocation(line: 96, column: 5, scope: !171)
!174 = !DILocalVariable(name: "source", scope: !175, file: !20, line: 98, type: !43)
!175 = distinct !DILexicalBlock(scope: !156, file: !20, line: 97, column: 5)
!176 = !DILocation(line: 98, column: 23, scope: !175)
!177 = !DILocalVariable(name: "i", scope: !178, file: !20, line: 100, type: !49)
!178 = distinct !DILexicalBlock(scope: !175, file: !20, line: 99, column: 9)
!179 = !DILocation(line: 100, column: 20, scope: !178)
!180 = !DILocation(line: 102, column: 20, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !20, line: 102, column: 13)
!182 = !DILocation(line: 102, column: 18, scope: !181)
!183 = !DILocation(line: 102, column: 25, scope: !184)
!184 = distinct !DILexicalBlock(scope: !181, file: !20, line: 102, column: 13)
!185 = !DILocation(line: 102, column: 27, scope: !184)
!186 = !DILocation(line: 102, column: 13, scope: !181)
!187 = !DILocation(line: 104, column: 24, scope: !188)
!188 = distinct !DILexicalBlock(scope: !184, file: !20, line: 103, column: 13)
!189 = !DILocation(line: 104, column: 17, scope: !188)
!190 = !DILocation(line: 104, column: 27, scope: !188)
!191 = !DILocation(line: 104, column: 34, scope: !188)
!192 = !DILocation(line: 105, column: 24, scope: !188)
!193 = !DILocation(line: 105, column: 17, scope: !188)
!194 = !DILocation(line: 105, column: 27, scope: !188)
!195 = !DILocation(line: 105, column: 34, scope: !188)
!196 = !DILocation(line: 106, column: 13, scope: !188)
!197 = !DILocation(line: 102, column: 35, scope: !184)
!198 = !DILocation(line: 102, column: 13, scope: !184)
!199 = distinct !{!199, !186, !200, !76}
!200 = !DILocation(line: 106, column: 13, scope: !181)
!201 = !DILocation(line: 109, column: 9, scope: !175)
!202 = !DILocation(line: 110, column: 26, scope: !175)
!203 = !DILocation(line: 110, column: 9, scope: !175)
!204 = !DILocation(line: 112, column: 1, scope: !156)
