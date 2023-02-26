; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_badData = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodG2BData = internal global i32 0, align 4, !dbg !28
@CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodB2GData = internal global i32 0, align 4, !dbg !31
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_bad() #0 !dbg !40 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 -1, i32* %data, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !50, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %connectSocket, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  br label %do.body, !dbg !75

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !76
  store i32 %call, i32* %connectSocket, align 4, !dbg !78
  %0 = load i32, i32* %connectSocket, align 4, !dbg !79
  %cmp = icmp eq i32 %0, -1, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !83

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !85
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !86
  store i8 2, i8* %sin_family, align 1, !dbg !87
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !88
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !89
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !90
  store i32 %call1, i32* %s_addr, align 4, !dbg !91
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !92
  store i16 -30871, i16* %sin_port, align 2, !dbg !93
  %2 = load i32, i32* %connectSocket, align 4, !dbg !94
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !96
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !97
  %cmp3 = icmp eq i32 %call2, -1, !dbg !98
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !99

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !100

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !102
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !103
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !104
  %conv = trunc i64 %call6 to i32, !dbg !104
  store i32 %conv, i32* %recvResult, align 4, !dbg !105
  %5 = load i32, i32* %recvResult, align 4, !dbg !106
  %cmp7 = icmp eq i32 %5, -1, !dbg !108
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !109

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !110
  %cmp9 = icmp eq i32 %6, 0, !dbg !111
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !112

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !113

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !115
  %idxprom = sext i32 %7 to i64, !dbg !116
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !118
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !119
  store i32 %call14, i32* %data, align 4, !dbg !120
  br label %do.end, !dbg !121

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !122
  %cmp15 = icmp ne i32 %8, -1, !dbg !124
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !125

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !126
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !128
  br label %if.end19, !dbg !129

if.end19:                                         ; preds = %if.then17, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !130
  store i32 %10, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_badData, align 4, !dbg !131
  call void @badSink(), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @inet_addr(i8* noundef) #2

declare i32 @"\01_connect"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #2

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #2

declare i32 @atoi(i8* noundef) #2

declare i32 @"\01_close"(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_good() #0 !dbg !134 {
entry:
  call void @goodG2B(), !dbg !135
  call void @goodB2G(), !dbg !136
  ret void, !dbg !137
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !138 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !143, metadata !DIExpression()), !dbg !144
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !145, metadata !DIExpression()), !dbg !146
  %call = call i64 @time(i64* noundef null), !dbg !147
  %conv = trunc i64 %call to i32, !dbg !148
  call void @srand(i32 noundef %conv), !dbg !149
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !150
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_good(), !dbg !151
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !152
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !153
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_bad(), !dbg !154
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !155
  ret i32 0, !dbg !156
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !157 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !158, metadata !DIExpression()), !dbg !159
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_badData, align 4, !dbg !160
  store i32 %0, i32* %data, align 4, !dbg !159
  call void @llvm.dbg.declare(metadata i32* %i, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !164, metadata !DIExpression()), !dbg !165
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !166
  %1 = bitcast i8* %call to i32*, !dbg !167
  store i32* %1, i32** %buffer, align 8, !dbg !165
  %2 = load i32*, i32** %buffer, align 8, !dbg !168
  %cmp = icmp eq i32* %2, null, !dbg !170
  br i1 %cmp, label %if.then, label %if.end, !dbg !171

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !172
  unreachable, !dbg !172

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !177
  %cmp1 = icmp slt i32 %3, 10, !dbg !179
  br i1 %cmp1, label %for.body, label %for.end, !dbg !180

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !181
  %5 = load i32, i32* %i, align 4, !dbg !183
  %idxprom = sext i32 %5 to i64, !dbg !181
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !181
  store i32 0, i32* %arrayidx, align 4, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !186
  %inc = add nsw i32 %6, 1, !dbg !186
  store i32 %inc, i32* %i, align 4, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !191
  %cmp2 = icmp sge i32 %7, 0, !dbg !193
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !194

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !195
  %9 = load i32, i32* %data, align 4, !dbg !197
  %idxprom4 = sext i32 %9 to i64, !dbg !195
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !195
  store i32 1, i32* %arrayidx5, align 4, !dbg !198
  store i32 0, i32* %i, align 4, !dbg !199
  br label %for.cond6, !dbg !201

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !202
  %cmp7 = icmp slt i32 %10, 10, !dbg !204
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !205

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !206
  %12 = load i32, i32* %i, align 4, !dbg !208
  %idxprom9 = sext i32 %12 to i64, !dbg !206
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !206
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !206
  call void @printIntLine(i32 noundef %13), !dbg !209
  br label %for.inc11, !dbg !210

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !211
  %inc12 = add nsw i32 %14, 1, !dbg !211
  store i32 %inc12, i32* %i, align 4, !dbg !211
  br label %for.cond6, !dbg !212, !llvm.loop !213

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !215

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !216
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !218
  %16 = bitcast i32* %15 to i8*, !dbg !218
  call void @free(i8* noundef %16), !dbg !219
  ret void, !dbg !220
}

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare void @printIntLine(i32 noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !221 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 -1, i32* %data, align 4, !dbg !224
  store i32 7, i32* %data, align 4, !dbg !225
  %0 = load i32, i32* %data, align 4, !dbg !226
  store i32 %0, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodG2BData, align 4, !dbg !227
  call void @goodG2BSink(), !dbg !228
  ret void, !dbg !229
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !230 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !231, metadata !DIExpression()), !dbg !232
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodG2BData, align 4, !dbg !233
  store i32 %0, i32* %data, align 4, !dbg !232
  call void @llvm.dbg.declare(metadata i32* %i, metadata !234, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !237, metadata !DIExpression()), !dbg !238
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !239
  %1 = bitcast i8* %call to i32*, !dbg !240
  store i32* %1, i32** %buffer, align 8, !dbg !238
  %2 = load i32*, i32** %buffer, align 8, !dbg !241
  %cmp = icmp eq i32* %2, null, !dbg !243
  br i1 %cmp, label %if.then, label %if.end, !dbg !244

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !245
  unreachable, !dbg !245

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !247
  br label %for.cond, !dbg !249

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !250
  %cmp1 = icmp slt i32 %3, 10, !dbg !252
  br i1 %cmp1, label %for.body, label %for.end, !dbg !253

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !254
  %5 = load i32, i32* %i, align 4, !dbg !256
  %idxprom = sext i32 %5 to i64, !dbg !254
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !254
  store i32 0, i32* %arrayidx, align 4, !dbg !257
  br label %for.inc, !dbg !258

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !259
  %inc = add nsw i32 %6, 1, !dbg !259
  store i32 %inc, i32* %i, align 4, !dbg !259
  br label %for.cond, !dbg !260, !llvm.loop !261

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !263
  %cmp2 = icmp sge i32 %7, 0, !dbg !265
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !266

