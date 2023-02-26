; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_bad() #0 !dbg !16 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !20, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !34, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @staticFive, align 4, !dbg !39
  %cmp = icmp eq i32 %0, 5, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !50, metadata !DIExpression()), !dbg !57
  store i64 0, i64* %i, align 8, !dbg !58
  br label %for.cond, !dbg !60

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !61
  %cmp1 = icmp ult i64 %1, 100, !dbg !63
  br i1 %cmp1, label %for.body, label %for.end, !dbg !64

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !65
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !67
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !68
  store i32 0, i32* %intOne, align 8, !dbg !69
  %3 = load i64, i64* %i, align 8, !dbg !70
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !71
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !72
  store i32 0, i32* %intTwo, align 4, !dbg !73
  br label %for.inc, !dbg !74

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !75
  %inc = add i64 %4, 1, !dbg !75
  store i64 %inc, i64* %i, align 8, !dbg !75
  br label %for.cond, !dbg !76, !llvm.loop !77

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !80, metadata !DIExpression()), !dbg !82
  store i64 0, i64* %i3, align 8, !dbg !83
  br label %for.cond4, !dbg !85

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !86
  %cmp5 = icmp ult i64 %5, 100, !dbg !88
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !89

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !90
  %7 = load i64, i64* %i3, align 8, !dbg !92
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !90
  %8 = load i64, i64* %i3, align 8, !dbg !93
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !94
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !94
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !94
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !94
  br label %for.inc9, !dbg !95

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !96
  %inc10 = add i64 %11, 1, !dbg !96
  store i64 %inc10, i64* %i3, align 8, !dbg !96
  br label %for.cond4, !dbg !97, !llvm.loop !98

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !100
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !100
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !101
  ret void, !dbg !102
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_good() #0 !dbg !103 {
entry:
  call void @goodG2B1(), !dbg !104
  call void @goodG2B2(), !dbg !105
  ret void, !dbg !106
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !107 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !113, metadata !DIExpression()), !dbg !114
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !115, metadata !DIExpression()), !dbg !116
  %call = call i64 @time(i64* noundef null), !dbg !117
  %conv = trunc i64 %call to i32, !dbg !118
  call void @srand(i32 noundef %conv), !dbg !119
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !120
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_good(), !dbg !121
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !122
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !123
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_bad(), !dbg !124
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !125
  ret i32 0, !dbg !126
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !127 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !132, metadata !DIExpression()), !dbg !133
  %0 = load i32, i32* @staticFive, align 4, !dbg !134
  %cmp = icmp ne i32 %0, 5, !dbg !136
  br i1 %cmp, label %if.then, label %if.else, !dbg !137

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !138
  br label %if.end, !dbg !140

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !141
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !143
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !144, metadata !DIExpression()), !dbg !146
  call void @llvm.dbg.declare(metadata i64* %i, metadata !147, metadata !DIExpression()), !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !153
  %cmp1 = icmp ult i64 %1, 100, !dbg !155
  br i1 %cmp1, label %for.body, label %for.end, !dbg !156

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !159
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !160
  store i32 0, i32* %intOne, align 8, !dbg !161
  %3 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !163
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !164
  store i32 0, i32* %intTwo, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %4, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !171, metadata !DIExpression()), !dbg !173
  store i64 0, i64* %i3, align 8, !dbg !174
  br label %for.cond4, !dbg !176

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !177
  %cmp5 = icmp ult i64 %5, 100, !dbg !179
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !180

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !181
  %7 = load i64, i64* %i3, align 8, !dbg !183
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !181
  %8 = load i64, i64* %i3, align 8, !dbg !184
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !185
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !185
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !185
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !185
  br label %for.inc9, !dbg !186

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !187
  %inc10 = add i64 %11, 1, !dbg !187
  store i64 %inc10, i64* %i3, align 8, !dbg !187
  br label %for.cond4, !dbg !188, !llvm.loop !189

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !191
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !191
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !192
  ret void, !dbg !193
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !194 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  %i3 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !195, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !199, metadata !DIExpression()), !dbg !200
  %0 = load i32, i32* @staticFive, align 4, !dbg !201
  %cmp = icmp eq i32 %0, 5, !dbg !203
  br i1 %cmp, label %if.then, label %if.end, !dbg !204

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !205
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !207
  br label %if.end, !dbg !208

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !209, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i64* %i, metadata !212, metadata !DIExpression()), !dbg !214
  store i64 0, i64* %i, align 8, !dbg !215
  br label %for.cond, !dbg !217

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !218
  %cmp1 = icmp ult i64 %1, 100, !dbg !220
  br i1 %cmp1, label %for.body, label %for.end, !dbg !221

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !222
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %2, !dbg !224
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !225
  store i32 0, i32* %intOne, align 8, !dbg !226
  %3 = load i64, i64* %i, align 8, !dbg !227
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !228
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !229
  store i32 0, i32* %intTwo, align 4, !dbg !230
  br label %for.inc, !dbg !231

