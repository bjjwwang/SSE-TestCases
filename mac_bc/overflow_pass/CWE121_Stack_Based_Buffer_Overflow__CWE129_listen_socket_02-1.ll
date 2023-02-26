; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02_bad() #0 !dbg !31 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !45, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, i32* %listenSocket, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 -1, i32* %acceptSocket, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  br label %do.body, !dbg !72

do.body:                                          ; preds = %entry
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !150, metadata !DIExpression()), !dbg !154
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !155, metadata !DIExpression()), !dbg !159
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !159
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !159
  %16 = load i32, i32* %data, align 4, !dbg !160
  %cmp32 = icmp sge i32 %16, 0, !dbg !162
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !163

if.then34:                                        ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !164
  %idxprom35 = sext i32 %17 to i64, !dbg !166
  %arrayidx36 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom35, !dbg !166
  store i32 1, i32* %arrayidx36, align 4, !dbg !167
  store i32 0, i32* %i, align 4, !dbg !168
  br label %for.cond, !dbg !170

for.cond:                                         ; preds = %for.inc, %if.then34
  %18 = load i32, i32* %i, align 4, !dbg !171
  %cmp37 = icmp slt i32 %18, 10, !dbg !173
  br i1 %cmp37, label %for.body, label %for.end, !dbg !174

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !175
  %idxprom39 = sext i32 %19 to i64, !dbg !177
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !177
  %20 = load i32, i32* %arrayidx40, align 4, !dbg !177
  call void @printIntLine(i32 noundef %20), !dbg !178
  br label %for.inc, !dbg !179

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !180
  %inc = add nsw i32 %21, 1, !dbg !180
  store i32 %inc, i32* %i, align 4, !dbg !180
  br label %for.cond, !dbg !181, !llvm.loop !182

for.end:                                          ; preds = %for.cond
  br label %if.end41, !dbg !185

if.else:                                          ; preds = %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !186
  br label %if.end41

if.end41:                                         ; preds = %if.else, %for.end
  ret void, !dbg !188
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02_good() #0 !dbg !189 {
entry:
  call void @goodB2G1(), !dbg !190
  call void @goodB2G2(), !dbg !191
  call void @goodG2B1(), !dbg !192
  call void @goodG2B2(), !dbg !193
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02_good(), !dbg !208
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !209
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !210
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02_bad(), !dbg !211
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !212
  ret i32 0, !dbg !213
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !214 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !218, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !223, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !225, metadata !DIExpression()), !dbg !226
  store i32 -1, i32* %listenSocket, align 4, !dbg !226
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !227, metadata !DIExpression()), !dbg !228
  store i32 -1, i32* %acceptSocket, align 4, !dbg !228
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !229, metadata !DIExpression()), !dbg !230
  br label %do.body, !dbg !231

do.body:                                          ; preds = %entry
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !309, metadata !DIExpression()), !dbg !313
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !314, metadata !DIExpression()), !dbg !315
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !315
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !315
  %16 = load i32, i32* %data, align 4, !dbg !316
  %cmp32 = icmp sge i32 %16, 0, !dbg !318
  br i1 %cmp32, label %land.lhs.true, label %if.else, !dbg !319

land.lhs.true:                                    ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !320
  %cmp34 = icmp slt i32 %17, 10, !dbg !321
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !322

if.then36:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !323
  %idxprom37 = sext i32 %18 to i64, !dbg !325
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !325
  store i32 1, i32* %arrayidx38, align 4, !dbg !326
  store i32 0, i32* %i, align 4, !dbg !327
  br label %for.cond, !dbg !329

for.cond:                                         ; preds = %for.inc, %if.then36
  %19 = load i32, i32* %i, align 4, !dbg !330
  %cmp39 = icmp slt i32 %19, 10, !dbg !332
  br i1 %cmp39, label %for.body, label %for.end, !dbg !333

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !334
  %idxprom41 = sext i32 %20 to i64, !dbg !336
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !336
  %21 = load i32, i32* %arrayidx42, align 4, !dbg !336
  call void @printIntLine(i32 noundef %21), !dbg !337
  br label %for.inc, !dbg !338

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !339
  %inc = add nsw i32 %22, 1, !dbg !339
  store i32 %inc, i32* %i, align 4, !dbg !339
  br label %for.cond, !dbg !340, !llvm.loop !341

for.end:                                          ; preds = %for.cond
  br label %if.end43, !dbg !343

