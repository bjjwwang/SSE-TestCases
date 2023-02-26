; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__char_alloca_loop_13_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !26
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !26
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !27
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !27
  store i8 0, i8* %arrayidx, align 1, !dbg !28
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !29
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !29
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !29
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !30
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !30
  store i8 0, i8* %arrayidx2, align 1, !dbg !31
  %10 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !32
  %cmp = icmp eq i32 %10, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %11, i8** %data, align 8, !dbg !38
  br label %if.end, !dbg !39

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !40, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !48, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !50, metadata !DIExpression()), !dbg !54
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !55
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !56
  store i8 0, i8* %arrayidx3, align 1, !dbg !57
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !58
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !59
  store i64 %call5, i64* %destLen, align 8, !dbg !60
  store i64 0, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !63

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !64
  %13 = load i64, i64* %destLen, align 8, !dbg !66
  %cmp6 = icmp ult i64 %12, %13, !dbg !67
  br i1 %cmp6, label %for.body, label %for.end, !dbg !68

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !69
  %15 = load i64, i64* %i, align 8, !dbg !71
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !69
  %16 = load i8, i8* %arrayidx7, align 1, !dbg !69
  %17 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !73
  store i8 %16, i8* %arrayidx8, align 1, !dbg !74
  br label %for.inc, !dbg !75

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !76
  %inc = add i64 %18, 1, !dbg !76
  store i64 %inc, i64* %i, align 8, !dbg !76
  br label %for.cond, !dbg !77, !llvm.loop !78

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !81
  store i8 0, i8* %arrayidx9, align 1, !dbg !82
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !83
  call void @printLine(i8* noundef %arraydecay10), !dbg !84
  ret void, !dbg !85
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
define void @CWE126_Buffer_Overread__char_alloca_loop_13_good() #0 !dbg !86 {
entry:
  call void @goodG2B1(), !dbg !87
  call void @goodG2B2(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE126_Buffer_Overread__char_alloca_loop_13_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE126_Buffer_Overread__char_alloca_loop_13_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !109 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = alloca i8, i64 50, align 16, !dbg !114
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %1 = alloca i8, i64 100, align 16, !dbg !117
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !116
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !118
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !118
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !118
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !118
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !119
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !119
  store i8 0, i8* %arrayidx, align 1, !dbg !120
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !121
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !121
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !121
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !122
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !122
  store i8 0, i8* %arrayidx2, align 1, !dbg !123
  %10 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !124
  %cmp = icmp ne i32 %10, 5, !dbg !126
  br i1 %cmp, label %if.then, label %if.else, !dbg !127

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !128
  br label %if.end, !dbg !130

if.else:                                          ; preds = %entry
  %11 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !131
  store i8* %11, i8** %data, align 8, !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !134, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !139, metadata !DIExpression()), !dbg !140
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !141
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !141
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !142
  store i8 0, i8* %arrayidx3, align 1, !dbg !143
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !144
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !145
  store i64 %call5, i64* %destLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !150
  %13 = load i64, i64* %destLen, align 8, !dbg !152
  %cmp6 = icmp ult i64 %12, %13, !dbg !153
  br i1 %cmp6, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !155
  %15 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !155
  %16 = load i8, i8* %arrayidx7, align 1, !dbg !155
  %17 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !159
  store i8 %16, i8* %arrayidx8, align 1, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %18, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !166
  store i8 0, i8* %arrayidx9, align 1, !dbg !167
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !168
  call void @printLine(i8* noundef %arraydecay10), !dbg !169
  ret void, !dbg !170
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !171 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !172, metadata !DIExpression()), !dbg !173
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !174, metadata !DIExpression()), !dbg !175
  %0 = alloca i8, i64 50, align 16, !dbg !176
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !175
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !177, metadata !DIExpression()), !dbg !178
  %1 = alloca i8, i64 100, align 16, !dbg !179
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !178
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !180
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !180
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !180
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !180
  %5 = load i8*, i8** %dataBadBuffer, align 8, !dbg !181
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !181
  store i8 0, i8* %arrayidx, align 1, !dbg !182
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !183
  %7 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !183
  %8 = call i64 @llvm.objectsize.i64.p0i8(i8* %7, i1 false, i1 true, i1 false), !dbg !183
  %call1 = call i8* @__memset_chk(i8* noundef %6, i32 noundef 65, i64 noundef 99, i64 noundef %8) #5, !dbg !183
  %9 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !184
  %arrayidx2 = getelementptr inbounds i8, i8* %9, i64 99, !dbg !184
  store i8 0, i8* %arrayidx2, align 1, !dbg !185
  %10 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !186
  %cmp = icmp eq i32 %10, 5, !dbg !188
  br i1 %cmp, label %if.then, label %if.end, !dbg !189