for.inc:                                          ; preds = %for.body
  %4 = load i64, i64* %i, align 8, !dbg !232
  %inc = add i64 %4, 1, !dbg !232
  store i64 %inc, i64* %i, align 8, !dbg !232
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i3, metadata !236, metadata !DIExpression()), !dbg !238
  store i64 0, i64* %i3, align 8, !dbg !239
  br label %for.cond4, !dbg !241

for.cond4:                                        ; preds = %for.inc9, %for.end
  %5 = load i64, i64* %i3, align 8, !dbg !242
  %cmp5 = icmp ult i64 %5, 100, !dbg !244
  br i1 %cmp5, label %for.body6, label %for.end11, !dbg !245

for.body6:                                        ; preds = %for.cond4
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !246
  %7 = load i64, i64* %i3, align 8, !dbg !248
  %arrayidx7 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %6, i64 %7, !dbg !246
  %8 = load i64, i64* %i3, align 8, !dbg !249
  %arrayidx8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %8, !dbg !250
  %9 = bitcast %struct._twoIntsStruct* %arrayidx7 to i8*, !dbg !250
  %10 = bitcast %struct._twoIntsStruct* %arrayidx8 to i8*, !dbg !250
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %9, i8* align 8 %10, i64 8, i1 false), !dbg !250
  br label %for.inc9, !dbg !251

for.inc9:                                         ; preds = %for.body6
  %11 = load i64, i64* %i3, align 8, !dbg !252
  %inc10 = add i64 %11, 1, !dbg !252
  store i64 %inc10, i64* %i3, align 8, !dbg !252
  br label %for.cond4, !dbg !253, !llvm.loop !254

