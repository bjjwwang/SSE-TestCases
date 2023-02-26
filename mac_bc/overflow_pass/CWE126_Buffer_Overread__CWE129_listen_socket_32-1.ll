; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_listen_socket_32_bad() #0 !dbg !31 {
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !166, metadata !DIExpression()), !dbg !171
  %21 = bitcast [10 x i32]* %buffer to i8*, !dbg !171
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !171
  %22 = load i32, i32* %data33, align 4, !dbg !172
  %cmp34 = icmp sge i32 %22, 0, !dbg !174
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !175

if.then36:                                        ; preds = %if.end32
  %23 = load i32, i32* %data33, align 4, !dbg !176
  %idxprom37 = sext i32 %23 to i64, !dbg !178
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !178
  %24 = load i32, i32* %arrayidx38, align 4, !dbg !178
  call void @printIntLine(i32 noundef %24), !dbg !179
  br label %if.end39, !dbg !180

if.else:                                          ; preds = %if.end32
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !181
  br label %if.end39

if.end39:                                         ; preds = %if.else, %if.then36
  ret void, !dbg !183
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
define void @CWE126_Buffer_Overread__CWE129_listen_socket_32_good() #0 !dbg !184 {
entry:
  call void @goodG2B(), !dbg !185
  call void @goodB2G(), !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !188 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !193, metadata !DIExpression()), !dbg !194
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !195, metadata !DIExpression()), !dbg !196
  %call = call i64 @time(i64* noundef null), !dbg !197
  %conv = trunc i64 %call to i32, !dbg !198
  call void @srand(i32 noundef %conv), !dbg !199
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !200
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_32_good(), !dbg !201
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !202
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !203
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_32_bad(), !dbg !204
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !205
  ret i32 0, !dbg !206
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !207 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !210, metadata !DIExpression()), !dbg !211
  store i32* %data, i32** %dataPtr1, align 8, !dbg !211
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !212, metadata !DIExpression()), !dbg !213
  store i32* %data, i32** %dataPtr2, align 8, !dbg !213
  store i32 -1, i32* %data, align 4, !dbg !214
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !215, metadata !DIExpression()), !dbg !217
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !218
  %1 = load i32, i32* %0, align 4, !dbg !219
  store i32 %1, i32* %data1, align 4, !dbg !217
  store i32 7, i32* %data1, align 4, !dbg !220
  %2 = load i32, i32* %data1, align 4, !dbg !221
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !222
  store i32 %2, i32* %3, align 4, !dbg !223
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !224, metadata !DIExpression()), !dbg !226
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !227
  %5 = load i32, i32* %4, align 4, !dbg !228
  store i32 %5, i32* %data2, align 4, !dbg !226
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !229, metadata !DIExpression()), !dbg !231
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !231
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !231
  %7 = load i32, i32* %data2, align 4, !dbg !232
  %cmp = icmp sge i32 %7, 0, !dbg !234
  br i1 %cmp, label %if.then, label %if.else, !dbg !235

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !236
  %idxprom = sext i32 %8 to i64, !dbg !238
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !238
  %9 = load i32, i32* %arrayidx, align 4, !dbg !238
  call void @printIntLine(i32 noundef %9), !dbg !239
  br label %if.end, !dbg !240

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !241
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !243
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !244 {
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
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !245, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !247, metadata !DIExpression()), !dbg !248
  store i32* %data, i32** %dataPtr1, align 8, !dbg !248
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !249, metadata !DIExpression()), !dbg !250
  store i32* %data, i32** %dataPtr2, align 8, !dbg !250
  store i32 -1, i32* %data, align 4, !dbg !251
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !252, metadata !DIExpression()), !dbg !254
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !255
  %1 = load i32, i32* %0, align 4, !dbg !256
  store i32 %1, i32* %data1, align 4, !dbg !254
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !257, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %listenSocket, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 -1, i32* %acceptSocket, align 4, !dbg !265
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !266, metadata !DIExpression()), !dbg !267
  br label %do.body, !dbg !268

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !269
  store i32 %call, i32* %listenSocket, align 4, !dbg !271
  %2 = load i32, i32* %listenSocket, align 4, !dbg !272
  %cmp = icmp eq i32 %2, -1, !dbg !274
  br i1 %cmp, label %if.then, label %if.end, !dbg !275

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !276

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !278
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !278
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !279
  store i8 2, i8* %sin_family, align 1, !dbg !280
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !281
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !282
  store i32 0, i32* %s_addr, align 4, !dbg !283
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !284
  store i16 -30871, i16* %sin_port, align 2, !dbg !285
  %4 = load i32, i32* %listenSocket, align 4, !dbg !286
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !288
  %call2 = call i32 @"\01_bind"(i32 noundef %4, %struct.sockaddr* noundef %5, i32 noundef 16), !dbg !289
  %cmp3 = icmp eq i32 %call2, -1, !dbg !290
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !291

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !292

