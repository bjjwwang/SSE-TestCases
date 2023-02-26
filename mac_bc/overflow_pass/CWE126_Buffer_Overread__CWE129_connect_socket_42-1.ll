; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_42-1.c"
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
@.str.5 = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_42_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  store i32 -1, i32* %data, align 4, !dbg !37
  %0 = load i32, i32* %data, align 4, !dbg !38
  %call = call i32 @badSource(i32 noundef %0), !dbg !39
  store i32 %call, i32* %data, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !41, metadata !DIExpression()), !dbg !46
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !46
  %2 = load i32, i32* %data, align 4, !dbg !47
  %cmp = icmp sge i32 %2, 0, !dbg !49
  br i1 %cmp, label %if.then, label %if.else, !dbg !50

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !51
  %idxprom = sext i32 %3 to i64, !dbg !53
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !53
  %4 = load i32, i32* %arrayidx, align 4, !dbg !53
  call void @printIntLine(i32 noundef %4), !dbg !54
  br label %if.end, !dbg !55

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !56
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @badSource(i32 noundef %data) #0 !dbg !59 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !64, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !67, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !88, metadata !DIExpression()), !dbg !89
  store i32 -1, i32* %connectSocket, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  br label %do.body, !dbg !92

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !93
  store i32 %call, i32* %connectSocket, align 4, !dbg !95
  %0 = load i32, i32* %connectSocket, align 4, !dbg !96
  %cmp = icmp eq i32 %0, -1, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !100

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !102
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !103
  store i8 2, i8* %sin_family, align 1, !dbg !104
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0)), !dbg !105
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !106
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !107
  store i32 %call1, i32* %s_addr, align 4, !dbg !108
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !109
  store i16 -30871, i16* %sin_port, align 2, !dbg !110
  %2 = load i32, i32* %connectSocket, align 4, !dbg !111
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !113
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !114
  %cmp3 = icmp eq i32 %call2, -1, !dbg !115
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !116

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !117

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !119
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !120
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !121
  %conv = trunc i64 %call6 to i32, !dbg !121
  store i32 %conv, i32* %recvResult, align 4, !dbg !122
  %5 = load i32, i32* %recvResult, align 4, !dbg !123
  %cmp7 = icmp eq i32 %5, -1, !dbg !125
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !126

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !127
  %cmp9 = icmp eq i32 %6, 0, !dbg !128
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !129

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !130

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !132
  %idxprom = sext i32 %7 to i64, !dbg !133
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !134
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !135
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !136
  store i32 %call14, i32* %data.addr, align 4, !dbg !137
  br label %do.end, !dbg !138

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !139
  %cmp15 = icmp ne i32 %8, -1, !dbg !141
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !142

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !143
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !145
  br label %if.end19, !dbg !146

if.end19:                                         ; preds = %if.then17, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !147
  ret i32 %10, !dbg !148
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_42_good() #0 !dbg !149 {
entry:
  call void @goodB2G(), !dbg !150
  call void @goodG2B(), !dbg !151
  ret void, !dbg !152
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !153 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !158, metadata !DIExpression()), !dbg !159
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !160, metadata !DIExpression()), !dbg !161
  %call = call i64 @time(i64* noundef null), !dbg !162
  %conv = trunc i64 %call to i32, !dbg !163
  call void @srand(i32 noundef %conv), !dbg !164
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !165
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_42_good(), !dbg !166
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !167
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !168
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_42_bad(), !dbg !169
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !170
  ret i32 0, !dbg !171
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @inet_addr(i8* noundef) #3

declare i32 @"\01_connect"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #3

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #3

declare i32 @atoi(i8* noundef) #3

