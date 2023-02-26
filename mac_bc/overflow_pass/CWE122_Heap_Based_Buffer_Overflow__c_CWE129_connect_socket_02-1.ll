; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02_bad() #0 !dbg !32 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 -1, i32* %data, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !40, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !45, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, i32* %connectSocket, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  br label %do.body, !dbg !70

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !71
  store i32 %call, i32* %connectSocket, align 4, !dbg !73
  %0 = load i32, i32* %connectSocket, align 4, !dbg !74
  %cmp = icmp eq i32 %0, -1, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !78

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !80
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !81
  store i8 2, i8* %sin_family, align 1, !dbg !82
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !83
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !84
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !85
  store i32 %call1, i32* %s_addr, align 4, !dbg !86
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !87
  store i16 -30871, i16* %sin_port, align 2, !dbg !88
  %2 = load i32, i32* %connectSocket, align 4, !dbg !89
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !91
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !92
  %cmp3 = icmp eq i32 %call2, -1, !dbg !93
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !94

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !95

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !97
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !98
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !99
  %conv = trunc i64 %call6 to i32, !dbg !99
  store i32 %conv, i32* %recvResult, align 4, !dbg !100
  %5 = load i32, i32* %recvResult, align 4, !dbg !101
  %cmp7 = icmp eq i32 %5, -1, !dbg !103
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !104

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !105
  %cmp9 = icmp eq i32 %6, 0, !dbg !106
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !107

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !108

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !110
  %idxprom = sext i32 %7 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !113
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !114
  store i32 %call14, i32* %data, align 4, !dbg !115
  br label %do.end, !dbg !116

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !117
  %cmp15 = icmp ne i32 %8, -1, !dbg !119
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !120

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !121
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !123
  br label %if.end19, !dbg !124

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !130, metadata !DIExpression()), !dbg !131
  %call20 = call i8* @malloc(i64 noundef 40) #6, !dbg !132
  %10 = bitcast i8* %call20 to i32*, !dbg !133
  store i32* %10, i32** %buffer, align 8, !dbg !131
  %11 = load i32*, i32** %buffer, align 8, !dbg !134
  %cmp21 = icmp eq i32* %11, null, !dbg !136
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !137

if.then23:                                        ; preds = %if.end19
  call void @exit(i32 noundef -1) #7, !dbg !138
  unreachable, !dbg !138

if.end24:                                         ; preds = %if.end19
  store i32 0, i32* %i, align 4, !dbg !140
  br label %for.cond, !dbg !142

for.cond:                                         ; preds = %for.inc, %if.end24
  %12 = load i32, i32* %i, align 4, !dbg !143
  %cmp25 = icmp slt i32 %12, 10, !dbg !145
  br i1 %cmp25, label %for.body, label %for.end, !dbg !146

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !147
  %14 = load i32, i32* %i, align 4, !dbg !149
  %idxprom27 = sext i32 %14 to i64, !dbg !147
  %arrayidx28 = getelementptr inbounds i32, i32* %13, i64 %idxprom27, !dbg !147
  store i32 0, i32* %arrayidx28, align 4, !dbg !150
  br label %for.inc, !dbg !151

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !152
  %inc = add nsw i32 %15, 1, !dbg !152
  store i32 %inc, i32* %i, align 4, !dbg !152
  br label %for.cond, !dbg !153, !llvm.loop !154

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !157
  %cmp29 = icmp sge i32 %16, 0, !dbg !159
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !160

if.then31:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !161
  %18 = load i32, i32* %data, align 4, !dbg !163
  %idxprom32 = sext i32 %18 to i64, !dbg !161
  %arrayidx33 = getelementptr inbounds i32, i32* %17, i64 %idxprom32, !dbg !161
  store i32 1, i32* %arrayidx33, align 4, !dbg !164
  store i32 0, i32* %i, align 4, !dbg !165
  br label %for.cond34, !dbg !167

for.cond34:                                       ; preds = %for.inc40, %if.then31
  %19 = load i32, i32* %i, align 4, !dbg !168
  %cmp35 = icmp slt i32 %19, 10, !dbg !170
  br i1 %cmp35, label %for.body37, label %for.end42, !dbg !171

for.body37:                                       ; preds = %for.cond34
  %20 = load i32*, i32** %buffer, align 8, !dbg !172
  %21 = load i32, i32* %i, align 4, !dbg !174
  %idxprom38 = sext i32 %21 to i64, !dbg !172
  %arrayidx39 = getelementptr inbounds i32, i32* %20, i64 %idxprom38, !dbg !172
  %22 = load i32, i32* %arrayidx39, align 4, !dbg !172
  call void @printIntLine(i32 noundef %22), !dbg !175
  br label %for.inc40, !dbg !176

for.inc40:                                        ; preds = %for.body37
  %23 = load i32, i32* %i, align 4, !dbg !177
  %inc41 = add nsw i32 %23, 1, !dbg !177
  store i32 %inc41, i32* %i, align 4, !dbg !177
  br label %for.cond34, !dbg !178, !llvm.loop !179

for.end42:                                        ; preds = %for.cond34
  br label %if.end43, !dbg !181

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !182
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end42
  %24 = load i32*, i32** %buffer, align 8, !dbg !184
  %25 = bitcast i32* %24 to i8*, !dbg !184
  call void @free(i8* noundef %25), !dbg !185
  ret void, !dbg !186
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

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02_good() #0 !dbg !187 {
entry:
  call void @goodB2G1(), !dbg !188
  call void @goodB2G2(), !dbg !189
  call void @goodG2B1(), !dbg !190
  call void @goodG2B2(), !dbg !191
  ret void, !dbg !192
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !193 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !198, metadata !DIExpression()), !dbg !199
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !200, metadata !DIExpression()), !dbg !201
  %call = call i64 @time(i64* noundef null), !dbg !202
  %conv = trunc i64 %call to i32, !dbg !203
  call void @srand(i32 noundef %conv), !dbg !204
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !205
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02_good(), !dbg !206
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !207
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !208
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02_bad(), !dbg !209
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !210
  ret i32 0, !dbg !211
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !212 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !213, metadata !DIExpression()), !dbg !214
  store i32 -1, i32* %data, align 4, !dbg !215
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !216, metadata !DIExpression()), !dbg !220
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !221, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 -1, i32* %connectSocket, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !225, metadata !DIExpression()), !dbg !226
  br label %do.body, !dbg !227

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !228
  store i32 %call, i32* %connectSocket, align 4, !dbg !230
  %0 = load i32, i32* %connectSocket, align 4, !dbg !231
  %cmp = icmp eq i32 %0, -1, !dbg !233
  br i1 %cmp, label %if.then, label %if.end, !dbg !234

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !235

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !237
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !237
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !238
  store i8 2, i8* %sin_family, align 1, !dbg !239
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !240
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !241
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !242
  store i32 %call1, i32* %s_addr, align 4, !dbg !243
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !244
  store i16 -30871, i16* %sin_port, align 2, !dbg !245
  %2 = load i32, i32* %connectSocket, align 4, !dbg !246
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !248
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !249
  %cmp3 = icmp eq i32 %call2, -1, !dbg !250
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !251

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !252

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !254
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !255
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !256
  %conv = trunc i64 %call6 to i32, !dbg !256
  store i32 %conv, i32* %recvResult, align 4, !dbg !257
  %5 = load i32, i32* %recvResult, align 4, !dbg !258
  %cmp7 = icmp eq i32 %5, -1, !dbg !260
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !261

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !262
  %cmp9 = icmp eq i32 %6, 0, !dbg !263
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !264

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !265

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !267
  %idxprom = sext i32 %7 to i64, !dbg !268
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !268
  store i8 0, i8* %arrayidx, align 1, !dbg !269
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !270
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !271
  store i32 %call14, i32* %data, align 4, !dbg !272
  br label %do.end, !dbg !273

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !274
  %cmp15 = icmp ne i32 %8, -1, !dbg !276
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !277

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !278
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !280
  br label %if.end19, !dbg !281

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !282, metadata !DIExpression()), !dbg !286
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !287, metadata !DIExpression()), !dbg !288
  %call20 = call i8* @malloc(i64 noundef 40) #6, !dbg !289
  %10 = bitcast i8* %call20 to i32*, !dbg !290
  store i32* %10, i32** %buffer, align 8, !dbg !288
  %11 = load i32*, i32** %buffer, align 8, !dbg !291
  %cmp21 = icmp eq i32* %11, null, !dbg !293
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !294

