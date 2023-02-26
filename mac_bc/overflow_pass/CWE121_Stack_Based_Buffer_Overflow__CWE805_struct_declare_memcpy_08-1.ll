; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %call = call i32 @staticReturnsTrue(), !dbg !36
  %tobool = icmp ne i32 %call, 0, !dbg !36
  br i1 %tobool, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i64* %i, metadata !46, metadata !DIExpression()), !dbg !53
  store i64 0, i64* %i, align 8, !dbg !54
  br label %for.cond, !dbg !56

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !57
  %cmp = icmp ult i64 %0, 100, !dbg !59
  br i1 %cmp, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !63
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !64
  store i32 0, i32* %intOne, align 8, !dbg !65
  %2 = load i64, i64* %i, align 8, !dbg !66
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !67
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !68
  store i32 0, i32* %intTwo, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %3, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !76
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !76
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !76
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !76
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !76
  %call3 = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !76
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !77
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !77
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !78
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_good() #0 !dbg !80 {
entry:
  call void @goodG2B1(), !dbg !81
  call void @goodG2B2(), !dbg !82
  ret void, !dbg !83
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !92, metadata !DIExpression()), !dbg !93
  %call = call i64 @time(i64* noundef null), !dbg !94
  %conv = trunc i64 %call to i32, !dbg !95
  call void @srand(i32 noundef %conv), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !97
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !104 {
entry:
  ret i32 1, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !108 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i32 @staticReturnsFalse(), !dbg !115
  %tobool = icmp ne i32 %call, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !123
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !124, metadata !DIExpression()), !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  store i64 0, i64* %i, align 8, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !133
  %cmp = icmp ult i64 %0, 100, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !139
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !140
  store i32 0, i32* %intOne, align 8, !dbg !141
  %2 = load i64, i64* %i, align 8, !dbg !142
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !143
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !144
  store i32 0, i32* %intTwo, align 4, !dbg !145
  br label %for.inc, !dbg !146

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !147
  %inc = add i64 %3, 1, !dbg !147
  store i64 %inc, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !148, !llvm.loop !149

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !151
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !151
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !151
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !151
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !151
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !151
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !151
  %call3 = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !151
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !152
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !152
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !155 {
entry:
  ret i32 0, !dbg !156
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !157 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !158, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !160, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !162, metadata !DIExpression()), !dbg !163
  %call = call i32 @staticReturnsTrue(), !dbg !164
  %tobool = icmp ne i32 %call, 0, !dbg !164
  br i1 %tobool, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !167
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !169
  br label %if.end, !dbg !170

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !171, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i64* %i, metadata !174, metadata !DIExpression()), !dbg !176
  store i64 0, i64* %i, align 8, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !180
  %cmp = icmp ult i64 %0, 100, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !186
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !187
  store i32 0, i32* %intOne, align 8, !dbg !188
  %2 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !190
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !191
  store i32 0, i32* %intTwo, align 4, !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !194
  %inc = add i64 %3, 1, !dbg !194
  store i64 %inc, i64* %i, align 8, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !198
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !198
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !198
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !198
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !198
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !198
  %call3 = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !198
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !199
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !199
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !200
  ret void, !dbg !201
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !19, line: 100, baseType: !20)
!19 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !19, line: 96, size: 64, elements: !21)
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !20, file: !19, line: 98, baseType: !23, size: 32)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !20, file: !19, line: 99, baseType: !23, size: 32, offset: 32)
!25 = !DILocation(line: 37, column: 21, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 38, column: 19, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 39, column: 19, scope: !11)
!36 = !DILocation(line: 40, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!38 = !DILocation(line: 40, column: 8, scope: !11)
!39 = !DILocation(line: 44, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 41, column: 5)
!41 = !DILocation(line: 44, column: 14, scope: !40)
!42 = !DILocation(line: 45, column: 5, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 47, type: !32)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!45 = !DILocation(line: 47, column: 23, scope: !44)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 49, type: !48)
!47 = distinct !DILexicalBlock(scope: !44, file: !12, line: 48, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !51, line: 94, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!52 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 49, column: 20, scope: !47)
!54 = !DILocation(line: 51, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !12, line: 51, column: 13)
!56 = !DILocation(line: 51, column: 18, scope: !55)
!57 = !DILocation(line: 51, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 51, column: 13)
!59 = !DILocation(line: 51, column: 27, scope: !58)
!60 = !DILocation(line: 51, column: 13, scope: !55)
!61 = !DILocation(line: 53, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 52, column: 13)
!63 = !DILocation(line: 53, column: 17, scope: !62)
!64 = !DILocation(line: 53, column: 27, scope: !62)
!65 = !DILocation(line: 53, column: 34, scope: !62)
!66 = !DILocation(line: 54, column: 24, scope: !62)
!67 = !DILocation(line: 54, column: 17, scope: !62)
!68 = !DILocation(line: 54, column: 27, scope: !62)
!69 = !DILocation(line: 54, column: 34, scope: !62)
!70 = !DILocation(line: 55, column: 13, scope: !62)
!71 = !DILocation(line: 51, column: 35, scope: !58)
!72 = !DILocation(line: 51, column: 13, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 55, column: 13, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 58, column: 9, scope: !44)
!77 = !DILocation(line: 59, column: 26, scope: !44)
!78 = !DILocation(line: 59, column: 9, scope: !44)
!79 = !DILocation(line: 61, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_08_good", scope: !12, file: !12, line: 128, type: !13, scopeLine: 129, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocation(line: 130, column: 5, scope: !80)
!82 = !DILocation(line: 131, column: 5, scope: !80)
!83 = !DILocation(line: 132, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 144, type: !85, scopeLine: 145, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!85 = !DISubroutineType(types: !86)
!86 = !{!23, !23, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 144, type: !23)
!91 = !DILocation(line: 144, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 144, type: !87)
!93 = !DILocation(line: 144, column: 27, scope: !84)
!94 = !DILocation(line: 147, column: 22, scope: !84)
!95 = !DILocation(line: 147, column: 12, scope: !84)
!96 = !DILocation(line: 147, column: 5, scope: !84)
!97 = !DILocation(line: 149, column: 5, scope: !84)
!98 = !DILocation(line: 150, column: 5, scope: !84)
!99 = !DILocation(line: 151, column: 5, scope: !84)
!100 = !DILocation(line: 154, column: 5, scope: !84)
!101 = !DILocation(line: 155, column: 5, scope: !84)
!102 = !DILocation(line: 156, column: 5, scope: !84)
!103 = !DILocation(line: 158, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !105, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!105 = !DISubroutineType(types: !106)
!106 = !{!23}
!107 = !DILocation(line: 25, column: 5, scope: !104)
!108 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!109 = !DILocalVariable(name: "data", scope: !108, file: !12, line: 70, type: !17)
!110 = !DILocation(line: 70, column: 21, scope: !108)
!111 = !DILocalVariable(name: "dataBadBuffer", scope: !108, file: !12, line: 71, type: !27)
!112 = !DILocation(line: 71, column: 19, scope: !108)
!113 = !DILocalVariable(name: "dataGoodBuffer", scope: !108, file: !12, line: 72, type: !32)
!114 = !DILocation(line: 72, column: 19, scope: !108)
!115 = !DILocation(line: 73, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !108, file: !12, line: 73, column: 8)
!117 = !DILocation(line: 73, column: 8, scope: !108)
!118 = !DILocation(line: 76, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !12, line: 74, column: 5)
!120 = !DILocation(line: 77, column: 5, scope: !119)
!121 = !DILocation(line: 81, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !12, line: 79, column: 5)
!123 = !DILocation(line: 81, column: 14, scope: !122)
!124 = !DILocalVariable(name: "source", scope: !125, file: !12, line: 84, type: !32)
!125 = distinct !DILexicalBlock(scope: !108, file: !12, line: 83, column: 5)
!126 = !DILocation(line: 84, column: 23, scope: !125)
!127 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 86, type: !48)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 85, column: 9)
!129 = !DILocation(line: 86, column: 20, scope: !128)
!130 = !DILocation(line: 88, column: 20, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 88, column: 13)
!132 = !DILocation(line: 88, column: 18, scope: !131)
!133 = !DILocation(line: 88, column: 25, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 88, column: 13)
!135 = !DILocation(line: 88, column: 27, scope: !134)
!136 = !DILocation(line: 88, column: 13, scope: !131)
!137 = !DILocation(line: 90, column: 24, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 89, column: 13)
!139 = !DILocation(line: 90, column: 17, scope: !138)
!140 = !DILocation(line: 90, column: 27, scope: !138)
!141 = !DILocation(line: 90, column: 34, scope: !138)
!142 = !DILocation(line: 91, column: 24, scope: !138)
!143 = !DILocation(line: 91, column: 17, scope: !138)
!144 = !DILocation(line: 91, column: 27, scope: !138)
!145 = !DILocation(line: 91, column: 34, scope: !138)
!146 = !DILocation(line: 92, column: 13, scope: !138)
!147 = !DILocation(line: 88, column: 35, scope: !134)
!148 = !DILocation(line: 88, column: 13, scope: !134)
!149 = distinct !{!149, !136, !150, !75}
!150 = !DILocation(line: 92, column: 13, scope: !131)
!151 = !DILocation(line: 95, column: 9, scope: !125)
!152 = !DILocation(line: 96, column: 26, scope: !125)
!153 = !DILocation(line: 96, column: 9, scope: !125)
!154 = !DILocation(line: 98, column: 1, scope: !108)
!155 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !105, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!156 = !DILocation(line: 30, column: 5, scope: !155)
!157 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!158 = !DILocalVariable(name: "data", scope: !157, file: !12, line: 103, type: !17)
!159 = !DILocation(line: 103, column: 21, scope: !157)
!160 = !DILocalVariable(name: "dataBadBuffer", scope: !157, file: !12, line: 104, type: !27)
!161 = !DILocation(line: 104, column: 19, scope: !157)
!162 = !DILocalVariable(name: "dataGoodBuffer", scope: !157, file: !12, line: 105, type: !32)
!163 = !DILocation(line: 105, column: 19, scope: !157)
!164 = !DILocation(line: 106, column: 8, scope: !165)
!165 = distinct !DILexicalBlock(scope: !157, file: !12, line: 106, column: 8)
!166 = !DILocation(line: 106, column: 8, scope: !157)
!167 = !DILocation(line: 109, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 107, column: 5)
!169 = !DILocation(line: 109, column: 14, scope: !168)
!170 = !DILocation(line: 110, column: 5, scope: !168)
!171 = !DILocalVariable(name: "source", scope: !172, file: !12, line: 112, type: !32)
!172 = distinct !DILexicalBlock(scope: !157, file: !12, line: 111, column: 5)
!173 = !DILocation(line: 112, column: 23, scope: !172)
!174 = !DILocalVariable(name: "i", scope: !175, file: !12, line: 114, type: !48)
!175 = distinct !DILexicalBlock(scope: !172, file: !12, line: 113, column: 9)
!176 = !DILocation(line: 114, column: 20, scope: !175)
!177 = !DILocation(line: 116, column: 20, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !12, line: 116, column: 13)
!179 = !DILocation(line: 116, column: 18, scope: !178)
!180 = !DILocation(line: 116, column: 25, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !12, line: 116, column: 13)
!182 = !DILocation(line: 116, column: 27, scope: !181)
!183 = !DILocation(line: 116, column: 13, scope: !178)
!184 = !DILocation(line: 118, column: 24, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !12, line: 117, column: 13)
!186 = !DILocation(line: 118, column: 17, scope: !185)
!187 = !DILocation(line: 118, column: 27, scope: !185)
!188 = !DILocation(line: 118, column: 34, scope: !185)
!189 = !DILocation(line: 119, column: 24, scope: !185)
!190 = !DILocation(line: 119, column: 17, scope: !185)
!191 = !DILocation(line: 119, column: 27, scope: !185)
!192 = !DILocation(line: 119, column: 34, scope: !185)
!193 = !DILocation(line: 120, column: 13, scope: !185)
!194 = !DILocation(line: 116, column: 35, scope: !181)
!195 = !DILocation(line: 116, column: 13, scope: !181)
!196 = distinct !{!196, !183, !197, !75}
!197 = !DILocation(line: 120, column: 13, scope: !178)
!198 = !DILocation(line: 123, column: 9, scope: !172)
!199 = !DILocation(line: 124, column: 26, scope: !172)
!200 = !DILocation(line: 124, column: 9, scope: !172)
!201 = !DILocation(line: 126, column: 1, scope: !157)
