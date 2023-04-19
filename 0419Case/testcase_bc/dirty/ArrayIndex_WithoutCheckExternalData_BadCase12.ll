; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/dirty/ArrayIndex_WithoutCheckExternalData_BadCase12.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/dirty/ArrayIndex_WithoutCheckExternalData_BadCase12.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.test_bad_04.arr = private unnamed_addr constant [6 x i8] c"12345\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_01(i8* noundef %pValue) #0 !dbg !11 {
entry:
  %pValue.addr = alloca i8*, align 8
  %pOut = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  %ulLen = alloca i32, align 4
  store i8* %pValue, i8** %pValue.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pValue.addr, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %pOut, metadata !21, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32* %ulLen, metadata !26, metadata !DIExpression()), !dbg !28
  store i32 0, i32* %ulLen, align 4, !dbg !28
  %0 = load i8*, i8** %pValue.addr, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 1, !dbg !30
  store i8* %add.ptr, i8** %ptr, align 8, !dbg !31
  br label %while.cond, !dbg !32

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i8*, i8** %ptr, align 8, !dbg !33
  %2 = load i8, i8* %1, align 1, !dbg !34
  %conv = sext i8 %2 to i32, !dbg !34
  %cmp = icmp ne i32 %conv, 34, !dbg !35
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !36

land.rhs:                                         ; preds = %while.cond
  %3 = load i8*, i8** %ptr, align 8, !dbg !37
  %4 = load i8, i8* %3, align 1, !dbg !38
  %conv2 = sext i8 %4 to i32, !dbg !38
  %tobool = icmp ne i32 %conv2, 0, !dbg !36
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %5 = phi i1 [ false, %while.cond ], [ %tobool, %land.rhs ], !dbg !39
  br i1 %5, label %while.body, label %while.end, !dbg !32

while.body:                                       ; preds = %land.end
  %6 = load i32, i32* %ulLen, align 4, !dbg !40
  %inc = add nsw i32 %6, 1, !dbg !40
  store i32 %inc, i32* %ulLen, align 4, !dbg !40
  %7 = load i8*, i8** %ptr, align 8, !dbg !42
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1, !dbg !42
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !42
  %8 = load i8, i8* %7, align 1, !dbg !44
  %conv3 = sext i8 %8 to i32, !dbg !44
  %cmp4 = icmp eq i32 %conv3, 92, !dbg !45
  br i1 %cmp4, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %while.body
  %9 = load i8*, i8** %ptr, align 8, !dbg !47
  %incdec.ptr6 = getelementptr inbounds i8, i8* %9, i32 1, !dbg !47
  store i8* %incdec.ptr6, i8** %ptr, align 8, !dbg !47
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond, !dbg !32, !llvm.loop !50

while.end:                                        ; preds = %land.end
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_02(i8* noundef %pValue) #0 !dbg !54 {
entry:
  %pValue.addr = alloca i8*, align 8
  %pOut = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  %ulLen = alloca i32, align 4
  store i8* %pValue, i8** %pValue.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pValue.addr, metadata !55, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i8** %pOut, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !59, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %ulLen, metadata !61, metadata !DIExpression()), !dbg !62
  store i32 0, i32* %ulLen, align 4, !dbg !62
  %0 = load i8*, i8** %pValue.addr, align 8, !dbg !63
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 1, !dbg !64
  store i8* %add.ptr, i8** %ptr, align 8, !dbg !65
  br label %while.cond, !dbg !66

while.cond:                                       ; preds = %if.end10, %entry
  %1 = load i8*, i8** %ptr, align 8, !dbg !67
  %2 = load i8, i8* %1, align 1, !dbg !68
  %conv = sext i8 %2 to i32, !dbg !68
  %cmp = icmp ne i32 %conv, 34, !dbg !69
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !70

land.rhs:                                         ; preds = %while.cond
  %3 = load i8*, i8** %ptr, align 8, !dbg !71
  %4 = load i8, i8* %3, align 1, !dbg !72
  %conv2 = sext i8 %4 to i32, !dbg !72
  %tobool = icmp ne i32 %conv2, 0, !dbg !70
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %5 = phi i1 [ false, %while.cond ], [ %tobool, %land.rhs ], !dbg !73
  br i1 %5, label %while.body, label %while.end, !dbg !66

while.body:                                       ; preds = %land.end
  %6 = load i32, i32* %ulLen, align 4, !dbg !74
  %inc = add nsw i32 %6, 1, !dbg !74
  store i32 %inc, i32* %ulLen, align 4, !dbg !74
  %7 = load i8*, i8** %ptr, align 8, !dbg !76
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1, !dbg !76
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !76
  %8 = load i8, i8* %7, align 1, !dbg !78
  %conv3 = sext i8 %8 to i32, !dbg !78
  %cmp4 = icmp eq i32 %conv3, 92, !dbg !79
  br i1 %cmp4, label %if.then, label %if.end10, !dbg !80

if.then:                                          ; preds = %while.body
  %9 = load i8*, i8** %ptr, align 8, !dbg !81
  %10 = load i8, i8* %9, align 1, !dbg !84
  %tobool6 = icmp ne i8 %10, 0, !dbg !84
  br i1 %tobool6, label %if.then7, label %if.end, !dbg !85

if.then7:                                         ; preds = %if.then
  %11 = load i8*, i8** %ptr, align 8, !dbg !86
  %incdec.ptr8 = getelementptr inbounds i8, i8* %11, i32 1, !dbg !86
  store i8* %incdec.ptr8, i8** %ptr, align 8, !dbg !86
  br label %if.end, !dbg !88

