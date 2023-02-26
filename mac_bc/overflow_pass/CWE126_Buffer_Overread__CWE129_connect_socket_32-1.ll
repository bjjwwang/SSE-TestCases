; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_32_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data21 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !37, metadata !DIExpression()), !dbg !39
  store i32* %data, i32** %dataPtr1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !40, metadata !DIExpression()), !dbg !41
  store i32* %data, i32** %dataPtr2, align 8, !dbg !41
  store i32 -1, i32* %data, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !43, metadata !DIExpression()), !dbg !45
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !46
  %1 = load i32, i32* %0, align 4, !dbg !47
  store i32 %1, i32* %data1, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !48, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !51, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 -1, i32* %connectSocket, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  br label %do.body, !dbg !76

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !77
  store i32 %call, i32* %connectSocket, align 4, !dbg !79
  %2 = load i32, i32* %connectSocket, align 4, !dbg !80
  %cmp = icmp eq i32 %2, -1, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !84

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !86
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !87
  store i8 2, i8* %sin_family, align 1, !dbg !88
  %call2 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !89
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !90
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !91
  store i32 %call2, i32* %s_addr, align 4, !dbg !92
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !93
  store i16 -30871, i16* %sin_port, align 2, !dbg !94
  %4 = load i32, i32* %connectSocket, align 4, !dbg !95
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !97
  %call3 = call i32 @"\01_connect"(i32 noundef %4, %struct.sockaddr* noundef %5, i32 noundef 16), !dbg !98
  %cmp4 = icmp eq i32 %call3, -1, !dbg !99
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !100

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !101

if.end6:                                          ; preds = %if.end
  %6 = load i32, i32* %connectSocket, align 4, !dbg !103
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !104
  %call7 = call i64 @"\01_recv"(i32 noundef %6, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !105
  %conv = trunc i64 %call7 to i32, !dbg !105
  store i32 %conv, i32* %recvResult, align 4, !dbg !106
  %7 = load i32, i32* %recvResult, align 4, !dbg !107
  %cmp8 = icmp eq i32 %7, -1, !dbg !109
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !110

lor.lhs.false:                                    ; preds = %if.end6
  %8 = load i32, i32* %recvResult, align 4, !dbg !111
  %cmp10 = icmp eq i32 %8, 0, !dbg !112
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !113

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !114

if.end13:                                         ; preds = %lor.lhs.false
  %9 = load i32, i32* %recvResult, align 4, !dbg !116
  %idxprom = sext i32 %9 to i64, !dbg !117
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !117
  store i8 0, i8* %arrayidx, align 1, !dbg !118
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !119
  %call15 = call i32 @atoi(i8* noundef %arraydecay14), !dbg !120
  store i32 %call15, i32* %data1, align 4, !dbg !121
  br label %do.end, !dbg !122

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %10 = load i32, i32* %connectSocket, align 4, !dbg !123
  %cmp16 = icmp ne i32 %10, -1, !dbg !125
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !126

if.then18:                                        ; preds = %do.end
  %11 = load i32, i32* %connectSocket, align 4, !dbg !127
  %call19 = call i32 @"\01_close"(i32 noundef %11), !dbg !129
  br label %if.end20, !dbg !130

if.end20:                                         ; preds = %if.then18, %do.end
  %12 = load i32, i32* %data1, align 4, !dbg !131
  %13 = load i32*, i32** %dataPtr1, align 8, !dbg !132
  store i32 %12, i32* %13, align 4, !dbg !133
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !134, metadata !DIExpression()), !dbg !136
  %14 = load i32*, i32** %dataPtr2, align 8, !dbg !137
  %15 = load i32, i32* %14, align 4, !dbg !138
  store i32 %15, i32* %data21, align 4, !dbg !136
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !139, metadata !DIExpression()), !dbg !144
  %16 = bitcast [10 x i32]* %buffer to i8*, !dbg !144
  call void @llvm.memset.p0i8.i64(i8* align 16 %16, i8 0, i64 40, i1 false), !dbg !144
  %17 = load i32, i32* %data21, align 4, !dbg !145
  %cmp22 = icmp sge i32 %17, 0, !dbg !147
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !148

