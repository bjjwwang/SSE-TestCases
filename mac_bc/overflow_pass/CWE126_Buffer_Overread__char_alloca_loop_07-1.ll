; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_07_bad() #0 !dbg !18 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 50, align 16, !dbg !26
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = alloca i8, i64 100, align 16, !dbg !29
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !28
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !30
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !30
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !30
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !31
  store i8 0, i8* %arrayidx, align 1, !dbg !32
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !33
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !33
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !33
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !33
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !34
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !34
  store i8 0, i8* %arrayidx2, align 1, !dbg !35
  %10 = load i32, i32* @staticFive, align 4, !dbg !36
  %cmp = icmp eq i32 %10, 5, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %dataBadBuffer, align 8, !dbg !40
  store i8* %11, i8** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !59
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !59
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !60
  store i8 0, i8* %arrayidx3, align 1, !dbg !61
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !62
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !63
  store i64 %call5, i64* %destLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !68
  %13 = load i64, i64* %destLen, align 8, !dbg !70
  %cmp6 = icmp ult i64 %12, %13, !dbg !71
  br i1 %cmp6, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !73
  %15 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !73
  %16 = load i8, i8* %arrayidx7, align 1, !dbg !73
  %17 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !77
  store i8 %16, i8* %arrayidx8, align 1, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %18, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !85
  store i8 0, i8* %arrayidx9, align 1, !dbg !86
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !87
  call void @printLine(i8* noundef %arraydecay10), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_07_good() #0 !dbg !90 {