if.else:                                          ; preds = %land.lhs.true, %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !344
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end
  ret void, !dbg !346
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !347 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !348, metadata !DIExpression()), !dbg !349
  store i32 -1, i32* %data, align 4, !dbg !350
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !351, metadata !DIExpression()), !dbg !355
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !356, metadata !DIExpression()), !dbg !357
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !358, metadata !DIExpression()), !dbg !359
  store i32 -1, i32* %listenSocket, align 4, !dbg !359
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !360, metadata !DIExpression()), !dbg !361
  store i32 -1, i32* %acceptSocket, align 4, !dbg !361
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !362, metadata !DIExpression()), !dbg !363
  br label %do.body, !dbg !364

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !365
  store i32 %call, i32* %listenSocket, align 4, !dbg !367
  %0 = load i32, i32* %listenSocket, align 4, !dbg !368
  %cmp = icmp eq i32 %0, -1, !dbg !370
  br i1 %cmp, label %if.then, label %if.end, !dbg !371

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !372

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !374
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !374
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !375
  store i8 2, i8* %sin_family, align 1, !dbg !376
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !377
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !378
  store i32 0, i32* %s_addr, align 4, !dbg !379
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !380
  store i16 -30871, i16* %sin_port, align 2, !dbg !381
  %2 = load i32, i32* %listenSocket, align 4, !dbg !382
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !384
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !385
  %cmp2 = icmp eq i32 %call1, -1, !dbg !386
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !387

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !388

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !390
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !392
  %cmp6 = icmp eq i32 %call5, -1, !dbg !393
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !394

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !395

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !397
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !398
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !399
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !400
  %cmp10 = icmp eq i32 %6, -1, !dbg !402
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !403

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !404

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !406
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !407
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !408
  %conv = trunc i64 %call13 to i32, !dbg !408
  store i32 %conv, i32* %recvResult, align 4, !dbg !409
  %8 = load i32, i32* %recvResult, align 4, !dbg !410
  %cmp14 = icmp eq i32 %8, -1, !dbg !412
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !413

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !414
  %cmp16 = icmp eq i32 %9, 0, !dbg !415
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !416

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !417

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !419
  %idxprom = sext i32 %10 to i64, !dbg !420
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !420
  store i8 0, i8* %arrayidx, align 1, !dbg !421
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !422
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !423
  store i32 %call21, i32* %data, align 4, !dbg !424
  br label %do.end, !dbg !425

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !426
  %cmp22 = icmp ne i32 %11, -1, !dbg !428
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !429

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !430
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !432
  br label %if.end26, !dbg !433

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !434
  %cmp27 = icmp ne i32 %13, -1, !dbg !436
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !437

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !438
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !440
  br label %if.end31, !dbg !441

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !442, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !447, metadata !DIExpression()), !dbg !448
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !448
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !448
  %16 = load i32, i32* %data, align 4, !dbg !449
  %cmp32 = icmp sge i32 %16, 0, !dbg !451
  br i1 %cmp32, label %land.lhs.true, label %if.else, !dbg !452

land.lhs.true:                                    ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !453
  %cmp34 = icmp slt i32 %17, 10, !dbg !454
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !455

if.then36:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !456
  %idxprom37 = sext i32 %18 to i64, !dbg !458
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !458
  store i32 1, i32* %arrayidx38, align 4, !dbg !459
  store i32 0, i32* %i, align 4, !dbg !460
  br label %for.cond, !dbg !462

for.cond:                                         ; preds = %for.inc, %if.then36
  %19 = load i32, i32* %i, align 4, !dbg !463
  %cmp39 = icmp slt i32 %19, 10, !dbg !465
  br i1 %cmp39, label %for.body, label %for.end, !dbg !466

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !467
  %idxprom41 = sext i32 %20 to i64, !dbg !469
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !469
  %21 = load i32, i32* %arrayidx42, align 4, !dbg !469
  call void @printIntLine(i32 noundef %21), !dbg !470
  br label %for.inc, !dbg !471

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !472
  %inc = add nsw i32 %22, 1, !dbg !472
  store i32 %inc, i32* %i, align 4, !dbg !472
  br label %for.cond, !dbg !473, !llvm.loop !474

for.end:                                          ; preds = %for.cond
  br label %if.end43, !dbg !476