if.then:                                          ; preds = %entry
  %11 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !190
  store i8* %11, i8** %data, align 8, !dbg !192
  br label %if.end, !dbg !193

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !194, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !199, metadata !DIExpression()), !dbg !200
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !201
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !201
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !202
  store i8 0, i8* %arrayidx3, align 1, !dbg !203
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !204
  %call5 = call i64 @strlen(i8* noundef %arraydecay4), !dbg !205
  store i64 %call5, i64* %destLen, align 8, !dbg !206
  store i64 0, i64* %i, align 8, !dbg !207
  br label %for.cond, !dbg !209

for.cond:                                         ; preds = %for.inc, %if.end
  %12 = load i64, i64* %i, align 8, !dbg !210
  %13 = load i64, i64* %destLen, align 8, !dbg !212
  %cmp6 = icmp ult i64 %12, %13, !dbg !213
  br i1 %cmp6, label %for.body, label %for.end, !dbg !214

for.body:                                         ; preds = %for.cond
  %14 = load i8*, i8** %data, align 8, !dbg !215
  %15 = load i64, i64* %i, align 8, !dbg !217
  %arrayidx7 = getelementptr inbounds i8, i8* %14, i64 %15, !dbg !215
  %16 = load i8, i8* %arrayidx7, align 1, !dbg !215
  %17 = load i64, i64* %i, align 8, !dbg !218
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %17, !dbg !219
  store i8 %16, i8* %arrayidx8, align 1, !dbg !220
  br label %for.inc, !dbg !221