if.then24:                                        ; preds = %if.end20
  %18 = load i32, i32* %data21, align 4, !dbg !149
  %idxprom25 = sext i32 %18 to i64, !dbg !151
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !151
  %19 = load i32, i32* %arrayidx26, align 4, !dbg !151
  call void @printIntLine(i32 noundef %19), !dbg !152
  br label %if.end27, !dbg !153

if.else:                                          ; preds = %if.end20
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !154
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.then24
  ret void, !dbg !156
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
define void @CWE126_Buffer_Overread__CWE129_connect_socket_32_good() #0 !dbg !157 {
entry:
  call void @goodG2B(), !dbg !158
  call void @goodB2G(), !dbg !159
  ret void, !dbg !160
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !161 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !166, metadata !DIExpression()), !dbg !167
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !168, metadata !DIExpression()), !dbg !169
  %call = call i64 @time(i64* noundef null), !dbg !170
  %conv = trunc i64 %call to i32, !dbg !171
  call void @srand(i32 noundef %conv), !dbg !172
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !173
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_32_good(), !dbg !174
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !175
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !176
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_32_bad(), !dbg !177
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !178
  ret i32 0, !dbg !179
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !180 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %data2 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !181, metadata !DIExpression()), !dbg !182
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !183, metadata !DIExpression()), !dbg !184
  store i32* %data, i32** %dataPtr1, align 8, !dbg !184
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !185, metadata !DIExpression()), !dbg !186
  store i32* %data, i32** %dataPtr2, align 8, !dbg !186
  store i32 -1, i32* %data, align 4, !dbg !187
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !188, metadata !DIExpression()), !dbg !190
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !191
  %1 = load i32, i32* %0, align 4, !dbg !192
  store i32 %1, i32* %data1, align 4, !dbg !190
  store i32 7, i32* %data1, align 4, !dbg !193
  %2 = load i32, i32* %data1, align 4, !dbg !194
  %3 = load i32*, i32** %dataPtr1, align 8, !dbg !195
  store i32 %2, i32* %3, align 4, !dbg !196
  call void @llvm.dbg.declare(metadata i32* %data2, metadata !197, metadata !DIExpression()), !dbg !199
  %4 = load i32*, i32** %dataPtr2, align 8, !dbg !200
  %5 = load i32, i32* %4, align 4, !dbg !201
  store i32 %5, i32* %data2, align 4, !dbg !199
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !202, metadata !DIExpression()), !dbg !204
  %6 = bitcast [10 x i32]* %buffer to i8*, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 40, i1 false), !dbg !204
  %7 = load i32, i32* %data2, align 4, !dbg !205
  %cmp = icmp sge i32 %7, 0, !dbg !207
  br i1 %cmp, label %if.then, label %if.else, !dbg !208

if.then:                                          ; preds = %entry
  %8 = load i32, i32* %data2, align 4, !dbg !209
  %idxprom = sext i32 %8 to i64, !dbg !211
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !211
  %9 = load i32, i32* %arrayidx, align 4, !dbg !211
  call void @printIntLine(i32 noundef %9), !dbg !212
  br label %if.end, !dbg !213

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !214
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !216
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !217 {
entry:
  %data = alloca i32, align 4
  %dataPtr1 = alloca i32*, align 8
  %dataPtr2 = alloca i32*, align 8
  %data1 = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %data21 = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !218, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata i32** %dataPtr1, metadata !220, metadata !DIExpression()), !dbg !221
  store i32* %data, i32** %dataPtr1, align 8, !dbg !221
  call void @llvm.dbg.declare(metadata i32** %dataPtr2, metadata !222, metadata !DIExpression()), !dbg !223
  store i32* %data, i32** %dataPtr2, align 8, !dbg !223
  store i32 -1, i32* %data, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !225, metadata !DIExpression()), !dbg !227
  %0 = load i32*, i32** %dataPtr1, align 8, !dbg !228
  %1 = load i32, i32* %0, align 4, !dbg !229
  store i32 %1, i32* %data1, align 4, !dbg !227
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !230, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !233, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 -1, i32* %connectSocket, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !237, metadata !DIExpression()), !dbg !238
  br label %do.body, !dbg !239

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !240
  store i32 %call, i32* %connectSocket, align 4, !dbg !242
  %2 = load i32, i32* %connectSocket, align 4, !dbg !243
  %cmp = icmp eq i32 %2, -1, !dbg !245
  br i1 %cmp, label %if.then, label %if.end, !dbg !246

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !247

