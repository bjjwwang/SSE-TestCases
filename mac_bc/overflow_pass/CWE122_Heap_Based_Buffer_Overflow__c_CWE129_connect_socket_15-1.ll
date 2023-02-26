; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_bad() #0 !dbg !32 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !43, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !64, metadata !DIExpression()), !dbg !65
  store i32 -1, i32* %connectSocket, align 4, !dbg !65
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  br label %do.body, !dbg !68

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !69
  store i32 %call, i32* %connectSocket, align 4, !dbg !71
  %0 = load i32, i32* %connectSocket, align 4, !dbg !72
  %cmp = icmp eq i32 %0, -1, !dbg !74
  br i1 %cmp, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !76

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !78
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !79
  store i8 2, i8* %sin_family, align 1, !dbg !80
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !81
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !82
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !83
  store i32 %call1, i32* %s_addr, align 4, !dbg !84
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !85
  store i16 -30871, i16* %sin_port, align 2, !dbg !86
  %2 = load i32, i32* %connectSocket, align 4, !dbg !87
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !89
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !90
  %cmp3 = icmp eq i32 %call2, -1, !dbg !91
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !92

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !93

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !95
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !97
  %conv = trunc i64 %call6 to i32, !dbg !97
  store i32 %conv, i32* %recvResult, align 4, !dbg !98
  %5 = load i32, i32* %recvResult, align 4, !dbg !99
  %cmp7 = icmp eq i32 %5, -1, !dbg !101
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !102

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !103
  %cmp9 = icmp eq i32 %6, 0, !dbg !104
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !105

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !106

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !108
  %idxprom = sext i32 %7 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !111
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !112
  store i32 %call14, i32* %data, align 4, !dbg !113
  br label %do.end, !dbg !114

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !115
  %cmp15 = icmp ne i32 %8, -1, !dbg !117
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !118

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !119
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !121
  br label %if.end19, !dbg !122

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !126, metadata !DIExpression()), !dbg !127
  %call20 = call i8* @malloc(i64 noundef 40) #6, !dbg !128
  %10 = bitcast i8* %call20 to i32*, !dbg !129
  store i32* %10, i32** %buffer, align 8, !dbg !127
  %11 = load i32*, i32** %buffer, align 8, !dbg !130
  %cmp21 = icmp eq i32* %11, null, !dbg !132
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !133

if.then23:                                        ; preds = %if.end19
  call void @exit(i32 noundef -1) #7, !dbg !134
  unreachable, !dbg !134

if.end24:                                         ; preds = %if.end19
  store i32 0, i32* %i, align 4, !dbg !136
  br label %for.cond, !dbg !138

for.cond:                                         ; preds = %for.inc, %if.end24
  %12 = load i32, i32* %i, align 4, !dbg !139
  %cmp25 = icmp slt i32 %12, 10, !dbg !141
  br i1 %cmp25, label %for.body, label %for.end, !dbg !142

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !143
  %14 = load i32, i32* %i, align 4, !dbg !145
  %idxprom27 = sext i32 %14 to i64, !dbg !143
  %arrayidx28 = getelementptr inbounds i32, i32* %13, i64 %idxprom27, !dbg !143
  store i32 0, i32* %arrayidx28, align 4, !dbg !146
  br label %for.inc, !dbg !147

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !148
  %inc = add nsw i32 %15, 1, !dbg !148
  store i32 %inc, i32* %i, align 4, !dbg !148
  br label %for.cond, !dbg !149, !llvm.loop !150

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !153
  %cmp29 = icmp sge i32 %16, 0, !dbg !155
  br i1 %cmp29, label %if.then31, label %if.else, !dbg !156

if.then31:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !157
  %18 = load i32, i32* %data, align 4, !dbg !159
  %idxprom32 = sext i32 %18 to i64, !dbg !157
  %arrayidx33 = getelementptr inbounds i32, i32* %17, i64 %idxprom32, !dbg !157
  store i32 1, i32* %arrayidx33, align 4, !dbg !160
  store i32 0, i32* %i, align 4, !dbg !161
  br label %for.cond34, !dbg !163

for.cond34:                                       ; preds = %for.inc40, %if.then31
  %19 = load i32, i32* %i, align 4, !dbg !164
  %cmp35 = icmp slt i32 %19, 10, !dbg !166
  br i1 %cmp35, label %for.body37, label %for.end42, !dbg !167

for.body37:                                       ; preds = %for.cond34
  %20 = load i32*, i32** %buffer, align 8, !dbg !168
  %21 = load i32, i32* %i, align 4, !dbg !170
  %idxprom38 = sext i32 %21 to i64, !dbg !168
  %arrayidx39 = getelementptr inbounds i32, i32* %20, i64 %idxprom38, !dbg !168
  %22 = load i32, i32* %arrayidx39, align 4, !dbg !168
  call void @printIntLine(i32 noundef %22), !dbg !171
  br label %for.inc40, !dbg !172

for.inc40:                                        ; preds = %for.body37
  %23 = load i32, i32* %i, align 4, !dbg !173
  %inc41 = add nsw i32 %23, 1, !dbg !173
  store i32 %inc41, i32* %i, align 4, !dbg !173
  br label %for.cond34, !dbg !174, !llvm.loop !175

for.end42:                                        ; preds = %for.cond34
  br label %if.end43, !dbg !177

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !178
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end42
  %24 = load i32*, i32** %buffer, align 8, !dbg !180
  %25 = bitcast i32* %24 to i8*, !dbg !180
  call void @free(i8* noundef %25), !dbg !181
  ret void, !dbg !182
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_good() #0 !dbg !183 {
entry:
  call void @goodB2G1(), !dbg !184
  call void @goodB2G2(), !dbg !185
  call void @goodG2B1(), !dbg !186
  call void @goodG2B2(), !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !189 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !194, metadata !DIExpression()), !dbg !195
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !196, metadata !DIExpression()), !dbg !197
  %call = call i64 @time(i64* noundef null), !dbg !198
  %conv = trunc i64 %call to i32, !dbg !199
  call void @srand(i32 noundef %conv), !dbg !200
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !201
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_good(), !dbg !202
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !203
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !204
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_bad(), !dbg !205
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !206
  ret i32 0, !dbg !207
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !208 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !209, metadata !DIExpression()), !dbg !210
  store i32 -1, i32* %data, align 4, !dbg !211
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !212, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !215, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 -1, i32* %connectSocket, align 4, !dbg !218
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !219, metadata !DIExpression()), !dbg !220
  br label %do.body, !dbg !221

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !222
  store i32 %call, i32* %connectSocket, align 4, !dbg !224
  %0 = load i32, i32* %connectSocket, align 4, !dbg !225
  %cmp = icmp eq i32 %0, -1, !dbg !227
  br i1 %cmp, label %if.then, label %if.end, !dbg !228

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !229

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !231
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !231
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !232
  store i8 2, i8* %sin_family, align 1, !dbg !233
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !234
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !235
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !236
  store i32 %call1, i32* %s_addr, align 4, !dbg !237
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !238
  store i16 -30871, i16* %sin_port, align 2, !dbg !239
  %2 = load i32, i32* %connectSocket, align 4, !dbg !240
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !242
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !243
  %cmp3 = icmp eq i32 %call2, -1, !dbg !244
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !245

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !246

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !248
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !249
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !250
  %conv = trunc i64 %call6 to i32, !dbg !250
  store i32 %conv, i32* %recvResult, align 4, !dbg !251
  %5 = load i32, i32* %recvResult, align 4, !dbg !252
  %cmp7 = icmp eq i32 %5, -1, !dbg !254
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !255

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !256
  %cmp9 = icmp eq i32 %6, 0, !dbg !257
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !258

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !259

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !261
  %idxprom = sext i32 %7 to i64, !dbg !262
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !262
  store i8 0, i8* %arrayidx, align 1, !dbg !263
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !264
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !265
  store i32 %call14, i32* %data, align 4, !dbg !266
  br label %do.end, !dbg !267

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !268
  %cmp15 = icmp ne i32 %8, -1, !dbg !270
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !271

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !272
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !274
  br label %if.end19, !dbg !275

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !276, metadata !DIExpression()), !dbg !278
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !279, metadata !DIExpression()), !dbg !280
  %call20 = call i8* @malloc(i64 noundef 40) #6, !dbg !281
  %10 = bitcast i8* %call20 to i32*, !dbg !282
  store i32* %10, i32** %buffer, align 8, !dbg !280
  %11 = load i32*, i32** %buffer, align 8, !dbg !283
  %cmp21 = icmp eq i32* %11, null, !dbg !285
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !286

