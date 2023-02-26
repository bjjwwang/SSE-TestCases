; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data20 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !121, metadata !DIExpression()), !dbg !123
  %10 = load i32, i32* %data, align 4, !dbg !124
  store i32 %10, i32* %dataCopy, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %data20, metadata !125, metadata !DIExpression()), !dbg !126
  %11 = load i32, i32* %dataCopy, align 4, !dbg !127
  store i32 %11, i32* %data20, align 4, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !135
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !135
  %13 = load i32, i32* %data20, align 4, !dbg !136
  %cmp21 = icmp sge i32 %13, 0, !dbg !138
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !139

if.then23:                                        ; preds = %if.end19
  %14 = load i32, i32* %data20, align 4, !dbg !140
  %idxprom24 = sext i32 %14 to i64, !dbg !142
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !142
  store i32 1, i32* %arrayidx25, align 4, !dbg !143
  store i32 0, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.then23
  %15 = load i32, i32* %i, align 4, !dbg !147
  %cmp26 = icmp slt i32 %15, 10, !dbg !149
  br i1 %cmp26, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %16 = load i32, i32* %i, align 4, !dbg !151
  %idxprom28 = sext i32 %16 to i64, !dbg !153
  %arrayidx29 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom28, !dbg !153
  %17 = load i32, i32* %arrayidx29, align 4, !dbg !153
  call void @printIntLine(i32 noundef %17), !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %18 = load i32, i32* %i, align 4, !dbg !156
  %inc = add nsw i32 %18, 1, !dbg !156
  store i32 %inc, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  br label %if.end30, !dbg !161

if.else:                                          ; preds = %if.end19
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !162
  br label %if.end30