declare i32 @"\01_close"(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !172 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !173, metadata !DIExpression()), !dbg !174
  store i32 -1, i32* %data, align 4, !dbg !175
  %0 = load i32, i32* %data, align 4, !dbg !176
  %call = call i32 @goodB2GSource(i32 noundef %0), !dbg !177
  store i32 %call, i32* %data, align 4, !dbg !178
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !179, metadata !DIExpression()), !dbg !181
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !181
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !181
  %2 = load i32, i32* %data, align 4, !dbg !182
  %cmp = icmp sge i32 %2, 0, !dbg !184
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !185

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !186
  %cmp1 = icmp slt i32 %3, 10, !dbg !187
  br i1 %cmp1, label %if.then, label %if.else, !dbg !188

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !189
  %idxprom = sext i32 %4 to i64, !dbg !191
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !191
  %5 = load i32, i32* %arrayidx, align 4, !dbg !191
  call void @printIntLine(i32 noundef %5), !dbg !192
  br label %if.end, !dbg !193

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !194
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !196
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodB2GSource(i32 noundef %data) #0 !dbg !197 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !198, metadata !DIExpression()), !dbg !199
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !200, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !205, metadata !DIExpression()), !dbg !206
  store i32 -1, i32* %connectSocket, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !207, metadata !DIExpression()), !dbg !208
  br label %do.body, !dbg !209

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !210
  store i32 %call, i32* %connectSocket, align 4, !dbg !212
  %0 = load i32, i32* %connectSocket, align 4, !dbg !213
  %cmp = icmp eq i32 %0, -1, !dbg !215
  br i1 %cmp, label %if.then, label %if.end, !dbg !216

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !217

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !219
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !219
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !220
  store i8 2, i8* %sin_family, align 1, !dbg !221
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i64 0, i64 0)), !dbg !222
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !223
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !224
  store i32 %call1, i32* %s_addr, align 4, !dbg !225
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !226
  store i16 -30871, i16* %sin_port, align 2, !dbg !227
  %2 = load i32, i32* %connectSocket, align 4, !dbg !228
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !230
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !231
  %cmp3 = icmp eq i32 %call2, -1, !dbg !232
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !233

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !234

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !236
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !237
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !238
  %conv = trunc i64 %call6 to i32, !dbg !238
  store i32 %conv, i32* %recvResult, align 4, !dbg !239
  %5 = load i32, i32* %recvResult, align 4, !dbg !240
  %cmp7 = icmp eq i32 %5, -1, !dbg !242
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !243

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !244
  %cmp9 = icmp eq i32 %6, 0, !dbg !245
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !246

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !247

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !249
  %idxprom = sext i32 %7 to i64, !dbg !250
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !250
  store i8 0, i8* %arrayidx, align 1, !dbg !251
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !252
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !253
  store i32 %call14, i32* %data.addr, align 4, !dbg !254
  br label %do.end, !dbg !255

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !256
  %cmp15 = icmp ne i32 %8, -1, !dbg !258
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !259

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !260
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !262
  br label %if.end19, !dbg !263