if.then23:                                        ; preds = %if.end19
  call void @exit(i32 noundef -1) #7, !dbg !287
  unreachable, !dbg !287

if.end24:                                         ; preds = %if.end19
  store i32 0, i32* %i, align 4, !dbg !289
  br label %for.cond, !dbg !291

for.cond:                                         ; preds = %for.inc, %if.end24
  %12 = load i32, i32* %i, align 4, !dbg !292
  %cmp25 = icmp slt i32 %12, 10, !dbg !294
  br i1 %cmp25, label %for.body, label %for.end, !dbg !295

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !296
  %14 = load i32, i32* %i, align 4, !dbg !298
  %idxprom27 = sext i32 %14 to i64, !dbg !296
  %arrayidx28 = getelementptr inbounds i32, i32* %13, i64 %idxprom27, !dbg !296
  store i32 0, i32* %arrayidx28, align 4, !dbg !299
  br label %for.inc, !dbg !300

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !301
  %inc = add nsw i32 %15, 1, !dbg !301
  store i32 %inc, i32* %i, align 4, !dbg !301
  br label %for.cond, !dbg !302, !llvm.loop !303

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !305
  %cmp29 = icmp sge i32 %16, 0, !dbg !307
  br i1 %cmp29, label %land.lhs.true, label %if.else, !dbg !308

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !309
  %cmp31 = icmp slt i32 %17, 10, !dbg !310
  br i1 %cmp31, label %if.then33, label %if.else, !dbg !311

if.then33:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !312
  %19 = load i32, i32* %data, align 4, !dbg !314
  %idxprom34 = sext i32 %19 to i64, !dbg !312
  %arrayidx35 = getelementptr inbounds i32, i32* %18, i64 %idxprom34, !dbg !312
  store i32 1, i32* %arrayidx35, align 4, !dbg !315
  store i32 0, i32* %i, align 4, !dbg !316
  br label %for.cond36, !dbg !318

for.cond36:                                       ; preds = %for.inc42, %if.then33
  %20 = load i32, i32* %i, align 4, !dbg !319
  %cmp37 = icmp slt i32 %20, 10, !dbg !321
  br i1 %cmp37, label %for.body39, label %for.end44, !dbg !322

for.body39:                                       ; preds = %for.cond36
  %21 = load i32*, i32** %buffer, align 8, !dbg !323
  %22 = load i32, i32* %i, align 4, !dbg !325
  %idxprom40 = sext i32 %22 to i64, !dbg !323
  %arrayidx41 = getelementptr inbounds i32, i32* %21, i64 %idxprom40, !dbg !323
  %23 = load i32, i32* %arrayidx41, align 4, !dbg !323
  call void @printIntLine(i32 noundef %23), !dbg !326
  br label %for.inc42, !dbg !327

for.inc42:                                        ; preds = %for.body39
  %24 = load i32, i32* %i, align 4, !dbg !328
  %inc43 = add nsw i32 %24, 1, !dbg !328
  store i32 %inc43, i32* %i, align 4, !dbg !328
  br label %for.cond36, !dbg !329, !llvm.loop !330

for.end44:                                        ; preds = %for.cond36
  br label %if.end45, !dbg !332

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !333
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end44
  %25 = load i32*, i32** %buffer, align 8, !dbg !335
  %26 = bitcast i32* %25 to i8*, !dbg !335
  call void @free(i8* noundef %26), !dbg !336
  ret void, !dbg !337
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !338 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !339, metadata !DIExpression()), !dbg !340
  store i32 -1, i32* %data, align 4, !dbg !341
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !342, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !347, metadata !DIExpression()), !dbg !348
  store i32 -1, i32* %connectSocket, align 4, !dbg !348
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !349, metadata !DIExpression()), !dbg !350
  br label %do.body, !dbg !351

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !352
  store i32 %call, i32* %connectSocket, align 4, !dbg !354
  %0 = load i32, i32* %connectSocket, align 4, !dbg !355
  %cmp = icmp eq i32 %0, -1, !dbg !357
  br i1 %cmp, label %if.then, label %if.end, !dbg !358

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !359

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !361
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !361
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !362
  store i8 2, i8* %sin_family, align 1, !dbg !363
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !364
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !365
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !366
  store i32 %call1, i32* %s_addr, align 4, !dbg !367
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !368
  store i16 -30871, i16* %sin_port, align 2, !dbg !369
  %2 = load i32, i32* %connectSocket, align 4, !dbg !370
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !372
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !373
  %cmp3 = icmp eq i32 %call2, -1, !dbg !374
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !375

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !376

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !378
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !379
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !380
  %conv = trunc i64 %call6 to i32, !dbg !380
  store i32 %conv, i32* %recvResult, align 4, !dbg !381
  %5 = load i32, i32* %recvResult, align 4, !dbg !382
  %cmp7 = icmp eq i32 %5, -1, !dbg !384
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !385

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !386
  %cmp9 = icmp eq i32 %6, 0, !dbg !387
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !388

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !389

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !391
  %idxprom = sext i32 %7 to i64, !dbg !392
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !392
  store i8 0, i8* %arrayidx, align 1, !dbg !393
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !394
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !395
  store i32 %call14, i32* %data, align 4, !dbg !396
  br label %do.end, !dbg !397

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !398
  %cmp15 = icmp ne i32 %8, -1, !dbg !400
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !401

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !402
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !404
  br label %if.end19, !dbg !405

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !406, metadata !DIExpression()), !dbg !408
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !409, metadata !DIExpression()), !dbg !410
  %call20 = call i8* @malloc(i64 noundef 40) #6, !dbg !411
  %10 = bitcast i8* %call20 to i32*, !dbg !412
  store i32* %10, i32** %buffer, align 8, !dbg !410
  %11 = load i32*, i32** %buffer, align 8, !dbg !413
  %cmp21 = icmp eq i32* %11, null, !dbg !415
  br i1 %cmp21, label %if.then23, label %if.end24, !dbg !416

if.then23:                                        ; preds = %if.end19
  call void @exit(i32 noundef -1) #7, !dbg !417
  unreachable, !dbg !417

if.end24:                                         ; preds = %if.end19
  store i32 0, i32* %i, align 4, !dbg !419
  br label %for.cond, !dbg !421

