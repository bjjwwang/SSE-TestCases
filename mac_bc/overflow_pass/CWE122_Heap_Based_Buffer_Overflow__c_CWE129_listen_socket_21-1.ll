; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !30
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !33
@goodG2BStatic = internal global i32 0, align 4, !dbg !35

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_bad() #0 !dbg !44 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 -1, i32* %data, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !51, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !54, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 -1, i32* %listenSocket, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 -1, i32* %acceptSocket, align 4, !dbg !78
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  br label %do.body, !dbg !81

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !82
  store i32 %call, i32* %listenSocket, align 4, !dbg !84
  %0 = load i32, i32* %listenSocket, align 4, !dbg !85
  %cmp = icmp eq i32 %0, -1, !dbg !87
  br i1 %cmp, label %if.then, label %if.end, !dbg !88

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !89

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !91
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !91
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !92
  store i8 2, i8* %sin_family, align 1, !dbg !93
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !94
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !95
  store i32 0, i32* %s_addr, align 4, !dbg !96
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !97
  store i16 -30871, i16* %sin_port, align 2, !dbg !98
  %2 = load i32, i32* %listenSocket, align 4, !dbg !99
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !101
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !102
  %cmp2 = icmp eq i32 %call1, -1, !dbg !103
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !104

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !105

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !107
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !109
  %cmp6 = icmp eq i32 %call5, -1, !dbg !110
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !111

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !112

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !114
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !115
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !116
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !117
  %cmp10 = icmp eq i32 %6, -1, !dbg !119
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !120

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !121

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !123
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !124
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !125
  %conv = trunc i64 %call13 to i32, !dbg !125
  store i32 %conv, i32* %recvResult, align 4, !dbg !126
  %8 = load i32, i32* %recvResult, align 4, !dbg !127
  %cmp14 = icmp eq i32 %8, -1, !dbg !129
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !130

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !131
  %cmp16 = icmp eq i32 %9, 0, !dbg !132
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !133

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !134

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !136
  %idxprom = sext i32 %10 to i64, !dbg !137
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !138
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !139
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !140
  store i32 %call21, i32* %data, align 4, !dbg !141
  br label %do.end, !dbg !142

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !143
  %cmp22 = icmp ne i32 %11, -1, !dbg !145
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !146

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !147
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !149
  br label %if.end26, !dbg !150

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !151
  %cmp27 = icmp ne i32 %13, -1, !dbg !153
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !154

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !155
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !157
  br label %if.end31, !dbg !158

if.end31:                                         ; preds = %if.then29, %if.end26
  store i32 1, i32* @badStatic, align 4, !dbg !159
  %15 = load i32, i32* %data, align 4, !dbg !160
  call void @badSink(i32 noundef %15), !dbg !161
  ret void, !dbg !162
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
define internal void @badSink(i32 noundef %data) #0 !dbg !163 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !166, metadata !DIExpression()), !dbg !167
  %0 = load i32, i32* @badStatic, align 4, !dbg !168
  %tobool = icmp ne i32 %0, 0, !dbg !168
  br i1 %tobool, label %if.then, label %if.end16, !dbg !170

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !171, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !175, metadata !DIExpression()), !dbg !176
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !177
  %1 = bitcast i8* %call to i32*, !dbg !178
  store i32* %1, i32** %buffer, align 8, !dbg !176
  %2 = load i32*, i32** %buffer, align 8, !dbg !179
  %cmp = icmp eq i32* %2, null, !dbg !181
  br i1 %cmp, label %if.then1, label %if.end, !dbg !182

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #7, !dbg !183
  unreachable, !dbg !183

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !187

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !188
  %cmp2 = icmp slt i32 %3, 10, !dbg !190
  br i1 %cmp2, label %for.body, label %for.end, !dbg !191

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !192
  %5 = load i32, i32* %i, align 4, !dbg !194
  %idxprom = sext i32 %5 to i64, !dbg !192
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !192
  store i32 0, i32* %arrayidx, align 4, !dbg !195
  br label %for.inc, !dbg !196

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !197
  %inc = add nsw i32 %6, 1, !dbg !197
  store i32 %inc, i32* %i, align 4, !dbg !197
  br label %for.cond, !dbg !198, !llvm.loop !199

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !202
  %cmp3 = icmp sge i32 %7, 0, !dbg !204
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !205

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !206
  %9 = load i32, i32* %data.addr, align 4, !dbg !208
  %idxprom5 = sext i32 %9 to i64, !dbg !206
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !206
  store i32 1, i32* %arrayidx6, align 4, !dbg !209
  store i32 0, i32* %i, align 4, !dbg !210
  br label %for.cond7, !dbg !212

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !213
  %cmp8 = icmp slt i32 %10, 10, !dbg !215
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !216

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !217
  %12 = load i32, i32* %i, align 4, !dbg !219
  %idxprom10 = sext i32 %12 to i64, !dbg !217
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !217
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !217
  call void @printIntLine(i32 noundef %13), !dbg !220
  br label %for.inc12, !dbg !221

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !222
  %inc13 = add nsw i32 %14, 1, !dbg !222
  store i32 %inc13, i32* %i, align 4, !dbg !222
  br label %for.cond7, !dbg !223, !llvm.loop !224

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !226

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !227
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !229
  %16 = bitcast i32* %15 to i8*, !dbg !229
  call void @free(i8* noundef %16), !dbg !230
  br label %if.end16, !dbg !231

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !232
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_good() #0 !dbg !233 {
entry:
  call void @goodB2G1(), !dbg !234
  call void @goodB2G2(), !dbg !235
  call void @goodG2B(), !dbg !236
  ret void, !dbg !237
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !238 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !243, metadata !DIExpression()), !dbg !244
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !245, metadata !DIExpression()), !dbg !246
  %call = call i64 @time(i64* noundef null), !dbg !247
  %conv = trunc i64 %call to i32, !dbg !248
  call void @srand(i32 noundef %conv), !dbg !249
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !250
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_good(), !dbg !251
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !252
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !253
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_bad(), !dbg !254
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !255
  ret i32 0, !dbg !256
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
define internal void @goodB2G1() #0 !dbg !257 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !258, metadata !DIExpression()), !dbg !259
  store i32 -1, i32* %data, align 4, !dbg !260
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !261, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !264, metadata !DIExpression()), !dbg !265
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !266, metadata !DIExpression()), !dbg !267
  store i32 -1, i32* %listenSocket, align 4, !dbg !267
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !268, metadata !DIExpression()), !dbg !269
  store i32 -1, i32* %acceptSocket, align 4, !dbg !269
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !270, metadata !DIExpression()), !dbg !271
  br label %do.body, !dbg !272

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !273
  store i32 %call, i32* %listenSocket, align 4, !dbg !275
  %0 = load i32, i32* %listenSocket, align 4, !dbg !276
  %cmp = icmp eq i32 %0, -1, !dbg !278
  br i1 %cmp, label %if.then, label %if.end, !dbg !279

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !280

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !282
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !282
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !283
  store i8 2, i8* %sin_family, align 1, !dbg !284
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !285
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !286
  store i32 0, i32* %s_addr, align 4, !dbg !287
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !288
  store i16 -30871, i16* %sin_port, align 2, !dbg !289
  %2 = load i32, i32* %listenSocket, align 4, !dbg !290
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !292
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !293
  %cmp2 = icmp eq i32 %call1, -1, !dbg !294
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !295

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !296

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !298
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !300
  %cmp6 = icmp eq i32 %call5, -1, !dbg !301
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !302

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !303

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !305
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !306
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !307
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !308
  %cmp10 = icmp eq i32 %6, -1, !dbg !310
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !311

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !312

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !314
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !315
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !316
  %conv = trunc i64 %call13 to i32, !dbg !316
  store i32 %conv, i32* %recvResult, align 4, !dbg !317
  %8 = load i32, i32* %recvResult, align 4, !dbg !318
  %cmp14 = icmp eq i32 %8, -1, !dbg !320
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !321

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !322
  %cmp16 = icmp eq i32 %9, 0, !dbg !323
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !324

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !325

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !327
  %idxprom = sext i32 %10 to i64, !dbg !328
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !328
  store i8 0, i8* %arrayidx, align 1, !dbg !329
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !330
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !331
  store i32 %call21, i32* %data, align 4, !dbg !332
  br label %do.end, !dbg !333

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !334
  %cmp22 = icmp ne i32 %11, -1, !dbg !336
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !337

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !338
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !340
  br label %if.end26, !dbg !341

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !342
  %cmp27 = icmp ne i32 %13, -1, !dbg !344
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !345

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !346
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !348
  br label %if.end31, !dbg !349

