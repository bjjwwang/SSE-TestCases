; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_02-1.c"
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
define void @CWE126_Buffer_Overread__CWE129_listen_socket_02_bad() #0 !dbg !31 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 -1, i32* %data, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !40, metadata !DIExpression()), !dbg !44
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !150, metadata !DIExpression()), !dbg !157
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !157
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !157
  %16 = load i32, i32* %data, align 4, !dbg !158
  %cmp32 = icmp sge i32 %16, 0, !dbg !160
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !161

if.then34:                                        ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !162
  %idxprom35 = sext i32 %17 to i64, !dbg !164
  %arrayidx36 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom35, !dbg !164
  %18 = load i32, i32* %arrayidx36, align 4, !dbg !164
  call void @printIntLine(i32 noundef %18), !dbg !165
  br label %if.end37, !dbg !166

if.else:                                          ; preds = %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !167
  br label %if.end37

if.end37:                                         ; preds = %if.else, %if.then34
  ret void, !dbg !169
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
define void @CWE126_Buffer_Overread__CWE129_listen_socket_02_good() #0 !dbg !170 {
entry:
  call void @goodB2G1(), !dbg !171
  call void @goodB2G2(), !dbg !172
  call void @goodG2B1(), !dbg !173
  call void @goodG2B2(), !dbg !174
  ret void, !dbg !175
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !176 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !181, metadata !DIExpression()), !dbg !182
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !183, metadata !DIExpression()), !dbg !184
  %call = call i64 @time(i64* noundef null), !dbg !185
  %conv = trunc i64 %call to i32, !dbg !186
  call void @srand(i32 noundef %conv), !dbg !187
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !188
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_02_good(), !dbg !189
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !190
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !191
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_02_bad(), !dbg !192
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !193
  ret i32 0, !dbg !194
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !195 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !196, metadata !DIExpression()), !dbg !197
  store i32 -1, i32* %data, align 4, !dbg !198
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !199, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !204, metadata !DIExpression()), !dbg !205
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !206, metadata !DIExpression()), !dbg !207
  store i32 -1, i32* %listenSocket, align 4, !dbg !207
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !208, metadata !DIExpression()), !dbg !209
  store i32 -1, i32* %acceptSocket, align 4, !dbg !209
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !210, metadata !DIExpression()), !dbg !211
  br label %do.body, !dbg !212

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !213
  store i32 %call, i32* %listenSocket, align 4, !dbg !215
  %0 = load i32, i32* %listenSocket, align 4, !dbg !216
  %cmp = icmp eq i32 %0, -1, !dbg !218
  br i1 %cmp, label %if.then, label %if.end, !dbg !219

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !220

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !222
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !222
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !223
  store i8 2, i8* %sin_family, align 1, !dbg !224
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !225
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !226
  store i32 0, i32* %s_addr, align 4, !dbg !227
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !228
  store i16 -30871, i16* %sin_port, align 2, !dbg !229
  %2 = load i32, i32* %listenSocket, align 4, !dbg !230
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !232
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !233
  %cmp2 = icmp eq i32 %call1, -1, !dbg !234
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !235

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !236

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !238
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !240
  %cmp6 = icmp eq i32 %call5, -1, !dbg !241
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !242

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !243

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !245
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !246
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !247
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !248
  %cmp10 = icmp eq i32 %6, -1, !dbg !250
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !251

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !252

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !254
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !255
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !256
  %conv = trunc i64 %call13 to i32, !dbg !256
  store i32 %conv, i32* %recvResult, align 4, !dbg !257
  %8 = load i32, i32* %recvResult, align 4, !dbg !258
  %cmp14 = icmp eq i32 %8, -1, !dbg !260
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !261

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !262
  %cmp16 = icmp eq i32 %9, 0, !dbg !263
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !264

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !265

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !267
  %idxprom = sext i32 %10 to i64, !dbg !268
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !268
  store i8 0, i8* %arrayidx, align 1, !dbg !269
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !270
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !271
  store i32 %call21, i32* %data, align 4, !dbg !272
  br label %do.end, !dbg !273

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !274
  %cmp22 = icmp ne i32 %11, -1, !dbg !276
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !277

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !278
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !280
  br label %if.end26, !dbg !281

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !282
  %cmp27 = icmp ne i32 %13, -1, !dbg !284
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !285

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !286
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !288
  br label %if.end31, !dbg !289

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !290, metadata !DIExpression()), !dbg !294
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !294
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !294
  %16 = load i32, i32* %data, align 4, !dbg !295
  %cmp32 = icmp sge i32 %16, 0, !dbg !297
  br i1 %cmp32, label %land.lhs.true, label %if.else, !dbg !298

land.lhs.true:                                    ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !299
  %cmp34 = icmp slt i32 %17, 10, !dbg !300
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !301

if.then36:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !302
  %idxprom37 = sext i32 %18 to i64, !dbg !304
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !304
  %19 = load i32, i32* %arrayidx38, align 4, !dbg !304
  call void @printIntLine(i32 noundef %19), !dbg !305
  br label %if.end39, !dbg !306

