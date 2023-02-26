; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_bad() #0 !dbg !34 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 -1, i32* %data, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !42, metadata !DIExpression()), !dbg !44
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !153, metadata !DIExpression()), !dbg !154
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !155
  %15 = bitcast i8* %call32 to i32*, !dbg !156
  store i32* %15, i32** %buffer, align 8, !dbg !154
  %16 = load i32*, i32** %buffer, align 8, !dbg !157
  %cmp33 = icmp eq i32* %16, null, !dbg !159
  br i1 %cmp33, label %if.then35, label %if.end36, !dbg !160

if.then35:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !161
  unreachable, !dbg !161

if.end36:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end36
  %17 = load i32, i32* %i, align 4, !dbg !166
  %cmp37 = icmp slt i32 %17, 10, !dbg !168
  br i1 %cmp37, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !170
  %19 = load i32, i32* %i, align 4, !dbg !172
  %idxprom39 = sext i32 %19 to i64, !dbg !170
  %arrayidx40 = getelementptr inbounds i32, i32* %18, i64 %idxprom39, !dbg !170
  store i32 0, i32* %arrayidx40, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !175
  %inc = add nsw i32 %20, 1, !dbg !175
  store i32 %inc, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !180
  %cmp41 = icmp sge i32 %21, 0, !dbg !182
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !183

if.then43:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !184
  %23 = load i32, i32* %data, align 4, !dbg !186
  %idxprom44 = sext i32 %23 to i64, !dbg !184
  %arrayidx45 = getelementptr inbounds i32, i32* %22, i64 %idxprom44, !dbg !184
  store i32 1, i32* %arrayidx45, align 4, !dbg !187
  store i32 0, i32* %i, align 4, !dbg !188
  br label %for.cond46, !dbg !190

for.cond46:                                       ; preds = %for.inc52, %if.then43
  %24 = load i32, i32* %i, align 4, !dbg !191
  %cmp47 = icmp slt i32 %24, 10, !dbg !193
  br i1 %cmp47, label %for.body49, label %for.end54, !dbg !194

for.body49:                                       ; preds = %for.cond46
  %25 = load i32*, i32** %buffer, align 8, !dbg !195
  %26 = load i32, i32* %i, align 4, !dbg !197
  %idxprom50 = sext i32 %26 to i64, !dbg !195
  %arrayidx51 = getelementptr inbounds i32, i32* %25, i64 %idxprom50, !dbg !195
  %27 = load i32, i32* %arrayidx51, align 4, !dbg !195
  call void @printIntLine(i32 noundef %27), !dbg !198
  br label %for.inc52, !dbg !199

for.inc52:                                        ; preds = %for.body49
  %28 = load i32, i32* %i, align 4, !dbg !200
  %inc53 = add nsw i32 %28, 1, !dbg !200
  store i32 %inc53, i32* %i, align 4, !dbg !200
  br label %for.cond46, !dbg !201, !llvm.loop !202

for.end54:                                        ; preds = %for.cond46
  br label %if.end55, !dbg !204

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !205
  br label %if.end55

if.end55:                                         ; preds = %if.else, %for.end54
  %29 = load i32*, i32** %buffer, align 8, !dbg !207
  %30 = bitcast i32* %29 to i8*, !dbg !207
  call void @free(i8* noundef %30), !dbg !208
  ret void, !dbg !209
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

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_good() #0 !dbg !210 {
entry:
  call void @goodB2G1(), !dbg !211
  call void @goodB2G2(), !dbg !212
  call void @goodG2B1(), !dbg !213
  call void @goodG2B2(), !dbg !214
  ret void, !dbg !215
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !216 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !221, metadata !DIExpression()), !dbg !222
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !223, metadata !DIExpression()), !dbg !224
  %call = call i64 @time(i64* noundef null), !dbg !225
  %conv = trunc i64 %call to i32, !dbg !226
  call void @srand(i32 noundef %conv), !dbg !227
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !228
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_good(), !dbg !229
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !230
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !231
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_bad(), !dbg !232
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !233
  ret i32 0, !dbg !234
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !235 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !236, metadata !DIExpression()), !dbg !237
  store i32 -1, i32* %data, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !239, metadata !DIExpression()), !dbg !241
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !242, metadata !DIExpression()), !dbg !243
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !244, metadata !DIExpression()), !dbg !245
  store i32 -1, i32* %listenSocket, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !246, metadata !DIExpression()), !dbg !247
  store i32 -1, i32* %acceptSocket, align 4, !dbg !247
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !248, metadata !DIExpression()), !dbg !249
  br label %do.body, !dbg !250

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !251
  store i32 %call, i32* %listenSocket, align 4, !dbg !253
  %0 = load i32, i32* %listenSocket, align 4, !dbg !254
  %cmp = icmp eq i32 %0, -1, !dbg !256
  br i1 %cmp, label %if.then, label %if.end, !dbg !257

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !258

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !260
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !260
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !261
  store i8 2, i8* %sin_family, align 1, !dbg !262
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !263
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !264
  store i32 0, i32* %s_addr, align 4, !dbg !265
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !266
  store i16 -30871, i16* %sin_port, align 2, !dbg !267
  %2 = load i32, i32* %listenSocket, align 4, !dbg !268
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !270
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !271
  %cmp2 = icmp eq i32 %call1, -1, !dbg !272
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !273

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !274

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !276
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !278
  %cmp6 = icmp eq i32 %call5, -1, !dbg !279
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !280

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !281

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !283
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !284
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !285
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !286
  %cmp10 = icmp eq i32 %6, -1, !dbg !288
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !289

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !290

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !292
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !293
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !294
  %conv = trunc i64 %call13 to i32, !dbg !294
  store i32 %conv, i32* %recvResult, align 4, !dbg !295
  %8 = load i32, i32* %recvResult, align 4, !dbg !296
  %cmp14 = icmp eq i32 %8, -1, !dbg !298
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !299

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !300
  %cmp16 = icmp eq i32 %9, 0, !dbg !301
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !302

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !303

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !305
  %idxprom = sext i32 %10 to i64, !dbg !306
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !306
  store i8 0, i8* %arrayidx, align 1, !dbg !307
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !308
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !309
  store i32 %call21, i32* %data, align 4, !dbg !310
  br label %do.end, !dbg !311

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !312
  %cmp22 = icmp ne i32 %11, -1, !dbg !314
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !315

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !316
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !318
  br label %if.end26, !dbg !319

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !320
  %cmp27 = icmp ne i32 %13, -1, !dbg !322
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !323

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !324
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !326
  br label %if.end31, !dbg !327

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !328, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !331, metadata !DIExpression()), !dbg !332
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !333
  %15 = bitcast i8* %call32 to i32*, !dbg !334
  store i32* %15, i32** %buffer, align 8, !dbg !332
  %16 = load i32*, i32** %buffer, align 8, !dbg !335
  %cmp33 = icmp eq i32* %16, null, !dbg !337
  br i1 %cmp33, label %if.then35, label %if.end36, !dbg !338

if.then35:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !339
  unreachable, !dbg !339

if.end36:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !343

for.cond:                                         ; preds = %for.inc, %if.end36
  %17 = load i32, i32* %i, align 4, !dbg !344
  %cmp37 = icmp slt i32 %17, 10, !dbg !346
  br i1 %cmp37, label %for.body, label %for.end, !dbg !347

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !348
  %19 = load i32, i32* %i, align 4, !dbg !350
  %idxprom39 = sext i32 %19 to i64, !dbg !348
  %arrayidx40 = getelementptr inbounds i32, i32* %18, i64 %idxprom39, !dbg !348
  store i32 0, i32* %arrayidx40, align 4, !dbg !351
  br label %for.inc, !dbg !352

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !353
  %inc = add nsw i32 %20, 1, !dbg !353
  store i32 %inc, i32* %i, align 4, !dbg !353
  br label %for.cond, !dbg !354, !llvm.loop !355

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !357
  %cmp41 = icmp sge i32 %21, 0, !dbg !359
  br i1 %cmp41, label %land.lhs.true, label %if.else, !dbg !360

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !361
  %cmp43 = icmp slt i32 %22, 10, !dbg !362
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !363