for.inc:                                          ; preds = %for.body
  %18 = load i64, i64* %i, align 8, !dbg !222
  %inc = add i64 %18, 1, !dbg !222
  store i64 %inc, i64* %i, align 8, !dbg !222
  br label %for.cond, !dbg !223, !llvm.loop !224

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !226
  store i8 0, i8* %arrayidx9, align 1, !dbg !227
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !228
  call void @printLine(i8* noundef %arraydecay10), !dbg !229
  ret void, !dbg !230
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_13_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__char_alloca_loop_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 28, column: 5, scope: !13)
!27 = !DILocation(line: 29, column: 5, scope: !13)
!28 = !DILocation(line: 29, column: 25, scope: !13)
!29 = !DILocation(line: 30, column: 5, scope: !13)
!30 = !DILocation(line: 31, column: 5, scope: !13)
!31 = !DILocation(line: 31, column: 27, scope: !13)
!32 = !DILocation(line: 32, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!34 = !DILocation(line: 32, column: 25, scope: !33)
!35 = !DILocation(line: 32, column: 8, scope: !13)
!36 = !DILocation(line: 35, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 33, column: 5)
!38 = !DILocation(line: 35, column: 14, scope: !37)
!39 = !DILocation(line: 36, column: 5, scope: !37)
!40 = !DILocalVariable(name: "i", scope: !41, file: !14, line: 38, type: !42)
!41 = distinct !DILexicalBlock(scope: !13, file: !14, line: 37, column: 5)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !43, line: 31, baseType: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !45, line: 94, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 38, column: 16, scope: !41)
!48 = !DILocalVariable(name: "destLen", scope: !41, file: !14, line: 38, type: !42)
!49 = !DILocation(line: 38, column: 19, scope: !41)
!50 = !DILocalVariable(name: "dest", scope: !41, file: !14, line: 39, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 100)
!54 = !DILocation(line: 39, column: 14, scope: !41)
!55 = !DILocation(line: 40, column: 9, scope: !41)
!56 = !DILocation(line: 41, column: 9, scope: !41)
!57 = !DILocation(line: 41, column: 21, scope: !41)
!58 = !DILocation(line: 42, column: 26, scope: !41)
!59 = !DILocation(line: 42, column: 19, scope: !41)
!60 = !DILocation(line: 42, column: 17, scope: !41)
!61 = !DILocation(line: 45, column: 16, scope: !62)
!62 = distinct !DILexicalBlock(scope: !41, file: !14, line: 45, column: 9)
!63 = !DILocation(line: 45, column: 14, scope: !62)
!64 = !DILocation(line: 45, column: 21, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !14, line: 45, column: 9)
!66 = !DILocation(line: 45, column: 25, scope: !65)
!67 = !DILocation(line: 45, column: 23, scope: !65)
!68 = !DILocation(line: 45, column: 9, scope: !62)
!69 = !DILocation(line: 47, column: 23, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !14, line: 46, column: 9)
!71 = !DILocation(line: 47, column: 28, scope: !70)
!72 = !DILocation(line: 47, column: 18, scope: !70)
!73 = !DILocation(line: 47, column: 13, scope: !70)
!74 = !DILocation(line: 47, column: 21, scope: !70)
!75 = !DILocation(line: 48, column: 9, scope: !70)
!76 = !DILocation(line: 45, column: 35, scope: !65)
!77 = !DILocation(line: 45, column: 9, scope: !65)
!78 = distinct !{!78, !68, !79, !80}
!79 = !DILocation(line: 48, column: 9, scope: !62)
!80 = !{!"llvm.loop.mustprogress"}
!81 = !DILocation(line: 49, column: 9, scope: !41)
!82 = !DILocation(line: 49, column: 21, scope: !41)
!83 = !DILocation(line: 50, column: 19, scope: !41)
!84 = !DILocation(line: 50, column: 9, scope: !41)
!85 = !DILocation(line: 52, column: 1, scope: !13)
!86 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_13_good", scope: !14, file: !14, line: 127, type: !15, scopeLine: 128, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!87 = !DILocation(line: 129, column: 5, scope: !86)
!88 = !DILocation(line: 130, column: 5, scope: !86)
!89 = !DILocation(line: 131, column: 1, scope: !86)
!90 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 143, type: !91, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !93, !94}
!93 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !14, line: 143, type: !93)
!96 = !DILocation(line: 143, column: 14, scope: !90)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !14, line: 143, type: !94)
!98 = !DILocation(line: 143, column: 27, scope: !90)
!99 = !DILocation(line: 146, column: 22, scope: !90)
!100 = !DILocation(line: 146, column: 12, scope: !90)
!101 = !DILocation(line: 146, column: 5, scope: !90)
!102 = !DILocation(line: 148, column: 5, scope: !90)
!103 = !DILocation(line: 149, column: 5, scope: !90)
!104 = !DILocation(line: 150, column: 5, scope: !90)
!105 = !DILocation(line: 153, column: 5, scope: !90)
!106 = !DILocation(line: 154, column: 5, scope: !90)
!107 = !DILocation(line: 155, column: 5, scope: !90)
!108 = !DILocation(line: 157, column: 5, scope: !90)
!109 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 59, type: !15, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!110 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 61, type: !3)
!111 = !DILocation(line: 61, column: 12, scope: !109)
!112 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !14, line: 62, type: !3)
!113 = !DILocation(line: 62, column: 12, scope: !109)
!114 = !DILocation(line: 62, column: 36, scope: !109)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !14, line: 63, type: !3)
!116 = !DILocation(line: 63, column: 12, scope: !109)
!117 = !DILocation(line: 63, column: 37, scope: !109)
!118 = !DILocation(line: 64, column: 5, scope: !109)
!119 = !DILocation(line: 65, column: 5, scope: !109)
!120 = !DILocation(line: 65, column: 25, scope: !109)
!121 = !DILocation(line: 66, column: 5, scope: !109)
!122 = !DILocation(line: 67, column: 5, scope: !109)
!123 = !DILocation(line: 67, column: 27, scope: !109)
!124 = !DILocation(line: 68, column: 8, scope: !125)
!125 = distinct !DILexicalBlock(scope: !109, file: !14, line: 68, column: 8)
!126 = !DILocation(line: 68, column: 25, scope: !125)
!127 = !DILocation(line: 68, column: 8, scope: !109)
!128 = !DILocation(line: 71, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !14, line: 69, column: 5)
!130 = !DILocation(line: 72, column: 5, scope: !129)
!131 = !DILocation(line: 76, column: 16, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !14, line: 74, column: 5)
!133 = !DILocation(line: 76, column: 14, scope: !132)
!134 = !DILocalVariable(name: "i", scope: !135, file: !14, line: 79, type: !42)
!135 = distinct !DILexicalBlock(scope: !109, file: !14, line: 78, column: 5)
!136 = !DILocation(line: 79, column: 16, scope: !135)
!137 = !DILocalVariable(name: "destLen", scope: !135, file: !14, line: 79, type: !42)
!138 = !DILocation(line: 79, column: 19, scope: !135)
!139 = !DILocalVariable(name: "dest", scope: !135, file: !14, line: 80, type: !51)
!140 = !DILocation(line: 80, column: 14, scope: !135)
!141 = !DILocation(line: 81, column: 9, scope: !135)
!142 = !DILocation(line: 82, column: 9, scope: !135)
!143 = !DILocation(line: 82, column: 21, scope: !135)
!144 = !DILocation(line: 83, column: 26, scope: !135)
!145 = !DILocation(line: 83, column: 19, scope: !135)
!146 = !DILocation(line: 83, column: 17, scope: !135)
!147 = !DILocation(line: 86, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !135, file: !14, line: 86, column: 9)
!149 = !DILocation(line: 86, column: 14, scope: !148)
!150 = !DILocation(line: 86, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !14, line: 86, column: 9)
!152 = !DILocation(line: 86, column: 25, scope: !151)
!153 = !DILocation(line: 86, column: 23, scope: !151)
!154 = !DILocation(line: 86, column: 9, scope: !148)
!155 = !DILocation(line: 88, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !14, line: 87, column: 9)
!157 = !DILocation(line: 88, column: 28, scope: !156)
!158 = !DILocation(line: 88, column: 18, scope: !156)
!159 = !DILocation(line: 88, column: 13, scope: !156)
!160 = !DILocation(line: 88, column: 21, scope: !156)
!161 = !DILocation(line: 89, column: 9, scope: !156)
!162 = !DILocation(line: 86, column: 35, scope: !151)
!163 = !DILocation(line: 86, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165, !80}
!165 = !DILocation(line: 89, column: 9, scope: !148)
!166 = !DILocation(line: 90, column: 9, scope: !135)
!167 = !DILocation(line: 90, column: 21, scope: !135)
!168 = !DILocation(line: 91, column: 19, scope: !135)
!169 = !DILocation(line: 91, column: 9, scope: !135)
!170 = !DILocation(line: 93, column: 1, scope: !109)
!171 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 96, type: !15, scopeLine: 97, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!172 = !DILocalVariable(name: "data", scope: !171, file: !14, line: 98, type: !3)
!173 = !DILocation(line: 98, column: 12, scope: !171)
!174 = !DILocalVariable(name: "dataBadBuffer", scope: !171, file: !14, line: 99, type: !3)
!175 = !DILocation(line: 99, column: 12, scope: !171)
!176 = !DILocation(line: 99, column: 36, scope: !171)
!177 = !DILocalVariable(name: "dataGoodBuffer", scope: !171, file: !14, line: 100, type: !3)
!178 = !DILocation(line: 100, column: 12, scope: !171)
!179 = !DILocation(line: 100, column: 37, scope: !171)
!180 = !DILocation(line: 101, column: 5, scope: !171)
!181 = !DILocation(line: 102, column: 5, scope: !171)
!182 = !DILocation(line: 102, column: 25, scope: !171)
!183 = !DILocation(line: 103, column: 5, scope: !171)
!184 = !DILocation(line: 104, column: 5, scope: !171)
!185 = !DILocation(line: 104, column: 27, scope: !171)
!186 = !DILocation(line: 105, column: 8, scope: !187)
!187 = distinct !DILexicalBlock(scope: !171, file: !14, line: 105, column: 8)
!188 = !DILocation(line: 105, column: 25, scope: !187)
!189 = !DILocation(line: 105, column: 8, scope: !171)
!190 = !DILocation(line: 108, column: 16, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !14, line: 106, column: 5)
!192 = !DILocation(line: 108, column: 14, scope: !191)
!193 = !DILocation(line: 109, column: 5, scope: !191)
!194 = !DILocalVariable(name: "i", scope: !195, file: !14, line: 111, type: !42)
!195 = distinct !DILexicalBlock(scope: !171, file: !14, line: 110, column: 5)
!196 = !DILocation(line: 111, column: 16, scope: !195)
!197 = !DILocalVariable(name: "destLen", scope: !195, file: !14, line: 111, type: !42)
!198 = !DILocation(line: 111, column: 19, scope: !195)
!199 = !DILocalVariable(name: "dest", scope: !195, file: !14, line: 112, type: !51)
!200 = !DILocation(line: 112, column: 14, scope: !195)
!201 = !DILocation(line: 113, column: 9, scope: !195)
!202 = !DILocation(line: 114, column: 9, scope: !195)
!203 = !DILocation(line: 114, column: 21, scope: !195)
!204 = !DILocation(line: 115, column: 26, scope: !195)
!205 = !DILocation(line: 115, column: 19, scope: !195)
!206 = !DILocation(line: 115, column: 17, scope: !195)
!207 = !DILocation(line: 118, column: 16, scope: !208)
!208 = distinct !DILexicalBlock(scope: !195, file: !14, line: 118, column: 9)
!209 = !DILocation(line: 118, column: 14, scope: !208)
!210 = !DILocation(line: 118, column: 21, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !14, line: 118, column: 9)
!212 = !DILocation(line: 118, column: 25, scope: !211)
!213 = !DILocation(line: 118, column: 23, scope: !211)
!214 = !DILocation(line: 118, column: 9, scope: !208)
!215 = !DILocation(line: 120, column: 23, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !14, line: 119, column: 9)
!217 = !DILocation(line: 120, column: 28, scope: !216)
!218 = !DILocation(line: 120, column: 18, scope: !216)
!219 = !DILocation(line: 120, column: 13, scope: !216)
!220 = !DILocation(line: 120, column: 21, scope: !216)
!221 = !DILocation(line: 121, column: 9, scope: !216)
!222 = !DILocation(line: 118, column: 35, scope: !211)
!223 = !DILocation(line: 118, column: 9, scope: !211)
!224 = distinct !{!224, !214, !225, !80}
!225 = !DILocation(line: 121, column: 9, scope: !208)
!226 = !DILocation(line: 122, column: 9, scope: !195)
!227 = !DILocation(line: 122, column: 21, scope: !195)
!228 = !DILocation(line: 123, column: 19, scope: !195)
!229 = !DILocation(line: 123, column: 9, scope: !195)
!230 = !DILocation(line: 125, column: 1, scope: !171)