if.end31:                                         ; preds = %if.then29, %if.end26
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !350
  %15 = load i32, i32* %data, align 4, !dbg !351
  call void @goodB2G1Sink(i32 noundef %15), !dbg !352
  ret void, !dbg !353
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1Sink(i32 noundef %data) #0 !dbg !354 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !355, metadata !DIExpression()), !dbg !356
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !357
  %tobool = icmp ne i32 %0, 0, !dbg !357
  br i1 %tobool, label %if.then, label %if.else, !dbg !359

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !360
  br label %if.end18, !dbg !362

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !363, metadata !DIExpression()), !dbg !366
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !367, metadata !DIExpression()), !dbg !368
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !369
  %1 = bitcast i8* %call to i32*, !dbg !370
  store i32* %1, i32** %buffer, align 8, !dbg !368
  %2 = load i32*, i32** %buffer, align 8, !dbg !371
  %cmp = icmp eq i32* %2, null, !dbg !373
  br i1 %cmp, label %if.then1, label %if.end, !dbg !374

if.then1:                                         ; preds = %if.else
  call void @exit(i32 noundef -1) #7, !dbg !375
  unreachable, !dbg !375

if.end:                                           ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !377
  br label %for.cond, !dbg !379

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !380
  %cmp2 = icmp slt i32 %3, 10, !dbg !382
  br i1 %cmp2, label %for.body, label %for.end, !dbg !383

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !384
  %5 = load i32, i32* %i, align 4, !dbg !386
  %idxprom = sext i32 %5 to i64, !dbg !384
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !384
  store i32 0, i32* %arrayidx, align 4, !dbg !387
  br label %for.inc, !dbg !388

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !389
  %inc = add nsw i32 %6, 1, !dbg !389
  store i32 %inc, i32* %i, align 4, !dbg !389
  br label %for.cond, !dbg !390, !llvm.loop !391

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !393
  %cmp3 = icmp sge i32 %7, 0, !dbg !395
  br i1 %cmp3, label %land.lhs.true, label %if.else16, !dbg !396

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !397
  %cmp4 = icmp slt i32 %8, 10, !dbg !398
  br i1 %cmp4, label %if.then5, label %if.else16, !dbg !399

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !400
  %10 = load i32, i32* %data.addr, align 4, !dbg !402
  %idxprom6 = sext i32 %10 to i64, !dbg !400
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !400
  store i32 1, i32* %arrayidx7, align 4, !dbg !403
  store i32 0, i32* %i, align 4, !dbg !404
  br label %for.cond8, !dbg !406

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !407
  %cmp9 = icmp slt i32 %11, 10, !dbg !409
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !410

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !411
  %13 = load i32, i32* %i, align 4, !dbg !413
  %idxprom11 = sext i32 %13 to i64, !dbg !411
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !411
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !411
  call void @printIntLine(i32 noundef %14), !dbg !414
  br label %for.inc13, !dbg !415

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !416
  %inc14 = add nsw i32 %15, 1, !dbg !416
  store i32 %inc14, i32* %i, align 4, !dbg !416
  br label %for.cond8, !dbg !417, !llvm.loop !418

for.end15:                                        ; preds = %for.cond8
  br label %if.end17, !dbg !420

if.else16:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !421
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !423
  %17 = bitcast i32* %16 to i8*, !dbg !423
  call void @free(i8* noundef %17), !dbg !424
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.then
  ret void, !dbg !425
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !426 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !427, metadata !DIExpression()), !dbg !428
  store i32 -1, i32* %data, align 4, !dbg !429
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !430, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !433, metadata !DIExpression()), !dbg !434
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !435, metadata !DIExpression()), !dbg !436
  store i32 -1, i32* %listenSocket, align 4, !dbg !436
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !437, metadata !DIExpression()), !dbg !438
  store i32 -1, i32* %acceptSocket, align 4, !dbg !438
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !439, metadata !DIExpression()), !dbg !440
  br label %do.body, !dbg !441

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !442
  store i32 %call, i32* %listenSocket, align 4, !dbg !444
  %0 = load i32, i32* %listenSocket, align 4, !dbg !445
  %cmp = icmp eq i32 %0, -1, !dbg !447
  br i1 %cmp, label %if.then, label %if.end, !dbg !448

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !449

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !451
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !451
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !452
  store i8 2, i8* %sin_family, align 1, !dbg !453
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !454
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !455
  store i32 0, i32* %s_addr, align 4, !dbg !456
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !457
  store i16 -30871, i16* %sin_port, align 2, !dbg !458
  %2 = load i32, i32* %listenSocket, align 4, !dbg !459
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !461
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !462
  %cmp2 = icmp eq i32 %call1, -1, !dbg !463
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !464

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !465

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !467
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !469
  %cmp6 = icmp eq i32 %call5, -1, !dbg !470
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !471

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !472

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !474
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !475
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !476
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !477
  %cmp10 = icmp eq i32 %6, -1, !dbg !479
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !480

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !481

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !483
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !484
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !485
  %conv = trunc i64 %call13 to i32, !dbg !485
  store i32 %conv, i32* %recvResult, align 4, !dbg !486
  %8 = load i32, i32* %recvResult, align 4, !dbg !487
  %cmp14 = icmp eq i32 %8, -1, !dbg !489
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !490

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !491
  %cmp16 = icmp eq i32 %9, 0, !dbg !492
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !493

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !494

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !496
  %idxprom = sext i32 %10 to i64, !dbg !497
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !497
  store i8 0, i8* %arrayidx, align 1, !dbg !498
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !499
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !500
  store i32 %call21, i32* %data, align 4, !dbg !501
  br label %do.end, !dbg !502

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !503
  %cmp22 = icmp ne i32 %11, -1, !dbg !505
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !506

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !507
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !509
  br label %if.end26, !dbg !510

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !511
  %cmp27 = icmp ne i32 %13, -1, !dbg !513
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !514

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !515
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !517
  br label %if.end31, !dbg !518

if.end31:                                         ; preds = %if.then29, %if.end26
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !519
  %15 = load i32, i32* %data, align 4, !dbg !520
  call void @goodB2G2Sink(i32 noundef %15), !dbg !521
  ret void, !dbg !522
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2Sink(i32 noundef %data) #0 !dbg !523 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !524, metadata !DIExpression()), !dbg !525
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !526
  %tobool = icmp ne i32 %0, 0, !dbg !526
  br i1 %tobool, label %if.then, label %if.end17, !dbg !528

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !529, metadata !DIExpression()), !dbg !532
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !533, metadata !DIExpression()), !dbg !534
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !535
  %1 = bitcast i8* %call to i32*, !dbg !536
  store i32* %1, i32** %buffer, align 8, !dbg !534
  %2 = load i32*, i32** %buffer, align 8, !dbg !537
  %cmp = icmp eq i32* %2, null, !dbg !539
  br i1 %cmp, label %if.then1, label %if.end, !dbg !540

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #7, !dbg !541
  unreachable, !dbg !541

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !543
  br label %for.cond, !dbg !545

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !546
  %cmp2 = icmp slt i32 %3, 10, !dbg !548
  br i1 %cmp2, label %for.body, label %for.end, !dbg !549

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !550
  %5 = load i32, i32* %i, align 4, !dbg !552
  %idxprom = sext i32 %5 to i64, !dbg !550
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !550
  store i32 0, i32* %arrayidx, align 4, !dbg !553
  br label %for.inc, !dbg !554

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !555
  %inc = add nsw i32 %6, 1, !dbg !555
  store i32 %inc, i32* %i, align 4, !dbg !555
  br label %for.cond, !dbg !556, !llvm.loop !557

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !559
  %cmp3 = icmp sge i32 %7, 0, !dbg !561
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !562

land.lhs.true:                                    ; preds = %for.end
  %8 = load i32, i32* %data.addr, align 4, !dbg !563
  %cmp4 = icmp slt i32 %8, 10, !dbg !564
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !565

if.then5:                                         ; preds = %land.lhs.true
  %9 = load i32*, i32** %buffer, align 8, !dbg !566
  %10 = load i32, i32* %data.addr, align 4, !dbg !568
  %idxprom6 = sext i32 %10 to i64, !dbg !566
  %arrayidx7 = getelementptr inbounds i32, i32* %9, i64 %idxprom6, !dbg !566
  store i32 1, i32* %arrayidx7, align 4, !dbg !569
  store i32 0, i32* %i, align 4, !dbg !570
  br label %for.cond8, !dbg !572