if.end:                                           ; preds = %if.then7, %if.then
  %12 = load i8*, i8** %ptr, align 8, !dbg !89
  %incdec.ptr9 = getelementptr inbounds i8, i8* %12, i32 1, !dbg !89
  store i8* %incdec.ptr9, i8** %ptr, align 8, !dbg !89
  br label %if.end10, !dbg !90

if.end10:                                         ; preds = %if.end, %while.body
  br label %while.cond, !dbg !66, !llvm.loop !91

while.end:                                        ; preds = %land.end
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_03(i8* noundef %pValue) #0 !dbg !94 {
entry:
  %pValue.addr = alloca i8*, align 8
  %pOut = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  store i8* %pValue, i8** %pValue.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pValue.addr, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i8** %pOut, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = load i8*, i8** %pValue.addr, align 8, !dbg !101
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 1, !dbg !102
  store i8* %add.ptr, i8** %ptr, align 8, !dbg !103
  br label %while.cond, !dbg !104

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i8*, i8** %pValue.addr, align 8, !dbg !105
  %2 = load i8, i8* %1, align 1, !dbg !106
  %conv = sext i8 %2 to i32, !dbg !106
  %cmp = icmp ne i32 %conv, 34, !dbg !107
  br i1 %cmp, label %while.body, label %while.end, !dbg !104

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %pValue.addr, align 8, !dbg !108
  %4 = load i8, i8* %3, align 1, !dbg !111
  %conv2 = sext i8 %4 to i32, !dbg !111
  %cmp3 = icmp ne i32 %conv2, 92, !dbg !112
  br i1 %cmp3, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %while.body
  %5 = load i8*, i8** %pValue.addr, align 8, !dbg !114
  %incdec.ptr = getelementptr inbounds i8, i8* %5, i32 1, !dbg !114
  store i8* %incdec.ptr, i8** %pValue.addr, align 8, !dbg !114
  %6 = load i8, i8* %5, align 1, !dbg !116
  %7 = load i8*, i8** %pOut, align 8, !dbg !117
  %incdec.ptr5 = getelementptr inbounds i8, i8* %7, i32 1, !dbg !117
  store i8* %incdec.ptr5, i8** %pOut, align 8, !dbg !117
  store i8 %6, i8* %7, align 1, !dbg !118
  br label %if.end, !dbg !119

if.else:                                          ; preds = %while.body
  %8 = load i8*, i8** %pValue.addr, align 8, !dbg !120
  %incdec.ptr6 = getelementptr inbounds i8, i8* %8, i32 1, !dbg !120
  store i8* %incdec.ptr6, i8** %pValue.addr, align 8, !dbg !120
  %9 = load i8*, i8** %pValue.addr, align 8, !dbg !122
  %10 = load i8, i8* %9, align 1, !dbg !123
  %conv7 = sext i8 %10 to i32, !dbg !123
  switch i32 %conv7, label %sw.epilog [
    i32 117, label %sw.bb
  ], !dbg !124

sw.bb:                                            ; preds = %if.else
  br label %while.end, !dbg !125

sw.epilog:                                        ; preds = %if.else
  br label %if.end

if.end:                                           ; preds = %sw.epilog, %if.then
  br label %while.cond, !dbg !104, !llvm.loop !127

while.end:                                        ; preds = %sw.bb, %while.cond
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_04() #0 !dbg !130 {
entry:
  %ptr = alloca i8*, align 8
  %arr = alloca [6 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [6 x i8]* %arr, metadata !135, metadata !DIExpression()), !dbg !139
  %0 = bitcast [6 x i8]* %arr to i8*, !dbg !139
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %0, i8* align 1 getelementptr inbounds ([6 x i8], [6 x i8]* @__const.test_bad_04.arr, i32 0, i32 0), i64 6, i1 false), !dbg !139
  %arraydecay = getelementptr inbounds [6 x i8], [6 x i8]* %arr, i64 0, i64 0, !dbg !140
  store i8* %arraydecay, i8** %ptr, align 8, !dbg !141
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8*, i8** %ptr, align 8, !dbg !143
  %cmp = icmp ne i8* %1, null, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %ptr, align 8, !dbg !148
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1, !dbg !148
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !148
  %3 = load i8, i8* %2, align 1, !dbg !151
  %conv = sext i8 %3 to i32, !dbg !151
  %cmp1 = icmp eq i32 %conv, 5, !dbg !152
  br i1 %cmp1, label %if.then, label %if.end, !dbg !153

if.then:                                          ; preds = %for.body
  %4 = load i8*, i8** %ptr, align 8, !dbg !154
  %incdec.ptr3 = getelementptr inbounds i8, i8* %4, i32 1, !dbg !154
  store i8* %incdec.ptr3, i8** %ptr, align 8, !dbg !154
  br label %if.end, !dbg !156

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %if.end
  %5 = load i8*, i8** %ptr, align 8, !dbg !158
  %incdec.ptr4 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !158
  store i8* %incdec.ptr4, i8** %ptr, align 8, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  ret void, !dbg !162
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_05(i8* noundef %pValue) #0 !dbg !163 {
entry:
  %pValue.addr = alloca i8*, align 8
  %pOut = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  store i8* %pValue, i8** %pValue.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pValue.addr, metadata !164, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata i8** %pOut, metadata !166, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !168, metadata !DIExpression()), !dbg !169
  %0 = load i8*, i8** %pValue.addr, align 8, !dbg !170
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 1, !dbg !171
  store i8* %add.ptr, i8** %ptr, align 8, !dbg !172
  br label %do.body, !dbg !173

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i8*, i8** %pValue.addr, align 8, !dbg !174
  %2 = load i8, i8* %1, align 1, !dbg !177
  %conv = sext i8 %2 to i32, !dbg !177
  %cmp = icmp ne i32 %conv, 92, !dbg !178
  br i1 %cmp, label %if.then, label %if.else, !dbg !179

