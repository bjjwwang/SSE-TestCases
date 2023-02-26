; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !9
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_05_bad() #0 !dbg !20 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 50, align 16, !dbg !28
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %1 = alloca i8, i64 100, align 16, !dbg !31
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !30
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !32
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !32
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !32
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !35
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !35
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !35
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !35
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !36
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !36
  store i8 0, i8* %arrayidx2, align 1, !dbg !37
  %10 = load i32, i32* @staticTrue, align 4, !dbg !38
  %tobool = icmp ne i32 %10, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %dataBadBuffer, align 8, !dbg !41
  store i8* %11, i8** %data, align 8, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !53, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !55, metadata !DIExpression()), !dbg !59
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !60
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !61
  store i8 0, i8* %arrayidx3, align 1, !dbg !62
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !63
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !64
  store i64 %call5, i64* %destLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !69
  %13 = load i64, i64* %destLen, align 8, !dbg !71
  %cmp = icmp ult i64 %12, %13, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !74
  %15 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx6 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !74
  %16 = load i8, i8* %arrayidx6, align 1, !dbg !74
  %17 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !78
  store i8 %16, i8* %arrayidx7, align 1, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %18, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !86
  store i8 0, i8* %arrayidx8, align 1, !dbg !87
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !88
  call void @printLine(i8* noundef %arraydecay9), !dbg !89
  ret void, !dbg !90
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
define void @CWE126_Buffer_Overread__char_alloca_loop_05_good() #0 !dbg !91 {
entry:
  call void @goodG2B1(), !dbg !92
  call void @goodG2B2(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__char_alloca_loop_05_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__char_alloca_loop_05_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !113 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  %0 = alloca i8, i64 50, align 16, !dbg !118
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %1 = alloca i8, i64 100, align 16, !dbg !121
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !120
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !122
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !122
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !122
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !122
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !123
  store i8 0, i8* %arrayidx, align 1, !dbg !124
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !125
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !125
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !125
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !126
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !126
  store i8 0, i8* %arrayidx2, align 1, !dbg !127
  %10 = load i32, i32* @staticFalse, align 4, !dbg !128
  %tobool = icmp ne i32 %10, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.else, !dbg !130

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
  %cmp = icmp ult i64 %12, %13, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !158
  %15 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx6 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !158
  %16 = load i8, i8* %arrayidx6, align 1, !dbg !158
  %17 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !162
  store i8 %16, i8* %arrayidx7, align 1, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !165
  %inc = add i64 %18, 1, !dbg !165
  store i64 %inc, i64* %i, align 8, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !169
  store i8 0, i8* %arrayidx8, align 1, !dbg !170
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !171
  call void @printLine(i8* noundef %arraydecay9), !dbg !172
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
  %10 = load i32, i32* @staticTrue, align 4, !dbg !189
  %tobool = icmp ne i32 %10, 0, !dbg !189
  br i1 %tobool, label %if.then, label %if.end, !dbg !191

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !192
  store i8* %11, i8** %data, align 8, !dbg !194
  br label %if.end, !dbg !195

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !196, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !199, metadata !DIExpression()), !dbg !200
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !201, metadata !DIExpression()), !dbg !202
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !203
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !203
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !204
  store i8 0, i8* %arrayidx3, align 1, !dbg !205
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !206
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !207
  store i64 %call5, i64* %destLen, align 8, !dbg !208
  store i64 0, i64* %i, align 8, !dbg !209
  br label %for.cond, !dbg !211

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !212
  %13 = load i64, i64* %destLen, align 8, !dbg !214
  %cmp = icmp ult i64 %12, %13, !dbg !215
  br i1 %cmp, label %for.body, label %for.end, !dbg !216

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !217
  %15 = load i64, i64* %i, align 8, !dbg !219
  %arrayidx6 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !217
  %16 = load i8, i8* %arrayidx6, align 1, !dbg !217
  %17 = load i64, i64* %i, align 8, !dbg !220
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !221
  store i8 %16, i8* %arrayidx7, align 1, !dbg !222
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !224
  %inc = add i64 %18, 1, !dbg !224
  store i64 %inc, i64* %i, align 8, !dbg !224
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !228
  store i8 0, i8* %arrayidx8, align 1, !dbg !229
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !230
  call void @printLine(i8* noundef %arraydecay9), !dbg !231
  ret void, !dbg !232
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !11, line: 25, type: !12, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!0, !9}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !11, line: 26, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_05_bad", scope: !11, file: !11, line: 30, type: !21, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !{}
!24 = !DILocalVariable(name: "data", scope: !20, file: !11, line: 32, type: !5)
!25 = !DILocation(line: 32, column: 12, scope: !20)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !20, file: !11, line: 33, type: !5)
!27 = !DILocation(line: 33, column: 12, scope: !20)
!28 = !DILocation(line: 33, column: 36, scope: !20)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !20, file: !11, line: 34, type: !5)
!30 = !DILocation(line: 34, column: 12, scope: !20)
!31 = !DILocation(line: 34, column: 37, scope: !20)
!32 = !DILocation(line: 35, column: 5, scope: !20)
!33 = !DILocation(line: 36, column: 5, scope: !20)
!34 = !DILocation(line: 36, column: 25, scope: !20)
!35 = !DILocation(line: 37, column: 5, scope: !20)
!36 = !DILocation(line: 38, column: 5, scope: !20)
!37 = !DILocation(line: 38, column: 27, scope: !20)
!38 = !DILocation(line: 39, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !20, file: !11, line: 39, column: 8)
!40 = !DILocation(line: 39, column: 8, scope: !20)
!41 = !DILocation(line: 42, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !11, line: 40, column: 5)
!43 = !DILocation(line: 42, column: 14, scope: !42)
!44 = !DILocation(line: 43, column: 5, scope: !42)
!45 = !DILocalVariable(name: "i", scope: !46, file: !11, line: 45, type: !47)
!46 = distinct !DILexicalBlock(scope: !20, file: !11, line: 44, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !50, line: 94, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!51 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 45, column: 16, scope: !46)
!53 = !DILocalVariable(name: "destLen", scope: !46, file: !11, line: 45, type: !47)
!54 = !DILocation(line: 45, column: 19, scope: !46)
!55 = !DILocalVariable(name: "dest", scope: !46, file: !11, line: 46, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 800, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 100)
!59 = !DILocation(line: 46, column: 14, scope: !46)
!60 = !DILocation(line: 47, column: 9, scope: !46)
!61 = !DILocation(line: 48, column: 9, scope: !46)
!62 = !DILocation(line: 48, column: 21, scope: !46)
!63 = !DILocation(line: 49, column: 26, scope: !46)
!64 = !DILocation(line: 49, column: 19, scope: !46)
!65 = !DILocation(line: 49, column: 17, scope: !46)
!66 = !DILocation(line: 52, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !46, file: !11, line: 52, column: 9)
!68 = !DILocation(line: 52, column: 14, scope: !67)
!69 = !DILocation(line: 52, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !11, line: 52, column: 9)
!71 = !DILocation(line: 52, column: 25, scope: !70)
!72 = !DILocation(line: 52, column: 23, scope: !70)
!73 = !DILocation(line: 52, column: 9, scope: !67)
!74 = !DILocation(line: 54, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !11, line: 53, column: 9)
!76 = !DILocation(line: 54, column: 28, scope: !75)
!77 = !DILocation(line: 54, column: 18, scope: !75)
!78 = !DILocation(line: 54, column: 13, scope: !75)
!79 = !DILocation(line: 54, column: 21, scope: !75)
!80 = !DILocation(line: 55, column: 9, scope: !75)
!81 = !DILocation(line: 52, column: 35, scope: !70)
!82 = !DILocation(line: 52, column: 9, scope: !70)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 55, column: 9, scope: !67)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 56, column: 9, scope: !46)
!87 = !DILocation(line: 56, column: 21, scope: !46)
!88 = !DILocation(line: 57, column: 19, scope: !46)
!89 = !DILocation(line: 57, column: 9, scope: !46)
!90 = !DILocation(line: 59, column: 1, scope: !20)
!91 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_05_good", scope: !11, file: !11, line: 134, type: !21, scopeLine: 135, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!92 = !DILocation(line: 136, column: 5, scope: !91)
!93 = !DILocation(line: 137, column: 5, scope: !91)
!94 = !DILocation(line: 138, column: 1, scope: !91)
!95 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 150, type: !96, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !23)
!96 = !DISubroutineType(types: !97)
!97 = !{!12, !12, !98}
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !11, line: 150, type: !12)
!100 = !DILocation(line: 150, column: 14, scope: !95)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !11, line: 150, type: !98)
!102 = !DILocation(line: 150, column: 27, scope: !95)
!103 = !DILocation(line: 153, column: 22, scope: !95)
!104 = !DILocation(line: 153, column: 12, scope: !95)
!105 = !DILocation(line: 153, column: 5, scope: !95)
!106 = !DILocation(line: 155, column: 5, scope: !95)
!107 = !DILocation(line: 156, column: 5, scope: !95)
!108 = !DILocation(line: 157, column: 5, scope: !95)
!109 = !DILocation(line: 160, column: 5, scope: !95)
!110 = !DILocation(line: 161, column: 5, scope: !95)
!111 = !DILocation(line: 162, column: 5, scope: !95)
!112 = !DILocation(line: 164, column: 5, scope: !95)
!113 = distinct !DISubprogram(name: "goodG2B1", scope: !11, file: !11, line: 66, type: !21, scopeLine: 67, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!114 = !DILocalVariable(name: "data", scope: !113, file: !11, line: 68, type: !5)
!115 = !DILocation(line: 68, column: 12, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !11, line: 69, type: !5)
!117 = !DILocation(line: 69, column: 12, scope: !113)
!118 = !DILocation(line: 69, column: 36, scope: !113)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !11, line: 70, type: !5)
!120 = !DILocation(line: 70, column: 12, scope: !113)
!121 = !DILocation(line: 70, column: 37, scope: !113)
!122 = !DILocation(line: 71, column: 5, scope: !113)
!123 = !DILocation(line: 72, column: 5, scope: !113)
!124 = !DILocation(line: 72, column: 25, scope: !113)
!125 = !DILocation(line: 73, column: 5, scope: !113)
!126 = !DILocation(line: 74, column: 5, scope: !113)
!127 = !DILocation(line: 74, column: 27, scope: !113)
!128 = !DILocation(line: 75, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !113, file: !11, line: 75, column: 8)
!130 = !DILocation(line: 75, column: 8, scope: !113)
!131 = !DILocation(line: 78, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !11, line: 76, column: 5)
!133 = !DILocation(line: 79, column: 5, scope: !132)
!134 = !DILocation(line: 83, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !129, file: !11, line: 81, column: 5)
!136 = !DILocation(line: 83, column: 14, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !138, file: !11, line: 86, type: !47)
!138 = distinct !DILexicalBlock(scope: !113, file: !11, line: 85, column: 5)
!139 = !DILocation(line: 86, column: 16, scope: !138)
!140 = !DILocalVariable(name: "destLen", scope: !138, file: !11, line: 86, type: !47)
!141 = !DILocation(line: 86, column: 19, scope: !138)
!142 = !DILocalVariable(name: "dest", scope: !138, file: !11, line: 87, type: !56)
!143 = !DILocation(line: 87, column: 14, scope: !138)
!144 = !DILocation(line: 88, column: 9, scope: !138)
!145 = !DILocation(line: 89, column: 9, scope: !138)
!146 = !DILocation(line: 89, column: 21, scope: !138)
!147 = !DILocation(line: 90, column: 26, scope: !138)
!148 = !DILocation(line: 90, column: 19, scope: !138)
!149 = !DILocation(line: 90, column: 17, scope: !138)
!150 = !DILocation(line: 93, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !138, file: !11, line: 93, column: 9)
!152 = !DILocation(line: 93, column: 14, scope: !151)
!153 = !DILocation(line: 93, column: 21, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !11, line: 93, column: 9)
!155 = !DILocation(line: 93, column: 25, scope: !154)
!156 = !DILocation(line: 93, column: 23, scope: !154)
!157 = !DILocation(line: 93, column: 9, scope: !151)
!158 = !DILocation(line: 95, column: 23, scope: !159)
!159 = distinct !DILexicalBlock(scope: !154, file: !11, line: 94, column: 9)
!160 = !DILocation(line: 95, column: 28, scope: !159)
!161 = !DILocation(line: 95, column: 18, scope: !159)
!162 = !DILocation(line: 95, column: 13, scope: !159)
!163 = !DILocation(line: 95, column: 21, scope: !159)
!164 = !DILocation(line: 96, column: 9, scope: !159)
!165 = !DILocation(line: 93, column: 35, scope: !154)
!166 = !DILocation(line: 93, column: 9, scope: !154)
!167 = distinct !{!167, !157, !168, !85}
!168 = !DILocation(line: 96, column: 9, scope: !151)
!169 = !DILocation(line: 97, column: 9, scope: !138)
!170 = !DILocation(line: 97, column: 21, scope: !138)
!171 = !DILocation(line: 98, column: 19, scope: !138)
!172 = !DILocation(line: 98, column: 9, scope: !138)
!173 = !DILocation(line: 100, column: 1, scope: !113)
!174 = distinct !DISubprogram(name: "goodG2B2", scope: !11, file: !11, line: 103, type: !21, scopeLine: 104, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !23)
!175 = !DILocalVariable(name: "data", scope: !174, file: !11, line: 105, type: !5)
!176 = !DILocation(line: 105, column: 12, scope: !174)
!177 = !DILocalVariable(name: "dataBadBuffer", scope: !174, file: !11, line: 106, type: !5)
!178 = !DILocation(line: 106, column: 12, scope: !174)
!179 = !DILocation(line: 106, column: 36, scope: !174)
!180 = !DILocalVariable(name: "dataGoodBuffer", scope: !174, file: !11, line: 107, type: !5)
!181 = !DILocation(line: 107, column: 12, scope: !174)
!182 = !DILocation(line: 107, column: 37, scope: !174)
!183 = !DILocation(line: 108, column: 5, scope: !174)
!184 = !DILocation(line: 109, column: 5, scope: !174)
!185 = !DILocation(line: 109, column: 25, scope: !174)
!186 = !DILocation(line: 110, column: 5, scope: !174)
!187 = !DILocation(line: 111, column: 5, scope: !174)
!188 = !DILocation(line: 111, column: 27, scope: !174)
!189 = !DILocation(line: 112, column: 8, scope: !190)
!190 = distinct !DILexicalBlock(scope: !174, file: !11, line: 112, column: 8)
!191 = !DILocation(line: 112, column: 8, scope: !174)
!192 = !DILocation(line: 115, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !11, line: 113, column: 5)
!194 = !DILocation(line: 115, column: 14, scope: !193)
!195 = !DILocation(line: 116, column: 5, scope: !193)
!196 = !DILocalVariable(name: "i", scope: !197, file: !11, line: 118, type: !47)
!197 = distinct !DILexicalBlock(scope: !174, file: !11, line: 117, column: 5)
!198 = !DILocation(line: 118, column: 16, scope: !197)
!199 = !DILocalVariable(name: "destLen", scope: !197, file: !11, line: 118, type: !47)
!200 = !DILocation(line: 118, column: 19, scope: !197)
!201 = !DILocalVariable(name: "dest", scope: !197, file: !11, line: 119, type: !56)
!202 = !DILocation(line: 119, column: 14, scope: !197)
!203 = !DILocation(line: 120, column: 9, scope: !197)
!204 = !DILocation(line: 121, column: 9, scope: !197)
!205 = !DILocation(line: 121, column: 21, scope: !197)
!206 = !DILocation(line: 122, column: 26, scope: !197)
!207 = !DILocation(line: 122, column: 19, scope: !197)
!208 = !DILocation(line: 122, column: 17, scope: !197)
!209 = !DILocation(line: 125, column: 16, scope: !210)
!210 = distinct !DILexicalBlock(scope: !197, file: !11, line: 125, column: 9)
!211 = !DILocation(line: 125, column: 14, scope: !210)
!212 = !DILocation(line: 125, column: 21, scope: !213)
!213 = distinct !DILexicalBlock(scope: !210, file: !11, line: 125, column: 9)
!214 = !DILocation(line: 125, column: 25, scope: !213)
!215 = !DILocation(line: 125, column: 23, scope: !213)
!216 = !DILocation(line: 125, column: 9, scope: !210)
!217 = !DILocation(line: 127, column: 23, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !11, line: 126, column: 9)
!219 = !DILocation(line: 127, column: 28, scope: !218)
!220 = !DILocation(line: 127, column: 18, scope: !218)
!221 = !DILocation(line: 127, column: 13, scope: !218)
!222 = !DILocation(line: 127, column: 21, scope: !218)
!223 = !DILocation(line: 128, column: 9, scope: !218)
!224 = !DILocation(line: 125, column: 35, scope: !213)
!225 = !DILocation(line: 125, column: 9, scope: !213)
!226 = distinct !{!226, !216, !227, !85}
!227 = !DILocation(line: 128, column: 9, scope: !210)
!228 = !DILocation(line: 129, column: 9, scope: !197)
!229 = !DILocation(line: 129, column: 21, scope: !197)
!230 = !DILocation(line: 130, column: 19, scope: !197)
!231 = !DILocation(line: 130, column: 9, scope: !197)
!232 = !DILocation(line: 132, column: 1, scope: !174)
