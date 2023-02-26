; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !25
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_bad() #0 !dbg !36 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 -1, i32* %data, align 4, !dbg !42
  %0 = load i32, i32* @staticTrue, align 4, !dbg !43
  %tobool = icmp ne i32 %0, 0, !dbg !43
  br i1 %tobool, label %if.then, label %if.end21, !dbg !45

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !46, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !50, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %connectSocket, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  br label %do.body, !dbg !75

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !76
  store i32 %call, i32* %connectSocket, align 4, !dbg !78
  %1 = load i32, i32* %connectSocket, align 4, !dbg !79
  %cmp = icmp eq i32 %1, -1, !dbg !81
  br i1 %cmp, label %if.then1, label %if.end, !dbg !82

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !83

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !85
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !86
  store i8 2, i8* %sin_family, align 1, !dbg !87
  %call2 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !88
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !89
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !90
  store i32 %call2, i32* %s_addr, align 4, !dbg !91
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !92
  store i16 -30871, i16* %sin_port, align 2, !dbg !93
  %3 = load i32, i32* %connectSocket, align 4, !dbg !94
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !96
  %call3 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !97
  %cmp4 = icmp eq i32 %call3, -1, !dbg !98
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !99

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !100

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !102
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !103
  %call7 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !104
  %conv = trunc i64 %call7 to i32, !dbg !104
  store i32 %conv, i32* %recvResult, align 4, !dbg !105
  %6 = load i32, i32* %recvResult, align 4, !dbg !106
  %cmp8 = icmp eq i32 %6, -1, !dbg !108
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !109

lor.lhs.false:                                    ; preds = %if.end6
  %7 = load i32, i32* %recvResult, align 4, !dbg !110
  %cmp10 = icmp eq i32 %7, 0, !dbg !111
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !112

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !113

if.end13:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !115
  %idxprom = sext i32 %8 to i64, !dbg !116
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !118
  %call15 = call i32 @atoi(i8* noundef %arraydecay14), !dbg !119
  store i32 %call15, i32* %data, align 4, !dbg !120
  br label %do.end, !dbg !121

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !122
  %cmp16 = icmp ne i32 %9, -1, !dbg !124
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !125

if.then18:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !126
  %call19 = call i32 @"\01_close"(i32 noundef %10), !dbg !128
  br label %if.end20, !dbg !129

if.end20:                                         ; preds = %if.then18, %do.end
  br label %if.end21, !dbg !130

if.end21:                                         ; preds = %if.end20, %entry
  %11 = load i32, i32* @staticTrue, align 4, !dbg !131
  %tobool22 = icmp ne i32 %11, 0, !dbg !131
  br i1 %tobool22, label %if.then23, label %if.end34, !dbg !133

if.then23:                                        ; preds = %if.end21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !134, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !138, metadata !DIExpression()), !dbg !142
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !142
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !142
  %13 = load i32, i32* %data, align 4, !dbg !143
  %cmp24 = icmp sge i32 %13, 0, !dbg !145
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !146

if.then26:                                        ; preds = %if.then23
  %14 = load i32, i32* %data, align 4, !dbg !147
  %idxprom27 = sext i32 %14 to i64, !dbg !149
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !149
  store i32 1, i32* %arrayidx28, align 4, !dbg !150
  store i32 0, i32* %i, align 4, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %if.then26
  %15 = load i32, i32* %i, align 4, !dbg !154
  %cmp29 = icmp slt i32 %15, 10, !dbg !156
  br i1 %cmp29, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !158
  %idxprom31 = sext i32 %16 to i64, !dbg !160
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !160
  %17 = load i32, i32* %arrayidx32, align 4, !dbg !160
  call void @printIntLine(i32 noundef %17), !dbg !161
  br label %for.inc, !dbg !162

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !163
  %inc = add nsw i32 %18, 1, !dbg !163
  store i32 %inc, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !164, !llvm.loop !165

for.end:                                          ; preds = %for.cond
  br label %if.end33, !dbg !168

if.else:                                          ; preds = %if.then23
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !169
  br label %if.end33

if.end33:                                         ; preds = %if.else, %for.end
  br label %if.end34, !dbg !171

if.end34:                                         ; preds = %if.end33, %if.end21
  ret void, !dbg !172
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_good() #0 !dbg !173 {
entry:
  call void @goodB2G1(), !dbg !174
  call void @goodB2G2(), !dbg !175
  call void @goodG2B1(), !dbg !176
  call void @goodG2B2(), !dbg !177
  ret void, !dbg !178
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !179 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !184, metadata !DIExpression()), !dbg !185
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !186, metadata !DIExpression()), !dbg !187
  %call = call i64 @time(i64* noundef null), !dbg !188
  %conv = trunc i64 %call to i32, !dbg !189
  call void @srand(i32 noundef %conv), !dbg !190
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !191
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_good(), !dbg !192
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !193
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !194
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_bad(), !dbg !195
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !196
  ret i32 0, !dbg !197
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !198 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !199, metadata !DIExpression()), !dbg !200
  store i32 -1, i32* %data, align 4, !dbg !201
  %0 = load i32, i32* @staticTrue, align 4, !dbg !202
  %tobool = icmp ne i32 %0, 0, !dbg !202
  br i1 %tobool, label %if.then, label %if.end21, !dbg !204

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !205, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !209, metadata !DIExpression()), !dbg !210
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !211, metadata !DIExpression()), !dbg !212
  store i32 -1, i32* %connectSocket, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !213, metadata !DIExpression()), !dbg !214
  br label %do.body, !dbg !215

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !216
  store i32 %call, i32* %connectSocket, align 4, !dbg !218
  %1 = load i32, i32* %connectSocket, align 4, !dbg !219
  %cmp = icmp eq i32 %1, -1, !dbg !221
  br i1 %cmp, label %if.then1, label %if.end, !dbg !222

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !223

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !225
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !225
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !226
  store i8 2, i8* %sin_family, align 1, !dbg !227
  %call2 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !228
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !229
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !230
  store i32 %call2, i32* %s_addr, align 4, !dbg !231
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !232
  store i16 -30871, i16* %sin_port, align 2, !dbg !233
  %3 = load i32, i32* %connectSocket, align 4, !dbg !234
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !236
  %call3 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !237
  %cmp4 = icmp eq i32 %call3, -1, !dbg !238
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !239

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !240

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !242
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !243
  %call7 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !244
  %conv = trunc i64 %call7 to i32, !dbg !244
  store i32 %conv, i32* %recvResult, align 4, !dbg !245
  %6 = load i32, i32* %recvResult, align 4, !dbg !246
  %cmp8 = icmp eq i32 %6, -1, !dbg !248
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !249

