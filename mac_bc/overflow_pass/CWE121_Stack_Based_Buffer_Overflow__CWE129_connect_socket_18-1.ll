; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  store i32 -1, i32* %data, align 4, !dbg !37
  br label %source, !dbg !38

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !39), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !41, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !44, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !65, metadata !DIExpression()), !dbg !66
  store i32 -1, i32* %connectSocket, align 4, !dbg !66
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !67, metadata !DIExpression()), !dbg !68
  br label %do.body, !dbg !69

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !70
  store i32 %call, i32* %connectSocket, align 4, !dbg !72
  %0 = load i32, i32* %connectSocket, align 4, !dbg !73
  %cmp = icmp eq i32 %0, -1, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !77

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !79
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !79
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !80
  store i8 2, i8* %sin_family, align 1, !dbg !81
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !82
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !83
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !84
  store i32 %call1, i32* %s_addr, align 4, !dbg !85
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !86
  store i16 -30871, i16* %sin_port, align 2, !dbg !87
  %2 = load i32, i32* %connectSocket, align 4, !dbg !88
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !90
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !91
  %cmp3 = icmp eq i32 %call2, -1, !dbg !92
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !93

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !94

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !96
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !97
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !98
  %conv = trunc i64 %call6 to i32, !dbg !98
  store i32 %conv, i32* %recvResult, align 4, !dbg !99
  %5 = load i32, i32* %recvResult, align 4, !dbg !100
  %cmp7 = icmp eq i32 %5, -1, !dbg !102
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !103

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !104
  %cmp9 = icmp eq i32 %6, 0, !dbg !105
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !106

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !107

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !109
  %idxprom = sext i32 %7 to i64, !dbg !110
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !110
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !112
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !113
  store i32 %call14, i32* %data, align 4, !dbg !114
  br label %do.end, !dbg !115

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !116
  %cmp15 = icmp ne i32 %8, -1, !dbg !118
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !119

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !120
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !122
  br label %if.end19, !dbg !123

if.end19:                                         ; preds = %if.then17, %do.end
  br label %sink, !dbg !124

sink:                                             ; preds = %if.end19
  call void @llvm.dbg.label(metadata !125), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !130, metadata !DIExpression()), !dbg !134
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !134
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !134
  %11 = load i32, i32* %data, align 4, !dbg !135
  %cmp20 = icmp sge i32 %11, 0, !dbg !137
  br i1 %cmp20, label %if.then22, label %if.else, !dbg !138

if.then22:                                        ; preds = %sink
  %12 = load i32, i32* %data, align 4, !dbg !139
  %idxprom23 = sext i32 %12 to i64, !dbg !141
  %arrayidx24 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom23, !dbg !141
  store i32 1, i32* %arrayidx24, align 4, !dbg !142
  store i32 0, i32* %i, align 4, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %if.then22
  %13 = load i32, i32* %i, align 4, !dbg !146
  %cmp25 = icmp slt i32 %13, 10, !dbg !148
  br i1 %cmp25, label %for.body, label %for.end, !dbg !149

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %i, align 4, !dbg !150
  %idxprom27 = sext i32 %14 to i64, !dbg !152
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !152
  %15 = load i32, i32* %arrayidx28, align 4, !dbg !152
  call void @printIntLine(i32 noundef %15), !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !155
  %inc = add nsw i32 %16, 1, !dbg !155
  store i32 %inc, i32* %i, align 4, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  br label %if.end29, !dbg !160

if.else:                                          ; preds = %sink
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !161
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end
  ret void, !dbg !163
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @inet_addr(i8* noundef) #2

declare i32 @"\01_connect"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #2

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #2

declare i32 @atoi(i8* noundef) #2