if.then:                                          ; preds = %do.body
  %3 = load i8*, i8** %pValue.addr, align 8, !dbg !180
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !180
  store i8* %incdec.ptr, i8** %pValue.addr, align 8, !dbg !180
  %4 = load i8, i8* %3, align 1, !dbg !182
  %5 = load i8*, i8** %pOut, align 8, !dbg !183
  %incdec.ptr2 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !183
  store i8* %incdec.ptr2, i8** %pOut, align 8, !dbg !183
  store i8 %4, i8* %5, align 1, !dbg !184
  br label %if.end, !dbg !185

if.else:                                          ; preds = %do.body
  %6 = load i8*, i8** %pValue.addr, align 8, !dbg !186
  %incdec.ptr3 = getelementptr inbounds i8, i8* %6, i32 1, !dbg !186
  store i8* %incdec.ptr3, i8** %pValue.addr, align 8, !dbg !186
  %7 = load i8*, i8** %pValue.addr, align 8, !dbg !188
  %8 = load i8, i8* %7, align 1, !dbg !189
  %conv4 = sext i8 %8 to i32, !dbg !189
  switch i32 %conv4, label %sw.epilog [
    i32 117, label %sw.bb
  ], !dbg !190

sw.bb:                                            ; preds = %if.else
  br label %do.end, !dbg !191

sw.epilog:                                        ; preds = %if.else
  br label %if.end

if.end:                                           ; preds = %sw.epilog, %if.then
  br label %do.cond, !dbg !193

do.cond:                                          ; preds = %if.end
  %9 = load i8*, i8** %pValue.addr, align 8, !dbg !194
  %10 = load i8, i8* %9, align 1, !dbg !195
  %conv5 = sext i8 %10 to i32, !dbg !195
  %cmp6 = icmp ne i32 %conv5, 34, !dbg !196
  br i1 %cmp6, label %do.body, label %do.end, !dbg !193, !llvm.loop !197

do.end:                                           ; preds = %do.cond, %sw.bb
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_06(i8* noundef %pValue) #0 !dbg !200 {
entry:
  %pValue.addr = alloca i8*, align 8
  %pOut = alloca i8*, align 8
  %ptr = alloca i8*, align 8
  %ulLen = alloca i32, align 4
  store i8* %pValue, i8** %pValue.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %pValue.addr, metadata !201, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata i8** %pOut, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i8** %ptr, metadata !205, metadata !DIExpression()), !dbg !206
  call void @llvm.dbg.declare(metadata i32* %ulLen, metadata !207, metadata !DIExpression()), !dbg !208
  store i32 0, i32* %ulLen, align 4, !dbg !208
  %0 = load i8*, i8** %pValue.addr, align 8, !dbg !209
  %add.ptr = getelementptr inbounds i8, i8* %0, i64 1, !dbg !210
  store i8* %add.ptr, i8** %ptr, align 8, !dbg !211
  br label %while.cond, !dbg !212

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i8*, i8** %ptr, align 8, !dbg !213
  %2 = load i8, i8* %1, align 1, !dbg !214
  %conv = sext i8 %2 to i32, !dbg !214
  %cmp = icmp ne i32 %conv, 34, !dbg !215
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !216

land.rhs:                                         ; preds = %while.cond
  %3 = load i8*, i8** %ptr, align 8, !dbg !217
  %4 = load i8, i8* %3, align 1, !dbg !218
  %conv2 = sext i8 %4 to i32, !dbg !218
  %tobool = icmp ne i32 %conv2, 0, !dbg !216
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %5 = phi i1 [ false, %while.cond ], [ %tobool, %land.rhs ], !dbg !219
  br i1 %5, label %while.body, label %while.end, !dbg !212

while.body:                                       ; preds = %land.end
  %6 = load i32, i32* %ulLen, align 4, !dbg !220
  %inc = add nsw i32 %6, 1, !dbg !220
  store i32 %inc, i32* %ulLen, align 4, !dbg !220
  %7 = load i8*, i8** %ptr, align 8, !dbg !222
  %incdec.ptr = getelementptr inbounds i8, i8* %7, i32 1, !dbg !222
  store i8* %incdec.ptr, i8** %ptr, align 8, !dbg !222
  %8 = load i8, i8* %7, align 1, !dbg !224
  %conv3 = sext i8 %8 to i32, !dbg !224
  %cmp4 = icmp eq i32 %conv3, 92, !dbg !225
  br i1 %cmp4, label %if.then, label %if.end, !dbg !226

if.then:                                          ; preds = %while.body
  %9 = load i8*, i8** %ptr, align 8, !dbg !227
  %incdec.ptr6 = getelementptr inbounds i8, i8* %9, i32 1, !dbg !227
  store i8* %incdec.ptr6, i8** %ptr, align 8, !dbg !227
  br label %if.end, !dbg !229

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond, !dbg !212, !llvm.loop !230

while.end:                                        ; preds = %land.end
  br label %while.cond7, !dbg !232

