; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01_bad() #0 !dbg !29 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !38, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !41, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 -1, i32* %connectSocket, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !64, metadata !DIExpression()), !dbg !65
  br label %do.body, !dbg !66

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !67
  store i32 %call, i32* %connectSocket, align 4, !dbg !69
  %0 = load i32, i32* %connectSocket, align 4, !dbg !70
  %cmp = icmp eq i32 %0, -1, !dbg !72
  br i1 %cmp, label %if.then, label %if.end, !dbg !73

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !74

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !76
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !76
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !77
  store i8 2, i8* %sin_family, align 1, !dbg !78
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !79
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !80
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !81
  store i32 %call1, i32* %s_addr, align 4, !dbg !82
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !83
  store i16 -30871, i16* %sin_port, align 2, !dbg !84
  %2 = load i32, i32* %connectSocket, align 4, !dbg !85
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !87
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !88
  %cmp3 = icmp eq i32 %call2, -1, !dbg !89
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !90

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !91

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !93
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !94
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !95
  %conv = trunc i64 %call6 to i32, !dbg !95
  store i32 %conv, i32* %recvResult, align 4, !dbg !96
  %5 = load i32, i32* %recvResult, align 4, !dbg !97
  %cmp7 = icmp eq i32 %5, -1, !dbg !99
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !100

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !101
  %cmp9 = icmp eq i32 %6, 0, !dbg !102
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !103

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !104

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !106
  %idxprom = sext i32 %7 to i64, !dbg !107
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !109
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !110
  store i32 %call14, i32* %data, align 4, !dbg !111
  br label %do.end, !dbg !112

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !113
  %cmp15 = icmp ne i32 %8, -1, !dbg !115
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !116

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !117
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !119
  br label %if.end19, !dbg !120

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !121, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !124, metadata !DIExpression()), !dbg !128
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !128
  %11 = load i32, i32* %data, align 4, !dbg !129
  %cmp20 = icmp sge i32 %11, 0, !dbg !131
  br i1 %cmp20, label %if.then22, label %if.else, !dbg !132

if.then22:                                        ; preds = %if.end19
  %12 = load i32, i32* %data, align 4, !dbg !133
  %idxprom23 = sext i32 %12 to i64, !dbg !135
  %arrayidx24 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom23, !dbg !135
  store i32 1, i32* %arrayidx24, align 4, !dbg !136
  store i32 0, i32* %i, align 4, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.then22
  %13 = load i32, i32* %i, align 4, !dbg !140
  %cmp25 = icmp slt i32 %13, 10, !dbg !142
  br i1 %cmp25, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %14 = load i32, i32* %i, align 4, !dbg !144
  %idxprom27 = sext i32 %14 to i64, !dbg !146
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !146
  %15 = load i32, i32* %arrayidx28, align 4, !dbg !146
  call void @printIntLine(i32 noundef %15), !dbg !147
  br label %for.inc, !dbg !148

for.inc:                                          ; preds = %for.body
  %16 = load i32, i32* %i, align 4, !dbg !149
  %inc = add nsw i32 %16, 1, !dbg !149
  store i32 %inc, i32* %i, align 4, !dbg !149
  br label %for.cond, !dbg !150, !llvm.loop !151

for.end:                                          ; preds = %for.cond
  br label %if.end29, !dbg !154

if.else:                                          ; preds = %if.end19
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !155
  br label %if.end29