declare i32 @"\01_close"(i32 noundef) #2

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18_good() #0 !dbg !164 {
entry:
  call void @goodB2G(), !dbg !165
  call void @goodG2B(), !dbg !166
  ret void, !dbg !167
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !168 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !173, metadata !DIExpression()), !dbg !174
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !175, metadata !DIExpression()), !dbg !176
  %call = call i64 @time(i64* noundef null), !dbg !177
  %conv = trunc i64 %call to i32, !dbg !178
  call void @srand(i32 noundef %conv), !dbg !179
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !180
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18_good(), !dbg !181
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !182
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !183
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18_bad(), !dbg !184
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !185
  ret i32 0, !dbg !186
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !187 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !188, metadata !DIExpression()), !dbg !189
  store i32 -1, i32* %data, align 4, !dbg !190
  br label %source, !dbg !191

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !192), !dbg !193
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !194, metadata !DIExpression()), !dbg !196
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !197, metadata !DIExpression()), !dbg !198
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !199, metadata !DIExpression()), !dbg !200
  store i32 -1, i32* %connectSocket, align 4, !dbg !200
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !201, metadata !DIExpression()), !dbg !202
  br label %do.body, !dbg !203

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !204
  store i32 %call, i32* %connectSocket, align 4, !dbg !206
  %0 = load i32, i32* %connectSocket, align 4, !dbg !207
  %cmp = icmp eq i32 %0, -1, !dbg !209
  br i1 %cmp, label %if.then, label %if.end, !dbg !210

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !211

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !213
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !213
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !214
  store i8 2, i8* %sin_family, align 1, !dbg !215
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !216
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !217
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !218
  store i32 %call1, i32* %s_addr, align 4, !dbg !219
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !220
  store i16 -30871, i16* %sin_port, align 2, !dbg !221
  %2 = load i32, i32* %connectSocket, align 4, !dbg !222
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !224
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !225
  %cmp3 = icmp eq i32 %call2, -1, !dbg !226
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !227

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !228

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !230
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !231
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !232
  %conv = trunc i64 %call6 to i32, !dbg !232
  store i32 %conv, i32* %recvResult, align 4, !dbg !233
  %5 = load i32, i32* %recvResult, align 4, !dbg !234
  %cmp7 = icmp eq i32 %5, -1, !dbg !236
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !237

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !238
  %cmp9 = icmp eq i32 %6, 0, !dbg !239
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !240

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !241

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !243
  %idxprom = sext i32 %7 to i64, !dbg !244
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !244
  store i8 0, i8* %arrayidx, align 1, !dbg !245
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !246
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !247
  store i32 %call14, i32* %data, align 4, !dbg !248
  br label %do.end, !dbg !249

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !250
  %cmp15 = icmp ne i32 %8, -1, !dbg !252
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !253

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !254
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !256
  br label %if.end19, !dbg !257

if.end19:                                         ; preds = %if.then17, %do.end
  br label %sink, !dbg !258

sink:                                             ; preds = %if.end19
  call void @llvm.dbg.label(metadata !259), !dbg !260
  call void @llvm.dbg.declare(metadata i32* %i, metadata !261, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !264, metadata !DIExpression()), !dbg !265
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !265
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !265
  %11 = load i32, i32* %data, align 4, !dbg !266
  %cmp20 = icmp sge i32 %11, 0, !dbg !268
  br i1 %cmp20, label %land.lhs.true, label %if.else, !dbg !269

land.lhs.true:                                    ; preds = %sink
  %12 = load i32, i32* %data, align 4, !dbg !270
  %cmp22 = icmp slt i32 %12, 10, !dbg !271
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !272

if.then24:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !273
  %idxprom25 = sext i32 %13 to i64, !dbg !275
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !275
  store i32 1, i32* %arrayidx26, align 4, !dbg !276
  store i32 0, i32* %i, align 4, !dbg !277
  br label %for.cond, !dbg !279

