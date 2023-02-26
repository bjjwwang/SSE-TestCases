; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_bad() #0 !dbg !31 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 -1, i32* %data, align 4, !dbg !39
  br label %while.body, !dbg !40

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !45, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, i32* %listenSocket, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 -1, i32* %acceptSocket, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  br label %do.body, !dbg !72

do.body:                                          ; preds = %while.body
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !73
  store i32 %call, i32* %listenSocket, align 4, !dbg !75
  %0 = load i32, i32* %listenSocket, align 4, !dbg !76
  %cmp = icmp eq i32 %0, -1, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !80

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !82
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !83
  store i8 2, i8* %sin_family, align 1, !dbg !84
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !85
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !86
  store i32 0, i32* %s_addr, align 4, !dbg !87
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !88
  store i16 -30871, i16* %sin_port, align 2, !dbg !89
  %2 = load i32, i32* %listenSocket, align 4, !dbg !90
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !92
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !93
  %cmp2 = icmp eq i32 %call1, -1, !dbg !94
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !95

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !96

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !98
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !100
  %cmp6 = icmp eq i32 %call5, -1, !dbg !101
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !102

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !103

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !105
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !106
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !107
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !108
  %cmp10 = icmp eq i32 %6, -1, !dbg !110
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !111

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !112

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !114
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !115
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !116
  %conv = trunc i64 %call13 to i32, !dbg !116
  store i32 %conv, i32* %recvResult, align 4, !dbg !117
  %8 = load i32, i32* %recvResult, align 4, !dbg !118
  %cmp14 = icmp eq i32 %8, -1, !dbg !120
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !121

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !122
  %cmp16 = icmp eq i32 %9, 0, !dbg !123
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !124

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !125

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !127
  %idxprom = sext i32 %10 to i64, !dbg !128
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !128
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !130
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !131
  store i32 %call21, i32* %data, align 4, !dbg !132
  br label %do.end, !dbg !133

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !134
  %cmp22 = icmp ne i32 %11, -1, !dbg !136
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !137

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !138
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !140
  br label %if.end26, !dbg !141

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !142
  %cmp27 = icmp ne i32 %13, -1, !dbg !144
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !145

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !146
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !148
  br label %if.end31, !dbg !149

if.end31:                                         ; preds = %if.then29, %if.end26
  br label %while.end, !dbg !150

while.end:                                        ; preds = %if.end31
  br label %while.body32, !dbg !151

while.body32:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !152, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !156, metadata !DIExpression()), !dbg !160
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !160
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !160
  %16 = load i32, i32* %data, align 4, !dbg !161
  %cmp33 = icmp sge i32 %16, 0, !dbg !163
  br i1 %cmp33, label %if.then35, label %if.else, !dbg !164

if.then35:                                        ; preds = %while.body32
  %17 = load i32, i32* %data, align 4, !dbg !165
  %idxprom36 = sext i32 %17 to i64, !dbg !167
  %arrayidx37 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom36, !dbg !167
  store i32 1, i32* %arrayidx37, align 4, !dbg !168
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond, !dbg !171

for.cond:                                         ; preds = %for.inc, %if.then35
  %18 = load i32, i32* %i, align 4, !dbg !172
  %cmp38 = icmp slt i32 %18, 10, !dbg !174
  br i1 %cmp38, label %for.body, label %for.end, !dbg !175

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !176
  %idxprom40 = sext i32 %19 to i64, !dbg !178
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom40, !dbg !178
  %20 = load i32, i32* %arrayidx41, align 4, !dbg !178
  call void @printIntLine(i32 noundef %20), !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !181
  %inc = add nsw i32 %21, 1, !dbg !181
  store i32 %inc, i32* %i, align 4, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  br label %if.end42, !dbg !186

if.else:                                          ; preds = %while.body32
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !187
  br label %if.end42

if.end42:                                         ; preds = %if.else, %for.end
  br label %while.end43, !dbg !189

while.end43:                                      ; preds = %if.end42
  ret void, !dbg !190
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @"\01_bind"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #2

declare i32 @"\01_listen"(i32 noundef, i32 noundef) #2

declare i32 @"\01_accept"(i32 noundef, %struct.sockaddr* noundef, i32* noundef) #2

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #2

declare i32 @atoi(i8* noundef) #2

