; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_bad() #0 !dbg !34 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
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
  %15 = load i32, i32* %data, align 4, !dbg !150
  call void @badSink(i32 noundef %15), !dbg !151
  ret void, !dbg !152
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

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !153 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !156, metadata !DIExpression()), !dbg !157
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !161, metadata !DIExpression()), !dbg !162
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !163
  %0 = bitcast i8* %call to i32*, !dbg !164
  store i32* %0, i32** %buffer, align 8, !dbg !162
  %1 = load i32*, i32** %buffer, align 8, !dbg !165
  %cmp = icmp eq i32* %1, null, !dbg !167
  br i1 %cmp, label %if.then, label %if.end, !dbg !168

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !169
  unreachable, !dbg !169

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !171
  br label %for.cond, !dbg !173

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !174
  %cmp1 = icmp slt i32 %2, 10, !dbg !176
  br i1 %cmp1, label %for.body, label %for.end, !dbg !177

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !178
  %4 = load i32, i32* %i, align 4, !dbg !180
  %idxprom = sext i32 %4 to i64, !dbg !178
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !178
  store i32 0, i32* %arrayidx, align 4, !dbg !181
  br label %for.inc, !dbg !182

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !183
  %inc = add nsw i32 %5, 1, !dbg !183
  store i32 %inc, i32* %i, align 4, !dbg !183
  br label %for.cond, !dbg !184, !llvm.loop !185

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !188
  %cmp2 = icmp sge i32 %6, 0, !dbg !190
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !191

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !192
  %8 = load i32, i32* %data.addr, align 4, !dbg !194
  %idxprom4 = sext i32 %8 to i64, !dbg !192
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !192
  store i32 1, i32* %arrayidx5, align 4, !dbg !195
  store i32 0, i32* %i, align 4, !dbg !196
  br label %for.cond6, !dbg !198

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !199
  %cmp7 = icmp slt i32 %9, 10, !dbg !201
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !202

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !203
  %11 = load i32, i32* %i, align 4, !dbg !205
  %idxprom9 = sext i32 %11 to i64, !dbg !203
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !203
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !203
  call void @printIntLine(i32 noundef %12), !dbg !206
  br label %for.inc11, !dbg !207

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !208
  %inc12 = add nsw i32 %13, 1, !dbg !208
  store i32 %inc12, i32* %i, align 4, !dbg !208
  br label %for.cond6, !dbg !209, !llvm.loop !210

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !212

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !213
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !215
  %15 = bitcast i32* %14 to i8*, !dbg !215
  call void @free(i8* noundef %15), !dbg !216
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_good() #0 !dbg !218 {
entry:
  call void @goodB2G(), !dbg !219
  call void @goodG2B(), !dbg !220
  ret void, !dbg !221
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !222 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !227, metadata !DIExpression()), !dbg !228
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !229, metadata !DIExpression()), !dbg !230
  %call = call i64 @time(i64* noundef null), !dbg !231
  %conv = trunc i64 %call to i32, !dbg !232
  call void @srand(i32 noundef %conv), !dbg !233
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !234
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_good(), !dbg !235
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !236
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !237
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_bad(), !dbg !238
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !239
  ret i32 0, !dbg !240
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
define internal void @goodB2G() #0 !dbg !241 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !242, metadata !DIExpression()), !dbg !243
  store i32 -1, i32* %data, align 4, !dbg !244
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !245, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 -1, i32* %listenSocket, align 4, !dbg !251
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 -1, i32* %acceptSocket, align 4, !dbg !253
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !254, metadata !DIExpression()), !dbg !255
  br label %do.body, !dbg !256

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !257
  store i32 %call, i32* %listenSocket, align 4, !dbg !259
  %0 = load i32, i32* %listenSocket, align 4, !dbg !260
  %cmp = icmp eq i32 %0, -1, !dbg !262
  br i1 %cmp, label %if.then, label %if.end, !dbg !263

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !264

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !266
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !266
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !267
  store i8 2, i8* %sin_family, align 1, !dbg !268
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !269
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !270
  store i32 0, i32* %s_addr, align 4, !dbg !271
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !272
  store i16 -30871, i16* %sin_port, align 2, !dbg !273
  %2 = load i32, i32* %listenSocket, align 4, !dbg !274
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !276
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !277
  %cmp2 = icmp eq i32 %call1, -1, !dbg !278
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !279

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !280

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !282
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !284
  %cmp6 = icmp eq i32 %call5, -1, !dbg !285
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !286

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !287

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !289
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !290
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !291
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !292
  %cmp10 = icmp eq i32 %6, -1, !dbg !294
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !295

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !296

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !298
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !299
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !300
  %conv = trunc i64 %call13 to i32, !dbg !300
  store i32 %conv, i32* %recvResult, align 4, !dbg !301
  %8 = load i32, i32* %recvResult, align 4, !dbg !302
  %cmp14 = icmp eq i32 %8, -1, !dbg !304
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !305

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !306
  %cmp16 = icmp eq i32 %9, 0, !dbg !307
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !308

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !309

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !311
  %idxprom = sext i32 %10 to i64, !dbg !312
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !312
  store i8 0, i8* %arrayidx, align 1, !dbg !313
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !314
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !315
  store i32 %call21, i32* %data, align 4, !dbg !316
  br label %do.end, !dbg !317

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !318
  %cmp22 = icmp ne i32 %11, -1, !dbg !320
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !321

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !322
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !324
  br label %if.end26, !dbg !325

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !326
  %cmp27 = icmp ne i32 %13, -1, !dbg !328
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !329

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !330
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !332
  br label %if.end31, !dbg !333

