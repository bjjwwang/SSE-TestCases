; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_bad() #0 !dbg !31 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data33 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !36, metadata !DIExpression()), !dbg !38
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !39, metadata !DIExpression()), !dbg !41
  store i32* %data, i32** %dataPtr1, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !42, metadata !DIExpression()), !dbg !43
  store i32* %data, i32** %dataPtr2, align 8, !dbg !43
  store i32 -1, i32* %data, align 4, !dbg !44
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !48
  %1 = load i32, i32* %0, align 4, !dbg !49
  store i32 %1, i32* %data1, align 4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !50, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !53, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 -1, i32* %listenSocket, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %acceptSocket, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  br label %do.body, !dbg !80

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !81
  store i32 %call, i32* %listenSocket, align 4, !dbg !83
  %2 = load i32, i32* %listenSocket, align 4, !dbg !84
  %cmp = icmp eq i32 %2, -1, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !88

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !90
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !91
  store i8 2, i8* %sin_family, align 1, !dbg !92
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !93
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !94
  store i32 0, i32* %s_addr, align 4, !dbg !95
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !96
  store i16 -30871, i16* %sin_port, align 2, !dbg !97
  %4 = load i32, i32* %listenSocket, align 4, !dbg !98
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !100
  %call2 = call i32 @"\01_bind"(i32 noundef %4, %struct.sockaddr* noundef %5, i32 noundef 16), !dbg !101
  %cmp3 = icmp eq i32 %call2, -1, !dbg !102
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !103

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !104

if.end5:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !106
  %call6 = call i32 @"\01_listen"(i32 noundef %6, i32 noundef 5), !dbg !108
  %cmp7 = icmp eq i32 %call6, -1, !dbg !109
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !110

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !111

if.end9:                                          ; preds = %if.end5
  %7 = load i32, i32* %listenSocket, align 4, !dbg !113
  %call10 = call i32 @"\01_accept"(i32 noundef %7, %struct.sockaddr* noundef null, i32* noundef null), !dbg !114
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !115
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !116
  %cmp11 = icmp eq i32 %8, -1, !dbg !118
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !119

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !120

if.end13:                                         ; preds = %if.end9
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !122
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !123
  %call14 = call i64 @"\01_recv"(i32 noundef %9, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !124
  %conv = trunc i64 %call14 to i32, !dbg !124
  store i32 %conv, i32* %recvResult, align 4, !dbg !125
  %10 = load i32, i32* %recvResult, align 4, !dbg !126
  %cmp15 = icmp eq i32 %10, -1, !dbg !128
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !129

lor.lhs.false:                                    ; preds = %if.end13
  %11 = load i32, i32* %recvResult, align 4, !dbg !130
  %cmp17 = icmp eq i32 %11, 0, !dbg !131
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !132

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !133

if.end20:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !135
  %idxprom = sext i32 %12 to i64, !dbg !136
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !136
  store i8 0, i8* %arrayidx, align 1, !dbg !137
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !138
  %call22 = call i32 @atoi(i8* noundef %arraydecay21), !dbg !139
  store i32 %call22, i32* %data1, align 4, !dbg !140
  br label %do.end, !dbg !141

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !142
  %cmp23 = icmp ne i32 %13, -1, !dbg !144
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !145

if.then25:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !146
  %call26 = call i32 @"\01_close"(i32 noundef %14), !dbg !148
  br label %if.end27, !dbg !149

if.end27:                                         ; preds = %if.then25, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !150
  %cmp28 = icmp ne i32 %15, -1, !dbg !152
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !153

if.then30:                                        ; preds = %if.end27
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %call31 = call i32 @"\01_close"(i32 noundef %16), !dbg !156
  br label %if.end32, !dbg !157

if.end32:                                         ; preds = %if.then30, %if.end27
  %17 = load i32, i32* %data1, align 4, !dbg !158
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !159
  store i32 %17, i32* %18, align 4, !dbg !160
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !161, metadata !DIExpression()), !dbg !163
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !164
  %20 = load i32, i32* %19, align 4, !dbg !165
  store i32 %20, i32* %data33, align 4, !dbg !163
  call void @llvm.dbg.declare(metadata i32* %i, metadata !166, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !169, metadata !DIExpression()), !dbg !173
  %21 = bitcast [10 x i32]* %buffer to i8*, !dbg !173
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !173
  %22 = load i32, i32* %data33, align 4, !dbg !174
  %cmp34 = icmp sge i32 %22, 0, !dbg !176
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !177

if.then36:                                        ; preds = %if.end32
  %23 = load i32, i32* %data33, align 4, !dbg !178
  %idxprom37 = sext i32 %23 to i64, !dbg !180
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !180
  store i32 1, i32* %arrayidx38, align 4, !dbg !181
  store i32 0, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !184

for.cond:                                         ; preds = %for.inc, %if.then36
  %24 = load i32, i32* %i, align 4, !dbg !185
  %cmp39 = icmp slt i32 %24, 10, !dbg !187
  br i1 %cmp39, label %for.body, label %for.end, !dbg !188