if.end30:                                         ; preds = %if.else, %for.end
  ret void, !dbg !164
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31_good() #0 !dbg !165 {
entry:
  call void @goodG2B(), !dbg !166
  call void @goodB2G(), !dbg !167
  ret void, !dbg !168
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !169 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !174, metadata !DIExpression()), !dbg !175
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !176, metadata !DIExpression()), !dbg !177
  %call = call i64 @time(i64* noundef null), !dbg !178
  %conv = trunc i64 %call to i32, !dbg !179
  call void @srand(i32 noundef %conv), !dbg !180
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !181
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31_good(), !dbg !182
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !183
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !184
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31_bad(), !dbg !185
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !186
  ret i32 0, !dbg !187
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !188 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !189, metadata !DIExpression()), !dbg !190
  store i32 -1, i32* %data, align 4, !dbg !191
  store i32 7, i32* %data, align 4, !dbg !192
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !193, metadata !DIExpression()), !dbg !195
  %0 = load i32, i32* %data, align 4, !dbg !196
  store i32 %0, i32* %dataCopy, align 4, !dbg !195
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !197, metadata !DIExpression()), !dbg !198
  %1 = load i32, i32* %dataCopy, align 4, !dbg !199
  store i32 %1, i32* %data1, align 4, !dbg !198
  call void @llvm.dbg.declare(metadata i32* %i, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !203, metadata !DIExpression()), !dbg !204
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !204
  %3 = load i32, i32* %data1, align 4, !dbg !205
  %cmp = icmp sge i32 %3, 0, !dbg !207
  br i1 %cmp, label %if.then, label %if.else, !dbg !208

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %data1, align 4, !dbg !209
  %idxprom = sext i32 %4 to i64, !dbg !211
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !211
  store i32 1, i32* %arrayidx, align 4, !dbg !212
  store i32 0, i32* %i, align 4, !dbg !213
  br label %for.cond, !dbg !215

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !216
  %cmp2 = icmp slt i32 %5, 10, !dbg !218
  br i1 %cmp2, label %for.body, label %for.end, !dbg !219

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !220
  %idxprom3 = sext i32 %6 to i64, !dbg !222
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !222
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !222
  call void @printIntLine(i32 noundef %7), !dbg !223
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !225
  %inc = add nsw i32 %8, 1, !dbg !225
  store i32 %inc, i32* %i, align 4, !dbg !225
  br label %for.cond, !dbg !226, !llvm.loop !227

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !229

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !230
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !232
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !233 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data20 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !234, metadata !DIExpression()), !dbg !235
  store i32 -1, i32* %data, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !237, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !240, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !242, metadata !DIExpression()), !dbg !243
  store i32 -1, i32* %connectSocket, align 4, !dbg !243
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !244, metadata !DIExpression()), !dbg !245
  br label %do.body, !dbg !246

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !247
  store i32 %call, i32* %connectSocket, align 4, !dbg !249
  %0 = load i32, i32* %connectSocket, align 4, !dbg !250
  %cmp = icmp eq i32 %0, -1, !dbg !252
  br i1 %cmp, label %if.then, label %if.end, !dbg !253

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !254

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !256
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !256
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !257
  store i8 2, i8* %sin_family, align 1, !dbg !258
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !259
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !260
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !261
  store i32 %call1, i32* %s_addr, align 4, !dbg !262
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !263
  store i16 -30871, i16* %sin_port, align 2, !dbg !264
  %2 = load i32, i32* %connectSocket, align 4, !dbg !265
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !267
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !268
  %cmp3 = icmp eq i32 %call2, -1, !dbg !269
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !270

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !271

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !273
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !274
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !275
  %conv = trunc i64 %call6 to i32, !dbg !275
  store i32 %conv, i32* %recvResult, align 4, !dbg !276
  %5 = load i32, i32* %recvResult, align 4, !dbg !277
  %cmp7 = icmp eq i32 %5, -1, !dbg !279
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !280

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !281
  %cmp9 = icmp eq i32 %6, 0, !dbg !282
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !283

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !284

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !286
  %idxprom = sext i32 %7 to i64, !dbg !287
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !287
  store i8 0, i8* %arrayidx, align 1, !dbg !288
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !289
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !290
  store i32 %call14, i32* %data, align 4, !dbg !291
  br label %do.end, !dbg !292

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !293
  %cmp15 = icmp ne i32 %8, -1, !dbg !295
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !296

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !297
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !299
  br label %if.end19, !dbg !300

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !301, metadata !DIExpression()), !dbg !303
  %10 = load i32, i32* %data, align 4, !dbg !304
  store i32 %10, i32* %dataCopy, align 4, !dbg !303
  call void @llvm.dbg.declare(metadata i32* %data20, metadata !305, metadata !DIExpression()), !dbg !306
  %11 = load i32, i32* %dataCopy, align 4, !dbg !307
  store i32 %11, i32* %data20, align 4, !dbg !306
  call void @llvm.dbg.declare(metadata i32* %i, metadata !308, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !311, metadata !DIExpression()), !dbg !312
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !312
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !312
  %13 = load i32, i32* %data20, align 4, !dbg !313
  %cmp21 = icmp sge i32 %13, 0, !dbg !315
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !316

land.lhs.true:                                    ; preds = %if.end19
  %14 = load i32, i32* %data20, align 4, !dbg !317
  %cmp23 = icmp slt i32 %14, 10, !dbg !318
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !319

if.then25:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data20, align 4, !dbg !320
  %idxprom26 = sext i32 %15 to i64, !dbg !322
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !322
  store i32 1, i32* %arrayidx27, align 4, !dbg !323
  store i32 0, i32* %i, align 4, !dbg !324
  br label %for.cond, !dbg !326

for.cond:                                         ; preds = %for.inc, %if.then25
  %16 = load i32, i32* %i, align 4, !dbg !327
  %cmp28 = icmp slt i32 %16, 10, !dbg !329
  br i1 %cmp28, label %for.body, label %for.end, !dbg !330