lor.lhs.false:                                    ; preds = %if.end6
  %7 = load i32, i32* %recvResult, align 4, !dbg !250
  %cmp10 = icmp eq i32 %7, 0, !dbg !251
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !252

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !253

if.end13:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !255
  %idxprom = sext i32 %8 to i64, !dbg !256
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !256
  store i8 0, i8* %arrayidx, align 1, !dbg !257
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !258
  %call15 = call i32 @atoi(i8* noundef %arraydecay14), !dbg !259
  store i32 %call15, i32* %data, align 4, !dbg !260
  br label %do.end, !dbg !261

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !262
  %cmp16 = icmp ne i32 %9, -1, !dbg !264
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !265

if.then18:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !266
  %call19 = call i32 @"\01_close"(i32 noundef %10), !dbg !268
  br label %if.end20, !dbg !269

if.end20:                                         ; preds = %if.then18, %do.end
  br label %if.end21, !dbg !270

if.end21:                                         ; preds = %if.end20, %entry
  %11 = load i32, i32* @staticFalse, align 4, !dbg !271
  %tobool22 = icmp ne i32 %11, 0, !dbg !271
  br i1 %tobool22, label %if.then23, label %if.else, !dbg !273

if.then23:                                        ; preds = %if.end21
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !274
  br label %if.end37, !dbg !276

if.else:                                          ; preds = %if.end21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !277, metadata !DIExpression()), !dbg !280
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !281, metadata !DIExpression()), !dbg !282
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !282
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !282
  %13 = load i32, i32* %data, align 4, !dbg !283
  %cmp24 = icmp sge i32 %13, 0, !dbg !285
  br i1 %cmp24, label %land.lhs.true, label %if.else35, !dbg !286

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !287
  %cmp26 = icmp slt i32 %14, 10, !dbg !288
  br i1 %cmp26, label %if.then28, label %if.else35, !dbg !289

if.then28:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !290
  %idxprom29 = sext i32 %15 to i64, !dbg !292
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !292
  store i32 1, i32* %arrayidx30, align 4, !dbg !293
  store i32 0, i32* %i, align 4, !dbg !294
  br label %for.cond, !dbg !296

for.cond:                                         ; preds = %for.inc, %if.then28
  %16 = load i32, i32* %i, align 4, !dbg !297
  %cmp31 = icmp slt i32 %16, 10, !dbg !299
  br i1 %cmp31, label %for.body, label %for.end, !dbg !300

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !301
  %idxprom33 = sext i32 %17 to i64, !dbg !303
  %arrayidx34 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom33, !dbg !303
  %18 = load i32, i32* %arrayidx34, align 4, !dbg !303
  call void @printIntLine(i32 noundef %18), !dbg !304
  br label %for.inc, !dbg !305

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !306
  %inc = add nsw i32 %19, 1, !dbg !306
  store i32 %inc, i32* %i, align 4, !dbg !306
  br label %for.cond, !dbg !307, !llvm.loop !308

for.end:                                          ; preds = %for.cond
  br label %if.end36, !dbg !310

if.else35:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !311
  br label %if.end36

if.end36:                                         ; preds = %if.else35, %for.end
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then23
  ret void, !dbg !313
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !314 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !315, metadata !DIExpression()), !dbg !316
  store i32 -1, i32* %data, align 4, !dbg !317
  %0 = load i32, i32* @staticTrue, align 4, !dbg !318
  %tobool = icmp ne i32 %0, 0, !dbg !318
  br i1 %tobool, label %if.then, label %if.end21, !dbg !320

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !321, metadata !DIExpression()), !dbg !324
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !325, metadata !DIExpression()), !dbg !326
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !327, metadata !DIExpression()), !dbg !328
  store i32 -1, i32* %connectSocket, align 4, !dbg !328
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !329, metadata !DIExpression()), !dbg !330
  br label %do.body, !dbg !331

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !332
  store i32 %call, i32* %connectSocket, align 4, !dbg !334
  %1 = load i32, i32* %connectSocket, align 4, !dbg !335
  %cmp = icmp eq i32 %1, -1, !dbg !337
  br i1 %cmp, label %if.then1, label %if.end, !dbg !338

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !339

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !341
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !341
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !342
  store i8 2, i8* %sin_family, align 1, !dbg !343
  %call2 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !344
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !345
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !346
  store i32 %call2, i32* %s_addr, align 4, !dbg !347
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !348
  store i16 -30871, i16* %sin_port, align 2, !dbg !349
  %3 = load i32, i32* %connectSocket, align 4, !dbg !350
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !352
  %call3 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !353
  %cmp4 = icmp eq i32 %call3, -1, !dbg !354
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !355

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !356

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !358
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !359
  %call7 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !360
  %conv = trunc i64 %call7 to i32, !dbg !360
  store i32 %conv, i32* %recvResult, align 4, !dbg !361
  %6 = load i32, i32* %recvResult, align 4, !dbg !362
  %cmp8 = icmp eq i32 %6, -1, !dbg !364
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !365

lor.lhs.false:                                    ; preds = %if.end6
  %7 = load i32, i32* %recvResult, align 4, !dbg !366
  %cmp10 = icmp eq i32 %7, 0, !dbg !367
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !368

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !369

if.end13:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !371
  %idxprom = sext i32 %8 to i64, !dbg !372
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !372
  store i8 0, i8* %arrayidx, align 1, !dbg !373
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !374
  %call15 = call i32 @atoi(i8* noundef %arraydecay14), !dbg !375
  store i32 %call15, i32* %data, align 4, !dbg !376
  br label %do.end, !dbg !377

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !378
  %cmp16 = icmp ne i32 %9, -1, !dbg !380
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !381

if.then18:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !382
  %call19 = call i32 @"\01_close"(i32 noundef %10), !dbg !384
  br label %if.end20, !dbg !385

if.end20:                                         ; preds = %if.then18, %do.end
  br label %if.end21, !dbg !386

if.end21:                                         ; preds = %if.end20, %entry
  %11 = load i32, i32* @staticTrue, align 4, !dbg !387
  %tobool22 = icmp ne i32 %11, 0, !dbg !387
  br i1 %tobool22, label %if.then23, label %if.end36, !dbg !389