entry:
  call void @goodG2B1(), !dbg !91
  call void @goodG2B2(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* noundef null), !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 noundef %conv), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__char_alloca_loop_07_good(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__char_alloca_loop_07_bad(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %0 = alloca i8, i64 50, align 16, !dbg !117
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %1 = alloca i8, i64 100, align 16, !dbg !120
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !119
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !121
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !121
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !121
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !121
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !122
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !122
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !124
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !124
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !124
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !125
  store i8 0, i8* %arrayidx2, align 1, !dbg !126
  %10 = load i32, i32* @staticFive, align 4, !dbg !127
  %cmp = icmp ne i32 %10, 5, !dbg !129
  br i1 %cmp, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !131
  br label %if.end, !dbg !133

if.else:                                          ; preds = %entry
  %11 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !134
  store i8* %11, i8** %data, align 8, !dbg !136
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !144
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !145
  store i8 0, i8* %arrayidx3, align 1, !dbg !146
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !147
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !148
  store i64 %call5, i64* %destLen, align 8, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !153
  %13 = load i64, i64* %destLen, align 8, !dbg !155
  %cmp6 = icmp ult i64 %12, %13, !dbg !156
  br i1 %cmp6, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !158
  %15 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !158
  %16 = load i8, i8* %arrayidx7, align 1, !dbg !158
  %17 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !162
  store i8 %16, i8* %arrayidx8, align 1, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %18, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !169
  store i8 0, i8* %arrayidx9, align 1, !dbg !170
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !171
  call void @printLine(i8* noundef %arraydecay10), !dbg !172
  ret void, !dbg !173
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !174 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !175, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !177, metadata !DIExpression()), !dbg !178
  %0 = alloca i8, i64 50, align 16, !dbg !179
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !178
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !180, metadata !DIExpression()), !dbg !181
  %1 = alloca i8, i64 100, align 16, !dbg !182
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !181
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !183
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !183
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !183
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !183
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !184
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !184
  store i8 0, i8* %arrayidx, align 1, !dbg !185
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !186
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !186
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !186
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !186
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !187
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !187
  store i8 0, i8* %arrayidx2, align 1, !dbg !188
  %10 = load i32, i32* @staticFive, align 4, !dbg !189
  %cmp = icmp eq i32 %10, 5, !dbg !191
  br i1 %cmp, label %if.then, label %if.end, !dbg !192

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !193
  store i8* %11, i8** %data, align 8, !dbg !195
  br label %if.end, !dbg !196

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !197, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !200, metadata !DIExpression()), !dbg !201
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !202, metadata !DIExpression()), !dbg !203
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !204
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !205
  store i8 0, i8* %arrayidx3, align 1, !dbg !206
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !207
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !208
  store i64 %call5, i64* %destLen, align 8, !dbg !209
  store i64 0, i64* %i, align 8, !dbg !210
  br label %for.cond, !dbg !212

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !213
  %13 = load i64, i64* %destLen, align 8, !dbg !215
  %cmp6 = icmp ult i64 %12, %13, !dbg !216
  br i1 %cmp6, label %for.body, label %for.end, !dbg !217

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !218
  %15 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !218
  %16 = load i8, i8* %arrayidx7, align 1, !dbg !218
  %17 = load i64, i64* %i, align 8, !dbg !221
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !222
  store i8 %16, i8* %arrayidx8, align 1, !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !225
  %inc = add i64 %18, 1, !dbg !225
  store i64 %inc, i64* %i, align 8, !dbg !225
  br label %for.cond, !dbg !226, !llvm.loop !227

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !229
  store i8 0, i8* %arrayidx9, align 1, !dbg !230
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !231
  call void @printLine(i8* noundef %arraydecay10), !dbg !232
  ret void, !dbg !233
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !9, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0}
!9 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_07_bad", scope: !9, file: !9, line: 29, type: !19, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !18, file: !9, line: 31, type: !5)
!23 = !DILocation(line: 31, column: 12, scope: !18)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !18, file: !9, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !18)
!26 = !DILocation(line: 32, column: 36, scope: !18)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !18, file: !9, line: 33, type: !5)
!28 = !DILocation(line: 33, column: 12, scope: !18)
!29 = !DILocation(line: 33, column: 37, scope: !18)
!30 = !DILocation(line: 34, column: 5, scope: !18)
!31 = !DILocation(line: 35, column: 5, scope: !18)
!32 = !DILocation(line: 35, column: 25, scope: !18)
!33 = !DILocation(line: 36, column: 5, scope: !18)
!34 = !DILocation(line: 37, column: 5, scope: !18)
!35 = !DILocation(line: 37, column: 27, scope: !18)
!36 = !DILocation(line: 38, column: 8, scope: !37)
!37 = distinct !DILexicalBlock(scope: !18, file: !9, line: 38, column: 8)
!38 = !DILocation(line: 38, column: 18, scope: !37)
!39 = !DILocation(line: 38, column: 8, scope: !18)
!40 = !DILocation(line: 41, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !9, line: 39, column: 5)
!42 = !DILocation(line: 41, column: 14, scope: !41)
!43 = !DILocation(line: 42, column: 5, scope: !41)
!44 = !DILocalVariable(name: "i", scope: !45, file: !9, line: 44, type: !46)
!45 = distinct !DILexicalBlock(scope: !18, file: !9, line: 43, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !49, line: 94, baseType: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 44, column: 16, scope: !45)
!52 = !DILocalVariable(name: "destLen", scope: !45, file: !9, line: 44, type: !46)
!53 = !DILocation(line: 44, column: 19, scope: !45)
!54 = !DILocalVariable(name: "dest", scope: !45, file: !9, line: 45, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 45, column: 14, scope: !45)
!59 = !DILocation(line: 46, column: 9, scope: !45)
!60 = !DILocation(line: 47, column: 9, scope: !45)
!61 = !DILocation(line: 47, column: 21, scope: !45)
!62 = !DILocation(line: 48, column: 26, scope: !45)
!63 = !DILocation(line: 48, column: 19, scope: !45)
!64 = !DILocation(line: 48, column: 17, scope: !45)
!65 = !DILocation(line: 51, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !45, file: !9, line: 51, column: 9)
!67 = !DILocation(line: 51, column: 14, scope: !66)
!68 = !DILocation(line: 51, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !9, line: 51, column: 9)
!70 = !DILocation(line: 51, column: 25, scope: !69)
!71 = !DILocation(line: 51, column: 23, scope: !69)
!72 = !DILocation(line: 51, column: 9, scope: !66)
!73 = !DILocation(line: 53, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !9, line: 52, column: 9)
!75 = !DILocation(line: 53, column: 28, scope: !74)
!76 = !DILocation(line: 53, column: 18, scope: !74)
!77 = !DILocation(line: 53, column: 13, scope: !74)
!78 = !DILocation(line: 53, column: 21, scope: !74)
!79 = !DILocation(line: 54, column: 9, scope: !74)
!80 = !DILocation(line: 51, column: 35, scope: !69)
!81 = !DILocation(line: 51, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 54, column: 9, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 55, column: 9, scope: !45)
!86 = !DILocation(line: 55, column: 21, scope: !45)
!87 = !DILocation(line: 56, column: 19, scope: !45)
!88 = !DILocation(line: 56, column: 9, scope: !45)
!89 = !DILocation(line: 58, column: 1, scope: !18)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_07_good", scope: !9, file: !9, line: 133, type: !19, scopeLine: 134, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!91 = !DILocation(line: 135, column: 5, scope: !90)
!92 = !DILocation(line: 136, column: 5, scope: !90)
!93 = !DILocation(line: 137, column: 1, scope: !90)
!94 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 149, type: !95, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!95 = !DISubroutineType(types: !96)
!96 = !{!10, !10, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !9, line: 149, type: !10)
!99 = !DILocation(line: 149, column: 14, scope: !94)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !9, line: 149, type: !97)
!101 = !DILocation(line: 149, column: 27, scope: !94)
!102 = !DILocation(line: 152, column: 22, scope: !94)
!103 = !DILocation(line: 152, column: 12, scope: !94)
!104 = !DILocation(line: 152, column: 5, scope: !94)
!105 = !DILocation(line: 154, column: 5, scope: !94)
!106 = !DILocation(line: 155, column: 5, scope: !94)
!107 = !DILocation(line: 156, column: 5, scope: !94)
!108 = !DILocation(line: 159, column: 5, scope: !94)
!109 = !DILocation(line: 160, column: 5, scope: !94)
!110 = !DILocation(line: 161, column: 5, scope: !94)
!111 = !DILocation(line: 163, column: 5, scope: !94)
!112 = distinct !DISubprogram(name: "goodG2B1", scope: !9, file: !9, line: 65, type: !19, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!113 = !DILocalVariable(name: "data", scope: !112, file: !9, line: 67, type: !5)
!114 = !DILocation(line: 67, column: 12, scope: !112)
!115 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !9, line: 68, type: !5)
!116 = !DILocation(line: 68, column: 12, scope: !112)
!117 = !DILocation(line: 68, column: 36, scope: !112)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !9, line: 69, type: !5)
!119 = !DILocation(line: 69, column: 12, scope: !112)
!120 = !DILocation(line: 69, column: 37, scope: !112)
!121 = !DILocation(line: 70, column: 5, scope: !112)
!122 = !DILocation(line: 71, column: 5, scope: !112)
!123 = !DILocation(line: 71, column: 25, scope: !112)
!124 = !DILocation(line: 72, column: 5, scope: !112)
!125 = !DILocation(line: 73, column: 5, scope: !112)
!126 = !DILocation(line: 73, column: 27, scope: !112)
!127 = !DILocation(line: 74, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !112, file: !9, line: 74, column: 8)
!129 = !DILocation(line: 74, column: 18, scope: !128)
!130 = !DILocation(line: 74, column: 8, scope: !112)
!131 = !DILocation(line: 77, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !9, line: 75, column: 5)
!133 = !DILocation(line: 78, column: 5, scope: !132)
!134 = !DILocation(line: 82, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !9, line: 80, column: 5)
!136 = !DILocation(line: 82, column: 14, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !9, line: 85, type: !46)
!138 = distinct !DILexicalBlock(scope: !112, file: !9, line: 84, column: 5)
!139 = !DILocation(line: 85, column: 16, scope: !138)
!140 = !DILocalVariable(name: "destLen", scope: !138, file: !9, line: 85, type: !46)
!141 = !DILocation(line: 85, column: 19, scope: !138)
!142 = !DILocalVariable(name: "dest", scope: !138, file: !9, line: 86, type: !55)
!143 = !DILocation(line: 86, column: 14, scope: !138)
!144 = !DILocation(line: 87, column: 9, scope: !138)
!145 = !DILocation(line: 88, column: 9, scope: !138)
!146 = !DILocation(line: 88, column: 21, scope: !138)
!147 = !DILocation(line: 89, column: 26, scope: !138)
!148 = !DILocation(line: 89, column: 19, scope: !138)
!149 = !DILocation(line: 89, column: 17, scope: !138)
!150 = !DILocation(line: 92, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !138, file: !9, line: 92, column: 9)
!152 = !DILocation(line: 92, column: 14, scope: !151)
!153 = !DILocation(line: 92, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !9, line: 92, column: 9)
!155 = !DILocation(line: 92, column: 25, scope: !154)
!156 = !DILocation(line: 92, column: 23, scope: !154)
!157 = !DILocation(line: 92, column: 9, scope: !151)
!158 = !DILocation(line: 94, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !9, line: 93, column: 9)
!160 = !DILocation(line: 94, column: 28, scope: !159)
!161 = !DILocation(line: 94, column: 18, scope: !159)
!162 = !DILocation(line: 94, column: 13, scope: !159)
!163 = !DILocation(line: 94, column: 21, scope: !159)
!164 = !DILocation(line: 95, column: 9, scope: !159)
!165 = !DILocation(line: 92, column: 35, scope: !154)
!166 = !DILocation(line: 92, column: 9, scope: !154)
!167 = distinct !{!167, !157, !168, !84}
!168 = !DILocation(line: 95, column: 9, scope: !151)
!169 = !DILocation(line: 96, column: 9, scope: !138)
!170 = !DILocation(line: 96, column: 21, scope: !138)
!171 = !DILocation(line: 97, column: 19, scope: !138)
!172 = !DILocation(line: 97, column: 9, scope: !138)
!173 = !DILocation(line: 99, column: 1, scope: !112)
!174 = distinct !DISubprogram(name: "goodG2B2", scope: !9, file: !9, line: 102, type: !19, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !21)
!175 = !DILocalVariable(name: "data", scope: !174, file: !9, line: 104, type: !5)
!176 = !DILocation(line: 104, column: 12, scope: !174)
!177 = !DILocalVariable(name: "dataBadBuffer", scope: !174, file: !9, line: 105, type: !5)
!178 = !DILocation(line: 105, column: 12, scope: !174)
!179 = !DILocation(line: 105, column: 36, scope: !174)
!180 = !DILocalVariable(name: "dataGoodBuffer", scope: !174, file: !9, line: 106, type: !5)
!181 = !DILocation(line: 106, column: 12, scope: !174)
!182 = !DILocation(line: 106, column: 37, scope: !174)
!183 = !DILocation(line: 107, column: 5, scope: !174)
!184 = !DILocation(line: 108, column: 5, scope: !174)
!185 = !DILocation(line: 108, column: 25, scope: !174)
!186 = !DILocation(line: 109, column: 5, scope: !174)
!187 = !DILocation(line: 110, column: 5, scope: !174)
!188 = !DILocation(line: 110, column: 27, scope: !174)
!189 = !DILocation(line: 111, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !174, file: !9, line: 111, column: 8)
!191 = !DILocation(line: 111, column: 18, scope: !190)
!192 = !DILocation(line: 111, column: 8, scope: !174)
!193 = !DILocation(line: 114, column: 16, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !9, line: 112, column: 5)
!195 = !DILocation(line: 114, column: 14, scope: !194)
!196 = !DILocation(line: 115, column: 5, scope: !194)
!197 = !DILocalVariable(name: "i", scope: !198, file: !9, line: 117, type: !46)
!198 = distinct !DILexicalBlock(scope: !174, file: !9, line: 116, column: 5)
!199 = !DILocation(line: 117, column: 16, scope: !198)
!200 = !DILocalVariable(name: "destLen", scope: !198, file: !9, line: 117, type: !46)
!201 = !DILocation(line: 117, column: 19, scope: !198)
!202 = !DILocalVariable(name: "dest", scope: !198, file: !9, line: 118, type: !55)
!203 = !DILocation(line: 118, column: 14, scope: !198)
!204 = !DILocation(line: 119, column: 9, scope: !198)
!205 = !DILocation(line: 120, column: 9, scope: !198)
!206 = !DILocation(line: 120, column: 21, scope: !198)
!207 = !DILocation(line: 121, column: 26, scope: !198)
!208 = !DILocation(line: 121, column: 19, scope: !198)
!209 = !DILocation(line: 121, column: 17, scope: !198)
!210 = !DILocation(line: 124, column: 16, scope: !211)
!211 = distinct !DILexicalBlock(scope: !198, file: !9, line: 124, column: 9)
!212 = !DILocation(line: 124, column: 14, scope: !211)
!213 = !DILocation(line: 124, column: 21, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !9, line: 124, column: 9)
!215 = !DILocation(line: 124, column: 25, scope: !214)
!216 = !DILocation(line: 124, column: 23, scope: !214)
!217 = !DILocation(line: 124, column: 9, scope: !211)
!218 = !DILocation(line: 126, column: 23, scope: !219)
!219 = distinct !DILexicalBlock(scope: !214, file: !9, line: 125, column: 9)
!220 = !DILocation(line: 126, column: 28, scope: !219)
!221 = !DILocation(line: 126, column: 18, scope: !219)
!222 = !DILocation(line: 126, column: 13, scope: !219)
!223 = !DILocation(line: 126, column: 21, scope: !219)
!224 = !DILocation(line: 127, column: 9, scope: !219)
!225 = !DILocation(line: 124, column: 35, scope: !214)
!226 = !DILocation(line: 124, column: 9, scope: !214)
!227 = distinct !{!227, !217, !228, !84}
!228 = !DILocation(line: 127, column: 9, scope: !211)
!229 = !DILocation(line: 128, column: 9, scope: !198)
!230 = !DILocation(line: 128, column: 21, scope: !198)
!231 = !DILocation(line: 129, column: 19, scope: !198)
!232 = !DILocation(line: 129, column: 9, scope: !198)
!233 = !DILocation(line: 131, column: 1, scope: !174)