if.then3:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !267
  %9 = load i32, i32* %data, align 4, !dbg !269
  %idxprom4 = sext i32 %9 to i64, !dbg !267
  %arrayidx5 = getelementptr inbounds i32, i32* %8, i64 %idxprom4, !dbg !267
  store i32 1, i32* %arrayidx5, align 4, !dbg !270
  store i32 0, i32* %i, align 4, !dbg !271
  br label %for.cond6, !dbg !273

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %10 = load i32, i32* %i, align 4, !dbg !274
  %cmp7 = icmp slt i32 %10, 10, !dbg !276
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !277

for.body8:                                        ; preds = %for.cond6
  %11 = load i32*, i32** %buffer, align 8, !dbg !278
  %12 = load i32, i32* %i, align 4, !dbg !280
  %idxprom9 = sext i32 %12 to i64, !dbg !278
  %arrayidx10 = getelementptr inbounds i32, i32* %11, i64 %idxprom9, !dbg !278
  %13 = load i32, i32* %arrayidx10, align 4, !dbg !278
  call void @printIntLine(i32 noundef %13), !dbg !281
  br label %for.inc11, !dbg !282

for.inc11:                                        ; preds = %for.body8
  %14 = load i32, i32* %i, align 4, !dbg !283
  %inc12 = add nsw i32 %14, 1, !dbg !283
  store i32 %inc12, i32* %i, align 4, !dbg !283
  br label %for.cond6, !dbg !284, !llvm.loop !285

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !287

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !288
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %15 = load i32*, i32** %buffer, align 8, !dbg !290
  %16 = bitcast i32* %15 to i8*, !dbg !290
  call void @free(i8* noundef %16), !dbg !291
  ret void, !dbg !292
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !293 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !294, metadata !DIExpression()), !dbg !295
  store i32 -1, i32* %data, align 4, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !297, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !300, metadata !DIExpression()), !dbg !301
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !302, metadata !DIExpression()), !dbg !303
  store i32 -1, i32* %connectSocket, align 4, !dbg !303
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !304, metadata !DIExpression()), !dbg !305
  br label %do.body, !dbg !306

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !307
  store i32 %call, i32* %connectSocket, align 4, !dbg !309
  %0 = load i32, i32* %connectSocket, align 4, !dbg !310
  %cmp = icmp eq i32 %0, -1, !dbg !312
  br i1 %cmp, label %if.then, label %if.end, !dbg !313

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !314

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !316
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !316
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !317
  store i8 2, i8* %sin_family, align 1, !dbg !318
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !319
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !320
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !321
  store i32 %call1, i32* %s_addr, align 4, !dbg !322
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !323
  store i16 -30871, i16* %sin_port, align 2, !dbg !324
  %2 = load i32, i32* %connectSocket, align 4, !dbg !325
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !327
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !328
  %cmp3 = icmp eq i32 %call2, -1, !dbg !329
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !330

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !331

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !333
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !334
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !335
  %conv = trunc i64 %call6 to i32, !dbg !335
  store i32 %conv, i32* %recvResult, align 4, !dbg !336
  %5 = load i32, i32* %recvResult, align 4, !dbg !337
  %cmp7 = icmp eq i32 %5, -1, !dbg !339
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !340

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !341
  %cmp9 = icmp eq i32 %6, 0, !dbg !342
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !343

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !344

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !346
  %idxprom = sext i32 %7 to i64, !dbg !347
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !347
  store i8 0, i8* %arrayidx, align 1, !dbg !348
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !349
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !350
  store i32 %call14, i32* %data, align 4, !dbg !351
  br label %do.end, !dbg !352

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !353
  %cmp15 = icmp ne i32 %8, -1, !dbg !355
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !356

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !357
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !359
  br label %if.end19, !dbg !360