if.then23:                                        ; preds = %if.end19
  call void @exit(i32 noundef -1) #7, !dbg !295
  unreachable, !dbg !295

if.end24:                                         ; preds = %if.end19
  store i32 0, i32* %i, align 4, !dbg !297
  br label %for.cond, !dbg !299

for.cond:                                         ; preds = %for.inc, %if.end24
  %12 = load i32, i32* %i, align 4, !dbg !300
  %cmp25 = icmp slt i32 %12, 10, !dbg !302
  br i1 %cmp25, label %for.body, label %for.end, !dbg !303

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !304
  %14 = load i32, i32* %i, align 4, !dbg !306
  %idxprom27 = sext i32 %14 to i64, !dbg !304
  %arrayidx28 = getelementptr inbounds i32, i32* %13, i64 %idxprom27, !dbg !304
  store i32 0, i32* %arrayidx28, align 4, !dbg !307
  br label %for.inc, !dbg !308

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !309
  %inc = add nsw i32 %15, 1, !dbg !309
  store i32 %inc, i32* %i, align 4, !dbg !309
  br label %for.cond, !dbg !310, !llvm.loop !311

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !313
  %cmp29 = icmp sge i32 %16, 0, !dbg !315
  br i1 %cmp29, label %land.lhs.true, label %if.else, !dbg !316

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !317
  %cmp31 = icmp slt i32 %17, 10, !dbg !318
  br i1 %cmp31, label %if.then33, label %if.else, !dbg !319

if.then33:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !320
  %19 = load i32, i32* %data, align 4, !dbg !322
  %idxprom34 = sext i32 %19 to i64, !dbg !320
  %arrayidx35 = getelementptr inbounds i32, i32* %18, i64 %idxprom34, !dbg !320
  store i32 1, i32* %arrayidx35, align 4, !dbg !323
  store i32 0, i32* %i, align 4, !dbg !324
  br label %for.cond36, !dbg !326

for.cond36:                                       ; preds = %for.inc42, %if.then33
  %20 = load i32, i32* %i, align 4, !dbg !327
  %cmp37 = icmp slt i32 %20, 10, !dbg !329
  br i1 %cmp37, label %for.body39, label %for.end44, !dbg !330

for.body39:                                       ; preds = %for.cond36
  %21 = load i32*, i32** %buffer, align 8, !dbg !331
  %22 = load i32, i32* %i, align 4, !dbg !333
  %idxprom40 = sext i32 %22 to i64, !dbg !331
  %arrayidx41 = getelementptr inbounds i32, i32* %21, i64 %idxprom40, !dbg !331
  %23 = load i32, i32* %arrayidx41, align 4, !dbg !331
  call void @printIntLine(i32 noundef %23), !dbg !334
  br label %for.inc42, !dbg !335

for.inc42:                                        ; preds = %for.body39
  %24 = load i32, i32* %i, align 4, !dbg !336
  %inc43 = add nsw i32 %24, 1, !dbg !336
  store i32 %inc43, i32* %i, align 4, !dbg !336
  br label %for.cond36, !dbg !337, !llvm.loop !338

for.end44:                                        ; preds = %for.cond36
  br label %if.end45, !dbg !340

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !341
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end44
  %25 = load i32*, i32** %buffer, align 8, !dbg !343
  %26 = bitcast i32* %25 to i8*, !dbg !343
  call void @free(i8* noundef %26), !dbg !344
  ret void, !dbg !345
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !346 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !347, metadata !DIExpression()), !dbg !348
  store i32 -1, i32* %data, align 4, !dbg !349
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !350, metadata !DIExpression()), !dbg !354
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !355, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !357, metadata !DIExpression()), !dbg !358
  store i32 -1, i32* %connectSocket, align 4, !dbg !358
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !359, metadata !DIExpression()), !dbg !360
  br label %do.body, !dbg !361

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !362
  store i32 %call, i32* %connectSocket, align 4, !dbg !364
  %0 = load i32, i32* %connectSocket, align 4, !dbg !365
  %cmp = icmp eq i32 %0, -1, !dbg !367
  br i1 %cmp, label %if.then, label %if.end, !dbg !368

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !369

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !371
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !371
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !372
  store i8 2, i8* %sin_family, align 1, !dbg !373
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !374
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !375
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !376
  store i32 %call1, i32* %s_addr, align 4, !dbg !377
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !378
  store i16 -30871, i16* %sin_port, align 2, !dbg !379
  %2 = load i32, i32* %connectSocket, align 4, !dbg !380
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !382
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !383
  %cmp3 = icmp eq i32 %call2, -1, !dbg !384
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !385

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !386

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !388
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !389
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !390
  %conv = trunc i64 %call6 to i32, !dbg !390
  store i32 %conv, i32* %recvResult, align 4, !dbg !391
  %5 = load i32, i32* %recvResult, align 4, !dbg !392
  %cmp7 = icmp eq i32 %5, -1, !dbg !394
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !395

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !396
  %cmp9 = icmp eq i32 %6, 0, !dbg !397
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !398

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !399

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !401
  %idxprom = sext i32 %7 to i64, !dbg !402
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !402
  store i8 0, i8* %arrayidx, align 1, !dbg !403
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !404
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !405
  store i32 %call14, i32* %data, align 4, !dbg !406
  br label %do.end, !dbg !407

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !408
  %cmp15 = icmp ne i32 %8, -1, !dbg !410
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !411

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !412
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !414
  br label %if.end19, !dbg !415

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !416, metadata !DIExpression()), !dbg !420
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !421, metadata !DIExpression()), !dbg !422
  %call20 = call i8* @malloc(i64 noundef 40) #6, !dbg !423
  %10 = bitcast i8* %call20 to i32*, !dbg !424
  store i32* %10, i32** %buffer, align 8, !dbg !422
  %11 = load i32*, i32** %buffer, align 8, !dbg !425
  %cmp21 = icmp eq i32* %11, null, !dbg !427
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !428

if.then23:                                        ; preds = %if.end19
  call void @exit(i32 noundef -1) #7, !dbg !429
  unreachable, !dbg !429

if.end24:                                         ; preds = %if.end19
  store i32 0, i32* %i, align 4, !dbg !431
  br label %for.cond, !dbg !433

for.cond:                                         ; preds = %for.inc, %if.end24
  %12 = load i32, i32* %i, align 4, !dbg !434
  %cmp25 = icmp slt i32 %12, 10, !dbg !436
  br i1 %cmp25, label %for.body, label %for.end, !dbg !437

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !438
  %14 = load i32, i32* %i, align 4, !dbg !440
  %idxprom27 = sext i32 %14 to i64, !dbg !438
  %arrayidx28 = getelementptr inbounds i32, i32* %13, i64 %idxprom27, !dbg !438
  store i32 0, i32* %arrayidx28, align 4, !dbg !441
  br label %for.inc, !dbg !442

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !443
  %inc = add nsw i32 %15, 1, !dbg !443
  store i32 %inc, i32* %i, align 4, !dbg !443
  br label %for.cond, !dbg !444, !llvm.loop !445

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !447
  %cmp29 = icmp sge i32 %16, 0, !dbg !449
  br i1 %cmp29, label %land.lhs.true, label %if.else, !dbg !450

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !451
  %cmp31 = icmp slt i32 %17, 10, !dbg !452
  br i1 %cmp31, label %if.then33, label %if.else, !dbg !453

