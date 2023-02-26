; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 400, align 16, !dbg !28
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !29
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 800, align 16, !dbg !32
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !33
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !31
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !34
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !51
  store i64 0, i64* %i, align 8, !dbg !52
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !55
  %cmp = icmp ult i64 %5, 100, !dbg !57
  br i1 %cmp, label %for.body, label %for.end, !dbg !58

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !61
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !62
  store i32 0, i32* %intOne, align 8, !dbg !63
  %7 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !65
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !66
  store i32 0, i32* %intTwo, align 4, !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !69
  %inc = add i64 %8, 1, !dbg !69
  store i64 %inc, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !74, metadata !DIExpression()), !dbg !76
  store i64 0, i64* %i2, align 8, !dbg !77
  br label %for.cond3, !dbg !79

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !80
  %cmp4 = icmp ult i64 %9, 100, !dbg !82
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !83

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !84
  %11 = load i64, i64* %i2, align 8, !dbg !86
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !84
  %12 = load i64, i64* %i2, align 8, !dbg !87
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !88
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !88
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !88
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !88
  br label %for.inc8, !dbg !89

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !90
  %inc9 = add i64 %15, 1, !dbg !90
  store i64 %inc9, i64* %i2, align 8, !dbg !90
  br label %for.cond3, !dbg !91, !llvm.loop !92

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !94
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !94
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06_good() #0 !dbg !97 {
entry:
  call void @goodG2B1(), !dbg !98
  call void @goodG2B2(), !dbg !99
  ret void, !dbg !100
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !101 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i64 @time(i64* noundef null), !dbg !111
  %conv = trunc i64 %call to i32, !dbg !112
  call void @srand(i32 noundef %conv), !dbg !113
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !114
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06_good(), !dbg !115
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !116
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !117
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06_bad(), !dbg !118
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !119
  ret i32 0, !dbg !120
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !121 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = alloca i8, i64 400, align 16, !dbg !126
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !127
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %2 = alloca i8, i64 800, align 16, !dbg !130
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !131
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !129
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !132
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !136, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %i, metadata !139, metadata !DIExpression()), !dbg !141
  store i64 0, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !144

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !145
  %cmp = icmp ult i64 %5, 100, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !149
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !151
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !152
  store i32 0, i32* %intOne, align 8, !dbg !153
  %7 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !155
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !156
  store i32 0, i32* %intTwo, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %8, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !163, metadata !DIExpression()), !dbg !165
  store i64 0, i64* %i2, align 8, !dbg !166
  br label %for.cond3, !dbg !168

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !169
  %cmp4 = icmp ult i64 %9, 100, !dbg !171
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !172

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !173
  %11 = load i64, i64* %i2, align 8, !dbg !175
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !173
  %12 = load i64, i64* %i2, align 8, !dbg !176
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !177
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !177
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !177
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !177
  br label %for.inc8, !dbg !178

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !179
  %inc9 = add i64 %15, 1, !dbg !179
  store i64 %inc9, i64* %i2, align 8, !dbg !179
  br label %for.cond3, !dbg !180, !llvm.loop !181

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !183
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !183
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !184
  ret void, !dbg !185
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !186 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca %struct._twoIntsStruct*, align 8
  %dataGoodBuffer = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i2 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !187, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataBadBuffer, metadata !189, metadata !DIExpression()), !dbg !190
  %0 = alloca i8, i64 400, align 16, !dbg !191
  %1 = bitcast i8* %0 to %struct._twoIntsStruct*, !dbg !192
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %dataBadBuffer, align 8, !dbg !190
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %dataGoodBuffer, metadata !193, metadata !DIExpression()), !dbg !194
  %2 = alloca i8, i64 800, align 16, !dbg !195
  %3 = bitcast i8* %2 to %struct._twoIntsStruct*, !dbg !196
  store %struct._twoIntsStruct* %3, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !194
  %4 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %dataGoodBuffer, align 8, !dbg !197
  store %struct._twoIntsStruct* %4, %struct._twoIntsStruct** %data, align 8, !dbg !200
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !201, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata i64* %i, metadata !204, metadata !DIExpression()), !dbg !206
  store i64 0, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !209

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, i64* %i, align 8, !dbg !210
  %cmp = icmp ult i64 %5, 100, !dbg !212
  br i1 %cmp, label %for.body, label %for.end, !dbg !213

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !214
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %6, !dbg !216
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !217
  store i32 0, i32* %intOne, align 8, !dbg !218
  %7 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx1 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %7, !dbg !220
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx1, i32 0, i32 1, !dbg !221
  store i32 0, i32* %intTwo, align 4, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !224
  %inc = add i64 %8, 1, !dbg !224
  store i64 %inc, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i2, metadata !228, metadata !DIExpression()), !dbg !230
  store i64 0, i64* %i2, align 8, !dbg !231
  br label %for.cond3, !dbg !233