for.body:                                         ; preds = %for.cond
  %25 = load i32, i32* %i, align 4, !dbg !189
  %idxprom41 = sext i32 %25 to i64, !dbg !191
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !191
  %26 = load i32, i32* %arrayidx42, align 4, !dbg !191
  call void @printIntLine(i32 noundef %26), !dbg !192
  br label %for.inc, !dbg !193

for.inc:                                          ; preds = %for.body
  %27 = load i32, i32* %i, align 4, !dbg !194
  %inc = add nsw i32 %27, 1, !dbg !194
  store i32 %inc, i32* %i, align 4, !dbg !194
  br label %for.cond, !dbg !195, !llvm.loop !196

for.end:                                          ; preds = %for.cond
  br label %if.end43, !dbg !199

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !200
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end
  ret void, !dbg !202
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_good() #0 !dbg !203 {
entry:
  call void @goodG2B(), !dbg !204
  call void @goodB2G(), !dbg !205
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !207 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !212, metadata !DIExpression()), !dbg !213
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !214, metadata !DIExpression()), !dbg !215
  %call = call i64 @time(i64* noundef null), !dbg !216
  %conv = trunc i64 %call to i32, !dbg !217
  call void @srand(i32 noundef %conv), !dbg !218
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !219
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_good(), !dbg !220
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !221
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !222
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_bad(), !dbg !223
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !224
  ret i32 0, !dbg !225
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !226 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !229, metadata !DIExpression()), !dbg !230
  store i32* %data, i32** %dataPtr1, align 8, !dbg !230
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !231, metadata !DIExpression()), !dbg !232
  store i32* %data, i32** %dataPtr2, align 8, !dbg !232
  store i32 -1, i32* %data, align 4, !dbg !233
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !234, metadata !DIExpression()), !dbg !236
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !237
  %1 = load i32, i32* %0, align 4, !dbg !238
  store i32 %1, i32* %data1, align 4, !dbg !236
  store i32 7, i32* %data1, align 4, !dbg !239
  %2 = load i32, i32* %data1, align 4, !dbg !240
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !241
  store i32 %2, i32* %3, align 4, !dbg !242
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !243, metadata !DIExpression()), !dbg !245
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !246
  %5 = load i32, i32* %4, align 4, !dbg !247
  store i32 %5, i32* %data2, align 4, !dbg !245
  call void @llvm.dbg.declare(metadata i32* %i, metadata !248, metadata !DIExpression()), !dbg !250
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !251, metadata !DIExpression()), !dbg !252
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !252
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !252
  %7 = load i32, i32* %data2, align 4, !dbg !253
  %cmp = icmp sge i32 %7, 0, !dbg !255
  br i1 %cmp, label %if.then, label %if.else, !dbg !256

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !257
  %idxprom = sext i32 %8 to i64, !dbg !259
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !259
  store i32 1, i32* %arrayidx, align 4, !dbg !260
  store i32 0, i32* %i, align 4, !dbg !261
  br label %for.cond, !dbg !263

for.cond:                                         ; preds = %for.inc, %if.then
  %9 = load i32, i32* %i, align 4, !dbg !264
  %cmp3 = icmp slt i32 %9, 10, !dbg !266
  br i1 %cmp3, label %for.body, label %for.end, !dbg !267

for.body:                                         ; preds = %for.cond
  %10 = load i32, i32* %i, align 4, !dbg !268
  %idxprom4 = sext i32 %10 to i64, !dbg !270
  %arrayidx5 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !270
  %11 = load i32, i32* %arrayidx5, align 4, !dbg !270
  call void @printIntLine(i32 noundef %11), !dbg !271
  br label %for.inc, !dbg !272

for.inc:                                          ; preds = %for.body
  %12 = load i32, i32* %i, align 4, !dbg !273
  %inc = add nsw i32 %12, 1, !dbg !273
  store i32 %inc, i32* %i, align 4, !dbg !273
  br label %for.cond, !dbg !274, !llvm.loop !275

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !277

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !278
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !280
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !281 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data33 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !282, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !284, metadata !DIExpression()), !dbg !285
  store i32* %data, i32** %dataPtr1, align 8, !dbg !285
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !286, metadata !DIExpression()), !dbg !287
  store i32* %data, i32** %dataPtr2, align 8, !dbg !287
  store i32 -1, i32* %data, align 4, !dbg !288
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !289, metadata !DIExpression()), !dbg !291
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !292
  %1 = load i32, i32* %0, align 4, !dbg !293
  store i32 %1, i32* %data1, align 4, !dbg !291
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !294, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !297, metadata !DIExpression()), !dbg !298
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !299, metadata !DIExpression()), !dbg !300
  store i32 -1, i32* %listenSocket, align 4, !dbg !300
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !301, metadata !DIExpression()), !dbg !302
  store i32 -1, i32* %acceptSocket, align 4, !dbg !302
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !303, metadata !DIExpression()), !dbg !304
  br label %do.body, !dbg !305

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !306
  store i32 %call, i32* %listenSocket, align 4, !dbg !308
  %2 = load i32, i32* %listenSocket, align 4, !dbg !309
  %cmp = icmp eq i32 %2, -1, !dbg !311
  br i1 %cmp, label %if.then, label %if.end, !dbg !312

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !313

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !315
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !315
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !316
  store i8 2, i8* %sin_family, align 1, !dbg !317
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !318
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !319
  store i32 0, i32* %s_addr, align 4, !dbg !320
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !321
  store i16 -30871, i16* %sin_port, align 2, !dbg !322
  %4 = load i32, i32* %listenSocket, align 4, !dbg !323
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !325
  %call2 = call i32 @"\01_bind"(i32 noundef %4, %struct.sockaddr* noundef %5, i32 noundef 16), !dbg !326
  %cmp3 = icmp eq i32 %call2, -1, !dbg !327
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !328

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !329

