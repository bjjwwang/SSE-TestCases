; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_44-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_44-1.c"
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
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_44_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !37, metadata !DIExpression()), !dbg !41
  store void (i32)* @badSink, void (i32)** %funcPtr, align 8, !dbg !41
  store i32 -1, i32* %data, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !46, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 -1, i32* %connectSocket, align 4, !dbg !68
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  br label %do.body, !dbg !71

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !72
  store i32 %call, i32* %connectSocket, align 4, !dbg !74
  %0 = load i32, i32* %connectSocket, align 4, !dbg !75
  %cmp = icmp eq i32 %0, -1, !dbg !77
  br i1 %cmp, label %if.then, label %if.end, !dbg !78

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !79

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !81
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !82
  store i8 2, i8* %sin_family, align 1, !dbg !83
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !84
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !85
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !86
  store i32 %call1, i32* %s_addr, align 4, !dbg !87
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !88
  store i16 -30871, i16* %sin_port, align 2, !dbg !89
  %2 = load i32, i32* %connectSocket, align 4, !dbg !90
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !92
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !93
  %cmp3 = icmp eq i32 %call2, -1, !dbg !94
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !95

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !96

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !98
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !99
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !100
  %conv = trunc i64 %call6 to i32, !dbg !100
  store i32 %conv, i32* %recvResult, align 4, !dbg !101
  %5 = load i32, i32* %recvResult, align 4, !dbg !102
  %cmp7 = icmp eq i32 %5, -1, !dbg !104
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !105

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !106
  %cmp9 = icmp eq i32 %6, 0, !dbg !107
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !108

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !109

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !111
  %idxprom = sext i32 %7 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !114
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !115
  store i32 %call14, i32* %data, align 4, !dbg !116
  br label %do.end, !dbg !117

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !118
  %cmp15 = icmp ne i32 %8, -1, !dbg !120
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !121

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !122
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !124
  br label %if.end19, !dbg !125

if.end19:                                         ; preds = %if.then17, %do.end
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !126
  %11 = load i32, i32* %data, align 4, !dbg !127
  call void %10(i32 noundef %11), !dbg !126
  ret void, !dbg !128
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !129 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !132, metadata !DIExpression()), !dbg !137
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !137
  %1 = load i32, i32* %data.addr, align 4, !dbg !138
  %cmp = icmp sge i32 %1, 0, !dbg !140
  br i1 %cmp, label %if.then, label %if.else, !dbg !141

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !142
  %idxprom = sext i32 %2 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !144
  %3 = load i32, i32* %arrayidx, align 4, !dbg !144
  call void @printIntLine(i32 noundef %3), !dbg !145
  br label %if.end, !dbg !146

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !147
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !149
}

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @inet_addr(i8* noundef) #2

declare i32 @"\01_connect"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #2

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #2

declare i32 @atoi(i8* noundef) #2