declare i32 @"\01_close"(i32 noundef) #2

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_good() #0 !dbg !191 {
entry:
  call void @goodB2G(), !dbg !192
  call void @goodG2B(), !dbg !193
  ret void, !dbg !194
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !195 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !200, metadata !DIExpression()), !dbg !201
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !202, metadata !DIExpression()), !dbg !203
  %call = call i64 @time(i64* noundef null), !dbg !204
  %conv = trunc i64 %call to i32, !dbg !205
  call void @srand(i32 noundef %conv), !dbg !206
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !207
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_good(), !dbg !208
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !209
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !210
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_bad(), !dbg !211
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !212
  ret i32 0, !dbg !213
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !214 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 -1, i32* %data, align 4, !dbg !217
  br label %while.body, !dbg !218

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !219, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !223, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !225, metadata !DIExpression()), !dbg !226
  store i32 -1, i32* %listenSocket, align 4, !dbg !226
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !227, metadata !DIExpression()), !dbg !228
  store i32 -1, i32* %acceptSocket, align 4, !dbg !228
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !229, metadata !DIExpression()), !dbg !230
  br label %do.body, !dbg !231

do.body:                                          ; preds = %while.body
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !232
  store i32 %call, i32* %listenSocket, align 4, !dbg !234
  %0 = load i32, i32* %listenSocket, align 4, !dbg !235
  %cmp = icmp eq i32 %0, -1, !dbg !237
  br i1 %cmp, label %if.then, label %if.end, !dbg !238

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !239

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !241
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !241
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !242
  store i8 2, i8* %sin_family, align 1, !dbg !243
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !244
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !245
  store i32 0, i32* %s_addr, align 4, !dbg !246
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !247
  store i16 -30871, i16* %sin_port, align 2, !dbg !248
  %2 = load i32, i32* %listenSocket, align 4, !dbg !249
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !251
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !252
  %cmp2 = icmp eq i32 %call1, -1, !dbg !253
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !254

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !255

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !257
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !259
  %cmp6 = icmp eq i32 %call5, -1, !dbg !260
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !261

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !262

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !264
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !265
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !266
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !267
  %cmp10 = icmp eq i32 %6, -1, !dbg !269
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !270

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !271

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !273
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !274
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !275
  %conv = trunc i64 %call13 to i32, !dbg !275
  store i32 %conv, i32* %recvResult, align 4, !dbg !276
  %8 = load i32, i32* %recvResult, align 4, !dbg !277
  %cmp14 = icmp eq i32 %8, -1, !dbg !279
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !280

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !281
  %cmp16 = icmp eq i32 %9, 0, !dbg !282
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !283

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !284

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !286
  %idxprom = sext i32 %10 to i64, !dbg !287
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !287
  store i8 0, i8* %arrayidx, align 1, !dbg !288
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !289
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !290
  store i32 %call21, i32* %data, align 4, !dbg !291
  br label %do.end, !dbg !292

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !293
  %cmp22 = icmp ne i32 %11, -1, !dbg !295
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !296

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !297
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !299
  br label %if.end26, !dbg !300

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !301
  %cmp27 = icmp ne i32 %13, -1, !dbg !303
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !304

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !305
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !307
  br label %if.end31, !dbg !308

if.end31:                                         ; preds = %if.then29, %if.end26
  br label %while.end, !dbg !309

while.end:                                        ; preds = %if.end31
  br label %while.body32, !dbg !310

while.body32:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !311, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !315, metadata !DIExpression()), !dbg !316
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !316
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !316
  %16 = load i32, i32* %data, align 4, !dbg !317
  %cmp33 = icmp sge i32 %16, 0, !dbg !319
  br i1 %cmp33, label %land.lhs.true, label %if.else, !dbg !320

land.lhs.true:                                    ; preds = %while.body32
  %17 = load i32, i32* %data, align 4, !dbg !321
  %cmp35 = icmp slt i32 %17, 10, !dbg !322
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !323

if.then37:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !324
  %idxprom38 = sext i32 %18 to i64, !dbg !326
  %arrayidx39 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom38, !dbg !326
  store i32 1, i32* %arrayidx39, align 4, !dbg !327
  store i32 0, i32* %i, align 4, !dbg !328
  br label %for.cond, !dbg !330