for.cond3:                                        ; preds = %for.inc8, %for.end
  %9 = load i64, i64* %i2, align 8, !dbg !234
  %cmp4 = icmp ult i64 %9, 100, !dbg !236
  br i1 %cmp4, label %for.body5, label %for.end10, !dbg !237

for.body5:                                        ; preds = %for.cond3
  %10 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !238
  %11 = load i64, i64* %i2, align 8, !dbg !240
  %arrayidx6 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %10, i64 %11, !dbg !238
  %12 = load i64, i64* %i2, align 8, !dbg !241
  %arrayidx7 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %12, !dbg !242
  %13 = bitcast %struct._twoIntsStruct* %arrayidx6 to i8*, !dbg !242
  %14 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !242
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %13, i8* align 8 %14, i64 8, i1 false), !dbg !242
  br label %for.inc8, !dbg !243

for.inc8:                                         ; preds = %for.body5
  %15 = load i64, i64* %i2, align 8, !dbg !244
  %inc9 = add i64 %15, 1, !dbg !244
  store i64 %inc9, i64* %i2, align 8, !dbg !244
  br label %for.cond3, !dbg !245, !llvm.loop !246

for.end10:                                        ; preds = %for.cond3
  %16 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !248
  %arrayidx11 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %16, i64 0, !dbg !248
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx11), !dbg !249
  ret void, !dbg !250
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!19 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06_bad", scope: !20, file: !20, line: 25, type: !21, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!20 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 27, type: !3)
!25 = !DILocation(line: 27, column: 21, scope: !19)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !19, file: !20, line: 28, type: !3)
!27 = !DILocation(line: 28, column: 21, scope: !19)
!28 = !DILocation(line: 28, column: 54, scope: !19)
!29 = !DILocation(line: 28, column: 37, scope: !19)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !19, file: !20, line: 29, type: !3)
!31 = !DILocation(line: 29, column: 21, scope: !19)
!32 = !DILocation(line: 29, column: 55, scope: !19)
!33 = !DILocation(line: 29, column: 38, scope: !19)
!34 = !DILocation(line: 34, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !20, line: 31, column: 5)
!36 = distinct !DILexicalBlock(scope: !19, file: !20, line: 30, column: 8)
!37 = !DILocation(line: 34, column: 14, scope: !35)
!38 = !DILocalVariable(name: "source", scope: !39, file: !20, line: 37, type: !40)
!39 = distinct !DILexicalBlock(scope: !19, file: !20, line: 36, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 37, column: 23, scope: !39)
!44 = !DILocalVariable(name: "i", scope: !45, file: !20, line: 39, type: !46)
!45 = distinct !DILexicalBlock(scope: !39, file: !20, line: 38, column: 9)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !49, line: 94, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 39, column: 20, scope: !45)
!52 = !DILocation(line: 41, column: 20, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !20, line: 41, column: 13)
!54 = !DILocation(line: 41, column: 18, scope: !53)
!55 = !DILocation(line: 41, column: 25, scope: !56)
!56 = distinct !DILexicalBlock(scope: !53, file: !20, line: 41, column: 13)
!57 = !DILocation(line: 41, column: 27, scope: !56)
!58 = !DILocation(line: 41, column: 13, scope: !53)
!59 = !DILocation(line: 43, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !20, line: 42, column: 13)
!61 = !DILocation(line: 43, column: 17, scope: !60)
!62 = !DILocation(line: 43, column: 27, scope: !60)
!63 = !DILocation(line: 43, column: 34, scope: !60)
!64 = !DILocation(line: 44, column: 24, scope: !60)
!65 = !DILocation(line: 44, column: 17, scope: !60)
!66 = !DILocation(line: 44, column: 27, scope: !60)
!67 = !DILocation(line: 44, column: 34, scope: !60)
!68 = !DILocation(line: 45, column: 13, scope: !60)
!69 = !DILocation(line: 41, column: 35, scope: !56)
!70 = !DILocation(line: 41, column: 13, scope: !56)
!71 = distinct !{!71, !58, !72, !73}
!72 = !DILocation(line: 45, column: 13, scope: !53)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocalVariable(name: "i", scope: !75, file: !20, line: 48, type: !46)
!75 = distinct !DILexicalBlock(scope: !39, file: !20, line: 47, column: 9)
!76 = !DILocation(line: 48, column: 20, scope: !75)
!77 = !DILocation(line: 50, column: 20, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !20, line: 50, column: 13)
!79 = !DILocation(line: 50, column: 18, scope: !78)
!80 = !DILocation(line: 50, column: 25, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !20, line: 50, column: 13)
!82 = !DILocation(line: 50, column: 27, scope: !81)
!83 = !DILocation(line: 50, column: 13, scope: !78)
!84 = !DILocation(line: 52, column: 17, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !20, line: 51, column: 13)
!86 = !DILocation(line: 52, column: 22, scope: !85)
!87 = !DILocation(line: 52, column: 34, scope: !85)
!88 = !DILocation(line: 52, column: 27, scope: !85)
!89 = !DILocation(line: 53, column: 13, scope: !85)
!90 = !DILocation(line: 50, column: 35, scope: !81)
!91 = !DILocation(line: 50, column: 13, scope: !81)
!92 = distinct !{!92, !83, !93, !73}
!93 = !DILocation(line: 53, column: 13, scope: !78)
!94 = !DILocation(line: 54, column: 30, scope: !75)
!95 = !DILocation(line: 54, column: 13, scope: !75)
!96 = !DILocation(line: 57, column: 1, scope: !19)
!97 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_alloca_loop_06_good", scope: !20, file: !20, line: 136, type: !21, scopeLine: 137, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!98 = !DILocation(line: 138, column: 5, scope: !97)
!99 = !DILocation(line: 139, column: 5, scope: !97)
!100 = !DILocation(line: 140, column: 1, scope: !97)
!101 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 152, type: !102, scopeLine: 153, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!102 = !DISubroutineType(types: !103)
!103 = !{!9, !9, !104}
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!107 = !DILocalVariable(name: "argc", arg: 1, scope: !101, file: !20, line: 152, type: !9)
!108 = !DILocation(line: 152, column: 14, scope: !101)
!109 = !DILocalVariable(name: "argv", arg: 2, scope: !101, file: !20, line: 152, type: !104)
!110 = !DILocation(line: 152, column: 27, scope: !101)
!111 = !DILocation(line: 155, column: 22, scope: !101)
!112 = !DILocation(line: 155, column: 12, scope: !101)
!113 = !DILocation(line: 155, column: 5, scope: !101)
!114 = !DILocation(line: 157, column: 5, scope: !101)
!115 = !DILocation(line: 158, column: 5, scope: !101)
!116 = !DILocation(line: 159, column: 5, scope: !101)
!117 = !DILocation(line: 162, column: 5, scope: !101)
!118 = !DILocation(line: 163, column: 5, scope: !101)
!119 = !DILocation(line: 164, column: 5, scope: !101)
!120 = !DILocation(line: 166, column: 5, scope: !101)
!121 = distinct !DISubprogram(name: "goodG2B1", scope: !20, file: !20, line: 64, type: !21, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!122 = !DILocalVariable(name: "data", scope: !121, file: !20, line: 66, type: !3)
!123 = !DILocation(line: 66, column: 21, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !20, line: 67, type: !3)
!125 = !DILocation(line: 67, column: 21, scope: !121)
!126 = !DILocation(line: 67, column: 54, scope: !121)
!127 = !DILocation(line: 67, column: 37, scope: !121)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !20, line: 68, type: !3)
!129 = !DILocation(line: 68, column: 21, scope: !121)
!130 = !DILocation(line: 68, column: 55, scope: !121)
!131 = !DILocation(line: 68, column: 38, scope: !121)
!132 = !DILocation(line: 77, column: 16, scope: !133)
!133 = distinct !DILexicalBlock(scope: !134, file: !20, line: 75, column: 5)
!134 = distinct !DILexicalBlock(scope: !121, file: !20, line: 69, column: 8)
!135 = !DILocation(line: 77, column: 14, scope: !133)
!136 = !DILocalVariable(name: "source", scope: !137, file: !20, line: 80, type: !40)
!137 = distinct !DILexicalBlock(scope: !121, file: !20, line: 79, column: 5)
!138 = !DILocation(line: 80, column: 23, scope: !137)
!139 = !DILocalVariable(name: "i", scope: !140, file: !20, line: 82, type: !46)
!140 = distinct !DILexicalBlock(scope: !137, file: !20, line: 81, column: 9)
!141 = !DILocation(line: 82, column: 20, scope: !140)
!142 = !DILocation(line: 84, column: 20, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !20, line: 84, column: 13)
!144 = !DILocation(line: 84, column: 18, scope: !143)
!145 = !DILocation(line: 84, column: 25, scope: !146)
!146 = distinct !DILexicalBlock(scope: !143, file: !20, line: 84, column: 13)
!147 = !DILocation(line: 84, column: 27, scope: !146)
!148 = !DILocation(line: 84, column: 13, scope: !143)
!149 = !DILocation(line: 86, column: 24, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !20, line: 85, column: 13)
!151 = !DILocation(line: 86, column: 17, scope: !150)
!152 = !DILocation(line: 86, column: 27, scope: !150)
!153 = !DILocation(line: 86, column: 34, scope: !150)
!154 = !DILocation(line: 87, column: 24, scope: !150)
!155 = !DILocation(line: 87, column: 17, scope: !150)
!156 = !DILocation(line: 87, column: 27, scope: !150)
!157 = !DILocation(line: 87, column: 34, scope: !150)
!158 = !DILocation(line: 88, column: 13, scope: !150)
!159 = !DILocation(line: 84, column: 35, scope: !146)
!160 = !DILocation(line: 84, column: 13, scope: !146)
!161 = distinct !{!161, !148, !162, !73}
!162 = !DILocation(line: 88, column: 13, scope: !143)
!163 = !DILocalVariable(name: "i", scope: !164, file: !20, line: 91, type: !46)
!164 = distinct !DILexicalBlock(scope: !137, file: !20, line: 90, column: 9)
!165 = !DILocation(line: 91, column: 20, scope: !164)
!166 = !DILocation(line: 93, column: 20, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !20, line: 93, column: 13)
!168 = !DILocation(line: 93, column: 18, scope: !167)
!169 = !DILocation(line: 93, column: 25, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !20, line: 93, column: 13)
!171 = !DILocation(line: 93, column: 27, scope: !170)
!172 = !DILocation(line: 93, column: 13, scope: !167)
!173 = !DILocation(line: 95, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !20, line: 94, column: 13)
!175 = !DILocation(line: 95, column: 22, scope: !174)
!176 = !DILocation(line: 95, column: 34, scope: !174)
!177 = !DILocation(line: 95, column: 27, scope: !174)
!178 = !DILocation(line: 96, column: 13, scope: !174)
!179 = !DILocation(line: 93, column: 35, scope: !170)
!180 = !DILocation(line: 93, column: 13, scope: !170)
!181 = distinct !{!181, !172, !182, !73}
!182 = !DILocation(line: 96, column: 13, scope: !167)
!183 = !DILocation(line: 97, column: 30, scope: !164)
!184 = !DILocation(line: 97, column: 13, scope: !164)
!185 = !DILocation(line: 100, column: 1, scope: !121)
!186 = distinct !DISubprogram(name: "goodG2B2", scope: !20, file: !20, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !23)
!187 = !DILocalVariable(name: "data", scope: !186, file: !20, line: 105, type: !3)
!188 = !DILocation(line: 105, column: 21, scope: !186)
!189 = !DILocalVariable(name: "dataBadBuffer", scope: !186, file: !20, line: 106, type: !3)
!190 = !DILocation(line: 106, column: 21, scope: !186)
!191 = !DILocation(line: 106, column: 54, scope: !186)
!192 = !DILocation(line: 106, column: 37, scope: !186)
!193 = !DILocalVariable(name: "dataGoodBuffer", scope: !186, file: !20, line: 107, type: !3)
!194 = !DILocation(line: 107, column: 21, scope: !186)
!195 = !DILocation(line: 107, column: 55, scope: !186)
!196 = !DILocation(line: 107, column: 38, scope: !186)
!197 = !DILocation(line: 111, column: 16, scope: !198)
!198 = distinct !DILexicalBlock(scope: !199, file: !20, line: 109, column: 5)
!199 = distinct !DILexicalBlock(scope: !186, file: !20, line: 108, column: 8)
!200 = !DILocation(line: 111, column: 14, scope: !198)
!201 = !DILocalVariable(name: "source", scope: !202, file: !20, line: 114, type: !40)
!202 = distinct !DILexicalBlock(scope: !186, file: !20, line: 113, column: 5)
!203 = !DILocation(line: 114, column: 23, scope: !202)
!204 = !DILocalVariable(name: "i", scope: !205, file: !20, line: 116, type: !46)
!205 = distinct !DILexicalBlock(scope: !202, file: !20, line: 115, column: 9)
!206 = !DILocation(line: 116, column: 20, scope: !205)
!207 = !DILocation(line: 118, column: 20, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !20, line: 118, column: 13)
!209 = !DILocation(line: 118, column: 18, scope: !208)
!210 = !DILocation(line: 118, column: 25, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !20, line: 118, column: 13)
!212 = !DILocation(line: 118, column: 27, scope: !211)
!213 = !DILocation(line: 118, column: 13, scope: !208)
!214 = !DILocation(line: 120, column: 24, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !20, line: 119, column: 13)
!216 = !DILocation(line: 120, column: 17, scope: !215)
!217 = !DILocation(line: 120, column: 27, scope: !215)
!218 = !DILocation(line: 120, column: 34, scope: !215)
!219 = !DILocation(line: 121, column: 24, scope: !215)
!220 = !DILocation(line: 121, column: 17, scope: !215)
!221 = !DILocation(line: 121, column: 27, scope: !215)
!222 = !DILocation(line: 121, column: 34, scope: !215)
!223 = !DILocation(line: 122, column: 13, scope: !215)
!224 = !DILocation(line: 118, column: 35, scope: !211)
!225 = !DILocation(line: 118, column: 13, scope: !211)
!226 = distinct !{!226, !213, !227, !73}
!227 = !DILocation(line: 122, column: 13, scope: !208)
!228 = !DILocalVariable(name: "i", scope: !229, file: !20, line: 125, type: !46)
!229 = distinct !DILexicalBlock(scope: !202, file: !20, line: 124, column: 9)
!230 = !DILocation(line: 125, column: 20, scope: !229)
!231 = !DILocation(line: 127, column: 20, scope: !232)
!232 = distinct !DILexicalBlock(scope: !229, file: !20, line: 127, column: 13)
!233 = !DILocation(line: 127, column: 18, scope: !232)
!234 = !DILocation(line: 127, column: 25, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !20, line: 127, column: 13)
!236 = !DILocation(line: 127, column: 27, scope: !235)
!237 = !DILocation(line: 127, column: 13, scope: !232)
!238 = !DILocation(line: 129, column: 17, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !20, line: 128, column: 13)
!240 = !DILocation(line: 129, column: 22, scope: !239)
!241 = !DILocation(line: 129, column: 34, scope: !239)
!242 = !DILocation(line: 129, column: 27, scope: !239)
!243 = !DILocation(line: 130, column: 13, scope: !239)
!244 = !DILocation(line: 127, column: 35, scope: !235)
!245 = !DILocation(line: 127, column: 13, scope: !235)
!246 = distinct !{!246, !237, !247, !73}
!247 = !DILocation(line: 130, column: 13, scope: !232)
!248 = !DILocation(line: 131, column: 30, scope: !229)
!249 = !DILocation(line: 131, column: 13, scope: !229)
!250 = !DILocation(line: 134, column: 1, scope: !186)
