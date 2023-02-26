; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %call = call i32 (...) @globalReturnsTrue(), !dbg !36
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

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11_good() #0 !dbg !80 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11_good(), !dbg !98
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !100
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11_bad(), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !102
  ret i32 0, !dbg !103
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !104 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !105, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i32 (...) @globalReturnsFalse(), !dbg !111
  %tobool = icmp ne i32 %call, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !117
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !120, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i64* %i, metadata !123, metadata !DIExpression()), !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !129
  %cmp = icmp ult i64 %0, 100, !dbg !131
  br i1 %cmp, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !135
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !136
  store i32 0, i32* %intOne, align 8, !dbg !137
  %2 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !139
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !140
  store i32 0, i32* %intTwo, align 4, !dbg !141
  br label %for.inc, !dbg !142

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !143
  %inc = add i64 %3, 1, !dbg !143
  store i64 %inc, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !144, !llvm.loop !145

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !147
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !147
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !147
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !147
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !147
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !147
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !147
  %call3 = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !147
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !148
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !148
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !149
  ret void, !dbg !150
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !151 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !152, metadata !DIExpression()), !dbg !153
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %call = call i32 (...) @globalReturnsTrue(), !dbg !158
  %tobool = icmp ne i32 %call, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !161
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !165, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i64* %i, metadata !168, metadata !DIExpression()), !dbg !170
  store i64 0, i64* %i, align 8, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !174
  %cmp = icmp ult i64 %0, 100, !dbg !176
  br i1 %cmp, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !178
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !180
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !181
  store i32 0, i32* %intOne, align 8, !dbg !182
  %2 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !184
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !185
  store i32 0, i32* %intTwo, align 4, !dbg !186
  br label %for.inc, !dbg !187

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !188
  %inc = add i64 %3, 1, !dbg !188
  store i64 %inc, i64* %i, align 8, !dbg !188
  br label %for.cond, !dbg !189, !llvm.loop !190