for.cond:                                         ; preds = %for.inc, %if.end24
  %12 = load i32, i32* %i, align 4, !dbg !422
  %cmp25 = icmp slt i32 %12, 10, !dbg !424
  br i1 %cmp25, label %for.body, label %for.end, !dbg !425

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !426
  %14 = load i32, i32* %i, align 4, !dbg !428
  %idxprom27 = sext i32 %14 to i64, !dbg !426
  %arrayidx28 = getelementptr inbounds i32, i32* %13, i64 %idxprom27, !dbg !426
  store i32 0, i32* %arrayidx28, align 4, !dbg !429
  br label %for.inc, !dbg !430

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !431
  %inc = add nsw i32 %15, 1, !dbg !431
  store i32 %inc, i32* %i, align 4, !dbg !431
  br label %for.cond, !dbg !432, !llvm.loop !433

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !435
  %cmp29 = icmp sge i32 %16, 0, !dbg !437
  br i1 %cmp29, label %land.lhs.true, label %if.else, !dbg !438

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !439
  %cmp31 = icmp slt i32 %17, 10, !dbg !440
  br i1 %cmp31, label %if.then33, label %if.else, !dbg !441

if.then33:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !442
  %19 = load i32, i32* %data, align 4, !dbg !444
  %idxprom34 = sext i32 %19 to i64, !dbg !442
  %arrayidx35 = getelementptr inbounds i32, i32* %18, i64 %idxprom34, !dbg !442
  store i32 1, i32* %arrayidx35, align 4, !dbg !445
  store i32 0, i32* %i, align 4, !dbg !446
  br label %for.cond36, !dbg !448

for.cond36:                                       ; preds = %for.inc42, %if.then33
  %20 = load i32, i32* %i, align 4, !dbg !449
  %cmp37 = icmp slt i32 %20, 10, !dbg !451
  br i1 %cmp37, label %for.body39, label %for.end44, !dbg !452

for.body39:                                       ; preds = %for.cond36
  %21 = load i32*, i32** %buffer, align 8, !dbg !453
  %22 = load i32, i32* %i, align 4, !dbg !455
  %idxprom40 = sext i32 %22 to i64, !dbg !453
  %arrayidx41 = getelementptr inbounds i32, i32* %21, i64 %idxprom40, !dbg !453
  %23 = load i32, i32* %arrayidx41, align 4, !dbg !453
  call void @printIntLine(i32 noundef %23), !dbg !456
  br label %for.inc42, !dbg !457

for.inc42:                                        ; preds = %for.body39
  %24 = load i32, i32* %i, align 4, !dbg !458
  %inc43 = add nsw i32 %24, 1, !dbg !458
  store i32 %inc43, i32* %i, align 4, !dbg !458
  br label %for.cond36, !dbg !459, !llvm.loop !460