declare i32 @"\01_close"(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_44_good() #0 !dbg !150 {
entry:
  call void @goodG2B(), !dbg !151
  call void @goodB2G(), !dbg !152
  ret void, !dbg !153
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !154 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !159, metadata !DIExpression()), !dbg !160
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !161, metadata !DIExpression()), !dbg !162
  %call = call i64 @time(i64* noundef null), !dbg !163
  %conv = trunc i64 %call to i32, !dbg !164
  call void @srand(i32 noundef %conv), !dbg !165
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !166
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_44_good(), !dbg !167
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !168
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !169
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_44_bad(), !dbg !170
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !171
  ret i32 0, !dbg !172
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !173 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !174, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !176, metadata !DIExpression()), !dbg !177
  store void (i32)* @goodG2BSink, void (i32)** %funcPtr, align 8, !dbg !177
  store i32 -1, i32* %data, align 4, !dbg !178
  store i32 7, i32* %data, align 4, !dbg !179
  %0 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !180
  %1 = load i32, i32* %data, align 4, !dbg !181
  call void %0(i32 noundef %1), !dbg !180
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !183 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !184, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !186, metadata !DIExpression()), !dbg !188
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !188
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !188
  %1 = load i32, i32* %data.addr, align 4, !dbg !189
  %cmp = icmp sge i32 %1, 0, !dbg !191
  br i1 %cmp, label %if.then, label %if.else, !dbg !192

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !193
  %idxprom = sext i32 %2 to i64, !dbg !195
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !195
  %3 = load i32, i32* %arrayidx, align 4, !dbg !195
  call void @printIntLine(i32 noundef %3), !dbg !196
  br label %if.end, !dbg !197

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !198
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !201 {
entry:
  %data = alloca i32, align 4
  %funcPtr = alloca void (i32)*, align 8
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !202, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata void (i32)** %funcPtr, metadata !204, metadata !DIExpression()), !dbg !205
  store void (i32)* @goodB2GSink, void (i32)** %funcPtr, align 8, !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !207, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !212, metadata !DIExpression()), !dbg !213
  store i32 -1, i32* %connectSocket, align 4, !dbg !213
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !214, metadata !DIExpression()), !dbg !215
  br label %do.body, !dbg !216

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !217
  store i32 %call, i32* %connectSocket, align 4, !dbg !219
  %0 = load i32, i32* %connectSocket, align 4, !dbg !220
  %cmp = icmp eq i32 %0, -1, !dbg !222
  br i1 %cmp, label %if.then, label %if.end, !dbg !223

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !224

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !226
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !226
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !227
  store i8 2, i8* %sin_family, align 1, !dbg !228
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !229
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !230
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !231
  store i32 %call1, i32* %s_addr, align 4, !dbg !232
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !233
  store i16 -30871, i16* %sin_port, align 2, !dbg !234
  %2 = load i32, i32* %connectSocket, align 4, !dbg !235
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !237
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !238
  %cmp3 = icmp eq i32 %call2, -1, !dbg !239
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !240

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !241

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !243
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !244
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !245
  %conv = trunc i64 %call6 to i32, !dbg !245
  store i32 %conv, i32* %recvResult, align 4, !dbg !246
  %5 = load i32, i32* %recvResult, align 4, !dbg !247
  %cmp7 = icmp eq i32 %5, -1, !dbg !249
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !250

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !251
  %cmp9 = icmp eq i32 %6, 0, !dbg !252
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !253

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !254

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !256
  %idxprom = sext i32 %7 to i64, !dbg !257
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !257
  store i8 0, i8* %arrayidx, align 1, !dbg !258
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !259
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !260
  store i32 %call14, i32* %data, align 4, !dbg !261
  br label %do.end, !dbg !262

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !263
  %cmp15 = icmp ne i32 %8, -1, !dbg !265
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !266

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !267
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !269
  br label %if.end19, !dbg !270