if.end19:                                         ; preds = %if.then17, %do.end
  %10 = load i32, i32* %data, align 4, !dbg !361
  store i32 %10, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodB2GData, align 4, !dbg !362
  call void @goodB2GSink(), !dbg !363
  ret void, !dbg !364
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink() #0 !dbg !365 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !366, metadata !DIExpression()), !dbg !367
  %0 = load i32, i32* @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodB2GData, align 4, !dbg !368
  store i32 %0, i32* %data, align 4, !dbg !367
  call void @llvm.dbg.declare(metadata i32* %i, metadata !369, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !372, metadata !DIExpression()), !dbg !373
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !374
  %1 = bitcast i8* %call to i32*, !dbg !375
  store i32* %1, i32** %buffer, align 8, !dbg !373
  %2 = load i32*, i32** %buffer, align 8, !dbg !376
  %cmp = icmp eq i32* %2, null, !dbg !378
  br i1 %cmp, label %if.then, label %if.end, !dbg !379

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !380
  unreachable, !dbg !380

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !382
  br label %for.cond, !dbg !384

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !385
  %cmp1 = icmp slt i32 %3, 10, !dbg !387
  br i1 %cmp1, label %for.body, label %for.end, !dbg !388

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !389
  %5 = load i32, i32* %i, align 4, !dbg !391
  %idxprom = sext i32 %5 to i64, !dbg !389
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !389
  store i32 0, i32* %arrayidx, align 4, !dbg !392
  br label %for.inc, !dbg !393

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !394
  %inc = add nsw i32 %6, 1, !dbg !394
  store i32 %inc, i32* %i, align 4, !dbg !394
  br label %for.cond, !dbg !395, !llvm.loop !396

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data, align 4, !dbg !398
  %cmp2 = icmp sge i32 %7, 0, !dbg !400
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !401

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data, align 4, !dbg !402
  %cmp3 = icmp slt i32 %8, 10, !dbg !403
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !404