if.then45:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !364
  %24 = load i32, i32* %data, align 4, !dbg !366
  %idxprom46 = sext i32 %24 to i64, !dbg !364
  %arrayidx47 = getelementptr inbounds i32, i32* %23, i64 %idxprom46, !dbg !364
  store i32 1, i32* %arrayidx47, align 4, !dbg !367
  store i32 0, i32* %i, align 4, !dbg !368
  br label %for.cond48, !dbg !370

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %25 = load i32, i32* %i, align 4, !dbg !371
  %cmp49 = icmp slt i32 %25, 10, !dbg !373
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !374

for.body51:                                       ; preds = %for.cond48
  %26 = load i32*, i32** %buffer, align 8, !dbg !375
  %27 = load i32, i32* %i, align 4, !dbg !377
  %idxprom52 = sext i32 %27 to i64, !dbg !375
  %arrayidx53 = getelementptr inbounds i32, i32* %26, i64 %idxprom52, !dbg !375
  %28 = load i32, i32* %arrayidx53, align 4, !dbg !375
  call void @printIntLine(i32 noundef %28), !dbg !378
  br label %for.inc54, !dbg !379

for.inc54:                                        ; preds = %for.body51
  %29 = load i32, i32* %i, align 4, !dbg !380
  %inc55 = add nsw i32 %29, 1, !dbg !380
  store i32 %inc55, i32* %i, align 4, !dbg !380
  br label %for.cond48, !dbg !381, !llvm.loop !382

for.end56:                                        ; preds = %for.cond48
  br label %if.end57, !dbg !384

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !385
  br label %if.end57

if.end57:                                         ; preds = %if.else, %for.end56
  %30 = load i32*, i32** %buffer, align 8, !dbg !387
  %31 = bitcast i32* %30 to i8*, !dbg !387
  call void @free(i8* noundef %31), !dbg !388
  ret void, !dbg !389
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !390 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !391, metadata !DIExpression()), !dbg !392
  store i32 -1, i32* %data, align 4, !dbg !393
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !394, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !397, metadata !DIExpression()), !dbg !398
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !399, metadata !DIExpression()), !dbg !400
  store i32 -1, i32* %listenSocket, align 4, !dbg !400
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !401, metadata !DIExpression()), !dbg !402
  store i32 -1, i32* %acceptSocket, align 4, !dbg !402
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !403, metadata !DIExpression()), !dbg !404
  br label %do.body, !dbg !405

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !406
  store i32 %call, i32* %listenSocket, align 4, !dbg !408
  %0 = load i32, i32* %listenSocket, align 4, !dbg !409
  %cmp = icmp eq i32 %0, -1, !dbg !411
  br i1 %cmp, label %if.then, label %if.end, !dbg !412

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !413

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !415
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !415
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !416
  store i8 2, i8* %sin_family, align 1, !dbg !417
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !418
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !419
  store i32 0, i32* %s_addr, align 4, !dbg !420
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !421
  store i16 -30871, i16* %sin_port, align 2, !dbg !422
  %2 = load i32, i32* %listenSocket, align 4, !dbg !423
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !425
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !426
  %cmp2 = icmp eq i32 %call1, -1, !dbg !427
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !428

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !429

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !431
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !433
  %cmp6 = icmp eq i32 %call5, -1, !dbg !434
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !435

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !436

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !438
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !439
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !440
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !441
  %cmp10 = icmp eq i32 %6, -1, !dbg !443
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !444

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !445

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !447
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !448
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !449
  %conv = trunc i64 %call13 to i32, !dbg !449
  store i32 %conv, i32* %recvResult, align 4, !dbg !450
  %8 = load i32, i32* %recvResult, align 4, !dbg !451
  %cmp14 = icmp eq i32 %8, -1, !dbg !453
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !454

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !455
  %cmp16 = icmp eq i32 %9, 0, !dbg !456
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !457

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !458

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !460
  %idxprom = sext i32 %10 to i64, !dbg !461
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !461
  store i8 0, i8* %arrayidx, align 1, !dbg !462
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !463
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !464
  store i32 %call21, i32* %data, align 4, !dbg !465
  br label %do.end, !dbg !466

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !467
  %cmp22 = icmp ne i32 %11, -1, !dbg !469
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !470

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !471
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !473
  br label %if.end26, !dbg !474

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !475
  %cmp27 = icmp ne i32 %13, -1, !dbg !477
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !478

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !479
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !481
  br label %if.end31, !dbg !482

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !483, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !486, metadata !DIExpression()), !dbg !487
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !488
  %15 = bitcast i8* %call32 to i32*, !dbg !489
  store i32* %15, i32** %buffer, align 8, !dbg !487
  %16 = load i32*, i32** %buffer, align 8, !dbg !490
  %cmp33 = icmp eq i32* %16, null, !dbg !492
  br i1 %cmp33, label %if.then35, label %if.end36, !dbg !493

if.then35:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !494
  unreachable, !dbg !494

if.end36:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !496
  br label %for.cond, !dbg !498

for.cond:                                         ; preds = %for.inc, %if.end36
  %17 = load i32, i32* %i, align 4, !dbg !499
  %cmp37 = icmp slt i32 %17, 10, !dbg !501
  br i1 %cmp37, label %for.body, label %for.end, !dbg !502

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !503
  %19 = load i32, i32* %i, align 4, !dbg !505
  %idxprom39 = sext i32 %19 to i64, !dbg !503
  %arrayidx40 = getelementptr inbounds i32, i32* %18, i64 %idxprom39, !dbg !503
  store i32 0, i32* %arrayidx40, align 4, !dbg !506
  br label %for.inc, !dbg !507

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !508
  %inc = add nsw i32 %20, 1, !dbg !508
  store i32 %inc, i32* %i, align 4, !dbg !508
  br label %for.cond, !dbg !509, !llvm.loop !510

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !512
  %cmp41 = icmp sge i32 %21, 0, !dbg !514
  br i1 %cmp41, label %land.lhs.true, label %if.else, !dbg !515

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !516
  %cmp43 = icmp slt i32 %22, 10, !dbg !517
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !518

if.then45:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !519
  %24 = load i32, i32* %data, align 4, !dbg !521
  %idxprom46 = sext i32 %24 to i64, !dbg !519
  %arrayidx47 = getelementptr inbounds i32, i32* %23, i64 %idxprom46, !dbg !519
  store i32 1, i32* %arrayidx47, align 4, !dbg !522
  store i32 0, i32* %i, align 4, !dbg !523
  br label %for.cond48, !dbg !525

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %25 = load i32, i32* %i, align 4, !dbg !526
  %cmp49 = icmp slt i32 %25, 10, !dbg !528
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !529

for.body51:                                       ; preds = %for.cond48
  %26 = load i32*, i32** %buffer, align 8, !dbg !530
  %27 = load i32, i32* %i, align 4, !dbg !532
  %idxprom52 = sext i32 %27 to i64, !dbg !530
  %arrayidx53 = getelementptr inbounds i32, i32* %26, i64 %idxprom52, !dbg !530
  %28 = load i32, i32* %arrayidx53, align 4, !dbg !530
  call void @printIntLine(i32 noundef %28), !dbg !533
  br label %for.inc54, !dbg !534

for.inc54:                                        ; preds = %for.body51
  %29 = load i32, i32* %i, align 4, !dbg !535
  %inc55 = add nsw i32 %29, 1, !dbg !535
  store i32 %inc55, i32* %i, align 4, !dbg !535
  br label %for.cond48, !dbg !536, !llvm.loop !537

for.end56:                                        ; preds = %for.cond48
  br label %if.end57, !dbg !539

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !540
  br label %if.end57

