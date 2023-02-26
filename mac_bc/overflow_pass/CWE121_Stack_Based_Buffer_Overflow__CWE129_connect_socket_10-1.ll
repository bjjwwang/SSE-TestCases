; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@globalTrue = external global i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external global i32, align 4
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10_bad() #0 !dbg !29 {
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
  %0 = load i32, i32* @globalTrue, align 4, !dbg !38
  %tobool = icmp ne i32 %0, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.end21, !dbg !40

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !45, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, i32* %connectSocket, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  br label %do.body, !dbg !70

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !71
  store i32 %call, i32* %connectSocket, align 4, !dbg !73
  %1 = load i32, i32* %connectSocket, align 4, !dbg !74
  %cmp = icmp eq i32 %1, -1, !dbg !76
  br i1 %cmp, label %if.then1, label %if.end, !dbg !77

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !78

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !80
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !81
  store i8 2, i8* %sin_family, align 1, !dbg !82
  %call2 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !83
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !84
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !85
  store i32 %call2, i32* %s_addr, align 4, !dbg !86
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !87
  store i16 -30871, i16* %sin_port, align 2, !dbg !88
  %3 = load i32, i32* %connectSocket, align 4, !dbg !89
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !91
  %call3 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !92
  %cmp4 = icmp eq i32 %call3, -1, !dbg !93
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !94

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !95

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !97
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !98
  %call7 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !99
  %conv = trunc i64 %call7 to i32, !dbg !99
  store i32 %conv, i32* %recvResult, align 4, !dbg !100
  %6 = load i32, i32* %recvResult, align 4, !dbg !101
  %cmp8 = icmp eq i32 %6, -1, !dbg !103
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !104

lor.lhs.false:                                    ; preds = %if.end6
  %7 = load i32, i32* %recvResult, align 4, !dbg !105
  %cmp10 = icmp eq i32 %7, 0, !dbg !106
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !107

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !108

if.end13:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !110
  %idxprom = sext i32 %8 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !113
  %call15 = call i32 @atoi(i8* noundef %arraydecay14), !dbg !114
  store i32 %call15, i32* %data, align 4, !dbg !115
  br label %do.end, !dbg !116

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !117
  %cmp16 = icmp ne i32 %9, -1, !dbg !119
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !120

if.then18:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !121
  %call19 = call i32 @"\01_close"(i32 noundef %10), !dbg !123
  br label %if.end20, !dbg !124

if.end20:                                         ; preds = %if.then18, %do.end
  br label %if.end21, !dbg !125

if.end21:                                         ; preds = %if.end20, %entry
  %11 = load i32, i32* @globalTrue, align 4, !dbg !126
  %tobool22 = icmp ne i32 %11, 0, !dbg !126
  br i1 %tobool22, label %if.then23, label %if.end34, !dbg !128

if.then23:                                        ; preds = %if.end21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !129, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !133, metadata !DIExpression()), !dbg !137
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !137
  %13 = load i32, i32* %data, align 4, !dbg !138
  %cmp24 = icmp sge i32 %13, 0, !dbg !140
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !141

if.then26:                                        ; preds = %if.then23
  %14 = load i32, i32* %data, align 4, !dbg !142
  %idxprom27 = sext i32 %14 to i64, !dbg !144
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !144
  store i32 1, i32* %arrayidx28, align 4, !dbg !145
  store i32 0, i32* %i, align 4, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %if.then26
  %15 = load i32, i32* %i, align 4, !dbg !149
  %cmp29 = icmp slt i32 %15, 10, !dbg !151
  br i1 %cmp29, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !153
  %idxprom31 = sext i32 %16 to i64, !dbg !155
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !155
  %17 = load i32, i32* %arrayidx32, align 4, !dbg !155
  call void @printIntLine(i32 noundef %17), !dbg !156
  br label %for.inc, !dbg !157

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !158
  %inc = add nsw i32 %18, 1, !dbg !158
  store i32 %inc, i32* %i, align 4, !dbg !158
  br label %for.cond, !dbg !159, !llvm.loop !160

for.end:                                          ; preds = %for.cond
  br label %if.end33, !dbg !163

if.else:                                          ; preds = %if.then23
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !164
  br label %if.end33

if.end33:                                         ; preds = %if.else, %for.end
  br label %if.end34, !dbg !166

if.end34:                                         ; preds = %if.end33, %if.end21
  ret void, !dbg !167
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10_good() #0 !dbg !168 {
entry:
  call void @goodB2G1(), !dbg !169
  call void @goodB2G2(), !dbg !170
  call void @goodG2B1(), !dbg !171
  call void @goodG2B2(), !dbg !172
  ret void, !dbg !173
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !174 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !179, metadata !DIExpression()), !dbg !180
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !181, metadata !DIExpression()), !dbg !182
  %call = call i64 @time(i64* noundef null), !dbg !183
  %conv = trunc i64 %call to i32, !dbg !184
  call void @srand(i32 noundef %conv), !dbg !185
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !186
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10_good(), !dbg !187
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !188
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !189
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10_bad(), !dbg !190
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !191
  ret i32 0, !dbg !192
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !193 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !194, metadata !DIExpression()), !dbg !195
  store i32 -1, i32* %data, align 4, !dbg !196
  %0 = load i32, i32* @globalTrue, align 4, !dbg !197
  %tobool = icmp ne i32 %0, 0, !dbg !197
  br i1 %tobool, label %if.then, label %if.end21, !dbg !199

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !200, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !204, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !206, metadata !DIExpression()), !dbg !207
  store i32 -1, i32* %connectSocket, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !208, metadata !DIExpression()), !dbg !209
  br label %do.body, !dbg !210

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !211
  store i32 %call, i32* %connectSocket, align 4, !dbg !213
  %1 = load i32, i32* %connectSocket, align 4, !dbg !214
  %cmp = icmp eq i32 %1, -1, !dbg !216
  br i1 %cmp, label %if.then1, label %if.end, !dbg !217

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !218

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !220
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !220
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !221
  store i8 2, i8* %sin_family, align 1, !dbg !222
  %call2 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !223
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !224
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !225
  store i32 %call2, i32* %s_addr, align 4, !dbg !226
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !227
  store i16 -30871, i16* %sin_port, align 2, !dbg !228
  %3 = load i32, i32* %connectSocket, align 4, !dbg !229
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !231
  %call3 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !232
  %cmp4 = icmp eq i32 %call3, -1, !dbg !233
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !234

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !235

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !237
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !238
  %call7 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !239
  %conv = trunc i64 %call7 to i32, !dbg !239
  store i32 %conv, i32* %recvResult, align 4, !dbg !240
  %6 = load i32, i32* %recvResult, align 4, !dbg !241
  %cmp8 = icmp eq i32 %6, -1, !dbg !243
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !244