for.cond:                                         ; preds = %for.inc, %if.then37
  %19 = load i32, i32* %i, align 4, !dbg !331
  %cmp40 = icmp slt i32 %19, 10, !dbg !333
  br i1 %cmp40, label %for.body, label %for.end, !dbg !334

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !335
  %idxprom42 = sext i32 %20 to i64, !dbg !337
  %arrayidx43 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom42, !dbg !337
  %21 = load i32, i32* %arrayidx43, align 4, !dbg !337
  call void @printIntLine(i32 noundef %21), !dbg !338
  br label %for.inc, !dbg !339

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !340
  %inc = add nsw i32 %22, 1, !dbg !340
  store i32 %inc, i32* %i, align 4, !dbg !340
  br label %for.cond, !dbg !341, !llvm.loop !342

for.end:                                          ; preds = %for.cond
  br label %if.end44, !dbg !344

if.else:                                          ; preds = %land.lhs.true, %while.body32
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !345
  br label %if.end44

if.end44:                                         ; preds = %if.else, %for.end
  br label %while.end45, !dbg !347

while.end45:                                      ; preds = %if.end44
  ret void, !dbg !348
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !349 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !350, metadata !DIExpression()), !dbg !351
  store i32 -1, i32* %data, align 4, !dbg !352
  br label %while.body, !dbg !353

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !354
  br label %while.end, !dbg !356

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !357

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !358, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !362, metadata !DIExpression()), !dbg !363
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !363
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !363
  %1 = load i32, i32* %data, align 4, !dbg !364
  %cmp = icmp sge i32 %1, 0, !dbg !366
  br i1 %cmp, label %if.then, label %if.else, !dbg !367

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !368
  %idxprom = sext i32 %2 to i64, !dbg !370
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !370
  store i32 1, i32* %arrayidx, align 4, !dbg !371
  store i32 0, i32* %i, align 4, !dbg !372
  br label %for.cond, !dbg !374

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !375
  %cmp2 = icmp slt i32 %3, 10, !dbg !377
  br i1 %cmp2, label %for.body, label %for.end, !dbg !378

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !379
  %idxprom3 = sext i32 %4 to i64, !dbg !381
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !381
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !381
  call void @printIntLine(i32 noundef %5), !dbg !382
  br label %for.inc, !dbg !383

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !384
  %inc = add nsw i32 %6, 1, !dbg !384
  store i32 %inc, i32* %i, align 4, !dbg !384
  br label %for.cond, !dbg !385, !llvm.loop !386

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !388

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !389
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  br label %while.end5, !dbg !391

