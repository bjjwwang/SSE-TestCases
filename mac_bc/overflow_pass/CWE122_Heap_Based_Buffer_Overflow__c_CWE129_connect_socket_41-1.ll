; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_bad() #0 !dbg !32 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  %10 = load i32, i32* %data, align 4, !dbg !123
  call void @badSink(i32 noundef %10), !dbg !124
  ret void, !dbg !125
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
define internal void @badSink(i32 noundef %data) #0 !dbg !126 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %i, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !134, metadata !DIExpression()), !dbg !135
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !136
  %0 = bitcast i8* %call to i32*, !dbg !137
  store i32* %0, i32** %buffer, align 8, !dbg !135
  %1 = load i32*, i32** %buffer, align 8, !dbg !138
  %cmp = icmp eq i32* %1, null, !dbg !140
  br i1 %cmp, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !147
  %cmp1 = icmp slt i32 %2, 10, !dbg !149
  br i1 %cmp1, label %for.body, label %for.end, !dbg !150

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !151
  %4 = load i32, i32* %i, align 4, !dbg !153
  %idxprom = sext i32 %4 to i64, !dbg !151
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !151
  store i32 0, i32* %arrayidx, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !156
  %inc = add nsw i32 %5, 1, !dbg !156
  store i32 %inc, i32* %i, align 4, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !161
  %cmp2 = icmp sge i32 %6, 0, !dbg !163
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !164

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !165
  %8 = load i32, i32* %data.addr, align 4, !dbg !167
  %idxprom4 = sext i32 %8 to i64, !dbg !165
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !165
  store i32 1, i32* %arrayidx5, align 4, !dbg !168
  store i32 0, i32* %i, align 4, !dbg !169
  br label %for.cond6, !dbg !171

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !172
  %cmp7 = icmp slt i32 %9, 10, !dbg !174
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !175

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !176
  %11 = load i32, i32* %i, align 4, !dbg !178
  %idxprom9 = sext i32 %11 to i64, !dbg !176
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !176
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !176
  call void @printIntLine(i32 noundef %12), !dbg !179
  br label %for.inc11, !dbg !180

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !181
  %inc12 = add nsw i32 %13, 1, !dbg !181
  store i32 %inc12, i32* %i, align 4, !dbg !181
  br label %for.cond6, !dbg !182, !llvm.loop !183

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !185

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !186
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !188
  %15 = bitcast i32* %14 to i8*, !dbg !188
  call void @free(i8* noundef %15), !dbg !189
  ret void, !dbg !190
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_good() #0 !dbg !191 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_good(), !dbg !208
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !209
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !210
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_bad(), !dbg !211
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !212
  ret i32 0, !dbg !213
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare void @printIntLine(i32 noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !214 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 -1, i32* %data, align 4, !dbg !217
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !218, metadata !DIExpression()), !dbg !220
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
  %10 = load i32, i32* %data, align 4, !dbg !282
  call void @goodB2GSink(i32 noundef %10), !dbg !283
  ret void, !dbg !284
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink(i32 noundef %data) #0 !dbg !285 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !286, metadata !DIExpression()), !dbg !287
  call void @llvm.dbg.declare(metadata i32* %i, metadata !288, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !291, metadata !DIExpression()), !dbg !292
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !293
  %0 = bitcast i8* %call to i32*, !dbg !294
  store i32* %0, i32** %buffer, align 8, !dbg !292
  %1 = load i32*, i32** %buffer, align 8, !dbg !295
  %cmp = icmp eq i32* %1, null, !dbg !297
  br i1 %cmp, label %if.then, label %if.end, !dbg !298

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !299
  unreachable, !dbg !299

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !301
  br label %for.cond, !dbg !303

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !304
  %cmp1 = icmp slt i32 %2, 10, !dbg !306
  br i1 %cmp1, label %for.body, label %for.end, !dbg !307

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !308
  %4 = load i32, i32* %i, align 4, !dbg !310
  %idxprom = sext i32 %4 to i64, !dbg !308
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !308
  store i32 0, i32* %arrayidx, align 4, !dbg !311
  br label %for.inc, !dbg !312

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !313
  %inc = add nsw i32 %5, 1, !dbg !313
  store i32 %inc, i32* %i, align 4, !dbg !313
  br label %for.cond, !dbg !314, !llvm.loop !315

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !317
  %cmp2 = icmp sge i32 %6, 0, !dbg !319
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !320

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !321
  %cmp3 = icmp slt i32 %7, 10, !dbg !322
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !323

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !324
  %9 = load i32, i32* %data.addr, align 4, !dbg !326
  %idxprom5 = sext i32 %9 to i64, !dbg !324
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !324
  store i32 1, i32* %arrayidx6, align 4, !dbg !327
  store i32 0, i32* %i, align 4, !dbg !328
  br label %for.cond7, !dbg !330

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !331
  %cmp8 = icmp slt i32 %10, 10, !dbg !333
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !334

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !335
  %12 = load i32, i32* %i, align 4, !dbg !337
  %idxprom10 = sext i32 %12 to i64, !dbg !335
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !335
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !335
  call void @printIntLine(i32 noundef %13), !dbg !338
  br label %for.inc12, !dbg !339

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !340
  %inc13 = add nsw i32 %14, 1, !dbg !340
  store i32 %inc13, i32* %i, align 4, !dbg !340
  br label %for.cond7, !dbg !341, !llvm.loop !342

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !344

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !345
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !347
  %16 = bitcast i32* %15 to i8*, !dbg !347
  call void @free(i8* noundef %16), !dbg !348
  ret void, !dbg !349
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !350 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !351, metadata !DIExpression()), !dbg !352
  store i32 -1, i32* %data, align 4, !dbg !353
  store i32 7, i32* %data, align 4, !dbg !354
  %0 = load i32, i32* %data, align 4, !dbg !355
  call void @goodG2BSink(i32 noundef %0), !dbg !356
  ret void, !dbg !357
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !358 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !359, metadata !DIExpression()), !dbg !360
  call void @llvm.dbg.declare(metadata i32* %i, metadata !361, metadata !DIExpression()), !dbg !363
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !364, metadata !DIExpression()), !dbg !365
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !366
  %0 = bitcast i8* %call to i32*, !dbg !367
  store i32* %0, i32** %buffer, align 8, !dbg !365
  %1 = load i32*, i32** %buffer, align 8, !dbg !368
  %cmp = icmp eq i32* %1, null, !dbg !370
  br i1 %cmp, label %if.then, label %if.end, !dbg !371

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !372
  unreachable, !dbg !372

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !374
  br label %for.cond, !dbg !376

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !377
  %cmp1 = icmp slt i32 %2, 10, !dbg !379
  br i1 %cmp1, label %for.body, label %for.end, !dbg !380

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !381
  %4 = load i32, i32* %i, align 4, !dbg !383
  %idxprom = sext i32 %4 to i64, !dbg !381
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !381
  store i32 0, i32* %arrayidx, align 4, !dbg !384
  br label %for.inc, !dbg !385

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !386
  %inc = add nsw i32 %5, 1, !dbg !386
  store i32 %inc, i32* %i, align 4, !dbg !386
  br label %for.cond, !dbg !387, !llvm.loop !388

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !390
  %cmp2 = icmp sge i32 %6, 0, !dbg !392
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !393

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !394
  %8 = load i32, i32* %data.addr, align 4, !dbg !396
  %idxprom4 = sext i32 %8 to i64, !dbg !394
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !394
  store i32 1, i32* %arrayidx5, align 4, !dbg !397
  store i32 0, i32* %i, align 4, !dbg !398
  br label %for.cond6, !dbg !400

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !401
  %cmp7 = icmp slt i32 %9, 10, !dbg !403
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !404

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !405
  %11 = load i32, i32* %i, align 4, !dbg !407
  %idxprom9 = sext i32 %11 to i64, !dbg !405
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !405
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !405
  call void @printIntLine(i32 noundef %12), !dbg !408
  br label %for.inc11, !dbg !409

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !410
  %inc12 = add nsw i32 %13, 1, !dbg !410
  store i32 %inc12, i32* %i, align 4, !dbg !410
  br label %for.cond6, !dbg !411, !llvm.loop !412

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !414

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0)), !dbg !415
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !417
  %15 = bitcast i32* %14 to i8*, !dbg !417
  call void @free(i8* noundef %15), !dbg !418
  ret void, !dbg !419
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !21, !22, !24}
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
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"PIC Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Homebrew clang version 14.0.6"}
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_bad", scope: !33, file: !33, line: 74, type: !34, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!33 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !{}
!37 = !DILocalVariable(name: "data", scope: !32, file: !33, line: 76, type: !23)
!38 = !DILocation(line: 76, column: 9, scope: !32)
!39 = !DILocation(line: 78, column: 10, scope: !32)
!40 = !DILocalVariable(name: "recvResult", scope: !41, file: !33, line: 84, type: !23)
!41 = distinct !DILexicalBlock(scope: !32, file: !33, line: 79, column: 5)
!42 = !DILocation(line: 84, column: 13, scope: !41)
!43 = !DILocalVariable(name: "service", scope: !41, file: !33, line: 85, type: !44)
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
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !44, file: !45, line: 380, baseType: !60, size: 64, offset: 64)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 8)
!63 = !DILocation(line: 85, column: 28, scope: !41)
!64 = !DILocalVariable(name: "connectSocket", scope: !41, file: !33, line: 86, type: !23)
!65 = !DILocation(line: 86, column: 16, scope: !41)
!66 = !DILocalVariable(name: "inputBuffer", scope: !41, file: !33, line: 87, type: !17)
!67 = !DILocation(line: 87, column: 14, scope: !41)
!68 = !DILocation(line: 88, column: 9, scope: !41)
!69 = !DILocation(line: 98, column: 29, scope: !70)
!70 = distinct !DILexicalBlock(scope: !41, file: !33, line: 89, column: 9)
!71 = !DILocation(line: 98, column: 27, scope: !70)
!72 = !DILocation(line: 99, column: 17, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !33, line: 99, column: 17)
!74 = !DILocation(line: 99, column: 31, scope: !73)
!75 = !DILocation(line: 99, column: 17, scope: !70)
!76 = !DILocation(line: 101, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !33, line: 100, column: 13)
!78 = !DILocation(line: 103, column: 13, scope: !70)
!79 = !DILocation(line: 104, column: 21, scope: !70)
!80 = !DILocation(line: 104, column: 32, scope: !70)
!81 = !DILocation(line: 105, column: 39, scope: !70)
!82 = !DILocation(line: 105, column: 21, scope: !70)
!83 = !DILocation(line: 105, column: 30, scope: !70)
!84 = !DILocation(line: 105, column: 37, scope: !70)
!85 = !DILocation(line: 106, column: 21, scope: !70)
!86 = !DILocation(line: 106, column: 30, scope: !70)
!87 = !DILocation(line: 107, column: 25, scope: !88)
!88 = distinct !DILexicalBlock(scope: !70, file: !33, line: 107, column: 17)
!89 = !DILocation(line: 107, column: 40, scope: !88)
!90 = !DILocation(line: 107, column: 17, scope: !88)
!91 = !DILocation(line: 107, column: 85, scope: !88)
!92 = !DILocation(line: 107, column: 17, scope: !70)
!93 = !DILocation(line: 109, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !33, line: 108, column: 13)
!95 = !DILocation(line: 113, column: 31, scope: !70)
!96 = !DILocation(line: 113, column: 46, scope: !70)
!97 = !DILocation(line: 113, column: 26, scope: !70)
!98 = !DILocation(line: 113, column: 24, scope: !70)
!99 = !DILocation(line: 114, column: 17, scope: !100)
!100 = distinct !DILexicalBlock(scope: !70, file: !33, line: 114, column: 17)
!101 = !DILocation(line: 114, column: 28, scope: !100)
!102 = !DILocation(line: 114, column: 44, scope: !100)
!103 = !DILocation(line: 114, column: 47, scope: !100)
!104 = !DILocation(line: 114, column: 58, scope: !100)
!105 = !DILocation(line: 114, column: 17, scope: !70)
!106 = !DILocation(line: 116, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !100, file: !33, line: 115, column: 13)
!108 = !DILocation(line: 119, column: 25, scope: !70)
!109 = !DILocation(line: 119, column: 13, scope: !70)
!110 = !DILocation(line: 119, column: 37, scope: !70)
!111 = !DILocation(line: 121, column: 25, scope: !70)
!112 = !DILocation(line: 121, column: 20, scope: !70)
!113 = !DILocation(line: 121, column: 18, scope: !70)
!114 = !DILocation(line: 122, column: 9, scope: !70)
!115 = !DILocation(line: 124, column: 13, scope: !116)
!116 = distinct !DILexicalBlock(scope: !41, file: !33, line: 124, column: 13)
!117 = !DILocation(line: 124, column: 27, scope: !116)
!118 = !DILocation(line: 124, column: 13, scope: !41)
!119 = !DILocation(line: 126, column: 26, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !33, line: 125, column: 9)
!121 = !DILocation(line: 126, column: 13, scope: !120)
!122 = !DILocation(line: 127, column: 9, scope: !120)
!123 = !DILocation(line: 135, column: 13, scope: !32)
!124 = !DILocation(line: 135, column: 5, scope: !32)
!125 = !DILocation(line: 136, column: 1, scope: !32)
!126 = distinct !DISubprogram(name: "badSink", scope: !33, file: !33, line: 44, type: !127, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!127 = !DISubroutineType(types: !128)
!128 = !{null, !23}
!129 = !DILocalVariable(name: "data", arg: 1, scope: !126, file: !33, line: 44, type: !23)
!130 = !DILocation(line: 44, column: 25, scope: !126)
!131 = !DILocalVariable(name: "i", scope: !132, file: !33, line: 47, type: !23)
!132 = distinct !DILexicalBlock(scope: !126, file: !33, line: 46, column: 5)
!133 = !DILocation(line: 47, column: 13, scope: !132)
!134 = !DILocalVariable(name: "buffer", scope: !132, file: !33, line: 48, type: !22)
!135 = !DILocation(line: 48, column: 15, scope: !132)
!136 = !DILocation(line: 48, column: 31, scope: !132)
!137 = !DILocation(line: 48, column: 24, scope: !132)
!138 = !DILocation(line: 49, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !33, line: 49, column: 13)
!140 = !DILocation(line: 49, column: 20, scope: !139)
!141 = !DILocation(line: 49, column: 13, scope: !132)
!142 = !DILocation(line: 49, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !33, line: 49, column: 29)
!144 = !DILocation(line: 51, column: 16, scope: !145)
!145 = distinct !DILexicalBlock(scope: !132, file: !33, line: 51, column: 9)
!146 = !DILocation(line: 51, column: 14, scope: !145)
!147 = !DILocation(line: 51, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !33, line: 51, column: 9)
!149 = !DILocation(line: 51, column: 23, scope: !148)
!150 = !DILocation(line: 51, column: 9, scope: !145)
!151 = !DILocation(line: 53, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !33, line: 52, column: 9)
!153 = !DILocation(line: 53, column: 20, scope: !152)
!154 = !DILocation(line: 53, column: 23, scope: !152)
!155 = !DILocation(line: 54, column: 9, scope: !152)
!156 = !DILocation(line: 51, column: 30, scope: !148)
!157 = !DILocation(line: 51, column: 9, scope: !148)
!158 = distinct !{!158, !150, !159, !160}
!159 = !DILocation(line: 54, column: 9, scope: !145)
!160 = !{!"llvm.loop.mustprogress"}
!161 = !DILocation(line: 57, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !132, file: !33, line: 57, column: 13)
!163 = !DILocation(line: 57, column: 18, scope: !162)
!164 = !DILocation(line: 57, column: 13, scope: !132)
!165 = !DILocation(line: 59, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !33, line: 58, column: 9)
!167 = !DILocation(line: 59, column: 20, scope: !166)
!168 = !DILocation(line: 59, column: 26, scope: !166)
!169 = !DILocation(line: 61, column: 19, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !33, line: 61, column: 13)
!171 = !DILocation(line: 61, column: 17, scope: !170)
!172 = !DILocation(line: 61, column: 24, scope: !173)
!173 = distinct !DILexicalBlock(scope: !170, file: !33, line: 61, column: 13)
!174 = !DILocation(line: 61, column: 26, scope: !173)
!175 = !DILocation(line: 61, column: 13, scope: !170)
!176 = !DILocation(line: 63, column: 30, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !33, line: 62, column: 13)
!178 = !DILocation(line: 63, column: 37, scope: !177)
!179 = !DILocation(line: 63, column: 17, scope: !177)
!180 = !DILocation(line: 64, column: 13, scope: !177)
!181 = !DILocation(line: 61, column: 33, scope: !173)
!182 = !DILocation(line: 61, column: 13, scope: !173)
!183 = distinct !{!183, !175, !184, !160}
!184 = !DILocation(line: 64, column: 13, scope: !170)
!185 = !DILocation(line: 65, column: 9, scope: !166)
!186 = !DILocation(line: 68, column: 13, scope: !187)
!187 = distinct !DILexicalBlock(scope: !162, file: !33, line: 67, column: 9)
!188 = !DILocation(line: 70, column: 14, scope: !132)
!189 = !DILocation(line: 70, column: 9, scope: !132)
!190 = !DILocation(line: 72, column: 1, scope: !126)
!191 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_41_good", scope: !33, file: !33, line: 278, type: !34, scopeLine: 279, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!192 = !DILocation(line: 280, column: 5, scope: !191)
!193 = !DILocation(line: 281, column: 5, scope: !191)
!194 = !DILocation(line: 282, column: 1, scope: !191)
!195 = distinct !DISubprogram(name: "main", scope: !33, file: !33, line: 293, type: !196, scopeLine: 294, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!196 = !DISubroutineType(types: !197)
!197 = !{!23, !23, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!200 = !DILocalVariable(name: "argc", arg: 1, scope: !195, file: !33, line: 293, type: !23)
!201 = !DILocation(line: 293, column: 14, scope: !195)
!202 = !DILocalVariable(name: "argv", arg: 2, scope: !195, file: !33, line: 293, type: !198)
!203 = !DILocation(line: 293, column: 27, scope: !195)
!204 = !DILocation(line: 296, column: 22, scope: !195)
!205 = !DILocation(line: 296, column: 12, scope: !195)
!206 = !DILocation(line: 296, column: 5, scope: !195)
!207 = !DILocation(line: 298, column: 5, scope: !195)
!208 = !DILocation(line: 299, column: 5, scope: !195)
!209 = !DILocation(line: 300, column: 5, scope: !195)
!210 = !DILocation(line: 303, column: 5, scope: !195)
!211 = !DILocation(line: 304, column: 5, scope: !195)
!212 = !DILocation(line: 305, column: 5, scope: !195)
!213 = !DILocation(line: 307, column: 5, scope: !195)
!214 = distinct !DISubprogram(name: "goodB2G", scope: !33, file: !33, line: 214, type: !34, scopeLine: 215, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!215 = !DILocalVariable(name: "data", scope: !214, file: !33, line: 216, type: !23)
!216 = !DILocation(line: 216, column: 9, scope: !214)
!217 = !DILocation(line: 218, column: 10, scope: !214)
!218 = !DILocalVariable(name: "recvResult", scope: !219, file: !33, line: 224, type: !23)
!219 = distinct !DILexicalBlock(scope: !214, file: !33, line: 219, column: 5)
!220 = !DILocation(line: 224, column: 13, scope: !219)
!221 = !DILocalVariable(name: "service", scope: !219, file: !33, line: 225, type: !44)
!222 = !DILocation(line: 225, column: 28, scope: !219)
!223 = !DILocalVariable(name: "connectSocket", scope: !219, file: !33, line: 226, type: !23)
!224 = !DILocation(line: 226, column: 16, scope: !219)
!225 = !DILocalVariable(name: "inputBuffer", scope: !219, file: !33, line: 227, type: !17)
!226 = !DILocation(line: 227, column: 14, scope: !219)
!227 = !DILocation(line: 228, column: 9, scope: !219)
!228 = !DILocation(line: 238, column: 29, scope: !229)
!229 = distinct !DILexicalBlock(scope: !219, file: !33, line: 229, column: 9)
!230 = !DILocation(line: 238, column: 27, scope: !229)
!231 = !DILocation(line: 239, column: 17, scope: !232)
!232 = distinct !DILexicalBlock(scope: !229, file: !33, line: 239, column: 17)
!233 = !DILocation(line: 239, column: 31, scope: !232)
!234 = !DILocation(line: 239, column: 17, scope: !229)
!235 = !DILocation(line: 241, column: 17, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !33, line: 240, column: 13)
!237 = !DILocation(line: 243, column: 13, scope: !229)
!238 = !DILocation(line: 244, column: 21, scope: !229)
!239 = !DILocation(line: 244, column: 32, scope: !229)
!240 = !DILocation(line: 245, column: 39, scope: !229)
!241 = !DILocation(line: 245, column: 21, scope: !229)
!242 = !DILocation(line: 245, column: 30, scope: !229)
!243 = !DILocation(line: 245, column: 37, scope: !229)
!244 = !DILocation(line: 246, column: 21, scope: !229)
!245 = !DILocation(line: 246, column: 30, scope: !229)
!246 = !DILocation(line: 247, column: 25, scope: !247)
!247 = distinct !DILexicalBlock(scope: !229, file: !33, line: 247, column: 17)
!248 = !DILocation(line: 247, column: 40, scope: !247)
!249 = !DILocation(line: 247, column: 17, scope: !247)
!250 = !DILocation(line: 247, column: 85, scope: !247)
!251 = !DILocation(line: 247, column: 17, scope: !229)
!252 = !DILocation(line: 249, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !247, file: !33, line: 248, column: 13)
!254 = !DILocation(line: 253, column: 31, scope: !229)
!255 = !DILocation(line: 253, column: 46, scope: !229)
!256 = !DILocation(line: 253, column: 26, scope: !229)
!257 = !DILocation(line: 253, column: 24, scope: !229)
!258 = !DILocation(line: 254, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !229, file: !33, line: 254, column: 17)
!260 = !DILocation(line: 254, column: 28, scope: !259)
!261 = !DILocation(line: 254, column: 44, scope: !259)
!262 = !DILocation(line: 254, column: 47, scope: !259)
!263 = !DILocation(line: 254, column: 58, scope: !259)
!264 = !DILocation(line: 254, column: 17, scope: !229)
!265 = !DILocation(line: 256, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !259, file: !33, line: 255, column: 13)
!267 = !DILocation(line: 259, column: 25, scope: !229)
!268 = !DILocation(line: 259, column: 13, scope: !229)
!269 = !DILocation(line: 259, column: 37, scope: !229)
!270 = !DILocation(line: 261, column: 25, scope: !229)
!271 = !DILocation(line: 261, column: 20, scope: !229)
!272 = !DILocation(line: 261, column: 18, scope: !229)
!273 = !DILocation(line: 262, column: 9, scope: !229)
!274 = !DILocation(line: 264, column: 13, scope: !275)
!275 = distinct !DILexicalBlock(scope: !219, file: !33, line: 264, column: 13)
!276 = !DILocation(line: 264, column: 27, scope: !275)
!277 = !DILocation(line: 264, column: 13, scope: !219)
!278 = !DILocation(line: 266, column: 26, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !33, line: 265, column: 9)
!280 = !DILocation(line: 266, column: 13, scope: !279)
!281 = !DILocation(line: 267, column: 9, scope: !279)
!282 = !DILocation(line: 275, column: 17, scope: !214)
!283 = !DILocation(line: 275, column: 5, scope: !214)
!284 = !DILocation(line: 276, column: 1, scope: !214)
!285 = distinct !DISubprogram(name: "goodB2GSink", scope: !33, file: !33, line: 185, type: !127, scopeLine: 186, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!286 = !DILocalVariable(name: "data", arg: 1, scope: !285, file: !33, line: 185, type: !23)
!287 = !DILocation(line: 185, column: 29, scope: !285)
!288 = !DILocalVariable(name: "i", scope: !289, file: !33, line: 188, type: !23)
!289 = distinct !DILexicalBlock(scope: !285, file: !33, line: 187, column: 5)
!290 = !DILocation(line: 188, column: 13, scope: !289)
!291 = !DILocalVariable(name: "buffer", scope: !289, file: !33, line: 189, type: !22)
!292 = !DILocation(line: 189, column: 15, scope: !289)
!293 = !DILocation(line: 189, column: 31, scope: !289)
!294 = !DILocation(line: 189, column: 24, scope: !289)
!295 = !DILocation(line: 190, column: 13, scope: !296)
!296 = distinct !DILexicalBlock(scope: !289, file: !33, line: 190, column: 13)
!297 = !DILocation(line: 190, column: 20, scope: !296)
!298 = !DILocation(line: 190, column: 13, scope: !289)
!299 = !DILocation(line: 190, column: 30, scope: !300)
!300 = distinct !DILexicalBlock(scope: !296, file: !33, line: 190, column: 29)
!301 = !DILocation(line: 192, column: 16, scope: !302)
!302 = distinct !DILexicalBlock(scope: !289, file: !33, line: 192, column: 9)
!303 = !DILocation(line: 192, column: 14, scope: !302)
!304 = !DILocation(line: 192, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !302, file: !33, line: 192, column: 9)
!306 = !DILocation(line: 192, column: 23, scope: !305)
!307 = !DILocation(line: 192, column: 9, scope: !302)
!308 = !DILocation(line: 194, column: 13, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !33, line: 193, column: 9)
!310 = !DILocation(line: 194, column: 20, scope: !309)
!311 = !DILocation(line: 194, column: 23, scope: !309)
!312 = !DILocation(line: 195, column: 9, scope: !309)
!313 = !DILocation(line: 192, column: 30, scope: !305)
!314 = !DILocation(line: 192, column: 9, scope: !305)
!315 = distinct !{!315, !307, !316, !160}
!316 = !DILocation(line: 195, column: 9, scope: !302)
!317 = !DILocation(line: 197, column: 13, scope: !318)
!318 = distinct !DILexicalBlock(scope: !289, file: !33, line: 197, column: 13)
!319 = !DILocation(line: 197, column: 18, scope: !318)
!320 = !DILocation(line: 197, column: 23, scope: !318)
!321 = !DILocation(line: 197, column: 26, scope: !318)
!322 = !DILocation(line: 197, column: 31, scope: !318)
!323 = !DILocation(line: 197, column: 13, scope: !289)
!324 = !DILocation(line: 199, column: 13, scope: !325)
!325 = distinct !DILexicalBlock(scope: !318, file: !33, line: 198, column: 9)
!326 = !DILocation(line: 199, column: 20, scope: !325)
!327 = !DILocation(line: 199, column: 26, scope: !325)
!328 = !DILocation(line: 201, column: 19, scope: !329)
!329 = distinct !DILexicalBlock(scope: !325, file: !33, line: 201, column: 13)
!330 = !DILocation(line: 201, column: 17, scope: !329)
!331 = !DILocation(line: 201, column: 24, scope: !332)
!332 = distinct !DILexicalBlock(scope: !329, file: !33, line: 201, column: 13)
!333 = !DILocation(line: 201, column: 26, scope: !332)
!334 = !DILocation(line: 201, column: 13, scope: !329)
!335 = !DILocation(line: 203, column: 30, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !33, line: 202, column: 13)
!337 = !DILocation(line: 203, column: 37, scope: !336)
!338 = !DILocation(line: 203, column: 17, scope: !336)
!339 = !DILocation(line: 204, column: 13, scope: !336)
!340 = !DILocation(line: 201, column: 33, scope: !332)
!341 = !DILocation(line: 201, column: 13, scope: !332)
!342 = distinct !{!342, !334, !343, !160}
!343 = !DILocation(line: 204, column: 13, scope: !329)
!344 = !DILocation(line: 205, column: 9, scope: !325)
!345 = !DILocation(line: 208, column: 13, scope: !346)
!346 = distinct !DILexicalBlock(scope: !318, file: !33, line: 207, column: 9)
!347 = !DILocation(line: 210, column: 14, scope: !289)
!348 = !DILocation(line: 210, column: 9, scope: !289)
!349 = !DILocation(line: 212, column: 1, scope: !285)
!350 = distinct !DISubprogram(name: "goodG2B", scope: !33, file: !33, line: 173, type: !34, scopeLine: 174, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!351 = !DILocalVariable(name: "data", scope: !350, file: !33, line: 175, type: !23)
!352 = !DILocation(line: 175, column: 9, scope: !350)
!353 = !DILocation(line: 177, column: 10, scope: !350)
!354 = !DILocation(line: 180, column: 10, scope: !350)
!355 = !DILocation(line: 181, column: 17, scope: !350)
!356 = !DILocation(line: 181, column: 5, scope: !350)
!357 = !DILocation(line: 182, column: 1, scope: !350)
!358 = distinct !DISubprogram(name: "goodG2BSink", scope: !33, file: !33, line: 143, type: !127, scopeLine: 144, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!359 = !DILocalVariable(name: "data", arg: 1, scope: !358, file: !33, line: 143, type: !23)
!360 = !DILocation(line: 143, column: 29, scope: !358)
!361 = !DILocalVariable(name: "i", scope: !362, file: !33, line: 146, type: !23)
!362 = distinct !DILexicalBlock(scope: !358, file: !33, line: 145, column: 5)
!363 = !DILocation(line: 146, column: 13, scope: !362)
!364 = !DILocalVariable(name: "buffer", scope: !362, file: !33, line: 147, type: !22)
!365 = !DILocation(line: 147, column: 15, scope: !362)
!366 = !DILocation(line: 147, column: 31, scope: !362)
!367 = !DILocation(line: 147, column: 24, scope: !362)
!368 = !DILocation(line: 148, column: 13, scope: !369)
!369 = distinct !DILexicalBlock(scope: !362, file: !33, line: 148, column: 13)
!370 = !DILocation(line: 148, column: 20, scope: !369)
!371 = !DILocation(line: 148, column: 13, scope: !362)
!372 = !DILocation(line: 148, column: 30, scope: !373)
!373 = distinct !DILexicalBlock(scope: !369, file: !33, line: 148, column: 29)
!374 = !DILocation(line: 150, column: 16, scope: !375)
!375 = distinct !DILexicalBlock(scope: !362, file: !33, line: 150, column: 9)
!376 = !DILocation(line: 150, column: 14, scope: !375)
!377 = !DILocation(line: 150, column: 21, scope: !378)
!378 = distinct !DILexicalBlock(scope: !375, file: !33, line: 150, column: 9)
!379 = !DILocation(line: 150, column: 23, scope: !378)
!380 = !DILocation(line: 150, column: 9, scope: !375)
!381 = !DILocation(line: 152, column: 13, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !33, line: 151, column: 9)
!383 = !DILocation(line: 152, column: 20, scope: !382)
!384 = !DILocation(line: 152, column: 23, scope: !382)
!385 = !DILocation(line: 153, column: 9, scope: !382)
!386 = !DILocation(line: 150, column: 30, scope: !378)
!387 = !DILocation(line: 150, column: 9, scope: !378)
!388 = distinct !{!388, !380, !389, !160}
!389 = !DILocation(line: 153, column: 9, scope: !375)
!390 = !DILocation(line: 156, column: 13, scope: !391)
!391 = distinct !DILexicalBlock(scope: !362, file: !33, line: 156, column: 13)
!392 = !DILocation(line: 156, column: 18, scope: !391)
!393 = !DILocation(line: 156, column: 13, scope: !362)
!394 = !DILocation(line: 158, column: 13, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !33, line: 157, column: 9)
!396 = !DILocation(line: 158, column: 20, scope: !395)
!397 = !DILocation(line: 158, column: 26, scope: !395)
!398 = !DILocation(line: 160, column: 19, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !33, line: 160, column: 13)
!400 = !DILocation(line: 160, column: 17, scope: !399)
!401 = !DILocation(line: 160, column: 24, scope: !402)
!402 = distinct !DILexicalBlock(scope: !399, file: !33, line: 160, column: 13)
!403 = !DILocation(line: 160, column: 26, scope: !402)
!404 = !DILocation(line: 160, column: 13, scope: !399)
!405 = !DILocation(line: 162, column: 30, scope: !406)
!406 = distinct !DILexicalBlock(scope: !402, file: !33, line: 161, column: 13)
!407 = !DILocation(line: 162, column: 37, scope: !406)
!408 = !DILocation(line: 162, column: 17, scope: !406)
!409 = !DILocation(line: 163, column: 13, scope: !406)
!410 = !DILocation(line: 160, column: 33, scope: !402)
!411 = !DILocation(line: 160, column: 13, scope: !402)
!412 = distinct !{!412, !404, !413, !160}
!413 = !DILocation(line: 163, column: 13, scope: !399)
!414 = !DILocation(line: 164, column: 9, scope: !395)
!415 = !DILocation(line: 167, column: 13, scope: !416)
!416 = distinct !DILexicalBlock(scope: !391, file: !33, line: 166, column: 9)
!417 = !DILocation(line: 169, column: 14, scope: !362)
!418 = !DILocation(line: 169, column: 9, scope: !362)
!419 = !DILocation(line: 171, column: 1, scope: !358)