lor.lhs.false:                                    ; preds = %if.end6
  %7 = load i32, i32* %recvResult, align 4, !dbg !245
  %cmp10 = icmp eq i32 %7, 0, !dbg !246
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !247

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !248

if.end13:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !250
  %idxprom = sext i32 %8 to i64, !dbg !251
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !251
  store i8 0, i8* %arrayidx, align 1, !dbg !252
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !253
  %call15 = call i32 @atoi(i8* noundef %arraydecay14), !dbg !254
  store i32 %call15, i32* %data, align 4, !dbg !255
  br label %do.end, !dbg !256

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !257
  %cmp16 = icmp ne i32 %9, -1, !dbg !259
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !260

if.then18:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !261
  %call19 = call i32 @"\01_close"(i32 noundef %10), !dbg !263
  br label %if.end20, !dbg !264

if.end20:                                         ; preds = %if.then18, %do.end
  br label %if.end21, !dbg !265

if.end21:                                         ; preds = %if.end20, %entry
  %11 = load i32, i32* @globalFalse, align 4, !dbg !266
  %tobool22 = icmp ne i32 %11, 0, !dbg !266
  br i1 %tobool22, label %if.then23, label %if.else, !dbg !268

if.then23:                                        ; preds = %if.end21
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !269
  br label %if.end37, !dbg !271

if.else:                                          ; preds = %if.end21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !272, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !276, metadata !DIExpression()), !dbg !277
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !277
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !277
  %13 = load i32, i32* %data, align 4, !dbg !278
  %cmp24 = icmp sge i32 %13, 0, !dbg !280
  br i1 %cmp24, label %land.lhs.true, label %if.else35, !dbg !281

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !282
  %cmp26 = icmp slt i32 %14, 10, !dbg !283
  br i1 %cmp26, label %if.then28, label %if.else35, !dbg !284

if.then28:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !285
  %idxprom29 = sext i32 %15 to i64, !dbg !287
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !287
  store i32 1, i32* %arrayidx30, align 4, !dbg !288
  store i32 0, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !291

for.cond:                                         ; preds = %for.inc, %if.then28
  %16 = load i32, i32* %i, align 4, !dbg !292
  %cmp31 = icmp slt i32 %16, 10, !dbg !294
  br i1 %cmp31, label %for.body, label %for.end, !dbg !295

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !296
  %idxprom33 = sext i32 %17 to i64, !dbg !298
  %arrayidx34 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom33, !dbg !298
  %18 = load i32, i32* %arrayidx34, align 4, !dbg !298
  call void @printIntLine(i32 noundef %18), !dbg !299
  br label %for.inc, !dbg !300

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !301
  %inc = add nsw i32 %19, 1, !dbg !301
  store i32 %inc, i32* %i, align 4, !dbg !301
  br label %for.cond, !dbg !302, !llvm.loop !303

for.end:                                          ; preds = %for.cond
  br label %if.end36, !dbg !305

if.else35:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !306
  br label %if.end36

if.end36:                                         ; preds = %if.else35, %for.end
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then23
  ret void, !dbg !308
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !309 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !310, metadata !DIExpression()), !dbg !311
  store i32 -1, i32* %data, align 4, !dbg !312
  %0 = load i32, i32* @globalTrue, align 4, !dbg !313
  %tobool = icmp ne i32 %0, 0, !dbg !313
  br i1 %tobool, label %if.then, label %if.end21, !dbg !315

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !316, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !320, metadata !DIExpression()), !dbg !321
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !322, metadata !DIExpression()), !dbg !323
  store i32 -1, i32* %connectSocket, align 4, !dbg !323
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !324, metadata !DIExpression()), !dbg !325
  br label %do.body, !dbg !326

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !327
  store i32 %call, i32* %connectSocket, align 4, !dbg !329
  %1 = load i32, i32* %connectSocket, align 4, !dbg !330
  %cmp = icmp eq i32 %1, -1, !dbg !332
  br i1 %cmp, label %if.then1, label %if.end, !dbg !333

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !334

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !336
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !336
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !337
  store i8 2, i8* %sin_family, align 1, !dbg !338
  %call2 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !339
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !340
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !341
  store i32 %call2, i32* %s_addr, align 4, !dbg !342
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !343
  store i16 -30871, i16* %sin_port, align 2, !dbg !344
  %3 = load i32, i32* %connectSocket, align 4, !dbg !345
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !347
  %call3 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !348
  %cmp4 = icmp eq i32 %call3, -1, !dbg !349
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !350

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !351

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !353
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !354
  %call7 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !355
  %conv = trunc i64 %call7 to i32, !dbg !355
  store i32 %conv, i32* %recvResult, align 4, !dbg !356
  %6 = load i32, i32* %recvResult, align 4, !dbg !357
  %cmp8 = icmp eq i32 %6, -1, !dbg !359
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !360

lor.lhs.false:                                    ; preds = %if.end6
  %7 = load i32, i32* %recvResult, align 4, !dbg !361
  %cmp10 = icmp eq i32 %7, 0, !dbg !362
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !363

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !364

if.end13:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !366
  %idxprom = sext i32 %8 to i64, !dbg !367
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !367
  store i8 0, i8* %arrayidx, align 1, !dbg !368
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !369
  %call15 = call i32 @atoi(i8* noundef %arraydecay14), !dbg !370
  store i32 %call15, i32* %data, align 4, !dbg !371
  br label %do.end, !dbg !372

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then1
  %9 = load i32, i32* %connectSocket, align 4, !dbg !373
  %cmp16 = icmp ne i32 %9, -1, !dbg !375
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !376

if.then18:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !377
  %call19 = call i32 @"\01_close"(i32 noundef %10), !dbg !379
  br label %if.end20, !dbg !380

if.end20:                                         ; preds = %if.then18, %do.end
  br label %if.end21, !dbg !381

if.end21:                                         ; preds = %if.end20, %entry
  %11 = load i32, i32* @globalTrue, align 4, !dbg !382
  %tobool22 = icmp ne i32 %11, 0, !dbg !382
  br i1 %tobool22, label %if.then23, label %if.end36, !dbg !384