if.end19:                                         ; preds = %if.then17, %do.end
  %10 = load void (i32)*, void (i32)** %funcPtr, align 8, !dbg !271
  %11 = load i32, i32* %data, align 4, !dbg !272
  call void %10(i32 noundef %11), !dbg !271
  ret void, !dbg !273
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2GSink(i32 noundef %data) #0 !dbg !274 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !275, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !277, metadata !DIExpression()), !dbg !279
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !279
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !279
  %1 = load i32, i32* %data.addr, align 4, !dbg !280
  %cmp = icmp sge i32 %1, 0, !dbg !282
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !283

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %data.addr, align 4, !dbg !284
  %cmp1 = icmp slt i32 %2, 10, !dbg !285
  br i1 %cmp1, label %if.then, label %if.else, !dbg !286

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32, i32* %data.addr, align 4, !dbg !287
  %idxprom = sext i32 %3 to i64, !dbg !289
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !289
  %4 = load i32, i32* %arrayidx, align 4, !dbg !289
  call void @printIntLine(i32 noundef %4), !dbg !290
  br label %if.end, !dbg !291

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !292
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !294
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_44_bad", scope: !30, file: !30, line: 61, type: !31, scopeLine: 62, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_44-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 63, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 63, column: 9, scope: !29)
!37 = !DILocalVariable(name: "funcPtr", scope: !29, file: !30, line: 65, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DISubroutineType(types: !40)
!40 = !{null, !35}
!41 = !DILocation(line: 65, column: 12, scope: !29)
!42 = !DILocation(line: 67, column: 10, scope: !29)
!43 = !DILocalVariable(name: "recvResult", scope: !44, file: !30, line: 73, type: !35)
!44 = distinct !DILexicalBlock(scope: !29, file: !30, line: 68, column: 5)
!45 = !DILocation(line: 73, column: 13, scope: !44)
!46 = !DILocalVariable(name: "service", scope: !44, file: !30, line: 74, type: !47)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !48, line: 375, size: 128, elements: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!49 = !{!50, !51, !52, !55, !62}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !47, file: !48, line: 376, baseType: !11, size: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !47, file: !48, line: 377, baseType: !14, size: 8, offset: 8)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !47, file: !48, line: 378, baseType: !53, size: 16, offset: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !54, line: 31, baseType: !3)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !47, file: !48, line: 379, baseType: !56, size: 32, offset: 32)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !48, line: 301, size: 32, elements: !57)
!57 = !{!58}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !56, file: !48, line: 302, baseType: !59, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !60, line: 31, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !47, file: !48, line: 380, baseType: !63, size: 64, offset: 64)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 8)
!66 = !DILocation(line: 74, column: 28, scope: !44)
!67 = !DILocalVariable(name: "connectSocket", scope: !44, file: !30, line: 75, type: !35)
!68 = !DILocation(line: 75, column: 16, scope: !44)
!69 = !DILocalVariable(name: "inputBuffer", scope: !44, file: !30, line: 76, type: !17)
!70 = !DILocation(line: 76, column: 14, scope: !44)
!71 = !DILocation(line: 77, column: 9, scope: !44)
!72 = !DILocation(line: 87, column: 29, scope: !73)
!73 = distinct !DILexicalBlock(scope: !44, file: !30, line: 78, column: 9)
!74 = !DILocation(line: 87, column: 27, scope: !73)
!75 = !DILocation(line: 88, column: 17, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !30, line: 88, column: 17)
!77 = !DILocation(line: 88, column: 31, scope: !76)
!78 = !DILocation(line: 88, column: 17, scope: !73)
!79 = !DILocation(line: 90, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !30, line: 89, column: 13)
!81 = !DILocation(line: 92, column: 13, scope: !73)
!82 = !DILocation(line: 93, column: 21, scope: !73)
!83 = !DILocation(line: 93, column: 32, scope: !73)
!84 = !DILocation(line: 94, column: 39, scope: !73)
!85 = !DILocation(line: 94, column: 21, scope: !73)
!86 = !DILocation(line: 94, column: 30, scope: !73)
!87 = !DILocation(line: 94, column: 37, scope: !73)
!88 = !DILocation(line: 95, column: 21, scope: !73)
!89 = !DILocation(line: 95, column: 30, scope: !73)
!90 = !DILocation(line: 96, column: 25, scope: !91)
!91 = distinct !DILexicalBlock(scope: !73, file: !30, line: 96, column: 17)
!92 = !DILocation(line: 96, column: 40, scope: !91)
!93 = !DILocation(line: 96, column: 17, scope: !91)
!94 = !DILocation(line: 96, column: 85, scope: !91)
!95 = !DILocation(line: 96, column: 17, scope: !73)
!96 = !DILocation(line: 98, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !30, line: 97, column: 13)
!98 = !DILocation(line: 102, column: 31, scope: !73)
!99 = !DILocation(line: 102, column: 46, scope: !73)
!100 = !DILocation(line: 102, column: 26, scope: !73)
!101 = !DILocation(line: 102, column: 24, scope: !73)
!102 = !DILocation(line: 103, column: 17, scope: !103)
!103 = distinct !DILexicalBlock(scope: !73, file: !30, line: 103, column: 17)
!104 = !DILocation(line: 103, column: 28, scope: !103)
!105 = !DILocation(line: 103, column: 44, scope: !103)
!106 = !DILocation(line: 103, column: 47, scope: !103)
!107 = !DILocation(line: 103, column: 58, scope: !103)
!108 = !DILocation(line: 103, column: 17, scope: !73)
!109 = !DILocation(line: 105, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !30, line: 104, column: 13)
!111 = !DILocation(line: 108, column: 25, scope: !73)
!112 = !DILocation(line: 108, column: 13, scope: !73)
!113 = !DILocation(line: 108, column: 37, scope: !73)
!114 = !DILocation(line: 110, column: 25, scope: !73)
!115 = !DILocation(line: 110, column: 20, scope: !73)
!116 = !DILocation(line: 110, column: 18, scope: !73)
!117 = !DILocation(line: 111, column: 9, scope: !73)
!118 = !DILocation(line: 113, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !44, file: !30, line: 113, column: 13)
!120 = !DILocation(line: 113, column: 27, scope: !119)
!121 = !DILocation(line: 113, column: 13, scope: !44)
!122 = !DILocation(line: 115, column: 26, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !30, line: 114, column: 9)
!124 = !DILocation(line: 115, column: 13, scope: !123)
!125 = !DILocation(line: 116, column: 9, scope: !123)
!126 = !DILocation(line: 125, column: 5, scope: !29)
!127 = !DILocation(line: 125, column: 13, scope: !29)
!128 = !DILocation(line: 126, column: 1, scope: !29)
!129 = distinct !DISubprogram(name: "badSink", scope: !30, file: !30, line: 44, type: !39, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!130 = !DILocalVariable(name: "data", arg: 1, scope: !129, file: !30, line: 44, type: !35)
!131 = !DILocation(line: 44, column: 25, scope: !129)
!132 = !DILocalVariable(name: "buffer", scope: !133, file: !30, line: 47, type: !134)
!133 = distinct !DILexicalBlock(scope: !129, file: !30, line: 46, column: 5)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 10)
!137 = !DILocation(line: 47, column: 13, scope: !133)
!138 = !DILocation(line: 50, column: 13, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !30, line: 50, column: 13)
!140 = !DILocation(line: 50, column: 18, scope: !139)
!141 = !DILocation(line: 50, column: 13, scope: !133)
!142 = !DILocation(line: 52, column: 33, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !30, line: 51, column: 9)
!144 = !DILocation(line: 52, column: 26, scope: !143)
!145 = !DILocation(line: 52, column: 13, scope: !143)
!146 = !DILocation(line: 53, column: 9, scope: !143)
!147 = !DILocation(line: 56, column: 13, scope: !148)
!148 = distinct !DILexicalBlock(scope: !139, file: !30, line: 55, column: 9)
!149 = !DILocation(line: 59, column: 1, scope: !129)
!150 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_44_good", scope: !30, file: !30, line: 244, type: !31, scopeLine: 245, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!151 = !DILocation(line: 246, column: 5, scope: !150)
!152 = !DILocation(line: 247, column: 5, scope: !150)
!153 = !DILocation(line: 248, column: 1, scope: !150)
!154 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 258, type: !155, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!155 = !DISubroutineType(types: !156)
!156 = !{!35, !35, !157}
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!159 = !DILocalVariable(name: "argc", arg: 1, scope: !154, file: !30, line: 258, type: !35)
!160 = !DILocation(line: 258, column: 14, scope: !154)
!161 = !DILocalVariable(name: "argv", arg: 2, scope: !154, file: !30, line: 258, type: !157)
!162 = !DILocation(line: 258, column: 27, scope: !154)
!163 = !DILocation(line: 261, column: 22, scope: !154)
!164 = !DILocation(line: 261, column: 12, scope: !154)
!165 = !DILocation(line: 261, column: 5, scope: !154)
!166 = !DILocation(line: 263, column: 5, scope: !154)
!167 = !DILocation(line: 264, column: 5, scope: !154)
!168 = !DILocation(line: 265, column: 5, scope: !154)
!169 = !DILocation(line: 268, column: 5, scope: !154)
!170 = !DILocation(line: 269, column: 5, scope: !154)
!171 = !DILocation(line: 270, column: 5, scope: !154)
!172 = !DILocation(line: 272, column: 5, scope: !154)
!173 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 150, type: !31, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!174 = !DILocalVariable(name: "data", scope: !173, file: !30, line: 152, type: !35)
!175 = !DILocation(line: 152, column: 9, scope: !173)
!176 = !DILocalVariable(name: "funcPtr", scope: !173, file: !30, line: 153, type: !38)
!177 = !DILocation(line: 153, column: 12, scope: !173)
!178 = !DILocation(line: 155, column: 10, scope: !173)
!179 = !DILocation(line: 158, column: 10, scope: !173)
!180 = !DILocation(line: 159, column: 5, scope: !173)
!181 = !DILocation(line: 159, column: 13, scope: !173)
!182 = !DILocation(line: 160, column: 1, scope: !173)
!183 = distinct !DISubprogram(name: "goodG2BSink", scope: !30, file: !30, line: 133, type: !39, scopeLine: 134, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!184 = !DILocalVariable(name: "data", arg: 1, scope: !183, file: !30, line: 133, type: !35)
!185 = !DILocation(line: 133, column: 29, scope: !183)
!186 = !DILocalVariable(name: "buffer", scope: !187, file: !30, line: 136, type: !134)
!187 = distinct !DILexicalBlock(scope: !183, file: !30, line: 135, column: 5)
!188 = !DILocation(line: 136, column: 13, scope: !187)
!189 = !DILocation(line: 139, column: 13, scope: !190)
!190 = distinct !DILexicalBlock(scope: !187, file: !30, line: 139, column: 13)
!191 = !DILocation(line: 139, column: 18, scope: !190)
!192 = !DILocation(line: 139, column: 13, scope: !187)
!193 = !DILocation(line: 141, column: 33, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !30, line: 140, column: 9)
!195 = !DILocation(line: 141, column: 26, scope: !194)
!196 = !DILocation(line: 141, column: 13, scope: !194)
!197 = !DILocation(line: 142, column: 9, scope: !194)
!198 = !DILocation(line: 145, column: 13, scope: !199)
!199 = distinct !DILexicalBlock(scope: !190, file: !30, line: 144, column: 9)
!200 = !DILocation(line: 148, column: 1, scope: !183)
!201 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 179, type: !31, scopeLine: 180, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!202 = !DILocalVariable(name: "data", scope: !201, file: !30, line: 181, type: !35)
!203 = !DILocation(line: 181, column: 9, scope: !201)
!204 = !DILocalVariable(name: "funcPtr", scope: !201, file: !30, line: 182, type: !38)
!205 = !DILocation(line: 182, column: 12, scope: !201)
!206 = !DILocation(line: 184, column: 10, scope: !201)
!207 = !DILocalVariable(name: "recvResult", scope: !208, file: !30, line: 190, type: !35)
!208 = distinct !DILexicalBlock(scope: !201, file: !30, line: 185, column: 5)
!209 = !DILocation(line: 190, column: 13, scope: !208)
!210 = !DILocalVariable(name: "service", scope: !208, file: !30, line: 191, type: !47)
!211 = !DILocation(line: 191, column: 28, scope: !208)
!212 = !DILocalVariable(name: "connectSocket", scope: !208, file: !30, line: 192, type: !35)
!213 = !DILocation(line: 192, column: 16, scope: !208)
!214 = !DILocalVariable(name: "inputBuffer", scope: !208, file: !30, line: 193, type: !17)
!215 = !DILocation(line: 193, column: 14, scope: !208)
!216 = !DILocation(line: 194, column: 9, scope: !208)
!217 = !DILocation(line: 204, column: 29, scope: !218)
!218 = distinct !DILexicalBlock(scope: !208, file: !30, line: 195, column: 9)
!219 = !DILocation(line: 204, column: 27, scope: !218)
!220 = !DILocation(line: 205, column: 17, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !30, line: 205, column: 17)
!222 = !DILocation(line: 205, column: 31, scope: !221)
!223 = !DILocation(line: 205, column: 17, scope: !218)
!224 = !DILocation(line: 207, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !221, file: !30, line: 206, column: 13)
!226 = !DILocation(line: 209, column: 13, scope: !218)
!227 = !DILocation(line: 210, column: 21, scope: !218)
!228 = !DILocation(line: 210, column: 32, scope: !218)
!229 = !DILocation(line: 211, column: 39, scope: !218)
!230 = !DILocation(line: 211, column: 21, scope: !218)
!231 = !DILocation(line: 211, column: 30, scope: !218)
!232 = !DILocation(line: 211, column: 37, scope: !218)
!233 = !DILocation(line: 212, column: 21, scope: !218)
!234 = !DILocation(line: 212, column: 30, scope: !218)
!235 = !DILocation(line: 213, column: 25, scope: !236)
!236 = distinct !DILexicalBlock(scope: !218, file: !30, line: 213, column: 17)
!237 = !DILocation(line: 213, column: 40, scope: !236)
!238 = !DILocation(line: 213, column: 17, scope: !236)
!239 = !DILocation(line: 213, column: 85, scope: !236)
!240 = !DILocation(line: 213, column: 17, scope: !218)
!241 = !DILocation(line: 215, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !236, file: !30, line: 214, column: 13)
!243 = !DILocation(line: 219, column: 31, scope: !218)
!244 = !DILocation(line: 219, column: 46, scope: !218)
!245 = !DILocation(line: 219, column: 26, scope: !218)
!246 = !DILocation(line: 219, column: 24, scope: !218)
!247 = !DILocation(line: 220, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !218, file: !30, line: 220, column: 17)
!249 = !DILocation(line: 220, column: 28, scope: !248)
!250 = !DILocation(line: 220, column: 44, scope: !248)
!251 = !DILocation(line: 220, column: 47, scope: !248)
!252 = !DILocation(line: 220, column: 58, scope: !248)
!253 = !DILocation(line: 220, column: 17, scope: !218)
!254 = !DILocation(line: 222, column: 17, scope: !255)
!255 = distinct !DILexicalBlock(scope: !248, file: !30, line: 221, column: 13)
!256 = !DILocation(line: 225, column: 25, scope: !218)
!257 = !DILocation(line: 225, column: 13, scope: !218)
!258 = !DILocation(line: 225, column: 37, scope: !218)
!259 = !DILocation(line: 227, column: 25, scope: !218)
!260 = !DILocation(line: 227, column: 20, scope: !218)
!261 = !DILocation(line: 227, column: 18, scope: !218)
!262 = !DILocation(line: 228, column: 9, scope: !218)
!263 = !DILocation(line: 230, column: 13, scope: !264)
!264 = distinct !DILexicalBlock(scope: !208, file: !30, line: 230, column: 13)
!265 = !DILocation(line: 230, column: 27, scope: !264)
!266 = !DILocation(line: 230, column: 13, scope: !208)
!267 = !DILocation(line: 232, column: 26, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !30, line: 231, column: 9)
!269 = !DILocation(line: 232, column: 13, scope: !268)
!270 = !DILocation(line: 233, column: 9, scope: !268)
!271 = !DILocation(line: 241, column: 5, scope: !201)
!272 = !DILocation(line: 241, column: 13, scope: !201)
!273 = !DILocation(line: 242, column: 1, scope: !201)
!274 = distinct !DISubprogram(name: "goodB2GSink", scope: !30, file: !30, line: 163, type: !39, scopeLine: 164, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!275 = !DILocalVariable(name: "data", arg: 1, scope: !274, file: !30, line: 163, type: !35)
!276 = !DILocation(line: 163, column: 29, scope: !274)
!277 = !DILocalVariable(name: "buffer", scope: !278, file: !30, line: 166, type: !134)
!278 = distinct !DILexicalBlock(scope: !274, file: !30, line: 165, column: 5)
!279 = !DILocation(line: 166, column: 13, scope: !278)
!280 = !DILocation(line: 168, column: 13, scope: !281)
!281 = distinct !DILexicalBlock(scope: !278, file: !30, line: 168, column: 13)
!282 = !DILocation(line: 168, column: 18, scope: !281)
!283 = !DILocation(line: 168, column: 23, scope: !281)
!284 = !DILocation(line: 168, column: 26, scope: !281)
!285 = !DILocation(line: 168, column: 31, scope: !281)
!286 = !DILocation(line: 168, column: 13, scope: !278)
!287 = !DILocation(line: 170, column: 33, scope: !288)
!288 = distinct !DILexicalBlock(scope: !281, file: !30, line: 169, column: 9)
!289 = !DILocation(line: 170, column: 26, scope: !288)
!290 = !DILocation(line: 170, column: 13, scope: !288)
!291 = !DILocation(line: 171, column: 9, scope: !288)
!292 = !DILocation(line: 174, column: 13, scope: !293)
!293 = distinct !DILexicalBlock(scope: !281, file: !30, line: 173, column: 9)
!294 = !DILocation(line: 177, column: 1, scope: !274)