if.end5:                                          ; preds = %if.end
  %6 = load i32, i32* %listenSocket, align 4, !dbg !294
  %call6 = call i32 @"\01_listen"(i32 noundef %6, i32 noundef 5), !dbg !296
  %cmp7 = icmp eq i32 %call6, -1, !dbg !297
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !298

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !299

if.end9:                                          ; preds = %if.end5
  %7 = load i32, i32* %listenSocket, align 4, !dbg !301
  %call10 = call i32 @"\01_accept"(i32 noundef %7, %struct.sockaddr* noundef null, i32* noundef null), !dbg !302
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !303
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !304
  %cmp11 = icmp eq i32 %8, -1, !dbg !306
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !307

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !308

if.end13:                                         ; preds = %if.end9
  %9 = load i32, i32* %acceptSocket, align 4, !dbg !310
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !311
  %call14 = call i64 @"\01_recv"(i32 noundef %9, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !312
  %conv = trunc i64 %call14 to i32, !dbg !312
  store i32 %conv, i32* %recvResult, align 4, !dbg !313
  %10 = load i32, i32* %recvResult, align 4, !dbg !314
  %cmp15 = icmp eq i32 %10, -1, !dbg !316
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !317

lor.lhs.false:                                    ; preds = %if.end13
  %11 = load i32, i32* %recvResult, align 4, !dbg !318
  %cmp17 = icmp eq i32 %11, 0, !dbg !319
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !320

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !321

if.end20:                                         ; preds = %lor.lhs.false
  %12 = load i32, i32* %recvResult, align 4, !dbg !323
  %idxprom = sext i32 %12 to i64, !dbg !324
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !324
  store i8 0, i8* %arrayidx, align 1, !dbg !325
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !326
  %call22 = call i32 @atoi(i8* noundef %arraydecay21), !dbg !327
  store i32 %call22, i32* %data1, align 4, !dbg !328
  br label %do.end, !dbg !329

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then
  %13 = load i32, i32* %listenSocket, align 4, !dbg !330
  %cmp23 = icmp ne i32 %13, -1, !dbg !332
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !333

if.then25:                                        ; preds = %do.end
  %14 = load i32, i32* %listenSocket, align 4, !dbg !334
  %call26 = call i32 @"\01_close"(i32 noundef %14), !dbg !336
  br label %if.end27, !dbg !337

if.end27:                                         ; preds = %if.then25, %do.end
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !338
  %cmp28 = icmp ne i32 %15, -1, !dbg !340
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !341

if.then30:                                        ; preds = %if.end27
  %16 = load i32, i32* %acceptSocket, align 4, !dbg !342
  %call31 = call i32 @"\01_close"(i32 noundef %16), !dbg !344
  br label %if.end32, !dbg !345

if.end32:                                         ; preds = %if.then30, %if.end27
  %17 = load i32, i32* %data1, align 4, !dbg !346
  %18 = load i32*, i32** %dataPtr1, align 8, !dbg !347
  store i32 %17, i32* %18, align 4, !dbg !348
  call void @llvm.dbg.declare(metadata i32* %data33, metadata !349, metadata !DIExpression()), !dbg !351
  %19 = load i32*, i32** %dataPtr2, align 8, !dbg !352
  %20 = load i32, i32* %19, align 4, !dbg !353
  store i32 %20, i32* %data33, align 4, !dbg !351
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !354, metadata !DIExpression()), !dbg !356
  %21 = bitcast [10 x i32]* %buffer to i8*, !dbg !356
  call void @llvm.memset.p0i8.i64(i8* align 16 %21, i8 0, i64 40, i1 false), !dbg !356
  %22 = load i32, i32* %data33, align 4, !dbg !357
  %cmp34 = icmp sge i32 %22, 0, !dbg !359
  br i1 %cmp34, label %land.lhs.true, label %if.else, !dbg !360