if.end31:                                         ; preds = %if.then29, %if.end26
  %15 = load i32, i32* %data, align 4, !dbg !334
  call void @goodB2GSink(i32 noundef %15), !dbg !335
  ret void, !dbg !336
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink(i32 noundef %data) #0 !dbg !337 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !338, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.declare(metadata i32* %i, metadata !340, metadata !DIExpression()), !dbg !342
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !343, metadata !DIExpression()), !dbg !344
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !345
  %0 = bitcast i8* %call to i32*, !dbg !346
  store i32* %0, i32** %buffer, align 8, !dbg !344
  %1 = load i32*, i32** %buffer, align 8, !dbg !347
  %cmp = icmp eq i32* %1, null, !dbg !349
  br i1 %cmp, label %if.then, label %if.end, !dbg !350

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !351
  unreachable, !dbg !351

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !353
  br label %for.cond, !dbg !355

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !356
  %cmp1 = icmp slt i32 %2, 10, !dbg !358
  br i1 %cmp1, label %for.body, label %for.end, !dbg !359

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !360
  %4 = load i32, i32* %i, align 4, !dbg !362
  %idxprom = sext i32 %4 to i64, !dbg !360
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !360
  store i32 0, i32* %arrayidx, align 4, !dbg !363
  br label %for.inc, !dbg !364

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !365
  %inc = add nsw i32 %5, 1, !dbg !365
  store i32 %inc, i32* %i, align 4, !dbg !365
  br label %for.cond, !dbg !366, !llvm.loop !367

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !369
  %cmp2 = icmp sge i32 %6, 0, !dbg !371
  br i1 %cmp2, label %land.lhs.true, label %if.else, !dbg !372

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %data.addr, align 4, !dbg !373
  %cmp3 = icmp slt i32 %7, 10, !dbg !374
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !375