if.end19:                                         ; preds = %if.then17, %do.end
  %10 = load i32, i32* %data.addr, align 4, !dbg !264
  ret i32 %10, !dbg !265
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !266 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !267, metadata !DIExpression()), !dbg !268
  store i32 -1, i32* %data, align 4, !dbg !269
  %0 = load i32, i32* %data, align 4, !dbg !270
  %call = call i32 @goodG2BSource(i32 noundef %0), !dbg !271
  store i32 %call, i32* %data, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !273, metadata !DIExpression()), !dbg !275
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !275
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !275
  %2 = load i32, i32* %data, align 4, !dbg !276
  %cmp = icmp sge i32 %2, 0, !dbg !278
  br i1 %cmp, label %if.then, label %if.else, !dbg !279

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !280
  %idxprom = sext i32 %3 to i64, !dbg !282
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !282
  %4 = load i32, i32* %arrayidx, align 4, !dbg !282
  call void @printIntLine(i32 noundef %4), !dbg !283
  br label %if.end, !dbg !284

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !285
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !287
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodG2BSource(i32 noundef %data) #0 !dbg !288 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !289, metadata !DIExpression()), !dbg !290
  store i32 7, i32* %data.addr, align 4, !dbg !291
  %0 = load i32, i32* %data.addr, align 4, !dbg !292
  ret i32 %0, !dbg !293
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4, !7}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !5, line: 45, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!6 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !9, line: 412, size: 128, elements: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!10 = !{!11, !14, !17}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !8, file: !9, line: 413, baseType: !12, size: 8)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !5, line: 43, baseType: !13)
!13 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !8, file: !9, line: 414, baseType: !15, size: 8, offset: 8)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !16, line: 31, baseType: !12)
!16 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!17 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !8, file: !9, line: 415, baseType: !18, size: 112, offset: 16)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 112, elements: !20)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{!21}
!21 = !DISubrange(count: 14)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"uwtable", i32 1}
!27 = !{i32 7, !"frame-pointer", i32 2}
!28 = !{!"Homebrew clang version 14.0.6"}
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_42_bad", scope: !30, file: !30, line: 105, type: !31, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 107, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 107, column: 9, scope: !29)
!37 = !DILocation(line: 109, column: 10, scope: !29)
!38 = !DILocation(line: 110, column: 22, scope: !29)
!39 = !DILocation(line: 110, column: 12, scope: !29)
!40 = !DILocation(line: 110, column: 10, scope: !29)
!41 = !DILocalVariable(name: "buffer", scope: !42, file: !30, line: 112, type: !43)
!42 = distinct !DILexicalBlock(scope: !29, file: !30, line: 111, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 10)
!46 = !DILocation(line: 112, column: 13, scope: !42)
!47 = !DILocation(line: 115, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !30, line: 115, column: 13)
!49 = !DILocation(line: 115, column: 18, scope: !48)
!50 = !DILocation(line: 115, column: 13, scope: !42)
!51 = !DILocation(line: 117, column: 33, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !30, line: 116, column: 9)
!53 = !DILocation(line: 117, column: 26, scope: !52)
!54 = !DILocation(line: 117, column: 13, scope: !52)
!55 = !DILocation(line: 118, column: 9, scope: !52)
!56 = !DILocation(line: 121, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !48, file: !30, line: 120, column: 9)
!58 = !DILocation(line: 124, column: 1, scope: !29)
!59 = distinct !DISubprogram(name: "badSource", scope: !30, file: !30, line: 44, type: !60, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!60 = !DISubroutineType(types: !61)
!61 = !{!35, !35}
!62 = !DILocalVariable(name: "data", arg: 1, scope: !59, file: !30, line: 44, type: !35)
!63 = !DILocation(line: 44, column: 26, scope: !59)
!64 = !DILocalVariable(name: "recvResult", scope: !65, file: !30, line: 51, type: !35)
!65 = distinct !DILexicalBlock(scope: !59, file: !30, line: 46, column: 5)
!66 = !DILocation(line: 51, column: 13, scope: !65)
!67 = !DILocalVariable(name: "service", scope: !65, file: !30, line: 52, type: !68)
!68 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !69, line: 375, size: 128, elements: !70)
!69 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!70 = !{!71, !72, !73, !76, !83}
!71 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !68, file: !69, line: 376, baseType: !12, size: 8)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !68, file: !69, line: 377, baseType: !15, size: 8, offset: 8)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !68, file: !69, line: 378, baseType: !74, size: 16, offset: 16)
!74 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !75, line: 31, baseType: !4)
!75 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!76 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !68, file: !69, line: 379, baseType: !77, size: 32, offset: 32)
!77 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !69, line: 301, size: 32, elements: !78)
!78 = !{!79}
!79 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !77, file: !69, line: 302, baseType: !80, size: 32)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !81, line: 31, baseType: !82)
!81 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !5, line: 47, baseType: !3)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !68, file: !69, line: 380, baseType: !84, size: 64, offset: 64)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 64, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 8)
!87 = !DILocation(line: 52, column: 28, scope: !65)
!88 = !DILocalVariable(name: "connectSocket", scope: !65, file: !30, line: 53, type: !35)
!89 = !DILocation(line: 53, column: 16, scope: !65)
!90 = !DILocalVariable(name: "inputBuffer", scope: !65, file: !30, line: 54, type: !18)
!91 = !DILocation(line: 54, column: 14, scope: !65)
!92 = !DILocation(line: 55, column: 9, scope: !65)
!93 = !DILocation(line: 65, column: 29, scope: !94)
!94 = distinct !DILexicalBlock(scope: !65, file: !30, line: 56, column: 9)
!95 = !DILocation(line: 65, column: 27, scope: !94)
!96 = !DILocation(line: 66, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !30, line: 66, column: 17)
!98 = !DILocation(line: 66, column: 31, scope: !97)
!99 = !DILocation(line: 66, column: 17, scope: !94)
!100 = !DILocation(line: 68, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !30, line: 67, column: 13)
!102 = !DILocation(line: 70, column: 13, scope: !94)
!103 = !DILocation(line: 71, column: 21, scope: !94)
!104 = !DILocation(line: 71, column: 32, scope: !94)
!105 = !DILocation(line: 72, column: 39, scope: !94)
!106 = !DILocation(line: 72, column: 21, scope: !94)
!107 = !DILocation(line: 72, column: 30, scope: !94)
!108 = !DILocation(line: 72, column: 37, scope: !94)
!109 = !DILocation(line: 73, column: 21, scope: !94)
!110 = !DILocation(line: 73, column: 30, scope: !94)
!111 = !DILocation(line: 74, column: 25, scope: !112)
!112 = distinct !DILexicalBlock(scope: !94, file: !30, line: 74, column: 17)
!113 = !DILocation(line: 74, column: 40, scope: !112)
!114 = !DILocation(line: 74, column: 17, scope: !112)
!115 = !DILocation(line: 74, column: 85, scope: !112)
!116 = !DILocation(line: 74, column: 17, scope: !94)
!117 = !DILocation(line: 76, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !30, line: 75, column: 13)
!119 = !DILocation(line: 80, column: 31, scope: !94)
!120 = !DILocation(line: 80, column: 46, scope: !94)
!121 = !DILocation(line: 80, column: 26, scope: !94)
!122 = !DILocation(line: 80, column: 24, scope: !94)
!123 = !DILocation(line: 81, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !94, file: !30, line: 81, column: 17)
!125 = !DILocation(line: 81, column: 28, scope: !124)
!126 = !DILocation(line: 81, column: 44, scope: !124)
!127 = !DILocation(line: 81, column: 47, scope: !124)
!128 = !DILocation(line: 81, column: 58, scope: !124)
!129 = !DILocation(line: 81, column: 17, scope: !94)
!130 = !DILocation(line: 83, column: 17, scope: !131)
!131 = distinct !DILexicalBlock(scope: !124, file: !30, line: 82, column: 13)
!132 = !DILocation(line: 86, column: 25, scope: !94)
!133 = !DILocation(line: 86, column: 13, scope: !94)
!134 = !DILocation(line: 86, column: 37, scope: !94)
!135 = !DILocation(line: 88, column: 25, scope: !94)
!136 = !DILocation(line: 88, column: 20, scope: !94)
!137 = !DILocation(line: 88, column: 18, scope: !94)
!138 = !DILocation(line: 89, column: 9, scope: !94)
!139 = !DILocation(line: 91, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !65, file: !30, line: 91, column: 13)
!141 = !DILocation(line: 91, column: 27, scope: !140)
!142 = !DILocation(line: 91, column: 13, scope: !65)
!143 = !DILocation(line: 93, column: 26, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !30, line: 92, column: 9)
!145 = !DILocation(line: 93, column: 13, scope: !144)
!146 = !DILocation(line: 94, column: 9, scope: !144)
!147 = !DILocation(line: 102, column: 12, scope: !59)
!148 = !DILocation(line: 102, column: 5, scope: !59)
!149 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_42_good", scope: !30, file: !30, line: 242, type: !31, scopeLine: 243, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!150 = !DILocation(line: 244, column: 5, scope: !149)
!151 = !DILocation(line: 245, column: 5, scope: !149)
!152 = !DILocation(line: 246, column: 1, scope: !149)
!153 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 257, type: !154, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!154 = !DISubroutineType(types: !155)
!155 = !{!35, !35, !156}
!156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !157, size: 64)
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!158 = !DILocalVariable(name: "argc", arg: 1, scope: !153, file: !30, line: 257, type: !35)
!159 = !DILocation(line: 257, column: 14, scope: !153)
!160 = !DILocalVariable(name: "argv", arg: 2, scope: !153, file: !30, line: 257, type: !156)
!161 = !DILocation(line: 257, column: 27, scope: !153)
!162 = !DILocation(line: 260, column: 22, scope: !153)
!163 = !DILocation(line: 260, column: 12, scope: !153)
!164 = !DILocation(line: 260, column: 5, scope: !153)
!165 = !DILocation(line: 262, column: 5, scope: !153)
!166 = !DILocation(line: 263, column: 5, scope: !153)
!167 = !DILocation(line: 264, column: 5, scope: !153)
!168 = !DILocation(line: 267, column: 5, scope: !153)
!169 = !DILocation(line: 268, column: 5, scope: !153)
!170 = !DILocation(line: 269, column: 5, scope: !153)
!171 = !DILocation(line: 271, column: 5, scope: !153)
!172 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 222, type: !31, scopeLine: 223, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!173 = !DILocalVariable(name: "data", scope: !172, file: !30, line: 224, type: !35)
!174 = !DILocation(line: 224, column: 9, scope: !172)
!175 = !DILocation(line: 226, column: 10, scope: !172)
!176 = !DILocation(line: 227, column: 26, scope: !172)
!177 = !DILocation(line: 227, column: 12, scope: !172)
!178 = !DILocation(line: 227, column: 10, scope: !172)
!179 = !DILocalVariable(name: "buffer", scope: !180, file: !30, line: 229, type: !43)
!180 = distinct !DILexicalBlock(scope: !172, file: !30, line: 228, column: 5)
!181 = !DILocation(line: 229, column: 13, scope: !180)
!182 = !DILocation(line: 231, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !180, file: !30, line: 231, column: 13)
!184 = !DILocation(line: 231, column: 18, scope: !183)
!185 = !DILocation(line: 231, column: 23, scope: !183)
!186 = !DILocation(line: 231, column: 26, scope: !183)
!187 = !DILocation(line: 231, column: 31, scope: !183)
!188 = !DILocation(line: 231, column: 13, scope: !180)
!189 = !DILocation(line: 233, column: 33, scope: !190)
!190 = distinct !DILexicalBlock(scope: !183, file: !30, line: 232, column: 9)
!191 = !DILocation(line: 233, column: 26, scope: !190)
!192 = !DILocation(line: 233, column: 13, scope: !190)
!193 = !DILocation(line: 234, column: 9, scope: !190)
!194 = !DILocation(line: 237, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !183, file: !30, line: 236, column: 9)
!196 = !DILocation(line: 240, column: 1, scope: !172)
!197 = distinct !DISubprogram(name: "goodB2GSource", scope: !30, file: !30, line: 161, type: !60, scopeLine: 162, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!198 = !DILocalVariable(name: "data", arg: 1, scope: !197, file: !30, line: 161, type: !35)
!199 = !DILocation(line: 161, column: 30, scope: !197)
!200 = !DILocalVariable(name: "recvResult", scope: !201, file: !30, line: 168, type: !35)
!201 = distinct !DILexicalBlock(scope: !197, file: !30, line: 163, column: 5)
!202 = !DILocation(line: 168, column: 13, scope: !201)
!203 = !DILocalVariable(name: "service", scope: !201, file: !30, line: 169, type: !68)
!204 = !DILocation(line: 169, column: 28, scope: !201)
!205 = !DILocalVariable(name: "connectSocket", scope: !201, file: !30, line: 170, type: !35)
!206 = !DILocation(line: 170, column: 16, scope: !201)
!207 = !DILocalVariable(name: "inputBuffer", scope: !201, file: !30, line: 171, type: !18)
!208 = !DILocation(line: 171, column: 14, scope: !201)
!209 = !DILocation(line: 172, column: 9, scope: !201)
!210 = !DILocation(line: 182, column: 29, scope: !211)
!211 = distinct !DILexicalBlock(scope: !201, file: !30, line: 173, column: 9)
!212 = !DILocation(line: 182, column: 27, scope: !211)
!213 = !DILocation(line: 183, column: 17, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !30, line: 183, column: 17)
!215 = !DILocation(line: 183, column: 31, scope: !214)
!216 = !DILocation(line: 183, column: 17, scope: !211)
!217 = !DILocation(line: 185, column: 17, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !30, line: 184, column: 13)
!219 = !DILocation(line: 187, column: 13, scope: !211)
!220 = !DILocation(line: 188, column: 21, scope: !211)
!221 = !DILocation(line: 188, column: 32, scope: !211)
!222 = !DILocation(line: 189, column: 39, scope: !211)
!223 = !DILocation(line: 189, column: 21, scope: !211)
!224 = !DILocation(line: 189, column: 30, scope: !211)
!225 = !DILocation(line: 189, column: 37, scope: !211)
!226 = !DILocation(line: 190, column: 21, scope: !211)
!227 = !DILocation(line: 190, column: 30, scope: !211)
!228 = !DILocation(line: 191, column: 25, scope: !229)
!229 = distinct !DILexicalBlock(scope: !211, file: !30, line: 191, column: 17)
!230 = !DILocation(line: 191, column: 40, scope: !229)
!231 = !DILocation(line: 191, column: 17, scope: !229)
!232 = !DILocation(line: 191, column: 85, scope: !229)
!233 = !DILocation(line: 191, column: 17, scope: !211)
!234 = !DILocation(line: 193, column: 17, scope: !235)
!235 = distinct !DILexicalBlock(scope: !229, file: !30, line: 192, column: 13)
!236 = !DILocation(line: 197, column: 31, scope: !211)
!237 = !DILocation(line: 197, column: 46, scope: !211)
!238 = !DILocation(line: 197, column: 26, scope: !211)
!239 = !DILocation(line: 197, column: 24, scope: !211)
!240 = !DILocation(line: 198, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !211, file: !30, line: 198, column: 17)
!242 = !DILocation(line: 198, column: 28, scope: !241)
!243 = !DILocation(line: 198, column: 44, scope: !241)
!244 = !DILocation(line: 198, column: 47, scope: !241)
!245 = !DILocation(line: 198, column: 58, scope: !241)
!246 = !DILocation(line: 198, column: 17, scope: !211)
!247 = !DILocation(line: 200, column: 17, scope: !248)
!248 = distinct !DILexicalBlock(scope: !241, file: !30, line: 199, column: 13)
!249 = !DILocation(line: 203, column: 25, scope: !211)
!250 = !DILocation(line: 203, column: 13, scope: !211)
!251 = !DILocation(line: 203, column: 37, scope: !211)
!252 = !DILocation(line: 205, column: 25, scope: !211)
!253 = !DILocation(line: 205, column: 20, scope: !211)
!254 = !DILocation(line: 205, column: 18, scope: !211)
!255 = !DILocation(line: 206, column: 9, scope: !211)
!256 = !DILocation(line: 208, column: 13, scope: !257)
!257 = distinct !DILexicalBlock(scope: !201, file: !30, line: 208, column: 13)
!258 = !DILocation(line: 208, column: 27, scope: !257)
!259 = !DILocation(line: 208, column: 13, scope: !201)
!260 = !DILocation(line: 210, column: 26, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !30, line: 209, column: 9)
!262 = !DILocation(line: 210, column: 13, scope: !261)
!263 = !DILocation(line: 211, column: 9, scope: !261)
!264 = !DILocation(line: 219, column: 12, scope: !197)
!265 = !DILocation(line: 219, column: 5, scope: !197)
!266 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 139, type: !31, scopeLine: 140, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!267 = !DILocalVariable(name: "data", scope: !266, file: !30, line: 141, type: !35)
!268 = !DILocation(line: 141, column: 9, scope: !266)
!269 = !DILocation(line: 143, column: 10, scope: !266)
!270 = !DILocation(line: 144, column: 26, scope: !266)
!271 = !DILocation(line: 144, column: 12, scope: !266)
!272 = !DILocation(line: 144, column: 10, scope: !266)
!273 = !DILocalVariable(name: "buffer", scope: !274, file: !30, line: 146, type: !43)
!274 = distinct !DILexicalBlock(scope: !266, file: !30, line: 145, column: 5)
!275 = !DILocation(line: 146, column: 13, scope: !274)
!276 = !DILocation(line: 149, column: 13, scope: !277)
!277 = distinct !DILexicalBlock(scope: !274, file: !30, line: 149, column: 13)
!278 = !DILocation(line: 149, column: 18, scope: !277)
!279 = !DILocation(line: 149, column: 13, scope: !274)
!280 = !DILocation(line: 151, column: 33, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !30, line: 150, column: 9)
!282 = !DILocation(line: 151, column: 26, scope: !281)
!283 = !DILocation(line: 151, column: 13, scope: !281)
!284 = !DILocation(line: 152, column: 9, scope: !281)
!285 = !DILocation(line: 155, column: 13, scope: !286)
!286 = distinct !DILexicalBlock(scope: !277, file: !30, line: 154, column: 9)
!287 = !DILocation(line: 158, column: 1, scope: !266)
!288 = distinct !DISubprogram(name: "goodG2BSource", scope: !30, file: !30, line: 131, type: !60, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!289 = !DILocalVariable(name: "data", arg: 1, scope: !288, file: !30, line: 131, type: !35)
!290 = !DILocation(line: 131, column: 30, scope: !288)
!291 = !DILocation(line: 135, column: 10, scope: !288)
!292 = !DILocation(line: 136, column: 12, scope: !288)
!293 = !DILocation(line: 136, column: 5, scope: !288)
