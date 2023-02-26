; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_06-1.c"
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
define void @CWE126_Buffer_Overread__CWE129_connect_socket_06_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  store i32 -1, i32* %data, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !38, metadata !DIExpression()), !dbg !42
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !123, metadata !DIExpression()), !dbg !130
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !130
  %11 = load i32, i32* %data, align 4, !dbg !131
  %cmp20 = icmp sge i32 %11, 0, !dbg !133
  br i1 %cmp20, label %if.then22, label %if.else, !dbg !134

if.then22:                                        ; preds = %if.end19
  %12 = load i32, i32* %data, align 4, !dbg !135
  %idxprom23 = sext i32 %12 to i64, !dbg !137
  %arrayidx24 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom23, !dbg !137
  %13 = load i32, i32* %arrayidx24, align 4, !dbg !137
  call void @printIntLine(i32 noundef %13), !dbg !138
  br label %if.end25, !dbg !139

if.else:                                          ; preds = %if.end19
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !140
  br label %if.end25

if.end25:                                         ; preds = %if.else, %if.then22
  ret void, !dbg !142
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
define void @CWE126_Buffer_Overread__CWE129_connect_socket_06_good() #0 !dbg !143 {
entry:
  call void @goodB2G1(), !dbg !144
  call void @goodB2G2(), !dbg !145
  call void @goodG2B1(), !dbg !146
  call void @goodG2B2(), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !149 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !154, metadata !DIExpression()), !dbg !155
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !156, metadata !DIExpression()), !dbg !157
  %call = call i64 @time(i64* noundef null), !dbg !158
  %conv = trunc i64 %call to i32, !dbg !159
  call void @srand(i32 noundef %conv), !dbg !160
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !161
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_06_good(), !dbg !162
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !163
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !164
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_06_bad(), !dbg !165
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !166
  ret i32 0, !dbg !167
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !168 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 -1, i32* %data, align 4, !dbg !171
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !172, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !179, metadata !DIExpression()), !dbg !180
  store i32 -1, i32* %connectSocket, align 4, !dbg !180
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !181, metadata !DIExpression()), !dbg !182
  br label %do.body, !dbg !183

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !184
  store i32 %call, i32* %connectSocket, align 4, !dbg !186
  %0 = load i32, i32* %connectSocket, align 4, !dbg !187
  %cmp = icmp eq i32 %0, -1, !dbg !189
  br i1 %cmp, label %if.then, label %if.end, !dbg !190

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !191

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !193
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !194
  store i8 2, i8* %sin_family, align 1, !dbg !195
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !196
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !197
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !198
  store i32 %call1, i32* %s_addr, align 4, !dbg !199
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !200
  store i16 -30871, i16* %sin_port, align 2, !dbg !201
  %2 = load i32, i32* %connectSocket, align 4, !dbg !202
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !204
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !205
  %cmp3 = icmp eq i32 %call2, -1, !dbg !206
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !207

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !208

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !210
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !211
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !212
  %conv = trunc i64 %call6 to i32, !dbg !212
  store i32 %conv, i32* %recvResult, align 4, !dbg !213
  %5 = load i32, i32* %recvResult, align 4, !dbg !214
  %cmp7 = icmp eq i32 %5, -1, !dbg !216
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !217

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !218
  %cmp9 = icmp eq i32 %6, 0, !dbg !219
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !220

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !221

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !223
  %idxprom = sext i32 %7 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !224
  store i8 0, i8* %arrayidx, align 1, !dbg !225
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !226
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !227
  store i32 %call14, i32* %data, align 4, !dbg !228
  br label %do.end, !dbg !229

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !230
  %cmp15 = icmp ne i32 %8, -1, !dbg !232
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !233

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !234
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !236
  br label %if.end19, !dbg !237

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !238, metadata !DIExpression()), !dbg !242
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !242
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !242
  %11 = load i32, i32* %data, align 4, !dbg !243
  %cmp20 = icmp sge i32 %11, 0, !dbg !245
  br i1 %cmp20, label %land.lhs.true, label %if.else, !dbg !246

land.lhs.true:                                    ; preds = %if.end19
  %12 = load i32, i32* %data, align 4, !dbg !247
  %cmp22 = icmp slt i32 %12, 10, !dbg !248
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !249