if.then4:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !405
  %10 = load i32, i32* %data, align 4, !dbg !407
  %idxprom5 = sext i32 %10 to i64, !dbg !405
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !405
  store i32 1, i32* %arrayidx6, align 4, !dbg !408
  store i32 0, i32* %i, align 4, !dbg !409
  br label %for.cond7, !dbg !411

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !412
  %cmp8 = icmp slt i32 %11, 10, !dbg !414
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !415

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !416
  %13 = load i32, i32* %i, align 4, !dbg !418
  %idxprom10 = sext i32 %13 to i64, !dbg !416
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !416
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !416
  call void @printIntLine(i32 noundef %14), !dbg !419
  br label %for.inc12, !dbg !420

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !421
  %inc13 = add nsw i32 %15, 1, !dbg !421
  store i32 %inc13, i32* %i, align 4, !dbg !421
  br label %for.cond7, !dbg !422, !llvm.loop !423

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !425

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !426
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !428
  %17 = bitcast i32* %16 to i8*, !dbg !428
  call void @free(i8* noundef %17), !dbg !429
  ret void, !dbg !430
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!33, !34, !35, !36, !37, !38}
!llvm.ident = !{!39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_badData", scope: !2, file: !30, line: 42, type: !25, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !27, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !8, !23, !24, !26}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !6, line: 45, baseType: !7)
!6 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!7 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !10, line: 412, size: 128, elements: !11)
!10 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!11 = !{!12, !15, !18}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !9, file: !10, line: 413, baseType: !13, size: 8)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !6, line: 43, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !9, file: !10, line: 414, baseType: !16, size: 8, offset: 8)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !17, line: 31, baseType: !13)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !9, file: !10, line: 415, baseType: !19, size: 112, offset: 16)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 112, elements: !21)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 14)
!23 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = !{!0, !28, !31}
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodG2BData", scope: !2, file: !30, line: 43, type: !25, isLocal: true, isDefinition: true)
!30 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_goodB2GData", scope: !2, file: !30, line: 44, type: !25, isLocal: true, isDefinition: true)
!33 = !{i32 7, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 7, !"PIC Level", i32 2}
!37 = !{i32 7, !"uwtable", i32 1}
!38 = !{i32 7, !"frame-pointer", i32 2}
!39 = !{!"Homebrew clang version 14.0.6"}
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_bad", scope: !30, file: !30, line: 79, type: !41, scopeLine: 80, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !43)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !{}
!44 = !DILocalVariable(name: "data", scope: !40, file: !30, line: 81, type: !25)
!45 = !DILocation(line: 81, column: 9, scope: !40)
!46 = !DILocation(line: 83, column: 10, scope: !40)
!47 = !DILocalVariable(name: "recvResult", scope: !48, file: !30, line: 89, type: !25)
!48 = distinct !DILexicalBlock(scope: !40, file: !30, line: 84, column: 5)
!49 = !DILocation(line: 89, column: 13, scope: !48)
!50 = !DILocalVariable(name: "service", scope: !48, file: !30, line: 90, type: !51)
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !52, line: 375, size: 128, elements: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!53 = !{!54, !55, !56, !59, !66}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !51, file: !52, line: 376, baseType: !13, size: 8)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !51, file: !52, line: 377, baseType: !16, size: 8, offset: 8)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !51, file: !52, line: 378, baseType: !57, size: 16, offset: 16)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !58, line: 31, baseType: !5)
!58 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !51, file: !52, line: 379, baseType: !60, size: 32, offset: 32)
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !52, line: 301, size: 32, elements: !61)
!61 = !{!62}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !60, file: !52, line: 302, baseType: !63, size: 32)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !64, line: 31, baseType: !65)
!64 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !6, line: 47, baseType: !23)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !51, file: !52, line: 380, baseType: !67, size: 64, offset: 64)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 64, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 8)
!70 = !DILocation(line: 90, column: 28, scope: !48)
!71 = !DILocalVariable(name: "connectSocket", scope: !48, file: !30, line: 91, type: !25)
!72 = !DILocation(line: 91, column: 16, scope: !48)
!73 = !DILocalVariable(name: "inputBuffer", scope: !48, file: !30, line: 92, type: !19)
!74 = !DILocation(line: 92, column: 14, scope: !48)
!75 = !DILocation(line: 93, column: 9, scope: !48)
!76 = !DILocation(line: 103, column: 29, scope: !77)
!77 = distinct !DILexicalBlock(scope: !48, file: !30, line: 94, column: 9)
!78 = !DILocation(line: 103, column: 27, scope: !77)
!79 = !DILocation(line: 104, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !30, line: 104, column: 17)
!81 = !DILocation(line: 104, column: 31, scope: !80)
!82 = !DILocation(line: 104, column: 17, scope: !77)
!83 = !DILocation(line: 106, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !30, line: 105, column: 13)
!85 = !DILocation(line: 108, column: 13, scope: !77)
!86 = !DILocation(line: 109, column: 21, scope: !77)
!87 = !DILocation(line: 109, column: 32, scope: !77)
!88 = !DILocation(line: 110, column: 39, scope: !77)
!89 = !DILocation(line: 110, column: 21, scope: !77)
!90 = !DILocation(line: 110, column: 30, scope: !77)
!91 = !DILocation(line: 110, column: 37, scope: !77)
!92 = !DILocation(line: 111, column: 21, scope: !77)
!93 = !DILocation(line: 111, column: 30, scope: !77)
!94 = !DILocation(line: 112, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !77, file: !30, line: 112, column: 17)
!96 = !DILocation(line: 112, column: 40, scope: !95)
!97 = !DILocation(line: 112, column: 17, scope: !95)
!98 = !DILocation(line: 112, column: 85, scope: !95)
!99 = !DILocation(line: 112, column: 17, scope: !77)
!100 = !DILocation(line: 114, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !30, line: 113, column: 13)
!102 = !DILocation(line: 118, column: 31, scope: !77)
!103 = !DILocation(line: 118, column: 46, scope: !77)
!104 = !DILocation(line: 118, column: 26, scope: !77)
!105 = !DILocation(line: 118, column: 24, scope: !77)
!106 = !DILocation(line: 119, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !77, file: !30, line: 119, column: 17)
!108 = !DILocation(line: 119, column: 28, scope: !107)
!109 = !DILocation(line: 119, column: 44, scope: !107)
!110 = !DILocation(line: 119, column: 47, scope: !107)
!111 = !DILocation(line: 119, column: 58, scope: !107)
!112 = !DILocation(line: 119, column: 17, scope: !77)
!113 = !DILocation(line: 121, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !30, line: 120, column: 13)
!115 = !DILocation(line: 124, column: 25, scope: !77)
!116 = !DILocation(line: 124, column: 13, scope: !77)
!117 = !DILocation(line: 124, column: 37, scope: !77)
!118 = !DILocation(line: 126, column: 25, scope: !77)
!119 = !DILocation(line: 126, column: 20, scope: !77)
!120 = !DILocation(line: 126, column: 18, scope: !77)
!121 = !DILocation(line: 127, column: 9, scope: !77)
!122 = !DILocation(line: 129, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !48, file: !30, line: 129, column: 13)
!124 = !DILocation(line: 129, column: 27, scope: !123)
!125 = !DILocation(line: 129, column: 13, scope: !48)
!126 = !DILocation(line: 131, column: 26, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !30, line: 130, column: 9)
!128 = !DILocation(line: 131, column: 13, scope: !127)
!129 = !DILocation(line: 132, column: 9, scope: !127)
!130 = !DILocation(line: 140, column: 77, scope: !40)
!131 = !DILocation(line: 140, column: 75, scope: !40)
!132 = !DILocation(line: 141, column: 5, scope: !40)
!133 = !DILocation(line: 142, column: 1, scope: !40)
!134 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_45_good", scope: !30, file: !30, line: 288, type: !41, scopeLine: 289, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !43)
!135 = !DILocation(line: 290, column: 5, scope: !134)
!136 = !DILocation(line: 291, column: 5, scope: !134)
!137 = !DILocation(line: 292, column: 1, scope: !134)
!138 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 302, type: !139, scopeLine: 303, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !43)
!139 = !DISubroutineType(types: !140)
!140 = !{!25, !25, !141}
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 64)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!143 = !DILocalVariable(name: "argc", arg: 1, scope: !138, file: !30, line: 302, type: !25)
!144 = !DILocation(line: 302, column: 14, scope: !138)
!145 = !DILocalVariable(name: "argv", arg: 2, scope: !138, file: !30, line: 302, type: !141)
!146 = !DILocation(line: 302, column: 27, scope: !138)
!147 = !DILocation(line: 305, column: 22, scope: !138)
!148 = !DILocation(line: 305, column: 12, scope: !138)
!149 = !DILocation(line: 305, column: 5, scope: !138)
!150 = !DILocation(line: 307, column: 5, scope: !138)
!151 = !DILocation(line: 308, column: 5, scope: !138)
!152 = !DILocation(line: 309, column: 5, scope: !138)
!153 = !DILocation(line: 312, column: 5, scope: !138)
!154 = !DILocation(line: 313, column: 5, scope: !138)
!155 = !DILocation(line: 314, column: 5, scope: !138)
!156 = !DILocation(line: 316, column: 5, scope: !138)
!157 = distinct !DISubprogram(name: "badSink", scope: !30, file: !30, line: 48, type: !41, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!158 = !DILocalVariable(name: "data", scope: !157, file: !30, line: 50, type: !25)
!159 = !DILocation(line: 50, column: 9, scope: !157)
!160 = !DILocation(line: 50, column: 16, scope: !157)
!161 = !DILocalVariable(name: "i", scope: !162, file: !30, line: 52, type: !25)
!162 = distinct !DILexicalBlock(scope: !157, file: !30, line: 51, column: 5)
!163 = !DILocation(line: 52, column: 13, scope: !162)
!164 = !DILocalVariable(name: "buffer", scope: !162, file: !30, line: 53, type: !24)
!165 = !DILocation(line: 53, column: 15, scope: !162)
!166 = !DILocation(line: 53, column: 31, scope: !162)
!167 = !DILocation(line: 53, column: 24, scope: !162)
!168 = !DILocation(line: 54, column: 13, scope: !169)
!169 = distinct !DILexicalBlock(scope: !162, file: !30, line: 54, column: 13)
!170 = !DILocation(line: 54, column: 20, scope: !169)
!171 = !DILocation(line: 54, column: 13, scope: !162)
!172 = !DILocation(line: 54, column: 30, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !30, line: 54, column: 29)
!174 = !DILocation(line: 56, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !162, file: !30, line: 56, column: 9)
!176 = !DILocation(line: 56, column: 14, scope: !175)
!177 = !DILocation(line: 56, column: 21, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !30, line: 56, column: 9)
!179 = !DILocation(line: 56, column: 23, scope: !178)
!180 = !DILocation(line: 56, column: 9, scope: !175)
!181 = !DILocation(line: 58, column: 13, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !30, line: 57, column: 9)
!183 = !DILocation(line: 58, column: 20, scope: !182)
!184 = !DILocation(line: 58, column: 23, scope: !182)
!185 = !DILocation(line: 59, column: 9, scope: !182)
!186 = !DILocation(line: 56, column: 30, scope: !178)
!187 = !DILocation(line: 56, column: 9, scope: !178)
!188 = distinct !{!188, !180, !189, !190}
!189 = !DILocation(line: 59, column: 9, scope: !175)
!190 = !{!"llvm.loop.mustprogress"}
!191 = !DILocation(line: 62, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !162, file: !30, line: 62, column: 13)
!193 = !DILocation(line: 62, column: 18, scope: !192)
!194 = !DILocation(line: 62, column: 13, scope: !162)
!195 = !DILocation(line: 64, column: 13, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !30, line: 63, column: 9)
!197 = !DILocation(line: 64, column: 20, scope: !196)
!198 = !DILocation(line: 64, column: 26, scope: !196)
!199 = !DILocation(line: 66, column: 19, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !30, line: 66, column: 13)
!201 = !DILocation(line: 66, column: 17, scope: !200)
!202 = !DILocation(line: 66, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !30, line: 66, column: 13)
!204 = !DILocation(line: 66, column: 26, scope: !203)
!205 = !DILocation(line: 66, column: 13, scope: !200)
!206 = !DILocation(line: 68, column: 30, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !30, line: 67, column: 13)
!208 = !DILocation(line: 68, column: 37, scope: !207)
!209 = !DILocation(line: 68, column: 17, scope: !207)
!210 = !DILocation(line: 69, column: 13, scope: !207)
!211 = !DILocation(line: 66, column: 33, scope: !203)
!212 = !DILocation(line: 66, column: 13, scope: !203)
!213 = distinct !{!213, !205, !214, !190}
!214 = !DILocation(line: 69, column: 13, scope: !200)
!215 = !DILocation(line: 70, column: 9, scope: !196)
!216 = !DILocation(line: 73, column: 13, scope: !217)
!217 = distinct !DILexicalBlock(scope: !192, file: !30, line: 72, column: 9)
!218 = !DILocation(line: 75, column: 14, scope: !162)
!219 = !DILocation(line: 75, column: 9, scope: !162)
!220 = !DILocation(line: 77, column: 1, scope: !157)
!221 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 180, type: !41, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!222 = !DILocalVariable(name: "data", scope: !221, file: !30, line: 182, type: !25)
!223 = !DILocation(line: 182, column: 9, scope: !221)
!224 = !DILocation(line: 184, column: 10, scope: !221)
!225 = !DILocation(line: 187, column: 10, scope: !221)
!226 = !DILocation(line: 188, column: 81, scope: !221)
!227 = !DILocation(line: 188, column: 79, scope: !221)
!228 = !DILocation(line: 189, column: 5, scope: !221)
!229 = !DILocation(line: 190, column: 1, scope: !221)
!230 = distinct !DISubprogram(name: "goodG2BSink", scope: !30, file: !30, line: 149, type: !41, scopeLine: 150, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!231 = !DILocalVariable(name: "data", scope: !230, file: !30, line: 151, type: !25)
!232 = !DILocation(line: 151, column: 9, scope: !230)
!233 = !DILocation(line: 151, column: 16, scope: !230)
!234 = !DILocalVariable(name: "i", scope: !235, file: !30, line: 153, type: !25)
!235 = distinct !DILexicalBlock(scope: !230, file: !30, line: 152, column: 5)
!236 = !DILocation(line: 153, column: 13, scope: !235)
!237 = !DILocalVariable(name: "buffer", scope: !235, file: !30, line: 154, type: !24)
!238 = !DILocation(line: 154, column: 15, scope: !235)
!239 = !DILocation(line: 154, column: 31, scope: !235)
!240 = !DILocation(line: 154, column: 24, scope: !235)
!241 = !DILocation(line: 155, column: 13, scope: !242)
!242 = distinct !DILexicalBlock(scope: !235, file: !30, line: 155, column: 13)
!243 = !DILocation(line: 155, column: 20, scope: !242)
!244 = !DILocation(line: 155, column: 13, scope: !235)
!245 = !DILocation(line: 155, column: 30, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !30, line: 155, column: 29)
!247 = !DILocation(line: 157, column: 16, scope: !248)
!248 = distinct !DILexicalBlock(scope: !235, file: !30, line: 157, column: 9)
!249 = !DILocation(line: 157, column: 14, scope: !248)
!250 = !DILocation(line: 157, column: 21, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !30, line: 157, column: 9)
!252 = !DILocation(line: 157, column: 23, scope: !251)
!253 = !DILocation(line: 157, column: 9, scope: !248)
!254 = !DILocation(line: 159, column: 13, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !30, line: 158, column: 9)
!256 = !DILocation(line: 159, column: 20, scope: !255)
!257 = !DILocation(line: 159, column: 23, scope: !255)
!258 = !DILocation(line: 160, column: 9, scope: !255)
!259 = !DILocation(line: 157, column: 30, scope: !251)
!260 = !DILocation(line: 157, column: 9, scope: !251)
!261 = distinct !{!261, !253, !262, !190}
!262 = !DILocation(line: 160, column: 9, scope: !248)
!263 = !DILocation(line: 163, column: 13, scope: !264)
!264 = distinct !DILexicalBlock(scope: !235, file: !30, line: 163, column: 13)
!265 = !DILocation(line: 163, column: 18, scope: !264)
!266 = !DILocation(line: 163, column: 13, scope: !235)
!267 = !DILocation(line: 165, column: 13, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !30, line: 164, column: 9)
!269 = !DILocation(line: 165, column: 20, scope: !268)
!270 = !DILocation(line: 165, column: 26, scope: !268)
!271 = !DILocation(line: 167, column: 19, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !30, line: 167, column: 13)
!273 = !DILocation(line: 167, column: 17, scope: !272)
!274 = !DILocation(line: 167, column: 24, scope: !275)
!275 = distinct !DILexicalBlock(scope: !272, file: !30, line: 167, column: 13)
!276 = !DILocation(line: 167, column: 26, scope: !275)
!277 = !DILocation(line: 167, column: 13, scope: !272)
!278 = !DILocation(line: 169, column: 30, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !30, line: 168, column: 13)
!280 = !DILocation(line: 169, column: 37, scope: !279)
!281 = !DILocation(line: 169, column: 17, scope: !279)
!282 = !DILocation(line: 170, column: 13, scope: !279)
!283 = !DILocation(line: 167, column: 33, scope: !275)
!284 = !DILocation(line: 167, column: 13, scope: !275)
!285 = distinct !{!285, !277, !286, !190}
!286 = !DILocation(line: 170, column: 13, scope: !272)
!287 = !DILocation(line: 171, column: 9, scope: !268)
!288 = !DILocation(line: 174, column: 13, scope: !289)
!289 = distinct !DILexicalBlock(scope: !264, file: !30, line: 173, column: 9)
!290 = !DILocation(line: 176, column: 14, scope: !235)
!291 = !DILocation(line: 176, column: 9, scope: !235)
!292 = !DILocation(line: 178, column: 1, scope: !230)
!293 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 223, type: !41, scopeLine: 224, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!294 = !DILocalVariable(name: "data", scope: !293, file: !30, line: 225, type: !25)
!295 = !DILocation(line: 225, column: 9, scope: !293)
!296 = !DILocation(line: 227, column: 10, scope: !293)
!297 = !DILocalVariable(name: "recvResult", scope: !298, file: !30, line: 233, type: !25)
!298 = distinct !DILexicalBlock(scope: !293, file: !30, line: 228, column: 5)
!299 = !DILocation(line: 233, column: 13, scope: !298)
!300 = !DILocalVariable(name: "service", scope: !298, file: !30, line: 234, type: !51)
!301 = !DILocation(line: 234, column: 28, scope: !298)
!302 = !DILocalVariable(name: "connectSocket", scope: !298, file: !30, line: 235, type: !25)
!303 = !DILocation(line: 235, column: 16, scope: !298)
!304 = !DILocalVariable(name: "inputBuffer", scope: !298, file: !30, line: 236, type: !19)
!305 = !DILocation(line: 236, column: 14, scope: !298)
!306 = !DILocation(line: 237, column: 9, scope: !298)
!307 = !DILocation(line: 247, column: 29, scope: !308)
!308 = distinct !DILexicalBlock(scope: !298, file: !30, line: 238, column: 9)
!309 = !DILocation(line: 247, column: 27, scope: !308)
!310 = !DILocation(line: 248, column: 17, scope: !311)
!311 = distinct !DILexicalBlock(scope: !308, file: !30, line: 248, column: 17)
!312 = !DILocation(line: 248, column: 31, scope: !311)
!313 = !DILocation(line: 248, column: 17, scope: !308)
!314 = !DILocation(line: 250, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !311, file: !30, line: 249, column: 13)
!316 = !DILocation(line: 252, column: 13, scope: !308)
!317 = !DILocation(line: 253, column: 21, scope: !308)
!318 = !DILocation(line: 253, column: 32, scope: !308)
!319 = !DILocation(line: 254, column: 39, scope: !308)
!320 = !DILocation(line: 254, column: 21, scope: !308)
!321 = !DILocation(line: 254, column: 30, scope: !308)
!322 = !DILocation(line: 254, column: 37, scope: !308)
!323 = !DILocation(line: 255, column: 21, scope: !308)
!324 = !DILocation(line: 255, column: 30, scope: !308)
!325 = !DILocation(line: 256, column: 25, scope: !326)
!326 = distinct !DILexicalBlock(scope: !308, file: !30, line: 256, column: 17)
!327 = !DILocation(line: 256, column: 40, scope: !326)
!328 = !DILocation(line: 256, column: 17, scope: !326)
!329 = !DILocation(line: 256, column: 85, scope: !326)
!330 = !DILocation(line: 256, column: 17, scope: !308)
!331 = !DILocation(line: 258, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !326, file: !30, line: 257, column: 13)
!333 = !DILocation(line: 262, column: 31, scope: !308)
!334 = !DILocation(line: 262, column: 46, scope: !308)
!335 = !DILocation(line: 262, column: 26, scope: !308)
!336 = !DILocation(line: 262, column: 24, scope: !308)
!337 = !DILocation(line: 263, column: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !308, file: !30, line: 263, column: 17)
!339 = !DILocation(line: 263, column: 28, scope: !338)
!340 = !DILocation(line: 263, column: 44, scope: !338)
!341 = !DILocation(line: 263, column: 47, scope: !338)
!342 = !DILocation(line: 263, column: 58, scope: !338)
!343 = !DILocation(line: 263, column: 17, scope: !308)
!344 = !DILocation(line: 265, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !338, file: !30, line: 264, column: 13)
!346 = !DILocation(line: 268, column: 25, scope: !308)
!347 = !DILocation(line: 268, column: 13, scope: !308)
!348 = !DILocation(line: 268, column: 37, scope: !308)
!349 = !DILocation(line: 270, column: 25, scope: !308)
!350 = !DILocation(line: 270, column: 20, scope: !308)
!351 = !DILocation(line: 270, column: 18, scope: !308)
!352 = !DILocation(line: 271, column: 9, scope: !308)
!353 = !DILocation(line: 273, column: 13, scope: !354)
!354 = distinct !DILexicalBlock(scope: !298, file: !30, line: 273, column: 13)
!355 = !DILocation(line: 273, column: 27, scope: !354)
!356 = !DILocation(line: 273, column: 13, scope: !298)
!357 = !DILocation(line: 275, column: 26, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !30, line: 274, column: 9)
!359 = !DILocation(line: 275, column: 13, scope: !358)
!360 = !DILocation(line: 276, column: 9, scope: !358)
!361 = !DILocation(line: 284, column: 81, scope: !293)
!362 = !DILocation(line: 284, column: 79, scope: !293)
!363 = !DILocation(line: 285, column: 5, scope: !293)
!364 = !DILocation(line: 286, column: 1, scope: !293)
!365 = distinct !DISubprogram(name: "goodB2GSink", scope: !30, file: !30, line: 193, type: !41, scopeLine: 194, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!366 = !DILocalVariable(name: "data", scope: !365, file: !30, line: 195, type: !25)
!367 = !DILocation(line: 195, column: 9, scope: !365)
!368 = !DILocation(line: 195, column: 16, scope: !365)
!369 = !DILocalVariable(name: "i", scope: !370, file: !30, line: 197, type: !25)
!370 = distinct !DILexicalBlock(scope: !365, file: !30, line: 196, column: 5)
!371 = !DILocation(line: 197, column: 13, scope: !370)
!372 = !DILocalVariable(name: "buffer", scope: !370, file: !30, line: 198, type: !24)
!373 = !DILocation(line: 198, column: 15, scope: !370)
!374 = !DILocation(line: 198, column: 31, scope: !370)
!375 = !DILocation(line: 198, column: 24, scope: !370)
!376 = !DILocation(line: 199, column: 13, scope: !377)
!377 = distinct !DILexicalBlock(scope: !370, file: !30, line: 199, column: 13)
!378 = !DILocation(line: 199, column: 20, scope: !377)
!379 = !DILocation(line: 199, column: 13, scope: !370)
!380 = !DILocation(line: 199, column: 30, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !30, line: 199, column: 29)
!382 = !DILocation(line: 201, column: 16, scope: !383)
!383 = distinct !DILexicalBlock(scope: !370, file: !30, line: 201, column: 9)
!384 = !DILocation(line: 201, column: 14, scope: !383)
!385 = !DILocation(line: 201, column: 21, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !30, line: 201, column: 9)
!387 = !DILocation(line: 201, column: 23, scope: !386)
!388 = !DILocation(line: 201, column: 9, scope: !383)
!389 = !DILocation(line: 203, column: 13, scope: !390)
!390 = distinct !DILexicalBlock(scope: !386, file: !30, line: 202, column: 9)
!391 = !DILocation(line: 203, column: 20, scope: !390)
!392 = !DILocation(line: 203, column: 23, scope: !390)
!393 = !DILocation(line: 204, column: 9, scope: !390)
!394 = !DILocation(line: 201, column: 30, scope: !386)
!395 = !DILocation(line: 201, column: 9, scope: !386)
!396 = distinct !{!396, !388, !397, !190}
!397 = !DILocation(line: 204, column: 9, scope: !383)
!398 = !DILocation(line: 206, column: 13, scope: !399)
!399 = distinct !DILexicalBlock(scope: !370, file: !30, line: 206, column: 13)
!400 = !DILocation(line: 206, column: 18, scope: !399)
!401 = !DILocation(line: 206, column: 23, scope: !399)
!402 = !DILocation(line: 206, column: 26, scope: !399)
!403 = !DILocation(line: 206, column: 31, scope: !399)
!404 = !DILocation(line: 206, column: 13, scope: !370)
!405 = !DILocation(line: 208, column: 13, scope: !406)
!406 = distinct !DILexicalBlock(scope: !399, file: !30, line: 207, column: 9)
!407 = !DILocation(line: 208, column: 20, scope: !406)
!408 = !DILocation(line: 208, column: 26, scope: !406)
!409 = !DILocation(line: 210, column: 19, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !30, line: 210, column: 13)
!411 = !DILocation(line: 210, column: 17, scope: !410)
!412 = !DILocation(line: 210, column: 24, scope: !413)
!413 = distinct !DILexicalBlock(scope: !410, file: !30, line: 210, column: 13)
!414 = !DILocation(line: 210, column: 26, scope: !413)
!415 = !DILocation(line: 210, column: 13, scope: !410)
!416 = !DILocation(line: 212, column: 30, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !30, line: 211, column: 13)
!418 = !DILocation(line: 212, column: 37, scope: !417)
!419 = !DILocation(line: 212, column: 17, scope: !417)
!420 = !DILocation(line: 213, column: 13, scope: !417)
!421 = !DILocation(line: 210, column: 33, scope: !413)
!422 = !DILocation(line: 210, column: 13, scope: !413)
!423 = distinct !{!423, !415, !424, !190}
!424 = !DILocation(line: 213, column: 13, scope: !410)
!425 = !DILocation(line: 214, column: 9, scope: !406)
!426 = !DILocation(line: 217, column: 13, scope: !427)
!427 = distinct !DILexicalBlock(scope: !399, file: !30, line: 216, column: 9)
!428 = !DILocation(line: 219, column: 14, scope: !370)
!429 = !DILocation(line: 219, column: 9, scope: !370)
!430 = !DILocation(line: 221, column: 1, scope: !365)