for.cond8:                                        ; preds = %for.inc13, %if.then5
  %11 = load i32, i32* %i, align 4, !dbg !573
  %cmp9 = icmp slt i32 %11, 10, !dbg !575
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !576

for.body10:                                       ; preds = %for.cond8
  %12 = load i32*, i32** %buffer, align 8, !dbg !577
  %13 = load i32, i32* %i, align 4, !dbg !579
  %idxprom11 = sext i32 %13 to i64, !dbg !577
  %arrayidx12 = getelementptr inbounds i32, i32* %12, i64 %idxprom11, !dbg !577
  %14 = load i32, i32* %arrayidx12, align 4, !dbg !577
  call void @printIntLine(i32 noundef %14), !dbg !580
  br label %for.inc13, !dbg !581

for.inc13:                                        ; preds = %for.body10
  %15 = load i32, i32* %i, align 4, !dbg !582
  %inc14 = add nsw i32 %15, 1, !dbg !582
  store i32 %inc14, i32* %i, align 4, !dbg !582
  br label %for.cond8, !dbg !583, !llvm.loop !584

for.end15:                                        ; preds = %for.cond8
  br label %if.end16, !dbg !586

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !587
  br label %if.end16

if.end16:                                         ; preds = %if.else, %for.end15
  %16 = load i32*, i32** %buffer, align 8, !dbg !589
  %17 = bitcast i32* %16 to i8*, !dbg !589
  call void @free(i8* noundef %17), !dbg !590
  br label %if.end17, !dbg !591

if.end17:                                         ; preds = %if.end16, %entry
  ret void, !dbg !592
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !593 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !594, metadata !DIExpression()), !dbg !595
  store i32 -1, i32* %data, align 4, !dbg !596
  store i32 7, i32* %data, align 4, !dbg !597
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !598
  %0 = load i32, i32* %data, align 4, !dbg !599
  call void @goodG2BSink(i32 noundef %0), !dbg !600
  ret void, !dbg !601
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !602 {
entry:
  %data.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !603, metadata !DIExpression()), !dbg !604
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !605
  %tobool = icmp ne i32 %0, 0, !dbg !605
  br i1 %tobool, label %if.then, label %if.end16, !dbg !607

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !608, metadata !DIExpression()), !dbg !611
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !612, metadata !DIExpression()), !dbg !613
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !614
  %1 = bitcast i8* %call to i32*, !dbg !615
  store i32* %1, i32** %buffer, align 8, !dbg !613
  %2 = load i32*, i32** %buffer, align 8, !dbg !616
  %cmp = icmp eq i32* %2, null, !dbg !618
  br i1 %cmp, label %if.then1, label %if.end, !dbg !619

if.then1:                                         ; preds = %if.then
  call void @exit(i32 noundef -1) #7, !dbg !620
  unreachable, !dbg !620

if.end:                                           ; preds = %if.then
  store i32 0, i32* %i, align 4, !dbg !622
  br label %for.cond, !dbg !624

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4, !dbg !625
  %cmp2 = icmp slt i32 %3, 10, !dbg !627
  br i1 %cmp2, label %for.body, label %for.end, !dbg !628

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %buffer, align 8, !dbg !629
  %5 = load i32, i32* %i, align 4, !dbg !631
  %idxprom = sext i32 %5 to i64, !dbg !629
  %arrayidx = getelementptr inbounds i32, i32* %4, i64 %idxprom, !dbg !629
  store i32 0, i32* %arrayidx, align 4, !dbg !632
  br label %for.inc, !dbg !633

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !634
  %inc = add nsw i32 %6, 1, !dbg !634
  store i32 %inc, i32* %i, align 4, !dbg !634
  br label %for.cond, !dbg !635, !llvm.loop !636

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* %data.addr, align 4, !dbg !638
  %cmp3 = icmp sge i32 %7, 0, !dbg !640
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !641

if.then4:                                         ; preds = %for.end
  %8 = load i32*, i32** %buffer, align 8, !dbg !642
  %9 = load i32, i32* %data.addr, align 4, !dbg !644
  %idxprom5 = sext i32 %9 to i64, !dbg !642
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %idxprom5, !dbg !642
  store i32 1, i32* %arrayidx6, align 4, !dbg !645
  store i32 0, i32* %i, align 4, !dbg !646
  br label %for.cond7, !dbg !648

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %10 = load i32, i32* %i, align 4, !dbg !649
  %cmp8 = icmp slt i32 %10, 10, !dbg !651
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !652

for.body9:                                        ; preds = %for.cond7
  %11 = load i32*, i32** %buffer, align 8, !dbg !653
  %12 = load i32, i32* %i, align 4, !dbg !655
  %idxprom10 = sext i32 %12 to i64, !dbg !653
  %arrayidx11 = getelementptr inbounds i32, i32* %11, i64 %idxprom10, !dbg !653
  %13 = load i32, i32* %arrayidx11, align 4, !dbg !653
  call void @printIntLine(i32 noundef %13), !dbg !656
  br label %for.inc12, !dbg !657

for.inc12:                                        ; preds = %for.body9
  %14 = load i32, i32* %i, align 4, !dbg !658
  %inc13 = add nsw i32 %14, 1, !dbg !658
  store i32 %inc13, i32* %i, align 4, !dbg !658
  br label %for.cond7, !dbg !659, !llvm.loop !660

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !662

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.4, i64 0, i64 0)), !dbg !663
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %15 = load i32*, i32** %buffer, align 8, !dbg !665
  %16 = bitcast i32* %15 to i8*, !dbg !665
  call void @free(i8* noundef %16), !dbg !666
  br label %if.end16, !dbg !667