if.end5:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !331
  %call6 = call i32 @"\01_listen"(i32 noundef %6, i32 noundef 5), !dbg !333
  %cmp7 = icmp eq i32 %call6, -1, !dbg !334
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !335

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !336

if.end9:                                          ; preds = %if.end5
  %7 = load i32, i32* %listenSocket, align 4, !dbg !338
  %call10 = call i32 @"\01_accept"(i32 noundef %7, %struct.sockaddr* noundef null, i32* noundef null), !dbg !339
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !340
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !341
  %cmp11 = icmp eq i32 %8, -1, !dbg !343
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !344

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !345

if.end13:                                         ; preds = %if.end9
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !347
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !348
  %call14 = call i64 @"\01_recv"(i32 noundef %9, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !349
  %conv = trunc i64 %call14 to i32, !dbg !349
  store i32 %conv, i32* %recvResult, align 4, !dbg !350
  %10 = load i32, i32* %recvResult, align 4, !dbg !351
  %cmp15 = icmp eq i32 %10, -1, !dbg !353
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !354

lor.lhs.false:                                    ; preds = %if.end13
  %11 = load i32, i32* %recvResult, align 4, !dbg !355
  %cmp17 = icmp eq i32 %11, 0, !dbg !356
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !357

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !358

if.end20:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !360
  %idxprom = sext i32 %12 to i64, !dbg !361
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !361
  store i8 0, i8* %arrayidx, align 1, !dbg !362
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !363
  %call22 = call i32 @atoi(i8* noundef %arraydecay21), !dbg !364
  store i32 %call22, i32* %data1, align 4, !dbg !365
  br label %do.end, !dbg !366

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !367
  %cmp23 = icmp ne i32 %13, -1, !dbg !369
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !370

if.then25:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !371
  %call26 = call i32 @"\01_close"(i32 noundef %14), !dbg !373
  br label %if.end27, !dbg !374

if.end27:                                         ; preds = %if.then25, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !375
  %cmp28 = icmp ne i32 %15, -1, !dbg !377
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !378

if.then30:                                        ; preds = %if.end27
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !379
  %call31 = call i32 @"\01_close"(i32 noundef %16), !dbg !381
  br label %if.end32, !dbg !382

if.end32:                                         ; preds = %if.then30, %if.end27
  %17 = load i32, i32* %data1, align 4, !dbg !383
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !384
  store i32 %17, i32* %18, align 4, !dbg !385
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !386, metadata !DIExpression()), !dbg !388
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !389
  %20 = load i32, i32* %19, align 4, !dbg !390
  store i32 %20, i32* %data33, align 4, !dbg !388
  call void @llvm.dbg.declare(metadata i32* %i, metadata !391, metadata !DIExpression()), !dbg !393
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !394, metadata !DIExpression()), !dbg !395
  %21 = bitcast [10 x i32]* %buffer to i8*, !dbg !395
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !395
  %22 = load i32, i32* %data33, align 4, !dbg !396
  %cmp34 = icmp sge i32 %22, 0, !dbg !398
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !399

land.lhs.true:                                    ; preds = %if.end32
  %23 = load i32, i32* %data33, align 4, !dbg !400
  %cmp36 = icmp slt i32 %23, 10, !dbg !401
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !402

if.then38:                                        ; preds = %land.lhs.true
  %24 = load i32, i32* %data33, align 4, !dbg !403
  %idxprom39 = sext i32 %24 to i64, !dbg !405
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !405
  store i32 1, i32* %arrayidx40, align 4, !dbg !406
  store i32 0, i32* %i, align 4, !dbg !407
  br label %for.cond, !dbg !409

for.cond:                                         ; preds = %for.inc, %if.then38
  %25 = load i32, i32* %i, align 4, !dbg !410
  %cmp41 = icmp slt i32 %25, 10, !dbg !412
  br i1 %cmp41, label %for.body, label %for.end, !dbg !413

for.body:                                         ; preds = %for.cond
  %26 = load i32, i32* %i, align 4, !dbg !414
  %idxprom43 = sext i32 %26 to i64, !dbg !416
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !416
  %27 = load i32, i32* %arrayidx44, align 4, !dbg !416
  call void @printIntLine(i32 noundef %27), !dbg !417
  br label %for.inc, !dbg !418

for.inc:                                          ; preds = %for.body
  %28 = load i32, i32* %i, align 4, !dbg !419
  %inc = add nsw i32 %28, 1, !dbg !419
  store i32 %inc, i32* %i, align 4, !dbg !419
  br label %for.cond, !dbg !420, !llvm.loop !421