if.end29:                                         ; preds = %if.else, %for.end
  ret void, !dbg !157
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

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01_good() #0 !dbg !158 {
entry:
  call void @goodG2B(), !dbg !159
  call void @goodB2G(), !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !162 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !167, metadata !DIExpression()), !dbg !168
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !169, metadata !DIExpression()), !dbg !170
  %call = call i64 @time(i64* noundef null), !dbg !171
  %conv = trunc i64 %call to i32, !dbg !172
  call void @srand(i32 noundef %conv), !dbg !173
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !174
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01_good(), !dbg !175
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !176
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !177
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01_bad(), !dbg !178
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !179
  ret i32 0, !dbg !180
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !181 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !182, metadata !DIExpression()), !dbg !183
  store i32 -1, i32* %data, align 4, !dbg !184
  store i32 7, i32* %data, align 4, !dbg !185
  call void @llvm.dbg.declare(metadata i32* %i, metadata !186, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !189, metadata !DIExpression()), !dbg !190
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !190
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !190
  %1 = load i32, i32* %data, align 4, !dbg !191
  %cmp = icmp sge i32 %1, 0, !dbg !193
  br i1 %cmp, label %if.then, label %if.else, !dbg !194

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !195
  %idxprom = sext i32 %2 to i64, !dbg !197
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !197
  store i32 1, i32* %arrayidx, align 4, !dbg !198
  store i32 0, i32* %i, align 4, !dbg !199
  br label %for.cond, !dbg !201

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !202
  %cmp1 = icmp slt i32 %3, 10, !dbg !204
  br i1 %cmp1, label %for.body, label %for.end, !dbg !205

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !206
  %idxprom2 = sext i32 %4 to i64, !dbg !208
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !208
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !208
  call void @printIntLine(i32 noundef %5), !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !211
  %inc = add nsw i32 %6, 1, !dbg !211
  store i32 %inc, i32* %i, align 4, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !215

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !216
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !218
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !219 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 -1, i32* %data, align 4, !dbg !222
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !223, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !226, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !228, metadata !DIExpression()), !dbg !229
  store i32 -1, i32* %connectSocket, align 4, !dbg !229
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !230, metadata !DIExpression()), !dbg !231
  br label %do.body, !dbg !232

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !233
  store i32 %call, i32* %connectSocket, align 4, !dbg !235
  %0 = load i32, i32* %connectSocket, align 4, !dbg !236
  %cmp = icmp eq i32 %0, -1, !dbg !238
  br i1 %cmp, label %if.then, label %if.end, !dbg !239

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !240

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !242
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !242
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !243
  store i8 2, i8* %sin_family, align 1, !dbg !244
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !245
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !246
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !247
  store i32 %call1, i32* %s_addr, align 4, !dbg !248
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !249
  store i16 -30871, i16* %sin_port, align 2, !dbg !250
  %2 = load i32, i32* %connectSocket, align 4, !dbg !251
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !253
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !254
  %cmp3 = icmp eq i32 %call2, -1, !dbg !255
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !256

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !257

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !259
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !260
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !261
  %conv = trunc i64 %call6 to i32, !dbg !261
  store i32 %conv, i32* %recvResult, align 4, !dbg !262
  %5 = load i32, i32* %recvResult, align 4, !dbg !263
  %cmp7 = icmp eq i32 %5, -1, !dbg !265
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !266

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !267
  %cmp9 = icmp eq i32 %6, 0, !dbg !268
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !269

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !270

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !272
  %idxprom = sext i32 %7 to i64, !dbg !273
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !273
  store i8 0, i8* %arrayidx, align 1, !dbg !274
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !275
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !276
  store i32 %call14, i32* %data, align 4, !dbg !277
  br label %do.end, !dbg !278

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !279
  %cmp15 = icmp ne i32 %8, -1, !dbg !281
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !282

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !283
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !285
  br label %if.end19, !dbg !286

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !287, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !290, metadata !DIExpression()), !dbg !291
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !291
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !291
  %11 = load i32, i32* %data, align 4, !dbg !292
  %cmp20 = icmp sge i32 %11, 0, !dbg !294
  br i1 %cmp20, label %land.lhs.true, label %if.else, !dbg !295

land.lhs.true:                                    ; preds = %if.end19
  %12 = load i32, i32* %data, align 4, !dbg !296
  %cmp22 = icmp slt i32 %12, 10, !dbg !297
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !298

if.then24:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !299
  %idxprom25 = sext i32 %13 to i64, !dbg !301
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !301
  store i32 1, i32* %arrayidx26, align 4, !dbg !302
  store i32 0, i32* %i, align 4, !dbg !303
  br label %for.cond, !dbg !305