for.end:                                          ; preds = %for.cond
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !192
  %5 = bitcast %struct._twoIntsStruct* %4 to i8*, !dbg !192
  %arraydecay2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !192
  %6 = bitcast %struct._twoIntsStruct* %arraydecay2 to i8*, !dbg !192
  %7 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !192
  %8 = bitcast %struct._twoIntsStruct* %7 to i8*, !dbg !192
  %9 = call i64 @llvm.objectsize.i64.p0i8(i8* %8, i1 false, i1 true, i1 false), !dbg !192
  %call3 = call i8* @__memcpy_chk(i8* noundef %5, i8* noundef %6, i64 noundef 800, i64 noundef %9) #4, !dbg !192
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !193
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 0, !dbg !193
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !194
  ret void, !dbg !195
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!38 = !DILocation(line: 26, column: 8, scope: !11)
!39 = !DILocation(line: 30, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !37, file: !12, line: 27, column: 5)
!41 = !DILocation(line: 30, column: 14, scope: !40)
!42 = !DILocation(line: 31, column: 5, scope: !40)
!43 = !DILocalVariable(name: "source", scope: !44, file: !12, line: 33, type: !32)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!45 = !DILocation(line: 33, column: 23, scope: !44)
!46 = !DILocalVariable(name: "i", scope: !47, file: !12, line: 35, type: !48)
!47 = distinct !DILexicalBlock(scope: !44, file: !12, line: 34, column: 9)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !49, line: 31, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !51, line: 94, baseType: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!52 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 35, column: 20, scope: !47)
!54 = !DILocation(line: 37, column: 20, scope: !55)
!55 = distinct !DILexicalBlock(scope: !47, file: !12, line: 37, column: 13)
!56 = !DILocation(line: 37, column: 18, scope: !55)
!57 = !DILocation(line: 37, column: 25, scope: !58)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 37, column: 13)
!59 = !DILocation(line: 37, column: 27, scope: !58)
!60 = !DILocation(line: 37, column: 13, scope: !55)
!61 = !DILocation(line: 39, column: 24, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !12, line: 38, column: 13)
!63 = !DILocation(line: 39, column: 17, scope: !62)
!64 = !DILocation(line: 39, column: 27, scope: !62)
!65 = !DILocation(line: 39, column: 34, scope: !62)
!66 = !DILocation(line: 40, column: 24, scope: !62)
!67 = !DILocation(line: 40, column: 17, scope: !62)
!68 = !DILocation(line: 40, column: 27, scope: !62)
!69 = !DILocation(line: 40, column: 34, scope: !62)
!70 = !DILocation(line: 41, column: 13, scope: !62)
!71 = !DILocation(line: 37, column: 35, scope: !58)
!72 = !DILocation(line: 37, column: 13, scope: !58)
!73 = distinct !{!73, !60, !74, !75}
!74 = !DILocation(line: 41, column: 13, scope: !55)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 44, column: 9, scope: !44)
!77 = !DILocation(line: 45, column: 26, scope: !44)
!78 = !DILocation(line: 45, column: 9, scope: !44)
!79 = !DILocation(line: 47, column: 1, scope: !11)
!80 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memcpy_11_good", scope: !12, file: !12, line: 114, type: !13, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!81 = !DILocation(line: 116, column: 5, scope: !80)
!82 = !DILocation(line: 117, column: 5, scope: !80)
!83 = !DILocation(line: 118, column: 1, scope: !80)
!84 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 130, type: !85, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!85 = !DISubroutineType(types: !86)
!86 = !{!23, !23, !87}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!90 = !DILocalVariable(name: "argc", arg: 1, scope: !84, file: !12, line: 130, type: !23)
!91 = !DILocation(line: 130, column: 14, scope: !84)
!92 = !DILocalVariable(name: "argv", arg: 2, scope: !84, file: !12, line: 130, type: !87)
!93 = !DILocation(line: 130, column: 27, scope: !84)
!94 = !DILocation(line: 133, column: 22, scope: !84)
!95 = !DILocation(line: 133, column: 12, scope: !84)
!96 = !DILocation(line: 133, column: 5, scope: !84)
!97 = !DILocation(line: 135, column: 5, scope: !84)
!98 = !DILocation(line: 136, column: 5, scope: !84)
!99 = !DILocation(line: 137, column: 5, scope: !84)
!100 = !DILocation(line: 140, column: 5, scope: !84)
!101 = !DILocation(line: 141, column: 5, scope: !84)
!102 = !DILocation(line: 142, column: 5, scope: !84)
!103 = !DILocation(line: 144, column: 5, scope: !84)
!104 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!105 = !DILocalVariable(name: "data", scope: !104, file: !12, line: 56, type: !17)
!106 = !DILocation(line: 56, column: 21, scope: !104)
!107 = !DILocalVariable(name: "dataBadBuffer", scope: !104, file: !12, line: 57, type: !27)
!108 = !DILocation(line: 57, column: 19, scope: !104)
!109 = !DILocalVariable(name: "dataGoodBuffer", scope: !104, file: !12, line: 58, type: !32)
!110 = !DILocation(line: 58, column: 19, scope: !104)
!111 = !DILocation(line: 59, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !12, line: 59, column: 8)
!113 = !DILocation(line: 59, column: 8, scope: !104)
!114 = !DILocation(line: 62, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 60, column: 5)
!116 = !DILocation(line: 63, column: 5, scope: !115)
!117 = !DILocation(line: 67, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !12, line: 65, column: 5)
!119 = !DILocation(line: 67, column: 14, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !121, file: !12, line: 70, type: !32)
!121 = distinct !DILexicalBlock(scope: !104, file: !12, line: 69, column: 5)
!122 = !DILocation(line: 70, column: 23, scope: !121)
!123 = !DILocalVariable(name: "i", scope: !124, file: !12, line: 72, type: !48)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 71, column: 9)
!125 = !DILocation(line: 72, column: 20, scope: !124)
!126 = !DILocation(line: 74, column: 20, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !12, line: 74, column: 13)
!128 = !DILocation(line: 74, column: 18, scope: !127)
!129 = !DILocation(line: 74, column: 25, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 74, column: 13)
!131 = !DILocation(line: 74, column: 27, scope: !130)
!132 = !DILocation(line: 74, column: 13, scope: !127)
!133 = !DILocation(line: 76, column: 24, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 75, column: 13)
!135 = !DILocation(line: 76, column: 17, scope: !134)
!136 = !DILocation(line: 76, column: 27, scope: !134)
!137 = !DILocation(line: 76, column: 34, scope: !134)
!138 = !DILocation(line: 77, column: 24, scope: !134)
!139 = !DILocation(line: 77, column: 17, scope: !134)
!140 = !DILocation(line: 77, column: 27, scope: !134)
!141 = !DILocation(line: 77, column: 34, scope: !134)
!142 = !DILocation(line: 78, column: 13, scope: !134)
!143 = !DILocation(line: 74, column: 35, scope: !130)
!144 = !DILocation(line: 74, column: 13, scope: !130)
!145 = distinct !{!145, !132, !146, !75}
!146 = !DILocation(line: 78, column: 13, scope: !127)
!147 = !DILocation(line: 81, column: 9, scope: !121)
!148 = !DILocation(line: 82, column: 26, scope: !121)
!149 = !DILocation(line: 82, column: 9, scope: !121)
!150 = !DILocation(line: 84, column: 1, scope: !104)
!151 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!152 = !DILocalVariable(name: "data", scope: !151, file: !12, line: 89, type: !17)
!153 = !DILocation(line: 89, column: 21, scope: !151)
!154 = !DILocalVariable(name: "dataBadBuffer", scope: !151, file: !12, line: 90, type: !27)
!155 = !DILocation(line: 90, column: 19, scope: !151)
!156 = !DILocalVariable(name: "dataGoodBuffer", scope: !151, file: !12, line: 91, type: !32)
!157 = !DILocation(line: 91, column: 19, scope: !151)
!158 = !DILocation(line: 92, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !12, line: 92, column: 8)
!160 = !DILocation(line: 92, column: 8, scope: !151)
!161 = !DILocation(line: 95, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 93, column: 5)
!163 = !DILocation(line: 95, column: 14, scope: !162)
!164 = !DILocation(line: 96, column: 5, scope: !162)
!165 = !DILocalVariable(name: "source", scope: !166, file: !12, line: 98, type: !32)
!166 = distinct !DILexicalBlock(scope: !151, file: !12, line: 97, column: 5)
!167 = !DILocation(line: 98, column: 23, scope: !166)
!168 = !DILocalVariable(name: "i", scope: !169, file: !12, line: 100, type: !48)
!169 = distinct !DILexicalBlock(scope: !166, file: !12, line: 99, column: 9)
!170 = !DILocation(line: 100, column: 20, scope: !169)
!171 = !DILocation(line: 102, column: 20, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !12, line: 102, column: 13)
!173 = !DILocation(line: 102, column: 18, scope: !172)
!174 = !DILocation(line: 102, column: 25, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !12, line: 102, column: 13)
!176 = !DILocation(line: 102, column: 27, scope: !175)
!177 = !DILocation(line: 102, column: 13, scope: !172)
!178 = !DILocation(line: 104, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !12, line: 103, column: 13)
!180 = !DILocation(line: 104, column: 17, scope: !179)
!181 = !DILocation(line: 104, column: 27, scope: !179)
!182 = !DILocation(line: 104, column: 34, scope: !179)
!183 = !DILocation(line: 105, column: 24, scope: !179)
!184 = !DILocation(line: 105, column: 17, scope: !179)
!185 = !DILocation(line: 105, column: 27, scope: !179)
!186 = !DILocation(line: 105, column: 34, scope: !179)
!187 = !DILocation(line: 106, column: 13, scope: !179)
!188 = !DILocation(line: 102, column: 35, scope: !175)
!189 = !DILocation(line: 102, column: 13, scope: !175)
!190 = distinct !{!190, !177, !191, !75}
!191 = !DILocation(line: 106, column: 13, scope: !172)
!192 = !DILocation(line: 109, column: 9, scope: !166)
!193 = !DILocation(line: 110, column: 26, scope: !166)
!194 = !DILocation(line: 110, column: 9, scope: !166)
!195 = !DILocation(line: 112, column: 1, scope: !151)