if.end:                                           ; preds = %do.body
  %3 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !249
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 16, i1 false), !dbg !249
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !250
  store i8 2, i8* %sin_family, align 1, !dbg !251
  %call2 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !252
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !253
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !254
  store i32 %call2, i32* %s_addr, align 4, !dbg !255
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !256
  store i16 -30871, i16* %sin_port, align 2, !dbg !257
  %4 = load i32, i32* %connectSocket, align 4, !dbg !258
  %5 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !260
  %call3 = call i32 @"\01_connect"(i32 noundef %4, %struct.sockaddr* noundef %5, i32 noundef 16), !dbg !261
  %cmp4 = icmp eq i32 %call3, -1, !dbg !262
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !263

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !264

if.end6:                                          ; preds = %if.end
  %6 = load i32, i32* %connectSocket, align 4, !dbg !266
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !267
  %call7 = call i64 @"\01_recv"(i32 noundef %6, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !268
  %conv = trunc i64 %call7 to i32, !dbg !268
  store i32 %conv, i32* %recvResult, align 4, !dbg !269
  %7 = load i32, i32* %recvResult, align 4, !dbg !270
  %cmp8 = icmp eq i32 %7, -1, !dbg !272
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !273

lor.lhs.false:                                    ; preds = %if.end6
  %8 = load i32, i32* %recvResult, align 4, !dbg !274
  %cmp10 = icmp eq i32 %8, 0, !dbg !275
  br i1 %cmp10, label %if.then12, label %if.end13, !dbg !276

if.then12:                                        ; preds = %lor.lhs.false, %if.end6
  br label %do.end, !dbg !277

if.end13:                                         ; preds = %lor.lhs.false
  %9 = load i32, i32* %recvResult, align 4, !dbg !279
  %idxprom = sext i32 %9 to i64, !dbg !280
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !280
  store i8 0, i8* %arrayidx, align 1, !dbg !281
  %arraydecay14 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !282
  %call15 = call i32 @atoi(i8* noundef %arraydecay14), !dbg !283
  store i32 %call15, i32* %data1, align 4, !dbg !284
  br label %do.end, !dbg !285

do.end:                                           ; preds = %if.end13, %if.then12, %if.then5, %if.then
  %10 = load i32, i32* %connectSocket, align 4, !dbg !286
  %cmp16 = icmp ne i32 %10, -1, !dbg !288
  br i1 %cmp16, label %if.then18, label %if.end20, !dbg !289

if.then18:                                        ; preds = %do.end
  %11 = load i32, i32* %connectSocket, align 4, !dbg !290
  %call19 = call i32 @"\01_close"(i32 noundef %11), !dbg !292
  br label %if.end20, !dbg !293

if.end20:                                         ; preds = %if.then18, %do.end
  %12 = load i32, i32* %data1, align 4, !dbg !294
  %13 = load i32*, i32** %dataPtr1, align 8, !dbg !295
  store i32 %12, i32* %13, align 4, !dbg !296
  call void @llvm.dbg.declare(metadata i32* %data21, metadata !297, metadata !DIExpression()), !dbg !299
  %14 = load i32*, i32** %dataPtr2, align 8, !dbg !300
  %15 = load i32, i32* %14, align 4, !dbg !301
  store i32 %15, i32* %data21, align 4, !dbg !299
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !302, metadata !DIExpression()), !dbg !304
  %16 = bitcast [10 x i32]* %buffer to i8*, !dbg !304
  call void @llvm.memset.p0i8.i64(i8* align 16 %16, i8 0, i64 40, i1 false), !dbg !304
  %17 = load i32, i32* %data21, align 4, !dbg !305
  %cmp22 = icmp sge i32 %17, 0, !dbg !307
  br i1 %cmp22, label %land.lhs.true, label %if.else, !dbg !308