if.then24:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !250
  %idxprom25 = sext i32 %13 to i64, !dbg !252
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !252
  %14 = load i32, i32* %arrayidx26, align 4, !dbg !252
  call void @printIntLine(i32 noundef %14), !dbg !253
  br label %if.end27, !dbg !254

if.else:                                          ; preds = %land.lhs.true, %if.end19
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !255
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.then24
  ret void, !dbg !257
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !258 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !259, metadata !DIExpression()), !dbg !260
  store i32 -1, i32* %data, align 4, !dbg !261
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !262, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !269, metadata !DIExpression()), !dbg !270
  store i32 -1, i32* %connectSocket, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !271, metadata !DIExpression()), !dbg !272
  br label %do.body, !dbg !273

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !274
  store i32 %call, i32* %connectSocket, align 4, !dbg !276
  %0 = load i32, i32* %connectSocket, align 4, !dbg !277
  %cmp = icmp eq i32 %0, -1, !dbg !279
  br i1 %cmp, label %if.then, label %if.end, !dbg !280

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !281

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !283
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !283
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !284
  store i8 2, i8* %sin_family, align 1, !dbg !285
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !286
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !287
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !288
  store i32 %call1, i32* %s_addr, align 4, !dbg !289
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !290
  store i16 -30871, i16* %sin_port, align 2, !dbg !291
  %2 = load i32, i32* %connectSocket, align 4, !dbg !292
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !294
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !295
  %cmp3 = icmp eq i32 %call2, -1, !dbg !296
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !297

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !298

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !300
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !301
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !302
  %conv = trunc i64 %call6 to i32, !dbg !302
  store i32 %conv, i32* %recvResult, align 4, !dbg !303
  %5 = load i32, i32* %recvResult, align 4, !dbg !304
  %cmp7 = icmp eq i32 %5, -1, !dbg !306
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !307

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !308
  %cmp9 = icmp eq i32 %6, 0, !dbg !309
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !310

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !311

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !313
  %idxprom = sext i32 %7 to i64, !dbg !314
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !314
  store i8 0, i8* %arrayidx, align 1, !dbg !315
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !316
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !317
  store i32 %call14, i32* %data, align 4, !dbg !318
  br label %do.end, !dbg !319

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !320
  %cmp15 = icmp ne i32 %8, -1, !dbg !322
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !323

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !324
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !326
  br label %if.end19, !dbg !327

if.end19:                                         ; preds = %if.then17, %do.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !328, metadata !DIExpression()), !dbg !332
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !332
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !332
  %11 = load i32, i32* %data, align 4, !dbg !333
  %cmp20 = icmp sge i32 %11, 0, !dbg !335
  br i1 %cmp20, label %land.lhs.true, label %if.else, !dbg !336

land.lhs.true:                                    ; preds = %if.end19
  %12 = load i32, i32* %data, align 4, !dbg !337
  %cmp22 = icmp slt i32 %12, 10, !dbg !338
  br i1 %cmp22, label %if.then24, label %if.else, !dbg !339

if.then24:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !340
  %idxprom25 = sext i32 %13 to i64, !dbg !342
  %arrayidx26 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom25, !dbg !342
  %14 = load i32, i32* %arrayidx26, align 4, !dbg !342
  call void @printIntLine(i32 noundef %14), !dbg !343
  br label %if.end27, !dbg !344

if.else:                                          ; preds = %land.lhs.true, %if.end19
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !345
  br label %if.end27