if.then23:                                        ; preds = %if.end21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !390, metadata !DIExpression()), !dbg !393
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !394, metadata !DIExpression()), !dbg !395
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !395
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !395
  %13 = load i32, i32* %data, align 4, !dbg !396
  %cmp24 = icmp sge i32 %13, 0, !dbg !398
  br i1 %cmp24, label %land.lhs.true, label %if.else, !dbg !399

land.lhs.true:                                    ; preds = %if.then23
  %14 = load i32, i32* %data, align 4, !dbg !400
  %cmp26 = icmp slt i32 %14, 10, !dbg !401
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !402

if.then28:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !403
  %idxprom29 = sext i32 %15 to i64, !dbg !405
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !405
  store i32 1, i32* %arrayidx30, align 4, !dbg !406
  store i32 0, i32* %i, align 4, !dbg !407
  br label %for.cond, !dbg !409

for.cond:                                         ; preds = %for.inc, %if.then28
  %16 = load i32, i32* %i, align 4, !dbg !410
  %cmp31 = icmp slt i32 %16, 10, !dbg !412
  br i1 %cmp31, label %for.body, label %for.end, !dbg !413

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !414
  %idxprom33 = sext i32 %17 to i64, !dbg !416
  %arrayidx34 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom33, !dbg !416
  %18 = load i32, i32* %arrayidx34, align 4, !dbg !416
  call void @printIntLine(i32 noundef %18), !dbg !417
  br label %for.inc, !dbg !418

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !419
  %inc = add nsw i32 %19, 1, !dbg !419
  store i32 %inc, i32* %i, align 4, !dbg !419
  br label %for.cond, !dbg !420, !llvm.loop !421

for.end:                                          ; preds = %for.cond
  br label %if.end35, !dbg !423

if.else:                                          ; preds = %land.lhs.true, %if.then23
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !424
  br label %if.end35

if.end35:                                         ; preds = %if.else, %for.end
  br label %if.end36, !dbg !426