if.then33:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !454
  %19 = load i32, i32* %data, align 4, !dbg !456
  %idxprom34 = sext i32 %19 to i64, !dbg !454
  %arrayidx35 = getelementptr inbounds i32, i32* %18, i64 %idxprom34, !dbg !454
  store i32 1, i32* %arrayidx35, align 4, !dbg !457
  store i32 0, i32* %i, align 4, !dbg !458
  br label %for.cond36, !dbg !460

for.cond36:                                       ; preds = %for.inc42, %if.then33
  %20 = load i32, i32* %i, align 4, !dbg !461
  %cmp37 = icmp slt i32 %20, 10, !dbg !463
  br i1 %cmp37, label %for.body39, label %for.end44, !dbg !464

for.body39:                                       ; preds = %for.cond36
  %21 = load i32*, i32** %buffer, align 8, !dbg !465
  %22 = load i32, i32* %i, align 4, !dbg !467
  %idxprom40 = sext i32 %22 to i64, !dbg !465
  %arrayidx41 = getelementptr inbounds i32, i32* %21, i64 %idxprom40, !dbg !465
  %23 = load i32, i32* %arrayidx41, align 4, !dbg !465
  call void @printIntLine(i32 noundef %23), !dbg !468
  br label %for.inc42, !dbg !469

for.inc42:                                        ; preds = %for.body39
  %24 = load i32, i32* %i, align 4, !dbg !470
  %inc43 = add nsw i32 %24, 1, !dbg !470
  store i32 %inc43, i32* %i, align 4, !dbg !470
  br label %for.cond36, !dbg !471, !llvm.loop !472