for.cond:                                         ; preds = %for.inc, %if.then24
  %14 = load i32, i32* %i, align 4, !dbg !280
  %cmp27 = icmp slt i32 %14, 10, !dbg !282
  br i1 %cmp27, label %for.body, label %for.end, !dbg !283

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !284
  %idxprom29 = sext i32 %15 to i64, !dbg !286
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !286
  %16 = load i32, i32* %arrayidx30, align 4, !dbg !286
  call void @printIntLine(i32 noundef %16), !dbg !287
  br label %for.inc, !dbg !288

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !289
  %inc = add nsw i32 %17, 1, !dbg !289
  store i32 %inc, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !290, !llvm.loop !291

for.end:                                          ; preds = %for.cond
  br label %if.end31, !dbg !293

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !294
  br label %if.end31

if.end31:                                         ; preds = %if.else, %for.end
  ret void, !dbg !296
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !297 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !298, metadata !DIExpression()), !dbg !299
  store i32 -1, i32* %data, align 4, !dbg !300
  br label %source, !dbg !301

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !302), !dbg !303
  store i32 7, i32* %data, align 4, !dbg !304
  br label %sink, !dbg !305

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !306), !dbg !307
  call void @llvm.dbg.declare(metadata i32* %i, metadata !308, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !311, metadata !DIExpression()), !dbg !312
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !312
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !312
  %1 = load i32, i32* %data, align 4, !dbg !313
  %cmp = icmp sge i32 %1, 0, !dbg !315
  br i1 %cmp, label %if.then, label %if.else, !dbg !316

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !317
  %idxprom = sext i32 %2 to i64, !dbg !319
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !319
  store i32 1, i32* %arrayidx, align 4, !dbg !320
  store i32 0, i32* %i, align 4, !dbg !321
  br label %for.cond, !dbg !323

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !324
  %cmp1 = icmp slt i32 %3, 10, !dbg !326
  br i1 %cmp1, label %for.body, label %for.end, !dbg !327

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !328
  %idxprom2 = sext i32 %4 to i64, !dbg !330
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !330
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !330
  call void @printIntLine(i32 noundef %5), !dbg !331
  br label %for.inc, !dbg !332

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !333
  %inc = add nsw i32 %6, 1, !dbg !333
  store i32 %inc, i32* %i, align 4, !dbg !333
  br label %for.cond, !dbg !334, !llvm.loop !335

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !337