if.else:                                          ; preds = %land.lhs.true, %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !477
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end
  ret void, !dbg !479
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !480 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !481, metadata !DIExpression()), !dbg !482
  store i32 -1, i32* %data, align 4, !dbg !483
  store i32 7, i32* %data, align 4, !dbg !484
  call void @llvm.dbg.declare(metadata i32* %i, metadata !487, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !492, metadata !DIExpression()), !dbg !493
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !493
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !493
  %1 = load i32, i32* %data, align 4, !dbg !494
  %cmp = icmp sge i32 %1, 0, !dbg !496
  br i1 %cmp, label %if.then, label %if.else, !dbg !497

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !498
  %idxprom = sext i32 %2 to i64, !dbg !500
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !500
  store i32 1, i32* %arrayidx, align 4, !dbg !501
  store i32 0, i32* %i, align 4, !dbg !502
  br label %for.cond, !dbg !504

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !505
  %cmp1 = icmp slt i32 %3, 10, !dbg !507
  br i1 %cmp1, label %for.body, label %for.end, !dbg !508

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !509
  %idxprom2 = sext i32 %4 to i64, !dbg !511
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !511
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !511
  call void @printIntLine(i32 noundef %5), !dbg !512
  br label %for.inc, !dbg !513

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !514
  %inc = add nsw i32 %6, 1, !dbg !514
  store i32 %inc, i32* %i, align 4, !dbg !514
  br label %for.cond, !dbg !515, !llvm.loop !516

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !518

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !519
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !521
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !522 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !523, metadata !DIExpression()), !dbg !524
  store i32 -1, i32* %data, align 4, !dbg !525
  store i32 7, i32* %data, align 4, !dbg !526
  call void @llvm.dbg.declare(metadata i32* %i, metadata !529, metadata !DIExpression()), !dbg !533
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !534, metadata !DIExpression()), !dbg !535
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !535
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !535
  %1 = load i32, i32* %data, align 4, !dbg !536
  %cmp = icmp sge i32 %1, 0, !dbg !538
  br i1 %cmp, label %if.then, label %if.else, !dbg !539

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !540
  %idxprom = sext i32 %2 to i64, !dbg !542
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !542
  store i32 1, i32* %arrayidx, align 4, !dbg !543
  store i32 0, i32* %i, align 4, !dbg !544
  br label %for.cond, !dbg !546

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !547
  %cmp1 = icmp slt i32 %3, 10, !dbg !549
  br i1 %cmp1, label %for.body, label %for.end, !dbg !550

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !551
  %idxprom2 = sext i32 %4 to i64, !dbg !553
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !553
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !553
  call void @printIntLine(i32 noundef %5), !dbg !554
  br label %for.inc, !dbg !555

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !556
  %inc = add nsw i32 %6, 1, !dbg !556
  store i32 %inc, i32* %i, align 4, !dbg !556
  br label %for.cond, !dbg !557, !llvm.loop !558

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !560

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !561
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !563
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocation(line: 48, column: 10, scope: !31)
!40 = !DILocalVariable(name: "recvResult", scope: !41, file: !32, line: 56, type: !37)
!41 = distinct !DILexicalBlock(scope: !42, file: !32, line: 51, column: 9)
!42 = distinct !DILexicalBlock(scope: !43, file: !32, line: 50, column: 5)
!43 = distinct !DILexicalBlock(scope: !31, file: !32, line: 49, column: 8)
!44 = !DILocation(line: 56, column: 17, scope: !41)
!45 = !DILocalVariable(name: "service", scope: !41, file: !32, line: 57, type: !46)
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
!65 = !DILocation(line: 57, column: 32, scope: !41)
!66 = !DILocalVariable(name: "listenSocket", scope: !41, file: !32, line: 58, type: !37)
!67 = !DILocation(line: 58, column: 20, scope: !41)
!68 = !DILocalVariable(name: "acceptSocket", scope: !41, file: !32, line: 59, type: !37)
!69 = !DILocation(line: 59, column: 20, scope: !41)
!70 = !DILocalVariable(name: "inputBuffer", scope: !41, file: !32, line: 60, type: !20)
!71 = !DILocation(line: 60, column: 18, scope: !41)
!72 = !DILocation(line: 61, column: 13, scope: !41)
!73 = !DILocation(line: 71, column: 32, scope: !74)
!74 = distinct !DILexicalBlock(scope: !41, file: !32, line: 62, column: 13)
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
!135 = distinct !DILexicalBlock(scope: !41, file: !32, line: 105, column: 17)
!136 = !DILocation(line: 105, column: 30, scope: !135)
!137 = !DILocation(line: 105, column: 17, scope: !41)
!138 = !DILocation(line: 107, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !32, line: 106, column: 13)
!140 = !DILocation(line: 107, column: 17, scope: !139)
!141 = !DILocation(line: 108, column: 13, scope: !139)
!142 = !DILocation(line: 109, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !41, file: !32, line: 109, column: 17)
!144 = !DILocation(line: 109, column: 30, scope: !143)
!145 = !DILocation(line: 109, column: 17, scope: !41)
!146 = !DILocation(line: 111, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !32, line: 110, column: 13)
!148 = !DILocation(line: 111, column: 17, scope: !147)
!149 = !DILocation(line: 112, column: 13, scope: !147)
!150 = !DILocalVariable(name: "i", scope: !151, file: !32, line: 124, type: !37)
!151 = distinct !DILexicalBlock(scope: !152, file: !32, line: 123, column: 9)
!152 = distinct !DILexicalBlock(scope: !153, file: !32, line: 122, column: 5)
!153 = distinct !DILexicalBlock(scope: !31, file: !32, line: 121, column: 8)
!154 = !DILocation(line: 124, column: 17, scope: !151)
!155 = !DILocalVariable(name: "buffer", scope: !151, file: !32, line: 125, type: !156)
!156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !157)
!157 = !{!158}
!158 = !DISubrange(count: 10)
!159 = !DILocation(line: 125, column: 17, scope: !151)
!160 = !DILocation(line: 128, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !151, file: !32, line: 128, column: 17)
!162 = !DILocation(line: 128, column: 22, scope: !161)
!163 = !DILocation(line: 128, column: 17, scope: !151)
!164 = !DILocation(line: 130, column: 24, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !32, line: 129, column: 13)
!166 = !DILocation(line: 130, column: 17, scope: !165)
!167 = !DILocation(line: 130, column: 30, scope: !165)
!168 = !DILocation(line: 132, column: 23, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !32, line: 132, column: 17)
!170 = !DILocation(line: 132, column: 21, scope: !169)
!171 = !DILocation(line: 132, column: 28, scope: !172)
!172 = distinct !DILexicalBlock(scope: !169, file: !32, line: 132, column: 17)
!173 = !DILocation(line: 132, column: 30, scope: !172)
!174 = !DILocation(line: 132, column: 17, scope: !169)
!175 = !DILocation(line: 134, column: 41, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !32, line: 133, column: 17)
!177 = !DILocation(line: 134, column: 34, scope: !176)
!178 = !DILocation(line: 134, column: 21, scope: !176)
!179 = !DILocation(line: 135, column: 17, scope: !176)
!180 = !DILocation(line: 132, column: 37, scope: !172)
!181 = !DILocation(line: 132, column: 17, scope: !172)
!182 = distinct !{!182, !174, !183, !184}
!183 = !DILocation(line: 135, column: 17, scope: !169)
!184 = !{!"llvm.loop.mustprogress"}
!185 = !DILocation(line: 136, column: 13, scope: !165)
!186 = !DILocation(line: 139, column: 17, scope: !187)
!187 = distinct !DILexicalBlock(scope: !161, file: !32, line: 138, column: 13)
!188 = !DILocation(line: 143, column: 1, scope: !31)
!189 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_02_good", scope: !32, file: !32, line: 433, type: !33, scopeLine: 434, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!190 = !DILocation(line: 435, column: 5, scope: !189)
!191 = !DILocation(line: 436, column: 5, scope: !189)
!192 = !DILocation(line: 437, column: 5, scope: !189)
!193 = !DILocation(line: 438, column: 5, scope: !189)
!194 = !DILocation(line: 439, column: 1, scope: !189)
!195 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 450, type: !196, scopeLine: 451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!196 = !DISubroutineType(types: !197)
!197 = !{!37, !37, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!200 = !DILocalVariable(name: "argc", arg: 1, scope: !195, file: !32, line: 450, type: !37)
!201 = !DILocation(line: 450, column: 14, scope: !195)
!202 = !DILocalVariable(name: "argv", arg: 2, scope: !195, file: !32, line: 450, type: !198)
!203 = !DILocation(line: 450, column: 27, scope: !195)
!204 = !DILocation(line: 453, column: 22, scope: !195)
!205 = !DILocation(line: 453, column: 12, scope: !195)
!206 = !DILocation(line: 453, column: 5, scope: !195)
!207 = !DILocation(line: 455, column: 5, scope: !195)
!208 = !DILocation(line: 456, column: 5, scope: !195)
!209 = !DILocation(line: 457, column: 5, scope: !195)
!210 = !DILocation(line: 460, column: 5, scope: !195)
!211 = !DILocation(line: 461, column: 5, scope: !195)
!212 = !DILocation(line: 462, column: 5, scope: !195)
!213 = !DILocation(line: 464, column: 5, scope: !195)
!214 = distinct !DISubprogram(name: "goodB2G1", scope: !32, file: !32, line: 150, type: !33, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!215 = !DILocalVariable(name: "data", scope: !214, file: !32, line: 152, type: !37)
!216 = !DILocation(line: 152, column: 9, scope: !214)
!217 = !DILocation(line: 154, column: 10, scope: !214)
!218 = !DILocalVariable(name: "recvResult", scope: !219, file: !32, line: 162, type: !37)
!219 = distinct !DILexicalBlock(scope: !220, file: !32, line: 157, column: 9)
!220 = distinct !DILexicalBlock(scope: !221, file: !32, line: 156, column: 5)
!221 = distinct !DILexicalBlock(scope: !214, file: !32, line: 155, column: 8)
!222 = !DILocation(line: 162, column: 17, scope: !219)
!223 = !DILocalVariable(name: "service", scope: !219, file: !32, line: 163, type: !46)
!224 = !DILocation(line: 163, column: 32, scope: !219)
!225 = !DILocalVariable(name: "listenSocket", scope: !219, file: !32, line: 164, type: !37)
!226 = !DILocation(line: 164, column: 20, scope: !219)
!227 = !DILocalVariable(name: "acceptSocket", scope: !219, file: !32, line: 165, type: !37)
!228 = !DILocation(line: 165, column: 20, scope: !219)
!229 = !DILocalVariable(name: "inputBuffer", scope: !219, file: !32, line: 166, type: !20)
!230 = !DILocation(line: 166, column: 18, scope: !219)
!231 = !DILocation(line: 167, column: 13, scope: !219)
!232 = !DILocation(line: 177, column: 32, scope: !233)
!233 = distinct !DILexicalBlock(scope: !219, file: !32, line: 168, column: 13)
!234 = !DILocation(line: 177, column: 30, scope: !233)
!235 = !DILocation(line: 178, column: 21, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !32, line: 178, column: 21)
!237 = !DILocation(line: 178, column: 34, scope: !236)
!238 = !DILocation(line: 178, column: 21, scope: !233)
!239 = !DILocation(line: 180, column: 21, scope: !240)
!240 = distinct !DILexicalBlock(scope: !236, file: !32, line: 179, column: 17)
!241 = !DILocation(line: 182, column: 17, scope: !233)
!242 = !DILocation(line: 183, column: 25, scope: !233)
!243 = !DILocation(line: 183, column: 36, scope: !233)
!244 = !DILocation(line: 184, column: 25, scope: !233)
!245 = !DILocation(line: 184, column: 34, scope: !233)
!246 = !DILocation(line: 184, column: 41, scope: !233)
!247 = !DILocation(line: 185, column: 25, scope: !233)
!248 = !DILocation(line: 185, column: 34, scope: !233)
!249 = !DILocation(line: 186, column: 26, scope: !250)
!250 = distinct !DILexicalBlock(scope: !233, file: !32, line: 186, column: 21)
!251 = !DILocation(line: 186, column: 40, scope: !250)
!252 = !DILocation(line: 186, column: 21, scope: !250)
!253 = !DILocation(line: 186, column: 85, scope: !250)
!254 = !DILocation(line: 186, column: 21, scope: !233)
!255 = !DILocation(line: 188, column: 21, scope: !256)
!256 = distinct !DILexicalBlock(scope: !250, file: !32, line: 187, column: 17)
!257 = !DILocation(line: 190, column: 28, scope: !258)
!258 = distinct !DILexicalBlock(scope: !233, file: !32, line: 190, column: 21)
!259 = !DILocation(line: 190, column: 21, scope: !258)
!260 = !DILocation(line: 190, column: 58, scope: !258)
!261 = !DILocation(line: 190, column: 21, scope: !233)
!262 = !DILocation(line: 192, column: 21, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !32, line: 191, column: 17)
!264 = !DILocation(line: 194, column: 39, scope: !233)
!265 = !DILocation(line: 194, column: 32, scope: !233)
!266 = !DILocation(line: 194, column: 30, scope: !233)
!267 = !DILocation(line: 195, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !233, file: !32, line: 195, column: 21)
!269 = !DILocation(line: 195, column: 34, scope: !268)
!270 = !DILocation(line: 195, column: 21, scope: !233)
!271 = !DILocation(line: 197, column: 21, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !32, line: 196, column: 17)
!273 = !DILocation(line: 200, column: 35, scope: !233)
!274 = !DILocation(line: 200, column: 49, scope: !233)
!275 = !DILocation(line: 200, column: 30, scope: !233)
!276 = !DILocation(line: 200, column: 28, scope: !233)
!277 = !DILocation(line: 201, column: 21, scope: !278)
!278 = distinct !DILexicalBlock(scope: !233, file: !32, line: 201, column: 21)
!279 = !DILocation(line: 201, column: 32, scope: !278)
!280 = !DILocation(line: 201, column: 48, scope: !278)
!281 = !DILocation(line: 201, column: 51, scope: !278)
!282 = !DILocation(line: 201, column: 62, scope: !278)
!283 = !DILocation(line: 201, column: 21, scope: !233)
!284 = !DILocation(line: 203, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !278, file: !32, line: 202, column: 17)
!286 = !DILocation(line: 206, column: 29, scope: !233)
!287 = !DILocation(line: 206, column: 17, scope: !233)
!288 = !DILocation(line: 206, column: 41, scope: !233)
!289 = !DILocation(line: 208, column: 29, scope: !233)
!290 = !DILocation(line: 208, column: 24, scope: !233)
!291 = !DILocation(line: 208, column: 22, scope: !233)
!292 = !DILocation(line: 209, column: 13, scope: !233)
!293 = !DILocation(line: 211, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !219, file: !32, line: 211, column: 17)
!295 = !DILocation(line: 211, column: 30, scope: !294)
!296 = !DILocation(line: 211, column: 17, scope: !219)
!297 = !DILocation(line: 213, column: 30, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !32, line: 212, column: 13)
!299 = !DILocation(line: 213, column: 17, scope: !298)
!300 = !DILocation(line: 214, column: 13, scope: !298)
!301 = !DILocation(line: 215, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !219, file: !32, line: 215, column: 17)
!303 = !DILocation(line: 215, column: 30, scope: !302)
!304 = !DILocation(line: 215, column: 17, scope: !219)
!305 = !DILocation(line: 217, column: 30, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !32, line: 216, column: 13)
!307 = !DILocation(line: 217, column: 17, scope: !306)
!308 = !DILocation(line: 218, column: 13, scope: !306)
!309 = !DILocalVariable(name: "i", scope: !310, file: !32, line: 235, type: !37)
!310 = distinct !DILexicalBlock(scope: !311, file: !32, line: 234, column: 9)
!311 = distinct !DILexicalBlock(scope: !312, file: !32, line: 233, column: 5)
!312 = distinct !DILexicalBlock(scope: !214, file: !32, line: 227, column: 8)
!313 = !DILocation(line: 235, column: 17, scope: !310)
!314 = !DILocalVariable(name: "buffer", scope: !310, file: !32, line: 236, type: !156)
!315 = !DILocation(line: 236, column: 17, scope: !310)
!316 = !DILocation(line: 238, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !310, file: !32, line: 238, column: 17)
!318 = !DILocation(line: 238, column: 22, scope: !317)
!319 = !DILocation(line: 238, column: 27, scope: !317)
!320 = !DILocation(line: 238, column: 30, scope: !317)
!321 = !DILocation(line: 238, column: 35, scope: !317)
!322 = !DILocation(line: 238, column: 17, scope: !310)
!323 = !DILocation(line: 240, column: 24, scope: !324)
!324 = distinct !DILexicalBlock(scope: !317, file: !32, line: 239, column: 13)
!325 = !DILocation(line: 240, column: 17, scope: !324)
!326 = !DILocation(line: 240, column: 30, scope: !324)
!327 = !DILocation(line: 242, column: 23, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !32, line: 242, column: 17)
!329 = !DILocation(line: 242, column: 21, scope: !328)
!330 = !DILocation(line: 242, column: 28, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !32, line: 242, column: 17)
!332 = !DILocation(line: 242, column: 30, scope: !331)
!333 = !DILocation(line: 242, column: 17, scope: !328)
!334 = !DILocation(line: 244, column: 41, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !32, line: 243, column: 17)
!336 = !DILocation(line: 244, column: 34, scope: !335)
!337 = !DILocation(line: 244, column: 21, scope: !335)
!338 = !DILocation(line: 245, column: 17, scope: !335)
!339 = !DILocation(line: 242, column: 37, scope: !331)
!340 = !DILocation(line: 242, column: 17, scope: !331)
!341 = distinct !{!341, !333, !342, !184}
!342 = !DILocation(line: 245, column: 17, scope: !328)
!343 = !DILocation(line: 246, column: 13, scope: !324)
!344 = !DILocation(line: 249, column: 17, scope: !345)
!345 = distinct !DILexicalBlock(scope: !317, file: !32, line: 248, column: 13)
!346 = !DILocation(line: 253, column: 1, scope: !214)
!347 = distinct !DISubprogram(name: "goodB2G2", scope: !32, file: !32, line: 256, type: !33, scopeLine: 257, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!348 = !DILocalVariable(name: "data", scope: !347, file: !32, line: 258, type: !37)
!349 = !DILocation(line: 258, column: 9, scope: !347)
!350 = !DILocation(line: 260, column: 10, scope: !347)
!351 = !DILocalVariable(name: "recvResult", scope: !352, file: !32, line: 268, type: !37)
!352 = distinct !DILexicalBlock(scope: !353, file: !32, line: 263, column: 9)
!353 = distinct !DILexicalBlock(scope: !354, file: !32, line: 262, column: 5)
!354 = distinct !DILexicalBlock(scope: !347, file: !32, line: 261, column: 8)
!355 = !DILocation(line: 268, column: 17, scope: !352)
!356 = !DILocalVariable(name: "service", scope: !352, file: !32, line: 269, type: !46)
!357 = !DILocation(line: 269, column: 32, scope: !352)
!358 = !DILocalVariable(name: "listenSocket", scope: !352, file: !32, line: 270, type: !37)
!359 = !DILocation(line: 270, column: 20, scope: !352)
!360 = !DILocalVariable(name: "acceptSocket", scope: !352, file: !32, line: 271, type: !37)
!361 = !DILocation(line: 271, column: 20, scope: !352)
!362 = !DILocalVariable(name: "inputBuffer", scope: !352, file: !32, line: 272, type: !20)
!363 = !DILocation(line: 272, column: 18, scope: !352)
!364 = !DILocation(line: 273, column: 13, scope: !352)
!365 = !DILocation(line: 283, column: 32, scope: !366)
!366 = distinct !DILexicalBlock(scope: !352, file: !32, line: 274, column: 13)
!367 = !DILocation(line: 283, column: 30, scope: !366)
!368 = !DILocation(line: 284, column: 21, scope: !369)
!369 = distinct !DILexicalBlock(scope: !366, file: !32, line: 284, column: 21)
!370 = !DILocation(line: 284, column: 34, scope: !369)
!371 = !DILocation(line: 284, column: 21, scope: !366)
!372 = !DILocation(line: 286, column: 21, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !32, line: 285, column: 17)
!374 = !DILocation(line: 288, column: 17, scope: !366)
!375 = !DILocation(line: 289, column: 25, scope: !366)
!376 = !DILocation(line: 289, column: 36, scope: !366)
!377 = !DILocation(line: 290, column: 25, scope: !366)
!378 = !DILocation(line: 290, column: 34, scope: !366)
!379 = !DILocation(line: 290, column: 41, scope: !366)
!380 = !DILocation(line: 291, column: 25, scope: !366)
!381 = !DILocation(line: 291, column: 34, scope: !366)
!382 = !DILocation(line: 292, column: 26, scope: !383)
!383 = distinct !DILexicalBlock(scope: !366, file: !32, line: 292, column: 21)
!384 = !DILocation(line: 292, column: 40, scope: !383)
!385 = !DILocation(line: 292, column: 21, scope: !383)
!386 = !DILocation(line: 292, column: 85, scope: !383)
!387 = !DILocation(line: 292, column: 21, scope: !366)
!388 = !DILocation(line: 294, column: 21, scope: !389)
!389 = distinct !DILexicalBlock(scope: !383, file: !32, line: 293, column: 17)
!390 = !DILocation(line: 296, column: 28, scope: !391)
!391 = distinct !DILexicalBlock(scope: !366, file: !32, line: 296, column: 21)
!392 = !DILocation(line: 296, column: 21, scope: !391)
!393 = !DILocation(line: 296, column: 58, scope: !391)
!394 = !DILocation(line: 296, column: 21, scope: !366)
!395 = !DILocation(line: 298, column: 21, scope: !396)
!396 = distinct !DILexicalBlock(scope: !391, file: !32, line: 297, column: 17)
!397 = !DILocation(line: 300, column: 39, scope: !366)
!398 = !DILocation(line: 300, column: 32, scope: !366)
!399 = !DILocation(line: 300, column: 30, scope: !366)
!400 = !DILocation(line: 301, column: 21, scope: !401)
!401 = distinct !DILexicalBlock(scope: !366, file: !32, line: 301, column: 21)
!402 = !DILocation(line: 301, column: 34, scope: !401)
!403 = !DILocation(line: 301, column: 21, scope: !366)
!404 = !DILocation(line: 303, column: 21, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !32, line: 302, column: 17)
!406 = !DILocation(line: 306, column: 35, scope: !366)
!407 = !DILocation(line: 306, column: 49, scope: !366)
!408 = !DILocation(line: 306, column: 30, scope: !366)
!409 = !DILocation(line: 306, column: 28, scope: !366)
!410 = !DILocation(line: 307, column: 21, scope: !411)
!411 = distinct !DILexicalBlock(scope: !366, file: !32, line: 307, column: 21)
!412 = !DILocation(line: 307, column: 32, scope: !411)
!413 = !DILocation(line: 307, column: 48, scope: !411)
!414 = !DILocation(line: 307, column: 51, scope: !411)
!415 = !DILocation(line: 307, column: 62, scope: !411)
!416 = !DILocation(line: 307, column: 21, scope: !366)
!417 = !DILocation(line: 309, column: 21, scope: !418)
!418 = distinct !DILexicalBlock(scope: !411, file: !32, line: 308, column: 17)
!419 = !DILocation(line: 312, column: 29, scope: !366)
!420 = !DILocation(line: 312, column: 17, scope: !366)
!421 = !DILocation(line: 312, column: 41, scope: !366)
!422 = !DILocation(line: 314, column: 29, scope: !366)
!423 = !DILocation(line: 314, column: 24, scope: !366)
!424 = !DILocation(line: 314, column: 22, scope: !366)
!425 = !DILocation(line: 315, column: 13, scope: !366)
!426 = !DILocation(line: 317, column: 17, scope: !427)
!427 = distinct !DILexicalBlock(scope: !352, file: !32, line: 317, column: 17)
!428 = !DILocation(line: 317, column: 30, scope: !427)
!429 = !DILocation(line: 317, column: 17, scope: !352)
!430 = !DILocation(line: 319, column: 30, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !32, line: 318, column: 13)
!432 = !DILocation(line: 319, column: 17, scope: !431)
!433 = !DILocation(line: 320, column: 13, scope: !431)
!434 = !DILocation(line: 321, column: 17, scope: !435)
!435 = distinct !DILexicalBlock(scope: !352, file: !32, line: 321, column: 17)
!436 = !DILocation(line: 321, column: 30, scope: !435)
!437 = !DILocation(line: 321, column: 17, scope: !352)
!438 = !DILocation(line: 323, column: 30, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !32, line: 322, column: 13)
!440 = !DILocation(line: 323, column: 17, scope: !439)
!441 = !DILocation(line: 324, column: 13, scope: !439)
!442 = !DILocalVariable(name: "i", scope: !443, file: !32, line: 336, type: !37)
!443 = distinct !DILexicalBlock(scope: !444, file: !32, line: 335, column: 9)
!444 = distinct !DILexicalBlock(scope: !445, file: !32, line: 334, column: 5)
!445 = distinct !DILexicalBlock(scope: !347, file: !32, line: 333, column: 8)
!446 = !DILocation(line: 336, column: 17, scope: !443)
!447 = !DILocalVariable(name: "buffer", scope: !443, file: !32, line: 337, type: !156)
!448 = !DILocation(line: 337, column: 17, scope: !443)
!449 = !DILocation(line: 339, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !443, file: !32, line: 339, column: 17)
!451 = !DILocation(line: 339, column: 22, scope: !450)
!452 = !DILocation(line: 339, column: 27, scope: !450)
!453 = !DILocation(line: 339, column: 30, scope: !450)
!454 = !DILocation(line: 339, column: 35, scope: !450)
!455 = !DILocation(line: 339, column: 17, scope: !443)
!456 = !DILocation(line: 341, column: 24, scope: !457)
!457 = distinct !DILexicalBlock(scope: !450, file: !32, line: 340, column: 13)
!458 = !DILocation(line: 341, column: 17, scope: !457)
!459 = !DILocation(line: 341, column: 30, scope: !457)
!460 = !DILocation(line: 343, column: 23, scope: !461)
!461 = distinct !DILexicalBlock(scope: !457, file: !32, line: 343, column: 17)
!462 = !DILocation(line: 343, column: 21, scope: !461)
!463 = !DILocation(line: 343, column: 28, scope: !464)
!464 = distinct !DILexicalBlock(scope: !461, file: !32, line: 343, column: 17)
!465 = !DILocation(line: 343, column: 30, scope: !464)
!466 = !DILocation(line: 343, column: 17, scope: !461)
!467 = !DILocation(line: 345, column: 41, scope: !468)
!468 = distinct !DILexicalBlock(scope: !464, file: !32, line: 344, column: 17)
!469 = !DILocation(line: 345, column: 34, scope: !468)
!470 = !DILocation(line: 345, column: 21, scope: !468)
!471 = !DILocation(line: 346, column: 17, scope: !468)
!472 = !DILocation(line: 343, column: 37, scope: !464)
!473 = !DILocation(line: 343, column: 17, scope: !464)
!474 = distinct !{!474, !466, !475, !184}
!475 = !DILocation(line: 346, column: 17, scope: !461)
!476 = !DILocation(line: 347, column: 13, scope: !457)
!477 = !DILocation(line: 350, column: 17, scope: !478)
!478 = distinct !DILexicalBlock(scope: !450, file: !32, line: 349, column: 13)
!479 = !DILocation(line: 354, column: 1, scope: !347)
!480 = distinct !DISubprogram(name: "goodG2B1", scope: !32, file: !32, line: 357, type: !33, scopeLine: 358, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!481 = !DILocalVariable(name: "data", scope: !480, file: !32, line: 359, type: !37)
!482 = !DILocation(line: 359, column: 9, scope: !480)
!483 = !DILocation(line: 361, column: 10, scope: !480)
!484 = !DILocation(line: 371, column: 14, scope: !485)
!485 = distinct !DILexicalBlock(scope: !486, file: !32, line: 368, column: 5)
!486 = distinct !DILexicalBlock(scope: !480, file: !32, line: 362, column: 8)
!487 = !DILocalVariable(name: "i", scope: !488, file: !32, line: 376, type: !37)
!488 = distinct !DILexicalBlock(scope: !489, file: !32, line: 375, column: 9)
!489 = distinct !DILexicalBlock(scope: !490, file: !32, line: 374, column: 5)
!490 = distinct !DILexicalBlock(scope: !480, file: !32, line: 373, column: 8)
!491 = !DILocation(line: 376, column: 17, scope: !488)
!492 = !DILocalVariable(name: "buffer", scope: !488, file: !32, line: 377, type: !156)
!493 = !DILocation(line: 377, column: 17, scope: !488)
!494 = !DILocation(line: 380, column: 17, scope: !495)
!495 = distinct !DILexicalBlock(scope: !488, file: !32, line: 380, column: 17)
!496 = !DILocation(line: 380, column: 22, scope: !495)
!497 = !DILocation(line: 380, column: 17, scope: !488)
!498 = !DILocation(line: 382, column: 24, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !32, line: 381, column: 13)
!500 = !DILocation(line: 382, column: 17, scope: !499)
!501 = !DILocation(line: 382, column: 30, scope: !499)
!502 = !DILocation(line: 384, column: 23, scope: !503)
!503 = distinct !DILexicalBlock(scope: !499, file: !32, line: 384, column: 17)
!504 = !DILocation(line: 384, column: 21, scope: !503)
!505 = !DILocation(line: 384, column: 28, scope: !506)
!506 = distinct !DILexicalBlock(scope: !503, file: !32, line: 384, column: 17)
!507 = !DILocation(line: 384, column: 30, scope: !506)
!508 = !DILocation(line: 384, column: 17, scope: !503)
!509 = !DILocation(line: 386, column: 41, scope: !510)
!510 = distinct !DILexicalBlock(scope: !506, file: !32, line: 385, column: 17)
!511 = !DILocation(line: 386, column: 34, scope: !510)
!512 = !DILocation(line: 386, column: 21, scope: !510)
!513 = !DILocation(line: 387, column: 17, scope: !510)
!514 = !DILocation(line: 384, column: 37, scope: !506)
!515 = !DILocation(line: 384, column: 17, scope: !506)
!516 = distinct !{!516, !508, !517, !184}
!517 = !DILocation(line: 387, column: 17, scope: !503)
!518 = !DILocation(line: 388, column: 13, scope: !499)
!519 = !DILocation(line: 391, column: 17, scope: !520)
!520 = distinct !DILexicalBlock(scope: !495, file: !32, line: 390, column: 13)
!521 = !DILocation(line: 395, column: 1, scope: !480)
!522 = distinct !DISubprogram(name: "goodG2B2", scope: !32, file: !32, line: 398, type: !33, scopeLine: 399, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!523 = !DILocalVariable(name: "data", scope: !522, file: !32, line: 400, type: !37)
!524 = !DILocation(line: 400, column: 9, scope: !522)
!525 = !DILocation(line: 402, column: 10, scope: !522)
!526 = !DILocation(line: 407, column: 14, scope: !527)
!527 = distinct !DILexicalBlock(scope: !528, file: !32, line: 404, column: 5)
!528 = distinct !DILexicalBlock(scope: !522, file: !32, line: 403, column: 8)
!529 = !DILocalVariable(name: "i", scope: !530, file: !32, line: 412, type: !37)
!530 = distinct !DILexicalBlock(scope: !531, file: !32, line: 411, column: 9)
!531 = distinct !DILexicalBlock(scope: !532, file: !32, line: 410, column: 5)
!532 = distinct !DILexicalBlock(scope: !522, file: !32, line: 409, column: 8)
!533 = !DILocation(line: 412, column: 17, scope: !530)
!534 = !DILocalVariable(name: "buffer", scope: !530, file: !32, line: 413, type: !156)
!535 = !DILocation(line: 413, column: 17, scope: !530)
!536 = !DILocation(line: 416, column: 17, scope: !537)
!537 = distinct !DILexicalBlock(scope: !530, file: !32, line: 416, column: 17)
!538 = !DILocation(line: 416, column: 22, scope: !537)
!539 = !DILocation(line: 416, column: 17, scope: !530)
!540 = !DILocation(line: 418, column: 24, scope: !541)
!541 = distinct !DILexicalBlock(scope: !537, file: !32, line: 417, column: 13)
!542 = !DILocation(line: 418, column: 17, scope: !541)
!543 = !DILocation(line: 418, column: 30, scope: !541)
!544 = !DILocation(line: 420, column: 23, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !32, line: 420, column: 17)
!546 = !DILocation(line: 420, column: 21, scope: !545)
!547 = !DILocation(line: 420, column: 28, scope: !548)
!548 = distinct !DILexicalBlock(scope: !545, file: !32, line: 420, column: 17)
!549 = !DILocation(line: 420, column: 30, scope: !548)
!550 = !DILocation(line: 420, column: 17, scope: !545)
!551 = !DILocation(line: 422, column: 41, scope: !552)
!552 = distinct !DILexicalBlock(scope: !548, file: !32, line: 421, column: 17)
!553 = !DILocation(line: 422, column: 34, scope: !552)
!554 = !DILocation(line: 422, column: 21, scope: !552)
!555 = !DILocation(line: 423, column: 17, scope: !552)
!556 = !DILocation(line: 420, column: 37, scope: !548)
!557 = !DILocation(line: 420, column: 17, scope: !548)
!558 = distinct !{!558, !550, !559, !184}
!559 = !DILocation(line: 423, column: 17, scope: !545)
!560 = !DILocation(line: 424, column: 13, scope: !541)
!561 = !DILocation(line: 427, column: 17, scope: !562)
!562 = distinct !DILexicalBlock(scope: !537, file: !32, line: 426, column: 13)
!563 = !DILocation(line: 431, column: 1, scope: !522)