for.body:                                         ; preds = %for.cond
  %17 = load i32, i32* %i, align 4, !dbg !331
  %idxprom30 = sext i32 %17 to i64, !dbg !333
  %arrayidx31 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom30, !dbg !333
  %18 = load i32, i32* %arrayidx31, align 4, !dbg !333
  call void @printIntLine(i32 noundef %18), !dbg !334
  br label %for.inc, !dbg !335

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4, !dbg !336
  %inc = add nsw i32 %19, 1, !dbg !336
  store i32 %inc, i32* %i, align 4, !dbg !336
  br label %for.cond, !dbg !337, !llvm.loop !338

for.end:                                          ; preds = %for.cond
  br label %if.end32, !dbg !340

if.else:                                          ; preds = %land.lhs.true, %if.end19
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !341
  br label %if.end32

if.end32:                                         ; preds = %if.else, %for.end
  ret void, !dbg !343
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31_bad", scope: !30, file: !30, line: 44, type: !31, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!121 = !DILocalVariable(name: "dataCopy", scope: !122, file: !30, line: 106, type: !35)
!122 = distinct !DILexicalBlock(scope: !29, file: !30, line: 105, column: 5)
!123 = !DILocation(line: 106, column: 13, scope: !122)
!124 = !DILocation(line: 106, column: 24, scope: !122)
!125 = !DILocalVariable(name: "data", scope: !122, file: !30, line: 107, type: !35)
!126 = !DILocation(line: 107, column: 13, scope: !122)
!127 = !DILocation(line: 107, column: 20, scope: !122)
!128 = !DILocalVariable(name: "i", scope: !129, file: !30, line: 109, type: !35)
!129 = distinct !DILexicalBlock(scope: !122, file: !30, line: 108, column: 9)
!130 = !DILocation(line: 109, column: 17, scope: !129)
!131 = !DILocalVariable(name: "buffer", scope: !129, file: !30, line: 110, type: !132)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 10)
!135 = !DILocation(line: 110, column: 17, scope: !129)
!136 = !DILocation(line: 113, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !129, file: !30, line: 113, column: 17)
!138 = !DILocation(line: 113, column: 22, scope: !137)
!139 = !DILocation(line: 113, column: 17, scope: !129)
!140 = !DILocation(line: 115, column: 24, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !30, line: 114, column: 13)
!142 = !DILocation(line: 115, column: 17, scope: !141)
!143 = !DILocation(line: 115, column: 30, scope: !141)
!144 = !DILocation(line: 117, column: 23, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !30, line: 117, column: 17)
!146 = !DILocation(line: 117, column: 21, scope: !145)
!147 = !DILocation(line: 117, column: 28, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !30, line: 117, column: 17)
!149 = !DILocation(line: 117, column: 30, scope: !148)
!150 = !DILocation(line: 117, column: 17, scope: !145)
!151 = !DILocation(line: 119, column: 41, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !30, line: 118, column: 17)
!153 = !DILocation(line: 119, column: 34, scope: !152)
!154 = !DILocation(line: 119, column: 21, scope: !152)
!155 = !DILocation(line: 120, column: 17, scope: !152)
!156 = !DILocation(line: 117, column: 37, scope: !148)
!157 = !DILocation(line: 117, column: 17, scope: !148)
!158 = distinct !{!158, !150, !159, !160}
!159 = !DILocation(line: 120, column: 17, scope: !145)
!160 = !{!"llvm.loop.mustprogress"}
!161 = !DILocation(line: 121, column: 13, scope: !141)
!162 = !DILocation(line: 124, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !137, file: !30, line: 123, column: 13)
!164 = !DILocation(line: 128, column: 1, scope: !29)
!165 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_connect_socket_31_good", scope: !30, file: !30, line: 254, type: !31, scopeLine: 255, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!166 = !DILocation(line: 256, column: 5, scope: !165)
!167 = !DILocation(line: 257, column: 5, scope: !165)
!168 = !DILocation(line: 258, column: 1, scope: !165)
!169 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 268, type: !170, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!170 = !DISubroutineType(types: !171)
!171 = !{!35, !35, !172}
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !173, size: 64)
!173 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!174 = !DILocalVariable(name: "argc", arg: 1, scope: !169, file: !30, line: 268, type: !35)
!175 = !DILocation(line: 268, column: 14, scope: !169)
!176 = !DILocalVariable(name: "argv", arg: 2, scope: !169, file: !30, line: 268, type: !172)
!177 = !DILocation(line: 268, column: 27, scope: !169)
!178 = !DILocation(line: 271, column: 22, scope: !169)
!179 = !DILocation(line: 271, column: 12, scope: !169)
!180 = !DILocation(line: 271, column: 5, scope: !169)
!181 = !DILocation(line: 273, column: 5, scope: !169)
!182 = !DILocation(line: 274, column: 5, scope: !169)
!183 = !DILocation(line: 275, column: 5, scope: !169)
!184 = !DILocation(line: 278, column: 5, scope: !169)
!185 = !DILocation(line: 279, column: 5, scope: !169)
!186 = !DILocation(line: 280, column: 5, scope: !169)
!187 = !DILocation(line: 282, column: 5, scope: !169)
!188 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 135, type: !31, scopeLine: 136, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!189 = !DILocalVariable(name: "data", scope: !188, file: !30, line: 137, type: !35)
!190 = !DILocation(line: 137, column: 9, scope: !188)
!191 = !DILocation(line: 139, column: 10, scope: !188)
!192 = !DILocation(line: 142, column: 10, scope: !188)
!193 = !DILocalVariable(name: "dataCopy", scope: !194, file: !30, line: 144, type: !35)
!194 = distinct !DILexicalBlock(scope: !188, file: !30, line: 143, column: 5)
!195 = !DILocation(line: 144, column: 13, scope: !194)
!196 = !DILocation(line: 144, column: 24, scope: !194)
!197 = !DILocalVariable(name: "data", scope: !194, file: !30, line: 145, type: !35)
!198 = !DILocation(line: 145, column: 13, scope: !194)
!199 = !DILocation(line: 145, column: 20, scope: !194)
!200 = !DILocalVariable(name: "i", scope: !201, file: !30, line: 147, type: !35)
!201 = distinct !DILexicalBlock(scope: !194, file: !30, line: 146, column: 9)
!202 = !DILocation(line: 147, column: 17, scope: !201)
!203 = !DILocalVariable(name: "buffer", scope: !201, file: !30, line: 148, type: !132)
!204 = !DILocation(line: 148, column: 17, scope: !201)
!205 = !DILocation(line: 151, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !30, line: 151, column: 17)
!207 = !DILocation(line: 151, column: 22, scope: !206)
!208 = !DILocation(line: 151, column: 17, scope: !201)
!209 = !DILocation(line: 153, column: 24, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !30, line: 152, column: 13)
!211 = !DILocation(line: 153, column: 17, scope: !210)
!212 = !DILocation(line: 153, column: 30, scope: !210)
!213 = !DILocation(line: 155, column: 23, scope: !214)
!214 = distinct !DILexicalBlock(scope: !210, file: !30, line: 155, column: 17)
!215 = !DILocation(line: 155, column: 21, scope: !214)
!216 = !DILocation(line: 155, column: 28, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !30, line: 155, column: 17)
!218 = !DILocation(line: 155, column: 30, scope: !217)
!219 = !DILocation(line: 155, column: 17, scope: !214)
!220 = !DILocation(line: 157, column: 41, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !30, line: 156, column: 17)
!222 = !DILocation(line: 157, column: 34, scope: !221)
!223 = !DILocation(line: 157, column: 21, scope: !221)
!224 = !DILocation(line: 158, column: 17, scope: !221)
!225 = !DILocation(line: 155, column: 37, scope: !217)
!226 = !DILocation(line: 155, column: 17, scope: !217)
!227 = distinct !{!227, !219, !228, !160}
!228 = !DILocation(line: 158, column: 17, scope: !214)
!229 = !DILocation(line: 159, column: 13, scope: !210)
!230 = !DILocation(line: 162, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !206, file: !30, line: 161, column: 13)
!232 = !DILocation(line: 166, column: 1, scope: !188)
!233 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 169, type: !31, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!234 = !DILocalVariable(name: "data", scope: !233, file: !30, line: 171, type: !35)
!235 = !DILocation(line: 171, column: 9, scope: !233)
!236 = !DILocation(line: 173, column: 10, scope: !233)
!237 = !DILocalVariable(name: "recvResult", scope: !238, file: !30, line: 179, type: !35)
!238 = distinct !DILexicalBlock(scope: !233, file: !30, line: 174, column: 5)
!239 = !DILocation(line: 179, column: 13, scope: !238)
!240 = !DILocalVariable(name: "service", scope: !238, file: !30, line: 180, type: !42)
!241 = !DILocation(line: 180, column: 28, scope: !238)
!242 = !DILocalVariable(name: "connectSocket", scope: !238, file: !30, line: 181, type: !35)
!243 = !DILocation(line: 181, column: 16, scope: !238)
!244 = !DILocalVariable(name: "inputBuffer", scope: !238, file: !30, line: 182, type: !17)
!245 = !DILocation(line: 182, column: 14, scope: !238)
!246 = !DILocation(line: 183, column: 9, scope: !238)
!247 = !DILocation(line: 193, column: 29, scope: !248)
!248 = distinct !DILexicalBlock(scope: !238, file: !30, line: 184, column: 9)
!249 = !DILocation(line: 193, column: 27, scope: !248)
!250 = !DILocation(line: 194, column: 17, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !30, line: 194, column: 17)
!252 = !DILocation(line: 194, column: 31, scope: !251)
!253 = !DILocation(line: 194, column: 17, scope: !248)
!254 = !DILocation(line: 196, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !30, line: 195, column: 13)
!256 = !DILocation(line: 198, column: 13, scope: !248)
!257 = !DILocation(line: 199, column: 21, scope: !248)
!258 = !DILocation(line: 199, column: 32, scope: !248)
!259 = !DILocation(line: 200, column: 39, scope: !248)
!260 = !DILocation(line: 200, column: 21, scope: !248)
!261 = !DILocation(line: 200, column: 30, scope: !248)
!262 = !DILocation(line: 200, column: 37, scope: !248)
!263 = !DILocation(line: 201, column: 21, scope: !248)
!264 = !DILocation(line: 201, column: 30, scope: !248)
!265 = !DILocation(line: 202, column: 25, scope: !266)
!266 = distinct !DILexicalBlock(scope: !248, file: !30, line: 202, column: 17)
!267 = !DILocation(line: 202, column: 40, scope: !266)
!268 = !DILocation(line: 202, column: 17, scope: !266)
!269 = !DILocation(line: 202, column: 85, scope: !266)
!270 = !DILocation(line: 202, column: 17, scope: !248)
!271 = !DILocation(line: 204, column: 17, scope: !272)
!272 = distinct !DILexicalBlock(scope: !266, file: !30, line: 203, column: 13)
!273 = !DILocation(line: 208, column: 31, scope: !248)
!274 = !DILocation(line: 208, column: 46, scope: !248)
!275 = !DILocation(line: 208, column: 26, scope: !248)
!276 = !DILocation(line: 208, column: 24, scope: !248)
!277 = !DILocation(line: 209, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !248, file: !30, line: 209, column: 17)
!279 = !DILocation(line: 209, column: 28, scope: !278)
!280 = !DILocation(line: 209, column: 44, scope: !278)
!281 = !DILocation(line: 209, column: 47, scope: !278)
!282 = !DILocation(line: 209, column: 58, scope: !278)
!283 = !DILocation(line: 209, column: 17, scope: !248)
!284 = !DILocation(line: 211, column: 17, scope: !285)
!285 = distinct !DILexicalBlock(scope: !278, file: !30, line: 210, column: 13)
!286 = !DILocation(line: 214, column: 25, scope: !248)
!287 = !DILocation(line: 214, column: 13, scope: !248)
!288 = !DILocation(line: 214, column: 37, scope: !248)
!289 = !DILocation(line: 216, column: 25, scope: !248)
!290 = !DILocation(line: 216, column: 20, scope: !248)
!291 = !DILocation(line: 216, column: 18, scope: !248)
!292 = !DILocation(line: 217, column: 9, scope: !248)
!293 = !DILocation(line: 219, column: 13, scope: !294)
!294 = distinct !DILexicalBlock(scope: !238, file: !30, line: 219, column: 13)
!295 = !DILocation(line: 219, column: 27, scope: !294)
!296 = !DILocation(line: 219, column: 13, scope: !238)
!297 = !DILocation(line: 221, column: 26, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !30, line: 220, column: 9)
!299 = !DILocation(line: 221, column: 13, scope: !298)
!300 = !DILocation(line: 222, column: 9, scope: !298)
!301 = !DILocalVariable(name: "dataCopy", scope: !302, file: !30, line: 231, type: !35)
!302 = distinct !DILexicalBlock(scope: !233, file: !30, line: 230, column: 5)
!303 = !DILocation(line: 231, column: 13, scope: !302)
!304 = !DILocation(line: 231, column: 24, scope: !302)
!305 = !DILocalVariable(name: "data", scope: !302, file: !30, line: 232, type: !35)
!306 = !DILocation(line: 232, column: 13, scope: !302)
!307 = !DILocation(line: 232, column: 20, scope: !302)
!308 = !DILocalVariable(name: "i", scope: !309, file: !30, line: 234, type: !35)
!309 = distinct !DILexicalBlock(scope: !302, file: !30, line: 233, column: 9)
!310 = !DILocation(line: 234, column: 17, scope: !309)
!311 = !DILocalVariable(name: "buffer", scope: !309, file: !30, line: 235, type: !132)
!312 = !DILocation(line: 235, column: 17, scope: !309)
!313 = !DILocation(line: 237, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !309, file: !30, line: 237, column: 17)
!315 = !DILocation(line: 237, column: 22, scope: !314)
!316 = !DILocation(line: 237, column: 27, scope: !314)
!317 = !DILocation(line: 237, column: 30, scope: !314)
!318 = !DILocation(line: 237, column: 35, scope: !314)
!319 = !DILocation(line: 237, column: 17, scope: !309)
!320 = !DILocation(line: 239, column: 24, scope: !321)
!321 = distinct !DILexicalBlock(scope: !314, file: !30, line: 238, column: 13)
!322 = !DILocation(line: 239, column: 17, scope: !321)
!323 = !DILocation(line: 239, column: 30, scope: !321)
!324 = !DILocation(line: 241, column: 23, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !30, line: 241, column: 17)
!326 = !DILocation(line: 241, column: 21, scope: !325)
!327 = !DILocation(line: 241, column: 28, scope: !328)
!328 = distinct !DILexicalBlock(scope: !325, file: !30, line: 241, column: 17)
!329 = !DILocation(line: 241, column: 30, scope: !328)
!330 = !DILocation(line: 241, column: 17, scope: !325)
!331 = !DILocation(line: 243, column: 41, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !30, line: 242, column: 17)
!333 = !DILocation(line: 243, column: 34, scope: !332)
!334 = !DILocation(line: 243, column: 21, scope: !332)
!335 = !DILocation(line: 244, column: 17, scope: !332)
!336 = !DILocation(line: 241, column: 37, scope: !328)
!337 = !DILocation(line: 241, column: 17, scope: !328)
!338 = distinct !{!338, !330, !339, !160}
!339 = !DILocation(line: 244, column: 17, scope: !325)
!340 = !DILocation(line: 245, column: 13, scope: !321)
!341 = !DILocation(line: 248, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !314, file: !30, line: 247, column: 13)
!343 = !DILocation(line: 252, column: 1, scope: !233)