for.end11:                                        ; preds = %for.cond4
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !256
  %arrayidx12 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !256
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx12), !dbg !257
  ret void, !dbg !258
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !7, line: 23, type: !8, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0}
!7 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_bad", scope: !7, file: !7, line: 27, type: !17, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !{}
!20 = !DILocalVariable(name: "data", scope: !16, file: !7, line: 29, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !23, line: 100, baseType: !24)
!23 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !23, line: 96, size: 64, elements: !25)
!25 = !{!26, !27}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !24, file: !23, line: 98, baseType: !8, size: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !24, file: !23, line: 99, baseType: !8, size: 32, offset: 32)
!28 = !DILocation(line: 29, column: 21, scope: !16)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !7, line: 30, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 50)
!33 = !DILocation(line: 30, column: 19, scope: !16)
!34 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !7, line: 31, type: !35)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, size: 6400, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 100)
!38 = !DILocation(line: 31, column: 19, scope: !16)
!39 = !DILocation(line: 32, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !16, file: !7, line: 32, column: 8)
!41 = !DILocation(line: 32, column: 18, scope: !40)
!42 = !DILocation(line: 32, column: 8, scope: !16)
!43 = !DILocation(line: 36, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !7, line: 33, column: 5)
!45 = !DILocation(line: 36, column: 14, scope: !44)
!46 = !DILocation(line: 37, column: 5, scope: !44)
!47 = !DILocalVariable(name: "source", scope: !48, file: !7, line: 39, type: !35)
!48 = distinct !DILexicalBlock(scope: !16, file: !7, line: 38, column: 5)
!49 = !DILocation(line: 39, column: 23, scope: !48)
!50 = !DILocalVariable(name: "i", scope: !51, file: !7, line: 41, type: !52)
!51 = distinct !DILexicalBlock(scope: !48, file: !7, line: 40, column: 9)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !53, line: 31, baseType: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !55, line: 94, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!56 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 41, column: 20, scope: !51)
!58 = !DILocation(line: 43, column: 20, scope: !59)
!59 = distinct !DILexicalBlock(scope: !51, file: !7, line: 43, column: 13)
!60 = !DILocation(line: 43, column: 18, scope: !59)
!61 = !DILocation(line: 43, column: 25, scope: !62)
!62 = distinct !DILexicalBlock(scope: !59, file: !7, line: 43, column: 13)
!63 = !DILocation(line: 43, column: 27, scope: !62)
!64 = !DILocation(line: 43, column: 13, scope: !59)
!65 = !DILocation(line: 45, column: 24, scope: !66)
!66 = distinct !DILexicalBlock(scope: !62, file: !7, line: 44, column: 13)
!67 = !DILocation(line: 45, column: 17, scope: !66)
!68 = !DILocation(line: 45, column: 27, scope: !66)
!69 = !DILocation(line: 45, column: 34, scope: !66)
!70 = !DILocation(line: 46, column: 24, scope: !66)
!71 = !DILocation(line: 46, column: 17, scope: !66)
!72 = !DILocation(line: 46, column: 27, scope: !66)
!73 = !DILocation(line: 46, column: 34, scope: !66)
!74 = !DILocation(line: 47, column: 13, scope: !66)
!75 = !DILocation(line: 43, column: 35, scope: !62)
!76 = !DILocation(line: 43, column: 13, scope: !62)
!77 = distinct !{!77, !64, !78, !79}
!78 = !DILocation(line: 47, column: 13, scope: !59)
!79 = !{!"llvm.loop.mustprogress"}
!80 = !DILocalVariable(name: "i", scope: !81, file: !7, line: 50, type: !52)
!81 = distinct !DILexicalBlock(scope: !48, file: !7, line: 49, column: 9)
!82 = !DILocation(line: 50, column: 20, scope: !81)
!83 = !DILocation(line: 52, column: 20, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !7, line: 52, column: 13)
!85 = !DILocation(line: 52, column: 18, scope: !84)
!86 = !DILocation(line: 52, column: 25, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !7, line: 52, column: 13)
!88 = !DILocation(line: 52, column: 27, scope: !87)
!89 = !DILocation(line: 52, column: 13, scope: !84)
!90 = !DILocation(line: 54, column: 17, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !7, line: 53, column: 13)
!92 = !DILocation(line: 54, column: 22, scope: !91)
!93 = !DILocation(line: 54, column: 34, scope: !91)
!94 = !DILocation(line: 54, column: 27, scope: !91)
!95 = !DILocation(line: 55, column: 13, scope: !91)
!96 = !DILocation(line: 52, column: 35, scope: !87)
!97 = !DILocation(line: 52, column: 13, scope: !87)
!98 = distinct !{!98, !89, !99, !79}
!99 = !DILocation(line: 55, column: 13, scope: !84)
!100 = !DILocation(line: 56, column: 30, scope: !81)
!101 = !DILocation(line: 56, column: 13, scope: !81)
!102 = !DILocation(line: 59, column: 1, scope: !16)
!103 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_loop_07_good", scope: !7, file: !7, line: 138, type: !17, scopeLine: 139, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!104 = !DILocation(line: 140, column: 5, scope: !103)
!105 = !DILocation(line: 141, column: 5, scope: !103)
!106 = !DILocation(line: 142, column: 1, scope: !103)
!107 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 154, type: !108, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!108 = !DISubroutineType(types: !109)
!109 = !{!8, !8, !110}
!110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !111, size: 64)
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!112 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!113 = !DILocalVariable(name: "argc", arg: 1, scope: !107, file: !7, line: 154, type: !8)
!114 = !DILocation(line: 154, column: 14, scope: !107)
!115 = !DILocalVariable(name: "argv", arg: 2, scope: !107, file: !7, line: 154, type: !110)
!116 = !DILocation(line: 154, column: 27, scope: !107)
!117 = !DILocation(line: 157, column: 22, scope: !107)
!118 = !DILocation(line: 157, column: 12, scope: !107)
!119 = !DILocation(line: 157, column: 5, scope: !107)
!120 = !DILocation(line: 159, column: 5, scope: !107)
!121 = !DILocation(line: 160, column: 5, scope: !107)
!122 = !DILocation(line: 161, column: 5, scope: !107)
!123 = !DILocation(line: 164, column: 5, scope: !107)
!124 = !DILocation(line: 165, column: 5, scope: !107)
!125 = !DILocation(line: 166, column: 5, scope: !107)
!126 = !DILocation(line: 168, column: 5, scope: !107)
!127 = distinct !DISubprogram(name: "goodG2B1", scope: !7, file: !7, line: 66, type: !17, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!128 = !DILocalVariable(name: "data", scope: !127, file: !7, line: 68, type: !21)
!129 = !DILocation(line: 68, column: 21, scope: !127)
!130 = !DILocalVariable(name: "dataBadBuffer", scope: !127, file: !7, line: 69, type: !30)
!131 = !DILocation(line: 69, column: 19, scope: !127)
!132 = !DILocalVariable(name: "dataGoodBuffer", scope: !127, file: !7, line: 70, type: !35)
!133 = !DILocation(line: 70, column: 19, scope: !127)
!134 = !DILocation(line: 71, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !127, file: !7, line: 71, column: 8)
!136 = !DILocation(line: 71, column: 18, scope: !135)
!137 = !DILocation(line: 71, column: 8, scope: !127)
!138 = !DILocation(line: 74, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !7, line: 72, column: 5)
!140 = !DILocation(line: 75, column: 5, scope: !139)
!141 = !DILocation(line: 79, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !135, file: !7, line: 77, column: 5)
!143 = !DILocation(line: 79, column: 14, scope: !142)
!144 = !DILocalVariable(name: "source", scope: !145, file: !7, line: 82, type: !35)
!145 = distinct !DILexicalBlock(scope: !127, file: !7, line: 81, column: 5)
!146 = !DILocation(line: 82, column: 23, scope: !145)
!147 = !DILocalVariable(name: "i", scope: !148, file: !7, line: 84, type: !52)
!148 = distinct !DILexicalBlock(scope: !145, file: !7, line: 83, column: 9)
!149 = !DILocation(line: 84, column: 20, scope: !148)
!150 = !DILocation(line: 86, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !7, line: 86, column: 13)
!152 = !DILocation(line: 86, column: 18, scope: !151)
!153 = !DILocation(line: 86, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !7, line: 86, column: 13)
!155 = !DILocation(line: 86, column: 27, scope: !154)
!156 = !DILocation(line: 86, column: 13, scope: !151)
!157 = !DILocation(line: 88, column: 24, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !7, line: 87, column: 13)
!159 = !DILocation(line: 88, column: 17, scope: !158)
!160 = !DILocation(line: 88, column: 27, scope: !158)
!161 = !DILocation(line: 88, column: 34, scope: !158)
!162 = !DILocation(line: 89, column: 24, scope: !158)
!163 = !DILocation(line: 89, column: 17, scope: !158)
!164 = !DILocation(line: 89, column: 27, scope: !158)
!165 = !DILocation(line: 89, column: 34, scope: !158)
!166 = !DILocation(line: 90, column: 13, scope: !158)
!167 = !DILocation(line: 86, column: 35, scope: !154)
!168 = !DILocation(line: 86, column: 13, scope: !154)
!169 = distinct !{!169, !156, !170, !79}
!170 = !DILocation(line: 90, column: 13, scope: !151)
!171 = !DILocalVariable(name: "i", scope: !172, file: !7, line: 93, type: !52)
!172 = distinct !DILexicalBlock(scope: !145, file: !7, line: 92, column: 9)
!173 = !DILocation(line: 93, column: 20, scope: !172)
!174 = !DILocation(line: 95, column: 20, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !7, line: 95, column: 13)
!176 = !DILocation(line: 95, column: 18, scope: !175)
!177 = !DILocation(line: 95, column: 25, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !7, line: 95, column: 13)
!179 = !DILocation(line: 95, column: 27, scope: !178)
!180 = !DILocation(line: 95, column: 13, scope: !175)
!181 = !DILocation(line: 97, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !7, line: 96, column: 13)
!183 = !DILocation(line: 97, column: 22, scope: !182)
!184 = !DILocation(line: 97, column: 34, scope: !182)
!185 = !DILocation(line: 97, column: 27, scope: !182)
!186 = !DILocation(line: 98, column: 13, scope: !182)
!187 = !DILocation(line: 95, column: 35, scope: !178)
!188 = !DILocation(line: 95, column: 13, scope: !178)
!189 = distinct !{!189, !180, !190, !79}
!190 = !DILocation(line: 98, column: 13, scope: !175)
!191 = !DILocation(line: 99, column: 30, scope: !172)
!192 = !DILocation(line: 99, column: 13, scope: !172)
!193 = !DILocation(line: 102, column: 1, scope: !127)
!194 = distinct !DISubprogram(name: "goodG2B2", scope: !7, file: !7, line: 105, type: !17, scopeLine: 106, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !19)
!195 = !DILocalVariable(name: "data", scope: !194, file: !7, line: 107, type: !21)
!196 = !DILocation(line: 107, column: 21, scope: !194)
!197 = !DILocalVariable(name: "dataBadBuffer", scope: !194, file: !7, line: 108, type: !30)
!198 = !DILocation(line: 108, column: 19, scope: !194)
!199 = !DILocalVariable(name: "dataGoodBuffer", scope: !194, file: !7, line: 109, type: !35)
!200 = !DILocation(line: 109, column: 19, scope: !194)
!201 = !DILocation(line: 110, column: 8, scope: !202)
!202 = distinct !DILexicalBlock(scope: !194, file: !7, line: 110, column: 8)
!203 = !DILocation(line: 110, column: 18, scope: !202)
!204 = !DILocation(line: 110, column: 8, scope: !194)
!205 = !DILocation(line: 113, column: 16, scope: !206)
!206 = distinct !DILexicalBlock(scope: !202, file: !7, line: 111, column: 5)
!207 = !DILocation(line: 113, column: 14, scope: !206)
!208 = !DILocation(line: 114, column: 5, scope: !206)
!209 = !DILocalVariable(name: "source", scope: !210, file: !7, line: 116, type: !35)
!210 = distinct !DILexicalBlock(scope: !194, file: !7, line: 115, column: 5)
!211 = !DILocation(line: 116, column: 23, scope: !210)
!212 = !DILocalVariable(name: "i", scope: !213, file: !7, line: 118, type: !52)
!213 = distinct !DILexicalBlock(scope: !210, file: !7, line: 117, column: 9)
!214 = !DILocation(line: 118, column: 20, scope: !213)
!215 = !DILocation(line: 120, column: 20, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !7, line: 120, column: 13)
!217 = !DILocation(line: 120, column: 18, scope: !216)
!218 = !DILocation(line: 120, column: 25, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !7, line: 120, column: 13)
!220 = !DILocation(line: 120, column: 27, scope: !219)
!221 = !DILocation(line: 120, column: 13, scope: !216)
!222 = !DILocation(line: 122, column: 24, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !7, line: 121, column: 13)
!224 = !DILocation(line: 122, column: 17, scope: !223)
!225 = !DILocation(line: 122, column: 27, scope: !223)
!226 = !DILocation(line: 122, column: 34, scope: !223)
!227 = !DILocation(line: 123, column: 24, scope: !223)
!228 = !DILocation(line: 123, column: 17, scope: !223)
!229 = !DILocation(line: 123, column: 27, scope: !223)
!230 = !DILocation(line: 123, column: 34, scope: !223)
!231 = !DILocation(line: 124, column: 13, scope: !223)
!232 = !DILocation(line: 120, column: 35, scope: !219)
!233 = !DILocation(line: 120, column: 13, scope: !219)
!234 = distinct !{!234, !221, !235, !79}
!235 = !DILocation(line: 124, column: 13, scope: !216)
!236 = !DILocalVariable(name: "i", scope: !237, file: !7, line: 127, type: !52)
!237 = distinct !DILexicalBlock(scope: !210, file: !7, line: 126, column: 9)
!238 = !DILocation(line: 127, column: 20, scope: !237)
!239 = !DILocation(line: 129, column: 20, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !7, line: 129, column: 13)
!241 = !DILocation(line: 129, column: 18, scope: !240)
!242 = !DILocation(line: 129, column: 25, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !7, line: 129, column: 13)
!244 = !DILocation(line: 129, column: 27, scope: !243)
!245 = !DILocation(line: 129, column: 13, scope: !240)
!246 = !DILocation(line: 131, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !7, line: 130, column: 13)
!248 = !DILocation(line: 131, column: 22, scope: !247)
!249 = !DILocation(line: 131, column: 34, scope: !247)
!250 = !DILocation(line: 131, column: 27, scope: !247)
!251 = !DILocation(line: 132, column: 13, scope: !247)
!252 = !DILocation(line: 129, column: 35, scope: !243)
!253 = !DILocation(line: 129, column: 13, scope: !243)
!254 = distinct !{!254, !245, !255, !79}
!255 = !DILocation(line: 132, column: 13, scope: !240)
!256 = !DILocation(line: 133, column: 30, scope: !237)
!257 = !DILocation(line: 133, column: 13, scope: !237)
!258 = !DILocation(line: 136, column: 1, scope: !194)