for.end:                                          ; preds = %for.cond
  br label %if.end45, !dbg !423

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !424
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end
  ret void, !dbg !426
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocalVariable(name: "dataPtr1", scope: !31, file: !32, line: 47, type: !40)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!41 = !DILocation(line: 47, column: 10, scope: !31)
!42 = !DILocalVariable(name: "dataPtr2", scope: !31, file: !32, line: 48, type: !40)
!43 = !DILocation(line: 48, column: 10, scope: !31)
!44 = !DILocation(line: 50, column: 10, scope: !31)
!45 = !DILocalVariable(name: "data", scope: !46, file: !32, line: 52, type: !37)
!46 = distinct !DILexicalBlock(scope: !31, file: !32, line: 51, column: 5)
!47 = !DILocation(line: 52, column: 13, scope: !46)
!48 = !DILocation(line: 52, column: 21, scope: !46)
!49 = !DILocation(line: 52, column: 20, scope: !46)
!50 = !DILocalVariable(name: "recvResult", scope: !51, file: !32, line: 58, type: !37)
!51 = distinct !DILexicalBlock(scope: !46, file: !32, line: 53, column: 9)
!52 = !DILocation(line: 58, column: 17, scope: !51)
!53 = !DILocalVariable(name: "service", scope: !51, file: !32, line: 59, type: !54)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !55, line: 375, size: 128, elements: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!56 = !{!57, !58, !59, !62, !69}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !54, file: !55, line: 376, baseType: !14, size: 8)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !54, file: !55, line: 377, baseType: !17, size: 8, offset: 8)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !54, file: !55, line: 378, baseType: !60, size: 16, offset: 16)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !61, line: 31, baseType: !6)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!62 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !54, file: !55, line: 379, baseType: !63, size: 32, offset: 32)
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !55, line: 301, size: 32, elements: !64)
!64 = !{!65}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !63, file: !55, line: 302, baseType: !66, size: 32)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !67, line: 31, baseType: !68)
!67 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 47, baseType: !5)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !54, file: !55, line: 380, baseType: !70, size: 64, offset: 64)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 64, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 8)
!73 = !DILocation(line: 59, column: 32, scope: !51)
!74 = !DILocalVariable(name: "listenSocket", scope: !51, file: !32, line: 60, type: !37)
!75 = !DILocation(line: 60, column: 20, scope: !51)
!76 = !DILocalVariable(name: "acceptSocket", scope: !51, file: !32, line: 61, type: !37)
!77 = !DILocation(line: 61, column: 20, scope: !51)
!78 = !DILocalVariable(name: "inputBuffer", scope: !51, file: !32, line: 62, type: !20)
!79 = !DILocation(line: 62, column: 18, scope: !51)
!80 = !DILocation(line: 63, column: 13, scope: !51)
!81 = !DILocation(line: 73, column: 32, scope: !82)
!82 = distinct !DILexicalBlock(scope: !51, file: !32, line: 64, column: 13)
!83 = !DILocation(line: 73, column: 30, scope: !82)
!84 = !DILocation(line: 74, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !32, line: 74, column: 21)
!86 = !DILocation(line: 74, column: 34, scope: !85)
!87 = !DILocation(line: 74, column: 21, scope: !82)
!88 = !DILocation(line: 76, column: 21, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !32, line: 75, column: 17)
!90 = !DILocation(line: 78, column: 17, scope: !82)
!91 = !DILocation(line: 79, column: 25, scope: !82)
!92 = !DILocation(line: 79, column: 36, scope: !82)
!93 = !DILocation(line: 80, column: 25, scope: !82)
!94 = !DILocation(line: 80, column: 34, scope: !82)
!95 = !DILocation(line: 80, column: 41, scope: !82)
!96 = !DILocation(line: 81, column: 25, scope: !82)
!97 = !DILocation(line: 81, column: 34, scope: !82)
!98 = !DILocation(line: 82, column: 26, scope: !99)
!99 = distinct !DILexicalBlock(scope: !82, file: !32, line: 82, column: 21)
!100 = !DILocation(line: 82, column: 40, scope: !99)
!101 = !DILocation(line: 82, column: 21, scope: !99)
!102 = !DILocation(line: 82, column: 85, scope: !99)
!103 = !DILocation(line: 82, column: 21, scope: !82)
!104 = !DILocation(line: 84, column: 21, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !32, line: 83, column: 17)
!106 = !DILocation(line: 86, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !82, file: !32, line: 86, column: 21)
!108 = !DILocation(line: 86, column: 21, scope: !107)
!109 = !DILocation(line: 86, column: 58, scope: !107)
!110 = !DILocation(line: 86, column: 21, scope: !82)
!111 = !DILocation(line: 88, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !32, line: 87, column: 17)
!113 = !DILocation(line: 90, column: 39, scope: !82)
!114 = !DILocation(line: 90, column: 32, scope: !82)
!115 = !DILocation(line: 90, column: 30, scope: !82)
!116 = !DILocation(line: 91, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !82, file: !32, line: 91, column: 21)
!118 = !DILocation(line: 91, column: 34, scope: !117)
!119 = !DILocation(line: 91, column: 21, scope: !82)
!120 = !DILocation(line: 93, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !32, line: 92, column: 17)
!122 = !DILocation(line: 96, column: 35, scope: !82)
!123 = !DILocation(line: 96, column: 49, scope: !82)
!124 = !DILocation(line: 96, column: 30, scope: !82)
!125 = !DILocation(line: 96, column: 28, scope: !82)
!126 = !DILocation(line: 97, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !82, file: !32, line: 97, column: 21)
!128 = !DILocation(line: 97, column: 32, scope: !127)
!129 = !DILocation(line: 97, column: 48, scope: !127)
!130 = !DILocation(line: 97, column: 51, scope: !127)
!131 = !DILocation(line: 97, column: 62, scope: !127)
!132 = !DILocation(line: 97, column: 21, scope: !82)
!133 = !DILocation(line: 99, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !32, line: 98, column: 17)
!135 = !DILocation(line: 102, column: 29, scope: !82)
!136 = !DILocation(line: 102, column: 17, scope: !82)
!137 = !DILocation(line: 102, column: 41, scope: !82)
!138 = !DILocation(line: 104, column: 29, scope: !82)
!139 = !DILocation(line: 104, column: 24, scope: !82)
!140 = !DILocation(line: 104, column: 22, scope: !82)
!141 = !DILocation(line: 105, column: 13, scope: !82)
!142 = !DILocation(line: 107, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !51, file: !32, line: 107, column: 17)
!144 = !DILocation(line: 107, column: 30, scope: !143)
!145 = !DILocation(line: 107, column: 17, scope: !51)
!146 = !DILocation(line: 109, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !32, line: 108, column: 13)
!148 = !DILocation(line: 109, column: 17, scope: !147)
!149 = !DILocation(line: 110, column: 13, scope: !147)
!150 = !DILocation(line: 111, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !51, file: !32, line: 111, column: 17)
!152 = !DILocation(line: 111, column: 30, scope: !151)
!153 = !DILocation(line: 111, column: 17, scope: !51)
!154 = !DILocation(line: 113, column: 30, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !32, line: 112, column: 13)
!156 = !DILocation(line: 113, column: 17, scope: !155)
!157 = !DILocation(line: 114, column: 13, scope: !155)
!158 = !DILocation(line: 122, column: 21, scope: !46)
!159 = !DILocation(line: 122, column: 10, scope: !46)
!160 = !DILocation(line: 122, column: 19, scope: !46)
!161 = !DILocalVariable(name: "data", scope: !162, file: !32, line: 125, type: !37)
!162 = distinct !DILexicalBlock(scope: !31, file: !32, line: 124, column: 5)
!163 = !DILocation(line: 125, column: 13, scope: !162)
!164 = !DILocation(line: 125, column: 21, scope: !162)
!165 = !DILocation(line: 125, column: 20, scope: !162)
!166 = !DILocalVariable(name: "i", scope: !167, file: !32, line: 127, type: !37)
!167 = distinct !DILexicalBlock(scope: !162, file: !32, line: 126, column: 9)
!168 = !DILocation(line: 127, column: 17, scope: !167)
!169 = !DILocalVariable(name: "buffer", scope: !167, file: !32, line: 128, type: !170)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 10)
!173 = !DILocation(line: 128, column: 17, scope: !167)
!174 = !DILocation(line: 131, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !167, file: !32, line: 131, column: 17)
!176 = !DILocation(line: 131, column: 22, scope: !175)
!177 = !DILocation(line: 131, column: 17, scope: !167)
!178 = !DILocation(line: 133, column: 24, scope: !179)
!179 = distinct !DILexicalBlock(scope: !175, file: !32, line: 132, column: 13)
!180 = !DILocation(line: 133, column: 17, scope: !179)
!181 = !DILocation(line: 133, column: 30, scope: !179)
!182 = !DILocation(line: 135, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !32, line: 135, column: 17)
!184 = !DILocation(line: 135, column: 21, scope: !183)
!185 = !DILocation(line: 135, column: 28, scope: !186)
!186 = distinct !DILexicalBlock(scope: !183, file: !32, line: 135, column: 17)
!187 = !DILocation(line: 135, column: 30, scope: !186)
!188 = !DILocation(line: 135, column: 17, scope: !183)
!189 = !DILocation(line: 137, column: 41, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !32, line: 136, column: 17)
!191 = !DILocation(line: 137, column: 34, scope: !190)
!192 = !DILocation(line: 137, column: 21, scope: !190)
!193 = !DILocation(line: 138, column: 17, scope: !190)
!194 = !DILocation(line: 135, column: 37, scope: !186)
!195 = !DILocation(line: 135, column: 17, scope: !186)
!196 = distinct !{!196, !188, !197, !198}
!197 = !DILocation(line: 138, column: 17, scope: !183)
!198 = !{!"llvm.loop.mustprogress"}
!199 = !DILocation(line: 139, column: 13, scope: !179)
!200 = !DILocation(line: 142, column: 17, scope: !201)
!201 = distinct !DILexicalBlock(scope: !175, file: !32, line: 141, column: 13)
!202 = !DILocation(line: 146, column: 1, scope: !31)
!203 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_32_good", scope: !32, file: !32, line: 295, type: !33, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!204 = !DILocation(line: 297, column: 5, scope: !203)
!205 = !DILocation(line: 298, column: 5, scope: !203)
!206 = !DILocation(line: 299, column: 1, scope: !203)
!207 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 309, type: !208, scopeLine: 310, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!208 = !DISubroutineType(types: !209)
!209 = !{!37, !37, !210}
!210 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!212 = !DILocalVariable(name: "argc", arg: 1, scope: !207, file: !32, line: 309, type: !37)
!213 = !DILocation(line: 309, column: 14, scope: !207)
!214 = !DILocalVariable(name: "argv", arg: 2, scope: !207, file: !32, line: 309, type: !210)
!215 = !DILocation(line: 309, column: 27, scope: !207)
!216 = !DILocation(line: 312, column: 22, scope: !207)
!217 = !DILocation(line: 312, column: 12, scope: !207)
!218 = !DILocation(line: 312, column: 5, scope: !207)
!219 = !DILocation(line: 314, column: 5, scope: !207)
!220 = !DILocation(line: 315, column: 5, scope: !207)
!221 = !DILocation(line: 316, column: 5, scope: !207)
!222 = !DILocation(line: 319, column: 5, scope: !207)
!223 = !DILocation(line: 320, column: 5, scope: !207)
!224 = !DILocation(line: 321, column: 5, scope: !207)
!225 = !DILocation(line: 323, column: 5, scope: !207)
!226 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 153, type: !33, scopeLine: 154, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!227 = !DILocalVariable(name: "data", scope: !226, file: !32, line: 155, type: !37)
!228 = !DILocation(line: 155, column: 9, scope: !226)
!229 = !DILocalVariable(name: "dataPtr1", scope: !226, file: !32, line: 156, type: !40)
!230 = !DILocation(line: 156, column: 10, scope: !226)
!231 = !DILocalVariable(name: "dataPtr2", scope: !226, file: !32, line: 157, type: !40)
!232 = !DILocation(line: 157, column: 10, scope: !226)
!233 = !DILocation(line: 159, column: 10, scope: !226)
!234 = !DILocalVariable(name: "data", scope: !235, file: !32, line: 161, type: !37)
!235 = distinct !DILexicalBlock(scope: !226, file: !32, line: 160, column: 5)
!236 = !DILocation(line: 161, column: 13, scope: !235)
!237 = !DILocation(line: 161, column: 21, scope: !235)
!238 = !DILocation(line: 161, column: 20, scope: !235)
!239 = !DILocation(line: 164, column: 14, scope: !235)
!240 = !DILocation(line: 165, column: 21, scope: !235)
!241 = !DILocation(line: 165, column: 10, scope: !235)
!242 = !DILocation(line: 165, column: 19, scope: !235)
!243 = !DILocalVariable(name: "data", scope: !244, file: !32, line: 168, type: !37)
!244 = distinct !DILexicalBlock(scope: !226, file: !32, line: 167, column: 5)
!245 = !DILocation(line: 168, column: 13, scope: !244)
!246 = !DILocation(line: 168, column: 21, scope: !244)
!247 = !DILocation(line: 168, column: 20, scope: !244)
!248 = !DILocalVariable(name: "i", scope: !249, file: !32, line: 170, type: !37)
!249 = distinct !DILexicalBlock(scope: !244, file: !32, line: 169, column: 9)
!250 = !DILocation(line: 170, column: 17, scope: !249)
!251 = !DILocalVariable(name: "buffer", scope: !249, file: !32, line: 171, type: !170)
!252 = !DILocation(line: 171, column: 17, scope: !249)
!253 = !DILocation(line: 174, column: 17, scope: !254)
!254 = distinct !DILexicalBlock(scope: !249, file: !32, line: 174, column: 17)
!255 = !DILocation(line: 174, column: 22, scope: !254)
!256 = !DILocation(line: 174, column: 17, scope: !249)
!257 = !DILocation(line: 176, column: 24, scope: !258)
!258 = distinct !DILexicalBlock(scope: !254, file: !32, line: 175, column: 13)
!259 = !DILocation(line: 176, column: 17, scope: !258)
!260 = !DILocation(line: 176, column: 30, scope: !258)
!261 = !DILocation(line: 178, column: 23, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !32, line: 178, column: 17)
!263 = !DILocation(line: 178, column: 21, scope: !262)
!264 = !DILocation(line: 178, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !32, line: 178, column: 17)
!266 = !DILocation(line: 178, column: 30, scope: !265)
!267 = !DILocation(line: 178, column: 17, scope: !262)
!268 = !DILocation(line: 180, column: 41, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !32, line: 179, column: 17)
!270 = !DILocation(line: 180, column: 34, scope: !269)
!271 = !DILocation(line: 180, column: 21, scope: !269)
!272 = !DILocation(line: 181, column: 17, scope: !269)
!273 = !DILocation(line: 178, column: 37, scope: !265)
!274 = !DILocation(line: 178, column: 17, scope: !265)
!275 = distinct !{!275, !267, !276, !198}
!276 = !DILocation(line: 181, column: 17, scope: !262)
!277 = !DILocation(line: 182, column: 13, scope: !258)
!278 = !DILocation(line: 185, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !254, file: !32, line: 184, column: 13)
!280 = !DILocation(line: 189, column: 1, scope: !226)
!281 = distinct !DISubprogram(name: "goodB2G", scope: !32, file: !32, line: 192, type: !33, scopeLine: 193, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!282 = !DILocalVariable(name: "data", scope: !281, file: !32, line: 194, type: !37)
!283 = !DILocation(line: 194, column: 9, scope: !281)
!284 = !DILocalVariable(name: "dataPtr1", scope: !281, file: !32, line: 195, type: !40)
!285 = !DILocation(line: 195, column: 10, scope: !281)
!286 = !DILocalVariable(name: "dataPtr2", scope: !281, file: !32, line: 196, type: !40)
!287 = !DILocation(line: 196, column: 10, scope: !281)
!288 = !DILocation(line: 198, column: 10, scope: !281)
!289 = !DILocalVariable(name: "data", scope: !290, file: !32, line: 200, type: !37)
!290 = distinct !DILexicalBlock(scope: !281, file: !32, line: 199, column: 5)
!291 = !DILocation(line: 200, column: 13, scope: !290)
!292 = !DILocation(line: 200, column: 21, scope: !290)
!293 = !DILocation(line: 200, column: 20, scope: !290)
!294 = !DILocalVariable(name: "recvResult", scope: !295, file: !32, line: 206, type: !37)
!295 = distinct !DILexicalBlock(scope: !290, file: !32, line: 201, column: 9)
!296 = !DILocation(line: 206, column: 17, scope: !295)
!297 = !DILocalVariable(name: "service", scope: !295, file: !32, line: 207, type: !54)
!298 = !DILocation(line: 207, column: 32, scope: !295)
!299 = !DILocalVariable(name: "listenSocket", scope: !295, file: !32, line: 208, type: !37)
!300 = !DILocation(line: 208, column: 20, scope: !295)
!301 = !DILocalVariable(name: "acceptSocket", scope: !295, file: !32, line: 209, type: !37)
!302 = !DILocation(line: 209, column: 20, scope: !295)
!303 = !DILocalVariable(name: "inputBuffer", scope: !295, file: !32, line: 210, type: !20)
!304 = !DILocation(line: 210, column: 18, scope: !295)
!305 = !DILocation(line: 211, column: 13, scope: !295)
!306 = !DILocation(line: 221, column: 32, scope: !307)
!307 = distinct !DILexicalBlock(scope: !295, file: !32, line: 212, column: 13)
!308 = !DILocation(line: 221, column: 30, scope: !307)
!309 = !DILocation(line: 222, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !307, file: !32, line: 222, column: 21)
!311 = !DILocation(line: 222, column: 34, scope: !310)
!312 = !DILocation(line: 222, column: 21, scope: !307)
!313 = !DILocation(line: 224, column: 21, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !32, line: 223, column: 17)
!315 = !DILocation(line: 226, column: 17, scope: !307)
!316 = !DILocation(line: 227, column: 25, scope: !307)
!317 = !DILocation(line: 227, column: 36, scope: !307)
!318 = !DILocation(line: 228, column: 25, scope: !307)
!319 = !DILocation(line: 228, column: 34, scope: !307)
!320 = !DILocation(line: 228, column: 41, scope: !307)
!321 = !DILocation(line: 229, column: 25, scope: !307)
!322 = !DILocation(line: 229, column: 34, scope: !307)
!323 = !DILocation(line: 230, column: 26, scope: !324)
!324 = distinct !DILexicalBlock(scope: !307, file: !32, line: 230, column: 21)
!325 = !DILocation(line: 230, column: 40, scope: !324)
!326 = !DILocation(line: 230, column: 21, scope: !324)
!327 = !DILocation(line: 230, column: 85, scope: !324)
!328 = !DILocation(line: 230, column: 21, scope: !307)
!329 = !DILocation(line: 232, column: 21, scope: !330)
!330 = distinct !DILexicalBlock(scope: !324, file: !32, line: 231, column: 17)
!331 = !DILocation(line: 234, column: 28, scope: !332)
!332 = distinct !DILexicalBlock(scope: !307, file: !32, line: 234, column: 21)
!333 = !DILocation(line: 234, column: 21, scope: !332)
!334 = !DILocation(line: 234, column: 58, scope: !332)
!335 = !DILocation(line: 234, column: 21, scope: !307)
!336 = !DILocation(line: 236, column: 21, scope: !337)
!337 = distinct !DILexicalBlock(scope: !332, file: !32, line: 235, column: 17)
!338 = !DILocation(line: 238, column: 39, scope: !307)
!339 = !DILocation(line: 238, column: 32, scope: !307)
!340 = !DILocation(line: 238, column: 30, scope: !307)
!341 = !DILocation(line: 239, column: 21, scope: !342)
!342 = distinct !DILexicalBlock(scope: !307, file: !32, line: 239, column: 21)
!343 = !DILocation(line: 239, column: 34, scope: !342)
!344 = !DILocation(line: 239, column: 21, scope: !307)
!345 = !DILocation(line: 241, column: 21, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !32, line: 240, column: 17)
!347 = !DILocation(line: 244, column: 35, scope: !307)
!348 = !DILocation(line: 244, column: 49, scope: !307)
!349 = !DILocation(line: 244, column: 30, scope: !307)
!350 = !DILocation(line: 244, column: 28, scope: !307)
!351 = !DILocation(line: 245, column: 21, scope: !352)
!352 = distinct !DILexicalBlock(scope: !307, file: !32, line: 245, column: 21)
!353 = !DILocation(line: 245, column: 32, scope: !352)
!354 = !DILocation(line: 245, column: 48, scope: !352)
!355 = !DILocation(line: 245, column: 51, scope: !352)
!356 = !DILocation(line: 245, column: 62, scope: !352)
!357 = !DILocation(line: 245, column: 21, scope: !307)
!358 = !DILocation(line: 247, column: 21, scope: !359)
!359 = distinct !DILexicalBlock(scope: !352, file: !32, line: 246, column: 17)
!360 = !DILocation(line: 250, column: 29, scope: !307)
!361 = !DILocation(line: 250, column: 17, scope: !307)
!362 = !DILocation(line: 250, column: 41, scope: !307)
!363 = !DILocation(line: 252, column: 29, scope: !307)
!364 = !DILocation(line: 252, column: 24, scope: !307)
!365 = !DILocation(line: 252, column: 22, scope: !307)
!366 = !DILocation(line: 253, column: 13, scope: !307)
!367 = !DILocation(line: 255, column: 17, scope: !368)
!368 = distinct !DILexicalBlock(scope: !295, file: !32, line: 255, column: 17)
!369 = !DILocation(line: 255, column: 30, scope: !368)
!370 = !DILocation(line: 255, column: 17, scope: !295)
!371 = !DILocation(line: 257, column: 30, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !32, line: 256, column: 13)
!373 = !DILocation(line: 257, column: 17, scope: !372)
!374 = !DILocation(line: 258, column: 13, scope: !372)
!375 = !DILocation(line: 259, column: 17, scope: !376)
!376 = distinct !DILexicalBlock(scope: !295, file: !32, line: 259, column: 17)
!377 = !DILocation(line: 259, column: 30, scope: !376)
!378 = !DILocation(line: 259, column: 17, scope: !295)
!379 = !DILocation(line: 261, column: 30, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !32, line: 260, column: 13)
!381 = !DILocation(line: 261, column: 17, scope: !380)
!382 = !DILocation(line: 262, column: 13, scope: !380)
!383 = !DILocation(line: 270, column: 21, scope: !290)
!384 = !DILocation(line: 270, column: 10, scope: !290)
!385 = !DILocation(line: 270, column: 19, scope: !290)
!386 = !DILocalVariable(name: "data", scope: !387, file: !32, line: 273, type: !37)
!387 = distinct !DILexicalBlock(scope: !281, file: !32, line: 272, column: 5)
!388 = !DILocation(line: 273, column: 13, scope: !387)
!389 = !DILocation(line: 273, column: 21, scope: !387)
!390 = !DILocation(line: 273, column: 20, scope: !387)
!391 = !DILocalVariable(name: "i", scope: !392, file: !32, line: 275, type: !37)
!392 = distinct !DILexicalBlock(scope: !387, file: !32, line: 274, column: 9)
!393 = !DILocation(line: 275, column: 17, scope: !392)
!394 = !DILocalVariable(name: "buffer", scope: !392, file: !32, line: 276, type: !170)
!395 = !DILocation(line: 276, column: 17, scope: !392)
!396 = !DILocation(line: 278, column: 17, scope: !397)
!397 = distinct !DILexicalBlock(scope: !392, file: !32, line: 278, column: 17)
!398 = !DILocation(line: 278, column: 22, scope: !397)
!399 = !DILocation(line: 278, column: 27, scope: !397)
!400 = !DILocation(line: 278, column: 30, scope: !397)
!401 = !DILocation(line: 278, column: 35, scope: !397)
!402 = !DILocation(line: 278, column: 17, scope: !392)
!403 = !DILocation(line: 280, column: 24, scope: !404)
!404 = distinct !DILexicalBlock(scope: !397, file: !32, line: 279, column: 13)
!405 = !DILocation(line: 280, column: 17, scope: !404)
!406 = !DILocation(line: 280, column: 30, scope: !404)
!407 = !DILocation(line: 282, column: 23, scope: !408)
!408 = distinct !DILexicalBlock(scope: !404, file: !32, line: 282, column: 17)
!409 = !DILocation(line: 282, column: 21, scope: !408)
!410 = !DILocation(line: 282, column: 28, scope: !411)
!411 = distinct !DILexicalBlock(scope: !408, file: !32, line: 282, column: 17)
!412 = !DILocation(line: 282, column: 30, scope: !411)
!413 = !DILocation(line: 282, column: 17, scope: !408)
!414 = !DILocation(line: 284, column: 41, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !32, line: 283, column: 17)
!416 = !DILocation(line: 284, column: 34, scope: !415)
!417 = !DILocation(line: 284, column: 21, scope: !415)
!418 = !DILocation(line: 285, column: 17, scope: !415)
!419 = !DILocation(line: 282, column: 37, scope: !411)
!420 = !DILocation(line: 282, column: 17, scope: !411)
!421 = distinct !{!421, !413, !422, !198}
!422 = !DILocation(line: 285, column: 17, scope: !408)
!423 = !DILocation(line: 286, column: 13, scope: !404)
!424 = !DILocation(line: 289, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !397, file: !32, line: 288, column: 13)
!426 = !DILocation(line: 293, column: 1, scope: !281)