while.cond7:                                      ; preds = %if.end20, %while.end
  %10 = load i8*, i8** %pValue.addr, align 8, !dbg !233
  %11 = load i8, i8* %10, align 1, !dbg !234
  %conv8 = sext i8 %11 to i32, !dbg !234
  %cmp9 = icmp ne i32 %conv8, 34, !dbg !235
  br i1 %cmp9, label %while.body11, label %while.end21, !dbg !232

while.body11:                                     ; preds = %while.cond7
  %12 = load i8*, i8** %pValue.addr, align 8, !dbg !236
  %13 = load i8, i8* %12, align 1, !dbg !239
  %conv12 = sext i8 %13 to i32, !dbg !239
  %cmp13 = icmp ne i32 %conv12, 92, !dbg !240
  br i1 %cmp13, label %if.then15, label %if.else, !dbg !241

if.then15:                                        ; preds = %while.body11
  %14 = load i8*, i8** %pValue.addr, align 8, !dbg !242
  %incdec.ptr16 = getelementptr inbounds i8, i8* %14, i32 1, !dbg !242
  store i8* %incdec.ptr16, i8** %pValue.addr, align 8, !dbg !242
  %15 = load i8, i8* %14, align 1, !dbg !244
  %16 = load i8*, i8** %pOut, align 8, !dbg !245
  %incdec.ptr17 = getelementptr inbounds i8, i8* %16, i32 1, !dbg !245
  store i8* %incdec.ptr17, i8** %pOut, align 8, !dbg !245
  store i8 %15, i8* %16, align 1, !dbg !246
  br label %if.end20, !dbg !247

if.else:                                          ; preds = %while.body11
  %17 = load i8*, i8** %pValue.addr, align 8, !dbg !248
  %incdec.ptr18 = getelementptr inbounds i8, i8* %17, i32 1, !dbg !248
  store i8* %incdec.ptr18, i8** %pValue.addr, align 8, !dbg !248
  %18 = load i8*, i8** %pValue.addr, align 8, !dbg !250
  %19 = load i8, i8* %18, align 1, !dbg !251
  %conv19 = sext i8 %19 to i32, !dbg !251
  switch i32 %conv19, label %sw.epilog [
    i32 117, label %sw.bb
  ], !dbg !252

sw.bb:                                            ; preds = %if.else
  br label %while.end21, !dbg !253

sw.epilog:                                        ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %sw.epilog, %if.then15
  br label %while.cond7, !dbg !232, !llvm.loop !255

while.end21:                                      ; preds = %sw.bb, %while.cond7
  ret void, !dbg !257
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test_bad_07() #0 !dbg !258 {
entry:
  %pcTmp = alloca i8*, align 8
  %pcStrOut = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %pcTmp, metadata !259, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.declare(metadata i8** %pcStrOut, metadata !261, metadata !DIExpression()), !dbg !262
  br label %while.cond, !dbg !263

while.cond:                                       ; preds = %if.end24, %entry
  %0 = load i8*, i8** %pcTmp, align 8, !dbg !264
  %1 = load i8, i8* %0, align 1, !dbg !265
  %conv = sext i8 %1 to i32, !dbg !265
  %cmp = icmp ne i32 %conv, 32, !dbg !266
  br i1 %cmp, label %while.body, label %while.end25, !dbg !263

while.body:                                       ; preds = %while.cond
  %2 = load i8*, i8** %pcTmp, align 8, !dbg !267
  %3 = load i8, i8* %2, align 1, !dbg !270
  %conv2 = sext i8 %3 to i32, !dbg !270
  %cmp3 = icmp eq i32 %conv2, 34, !dbg !271
  br i1 %cmp3, label %if.then, label %if.else, !dbg !272

if.then:                                          ; preds = %while.body
  br label %while.cond5, !dbg !273

while.cond5:                                      ; preds = %while.body9, %if.then
  %4 = load i8*, i8** %pcTmp, align 8, !dbg !275
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1, !dbg !275
  store i8* %incdec.ptr, i8** %pcTmp, align 8, !dbg !275
  %5 = load i8, i8* %incdec.ptr, align 1, !dbg !276
  %conv6 = sext i8 %5 to i32, !dbg !276
  %cmp7 = icmp eq i32 %conv6, 32, !dbg !277
  br i1 %cmp7, label %while.body9, label %while.end, !dbg !273

while.body9:                                      ; preds = %while.cond5
  br label %while.cond5, !dbg !273, !llvm.loop !278

while.end:                                        ; preds = %while.cond5
  br label %if.end24, !dbg !280

if.else:                                          ; preds = %while.body
  %6 = load i8*, i8** %pcTmp, align 8, !dbg !281
  %7 = load i8, i8* %6, align 1, !dbg !283
  %conv10 = sext i8 %7 to i32, !dbg !283
  %cmp11 = icmp ne i32 %conv10, 32, !dbg !284
  br i1 %cmp11, label %if.then13, label %if.else16, !dbg !285

if.then13:                                        ; preds = %if.else
  %8 = load i8*, i8** %pcTmp, align 8, !dbg !286
  %incdec.ptr14 = getelementptr inbounds i8, i8* %8, i32 1, !dbg !286
  store i8* %incdec.ptr14, i8** %pcTmp, align 8, !dbg !286
  %9 = load i8, i8* %8, align 1, !dbg !288
  %10 = load i8*, i8** %pcStrOut, align 8, !dbg !289
  %incdec.ptr15 = getelementptr inbounds i8, i8* %10, i32 1, !dbg !289
  store i8* %incdec.ptr15, i8** %pcStrOut, align 8, !dbg !289
  store i8 %9, i8* %10, align 1, !dbg !290
  br label %if.end, !dbg !291