for.cond:                                         ; preds = %for.inc, %if.then24
  %14 = load i32, i32* %i, align 4, !dbg !306
  %cmp27 = icmp slt i32 %14, 10, !dbg !308
  br i1 %cmp27, label %for.body, label %for.end, !dbg !309

for.body:                                         ; preds = %for.cond
  %15 = load i32, i32* %i, align 4, !dbg !310
  %idxprom29 = sext i32 %15 to i64, !dbg !312
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !312
  %16 = load i32, i32* %arrayidx30, align 4, !dbg !312
  call void @printIntLine(i32 noundef %16), !dbg !313
  br label %for.inc, !dbg !314

for.inc:                                          ; preds = %for.body
  %17 = load i32, i32* %i, align 4, !dbg !315
  %inc = add nsw i32 %17, 1, !dbg !315
  store i32 %inc, i32* %i, align 4, !dbg !315
  br label %for.cond, !dbg !316, !llvm.loop !317

for.end:                                          ; preds = %for.cond
  br label %if.end31, !dbg !319

if.else:                                          ; preds = %land.lhs.true, %if.end19
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !320
  br label %if.end31

if.end31:                                         ; preds = %if.else, %for.end
  ret void, !dbg !322
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01_bad", scope: !30, file: !30, line: 44, type: !31, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 46, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 46, column: 9, scope: !29)
!37 = !DILocation(line: 48, column: 10, scope: !29)
!38 = !DILocalVariable(name: "recvResult", scope: !39, file: !30, line: 54, type: !35)
!39 = distinct !DILexicalBlock(scope: !29, file: !30, line: 49, column: 5)
!40 = !DILocation(line: 54, column: 13, scope: !39)
!41 = !DILocalVariable(name: "service", scope: !39, file: !30, line: 55, type: !42)
!42 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !43, line: 375, size: 128, elements: !44)
!43 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!44 = !{!45, !46, !47, !50, !57}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !42, file: !43, line: 376, baseType: !11, size: 8)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !42, file: !43, line: 377, baseType: !14, size: 8, offset: 8)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !42, file: !43, line: 378, baseType: !48, size: 16, offset: 16)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !49, line: 31, baseType: !3)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !42, file: !43, line: 379, baseType: !51, size: 32, offset: 32)
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !43, line: 301, size: 32, elements: !52)
!52 = !{!53}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !51, file: !43, line: 302, baseType: !54, size: 32)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !55, line: 31, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !42, file: !43, line: 380, baseType: !58, size: 64, offset: 64)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 8)
!61 = !DILocation(line: 55, column: 28, scope: !39)
!62 = !DILocalVariable(name: "connectSocket", scope: !39, file: !30, line: 56, type: !35)
!63 = !DILocation(line: 56, column: 16, scope: !39)
!64 = !DILocalVariable(name: "inputBuffer", scope: !39, file: !30, line: 57, type: !17)
!65 = !DILocation(line: 57, column: 14, scope: !39)
!66 = !DILocation(line: 58, column: 9, scope: !39)
!67 = !DILocation(line: 68, column: 29, scope: !68)
!68 = distinct !DILexicalBlock(scope: !39, file: !30, line: 59, column: 9)
!69 = !DILocation(line: 68, column: 27, scope: !68)
!70 = !DILocation(line: 69, column: 17, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !30, line: 69, column: 17)
!72 = !DILocation(line: 69, column: 31, scope: !71)
!73 = !DILocation(line: 69, column: 17, scope: !68)
!74 = !DILocation(line: 71, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !30, line: 70, column: 13)
!76 = !DILocation(line: 73, column: 13, scope: !68)
!77 = !DILocation(line: 74, column: 21, scope: !68)
!78 = !DILocation(line: 74, column: 32, scope: !68)
!79 = !DILocation(line: 75, column: 39, scope: !68)
!80 = !DILocation(line: 75, column: 21, scope: !68)
!81 = !DILocation(line: 75, column: 30, scope: !68)
!82 = !DILocation(line: 75, column: 37, scope: !68)
!83 = !DILocation(line: 76, column: 21, scope: !68)
!84 = !DILocation(line: 76, column: 30, scope: !68)
!85 = !DILocation(line: 77, column: 25, scope: !86)
!86 = distinct !DILexicalBlock(scope: !68, file: !30, line: 77, column: 17)
!87 = !DILocation(line: 77, column: 40, scope: !86)
!88 = !DILocation(line: 77, column: 17, scope: !86)
!89 = !DILocation(line: 77, column: 85, scope: !86)
!90 = !DILocation(line: 77, column: 17, scope: !68)
!91 = !DILocation(line: 79, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !30, line: 78, column: 13)
!93 = !DILocation(line: 83, column: 31, scope: !68)
!94 = !DILocation(line: 83, column: 46, scope: !68)
!95 = !DILocation(line: 83, column: 26, scope: !68)
!96 = !DILocation(line: 83, column: 24, scope: !68)
!97 = !DILocation(line: 84, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !68, file: !30, line: 84, column: 17)
!99 = !DILocation(line: 84, column: 28, scope: !98)
!100 = !DILocation(line: 84, column: 44, scope: !98)
!101 = !DILocation(line: 84, column: 47, scope: !98)
!102 = !DILocation(line: 84, column: 58, scope: !98)
!103 = !DILocation(line: 84, column: 17, scope: !68)
!104 = !DILocation(line: 86, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !30, line: 85, column: 13)
!106 = !DILocation(line: 89, column: 25, scope: !68)
!107 = !DILocation(line: 89, column: 13, scope: !68)
!108 = !DILocation(line: 89, column: 37, scope: !68)
!109 = !DILocation(line: 91, column: 25, scope: !68)
!110 = !DILocation(line: 91, column: 20, scope: !68)
!111 = !DILocation(line: 91, column: 18, scope: !68)
!112 = !DILocation(line: 92, column: 9, scope: !68)
!113 = !DILocation(line: 94, column: 13, scope: !114)
!114 = distinct !DILexicalBlock(scope: !39, file: !30, line: 94, column: 13)
!115 = !DILocation(line: 94, column: 27, scope: !114)
!116 = !DILocation(line: 94, column: 13, scope: !39)
!117 = !DILocation(line: 96, column: 26, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !30, line: 95, column: 9)
!119 = !DILocation(line: 96, column: 13, scope: !118)
!120 = !DILocation(line: 97, column: 9, scope: !118)
!121 = !DILocalVariable(name: "i", scope: !122, file: !30, line: 106, type: !35)
!122 = distinct !DILexicalBlock(scope: !29, file: !30, line: 105, column: 5)
!123 = !DILocation(line: 106, column: 13, scope: !122)
!124 = !DILocalVariable(name: "buffer", scope: !122, file: !30, line: 107, type: !125)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 10)
!128 = !DILocation(line: 107, column: 13, scope: !122)
!129 = !DILocation(line: 110, column: 13, scope: !130)
!130 = distinct !DILexicalBlock(scope: !122, file: !30, line: 110, column: 13)
!131 = !DILocation(line: 110, column: 18, scope: !130)
!132 = !DILocation(line: 110, column: 13, scope: !122)
!133 = !DILocation(line: 112, column: 20, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !30, line: 111, column: 9)
!135 = !DILocation(line: 112, column: 13, scope: !134)
!136 = !DILocation(line: 112, column: 26, scope: !134)
!137 = !DILocation(line: 114, column: 19, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !30, line: 114, column: 13)
!139 = !DILocation(line: 114, column: 17, scope: !138)
!140 = !DILocation(line: 114, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !30, line: 114, column: 13)
!142 = !DILocation(line: 114, column: 26, scope: !141)
!143 = !DILocation(line: 114, column: 13, scope: !138)
!144 = !DILocation(line: 116, column: 37, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !30, line: 115, column: 13)
!146 = !DILocation(line: 116, column: 30, scope: !145)
!147 = !DILocation(line: 116, column: 17, scope: !145)
!148 = !DILocation(line: 117, column: 13, scope: !145)
!149 = !DILocation(line: 114, column: 33, scope: !141)
!150 = !DILocation(line: 114, column: 13, scope: !141)
!151 = distinct !{!151, !143, !152, !153}
!152 = !DILocation(line: 117, column: 13, scope: !138)
!153 = !{!"llvm.loop.mustprogress"}
!154 = !DILocation(line: 118, column: 9, scope: !134)
!155 = !DILocation(line: 121, column: 13, scope: !156)
!156 = distinct !DILexicalBlock(scope: !130, file: !30, line: 120, column: 9)
!157 = !DILocation(line: 124, column: 1, scope: !29)
!158 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_01_good", scope: !30, file: !30, line: 242, type: !31, scopeLine: 243, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!159 = !DILocation(line: 244, column: 5, scope: !158)
!160 = !DILocation(line: 245, column: 5, scope: !158)
!161 = !DILocation(line: 246, column: 1, scope: !158)
!162 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 257, type: !163, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!163 = !DISubroutineType(types: !164)
!164 = !{!35, !35, !165}
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!167 = !DILocalVariable(name: "argc", arg: 1, scope: !162, file: !30, line: 257, type: !35)
!168 = !DILocation(line: 257, column: 14, scope: !162)
!169 = !DILocalVariable(name: "argv", arg: 2, scope: !162, file: !30, line: 257, type: !165)
!170 = !DILocation(line: 257, column: 27, scope: !162)
!171 = !DILocation(line: 260, column: 22, scope: !162)
!172 = !DILocation(line: 260, column: 12, scope: !162)
!173 = !DILocation(line: 260, column: 5, scope: !162)
!174 = !DILocation(line: 262, column: 5, scope: !162)
!175 = !DILocation(line: 263, column: 5, scope: !162)
!176 = !DILocation(line: 264, column: 5, scope: !162)
!177 = !DILocation(line: 267, column: 5, scope: !162)
!178 = !DILocation(line: 268, column: 5, scope: !162)
!179 = !DILocation(line: 269, column: 5, scope: !162)
!180 = !DILocation(line: 271, column: 5, scope: !162)
!181 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 131, type: !31, scopeLine: 132, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!182 = !DILocalVariable(name: "data", scope: !181, file: !30, line: 133, type: !35)
!183 = !DILocation(line: 133, column: 9, scope: !181)
!184 = !DILocation(line: 135, column: 10, scope: !181)
!185 = !DILocation(line: 138, column: 10, scope: !181)
!186 = !DILocalVariable(name: "i", scope: !187, file: !30, line: 140, type: !35)
!187 = distinct !DILexicalBlock(scope: !181, file: !30, line: 139, column: 5)
!188 = !DILocation(line: 140, column: 13, scope: !187)
!189 = !DILocalVariable(name: "buffer", scope: !187, file: !30, line: 141, type: !125)
!190 = !DILocation(line: 141, column: 13, scope: !187)
!191 = !DILocation(line: 144, column: 13, scope: !192)
!192 = distinct !DILexicalBlock(scope: !187, file: !30, line: 144, column: 13)
!193 = !DILocation(line: 144, column: 18, scope: !192)
!194 = !DILocation(line: 144, column: 13, scope: !187)
!195 = !DILocation(line: 146, column: 20, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !30, line: 145, column: 9)
!197 = !DILocation(line: 146, column: 13, scope: !196)
!198 = !DILocation(line: 146, column: 26, scope: !196)
!199 = !DILocation(line: 148, column: 19, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !30, line: 148, column: 13)
!201 = !DILocation(line: 148, column: 17, scope: !200)
!202 = !DILocation(line: 148, column: 24, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !30, line: 148, column: 13)
!204 = !DILocation(line: 148, column: 26, scope: !203)
!205 = !DILocation(line: 148, column: 13, scope: !200)
!206 = !DILocation(line: 150, column: 37, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !30, line: 149, column: 13)
!208 = !DILocation(line: 150, column: 30, scope: !207)
!209 = !DILocation(line: 150, column: 17, scope: !207)
!210 = !DILocation(line: 151, column: 13, scope: !207)
!211 = !DILocation(line: 148, column: 33, scope: !203)
!212 = !DILocation(line: 148, column: 13, scope: !203)
!213 = distinct !{!213, !205, !214, !153}
!214 = !DILocation(line: 151, column: 13, scope: !200)
!215 = !DILocation(line: 152, column: 9, scope: !196)
!216 = !DILocation(line: 155, column: 13, scope: !217)
!217 = distinct !DILexicalBlock(scope: !192, file: !30, line: 154, column: 9)
!218 = !DILocation(line: 158, column: 1, scope: !181)
!219 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 161, type: !31, scopeLine: 162, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!220 = !DILocalVariable(name: "data", scope: !219, file: !30, line: 163, type: !35)
!221 = !DILocation(line: 163, column: 9, scope: !219)
!222 = !DILocation(line: 165, column: 10, scope: !219)
!223 = !DILocalVariable(name: "recvResult", scope: !224, file: !30, line: 171, type: !35)
!224 = distinct !DILexicalBlock(scope: !219, file: !30, line: 166, column: 5)
!225 = !DILocation(line: 171, column: 13, scope: !224)
!226 = !DILocalVariable(name: "service", scope: !224, file: !30, line: 172, type: !42)
!227 = !DILocation(line: 172, column: 28, scope: !224)
!228 = !DILocalVariable(name: "connectSocket", scope: !224, file: !30, line: 173, type: !35)
!229 = !DILocation(line: 173, column: 16, scope: !224)
!230 = !DILocalVariable(name: "inputBuffer", scope: !224, file: !30, line: 174, type: !17)
!231 = !DILocation(line: 174, column: 14, scope: !224)
!232 = !DILocation(line: 175, column: 9, scope: !224)
!233 = !DILocation(line: 185, column: 29, scope: !234)
!234 = distinct !DILexicalBlock(scope: !224, file: !30, line: 176, column: 9)
!235 = !DILocation(line: 185, column: 27, scope: !234)
!236 = !DILocation(line: 186, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !30, line: 186, column: 17)
!238 = !DILocation(line: 186, column: 31, scope: !237)
!239 = !DILocation(line: 186, column: 17, scope: !234)
!240 = !DILocation(line: 188, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !30, line: 187, column: 13)
!242 = !DILocation(line: 190, column: 13, scope: !234)
!243 = !DILocation(line: 191, column: 21, scope: !234)
!244 = !DILocation(line: 191, column: 32, scope: !234)
!245 = !DILocation(line: 192, column: 39, scope: !234)
!246 = !DILocation(line: 192, column: 21, scope: !234)
!247 = !DILocation(line: 192, column: 30, scope: !234)
!248 = !DILocation(line: 192, column: 37, scope: !234)
!249 = !DILocation(line: 193, column: 21, scope: !234)
!250 = !DILocation(line: 193, column: 30, scope: !234)
!251 = !DILocation(line: 194, column: 25, scope: !252)
!252 = distinct !DILexicalBlock(scope: !234, file: !30, line: 194, column: 17)
!253 = !DILocation(line: 194, column: 40, scope: !252)
!254 = !DILocation(line: 194, column: 17, scope: !252)
!255 = !DILocation(line: 194, column: 85, scope: !252)
!256 = !DILocation(line: 194, column: 17, scope: !234)
!257 = !DILocation(line: 196, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !252, file: !30, line: 195, column: 13)
!259 = !DILocation(line: 200, column: 31, scope: !234)
!260 = !DILocation(line: 200, column: 46, scope: !234)
!261 = !DILocation(line: 200, column: 26, scope: !234)
!262 = !DILocation(line: 200, column: 24, scope: !234)
!263 = !DILocation(line: 201, column: 17, scope: !264)
!264 = distinct !DILexicalBlock(scope: !234, file: !30, line: 201, column: 17)
!265 = !DILocation(line: 201, column: 28, scope: !264)
!266 = !DILocation(line: 201, column: 44, scope: !264)
!267 = !DILocation(line: 201, column: 47, scope: !264)
!268 = !DILocation(line: 201, column: 58, scope: !264)
!269 = !DILocation(line: 201, column: 17, scope: !234)
!270 = !DILocation(line: 203, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !264, file: !30, line: 202, column: 13)
!272 = !DILocation(line: 206, column: 25, scope: !234)
!273 = !DILocation(line: 206, column: 13, scope: !234)
!274 = !DILocation(line: 206, column: 37, scope: !234)
!275 = !DILocation(line: 208, column: 25, scope: !234)
!276 = !DILocation(line: 208, column: 20, scope: !234)
!277 = !DILocation(line: 208, column: 18, scope: !234)
!278 = !DILocation(line: 209, column: 9, scope: !234)
!279 = !DILocation(line: 211, column: 13, scope: !280)
!280 = distinct !DILexicalBlock(scope: !224, file: !30, line: 211, column: 13)
!281 = !DILocation(line: 211, column: 27, scope: !280)
!282 = !DILocation(line: 211, column: 13, scope: !224)
!283 = !DILocation(line: 213, column: 26, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !30, line: 212, column: 9)
!285 = !DILocation(line: 213, column: 13, scope: !284)
!286 = !DILocation(line: 214, column: 9, scope: !284)
!287 = !DILocalVariable(name: "i", scope: !288, file: !30, line: 223, type: !35)
!288 = distinct !DILexicalBlock(scope: !219, file: !30, line: 222, column: 5)
!289 = !DILocation(line: 223, column: 13, scope: !288)
!290 = !DILocalVariable(name: "buffer", scope: !288, file: !30, line: 224, type: !125)
!291 = !DILocation(line: 224, column: 13, scope: !288)
!292 = !DILocation(line: 226, column: 13, scope: !293)
!293 = distinct !DILexicalBlock(scope: !288, file: !30, line: 226, column: 13)
!294 = !DILocation(line: 226, column: 18, scope: !293)
!295 = !DILocation(line: 226, column: 23, scope: !293)
!296 = !DILocation(line: 226, column: 26, scope: !293)
!297 = !DILocation(line: 226, column: 31, scope: !293)
!298 = !DILocation(line: 226, column: 13, scope: !288)
!299 = !DILocation(line: 228, column: 20, scope: !300)
!300 = distinct !DILexicalBlock(scope: !293, file: !30, line: 227, column: 9)
!301 = !DILocation(line: 228, column: 13, scope: !300)
!302 = !DILocation(line: 228, column: 26, scope: !300)
!303 = !DILocation(line: 230, column: 19, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !30, line: 230, column: 13)
!305 = !DILocation(line: 230, column: 17, scope: !304)
!306 = !DILocation(line: 230, column: 24, scope: !307)
!307 = distinct !DILexicalBlock(scope: !304, file: !30, line: 230, column: 13)
!308 = !DILocation(line: 230, column: 26, scope: !307)
!309 = !DILocation(line: 230, column: 13, scope: !304)
!310 = !DILocation(line: 232, column: 37, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !30, line: 231, column: 13)
!312 = !DILocation(line: 232, column: 30, scope: !311)
!313 = !DILocation(line: 232, column: 17, scope: !311)
!314 = !DILocation(line: 233, column: 13, scope: !311)
!315 = !DILocation(line: 230, column: 33, scope: !307)
!316 = !DILocation(line: 230, column: 13, scope: !307)
!317 = distinct !{!317, !309, !318, !153}
!318 = !DILocation(line: 233, column: 13, scope: !304)
!319 = !DILocation(line: 234, column: 9, scope: !300)
!320 = !DILocation(line: 237, column: 13, scope: !321)
!321 = distinct !DILexicalBlock(scope: !293, file: !30, line: 236, column: 9)
!322 = !DILocation(line: 240, column: 1, scope: !219)
