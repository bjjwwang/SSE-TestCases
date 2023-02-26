; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02_bad() #0 !dbg !11 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !16, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !54
  %cmp = icmp ult i64 %0, 100, !dbg !56
  br i1 %cmp, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %2 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %3, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !73, metadata !DIExpression()), !dbg !75
  store i64 0, i64* %i2, align 8, !dbg !76
  br label %for.cond3, !dbg !78

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !79
  %cmp4 = icmp ult i64 %4, 100, !dbg !81
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !82

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !83
  %6 = load i64, i64* %i2, align 8, !dbg !85
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !83
  %7 = load i64, i64* %i2, align 8, !dbg !86
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !87
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !87
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !87
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !87
  br label %for.inc8, !dbg !88

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !89
  %inc9 = add i64 %10, 1, !dbg !89
  store i64 %inc9, i64* %i2, align 8, !dbg !89
  br label %for.cond3, !dbg !90, !llvm.loop !91

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !93
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !93
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !94
  ret void, !dbg !95
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02_good() #0 !dbg !96 {
entry:
  call void @goodG2B1(), !dbg !97
  call void @goodG2B2(), !dbg !98
  ret void, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !100 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !106, metadata !DIExpression()), !dbg !107
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !108, metadata !DIExpression()), !dbg !109
  %call = call i64 @time(i64* noundef null), !dbg !110
  %conv = trunc i64 %call to i32, !dbg !111
  call void @srand(i32 noundef %conv), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !113
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02_good(), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !115
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !116
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02_bad(), !dbg !117
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !118
  ret i32 0, !dbg !119
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !120 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !123, metadata !DIExpression()), !dbg !124
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !125, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !140
  %cmp = icmp ult i64 %0, 100, !dbg !142
  br i1 %cmp, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !146
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !147
  store i32 0, i32* %intOne, align 8, !dbg !148
  %2 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !150
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !151
  store i32 0, i32* %intTwo, align 4, !dbg !152
  br label %for.inc, !dbg !153

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !154
  %inc = add i64 %3, 1, !dbg !154
  store i64 %inc, i64* %i, align 8, !dbg !154
  br label %for.cond, !dbg !155, !llvm.loop !156

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !158, metadata !DIExpression()), !dbg !160
  store i64 0, i64* %i2, align 8, !dbg !161
  br label %for.cond3, !dbg !163

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !164
  %cmp4 = icmp ult i64 %4, 100, !dbg !166
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !167

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !168
  %6 = load i64, i64* %i2, align 8, !dbg !170
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !168
  %7 = load i64, i64* %i2, align 8, !dbg !171
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !172
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !172
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !172
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !172
  br label %for.inc8, !dbg !173

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !174
  %inc9 = add i64 %10, 1, !dbg !174
  store i64 %inc9, i64* %i2, align 8, !dbg !174
  br label %for.cond3, !dbg !175, !llvm.loop !176

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !178
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !178
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !179
  ret void, !dbg !180
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !181 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !186, metadata !DIExpression()), !dbg !187
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !188
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !191
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !192, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata i64* %i, metadata !195, metadata !DIExpression()), !dbg !197
  store i64 0, i64* %i, align 8, !dbg !198
  br label %for.cond, !dbg !200

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !201
  %cmp = icmp ult i64 %0, 100, !dbg !203
  br i1 %cmp, label %for.body, label %for.end, !dbg !204

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !205
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %1, !dbg !207
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !208
  store i32 0, i32* %intOne, align 8, !dbg !209
  %2 = load i64, i64* %i, align 8, !dbg !210
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !211
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !212
  store i32 0, i32* %intTwo, align 4, !dbg !213
  br label %for.inc, !dbg !214

for.inc:                                          ; preds = %for.body
  %3 = load i64, i64* %i, align 8, !dbg !215
  %inc = add i64 %3, 1, !dbg !215
  store i64 %inc, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !216, !llvm.loop !217

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !219, metadata !DIExpression()), !dbg !221
  store i64 0, i64* %i2, align 8, !dbg !222
  br label %for.cond3, !dbg !224

for.cond3:                                        ; preds = %for.inc8, %for.end
  %4 = load i64, i64* %i2, align 8, !dbg !225
  %cmp4 = icmp ult i64 %4, 100, !dbg !227
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !228