if.then23:                                        ; preds = %if.end21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !385, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !389, metadata !DIExpression()), !dbg !390
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !390
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !390
  %13 = load i32, i32* %data, align 4, !dbg !391
  %cmp24 = icmp sge i32 %13, 0, !dbg !393
  br i1 %cmp24, label %land.lhs.true, label %if.else, !dbg !394

land.lhs.true:                                    ; preds = %if.then23
  %14 = load i32, i32* %data, align 4, !dbg !395
  %cmp26 = icmp slt i32 %14, 10, !dbg !396
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !397

if.then28:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !398
  %idxprom29 = sext i32 %15 to i64, !dbg !400
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !400
  store i32 1, i32* %arrayidx30, align 4, !dbg !401
  store i32 0, i32* %i, align 4, !dbg !402
  br label %for.cond, !dbg !404

for.cond:                                         ; preds = %for.inc, %if.then28
  %16 = load i32, i32* %i, align 4, !dbg !405
  %cmp31 = icmp slt i32 %16, 10, !dbg !407
  br i1 %cmp31, label %for.body, label %for.end, !dbg !408

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !409
  %idxprom33 = sext i32 %17 to i64, !dbg !411
  %arrayidx34 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom33, !dbg !411
  %18 = load i32, i32* %arrayidx34, align 4, !dbg !411
  call void @printIntLine(i32 noundef %18), !dbg !412
  br label %for.inc, !dbg !413

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !414
  %inc = add nsw i32 %19, 1, !dbg !414
  store i32 %inc, i32* %i, align 4, !dbg !414
  br label %for.cond, !dbg !415, !llvm.loop !416

for.end:                                          ; preds = %for.cond
  br label %if.end35, !dbg !418

if.else:                                          ; preds = %land.lhs.true, %if.then23
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !419
  br label %if.end35

if.end35:                                         ; preds = %if.else, %for.end
  br label %if.end36, !dbg !421