if.else:                                          ; preds = %sink
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !338
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !340
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !21}
!3 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !4, line: 45, baseType: !5)
!4 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!5 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !8, line: 412, size: 128, elements: !9)
!8 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!9 = !{!10, !13, !16}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !7, file: !8, line: 413, baseType: !11, size: 8)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !4, line: 43, baseType: !12)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !7, file: !8, line: 414, baseType: !14, size: 8, offset: 8)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !15, line: 31, baseType: !11)
!15 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !7, file: !8, line: 415, baseType: !17, size: 112, offset: 16)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 112, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 14)
!21 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"uwtable", i32 1}
!27 = !{i32 7, !"frame-pointer", i32 2}
!28 = !{!"Homebrew clang version 14.0.6"}
!29 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18_bad", scope: !30, file: !30, line: 44, type: !31, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 46, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 46, column: 9, scope: !29)
!37 = !DILocation(line: 48, column: 10, scope: !29)
!38 = !DILocation(line: 49, column: 5, scope: !29)
!39 = !DILabel(scope: !29, name: "source", file: !30, line: 50)
!40 = !DILocation(line: 50, column: 1, scope: !29)
!41 = !DILocalVariable(name: "recvResult", scope: !42, file: !30, line: 56, type: !35)
!42 = distinct !DILexicalBlock(scope: !29, file: !30, line: 51, column: 5)
!43 = !DILocation(line: 56, column: 13, scope: !42)
!44 = !DILocalVariable(name: "service", scope: !42, file: !30, line: 57, type: !45)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !46, line: 375, size: 128, elements: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!47 = !{!48, !49, !50, !53, !60}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !45, file: !46, line: 376, baseType: !11, size: 8)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !45, file: !46, line: 377, baseType: !14, size: 8, offset: 8)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !45, file: !46, line: 378, baseType: !51, size: 16, offset: 16)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !52, line: 31, baseType: !3)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!53 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !45, file: !46, line: 379, baseType: !54, size: 32, offset: 32)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !46, line: 301, size: 32, elements: !55)
!55 = !{!56}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !54, file: !46, line: 302, baseType: !57, size: 32)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !58, line: 31, baseType: !59)
!58 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !45, file: !46, line: 380, baseType: !61, size: 64, offset: 64)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 8)
!64 = !DILocation(line: 57, column: 28, scope: !42)
!65 = !DILocalVariable(name: "connectSocket", scope: !42, file: !30, line: 58, type: !35)
!66 = !DILocation(line: 58, column: 16, scope: !42)
!67 = !DILocalVariable(name: "inputBuffer", scope: !42, file: !30, line: 59, type: !17)
!68 = !DILocation(line: 59, column: 14, scope: !42)
!69 = !DILocation(line: 60, column: 9, scope: !42)
!70 = !DILocation(line: 70, column: 29, scope: !71)
!71 = distinct !DILexicalBlock(scope: !42, file: !30, line: 61, column: 9)
!72 = !DILocation(line: 70, column: 27, scope: !71)
!73 = !DILocation(line: 71, column: 17, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !30, line: 71, column: 17)
!75 = !DILocation(line: 71, column: 31, scope: !74)
!76 = !DILocation(line: 71, column: 17, scope: !71)
!77 = !DILocation(line: 73, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !30, line: 72, column: 13)
!79 = !DILocation(line: 75, column: 13, scope: !71)
!80 = !DILocation(line: 76, column: 21, scope: !71)
!81 = !DILocation(line: 76, column: 32, scope: !71)
!82 = !DILocation(line: 77, column: 39, scope: !71)
!83 = !DILocation(line: 77, column: 21, scope: !71)
!84 = !DILocation(line: 77, column: 30, scope: !71)
!85 = !DILocation(line: 77, column: 37, scope: !71)
!86 = !DILocation(line: 78, column: 21, scope: !71)
!87 = !DILocation(line: 78, column: 30, scope: !71)
!88 = !DILocation(line: 79, column: 25, scope: !89)
!89 = distinct !DILexicalBlock(scope: !71, file: !30, line: 79, column: 17)
!90 = !DILocation(line: 79, column: 40, scope: !89)
!91 = !DILocation(line: 79, column: 17, scope: !89)
!92 = !DILocation(line: 79, column: 85, scope: !89)
!93 = !DILocation(line: 79, column: 17, scope: !71)
!94 = !DILocation(line: 81, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !30, line: 80, column: 13)
!96 = !DILocation(line: 85, column: 31, scope: !71)
!97 = !DILocation(line: 85, column: 46, scope: !71)
!98 = !DILocation(line: 85, column: 26, scope: !71)
!99 = !DILocation(line: 85, column: 24, scope: !71)
!100 = !DILocation(line: 86, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !71, file: !30, line: 86, column: 17)
!102 = !DILocation(line: 86, column: 28, scope: !101)
!103 = !DILocation(line: 86, column: 44, scope: !101)
!104 = !DILocation(line: 86, column: 47, scope: !101)
!105 = !DILocation(line: 86, column: 58, scope: !101)
!106 = !DILocation(line: 86, column: 17, scope: !71)
!107 = !DILocation(line: 88, column: 17, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !30, line: 87, column: 13)
!109 = !DILocation(line: 91, column: 25, scope: !71)
!110 = !DILocation(line: 91, column: 13, scope: !71)
!111 = !DILocation(line: 91, column: 37, scope: !71)
!112 = !DILocation(line: 93, column: 25, scope: !71)
!113 = !DILocation(line: 93, column: 20, scope: !71)
!114 = !DILocation(line: 93, column: 18, scope: !71)
!115 = !DILocation(line: 94, column: 9, scope: !71)
!116 = !DILocation(line: 96, column: 13, scope: !117)
!117 = distinct !DILexicalBlock(scope: !42, file: !30, line: 96, column: 13)
!118 = !DILocation(line: 96, column: 27, scope: !117)
!119 = !DILocation(line: 96, column: 13, scope: !42)
!120 = !DILocation(line: 98, column: 26, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !30, line: 97, column: 9)
!122 = !DILocation(line: 98, column: 13, scope: !121)
!123 = !DILocation(line: 99, column: 9, scope: !121)
!124 = !DILocation(line: 107, column: 5, scope: !29)
!125 = !DILabel(scope: !29, name: "sink", file: !30, line: 108)
!126 = !DILocation(line: 108, column: 1, scope: !29)
!127 = !DILocalVariable(name: "i", scope: !128, file: !30, line: 110, type: !35)
!128 = distinct !DILexicalBlock(scope: !29, file: !30, line: 109, column: 5)
!129 = !DILocation(line: 110, column: 13, scope: !128)
!130 = !DILocalVariable(name: "buffer", scope: !128, file: !30, line: 111, type: !131)
!131 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !132)
!132 = !{!133}
!133 = !DISubrange(count: 10)
!134 = !DILocation(line: 111, column: 13, scope: !128)
!135 = !DILocation(line: 114, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !128, file: !30, line: 114, column: 13)
!137 = !DILocation(line: 114, column: 18, scope: !136)
!138 = !DILocation(line: 114, column: 13, scope: !128)
!139 = !DILocation(line: 116, column: 20, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !30, line: 115, column: 9)
!141 = !DILocation(line: 116, column: 13, scope: !140)
!142 = !DILocation(line: 116, column: 26, scope: !140)
!143 = !DILocation(line: 118, column: 19, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !30, line: 118, column: 13)
!145 = !DILocation(line: 118, column: 17, scope: !144)
!146 = !DILocation(line: 118, column: 24, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !30, line: 118, column: 13)
!148 = !DILocation(line: 118, column: 26, scope: !147)
!149 = !DILocation(line: 118, column: 13, scope: !144)
!150 = !DILocation(line: 120, column: 37, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !30, line: 119, column: 13)
!152 = !DILocation(line: 120, column: 30, scope: !151)
!153 = !DILocation(line: 120, column: 17, scope: !151)
!154 = !DILocation(line: 121, column: 13, scope: !151)
!155 = !DILocation(line: 118, column: 33, scope: !147)
!156 = !DILocation(line: 118, column: 13, scope: !147)
!157 = distinct !{!157, !149, !158, !159}
!158 = !DILocation(line: 121, column: 13, scope: !144)
!159 = !{!"llvm.loop.mustprogress"}
!160 = !DILocation(line: 122, column: 9, scope: !140)
!161 = !DILocation(line: 125, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !136, file: !30, line: 124, column: 9)
!163 = !DILocation(line: 128, column: 1, scope: !29)
!164 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_18_good", scope: !30, file: !30, line: 254, type: !31, scopeLine: 255, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!165 = !DILocation(line: 256, column: 5, scope: !164)
!166 = !DILocation(line: 257, column: 5, scope: !164)
!167 = !DILocation(line: 258, column: 1, scope: !164)
!168 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 269, type: !169, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!169 = !DISubroutineType(types: !170)
!170 = !{!35, !35, !171}
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!173 = !DILocalVariable(name: "argc", arg: 1, scope: !168, file: !30, line: 269, type: !35)
!174 = !DILocation(line: 269, column: 14, scope: !168)
!175 = !DILocalVariable(name: "argv", arg: 2, scope: !168, file: !30, line: 269, type: !171)
!176 = !DILocation(line: 269, column: 27, scope: !168)
!177 = !DILocation(line: 272, column: 22, scope: !168)
!178 = !DILocation(line: 272, column: 12, scope: !168)
!179 = !DILocation(line: 272, column: 5, scope: !168)
!180 = !DILocation(line: 274, column: 5, scope: !168)
!181 = !DILocation(line: 275, column: 5, scope: !168)
!182 = !DILocation(line: 276, column: 5, scope: !168)
!183 = !DILocation(line: 279, column: 5, scope: !168)
!184 = !DILocation(line: 280, column: 5, scope: !168)
!185 = !DILocation(line: 281, column: 5, scope: !168)
!186 = !DILocation(line: 283, column: 5, scope: !168)
!187 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 135, type: !31, scopeLine: 136, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!188 = !DILocalVariable(name: "data", scope: !187, file: !30, line: 137, type: !35)
!189 = !DILocation(line: 137, column: 9, scope: !187)
!190 = !DILocation(line: 139, column: 10, scope: !187)
!191 = !DILocation(line: 140, column: 5, scope: !187)
!192 = !DILabel(scope: !187, name: "source", file: !30, line: 141)
!193 = !DILocation(line: 141, column: 1, scope: !187)
!194 = !DILocalVariable(name: "recvResult", scope: !195, file: !30, line: 147, type: !35)
!195 = distinct !DILexicalBlock(scope: !187, file: !30, line: 142, column: 5)
!196 = !DILocation(line: 147, column: 13, scope: !195)
!197 = !DILocalVariable(name: "service", scope: !195, file: !30, line: 148, type: !45)
!198 = !DILocation(line: 148, column: 28, scope: !195)
!199 = !DILocalVariable(name: "connectSocket", scope: !195, file: !30, line: 149, type: !35)
!200 = !DILocation(line: 149, column: 16, scope: !195)
!201 = !DILocalVariable(name: "inputBuffer", scope: !195, file: !30, line: 150, type: !17)
!202 = !DILocation(line: 150, column: 14, scope: !195)
!203 = !DILocation(line: 151, column: 9, scope: !195)
!204 = !DILocation(line: 161, column: 29, scope: !205)
!205 = distinct !DILexicalBlock(scope: !195, file: !30, line: 152, column: 9)
!206 = !DILocation(line: 161, column: 27, scope: !205)
!207 = !DILocation(line: 162, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !205, file: !30, line: 162, column: 17)
!209 = !DILocation(line: 162, column: 31, scope: !208)
!210 = !DILocation(line: 162, column: 17, scope: !205)
!211 = !DILocation(line: 164, column: 17, scope: !212)
!212 = distinct !DILexicalBlock(scope: !208, file: !30, line: 163, column: 13)
!213 = !DILocation(line: 166, column: 13, scope: !205)
!214 = !DILocation(line: 167, column: 21, scope: !205)
!215 = !DILocation(line: 167, column: 32, scope: !205)
!216 = !DILocation(line: 168, column: 39, scope: !205)
!217 = !DILocation(line: 168, column: 21, scope: !205)
!218 = !DILocation(line: 168, column: 30, scope: !205)
!219 = !DILocation(line: 168, column: 37, scope: !205)
!220 = !DILocation(line: 169, column: 21, scope: !205)
!221 = !DILocation(line: 169, column: 30, scope: !205)
!222 = !DILocation(line: 170, column: 25, scope: !223)
!223 = distinct !DILexicalBlock(scope: !205, file: !30, line: 170, column: 17)
!224 = !DILocation(line: 170, column: 40, scope: !223)
!225 = !DILocation(line: 170, column: 17, scope: !223)
!226 = !DILocation(line: 170, column: 85, scope: !223)
!227 = !DILocation(line: 170, column: 17, scope: !205)
!228 = !DILocation(line: 172, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !223, file: !30, line: 171, column: 13)
!230 = !DILocation(line: 176, column: 31, scope: !205)
!231 = !DILocation(line: 176, column: 46, scope: !205)
!232 = !DILocation(line: 176, column: 26, scope: !205)
!233 = !DILocation(line: 176, column: 24, scope: !205)
!234 = !DILocation(line: 177, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !205, file: !30, line: 177, column: 17)
!236 = !DILocation(line: 177, column: 28, scope: !235)
!237 = !DILocation(line: 177, column: 44, scope: !235)
!238 = !DILocation(line: 177, column: 47, scope: !235)
!239 = !DILocation(line: 177, column: 58, scope: !235)
!240 = !DILocation(line: 177, column: 17, scope: !205)
!241 = !DILocation(line: 179, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !235, file: !30, line: 178, column: 13)
!243 = !DILocation(line: 182, column: 25, scope: !205)
!244 = !DILocation(line: 182, column: 13, scope: !205)
!245 = !DILocation(line: 182, column: 37, scope: !205)
!246 = !DILocation(line: 184, column: 25, scope: !205)
!247 = !DILocation(line: 184, column: 20, scope: !205)
!248 = !DILocation(line: 184, column: 18, scope: !205)
!249 = !DILocation(line: 185, column: 9, scope: !205)
!250 = !DILocation(line: 187, column: 13, scope: !251)
!251 = distinct !DILexicalBlock(scope: !195, file: !30, line: 187, column: 13)
!252 = !DILocation(line: 187, column: 27, scope: !251)
!253 = !DILocation(line: 187, column: 13, scope: !195)
!254 = !DILocation(line: 189, column: 26, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !30, line: 188, column: 9)
!256 = !DILocation(line: 189, column: 13, scope: !255)
!257 = !DILocation(line: 190, column: 9, scope: !255)
!258 = !DILocation(line: 198, column: 5, scope: !187)
!259 = !DILabel(scope: !187, name: "sink", file: !30, line: 199)
!260 = !DILocation(line: 199, column: 1, scope: !187)
!261 = !DILocalVariable(name: "i", scope: !262, file: !30, line: 201, type: !35)
!262 = distinct !DILexicalBlock(scope: !187, file: !30, line: 200, column: 5)
!263 = !DILocation(line: 201, column: 13, scope: !262)
!264 = !DILocalVariable(name: "buffer", scope: !262, file: !30, line: 202, type: !131)
!265 = !DILocation(line: 202, column: 13, scope: !262)
!266 = !DILocation(line: 204, column: 13, scope: !267)
!267 = distinct !DILexicalBlock(scope: !262, file: !30, line: 204, column: 13)
!268 = !DILocation(line: 204, column: 18, scope: !267)
!269 = !DILocation(line: 204, column: 23, scope: !267)
!270 = !DILocation(line: 204, column: 26, scope: !267)
!271 = !DILocation(line: 204, column: 31, scope: !267)
!272 = !DILocation(line: 204, column: 13, scope: !262)
!273 = !DILocation(line: 206, column: 20, scope: !274)
!274 = distinct !DILexicalBlock(scope: !267, file: !30, line: 205, column: 9)
!275 = !DILocation(line: 206, column: 13, scope: !274)
!276 = !DILocation(line: 206, column: 26, scope: !274)
!277 = !DILocation(line: 208, column: 19, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !30, line: 208, column: 13)
!279 = !DILocation(line: 208, column: 17, scope: !278)
!280 = !DILocation(line: 208, column: 24, scope: !281)
!281 = distinct !DILexicalBlock(scope: !278, file: !30, line: 208, column: 13)
!282 = !DILocation(line: 208, column: 26, scope: !281)
!283 = !DILocation(line: 208, column: 13, scope: !278)
!284 = !DILocation(line: 210, column: 37, scope: !285)
!285 = distinct !DILexicalBlock(scope: !281, file: !30, line: 209, column: 13)
!286 = !DILocation(line: 210, column: 30, scope: !285)
!287 = !DILocation(line: 210, column: 17, scope: !285)
!288 = !DILocation(line: 211, column: 13, scope: !285)
!289 = !DILocation(line: 208, column: 33, scope: !281)
!290 = !DILocation(line: 208, column: 13, scope: !281)
!291 = distinct !{!291, !283, !292, !159}
!292 = !DILocation(line: 211, column: 13, scope: !278)
!293 = !DILocation(line: 212, column: 9, scope: !274)
!294 = !DILocation(line: 215, column: 13, scope: !295)
!295 = distinct !DILexicalBlock(scope: !267, file: !30, line: 214, column: 9)
!296 = !DILocation(line: 218, column: 1, scope: !187)
!297 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 221, type: !31, scopeLine: 222, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!298 = !DILocalVariable(name: "data", scope: !297, file: !30, line: 223, type: !35)
!299 = !DILocation(line: 223, column: 9, scope: !297)
!300 = !DILocation(line: 225, column: 10, scope: !297)
!301 = !DILocation(line: 226, column: 5, scope: !297)
!302 = !DILabel(scope: !297, name: "source", file: !30, line: 227)
!303 = !DILocation(line: 227, column: 1, scope: !297)
!304 = !DILocation(line: 230, column: 10, scope: !297)
!305 = !DILocation(line: 231, column: 5, scope: !297)
!306 = !DILabel(scope: !297, name: "sink", file: !30, line: 232)
!307 = !DILocation(line: 232, column: 1, scope: !297)
!308 = !DILocalVariable(name: "i", scope: !309, file: !30, line: 234, type: !35)
!309 = distinct !DILexicalBlock(scope: !297, file: !30, line: 233, column: 5)
!310 = !DILocation(line: 234, column: 13, scope: !309)
!311 = !DILocalVariable(name: "buffer", scope: !309, file: !30, line: 235, type: !131)
!312 = !DILocation(line: 235, column: 13, scope: !309)
!313 = !DILocation(line: 238, column: 13, scope: !314)
!314 = distinct !DILexicalBlock(scope: !309, file: !30, line: 238, column: 13)
!315 = !DILocation(line: 238, column: 18, scope: !314)
!316 = !DILocation(line: 238, column: 13, scope: !309)
!317 = !DILocation(line: 240, column: 20, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !30, line: 239, column: 9)
!319 = !DILocation(line: 240, column: 13, scope: !318)
!320 = !DILocation(line: 240, column: 26, scope: !318)
!321 = !DILocation(line: 242, column: 19, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !30, line: 242, column: 13)
!323 = !DILocation(line: 242, column: 17, scope: !322)
!324 = !DILocation(line: 242, column: 24, scope: !325)
!325 = distinct !DILexicalBlock(scope: !322, file: !30, line: 242, column: 13)
!326 = !DILocation(line: 242, column: 26, scope: !325)
!327 = !DILocation(line: 242, column: 13, scope: !322)
!328 = !DILocation(line: 244, column: 37, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !30, line: 243, column: 13)
!330 = !DILocation(line: 244, column: 30, scope: !329)
!331 = !DILocation(line: 244, column: 17, scope: !329)
!332 = !DILocation(line: 245, column: 13, scope: !329)
!333 = !DILocation(line: 242, column: 33, scope: !325)
!334 = !DILocation(line: 242, column: 13, scope: !325)
!335 = distinct !{!335, !327, !336, !159}
!336 = !DILocation(line: 245, column: 13, scope: !322)
!337 = !DILocation(line: 246, column: 9, scope: !318)
!338 = !DILocation(line: 249, column: 13, scope: !339)
!339 = distinct !DILexicalBlock(scope: !314, file: !30, line: 248, column: 9)
!340 = !DILocation(line: 252, column: 1, scope: !297)