for.body5:                                        ; preds = %for.cond3
  %5 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !229
  %6 = load i64, i64* %i2, align 8, !dbg !231
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %5, i64 %6, !dbg !229
  %7 = load i64, i64* %i2, align 8, !dbg !232
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !233
  %8 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !233
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !233
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %8, i8* align 8 %9, i64 8, i1 false), !dbg !233
  br label %for.inc8, !dbg !234

for.inc8:                                         ; preds = %for.body5
  %10 = load i64, i64* %i2, align 8, !dbg !235
  %inc9 = add i64 %10, 1, !dbg !235
  store i64 %inc9, i64* %i2, align 8, !dbg !235
  br label %for.cond3, !dbg !236, !llvm.loop !237

for.end10:                                        ; preds = %for.cond3
  %11 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !239
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %11, i64 0, !dbg !239
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !240
  ret void, !dbg !241
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!36 = !DILocation(line: 30, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !38, file: !12, line: 27, column: 5)
!38 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!39 = !DILocation(line: 30, column: 14, scope: !37)
!40 = !DILocalVariable(name: "source", scope: !41, file: !12, line: 33, type: !32)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!42 = !DILocation(line: 33, column: 23, scope: !41)
!43 = !DILocalVariable(name: "i", scope: !44, file: !12, line: 35, type: !45)
!44 = distinct !DILexicalBlock(scope: !41, file: !12, line: 34, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !48, line: 94, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 20, scope: !44)
!51 = !DILocation(line: 37, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !12, line: 37, column: 13)
!53 = !DILocation(line: 37, column: 18, scope: !52)
!54 = !DILocation(line: 37, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !12, line: 37, column: 13)
!56 = !DILocation(line: 37, column: 27, scope: !55)
!57 = !DILocation(line: 37, column: 13, scope: !52)
!58 = !DILocation(line: 39, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !12, line: 38, column: 13)
!60 = !DILocation(line: 39, column: 17, scope: !59)
!61 = !DILocation(line: 39, column: 27, scope: !59)
!62 = !DILocation(line: 39, column: 34, scope: !59)
!63 = !DILocation(line: 40, column: 24, scope: !59)
!64 = !DILocation(line: 40, column: 17, scope: !59)
!65 = !DILocation(line: 40, column: 27, scope: !59)
!66 = !DILocation(line: 40, column: 34, scope: !59)
!67 = !DILocation(line: 41, column: 13, scope: !59)
!68 = !DILocation(line: 37, column: 35, scope: !55)
!69 = !DILocation(line: 37, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 41, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocalVariable(name: "i", scope: !74, file: !12, line: 44, type: !45)
!74 = distinct !DILexicalBlock(scope: !41, file: !12, line: 43, column: 9)
!75 = !DILocation(line: 44, column: 20, scope: !74)
!76 = !DILocation(line: 46, column: 20, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !12, line: 46, column: 13)
!78 = !DILocation(line: 46, column: 18, scope: !77)
!79 = !DILocation(line: 46, column: 25, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !12, line: 46, column: 13)
!81 = !DILocation(line: 46, column: 27, scope: !80)
!82 = !DILocation(line: 46, column: 13, scope: !77)
!83 = !DILocation(line: 48, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !12, line: 47, column: 13)
!85 = !DILocation(line: 48, column: 22, scope: !84)
!86 = !DILocation(line: 48, column: 34, scope: !84)
!87 = !DILocation(line: 48, column: 27, scope: !84)
!88 = !DILocation(line: 49, column: 13, scope: !84)
!89 = !DILocation(line: 46, column: 35, scope: !80)
!90 = !DILocation(line: 46, column: 13, scope: !80)
!91 = distinct !{!91, !82, !92, !72}
!92 = !DILocation(line: 49, column: 13, scope: !77)
!93 = !DILocation(line: 50, column: 30, scope: !74)
!94 = !DILocation(line: 50, column: 13, scope: !74)
!95 = !DILocation(line: 53, column: 1, scope: !11)
!96 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_02_good", scope: !12, file: !12, line: 132, type: !13, scopeLine: 133, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!97 = !DILocation(line: 134, column: 5, scope: !96)
!98 = !DILocation(line: 135, column: 5, scope: !96)
!99 = !DILocation(line: 136, column: 1, scope: !96)
!100 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 148, type: !101, scopeLine: 149, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!101 = !DISubroutineType(types: !102)
!102 = !{!23, !23, !103}
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!106 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !12, line: 148, type: !23)
!107 = !DILocation(line: 148, column: 14, scope: !100)
!108 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !12, line: 148, type: !103)
!109 = !DILocation(line: 148, column: 27, scope: !100)
!110 = !DILocation(line: 151, column: 22, scope: !100)
!111 = !DILocation(line: 151, column: 12, scope: !100)
!112 = !DILocation(line: 151, column: 5, scope: !100)
!113 = !DILocation(line: 153, column: 5, scope: !100)
!114 = !DILocation(line: 154, column: 5, scope: !100)
!115 = !DILocation(line: 155, column: 5, scope: !100)
!116 = !DILocation(line: 158, column: 5, scope: !100)
!117 = !DILocation(line: 159, column: 5, scope: !100)
!118 = !DILocation(line: 160, column: 5, scope: !100)
!119 = !DILocation(line: 162, column: 5, scope: !100)
!120 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!121 = !DILocalVariable(name: "data", scope: !120, file: !12, line: 62, type: !17)
!122 = !DILocation(line: 62, column: 21, scope: !120)
!123 = !DILocalVariable(name: "dataBadBuffer", scope: !120, file: !12, line: 63, type: !27)
!124 = !DILocation(line: 63, column: 19, scope: !120)
!125 = !DILocalVariable(name: "dataGoodBuffer", scope: !120, file: !12, line: 64, type: !32)
!126 = !DILocation(line: 64, column: 19, scope: !120)
!127 = !DILocation(line: 73, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !129, file: !12, line: 71, column: 5)
!129 = distinct !DILexicalBlock(scope: !120, file: !12, line: 65, column: 8)
!130 = !DILocation(line: 73, column: 14, scope: !128)
!131 = !DILocalVariable(name: "source", scope: !132, file: !12, line: 76, type: !32)
!132 = distinct !DILexicalBlock(scope: !120, file: !12, line: 75, column: 5)
!133 = !DILocation(line: 76, column: 23, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !12, line: 78, type: !45)
!135 = distinct !DILexicalBlock(scope: !132, file: !12, line: 77, column: 9)
!136 = !DILocation(line: 78, column: 20, scope: !135)
!137 = !DILocation(line: 80, column: 20, scope: !138)
!138 = distinct !DILexicalBlock(scope: !135, file: !12, line: 80, column: 13)
!139 = !DILocation(line: 80, column: 18, scope: !138)
!140 = !DILocation(line: 80, column: 25, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !12, line: 80, column: 13)
!142 = !DILocation(line: 80, column: 27, scope: !141)
!143 = !DILocation(line: 80, column: 13, scope: !138)
!144 = !DILocation(line: 82, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !12, line: 81, column: 13)
!146 = !DILocation(line: 82, column: 17, scope: !145)
!147 = !DILocation(line: 82, column: 27, scope: !145)
!148 = !DILocation(line: 82, column: 34, scope: !145)
!149 = !DILocation(line: 83, column: 24, scope: !145)
!150 = !DILocation(line: 83, column: 17, scope: !145)
!151 = !DILocation(line: 83, column: 27, scope: !145)
!152 = !DILocation(line: 83, column: 34, scope: !145)
!153 = !DILocation(line: 84, column: 13, scope: !145)
!154 = !DILocation(line: 80, column: 35, scope: !141)
!155 = !DILocation(line: 80, column: 13, scope: !141)
!156 = distinct !{!156, !143, !157, !72}
!157 = !DILocation(line: 84, column: 13, scope: !138)
!158 = !DILocalVariable(name: "i", scope: !159, file: !12, line: 87, type: !45)
!159 = distinct !DILexicalBlock(scope: !132, file: !12, line: 86, column: 9)
!160 = !DILocation(line: 87, column: 20, scope: !159)
!161 = !DILocation(line: 89, column: 20, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 89, column: 13)
!163 = !DILocation(line: 89, column: 18, scope: !162)
!164 = !DILocation(line: 89, column: 25, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !12, line: 89, column: 13)
!166 = !DILocation(line: 89, column: 27, scope: !165)
!167 = !DILocation(line: 89, column: 13, scope: !162)
!168 = !DILocation(line: 91, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !12, line: 90, column: 13)
!170 = !DILocation(line: 91, column: 22, scope: !169)
!171 = !DILocation(line: 91, column: 34, scope: !169)
!172 = !DILocation(line: 91, column: 27, scope: !169)
!173 = !DILocation(line: 92, column: 13, scope: !169)
!174 = !DILocation(line: 89, column: 35, scope: !165)
!175 = !DILocation(line: 89, column: 13, scope: !165)
!176 = distinct !{!176, !167, !177, !72}
!177 = !DILocation(line: 92, column: 13, scope: !162)
!178 = !DILocation(line: 93, column: 30, scope: !159)
!179 = !DILocation(line: 93, column: 13, scope: !159)
!180 = !DILocation(line: 96, column: 1, scope: !120)
!181 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 99, type: !13, scopeLine: 100, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!182 = !DILocalVariable(name: "data", scope: !181, file: !12, line: 101, type: !17)
!183 = !DILocation(line: 101, column: 21, scope: !181)
!184 = !DILocalVariable(name: "dataBadBuffer", scope: !181, file: !12, line: 102, type: !27)
!185 = !DILocation(line: 102, column: 19, scope: !181)
!186 = !DILocalVariable(name: "dataGoodBuffer", scope: !181, file: !12, line: 103, type: !32)
!187 = !DILocation(line: 103, column: 19, scope: !181)
!188 = !DILocation(line: 107, column: 16, scope: !189)
!189 = distinct !DILexicalBlock(scope: !190, file: !12, line: 105, column: 5)
!190 = distinct !DILexicalBlock(scope: !181, file: !12, line: 104, column: 8)
!191 = !DILocation(line: 107, column: 14, scope: !189)
!192 = !DILocalVariable(name: "source", scope: !193, file: !12, line: 110, type: !32)
!193 = distinct !DILexicalBlock(scope: !181, file: !12, line: 109, column: 5)
!194 = !DILocation(line: 110, column: 23, scope: !193)
!195 = !DILocalVariable(name: "i", scope: !196, file: !12, line: 112, type: !45)
!196 = distinct !DILexicalBlock(scope: !193, file: !12, line: 111, column: 9)
!197 = !DILocation(line: 112, column: 20, scope: !196)
!198 = !DILocation(line: 114, column: 20, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !12, line: 114, column: 13)
!200 = !DILocation(line: 114, column: 18, scope: !199)
!201 = !DILocation(line: 114, column: 25, scope: !202)
!202 = distinct !DILexicalBlock(scope: !199, file: !12, line: 114, column: 13)
!203 = !DILocation(line: 114, column: 27, scope: !202)
!204 = !DILocation(line: 114, column: 13, scope: !199)
!205 = !DILocation(line: 116, column: 24, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !12, line: 115, column: 13)
!207 = !DILocation(line: 116, column: 17, scope: !206)
!208 = !DILocation(line: 116, column: 27, scope: !206)
!209 = !DILocation(line: 116, column: 34, scope: !206)
!210 = !DILocation(line: 117, column: 24, scope: !206)
!211 = !DILocation(line: 117, column: 17, scope: !206)
!212 = !DILocation(line: 117, column: 27, scope: !206)
!213 = !DILocation(line: 117, column: 34, scope: !206)
!214 = !DILocation(line: 118, column: 13, scope: !206)
!215 = !DILocation(line: 114, column: 35, scope: !202)
!216 = !DILocation(line: 114, column: 13, scope: !202)
!217 = distinct !{!217, !204, !218, !72}
!218 = !DILocation(line: 118, column: 13, scope: !199)
!219 = !DILocalVariable(name: "i", scope: !220, file: !12, line: 121, type: !45)
!220 = distinct !DILexicalBlock(scope: !193, file: !12, line: 120, column: 9)
!221 = !DILocation(line: 121, column: 20, scope: !220)
!222 = !DILocation(line: 123, column: 20, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !12, line: 123, column: 13)
!224 = !DILocation(line: 123, column: 18, scope: !223)
!225 = !DILocation(line: 123, column: 25, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !12, line: 123, column: 13)
!227 = !DILocation(line: 123, column: 27, scope: !226)
!228 = !DILocation(line: 123, column: 13, scope: !223)
!229 = !DILocation(line: 125, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !12, line: 124, column: 13)
!231 = !DILocation(line: 125, column: 22, scope: !230)
!232 = !DILocation(line: 125, column: 34, scope: !230)
!233 = !DILocation(line: 125, column: 27, scope: !230)
!234 = !DILocation(line: 126, column: 13, scope: !230)
!235 = !DILocation(line: 123, column: 35, scope: !226)
!236 = !DILocation(line: 123, column: 13, scope: !226)
!237 = distinct !{!237, !228, !238, !72}
!238 = !DILocation(line: 126, column: 13, scope: !223)
!239 = !DILocation(line: 127, column: 30, scope: !220)
!240 = !DILocation(line: 127, column: 13, scope: !220)
!241 = !DILocation(line: 130, column: 1, scope: !181)