for.end44:                                        ; preds = %for.cond36
  br label %if.end45, !dbg !462

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !463
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end44
  %25 = load i32*, i32** %buffer, align 8, !dbg !465
  %26 = bitcast i32* %25 to i8*, !dbg !465
  call void @free(i8* noundef %26), !dbg !466
  ret void, !dbg !467
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !468 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !469, metadata !DIExpression()), !dbg !470
  store i32 -1, i32* %data, align 4, !dbg !471
  store i32 7, i32* %data, align 4, !dbg !472
  call void @llvm.dbg.declare(metadata i32* %i, metadata !473, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !476, metadata !DIExpression()), !dbg !477
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !478
  %0 = bitcast i8* %call to i32*, !dbg !479
  store i32* %0, i32** %buffer, align 8, !dbg !477
  %1 = load i32*, i32** %buffer, align 8, !dbg !480
  %cmp = icmp eq i32* %1, null, !dbg !482
  br i1 %cmp, label %if.then, label %if.end, !dbg !483

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !484
  unreachable, !dbg !484

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !486
  br label %for.cond, !dbg !488

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !489
  %cmp1 = icmp slt i32 %2, 10, !dbg !491
  br i1 %cmp1, label %for.body, label %for.end, !dbg !492

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !493
  %4 = load i32, i32* %i, align 4, !dbg !495
  %idxprom = sext i32 %4 to i64, !dbg !493
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !493
  store i32 0, i32* %arrayidx, align 4, !dbg !496
  br label %for.inc, !dbg !497

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !498
  %inc = add nsw i32 %5, 1, !dbg !498
  store i32 %inc, i32* %i, align 4, !dbg !498
  br label %for.cond, !dbg !499, !llvm.loop !500

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !502
  %cmp2 = icmp sge i32 %6, 0, !dbg !504
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !505

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !506
  %8 = load i32, i32* %data, align 4, !dbg !508
  %idxprom4 = sext i32 %8 to i64, !dbg !506
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !506
  store i32 1, i32* %arrayidx5, align 4, !dbg !509
  store i32 0, i32* %i, align 4, !dbg !510
  br label %for.cond6, !dbg !512

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !513
  %cmp7 = icmp slt i32 %9, 10, !dbg !515
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !516

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !517
  %11 = load i32, i32* %i, align 4, !dbg !519
  %idxprom9 = sext i32 %11 to i64, !dbg !517
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !517
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !517
  call void @printIntLine(i32 noundef %12), !dbg !520
  br label %for.inc11, !dbg !521

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !522
  %inc12 = add nsw i32 %13, 1, !dbg !522
  store i32 %inc12, i32* %i, align 4, !dbg !522
  br label %for.cond6, !dbg !523, !llvm.loop !524

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !526

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !527
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !529
  %15 = bitcast i32* %14 to i8*, !dbg !529
  call void @free(i8* noundef %15), !dbg !530
  ret void, !dbg !531
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !532 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !533, metadata !DIExpression()), !dbg !534
  store i32 -1, i32* %data, align 4, !dbg !535
  store i32 7, i32* %data, align 4, !dbg !536
  call void @llvm.dbg.declare(metadata i32* %i, metadata !537, metadata !DIExpression()), !dbg !539
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !540, metadata !DIExpression()), !dbg !541
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !542
  %0 = bitcast i8* %call to i32*, !dbg !543
  store i32* %0, i32** %buffer, align 8, !dbg !541
  %1 = load i32*, i32** %buffer, align 8, !dbg !544
  %cmp = icmp eq i32* %1, null, !dbg !546
  br i1 %cmp, label %if.then, label %if.end, !dbg !547

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !548
  unreachable, !dbg !548

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !550
  br label %for.cond, !dbg !552

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !553
  %cmp1 = icmp slt i32 %2, 10, !dbg !555
  br i1 %cmp1, label %for.body, label %for.end, !dbg !556

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !557
  %4 = load i32, i32* %i, align 4, !dbg !559
  %idxprom = sext i32 %4 to i64, !dbg !557
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !557
  store i32 0, i32* %arrayidx, align 4, !dbg !560
  br label %for.inc, !dbg !561

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !562
  %inc = add nsw i32 %5, 1, !dbg !562
  store i32 %inc, i32* %i, align 4, !dbg !562
  br label %for.cond, !dbg !563, !llvm.loop !564

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !566
  %cmp2 = icmp sge i32 %6, 0, !dbg !568
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !569

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !570
  %8 = load i32, i32* %data, align 4, !dbg !572
  %idxprom4 = sext i32 %8 to i64, !dbg !570
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !570
  store i32 1, i32* %arrayidx5, align 4, !dbg !573
  store i32 0, i32* %i, align 4, !dbg !574
  br label %for.cond6, !dbg !576

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !577
  %cmp7 = icmp slt i32 %9, 10, !dbg !579
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !580

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !581
  %11 = load i32, i32* %i, align 4, !dbg !583
  %idxprom9 = sext i32 %11 to i64, !dbg !581
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !581
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !581
  call void @printIntLine(i32 noundef %12), !dbg !584
  br label %for.inc11, !dbg !585

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !586
  %inc12 = add nsw i32 %13, 1, !dbg !586
  store i32 %inc12, i32* %i, align 4, !dbg !586
  br label %for.cond6, !dbg !587, !llvm.loop !588

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !590

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !591
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !593
  %15 = bitcast i32* %14 to i8*, !dbg !593
  call void @free(i8* noundef %15), !dbg !594
  ret void, !dbg !595
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_bad", scope: !33, file: !33, line: 44, type: !34, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!33 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !{}
!37 = !DILocalVariable(name: "data", scope: !32, file: !33, line: 46, type: !22)
!38 = !DILocation(line: 46, column: 9, scope: !32)
!39 = !DILocation(line: 48, column: 10, scope: !32)
!40 = !DILocalVariable(name: "recvResult", scope: !41, file: !33, line: 57, type: !22)
!41 = distinct !DILexicalBlock(scope: !32, file: !33, line: 52, column: 5)
!42 = !DILocation(line: 57, column: 13, scope: !41)
!43 = !DILocalVariable(name: "service", scope: !41, file: !33, line: 58, type: !44)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !45, line: 375, size: 128, elements: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!46 = !{!47, !48, !49, !52, !59}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !44, file: !45, line: 376, baseType: !11, size: 8)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !44, file: !45, line: 377, baseType: !14, size: 8, offset: 8)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !44, file: !45, line: 378, baseType: !50, size: 16, offset: 16)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !51, line: 31, baseType: !3)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !44, file: !45, line: 379, baseType: !53, size: 32, offset: 32)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !45, line: 301, size: 32, elements: !54)
!54 = !{!55}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !53, file: !45, line: 302, baseType: !56, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !24)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !44, file: !45, line: 380, baseType: !60, size: 64, offset: 64)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 8)
!63 = !DILocation(line: 58, column: 28, scope: !41)
!64 = !DILocalVariable(name: "connectSocket", scope: !41, file: !33, line: 59, type: !22)
!65 = !DILocation(line: 59, column: 16, scope: !41)
!66 = !DILocalVariable(name: "inputBuffer", scope: !41, file: !33, line: 60, type: !17)
!67 = !DILocation(line: 60, column: 14, scope: !41)
!68 = !DILocation(line: 61, column: 9, scope: !41)
!69 = !DILocation(line: 71, column: 29, scope: !70)
!70 = distinct !DILexicalBlock(scope: !41, file: !33, line: 62, column: 9)
!71 = !DILocation(line: 71, column: 27, scope: !70)
!72 = !DILocation(line: 72, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !33, line: 72, column: 17)
!74 = !DILocation(line: 72, column: 31, scope: !73)
!75 = !DILocation(line: 72, column: 17, scope: !70)
!76 = !DILocation(line: 74, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !33, line: 73, column: 13)
!78 = !DILocation(line: 76, column: 13, scope: !70)
!79 = !DILocation(line: 77, column: 21, scope: !70)
!80 = !DILocation(line: 77, column: 32, scope: !70)
!81 = !DILocation(line: 78, column: 39, scope: !70)
!82 = !DILocation(line: 78, column: 21, scope: !70)
!83 = !DILocation(line: 78, column: 30, scope: !70)
!84 = !DILocation(line: 78, column: 37, scope: !70)
!85 = !DILocation(line: 79, column: 21, scope: !70)
!86 = !DILocation(line: 79, column: 30, scope: !70)
!87 = !DILocation(line: 80, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !70, file: !33, line: 80, column: 17)
!89 = !DILocation(line: 80, column: 40, scope: !88)
!90 = !DILocation(line: 80, column: 17, scope: !88)
!91 = !DILocation(line: 80, column: 85, scope: !88)
!92 = !DILocation(line: 80, column: 17, scope: !70)
!93 = !DILocation(line: 82, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !33, line: 81, column: 13)
!95 = !DILocation(line: 86, column: 31, scope: !70)
!96 = !DILocation(line: 86, column: 46, scope: !70)
!97 = !DILocation(line: 86, column: 26, scope: !70)
!98 = !DILocation(line: 86, column: 24, scope: !70)
!99 = !DILocation(line: 87, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !70, file: !33, line: 87, column: 17)
!101 = !DILocation(line: 87, column: 28, scope: !100)
!102 = !DILocation(line: 87, column: 44, scope: !100)
!103 = !DILocation(line: 87, column: 47, scope: !100)
!104 = !DILocation(line: 87, column: 58, scope: !100)
!105 = !DILocation(line: 87, column: 17, scope: !70)
!106 = !DILocation(line: 89, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !100, file: !33, line: 88, column: 13)
!108 = !DILocation(line: 92, column: 25, scope: !70)
!109 = !DILocation(line: 92, column: 13, scope: !70)
!110 = !DILocation(line: 92, column: 37, scope: !70)
!111 = !DILocation(line: 94, column: 25, scope: !70)
!112 = !DILocation(line: 94, column: 20, scope: !70)
!113 = !DILocation(line: 94, column: 18, scope: !70)
!114 = !DILocation(line: 95, column: 9, scope: !70)
!115 = !DILocation(line: 97, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !41, file: !33, line: 97, column: 13)
!117 = !DILocation(line: 97, column: 27, scope: !116)
!118 = !DILocation(line: 97, column: 13, scope: !41)
!119 = !DILocation(line: 99, column: 26, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !33, line: 98, column: 9)
!121 = !DILocation(line: 99, column: 13, scope: !120)
!122 = !DILocation(line: 100, column: 9, scope: !120)
!123 = !DILocalVariable(name: "i", scope: !124, file: !33, line: 118, type: !22)
!124 = distinct !DILexicalBlock(scope: !32, file: !33, line: 117, column: 5)
!125 = !DILocation(line: 118, column: 13, scope: !124)
!126 = !DILocalVariable(name: "buffer", scope: !124, file: !33, line: 119, type: !21)
!127 = !DILocation(line: 119, column: 15, scope: !124)
!128 = !DILocation(line: 119, column: 31, scope: !124)
!129 = !DILocation(line: 119, column: 24, scope: !124)
!130 = !DILocation(line: 120, column: 13, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !33, line: 120, column: 13)
!132 = !DILocation(line: 120, column: 20, scope: !131)
!133 = !DILocation(line: 120, column: 13, scope: !124)
!134 = !DILocation(line: 120, column: 30, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !33, line: 120, column: 29)
!136 = !DILocation(line: 122, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !124, file: !33, line: 122, column: 9)
!138 = !DILocation(line: 122, column: 14, scope: !137)
!139 = !DILocation(line: 122, column: 21, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !33, line: 122, column: 9)
!141 = !DILocation(line: 122, column: 23, scope: !140)
!142 = !DILocation(line: 122, column: 9, scope: !137)
!143 = !DILocation(line: 124, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !33, line: 123, column: 9)
!145 = !DILocation(line: 124, column: 20, scope: !144)
!146 = !DILocation(line: 124, column: 23, scope: !144)
!147 = !DILocation(line: 125, column: 9, scope: !144)
!148 = !DILocation(line: 122, column: 30, scope: !140)
!149 = !DILocation(line: 122, column: 9, scope: !140)
!150 = distinct !{!150, !142, !151, !152}
!151 = !DILocation(line: 125, column: 9, scope: !137)
!152 = !{!"llvm.loop.mustprogress"}
!153 = !DILocation(line: 128, column: 13, scope: !154)
!154 = distinct !DILexicalBlock(scope: !124, file: !33, line: 128, column: 13)
!155 = !DILocation(line: 128, column: 18, scope: !154)
!156 = !DILocation(line: 128, column: 13, scope: !124)
!157 = !DILocation(line: 130, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !154, file: !33, line: 129, column: 9)
!159 = !DILocation(line: 130, column: 20, scope: !158)
!160 = !DILocation(line: 130, column: 26, scope: !158)
!161 = !DILocation(line: 132, column: 19, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !33, line: 132, column: 13)
!163 = !DILocation(line: 132, column: 17, scope: !162)
!164 = !DILocation(line: 132, column: 24, scope: !165)
!165 = distinct !DILexicalBlock(scope: !162, file: !33, line: 132, column: 13)
!166 = !DILocation(line: 132, column: 26, scope: !165)
!167 = !DILocation(line: 132, column: 13, scope: !162)
!168 = !DILocation(line: 134, column: 30, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !33, line: 133, column: 13)
!170 = !DILocation(line: 134, column: 37, scope: !169)
!171 = !DILocation(line: 134, column: 17, scope: !169)
!172 = !DILocation(line: 135, column: 13, scope: !169)
!173 = !DILocation(line: 132, column: 33, scope: !165)
!174 = !DILocation(line: 132, column: 13, scope: !165)
!175 = distinct !{!175, !167, !176, !152}
!176 = !DILocation(line: 135, column: 13, scope: !162)
!177 = !DILocation(line: 136, column: 9, scope: !158)
!178 = !DILocation(line: 139, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !154, file: !33, line: 138, column: 9)
!180 = !DILocation(line: 141, column: 14, scope: !124)
!181 = !DILocation(line: 141, column: 9, scope: !124)
!182 = !DILocation(line: 149, column: 1, scope: !32)
!183 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_15_good", scope: !33, file: !33, line: 479, type: !34, scopeLine: 480, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!184 = !DILocation(line: 481, column: 5, scope: !183)
!185 = !DILocation(line: 482, column: 5, scope: !183)
!186 = !DILocation(line: 483, column: 5, scope: !183)
!187 = !DILocation(line: 484, column: 5, scope: !183)
!188 = !DILocation(line: 485, column: 1, scope: !183)
!189 = distinct !DISubprogram(name: "main", scope: !33, file: !33, line: 496, type: !190, scopeLine: 497, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!190 = !DISubroutineType(types: !191)
!191 = !{!22, !22, !192}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!194 = !DILocalVariable(name: "argc", arg: 1, scope: !189, file: !33, line: 496, type: !22)
!195 = !DILocation(line: 496, column: 14, scope: !189)
!196 = !DILocalVariable(name: "argv", arg: 2, scope: !189, file: !33, line: 496, type: !192)
!197 = !DILocation(line: 496, column: 27, scope: !189)
!198 = !DILocation(line: 499, column: 22, scope: !189)
!199 = !DILocation(line: 499, column: 12, scope: !189)
!200 = !DILocation(line: 499, column: 5, scope: !189)
!201 = !DILocation(line: 501, column: 5, scope: !189)
!202 = !DILocation(line: 502, column: 5, scope: !189)
!203 = !DILocation(line: 503, column: 5, scope: !189)
!204 = !DILocation(line: 506, column: 5, scope: !189)
!205 = !DILocation(line: 507, column: 5, scope: !189)
!206 = !DILocation(line: 508, column: 5, scope: !189)
!207 = !DILocation(line: 510, column: 5, scope: !189)
!208 = distinct !DISubprogram(name: "goodB2G1", scope: !33, file: !33, line: 156, type: !34, scopeLine: 157, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!209 = !DILocalVariable(name: "data", scope: !208, file: !33, line: 158, type: !22)
!210 = !DILocation(line: 158, column: 9, scope: !208)
!211 = !DILocation(line: 160, column: 10, scope: !208)
!212 = !DILocalVariable(name: "recvResult", scope: !213, file: !33, line: 169, type: !22)
!213 = distinct !DILexicalBlock(scope: !208, file: !33, line: 164, column: 5)
!214 = !DILocation(line: 169, column: 13, scope: !213)
!215 = !DILocalVariable(name: "service", scope: !213, file: !33, line: 170, type: !44)
!216 = !DILocation(line: 170, column: 28, scope: !213)
!217 = !DILocalVariable(name: "connectSocket", scope: !213, file: !33, line: 171, type: !22)
!218 = !DILocation(line: 171, column: 16, scope: !213)
!219 = !DILocalVariable(name: "inputBuffer", scope: !213, file: !33, line: 172, type: !17)
!220 = !DILocation(line: 172, column: 14, scope: !213)
!221 = !DILocation(line: 173, column: 9, scope: !213)
!222 = !DILocation(line: 183, column: 29, scope: !223)
!223 = distinct !DILexicalBlock(scope: !213, file: !33, line: 174, column: 9)
!224 = !DILocation(line: 183, column: 27, scope: !223)
!225 = !DILocation(line: 184, column: 17, scope: !226)
!226 = distinct !DILexicalBlock(scope: !223, file: !33, line: 184, column: 17)
!227 = !DILocation(line: 184, column: 31, scope: !226)
!228 = !DILocation(line: 184, column: 17, scope: !223)
!229 = !DILocation(line: 186, column: 17, scope: !230)
!230 = distinct !DILexicalBlock(scope: !226, file: !33, line: 185, column: 13)
!231 = !DILocation(line: 188, column: 13, scope: !223)
!232 = !DILocation(line: 189, column: 21, scope: !223)
!233 = !DILocation(line: 189, column: 32, scope: !223)
!234 = !DILocation(line: 190, column: 39, scope: !223)
!235 = !DILocation(line: 190, column: 21, scope: !223)
!236 = !DILocation(line: 190, column: 30, scope: !223)
!237 = !DILocation(line: 190, column: 37, scope: !223)
!238 = !DILocation(line: 191, column: 21, scope: !223)
!239 = !DILocation(line: 191, column: 30, scope: !223)
!240 = !DILocation(line: 192, column: 25, scope: !241)
!241 = distinct !DILexicalBlock(scope: !223, file: !33, line: 192, column: 17)
!242 = !DILocation(line: 192, column: 40, scope: !241)
!243 = !DILocation(line: 192, column: 17, scope: !241)
!244 = !DILocation(line: 192, column: 85, scope: !241)
!245 = !DILocation(line: 192, column: 17, scope: !223)
!246 = !DILocation(line: 194, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !241, file: !33, line: 193, column: 13)
!248 = !DILocation(line: 198, column: 31, scope: !223)
!249 = !DILocation(line: 198, column: 46, scope: !223)
!250 = !DILocation(line: 198, column: 26, scope: !223)
!251 = !DILocation(line: 198, column: 24, scope: !223)
!252 = !DILocation(line: 199, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !223, file: !33, line: 199, column: 17)
!254 = !DILocation(line: 199, column: 28, scope: !253)
!255 = !DILocation(line: 199, column: 44, scope: !253)
!256 = !DILocation(line: 199, column: 47, scope: !253)
!257 = !DILocation(line: 199, column: 58, scope: !253)
!258 = !DILocation(line: 199, column: 17, scope: !223)
!259 = !DILocation(line: 201, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !253, file: !33, line: 200, column: 13)
!261 = !DILocation(line: 204, column: 25, scope: !223)
!262 = !DILocation(line: 204, column: 13, scope: !223)
!263 = !DILocation(line: 204, column: 37, scope: !223)
!264 = !DILocation(line: 206, column: 25, scope: !223)
!265 = !DILocation(line: 206, column: 20, scope: !223)
!266 = !DILocation(line: 206, column: 18, scope: !223)
!267 = !DILocation(line: 207, column: 9, scope: !223)
!268 = !DILocation(line: 209, column: 13, scope: !269)
!269 = distinct !DILexicalBlock(scope: !213, file: !33, line: 209, column: 13)
!270 = !DILocation(line: 209, column: 27, scope: !269)
!271 = !DILocation(line: 209, column: 13, scope: !213)
!272 = !DILocation(line: 211, column: 26, scope: !273)
!273 = distinct !DILexicalBlock(scope: !269, file: !33, line: 210, column: 9)
!274 = !DILocation(line: 211, column: 13, scope: !273)
!275 = !DILocation(line: 212, column: 9, scope: !273)
!276 = !DILocalVariable(name: "i", scope: !277, file: !33, line: 234, type: !22)
!277 = distinct !DILexicalBlock(scope: !208, file: !33, line: 233, column: 5)
!278 = !DILocation(line: 234, column: 13, scope: !277)
!279 = !DILocalVariable(name: "buffer", scope: !277, file: !33, line: 235, type: !21)
!280 = !DILocation(line: 235, column: 15, scope: !277)
!281 = !DILocation(line: 235, column: 31, scope: !277)
!282 = !DILocation(line: 235, column: 24, scope: !277)
!283 = !DILocation(line: 236, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !277, file: !33, line: 236, column: 13)
!285 = !DILocation(line: 236, column: 20, scope: !284)
!286 = !DILocation(line: 236, column: 13, scope: !277)
!287 = !DILocation(line: 236, column: 30, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !33, line: 236, column: 29)
!289 = !DILocation(line: 238, column: 16, scope: !290)
!290 = distinct !DILexicalBlock(scope: !277, file: !33, line: 238, column: 9)
!291 = !DILocation(line: 238, column: 14, scope: !290)
!292 = !DILocation(line: 238, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !290, file: !33, line: 238, column: 9)
!294 = !DILocation(line: 238, column: 23, scope: !293)
!295 = !DILocation(line: 238, column: 9, scope: !290)
!296 = !DILocation(line: 240, column: 13, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !33, line: 239, column: 9)
!298 = !DILocation(line: 240, column: 20, scope: !297)
!299 = !DILocation(line: 240, column: 23, scope: !297)
!300 = !DILocation(line: 241, column: 9, scope: !297)
!301 = !DILocation(line: 238, column: 30, scope: !293)
!302 = !DILocation(line: 238, column: 9, scope: !293)
!303 = distinct !{!303, !295, !304, !152}
!304 = !DILocation(line: 241, column: 9, scope: !290)
!305 = !DILocation(line: 243, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !277, file: !33, line: 243, column: 13)
!307 = !DILocation(line: 243, column: 18, scope: !306)
!308 = !DILocation(line: 243, column: 23, scope: !306)
!309 = !DILocation(line: 243, column: 26, scope: !306)
!310 = !DILocation(line: 243, column: 31, scope: !306)
!311 = !DILocation(line: 243, column: 13, scope: !277)
!312 = !DILocation(line: 245, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !306, file: !33, line: 244, column: 9)
!314 = !DILocation(line: 245, column: 20, scope: !313)
!315 = !DILocation(line: 245, column: 26, scope: !313)
!316 = !DILocation(line: 247, column: 19, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !33, line: 247, column: 13)
!318 = !DILocation(line: 247, column: 17, scope: !317)
!319 = !DILocation(line: 247, column: 24, scope: !320)
!320 = distinct !DILexicalBlock(scope: !317, file: !33, line: 247, column: 13)
!321 = !DILocation(line: 247, column: 26, scope: !320)
!322 = !DILocation(line: 247, column: 13, scope: !317)
!323 = !DILocation(line: 249, column: 30, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !33, line: 248, column: 13)
!325 = !DILocation(line: 249, column: 37, scope: !324)
!326 = !DILocation(line: 249, column: 17, scope: !324)
!327 = !DILocation(line: 250, column: 13, scope: !324)
!328 = !DILocation(line: 247, column: 33, scope: !320)
!329 = !DILocation(line: 247, column: 13, scope: !320)
!330 = distinct !{!330, !322, !331, !152}
!331 = !DILocation(line: 250, column: 13, scope: !317)
!332 = !DILocation(line: 251, column: 9, scope: !313)
!333 = !DILocation(line: 254, column: 13, scope: !334)
!334 = distinct !DILexicalBlock(scope: !306, file: !33, line: 253, column: 9)
!335 = !DILocation(line: 256, column: 14, scope: !277)
!336 = !DILocation(line: 256, column: 9, scope: !277)
!337 = !DILocation(line: 260, column: 1, scope: !208)
!338 = distinct !DISubprogram(name: "goodB2G2", scope: !33, file: !33, line: 263, type: !34, scopeLine: 264, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!339 = !DILocalVariable(name: "data", scope: !338, file: !33, line: 265, type: !22)
!340 = !DILocation(line: 265, column: 9, scope: !338)
!341 = !DILocation(line: 267, column: 10, scope: !338)
!342 = !DILocalVariable(name: "recvResult", scope: !343, file: !33, line: 276, type: !22)
!343 = distinct !DILexicalBlock(scope: !338, file: !33, line: 271, column: 5)
!344 = !DILocation(line: 276, column: 13, scope: !343)
!345 = !DILocalVariable(name: "service", scope: !343, file: !33, line: 277, type: !44)
!346 = !DILocation(line: 277, column: 28, scope: !343)
!347 = !DILocalVariable(name: "connectSocket", scope: !343, file: !33, line: 278, type: !22)
!348 = !DILocation(line: 278, column: 16, scope: !343)
!349 = !DILocalVariable(name: "inputBuffer", scope: !343, file: !33, line: 279, type: !17)
!350 = !DILocation(line: 279, column: 14, scope: !343)
!351 = !DILocation(line: 280, column: 9, scope: !343)
!352 = !DILocation(line: 290, column: 29, scope: !353)
!353 = distinct !DILexicalBlock(scope: !343, file: !33, line: 281, column: 9)
!354 = !DILocation(line: 290, column: 27, scope: !353)
!355 = !DILocation(line: 291, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !353, file: !33, line: 291, column: 17)
!357 = !DILocation(line: 291, column: 31, scope: !356)
!358 = !DILocation(line: 291, column: 17, scope: !353)
!359 = !DILocation(line: 293, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !356, file: !33, line: 292, column: 13)
!361 = !DILocation(line: 295, column: 13, scope: !353)
!362 = !DILocation(line: 296, column: 21, scope: !353)
!363 = !DILocation(line: 296, column: 32, scope: !353)
!364 = !DILocation(line: 297, column: 39, scope: !353)
!365 = !DILocation(line: 297, column: 21, scope: !353)
!366 = !DILocation(line: 297, column: 30, scope: !353)
!367 = !DILocation(line: 297, column: 37, scope: !353)
!368 = !DILocation(line: 298, column: 21, scope: !353)
!369 = !DILocation(line: 298, column: 30, scope: !353)
!370 = !DILocation(line: 299, column: 25, scope: !371)
!371 = distinct !DILexicalBlock(scope: !353, file: !33, line: 299, column: 17)
!372 = !DILocation(line: 299, column: 40, scope: !371)
!373 = !DILocation(line: 299, column: 17, scope: !371)
!374 = !DILocation(line: 299, column: 85, scope: !371)
!375 = !DILocation(line: 299, column: 17, scope: !353)
!376 = !DILocation(line: 301, column: 17, scope: !377)
!377 = distinct !DILexicalBlock(scope: !371, file: !33, line: 300, column: 13)
!378 = !DILocation(line: 305, column: 31, scope: !353)
!379 = !DILocation(line: 305, column: 46, scope: !353)
!380 = !DILocation(line: 305, column: 26, scope: !353)
!381 = !DILocation(line: 305, column: 24, scope: !353)
!382 = !DILocation(line: 306, column: 17, scope: !383)
!383 = distinct !DILexicalBlock(scope: !353, file: !33, line: 306, column: 17)
!384 = !DILocation(line: 306, column: 28, scope: !383)
!385 = !DILocation(line: 306, column: 44, scope: !383)
!386 = !DILocation(line: 306, column: 47, scope: !383)
!387 = !DILocation(line: 306, column: 58, scope: !383)
!388 = !DILocation(line: 306, column: 17, scope: !353)
!389 = !DILocation(line: 308, column: 17, scope: !390)
!390 = distinct !DILexicalBlock(scope: !383, file: !33, line: 307, column: 13)
!391 = !DILocation(line: 311, column: 25, scope: !353)
!392 = !DILocation(line: 311, column: 13, scope: !353)
!393 = !DILocation(line: 311, column: 37, scope: !353)
!394 = !DILocation(line: 313, column: 25, scope: !353)
!395 = !DILocation(line: 313, column: 20, scope: !353)
!396 = !DILocation(line: 313, column: 18, scope: !353)
!397 = !DILocation(line: 314, column: 9, scope: !353)
!398 = !DILocation(line: 316, column: 13, scope: !399)
!399 = distinct !DILexicalBlock(scope: !343, file: !33, line: 316, column: 13)
!400 = !DILocation(line: 316, column: 27, scope: !399)
!401 = !DILocation(line: 316, column: 13, scope: !343)
!402 = !DILocation(line: 318, column: 26, scope: !403)
!403 = distinct !DILexicalBlock(scope: !399, file: !33, line: 317, column: 9)
!404 = !DILocation(line: 318, column: 13, scope: !403)
!405 = !DILocation(line: 319, column: 9, scope: !403)
!406 = !DILocalVariable(name: "i", scope: !407, file: !33, line: 337, type: !22)
!407 = distinct !DILexicalBlock(scope: !338, file: !33, line: 336, column: 5)
!408 = !DILocation(line: 337, column: 13, scope: !407)
!409 = !DILocalVariable(name: "buffer", scope: !407, file: !33, line: 338, type: !21)
!410 = !DILocation(line: 338, column: 15, scope: !407)
!411 = !DILocation(line: 338, column: 31, scope: !407)
!412 = !DILocation(line: 338, column: 24, scope: !407)
!413 = !DILocation(line: 339, column: 13, scope: !414)
!414 = distinct !DILexicalBlock(scope: !407, file: !33, line: 339, column: 13)
!415 = !DILocation(line: 339, column: 20, scope: !414)
!416 = !DILocation(line: 339, column: 13, scope: !407)
!417 = !DILocation(line: 339, column: 30, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !33, line: 339, column: 29)
!419 = !DILocation(line: 341, column: 16, scope: !420)
!420 = distinct !DILexicalBlock(scope: !407, file: !33, line: 341, column: 9)
!421 = !DILocation(line: 341, column: 14, scope: !420)
!422 = !DILocation(line: 341, column: 21, scope: !423)
!423 = distinct !DILexicalBlock(scope: !420, file: !33, line: 341, column: 9)
!424 = !DILocation(line: 341, column: 23, scope: !423)
!425 = !DILocation(line: 341, column: 9, scope: !420)
!426 = !DILocation(line: 343, column: 13, scope: !427)
!427 = distinct !DILexicalBlock(scope: !423, file: !33, line: 342, column: 9)
!428 = !DILocation(line: 343, column: 20, scope: !427)
!429 = !DILocation(line: 343, column: 23, scope: !427)
!430 = !DILocation(line: 344, column: 9, scope: !427)
!431 = !DILocation(line: 341, column: 30, scope: !423)
!432 = !DILocation(line: 341, column: 9, scope: !423)
!433 = distinct !{!433, !425, !434, !152}
!434 = !DILocation(line: 344, column: 9, scope: !420)
!435 = !DILocation(line: 346, column: 13, scope: !436)
!436 = distinct !DILexicalBlock(scope: !407, file: !33, line: 346, column: 13)
!437 = !DILocation(line: 346, column: 18, scope: !436)
!438 = !DILocation(line: 346, column: 23, scope: !436)
!439 = !DILocation(line: 346, column: 26, scope: !436)
!440 = !DILocation(line: 346, column: 31, scope: !436)
!441 = !DILocation(line: 346, column: 13, scope: !407)
!442 = !DILocation(line: 348, column: 13, scope: !443)
!443 = distinct !DILexicalBlock(scope: !436, file: !33, line: 347, column: 9)
!444 = !DILocation(line: 348, column: 20, scope: !443)
!445 = !DILocation(line: 348, column: 26, scope: !443)
!446 = !DILocation(line: 350, column: 19, scope: !447)
!447 = distinct !DILexicalBlock(scope: !443, file: !33, line: 350, column: 13)
!448 = !DILocation(line: 350, column: 17, scope: !447)
!449 = !DILocation(line: 350, column: 24, scope: !450)
!450 = distinct !DILexicalBlock(scope: !447, file: !33, line: 350, column: 13)
!451 = !DILocation(line: 350, column: 26, scope: !450)
!452 = !DILocation(line: 350, column: 13, scope: !447)
!453 = !DILocation(line: 352, column: 30, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !33, line: 351, column: 13)
!455 = !DILocation(line: 352, column: 37, scope: !454)
!456 = !DILocation(line: 352, column: 17, scope: !454)
!457 = !DILocation(line: 353, column: 13, scope: !454)
!458 = !DILocation(line: 350, column: 33, scope: !450)
!459 = !DILocation(line: 350, column: 13, scope: !450)
!460 = distinct !{!460, !452, !461, !152}
!461 = !DILocation(line: 353, column: 13, scope: !447)
!462 = !DILocation(line: 354, column: 9, scope: !443)
!463 = !DILocation(line: 357, column: 13, scope: !464)
!464 = distinct !DILexicalBlock(scope: !436, file: !33, line: 356, column: 9)
!465 = !DILocation(line: 359, column: 14, scope: !407)
!466 = !DILocation(line: 359, column: 9, scope: !407)
!467 = !DILocation(line: 367, column: 1, scope: !338)
!468 = distinct !DISubprogram(name: "goodG2B1", scope: !33, file: !33, line: 370, type: !34, scopeLine: 371, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!469 = !DILocalVariable(name: "data", scope: !468, file: !33, line: 372, type: !22)
!470 = !DILocation(line: 372, column: 9, scope: !468)
!471 = !DILocation(line: 374, column: 10, scope: !468)
!472 = !DILocation(line: 384, column: 14, scope: !468)
!473 = !DILocalVariable(name: "i", scope: !474, file: !33, line: 391, type: !22)
!474 = distinct !DILexicalBlock(scope: !468, file: !33, line: 390, column: 5)
!475 = !DILocation(line: 391, column: 13, scope: !474)
!476 = !DILocalVariable(name: "buffer", scope: !474, file: !33, line: 392, type: !21)
!477 = !DILocation(line: 392, column: 15, scope: !474)
!478 = !DILocation(line: 392, column: 31, scope: !474)
!479 = !DILocation(line: 392, column: 24, scope: !474)
!480 = !DILocation(line: 393, column: 13, scope: !481)
!481 = distinct !DILexicalBlock(scope: !474, file: !33, line: 393, column: 13)
!482 = !DILocation(line: 393, column: 20, scope: !481)
!483 = !DILocation(line: 393, column: 13, scope: !474)
!484 = !DILocation(line: 393, column: 30, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !33, line: 393, column: 29)
!486 = !DILocation(line: 395, column: 16, scope: !487)
!487 = distinct !DILexicalBlock(scope: !474, file: !33, line: 395, column: 9)
!488 = !DILocation(line: 395, column: 14, scope: !487)
!489 = !DILocation(line: 395, column: 21, scope: !490)
!490 = distinct !DILexicalBlock(scope: !487, file: !33, line: 395, column: 9)
!491 = !DILocation(line: 395, column: 23, scope: !490)
!492 = !DILocation(line: 395, column: 9, scope: !487)
!493 = !DILocation(line: 397, column: 13, scope: !494)
!494 = distinct !DILexicalBlock(scope: !490, file: !33, line: 396, column: 9)
!495 = !DILocation(line: 397, column: 20, scope: !494)
!496 = !DILocation(line: 397, column: 23, scope: !494)
!497 = !DILocation(line: 398, column: 9, scope: !494)
!498 = !DILocation(line: 395, column: 30, scope: !490)
!499 = !DILocation(line: 395, column: 9, scope: !490)
!500 = distinct !{!500, !492, !501, !152}
!501 = !DILocation(line: 398, column: 9, scope: !487)
!502 = !DILocation(line: 401, column: 13, scope: !503)
!503 = distinct !DILexicalBlock(scope: !474, file: !33, line: 401, column: 13)
!504 = !DILocation(line: 401, column: 18, scope: !503)
!505 = !DILocation(line: 401, column: 13, scope: !474)
!506 = !DILocation(line: 403, column: 13, scope: !507)
!507 = distinct !DILexicalBlock(scope: !503, file: !33, line: 402, column: 9)
!508 = !DILocation(line: 403, column: 20, scope: !507)
!509 = !DILocation(line: 403, column: 26, scope: !507)
!510 = !DILocation(line: 405, column: 19, scope: !511)
!511 = distinct !DILexicalBlock(scope: !507, file: !33, line: 405, column: 13)
!512 = !DILocation(line: 405, column: 17, scope: !511)
!513 = !DILocation(line: 405, column: 24, scope: !514)
!514 = distinct !DILexicalBlock(scope: !511, file: !33, line: 405, column: 13)
!515 = !DILocation(line: 405, column: 26, scope: !514)
!516 = !DILocation(line: 405, column: 13, scope: !511)
!517 = !DILocation(line: 407, column: 30, scope: !518)
!518 = distinct !DILexicalBlock(scope: !514, file: !33, line: 406, column: 13)
!519 = !DILocation(line: 407, column: 37, scope: !518)
!520 = !DILocation(line: 407, column: 17, scope: !518)
!521 = !DILocation(line: 408, column: 13, scope: !518)
!522 = !DILocation(line: 405, column: 33, scope: !514)
!523 = !DILocation(line: 405, column: 13, scope: !514)
!524 = distinct !{!524, !516, !525, !152}
!525 = !DILocation(line: 408, column: 13, scope: !511)
!526 = !DILocation(line: 409, column: 9, scope: !507)
!527 = !DILocation(line: 412, column: 13, scope: !528)
!528 = distinct !DILexicalBlock(scope: !503, file: !33, line: 411, column: 9)
!529 = !DILocation(line: 414, column: 14, scope: !474)
!530 = !DILocation(line: 414, column: 9, scope: !474)
!531 = !DILocation(line: 422, column: 1, scope: !468)
!532 = distinct !DISubprogram(name: "goodG2B2", scope: !33, file: !33, line: 425, type: !34, scopeLine: 426, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!533 = !DILocalVariable(name: "data", scope: !532, file: !33, line: 427, type: !22)
!534 = !DILocation(line: 427, column: 9, scope: !532)
!535 = !DILocation(line: 429, column: 10, scope: !532)
!536 = !DILocation(line: 435, column: 14, scope: !532)
!537 = !DILocalVariable(name: "i", scope: !538, file: !33, line: 446, type: !22)
!538 = distinct !DILexicalBlock(scope: !532, file: !33, line: 445, column: 5)
!539 = !DILocation(line: 446, column: 13, scope: !538)
!540 = !DILocalVariable(name: "buffer", scope: !538, file: !33, line: 447, type: !21)
!541 = !DILocation(line: 447, column: 15, scope: !538)
!542 = !DILocation(line: 447, column: 31, scope: !538)
!543 = !DILocation(line: 447, column: 24, scope: !538)
!544 = !DILocation(line: 448, column: 13, scope: !545)
!545 = distinct !DILexicalBlock(scope: !538, file: !33, line: 448, column: 13)
!546 = !DILocation(line: 448, column: 20, scope: !545)
!547 = !DILocation(line: 448, column: 13, scope: !538)
!548 = !DILocation(line: 448, column: 30, scope: !549)
!549 = distinct !DILexicalBlock(scope: !545, file: !33, line: 448, column: 29)
!550 = !DILocation(line: 450, column: 16, scope: !551)
!551 = distinct !DILexicalBlock(scope: !538, file: !33, line: 450, column: 9)
!552 = !DILocation(line: 450, column: 14, scope: !551)
!553 = !DILocation(line: 450, column: 21, scope: !554)
!554 = distinct !DILexicalBlock(scope: !551, file: !33, line: 450, column: 9)
!555 = !DILocation(line: 450, column: 23, scope: !554)
!556 = !DILocation(line: 450, column: 9, scope: !551)
!557 = !DILocation(line: 452, column: 13, scope: !558)
!558 = distinct !DILexicalBlock(scope: !554, file: !33, line: 451, column: 9)
!559 = !DILocation(line: 452, column: 20, scope: !558)
!560 = !DILocation(line: 452, column: 23, scope: !558)
!561 = !DILocation(line: 453, column: 9, scope: !558)
!562 = !DILocation(line: 450, column: 30, scope: !554)
!563 = !DILocation(line: 450, column: 9, scope: !554)
!564 = distinct !{!564, !556, !565, !152}
!565 = !DILocation(line: 453, column: 9, scope: !551)
!566 = !DILocation(line: 456, column: 13, scope: !567)
!567 = distinct !DILexicalBlock(scope: !538, file: !33, line: 456, column: 13)
!568 = !DILocation(line: 456, column: 18, scope: !567)
!569 = !DILocation(line: 456, column: 13, scope: !538)
!570 = !DILocation(line: 458, column: 13, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !33, line: 457, column: 9)
!572 = !DILocation(line: 458, column: 20, scope: !571)
!573 = !DILocation(line: 458, column: 26, scope: !571)
!574 = !DILocation(line: 460, column: 19, scope: !575)
!575 = distinct !DILexicalBlock(scope: !571, file: !33, line: 460, column: 13)
!576 = !DILocation(line: 460, column: 17, scope: !575)
!577 = !DILocation(line: 460, column: 24, scope: !578)
!578 = distinct !DILexicalBlock(scope: !575, file: !33, line: 460, column: 13)
!579 = !DILocation(line: 460, column: 26, scope: !578)
!580 = !DILocation(line: 460, column: 13, scope: !575)
!581 = !DILocation(line: 462, column: 30, scope: !582)
!582 = distinct !DILexicalBlock(scope: !578, file: !33, line: 461, column: 13)
!583 = !DILocation(line: 462, column: 37, scope: !582)
!584 = !DILocation(line: 462, column: 17, scope: !582)
!585 = !DILocation(line: 463, column: 13, scope: !582)
!586 = !DILocation(line: 460, column: 33, scope: !578)
!587 = !DILocation(line: 460, column: 13, scope: !578)
!588 = distinct !{!588, !580, !589, !152}
!589 = !DILocation(line: 463, column: 13, scope: !575)
!590 = !DILocation(line: 464, column: 9, scope: !571)
!591 = !DILocation(line: 467, column: 13, scope: !592)
!592 = distinct !DILexicalBlock(scope: !567, file: !33, line: 466, column: 9)
!593 = !DILocation(line: 469, column: 14, scope: !538)
!594 = !DILocation(line: 469, column: 9, scope: !538)
!595 = !DILocation(line: 477, column: 1, scope: !532)