land.lhs.true:                                    ; preds = %if.end20
  %18 = load i32, i32* %data21, align 4, !dbg !309
  %cmp24 = icmp slt i32 %18, 10, !dbg !310
  br i1 %cmp24, label %if.then26, label %if.else, !dbg !311

if.then26:                                        ; preds = %land.lhs.true
  %19 = load i32, i32* %data21, align 4, !dbg !312
  %idxprom27 = sext i32 %19 to i64, !dbg !314
  %arrayidx28 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom27, !dbg !314
  %20 = load i32, i32* %arrayidx28, align 4, !dbg !314
  call void @printIntLine(i32 noundef %20), !dbg !315
  br label %if.end29, !dbg !316

if.else:                                          ; preds = %land.lhs.true, %if.end20
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !317
  br label %if.end29

if.end29:                                         ; preds = %if.else, %if.then26
  ret void, !dbg !319
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_32_bad", scope: !30, file: !30, line: 44, type: !31, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 46, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 46, column: 9, scope: !29)
!37 = !DILocalVariable(name: "dataPtr1", scope: !29, file: !30, line: 47, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!39 = !DILocation(line: 47, column: 10, scope: !29)
!40 = !DILocalVariable(name: "dataPtr2", scope: !29, file: !30, line: 48, type: !38)
!41 = !DILocation(line: 48, column: 10, scope: !29)
!42 = !DILocation(line: 50, column: 10, scope: !29)
!43 = !DILocalVariable(name: "data", scope: !44, file: !30, line: 52, type: !35)
!44 = distinct !DILexicalBlock(scope: !29, file: !30, line: 51, column: 5)
!45 = !DILocation(line: 52, column: 13, scope: !44)
!46 = !DILocation(line: 52, column: 21, scope: !44)
!47 = !DILocation(line: 52, column: 20, scope: !44)
!48 = !DILocalVariable(name: "recvResult", scope: !49, file: !30, line: 58, type: !35)
!49 = distinct !DILexicalBlock(scope: !44, file: !30, line: 53, column: 9)
!50 = !DILocation(line: 58, column: 17, scope: !49)
!51 = !DILocalVariable(name: "service", scope: !49, file: !30, line: 59, type: !52)
!52 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !53, line: 375, size: 128, elements: !54)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!54 = !{!55, !56, !57, !60, !67}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !52, file: !53, line: 376, baseType: !11, size: 8)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !52, file: !53, line: 377, baseType: !14, size: 8, offset: 8)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !52, file: !53, line: 378, baseType: !58, size: 16, offset: 16)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !59, line: 31, baseType: !3)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!60 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !52, file: !53, line: 379, baseType: !61, size: 32, offset: 32)
!61 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !53, line: 301, size: 32, elements: !62)
!62 = !{!63}
!63 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !61, file: !53, line: 302, baseType: !64, size: 32)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !65, line: 31, baseType: !66)
!65 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !52, file: !53, line: 380, baseType: !68, size: 64, offset: 64)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 8)
!71 = !DILocation(line: 59, column: 32, scope: !49)
!72 = !DILocalVariable(name: "connectSocket", scope: !49, file: !30, line: 60, type: !35)
!73 = !DILocation(line: 60, column: 20, scope: !49)
!74 = !DILocalVariable(name: "inputBuffer", scope: !49, file: !30, line: 61, type: !17)
!75 = !DILocation(line: 61, column: 18, scope: !49)
!76 = !DILocation(line: 62, column: 13, scope: !49)
!77 = !DILocation(line: 72, column: 33, scope: !78)
!78 = distinct !DILexicalBlock(scope: !49, file: !30, line: 63, column: 13)
!79 = !DILocation(line: 72, column: 31, scope: !78)
!80 = !DILocation(line: 73, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !30, line: 73, column: 21)
!82 = !DILocation(line: 73, column: 35, scope: !81)
!83 = !DILocation(line: 73, column: 21, scope: !78)
!84 = !DILocation(line: 75, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !30, line: 74, column: 17)
!86 = !DILocation(line: 77, column: 17, scope: !78)
!87 = !DILocation(line: 78, column: 25, scope: !78)
!88 = !DILocation(line: 78, column: 36, scope: !78)
!89 = !DILocation(line: 79, column: 43, scope: !78)
!90 = !DILocation(line: 79, column: 25, scope: !78)
!91 = !DILocation(line: 79, column: 34, scope: !78)
!92 = !DILocation(line: 79, column: 41, scope: !78)
!93 = !DILocation(line: 80, column: 25, scope: !78)
!94 = !DILocation(line: 80, column: 34, scope: !78)
!95 = !DILocation(line: 81, column: 29, scope: !96)
!96 = distinct !DILexicalBlock(scope: !78, file: !30, line: 81, column: 21)
!97 = !DILocation(line: 81, column: 44, scope: !96)
!98 = !DILocation(line: 81, column: 21, scope: !96)
!99 = !DILocation(line: 81, column: 89, scope: !96)
!100 = !DILocation(line: 81, column: 21, scope: !78)
!101 = !DILocation(line: 83, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !96, file: !30, line: 82, column: 17)
!103 = !DILocation(line: 87, column: 35, scope: !78)
!104 = !DILocation(line: 87, column: 50, scope: !78)
!105 = !DILocation(line: 87, column: 30, scope: !78)
!106 = !DILocation(line: 87, column: 28, scope: !78)
!107 = !DILocation(line: 88, column: 21, scope: !108)
!108 = distinct !DILexicalBlock(scope: !78, file: !30, line: 88, column: 21)
!109 = !DILocation(line: 88, column: 32, scope: !108)
!110 = !DILocation(line: 88, column: 48, scope: !108)
!111 = !DILocation(line: 88, column: 51, scope: !108)
!112 = !DILocation(line: 88, column: 62, scope: !108)
!113 = !DILocation(line: 88, column: 21, scope: !78)
!114 = !DILocation(line: 90, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !30, line: 89, column: 17)
!116 = !DILocation(line: 93, column: 29, scope: !78)
!117 = !DILocation(line: 93, column: 17, scope: !78)
!118 = !DILocation(line: 93, column: 41, scope: !78)
!119 = !DILocation(line: 95, column: 29, scope: !78)
!120 = !DILocation(line: 95, column: 24, scope: !78)
!121 = !DILocation(line: 95, column: 22, scope: !78)
!122 = !DILocation(line: 96, column: 13, scope: !78)
!123 = !DILocation(line: 98, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !49, file: !30, line: 98, column: 17)
!125 = !DILocation(line: 98, column: 31, scope: !124)
!126 = !DILocation(line: 98, column: 17, scope: !49)
!127 = !DILocation(line: 100, column: 30, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !30, line: 99, column: 13)
!129 = !DILocation(line: 100, column: 17, scope: !128)
!130 = !DILocation(line: 101, column: 13, scope: !128)
!131 = !DILocation(line: 109, column: 21, scope: !44)
!132 = !DILocation(line: 109, column: 10, scope: !44)
!133 = !DILocation(line: 109, column: 19, scope: !44)
!134 = !DILocalVariable(name: "data", scope: !135, file: !30, line: 112, type: !35)
!135 = distinct !DILexicalBlock(scope: !29, file: !30, line: 111, column: 5)
!136 = !DILocation(line: 112, column: 13, scope: !135)
!137 = !DILocation(line: 112, column: 21, scope: !135)
!138 = !DILocation(line: 112, column: 20, scope: !135)
!139 = !DILocalVariable(name: "buffer", scope: !140, file: !30, line: 114, type: !141)
!140 = distinct !DILexicalBlock(scope: !135, file: !30, line: 113, column: 9)
!141 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !142)
!142 = !{!143}
!143 = !DISubrange(count: 10)
!144 = !DILocation(line: 114, column: 17, scope: !140)
!145 = !DILocation(line: 117, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !140, file: !30, line: 117, column: 17)
!147 = !DILocation(line: 117, column: 22, scope: !146)
!148 = !DILocation(line: 117, column: 17, scope: !140)
!149 = !DILocation(line: 119, column: 37, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !30, line: 118, column: 13)
!151 = !DILocation(line: 119, column: 30, scope: !150)
!152 = !DILocation(line: 119, column: 17, scope: !150)
!153 = !DILocation(line: 120, column: 13, scope: !150)
!154 = !DILocation(line: 123, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !146, file: !30, line: 122, column: 13)
!156 = !DILocation(line: 127, column: 1, scope: !29)
!157 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_32_good", scope: !30, file: !30, line: 251, type: !31, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!158 = !DILocation(line: 253, column: 5, scope: !157)
!159 = !DILocation(line: 254, column: 5, scope: !157)
!160 = !DILocation(line: 255, column: 1, scope: !157)
!161 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 265, type: !162, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!162 = !DISubroutineType(types: !163)
!163 = !{!35, !35, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!166 = !DILocalVariable(name: "argc", arg: 1, scope: !161, file: !30, line: 265, type: !35)
!167 = !DILocation(line: 265, column: 14, scope: !161)
!168 = !DILocalVariable(name: "argv", arg: 2, scope: !161, file: !30, line: 265, type: !164)
!169 = !DILocation(line: 265, column: 27, scope: !161)
!170 = !DILocation(line: 268, column: 22, scope: !161)
!171 = !DILocation(line: 268, column: 12, scope: !161)
!172 = !DILocation(line: 268, column: 5, scope: !161)
!173 = !DILocation(line: 270, column: 5, scope: !161)
!174 = !DILocation(line: 271, column: 5, scope: !161)
!175 = !DILocation(line: 272, column: 5, scope: !161)
!176 = !DILocation(line: 275, column: 5, scope: !161)
!177 = !DILocation(line: 276, column: 5, scope: !161)
!178 = !DILocation(line: 277, column: 5, scope: !161)
!179 = !DILocation(line: 279, column: 5, scope: !161)
!180 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 134, type: !31, scopeLine: 135, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!181 = !DILocalVariable(name: "data", scope: !180, file: !30, line: 136, type: !35)
!182 = !DILocation(line: 136, column: 9, scope: !180)
!183 = !DILocalVariable(name: "dataPtr1", scope: !180, file: !30, line: 137, type: !38)
!184 = !DILocation(line: 137, column: 10, scope: !180)
!185 = !DILocalVariable(name: "dataPtr2", scope: !180, file: !30, line: 138, type: !38)
!186 = !DILocation(line: 138, column: 10, scope: !180)
!187 = !DILocation(line: 140, column: 10, scope: !180)
!188 = !DILocalVariable(name: "data", scope: !189, file: !30, line: 142, type: !35)
!189 = distinct !DILexicalBlock(scope: !180, file: !30, line: 141, column: 5)
!190 = !DILocation(line: 142, column: 13, scope: !189)
!191 = !DILocation(line: 142, column: 21, scope: !189)
!192 = !DILocation(line: 142, column: 20, scope: !189)
!193 = !DILocation(line: 145, column: 14, scope: !189)
!194 = !DILocation(line: 146, column: 21, scope: !189)
!195 = !DILocation(line: 146, column: 10, scope: !189)
!196 = !DILocation(line: 146, column: 19, scope: !189)
!197 = !DILocalVariable(name: "data", scope: !198, file: !30, line: 149, type: !35)
!198 = distinct !DILexicalBlock(scope: !180, file: !30, line: 148, column: 5)
!199 = !DILocation(line: 149, column: 13, scope: !198)
!200 = !DILocation(line: 149, column: 21, scope: !198)
!201 = !DILocation(line: 149, column: 20, scope: !198)
!202 = !DILocalVariable(name: "buffer", scope: !203, file: !30, line: 151, type: !141)
!203 = distinct !DILexicalBlock(scope: !198, file: !30, line: 150, column: 9)
!204 = !DILocation(line: 151, column: 17, scope: !203)
!205 = !DILocation(line: 154, column: 17, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !30, line: 154, column: 17)
!207 = !DILocation(line: 154, column: 22, scope: !206)
!208 = !DILocation(line: 154, column: 17, scope: !203)
!209 = !DILocation(line: 156, column: 37, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !30, line: 155, column: 13)
!211 = !DILocation(line: 156, column: 30, scope: !210)
!212 = !DILocation(line: 156, column: 17, scope: !210)
!213 = !DILocation(line: 157, column: 13, scope: !210)
!214 = !DILocation(line: 160, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !206, file: !30, line: 159, column: 13)
!216 = !DILocation(line: 164, column: 1, scope: !180)
!217 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 167, type: !31, scopeLine: 168, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!218 = !DILocalVariable(name: "data", scope: !217, file: !30, line: 169, type: !35)
!219 = !DILocation(line: 169, column: 9, scope: !217)
!220 = !DILocalVariable(name: "dataPtr1", scope: !217, file: !30, line: 170, type: !38)
!221 = !DILocation(line: 170, column: 10, scope: !217)
!222 = !DILocalVariable(name: "dataPtr2", scope: !217, file: !30, line: 171, type: !38)
!223 = !DILocation(line: 171, column: 10, scope: !217)
!224 = !DILocation(line: 173, column: 10, scope: !217)
!225 = !DILocalVariable(name: "data", scope: !226, file: !30, line: 175, type: !35)
!226 = distinct !DILexicalBlock(scope: !217, file: !30, line: 174, column: 5)
!227 = !DILocation(line: 175, column: 13, scope: !226)
!228 = !DILocation(line: 175, column: 21, scope: !226)
!229 = !DILocation(line: 175, column: 20, scope: !226)
!230 = !DILocalVariable(name: "recvResult", scope: !231, file: !30, line: 181, type: !35)
!231 = distinct !DILexicalBlock(scope: !226, file: !30, line: 176, column: 9)
!232 = !DILocation(line: 181, column: 17, scope: !231)
!233 = !DILocalVariable(name: "service", scope: !231, file: !30, line: 182, type: !52)
!234 = !DILocation(line: 182, column: 32, scope: !231)
!235 = !DILocalVariable(name: "connectSocket", scope: !231, file: !30, line: 183, type: !35)
!236 = !DILocation(line: 183, column: 20, scope: !231)
!237 = !DILocalVariable(name: "inputBuffer", scope: !231, file: !30, line: 184, type: !17)
!238 = !DILocation(line: 184, column: 18, scope: !231)
!239 = !DILocation(line: 185, column: 13, scope: !231)
!240 = !DILocation(line: 195, column: 33, scope: !241)
!241 = distinct !DILexicalBlock(scope: !231, file: !30, line: 186, column: 13)
!242 = !DILocation(line: 195, column: 31, scope: !241)
!243 = !DILocation(line: 196, column: 21, scope: !244)
!244 = distinct !DILexicalBlock(scope: !241, file: !30, line: 196, column: 21)
!245 = !DILocation(line: 196, column: 35, scope: !244)
!246 = !DILocation(line: 196, column: 21, scope: !241)
!247 = !DILocation(line: 198, column: 21, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !30, line: 197, column: 17)
!249 = !DILocation(line: 200, column: 17, scope: !241)
!250 = !DILocation(line: 201, column: 25, scope: !241)
!251 = !DILocation(line: 201, column: 36, scope: !241)
!252 = !DILocation(line: 202, column: 43, scope: !241)
!253 = !DILocation(line: 202, column: 25, scope: !241)
!254 = !DILocation(line: 202, column: 34, scope: !241)
!255 = !DILocation(line: 202, column: 41, scope: !241)
!256 = !DILocation(line: 203, column: 25, scope: !241)
!257 = !DILocation(line: 203, column: 34, scope: !241)
!258 = !DILocation(line: 204, column: 29, scope: !259)
!259 = distinct !DILexicalBlock(scope: !241, file: !30, line: 204, column: 21)
!260 = !DILocation(line: 204, column: 44, scope: !259)
!261 = !DILocation(line: 204, column: 21, scope: !259)
!262 = !DILocation(line: 204, column: 89, scope: !259)
!263 = !DILocation(line: 204, column: 21, scope: !241)
!264 = !DILocation(line: 206, column: 21, scope: !265)
!265 = distinct !DILexicalBlock(scope: !259, file: !30, line: 205, column: 17)
!266 = !DILocation(line: 210, column: 35, scope: !241)
!267 = !DILocation(line: 210, column: 50, scope: !241)
!268 = !DILocation(line: 210, column: 30, scope: !241)
!269 = !DILocation(line: 210, column: 28, scope: !241)
!270 = !DILocation(line: 211, column: 21, scope: !271)
!271 = distinct !DILexicalBlock(scope: !241, file: !30, line: 211, column: 21)
!272 = !DILocation(line: 211, column: 32, scope: !271)
!273 = !DILocation(line: 211, column: 48, scope: !271)
!274 = !DILocation(line: 211, column: 51, scope: !271)
!275 = !DILocation(line: 211, column: 62, scope: !271)
!276 = !DILocation(line: 211, column: 21, scope: !241)
!277 = !DILocation(line: 213, column: 21, scope: !278)
!278 = distinct !DILexicalBlock(scope: !271, file: !30, line: 212, column: 17)
!279 = !DILocation(line: 216, column: 29, scope: !241)
!280 = !DILocation(line: 216, column: 17, scope: !241)
!281 = !DILocation(line: 216, column: 41, scope: !241)
!282 = !DILocation(line: 218, column: 29, scope: !241)
!283 = !DILocation(line: 218, column: 24, scope: !241)
!284 = !DILocation(line: 218, column: 22, scope: !241)
!285 = !DILocation(line: 219, column: 13, scope: !241)
!286 = !DILocation(line: 221, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !231, file: !30, line: 221, column: 17)
!288 = !DILocation(line: 221, column: 31, scope: !287)
!289 = !DILocation(line: 221, column: 17, scope: !231)
!290 = !DILocation(line: 223, column: 30, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !30, line: 222, column: 13)
!292 = !DILocation(line: 223, column: 17, scope: !291)
!293 = !DILocation(line: 224, column: 13, scope: !291)
!294 = !DILocation(line: 232, column: 21, scope: !226)
!295 = !DILocation(line: 232, column: 10, scope: !226)
!296 = !DILocation(line: 232, column: 19, scope: !226)
!297 = !DILocalVariable(name: "data", scope: !298, file: !30, line: 235, type: !35)
!298 = distinct !DILexicalBlock(scope: !217, file: !30, line: 234, column: 5)
!299 = !DILocation(line: 235, column: 13, scope: !298)
!300 = !DILocation(line: 235, column: 21, scope: !298)
!301 = !DILocation(line: 235, column: 20, scope: !298)
!302 = !DILocalVariable(name: "buffer", scope: !303, file: !30, line: 237, type: !141)
!303 = distinct !DILexicalBlock(scope: !298, file: !30, line: 236, column: 9)
!304 = !DILocation(line: 237, column: 17, scope: !303)
!305 = !DILocation(line: 239, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !303, file: !30, line: 239, column: 17)
!307 = !DILocation(line: 239, column: 22, scope: !306)
!308 = !DILocation(line: 239, column: 27, scope: !306)
!309 = !DILocation(line: 239, column: 30, scope: !306)
!310 = !DILocation(line: 239, column: 35, scope: !306)
!311 = !DILocation(line: 239, column: 17, scope: !303)
!312 = !DILocation(line: 241, column: 37, scope: !313)
!313 = distinct !DILexicalBlock(scope: !306, file: !30, line: 240, column: 13)
!314 = !DILocation(line: 241, column: 30, scope: !313)
!315 = !DILocation(line: 241, column: 17, scope: !313)
!316 = !DILocation(line: 242, column: 13, scope: !313)
!317 = !DILocation(line: 245, column: 17, scope: !318)
!318 = distinct !DILexicalBlock(scope: !306, file: !30, line: 244, column: 13)
!319 = !DILocation(line: 249, column: 1, scope: !217)