if.end57:                                         ; preds = %if.else, %for.end56
  %30 = load i32*, i32** %buffer, align 8, !dbg !542
  %31 = bitcast i32* %30 to i8*, !dbg !542
  call void @free(i8* noundef %31), !dbg !543
  ret void, !dbg !544
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !545 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !546, metadata !DIExpression()), !dbg !547
  store i32 -1, i32* %data, align 4, !dbg !548
  store i32 7, i32* %data, align 4, !dbg !549
  call void @llvm.dbg.declare(metadata i32* %i, metadata !550, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !553, metadata !DIExpression()), !dbg !554
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !555
  %0 = bitcast i8* %call to i32*, !dbg !556
  store i32* %0, i32** %buffer, align 8, !dbg !554
  %1 = load i32*, i32** %buffer, align 8, !dbg !557
  %cmp = icmp eq i32* %1, null, !dbg !559
  br i1 %cmp, label %if.then, label %if.end, !dbg !560

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !561
  unreachable, !dbg !561

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !563
  br label %for.cond, !dbg !565

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !566
  %cmp1 = icmp slt i32 %2, 10, !dbg !568
  br i1 %cmp1, label %for.body, label %for.end, !dbg !569

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !570
  %4 = load i32, i32* %i, align 4, !dbg !572
  %idxprom = sext i32 %4 to i64, !dbg !570
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !570
  store i32 0, i32* %arrayidx, align 4, !dbg !573
  br label %for.inc, !dbg !574

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !575
  %inc = add nsw i32 %5, 1, !dbg !575
  store i32 %inc, i32* %i, align 4, !dbg !575
  br label %for.cond, !dbg !576, !llvm.loop !577

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !579
  %cmp2 = icmp sge i32 %6, 0, !dbg !581
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !582

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !583
  %8 = load i32, i32* %data, align 4, !dbg !585
  %idxprom4 = sext i32 %8 to i64, !dbg !583
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !583
  store i32 1, i32* %arrayidx5, align 4, !dbg !586
  store i32 0, i32* %i, align 4, !dbg !587
  br label %for.cond6, !dbg !589

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !590
  %cmp7 = icmp slt i32 %9, 10, !dbg !592
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !593

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !594
  %11 = load i32, i32* %i, align 4, !dbg !596
  %idxprom9 = sext i32 %11 to i64, !dbg !594
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !594
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !594
  call void @printIntLine(i32 noundef %12), !dbg !597
  br label %for.inc11, !dbg !598

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !599
  %inc12 = add nsw i32 %13, 1, !dbg !599
  store i32 %inc12, i32* %i, align 4, !dbg !599
  br label %for.cond6, !dbg !600, !llvm.loop !601

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !603

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !604
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !606
  %15 = bitcast i32* %14 to i8*, !dbg !606
  call void @free(i8* noundef %15), !dbg !607
  ret void, !dbg !608
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !609 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !610, metadata !DIExpression()), !dbg !611
  store i32 -1, i32* %data, align 4, !dbg !612
  store i32 7, i32* %data, align 4, !dbg !613
  call void @llvm.dbg.declare(metadata i32* %i, metadata !614, metadata !DIExpression()), !dbg !616
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !617, metadata !DIExpression()), !dbg !618
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !619
  %0 = bitcast i8* %call to i32*, !dbg !620
  store i32* %0, i32** %buffer, align 8, !dbg !618
  %1 = load i32*, i32** %buffer, align 8, !dbg !621
  %cmp = icmp eq i32* %1, null, !dbg !623
  br i1 %cmp, label %if.then, label %if.end, !dbg !624

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !625
  unreachable, !dbg !625

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !627
  br label %for.cond, !dbg !629

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !630
  %cmp1 = icmp slt i32 %2, 10, !dbg !632
  br i1 %cmp1, label %for.body, label %for.end, !dbg !633

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !634
  %4 = load i32, i32* %i, align 4, !dbg !636
  %idxprom = sext i32 %4 to i64, !dbg !634
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !634
  store i32 0, i32* %arrayidx, align 4, !dbg !637
  br label %for.inc, !dbg !638

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !639
  %inc = add nsw i32 %5, 1, !dbg !639
  store i32 %inc, i32* %i, align 4, !dbg !639
  br label %for.cond, !dbg !640, !llvm.loop !641

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !643
  %cmp2 = icmp sge i32 %6, 0, !dbg !645
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !646

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !647
  %8 = load i32, i32* %data, align 4, !dbg !649
  %idxprom4 = sext i32 %8 to i64, !dbg !647
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !647
  store i32 1, i32* %arrayidx5, align 4, !dbg !650
  store i32 0, i32* %i, align 4, !dbg !651
  br label %for.cond6, !dbg !653

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !654
  %cmp7 = icmp slt i32 %9, 10, !dbg !656
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !657

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !658
  %11 = load i32, i32* %i, align 4, !dbg !660
  %idxprom9 = sext i32 %11 to i64, !dbg !658
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !658
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !658
  call void @printIntLine(i32 noundef %12), !dbg !661
  br label %for.inc11, !dbg !662

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !663
  %inc12 = add nsw i32 %13, 1, !dbg !663
  store i32 %inc12, i32* %i, align 4, !dbg !663
  br label %for.cond6, !dbg !664, !llvm.loop !665

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !667

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !668
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !670
  %15 = bitcast i32* %14 to i8*, !dbg !670
  call void @free(i8* noundef %15), !dbg !671
  ret void, !dbg !672
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
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32}
!llvm.ident = !{!33}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !9, !24, !26, !5}
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
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = !{i32 7, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"PIC Level", i32 2}
!31 = !{i32 7, !"uwtable", i32 1}
!32 = !{i32 7, !"frame-pointer", i32 2}
!33 = !{!"Homebrew clang version 14.0.6"}
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_bad", scope: !35, file: !35, line: 44, type: !36, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!35 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !{}
!39 = !DILocalVariable(name: "data", scope: !34, file: !35, line: 46, type: !25)
!40 = !DILocation(line: 46, column: 9, scope: !34)
!41 = !DILocation(line: 48, column: 10, scope: !34)
!42 = !DILocalVariable(name: "recvResult", scope: !43, file: !35, line: 57, type: !25)
!43 = distinct !DILexicalBlock(scope: !34, file: !35, line: 52, column: 5)
!44 = !DILocation(line: 57, column: 13, scope: !43)
!45 = !DILocalVariable(name: "service", scope: !43, file: !35, line: 58, type: !46)
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
!65 = !DILocation(line: 58, column: 28, scope: !43)
!66 = !DILocalVariable(name: "listenSocket", scope: !43, file: !35, line: 59, type: !25)
!67 = !DILocation(line: 59, column: 16, scope: !43)
!68 = !DILocalVariable(name: "acceptSocket", scope: !43, file: !35, line: 60, type: !25)
!69 = !DILocation(line: 60, column: 16, scope: !43)
!70 = !DILocalVariable(name: "inputBuffer", scope: !43, file: !35, line: 61, type: !20)
!71 = !DILocation(line: 61, column: 14, scope: !43)
!72 = !DILocation(line: 62, column: 9, scope: !43)
!73 = !DILocation(line: 72, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !43, file: !35, line: 63, column: 9)
!75 = !DILocation(line: 72, column: 26, scope: !74)
!76 = !DILocation(line: 73, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !35, line: 73, column: 17)
!78 = !DILocation(line: 73, column: 30, scope: !77)
!79 = !DILocation(line: 73, column: 17, scope: !74)
!80 = !DILocation(line: 75, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !35, line: 74, column: 13)
!82 = !DILocation(line: 77, column: 13, scope: !74)
!83 = !DILocation(line: 78, column: 21, scope: !74)
!84 = !DILocation(line: 78, column: 32, scope: !74)
!85 = !DILocation(line: 79, column: 21, scope: !74)
!86 = !DILocation(line: 79, column: 30, scope: !74)
!87 = !DILocation(line: 79, column: 37, scope: !74)
!88 = !DILocation(line: 80, column: 21, scope: !74)
!89 = !DILocation(line: 80, column: 30, scope: !74)
!90 = !DILocation(line: 81, column: 22, scope: !91)
!91 = distinct !DILexicalBlock(scope: !74, file: !35, line: 81, column: 17)
!92 = !DILocation(line: 81, column: 36, scope: !91)
!93 = !DILocation(line: 81, column: 17, scope: !91)
!94 = !DILocation(line: 81, column: 81, scope: !91)
!95 = !DILocation(line: 81, column: 17, scope: !74)
!96 = !DILocation(line: 83, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !35, line: 82, column: 13)
!98 = !DILocation(line: 85, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !74, file: !35, line: 85, column: 17)
!100 = !DILocation(line: 85, column: 17, scope: !99)
!101 = !DILocation(line: 85, column: 54, scope: !99)
!102 = !DILocation(line: 85, column: 17, scope: !74)
!103 = !DILocation(line: 87, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !35, line: 86, column: 13)
!105 = !DILocation(line: 89, column: 35, scope: !74)
!106 = !DILocation(line: 89, column: 28, scope: !74)
!107 = !DILocation(line: 89, column: 26, scope: !74)
!108 = !DILocation(line: 90, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !74, file: !35, line: 90, column: 17)
!110 = !DILocation(line: 90, column: 30, scope: !109)
!111 = !DILocation(line: 90, column: 17, scope: !74)
!112 = !DILocation(line: 92, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !35, line: 91, column: 13)
!114 = !DILocation(line: 95, column: 31, scope: !74)
!115 = !DILocation(line: 95, column: 45, scope: !74)
!116 = !DILocation(line: 95, column: 26, scope: !74)
!117 = !DILocation(line: 95, column: 24, scope: !74)
!118 = !DILocation(line: 96, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !74, file: !35, line: 96, column: 17)
!120 = !DILocation(line: 96, column: 28, scope: !119)
!121 = !DILocation(line: 96, column: 44, scope: !119)
!122 = !DILocation(line: 96, column: 47, scope: !119)
!123 = !DILocation(line: 96, column: 58, scope: !119)
!124 = !DILocation(line: 96, column: 17, scope: !74)
!125 = !DILocation(line: 98, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !35, line: 97, column: 13)
!127 = !DILocation(line: 101, column: 25, scope: !74)
!128 = !DILocation(line: 101, column: 13, scope: !74)
!129 = !DILocation(line: 101, column: 37, scope: !74)
!130 = !DILocation(line: 103, column: 25, scope: !74)
!131 = !DILocation(line: 103, column: 20, scope: !74)
!132 = !DILocation(line: 103, column: 18, scope: !74)
!133 = !DILocation(line: 104, column: 9, scope: !74)
!134 = !DILocation(line: 106, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !43, file: !35, line: 106, column: 13)
!136 = !DILocation(line: 106, column: 26, scope: !135)
!137 = !DILocation(line: 106, column: 13, scope: !43)
!138 = !DILocation(line: 108, column: 26, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !35, line: 107, column: 9)
!140 = !DILocation(line: 108, column: 13, scope: !139)
!141 = !DILocation(line: 109, column: 9, scope: !139)
!142 = !DILocation(line: 110, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !43, file: !35, line: 110, column: 13)
!144 = !DILocation(line: 110, column: 26, scope: !143)
!145 = !DILocation(line: 110, column: 13, scope: !43)
!146 = !DILocation(line: 112, column: 26, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !35, line: 111, column: 9)
!148 = !DILocation(line: 112, column: 13, scope: !147)
!149 = !DILocation(line: 113, column: 9, scope: !147)
!150 = !DILocalVariable(name: "i", scope: !151, file: !35, line: 131, type: !25)
!151 = distinct !DILexicalBlock(scope: !34, file: !35, line: 130, column: 5)
!152 = !DILocation(line: 131, column: 13, scope: !151)
!153 = !DILocalVariable(name: "buffer", scope: !151, file: !35, line: 132, type: !24)
!154 = !DILocation(line: 132, column: 15, scope: !151)
!155 = !DILocation(line: 132, column: 31, scope: !151)
!156 = !DILocation(line: 132, column: 24, scope: !151)
!157 = !DILocation(line: 133, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !35, line: 133, column: 13)
!159 = !DILocation(line: 133, column: 20, scope: !158)
!160 = !DILocation(line: 133, column: 13, scope: !151)
!161 = !DILocation(line: 133, column: 30, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !35, line: 133, column: 29)
!163 = !DILocation(line: 135, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !151, file: !35, line: 135, column: 9)
!165 = !DILocation(line: 135, column: 14, scope: !164)
!166 = !DILocation(line: 135, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !35, line: 135, column: 9)
!168 = !DILocation(line: 135, column: 23, scope: !167)
!169 = !DILocation(line: 135, column: 9, scope: !164)
!170 = !DILocation(line: 137, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !35, line: 136, column: 9)
!172 = !DILocation(line: 137, column: 20, scope: !171)
!173 = !DILocation(line: 137, column: 23, scope: !171)
!174 = !DILocation(line: 138, column: 9, scope: !171)
!175 = !DILocation(line: 135, column: 30, scope: !167)
!176 = !DILocation(line: 135, column: 9, scope: !167)
!177 = distinct !{!177, !169, !178, !179}
!178 = !DILocation(line: 138, column: 9, scope: !164)
!179 = !{!"llvm.loop.mustprogress"}
!180 = !DILocation(line: 141, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !151, file: !35, line: 141, column: 13)
!182 = !DILocation(line: 141, column: 18, scope: !181)
!183 = !DILocation(line: 141, column: 13, scope: !151)
!184 = !DILocation(line: 143, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !35, line: 142, column: 9)
!186 = !DILocation(line: 143, column: 20, scope: !185)
!187 = !DILocation(line: 143, column: 26, scope: !185)
!188 = !DILocation(line: 145, column: 19, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !35, line: 145, column: 13)
!190 = !DILocation(line: 145, column: 17, scope: !189)
!191 = !DILocation(line: 145, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !35, line: 145, column: 13)
!193 = !DILocation(line: 145, column: 26, scope: !192)
!194 = !DILocation(line: 145, column: 13, scope: !189)
!195 = !DILocation(line: 147, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !35, line: 146, column: 13)
!197 = !DILocation(line: 147, column: 37, scope: !196)
!198 = !DILocation(line: 147, column: 17, scope: !196)
!199 = !DILocation(line: 148, column: 13, scope: !196)
!200 = !DILocation(line: 145, column: 33, scope: !192)
!201 = !DILocation(line: 145, column: 13, scope: !192)
!202 = distinct !{!202, !194, !203, !179}
!203 = !DILocation(line: 148, column: 13, scope: !189)
!204 = !DILocation(line: 149, column: 9, scope: !185)
!205 = !DILocation(line: 152, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !181, file: !35, line: 151, column: 9)
!207 = !DILocation(line: 154, column: 14, scope: !151)
!208 = !DILocation(line: 154, column: 9, scope: !151)
!209 = !DILocation(line: 162, column: 1, scope: !34)
!210 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_15_good", scope: !35, file: !35, line: 518, type: !36, scopeLine: 519, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!211 = !DILocation(line: 520, column: 5, scope: !210)
!212 = !DILocation(line: 521, column: 5, scope: !210)
!213 = !DILocation(line: 522, column: 5, scope: !210)
!214 = !DILocation(line: 523, column: 5, scope: !210)
!215 = !DILocation(line: 524, column: 1, scope: !210)
!216 = distinct !DISubprogram(name: "main", scope: !35, file: !35, line: 535, type: !217, scopeLine: 536, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!217 = !DISubroutineType(types: !218)
!218 = !{!25, !25, !219}
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 64)
!220 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!221 = !DILocalVariable(name: "argc", arg: 1, scope: !216, file: !35, line: 535, type: !25)
!222 = !DILocation(line: 535, column: 14, scope: !216)
!223 = !DILocalVariable(name: "argv", arg: 2, scope: !216, file: !35, line: 535, type: !219)
!224 = !DILocation(line: 535, column: 27, scope: !216)
!225 = !DILocation(line: 538, column: 22, scope: !216)
!226 = !DILocation(line: 538, column: 12, scope: !216)
!227 = !DILocation(line: 538, column: 5, scope: !216)
!228 = !DILocation(line: 540, column: 5, scope: !216)
!229 = !DILocation(line: 541, column: 5, scope: !216)
!230 = !DILocation(line: 542, column: 5, scope: !216)
!231 = !DILocation(line: 545, column: 5, scope: !216)
!232 = !DILocation(line: 546, column: 5, scope: !216)
!233 = !DILocation(line: 547, column: 5, scope: !216)
!234 = !DILocation(line: 549, column: 5, scope: !216)
!235 = distinct !DISubprogram(name: "goodB2G1", scope: !35, file: !35, line: 169, type: !36, scopeLine: 170, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!236 = !DILocalVariable(name: "data", scope: !235, file: !35, line: 171, type: !25)
!237 = !DILocation(line: 171, column: 9, scope: !235)
!238 = !DILocation(line: 173, column: 10, scope: !235)
!239 = !DILocalVariable(name: "recvResult", scope: !240, file: !35, line: 182, type: !25)
!240 = distinct !DILexicalBlock(scope: !235, file: !35, line: 177, column: 5)
!241 = !DILocation(line: 182, column: 13, scope: !240)
!242 = !DILocalVariable(name: "service", scope: !240, file: !35, line: 183, type: !46)
!243 = !DILocation(line: 183, column: 28, scope: !240)
!244 = !DILocalVariable(name: "listenSocket", scope: !240, file: !35, line: 184, type: !25)
!245 = !DILocation(line: 184, column: 16, scope: !240)
!246 = !DILocalVariable(name: "acceptSocket", scope: !240, file: !35, line: 185, type: !25)
!247 = !DILocation(line: 185, column: 16, scope: !240)
!248 = !DILocalVariable(name: "inputBuffer", scope: !240, file: !35, line: 186, type: !20)
!249 = !DILocation(line: 186, column: 14, scope: !240)
!250 = !DILocation(line: 187, column: 9, scope: !240)
!251 = !DILocation(line: 197, column: 28, scope: !252)
!252 = distinct !DILexicalBlock(scope: !240, file: !35, line: 188, column: 9)
!253 = !DILocation(line: 197, column: 26, scope: !252)
!254 = !DILocation(line: 198, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !35, line: 198, column: 17)
!256 = !DILocation(line: 198, column: 30, scope: !255)
!257 = !DILocation(line: 198, column: 17, scope: !252)
!258 = !DILocation(line: 200, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !35, line: 199, column: 13)
!260 = !DILocation(line: 202, column: 13, scope: !252)
!261 = !DILocation(line: 203, column: 21, scope: !252)
!262 = !DILocation(line: 203, column: 32, scope: !252)
!263 = !DILocation(line: 204, column: 21, scope: !252)
!264 = !DILocation(line: 204, column: 30, scope: !252)
!265 = !DILocation(line: 204, column: 37, scope: !252)
!266 = !DILocation(line: 205, column: 21, scope: !252)
!267 = !DILocation(line: 205, column: 30, scope: !252)
!268 = !DILocation(line: 206, column: 22, scope: !269)
!269 = distinct !DILexicalBlock(scope: !252, file: !35, line: 206, column: 17)
!270 = !DILocation(line: 206, column: 36, scope: !269)
!271 = !DILocation(line: 206, column: 17, scope: !269)
!272 = !DILocation(line: 206, column: 81, scope: !269)
!273 = !DILocation(line: 206, column: 17, scope: !252)
!274 = !DILocation(line: 208, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !35, line: 207, column: 13)
!276 = !DILocation(line: 210, column: 24, scope: !277)
!277 = distinct !DILexicalBlock(scope: !252, file: !35, line: 210, column: 17)
!278 = !DILocation(line: 210, column: 17, scope: !277)
!279 = !DILocation(line: 210, column: 54, scope: !277)
!280 = !DILocation(line: 210, column: 17, scope: !252)
!281 = !DILocation(line: 212, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !277, file: !35, line: 211, column: 13)
!283 = !DILocation(line: 214, column: 35, scope: !252)
!284 = !DILocation(line: 214, column: 28, scope: !252)
!285 = !DILocation(line: 214, column: 26, scope: !252)
!286 = !DILocation(line: 215, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !252, file: !35, line: 215, column: 17)
!288 = !DILocation(line: 215, column: 30, scope: !287)
!289 = !DILocation(line: 215, column: 17, scope: !252)
!290 = !DILocation(line: 217, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !35, line: 216, column: 13)
!292 = !DILocation(line: 220, column: 31, scope: !252)
!293 = !DILocation(line: 220, column: 45, scope: !252)
!294 = !DILocation(line: 220, column: 26, scope: !252)
!295 = !DILocation(line: 220, column: 24, scope: !252)
!296 = !DILocation(line: 221, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !252, file: !35, line: 221, column: 17)
!298 = !DILocation(line: 221, column: 28, scope: !297)
!299 = !DILocation(line: 221, column: 44, scope: !297)
!300 = !DILocation(line: 221, column: 47, scope: !297)
!301 = !DILocation(line: 221, column: 58, scope: !297)
!302 = !DILocation(line: 221, column: 17, scope: !252)
!303 = !DILocation(line: 223, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !297, file: !35, line: 222, column: 13)
!305 = !DILocation(line: 226, column: 25, scope: !252)
!306 = !DILocation(line: 226, column: 13, scope: !252)
!307 = !DILocation(line: 226, column: 37, scope: !252)
!308 = !DILocation(line: 228, column: 25, scope: !252)
!309 = !DILocation(line: 228, column: 20, scope: !252)
!310 = !DILocation(line: 228, column: 18, scope: !252)
!311 = !DILocation(line: 229, column: 9, scope: !252)
!312 = !DILocation(line: 231, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !240, file: !35, line: 231, column: 13)
!314 = !DILocation(line: 231, column: 26, scope: !313)
!315 = !DILocation(line: 231, column: 13, scope: !240)
!316 = !DILocation(line: 233, column: 26, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !35, line: 232, column: 9)
!318 = !DILocation(line: 233, column: 13, scope: !317)
!319 = !DILocation(line: 234, column: 9, scope: !317)
!320 = !DILocation(line: 235, column: 13, scope: !321)
!321 = distinct !DILexicalBlock(scope: !240, file: !35, line: 235, column: 13)
!322 = !DILocation(line: 235, column: 26, scope: !321)
!323 = !DILocation(line: 235, column: 13, scope: !240)
!324 = !DILocation(line: 237, column: 26, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !35, line: 236, column: 9)
!326 = !DILocation(line: 237, column: 13, scope: !325)
!327 = !DILocation(line: 238, column: 9, scope: !325)
!328 = !DILocalVariable(name: "i", scope: !329, file: !35, line: 260, type: !25)
!329 = distinct !DILexicalBlock(scope: !235, file: !35, line: 259, column: 5)
!330 = !DILocation(line: 260, column: 13, scope: !329)
!331 = !DILocalVariable(name: "buffer", scope: !329, file: !35, line: 261, type: !24)
!332 = !DILocation(line: 261, column: 15, scope: !329)
!333 = !DILocation(line: 261, column: 31, scope: !329)
!334 = !DILocation(line: 261, column: 24, scope: !329)
!335 = !DILocation(line: 262, column: 13, scope: !336)
!336 = distinct !DILexicalBlock(scope: !329, file: !35, line: 262, column: 13)
!337 = !DILocation(line: 262, column: 20, scope: !336)
!338 = !DILocation(line: 262, column: 13, scope: !329)
!339 = !DILocation(line: 262, column: 30, scope: !340)
!340 = distinct !DILexicalBlock(scope: !336, file: !35, line: 262, column: 29)
!341 = !DILocation(line: 264, column: 16, scope: !342)
!342 = distinct !DILexicalBlock(scope: !329, file: !35, line: 264, column: 9)
!343 = !DILocation(line: 264, column: 14, scope: !342)
!344 = !DILocation(line: 264, column: 21, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !35, line: 264, column: 9)
!346 = !DILocation(line: 264, column: 23, scope: !345)
!347 = !DILocation(line: 264, column: 9, scope: !342)
!348 = !DILocation(line: 266, column: 13, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !35, line: 265, column: 9)
!350 = !DILocation(line: 266, column: 20, scope: !349)
!351 = !DILocation(line: 266, column: 23, scope: !349)
!352 = !DILocation(line: 267, column: 9, scope: !349)
!353 = !DILocation(line: 264, column: 30, scope: !345)
!354 = !DILocation(line: 264, column: 9, scope: !345)
!355 = distinct !{!355, !347, !356, !179}
!356 = !DILocation(line: 267, column: 9, scope: !342)
!357 = !DILocation(line: 269, column: 13, scope: !358)
!358 = distinct !DILexicalBlock(scope: !329, file: !35, line: 269, column: 13)
!359 = !DILocation(line: 269, column: 18, scope: !358)
!360 = !DILocation(line: 269, column: 23, scope: !358)
!361 = !DILocation(line: 269, column: 26, scope: !358)
!362 = !DILocation(line: 269, column: 31, scope: !358)
!363 = !DILocation(line: 269, column: 13, scope: !329)
!364 = !DILocation(line: 271, column: 13, scope: !365)
!365 = distinct !DILexicalBlock(scope: !358, file: !35, line: 270, column: 9)
!366 = !DILocation(line: 271, column: 20, scope: !365)
!367 = !DILocation(line: 271, column: 26, scope: !365)
!368 = !DILocation(line: 273, column: 19, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !35, line: 273, column: 13)
!370 = !DILocation(line: 273, column: 17, scope: !369)
!371 = !DILocation(line: 273, column: 24, scope: !372)
!372 = distinct !DILexicalBlock(scope: !369, file: !35, line: 273, column: 13)
!373 = !DILocation(line: 273, column: 26, scope: !372)
!374 = !DILocation(line: 273, column: 13, scope: !369)
!375 = !DILocation(line: 275, column: 30, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !35, line: 274, column: 13)
!377 = !DILocation(line: 275, column: 37, scope: !376)
!378 = !DILocation(line: 275, column: 17, scope: !376)
!379 = !DILocation(line: 276, column: 13, scope: !376)
!380 = !DILocation(line: 273, column: 33, scope: !372)
!381 = !DILocation(line: 273, column: 13, scope: !372)
!382 = distinct !{!382, !374, !383, !179}
!383 = !DILocation(line: 276, column: 13, scope: !369)
!384 = !DILocation(line: 277, column: 9, scope: !365)
!385 = !DILocation(line: 280, column: 13, scope: !386)
!386 = distinct !DILexicalBlock(scope: !358, file: !35, line: 279, column: 9)
!387 = !DILocation(line: 282, column: 14, scope: !329)
!388 = !DILocation(line: 282, column: 9, scope: !329)
!389 = !DILocation(line: 286, column: 1, scope: !235)
!390 = distinct !DISubprogram(name: "goodB2G2", scope: !35, file: !35, line: 289, type: !36, scopeLine: 290, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!391 = !DILocalVariable(name: "data", scope: !390, file: !35, line: 291, type: !25)
!392 = !DILocation(line: 291, column: 9, scope: !390)
!393 = !DILocation(line: 293, column: 10, scope: !390)
!394 = !DILocalVariable(name: "recvResult", scope: !395, file: !35, line: 302, type: !25)
!395 = distinct !DILexicalBlock(scope: !390, file: !35, line: 297, column: 5)
!396 = !DILocation(line: 302, column: 13, scope: !395)
!397 = !DILocalVariable(name: "service", scope: !395, file: !35, line: 303, type: !46)
!398 = !DILocation(line: 303, column: 28, scope: !395)
!399 = !DILocalVariable(name: "listenSocket", scope: !395, file: !35, line: 304, type: !25)
!400 = !DILocation(line: 304, column: 16, scope: !395)
!401 = !DILocalVariable(name: "acceptSocket", scope: !395, file: !35, line: 305, type: !25)
!402 = !DILocation(line: 305, column: 16, scope: !395)
!403 = !DILocalVariable(name: "inputBuffer", scope: !395, file: !35, line: 306, type: !20)
!404 = !DILocation(line: 306, column: 14, scope: !395)
!405 = !DILocation(line: 307, column: 9, scope: !395)
!406 = !DILocation(line: 317, column: 28, scope: !407)
!407 = distinct !DILexicalBlock(scope: !395, file: !35, line: 308, column: 9)
!408 = !DILocation(line: 317, column: 26, scope: !407)
!409 = !DILocation(line: 318, column: 17, scope: !410)
!410 = distinct !DILexicalBlock(scope: !407, file: !35, line: 318, column: 17)
!411 = !DILocation(line: 318, column: 30, scope: !410)
!412 = !DILocation(line: 318, column: 17, scope: !407)
!413 = !DILocation(line: 320, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !35, line: 319, column: 13)
!415 = !DILocation(line: 322, column: 13, scope: !407)
!416 = !DILocation(line: 323, column: 21, scope: !407)
!417 = !DILocation(line: 323, column: 32, scope: !407)
!418 = !DILocation(line: 324, column: 21, scope: !407)
!419 = !DILocation(line: 324, column: 30, scope: !407)
!420 = !DILocation(line: 324, column: 37, scope: !407)
!421 = !DILocation(line: 325, column: 21, scope: !407)
!422 = !DILocation(line: 325, column: 30, scope: !407)
!423 = !DILocation(line: 326, column: 22, scope: !424)
!424 = distinct !DILexicalBlock(scope: !407, file: !35, line: 326, column: 17)
!425 = !DILocation(line: 326, column: 36, scope: !424)
!426 = !DILocation(line: 326, column: 17, scope: !424)
!427 = !DILocation(line: 326, column: 81, scope: !424)
!428 = !DILocation(line: 326, column: 17, scope: !407)
!429 = !DILocation(line: 328, column: 17, scope: !430)
!430 = distinct !DILexicalBlock(scope: !424, file: !35, line: 327, column: 13)
!431 = !DILocation(line: 330, column: 24, scope: !432)
!432 = distinct !DILexicalBlock(scope: !407, file: !35, line: 330, column: 17)
!433 = !DILocation(line: 330, column: 17, scope: !432)
!434 = !DILocation(line: 330, column: 54, scope: !432)
!435 = !DILocation(line: 330, column: 17, scope: !407)
!436 = !DILocation(line: 332, column: 17, scope: !437)
!437 = distinct !DILexicalBlock(scope: !432, file: !35, line: 331, column: 13)
!438 = !DILocation(line: 334, column: 35, scope: !407)
!439 = !DILocation(line: 334, column: 28, scope: !407)
!440 = !DILocation(line: 334, column: 26, scope: !407)
!441 = !DILocation(line: 335, column: 17, scope: !442)
!442 = distinct !DILexicalBlock(scope: !407, file: !35, line: 335, column: 17)
!443 = !DILocation(line: 335, column: 30, scope: !442)
!444 = !DILocation(line: 335, column: 17, scope: !407)
!445 = !DILocation(line: 337, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !35, line: 336, column: 13)
!447 = !DILocation(line: 340, column: 31, scope: !407)
!448 = !DILocation(line: 340, column: 45, scope: !407)
!449 = !DILocation(line: 340, column: 26, scope: !407)
!450 = !DILocation(line: 340, column: 24, scope: !407)
!451 = !DILocation(line: 341, column: 17, scope: !452)
!452 = distinct !DILexicalBlock(scope: !407, file: !35, line: 341, column: 17)
!453 = !DILocation(line: 341, column: 28, scope: !452)
!454 = !DILocation(line: 341, column: 44, scope: !452)
!455 = !DILocation(line: 341, column: 47, scope: !452)
!456 = !DILocation(line: 341, column: 58, scope: !452)
!457 = !DILocation(line: 341, column: 17, scope: !407)
!458 = !DILocation(line: 343, column: 17, scope: !459)
!459 = distinct !DILexicalBlock(scope: !452, file: !35, line: 342, column: 13)
!460 = !DILocation(line: 346, column: 25, scope: !407)
!461 = !DILocation(line: 346, column: 13, scope: !407)
!462 = !DILocation(line: 346, column: 37, scope: !407)
!463 = !DILocation(line: 348, column: 25, scope: !407)
!464 = !DILocation(line: 348, column: 20, scope: !407)
!465 = !DILocation(line: 348, column: 18, scope: !407)
!466 = !DILocation(line: 349, column: 9, scope: !407)
!467 = !DILocation(line: 351, column: 13, scope: !468)
!468 = distinct !DILexicalBlock(scope: !395, file: !35, line: 351, column: 13)
!469 = !DILocation(line: 351, column: 26, scope: !468)
!470 = !DILocation(line: 351, column: 13, scope: !395)
!471 = !DILocation(line: 353, column: 26, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !35, line: 352, column: 9)
!473 = !DILocation(line: 353, column: 13, scope: !472)
!474 = !DILocation(line: 354, column: 9, scope: !472)
!475 = !DILocation(line: 355, column: 13, scope: !476)
!476 = distinct !DILexicalBlock(scope: !395, file: !35, line: 355, column: 13)
!477 = !DILocation(line: 355, column: 26, scope: !476)
!478 = !DILocation(line: 355, column: 13, scope: !395)
!479 = !DILocation(line: 357, column: 26, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !35, line: 356, column: 9)
!481 = !DILocation(line: 357, column: 13, scope: !480)
!482 = !DILocation(line: 358, column: 9, scope: !480)
!483 = !DILocalVariable(name: "i", scope: !484, file: !35, line: 376, type: !25)
!484 = distinct !DILexicalBlock(scope: !390, file: !35, line: 375, column: 5)
!485 = !DILocation(line: 376, column: 13, scope: !484)
!486 = !DILocalVariable(name: "buffer", scope: !484, file: !35, line: 377, type: !24)
!487 = !DILocation(line: 377, column: 15, scope: !484)
!488 = !DILocation(line: 377, column: 31, scope: !484)
!489 = !DILocation(line: 377, column: 24, scope: !484)
!490 = !DILocation(line: 378, column: 13, scope: !491)
!491 = distinct !DILexicalBlock(scope: !484, file: !35, line: 378, column: 13)
!492 = !DILocation(line: 378, column: 20, scope: !491)
!493 = !DILocation(line: 378, column: 13, scope: !484)
!494 = !DILocation(line: 378, column: 30, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !35, line: 378, column: 29)
!496 = !DILocation(line: 380, column: 16, scope: !497)
!497 = distinct !DILexicalBlock(scope: !484, file: !35, line: 380, column: 9)
!498 = !DILocation(line: 380, column: 14, scope: !497)
!499 = !DILocation(line: 380, column: 21, scope: !500)
!500 = distinct !DILexicalBlock(scope: !497, file: !35, line: 380, column: 9)
!501 = !DILocation(line: 380, column: 23, scope: !500)
!502 = !DILocation(line: 380, column: 9, scope: !497)
!503 = !DILocation(line: 382, column: 13, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !35, line: 381, column: 9)
!505 = !DILocation(line: 382, column: 20, scope: !504)
!506 = !DILocation(line: 382, column: 23, scope: !504)
!507 = !DILocation(line: 383, column: 9, scope: !504)
!508 = !DILocation(line: 380, column: 30, scope: !500)
!509 = !DILocation(line: 380, column: 9, scope: !500)
!510 = distinct !{!510, !502, !511, !179}
!511 = !DILocation(line: 383, column: 9, scope: !497)
!512 = !DILocation(line: 385, column: 13, scope: !513)
!513 = distinct !DILexicalBlock(scope: !484, file: !35, line: 385, column: 13)
!514 = !DILocation(line: 385, column: 18, scope: !513)
!515 = !DILocation(line: 385, column: 23, scope: !513)
!516 = !DILocation(line: 385, column: 26, scope: !513)
!517 = !DILocation(line: 385, column: 31, scope: !513)
!518 = !DILocation(line: 385, column: 13, scope: !484)
!519 = !DILocation(line: 387, column: 13, scope: !520)
!520 = distinct !DILexicalBlock(scope: !513, file: !35, line: 386, column: 9)
!521 = !DILocation(line: 387, column: 20, scope: !520)
!522 = !DILocation(line: 387, column: 26, scope: !520)
!523 = !DILocation(line: 389, column: 19, scope: !524)
!524 = distinct !DILexicalBlock(scope: !520, file: !35, line: 389, column: 13)
!525 = !DILocation(line: 389, column: 17, scope: !524)
!526 = !DILocation(line: 389, column: 24, scope: !527)
!527 = distinct !DILexicalBlock(scope: !524, file: !35, line: 389, column: 13)
!528 = !DILocation(line: 389, column: 26, scope: !527)
!529 = !DILocation(line: 389, column: 13, scope: !524)
!530 = !DILocation(line: 391, column: 30, scope: !531)
!531 = distinct !DILexicalBlock(scope: !527, file: !35, line: 390, column: 13)
!532 = !DILocation(line: 391, column: 37, scope: !531)
!533 = !DILocation(line: 391, column: 17, scope: !531)
!534 = !DILocation(line: 392, column: 13, scope: !531)
!535 = !DILocation(line: 389, column: 33, scope: !527)
!536 = !DILocation(line: 389, column: 13, scope: !527)
!537 = distinct !{!537, !529, !538, !179}
!538 = !DILocation(line: 392, column: 13, scope: !524)
!539 = !DILocation(line: 393, column: 9, scope: !520)
!540 = !DILocation(line: 396, column: 13, scope: !541)
!541 = distinct !DILexicalBlock(scope: !513, file: !35, line: 395, column: 9)
!542 = !DILocation(line: 398, column: 14, scope: !484)
!543 = !DILocation(line: 398, column: 9, scope: !484)
!544 = !DILocation(line: 406, column: 1, scope: !390)
!545 = distinct !DISubprogram(name: "goodG2B1", scope: !35, file: !35, line: 409, type: !36, scopeLine: 410, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!546 = !DILocalVariable(name: "data", scope: !545, file: !35, line: 411, type: !25)
!547 = !DILocation(line: 411, column: 9, scope: !545)
!548 = !DILocation(line: 413, column: 10, scope: !545)
!549 = !DILocation(line: 423, column: 14, scope: !545)
!550 = !DILocalVariable(name: "i", scope: !551, file: !35, line: 430, type: !25)
!551 = distinct !DILexicalBlock(scope: !545, file: !35, line: 429, column: 5)
!552 = !DILocation(line: 430, column: 13, scope: !551)
!553 = !DILocalVariable(name: "buffer", scope: !551, file: !35, line: 431, type: !24)
!554 = !DILocation(line: 431, column: 15, scope: !551)
!555 = !DILocation(line: 431, column: 31, scope: !551)
!556 = !DILocation(line: 431, column: 24, scope: !551)
!557 = !DILocation(line: 432, column: 13, scope: !558)
!558 = distinct !DILexicalBlock(scope: !551, file: !35, line: 432, column: 13)
!559 = !DILocation(line: 432, column: 20, scope: !558)
!560 = !DILocation(line: 432, column: 13, scope: !551)
!561 = !DILocation(line: 432, column: 30, scope: !562)
!562 = distinct !DILexicalBlock(scope: !558, file: !35, line: 432, column: 29)
!563 = !DILocation(line: 434, column: 16, scope: !564)
!564 = distinct !DILexicalBlock(scope: !551, file: !35, line: 434, column: 9)
!565 = !DILocation(line: 434, column: 14, scope: !564)
!566 = !DILocation(line: 434, column: 21, scope: !567)
!567 = distinct !DILexicalBlock(scope: !564, file: !35, line: 434, column: 9)
!568 = !DILocation(line: 434, column: 23, scope: !567)
!569 = !DILocation(line: 434, column: 9, scope: !564)
!570 = !DILocation(line: 436, column: 13, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !35, line: 435, column: 9)
!572 = !DILocation(line: 436, column: 20, scope: !571)
!573 = !DILocation(line: 436, column: 23, scope: !571)
!574 = !DILocation(line: 437, column: 9, scope: !571)
!575 = !DILocation(line: 434, column: 30, scope: !567)
!576 = !DILocation(line: 434, column: 9, scope: !567)
!577 = distinct !{!577, !569, !578, !179}
!578 = !DILocation(line: 437, column: 9, scope: !564)
!579 = !DILocation(line: 440, column: 13, scope: !580)
!580 = distinct !DILexicalBlock(scope: !551, file: !35, line: 440, column: 13)
!581 = !DILocation(line: 440, column: 18, scope: !580)
!582 = !DILocation(line: 440, column: 13, scope: !551)
!583 = !DILocation(line: 442, column: 13, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !35, line: 441, column: 9)
!585 = !DILocation(line: 442, column: 20, scope: !584)
!586 = !DILocation(line: 442, column: 26, scope: !584)
!587 = !DILocation(line: 444, column: 19, scope: !588)
!588 = distinct !DILexicalBlock(scope: !584, file: !35, line: 444, column: 13)
!589 = !DILocation(line: 444, column: 17, scope: !588)
!590 = !DILocation(line: 444, column: 24, scope: !591)
!591 = distinct !DILexicalBlock(scope: !588, file: !35, line: 444, column: 13)
!592 = !DILocation(line: 444, column: 26, scope: !591)
!593 = !DILocation(line: 444, column: 13, scope: !588)
!594 = !DILocation(line: 446, column: 30, scope: !595)
!595 = distinct !DILexicalBlock(scope: !591, file: !35, line: 445, column: 13)
!596 = !DILocation(line: 446, column: 37, scope: !595)
!597 = !DILocation(line: 446, column: 17, scope: !595)
!598 = !DILocation(line: 447, column: 13, scope: !595)
!599 = !DILocation(line: 444, column: 33, scope: !591)
!600 = !DILocation(line: 444, column: 13, scope: !591)
!601 = distinct !{!601, !593, !602, !179}
!602 = !DILocation(line: 447, column: 13, scope: !588)
!603 = !DILocation(line: 448, column: 9, scope: !584)
!604 = !DILocation(line: 451, column: 13, scope: !605)
!605 = distinct !DILexicalBlock(scope: !580, file: !35, line: 450, column: 9)
!606 = !DILocation(line: 453, column: 14, scope: !551)
!607 = !DILocation(line: 453, column: 9, scope: !551)
!608 = !DILocation(line: 461, column: 1, scope: !545)
!609 = distinct !DISubprogram(name: "goodG2B2", scope: !35, file: !35, line: 464, type: !36, scopeLine: 465, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!610 = !DILocalVariable(name: "data", scope: !609, file: !35, line: 466, type: !25)
!611 = !DILocation(line: 466, column: 9, scope: !609)
!612 = !DILocation(line: 468, column: 10, scope: !609)
!613 = !DILocation(line: 474, column: 14, scope: !609)
!614 = !DILocalVariable(name: "i", scope: !615, file: !35, line: 485, type: !25)
!615 = distinct !DILexicalBlock(scope: !609, file: !35, line: 484, column: 5)
!616 = !DILocation(line: 485, column: 13, scope: !615)
!617 = !DILocalVariable(name: "buffer", scope: !615, file: !35, line: 486, type: !24)
!618 = !DILocation(line: 486, column: 15, scope: !615)
!619 = !DILocation(line: 486, column: 31, scope: !615)
!620 = !DILocation(line: 486, column: 24, scope: !615)
!621 = !DILocation(line: 487, column: 13, scope: !622)
!622 = distinct !DILexicalBlock(scope: !615, file: !35, line: 487, column: 13)
!623 = !DILocation(line: 487, column: 20, scope: !622)
!624 = !DILocation(line: 487, column: 13, scope: !615)
!625 = !DILocation(line: 487, column: 30, scope: !626)
!626 = distinct !DILexicalBlock(scope: !622, file: !35, line: 487, column: 29)
!627 = !DILocation(line: 489, column: 16, scope: !628)
!628 = distinct !DILexicalBlock(scope: !615, file: !35, line: 489, column: 9)
!629 = !DILocation(line: 489, column: 14, scope: !628)
!630 = !DILocation(line: 489, column: 21, scope: !631)
!631 = distinct !DILexicalBlock(scope: !628, file: !35, line: 489, column: 9)
!632 = !DILocation(line: 489, column: 23, scope: !631)
!633 = !DILocation(line: 489, column: 9, scope: !628)
!634 = !DILocation(line: 491, column: 13, scope: !635)
!635 = distinct !DILexicalBlock(scope: !631, file: !35, line: 490, column: 9)
!636 = !DILocation(line: 491, column: 20, scope: !635)
!637 = !DILocation(line: 491, column: 23, scope: !635)
!638 = !DILocation(line: 492, column: 9, scope: !635)
!639 = !DILocation(line: 489, column: 30, scope: !631)
!640 = !DILocation(line: 489, column: 9, scope: !631)
!641 = distinct !{!641, !633, !642, !179}
!642 = !DILocation(line: 492, column: 9, scope: !628)
!643 = !DILocation(line: 495, column: 13, scope: !644)
!644 = distinct !DILexicalBlock(scope: !615, file: !35, line: 495, column: 13)
!645 = !DILocation(line: 495, column: 18, scope: !644)
!646 = !DILocation(line: 495, column: 13, scope: !615)
!647 = !DILocation(line: 497, column: 13, scope: !648)
!648 = distinct !DILexicalBlock(scope: !644, file: !35, line: 496, column: 9)
!649 = !DILocation(line: 497, column: 20, scope: !648)
!650 = !DILocation(line: 497, column: 26, scope: !648)
!651 = !DILocation(line: 499, column: 19, scope: !652)
!652 = distinct !DILexicalBlock(scope: !648, file: !35, line: 499, column: 13)
!653 = !DILocation(line: 499, column: 17, scope: !652)
!654 = !DILocation(line: 499, column: 24, scope: !655)
!655 = distinct !DILexicalBlock(scope: !652, file: !35, line: 499, column: 13)
!656 = !DILocation(line: 499, column: 26, scope: !655)
!657 = !DILocation(line: 499, column: 13, scope: !652)
!658 = !DILocation(line: 501, column: 30, scope: !659)
!659 = distinct !DILexicalBlock(scope: !655, file: !35, line: 500, column: 13)
!660 = !DILocation(line: 501, column: 37, scope: !659)
!661 = !DILocation(line: 501, column: 17, scope: !659)
!662 = !DILocation(line: 502, column: 13, scope: !659)
!663 = !DILocation(line: 499, column: 33, scope: !655)
!664 = !DILocation(line: 499, column: 13, scope: !655)
!665 = distinct !{!665, !657, !666, !179}
!666 = !DILocation(line: 502, column: 13, scope: !652)
!667 = !DILocation(line: 503, column: 9, scope: !648)
!668 = !DILocation(line: 506, column: 13, scope: !669)
!669 = distinct !DILexicalBlock(scope: !644, file: !35, line: 505, column: 9)
!670 = !DILocation(line: 508, column: 14, scope: !615)
!671 = !DILocation(line: 508, column: 9, scope: !615)
!672 = !DILocation(line: 516, column: 1, scope: !609)