while.end5:                                       ; preds = %if.end
  ret void, !dbg !392
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !9, !5}
!3 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !4, line: 30, baseType: !5)
!4 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_u_int32_t.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !7, line: 45, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !11, line: 412, size: 128, elements: !12)
!11 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!12 = !{!13, !16, !19}
!13 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !10, file: !11, line: 413, baseType: !14, size: 8)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !7, line: 43, baseType: !15)
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !10, file: !11, line: 414, baseType: !17, size: 8, offset: 8)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !18, line: 31, baseType: !14)
!18 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!19 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !10, file: !11, line: 415, baseType: !20, size: 112, offset: 16)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 112, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 14)
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"PIC Level", i32 2}
!28 = !{i32 7, !"uwtable", i32 1}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !{!"Homebrew clang version 14.0.6"}
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocation(line: 48, column: 10, scope: !31)
!40 = !DILocation(line: 49, column: 5, scope: !31)
!41 = !DILocalVariable(name: "recvResult", scope: !42, file: !32, line: 56, type: !37)
!42 = distinct !DILexicalBlock(scope: !43, file: !32, line: 51, column: 9)
!43 = distinct !DILexicalBlock(scope: !31, file: !32, line: 50, column: 5)
!44 = !DILocation(line: 56, column: 17, scope: !42)
!45 = !DILocalVariable(name: "service", scope: !42, file: !32, line: 57, type: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !47, line: 375, size: 128, elements: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!48 = !{!49, !50, !51, !54, !61}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !46, file: !47, line: 376, baseType: !14, size: 8)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !46, file: !47, line: 377, baseType: !17, size: 8, offset: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !46, file: !47, line: 378, baseType: !52, size: 16, offset: 16)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !53, line: 31, baseType: !6)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !46, file: !47, line: 379, baseType: !55, size: 32, offset: 32)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !47, line: 301, size: 32, elements: !56)
!56 = !{!57}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !55, file: !47, line: 302, baseType: !58, size: 32)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !59, line: 31, baseType: !60)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 47, baseType: !5)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !46, file: !47, line: 380, baseType: !62, size: 64, offset: 64)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 64, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 8)
!65 = !DILocation(line: 57, column: 32, scope: !42)
!66 = !DILocalVariable(name: "listenSocket", scope: !42, file: !32, line: 58, type: !37)
!67 = !DILocation(line: 58, column: 20, scope: !42)
!68 = !DILocalVariable(name: "acceptSocket", scope: !42, file: !32, line: 59, type: !37)
!69 = !DILocation(line: 59, column: 20, scope: !42)
!70 = !DILocalVariable(name: "inputBuffer", scope: !42, file: !32, line: 60, type: !20)
!71 = !DILocation(line: 60, column: 18, scope: !42)
!72 = !DILocation(line: 61, column: 13, scope: !42)
!73 = !DILocation(line: 71, column: 32, scope: !74)
!74 = distinct !DILexicalBlock(scope: !42, file: !32, line: 62, column: 13)
!75 = !DILocation(line: 71, column: 30, scope: !74)
!76 = !DILocation(line: 72, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !32, line: 72, column: 21)
!78 = !DILocation(line: 72, column: 34, scope: !77)
!79 = !DILocation(line: 72, column: 21, scope: !74)
!80 = !DILocation(line: 74, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !32, line: 73, column: 17)
!82 = !DILocation(line: 76, column: 17, scope: !74)
!83 = !DILocation(line: 77, column: 25, scope: !74)
!84 = !DILocation(line: 77, column: 36, scope: !74)
!85 = !DILocation(line: 78, column: 25, scope: !74)
!86 = !DILocation(line: 78, column: 34, scope: !74)
!87 = !DILocation(line: 78, column: 41, scope: !74)
!88 = !DILocation(line: 79, column: 25, scope: !74)
!89 = !DILocation(line: 79, column: 34, scope: !74)
!90 = !DILocation(line: 80, column: 26, scope: !91)
!91 = distinct !DILexicalBlock(scope: !74, file: !32, line: 80, column: 21)
!92 = !DILocation(line: 80, column: 40, scope: !91)
!93 = !DILocation(line: 80, column: 21, scope: !91)
!94 = !DILocation(line: 80, column: 85, scope: !91)
!95 = !DILocation(line: 80, column: 21, scope: !74)
!96 = !DILocation(line: 82, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !32, line: 81, column: 17)
!98 = !DILocation(line: 84, column: 28, scope: !99)
!99 = distinct !DILexicalBlock(scope: !74, file: !32, line: 84, column: 21)
!100 = !DILocation(line: 84, column: 21, scope: !99)
!101 = !DILocation(line: 84, column: 58, scope: !99)
!102 = !DILocation(line: 84, column: 21, scope: !74)
!103 = !DILocation(line: 86, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !32, line: 85, column: 17)
!105 = !DILocation(line: 88, column: 39, scope: !74)
!106 = !DILocation(line: 88, column: 32, scope: !74)
!107 = !DILocation(line: 88, column: 30, scope: !74)
!108 = !DILocation(line: 89, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !74, file: !32, line: 89, column: 21)
!110 = !DILocation(line: 89, column: 34, scope: !109)
!111 = !DILocation(line: 89, column: 21, scope: !74)
!112 = !DILocation(line: 91, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !32, line: 90, column: 17)
!114 = !DILocation(line: 94, column: 35, scope: !74)
!115 = !DILocation(line: 94, column: 49, scope: !74)
!116 = !DILocation(line: 94, column: 30, scope: !74)
!117 = !DILocation(line: 94, column: 28, scope: !74)
!118 = !DILocation(line: 95, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !74, file: !32, line: 95, column: 21)
!120 = !DILocation(line: 95, column: 32, scope: !119)
!121 = !DILocation(line: 95, column: 48, scope: !119)
!122 = !DILocation(line: 95, column: 51, scope: !119)
!123 = !DILocation(line: 95, column: 62, scope: !119)
!124 = !DILocation(line: 95, column: 21, scope: !74)
!125 = !DILocation(line: 97, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !32, line: 96, column: 17)
!127 = !DILocation(line: 100, column: 29, scope: !74)
!128 = !DILocation(line: 100, column: 17, scope: !74)
!129 = !DILocation(line: 100, column: 41, scope: !74)
!130 = !DILocation(line: 102, column: 29, scope: !74)
!131 = !DILocation(line: 102, column: 24, scope: !74)
!132 = !DILocation(line: 102, column: 22, scope: !74)
!133 = !DILocation(line: 103, column: 13, scope: !74)
!134 = !DILocation(line: 105, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !42, file: !32, line: 105, column: 17)
!136 = !DILocation(line: 105, column: 30, scope: !135)
!137 = !DILocation(line: 105, column: 17, scope: !42)
!138 = !DILocation(line: 107, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !32, line: 106, column: 13)
!140 = !DILocation(line: 107, column: 17, scope: !139)
!141 = !DILocation(line: 108, column: 13, scope: !139)
!142 = !DILocation(line: 109, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !42, file: !32, line: 109, column: 17)
!144 = !DILocation(line: 109, column: 30, scope: !143)
!145 = !DILocation(line: 109, column: 17, scope: !42)
!146 = !DILocation(line: 111, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !32, line: 110, column: 13)
!148 = !DILocation(line: 111, column: 17, scope: !147)
!149 = !DILocation(line: 112, column: 13, scope: !147)
!150 = !DILocation(line: 120, column: 9, scope: !43)
!151 = !DILocation(line: 122, column: 5, scope: !31)
!152 = !DILocalVariable(name: "i", scope: !153, file: !32, line: 125, type: !37)
!153 = distinct !DILexicalBlock(scope: !154, file: !32, line: 124, column: 9)
!154 = distinct !DILexicalBlock(scope: !31, file: !32, line: 123, column: 5)
!155 = !DILocation(line: 125, column: 17, scope: !153)
!156 = !DILocalVariable(name: "buffer", scope: !153, file: !32, line: 126, type: !157)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !158)
!158 = !{!159}
!159 = !DISubrange(count: 10)
!160 = !DILocation(line: 126, column: 17, scope: !153)
!161 = !DILocation(line: 129, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !153, file: !32, line: 129, column: 17)
!163 = !DILocation(line: 129, column: 22, scope: !162)
!164 = !DILocation(line: 129, column: 17, scope: !153)
!165 = !DILocation(line: 131, column: 24, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !32, line: 130, column: 13)
!167 = !DILocation(line: 131, column: 17, scope: !166)
!168 = !DILocation(line: 131, column: 30, scope: !166)
!169 = !DILocation(line: 133, column: 23, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !32, line: 133, column: 17)
!171 = !DILocation(line: 133, column: 21, scope: !170)
!172 = !DILocation(line: 133, column: 28, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !32, line: 133, column: 17)
!174 = !DILocation(line: 133, column: 30, scope: !173)
!175 = !DILocation(line: 133, column: 17, scope: !170)
!176 = !DILocation(line: 135, column: 41, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !32, line: 134, column: 17)
!178 = !DILocation(line: 135, column: 34, scope: !177)
!179 = !DILocation(line: 135, column: 21, scope: !177)
!180 = !DILocation(line: 136, column: 17, scope: !177)
!181 = !DILocation(line: 133, column: 37, scope: !173)
!182 = !DILocation(line: 133, column: 17, scope: !173)
!183 = distinct !{!183, !175, !184, !185}
!184 = !DILocation(line: 136, column: 17, scope: !170)
!185 = !{!"llvm.loop.mustprogress"}
!186 = !DILocation(line: 137, column: 13, scope: !166)
!187 = !DILocation(line: 140, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !162, file: !32, line: 139, column: 13)
!189 = !DILocation(line: 143, column: 9, scope: !154)
!190 = !DILocation(line: 145, column: 1, scope: !31)
!191 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_16_good", scope: !32, file: !32, line: 292, type: !33, scopeLine: 293, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!192 = !DILocation(line: 294, column: 5, scope: !191)
!193 = !DILocation(line: 295, column: 5, scope: !191)
!194 = !DILocation(line: 296, column: 1, scope: !191)
!195 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 307, type: !196, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!196 = !DISubroutineType(types: !197)
!197 = !{!37, !37, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!200 = !DILocalVariable(name: "argc", arg: 1, scope: !195, file: !32, line: 307, type: !37)
!201 = !DILocation(line: 307, column: 14, scope: !195)
!202 = !DILocalVariable(name: "argv", arg: 2, scope: !195, file: !32, line: 307, type: !198)
!203 = !DILocation(line: 307, column: 27, scope: !195)
!204 = !DILocation(line: 310, column: 22, scope: !195)
!205 = !DILocation(line: 310, column: 12, scope: !195)
!206 = !DILocation(line: 310, column: 5, scope: !195)
!207 = !DILocation(line: 312, column: 5, scope: !195)
!208 = !DILocation(line: 313, column: 5, scope: !195)
!209 = !DILocation(line: 314, column: 5, scope: !195)
!210 = !DILocation(line: 317, column: 5, scope: !195)
!211 = !DILocation(line: 318, column: 5, scope: !195)
!212 = !DILocation(line: 319, column: 5, scope: !195)
!213 = !DILocation(line: 321, column: 5, scope: !195)
!214 = distinct !DISubprogram(name: "goodB2G", scope: !32, file: !32, line: 152, type: !33, scopeLine: 153, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!215 = !DILocalVariable(name: "data", scope: !214, file: !32, line: 154, type: !37)
!216 = !DILocation(line: 154, column: 9, scope: !214)
!217 = !DILocation(line: 156, column: 10, scope: !214)
!218 = !DILocation(line: 157, column: 5, scope: !214)
!219 = !DILocalVariable(name: "recvResult", scope: !220, file: !32, line: 164, type: !37)
!220 = distinct !DILexicalBlock(scope: !221, file: !32, line: 159, column: 9)
!221 = distinct !DILexicalBlock(scope: !214, file: !32, line: 158, column: 5)
!222 = !DILocation(line: 164, column: 17, scope: !220)
!223 = !DILocalVariable(name: "service", scope: !220, file: !32, line: 165, type: !46)
!224 = !DILocation(line: 165, column: 32, scope: !220)
!225 = !DILocalVariable(name: "listenSocket", scope: !220, file: !32, line: 166, type: !37)
!226 = !DILocation(line: 166, column: 20, scope: !220)
!227 = !DILocalVariable(name: "acceptSocket", scope: !220, file: !32, line: 167, type: !37)
!228 = !DILocation(line: 167, column: 20, scope: !220)
!229 = !DILocalVariable(name: "inputBuffer", scope: !220, file: !32, line: 168, type: !20)
!230 = !DILocation(line: 168, column: 18, scope: !220)
!231 = !DILocation(line: 169, column: 13, scope: !220)
!232 = !DILocation(line: 179, column: 32, scope: !233)
!233 = distinct !DILexicalBlock(scope: !220, file: !32, line: 170, column: 13)
!234 = !DILocation(line: 179, column: 30, scope: !233)
!235 = !DILocation(line: 180, column: 21, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !32, line: 180, column: 21)
!237 = !DILocation(line: 180, column: 34, scope: !236)
!238 = !DILocation(line: 180, column: 21, scope: !233)
!239 = !DILocation(line: 182, column: 21, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !32, line: 181, column: 17)
!241 = !DILocation(line: 184, column: 17, scope: !233)
!242 = !DILocation(line: 185, column: 25, scope: !233)
!243 = !DILocation(line: 185, column: 36, scope: !233)
!244 = !DILocation(line: 186, column: 25, scope: !233)
!245 = !DILocation(line: 186, column: 34, scope: !233)
!246 = !DILocation(line: 186, column: 41, scope: !233)
!247 = !DILocation(line: 187, column: 25, scope: !233)
!248 = !DILocation(line: 187, column: 34, scope: !233)
!249 = !DILocation(line: 188, column: 26, scope: !250)
!250 = distinct !DILexicalBlock(scope: !233, file: !32, line: 188, column: 21)
!251 = !DILocation(line: 188, column: 40, scope: !250)
!252 = !DILocation(line: 188, column: 21, scope: !250)
!253 = !DILocation(line: 188, column: 85, scope: !250)
!254 = !DILocation(line: 188, column: 21, scope: !233)
!255 = !DILocation(line: 190, column: 21, scope: !256)
!256 = distinct !DILexicalBlock(scope: !250, file: !32, line: 189, column: 17)
!257 = !DILocation(line: 192, column: 28, scope: !258)
!258 = distinct !DILexicalBlock(scope: !233, file: !32, line: 192, column: 21)
!259 = !DILocation(line: 192, column: 21, scope: !258)
!260 = !DILocation(line: 192, column: 58, scope: !258)
!261 = !DILocation(line: 192, column: 21, scope: !233)
!262 = !DILocation(line: 194, column: 21, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !32, line: 193, column: 17)
!264 = !DILocation(line: 196, column: 39, scope: !233)
!265 = !DILocation(line: 196, column: 32, scope: !233)
!266 = !DILocation(line: 196, column: 30, scope: !233)
!267 = !DILocation(line: 197, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !233, file: !32, line: 197, column: 21)
!269 = !DILocation(line: 197, column: 34, scope: !268)
!270 = !DILocation(line: 197, column: 21, scope: !233)
!271 = !DILocation(line: 199, column: 21, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !32, line: 198, column: 17)
!273 = !DILocation(line: 202, column: 35, scope: !233)
!274 = !DILocation(line: 202, column: 49, scope: !233)
!275 = !DILocation(line: 202, column: 30, scope: !233)
!276 = !DILocation(line: 202, column: 28, scope: !233)
!277 = !DILocation(line: 203, column: 21, scope: !278)
!278 = distinct !DILexicalBlock(scope: !233, file: !32, line: 203, column: 21)
!279 = !DILocation(line: 203, column: 32, scope: !278)
!280 = !DILocation(line: 203, column: 48, scope: !278)
!281 = !DILocation(line: 203, column: 51, scope: !278)
!282 = !DILocation(line: 203, column: 62, scope: !278)
!283 = !DILocation(line: 203, column: 21, scope: !233)
!284 = !DILocation(line: 205, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !278, file: !32, line: 204, column: 17)
!286 = !DILocation(line: 208, column: 29, scope: !233)
!287 = !DILocation(line: 208, column: 17, scope: !233)
!288 = !DILocation(line: 208, column: 41, scope: !233)
!289 = !DILocation(line: 210, column: 29, scope: !233)
!290 = !DILocation(line: 210, column: 24, scope: !233)
!291 = !DILocation(line: 210, column: 22, scope: !233)
!292 = !DILocation(line: 211, column: 13, scope: !233)
!293 = !DILocation(line: 213, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !220, file: !32, line: 213, column: 17)
!295 = !DILocation(line: 213, column: 30, scope: !294)
!296 = !DILocation(line: 213, column: 17, scope: !220)
!297 = !DILocation(line: 215, column: 30, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !32, line: 214, column: 13)
!299 = !DILocation(line: 215, column: 17, scope: !298)
!300 = !DILocation(line: 216, column: 13, scope: !298)
!301 = !DILocation(line: 217, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !220, file: !32, line: 217, column: 17)
!303 = !DILocation(line: 217, column: 30, scope: !302)
!304 = !DILocation(line: 217, column: 17, scope: !220)
!305 = !DILocation(line: 219, column: 30, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !32, line: 218, column: 13)
!307 = !DILocation(line: 219, column: 17, scope: !306)
!308 = !DILocation(line: 220, column: 13, scope: !306)
!309 = !DILocation(line: 228, column: 9, scope: !221)
!310 = !DILocation(line: 230, column: 5, scope: !214)
!311 = !DILocalVariable(name: "i", scope: !312, file: !32, line: 233, type: !37)
!312 = distinct !DILexicalBlock(scope: !313, file: !32, line: 232, column: 9)
!313 = distinct !DILexicalBlock(scope: !214, file: !32, line: 231, column: 5)
!314 = !DILocation(line: 233, column: 17, scope: !312)
!315 = !DILocalVariable(name: "buffer", scope: !312, file: !32, line: 234, type: !157)
!316 = !DILocation(line: 234, column: 17, scope: !312)
!317 = !DILocation(line: 236, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !312, file: !32, line: 236, column: 17)
!319 = !DILocation(line: 236, column: 22, scope: !318)
!320 = !DILocation(line: 236, column: 27, scope: !318)
!321 = !DILocation(line: 236, column: 30, scope: !318)
!322 = !DILocation(line: 236, column: 35, scope: !318)
!323 = !DILocation(line: 236, column: 17, scope: !312)
!324 = !DILocation(line: 238, column: 24, scope: !325)
!325 = distinct !DILexicalBlock(scope: !318, file: !32, line: 237, column: 13)
!326 = !DILocation(line: 238, column: 17, scope: !325)
!327 = !DILocation(line: 238, column: 30, scope: !325)
!328 = !DILocation(line: 240, column: 23, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !32, line: 240, column: 17)
!330 = !DILocation(line: 240, column: 21, scope: !329)
!331 = !DILocation(line: 240, column: 28, scope: !332)
!332 = distinct !DILexicalBlock(scope: !329, file: !32, line: 240, column: 17)
!333 = !DILocation(line: 240, column: 30, scope: !332)
!334 = !DILocation(line: 240, column: 17, scope: !329)
!335 = !DILocation(line: 242, column: 41, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !32, line: 241, column: 17)
!337 = !DILocation(line: 242, column: 34, scope: !336)
!338 = !DILocation(line: 242, column: 21, scope: !336)
!339 = !DILocation(line: 243, column: 17, scope: !336)
!340 = !DILocation(line: 240, column: 37, scope: !332)
!341 = !DILocation(line: 240, column: 17, scope: !332)
!342 = distinct !{!342, !334, !343, !185}
!343 = !DILocation(line: 243, column: 17, scope: !329)
!344 = !DILocation(line: 244, column: 13, scope: !325)
!345 = !DILocation(line: 247, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !318, file: !32, line: 246, column: 13)
!347 = !DILocation(line: 250, column: 9, scope: !313)
!348 = !DILocation(line: 252, column: 1, scope: !214)
!349 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 255, type: !33, scopeLine: 256, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!350 = !DILocalVariable(name: "data", scope: !349, file: !32, line: 257, type: !37)
!351 = !DILocation(line: 257, column: 9, scope: !349)
!352 = !DILocation(line: 259, column: 10, scope: !349)
!353 = !DILocation(line: 260, column: 5, scope: !349)
!354 = !DILocation(line: 264, column: 14, scope: !355)
!355 = distinct !DILexicalBlock(scope: !349, file: !32, line: 261, column: 5)
!356 = !DILocation(line: 265, column: 9, scope: !355)
!357 = !DILocation(line: 267, column: 5, scope: !349)
!358 = !DILocalVariable(name: "i", scope: !359, file: !32, line: 270, type: !37)
!359 = distinct !DILexicalBlock(scope: !360, file: !32, line: 269, column: 9)
!360 = distinct !DILexicalBlock(scope: !349, file: !32, line: 268, column: 5)
!361 = !DILocation(line: 270, column: 17, scope: !359)
!362 = !DILocalVariable(name: "buffer", scope: !359, file: !32, line: 271, type: !157)
!363 = !DILocation(line: 271, column: 17, scope: !359)
!364 = !DILocation(line: 274, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !359, file: !32, line: 274, column: 17)
!366 = !DILocation(line: 274, column: 22, scope: !365)
!367 = !DILocation(line: 274, column: 17, scope: !359)
!368 = !DILocation(line: 276, column: 24, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !32, line: 275, column: 13)
!370 = !DILocation(line: 276, column: 17, scope: !369)
!371 = !DILocation(line: 276, column: 30, scope: !369)
!372 = !DILocation(line: 278, column: 23, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !32, line: 278, column: 17)
!374 = !DILocation(line: 278, column: 21, scope: !373)
!375 = !DILocation(line: 278, column: 28, scope: !376)
!376 = distinct !DILexicalBlock(scope: !373, file: !32, line: 278, column: 17)
!377 = !DILocation(line: 278, column: 30, scope: !376)
!378 = !DILocation(line: 278, column: 17, scope: !373)
!379 = !DILocation(line: 280, column: 41, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !32, line: 279, column: 17)
!381 = !DILocation(line: 280, column: 34, scope: !380)
!382 = !DILocation(line: 280, column: 21, scope: !380)
!383 = !DILocation(line: 281, column: 17, scope: !380)
!384 = !DILocation(line: 278, column: 37, scope: !376)
!385 = !DILocation(line: 278, column: 17, scope: !376)
!386 = distinct !{!386, !378, !387, !185}
!387 = !DILocation(line: 281, column: 17, scope: !373)
!388 = !DILocation(line: 282, column: 13, scope: !369)
!389 = !DILocation(line: 285, column: 17, scope: !390)
!390 = distinct !DILexicalBlock(scope: !365, file: !32, line: 284, column: 13)
!391 = !DILocation(line: 288, column: 9, scope: !360)
!392 = !DILocation(line: 290, column: 1, scope: !349)