if.end27:                                         ; preds = %if.else, %if.then24
  ret void, !dbg !347
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !348 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !349, metadata !DIExpression()), !dbg !350
  store i32 -1, i32* %data, align 4, !dbg !351
  store i32 7, i32* %data, align 4, !dbg !352
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !355, metadata !DIExpression()), !dbg !359
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !359
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !359
  %1 = load i32, i32* %data, align 4, !dbg !360
  %cmp = icmp sge i32 %1, 0, !dbg !362
  br i1 %cmp, label %if.then, label %if.else, !dbg !363

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !364
  %idxprom = sext i32 %2 to i64, !dbg !366
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !366
  %3 = load i32, i32* %arrayidx, align 4, !dbg !366
  call void @printIntLine(i32 noundef %3), !dbg !367
  br label %if.end, !dbg !368

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !369
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !371
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !372 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !373, metadata !DIExpression()), !dbg !374
  store i32 -1, i32* %data, align 4, !dbg !375
  store i32 7, i32* %data, align 4, !dbg !376
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !379, metadata !DIExpression()), !dbg !383
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !383
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !383
  %1 = load i32, i32* %data, align 4, !dbg !384
  %cmp = icmp sge i32 %1, 0, !dbg !386
  br i1 %cmp, label %if.then, label %if.else, !dbg !387

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !388
  %idxprom = sext i32 %2 to i64, !dbg !390
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !390
  %3 = load i32, i32* %arrayidx, align 4, !dbg !390
  call void @printIntLine(i32 noundef %3), !dbg !391
  br label %if.end, !dbg !392

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !393
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !395
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_06_bad", scope: !30, file: !30, line: 49, type: !31, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 51, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 51, column: 9, scope: !29)
!37 = !DILocation(line: 53, column: 10, scope: !29)
!38 = !DILocalVariable(name: "recvResult", scope: !39, file: !30, line: 61, type: !35)
!39 = distinct !DILexicalBlock(scope: !40, file: !30, line: 56, column: 9)
!40 = distinct !DILexicalBlock(scope: !41, file: !30, line: 55, column: 5)
!41 = distinct !DILexicalBlock(scope: !29, file: !30, line: 54, column: 8)
!42 = !DILocation(line: 61, column: 17, scope: !39)
!43 = !DILocalVariable(name: "service", scope: !39, file: !30, line: 62, type: !44)
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
!63 = !DILocation(line: 62, column: 32, scope: !39)
!64 = !DILocalVariable(name: "connectSocket", scope: !39, file: !30, line: 63, type: !35)
!65 = !DILocation(line: 63, column: 20, scope: !39)
!66 = !DILocalVariable(name: "inputBuffer", scope: !39, file: !30, line: 64, type: !17)
!67 = !DILocation(line: 64, column: 18, scope: !39)
!68 = !DILocation(line: 65, column: 13, scope: !39)
!69 = !DILocation(line: 75, column: 33, scope: !70)
!70 = distinct !DILexicalBlock(scope: !39, file: !30, line: 66, column: 13)
!71 = !DILocation(line: 75, column: 31, scope: !70)
!72 = !DILocation(line: 76, column: 21, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !30, line: 76, column: 21)
!74 = !DILocation(line: 76, column: 35, scope: !73)
!75 = !DILocation(line: 76, column: 21, scope: !70)
!76 = !DILocation(line: 78, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !30, line: 77, column: 17)
!78 = !DILocation(line: 80, column: 17, scope: !70)
!79 = !DILocation(line: 81, column: 25, scope: !70)
!80 = !DILocation(line: 81, column: 36, scope: !70)
!81 = !DILocation(line: 82, column: 43, scope: !70)
!82 = !DILocation(line: 82, column: 25, scope: !70)
!83 = !DILocation(line: 82, column: 34, scope: !70)
!84 = !DILocation(line: 82, column: 41, scope: !70)
!85 = !DILocation(line: 83, column: 25, scope: !70)
!86 = !DILocation(line: 83, column: 34, scope: !70)
!87 = !DILocation(line: 84, column: 29, scope: !88)
!88 = distinct !DILexicalBlock(scope: !70, file: !30, line: 84, column: 21)
!89 = !DILocation(line: 84, column: 44, scope: !88)
!90 = !DILocation(line: 84, column: 21, scope: !88)
!91 = !DILocation(line: 84, column: 89, scope: !88)
!92 = !DILocation(line: 84, column: 21, scope: !70)
!93 = !DILocation(line: 86, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !30, line: 85, column: 17)
!95 = !DILocation(line: 90, column: 35, scope: !70)
!96 = !DILocation(line: 90, column: 50, scope: !70)
!97 = !DILocation(line: 90, column: 30, scope: !70)
!98 = !DILocation(line: 90, column: 28, scope: !70)
!99 = !DILocation(line: 91, column: 21, scope: !100)
!100 = distinct !DILexicalBlock(scope: !70, file: !30, line: 91, column: 21)
!101 = !DILocation(line: 91, column: 32, scope: !100)
!102 = !DILocation(line: 91, column: 48, scope: !100)
!103 = !DILocation(line: 91, column: 51, scope: !100)
!104 = !DILocation(line: 91, column: 62, scope: !100)
!105 = !DILocation(line: 91, column: 21, scope: !70)
!106 = !DILocation(line: 93, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !100, file: !30, line: 92, column: 17)
!108 = !DILocation(line: 96, column: 29, scope: !70)
!109 = !DILocation(line: 96, column: 17, scope: !70)
!110 = !DILocation(line: 96, column: 41, scope: !70)
!111 = !DILocation(line: 98, column: 29, scope: !70)
!112 = !DILocation(line: 98, column: 24, scope: !70)
!113 = !DILocation(line: 98, column: 22, scope: !70)
!114 = !DILocation(line: 99, column: 13, scope: !70)
!115 = !DILocation(line: 101, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !39, file: !30, line: 101, column: 17)
!117 = !DILocation(line: 101, column: 31, scope: !116)
!118 = !DILocation(line: 101, column: 17, scope: !39)
!119 = !DILocation(line: 103, column: 30, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !30, line: 102, column: 13)
!121 = !DILocation(line: 103, column: 17, scope: !120)
!122 = !DILocation(line: 104, column: 13, scope: !120)
!123 = !DILocalVariable(name: "buffer", scope: !124, file: !30, line: 116, type: !127)
!124 = distinct !DILexicalBlock(scope: !125, file: !30, line: 115, column: 9)
!125 = distinct !DILexicalBlock(scope: !126, file: !30, line: 114, column: 5)
!126 = distinct !DILexicalBlock(scope: !29, file: !30, line: 113, column: 8)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 10)
!130 = !DILocation(line: 116, column: 17, scope: !124)
!131 = !DILocation(line: 119, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !124, file: !30, line: 119, column: 17)
!133 = !DILocation(line: 119, column: 22, scope: !132)
!134 = !DILocation(line: 119, column: 17, scope: !124)
!135 = !DILocation(line: 121, column: 37, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !30, line: 120, column: 13)
!137 = !DILocation(line: 121, column: 30, scope: !136)
!138 = !DILocation(line: 121, column: 17, scope: !136)
!139 = !DILocation(line: 122, column: 13, scope: !136)
!140 = !DILocation(line: 125, column: 17, scope: !141)
!141 = distinct !DILexicalBlock(scope: !132, file: !30, line: 124, column: 13)
!142 = !DILocation(line: 129, column: 1, scope: !29)
!143 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_06_good", scope: !30, file: !30, line: 369, type: !31, scopeLine: 370, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!144 = !DILocation(line: 371, column: 5, scope: !143)
!145 = !DILocation(line: 372, column: 5, scope: !143)
!146 = !DILocation(line: 373, column: 5, scope: !143)
!147 = !DILocation(line: 374, column: 5, scope: !143)
!148 = !DILocation(line: 375, column: 1, scope: !143)
!149 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 386, type: !150, scopeLine: 387, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!150 = !DISubroutineType(types: !151)
!151 = !{!35, !35, !152}
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!154 = !DILocalVariable(name: "argc", arg: 1, scope: !149, file: !30, line: 386, type: !35)
!155 = !DILocation(line: 386, column: 14, scope: !149)
!156 = !DILocalVariable(name: "argv", arg: 2, scope: !149, file: !30, line: 386, type: !152)
!157 = !DILocation(line: 386, column: 27, scope: !149)
!158 = !DILocation(line: 389, column: 22, scope: !149)
!159 = !DILocation(line: 389, column: 12, scope: !149)
!160 = !DILocation(line: 389, column: 5, scope: !149)
!161 = !DILocation(line: 391, column: 5, scope: !149)
!162 = !DILocation(line: 392, column: 5, scope: !149)
!163 = !DILocation(line: 393, column: 5, scope: !149)
!164 = !DILocation(line: 396, column: 5, scope: !149)
!165 = !DILocation(line: 397, column: 5, scope: !149)
!166 = !DILocation(line: 398, column: 5, scope: !149)
!167 = !DILocation(line: 400, column: 5, scope: !149)
!168 = distinct !DISubprogram(name: "goodB2G1", scope: !30, file: !30, line: 136, type: !31, scopeLine: 137, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!169 = !DILocalVariable(name: "data", scope: !168, file: !30, line: 138, type: !35)
!170 = !DILocation(line: 138, column: 9, scope: !168)
!171 = !DILocation(line: 140, column: 10, scope: !168)
!172 = !DILocalVariable(name: "recvResult", scope: !173, file: !30, line: 148, type: !35)
!173 = distinct !DILexicalBlock(scope: !174, file: !30, line: 143, column: 9)
!174 = distinct !DILexicalBlock(scope: !175, file: !30, line: 142, column: 5)
!175 = distinct !DILexicalBlock(scope: !168, file: !30, line: 141, column: 8)
!176 = !DILocation(line: 148, column: 17, scope: !173)
!177 = !DILocalVariable(name: "service", scope: !173, file: !30, line: 149, type: !44)
!178 = !DILocation(line: 149, column: 32, scope: !173)
!179 = !DILocalVariable(name: "connectSocket", scope: !173, file: !30, line: 150, type: !35)
!180 = !DILocation(line: 150, column: 20, scope: !173)
!181 = !DILocalVariable(name: "inputBuffer", scope: !173, file: !30, line: 151, type: !17)
!182 = !DILocation(line: 151, column: 18, scope: !173)
!183 = !DILocation(line: 152, column: 13, scope: !173)
!184 = !DILocation(line: 162, column: 33, scope: !185)
!185 = distinct !DILexicalBlock(scope: !173, file: !30, line: 153, column: 13)
!186 = !DILocation(line: 162, column: 31, scope: !185)
!187 = !DILocation(line: 163, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !30, line: 163, column: 21)
!189 = !DILocation(line: 163, column: 35, scope: !188)
!190 = !DILocation(line: 163, column: 21, scope: !185)
!191 = !DILocation(line: 165, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !30, line: 164, column: 17)
!193 = !DILocation(line: 167, column: 17, scope: !185)
!194 = !DILocation(line: 168, column: 25, scope: !185)
!195 = !DILocation(line: 168, column: 36, scope: !185)
!196 = !DILocation(line: 169, column: 43, scope: !185)
!197 = !DILocation(line: 169, column: 25, scope: !185)
!198 = !DILocation(line: 169, column: 34, scope: !185)
!199 = !DILocation(line: 169, column: 41, scope: !185)
!200 = !DILocation(line: 170, column: 25, scope: !185)
!201 = !DILocation(line: 170, column: 34, scope: !185)
!202 = !DILocation(line: 171, column: 29, scope: !203)
!203 = distinct !DILexicalBlock(scope: !185, file: !30, line: 171, column: 21)
!204 = !DILocation(line: 171, column: 44, scope: !203)
!205 = !DILocation(line: 171, column: 21, scope: !203)
!206 = !DILocation(line: 171, column: 89, scope: !203)
!207 = !DILocation(line: 171, column: 21, scope: !185)
!208 = !DILocation(line: 173, column: 21, scope: !209)
!209 = distinct !DILexicalBlock(scope: !203, file: !30, line: 172, column: 17)
!210 = !DILocation(line: 177, column: 35, scope: !185)
!211 = !DILocation(line: 177, column: 50, scope: !185)
!212 = !DILocation(line: 177, column: 30, scope: !185)
!213 = !DILocation(line: 177, column: 28, scope: !185)
!214 = !DILocation(line: 178, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !185, file: !30, line: 178, column: 21)
!216 = !DILocation(line: 178, column: 32, scope: !215)
!217 = !DILocation(line: 178, column: 48, scope: !215)
!218 = !DILocation(line: 178, column: 51, scope: !215)
!219 = !DILocation(line: 178, column: 62, scope: !215)
!220 = !DILocation(line: 178, column: 21, scope: !185)
!221 = !DILocation(line: 180, column: 21, scope: !222)
!222 = distinct !DILexicalBlock(scope: !215, file: !30, line: 179, column: 17)
!223 = !DILocation(line: 183, column: 29, scope: !185)
!224 = !DILocation(line: 183, column: 17, scope: !185)
!225 = !DILocation(line: 183, column: 41, scope: !185)
!226 = !DILocation(line: 185, column: 29, scope: !185)
!227 = !DILocation(line: 185, column: 24, scope: !185)
!228 = !DILocation(line: 185, column: 22, scope: !185)
!229 = !DILocation(line: 186, column: 13, scope: !185)
!230 = !DILocation(line: 188, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !173, file: !30, line: 188, column: 17)
!232 = !DILocation(line: 188, column: 31, scope: !231)
!233 = !DILocation(line: 188, column: 17, scope: !173)
!234 = !DILocation(line: 190, column: 30, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !30, line: 189, column: 13)
!236 = !DILocation(line: 190, column: 17, scope: !235)
!237 = !DILocation(line: 191, column: 13, scope: !235)
!238 = !DILocalVariable(name: "buffer", scope: !239, file: !30, line: 208, type: !127)
!239 = distinct !DILexicalBlock(scope: !240, file: !30, line: 207, column: 9)
!240 = distinct !DILexicalBlock(scope: !241, file: !30, line: 206, column: 5)
!241 = distinct !DILexicalBlock(scope: !168, file: !30, line: 200, column: 8)
!242 = !DILocation(line: 208, column: 17, scope: !239)
!243 = !DILocation(line: 210, column: 17, scope: !244)
!244 = distinct !DILexicalBlock(scope: !239, file: !30, line: 210, column: 17)
!245 = !DILocation(line: 210, column: 22, scope: !244)
!246 = !DILocation(line: 210, column: 27, scope: !244)
!247 = !DILocation(line: 210, column: 30, scope: !244)
!248 = !DILocation(line: 210, column: 35, scope: !244)
!249 = !DILocation(line: 210, column: 17, scope: !239)
!250 = !DILocation(line: 212, column: 37, scope: !251)
!251 = distinct !DILexicalBlock(scope: !244, file: !30, line: 211, column: 13)
!252 = !DILocation(line: 212, column: 30, scope: !251)
!253 = !DILocation(line: 212, column: 17, scope: !251)
!254 = !DILocation(line: 213, column: 13, scope: !251)
!255 = !DILocation(line: 216, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !244, file: !30, line: 215, column: 13)
!257 = !DILocation(line: 220, column: 1, scope: !168)
!258 = distinct !DISubprogram(name: "goodB2G2", scope: !30, file: !30, line: 223, type: !31, scopeLine: 224, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!259 = !DILocalVariable(name: "data", scope: !258, file: !30, line: 225, type: !35)
!260 = !DILocation(line: 225, column: 9, scope: !258)
!261 = !DILocation(line: 227, column: 10, scope: !258)
!262 = !DILocalVariable(name: "recvResult", scope: !263, file: !30, line: 235, type: !35)
!263 = distinct !DILexicalBlock(scope: !264, file: !30, line: 230, column: 9)
!264 = distinct !DILexicalBlock(scope: !265, file: !30, line: 229, column: 5)
!265 = distinct !DILexicalBlock(scope: !258, file: !30, line: 228, column: 8)
!266 = !DILocation(line: 235, column: 17, scope: !263)
!267 = !DILocalVariable(name: "service", scope: !263, file: !30, line: 236, type: !44)
!268 = !DILocation(line: 236, column: 32, scope: !263)
!269 = !DILocalVariable(name: "connectSocket", scope: !263, file: !30, line: 237, type: !35)
!270 = !DILocation(line: 237, column: 20, scope: !263)
!271 = !DILocalVariable(name: "inputBuffer", scope: !263, file: !30, line: 238, type: !17)
!272 = !DILocation(line: 238, column: 18, scope: !263)
!273 = !DILocation(line: 239, column: 13, scope: !263)
!274 = !DILocation(line: 249, column: 33, scope: !275)
!275 = distinct !DILexicalBlock(scope: !263, file: !30, line: 240, column: 13)
!276 = !DILocation(line: 249, column: 31, scope: !275)
!277 = !DILocation(line: 250, column: 21, scope: !278)
!278 = distinct !DILexicalBlock(scope: !275, file: !30, line: 250, column: 21)
!279 = !DILocation(line: 250, column: 35, scope: !278)
!280 = !DILocation(line: 250, column: 21, scope: !275)
!281 = !DILocation(line: 252, column: 21, scope: !282)
!282 = distinct !DILexicalBlock(scope: !278, file: !30, line: 251, column: 17)
!283 = !DILocation(line: 254, column: 17, scope: !275)
!284 = !DILocation(line: 255, column: 25, scope: !275)
!285 = !DILocation(line: 255, column: 36, scope: !275)
!286 = !DILocation(line: 256, column: 43, scope: !275)
!287 = !DILocation(line: 256, column: 25, scope: !275)
!288 = !DILocation(line: 256, column: 34, scope: !275)
!289 = !DILocation(line: 256, column: 41, scope: !275)
!290 = !DILocation(line: 257, column: 25, scope: !275)
!291 = !DILocation(line: 257, column: 34, scope: !275)
!292 = !DILocation(line: 258, column: 29, scope: !293)
!293 = distinct !DILexicalBlock(scope: !275, file: !30, line: 258, column: 21)
!294 = !DILocation(line: 258, column: 44, scope: !293)
!295 = !DILocation(line: 258, column: 21, scope: !293)
!296 = !DILocation(line: 258, column: 89, scope: !293)
!297 = !DILocation(line: 258, column: 21, scope: !275)
!298 = !DILocation(line: 260, column: 21, scope: !299)
!299 = distinct !DILexicalBlock(scope: !293, file: !30, line: 259, column: 17)
!300 = !DILocation(line: 264, column: 35, scope: !275)
!301 = !DILocation(line: 264, column: 50, scope: !275)
!302 = !DILocation(line: 264, column: 30, scope: !275)
!303 = !DILocation(line: 264, column: 28, scope: !275)
!304 = !DILocation(line: 265, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !275, file: !30, line: 265, column: 21)
!306 = !DILocation(line: 265, column: 32, scope: !305)
!307 = !DILocation(line: 265, column: 48, scope: !305)
!308 = !DILocation(line: 265, column: 51, scope: !305)
!309 = !DILocation(line: 265, column: 62, scope: !305)
!310 = !DILocation(line: 265, column: 21, scope: !275)
!311 = !DILocation(line: 267, column: 21, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !30, line: 266, column: 17)
!313 = !DILocation(line: 270, column: 29, scope: !275)
!314 = !DILocation(line: 270, column: 17, scope: !275)
!315 = !DILocation(line: 270, column: 41, scope: !275)
!316 = !DILocation(line: 272, column: 29, scope: !275)
!317 = !DILocation(line: 272, column: 24, scope: !275)
!318 = !DILocation(line: 272, column: 22, scope: !275)
!319 = !DILocation(line: 273, column: 13, scope: !275)
!320 = !DILocation(line: 275, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !263, file: !30, line: 275, column: 17)
!322 = !DILocation(line: 275, column: 31, scope: !321)
!323 = !DILocation(line: 275, column: 17, scope: !263)
!324 = !DILocation(line: 277, column: 30, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !30, line: 276, column: 13)
!326 = !DILocation(line: 277, column: 17, scope: !325)
!327 = !DILocation(line: 278, column: 13, scope: !325)
!328 = !DILocalVariable(name: "buffer", scope: !329, file: !30, line: 290, type: !127)
!329 = distinct !DILexicalBlock(scope: !330, file: !30, line: 289, column: 9)
!330 = distinct !DILexicalBlock(scope: !331, file: !30, line: 288, column: 5)
!331 = distinct !DILexicalBlock(scope: !258, file: !30, line: 287, column: 8)
!332 = !DILocation(line: 290, column: 17, scope: !329)
!333 = !DILocation(line: 292, column: 17, scope: !334)
!334 = distinct !DILexicalBlock(scope: !329, file: !30, line: 292, column: 17)
!335 = !DILocation(line: 292, column: 22, scope: !334)
!336 = !DILocation(line: 292, column: 27, scope: !334)
!337 = !DILocation(line: 292, column: 30, scope: !334)
!338 = !DILocation(line: 292, column: 35, scope: !334)
!339 = !DILocation(line: 292, column: 17, scope: !329)
!340 = !DILocation(line: 294, column: 37, scope: !341)
!341 = distinct !DILexicalBlock(scope: !334, file: !30, line: 293, column: 13)
!342 = !DILocation(line: 294, column: 30, scope: !341)
!343 = !DILocation(line: 294, column: 17, scope: !341)
!344 = !DILocation(line: 295, column: 13, scope: !341)
!345 = !DILocation(line: 298, column: 17, scope: !346)
!346 = distinct !DILexicalBlock(scope: !334, file: !30, line: 297, column: 13)
!347 = !DILocation(line: 302, column: 1, scope: !258)
!348 = distinct !DISubprogram(name: "goodG2B1", scope: !30, file: !30, line: 305, type: !31, scopeLine: 306, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!349 = !DILocalVariable(name: "data", scope: !348, file: !30, line: 307, type: !35)
!350 = !DILocation(line: 307, column: 9, scope: !348)
!351 = !DILocation(line: 309, column: 10, scope: !348)
!352 = !DILocation(line: 319, column: 14, scope: !353)
!353 = distinct !DILexicalBlock(scope: !354, file: !30, line: 316, column: 5)
!354 = distinct !DILexicalBlock(scope: !348, file: !30, line: 310, column: 8)
!355 = !DILocalVariable(name: "buffer", scope: !356, file: !30, line: 324, type: !127)
!356 = distinct !DILexicalBlock(scope: !357, file: !30, line: 323, column: 9)
!357 = distinct !DILexicalBlock(scope: !358, file: !30, line: 322, column: 5)
!358 = distinct !DILexicalBlock(scope: !348, file: !30, line: 321, column: 8)
!359 = !DILocation(line: 324, column: 17, scope: !356)
!360 = !DILocation(line: 327, column: 17, scope: !361)
!361 = distinct !DILexicalBlock(scope: !356, file: !30, line: 327, column: 17)
!362 = !DILocation(line: 327, column: 22, scope: !361)
!363 = !DILocation(line: 327, column: 17, scope: !356)
!364 = !DILocation(line: 329, column: 37, scope: !365)
!365 = distinct !DILexicalBlock(scope: !361, file: !30, line: 328, column: 13)
!366 = !DILocation(line: 329, column: 30, scope: !365)
!367 = !DILocation(line: 329, column: 17, scope: !365)
!368 = !DILocation(line: 330, column: 13, scope: !365)
!369 = !DILocation(line: 333, column: 17, scope: !370)
!370 = distinct !DILexicalBlock(scope: !361, file: !30, line: 332, column: 13)
!371 = !DILocation(line: 337, column: 1, scope: !348)
!372 = distinct !DISubprogram(name: "goodG2B2", scope: !30, file: !30, line: 340, type: !31, scopeLine: 341, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!373 = !DILocalVariable(name: "data", scope: !372, file: !30, line: 342, type: !35)
!374 = !DILocation(line: 342, column: 9, scope: !372)
!375 = !DILocation(line: 344, column: 10, scope: !372)
!376 = !DILocation(line: 349, column: 14, scope: !377)
!377 = distinct !DILexicalBlock(scope: !378, file: !30, line: 346, column: 5)
!378 = distinct !DILexicalBlock(scope: !372, file: !30, line: 345, column: 8)
!379 = !DILocalVariable(name: "buffer", scope: !380, file: !30, line: 354, type: !127)
!380 = distinct !DILexicalBlock(scope: !381, file: !30, line: 353, column: 9)
!381 = distinct !DILexicalBlock(scope: !382, file: !30, line: 352, column: 5)
!382 = distinct !DILexicalBlock(scope: !372, file: !30, line: 351, column: 8)
!383 = !DILocation(line: 354, column: 17, scope: !380)
!384 = !DILocation(line: 357, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !380, file: !30, line: 357, column: 17)
!386 = !DILocation(line: 357, column: 22, scope: !385)
!387 = !DILocation(line: 357, column: 17, scope: !380)
!388 = !DILocation(line: 359, column: 37, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !30, line: 358, column: 13)
!390 = !DILocation(line: 359, column: 30, scope: !389)
!391 = !DILocation(line: 359, column: 17, scope: !389)
!392 = !DILocation(line: 360, column: 13, scope: !389)
!393 = !DILocation(line: 363, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !385, file: !30, line: 362, column: 13)
!395 = !DILocation(line: 367, column: 1, scope: !372)