land.lhs.true:                                    ; preds = %if.end32
  %23 = load i32, i32* %data33, align 4, !dbg !361
  %cmp36 = icmp slt i32 %23, 10, !dbg !362
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !363

if.then38:                                        ; preds = %land.lhs.true
  %24 = load i32, i32* %data33, align 4, !dbg !364
  %idxprom39 = sext i32 %24 to i64, !dbg !366
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !366
  %25 = load i32, i32* %arrayidx40, align 4, !dbg !366
  call void @printIntLine(i32 noundef %25), !dbg !367
  br label %if.end41, !dbg !368

if.else:                                          ; preds = %land.lhs.true, %if.end32
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !369
  br label %if.end41

if.end41:                                         ; preds = %if.else, %if.then38
  ret void, !dbg !371
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_32_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!166 = !DILocalVariable(name: "buffer", scope: !167, file: !32, line: 127, type: !168)
!167 = distinct !DILexicalBlock(scope: !162, file: !32, line: 126, column: 9)
!168 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !169)
!169 = !{!170}
!170 = !DISubrange(count: 10)
!171 = !DILocation(line: 127, column: 17, scope: !167)
!172 = !DILocation(line: 130, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !167, file: !32, line: 130, column: 17)
!174 = !DILocation(line: 130, column: 22, scope: !173)
!175 = !DILocation(line: 130, column: 17, scope: !167)
!176 = !DILocation(line: 132, column: 37, scope: !177)
!177 = distinct !DILexicalBlock(scope: !173, file: !32, line: 131, column: 13)
!178 = !DILocation(line: 132, column: 30, scope: !177)
!179 = !DILocation(line: 132, column: 17, scope: !177)
!180 = !DILocation(line: 133, column: 13, scope: !177)
!181 = !DILocation(line: 136, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !173, file: !32, line: 135, column: 13)
!183 = !DILocation(line: 140, column: 1, scope: !31)
!184 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_32_good", scope: !32, file: !32, line: 277, type: !33, scopeLine: 278, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!185 = !DILocation(line: 279, column: 5, scope: !184)
!186 = !DILocation(line: 280, column: 5, scope: !184)
!187 = !DILocation(line: 281, column: 1, scope: !184)
!188 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 291, type: !189, scopeLine: 292, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!189 = !DISubroutineType(types: !190)
!190 = !{!37, !37, !191}
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!193 = !DILocalVariable(name: "argc", arg: 1, scope: !188, file: !32, line: 291, type: !37)
!194 = !DILocation(line: 291, column: 14, scope: !188)
!195 = !DILocalVariable(name: "argv", arg: 2, scope: !188, file: !32, line: 291, type: !191)
!196 = !DILocation(line: 291, column: 27, scope: !188)
!197 = !DILocation(line: 294, column: 22, scope: !188)
!198 = !DILocation(line: 294, column: 12, scope: !188)
!199 = !DILocation(line: 294, column: 5, scope: !188)
!200 = !DILocation(line: 296, column: 5, scope: !188)
!201 = !DILocation(line: 297, column: 5, scope: !188)
!202 = !DILocation(line: 298, column: 5, scope: !188)
!203 = !DILocation(line: 301, column: 5, scope: !188)
!204 = !DILocation(line: 302, column: 5, scope: !188)
!205 = !DILocation(line: 303, column: 5, scope: !188)
!206 = !DILocation(line: 305, column: 5, scope: !188)
!207 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 147, type: !33, scopeLine: 148, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!208 = !DILocalVariable(name: "data", scope: !207, file: !32, line: 149, type: !37)
!209 = !DILocation(line: 149, column: 9, scope: !207)
!210 = !DILocalVariable(name: "dataPtr1", scope: !207, file: !32, line: 150, type: !40)
!211 = !DILocation(line: 150, column: 10, scope: !207)
!212 = !DILocalVariable(name: "dataPtr2", scope: !207, file: !32, line: 151, type: !40)
!213 = !DILocation(line: 151, column: 10, scope: !207)
!214 = !DILocation(line: 153, column: 10, scope: !207)
!215 = !DILocalVariable(name: "data", scope: !216, file: !32, line: 155, type: !37)
!216 = distinct !DILexicalBlock(scope: !207, file: !32, line: 154, column: 5)
!217 = !DILocation(line: 155, column: 13, scope: !216)
!218 = !DILocation(line: 155, column: 21, scope: !216)
!219 = !DILocation(line: 155, column: 20, scope: !216)
!220 = !DILocation(line: 158, column: 14, scope: !216)
!221 = !DILocation(line: 159, column: 21, scope: !216)
!222 = !DILocation(line: 159, column: 10, scope: !216)
!223 = !DILocation(line: 159, column: 19, scope: !216)
!224 = !DILocalVariable(name: "data", scope: !225, file: !32, line: 162, type: !37)
!225 = distinct !DILexicalBlock(scope: !207, file: !32, line: 161, column: 5)
!226 = !DILocation(line: 162, column: 13, scope: !225)
!227 = !DILocation(line: 162, column: 21, scope: !225)
!228 = !DILocation(line: 162, column: 20, scope: !225)
!229 = !DILocalVariable(name: "buffer", scope: !230, file: !32, line: 164, type: !168)
!230 = distinct !DILexicalBlock(scope: !225, file: !32, line: 163, column: 9)
!231 = !DILocation(line: 164, column: 17, scope: !230)
!232 = !DILocation(line: 167, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !32, line: 167, column: 17)
!234 = !DILocation(line: 167, column: 22, scope: !233)
!235 = !DILocation(line: 167, column: 17, scope: !230)
!236 = !DILocation(line: 169, column: 37, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !32, line: 168, column: 13)
!238 = !DILocation(line: 169, column: 30, scope: !237)
!239 = !DILocation(line: 169, column: 17, scope: !237)
!240 = !DILocation(line: 170, column: 13, scope: !237)
!241 = !DILocation(line: 173, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !233, file: !32, line: 172, column: 13)
!243 = !DILocation(line: 177, column: 1, scope: !207)
!244 = distinct !DISubprogram(name: "goodB2G", scope: !32, file: !32, line: 180, type: !33, scopeLine: 181, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!245 = !DILocalVariable(name: "data", scope: !244, file: !32, line: 182, type: !37)
!246 = !DILocation(line: 182, column: 9, scope: !244)
!247 = !DILocalVariable(name: "dataPtr1", scope: !244, file: !32, line: 183, type: !40)
!248 = !DILocation(line: 183, column: 10, scope: !244)
!249 = !DILocalVariable(name: "dataPtr2", scope: !244, file: !32, line: 184, type: !40)
!250 = !DILocation(line: 184, column: 10, scope: !244)
!251 = !DILocation(line: 186, column: 10, scope: !244)
!252 = !DILocalVariable(name: "data", scope: !253, file: !32, line: 188, type: !37)
!253 = distinct !DILexicalBlock(scope: !244, file: !32, line: 187, column: 5)
!254 = !DILocation(line: 188, column: 13, scope: !253)
!255 = !DILocation(line: 188, column: 21, scope: !253)
!256 = !DILocation(line: 188, column: 20, scope: !253)
!257 = !DILocalVariable(name: "recvResult", scope: !258, file: !32, line: 194, type: !37)
!258 = distinct !DILexicalBlock(scope: !253, file: !32, line: 189, column: 9)
!259 = !DILocation(line: 194, column: 17, scope: !258)
!260 = !DILocalVariable(name: "service", scope: !258, file: !32, line: 195, type: !54)
!261 = !DILocation(line: 195, column: 32, scope: !258)
!262 = !DILocalVariable(name: "listenSocket", scope: !258, file: !32, line: 196, type: !37)
!263 = !DILocation(line: 196, column: 20, scope: !258)
!264 = !DILocalVariable(name: "acceptSocket", scope: !258, file: !32, line: 197, type: !37)
!265 = !DILocation(line: 197, column: 20, scope: !258)
!266 = !DILocalVariable(name: "inputBuffer", scope: !258, file: !32, line: 198, type: !20)
!267 = !DILocation(line: 198, column: 18, scope: !258)
!268 = !DILocation(line: 199, column: 13, scope: !258)
!269 = !DILocation(line: 209, column: 32, scope: !270)
!270 = distinct !DILexicalBlock(scope: !258, file: !32, line: 200, column: 13)
!271 = !DILocation(line: 209, column: 30, scope: !270)
!272 = !DILocation(line: 210, column: 21, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !32, line: 210, column: 21)
!274 = !DILocation(line: 210, column: 34, scope: !273)
!275 = !DILocation(line: 210, column: 21, scope: !270)
!276 = !DILocation(line: 212, column: 21, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !32, line: 211, column: 17)
!278 = !DILocation(line: 214, column: 17, scope: !270)
!279 = !DILocation(line: 215, column: 25, scope: !270)
!280 = !DILocation(line: 215, column: 36, scope: !270)
!281 = !DILocation(line: 216, column: 25, scope: !270)
!282 = !DILocation(line: 216, column: 34, scope: !270)
!283 = !DILocation(line: 216, column: 41, scope: !270)
!284 = !DILocation(line: 217, column: 25, scope: !270)
!285 = !DILocation(line: 217, column: 34, scope: !270)
!286 = !DILocation(line: 218, column: 26, scope: !287)
!287 = distinct !DILexicalBlock(scope: !270, file: !32, line: 218, column: 21)
!288 = !DILocation(line: 218, column: 40, scope: !287)
!289 = !DILocation(line: 218, column: 21, scope: !287)
!290 = !DILocation(line: 218, column: 85, scope: !287)
!291 = !DILocation(line: 218, column: 21, scope: !270)
!292 = !DILocation(line: 220, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !287, file: !32, line: 219, column: 17)
!294 = !DILocation(line: 222, column: 28, scope: !295)
!295 = distinct !DILexicalBlock(scope: !270, file: !32, line: 222, column: 21)
!296 = !DILocation(line: 222, column: 21, scope: !295)
!297 = !DILocation(line: 222, column: 58, scope: !295)
!298 = !DILocation(line: 222, column: 21, scope: !270)
!299 = !DILocation(line: 224, column: 21, scope: !300)
!300 = distinct !DILexicalBlock(scope: !295, file: !32, line: 223, column: 17)
!301 = !DILocation(line: 226, column: 39, scope: !270)
!302 = !DILocation(line: 226, column: 32, scope: !270)
!303 = !DILocation(line: 226, column: 30, scope: !270)
!304 = !DILocation(line: 227, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !270, file: !32, line: 227, column: 21)
!306 = !DILocation(line: 227, column: 34, scope: !305)
!307 = !DILocation(line: 227, column: 21, scope: !270)
!308 = !DILocation(line: 229, column: 21, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !32, line: 228, column: 17)
!310 = !DILocation(line: 232, column: 35, scope: !270)
!311 = !DILocation(line: 232, column: 49, scope: !270)
!312 = !DILocation(line: 232, column: 30, scope: !270)
!313 = !DILocation(line: 232, column: 28, scope: !270)
!314 = !DILocation(line: 233, column: 21, scope: !315)
!315 = distinct !DILexicalBlock(scope: !270, file: !32, line: 233, column: 21)
!316 = !DILocation(line: 233, column: 32, scope: !315)
!317 = !DILocation(line: 233, column: 48, scope: !315)
!318 = !DILocation(line: 233, column: 51, scope: !315)
!319 = !DILocation(line: 233, column: 62, scope: !315)
!320 = !DILocation(line: 233, column: 21, scope: !270)
!321 = !DILocation(line: 235, column: 21, scope: !322)
!322 = distinct !DILexicalBlock(scope: !315, file: !32, line: 234, column: 17)
!323 = !DILocation(line: 238, column: 29, scope: !270)
!324 = !DILocation(line: 238, column: 17, scope: !270)
!325 = !DILocation(line: 238, column: 41, scope: !270)
!326 = !DILocation(line: 240, column: 29, scope: !270)
!327 = !DILocation(line: 240, column: 24, scope: !270)
!328 = !DILocation(line: 240, column: 22, scope: !270)
!329 = !DILocation(line: 241, column: 13, scope: !270)
!330 = !DILocation(line: 243, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !258, file: !32, line: 243, column: 17)
!332 = !DILocation(line: 243, column: 30, scope: !331)
!333 = !DILocation(line: 243, column: 17, scope: !258)
!334 = !DILocation(line: 245, column: 30, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !32, line: 244, column: 13)
!336 = !DILocation(line: 245, column: 17, scope: !335)
!337 = !DILocation(line: 246, column: 13, scope: !335)
!338 = !DILocation(line: 247, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !258, file: !32, line: 247, column: 17)
!340 = !DILocation(line: 247, column: 30, scope: !339)
!341 = !DILocation(line: 247, column: 17, scope: !258)
!342 = !DILocation(line: 249, column: 30, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !32, line: 248, column: 13)
!344 = !DILocation(line: 249, column: 17, scope: !343)
!345 = !DILocation(line: 250, column: 13, scope: !343)
!346 = !DILocation(line: 258, column: 21, scope: !253)
!347 = !DILocation(line: 258, column: 10, scope: !253)
!348 = !DILocation(line: 258, column: 19, scope: !253)
!349 = !DILocalVariable(name: "data", scope: !350, file: !32, line: 261, type: !37)
!350 = distinct !DILexicalBlock(scope: !244, file: !32, line: 260, column: 5)
!351 = !DILocation(line: 261, column: 13, scope: !350)
!352 = !DILocation(line: 261, column: 21, scope: !350)
!353 = !DILocation(line: 261, column: 20, scope: !350)
!354 = !DILocalVariable(name: "buffer", scope: !355, file: !32, line: 263, type: !168)
!355 = distinct !DILexicalBlock(scope: !350, file: !32, line: 262, column: 9)
!356 = !DILocation(line: 263, column: 17, scope: !355)
!357 = !DILocation(line: 265, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !355, file: !32, line: 265, column: 17)
!359 = !DILocation(line: 265, column: 22, scope: !358)
!360 = !DILocation(line: 265, column: 27, scope: !358)
!361 = !DILocation(line: 265, column: 30, scope: !358)
!362 = !DILocation(line: 265, column: 35, scope: !358)
!363 = !DILocation(line: 265, column: 17, scope: !355)
!364 = !DILocation(line: 267, column: 37, scope: !365)
!365 = distinct !DILexicalBlock(scope: !358, file: !32, line: 266, column: 13)
!366 = !DILocation(line: 267, column: 30, scope: !365)
!367 = !DILocation(line: 267, column: 17, scope: !365)
!368 = !DILocation(line: 268, column: 13, scope: !365)
!369 = !DILocation(line: 271, column: 17, scope: !370)
!370 = distinct !DILexicalBlock(scope: !358, file: !32, line: 270, column: 13)
!371 = !DILocation(line: 275, column: 1, scope: !244)