if.end16:                                         ; preds = %if.end15, %entry
  ret void, !dbg !668
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!37, !38, !39, !40, !41, !42}
!llvm.ident = !{!43}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !32, line: 45, type: !27, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !29, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !8, !11, !7, !26, !28}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !6, line: 30, baseType: !7)
!6 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_u_int32_t.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 45, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !13, line: 412, size: 128, elements: !14)
!13 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!14 = !{!15, !18, !21}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !12, file: !13, line: 413, baseType: !16, size: 8)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 43, baseType: !17)
!17 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !12, file: !13, line: 414, baseType: !19, size: 8, offset: 8)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !20, line: 31, baseType: !16)
!20 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!21 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !12, file: !13, line: 415, baseType: !22, size: 112, offset: 16)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !{!0, !30, !33, !35}
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !32, line: 163, type: !27, isLocal: true, isDefinition: true)
!32 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !32, line: 164, type: !27, isLocal: true, isDefinition: true)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !32, line: 165, type: !27, isLocal: true, isDefinition: true)
!37 = !{i32 7, !"Dwarf Version", i32 4}
!38 = !{i32 2, !"Debug Info Version", i32 3}
!39 = !{i32 1, !"wchar_size", i32 4}
!40 = !{i32 7, !"PIC Level", i32 2}
!41 = !{i32 7, !"uwtable", i32 1}
!42 = !{i32 7, !"frame-pointer", i32 2}
!43 = !{!"Homebrew clang version 14.0.6"}
!44 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_bad", scope: !32, file: !32, line: 80, type: !45, scopeLine: 81, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !47)
!45 = !DISubroutineType(types: !46)
!46 = !{null}
!47 = !{}
!48 = !DILocalVariable(name: "data", scope: !44, file: !32, line: 82, type: !27)
!49 = !DILocation(line: 82, column: 9, scope: !44)
!50 = !DILocation(line: 84, column: 10, scope: !44)
!51 = !DILocalVariable(name: "recvResult", scope: !52, file: !32, line: 90, type: !27)
!52 = distinct !DILexicalBlock(scope: !44, file: !32, line: 85, column: 5)
!53 = !DILocation(line: 90, column: 13, scope: !52)
!54 = !DILocalVariable(name: "service", scope: !52, file: !32, line: 91, type: !55)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !56, line: 375, size: 128, elements: !57)
!56 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!57 = !{!58, !59, !60, !63, !70}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !55, file: !56, line: 376, baseType: !16, size: 8)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !55, file: !56, line: 377, baseType: !19, size: 8, offset: 8)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !55, file: !56, line: 378, baseType: !61, size: 16, offset: 16)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !62, line: 31, baseType: !8)
!62 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!63 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !55, file: !56, line: 379, baseType: !64, size: 32, offset: 32)
!64 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !56, line: 301, size: 32, elements: !65)
!65 = !{!66}
!66 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !64, file: !56, line: 302, baseType: !67, size: 32)
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !68, line: 31, baseType: !69)
!68 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 47, baseType: !7)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !55, file: !56, line: 380, baseType: !71, size: 64, offset: 64)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 64, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 8)
!74 = !DILocation(line: 91, column: 28, scope: !52)
!75 = !DILocalVariable(name: "listenSocket", scope: !52, file: !32, line: 92, type: !27)
!76 = !DILocation(line: 92, column: 16, scope: !52)
!77 = !DILocalVariable(name: "acceptSocket", scope: !52, file: !32, line: 93, type: !27)
!78 = !DILocation(line: 93, column: 16, scope: !52)
!79 = !DILocalVariable(name: "inputBuffer", scope: !52, file: !32, line: 94, type: !22)
!80 = !DILocation(line: 94, column: 14, scope: !52)
!81 = !DILocation(line: 95, column: 9, scope: !52)
!82 = !DILocation(line: 105, column: 28, scope: !83)
!83 = distinct !DILexicalBlock(scope: !52, file: !32, line: 96, column: 9)
!84 = !DILocation(line: 105, column: 26, scope: !83)
!85 = !DILocation(line: 106, column: 17, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !32, line: 106, column: 17)
!87 = !DILocation(line: 106, column: 30, scope: !86)
!88 = !DILocation(line: 106, column: 17, scope: !83)
!89 = !DILocation(line: 108, column: 17, scope: !90)
!90 = distinct !DILexicalBlock(scope: !86, file: !32, line: 107, column: 13)
!91 = !DILocation(line: 110, column: 13, scope: !83)
!92 = !DILocation(line: 111, column: 21, scope: !83)
!93 = !DILocation(line: 111, column: 32, scope: !83)
!94 = !DILocation(line: 112, column: 21, scope: !83)
!95 = !DILocation(line: 112, column: 30, scope: !83)
!96 = !DILocation(line: 112, column: 37, scope: !83)
!97 = !DILocation(line: 113, column: 21, scope: !83)
!98 = !DILocation(line: 113, column: 30, scope: !83)
!99 = !DILocation(line: 114, column: 22, scope: !100)
!100 = distinct !DILexicalBlock(scope: !83, file: !32, line: 114, column: 17)
!101 = !DILocation(line: 114, column: 36, scope: !100)
!102 = !DILocation(line: 114, column: 17, scope: !100)
!103 = !DILocation(line: 114, column: 81, scope: !100)
!104 = !DILocation(line: 114, column: 17, scope: !83)
!105 = !DILocation(line: 116, column: 17, scope: !106)
!106 = distinct !DILexicalBlock(scope: !100, file: !32, line: 115, column: 13)
!107 = !DILocation(line: 118, column: 24, scope: !108)
!108 = distinct !DILexicalBlock(scope: !83, file: !32, line: 118, column: 17)
!109 = !DILocation(line: 118, column: 17, scope: !108)
!110 = !DILocation(line: 118, column: 54, scope: !108)
!111 = !DILocation(line: 118, column: 17, scope: !83)
!112 = !DILocation(line: 120, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !108, file: !32, line: 119, column: 13)
!114 = !DILocation(line: 122, column: 35, scope: !83)
!115 = !DILocation(line: 122, column: 28, scope: !83)
!116 = !DILocation(line: 122, column: 26, scope: !83)
!117 = !DILocation(line: 123, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !83, file: !32, line: 123, column: 17)
!119 = !DILocation(line: 123, column: 30, scope: !118)
!120 = !DILocation(line: 123, column: 17, scope: !83)
!121 = !DILocation(line: 125, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !32, line: 124, column: 13)
!123 = !DILocation(line: 128, column: 31, scope: !83)
!124 = !DILocation(line: 128, column: 45, scope: !83)
!125 = !DILocation(line: 128, column: 26, scope: !83)
!126 = !DILocation(line: 128, column: 24, scope: !83)
!127 = !DILocation(line: 129, column: 17, scope: !128)
!128 = distinct !DILexicalBlock(scope: !83, file: !32, line: 129, column: 17)
!129 = !DILocation(line: 129, column: 28, scope: !128)
!130 = !DILocation(line: 129, column: 44, scope: !128)
!131 = !DILocation(line: 129, column: 47, scope: !128)
!132 = !DILocation(line: 129, column: 58, scope: !128)
!133 = !DILocation(line: 129, column: 17, scope: !83)
!134 = !DILocation(line: 131, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !128, file: !32, line: 130, column: 13)
!136 = !DILocation(line: 134, column: 25, scope: !83)
!137 = !DILocation(line: 134, column: 13, scope: !83)
!138 = !DILocation(line: 134, column: 37, scope: !83)
!139 = !DILocation(line: 136, column: 25, scope: !83)
!140 = !DILocation(line: 136, column: 20, scope: !83)
!141 = !DILocation(line: 136, column: 18, scope: !83)
!142 = !DILocation(line: 137, column: 9, scope: !83)
!143 = !DILocation(line: 139, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !52, file: !32, line: 139, column: 13)
!145 = !DILocation(line: 139, column: 26, scope: !144)
!146 = !DILocation(line: 139, column: 13, scope: !52)
!147 = !DILocation(line: 141, column: 26, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !32, line: 140, column: 9)
!149 = !DILocation(line: 141, column: 13, scope: !148)
!150 = !DILocation(line: 142, column: 9, scope: !148)
!151 = !DILocation(line: 143, column: 13, scope: !152)
!152 = distinct !DILexicalBlock(scope: !52, file: !32, line: 143, column: 13)
!153 = !DILocation(line: 143, column: 26, scope: !152)
!154 = !DILocation(line: 143, column: 13, scope: !52)
!155 = !DILocation(line: 145, column: 26, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !32, line: 144, column: 9)
!157 = !DILocation(line: 145, column: 13, scope: !156)
!158 = !DILocation(line: 146, column: 9, scope: !156)
!159 = !DILocation(line: 154, column: 15, scope: !44)
!160 = !DILocation(line: 155, column: 13, scope: !44)
!161 = !DILocation(line: 155, column: 5, scope: !44)
!162 = !DILocation(line: 156, column: 1, scope: !44)
!163 = distinct !DISubprogram(name: "badSink", scope: !32, file: !32, line: 47, type: !164, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !47)
!164 = !DISubroutineType(types: !165)
!165 = !{null, !27}
!166 = !DILocalVariable(name: "data", arg: 1, scope: !163, file: !32, line: 47, type: !27)
!167 = !DILocation(line: 47, column: 25, scope: !163)
!168 = !DILocation(line: 49, column: 8, scope: !169)
!169 = distinct !DILexicalBlock(scope: !163, file: !32, line: 49, column: 8)
!170 = !DILocation(line: 49, column: 8, scope: !163)
!171 = !DILocalVariable(name: "i", scope: !172, file: !32, line: 52, type: !27)
!172 = distinct !DILexicalBlock(scope: !173, file: !32, line: 51, column: 9)
!173 = distinct !DILexicalBlock(scope: !169, file: !32, line: 50, column: 5)
!174 = !DILocation(line: 52, column: 17, scope: !172)
!175 = !DILocalVariable(name: "buffer", scope: !172, file: !32, line: 53, type: !26)
!176 = !DILocation(line: 53, column: 19, scope: !172)
!177 = !DILocation(line: 53, column: 35, scope: !172)
!178 = !DILocation(line: 53, column: 28, scope: !172)
!179 = !DILocation(line: 54, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !172, file: !32, line: 54, column: 17)
!181 = !DILocation(line: 54, column: 24, scope: !180)
!182 = !DILocation(line: 54, column: 17, scope: !172)
!183 = !DILocation(line: 54, column: 34, scope: !184)
!184 = distinct !DILexicalBlock(scope: !180, file: !32, line: 54, column: 33)
!185 = !DILocation(line: 56, column: 20, scope: !186)
!186 = distinct !DILexicalBlock(scope: !172, file: !32, line: 56, column: 13)
!187 = !DILocation(line: 56, column: 18, scope: !186)
!188 = !DILocation(line: 56, column: 25, scope: !189)
!189 = distinct !DILexicalBlock(scope: !186, file: !32, line: 56, column: 13)
!190 = !DILocation(line: 56, column: 27, scope: !189)
!191 = !DILocation(line: 56, column: 13, scope: !186)
!192 = !DILocation(line: 58, column: 17, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !32, line: 57, column: 13)
!194 = !DILocation(line: 58, column: 24, scope: !193)
!195 = !DILocation(line: 58, column: 27, scope: !193)
!196 = !DILocation(line: 59, column: 13, scope: !193)
!197 = !DILocation(line: 56, column: 34, scope: !189)
!198 = !DILocation(line: 56, column: 13, scope: !189)
!199 = distinct !{!199, !191, !200, !201}
!200 = !DILocation(line: 59, column: 13, scope: !186)
!201 = !{!"llvm.loop.mustprogress"}
!202 = !DILocation(line: 62, column: 17, scope: !203)
!203 = distinct !DILexicalBlock(scope: !172, file: !32, line: 62, column: 17)
!204 = !DILocation(line: 62, column: 22, scope: !203)
!205 = !DILocation(line: 62, column: 17, scope: !172)
!206 = !DILocation(line: 64, column: 17, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !32, line: 63, column: 13)
!208 = !DILocation(line: 64, column: 24, scope: !207)
!209 = !DILocation(line: 64, column: 30, scope: !207)
!210 = !DILocation(line: 66, column: 23, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !32, line: 66, column: 17)
!212 = !DILocation(line: 66, column: 21, scope: !211)
!213 = !DILocation(line: 66, column: 28, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !32, line: 66, column: 17)
!215 = !DILocation(line: 66, column: 30, scope: !214)
!216 = !DILocation(line: 66, column: 17, scope: !211)
!217 = !DILocation(line: 68, column: 34, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !32, line: 67, column: 17)
!219 = !DILocation(line: 68, column: 41, scope: !218)
!220 = !DILocation(line: 68, column: 21, scope: !218)
!221 = !DILocation(line: 69, column: 17, scope: !218)
!222 = !DILocation(line: 66, column: 37, scope: !214)
!223 = !DILocation(line: 66, column: 17, scope: !214)
!224 = distinct !{!224, !216, !225, !201}
!225 = !DILocation(line: 69, column: 17, scope: !211)
!226 = !DILocation(line: 70, column: 13, scope: !207)
!227 = !DILocation(line: 73, column: 17, scope: !228)
!228 = distinct !DILexicalBlock(scope: !203, file: !32, line: 72, column: 13)
!229 = !DILocation(line: 75, column: 18, scope: !172)
!230 = !DILocation(line: 75, column: 13, scope: !172)
!231 = !DILocation(line: 77, column: 5, scope: !173)
!232 = !DILocation(line: 78, column: 1, scope: !163)
!233 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_21_good", scope: !32, file: !32, line: 440, type: !45, scopeLine: 441, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !47)
!234 = !DILocation(line: 442, column: 5, scope: !233)
!235 = !DILocation(line: 443, column: 5, scope: !233)
!236 = !DILocation(line: 444, column: 5, scope: !233)
!237 = !DILocation(line: 445, column: 1, scope: !233)
!238 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 456, type: !239, scopeLine: 457, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !47)
!239 = !DISubroutineType(types: !240)
!240 = !{!27, !27, !241}
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!243 = !DILocalVariable(name: "argc", arg: 1, scope: !238, file: !32, line: 456, type: !27)
!244 = !DILocation(line: 456, column: 14, scope: !238)
!245 = !DILocalVariable(name: "argv", arg: 2, scope: !238, file: !32, line: 456, type: !241)
!246 = !DILocation(line: 456, column: 27, scope: !238)
!247 = !DILocation(line: 459, column: 22, scope: !238)
!248 = !DILocation(line: 459, column: 12, scope: !238)
!249 = !DILocation(line: 459, column: 5, scope: !238)
!250 = !DILocation(line: 461, column: 5, scope: !238)
!251 = !DILocation(line: 462, column: 5, scope: !238)
!252 = !DILocation(line: 463, column: 5, scope: !238)
!253 = !DILocation(line: 466, column: 5, scope: !238)
!254 = !DILocation(line: 467, column: 5, scope: !238)
!255 = !DILocation(line: 468, column: 5, scope: !238)
!256 = !DILocation(line: 470, column: 5, scope: !238)
!257 = distinct !DISubprogram(name: "goodB2G1", scope: !32, file: !32, line: 205, type: !45, scopeLine: 206, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !47)
!258 = !DILocalVariable(name: "data", scope: !257, file: !32, line: 207, type: !27)
!259 = !DILocation(line: 207, column: 9, scope: !257)
!260 = !DILocation(line: 209, column: 10, scope: !257)
!261 = !DILocalVariable(name: "recvResult", scope: !262, file: !32, line: 215, type: !27)
!262 = distinct !DILexicalBlock(scope: !257, file: !32, line: 210, column: 5)
!263 = !DILocation(line: 215, column: 13, scope: !262)
!264 = !DILocalVariable(name: "service", scope: !262, file: !32, line: 216, type: !55)
!265 = !DILocation(line: 216, column: 28, scope: !262)
!266 = !DILocalVariable(name: "listenSocket", scope: !262, file: !32, line: 217, type: !27)
!267 = !DILocation(line: 217, column: 16, scope: !262)
!268 = !DILocalVariable(name: "acceptSocket", scope: !262, file: !32, line: 218, type: !27)
!269 = !DILocation(line: 218, column: 16, scope: !262)
!270 = !DILocalVariable(name: "inputBuffer", scope: !262, file: !32, line: 219, type: !22)
!271 = !DILocation(line: 219, column: 14, scope: !262)
!272 = !DILocation(line: 220, column: 9, scope: !262)
!273 = !DILocation(line: 230, column: 28, scope: !274)
!274 = distinct !DILexicalBlock(scope: !262, file: !32, line: 221, column: 9)
!275 = !DILocation(line: 230, column: 26, scope: !274)
!276 = !DILocation(line: 231, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !274, file: !32, line: 231, column: 17)
!278 = !DILocation(line: 231, column: 30, scope: !277)
!279 = !DILocation(line: 231, column: 17, scope: !274)
!280 = !DILocation(line: 233, column: 17, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !32, line: 232, column: 13)
!282 = !DILocation(line: 235, column: 13, scope: !274)
!283 = !DILocation(line: 236, column: 21, scope: !274)
!284 = !DILocation(line: 236, column: 32, scope: !274)
!285 = !DILocation(line: 237, column: 21, scope: !274)
!286 = !DILocation(line: 237, column: 30, scope: !274)
!287 = !DILocation(line: 237, column: 37, scope: !274)
!288 = !DILocation(line: 238, column: 21, scope: !274)
!289 = !DILocation(line: 238, column: 30, scope: !274)
!290 = !DILocation(line: 239, column: 22, scope: !291)
!291 = distinct !DILexicalBlock(scope: !274, file: !32, line: 239, column: 17)
!292 = !DILocation(line: 239, column: 36, scope: !291)
!293 = !DILocation(line: 239, column: 17, scope: !291)
!294 = !DILocation(line: 239, column: 81, scope: !291)
!295 = !DILocation(line: 239, column: 17, scope: !274)
!296 = !DILocation(line: 241, column: 17, scope: !297)
!297 = distinct !DILexicalBlock(scope: !291, file: !32, line: 240, column: 13)
!298 = !DILocation(line: 243, column: 24, scope: !299)
!299 = distinct !DILexicalBlock(scope: !274, file: !32, line: 243, column: 17)
!300 = !DILocation(line: 243, column: 17, scope: !299)
!301 = !DILocation(line: 243, column: 54, scope: !299)
!302 = !DILocation(line: 243, column: 17, scope: !274)
!303 = !DILocation(line: 245, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !299, file: !32, line: 244, column: 13)
!305 = !DILocation(line: 247, column: 35, scope: !274)
!306 = !DILocation(line: 247, column: 28, scope: !274)
!307 = !DILocation(line: 247, column: 26, scope: !274)
!308 = !DILocation(line: 248, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !274, file: !32, line: 248, column: 17)
!310 = !DILocation(line: 248, column: 30, scope: !309)
!311 = !DILocation(line: 248, column: 17, scope: !274)
!312 = !DILocation(line: 250, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !32, line: 249, column: 13)
!314 = !DILocation(line: 253, column: 31, scope: !274)
!315 = !DILocation(line: 253, column: 45, scope: !274)
!316 = !DILocation(line: 253, column: 26, scope: !274)
!317 = !DILocation(line: 253, column: 24, scope: !274)
!318 = !DILocation(line: 254, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !274, file: !32, line: 254, column: 17)
!320 = !DILocation(line: 254, column: 28, scope: !319)
!321 = !DILocation(line: 254, column: 44, scope: !319)
!322 = !DILocation(line: 254, column: 47, scope: !319)
!323 = !DILocation(line: 254, column: 58, scope: !319)
!324 = !DILocation(line: 254, column: 17, scope: !274)
!325 = !DILocation(line: 256, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !319, file: !32, line: 255, column: 13)
!327 = !DILocation(line: 259, column: 25, scope: !274)
!328 = !DILocation(line: 259, column: 13, scope: !274)
!329 = !DILocation(line: 259, column: 37, scope: !274)
!330 = !DILocation(line: 261, column: 25, scope: !274)
!331 = !DILocation(line: 261, column: 20, scope: !274)
!332 = !DILocation(line: 261, column: 18, scope: !274)
!333 = !DILocation(line: 262, column: 9, scope: !274)
!334 = !DILocation(line: 264, column: 13, scope: !335)
!335 = distinct !DILexicalBlock(scope: !262, file: !32, line: 264, column: 13)
!336 = !DILocation(line: 264, column: 26, scope: !335)
!337 = !DILocation(line: 264, column: 13, scope: !262)
!338 = !DILocation(line: 266, column: 26, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !32, line: 265, column: 9)
!340 = !DILocation(line: 266, column: 13, scope: !339)
!341 = !DILocation(line: 267, column: 9, scope: !339)
!342 = !DILocation(line: 268, column: 13, scope: !343)
!343 = distinct !DILexicalBlock(scope: !262, file: !32, line: 268, column: 13)
!344 = !DILocation(line: 268, column: 26, scope: !343)
!345 = !DILocation(line: 268, column: 13, scope: !262)
!346 = !DILocation(line: 270, column: 26, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !32, line: 269, column: 9)
!348 = !DILocation(line: 270, column: 13, scope: !347)
!349 = !DILocation(line: 271, column: 9, scope: !347)
!350 = !DILocation(line: 279, column: 20, scope: !257)
!351 = !DILocation(line: 280, column: 18, scope: !257)
!352 = !DILocation(line: 280, column: 5, scope: !257)
!353 = !DILocation(line: 281, column: 1, scope: !257)
!354 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !32, file: !32, line: 168, type: !164, scopeLine: 169, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !47)
!355 = !DILocalVariable(name: "data", arg: 1, scope: !354, file: !32, line: 168, type: !27)
!356 = !DILocation(line: 168, column: 30, scope: !354)
!357 = !DILocation(line: 170, column: 8, scope: !358)
!358 = distinct !DILexicalBlock(scope: !354, file: !32, line: 170, column: 8)
!359 = !DILocation(line: 170, column: 8, scope: !354)
!360 = !DILocation(line: 173, column: 9, scope: !361)
!361 = distinct !DILexicalBlock(scope: !358, file: !32, line: 171, column: 5)
!362 = !DILocation(line: 174, column: 5, scope: !361)
!363 = !DILocalVariable(name: "i", scope: !364, file: !32, line: 178, type: !27)
!364 = distinct !DILexicalBlock(scope: !365, file: !32, line: 177, column: 9)
!365 = distinct !DILexicalBlock(scope: !358, file: !32, line: 176, column: 5)
!366 = !DILocation(line: 178, column: 17, scope: !364)
!367 = !DILocalVariable(name: "buffer", scope: !364, file: !32, line: 179, type: !26)
!368 = !DILocation(line: 179, column: 19, scope: !364)
!369 = !DILocation(line: 179, column: 35, scope: !364)
!370 = !DILocation(line: 179, column: 28, scope: !364)
!371 = !DILocation(line: 180, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !364, file: !32, line: 180, column: 17)
!373 = !DILocation(line: 180, column: 24, scope: !372)
!374 = !DILocation(line: 180, column: 17, scope: !364)
!375 = !DILocation(line: 180, column: 34, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !32, line: 180, column: 33)
!377 = !DILocation(line: 182, column: 20, scope: !378)
!378 = distinct !DILexicalBlock(scope: !364, file: !32, line: 182, column: 13)
!379 = !DILocation(line: 182, column: 18, scope: !378)
!380 = !DILocation(line: 182, column: 25, scope: !381)
!381 = distinct !DILexicalBlock(scope: !378, file: !32, line: 182, column: 13)
!382 = !DILocation(line: 182, column: 27, scope: !381)
!383 = !DILocation(line: 182, column: 13, scope: !378)
!384 = !DILocation(line: 184, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !32, line: 183, column: 13)
!386 = !DILocation(line: 184, column: 24, scope: !385)
!387 = !DILocation(line: 184, column: 27, scope: !385)
!388 = !DILocation(line: 185, column: 13, scope: !385)
!389 = !DILocation(line: 182, column: 34, scope: !381)
!390 = !DILocation(line: 182, column: 13, scope: !381)
!391 = distinct !{!391, !383, !392, !201}
!392 = !DILocation(line: 185, column: 13, scope: !378)
!393 = !DILocation(line: 187, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !364, file: !32, line: 187, column: 17)
!395 = !DILocation(line: 187, column: 22, scope: !394)
!396 = !DILocation(line: 187, column: 27, scope: !394)
!397 = !DILocation(line: 187, column: 30, scope: !394)
!398 = !DILocation(line: 187, column: 35, scope: !394)
!399 = !DILocation(line: 187, column: 17, scope: !364)
!400 = !DILocation(line: 189, column: 17, scope: !401)
!401 = distinct !DILexicalBlock(scope: !394, file: !32, line: 188, column: 13)
!402 = !DILocation(line: 189, column: 24, scope: !401)
!403 = !DILocation(line: 189, column: 30, scope: !401)
!404 = !DILocation(line: 191, column: 23, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !32, line: 191, column: 17)
!406 = !DILocation(line: 191, column: 21, scope: !405)
!407 = !DILocation(line: 191, column: 28, scope: !408)
!408 = distinct !DILexicalBlock(scope: !405, file: !32, line: 191, column: 17)
!409 = !DILocation(line: 191, column: 30, scope: !408)
!410 = !DILocation(line: 191, column: 17, scope: !405)
!411 = !DILocation(line: 193, column: 34, scope: !412)
!412 = distinct !DILexicalBlock(scope: !408, file: !32, line: 192, column: 17)
!413 = !DILocation(line: 193, column: 41, scope: !412)
!414 = !DILocation(line: 193, column: 21, scope: !412)
!415 = !DILocation(line: 194, column: 17, scope: !412)
!416 = !DILocation(line: 191, column: 37, scope: !408)
!417 = !DILocation(line: 191, column: 17, scope: !408)
!418 = distinct !{!418, !410, !419, !201}
!419 = !DILocation(line: 194, column: 17, scope: !405)
!420 = !DILocation(line: 195, column: 13, scope: !401)
!421 = !DILocation(line: 198, column: 17, scope: !422)
!422 = distinct !DILexicalBlock(scope: !394, file: !32, line: 197, column: 13)
!423 = !DILocation(line: 200, column: 18, scope: !364)
!424 = !DILocation(line: 200, column: 13, scope: !364)
!425 = !DILocation(line: 203, column: 1, scope: !354)
!426 = distinct !DISubprogram(name: "goodB2G2", scope: !32, file: !32, line: 316, type: !45, scopeLine: 317, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !47)
!427 = !DILocalVariable(name: "data", scope: !426, file: !32, line: 318, type: !27)
!428 = !DILocation(line: 318, column: 9, scope: !426)
!429 = !DILocation(line: 320, column: 10, scope: !426)
!430 = !DILocalVariable(name: "recvResult", scope: !431, file: !32, line: 326, type: !27)
!431 = distinct !DILexicalBlock(scope: !426, file: !32, line: 321, column: 5)
!432 = !DILocation(line: 326, column: 13, scope: !431)
!433 = !DILocalVariable(name: "service", scope: !431, file: !32, line: 327, type: !55)
!434 = !DILocation(line: 327, column: 28, scope: !431)
!435 = !DILocalVariable(name: "listenSocket", scope: !431, file: !32, line: 328, type: !27)
!436 = !DILocation(line: 328, column: 16, scope: !431)
!437 = !DILocalVariable(name: "acceptSocket", scope: !431, file: !32, line: 329, type: !27)
!438 = !DILocation(line: 329, column: 16, scope: !431)
!439 = !DILocalVariable(name: "inputBuffer", scope: !431, file: !32, line: 330, type: !22)
!440 = !DILocation(line: 330, column: 14, scope: !431)
!441 = !DILocation(line: 331, column: 9, scope: !431)
!442 = !DILocation(line: 341, column: 28, scope: !443)
!443 = distinct !DILexicalBlock(scope: !431, file: !32, line: 332, column: 9)
!444 = !DILocation(line: 341, column: 26, scope: !443)
!445 = !DILocation(line: 342, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !443, file: !32, line: 342, column: 17)
!447 = !DILocation(line: 342, column: 30, scope: !446)
!448 = !DILocation(line: 342, column: 17, scope: !443)
!449 = !DILocation(line: 344, column: 17, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !32, line: 343, column: 13)
!451 = !DILocation(line: 346, column: 13, scope: !443)
!452 = !DILocation(line: 347, column: 21, scope: !443)
!453 = !DILocation(line: 347, column: 32, scope: !443)
!454 = !DILocation(line: 348, column: 21, scope: !443)
!455 = !DILocation(line: 348, column: 30, scope: !443)
!456 = !DILocation(line: 348, column: 37, scope: !443)
!457 = !DILocation(line: 349, column: 21, scope: !443)
!458 = !DILocation(line: 349, column: 30, scope: !443)
!459 = !DILocation(line: 350, column: 22, scope: !460)
!460 = distinct !DILexicalBlock(scope: !443, file: !32, line: 350, column: 17)
!461 = !DILocation(line: 350, column: 36, scope: !460)
!462 = !DILocation(line: 350, column: 17, scope: !460)
!463 = !DILocation(line: 350, column: 81, scope: !460)
!464 = !DILocation(line: 350, column: 17, scope: !443)
!465 = !DILocation(line: 352, column: 17, scope: !466)
!466 = distinct !DILexicalBlock(scope: !460, file: !32, line: 351, column: 13)
!467 = !DILocation(line: 354, column: 24, scope: !468)
!468 = distinct !DILexicalBlock(scope: !443, file: !32, line: 354, column: 17)
!469 = !DILocation(line: 354, column: 17, scope: !468)
!470 = !DILocation(line: 354, column: 54, scope: !468)
!471 = !DILocation(line: 354, column: 17, scope: !443)
!472 = !DILocation(line: 356, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !468, file: !32, line: 355, column: 13)
!474 = !DILocation(line: 358, column: 35, scope: !443)
!475 = !DILocation(line: 358, column: 28, scope: !443)
!476 = !DILocation(line: 358, column: 26, scope: !443)
!477 = !DILocation(line: 359, column: 17, scope: !478)
!478 = distinct !DILexicalBlock(scope: !443, file: !32, line: 359, column: 17)
!479 = !DILocation(line: 359, column: 30, scope: !478)
!480 = !DILocation(line: 359, column: 17, scope: !443)
!481 = !DILocation(line: 361, column: 17, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !32, line: 360, column: 13)
!483 = !DILocation(line: 364, column: 31, scope: !443)
!484 = !DILocation(line: 364, column: 45, scope: !443)
!485 = !DILocation(line: 364, column: 26, scope: !443)
!486 = !DILocation(line: 364, column: 24, scope: !443)
!487 = !DILocation(line: 365, column: 17, scope: !488)
!488 = distinct !DILexicalBlock(scope: !443, file: !32, line: 365, column: 17)
!489 = !DILocation(line: 365, column: 28, scope: !488)
!490 = !DILocation(line: 365, column: 44, scope: !488)
!491 = !DILocation(line: 365, column: 47, scope: !488)
!492 = !DILocation(line: 365, column: 58, scope: !488)
!493 = !DILocation(line: 365, column: 17, scope: !443)
!494 = !DILocation(line: 367, column: 17, scope: !495)
!495 = distinct !DILexicalBlock(scope: !488, file: !32, line: 366, column: 13)
!496 = !DILocation(line: 370, column: 25, scope: !443)
!497 = !DILocation(line: 370, column: 13, scope: !443)
!498 = !DILocation(line: 370, column: 37, scope: !443)
!499 = !DILocation(line: 372, column: 25, scope: !443)
!500 = !DILocation(line: 372, column: 20, scope: !443)
!501 = !DILocation(line: 372, column: 18, scope: !443)
!502 = !DILocation(line: 373, column: 9, scope: !443)
!503 = !DILocation(line: 375, column: 13, scope: !504)
!504 = distinct !DILexicalBlock(scope: !431, file: !32, line: 375, column: 13)
!505 = !DILocation(line: 375, column: 26, scope: !504)
!506 = !DILocation(line: 375, column: 13, scope: !431)
!507 = !DILocation(line: 377, column: 26, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !32, line: 376, column: 9)
!509 = !DILocation(line: 377, column: 13, scope: !508)
!510 = !DILocation(line: 378, column: 9, scope: !508)
!511 = !DILocation(line: 379, column: 13, scope: !512)
!512 = distinct !DILexicalBlock(scope: !431, file: !32, line: 379, column: 13)
!513 = !DILocation(line: 379, column: 26, scope: !512)
!514 = !DILocation(line: 379, column: 13, scope: !431)
!515 = !DILocation(line: 381, column: 26, scope: !516)
!516 = distinct !DILexicalBlock(scope: !512, file: !32, line: 380, column: 9)
!517 = !DILocation(line: 381, column: 13, scope: !516)
!518 = !DILocation(line: 382, column: 9, scope: !516)
!519 = !DILocation(line: 390, column: 20, scope: !426)
!520 = !DILocation(line: 391, column: 18, scope: !426)
!521 = !DILocation(line: 391, column: 5, scope: !426)
!522 = !DILocation(line: 392, column: 1, scope: !426)
!523 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !32, file: !32, line: 284, type: !164, scopeLine: 285, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !47)
!524 = !DILocalVariable(name: "data", arg: 1, scope: !523, file: !32, line: 284, type: !27)
!525 = !DILocation(line: 284, column: 30, scope: !523)
!526 = !DILocation(line: 286, column: 8, scope: !527)
!527 = distinct !DILexicalBlock(scope: !523, file: !32, line: 286, column: 8)
!528 = !DILocation(line: 286, column: 8, scope: !523)
!529 = !DILocalVariable(name: "i", scope: !530, file: !32, line: 289, type: !27)
!530 = distinct !DILexicalBlock(scope: !531, file: !32, line: 288, column: 9)
!531 = distinct !DILexicalBlock(scope: !527, file: !32, line: 287, column: 5)
!532 = !DILocation(line: 289, column: 17, scope: !530)
!533 = !DILocalVariable(name: "buffer", scope: !530, file: !32, line: 290, type: !26)
!534 = !DILocation(line: 290, column: 19, scope: !530)
!535 = !DILocation(line: 290, column: 35, scope: !530)
!536 = !DILocation(line: 290, column: 28, scope: !530)
!537 = !DILocation(line: 291, column: 17, scope: !538)
!538 = distinct !DILexicalBlock(scope: !530, file: !32, line: 291, column: 17)
!539 = !DILocation(line: 291, column: 24, scope: !538)
!540 = !DILocation(line: 291, column: 17, scope: !530)
!541 = !DILocation(line: 291, column: 34, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !32, line: 291, column: 33)
!543 = !DILocation(line: 293, column: 20, scope: !544)
!544 = distinct !DILexicalBlock(scope: !530, file: !32, line: 293, column: 13)
!545 = !DILocation(line: 293, column: 18, scope: !544)
!546 = !DILocation(line: 293, column: 25, scope: !547)
!547 = distinct !DILexicalBlock(scope: !544, file: !32, line: 293, column: 13)
!548 = !DILocation(line: 293, column: 27, scope: !547)
!549 = !DILocation(line: 293, column: 13, scope: !544)
!550 = !DILocation(line: 295, column: 17, scope: !551)
!551 = distinct !DILexicalBlock(scope: !547, file: !32, line: 294, column: 13)
!552 = !DILocation(line: 295, column: 24, scope: !551)
!553 = !DILocation(line: 295, column: 27, scope: !551)
!554 = !DILocation(line: 296, column: 13, scope: !551)
!555 = !DILocation(line: 293, column: 34, scope: !547)
!556 = !DILocation(line: 293, column: 13, scope: !547)
!557 = distinct !{!557, !549, !558, !201}
!558 = !DILocation(line: 296, column: 13, scope: !544)
!559 = !DILocation(line: 298, column: 17, scope: !560)
!560 = distinct !DILexicalBlock(scope: !530, file: !32, line: 298, column: 17)
!561 = !DILocation(line: 298, column: 22, scope: !560)
!562 = !DILocation(line: 298, column: 27, scope: !560)
!563 = !DILocation(line: 298, column: 30, scope: !560)
!564 = !DILocation(line: 298, column: 35, scope: !560)
!565 = !DILocation(line: 298, column: 17, scope: !530)
!566 = !DILocation(line: 300, column: 17, scope: !567)
!567 = distinct !DILexicalBlock(scope: !560, file: !32, line: 299, column: 13)
!568 = !DILocation(line: 300, column: 24, scope: !567)
!569 = !DILocation(line: 300, column: 30, scope: !567)
!570 = !DILocation(line: 302, column: 23, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !32, line: 302, column: 17)
!572 = !DILocation(line: 302, column: 21, scope: !571)
!573 = !DILocation(line: 302, column: 28, scope: !574)
!574 = distinct !DILexicalBlock(scope: !571, file: !32, line: 302, column: 17)
!575 = !DILocation(line: 302, column: 30, scope: !574)
!576 = !DILocation(line: 302, column: 17, scope: !571)
!577 = !DILocation(line: 304, column: 34, scope: !578)
!578 = distinct !DILexicalBlock(scope: !574, file: !32, line: 303, column: 17)
!579 = !DILocation(line: 304, column: 41, scope: !578)
!580 = !DILocation(line: 304, column: 21, scope: !578)
!581 = !DILocation(line: 305, column: 17, scope: !578)
!582 = !DILocation(line: 302, column: 37, scope: !574)
!583 = !DILocation(line: 302, column: 17, scope: !574)
!584 = distinct !{!584, !576, !585, !201}
!585 = !DILocation(line: 305, column: 17, scope: !571)
!586 = !DILocation(line: 306, column: 13, scope: !567)
!587 = !DILocation(line: 309, column: 17, scope: !588)
!588 = distinct !DILexicalBlock(scope: !560, file: !32, line: 308, column: 13)
!589 = !DILocation(line: 311, column: 18, scope: !530)
!590 = !DILocation(line: 311, column: 13, scope: !530)
!591 = !DILocation(line: 313, column: 5, scope: !531)
!592 = !DILocation(line: 314, column: 1, scope: !523)
!593 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 428, type: !45, scopeLine: 429, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !47)
!594 = !DILocalVariable(name: "data", scope: !593, file: !32, line: 430, type: !27)
!595 = !DILocation(line: 430, column: 9, scope: !593)
!596 = !DILocation(line: 432, column: 10, scope: !593)
!597 = !DILocation(line: 435, column: 10, scope: !593)
!598 = !DILocation(line: 436, column: 19, scope: !593)
!599 = !DILocation(line: 437, column: 17, scope: !593)
!600 = !DILocation(line: 437, column: 5, scope: !593)
!601 = !DILocation(line: 438, column: 1, scope: !593)
!602 = distinct !DISubprogram(name: "goodG2BSink", scope: !32, file: !32, line: 395, type: !164, scopeLine: 396, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !47)
!603 = !DILocalVariable(name: "data", arg: 1, scope: !602, file: !32, line: 395, type: !27)
!604 = !DILocation(line: 395, column: 29, scope: !602)
!605 = !DILocation(line: 397, column: 8, scope: !606)
!606 = distinct !DILexicalBlock(scope: !602, file: !32, line: 397, column: 8)
!607 = !DILocation(line: 397, column: 8, scope: !602)
!608 = !DILocalVariable(name: "i", scope: !609, file: !32, line: 400, type: !27)
!609 = distinct !DILexicalBlock(scope: !610, file: !32, line: 399, column: 9)
!610 = distinct !DILexicalBlock(scope: !606, file: !32, line: 398, column: 5)
!611 = !DILocation(line: 400, column: 17, scope: !609)
!612 = !DILocalVariable(name: "buffer", scope: !609, file: !32, line: 401, type: !26)
!613 = !DILocation(line: 401, column: 19, scope: !609)
!614 = !DILocation(line: 401, column: 35, scope: !609)
!615 = !DILocation(line: 401, column: 28, scope: !609)
!616 = !DILocation(line: 402, column: 17, scope: !617)
!617 = distinct !DILexicalBlock(scope: !609, file: !32, line: 402, column: 17)
!618 = !DILocation(line: 402, column: 24, scope: !617)
!619 = !DILocation(line: 402, column: 17, scope: !609)
!620 = !DILocation(line: 402, column: 34, scope: !621)
!621 = distinct !DILexicalBlock(scope: !617, file: !32, line: 402, column: 33)
!622 = !DILocation(line: 404, column: 20, scope: !623)
!623 = distinct !DILexicalBlock(scope: !609, file: !32, line: 404, column: 13)
!624 = !DILocation(line: 404, column: 18, scope: !623)
!625 = !DILocation(line: 404, column: 25, scope: !626)
!626 = distinct !DILexicalBlock(scope: !623, file: !32, line: 404, column: 13)
!627 = !DILocation(line: 404, column: 27, scope: !626)
!628 = !DILocation(line: 404, column: 13, scope: !623)
!629 = !DILocation(line: 406, column: 17, scope: !630)
!630 = distinct !DILexicalBlock(scope: !626, file: !32, line: 405, column: 13)
!631 = !DILocation(line: 406, column: 24, scope: !630)
!632 = !DILocation(line: 406, column: 27, scope: !630)
!633 = !DILocation(line: 407, column: 13, scope: !630)
!634 = !DILocation(line: 404, column: 34, scope: !626)
!635 = !DILocation(line: 404, column: 13, scope: !626)
!636 = distinct !{!636, !628, !637, !201}
!637 = !DILocation(line: 407, column: 13, scope: !623)
!638 = !DILocation(line: 410, column: 17, scope: !639)
!639 = distinct !DILexicalBlock(scope: !609, file: !32, line: 410, column: 17)
!640 = !DILocation(line: 410, column: 22, scope: !639)
!641 = !DILocation(line: 410, column: 17, scope: !609)
!642 = !DILocation(line: 412, column: 17, scope: !643)
!643 = distinct !DILexicalBlock(scope: !639, file: !32, line: 411, column: 13)
!644 = !DILocation(line: 412, column: 24, scope: !643)
!645 = !DILocation(line: 412, column: 30, scope: !643)
!646 = !DILocation(line: 414, column: 23, scope: !647)
!647 = distinct !DILexicalBlock(scope: !643, file: !32, line: 414, column: 17)
!648 = !DILocation(line: 414, column: 21, scope: !647)
!649 = !DILocation(line: 414, column: 28, scope: !650)
!650 = distinct !DILexicalBlock(scope: !647, file: !32, line: 414, column: 17)
!651 = !DILocation(line: 414, column: 30, scope: !650)
!652 = !DILocation(line: 414, column: 17, scope: !647)
!653 = !DILocation(line: 416, column: 34, scope: !654)
!654 = distinct !DILexicalBlock(scope: !650, file: !32, line: 415, column: 17)
!655 = !DILocation(line: 416, column: 41, scope: !654)
!656 = !DILocation(line: 416, column: 21, scope: !654)
!657 = !DILocation(line: 417, column: 17, scope: !654)
!658 = !DILocation(line: 414, column: 37, scope: !650)
!659 = !DILocation(line: 414, column: 17, scope: !650)
!660 = distinct !{!660, !652, !661, !201}
!661 = !DILocation(line: 417, column: 17, scope: !647)
!662 = !DILocation(line: 418, column: 13, scope: !643)
!663 = !DILocation(line: 421, column: 17, scope: !664)
!664 = distinct !DILexicalBlock(scope: !639, file: !32, line: 420, column: 13)
!665 = !DILocation(line: 423, column: 18, scope: !609)
!666 = !DILocation(line: 423, column: 13, scope: !609)
!667 = !DILocation(line: 425, column: 5, scope: !610)
!668 = !DILocation(line: 426, column: 1, scope: !602)