if.else:                                          ; preds = %land.lhs.true, %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !307
  br label %if.end39

if.end39:                                         ; preds = %if.else, %if.then36
  ret void, !dbg !309
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !310 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !311, metadata !DIExpression()), !dbg !312
  store i32 -1, i32* %data, align 4, !dbg !313
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !314, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !321, metadata !DIExpression()), !dbg !322
  store i32 -1, i32* %listenSocket, align 4, !dbg !322
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !323, metadata !DIExpression()), !dbg !324
  store i32 -1, i32* %acceptSocket, align 4, !dbg !324
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !325, metadata !DIExpression()), !dbg !326
  br label %do.body, !dbg !327

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !328
  store i32 %call, i32* %listenSocket, align 4, !dbg !330
  %0 = load i32, i32* %listenSocket, align 4, !dbg !331
  %cmp = icmp eq i32 %0, -1, !dbg !333
  br i1 %cmp, label %if.then, label %if.end, !dbg !334

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !335

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !337
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !337
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !338
  store i8 2, i8* %sin_family, align 1, !dbg !339
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !340
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !341
  store i32 0, i32* %s_addr, align 4, !dbg !342
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !343
  store i16 -30871, i16* %sin_port, align 2, !dbg !344
  %2 = load i32, i32* %listenSocket, align 4, !dbg !345
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !347
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !348
  %cmp2 = icmp eq i32 %call1, -1, !dbg !349
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !350

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !351

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !353
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !355
  %cmp6 = icmp eq i32 %call5, -1, !dbg !356
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !357

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !358

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !360
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !361
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !362
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !363
  %cmp10 = icmp eq i32 %6, -1, !dbg !365
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !366

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !367

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !369
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !370
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !371
  %conv = trunc i64 %call13 to i32, !dbg !371
  store i32 %conv, i32* %recvResult, align 4, !dbg !372
  %8 = load i32, i32* %recvResult, align 4, !dbg !373
  %cmp14 = icmp eq i32 %8, -1, !dbg !375
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !376

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !377
  %cmp16 = icmp eq i32 %9, 0, !dbg !378
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !379

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !380

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !382
  %idxprom = sext i32 %10 to i64, !dbg !383
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !383
  store i8 0, i8* %arrayidx, align 1, !dbg !384
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !385
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !386
  store i32 %call21, i32* %data, align 4, !dbg !387
  br label %do.end, !dbg !388

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !389
  %cmp22 = icmp ne i32 %11, -1, !dbg !391
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !392

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !393
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !395
  br label %if.end26, !dbg !396

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !397
  %cmp27 = icmp ne i32 %13, -1, !dbg !399
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !400

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !401
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !403
  br label %if.end31, !dbg !404

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !405, metadata !DIExpression()), !dbg !409
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !409
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !409
  %16 = load i32, i32* %data, align 4, !dbg !410
  %cmp32 = icmp sge i32 %16, 0, !dbg !412
  br i1 %cmp32, label %land.lhs.true, label %if.else, !dbg !413

land.lhs.true:                                    ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !414
  %cmp34 = icmp slt i32 %17, 10, !dbg !415
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !416

if.then36:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !417
  %idxprom37 = sext i32 %18 to i64, !dbg !419
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !419
  %19 = load i32, i32* %arrayidx38, align 4, !dbg !419
  call void @printIntLine(i32 noundef %19), !dbg !420
  br label %if.end39, !dbg !421

if.else:                                          ; preds = %land.lhs.true, %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !422
  br label %if.end39