if.then4:                                         ; preds = %land.lhs.true
  %8 = load i32*, i32** %buffer, align 8, !dbg !376
  %9 = load i32, i32* %data.addr, align 4, !dbg !378
  %idxprom5 = sext i32 %9 to i64, !dbg !376
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !376
  store i32 1, i32* %arrayidx6, align 4, !dbg !379
  store i32 0, i32* %i, align 4, !dbg !380
  br label %for.cond7, !dbg !382

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !383
  %cmp8 = icmp slt i32 %10, 10, !dbg !385
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !386

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !387
  %12 = load i32, i32* %i, align 4, !dbg !389
  %idxprom10 = sext i32 %12 to i64, !dbg !387
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !387
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !387
  call void @printIntLine(i32 noundef %13), !dbg !390
  br label %for.inc12, !dbg !391

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !392
  %inc13 = add nsw i32 %14, 1, !dbg !392
  store i32 %inc13, i32* %i, align 4, !dbg !392
  br label %for.cond7, !dbg !393, !llvm.loop !394

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !396

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !397
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !399
  %16 = bitcast i32* %15 to i8*, !dbg !399
  call void @free(i8* noundef %16), !dbg !400
  ret void, !dbg !401
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !402 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !403, metadata !DIExpression()), !dbg !404
  store i32 -1, i32* %data, align 4, !dbg !405
  store i32 7, i32* %data, align 4, !dbg !406
  %0 = load i32, i32* %data, align 4, !dbg !407
  call void @goodG2BSink(i32 noundef %0), !dbg !408
  ret void, !dbg !409
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !410 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata i32* %i, metadata !413, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !416, metadata !DIExpression()), !dbg !417
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !418
  %0 = bitcast i8* %call to i32*, !dbg !419
  store i32* %0, i32** %buffer, align 8, !dbg !417
  %1 = load i32*, i32** %buffer, align 8, !dbg !420
  %cmp = icmp eq i32* %1, null, !dbg !422
  br i1 %cmp, label %if.then, label %if.end, !dbg !423

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !424
  unreachable, !dbg !424

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !426
  br label %for.cond, !dbg !428

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !429
  %cmp1 = icmp slt i32 %2, 10, !dbg !431
  br i1 %cmp1, label %for.body, label %for.end, !dbg !432

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !433
  %4 = load i32, i32* %i, align 4, !dbg !435
  %idxprom = sext i32 %4 to i64, !dbg !433
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !433
  store i32 0, i32* %arrayidx, align 4, !dbg !436
  br label %for.inc, !dbg !437

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !438
  %inc = add nsw i32 %5, 1, !dbg !438
  store i32 %inc, i32* %i, align 4, !dbg !438
  br label %for.cond, !dbg !439, !llvm.loop !440

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data.addr, align 4, !dbg !442
  %cmp2 = icmp sge i32 %6, 0, !dbg !444
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !445

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !446
  %8 = load i32, i32* %data.addr, align 4, !dbg !448
  %idxprom4 = sext i32 %8 to i64, !dbg !446
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !446
  store i32 1, i32* %arrayidx5, align 4, !dbg !449
  store i32 0, i32* %i, align 4, !dbg !450
  br label %for.cond6, !dbg !452

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !453
  %cmp7 = icmp slt i32 %9, 10, !dbg !455
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !456

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !457
  %11 = load i32, i32* %i, align 4, !dbg !459
  %idxprom9 = sext i32 %11 to i64, !dbg !457
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !457
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !457
  call void @printIntLine(i32 noundef %12), !dbg !460
  br label %for.inc11, !dbg !461

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !462
  %inc12 = add nsw i32 %13, 1, !dbg !462
  store i32 %inc12, i32* %i, align 4, !dbg !462
  br label %for.cond6, !dbg !463, !llvm.loop !464

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !466

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !467
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !469
  %15 = bitcast i32* %14 to i8*, !dbg !469
  call void @free(i8* noundef %15), !dbg !470
  ret void, !dbg !471
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !9, !5, !24, !26}
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
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_bad", scope: !35, file: !35, line: 74, type: !36, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!35 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !{}
!39 = !DILocalVariable(name: "data", scope: !34, file: !35, line: 76, type: !25)
!40 = !DILocation(line: 76, column: 9, scope: !34)
!41 = !DILocation(line: 78, column: 10, scope: !34)
!42 = !DILocalVariable(name: "recvResult", scope: !43, file: !35, line: 84, type: !25)
!43 = distinct !DILexicalBlock(scope: !34, file: !35, line: 79, column: 5)
!44 = !DILocation(line: 84, column: 13, scope: !43)
!45 = !DILocalVariable(name: "service", scope: !43, file: !35, line: 85, type: !46)
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
!65 = !DILocation(line: 85, column: 28, scope: !43)
!66 = !DILocalVariable(name: "listenSocket", scope: !43, file: !35, line: 86, type: !25)
!67 = !DILocation(line: 86, column: 16, scope: !43)
!68 = !DILocalVariable(name: "acceptSocket", scope: !43, file: !35, line: 87, type: !25)
!69 = !DILocation(line: 87, column: 16, scope: !43)
!70 = !DILocalVariable(name: "inputBuffer", scope: !43, file: !35, line: 88, type: !20)
!71 = !DILocation(line: 88, column: 14, scope: !43)
!72 = !DILocation(line: 89, column: 9, scope: !43)
!73 = !DILocation(line: 99, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !43, file: !35, line: 90, column: 9)
!75 = !DILocation(line: 99, column: 26, scope: !74)
!76 = !DILocation(line: 100, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !35, line: 100, column: 17)
!78 = !DILocation(line: 100, column: 30, scope: !77)
!79 = !DILocation(line: 100, column: 17, scope: !74)
!80 = !DILocation(line: 102, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !35, line: 101, column: 13)
!82 = !DILocation(line: 104, column: 13, scope: !74)
!83 = !DILocation(line: 105, column: 21, scope: !74)
!84 = !DILocation(line: 105, column: 32, scope: !74)
!85 = !DILocation(line: 106, column: 21, scope: !74)
!86 = !DILocation(line: 106, column: 30, scope: !74)
!87 = !DILocation(line: 106, column: 37, scope: !74)
!88 = !DILocation(line: 107, column: 21, scope: !74)
!89 = !DILocation(line: 107, column: 30, scope: !74)
!90 = !DILocation(line: 108, column: 22, scope: !91)
!91 = distinct !DILexicalBlock(scope: !74, file: !35, line: 108, column: 17)
!92 = !DILocation(line: 108, column: 36, scope: !91)
!93 = !DILocation(line: 108, column: 17, scope: !91)
!94 = !DILocation(line: 108, column: 81, scope: !91)
!95 = !DILocation(line: 108, column: 17, scope: !74)
!96 = !DILocation(line: 110, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !35, line: 109, column: 13)
!98 = !DILocation(line: 112, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !74, file: !35, line: 112, column: 17)
!100 = !DILocation(line: 112, column: 17, scope: !99)
!101 = !DILocation(line: 112, column: 54, scope: !99)
!102 = !DILocation(line: 112, column: 17, scope: !74)
!103 = !DILocation(line: 114, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !35, line: 113, column: 13)
!105 = !DILocation(line: 116, column: 35, scope: !74)
!106 = !DILocation(line: 116, column: 28, scope: !74)
!107 = !DILocation(line: 116, column: 26, scope: !74)
!108 = !DILocation(line: 117, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !74, file: !35, line: 117, column: 17)
!110 = !DILocation(line: 117, column: 30, scope: !109)
!111 = !DILocation(line: 117, column: 17, scope: !74)
!112 = !DILocation(line: 119, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !35, line: 118, column: 13)
!114 = !DILocation(line: 122, column: 31, scope: !74)
!115 = !DILocation(line: 122, column: 45, scope: !74)
!116 = !DILocation(line: 122, column: 26, scope: !74)
!117 = !DILocation(line: 122, column: 24, scope: !74)
!118 = !DILocation(line: 123, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !74, file: !35, line: 123, column: 17)
!120 = !DILocation(line: 123, column: 28, scope: !119)
!121 = !DILocation(line: 123, column: 44, scope: !119)
!122 = !DILocation(line: 123, column: 47, scope: !119)
!123 = !DILocation(line: 123, column: 58, scope: !119)
!124 = !DILocation(line: 123, column: 17, scope: !74)
!125 = !DILocation(line: 125, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !35, line: 124, column: 13)
!127 = !DILocation(line: 128, column: 25, scope: !74)
!128 = !DILocation(line: 128, column: 13, scope: !74)
!129 = !DILocation(line: 128, column: 37, scope: !74)
!130 = !DILocation(line: 130, column: 25, scope: !74)
!131 = !DILocation(line: 130, column: 20, scope: !74)
!132 = !DILocation(line: 130, column: 18, scope: !74)
!133 = !DILocation(line: 131, column: 9, scope: !74)
!134 = !DILocation(line: 133, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !43, file: !35, line: 133, column: 13)
!136 = !DILocation(line: 133, column: 26, scope: !135)
!137 = !DILocation(line: 133, column: 13, scope: !43)
!138 = !DILocation(line: 135, column: 26, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !35, line: 134, column: 9)
!140 = !DILocation(line: 135, column: 13, scope: !139)
!141 = !DILocation(line: 136, column: 9, scope: !139)
!142 = !DILocation(line: 137, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !43, file: !35, line: 137, column: 13)
!144 = !DILocation(line: 137, column: 26, scope: !143)
!145 = !DILocation(line: 137, column: 13, scope: !43)
!146 = !DILocation(line: 139, column: 26, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !35, line: 138, column: 9)
!148 = !DILocation(line: 139, column: 13, scope: !147)
!149 = !DILocation(line: 140, column: 9, scope: !147)
!150 = !DILocation(line: 148, column: 13, scope: !34)
!151 = !DILocation(line: 148, column: 5, scope: !34)
!152 = !DILocation(line: 149, column: 1, scope: !34)
!153 = distinct !DISubprogram(name: "badSink", scope: !35, file: !35, line: 44, type: !154, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!154 = !DISubroutineType(types: !155)
!155 = !{null, !25}
!156 = !DILocalVariable(name: "data", arg: 1, scope: !153, file: !35, line: 44, type: !25)
!157 = !DILocation(line: 44, column: 25, scope: !153)
!158 = !DILocalVariable(name: "i", scope: !159, file: !35, line: 47, type: !25)
!159 = distinct !DILexicalBlock(scope: !153, file: !35, line: 46, column: 5)
!160 = !DILocation(line: 47, column: 13, scope: !159)
!161 = !DILocalVariable(name: "buffer", scope: !159, file: !35, line: 48, type: !24)
!162 = !DILocation(line: 48, column: 15, scope: !159)
!163 = !DILocation(line: 48, column: 31, scope: !159)
!164 = !DILocation(line: 48, column: 24, scope: !159)
!165 = !DILocation(line: 49, column: 13, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !35, line: 49, column: 13)
!167 = !DILocation(line: 49, column: 20, scope: !166)
!168 = !DILocation(line: 49, column: 13, scope: !159)
!169 = !DILocation(line: 49, column: 30, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !35, line: 49, column: 29)
!171 = !DILocation(line: 51, column: 16, scope: !172)
!172 = distinct !DILexicalBlock(scope: !159, file: !35, line: 51, column: 9)
!173 = !DILocation(line: 51, column: 14, scope: !172)
!174 = !DILocation(line: 51, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !35, line: 51, column: 9)
!176 = !DILocation(line: 51, column: 23, scope: !175)
!177 = !DILocation(line: 51, column: 9, scope: !172)
!178 = !DILocation(line: 53, column: 13, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !35, line: 52, column: 9)
!180 = !DILocation(line: 53, column: 20, scope: !179)
!181 = !DILocation(line: 53, column: 23, scope: !179)
!182 = !DILocation(line: 54, column: 9, scope: !179)
!183 = !DILocation(line: 51, column: 30, scope: !175)
!184 = !DILocation(line: 51, column: 9, scope: !175)
!185 = distinct !{!185, !177, !186, !187}
!186 = !DILocation(line: 54, column: 9, scope: !172)
!187 = !{!"llvm.loop.mustprogress"}
!188 = !DILocation(line: 57, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !159, file: !35, line: 57, column: 13)
!190 = !DILocation(line: 57, column: 18, scope: !189)
!191 = !DILocation(line: 57, column: 13, scope: !159)
!192 = !DILocation(line: 59, column: 13, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !35, line: 58, column: 9)
!194 = !DILocation(line: 59, column: 20, scope: !193)
!195 = !DILocation(line: 59, column: 26, scope: !193)
!196 = !DILocation(line: 61, column: 19, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !35, line: 61, column: 13)
!198 = !DILocation(line: 61, column: 17, scope: !197)
!199 = !DILocation(line: 61, column: 24, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !35, line: 61, column: 13)
!201 = !DILocation(line: 61, column: 26, scope: !200)
!202 = !DILocation(line: 61, column: 13, scope: !197)
!203 = !DILocation(line: 63, column: 30, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !35, line: 62, column: 13)
!205 = !DILocation(line: 63, column: 37, scope: !204)
!206 = !DILocation(line: 63, column: 17, scope: !204)
!207 = !DILocation(line: 64, column: 13, scope: !204)
!208 = !DILocation(line: 61, column: 33, scope: !200)
!209 = !DILocation(line: 61, column: 13, scope: !200)
!210 = distinct !{!210, !202, !211, !187}
!211 = !DILocation(line: 64, column: 13, scope: !197)
!212 = !DILocation(line: 65, column: 9, scope: !193)
!213 = !DILocation(line: 68, column: 13, scope: !214)
!214 = distinct !DILexicalBlock(scope: !189, file: !35, line: 67, column: 9)
!215 = !DILocation(line: 70, column: 14, scope: !159)
!216 = !DILocation(line: 70, column: 9, scope: !159)
!217 = !DILocation(line: 72, column: 1, scope: !153)
!218 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_41_good", scope: !35, file: !35, line: 304, type: !36, scopeLine: 305, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!219 = !DILocation(line: 306, column: 5, scope: !218)
!220 = !DILocation(line: 307, column: 5, scope: !218)
!221 = !DILocation(line: 308, column: 1, scope: !218)
!222 = distinct !DISubprogram(name: "main", scope: !35, file: !35, line: 319, type: !223, scopeLine: 320, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!223 = !DISubroutineType(types: !224)
!224 = !{!25, !25, !225}
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !226, size: 64)
!226 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!227 = !DILocalVariable(name: "argc", arg: 1, scope: !222, file: !35, line: 319, type: !25)
!228 = !DILocation(line: 319, column: 14, scope: !222)
!229 = !DILocalVariable(name: "argv", arg: 2, scope: !222, file: !35, line: 319, type: !225)
!230 = !DILocation(line: 319, column: 27, scope: !222)
!231 = !DILocation(line: 322, column: 22, scope: !222)
!232 = !DILocation(line: 322, column: 12, scope: !222)
!233 = !DILocation(line: 322, column: 5, scope: !222)
!234 = !DILocation(line: 324, column: 5, scope: !222)
!235 = !DILocation(line: 325, column: 5, scope: !222)
!236 = !DILocation(line: 326, column: 5, scope: !222)
!237 = !DILocation(line: 329, column: 5, scope: !222)
!238 = !DILocation(line: 330, column: 5, scope: !222)
!239 = !DILocation(line: 331, column: 5, scope: !222)
!240 = !DILocation(line: 333, column: 5, scope: !222)
!241 = distinct !DISubprogram(name: "goodB2G", scope: !35, file: !35, line: 227, type: !36, scopeLine: 228, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!242 = !DILocalVariable(name: "data", scope: !241, file: !35, line: 229, type: !25)
!243 = !DILocation(line: 229, column: 9, scope: !241)
!244 = !DILocation(line: 231, column: 10, scope: !241)
!245 = !DILocalVariable(name: "recvResult", scope: !246, file: !35, line: 237, type: !25)
!246 = distinct !DILexicalBlock(scope: !241, file: !35, line: 232, column: 5)
!247 = !DILocation(line: 237, column: 13, scope: !246)
!248 = !DILocalVariable(name: "service", scope: !246, file: !35, line: 238, type: !46)
!249 = !DILocation(line: 238, column: 28, scope: !246)
!250 = !DILocalVariable(name: "listenSocket", scope: !246, file: !35, line: 239, type: !25)
!251 = !DILocation(line: 239, column: 16, scope: !246)
!252 = !DILocalVariable(name: "acceptSocket", scope: !246, file: !35, line: 240, type: !25)
!253 = !DILocation(line: 240, column: 16, scope: !246)
!254 = !DILocalVariable(name: "inputBuffer", scope: !246, file: !35, line: 241, type: !20)
!255 = !DILocation(line: 241, column: 14, scope: !246)
!256 = !DILocation(line: 242, column: 9, scope: !246)
!257 = !DILocation(line: 252, column: 28, scope: !258)
!258 = distinct !DILexicalBlock(scope: !246, file: !35, line: 243, column: 9)
!259 = !DILocation(line: 252, column: 26, scope: !258)
!260 = !DILocation(line: 253, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !35, line: 253, column: 17)
!262 = !DILocation(line: 253, column: 30, scope: !261)
!263 = !DILocation(line: 253, column: 17, scope: !258)
!264 = !DILocation(line: 255, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !35, line: 254, column: 13)
!266 = !DILocation(line: 257, column: 13, scope: !258)
!267 = !DILocation(line: 258, column: 21, scope: !258)
!268 = !DILocation(line: 258, column: 32, scope: !258)
!269 = !DILocation(line: 259, column: 21, scope: !258)
!270 = !DILocation(line: 259, column: 30, scope: !258)
!271 = !DILocation(line: 259, column: 37, scope: !258)
!272 = !DILocation(line: 260, column: 21, scope: !258)
!273 = !DILocation(line: 260, column: 30, scope: !258)
!274 = !DILocation(line: 261, column: 22, scope: !275)
!275 = distinct !DILexicalBlock(scope: !258, file: !35, line: 261, column: 17)
!276 = !DILocation(line: 261, column: 36, scope: !275)
!277 = !DILocation(line: 261, column: 17, scope: !275)
!278 = !DILocation(line: 261, column: 81, scope: !275)
!279 = !DILocation(line: 261, column: 17, scope: !258)
!280 = !DILocation(line: 263, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !275, file: !35, line: 262, column: 13)
!282 = !DILocation(line: 265, column: 24, scope: !283)
!283 = distinct !DILexicalBlock(scope: !258, file: !35, line: 265, column: 17)
!284 = !DILocation(line: 265, column: 17, scope: !283)
!285 = !DILocation(line: 265, column: 54, scope: !283)
!286 = !DILocation(line: 265, column: 17, scope: !258)
!287 = !DILocation(line: 267, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !35, line: 266, column: 13)
!289 = !DILocation(line: 269, column: 35, scope: !258)
!290 = !DILocation(line: 269, column: 28, scope: !258)
!291 = !DILocation(line: 269, column: 26, scope: !258)
!292 = !DILocation(line: 270, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !258, file: !35, line: 270, column: 17)
!294 = !DILocation(line: 270, column: 30, scope: !293)
!295 = !DILocation(line: 270, column: 17, scope: !258)
!296 = !DILocation(line: 272, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !35, line: 271, column: 13)
!298 = !DILocation(line: 275, column: 31, scope: !258)
!299 = !DILocation(line: 275, column: 45, scope: !258)
!300 = !DILocation(line: 275, column: 26, scope: !258)
!301 = !DILocation(line: 275, column: 24, scope: !258)
!302 = !DILocation(line: 276, column: 17, scope: !303)
!303 = distinct !DILexicalBlock(scope: !258, file: !35, line: 276, column: 17)
!304 = !DILocation(line: 276, column: 28, scope: !303)
!305 = !DILocation(line: 276, column: 44, scope: !303)
!306 = !DILocation(line: 276, column: 47, scope: !303)
!307 = !DILocation(line: 276, column: 58, scope: !303)
!308 = !DILocation(line: 276, column: 17, scope: !258)
!309 = !DILocation(line: 278, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !303, file: !35, line: 277, column: 13)
!311 = !DILocation(line: 281, column: 25, scope: !258)
!312 = !DILocation(line: 281, column: 13, scope: !258)
!313 = !DILocation(line: 281, column: 37, scope: !258)
!314 = !DILocation(line: 283, column: 25, scope: !258)
!315 = !DILocation(line: 283, column: 20, scope: !258)
!316 = !DILocation(line: 283, column: 18, scope: !258)
!317 = !DILocation(line: 284, column: 9, scope: !258)
!318 = !DILocation(line: 286, column: 13, scope: !319)
!319 = distinct !DILexicalBlock(scope: !246, file: !35, line: 286, column: 13)
!320 = !DILocation(line: 286, column: 26, scope: !319)
!321 = !DILocation(line: 286, column: 13, scope: !246)
!322 = !DILocation(line: 288, column: 26, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !35, line: 287, column: 9)
!324 = !DILocation(line: 288, column: 13, scope: !323)
!325 = !DILocation(line: 289, column: 9, scope: !323)
!326 = !DILocation(line: 290, column: 13, scope: !327)
!327 = distinct !DILexicalBlock(scope: !246, file: !35, line: 290, column: 13)
!328 = !DILocation(line: 290, column: 26, scope: !327)
!329 = !DILocation(line: 290, column: 13, scope: !246)
!330 = !DILocation(line: 292, column: 26, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !35, line: 291, column: 9)
!332 = !DILocation(line: 292, column: 13, scope: !331)
!333 = !DILocation(line: 293, column: 9, scope: !331)
!334 = !DILocation(line: 301, column: 17, scope: !241)
!335 = !DILocation(line: 301, column: 5, scope: !241)
!336 = !DILocation(line: 302, column: 1, scope: !241)
!337 = distinct !DISubprogram(name: "goodB2GSink", scope: !35, file: !35, line: 198, type: !154, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!338 = !DILocalVariable(name: "data", arg: 1, scope: !337, file: !35, line: 198, type: !25)
!339 = !DILocation(line: 198, column: 29, scope: !337)
!340 = !DILocalVariable(name: "i", scope: !341, file: !35, line: 201, type: !25)
!341 = distinct !DILexicalBlock(scope: !337, file: !35, line: 200, column: 5)
!342 = !DILocation(line: 201, column: 13, scope: !341)
!343 = !DILocalVariable(name: "buffer", scope: !341, file: !35, line: 202, type: !24)
!344 = !DILocation(line: 202, column: 15, scope: !341)
!345 = !DILocation(line: 202, column: 31, scope: !341)
!346 = !DILocation(line: 202, column: 24, scope: !341)
!347 = !DILocation(line: 203, column: 13, scope: !348)
!348 = distinct !DILexicalBlock(scope: !341, file: !35, line: 203, column: 13)
!349 = !DILocation(line: 203, column: 20, scope: !348)
!350 = !DILocation(line: 203, column: 13, scope: !341)
!351 = !DILocation(line: 203, column: 30, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !35, line: 203, column: 29)
!353 = !DILocation(line: 205, column: 16, scope: !354)
!354 = distinct !DILexicalBlock(scope: !341, file: !35, line: 205, column: 9)
!355 = !DILocation(line: 205, column: 14, scope: !354)
!356 = !DILocation(line: 205, column: 21, scope: !357)
!357 = distinct !DILexicalBlock(scope: !354, file: !35, line: 205, column: 9)
!358 = !DILocation(line: 205, column: 23, scope: !357)
!359 = !DILocation(line: 205, column: 9, scope: !354)
!360 = !DILocation(line: 207, column: 13, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !35, line: 206, column: 9)
!362 = !DILocation(line: 207, column: 20, scope: !361)
!363 = !DILocation(line: 207, column: 23, scope: !361)
!364 = !DILocation(line: 208, column: 9, scope: !361)
!365 = !DILocation(line: 205, column: 30, scope: !357)
!366 = !DILocation(line: 205, column: 9, scope: !357)
!367 = distinct !{!367, !359, !368, !187}
!368 = !DILocation(line: 208, column: 9, scope: !354)
!369 = !DILocation(line: 210, column: 13, scope: !370)
!370 = distinct !DILexicalBlock(scope: !341, file: !35, line: 210, column: 13)
!371 = !DILocation(line: 210, column: 18, scope: !370)
!372 = !DILocation(line: 210, column: 23, scope: !370)
!373 = !DILocation(line: 210, column: 26, scope: !370)
!374 = !DILocation(line: 210, column: 31, scope: !370)
!375 = !DILocation(line: 210, column: 13, scope: !341)
!376 = !DILocation(line: 212, column: 13, scope: !377)
!377 = distinct !DILexicalBlock(scope: !370, file: !35, line: 211, column: 9)
!378 = !DILocation(line: 212, column: 20, scope: !377)
!379 = !DILocation(line: 212, column: 26, scope: !377)
!380 = !DILocation(line: 214, column: 19, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !35, line: 214, column: 13)
!382 = !DILocation(line: 214, column: 17, scope: !381)
!383 = !DILocation(line: 214, column: 24, scope: !384)
!384 = distinct !DILexicalBlock(scope: !381, file: !35, line: 214, column: 13)
!385 = !DILocation(line: 214, column: 26, scope: !384)
!386 = !DILocation(line: 214, column: 13, scope: !381)
!387 = !DILocation(line: 216, column: 30, scope: !388)
!388 = distinct !DILexicalBlock(scope: !384, file: !35, line: 215, column: 13)
!389 = !DILocation(line: 216, column: 37, scope: !388)
!390 = !DILocation(line: 216, column: 17, scope: !388)
!391 = !DILocation(line: 217, column: 13, scope: !388)
!392 = !DILocation(line: 214, column: 33, scope: !384)
!393 = !DILocation(line: 214, column: 13, scope: !384)
!394 = distinct !{!394, !386, !395, !187}
!395 = !DILocation(line: 217, column: 13, scope: !381)
!396 = !DILocation(line: 218, column: 9, scope: !377)
!397 = !DILocation(line: 221, column: 13, scope: !398)
!398 = distinct !DILexicalBlock(scope: !370, file: !35, line: 220, column: 9)
!399 = !DILocation(line: 223, column: 14, scope: !341)
!400 = !DILocation(line: 223, column: 9, scope: !341)
!401 = !DILocation(line: 225, column: 1, scope: !337)
!402 = distinct !DISubprogram(name: "goodG2B", scope: !35, file: !35, line: 186, type: !36, scopeLine: 187, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!403 = !DILocalVariable(name: "data", scope: !402, file: !35, line: 188, type: !25)
!404 = !DILocation(line: 188, column: 9, scope: !402)
!405 = !DILocation(line: 190, column: 10, scope: !402)
!406 = !DILocation(line: 193, column: 10, scope: !402)
!407 = !DILocation(line: 194, column: 17, scope: !402)
!408 = !DILocation(line: 194, column: 5, scope: !402)
!409 = !DILocation(line: 195, column: 1, scope: !402)
!410 = distinct !DISubprogram(name: "goodG2BSink", scope: !35, file: !35, line: 156, type: !154, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!411 = !DILocalVariable(name: "data", arg: 1, scope: !410, file: !35, line: 156, type: !25)
!412 = !DILocation(line: 156, column: 29, scope: !410)
!413 = !DILocalVariable(name: "i", scope: !414, file: !35, line: 159, type: !25)
!414 = distinct !DILexicalBlock(scope: !410, file: !35, line: 158, column: 5)
!415 = !DILocation(line: 159, column: 13, scope: !414)
!416 = !DILocalVariable(name: "buffer", scope: !414, file: !35, line: 160, type: !24)
!417 = !DILocation(line: 160, column: 15, scope: !414)
!418 = !DILocation(line: 160, column: 31, scope: !414)
!419 = !DILocation(line: 160, column: 24, scope: !414)
!420 = !DILocation(line: 161, column: 13, scope: !421)
!421 = distinct !DILexicalBlock(scope: !414, file: !35, line: 161, column: 13)
!422 = !DILocation(line: 161, column: 20, scope: !421)
!423 = !DILocation(line: 161, column: 13, scope: !414)
!424 = !DILocation(line: 161, column: 30, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !35, line: 161, column: 29)
!426 = !DILocation(line: 163, column: 16, scope: !427)
!427 = distinct !DILexicalBlock(scope: !414, file: !35, line: 163, column: 9)
!428 = !DILocation(line: 163, column: 14, scope: !427)
!429 = !DILocation(line: 163, column: 21, scope: !430)
!430 = distinct !DILexicalBlock(scope: !427, file: !35, line: 163, column: 9)
!431 = !DILocation(line: 163, column: 23, scope: !430)
!432 = !DILocation(line: 163, column: 9, scope: !427)
!433 = !DILocation(line: 165, column: 13, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !35, line: 164, column: 9)
!435 = !DILocation(line: 165, column: 20, scope: !434)
!436 = !DILocation(line: 165, column: 23, scope: !434)
!437 = !DILocation(line: 166, column: 9, scope: !434)
!438 = !DILocation(line: 163, column: 30, scope: !430)
!439 = !DILocation(line: 163, column: 9, scope: !430)
!440 = distinct !{!440, !432, !441, !187}
!441 = !DILocation(line: 166, column: 9, scope: !427)
!442 = !DILocation(line: 169, column: 13, scope: !443)
!443 = distinct !DILexicalBlock(scope: !414, file: !35, line: 169, column: 13)
!444 = !DILocation(line: 169, column: 18, scope: !443)
!445 = !DILocation(line: 169, column: 13, scope: !414)
!446 = !DILocation(line: 171, column: 13, scope: !447)
!447 = distinct !DILexicalBlock(scope: !443, file: !35, line: 170, column: 9)
!448 = !DILocation(line: 171, column: 20, scope: !447)
!449 = !DILocation(line: 171, column: 26, scope: !447)
!450 = !DILocation(line: 173, column: 19, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !35, line: 173, column: 13)
!452 = !DILocation(line: 173, column: 17, scope: !451)
!453 = !DILocation(line: 173, column: 24, scope: !454)
!454 = distinct !DILexicalBlock(scope: !451, file: !35, line: 173, column: 13)
!455 = !DILocation(line: 173, column: 26, scope: !454)
!456 = !DILocation(line: 173, column: 13, scope: !451)
!457 = !DILocation(line: 175, column: 30, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !35, line: 174, column: 13)
!459 = !DILocation(line: 175, column: 37, scope: !458)
!460 = !DILocation(line: 175, column: 17, scope: !458)
!461 = !DILocation(line: 176, column: 13, scope: !458)
!462 = !DILocation(line: 173, column: 33, scope: !454)
!463 = !DILocation(line: 173, column: 13, scope: !454)
!464 = distinct !{!464, !456, !465, !187}
!465 = !DILocation(line: 176, column: 13, scope: !451)
!466 = !DILocation(line: 177, column: 9, scope: !447)
!467 = !DILocation(line: 180, column: 13, scope: !468)
!468 = distinct !DILexicalBlock(scope: !443, file: !35, line: 179, column: 9)
!469 = !DILocation(line: 182, column: 14, scope: !414)
!470 = !DILocation(line: 182, column: 9, scope: !414)
!471 = !DILocation(line: 184, column: 1, scope: !410)