if.end36:                                         ; preds = %if.end35, %if.end21
  ret void, !dbg !427
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !428 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !429, metadata !DIExpression()), !dbg !430
  store i32 -1, i32* %data, align 4, !dbg !431
  %0 = load i32, i32* @staticFalse, align 4, !dbg !432
  %tobool = icmp ne i32 %0, 0, !dbg !432
  br i1 %tobool, label %if.then, label %if.else, !dbg !434

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !435
  br label %if.end, !dbg !437

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !438
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticTrue, align 4, !dbg !440
  %tobool1 = icmp ne i32 %1, 0, !dbg !440
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !442

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !443, metadata !DIExpression()), !dbg !446
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !447, metadata !DIExpression()), !dbg !448
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !448
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !448
  %3 = load i32, i32* %data, align 4, !dbg !449
  %cmp = icmp sge i32 %3, 0, !dbg !451
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !452

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !453
  %idxprom = sext i32 %4 to i64, !dbg !455
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !455
  store i32 1, i32* %arrayidx, align 4, !dbg !456
  store i32 0, i32* %i, align 4, !dbg !457
  br label %for.cond, !dbg !459

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !460
  %cmp4 = icmp slt i32 %5, 10, !dbg !462
  br i1 %cmp4, label %for.body, label %for.end, !dbg !463

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !464
  %idxprom5 = sext i32 %6 to i64, !dbg !466
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !466
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !466
  call void @printIntLine(i32 noundef %7), !dbg !467
  br label %for.inc, !dbg !468

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !469
  %inc = add nsw i32 %8, 1, !dbg !469
  store i32 %inc, i32* %i, align 4, !dbg !469
  br label %for.cond, !dbg !470, !llvm.loop !471

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !473

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !474
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !476

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !477
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !478 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !479, metadata !DIExpression()), !dbg !480
  store i32 -1, i32* %data, align 4, !dbg !481
  %0 = load i32, i32* @staticTrue, align 4, !dbg !482
  %tobool = icmp ne i32 %0, 0, !dbg !482
  br i1 %tobool, label %if.then, label %if.end, !dbg !484

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !485
  br label %if.end, !dbg !487

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticTrue, align 4, !dbg !488
  %tobool1 = icmp ne i32 %1, 0, !dbg !488
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !490

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !491, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !495, metadata !DIExpression()), !dbg !496
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !496
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !496
  %3 = load i32, i32* %data, align 4, !dbg !497
  %cmp = icmp sge i32 %3, 0, !dbg !499
  br i1 %cmp, label %if.then3, label %if.else, !dbg !500

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !501
  %idxprom = sext i32 %4 to i64, !dbg !503
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !503
  store i32 1, i32* %arrayidx, align 4, !dbg !504
  store i32 0, i32* %i, align 4, !dbg !505
  br label %for.cond, !dbg !507

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !508
  %cmp4 = icmp slt i32 %5, 10, !dbg !510
  br i1 %cmp4, label %for.body, label %for.end, !dbg !511

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !512
  %idxprom5 = sext i32 %6 to i64, !dbg !514
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !514
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !514
  call void @printIntLine(i32 noundef %7), !dbg !515
  br label %for.inc, !dbg !516

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !517
  %inc = add nsw i32 %8, 1, !dbg !517
  store i32 %inc, i32* %i, align 4, !dbg !517
  br label %for.cond, !dbg !518, !llvm.loop !519

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !521

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !522
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !524

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !525
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!29, !30, !31, !32, !33, !34}
!llvm.ident = !{!35}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !27, line: 45, type: !28, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !24, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !8, !23}
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
!24 = !{!0, !25}
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !27, line: 46, type: !28, isLocal: true, isDefinition: true)
!27 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !{i32 7, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 7, !"PIC Level", i32 2}
!33 = !{i32 7, !"uwtable", i32 1}
!34 = !{i32 7, !"frame-pointer", i32 2}
!35 = !{!"Homebrew clang version 14.0.6"}
!36 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_bad", scope: !27, file: !27, line: 50, type: !37, scopeLine: 51, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !39)
!37 = !DISubroutineType(types: !38)
!38 = !{null}
!39 = !{}
!40 = !DILocalVariable(name: "data", scope: !36, file: !27, line: 52, type: !28)
!41 = !DILocation(line: 52, column: 9, scope: !36)
!42 = !DILocation(line: 54, column: 10, scope: !36)
!43 = !DILocation(line: 55, column: 8, scope: !44)
!44 = distinct !DILexicalBlock(scope: !36, file: !27, line: 55, column: 8)
!45 = !DILocation(line: 55, column: 8, scope: !36)
!46 = !DILocalVariable(name: "recvResult", scope: !47, file: !27, line: 62, type: !28)
!47 = distinct !DILexicalBlock(scope: !48, file: !27, line: 57, column: 9)
!48 = distinct !DILexicalBlock(scope: !44, file: !27, line: 56, column: 5)
!49 = !DILocation(line: 62, column: 17, scope: !47)
!50 = !DILocalVariable(name: "service", scope: !47, file: !27, line: 63, type: !51)
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
!70 = !DILocation(line: 63, column: 32, scope: !47)
!71 = !DILocalVariable(name: "connectSocket", scope: !47, file: !27, line: 64, type: !28)
!72 = !DILocation(line: 64, column: 20, scope: !47)
!73 = !DILocalVariable(name: "inputBuffer", scope: !47, file: !27, line: 65, type: !19)
!74 = !DILocation(line: 65, column: 18, scope: !47)
!75 = !DILocation(line: 66, column: 13, scope: !47)
!76 = !DILocation(line: 76, column: 33, scope: !77)
!77 = distinct !DILexicalBlock(scope: !47, file: !27, line: 67, column: 13)
!78 = !DILocation(line: 76, column: 31, scope: !77)
!79 = !DILocation(line: 77, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !27, line: 77, column: 21)
!81 = !DILocation(line: 77, column: 35, scope: !80)
!82 = !DILocation(line: 77, column: 21, scope: !77)
!83 = !DILocation(line: 79, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !27, line: 78, column: 17)
!85 = !DILocation(line: 81, column: 17, scope: !77)
!86 = !DILocation(line: 82, column: 25, scope: !77)
!87 = !DILocation(line: 82, column: 36, scope: !77)
!88 = !DILocation(line: 83, column: 43, scope: !77)
!89 = !DILocation(line: 83, column: 25, scope: !77)
!90 = !DILocation(line: 83, column: 34, scope: !77)
!91 = !DILocation(line: 83, column: 41, scope: !77)
!92 = !DILocation(line: 84, column: 25, scope: !77)
!93 = !DILocation(line: 84, column: 34, scope: !77)
!94 = !DILocation(line: 85, column: 29, scope: !95)
!95 = distinct !DILexicalBlock(scope: !77, file: !27, line: 85, column: 21)
!96 = !DILocation(line: 85, column: 44, scope: !95)
!97 = !DILocation(line: 85, column: 21, scope: !95)
!98 = !DILocation(line: 85, column: 89, scope: !95)
!99 = !DILocation(line: 85, column: 21, scope: !77)
!100 = !DILocation(line: 87, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !27, line: 86, column: 17)
!102 = !DILocation(line: 91, column: 35, scope: !77)
!103 = !DILocation(line: 91, column: 50, scope: !77)
!104 = !DILocation(line: 91, column: 30, scope: !77)
!105 = !DILocation(line: 91, column: 28, scope: !77)
!106 = !DILocation(line: 92, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !77, file: !27, line: 92, column: 21)
!108 = !DILocation(line: 92, column: 32, scope: !107)
!109 = !DILocation(line: 92, column: 48, scope: !107)
!110 = !DILocation(line: 92, column: 51, scope: !107)
!111 = !DILocation(line: 92, column: 62, scope: !107)
!112 = !DILocation(line: 92, column: 21, scope: !77)
!113 = !DILocation(line: 94, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !27, line: 93, column: 17)
!115 = !DILocation(line: 97, column: 29, scope: !77)
!116 = !DILocation(line: 97, column: 17, scope: !77)
!117 = !DILocation(line: 97, column: 41, scope: !77)
!118 = !DILocation(line: 99, column: 29, scope: !77)
!119 = !DILocation(line: 99, column: 24, scope: !77)
!120 = !DILocation(line: 99, column: 22, scope: !77)
!121 = !DILocation(line: 100, column: 13, scope: !77)
!122 = !DILocation(line: 102, column: 17, scope: !123)
!123 = distinct !DILexicalBlock(scope: !47, file: !27, line: 102, column: 17)
!124 = !DILocation(line: 102, column: 31, scope: !123)
!125 = !DILocation(line: 102, column: 17, scope: !47)
!126 = !DILocation(line: 104, column: 30, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !27, line: 103, column: 13)
!128 = !DILocation(line: 104, column: 17, scope: !127)
!129 = !DILocation(line: 105, column: 13, scope: !127)
!130 = !DILocation(line: 113, column: 5, scope: !48)
!131 = !DILocation(line: 114, column: 8, scope: !132)
!132 = distinct !DILexicalBlock(scope: !36, file: !27, line: 114, column: 8)
!133 = !DILocation(line: 114, column: 8, scope: !36)
!134 = !DILocalVariable(name: "i", scope: !135, file: !27, line: 117, type: !28)
!135 = distinct !DILexicalBlock(scope: !136, file: !27, line: 116, column: 9)
!136 = distinct !DILexicalBlock(scope: !132, file: !27, line: 115, column: 5)
!137 = !DILocation(line: 117, column: 17, scope: !135)
!138 = !DILocalVariable(name: "buffer", scope: !135, file: !27, line: 118, type: !139)
!139 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 320, elements: !140)
!140 = !{!141}
!141 = !DISubrange(count: 10)
!142 = !DILocation(line: 118, column: 17, scope: !135)
!143 = !DILocation(line: 121, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !135, file: !27, line: 121, column: 17)
!145 = !DILocation(line: 121, column: 22, scope: !144)
!146 = !DILocation(line: 121, column: 17, scope: !135)
!147 = !DILocation(line: 123, column: 24, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !27, line: 122, column: 13)
!149 = !DILocation(line: 123, column: 17, scope: !148)
!150 = !DILocation(line: 123, column: 30, scope: !148)
!151 = !DILocation(line: 125, column: 23, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !27, line: 125, column: 17)
!153 = !DILocation(line: 125, column: 21, scope: !152)
!154 = !DILocation(line: 125, column: 28, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !27, line: 125, column: 17)
!156 = !DILocation(line: 125, column: 30, scope: !155)
!157 = !DILocation(line: 125, column: 17, scope: !152)
!158 = !DILocation(line: 127, column: 41, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !27, line: 126, column: 17)
!160 = !DILocation(line: 127, column: 34, scope: !159)
!161 = !DILocation(line: 127, column: 21, scope: !159)
!162 = !DILocation(line: 128, column: 17, scope: !159)
!163 = !DILocation(line: 125, column: 37, scope: !155)
!164 = !DILocation(line: 125, column: 17, scope: !155)
!165 = distinct !{!165, !157, !166, !167}
!166 = !DILocation(line: 128, column: 17, scope: !152)
!167 = !{!"llvm.loop.mustprogress"}
!168 = !DILocation(line: 129, column: 13, scope: !148)
!169 = !DILocation(line: 132, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !144, file: !27, line: 131, column: 13)
!171 = !DILocation(line: 135, column: 5, scope: !136)
!172 = !DILocation(line: 136, column: 1, scope: !36)
!173 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_05_good", scope: !27, file: !27, line: 400, type: !37, scopeLine: 401, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !39)
!174 = !DILocation(line: 402, column: 5, scope: !173)
!175 = !DILocation(line: 403, column: 5, scope: !173)
!176 = !DILocation(line: 404, column: 5, scope: !173)
!177 = !DILocation(line: 405, column: 5, scope: !173)
!178 = !DILocation(line: 406, column: 1, scope: !173)
!179 = distinct !DISubprogram(name: "main", scope: !27, file: !27, line: 417, type: !180, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !39)
!180 = !DISubroutineType(types: !181)
!181 = !{!28, !28, !182}
!182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!184 = !DILocalVariable(name: "argc", arg: 1, scope: !179, file: !27, line: 417, type: !28)
!185 = !DILocation(line: 417, column: 14, scope: !179)
!186 = !DILocalVariable(name: "argv", arg: 2, scope: !179, file: !27, line: 417, type: !182)
!187 = !DILocation(line: 417, column: 27, scope: !179)
!188 = !DILocation(line: 420, column: 22, scope: !179)
!189 = !DILocation(line: 420, column: 12, scope: !179)
!190 = !DILocation(line: 420, column: 5, scope: !179)
!191 = !DILocation(line: 422, column: 5, scope: !179)
!192 = !DILocation(line: 423, column: 5, scope: !179)
!193 = !DILocation(line: 424, column: 5, scope: !179)
!194 = !DILocation(line: 427, column: 5, scope: !179)
!195 = !DILocation(line: 428, column: 5, scope: !179)
!196 = !DILocation(line: 429, column: 5, scope: !179)
!197 = !DILocation(line: 431, column: 5, scope: !179)
!198 = distinct !DISubprogram(name: "goodB2G1", scope: !27, file: !27, line: 143, type: !37, scopeLine: 144, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !39)
!199 = !DILocalVariable(name: "data", scope: !198, file: !27, line: 145, type: !28)
!200 = !DILocation(line: 145, column: 9, scope: !198)
!201 = !DILocation(line: 147, column: 10, scope: !198)
!202 = !DILocation(line: 148, column: 8, scope: !203)
!203 = distinct !DILexicalBlock(scope: !198, file: !27, line: 148, column: 8)
!204 = !DILocation(line: 148, column: 8, scope: !198)
!205 = !DILocalVariable(name: "recvResult", scope: !206, file: !27, line: 155, type: !28)
!206 = distinct !DILexicalBlock(scope: !207, file: !27, line: 150, column: 9)
!207 = distinct !DILexicalBlock(scope: !203, file: !27, line: 149, column: 5)
!208 = !DILocation(line: 155, column: 17, scope: !206)
!209 = !DILocalVariable(name: "service", scope: !206, file: !27, line: 156, type: !51)
!210 = !DILocation(line: 156, column: 32, scope: !206)
!211 = !DILocalVariable(name: "connectSocket", scope: !206, file: !27, line: 157, type: !28)
!212 = !DILocation(line: 157, column: 20, scope: !206)
!213 = !DILocalVariable(name: "inputBuffer", scope: !206, file: !27, line: 158, type: !19)
!214 = !DILocation(line: 158, column: 18, scope: !206)
!215 = !DILocation(line: 159, column: 13, scope: !206)
!216 = !DILocation(line: 169, column: 33, scope: !217)
!217 = distinct !DILexicalBlock(scope: !206, file: !27, line: 160, column: 13)
!218 = !DILocation(line: 169, column: 31, scope: !217)
!219 = !DILocation(line: 170, column: 21, scope: !220)
!220 = distinct !DILexicalBlock(scope: !217, file: !27, line: 170, column: 21)
!221 = !DILocation(line: 170, column: 35, scope: !220)
!222 = !DILocation(line: 170, column: 21, scope: !217)
!223 = !DILocation(line: 172, column: 21, scope: !224)
!224 = distinct !DILexicalBlock(scope: !220, file: !27, line: 171, column: 17)
!225 = !DILocation(line: 174, column: 17, scope: !217)
!226 = !DILocation(line: 175, column: 25, scope: !217)
!227 = !DILocation(line: 175, column: 36, scope: !217)
!228 = !DILocation(line: 176, column: 43, scope: !217)
!229 = !DILocation(line: 176, column: 25, scope: !217)
!230 = !DILocation(line: 176, column: 34, scope: !217)
!231 = !DILocation(line: 176, column: 41, scope: !217)
!232 = !DILocation(line: 177, column: 25, scope: !217)
!233 = !DILocation(line: 177, column: 34, scope: !217)
!234 = !DILocation(line: 178, column: 29, scope: !235)
!235 = distinct !DILexicalBlock(scope: !217, file: !27, line: 178, column: 21)
!236 = !DILocation(line: 178, column: 44, scope: !235)
!237 = !DILocation(line: 178, column: 21, scope: !235)
!238 = !DILocation(line: 178, column: 89, scope: !235)
!239 = !DILocation(line: 178, column: 21, scope: !217)
!240 = !DILocation(line: 180, column: 21, scope: !241)
!241 = distinct !DILexicalBlock(scope: !235, file: !27, line: 179, column: 17)
!242 = !DILocation(line: 184, column: 35, scope: !217)
!243 = !DILocation(line: 184, column: 50, scope: !217)
!244 = !DILocation(line: 184, column: 30, scope: !217)
!245 = !DILocation(line: 184, column: 28, scope: !217)
!246 = !DILocation(line: 185, column: 21, scope: !247)
!247 = distinct !DILexicalBlock(scope: !217, file: !27, line: 185, column: 21)
!248 = !DILocation(line: 185, column: 32, scope: !247)
!249 = !DILocation(line: 185, column: 48, scope: !247)
!250 = !DILocation(line: 185, column: 51, scope: !247)
!251 = !DILocation(line: 185, column: 62, scope: !247)
!252 = !DILocation(line: 185, column: 21, scope: !217)
!253 = !DILocation(line: 187, column: 21, scope: !254)
!254 = distinct !DILexicalBlock(scope: !247, file: !27, line: 186, column: 17)
!255 = !DILocation(line: 190, column: 29, scope: !217)
!256 = !DILocation(line: 190, column: 17, scope: !217)
!257 = !DILocation(line: 190, column: 41, scope: !217)
!258 = !DILocation(line: 192, column: 29, scope: !217)
!259 = !DILocation(line: 192, column: 24, scope: !217)
!260 = !DILocation(line: 192, column: 22, scope: !217)
!261 = !DILocation(line: 193, column: 13, scope: !217)
!262 = !DILocation(line: 195, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !206, file: !27, line: 195, column: 17)
!264 = !DILocation(line: 195, column: 31, scope: !263)
!265 = !DILocation(line: 195, column: 17, scope: !206)
!266 = !DILocation(line: 197, column: 30, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !27, line: 196, column: 13)
!268 = !DILocation(line: 197, column: 17, scope: !267)
!269 = !DILocation(line: 198, column: 13, scope: !267)
!270 = !DILocation(line: 206, column: 5, scope: !207)
!271 = !DILocation(line: 207, column: 8, scope: !272)
!272 = distinct !DILexicalBlock(scope: !198, file: !27, line: 207, column: 8)
!273 = !DILocation(line: 207, column: 8, scope: !198)
!274 = !DILocation(line: 210, column: 9, scope: !275)
!275 = distinct !DILexicalBlock(scope: !272, file: !27, line: 208, column: 5)
!276 = !DILocation(line: 211, column: 5, scope: !275)
!277 = !DILocalVariable(name: "i", scope: !278, file: !27, line: 215, type: !28)
!278 = distinct !DILexicalBlock(scope: !279, file: !27, line: 214, column: 9)
!279 = distinct !DILexicalBlock(scope: !272, file: !27, line: 213, column: 5)
!280 = !DILocation(line: 215, column: 17, scope: !278)
!281 = !DILocalVariable(name: "buffer", scope: !278, file: !27, line: 216, type: !139)
!282 = !DILocation(line: 216, column: 17, scope: !278)
!283 = !DILocation(line: 218, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !278, file: !27, line: 218, column: 17)
!285 = !DILocation(line: 218, column: 22, scope: !284)
!286 = !DILocation(line: 218, column: 27, scope: !284)
!287 = !DILocation(line: 218, column: 30, scope: !284)
!288 = !DILocation(line: 218, column: 35, scope: !284)
!289 = !DILocation(line: 218, column: 17, scope: !278)
!290 = !DILocation(line: 220, column: 24, scope: !291)
!291 = distinct !DILexicalBlock(scope: !284, file: !27, line: 219, column: 13)
!292 = !DILocation(line: 220, column: 17, scope: !291)
!293 = !DILocation(line: 220, column: 30, scope: !291)
!294 = !DILocation(line: 222, column: 23, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !27, line: 222, column: 17)
!296 = !DILocation(line: 222, column: 21, scope: !295)
!297 = !DILocation(line: 222, column: 28, scope: !298)
!298 = distinct !DILexicalBlock(scope: !295, file: !27, line: 222, column: 17)
!299 = !DILocation(line: 222, column: 30, scope: !298)
!300 = !DILocation(line: 222, column: 17, scope: !295)
!301 = !DILocation(line: 224, column: 41, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !27, line: 223, column: 17)
!303 = !DILocation(line: 224, column: 34, scope: !302)
!304 = !DILocation(line: 224, column: 21, scope: !302)
!305 = !DILocation(line: 225, column: 17, scope: !302)
!306 = !DILocation(line: 222, column: 37, scope: !298)
!307 = !DILocation(line: 222, column: 17, scope: !298)
!308 = distinct !{!308, !300, !309, !167}
!309 = !DILocation(line: 225, column: 17, scope: !295)
!310 = !DILocation(line: 226, column: 13, scope: !291)
!311 = !DILocation(line: 229, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !284, file: !27, line: 228, column: 13)
!313 = !DILocation(line: 233, column: 1, scope: !198)
!314 = distinct !DISubprogram(name: "goodB2G2", scope: !27, file: !27, line: 236, type: !37, scopeLine: 237, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !39)
!315 = !DILocalVariable(name: "data", scope: !314, file: !27, line: 238, type: !28)
!316 = !DILocation(line: 238, column: 9, scope: !314)
!317 = !DILocation(line: 240, column: 10, scope: !314)
!318 = !DILocation(line: 241, column: 8, scope: !319)
!319 = distinct !DILexicalBlock(scope: !314, file: !27, line: 241, column: 8)
!320 = !DILocation(line: 241, column: 8, scope: !314)
!321 = !DILocalVariable(name: "recvResult", scope: !322, file: !27, line: 248, type: !28)
!322 = distinct !DILexicalBlock(scope: !323, file: !27, line: 243, column: 9)
!323 = distinct !DILexicalBlock(scope: !319, file: !27, line: 242, column: 5)
!324 = !DILocation(line: 248, column: 17, scope: !322)
!325 = !DILocalVariable(name: "service", scope: !322, file: !27, line: 249, type: !51)
!326 = !DILocation(line: 249, column: 32, scope: !322)
!327 = !DILocalVariable(name: "connectSocket", scope: !322, file: !27, line: 250, type: !28)
!328 = !DILocation(line: 250, column: 20, scope: !322)
!329 = !DILocalVariable(name: "inputBuffer", scope: !322, file: !27, line: 251, type: !19)
!330 = !DILocation(line: 251, column: 18, scope: !322)
!331 = !DILocation(line: 252, column: 13, scope: !322)
!332 = !DILocation(line: 262, column: 33, scope: !333)
!333 = distinct !DILexicalBlock(scope: !322, file: !27, line: 253, column: 13)
!334 = !DILocation(line: 262, column: 31, scope: !333)
!335 = !DILocation(line: 263, column: 21, scope: !336)
!336 = distinct !DILexicalBlock(scope: !333, file: !27, line: 263, column: 21)
!337 = !DILocation(line: 263, column: 35, scope: !336)
!338 = !DILocation(line: 263, column: 21, scope: !333)
!339 = !DILocation(line: 265, column: 21, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !27, line: 264, column: 17)
!341 = !DILocation(line: 267, column: 17, scope: !333)
!342 = !DILocation(line: 268, column: 25, scope: !333)
!343 = !DILocation(line: 268, column: 36, scope: !333)
!344 = !DILocation(line: 269, column: 43, scope: !333)
!345 = !DILocation(line: 269, column: 25, scope: !333)
!346 = !DILocation(line: 269, column: 34, scope: !333)
!347 = !DILocation(line: 269, column: 41, scope: !333)
!348 = !DILocation(line: 270, column: 25, scope: !333)
!349 = !DILocation(line: 270, column: 34, scope: !333)
!350 = !DILocation(line: 271, column: 29, scope: !351)
!351 = distinct !DILexicalBlock(scope: !333, file: !27, line: 271, column: 21)
!352 = !DILocation(line: 271, column: 44, scope: !351)
!353 = !DILocation(line: 271, column: 21, scope: !351)
!354 = !DILocation(line: 271, column: 89, scope: !351)
!355 = !DILocation(line: 271, column: 21, scope: !333)
!356 = !DILocation(line: 273, column: 21, scope: !357)
!357 = distinct !DILexicalBlock(scope: !351, file: !27, line: 272, column: 17)
!358 = !DILocation(line: 277, column: 35, scope: !333)
!359 = !DILocation(line: 277, column: 50, scope: !333)
!360 = !DILocation(line: 277, column: 30, scope: !333)
!361 = !DILocation(line: 277, column: 28, scope: !333)
!362 = !DILocation(line: 278, column: 21, scope: !363)
!363 = distinct !DILexicalBlock(scope: !333, file: !27, line: 278, column: 21)
!364 = !DILocation(line: 278, column: 32, scope: !363)
!365 = !DILocation(line: 278, column: 48, scope: !363)
!366 = !DILocation(line: 278, column: 51, scope: !363)
!367 = !DILocation(line: 278, column: 62, scope: !363)
!368 = !DILocation(line: 278, column: 21, scope: !333)
!369 = !DILocation(line: 280, column: 21, scope: !370)
!370 = distinct !DILexicalBlock(scope: !363, file: !27, line: 279, column: 17)
!371 = !DILocation(line: 283, column: 29, scope: !333)
!372 = !DILocation(line: 283, column: 17, scope: !333)
!373 = !DILocation(line: 283, column: 41, scope: !333)
!374 = !DILocation(line: 285, column: 29, scope: !333)
!375 = !DILocation(line: 285, column: 24, scope: !333)
!376 = !DILocation(line: 285, column: 22, scope: !333)
!377 = !DILocation(line: 286, column: 13, scope: !333)
!378 = !DILocation(line: 288, column: 17, scope: !379)
!379 = distinct !DILexicalBlock(scope: !322, file: !27, line: 288, column: 17)
!380 = !DILocation(line: 288, column: 31, scope: !379)
!381 = !DILocation(line: 288, column: 17, scope: !322)
!382 = !DILocation(line: 290, column: 30, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !27, line: 289, column: 13)
!384 = !DILocation(line: 290, column: 17, scope: !383)
!385 = !DILocation(line: 291, column: 13, scope: !383)
!386 = !DILocation(line: 299, column: 5, scope: !323)
!387 = !DILocation(line: 300, column: 8, scope: !388)
!388 = distinct !DILexicalBlock(scope: !314, file: !27, line: 300, column: 8)
!389 = !DILocation(line: 300, column: 8, scope: !314)
!390 = !DILocalVariable(name: "i", scope: !391, file: !27, line: 303, type: !28)
!391 = distinct !DILexicalBlock(scope: !392, file: !27, line: 302, column: 9)
!392 = distinct !DILexicalBlock(scope: !388, file: !27, line: 301, column: 5)
!393 = !DILocation(line: 303, column: 17, scope: !391)
!394 = !DILocalVariable(name: "buffer", scope: !391, file: !27, line: 304, type: !139)
!395 = !DILocation(line: 304, column: 17, scope: !391)
!396 = !DILocation(line: 306, column: 17, scope: !397)
!397 = distinct !DILexicalBlock(scope: !391, file: !27, line: 306, column: 17)
!398 = !DILocation(line: 306, column: 22, scope: !397)
!399 = !DILocation(line: 306, column: 27, scope: !397)
!400 = !DILocation(line: 306, column: 30, scope: !397)
!401 = !DILocation(line: 306, column: 35, scope: !397)
!402 = !DILocation(line: 306, column: 17, scope: !391)
!403 = !DILocation(line: 308, column: 24, scope: !404)
!404 = distinct !DILexicalBlock(scope: !397, file: !27, line: 307, column: 13)
!405 = !DILocation(line: 308, column: 17, scope: !404)
!406 = !DILocation(line: 308, column: 30, scope: !404)
!407 = !DILocation(line: 310, column: 23, scope: !408)
!408 = distinct !DILexicalBlock(scope: !404, file: !27, line: 310, column: 17)
!409 = !DILocation(line: 310, column: 21, scope: !408)
!410 = !DILocation(line: 310, column: 28, scope: !411)
!411 = distinct !DILexicalBlock(scope: !408, file: !27, line: 310, column: 17)
!412 = !DILocation(line: 310, column: 30, scope: !411)
!413 = !DILocation(line: 310, column: 17, scope: !408)
!414 = !DILocation(line: 312, column: 41, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !27, line: 311, column: 17)
!416 = !DILocation(line: 312, column: 34, scope: !415)
!417 = !DILocation(line: 312, column: 21, scope: !415)
!418 = !DILocation(line: 313, column: 17, scope: !415)
!419 = !DILocation(line: 310, column: 37, scope: !411)
!420 = !DILocation(line: 310, column: 17, scope: !411)
!421 = distinct !{!421, !413, !422, !167}
!422 = !DILocation(line: 313, column: 17, scope: !408)
!423 = !DILocation(line: 314, column: 13, scope: !404)
!424 = !DILocation(line: 317, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !397, file: !27, line: 316, column: 13)
!426 = !DILocation(line: 320, column: 5, scope: !392)
!427 = !DILocation(line: 321, column: 1, scope: !314)
!428 = distinct !DISubprogram(name: "goodG2B1", scope: !27, file: !27, line: 324, type: !37, scopeLine: 325, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !39)
!429 = !DILocalVariable(name: "data", scope: !428, file: !27, line: 326, type: !28)
!430 = !DILocation(line: 326, column: 9, scope: !428)
!431 = !DILocation(line: 328, column: 10, scope: !428)
!432 = !DILocation(line: 329, column: 8, scope: !433)
!433 = distinct !DILexicalBlock(scope: !428, file: !27, line: 329, column: 8)
!434 = !DILocation(line: 329, column: 8, scope: !428)
!435 = !DILocation(line: 332, column: 9, scope: !436)
!436 = distinct !DILexicalBlock(scope: !433, file: !27, line: 330, column: 5)
!437 = !DILocation(line: 333, column: 5, scope: !436)
!438 = !DILocation(line: 338, column: 14, scope: !439)
!439 = distinct !DILexicalBlock(scope: !433, file: !27, line: 335, column: 5)
!440 = !DILocation(line: 340, column: 8, scope: !441)
!441 = distinct !DILexicalBlock(scope: !428, file: !27, line: 340, column: 8)
!442 = !DILocation(line: 340, column: 8, scope: !428)
!443 = !DILocalVariable(name: "i", scope: !444, file: !27, line: 343, type: !28)
!444 = distinct !DILexicalBlock(scope: !445, file: !27, line: 342, column: 9)
!445 = distinct !DILexicalBlock(scope: !441, file: !27, line: 341, column: 5)
!446 = !DILocation(line: 343, column: 17, scope: !444)
!447 = !DILocalVariable(name: "buffer", scope: !444, file: !27, line: 344, type: !139)
!448 = !DILocation(line: 344, column: 17, scope: !444)
!449 = !DILocation(line: 347, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !444, file: !27, line: 347, column: 17)
!451 = !DILocation(line: 347, column: 22, scope: !450)
!452 = !DILocation(line: 347, column: 17, scope: !444)
!453 = !DILocation(line: 349, column: 24, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !27, line: 348, column: 13)
!455 = !DILocation(line: 349, column: 17, scope: !454)
!456 = !DILocation(line: 349, column: 30, scope: !454)
!457 = !DILocation(line: 351, column: 23, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !27, line: 351, column: 17)
!459 = !DILocation(line: 351, column: 21, scope: !458)
!460 = !DILocation(line: 351, column: 28, scope: !461)
!461 = distinct !DILexicalBlock(scope: !458, file: !27, line: 351, column: 17)
!462 = !DILocation(line: 351, column: 30, scope: !461)
!463 = !DILocation(line: 351, column: 17, scope: !458)
!464 = !DILocation(line: 353, column: 41, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !27, line: 352, column: 17)
!466 = !DILocation(line: 353, column: 34, scope: !465)
!467 = !DILocation(line: 353, column: 21, scope: !465)
!468 = !DILocation(line: 354, column: 17, scope: !465)
!469 = !DILocation(line: 351, column: 37, scope: !461)
!470 = !DILocation(line: 351, column: 17, scope: !461)
!471 = distinct !{!471, !463, !472, !167}
!472 = !DILocation(line: 354, column: 17, scope: !458)
!473 = !DILocation(line: 355, column: 13, scope: !454)
!474 = !DILocation(line: 358, column: 17, scope: !475)
!475 = distinct !DILexicalBlock(scope: !450, file: !27, line: 357, column: 13)
!476 = !DILocation(line: 361, column: 5, scope: !445)
!477 = !DILocation(line: 362, column: 1, scope: !428)
!478 = distinct !DISubprogram(name: "goodG2B2", scope: !27, file: !27, line: 365, type: !37, scopeLine: 366, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !39)
!479 = !DILocalVariable(name: "data", scope: !478, file: !27, line: 367, type: !28)
!480 = !DILocation(line: 367, column: 9, scope: !478)
!481 = !DILocation(line: 369, column: 10, scope: !478)
!482 = !DILocation(line: 370, column: 8, scope: !483)
!483 = distinct !DILexicalBlock(scope: !478, file: !27, line: 370, column: 8)
!484 = !DILocation(line: 370, column: 8, scope: !478)
!485 = !DILocation(line: 374, column: 14, scope: !486)
!486 = distinct !DILexicalBlock(scope: !483, file: !27, line: 371, column: 5)
!487 = !DILocation(line: 375, column: 5, scope: !486)
!488 = !DILocation(line: 376, column: 8, scope: !489)
!489 = distinct !DILexicalBlock(scope: !478, file: !27, line: 376, column: 8)
!490 = !DILocation(line: 376, column: 8, scope: !478)
!491 = !DILocalVariable(name: "i", scope: !492, file: !27, line: 379, type: !28)
!492 = distinct !DILexicalBlock(scope: !493, file: !27, line: 378, column: 9)
!493 = distinct !DILexicalBlock(scope: !489, file: !27, line: 377, column: 5)
!494 = !DILocation(line: 379, column: 17, scope: !492)
!495 = !DILocalVariable(name: "buffer", scope: !492, file: !27, line: 380, type: !139)
!496 = !DILocation(line: 380, column: 17, scope: !492)
!497 = !DILocation(line: 383, column: 17, scope: !498)
!498 = distinct !DILexicalBlock(scope: !492, file: !27, line: 383, column: 17)
!499 = !DILocation(line: 383, column: 22, scope: !498)
!500 = !DILocation(line: 383, column: 17, scope: !492)
!501 = !DILocation(line: 385, column: 24, scope: !502)
!502 = distinct !DILexicalBlock(scope: !498, file: !27, line: 384, column: 13)
!503 = !DILocation(line: 385, column: 17, scope: !502)
!504 = !DILocation(line: 385, column: 30, scope: !502)
!505 = !DILocation(line: 387, column: 23, scope: !506)
!506 = distinct !DILexicalBlock(scope: !502, file: !27, line: 387, column: 17)
!507 = !DILocation(line: 387, column: 21, scope: !506)
!508 = !DILocation(line: 387, column: 28, scope: !509)
!509 = distinct !DILexicalBlock(scope: !506, file: !27, line: 387, column: 17)
!510 = !DILocation(line: 387, column: 30, scope: !509)
!511 = !DILocation(line: 387, column: 17, scope: !506)
!512 = !DILocation(line: 389, column: 41, scope: !513)
!513 = distinct !DILexicalBlock(scope: !509, file: !27, line: 388, column: 17)
!514 = !DILocation(line: 389, column: 34, scope: !513)
!515 = !DILocation(line: 389, column: 21, scope: !513)
!516 = !DILocation(line: 390, column: 17, scope: !513)
!517 = !DILocation(line: 387, column: 37, scope: !509)
!518 = !DILocation(line: 387, column: 17, scope: !509)
!519 = distinct !{!519, !511, !520, !167}
!520 = !DILocation(line: 390, column: 17, scope: !506)
!521 = !DILocation(line: 391, column: 13, scope: !502)
!522 = !DILocation(line: 394, column: 17, scope: !523)
!523 = distinct !DILexicalBlock(scope: !498, file: !27, line: 393, column: 13)
!524 = !DILocation(line: 397, column: 5, scope: !493)
!525 = !DILocation(line: 398, column: 1, scope: !478)