for.end44:                                        ; preds = %for.cond36
  br label %if.end45, !dbg !474

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !475
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end44
  %25 = load i32*, i32** %buffer, align 8, !dbg !477
  %26 = bitcast i32* %25 to i8*, !dbg !477
  call void @free(i8* noundef %26), !dbg !478
  ret void, !dbg !479
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !480 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !481, metadata !DIExpression()), !dbg !482
  store i32 -1, i32* %data, align 4, !dbg !483
  store i32 7, i32* %data, align 4, !dbg !484
  call void @llvm.dbg.declare(metadata i32* %i, metadata !487, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !492, metadata !DIExpression()), !dbg !493
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !494
  %0 = bitcast i8* %call to i32*, !dbg !495
  store i32* %0, i32** %buffer, align 8, !dbg !493
  %1 = load i32*, i32** %buffer, align 8, !dbg !496
  %cmp = icmp eq i32* %1, null, !dbg !498
  br i1 %cmp, label %if.then, label %if.end, !dbg !499

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !500
  unreachable, !dbg !500

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !502
  br label %for.cond, !dbg !504

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !505
  %cmp1 = icmp slt i32 %2, 10, !dbg !507
  br i1 %cmp1, label %for.body, label %for.end, !dbg !508

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !509
  %4 = load i32, i32* %i, align 4, !dbg !511
  %idxprom = sext i32 %4 to i64, !dbg !509
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !509
  store i32 0, i32* %arrayidx, align 4, !dbg !512
  br label %for.inc, !dbg !513

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !514
  %inc = add nsw i32 %5, 1, !dbg !514
  store i32 %inc, i32* %i, align 4, !dbg !514
  br label %for.cond, !dbg !515, !llvm.loop !516

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !518
  %cmp2 = icmp sge i32 %6, 0, !dbg !520
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !521

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !522
  %8 = load i32, i32* %data, align 4, !dbg !524
  %idxprom4 = sext i32 %8 to i64, !dbg !522
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !522
  store i32 1, i32* %arrayidx5, align 4, !dbg !525
  store i32 0, i32* %i, align 4, !dbg !526
  br label %for.cond6, !dbg !528

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !529
  %cmp7 = icmp slt i32 %9, 10, !dbg !531
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !532

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !533
  %11 = load i32, i32* %i, align 4, !dbg !535
  %idxprom9 = sext i32 %11 to i64, !dbg !533
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !533
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !533
  call void @printIntLine(i32 noundef %12), !dbg !536
  br label %for.inc11, !dbg !537

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !538
  %inc12 = add nsw i32 %13, 1, !dbg !538
  store i32 %inc12, i32* %i, align 4, !dbg !538
  br label %for.cond6, !dbg !539, !llvm.loop !540

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !542

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !543
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !545
  %15 = bitcast i32* %14 to i8*, !dbg !545
  call void @free(i8* noundef %15), !dbg !546
  ret void, !dbg !547
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !548 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !549, metadata !DIExpression()), !dbg !550
  store i32 -1, i32* %data, align 4, !dbg !551
  store i32 7, i32* %data, align 4, !dbg !552
  call void @llvm.dbg.declare(metadata i32* %i, metadata !555, metadata !DIExpression()), !dbg !559
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !560, metadata !DIExpression()), !dbg !561
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !562
  %0 = bitcast i8* %call to i32*, !dbg !563
  store i32* %0, i32** %buffer, align 8, !dbg !561
  %1 = load i32*, i32** %buffer, align 8, !dbg !564
  %cmp = icmp eq i32* %1, null, !dbg !566
  br i1 %cmp, label %if.then, label %if.end, !dbg !567

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !568
  unreachable, !dbg !568

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !570
  br label %for.cond, !dbg !572

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !573
  %cmp1 = icmp slt i32 %2, 10, !dbg !575
  br i1 %cmp1, label %for.body, label %for.end, !dbg !576

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !577
  %4 = load i32, i32* %i, align 4, !dbg !579
  %idxprom = sext i32 %4 to i64, !dbg !577
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !577
  store i32 0, i32* %arrayidx, align 4, !dbg !580
  br label %for.inc, !dbg !581

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !582
  %inc = add nsw i32 %5, 1, !dbg !582
  store i32 %inc, i32* %i, align 4, !dbg !582
  br label %for.cond, !dbg !583, !llvm.loop !584

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !586
  %cmp2 = icmp sge i32 %6, 0, !dbg !588
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !589

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !590
  %8 = load i32, i32* %data, align 4, !dbg !592
  %idxprom4 = sext i32 %8 to i64, !dbg !590
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !590
  store i32 1, i32* %arrayidx5, align 4, !dbg !593
  store i32 0, i32* %i, align 4, !dbg !594
  br label %for.cond6, !dbg !596

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !597
  %cmp7 = icmp slt i32 %9, 10, !dbg !599
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !600

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !601
  %11 = load i32, i32* %i, align 4, !dbg !603
  %idxprom9 = sext i32 %11 to i64, !dbg !601
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !601
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !601
  call void @printIntLine(i32 noundef %12), !dbg !604
  br label %for.inc11, !dbg !605

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !606
  %inc12 = add nsw i32 %13, 1, !dbg !606
  store i32 %inc12, i32* %i, align 4, !dbg !606
  br label %for.cond6, !dbg !607, !llvm.loop !608

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !610

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !611
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !613
  %15 = bitcast i32* %14 to i8*, !dbg !613
  call void @free(i8* noundef %15), !dbg !614
  ret void, !dbg !615
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !21, !23, !24}
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
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"PIC Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Homebrew clang version 14.0.6"}
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02_bad", scope: !33, file: !33, line: 44, type: !34, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!33 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !{}
!37 = !DILocalVariable(name: "data", scope: !32, file: !33, line: 46, type: !22)
!38 = !DILocation(line: 46, column: 9, scope: !32)
!39 = !DILocation(line: 48, column: 10, scope: !32)
!40 = !DILocalVariable(name: "recvResult", scope: !41, file: !33, line: 56, type: !22)
!41 = distinct !DILexicalBlock(scope: !42, file: !33, line: 51, column: 9)
!42 = distinct !DILexicalBlock(scope: !43, file: !33, line: 50, column: 5)
!43 = distinct !DILexicalBlock(scope: !32, file: !33, line: 49, column: 8)
!44 = !DILocation(line: 56, column: 17, scope: !41)
!45 = !DILocalVariable(name: "service", scope: !41, file: !33, line: 57, type: !46)
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
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !24)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !46, file: !47, line: 380, baseType: !62, size: 64, offset: 64)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 8)
!65 = !DILocation(line: 57, column: 32, scope: !41)
!66 = !DILocalVariable(name: "connectSocket", scope: !41, file: !33, line: 58, type: !22)
!67 = !DILocation(line: 58, column: 20, scope: !41)
!68 = !DILocalVariable(name: "inputBuffer", scope: !41, file: !33, line: 59, type: !17)
!69 = !DILocation(line: 59, column: 18, scope: !41)
!70 = !DILocation(line: 60, column: 13, scope: !41)
!71 = !DILocation(line: 70, column: 33, scope: !72)
!72 = distinct !DILexicalBlock(scope: !41, file: !33, line: 61, column: 13)
!73 = !DILocation(line: 70, column: 31, scope: !72)
!74 = !DILocation(line: 71, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !33, line: 71, column: 21)
!76 = !DILocation(line: 71, column: 35, scope: !75)
!77 = !DILocation(line: 71, column: 21, scope: !72)
!78 = !DILocation(line: 73, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !33, line: 72, column: 17)
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
!90 = distinct !DILexicalBlock(scope: !72, file: !33, line: 79, column: 21)
!91 = !DILocation(line: 79, column: 44, scope: !90)
!92 = !DILocation(line: 79, column: 21, scope: !90)
!93 = !DILocation(line: 79, column: 89, scope: !90)
!94 = !DILocation(line: 79, column: 21, scope: !72)
!95 = !DILocation(line: 81, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !33, line: 80, column: 17)
!97 = !DILocation(line: 85, column: 35, scope: !72)
!98 = !DILocation(line: 85, column: 50, scope: !72)
!99 = !DILocation(line: 85, column: 30, scope: !72)
!100 = !DILocation(line: 85, column: 28, scope: !72)
!101 = !DILocation(line: 86, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !72, file: !33, line: 86, column: 21)
!103 = !DILocation(line: 86, column: 32, scope: !102)
!104 = !DILocation(line: 86, column: 48, scope: !102)
!105 = !DILocation(line: 86, column: 51, scope: !102)
!106 = !DILocation(line: 86, column: 62, scope: !102)
!107 = !DILocation(line: 86, column: 21, scope: !72)
!108 = !DILocation(line: 88, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !33, line: 87, column: 17)
!110 = !DILocation(line: 91, column: 29, scope: !72)
!111 = !DILocation(line: 91, column: 17, scope: !72)
!112 = !DILocation(line: 91, column: 41, scope: !72)
!113 = !DILocation(line: 93, column: 29, scope: !72)
!114 = !DILocation(line: 93, column: 24, scope: !72)
!115 = !DILocation(line: 93, column: 22, scope: !72)
!116 = !DILocation(line: 94, column: 13, scope: !72)
!117 = !DILocation(line: 96, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !41, file: !33, line: 96, column: 17)
!119 = !DILocation(line: 96, column: 31, scope: !118)
!120 = !DILocation(line: 96, column: 17, scope: !41)
!121 = !DILocation(line: 98, column: 30, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !33, line: 97, column: 13)
!123 = !DILocation(line: 98, column: 17, scope: !122)
!124 = !DILocation(line: 99, column: 13, scope: !122)
!125 = !DILocalVariable(name: "i", scope: !126, file: !33, line: 111, type: !22)
!126 = distinct !DILexicalBlock(scope: !127, file: !33, line: 110, column: 9)
!127 = distinct !DILexicalBlock(scope: !128, file: !33, line: 109, column: 5)
!128 = distinct !DILexicalBlock(scope: !32, file: !33, line: 108, column: 8)
!129 = !DILocation(line: 111, column: 17, scope: !126)
!130 = !DILocalVariable(name: "buffer", scope: !126, file: !33, line: 112, type: !21)
!131 = !DILocation(line: 112, column: 19, scope: !126)
!132 = !DILocation(line: 112, column: 35, scope: !126)
!133 = !DILocation(line: 112, column: 28, scope: !126)
!134 = !DILocation(line: 113, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !126, file: !33, line: 113, column: 17)
!136 = !DILocation(line: 113, column: 24, scope: !135)
!137 = !DILocation(line: 113, column: 17, scope: !126)
!138 = !DILocation(line: 113, column: 34, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !33, line: 113, column: 33)
!140 = !DILocation(line: 115, column: 20, scope: !141)
!141 = distinct !DILexicalBlock(scope: !126, file: !33, line: 115, column: 13)
!142 = !DILocation(line: 115, column: 18, scope: !141)
!143 = !DILocation(line: 115, column: 25, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !33, line: 115, column: 13)
!145 = !DILocation(line: 115, column: 27, scope: !144)
!146 = !DILocation(line: 115, column: 13, scope: !141)
!147 = !DILocation(line: 117, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !33, line: 116, column: 13)
!149 = !DILocation(line: 117, column: 24, scope: !148)
!150 = !DILocation(line: 117, column: 27, scope: !148)
!151 = !DILocation(line: 118, column: 13, scope: !148)
!152 = !DILocation(line: 115, column: 34, scope: !144)
!153 = !DILocation(line: 115, column: 13, scope: !144)
!154 = distinct !{!154, !146, !155, !156}
!155 = !DILocation(line: 118, column: 13, scope: !141)
!156 = !{!"llvm.loop.mustprogress"}
!157 = !DILocation(line: 121, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !126, file: !33, line: 121, column: 17)
!159 = !DILocation(line: 121, column: 22, scope: !158)
!160 = !DILocation(line: 121, column: 17, scope: !126)
!161 = !DILocation(line: 123, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !33, line: 122, column: 13)
!163 = !DILocation(line: 123, column: 24, scope: !162)
!164 = !DILocation(line: 123, column: 30, scope: !162)
!165 = !DILocation(line: 125, column: 23, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !33, line: 125, column: 17)
!167 = !DILocation(line: 125, column: 21, scope: !166)
!168 = !DILocation(line: 125, column: 28, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !33, line: 125, column: 17)
!170 = !DILocation(line: 125, column: 30, scope: !169)
!171 = !DILocation(line: 125, column: 17, scope: !166)
!172 = !DILocation(line: 127, column: 34, scope: !173)
!173 = distinct !DILexicalBlock(scope: !169, file: !33, line: 126, column: 17)
!174 = !DILocation(line: 127, column: 41, scope: !173)
!175 = !DILocation(line: 127, column: 21, scope: !173)
!176 = !DILocation(line: 128, column: 17, scope: !173)
!177 = !DILocation(line: 125, column: 37, scope: !169)
!178 = !DILocation(line: 125, column: 17, scope: !169)
!179 = distinct !{!179, !171, !180, !156}
!180 = !DILocation(line: 128, column: 17, scope: !166)
!181 = !DILocation(line: 129, column: 13, scope: !162)
!182 = !DILocation(line: 132, column: 17, scope: !183)
!183 = distinct !DILexicalBlock(scope: !158, file: !33, line: 131, column: 13)
!184 = !DILocation(line: 134, column: 18, scope: !126)
!185 = !DILocation(line: 134, column: 13, scope: !126)
!186 = !DILocation(line: 137, column: 1, scope: !32)
!187 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_02_good", scope: !33, file: !33, line: 429, type: !34, scopeLine: 430, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!188 = !DILocation(line: 431, column: 5, scope: !187)
!189 = !DILocation(line: 432, column: 5, scope: !187)
!190 = !DILocation(line: 433, column: 5, scope: !187)
!191 = !DILocation(line: 434, column: 5, scope: !187)
!192 = !DILocation(line: 435, column: 1, scope: !187)
!193 = distinct !DISubprogram(name: "main", scope: !33, file: !33, line: 446, type: !194, scopeLine: 447, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!194 = !DISubroutineType(types: !195)
!195 = !{!22, !22, !196}
!196 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!198 = !DILocalVariable(name: "argc", arg: 1, scope: !193, file: !33, line: 446, type: !22)
!199 = !DILocation(line: 446, column: 14, scope: !193)
!200 = !DILocalVariable(name: "argv", arg: 2, scope: !193, file: !33, line: 446, type: !196)
!201 = !DILocation(line: 446, column: 27, scope: !193)
!202 = !DILocation(line: 449, column: 22, scope: !193)
!203 = !DILocation(line: 449, column: 12, scope: !193)
!204 = !DILocation(line: 449, column: 5, scope: !193)
!205 = !DILocation(line: 451, column: 5, scope: !193)
!206 = !DILocation(line: 452, column: 5, scope: !193)
!207 = !DILocation(line: 453, column: 5, scope: !193)
!208 = !DILocation(line: 456, column: 5, scope: !193)
!209 = !DILocation(line: 457, column: 5, scope: !193)
!210 = !DILocation(line: 458, column: 5, scope: !193)
!211 = !DILocation(line: 460, column: 5, scope: !193)
!212 = distinct !DISubprogram(name: "goodB2G1", scope: !33, file: !33, line: 144, type: !34, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!213 = !DILocalVariable(name: "data", scope: !212, file: !33, line: 146, type: !22)
!214 = !DILocation(line: 146, column: 9, scope: !212)
!215 = !DILocation(line: 148, column: 10, scope: !212)
!216 = !DILocalVariable(name: "recvResult", scope: !217, file: !33, line: 156, type: !22)
!217 = distinct !DILexicalBlock(scope: !218, file: !33, line: 151, column: 9)
!218 = distinct !DILexicalBlock(scope: !219, file: !33, line: 150, column: 5)
!219 = distinct !DILexicalBlock(scope: !212, file: !33, line: 149, column: 8)
!220 = !DILocation(line: 156, column: 17, scope: !217)
!221 = !DILocalVariable(name: "service", scope: !217, file: !33, line: 157, type: !46)
!222 = !DILocation(line: 157, column: 32, scope: !217)
!223 = !DILocalVariable(name: "connectSocket", scope: !217, file: !33, line: 158, type: !22)
!224 = !DILocation(line: 158, column: 20, scope: !217)
!225 = !DILocalVariable(name: "inputBuffer", scope: !217, file: !33, line: 159, type: !17)
!226 = !DILocation(line: 159, column: 18, scope: !217)
!227 = !DILocation(line: 160, column: 13, scope: !217)
!228 = !DILocation(line: 170, column: 33, scope: !229)
!229 = distinct !DILexicalBlock(scope: !217, file: !33, line: 161, column: 13)
!230 = !DILocation(line: 170, column: 31, scope: !229)
!231 = !DILocation(line: 171, column: 21, scope: !232)
!232 = distinct !DILexicalBlock(scope: !229, file: !33, line: 171, column: 21)
!233 = !DILocation(line: 171, column: 35, scope: !232)
!234 = !DILocation(line: 171, column: 21, scope: !229)
!235 = !DILocation(line: 173, column: 21, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !33, line: 172, column: 17)
!237 = !DILocation(line: 175, column: 17, scope: !229)
!238 = !DILocation(line: 176, column: 25, scope: !229)
!239 = !DILocation(line: 176, column: 36, scope: !229)
!240 = !DILocation(line: 177, column: 43, scope: !229)
!241 = !DILocation(line: 177, column: 25, scope: !229)
!242 = !DILocation(line: 177, column: 34, scope: !229)
!243 = !DILocation(line: 177, column: 41, scope: !229)
!244 = !DILocation(line: 178, column: 25, scope: !229)
!245 = !DILocation(line: 178, column: 34, scope: !229)
!246 = !DILocation(line: 179, column: 29, scope: !247)
!247 = distinct !DILexicalBlock(scope: !229, file: !33, line: 179, column: 21)
!248 = !DILocation(line: 179, column: 44, scope: !247)
!249 = !DILocation(line: 179, column: 21, scope: !247)
!250 = !DILocation(line: 179, column: 89, scope: !247)
!251 = !DILocation(line: 179, column: 21, scope: !229)
!252 = !DILocation(line: 181, column: 21, scope: !253)
!253 = distinct !DILexicalBlock(scope: !247, file: !33, line: 180, column: 17)
!254 = !DILocation(line: 185, column: 35, scope: !229)
!255 = !DILocation(line: 185, column: 50, scope: !229)
!256 = !DILocation(line: 185, column: 30, scope: !229)
!257 = !DILocation(line: 185, column: 28, scope: !229)
!258 = !DILocation(line: 186, column: 21, scope: !259)
!259 = distinct !DILexicalBlock(scope: !229, file: !33, line: 186, column: 21)
!260 = !DILocation(line: 186, column: 32, scope: !259)
!261 = !DILocation(line: 186, column: 48, scope: !259)
!262 = !DILocation(line: 186, column: 51, scope: !259)
!263 = !DILocation(line: 186, column: 62, scope: !259)
!264 = !DILocation(line: 186, column: 21, scope: !229)
!265 = !DILocation(line: 188, column: 21, scope: !266)
!266 = distinct !DILexicalBlock(scope: !259, file: !33, line: 187, column: 17)
!267 = !DILocation(line: 191, column: 29, scope: !229)
!268 = !DILocation(line: 191, column: 17, scope: !229)
!269 = !DILocation(line: 191, column: 41, scope: !229)
!270 = !DILocation(line: 193, column: 29, scope: !229)
!271 = !DILocation(line: 193, column: 24, scope: !229)
!272 = !DILocation(line: 193, column: 22, scope: !229)
!273 = !DILocation(line: 194, column: 13, scope: !229)
!274 = !DILocation(line: 196, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !217, file: !33, line: 196, column: 17)
!276 = !DILocation(line: 196, column: 31, scope: !275)
!277 = !DILocation(line: 196, column: 17, scope: !217)
!278 = !DILocation(line: 198, column: 30, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !33, line: 197, column: 13)
!280 = !DILocation(line: 198, column: 17, scope: !279)
!281 = !DILocation(line: 199, column: 13, scope: !279)
!282 = !DILocalVariable(name: "i", scope: !283, file: !33, line: 216, type: !22)
!283 = distinct !DILexicalBlock(scope: !284, file: !33, line: 215, column: 9)
!284 = distinct !DILexicalBlock(scope: !285, file: !33, line: 214, column: 5)
!285 = distinct !DILexicalBlock(scope: !212, file: !33, line: 208, column: 8)
!286 = !DILocation(line: 216, column: 17, scope: !283)
!287 = !DILocalVariable(name: "buffer", scope: !283, file: !33, line: 217, type: !21)
!288 = !DILocation(line: 217, column: 19, scope: !283)
!289 = !DILocation(line: 217, column: 35, scope: !283)
!290 = !DILocation(line: 217, column: 28, scope: !283)
!291 = !DILocation(line: 218, column: 17, scope: !292)
!292 = distinct !DILexicalBlock(scope: !283, file: !33, line: 218, column: 17)
!293 = !DILocation(line: 218, column: 24, scope: !292)
!294 = !DILocation(line: 218, column: 17, scope: !283)
!295 = !DILocation(line: 218, column: 34, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !33, line: 218, column: 33)
!297 = !DILocation(line: 220, column: 20, scope: !298)
!298 = distinct !DILexicalBlock(scope: !283, file: !33, line: 220, column: 13)
!299 = !DILocation(line: 220, column: 18, scope: !298)
!300 = !DILocation(line: 220, column: 25, scope: !301)
!301 = distinct !DILexicalBlock(scope: !298, file: !33, line: 220, column: 13)
!302 = !DILocation(line: 220, column: 27, scope: !301)
!303 = !DILocation(line: 220, column: 13, scope: !298)
!304 = !DILocation(line: 222, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !33, line: 221, column: 13)
!306 = !DILocation(line: 222, column: 24, scope: !305)
!307 = !DILocation(line: 222, column: 27, scope: !305)
!308 = !DILocation(line: 223, column: 13, scope: !305)
!309 = !DILocation(line: 220, column: 34, scope: !301)
!310 = !DILocation(line: 220, column: 13, scope: !301)
!311 = distinct !{!311, !303, !312, !156}
!312 = !DILocation(line: 223, column: 13, scope: !298)
!313 = !DILocation(line: 225, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !283, file: !33, line: 225, column: 17)
!315 = !DILocation(line: 225, column: 22, scope: !314)
!316 = !DILocation(line: 225, column: 27, scope: !314)
!317 = !DILocation(line: 225, column: 30, scope: !314)
!318 = !DILocation(line: 225, column: 35, scope: !314)
!319 = !DILocation(line: 225, column: 17, scope: !283)
!320 = !DILocation(line: 227, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !314, file: !33, line: 226, column: 13)
!322 = !DILocation(line: 227, column: 24, scope: !321)
!323 = !DILocation(line: 227, column: 30, scope: !321)
!324 = !DILocation(line: 229, column: 23, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !33, line: 229, column: 17)
!326 = !DILocation(line: 229, column: 21, scope: !325)
!327 = !DILocation(line: 229, column: 28, scope: !328)
!328 = distinct !DILexicalBlock(scope: !325, file: !33, line: 229, column: 17)
!329 = !DILocation(line: 229, column: 30, scope: !328)
!330 = !DILocation(line: 229, column: 17, scope: !325)
!331 = !DILocation(line: 231, column: 34, scope: !332)
!332 = distinct !DILexicalBlock(scope: !328, file: !33, line: 230, column: 17)
!333 = !DILocation(line: 231, column: 41, scope: !332)
!334 = !DILocation(line: 231, column: 21, scope: !332)
!335 = !DILocation(line: 232, column: 17, scope: !332)
!336 = !DILocation(line: 229, column: 37, scope: !328)
!337 = !DILocation(line: 229, column: 17, scope: !328)
!338 = distinct !{!338, !330, !339, !156}
!339 = !DILocation(line: 232, column: 17, scope: !325)
!340 = !DILocation(line: 233, column: 13, scope: !321)
!341 = !DILocation(line: 236, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !314, file: !33, line: 235, column: 13)
!343 = !DILocation(line: 238, column: 18, scope: !283)
!344 = !DILocation(line: 238, column: 13, scope: !283)
!345 = !DILocation(line: 241, column: 1, scope: !212)
!346 = distinct !DISubprogram(name: "goodB2G2", scope: !33, file: !33, line: 244, type: !34, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!347 = !DILocalVariable(name: "data", scope: !346, file: !33, line: 246, type: !22)
!348 = !DILocation(line: 246, column: 9, scope: !346)
!349 = !DILocation(line: 248, column: 10, scope: !346)
!350 = !DILocalVariable(name: "recvResult", scope: !351, file: !33, line: 256, type: !22)
!351 = distinct !DILexicalBlock(scope: !352, file: !33, line: 251, column: 9)
!352 = distinct !DILexicalBlock(scope: !353, file: !33, line: 250, column: 5)
!353 = distinct !DILexicalBlock(scope: !346, file: !33, line: 249, column: 8)
!354 = !DILocation(line: 256, column: 17, scope: !351)
!355 = !DILocalVariable(name: "service", scope: !351, file: !33, line: 257, type: !46)
!356 = !DILocation(line: 257, column: 32, scope: !351)
!357 = !DILocalVariable(name: "connectSocket", scope: !351, file: !33, line: 258, type: !22)
!358 = !DILocation(line: 258, column: 20, scope: !351)
!359 = !DILocalVariable(name: "inputBuffer", scope: !351, file: !33, line: 259, type: !17)
!360 = !DILocation(line: 259, column: 18, scope: !351)
!361 = !DILocation(line: 260, column: 13, scope: !351)
!362 = !DILocation(line: 270, column: 33, scope: !363)
!363 = distinct !DILexicalBlock(scope: !351, file: !33, line: 261, column: 13)
!364 = !DILocation(line: 270, column: 31, scope: !363)
!365 = !DILocation(line: 271, column: 21, scope: !366)
!366 = distinct !DILexicalBlock(scope: !363, file: !33, line: 271, column: 21)
!367 = !DILocation(line: 271, column: 35, scope: !366)
!368 = !DILocation(line: 271, column: 21, scope: !363)
!369 = !DILocation(line: 273, column: 21, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !33, line: 272, column: 17)
!371 = !DILocation(line: 275, column: 17, scope: !363)
!372 = !DILocation(line: 276, column: 25, scope: !363)
!373 = !DILocation(line: 276, column: 36, scope: !363)
!374 = !DILocation(line: 277, column: 43, scope: !363)
!375 = !DILocation(line: 277, column: 25, scope: !363)
!376 = !DILocation(line: 277, column: 34, scope: !363)
!377 = !DILocation(line: 277, column: 41, scope: !363)
!378 = !DILocation(line: 278, column: 25, scope: !363)
!379 = !DILocation(line: 278, column: 34, scope: !363)
!380 = !DILocation(line: 279, column: 29, scope: !381)
!381 = distinct !DILexicalBlock(scope: !363, file: !33, line: 279, column: 21)
!382 = !DILocation(line: 279, column: 44, scope: !381)
!383 = !DILocation(line: 279, column: 21, scope: !381)
!384 = !DILocation(line: 279, column: 89, scope: !381)
!385 = !DILocation(line: 279, column: 21, scope: !363)
!386 = !DILocation(line: 281, column: 21, scope: !387)
!387 = distinct !DILexicalBlock(scope: !381, file: !33, line: 280, column: 17)
!388 = !DILocation(line: 285, column: 35, scope: !363)
!389 = !DILocation(line: 285, column: 50, scope: !363)
!390 = !DILocation(line: 285, column: 30, scope: !363)
!391 = !DILocation(line: 285, column: 28, scope: !363)
!392 = !DILocation(line: 286, column: 21, scope: !393)
!393 = distinct !DILexicalBlock(scope: !363, file: !33, line: 286, column: 21)
!394 = !DILocation(line: 286, column: 32, scope: !393)
!395 = !DILocation(line: 286, column: 48, scope: !393)
!396 = !DILocation(line: 286, column: 51, scope: !393)
!397 = !DILocation(line: 286, column: 62, scope: !393)
!398 = !DILocation(line: 286, column: 21, scope: !363)
!399 = !DILocation(line: 288, column: 21, scope: !400)
!400 = distinct !DILexicalBlock(scope: !393, file: !33, line: 287, column: 17)
!401 = !DILocation(line: 291, column: 29, scope: !363)
!402 = !DILocation(line: 291, column: 17, scope: !363)
!403 = !DILocation(line: 291, column: 41, scope: !363)
!404 = !DILocation(line: 293, column: 29, scope: !363)
!405 = !DILocation(line: 293, column: 24, scope: !363)
!406 = !DILocation(line: 293, column: 22, scope: !363)
!407 = !DILocation(line: 294, column: 13, scope: !363)
!408 = !DILocation(line: 296, column: 17, scope: !409)
!409 = distinct !DILexicalBlock(scope: !351, file: !33, line: 296, column: 17)
!410 = !DILocation(line: 296, column: 31, scope: !409)
!411 = !DILocation(line: 296, column: 17, scope: !351)
!412 = !DILocation(line: 298, column: 30, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !33, line: 297, column: 13)
!414 = !DILocation(line: 298, column: 17, scope: !413)
!415 = !DILocation(line: 299, column: 13, scope: !413)
!416 = !DILocalVariable(name: "i", scope: !417, file: !33, line: 311, type: !22)
!417 = distinct !DILexicalBlock(scope: !418, file: !33, line: 310, column: 9)
!418 = distinct !DILexicalBlock(scope: !419, file: !33, line: 309, column: 5)
!419 = distinct !DILexicalBlock(scope: !346, file: !33, line: 308, column: 8)
!420 = !DILocation(line: 311, column: 17, scope: !417)
!421 = !DILocalVariable(name: "buffer", scope: !417, file: !33, line: 312, type: !21)
!422 = !DILocation(line: 312, column: 19, scope: !417)
!423 = !DILocation(line: 312, column: 35, scope: !417)
!424 = !DILocation(line: 312, column: 28, scope: !417)
!425 = !DILocation(line: 313, column: 17, scope: !426)
!426 = distinct !DILexicalBlock(scope: !417, file: !33, line: 313, column: 17)
!427 = !DILocation(line: 313, column: 24, scope: !426)
!428 = !DILocation(line: 313, column: 17, scope: !417)
!429 = !DILocation(line: 313, column: 34, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !33, line: 313, column: 33)
!431 = !DILocation(line: 315, column: 20, scope: !432)
!432 = distinct !DILexicalBlock(scope: !417, file: !33, line: 315, column: 13)
!433 = !DILocation(line: 315, column: 18, scope: !432)
!434 = !DILocation(line: 315, column: 25, scope: !435)
!435 = distinct !DILexicalBlock(scope: !432, file: !33, line: 315, column: 13)
!436 = !DILocation(line: 315, column: 27, scope: !435)
!437 = !DILocation(line: 315, column: 13, scope: !432)
!438 = !DILocation(line: 317, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !33, line: 316, column: 13)
!440 = !DILocation(line: 317, column: 24, scope: !439)
!441 = !DILocation(line: 317, column: 27, scope: !439)
!442 = !DILocation(line: 318, column: 13, scope: !439)
!443 = !DILocation(line: 315, column: 34, scope: !435)
!444 = !DILocation(line: 315, column: 13, scope: !435)
!445 = distinct !{!445, !437, !446, !156}
!446 = !DILocation(line: 318, column: 13, scope: !432)
!447 = !DILocation(line: 320, column: 17, scope: !448)
!448 = distinct !DILexicalBlock(scope: !417, file: !33, line: 320, column: 17)
!449 = !DILocation(line: 320, column: 22, scope: !448)
!450 = !DILocation(line: 320, column: 27, scope: !448)
!451 = !DILocation(line: 320, column: 30, scope: !448)
!452 = !DILocation(line: 320, column: 35, scope: !448)
!453 = !DILocation(line: 320, column: 17, scope: !417)
!454 = !DILocation(line: 322, column: 17, scope: !455)
!455 = distinct !DILexicalBlock(scope: !448, file: !33, line: 321, column: 13)
!456 = !DILocation(line: 322, column: 24, scope: !455)
!457 = !DILocation(line: 322, column: 30, scope: !455)
!458 = !DILocation(line: 324, column: 23, scope: !459)
!459 = distinct !DILexicalBlock(scope: !455, file: !33, line: 324, column: 17)
!460 = !DILocation(line: 324, column: 21, scope: !459)
!461 = !DILocation(line: 324, column: 28, scope: !462)
!462 = distinct !DILexicalBlock(scope: !459, file: !33, line: 324, column: 17)
!463 = !DILocation(line: 324, column: 30, scope: !462)
!464 = !DILocation(line: 324, column: 17, scope: !459)
!465 = !DILocation(line: 326, column: 34, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !33, line: 325, column: 17)
!467 = !DILocation(line: 326, column: 41, scope: !466)
!468 = !DILocation(line: 326, column: 21, scope: !466)
!469 = !DILocation(line: 327, column: 17, scope: !466)
!470 = !DILocation(line: 324, column: 37, scope: !462)
!471 = !DILocation(line: 324, column: 17, scope: !462)
!472 = distinct !{!472, !464, !473, !156}
!473 = !DILocation(line: 327, column: 17, scope: !459)
!474 = !DILocation(line: 328, column: 13, scope: !455)
!475 = !DILocation(line: 331, column: 17, scope: !476)
!476 = distinct !DILexicalBlock(scope: !448, file: !33, line: 330, column: 13)
!477 = !DILocation(line: 333, column: 18, scope: !417)
!478 = !DILocation(line: 333, column: 13, scope: !417)
!479 = !DILocation(line: 336, column: 1, scope: !346)
!480 = distinct !DISubprogram(name: "goodG2B1", scope: !33, file: !33, line: 339, type: !34, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!481 = !DILocalVariable(name: "data", scope: !480, file: !33, line: 341, type: !22)
!482 = !DILocation(line: 341, column: 9, scope: !480)
!483 = !DILocation(line: 343, column: 10, scope: !480)
!484 = !DILocation(line: 353, column: 14, scope: !485)
!485 = distinct !DILexicalBlock(scope: !486, file: !33, line: 350, column: 5)
!486 = distinct !DILexicalBlock(scope: !480, file: !33, line: 344, column: 8)
!487 = !DILocalVariable(name: "i", scope: !488, file: !33, line: 358, type: !22)
!488 = distinct !DILexicalBlock(scope: !489, file: !33, line: 357, column: 9)
!489 = distinct !DILexicalBlock(scope: !490, file: !33, line: 356, column: 5)
!490 = distinct !DILexicalBlock(scope: !480, file: !33, line: 355, column: 8)
!491 = !DILocation(line: 358, column: 17, scope: !488)
!492 = !DILocalVariable(name: "buffer", scope: !488, file: !33, line: 359, type: !21)
!493 = !DILocation(line: 359, column: 19, scope: !488)
!494 = !DILocation(line: 359, column: 35, scope: !488)
!495 = !DILocation(line: 359, column: 28, scope: !488)
!496 = !DILocation(line: 360, column: 17, scope: !497)
!497 = distinct !DILexicalBlock(scope: !488, file: !33, line: 360, column: 17)
!498 = !DILocation(line: 360, column: 24, scope: !497)
!499 = !DILocation(line: 360, column: 17, scope: !488)
!500 = !DILocation(line: 360, column: 34, scope: !501)
!501 = distinct !DILexicalBlock(scope: !497, file: !33, line: 360, column: 33)
!502 = !DILocation(line: 362, column: 20, scope: !503)
!503 = distinct !DILexicalBlock(scope: !488, file: !33, line: 362, column: 13)
!504 = !DILocation(line: 362, column: 18, scope: !503)
!505 = !DILocation(line: 362, column: 25, scope: !506)
!506 = distinct !DILexicalBlock(scope: !503, file: !33, line: 362, column: 13)
!507 = !DILocation(line: 362, column: 27, scope: !506)
!508 = !DILocation(line: 362, column: 13, scope: !503)
!509 = !DILocation(line: 364, column: 17, scope: !510)
!510 = distinct !DILexicalBlock(scope: !506, file: !33, line: 363, column: 13)
!511 = !DILocation(line: 364, column: 24, scope: !510)
!512 = !DILocation(line: 364, column: 27, scope: !510)
!513 = !DILocation(line: 365, column: 13, scope: !510)
!514 = !DILocation(line: 362, column: 34, scope: !506)
!515 = !DILocation(line: 362, column: 13, scope: !506)
!516 = distinct !{!516, !508, !517, !156}
!517 = !DILocation(line: 365, column: 13, scope: !503)
!518 = !DILocation(line: 368, column: 17, scope: !519)
!519 = distinct !DILexicalBlock(scope: !488, file: !33, line: 368, column: 17)
!520 = !DILocation(line: 368, column: 22, scope: !519)
!521 = !DILocation(line: 368, column: 17, scope: !488)
!522 = !DILocation(line: 370, column: 17, scope: !523)
!523 = distinct !DILexicalBlock(scope: !519, file: !33, line: 369, column: 13)
!524 = !DILocation(line: 370, column: 24, scope: !523)
!525 = !DILocation(line: 370, column: 30, scope: !523)
!526 = !DILocation(line: 372, column: 23, scope: !527)
!527 = distinct !DILexicalBlock(scope: !523, file: !33, line: 372, column: 17)
!528 = !DILocation(line: 372, column: 21, scope: !527)
!529 = !DILocation(line: 372, column: 28, scope: !530)
!530 = distinct !DILexicalBlock(scope: !527, file: !33, line: 372, column: 17)
!531 = !DILocation(line: 372, column: 30, scope: !530)
!532 = !DILocation(line: 372, column: 17, scope: !527)
!533 = !DILocation(line: 374, column: 34, scope: !534)
!534 = distinct !DILexicalBlock(scope: !530, file: !33, line: 373, column: 17)
!535 = !DILocation(line: 374, column: 41, scope: !534)
!536 = !DILocation(line: 374, column: 21, scope: !534)
!537 = !DILocation(line: 375, column: 17, scope: !534)
!538 = !DILocation(line: 372, column: 37, scope: !530)
!539 = !DILocation(line: 372, column: 17, scope: !530)
!540 = distinct !{!540, !532, !541, !156}
!541 = !DILocation(line: 375, column: 17, scope: !527)
!542 = !DILocation(line: 376, column: 13, scope: !523)
!543 = !DILocation(line: 379, column: 17, scope: !544)
!544 = distinct !DILexicalBlock(scope: !519, file: !33, line: 378, column: 13)
!545 = !DILocation(line: 381, column: 18, scope: !488)
!546 = !DILocation(line: 381, column: 13, scope: !488)
!547 = !DILocation(line: 384, column: 1, scope: !480)
!548 = distinct !DISubprogram(name: "goodG2B2", scope: !33, file: !33, line: 387, type: !34, scopeLine: 388, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!549 = !DILocalVariable(name: "data", scope: !548, file: !33, line: 389, type: !22)
!550 = !DILocation(line: 389, column: 9, scope: !548)
!551 = !DILocation(line: 391, column: 10, scope: !548)
!552 = !DILocation(line: 396, column: 14, scope: !553)
!553 = distinct !DILexicalBlock(scope: !554, file: !33, line: 393, column: 5)
!554 = distinct !DILexicalBlock(scope: !548, file: !33, line: 392, column: 8)
!555 = !DILocalVariable(name: "i", scope: !556, file: !33, line: 401, type: !22)
!556 = distinct !DILexicalBlock(scope: !557, file: !33, line: 400, column: 9)
!557 = distinct !DILexicalBlock(scope: !558, file: !33, line: 399, column: 5)
!558 = distinct !DILexicalBlock(scope: !548, file: !33, line: 398, column: 8)
!559 = !DILocation(line: 401, column: 17, scope: !556)
!560 = !DILocalVariable(name: "buffer", scope: !556, file: !33, line: 402, type: !21)
!561 = !DILocation(line: 402, column: 19, scope: !556)
!562 = !DILocation(line: 402, column: 35, scope: !556)
!563 = !DILocation(line: 402, column: 28, scope: !556)
!564 = !DILocation(line: 403, column: 17, scope: !565)
!565 = distinct !DILexicalBlock(scope: !556, file: !33, line: 403, column: 17)
!566 = !DILocation(line: 403, column: 24, scope: !565)
!567 = !DILocation(line: 403, column: 17, scope: !556)
!568 = !DILocation(line: 403, column: 34, scope: !569)
!569 = distinct !DILexicalBlock(scope: !565, file: !33, line: 403, column: 33)
!570 = !DILocation(line: 405, column: 20, scope: !571)
!571 = distinct !DILexicalBlock(scope: !556, file: !33, line: 405, column: 13)
!572 = !DILocation(line: 405, column: 18, scope: !571)
!573 = !DILocation(line: 405, column: 25, scope: !574)
!574 = distinct !DILexicalBlock(scope: !571, file: !33, line: 405, column: 13)
!575 = !DILocation(line: 405, column: 27, scope: !574)
!576 = !DILocation(line: 405, column: 13, scope: !571)
!577 = !DILocation(line: 407, column: 17, scope: !578)
!578 = distinct !DILexicalBlock(scope: !574, file: !33, line: 406, column: 13)
!579 = !DILocation(line: 407, column: 24, scope: !578)
!580 = !DILocation(line: 407, column: 27, scope: !578)
!581 = !DILocation(line: 408, column: 13, scope: !578)
!582 = !DILocation(line: 405, column: 34, scope: !574)
!583 = !DILocation(line: 405, column: 13, scope: !574)
!584 = distinct !{!584, !576, !585, !156}
!585 = !DILocation(line: 408, column: 13, scope: !571)
!586 = !DILocation(line: 411, column: 17, scope: !587)
!587 = distinct !DILexicalBlock(scope: !556, file: !33, line: 411, column: 17)
!588 = !DILocation(line: 411, column: 22, scope: !587)
!589 = !DILocation(line: 411, column: 17, scope: !556)
!590 = !DILocation(line: 413, column: 17, scope: !591)
!591 = distinct !DILexicalBlock(scope: !587, file: !33, line: 412, column: 13)
!592 = !DILocation(line: 413, column: 24, scope: !591)
!593 = !DILocation(line: 413, column: 30, scope: !591)
!594 = !DILocation(line: 415, column: 23, scope: !595)
!595 = distinct !DILexicalBlock(scope: !591, file: !33, line: 415, column: 17)
!596 = !DILocation(line: 415, column: 21, scope: !595)
!597 = !DILocation(line: 415, column: 28, scope: !598)
!598 = distinct !DILexicalBlock(scope: !595, file: !33, line: 415, column: 17)
!599 = !DILocation(line: 415, column: 30, scope: !598)
!600 = !DILocation(line: 415, column: 17, scope: !595)
!601 = !DILocation(line: 417, column: 34, scope: !602)
!602 = distinct !DILexicalBlock(scope: !598, file: !33, line: 416, column: 17)
!603 = !DILocation(line: 417, column: 41, scope: !602)
!604 = !DILocation(line: 417, column: 21, scope: !602)
!605 = !DILocation(line: 418, column: 17, scope: !602)
!606 = !DILocation(line: 415, column: 37, scope: !598)
!607 = !DILocation(line: 415, column: 17, scope: !598)
!608 = distinct !{!608, !600, !609, !156}
!609 = !DILocation(line: 418, column: 17, scope: !595)
!610 = !DILocation(line: 419, column: 13, scope: !591)
!611 = !DILocation(line: 422, column: 17, scope: !612)
!612 = distinct !DILexicalBlock(scope: !587, file: !33, line: 421, column: 13)
!613 = !DILocation(line: 424, column: 18, scope: !556)
!614 = !DILocation(line: 424, column: 13, scope: !556)
!615 = !DILocation(line: 427, column: 1, scope: !548)