if.end39:                                         ; preds = %if.else, %if.then36
  ret void, !dbg !424
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !425 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !426, metadata !DIExpression()), !dbg !427
  store i32 -1, i32* %data, align 4, !dbg !428
  store i32 7, i32* %data, align 4, !dbg !429
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !432, metadata !DIExpression()), !dbg !436
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !436
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !436
  %1 = load i32, i32* %data, align 4, !dbg !437
  %cmp = icmp sge i32 %1, 0, !dbg !439
  br i1 %cmp, label %if.then, label %if.else, !dbg !440

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !441
  %idxprom = sext i32 %2 to i64, !dbg !443
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !443
  %3 = load i32, i32* %arrayidx, align 4, !dbg !443
  call void @printIntLine(i32 noundef %3), !dbg !444
  br label %if.end, !dbg !445

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !446
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !448
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !449 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !450, metadata !DIExpression()), !dbg !451
  store i32 -1, i32* %data, align 4, !dbg !452
  store i32 7, i32* %data, align 4, !dbg !453
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !456, metadata !DIExpression()), !dbg !460
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !460
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !460
  %1 = load i32, i32* %data, align 4, !dbg !461
  %cmp = icmp sge i32 %1, 0, !dbg !463
  br i1 %cmp, label %if.then, label %if.else, !dbg !464

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !465
  %idxprom = sext i32 %2 to i64, !dbg !467
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !467
  %3 = load i32, i32* %arrayidx, align 4, !dbg !467
  call void @printIntLine(i32 noundef %3), !dbg !468
  br label %if.end, !dbg !469

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !470
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !472
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_02_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocation(line: 48, column: 10, scope: !31)
!40 = !DILocalVariable(name: "recvResult", scope: !41, file: !32, line: 56, type: !37)
!41 = distinct !DILexicalBlock(scope: !42, file: !32, line: 51, column: 9)
!42 = distinct !DILexicalBlock(scope: !43, file: !32, line: 50, column: 5)
!43 = distinct !DILexicalBlock(scope: !31, file: !32, line: 49, column: 8)
!44 = !DILocation(line: 56, column: 17, scope: !41)
!45 = !DILocalVariable(name: "service", scope: !41, file: !32, line: 57, type: !46)
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
!65 = !DILocation(line: 57, column: 32, scope: !41)
!66 = !DILocalVariable(name: "listenSocket", scope: !41, file: !32, line: 58, type: !37)
!67 = !DILocation(line: 58, column: 20, scope: !41)
!68 = !DILocalVariable(name: "acceptSocket", scope: !41, file: !32, line: 59, type: !37)
!69 = !DILocation(line: 59, column: 20, scope: !41)
!70 = !DILocalVariable(name: "inputBuffer", scope: !41, file: !32, line: 60, type: !20)
!71 = !DILocation(line: 60, column: 18, scope: !41)
!72 = !DILocation(line: 61, column: 13, scope: !41)
!73 = !DILocation(line: 71, column: 32, scope: !74)
!74 = distinct !DILexicalBlock(scope: !41, file: !32, line: 62, column: 13)
!75 = !DILocation(line: 71, column: 30, scope: !74)
!76 = !DILocation(line: 72, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !32, line: 72, column: 21)
!78 = !DILocation(line: 72, column: 34, scope: !77)
!79 = !DILocation(line: 72, column: 21, scope: !74)
!80 = !DILocation(line: 74, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !32, line: 73, column: 17)
!82 = !DILocation(line: 76, column: 17, scope: !74)
!83 = !DILocation(line: 77, column: 25, scope: !74)
!84 = !DILocation(line: 77, column: 36, scope: !74)
!85 = !DILocation(line: 78, column: 25, scope: !74)
!86 = !DILocation(line: 78, column: 34, scope: !74)
!87 = !DILocation(line: 78, column: 41, scope: !74)
!88 = !DILocation(line: 79, column: 25, scope: !74)
!89 = !DILocation(line: 79, column: 34, scope: !74)
!90 = !DILocation(line: 80, column: 26, scope: !91)
!91 = distinct !DILexicalBlock(scope: !74, file: !32, line: 80, column: 21)
!92 = !DILocation(line: 80, column: 40, scope: !91)
!93 = !DILocation(line: 80, column: 21, scope: !91)
!94 = !DILocation(line: 80, column: 85, scope: !91)
!95 = !DILocation(line: 80, column: 21, scope: !74)
!96 = !DILocation(line: 82, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !32, line: 81, column: 17)
!98 = !DILocation(line: 84, column: 28, scope: !99)
!99 = distinct !DILexicalBlock(scope: !74, file: !32, line: 84, column: 21)
!100 = !DILocation(line: 84, column: 21, scope: !99)
!101 = !DILocation(line: 84, column: 58, scope: !99)
!102 = !DILocation(line: 84, column: 21, scope: !74)
!103 = !DILocation(line: 86, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !32, line: 85, column: 17)
!105 = !DILocation(line: 88, column: 39, scope: !74)
!106 = !DILocation(line: 88, column: 32, scope: !74)
!107 = !DILocation(line: 88, column: 30, scope: !74)
!108 = !DILocation(line: 89, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !74, file: !32, line: 89, column: 21)
!110 = !DILocation(line: 89, column: 34, scope: !109)
!111 = !DILocation(line: 89, column: 21, scope: !74)
!112 = !DILocation(line: 91, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !32, line: 90, column: 17)
!114 = !DILocation(line: 94, column: 35, scope: !74)
!115 = !DILocation(line: 94, column: 49, scope: !74)
!116 = !DILocation(line: 94, column: 30, scope: !74)
!117 = !DILocation(line: 94, column: 28, scope: !74)
!118 = !DILocation(line: 95, column: 21, scope: !119)
!119 = distinct !DILexicalBlock(scope: !74, file: !32, line: 95, column: 21)
!120 = !DILocation(line: 95, column: 32, scope: !119)
!121 = !DILocation(line: 95, column: 48, scope: !119)
!122 = !DILocation(line: 95, column: 51, scope: !119)
!123 = !DILocation(line: 95, column: 62, scope: !119)
!124 = !DILocation(line: 95, column: 21, scope: !74)
!125 = !DILocation(line: 97, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !32, line: 96, column: 17)
!127 = !DILocation(line: 100, column: 29, scope: !74)
!128 = !DILocation(line: 100, column: 17, scope: !74)
!129 = !DILocation(line: 100, column: 41, scope: !74)
!130 = !DILocation(line: 102, column: 29, scope: !74)
!131 = !DILocation(line: 102, column: 24, scope: !74)
!132 = !DILocation(line: 102, column: 22, scope: !74)
!133 = !DILocation(line: 103, column: 13, scope: !74)
!134 = !DILocation(line: 105, column: 17, scope: !135)
!135 = distinct !DILexicalBlock(scope: !41, file: !32, line: 105, column: 17)
!136 = !DILocation(line: 105, column: 30, scope: !135)
!137 = !DILocation(line: 105, column: 17, scope: !41)
!138 = !DILocation(line: 107, column: 30, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !32, line: 106, column: 13)
!140 = !DILocation(line: 107, column: 17, scope: !139)
!141 = !DILocation(line: 108, column: 13, scope: !139)
!142 = !DILocation(line: 109, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !41, file: !32, line: 109, column: 17)
!144 = !DILocation(line: 109, column: 30, scope: !143)
!145 = !DILocation(line: 109, column: 17, scope: !41)
!146 = !DILocation(line: 111, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !32, line: 110, column: 13)
!148 = !DILocation(line: 111, column: 17, scope: !147)
!149 = !DILocation(line: 112, column: 13, scope: !147)
!150 = !DILocalVariable(name: "buffer", scope: !151, file: !32, line: 124, type: !154)
!151 = distinct !DILexicalBlock(scope: !152, file: !32, line: 123, column: 9)
!152 = distinct !DILexicalBlock(scope: !153, file: !32, line: 122, column: 5)
!153 = distinct !DILexicalBlock(scope: !31, file: !32, line: 121, column: 8)
!154 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !155)
!155 = !{!156}
!156 = !DISubrange(count: 10)
!157 = !DILocation(line: 124, column: 17, scope: !151)
!158 = !DILocation(line: 127, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !151, file: !32, line: 127, column: 17)
!160 = !DILocation(line: 127, column: 22, scope: !159)
!161 = !DILocation(line: 127, column: 17, scope: !151)
!162 = !DILocation(line: 129, column: 37, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !32, line: 128, column: 13)
!164 = !DILocation(line: 129, column: 30, scope: !163)
!165 = !DILocation(line: 129, column: 17, scope: !163)
!166 = !DILocation(line: 130, column: 13, scope: !163)
!167 = !DILocation(line: 133, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !159, file: !32, line: 132, column: 13)
!169 = !DILocation(line: 137, column: 1, scope: !31)
!170 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_02_good", scope: !32, file: !32, line: 403, type: !33, scopeLine: 404, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!171 = !DILocation(line: 405, column: 5, scope: !170)
!172 = !DILocation(line: 406, column: 5, scope: !170)
!173 = !DILocation(line: 407, column: 5, scope: !170)
!174 = !DILocation(line: 408, column: 5, scope: !170)
!175 = !DILocation(line: 409, column: 1, scope: !170)
!176 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 420, type: !177, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!177 = !DISubroutineType(types: !178)
!178 = !{!37, !37, !179}
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!181 = !DILocalVariable(name: "argc", arg: 1, scope: !176, file: !32, line: 420, type: !37)
!182 = !DILocation(line: 420, column: 14, scope: !176)
!183 = !DILocalVariable(name: "argv", arg: 2, scope: !176, file: !32, line: 420, type: !179)
!184 = !DILocation(line: 420, column: 27, scope: !176)
!185 = !DILocation(line: 423, column: 22, scope: !176)
!186 = !DILocation(line: 423, column: 12, scope: !176)
!187 = !DILocation(line: 423, column: 5, scope: !176)
!188 = !DILocation(line: 425, column: 5, scope: !176)
!189 = !DILocation(line: 426, column: 5, scope: !176)
!190 = !DILocation(line: 427, column: 5, scope: !176)
!191 = !DILocation(line: 430, column: 5, scope: !176)
!192 = !DILocation(line: 431, column: 5, scope: !176)
!193 = !DILocation(line: 432, column: 5, scope: !176)
!194 = !DILocation(line: 434, column: 5, scope: !176)
!195 = distinct !DISubprogram(name: "goodB2G1", scope: !32, file: !32, line: 144, type: !33, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!196 = !DILocalVariable(name: "data", scope: !195, file: !32, line: 146, type: !37)
!197 = !DILocation(line: 146, column: 9, scope: !195)
!198 = !DILocation(line: 148, column: 10, scope: !195)
!199 = !DILocalVariable(name: "recvResult", scope: !200, file: !32, line: 156, type: !37)
!200 = distinct !DILexicalBlock(scope: !201, file: !32, line: 151, column: 9)
!201 = distinct !DILexicalBlock(scope: !202, file: !32, line: 150, column: 5)
!202 = distinct !DILexicalBlock(scope: !195, file: !32, line: 149, column: 8)
!203 = !DILocation(line: 156, column: 17, scope: !200)
!204 = !DILocalVariable(name: "service", scope: !200, file: !32, line: 157, type: !46)
!205 = !DILocation(line: 157, column: 32, scope: !200)
!206 = !DILocalVariable(name: "listenSocket", scope: !200, file: !32, line: 158, type: !37)
!207 = !DILocation(line: 158, column: 20, scope: !200)
!208 = !DILocalVariable(name: "acceptSocket", scope: !200, file: !32, line: 159, type: !37)
!209 = !DILocation(line: 159, column: 20, scope: !200)
!210 = !DILocalVariable(name: "inputBuffer", scope: !200, file: !32, line: 160, type: !20)
!211 = !DILocation(line: 160, column: 18, scope: !200)
!212 = !DILocation(line: 161, column: 13, scope: !200)
!213 = !DILocation(line: 171, column: 32, scope: !214)
!214 = distinct !DILexicalBlock(scope: !200, file: !32, line: 162, column: 13)
!215 = !DILocation(line: 171, column: 30, scope: !214)
!216 = !DILocation(line: 172, column: 21, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !32, line: 172, column: 21)
!218 = !DILocation(line: 172, column: 34, scope: !217)
!219 = !DILocation(line: 172, column: 21, scope: !214)
!220 = !DILocation(line: 174, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !217, file: !32, line: 173, column: 17)
!222 = !DILocation(line: 176, column: 17, scope: !214)
!223 = !DILocation(line: 177, column: 25, scope: !214)
!224 = !DILocation(line: 177, column: 36, scope: !214)
!225 = !DILocation(line: 178, column: 25, scope: !214)
!226 = !DILocation(line: 178, column: 34, scope: !214)
!227 = !DILocation(line: 178, column: 41, scope: !214)
!228 = !DILocation(line: 179, column: 25, scope: !214)
!229 = !DILocation(line: 179, column: 34, scope: !214)
!230 = !DILocation(line: 180, column: 26, scope: !231)
!231 = distinct !DILexicalBlock(scope: !214, file: !32, line: 180, column: 21)
!232 = !DILocation(line: 180, column: 40, scope: !231)
!233 = !DILocation(line: 180, column: 21, scope: !231)
!234 = !DILocation(line: 180, column: 85, scope: !231)
!235 = !DILocation(line: 180, column: 21, scope: !214)
!236 = !DILocation(line: 182, column: 21, scope: !237)
!237 = distinct !DILexicalBlock(scope: !231, file: !32, line: 181, column: 17)
!238 = !DILocation(line: 184, column: 28, scope: !239)
!239 = distinct !DILexicalBlock(scope: !214, file: !32, line: 184, column: 21)
!240 = !DILocation(line: 184, column: 21, scope: !239)
!241 = !DILocation(line: 184, column: 58, scope: !239)
!242 = !DILocation(line: 184, column: 21, scope: !214)
!243 = !DILocation(line: 186, column: 21, scope: !244)
!244 = distinct !DILexicalBlock(scope: !239, file: !32, line: 185, column: 17)
!245 = !DILocation(line: 188, column: 39, scope: !214)
!246 = !DILocation(line: 188, column: 32, scope: !214)
!247 = !DILocation(line: 188, column: 30, scope: !214)
!248 = !DILocation(line: 189, column: 21, scope: !249)
!249 = distinct !DILexicalBlock(scope: !214, file: !32, line: 189, column: 21)
!250 = !DILocation(line: 189, column: 34, scope: !249)
!251 = !DILocation(line: 189, column: 21, scope: !214)
!252 = !DILocation(line: 191, column: 21, scope: !253)
!253 = distinct !DILexicalBlock(scope: !249, file: !32, line: 190, column: 17)
!254 = !DILocation(line: 194, column: 35, scope: !214)
!255 = !DILocation(line: 194, column: 49, scope: !214)
!256 = !DILocation(line: 194, column: 30, scope: !214)
!257 = !DILocation(line: 194, column: 28, scope: !214)
!258 = !DILocation(line: 195, column: 21, scope: !259)
!259 = distinct !DILexicalBlock(scope: !214, file: !32, line: 195, column: 21)
!260 = !DILocation(line: 195, column: 32, scope: !259)
!261 = !DILocation(line: 195, column: 48, scope: !259)
!262 = !DILocation(line: 195, column: 51, scope: !259)
!263 = !DILocation(line: 195, column: 62, scope: !259)
!264 = !DILocation(line: 195, column: 21, scope: !214)
!265 = !DILocation(line: 197, column: 21, scope: !266)
!266 = distinct !DILexicalBlock(scope: !259, file: !32, line: 196, column: 17)
!267 = !DILocation(line: 200, column: 29, scope: !214)
!268 = !DILocation(line: 200, column: 17, scope: !214)
!269 = !DILocation(line: 200, column: 41, scope: !214)
!270 = !DILocation(line: 202, column: 29, scope: !214)
!271 = !DILocation(line: 202, column: 24, scope: !214)
!272 = !DILocation(line: 202, column: 22, scope: !214)
!273 = !DILocation(line: 203, column: 13, scope: !214)
!274 = !DILocation(line: 205, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !200, file: !32, line: 205, column: 17)
!276 = !DILocation(line: 205, column: 30, scope: !275)
!277 = !DILocation(line: 205, column: 17, scope: !200)
!278 = !DILocation(line: 207, column: 30, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !32, line: 206, column: 13)
!280 = !DILocation(line: 207, column: 17, scope: !279)
!281 = !DILocation(line: 208, column: 13, scope: !279)
!282 = !DILocation(line: 209, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !200, file: !32, line: 209, column: 17)
!284 = !DILocation(line: 209, column: 30, scope: !283)
!285 = !DILocation(line: 209, column: 17, scope: !200)
!286 = !DILocation(line: 211, column: 30, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !32, line: 210, column: 13)
!288 = !DILocation(line: 211, column: 17, scope: !287)
!289 = !DILocation(line: 212, column: 13, scope: !287)
!290 = !DILocalVariable(name: "buffer", scope: !291, file: !32, line: 229, type: !154)
!291 = distinct !DILexicalBlock(scope: !292, file: !32, line: 228, column: 9)
!292 = distinct !DILexicalBlock(scope: !293, file: !32, line: 227, column: 5)
!293 = distinct !DILexicalBlock(scope: !195, file: !32, line: 221, column: 8)
!294 = !DILocation(line: 229, column: 17, scope: !291)
!295 = !DILocation(line: 231, column: 17, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !32, line: 231, column: 17)
!297 = !DILocation(line: 231, column: 22, scope: !296)
!298 = !DILocation(line: 231, column: 27, scope: !296)
!299 = !DILocation(line: 231, column: 30, scope: !296)
!300 = !DILocation(line: 231, column: 35, scope: !296)
!301 = !DILocation(line: 231, column: 17, scope: !291)
!302 = !DILocation(line: 233, column: 37, scope: !303)
!303 = distinct !DILexicalBlock(scope: !296, file: !32, line: 232, column: 13)
!304 = !DILocation(line: 233, column: 30, scope: !303)
!305 = !DILocation(line: 233, column: 17, scope: !303)
!306 = !DILocation(line: 234, column: 13, scope: !303)
!307 = !DILocation(line: 237, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !296, file: !32, line: 236, column: 13)
!309 = !DILocation(line: 241, column: 1, scope: !195)
!310 = distinct !DISubprogram(name: "goodB2G2", scope: !32, file: !32, line: 244, type: !33, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!311 = !DILocalVariable(name: "data", scope: !310, file: !32, line: 246, type: !37)
!312 = !DILocation(line: 246, column: 9, scope: !310)
!313 = !DILocation(line: 248, column: 10, scope: !310)
!314 = !DILocalVariable(name: "recvResult", scope: !315, file: !32, line: 256, type: !37)
!315 = distinct !DILexicalBlock(scope: !316, file: !32, line: 251, column: 9)
!316 = distinct !DILexicalBlock(scope: !317, file: !32, line: 250, column: 5)
!317 = distinct !DILexicalBlock(scope: !310, file: !32, line: 249, column: 8)
!318 = !DILocation(line: 256, column: 17, scope: !315)
!319 = !DILocalVariable(name: "service", scope: !315, file: !32, line: 257, type: !46)
!320 = !DILocation(line: 257, column: 32, scope: !315)
!321 = !DILocalVariable(name: "listenSocket", scope: !315, file: !32, line: 258, type: !37)
!322 = !DILocation(line: 258, column: 20, scope: !315)
!323 = !DILocalVariable(name: "acceptSocket", scope: !315, file: !32, line: 259, type: !37)
!324 = !DILocation(line: 259, column: 20, scope: !315)
!325 = !DILocalVariable(name: "inputBuffer", scope: !315, file: !32, line: 260, type: !20)
!326 = !DILocation(line: 260, column: 18, scope: !315)
!327 = !DILocation(line: 261, column: 13, scope: !315)
!328 = !DILocation(line: 271, column: 32, scope: !329)
!329 = distinct !DILexicalBlock(scope: !315, file: !32, line: 262, column: 13)
!330 = !DILocation(line: 271, column: 30, scope: !329)
!331 = !DILocation(line: 272, column: 21, scope: !332)
!332 = distinct !DILexicalBlock(scope: !329, file: !32, line: 272, column: 21)
!333 = !DILocation(line: 272, column: 34, scope: !332)
!334 = !DILocation(line: 272, column: 21, scope: !329)
!335 = !DILocation(line: 274, column: 21, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !32, line: 273, column: 17)
!337 = !DILocation(line: 276, column: 17, scope: !329)
!338 = !DILocation(line: 277, column: 25, scope: !329)
!339 = !DILocation(line: 277, column: 36, scope: !329)
!340 = !DILocation(line: 278, column: 25, scope: !329)
!341 = !DILocation(line: 278, column: 34, scope: !329)
!342 = !DILocation(line: 278, column: 41, scope: !329)
!343 = !DILocation(line: 279, column: 25, scope: !329)
!344 = !DILocation(line: 279, column: 34, scope: !329)
!345 = !DILocation(line: 280, column: 26, scope: !346)
!346 = distinct !DILexicalBlock(scope: !329, file: !32, line: 280, column: 21)
!347 = !DILocation(line: 280, column: 40, scope: !346)
!348 = !DILocation(line: 280, column: 21, scope: !346)
!349 = !DILocation(line: 280, column: 85, scope: !346)
!350 = !DILocation(line: 280, column: 21, scope: !329)
!351 = !DILocation(line: 282, column: 21, scope: !352)
!352 = distinct !DILexicalBlock(scope: !346, file: !32, line: 281, column: 17)
!353 = !DILocation(line: 284, column: 28, scope: !354)
!354 = distinct !DILexicalBlock(scope: !329, file: !32, line: 284, column: 21)
!355 = !DILocation(line: 284, column: 21, scope: !354)
!356 = !DILocation(line: 284, column: 58, scope: !354)
!357 = !DILocation(line: 284, column: 21, scope: !329)
!358 = !DILocation(line: 286, column: 21, scope: !359)
!359 = distinct !DILexicalBlock(scope: !354, file: !32, line: 285, column: 17)
!360 = !DILocation(line: 288, column: 39, scope: !329)
!361 = !DILocation(line: 288, column: 32, scope: !329)
!362 = !DILocation(line: 288, column: 30, scope: !329)
!363 = !DILocation(line: 289, column: 21, scope: !364)
!364 = distinct !DILexicalBlock(scope: !329, file: !32, line: 289, column: 21)
!365 = !DILocation(line: 289, column: 34, scope: !364)
!366 = !DILocation(line: 289, column: 21, scope: !329)
!367 = !DILocation(line: 291, column: 21, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !32, line: 290, column: 17)
!369 = !DILocation(line: 294, column: 35, scope: !329)
!370 = !DILocation(line: 294, column: 49, scope: !329)
!371 = !DILocation(line: 294, column: 30, scope: !329)
!372 = !DILocation(line: 294, column: 28, scope: !329)
!373 = !DILocation(line: 295, column: 21, scope: !374)
!374 = distinct !DILexicalBlock(scope: !329, file: !32, line: 295, column: 21)
!375 = !DILocation(line: 295, column: 32, scope: !374)
!376 = !DILocation(line: 295, column: 48, scope: !374)
!377 = !DILocation(line: 295, column: 51, scope: !374)
!378 = !DILocation(line: 295, column: 62, scope: !374)
!379 = !DILocation(line: 295, column: 21, scope: !329)
!380 = !DILocation(line: 297, column: 21, scope: !381)
!381 = distinct !DILexicalBlock(scope: !374, file: !32, line: 296, column: 17)
!382 = !DILocation(line: 300, column: 29, scope: !329)
!383 = !DILocation(line: 300, column: 17, scope: !329)
!384 = !DILocation(line: 300, column: 41, scope: !329)
!385 = !DILocation(line: 302, column: 29, scope: !329)
!386 = !DILocation(line: 302, column: 24, scope: !329)
!387 = !DILocation(line: 302, column: 22, scope: !329)
!388 = !DILocation(line: 303, column: 13, scope: !329)
!389 = !DILocation(line: 305, column: 17, scope: !390)
!390 = distinct !DILexicalBlock(scope: !315, file: !32, line: 305, column: 17)
!391 = !DILocation(line: 305, column: 30, scope: !390)
!392 = !DILocation(line: 305, column: 17, scope: !315)
!393 = !DILocation(line: 307, column: 30, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !32, line: 306, column: 13)
!395 = !DILocation(line: 307, column: 17, scope: !394)
!396 = !DILocation(line: 308, column: 13, scope: !394)
!397 = !DILocation(line: 309, column: 17, scope: !398)
!398 = distinct !DILexicalBlock(scope: !315, file: !32, line: 309, column: 17)
!399 = !DILocation(line: 309, column: 30, scope: !398)
!400 = !DILocation(line: 309, column: 17, scope: !315)
!401 = !DILocation(line: 311, column: 30, scope: !402)
!402 = distinct !DILexicalBlock(scope: !398, file: !32, line: 310, column: 13)
!403 = !DILocation(line: 311, column: 17, scope: !402)
!404 = !DILocation(line: 312, column: 13, scope: !402)
!405 = !DILocalVariable(name: "buffer", scope: !406, file: !32, line: 324, type: !154)
!406 = distinct !DILexicalBlock(scope: !407, file: !32, line: 323, column: 9)
!407 = distinct !DILexicalBlock(scope: !408, file: !32, line: 322, column: 5)
!408 = distinct !DILexicalBlock(scope: !310, file: !32, line: 321, column: 8)
!409 = !DILocation(line: 324, column: 17, scope: !406)
!410 = !DILocation(line: 326, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !406, file: !32, line: 326, column: 17)
!412 = !DILocation(line: 326, column: 22, scope: !411)
!413 = !DILocation(line: 326, column: 27, scope: !411)
!414 = !DILocation(line: 326, column: 30, scope: !411)
!415 = !DILocation(line: 326, column: 35, scope: !411)
!416 = !DILocation(line: 326, column: 17, scope: !406)
!417 = !DILocation(line: 328, column: 37, scope: !418)
!418 = distinct !DILexicalBlock(scope: !411, file: !32, line: 327, column: 13)
!419 = !DILocation(line: 328, column: 30, scope: !418)
!420 = !DILocation(line: 328, column: 17, scope: !418)
!421 = !DILocation(line: 329, column: 13, scope: !418)
!422 = !DILocation(line: 332, column: 17, scope: !423)
!423 = distinct !DILexicalBlock(scope: !411, file: !32, line: 331, column: 13)
!424 = !DILocation(line: 336, column: 1, scope: !310)
!425 = distinct !DISubprogram(name: "goodG2B1", scope: !32, file: !32, line: 339, type: !33, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!426 = !DILocalVariable(name: "data", scope: !425, file: !32, line: 341, type: !37)
!427 = !DILocation(line: 341, column: 9, scope: !425)
!428 = !DILocation(line: 343, column: 10, scope: !425)
!429 = !DILocation(line: 353, column: 14, scope: !430)
!430 = distinct !DILexicalBlock(scope: !431, file: !32, line: 350, column: 5)
!431 = distinct !DILexicalBlock(scope: !425, file: !32, line: 344, column: 8)
!432 = !DILocalVariable(name: "buffer", scope: !433, file: !32, line: 358, type: !154)
!433 = distinct !DILexicalBlock(scope: !434, file: !32, line: 357, column: 9)
!434 = distinct !DILexicalBlock(scope: !435, file: !32, line: 356, column: 5)
!435 = distinct !DILexicalBlock(scope: !425, file: !32, line: 355, column: 8)
!436 = !DILocation(line: 358, column: 17, scope: !433)
!437 = !DILocation(line: 361, column: 17, scope: !438)
!438 = distinct !DILexicalBlock(scope: !433, file: !32, line: 361, column: 17)
!439 = !DILocation(line: 361, column: 22, scope: !438)
!440 = !DILocation(line: 361, column: 17, scope: !433)
!441 = !DILocation(line: 363, column: 37, scope: !442)
!442 = distinct !DILexicalBlock(scope: !438, file: !32, line: 362, column: 13)
!443 = !DILocation(line: 363, column: 30, scope: !442)
!444 = !DILocation(line: 363, column: 17, scope: !442)
!445 = !DILocation(line: 364, column: 13, scope: !442)
!446 = !DILocation(line: 367, column: 17, scope: !447)
!447 = distinct !DILexicalBlock(scope: !438, file: !32, line: 366, column: 13)
!448 = !DILocation(line: 371, column: 1, scope: !425)
!449 = distinct !DISubprogram(name: "goodG2B2", scope: !32, file: !32, line: 374, type: !33, scopeLine: 375, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!450 = !DILocalVariable(name: "data", scope: !449, file: !32, line: 376, type: !37)
!451 = !DILocation(line: 376, column: 9, scope: !449)
!452 = !DILocation(line: 378, column: 10, scope: !449)
!453 = !DILocation(line: 383, column: 14, scope: !454)
!454 = distinct !DILexicalBlock(scope: !455, file: !32, line: 380, column: 5)
!455 = distinct !DILexicalBlock(scope: !449, file: !32, line: 379, column: 8)
!456 = !DILocalVariable(name: "buffer", scope: !457, file: !32, line: 388, type: !154)
!457 = distinct !DILexicalBlock(scope: !458, file: !32, line: 387, column: 9)
!458 = distinct !DILexicalBlock(scope: !459, file: !32, line: 386, column: 5)
!459 = distinct !DILexicalBlock(scope: !449, file: !32, line: 385, column: 8)
!460 = !DILocation(line: 388, column: 17, scope: !457)
!461 = !DILocation(line: 391, column: 17, scope: !462)
!462 = distinct !DILexicalBlock(scope: !457, file: !32, line: 391, column: 17)
!463 = !DILocation(line: 391, column: 22, scope: !462)
!464 = !DILocation(line: 391, column: 17, scope: !457)
!465 = !DILocation(line: 393, column: 37, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !32, line: 392, column: 13)
!467 = !DILocation(line: 393, column: 30, scope: !466)
!468 = !DILocation(line: 393, column: 17, scope: !466)
!469 = !DILocation(line: 394, column: 13, scope: !466)
!470 = !DILocation(line: 397, column: 17, scope: !471)
!471 = distinct !DILexicalBlock(scope: !462, file: !32, line: 396, column: 13)
!472 = !DILocation(line: 401, column: 1, scope: !449)