if.else16:                                        ; preds = %if.else
  br label %while.cond17, !dbg !292

while.cond17:                                     ; preds = %while.body21, %if.else16
  %11 = load i8*, i8** %pcTmp, align 8, !dbg !294
  %12 = load i8, i8* %11, align 1, !dbg !295
  %conv18 = sext i8 %12 to i32, !dbg !295
  %cmp19 = icmp eq i32 %conv18, 32, !dbg !296
  br i1 %cmp19, label %while.body21, label %while.end23, !dbg !292

while.body21:                                     ; preds = %while.cond17
  %13 = load i8*, i8** %pcTmp, align 8, !dbg !297
  %incdec.ptr22 = getelementptr inbounds i8, i8* %13, i32 1, !dbg !297
  store i8* %incdec.ptr22, i8** %pcTmp, align 8, !dbg !297
  br label %while.cond17, !dbg !292, !llvm.loop !299

while.end23:                                      ; preds = %while.cond17
  br label %if.end

if.end:                                           ; preds = %while.end23, %if.then13
  br label %if.end24

if.end24:                                         ; preds = %if.end, %while.end
  br label %while.cond, !dbg !263, !llvm.loop !301

while.end25:                                      ; preds = %while.cond
  ret void, !dbg !303
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !304 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  ret i32 0, !dbg !307
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/dirty/ArrayIndex_WithoutCheckExternalData_BadCase12.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "test_bad_01", scope: !12, file: !12, line: 11, type: !13, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!12 = !DIFile(filename: "dirty/ArrayIndex_WithoutCheckExternalData_BadCase12.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{}
!19 = !DILocalVariable(name: "pValue", arg: 1, scope: !11, file: !12, line: 11, type: !15)
!20 = !DILocation(line: 11, column: 30, scope: !11)
!21 = !DILocalVariable(name: "pOut", scope: !11, file: !12, line: 13, type: !22)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!23 = !DILocation(line: 13, column: 11, scope: !11)
!24 = !DILocalVariable(name: "ptr", scope: !11, file: !12, line: 14, type: !15)
!25 = !DILocation(line: 14, column: 17, scope: !11)
!26 = !DILocalVariable(name: "ulLen", scope: !11, file: !12, line: 15, type: !27)
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DILocation(line: 15, column: 9, scope: !11)
!29 = !DILocation(line: 16, column: 11, scope: !11)
!30 = !DILocation(line: 16, column: 18, scope: !11)
!31 = !DILocation(line: 16, column: 9, scope: !11)
!32 = !DILocation(line: 17, column: 5, scope: !11)
!33 = !DILocation(line: 17, column: 14, scope: !11)
!34 = !DILocation(line: 17, column: 13, scope: !11)
!35 = !DILocation(line: 17, column: 18, scope: !11)
!36 = !DILocation(line: 17, column: 27, scope: !11)
!37 = !DILocation(line: 17, column: 31, scope: !11)
!38 = !DILocation(line: 17, column: 30, scope: !11)
!39 = !DILocation(line: 0, scope: !11)
!40 = !DILocation(line: 18, column: 14, scope: !41)
!41 = distinct !DILexicalBlock(scope: !11, file: !12, line: 17, column: 36)
!42 = !DILocation(line: 19, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !41, file: !12, line: 19, column: 13)
!44 = !DILocation(line: 19, column: 13, scope: !43)
!45 = !DILocation(line: 19, column: 20, scope: !43)
!46 = !DILocation(line: 19, column: 13, scope: !41)
!47 = !DILocation(line: 21, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !43, file: !12, line: 19, column: 29)
!49 = !DILocation(line: 22, column: 9, scope: !48)
!50 = distinct !{!50, !32, !51, !52}
!51 = !DILocation(line: 23, column: 5, scope: !11)
!52 = !{!"llvm.loop.mustprogress"}
!53 = !DILocation(line: 24, column: 1, scope: !11)
!54 = distinct !DISubprogram(name: "test_bad_02", scope: !12, file: !12, line: 30, type: !13, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!55 = !DILocalVariable(name: "pValue", arg: 1, scope: !54, file: !12, line: 30, type: !15)
!56 = !DILocation(line: 30, column: 30, scope: !54)
!57 = !DILocalVariable(name: "pOut", scope: !54, file: !12, line: 32, type: !22)
!58 = !DILocation(line: 32, column: 11, scope: !54)
!59 = !DILocalVariable(name: "ptr", scope: !54, file: !12, line: 33, type: !15)
!60 = !DILocation(line: 33, column: 17, scope: !54)
!61 = !DILocalVariable(name: "ulLen", scope: !54, file: !12, line: 34, type: !27)
!62 = !DILocation(line: 34, column: 9, scope: !54)
!63 = !DILocation(line: 35, column: 11, scope: !54)
!64 = !DILocation(line: 35, column: 18, scope: !54)
!65 = !DILocation(line: 35, column: 9, scope: !54)
!66 = !DILocation(line: 36, column: 5, scope: !54)
!67 = !DILocation(line: 36, column: 14, scope: !54)
!68 = !DILocation(line: 36, column: 13, scope: !54)
!69 = !DILocation(line: 36, column: 18, scope: !54)
!70 = !DILocation(line: 36, column: 27, scope: !54)
!71 = !DILocation(line: 36, column: 31, scope: !54)
!72 = !DILocation(line: 36, column: 30, scope: !54)
!73 = !DILocation(line: 0, scope: !54)
!74 = !DILocation(line: 37, column: 14, scope: !75)
!75 = distinct !DILexicalBlock(scope: !54, file: !12, line: 36, column: 36)
!76 = !DILocation(line: 38, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !75, file: !12, line: 38, column: 13)
!78 = !DILocation(line: 38, column: 13, scope: !77)
!79 = !DILocation(line: 38, column: 20, scope: !77)
!80 = !DILocation(line: 38, column: 13, scope: !75)
!81 = !DILocation(line: 39, column: 18, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !12, line: 39, column: 17)
!83 = distinct !DILexicalBlock(scope: !77, file: !12, line: 38, column: 29)
!84 = !DILocation(line: 39, column: 17, scope: !82)
!85 = !DILocation(line: 39, column: 17, scope: !83)
!86 = !DILocation(line: 40, column: 20, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !12, line: 39, column: 23)
!88 = !DILocation(line: 41, column: 13, scope: !87)
!89 = !DILocation(line: 43, column: 16, scope: !83)
!90 = !DILocation(line: 44, column: 9, scope: !83)
!91 = distinct !{!91, !66, !92, !52}
!92 = !DILocation(line: 45, column: 5, scope: !54)
!93 = !DILocation(line: 46, column: 1, scope: !54)
!94 = distinct !DISubprogram(name: "test_bad_03", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!95 = !DILocalVariable(name: "pValue", arg: 1, scope: !94, file: !12, line: 52, type: !15)
!96 = !DILocation(line: 52, column: 30, scope: !94)
!97 = !DILocalVariable(name: "pOut", scope: !94, file: !12, line: 54, type: !22)
!98 = !DILocation(line: 54, column: 11, scope: !94)
!99 = !DILocalVariable(name: "ptr", scope: !94, file: !12, line: 55, type: !15)
!100 = !DILocation(line: 55, column: 17, scope: !94)
!101 = !DILocation(line: 56, column: 11, scope: !94)
!102 = !DILocation(line: 56, column: 18, scope: !94)
!103 = !DILocation(line: 56, column: 9, scope: !94)
!104 = !DILocation(line: 57, column: 5, scope: !94)
!105 = !DILocation(line: 57, column: 13, scope: !94)
!106 = !DILocation(line: 57, column: 12, scope: !94)
!107 = !DILocation(line: 57, column: 20, scope: !94)
!108 = !DILocation(line: 58, column: 14, scope: !109)
!109 = distinct !DILexicalBlock(scope: !110, file: !12, line: 58, column: 13)
!110 = distinct !DILexicalBlock(scope: !94, file: !12, line: 57, column: 29)
!111 = !DILocation(line: 58, column: 13, scope: !109)
!112 = !DILocation(line: 58, column: 21, scope: !109)
!113 = !DILocation(line: 58, column: 13, scope: !110)
!114 = !DILocation(line: 60, column: 30, scope: !115)
!115 = distinct !DILexicalBlock(scope: !109, file: !12, line: 58, column: 30)
!116 = !DILocation(line: 60, column: 23, scope: !115)
!117 = !DILocation(line: 60, column: 18, scope: !115)
!118 = !DILocation(line: 60, column: 21, scope: !115)
!119 = !DILocation(line: 61, column: 9, scope: !115)
!120 = !DILocation(line: 62, column: 19, scope: !121)
!121 = distinct !DILexicalBlock(scope: !109, file: !12, line: 61, column: 16)
!122 = !DILocation(line: 63, column: 22, scope: !121)
!123 = !DILocation(line: 63, column: 21, scope: !121)
!124 = !DILocation(line: 63, column: 13, scope: !121)
!125 = !DILocation(line: 65, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !121, file: !12, line: 63, column: 30)
!127 = distinct !{!127, !104, !128, !52}
!128 = !DILocation(line: 68, column: 5, scope: !94)
!129 = !DILocation(line: 69, column: 1, scope: !94)
!130 = distinct !DISubprogram(name: "test_bad_04", scope: !12, file: !12, line: 75, type: !131, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!131 = !DISubroutineType(types: !132)
!132 = !{null}
!133 = !DILocalVariable(name: "ptr", scope: !130, file: !12, line: 77, type: !22)
!134 = !DILocation(line: 77, column: 12, scope: !130)
!135 = !DILocalVariable(name: "arr", scope: !130, file: !12, line: 78, type: !136)
!136 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 48, elements: !137)
!137 = !{!138}
!138 = !DISubrange(count: 6)
!139 = !DILocation(line: 78, column: 10, scope: !130)
!140 = !DILocation(line: 79, column: 11, scope: !130)
!141 = !DILocation(line: 79, column: 9, scope: !130)
!142 = !DILocation(line: 80, column: 5, scope: !130)
!143 = !DILocation(line: 80, column: 12, scope: !144)
!144 = distinct !DILexicalBlock(scope: !145, file: !12, line: 80, column: 5)
!145 = distinct !DILexicalBlock(scope: !130, file: !12, line: 80, column: 5)
!146 = !DILocation(line: 80, column: 16, scope: !144)
!147 = !DILocation(line: 80, column: 5, scope: !145)
!148 = !DILocation(line: 81, column: 17, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !12, line: 81, column: 13)
!150 = distinct !DILexicalBlock(scope: !144, file: !12, line: 80, column: 32)
!151 = !DILocation(line: 81, column: 13, scope: !149)
!152 = !DILocation(line: 81, column: 20, scope: !149)
!153 = !DILocation(line: 81, column: 13, scope: !150)
!154 = !DILocation(line: 83, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !12, line: 81, column: 26)
!156 = !DILocation(line: 84, column: 9, scope: !155)
!157 = !DILocation(line: 85, column: 5, scope: !150)
!158 = !DILocation(line: 80, column: 28, scope: !144)
!159 = !DILocation(line: 80, column: 5, scope: !144)
!160 = distinct !{!160, !147, !161, !52}
!161 = !DILocation(line: 85, column: 5, scope: !145)
!162 = !DILocation(line: 86, column: 1, scope: !130)
!163 = distinct !DISubprogram(name: "test_bad_05", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!164 = !DILocalVariable(name: "pValue", arg: 1, scope: !163, file: !12, line: 92, type: !15)
!165 = !DILocation(line: 92, column: 30, scope: !163)
!166 = !DILocalVariable(name: "pOut", scope: !163, file: !12, line: 94, type: !22)
!167 = !DILocation(line: 94, column: 11, scope: !163)
!168 = !DILocalVariable(name: "ptr", scope: !163, file: !12, line: 95, type: !15)
!169 = !DILocation(line: 95, column: 17, scope: !163)
!170 = !DILocation(line: 96, column: 11, scope: !163)
!171 = !DILocation(line: 96, column: 18, scope: !163)
!172 = !DILocation(line: 96, column: 9, scope: !163)
!173 = !DILocation(line: 97, column: 5, scope: !163)
!174 = !DILocation(line: 98, column: 14, scope: !175)
!175 = distinct !DILexicalBlock(scope: !176, file: !12, line: 98, column: 13)
!176 = distinct !DILexicalBlock(scope: !163, file: !12, line: 97, column: 8)
!177 = !DILocation(line: 98, column: 13, scope: !175)
!178 = !DILocation(line: 98, column: 21, scope: !175)
!179 = !DILocation(line: 98, column: 13, scope: !176)
!180 = !DILocation(line: 99, column: 30, scope: !181)
!181 = distinct !DILexicalBlock(scope: !175, file: !12, line: 98, column: 30)
!182 = !DILocation(line: 99, column: 23, scope: !181)
!183 = !DILocation(line: 99, column: 18, scope: !181)
!184 = !DILocation(line: 99, column: 21, scope: !181)
!185 = !DILocation(line: 100, column: 9, scope: !181)
!186 = !DILocation(line: 102, column: 19, scope: !187)
!187 = distinct !DILexicalBlock(scope: !175, file: !12, line: 100, column: 16)
!188 = !DILocation(line: 103, column: 22, scope: !187)
!189 = !DILocation(line: 103, column: 21, scope: !187)
!190 = !DILocation(line: 103, column: 13, scope: !187)
!191 = !DILocation(line: 105, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !12, line: 103, column: 30)
!193 = !DILocation(line: 108, column: 5, scope: !176)
!194 = !DILocation(line: 108, column: 15, scope: !163)
!195 = !DILocation(line: 108, column: 14, scope: !163)
!196 = !DILocation(line: 108, column: 22, scope: !163)
!197 = distinct !{!197, !173, !198, !52}
!198 = !DILocation(line: 108, column: 29, scope: !163)
!199 = !DILocation(line: 109, column: 1, scope: !163)
!200 = distinct !DISubprogram(name: "test_bad_06", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!201 = !DILocalVariable(name: "pValue", arg: 1, scope: !200, file: !12, line: 115, type: !15)
!202 = !DILocation(line: 115, column: 30, scope: !200)
!203 = !DILocalVariable(name: "pOut", scope: !200, file: !12, line: 117, type: !22)
!204 = !DILocation(line: 117, column: 11, scope: !200)
!205 = !DILocalVariable(name: "ptr", scope: !200, file: !12, line: 118, type: !15)
!206 = !DILocation(line: 118, column: 17, scope: !200)
!207 = !DILocalVariable(name: "ulLen", scope: !200, file: !12, line: 119, type: !27)
!208 = !DILocation(line: 119, column: 9, scope: !200)
!209 = !DILocation(line: 120, column: 11, scope: !200)
!210 = !DILocation(line: 120, column: 18, scope: !200)
!211 = !DILocation(line: 120, column: 9, scope: !200)
!212 = !DILocation(line: 121, column: 5, scope: !200)
!213 = !DILocation(line: 121, column: 14, scope: !200)
!214 = !DILocation(line: 121, column: 13, scope: !200)
!215 = !DILocation(line: 121, column: 18, scope: !200)
!216 = !DILocation(line: 121, column: 27, scope: !200)
!217 = !DILocation(line: 121, column: 31, scope: !200)
!218 = !DILocation(line: 121, column: 30, scope: !200)
!219 = !DILocation(line: 0, scope: !200)
!220 = !DILocation(line: 122, column: 14, scope: !221)
!221 = distinct !DILexicalBlock(scope: !200, file: !12, line: 121, column: 36)
!222 = !DILocation(line: 123, column: 17, scope: !223)
!223 = distinct !DILexicalBlock(scope: !221, file: !12, line: 123, column: 13)
!224 = !DILocation(line: 123, column: 13, scope: !223)
!225 = !DILocation(line: 123, column: 20, scope: !223)
!226 = !DILocation(line: 123, column: 13, scope: !221)
!227 = !DILocation(line: 125, column: 16, scope: !228)
!228 = distinct !DILexicalBlock(scope: !223, file: !12, line: 123, column: 29)
!229 = !DILocation(line: 126, column: 9, scope: !228)
!230 = distinct !{!230, !212, !231, !52}
!231 = !DILocation(line: 127, column: 5, scope: !200)
!232 = !DILocation(line: 128, column: 5, scope: !200)
!233 = !DILocation(line: 128, column: 13, scope: !200)
!234 = !DILocation(line: 128, column: 12, scope: !200)
!235 = !DILocation(line: 128, column: 20, scope: !200)
!236 = !DILocation(line: 129, column: 14, scope: !237)
!237 = distinct !DILexicalBlock(scope: !238, file: !12, line: 129, column: 13)
!238 = distinct !DILexicalBlock(scope: !200, file: !12, line: 128, column: 29)
!239 = !DILocation(line: 129, column: 13, scope: !237)
!240 = !DILocation(line: 129, column: 21, scope: !237)
!241 = !DILocation(line: 129, column: 13, scope: !238)
!242 = !DILocation(line: 130, column: 30, scope: !243)
!243 = distinct !DILexicalBlock(scope: !237, file: !12, line: 129, column: 30)
!244 = !DILocation(line: 130, column: 23, scope: !243)
!245 = !DILocation(line: 130, column: 18, scope: !243)
!246 = !DILocation(line: 130, column: 21, scope: !243)
!247 = !DILocation(line: 131, column: 9, scope: !243)
!248 = !DILocation(line: 133, column: 19, scope: !249)
!249 = distinct !DILexicalBlock(scope: !237, file: !12, line: 131, column: 16)
!250 = !DILocation(line: 134, column: 22, scope: !249)
!251 = !DILocation(line: 134, column: 21, scope: !249)
!252 = !DILocation(line: 134, column: 13, scope: !249)
!253 = !DILocation(line: 136, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !249, file: !12, line: 134, column: 30)
!255 = distinct !{!255, !232, !256, !52}
!256 = !DILocation(line: 139, column: 5, scope: !200)
!257 = !DILocation(line: 140, column: 1, scope: !200)
!258 = distinct !DISubprogram(name: "test_bad_07", scope: !12, file: !12, line: 147, type: !131, scopeLine: 148, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!259 = !DILocalVariable(name: "pcTmp", scope: !258, file: !12, line: 149, type: !15)
!260 = !DILocation(line: 149, column: 17, scope: !258)
!261 = !DILocalVariable(name: "pcStrOut", scope: !258, file: !12, line: 150, type: !22)
!262 = !DILocation(line: 150, column: 11, scope: !258)
!263 = !DILocation(line: 151, column: 5, scope: !258)
!264 = !DILocation(line: 151, column: 13, scope: !258)
!265 = !DILocation(line: 151, column: 12, scope: !258)
!266 = !DILocation(line: 151, column: 19, scope: !258)
!267 = !DILocation(line: 152, column: 14, scope: !268)
!268 = distinct !DILexicalBlock(scope: !269, file: !12, line: 152, column: 13)
!269 = distinct !DILexicalBlock(scope: !258, file: !12, line: 151, column: 27)
!270 = !DILocation(line: 152, column: 13, scope: !268)
!271 = !DILocation(line: 152, column: 20, scope: !268)
!272 = !DILocation(line: 152, column: 13, scope: !269)
!273 = !DILocation(line: 153, column: 13, scope: !274)
!274 = distinct !DILexicalBlock(scope: !268, file: !12, line: 152, column: 28)
!275 = !DILocation(line: 153, column: 21, scope: !274)
!276 = !DILocation(line: 153, column: 20, scope: !274)
!277 = !DILocation(line: 153, column: 29, scope: !274)
!278 = distinct !{!278, !273, !279, !52}
!279 = !DILocation(line: 155, column: 13, scope: !274)
!280 = !DILocation(line: 156, column: 9, scope: !274)
!281 = !DILocation(line: 156, column: 21, scope: !282)
!282 = distinct !DILexicalBlock(scope: !268, file: !12, line: 156, column: 20)
!283 = !DILocation(line: 156, column: 20, scope: !282)
!284 = !DILocation(line: 156, column: 27, scope: !282)
!285 = !DILocation(line: 156, column: 20, scope: !268)
!286 = !DILocation(line: 158, column: 34, scope: !287)
!287 = distinct !DILexicalBlock(scope: !282, file: !12, line: 156, column: 35)
!288 = !DILocation(line: 158, column: 27, scope: !287)
!289 = !DILocation(line: 158, column: 21, scope: !287)
!290 = !DILocation(line: 158, column: 25, scope: !287)
!291 = !DILocation(line: 159, column: 9, scope: !287)
!292 = !DILocation(line: 160, column: 13, scope: !293)
!293 = distinct !DILexicalBlock(scope: !282, file: !12, line: 159, column: 16)
!294 = !DILocation(line: 160, column: 21, scope: !293)
!295 = !DILocation(line: 160, column: 20, scope: !293)
!296 = !DILocation(line: 160, column: 27, scope: !293)
!297 = !DILocation(line: 161, column: 22, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !12, line: 160, column: 35)
!299 = distinct !{!299, !292, !300, !52}
!300 = !DILocation(line: 162, column: 13, scope: !293)
!301 = distinct !{!301, !263, !302, !52}
!302 = !DILocation(line: 164, column: 5, scope: !258)
!303 = !DILocation(line: 165, column: 1, scope: !258)
!304 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 168, type: !305, scopeLine: 169, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!305 = !DISubroutineType(types: !306)
!306 = !{!27}
!307 = !DILocation(line: 170, column: 5, scope: !304)