if.end36:                                         ; preds = %if.end35, %if.end21
  ret void, !dbg !422
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !423 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !424, metadata !DIExpression()), !dbg !425
  store i32 -1, i32* %data, align 4, !dbg !426
  %0 = load i32, i32* @globalFalse, align 4, !dbg !427
  %tobool = icmp ne i32 %0, 0, !dbg !427
  br i1 %tobool, label %if.then, label %if.else, !dbg !429

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !430
  br label %if.end, !dbg !432

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !433
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalTrue, align 4, !dbg !435
  %tobool1 = icmp ne i32 %1, 0, !dbg !435
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !437

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !438, metadata !DIExpression()), !dbg !441
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !442, metadata !DIExpression()), !dbg !443
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !443
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !443
  %3 = load i32, i32* %data, align 4, !dbg !444
  %cmp = icmp sge i32 %3, 0, !dbg !446
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !447

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !448
  %idxprom = sext i32 %4 to i64, !dbg !450
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !450
  store i32 1, i32* %arrayidx, align 4, !dbg !451
  store i32 0, i32* %i, align 4, !dbg !452
  br label %for.cond, !dbg !454

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !455
  %cmp4 = icmp slt i32 %5, 10, !dbg !457
  br i1 %cmp4, label %for.body, label %for.end, !dbg !458

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !459
  %idxprom5 = sext i32 %6 to i64, !dbg !461
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !461
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !461
  call void @printIntLine(i32 noundef %7), !dbg !462
  br label %for.inc, !dbg !463

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !464
  %inc = add nsw i32 %8, 1, !dbg !464
  store i32 %inc, i32* %i, align 4, !dbg !464
  br label %for.cond, !dbg !465, !llvm.loop !466

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !468

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !469
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !471

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !472
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !473 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !474, metadata !DIExpression()), !dbg !475
  store i32 -1, i32* %data, align 4, !dbg !476
  %0 = load i32, i32* @globalTrue, align 4, !dbg !477
  %tobool = icmp ne i32 %0, 0, !dbg !477
  br i1 %tobool, label %if.then, label %if.end, !dbg !479

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !480
  br label %if.end, !dbg !482

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalTrue, align 4, !dbg !483
  %tobool1 = icmp ne i32 %1, 0, !dbg !483
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !485

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !486, metadata !DIExpression()), !dbg !489
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !490, metadata !DIExpression()), !dbg !491
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !491
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !491
  %3 = load i32, i32* %data, align 4, !dbg !492
  %cmp = icmp sge i32 %3, 0, !dbg !494
  br i1 %cmp, label %if.then3, label %if.else, !dbg !495

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !496
  %idxprom = sext i32 %4 to i64, !dbg !498
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !498
  store i32 1, i32* %arrayidx, align 4, !dbg !499
  store i32 0, i32* %i, align 4, !dbg !500
  br label %for.cond, !dbg !502

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !503
  %cmp4 = icmp slt i32 %5, 10, !dbg !505
  br i1 %cmp4, label %for.body, label %for.end, !dbg !506

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !507
  %idxprom5 = sext i32 %6 to i64, !dbg !509
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !509
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !509
  call void @printIntLine(i32 noundef %7), !dbg !510
  br label %for.inc, !dbg !511

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !512
  %inc = add nsw i32 %8, 1, !dbg !512
  store i32 %inc, i32* %i, align 4, !dbg !512
  br label %for.cond, !dbg !513, !llvm.loop !514

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !516

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !517
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !519

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !520
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10_bad", scope: !30, file: !30, line: 44, type: !31, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 46, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 46, column: 9, scope: !29)
!37 = !DILocation(line: 48, column: 10, scope: !29)
!38 = !DILocation(line: 49, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !30, line: 49, column: 8)
!40 = !DILocation(line: 49, column: 8, scope: !29)
!41 = !DILocalVariable(name: "recvResult", scope: !42, file: !30, line: 56, type: !35)
!42 = distinct !DILexicalBlock(scope: !43, file: !30, line: 51, column: 9)
!43 = distinct !DILexicalBlock(scope: !39, file: !30, line: 50, column: 5)
!44 = !DILocation(line: 56, column: 17, scope: !42)
!45 = !DILocalVariable(name: "service", scope: !42, file: !30, line: 57, type: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !47, line: 375, size: 128, elements: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!48 = !{!49, !50, !51, !54, !61}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !46, file: !47, line: 376, baseType: !11, size: 8)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !46, file: !47, line: 377, baseType: !14, size: 8, offset: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !46, file: !47, line: 378, baseType: !52, size: 16, offset: 16)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !53, line: 31, baseType: !3)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !46, file: !47, line: 379, baseType: !55, size: 32, offset: 32)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !47, line: 301, size: 32, elements: !56)
!56 = !{!57}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !55, file: !47, line: 302, baseType: !58, size: 32)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !59, line: 31, baseType: !60)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !46, file: !47, line: 380, baseType: !62, size: 64, offset: 64)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 8)
!65 = !DILocation(line: 57, column: 32, scope: !42)
!66 = !DILocalVariable(name: "connectSocket", scope: !42, file: !30, line: 58, type: !35)
!67 = !DILocation(line: 58, column: 20, scope: !42)
!68 = !DILocalVariable(name: "inputBuffer", scope: !42, file: !30, line: 59, type: !17)
!69 = !DILocation(line: 59, column: 18, scope: !42)
!70 = !DILocation(line: 60, column: 13, scope: !42)
!71 = !DILocation(line: 70, column: 33, scope: !72)
!72 = distinct !DILexicalBlock(scope: !42, file: !30, line: 61, column: 13)
!73 = !DILocation(line: 70, column: 31, scope: !72)
!74 = !DILocation(line: 71, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !30, line: 71, column: 21)
!76 = !DILocation(line: 71, column: 35, scope: !75)
!77 = !DILocation(line: 71, column: 21, scope: !72)
!78 = !DILocation(line: 73, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !30, line: 72, column: 17)
!80 = !DILocation(line: 75, column: 17, scope: !72)
!81 = !DILocation(line: 76, column: 25, scope: !72)
!82 = !DILocation(line: 76, column: 36, scope: !72)
!83 = !DILocation(line: 77, column: 43, scope: !72)
!84 = !DILocation(line: 77, column: 25, scope: !72)
!85 = !DILocation(line: 77, column: 34, scope: !72)
!86 = !DILocation(line: 77, column: 41, scope: !72)
!87 = !DILocation(line: 78, column: 25, scope: !72)
!88 = !DILocation(line: 78, column: 34, scope: !72)
!89 = !DILocation(line: 79, column: 29, scope: !90)
!90 = distinct !DILexicalBlock(scope: !72, file: !30, line: 79, column: 21)
!91 = !DILocation(line: 79, column: 44, scope: !90)
!92 = !DILocation(line: 79, column: 21, scope: !90)
!93 = !DILocation(line: 79, column: 89, scope: !90)
!94 = !DILocation(line: 79, column: 21, scope: !72)
!95 = !DILocation(line: 81, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !30, line: 80, column: 17)
!97 = !DILocation(line: 85, column: 35, scope: !72)
!98 = !DILocation(line: 85, column: 50, scope: !72)
!99 = !DILocation(line: 85, column: 30, scope: !72)
!100 = !DILocation(line: 85, column: 28, scope: !72)
!101 = !DILocation(line: 86, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !72, file: !30, line: 86, column: 21)
!103 = !DILocation(line: 86, column: 32, scope: !102)
!104 = !DILocation(line: 86, column: 48, scope: !102)
!105 = !DILocation(line: 86, column: 51, scope: !102)
!106 = !DILocation(line: 86, column: 62, scope: !102)
!107 = !DILocation(line: 86, column: 21, scope: !72)
!108 = !DILocation(line: 88, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !30, line: 87, column: 17)
!110 = !DILocation(line: 91, column: 29, scope: !72)
!111 = !DILocation(line: 91, column: 17, scope: !72)
!112 = !DILocation(line: 91, column: 41, scope: !72)
!113 = !DILocation(line: 93, column: 29, scope: !72)
!114 = !DILocation(line: 93, column: 24, scope: !72)
!115 = !DILocation(line: 93, column: 22, scope: !72)
!116 = !DILocation(line: 94, column: 13, scope: !72)
!117 = !DILocation(line: 96, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !42, file: !30, line: 96, column: 17)
!119 = !DILocation(line: 96, column: 31, scope: !118)
!120 = !DILocation(line: 96, column: 17, scope: !42)
!121 = !DILocation(line: 98, column: 30, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !30, line: 97, column: 13)
!123 = !DILocation(line: 98, column: 17, scope: !122)
!124 = !DILocation(line: 99, column: 13, scope: !122)
!125 = !DILocation(line: 107, column: 5, scope: !43)
!126 = !DILocation(line: 108, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !29, file: !30, line: 108, column: 8)
!128 = !DILocation(line: 108, column: 8, scope: !29)
!129 = !DILocalVariable(name: "i", scope: !130, file: !30, line: 111, type: !35)
!130 = distinct !DILexicalBlock(scope: !131, file: !30, line: 110, column: 9)
!131 = distinct !DILexicalBlock(scope: !127, file: !30, line: 109, column: 5)
!132 = !DILocation(line: 111, column: 17, scope: !130)
!133 = !DILocalVariable(name: "buffer", scope: !130, file: !30, line: 112, type: !134)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 10)
!137 = !DILocation(line: 112, column: 17, scope: !130)
!138 = !DILocation(line: 115, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !130, file: !30, line: 115, column: 17)
!140 = !DILocation(line: 115, column: 22, scope: !139)
!141 = !DILocation(line: 115, column: 17, scope: !130)
!142 = !DILocation(line: 117, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !30, line: 116, column: 13)
!144 = !DILocation(line: 117, column: 17, scope: !143)
!145 = !DILocation(line: 117, column: 30, scope: !143)
!146 = !DILocation(line: 119, column: 23, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !30, line: 119, column: 17)
!148 = !DILocation(line: 119, column: 21, scope: !147)
!149 = !DILocation(line: 119, column: 28, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !30, line: 119, column: 17)
!151 = !DILocation(line: 119, column: 30, scope: !150)
!152 = !DILocation(line: 119, column: 17, scope: !147)
!153 = !DILocation(line: 121, column: 41, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !30, line: 120, column: 17)
!155 = !DILocation(line: 121, column: 34, scope: !154)
!156 = !DILocation(line: 121, column: 21, scope: !154)
!157 = !DILocation(line: 122, column: 17, scope: !154)
!158 = !DILocation(line: 119, column: 37, scope: !150)
!159 = !DILocation(line: 119, column: 17, scope: !150)
!160 = distinct !{!160, !152, !161, !162}
!161 = !DILocation(line: 122, column: 17, scope: !147)
!162 = !{!"llvm.loop.mustprogress"}
!163 = !DILocation(line: 123, column: 13, scope: !143)
!164 = !DILocation(line: 126, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !139, file: !30, line: 125, column: 13)
!166 = !DILocation(line: 129, column: 5, scope: !131)
!167 = !DILocation(line: 130, column: 1, scope: !29)
!168 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_10_good", scope: !30, file: !30, line: 394, type: !31, scopeLine: 395, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!169 = !DILocation(line: 396, column: 5, scope: !168)
!170 = !DILocation(line: 397, column: 5, scope: !168)
!171 = !DILocation(line: 398, column: 5, scope: !168)
!172 = !DILocation(line: 399, column: 5, scope: !168)
!173 = !DILocation(line: 400, column: 1, scope: !168)
!174 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 411, type: !175, scopeLine: 412, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!175 = !DISubroutineType(types: !176)
!176 = !{!35, !35, !177}
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!179 = !DILocalVariable(name: "argc", arg: 1, scope: !174, file: !30, line: 411, type: !35)
!180 = !DILocation(line: 411, column: 14, scope: !174)
!181 = !DILocalVariable(name: "argv", arg: 2, scope: !174, file: !30, line: 411, type: !177)
!182 = !DILocation(line: 411, column: 27, scope: !174)
!183 = !DILocation(line: 414, column: 22, scope: !174)
!184 = !DILocation(line: 414, column: 12, scope: !174)
!185 = !DILocation(line: 414, column: 5, scope: !174)
!186 = !DILocation(line: 416, column: 5, scope: !174)
!187 = !DILocation(line: 417, column: 5, scope: !174)
!188 = !DILocation(line: 418, column: 5, scope: !174)
!189 = !DILocation(line: 421, column: 5, scope: !174)
!190 = !DILocation(line: 422, column: 5, scope: !174)
!191 = !DILocation(line: 423, column: 5, scope: !174)
!192 = !DILocation(line: 425, column: 5, scope: !174)
!193 = distinct !DISubprogram(name: "goodB2G1", scope: !30, file: !30, line: 137, type: !31, scopeLine: 138, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!194 = !DILocalVariable(name: "data", scope: !193, file: !30, line: 139, type: !35)
!195 = !DILocation(line: 139, column: 9, scope: !193)
!196 = !DILocation(line: 141, column: 10, scope: !193)
!197 = !DILocation(line: 142, column: 8, scope: !198)
!198 = distinct !DILexicalBlock(scope: !193, file: !30, line: 142, column: 8)
!199 = !DILocation(line: 142, column: 8, scope: !193)
!200 = !DILocalVariable(name: "recvResult", scope: !201, file: !30, line: 149, type: !35)
!201 = distinct !DILexicalBlock(scope: !202, file: !30, line: 144, column: 9)
!202 = distinct !DILexicalBlock(scope: !198, file: !30, line: 143, column: 5)
!203 = !DILocation(line: 149, column: 17, scope: !201)
!204 = !DILocalVariable(name: "service", scope: !201, file: !30, line: 150, type: !46)
!205 = !DILocation(line: 150, column: 32, scope: !201)
!206 = !DILocalVariable(name: "connectSocket", scope: !201, file: !30, line: 151, type: !35)
!207 = !DILocation(line: 151, column: 20, scope: !201)
!208 = !DILocalVariable(name: "inputBuffer", scope: !201, file: !30, line: 152, type: !17)
!209 = !DILocation(line: 152, column: 18, scope: !201)
!210 = !DILocation(line: 153, column: 13, scope: !201)
!211 = !DILocation(line: 163, column: 33, scope: !212)
!212 = distinct !DILexicalBlock(scope: !201, file: !30, line: 154, column: 13)
!213 = !DILocation(line: 163, column: 31, scope: !212)
!214 = !DILocation(line: 164, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !30, line: 164, column: 21)
!216 = !DILocation(line: 164, column: 35, scope: !215)
!217 = !DILocation(line: 164, column: 21, scope: !212)
!218 = !DILocation(line: 166, column: 21, scope: !219)
!219 = distinct !DILexicalBlock(scope: !215, file: !30, line: 165, column: 17)
!220 = !DILocation(line: 168, column: 17, scope: !212)
!221 = !DILocation(line: 169, column: 25, scope: !212)
!222 = !DILocation(line: 169, column: 36, scope: !212)
!223 = !DILocation(line: 170, column: 43, scope: !212)
!224 = !DILocation(line: 170, column: 25, scope: !212)
!225 = !DILocation(line: 170, column: 34, scope: !212)
!226 = !DILocation(line: 170, column: 41, scope: !212)
!227 = !DILocation(line: 171, column: 25, scope: !212)
!228 = !DILocation(line: 171, column: 34, scope: !212)
!229 = !DILocation(line: 172, column: 29, scope: !230)
!230 = distinct !DILexicalBlock(scope: !212, file: !30, line: 172, column: 21)
!231 = !DILocation(line: 172, column: 44, scope: !230)
!232 = !DILocation(line: 172, column: 21, scope: !230)
!233 = !DILocation(line: 172, column: 89, scope: !230)
!234 = !DILocation(line: 172, column: 21, scope: !212)
!235 = !DILocation(line: 174, column: 21, scope: !236)
!236 = distinct !DILexicalBlock(scope: !230, file: !30, line: 173, column: 17)
!237 = !DILocation(line: 178, column: 35, scope: !212)
!238 = !DILocation(line: 178, column: 50, scope: !212)
!239 = !DILocation(line: 178, column: 30, scope: !212)
!240 = !DILocation(line: 178, column: 28, scope: !212)
!241 = !DILocation(line: 179, column: 21, scope: !242)
!242 = distinct !DILexicalBlock(scope: !212, file: !30, line: 179, column: 21)
!243 = !DILocation(line: 179, column: 32, scope: !242)
!244 = !DILocation(line: 179, column: 48, scope: !242)
!245 = !DILocation(line: 179, column: 51, scope: !242)
!246 = !DILocation(line: 179, column: 62, scope: !242)
!247 = !DILocation(line: 179, column: 21, scope: !212)
!248 = !DILocation(line: 181, column: 21, scope: !249)
!249 = distinct !DILexicalBlock(scope: !242, file: !30, line: 180, column: 17)
!250 = !DILocation(line: 184, column: 29, scope: !212)
!251 = !DILocation(line: 184, column: 17, scope: !212)
!252 = !DILocation(line: 184, column: 41, scope: !212)
!253 = !DILocation(line: 186, column: 29, scope: !212)
!254 = !DILocation(line: 186, column: 24, scope: !212)
!255 = !DILocation(line: 186, column: 22, scope: !212)
!256 = !DILocation(line: 187, column: 13, scope: !212)
!257 = !DILocation(line: 189, column: 17, scope: !258)
!258 = distinct !DILexicalBlock(scope: !201, file: !30, line: 189, column: 17)
!259 = !DILocation(line: 189, column: 31, scope: !258)
!260 = !DILocation(line: 189, column: 17, scope: !201)
!261 = !DILocation(line: 191, column: 30, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !30, line: 190, column: 13)
!263 = !DILocation(line: 191, column: 17, scope: !262)
!264 = !DILocation(line: 192, column: 13, scope: !262)
!265 = !DILocation(line: 200, column: 5, scope: !202)
!266 = !DILocation(line: 201, column: 8, scope: !267)
!267 = distinct !DILexicalBlock(scope: !193, file: !30, line: 201, column: 8)
!268 = !DILocation(line: 201, column: 8, scope: !193)
!269 = !DILocation(line: 204, column: 9, scope: !270)
!270 = distinct !DILexicalBlock(scope: !267, file: !30, line: 202, column: 5)
!271 = !DILocation(line: 205, column: 5, scope: !270)
!272 = !DILocalVariable(name: "i", scope: !273, file: !30, line: 209, type: !35)
!273 = distinct !DILexicalBlock(scope: !274, file: !30, line: 208, column: 9)
!274 = distinct !DILexicalBlock(scope: !267, file: !30, line: 207, column: 5)
!275 = !DILocation(line: 209, column: 17, scope: !273)
!276 = !DILocalVariable(name: "buffer", scope: !273, file: !30, line: 210, type: !134)
!277 = !DILocation(line: 210, column: 17, scope: !273)
!278 = !DILocation(line: 212, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !273, file: !30, line: 212, column: 17)
!280 = !DILocation(line: 212, column: 22, scope: !279)
!281 = !DILocation(line: 212, column: 27, scope: !279)
!282 = !DILocation(line: 212, column: 30, scope: !279)
!283 = !DILocation(line: 212, column: 35, scope: !279)
!284 = !DILocation(line: 212, column: 17, scope: !273)
!285 = !DILocation(line: 214, column: 24, scope: !286)
!286 = distinct !DILexicalBlock(scope: !279, file: !30, line: 213, column: 13)
!287 = !DILocation(line: 214, column: 17, scope: !286)
!288 = !DILocation(line: 214, column: 30, scope: !286)
!289 = !DILocation(line: 216, column: 23, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !30, line: 216, column: 17)
!291 = !DILocation(line: 216, column: 21, scope: !290)
!292 = !DILocation(line: 216, column: 28, scope: !293)
!293 = distinct !DILexicalBlock(scope: !290, file: !30, line: 216, column: 17)
!294 = !DILocation(line: 216, column: 30, scope: !293)
!295 = !DILocation(line: 216, column: 17, scope: !290)
!296 = !DILocation(line: 218, column: 41, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !30, line: 217, column: 17)
!298 = !DILocation(line: 218, column: 34, scope: !297)
!299 = !DILocation(line: 218, column: 21, scope: !297)
!300 = !DILocation(line: 219, column: 17, scope: !297)
!301 = !DILocation(line: 216, column: 37, scope: !293)
!302 = !DILocation(line: 216, column: 17, scope: !293)
!303 = distinct !{!303, !295, !304, !162}
!304 = !DILocation(line: 219, column: 17, scope: !290)
!305 = !DILocation(line: 220, column: 13, scope: !286)
!306 = !DILocation(line: 223, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !279, file: !30, line: 222, column: 13)
!308 = !DILocation(line: 227, column: 1, scope: !193)
!309 = distinct !DISubprogram(name: "goodB2G2", scope: !30, file: !30, line: 230, type: !31, scopeLine: 231, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!310 = !DILocalVariable(name: "data", scope: !309, file: !30, line: 232, type: !35)
!311 = !DILocation(line: 232, column: 9, scope: !309)
!312 = !DILocation(line: 234, column: 10, scope: !309)
!313 = !DILocation(line: 235, column: 8, scope: !314)
!314 = distinct !DILexicalBlock(scope: !309, file: !30, line: 235, column: 8)
!315 = !DILocation(line: 235, column: 8, scope: !309)
!316 = !DILocalVariable(name: "recvResult", scope: !317, file: !30, line: 242, type: !35)
!317 = distinct !DILexicalBlock(scope: !318, file: !30, line: 237, column: 9)
!318 = distinct !DILexicalBlock(scope: !314, file: !30, line: 236, column: 5)
!319 = !DILocation(line: 242, column: 17, scope: !317)
!320 = !DILocalVariable(name: "service", scope: !317, file: !30, line: 243, type: !46)
!321 = !DILocation(line: 243, column: 32, scope: !317)
!322 = !DILocalVariable(name: "connectSocket", scope: !317, file: !30, line: 244, type: !35)
!323 = !DILocation(line: 244, column: 20, scope: !317)
!324 = !DILocalVariable(name: "inputBuffer", scope: !317, file: !30, line: 245, type: !17)
!325 = !DILocation(line: 245, column: 18, scope: !317)
!326 = !DILocation(line: 246, column: 13, scope: !317)
!327 = !DILocation(line: 256, column: 33, scope: !328)
!328 = distinct !DILexicalBlock(scope: !317, file: !30, line: 247, column: 13)
!329 = !DILocation(line: 256, column: 31, scope: !328)
!330 = !DILocation(line: 257, column: 21, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !30, line: 257, column: 21)
!332 = !DILocation(line: 257, column: 35, scope: !331)
!333 = !DILocation(line: 257, column: 21, scope: !328)
!334 = !DILocation(line: 259, column: 21, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !30, line: 258, column: 17)
!336 = !DILocation(line: 261, column: 17, scope: !328)
!337 = !DILocation(line: 262, column: 25, scope: !328)
!338 = !DILocation(line: 262, column: 36, scope: !328)
!339 = !DILocation(line: 263, column: 43, scope: !328)
!340 = !DILocation(line: 263, column: 25, scope: !328)
!341 = !DILocation(line: 263, column: 34, scope: !328)
!342 = !DILocation(line: 263, column: 41, scope: !328)
!343 = !DILocation(line: 264, column: 25, scope: !328)
!344 = !DILocation(line: 264, column: 34, scope: !328)
!345 = !DILocation(line: 265, column: 29, scope: !346)
!346 = distinct !DILexicalBlock(scope: !328, file: !30, line: 265, column: 21)
!347 = !DILocation(line: 265, column: 44, scope: !346)
!348 = !DILocation(line: 265, column: 21, scope: !346)
!349 = !DILocation(line: 265, column: 89, scope: !346)
!350 = !DILocation(line: 265, column: 21, scope: !328)
!351 = !DILocation(line: 267, column: 21, scope: !352)
!352 = distinct !DILexicalBlock(scope: !346, file: !30, line: 266, column: 17)
!353 = !DILocation(line: 271, column: 35, scope: !328)
!354 = !DILocation(line: 271, column: 50, scope: !328)
!355 = !DILocation(line: 271, column: 30, scope: !328)
!356 = !DILocation(line: 271, column: 28, scope: !328)
!357 = !DILocation(line: 272, column: 21, scope: !358)
!358 = distinct !DILexicalBlock(scope: !328, file: !30, line: 272, column: 21)
!359 = !DILocation(line: 272, column: 32, scope: !358)
!360 = !DILocation(line: 272, column: 48, scope: !358)
!361 = !DILocation(line: 272, column: 51, scope: !358)
!362 = !DILocation(line: 272, column: 62, scope: !358)
!363 = !DILocation(line: 272, column: 21, scope: !328)
!364 = !DILocation(line: 274, column: 21, scope: !365)
!365 = distinct !DILexicalBlock(scope: !358, file: !30, line: 273, column: 17)
!366 = !DILocation(line: 277, column: 29, scope: !328)
!367 = !DILocation(line: 277, column: 17, scope: !328)
!368 = !DILocation(line: 277, column: 41, scope: !328)
!369 = !DILocation(line: 279, column: 29, scope: !328)
!370 = !DILocation(line: 279, column: 24, scope: !328)
!371 = !DILocation(line: 279, column: 22, scope: !328)
!372 = !DILocation(line: 280, column: 13, scope: !328)
!373 = !DILocation(line: 282, column: 17, scope: !374)
!374 = distinct !DILexicalBlock(scope: !317, file: !30, line: 282, column: 17)
!375 = !DILocation(line: 282, column: 31, scope: !374)
!376 = !DILocation(line: 282, column: 17, scope: !317)
!377 = !DILocation(line: 284, column: 30, scope: !378)
!378 = distinct !DILexicalBlock(scope: !374, file: !30, line: 283, column: 13)
!379 = !DILocation(line: 284, column: 17, scope: !378)
!380 = !DILocation(line: 285, column: 13, scope: !378)
!381 = !DILocation(line: 293, column: 5, scope: !318)
!382 = !DILocation(line: 294, column: 8, scope: !383)
!383 = distinct !DILexicalBlock(scope: !309, file: !30, line: 294, column: 8)
!384 = !DILocation(line: 294, column: 8, scope: !309)
!385 = !DILocalVariable(name: "i", scope: !386, file: !30, line: 297, type: !35)
!386 = distinct !DILexicalBlock(scope: !387, file: !30, line: 296, column: 9)
!387 = distinct !DILexicalBlock(scope: !383, file: !30, line: 295, column: 5)
!388 = !DILocation(line: 297, column: 17, scope: !386)
!389 = !DILocalVariable(name: "buffer", scope: !386, file: !30, line: 298, type: !134)
!390 = !DILocation(line: 298, column: 17, scope: !386)
!391 = !DILocation(line: 300, column: 17, scope: !392)
!392 = distinct !DILexicalBlock(scope: !386, file: !30, line: 300, column: 17)
!393 = !DILocation(line: 300, column: 22, scope: !392)
!394 = !DILocation(line: 300, column: 27, scope: !392)
!395 = !DILocation(line: 300, column: 30, scope: !392)
!396 = !DILocation(line: 300, column: 35, scope: !392)
!397 = !DILocation(line: 300, column: 17, scope: !386)
!398 = !DILocation(line: 302, column: 24, scope: !399)
!399 = distinct !DILexicalBlock(scope: !392, file: !30, line: 301, column: 13)
!400 = !DILocation(line: 302, column: 17, scope: !399)
!401 = !DILocation(line: 302, column: 30, scope: !399)
!402 = !DILocation(line: 304, column: 23, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !30, line: 304, column: 17)
!404 = !DILocation(line: 304, column: 21, scope: !403)
!405 = !DILocation(line: 304, column: 28, scope: !406)
!406 = distinct !DILexicalBlock(scope: !403, file: !30, line: 304, column: 17)
!407 = !DILocation(line: 304, column: 30, scope: !406)
!408 = !DILocation(line: 304, column: 17, scope: !403)
!409 = !DILocation(line: 306, column: 41, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !30, line: 305, column: 17)
!411 = !DILocation(line: 306, column: 34, scope: !410)
!412 = !DILocation(line: 306, column: 21, scope: !410)
!413 = !DILocation(line: 307, column: 17, scope: !410)
!414 = !DILocation(line: 304, column: 37, scope: !406)
!415 = !DILocation(line: 304, column: 17, scope: !406)
!416 = distinct !{!416, !408, !417, !162}
!417 = !DILocation(line: 307, column: 17, scope: !403)
!418 = !DILocation(line: 308, column: 13, scope: !399)
!419 = !DILocation(line: 311, column: 17, scope: !420)
!420 = distinct !DILexicalBlock(scope: !392, file: !30, line: 310, column: 13)
!421 = !DILocation(line: 314, column: 5, scope: !387)
!422 = !DILocation(line: 315, column: 1, scope: !309)
!423 = distinct !DISubprogram(name: "goodG2B1", scope: !30, file: !30, line: 318, type: !31, scopeLine: 319, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!424 = !DILocalVariable(name: "data", scope: !423, file: !30, line: 320, type: !35)
!425 = !DILocation(line: 320, column: 9, scope: !423)
!426 = !DILocation(line: 322, column: 10, scope: !423)
!427 = !DILocation(line: 323, column: 8, scope: !428)
!428 = distinct !DILexicalBlock(scope: !423, file: !30, line: 323, column: 8)
!429 = !DILocation(line: 323, column: 8, scope: !423)
!430 = !DILocation(line: 326, column: 9, scope: !431)
!431 = distinct !DILexicalBlock(scope: !428, file: !30, line: 324, column: 5)
!432 = !DILocation(line: 327, column: 5, scope: !431)
!433 = !DILocation(line: 332, column: 14, scope: !434)
!434 = distinct !DILexicalBlock(scope: !428, file: !30, line: 329, column: 5)
!435 = !DILocation(line: 334, column: 8, scope: !436)
!436 = distinct !DILexicalBlock(scope: !423, file: !30, line: 334, column: 8)
!437 = !DILocation(line: 334, column: 8, scope: !423)
!438 = !DILocalVariable(name: "i", scope: !439, file: !30, line: 337, type: !35)
!439 = distinct !DILexicalBlock(scope: !440, file: !30, line: 336, column: 9)
!440 = distinct !DILexicalBlock(scope: !436, file: !30, line: 335, column: 5)
!441 = !DILocation(line: 337, column: 17, scope: !439)
!442 = !DILocalVariable(name: "buffer", scope: !439, file: !30, line: 338, type: !134)
!443 = !DILocation(line: 338, column: 17, scope: !439)
!444 = !DILocation(line: 341, column: 17, scope: !445)
!445 = distinct !DILexicalBlock(scope: !439, file: !30, line: 341, column: 17)
!446 = !DILocation(line: 341, column: 22, scope: !445)
!447 = !DILocation(line: 341, column: 17, scope: !439)
!448 = !DILocation(line: 343, column: 24, scope: !449)
!449 = distinct !DILexicalBlock(scope: !445, file: !30, line: 342, column: 13)
!450 = !DILocation(line: 343, column: 17, scope: !449)
!451 = !DILocation(line: 343, column: 30, scope: !449)
!452 = !DILocation(line: 345, column: 23, scope: !453)
!453 = distinct !DILexicalBlock(scope: !449, file: !30, line: 345, column: 17)
!454 = !DILocation(line: 345, column: 21, scope: !453)
!455 = !DILocation(line: 345, column: 28, scope: !456)
!456 = distinct !DILexicalBlock(scope: !453, file: !30, line: 345, column: 17)
!457 = !DILocation(line: 345, column: 30, scope: !456)
!458 = !DILocation(line: 345, column: 17, scope: !453)
!459 = !DILocation(line: 347, column: 41, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !30, line: 346, column: 17)
!461 = !DILocation(line: 347, column: 34, scope: !460)
!462 = !DILocation(line: 347, column: 21, scope: !460)
!463 = !DILocation(line: 348, column: 17, scope: !460)
!464 = !DILocation(line: 345, column: 37, scope: !456)
!465 = !DILocation(line: 345, column: 17, scope: !456)
!466 = distinct !{!466, !458, !467, !162}
!467 = !DILocation(line: 348, column: 17, scope: !453)
!468 = !DILocation(line: 349, column: 13, scope: !449)
!469 = !DILocation(line: 352, column: 17, scope: !470)
!470 = distinct !DILexicalBlock(scope: !445, file: !30, line: 351, column: 13)
!471 = !DILocation(line: 355, column: 5, scope: !440)
!472 = !DILocation(line: 356, column: 1, scope: !423)
!473 = distinct !DISubprogram(name: "goodG2B2", scope: !30, file: !30, line: 359, type: !31, scopeLine: 360, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!474 = !DILocalVariable(name: "data", scope: !473, file: !30, line: 361, type: !35)
!475 = !DILocation(line: 361, column: 9, scope: !473)
!476 = !DILocation(line: 363, column: 10, scope: !473)
!477 = !DILocation(line: 364, column: 8, scope: !478)
!478 = distinct !DILexicalBlock(scope: !473, file: !30, line: 364, column: 8)
!479 = !DILocation(line: 364, column: 8, scope: !473)
!480 = !DILocation(line: 368, column: 14, scope: !481)
!481 = distinct !DILexicalBlock(scope: !478, file: !30, line: 365, column: 5)
!482 = !DILocation(line: 369, column: 5, scope: !481)
!483 = !DILocation(line: 370, column: 8, scope: !484)
!484 = distinct !DILexicalBlock(scope: !473, file: !30, line: 370, column: 8)
!485 = !DILocation(line: 370, column: 8, scope: !473)
!486 = !DILocalVariable(name: "i", scope: !487, file: !30, line: 373, type: !35)
!487 = distinct !DILexicalBlock(scope: !488, file: !30, line: 372, column: 9)
!488 = distinct !DILexicalBlock(scope: !484, file: !30, line: 371, column: 5)
!489 = !DILocation(line: 373, column: 17, scope: !487)
!490 = !DILocalVariable(name: "buffer", scope: !487, file: !30, line: 374, type: !134)
!491 = !DILocation(line: 374, column: 17, scope: !487)
!492 = !DILocation(line: 377, column: 17, scope: !493)
!493 = distinct !DILexicalBlock(scope: !487, file: !30, line: 377, column: 17)
!494 = !DILocation(line: 377, column: 22, scope: !493)
!495 = !DILocation(line: 377, column: 17, scope: !487)
!496 = !DILocation(line: 379, column: 24, scope: !497)
!497 = distinct !DILexicalBlock(scope: !493, file: !30, line: 378, column: 13)
!498 = !DILocation(line: 379, column: 17, scope: !497)
!499 = !DILocation(line: 379, column: 30, scope: !497)
!500 = !DILocation(line: 381, column: 23, scope: !501)
!501 = distinct !DILexicalBlock(scope: !497, file: !30, line: 381, column: 17)
!502 = !DILocation(line: 381, column: 21, scope: !501)
!503 = !DILocation(line: 381, column: 28, scope: !504)
!504 = distinct !DILexicalBlock(scope: !501, file: !30, line: 381, column: 17)
!505 = !DILocation(line: 381, column: 30, scope: !504)
!506 = !DILocation(line: 381, column: 17, scope: !501)
!507 = !DILocation(line: 383, column: 41, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !30, line: 382, column: 17)
!509 = !DILocation(line: 383, column: 34, scope: !508)
!510 = !DILocation(line: 383, column: 21, scope: !508)
!511 = !DILocation(line: 384, column: 17, scope: !508)
!512 = !DILocation(line: 381, column: 37, scope: !504)
!513 = !DILocation(line: 381, column: 17, scope: !504)
!514 = distinct !{!514, !506, !515, !162}
!515 = !DILocation(line: 384, column: 17, scope: !501)
!516 = !DILocation(line: 385, column: 13, scope: !497)
!517 = !DILocation(line: 388, column: 17, scope: !518)
!518 = distinct !DILexicalBlock(scope: !493, file: !30, line: 387, column: 13)
!519 = !DILocation(line: 391, column: 5, scope: !488)
!520 = !DILocation(line: 392, column: 1, scope: !473)
