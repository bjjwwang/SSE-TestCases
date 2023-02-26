; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_listen_socket_13_bad() #0 !dbg !31 {
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
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !40
  %cmp = icmp eq i32 %0, 5, !dbg !42
  br i1 %cmp, label %if.then, label %if.end34, !dbg !43

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !44, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !48, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 -1, i32* %listenSocket, align 4, !dbg !70
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %acceptSocket, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  br label %do.body, !dbg !75

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !76
  store i32 %call, i32* %listenSocket, align 4, !dbg !78
  %1 = load i32, i32* %listenSocket, align 4, !dbg !79
  %cmp1 = icmp eq i32 %1, -1, !dbg !81
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !82

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !83

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !85
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !86
  store i8 2, i8* %sin_family, align 1, !dbg !87
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !88
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !89
  store i32 0, i32* %s_addr, align 4, !dbg !90
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !91
  store i16 -30871, i16* %sin_port, align 2, !dbg !92
  %3 = load i32, i32* %listenSocket, align 4, !dbg !93
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !95
  %call3 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !96
  %cmp4 = icmp eq i32 %call3, -1, !dbg !97
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !98

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !99

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !101
  %call7 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !103
  %cmp8 = icmp eq i32 %call7, -1, !dbg !104
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !105

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !106

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !108
  %call11 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !109
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !110
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !111
  %cmp12 = icmp eq i32 %7, -1, !dbg !113
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !114

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !115

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !117
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !118
  %call15 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !119
  %conv = trunc i64 %call15 to i32, !dbg !119
  store i32 %conv, i32* %recvResult, align 4, !dbg !120
  %9 = load i32, i32* %recvResult, align 4, !dbg !121
  %cmp16 = icmp eq i32 %9, -1, !dbg !123
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !124

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !125
  %cmp18 = icmp eq i32 %10, 0, !dbg !126
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !127

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !128

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !130
  %idxprom = sext i32 %11 to i64, !dbg !131
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !133
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !134
  store i32 %call23, i32* %data, align 4, !dbg !135
  br label %do.end, !dbg !136

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !137
  %cmp24 = icmp ne i32 %12, -1, !dbg !139
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !140

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !141
  %call27 = call i32 @"\01_close"(i32 noundef %13), !dbg !143
  br label %if.end28, !dbg !144

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !145
  %cmp29 = icmp ne i32 %14, -1, !dbg !147
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !148

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %call32 = call i32 @"\01_close"(i32 noundef %15), !dbg !151
  br label %if.end33, !dbg !152

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !153

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !154
  %cmp35 = icmp eq i32 %16, 5, !dbg !156
  br i1 %cmp35, label %if.then37, label %if.end44, !dbg !157

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !158, metadata !DIExpression()), !dbg !164
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !164
  %18 = load i32, i32* %data, align 4, !dbg !165
  %cmp38 = icmp sge i32 %18, 0, !dbg !167
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !168

if.then40:                                        ; preds = %if.then37
  %19 = load i32, i32* %data, align 4, !dbg !169
  %idxprom41 = sext i32 %19 to i64, !dbg !171
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !171
  %20 = load i32, i32* %arrayidx42, align 4, !dbg !171
  call void @printIntLine(i32 noundef %20), !dbg !172
  br label %if.end43, !dbg !173

if.else:                                          ; preds = %if.then37
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !174
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.then40
  br label %if.end44, !dbg !176

if.end44:                                         ; preds = %if.end43, %if.end34
  ret void, !dbg !177
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
define void @CWE126_Buffer_Overread__CWE129_listen_socket_13_good() #0 !dbg !178 {
entry:
  call void @goodB2G1(), !dbg !179
  call void @goodB2G2(), !dbg !180
  call void @goodG2B1(), !dbg !181
  call void @goodG2B2(), !dbg !182
  ret void, !dbg !183
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !184 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !189, metadata !DIExpression()), !dbg !190
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !191, metadata !DIExpression()), !dbg !192
  %call = call i64 @time(i64* noundef null), !dbg !193
  %conv = trunc i64 %call to i32, !dbg !194
  call void @srand(i32 noundef %conv), !dbg !195
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !196
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_13_good(), !dbg !197
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !198
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !199
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_13_bad(), !dbg !200
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !201
  ret i32 0, !dbg !202
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !203 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !204, metadata !DIExpression()), !dbg !205
  store i32 -1, i32* %data, align 4, !dbg !206
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !207
  %cmp = icmp eq i32 %0, 5, !dbg !209
  br i1 %cmp, label %if.then, label %if.end34, !dbg !210

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !211, metadata !DIExpression()), !dbg !214
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !215, metadata !DIExpression()), !dbg !216
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !217, metadata !DIExpression()), !dbg !218
  store i32 -1, i32* %listenSocket, align 4, !dbg !218
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %acceptSocket, align 4, !dbg !220
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !221, metadata !DIExpression()), !dbg !222
  br label %do.body, !dbg !223

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !224
  store i32 %call, i32* %listenSocket, align 4, !dbg !226
  %1 = load i32, i32* %listenSocket, align 4, !dbg !227
  %cmp1 = icmp eq i32 %1, -1, !dbg !229
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !230

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !231

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !233
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !233
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !234
  store i8 2, i8* %sin_family, align 1, !dbg !235
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !236
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !237
  store i32 0, i32* %s_addr, align 4, !dbg !238
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !239
  store i16 -30871, i16* %sin_port, align 2, !dbg !240
  %3 = load i32, i32* %listenSocket, align 4, !dbg !241
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !243
  %call3 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !244
  %cmp4 = icmp eq i32 %call3, -1, !dbg !245
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !246

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !247

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !249
  %call7 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !251
  %cmp8 = icmp eq i32 %call7, -1, !dbg !252
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !253

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !254

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !256
  %call11 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !257
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !258
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !259
  %cmp12 = icmp eq i32 %7, -1, !dbg !261
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !262

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !263

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !265
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !266
  %call15 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !267
  %conv = trunc i64 %call15 to i32, !dbg !267
  store i32 %conv, i32* %recvResult, align 4, !dbg !268
  %9 = load i32, i32* %recvResult, align 4, !dbg !269
  %cmp16 = icmp eq i32 %9, -1, !dbg !271
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !272

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !273
  %cmp18 = icmp eq i32 %10, 0, !dbg !274
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !275

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !276

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !278
  %idxprom = sext i32 %11 to i64, !dbg !279
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !279
  store i8 0, i8* %arrayidx, align 1, !dbg !280
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !281
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !282
  store i32 %call23, i32* %data, align 4, !dbg !283
  br label %do.end, !dbg !284

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !285
  %cmp24 = icmp ne i32 %12, -1, !dbg !287
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !288

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !289
  %call27 = call i32 @"\01_close"(i32 noundef %13), !dbg !291
  br label %if.end28, !dbg !292

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !293
  %cmp29 = icmp ne i32 %14, -1, !dbg !295
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !296

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !297
  %call32 = call i32 @"\01_close"(i32 noundef %15), !dbg !299
  br label %if.end33, !dbg !300

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !301

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !302
  %cmp35 = icmp ne i32 %16, 5, !dbg !304
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !305

if.then37:                                        ; preds = %if.end34
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !306
  br label %if.end47, !dbg !308

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !309, metadata !DIExpression()), !dbg !312
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !312
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !312
  %18 = load i32, i32* %data, align 4, !dbg !313
  %cmp38 = icmp sge i32 %18, 0, !dbg !315
  br i1 %cmp38, label %land.lhs.true, label %if.else45, !dbg !316

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !317
  %cmp40 = icmp slt i32 %19, 10, !dbg !318
  br i1 %cmp40, label %if.then42, label %if.else45, !dbg !319

if.then42:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !320
  %idxprom43 = sext i32 %20 to i64, !dbg !322
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !322
  %21 = load i32, i32* %arrayidx44, align 4, !dbg !322
  call void @printIntLine(i32 noundef %21), !dbg !323
  br label %if.end46, !dbg !324

if.else45:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !325
  br label %if.end46

if.end46:                                         ; preds = %if.else45, %if.then42
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then37
  ret void, !dbg !327
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !328 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !329, metadata !DIExpression()), !dbg !330
  store i32 -1, i32* %data, align 4, !dbg !331
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !332
  %cmp = icmp eq i32 %0, 5, !dbg !334
  br i1 %cmp, label %if.then, label %if.end34, !dbg !335

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !336, metadata !DIExpression()), !dbg !339
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !340, metadata !DIExpression()), !dbg !341
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !342, metadata !DIExpression()), !dbg !343
  store i32 -1, i32* %listenSocket, align 4, !dbg !343
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !344, metadata !DIExpression()), !dbg !345
  store i32 -1, i32* %acceptSocket, align 4, !dbg !345
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !346, metadata !DIExpression()), !dbg !347
  br label %do.body, !dbg !348

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !349
  store i32 %call, i32* %listenSocket, align 4, !dbg !351
  %1 = load i32, i32* %listenSocket, align 4, !dbg !352
  %cmp1 = icmp eq i32 %1, -1, !dbg !354
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !355

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !356

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !358
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !358
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !359
  store i8 2, i8* %sin_family, align 1, !dbg !360
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !361
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !362
  store i32 0, i32* %s_addr, align 4, !dbg !363
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !364
  store i16 -30871, i16* %sin_port, align 2, !dbg !365
  %3 = load i32, i32* %listenSocket, align 4, !dbg !366
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !368
  %call3 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !369
  %cmp4 = icmp eq i32 %call3, -1, !dbg !370
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !371

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !372

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !374
  %call7 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !376
  %cmp8 = icmp eq i32 %call7, -1, !dbg !377
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !378

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !379

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !381
  %call11 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !382
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !383
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !384
  %cmp12 = icmp eq i32 %7, -1, !dbg !386
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !387

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !388

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !390
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !391
  %call15 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !392
  %conv = trunc i64 %call15 to i32, !dbg !392
  store i32 %conv, i32* %recvResult, align 4, !dbg !393
  %9 = load i32, i32* %recvResult, align 4, !dbg !394
  %cmp16 = icmp eq i32 %9, -1, !dbg !396
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !397

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !398
  %cmp18 = icmp eq i32 %10, 0, !dbg !399
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !400

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !401

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !403
  %idxprom = sext i32 %11 to i64, !dbg !404
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !404
  store i8 0, i8* %arrayidx, align 1, !dbg !405
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !406
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !407
  store i32 %call23, i32* %data, align 4, !dbg !408
  br label %do.end, !dbg !409

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !410
  %cmp24 = icmp ne i32 %12, -1, !dbg !412
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !413

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !414
  %call27 = call i32 @"\01_close"(i32 noundef %13), !dbg !416
  br label %if.end28, !dbg !417

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !418
  %cmp29 = icmp ne i32 %14, -1, !dbg !420
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !421

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !422
  %call32 = call i32 @"\01_close"(i32 noundef %15), !dbg !424
  br label %if.end33, !dbg !425

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !426

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !427
  %cmp35 = icmp eq i32 %16, 5, !dbg !429
  br i1 %cmp35, label %if.then37, label %if.end46, !dbg !430

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !431, metadata !DIExpression()), !dbg !434
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !434
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !434
  %18 = load i32, i32* %data, align 4, !dbg !435
  %cmp38 = icmp sge i32 %18, 0, !dbg !437
  br i1 %cmp38, label %land.lhs.true, label %if.else, !dbg !438

land.lhs.true:                                    ; preds = %if.then37
  %19 = load i32, i32* %data, align 4, !dbg !439
  %cmp40 = icmp slt i32 %19, 10, !dbg !440
  br i1 %cmp40, label %if.then42, label %if.else, !dbg !441

if.then42:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !442
  %idxprom43 = sext i32 %20 to i64, !dbg !444
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !444
  %21 = load i32, i32* %arrayidx44, align 4, !dbg !444
  call void @printIntLine(i32 noundef %21), !dbg !445
  br label %if.end45, !dbg !446

if.else:                                          ; preds = %land.lhs.true, %if.then37
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !447
  br label %if.end45

if.end45:                                         ; preds = %if.else, %if.then42
  br label %if.end46, !dbg !449

if.end46:                                         ; preds = %if.end45, %if.end34
  ret void, !dbg !450
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !451 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !452, metadata !DIExpression()), !dbg !453
  store i32 -1, i32* %data, align 4, !dbg !454
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !455
  %cmp = icmp ne i32 %0, 5, !dbg !457
  br i1 %cmp, label %if.then, label %if.else, !dbg !458

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !459
  br label %if.end, !dbg !461

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !462
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !464
  %cmp1 = icmp eq i32 %1, 5, !dbg !466
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !467

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !468, metadata !DIExpression()), !dbg !471
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !471
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !471
  %3 = load i32, i32* %data, align 4, !dbg !472
  %cmp3 = icmp sge i32 %3, 0, !dbg !474
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !475

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !476
  %idxprom = sext i32 %4 to i64, !dbg !478
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !478
  %5 = load i32, i32* %arrayidx, align 4, !dbg !478
  call void @printIntLine(i32 noundef %5), !dbg !479
  br label %if.end6, !dbg !480

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !481
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !483

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !484
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !485 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !486, metadata !DIExpression()), !dbg !487
  store i32 -1, i32* %data, align 4, !dbg !488
  %0 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !489
  %cmp = icmp eq i32 %0, 5, !dbg !491
  br i1 %cmp, label %if.then, label %if.end, !dbg !492

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !493
  br label %if.end, !dbg !495

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !496
  %cmp1 = icmp eq i32 %1, 5, !dbg !498
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !499

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !500, metadata !DIExpression()), !dbg !503
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !503
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !503
  %3 = load i32, i32* %data, align 4, !dbg !504
  %cmp3 = icmp sge i32 %3, 0, !dbg !506
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !507

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !508
  %idxprom = sext i32 %4 to i64, !dbg !510
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !510
  %5 = load i32, i32* %arrayidx, align 4, !dbg !510
  call void @printIntLine(i32 noundef %5), !dbg !511
  br label %if.end5, !dbg !512

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !513
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !515

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !516
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_13_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocation(line: 48, column: 10, scope: !31)
!40 = !DILocation(line: 49, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !31, file: !32, line: 49, column: 8)
!42 = !DILocation(line: 49, column: 25, scope: !41)
!43 = !DILocation(line: 49, column: 8, scope: !31)
!44 = !DILocalVariable(name: "recvResult", scope: !45, file: !32, line: 56, type: !37)
!45 = distinct !DILexicalBlock(scope: !46, file: !32, line: 51, column: 9)
!46 = distinct !DILexicalBlock(scope: !41, file: !32, line: 50, column: 5)
!47 = !DILocation(line: 56, column: 17, scope: !45)
!48 = !DILocalVariable(name: "service", scope: !45, file: !32, line: 57, type: !49)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !50, line: 375, size: 128, elements: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!51 = !{!52, !53, !54, !57, !64}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !49, file: !50, line: 376, baseType: !14, size: 8)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !49, file: !50, line: 377, baseType: !17, size: 8, offset: 8)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !49, file: !50, line: 378, baseType: !55, size: 16, offset: 16)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !56, line: 31, baseType: !6)
!56 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !49, file: !50, line: 379, baseType: !58, size: 32, offset: 32)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !50, line: 301, size: 32, elements: !59)
!59 = !{!60}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !58, file: !50, line: 302, baseType: !61, size: 32)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !62, line: 31, baseType: !63)
!62 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 47, baseType: !5)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !49, file: !50, line: 380, baseType: !65, size: 64, offset: 64)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 64, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 8)
!68 = !DILocation(line: 57, column: 32, scope: !45)
!69 = !DILocalVariable(name: "listenSocket", scope: !45, file: !32, line: 58, type: !37)
!70 = !DILocation(line: 58, column: 20, scope: !45)
!71 = !DILocalVariable(name: "acceptSocket", scope: !45, file: !32, line: 59, type: !37)
!72 = !DILocation(line: 59, column: 20, scope: !45)
!73 = !DILocalVariable(name: "inputBuffer", scope: !45, file: !32, line: 60, type: !20)
!74 = !DILocation(line: 60, column: 18, scope: !45)
!75 = !DILocation(line: 61, column: 13, scope: !45)
!76 = !DILocation(line: 71, column: 32, scope: !77)
!77 = distinct !DILexicalBlock(scope: !45, file: !32, line: 62, column: 13)
!78 = !DILocation(line: 71, column: 30, scope: !77)
!79 = !DILocation(line: 72, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !32, line: 72, column: 21)
!81 = !DILocation(line: 72, column: 34, scope: !80)
!82 = !DILocation(line: 72, column: 21, scope: !77)
!83 = !DILocation(line: 74, column: 21, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !32, line: 73, column: 17)
!85 = !DILocation(line: 76, column: 17, scope: !77)
!86 = !DILocation(line: 77, column: 25, scope: !77)
!87 = !DILocation(line: 77, column: 36, scope: !77)
!88 = !DILocation(line: 78, column: 25, scope: !77)
!89 = !DILocation(line: 78, column: 34, scope: !77)
!90 = !DILocation(line: 78, column: 41, scope: !77)
!91 = !DILocation(line: 79, column: 25, scope: !77)
!92 = !DILocation(line: 79, column: 34, scope: !77)
!93 = !DILocation(line: 80, column: 26, scope: !94)
!94 = distinct !DILexicalBlock(scope: !77, file: !32, line: 80, column: 21)
!95 = !DILocation(line: 80, column: 40, scope: !94)
!96 = !DILocation(line: 80, column: 21, scope: !94)
!97 = !DILocation(line: 80, column: 85, scope: !94)
!98 = !DILocation(line: 80, column: 21, scope: !77)
!99 = !DILocation(line: 82, column: 21, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !32, line: 81, column: 17)
!101 = !DILocation(line: 84, column: 28, scope: !102)
!102 = distinct !DILexicalBlock(scope: !77, file: !32, line: 84, column: 21)
!103 = !DILocation(line: 84, column: 21, scope: !102)
!104 = !DILocation(line: 84, column: 58, scope: !102)
!105 = !DILocation(line: 84, column: 21, scope: !77)
!106 = !DILocation(line: 86, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !102, file: !32, line: 85, column: 17)
!108 = !DILocation(line: 88, column: 39, scope: !77)
!109 = !DILocation(line: 88, column: 32, scope: !77)
!110 = !DILocation(line: 88, column: 30, scope: !77)
!111 = !DILocation(line: 89, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !77, file: !32, line: 89, column: 21)
!113 = !DILocation(line: 89, column: 34, scope: !112)
!114 = !DILocation(line: 89, column: 21, scope: !77)
!115 = !DILocation(line: 91, column: 21, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !32, line: 90, column: 17)
!117 = !DILocation(line: 94, column: 35, scope: !77)
!118 = !DILocation(line: 94, column: 49, scope: !77)
!119 = !DILocation(line: 94, column: 30, scope: !77)
!120 = !DILocation(line: 94, column: 28, scope: !77)
!121 = !DILocation(line: 95, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !77, file: !32, line: 95, column: 21)
!123 = !DILocation(line: 95, column: 32, scope: !122)
!124 = !DILocation(line: 95, column: 48, scope: !122)
!125 = !DILocation(line: 95, column: 51, scope: !122)
!126 = !DILocation(line: 95, column: 62, scope: !122)
!127 = !DILocation(line: 95, column: 21, scope: !77)
!128 = !DILocation(line: 97, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !32, line: 96, column: 17)
!130 = !DILocation(line: 100, column: 29, scope: !77)
!131 = !DILocation(line: 100, column: 17, scope: !77)
!132 = !DILocation(line: 100, column: 41, scope: !77)
!133 = !DILocation(line: 102, column: 29, scope: !77)
!134 = !DILocation(line: 102, column: 24, scope: !77)
!135 = !DILocation(line: 102, column: 22, scope: !77)
!136 = !DILocation(line: 103, column: 13, scope: !77)
!137 = !DILocation(line: 105, column: 17, scope: !138)
!138 = distinct !DILexicalBlock(scope: !45, file: !32, line: 105, column: 17)
!139 = !DILocation(line: 105, column: 30, scope: !138)
!140 = !DILocation(line: 105, column: 17, scope: !45)
!141 = !DILocation(line: 107, column: 30, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !32, line: 106, column: 13)
!143 = !DILocation(line: 107, column: 17, scope: !142)
!144 = !DILocation(line: 108, column: 13, scope: !142)
!145 = !DILocation(line: 109, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !45, file: !32, line: 109, column: 17)
!147 = !DILocation(line: 109, column: 30, scope: !146)
!148 = !DILocation(line: 109, column: 17, scope: !45)
!149 = !DILocation(line: 111, column: 30, scope: !150)
!150 = distinct !DILexicalBlock(scope: !146, file: !32, line: 110, column: 13)
!151 = !DILocation(line: 111, column: 17, scope: !150)
!152 = !DILocation(line: 112, column: 13, scope: !150)
!153 = !DILocation(line: 120, column: 5, scope: !46)
!154 = !DILocation(line: 121, column: 8, scope: !155)
!155 = distinct !DILexicalBlock(scope: !31, file: !32, line: 121, column: 8)
!156 = !DILocation(line: 121, column: 25, scope: !155)
!157 = !DILocation(line: 121, column: 8, scope: !31)
!158 = !DILocalVariable(name: "buffer", scope: !159, file: !32, line: 124, type: !161)
!159 = distinct !DILexicalBlock(scope: !160, file: !32, line: 123, column: 9)
!160 = distinct !DILexicalBlock(scope: !155, file: !32, line: 122, column: 5)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !162)
!162 = !{!163}
!163 = !DISubrange(count: 10)
!164 = !DILocation(line: 124, column: 17, scope: !159)
!165 = !DILocation(line: 127, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !32, line: 127, column: 17)
!167 = !DILocation(line: 127, column: 22, scope: !166)
!168 = !DILocation(line: 127, column: 17, scope: !159)
!169 = !DILocation(line: 129, column: 37, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !32, line: 128, column: 13)
!171 = !DILocation(line: 129, column: 30, scope: !170)
!172 = !DILocation(line: 129, column: 17, scope: !170)
!173 = !DILocation(line: 130, column: 13, scope: !170)
!174 = !DILocation(line: 133, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !166, file: !32, line: 132, column: 13)
!176 = !DILocation(line: 136, column: 5, scope: !160)
!177 = !DILocation(line: 137, column: 1, scope: !31)
!178 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_13_good", scope: !32, file: !32, line: 403, type: !33, scopeLine: 404, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!179 = !DILocation(line: 405, column: 5, scope: !178)
!180 = !DILocation(line: 406, column: 5, scope: !178)
!181 = !DILocation(line: 407, column: 5, scope: !178)
!182 = !DILocation(line: 408, column: 5, scope: !178)
!183 = !DILocation(line: 409, column: 1, scope: !178)
!184 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 420, type: !185, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!185 = !DISubroutineType(types: !186)
!186 = !{!37, !37, !187}
!187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !188, size: 64)
!188 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!189 = !DILocalVariable(name: "argc", arg: 1, scope: !184, file: !32, line: 420, type: !37)
!190 = !DILocation(line: 420, column: 14, scope: !184)
!191 = !DILocalVariable(name: "argv", arg: 2, scope: !184, file: !32, line: 420, type: !187)
!192 = !DILocation(line: 420, column: 27, scope: !184)
!193 = !DILocation(line: 423, column: 22, scope: !184)
!194 = !DILocation(line: 423, column: 12, scope: !184)
!195 = !DILocation(line: 423, column: 5, scope: !184)
!196 = !DILocation(line: 425, column: 5, scope: !184)
!197 = !DILocation(line: 426, column: 5, scope: !184)
!198 = !DILocation(line: 427, column: 5, scope: !184)
!199 = !DILocation(line: 430, column: 5, scope: !184)
!200 = !DILocation(line: 431, column: 5, scope: !184)
!201 = !DILocation(line: 432, column: 5, scope: !184)
!202 = !DILocation(line: 434, column: 5, scope: !184)
!203 = distinct !DISubprogram(name: "goodB2G1", scope: !32, file: !32, line: 144, type: !33, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!204 = !DILocalVariable(name: "data", scope: !203, file: !32, line: 146, type: !37)
!205 = !DILocation(line: 146, column: 9, scope: !203)
!206 = !DILocation(line: 148, column: 10, scope: !203)
!207 = !DILocation(line: 149, column: 8, scope: !208)
!208 = distinct !DILexicalBlock(scope: !203, file: !32, line: 149, column: 8)
!209 = !DILocation(line: 149, column: 25, scope: !208)
!210 = !DILocation(line: 149, column: 8, scope: !203)
!211 = !DILocalVariable(name: "recvResult", scope: !212, file: !32, line: 156, type: !37)
!212 = distinct !DILexicalBlock(scope: !213, file: !32, line: 151, column: 9)
!213 = distinct !DILexicalBlock(scope: !208, file: !32, line: 150, column: 5)
!214 = !DILocation(line: 156, column: 17, scope: !212)
!215 = !DILocalVariable(name: "service", scope: !212, file: !32, line: 157, type: !49)
!216 = !DILocation(line: 157, column: 32, scope: !212)
!217 = !DILocalVariable(name: "listenSocket", scope: !212, file: !32, line: 158, type: !37)
!218 = !DILocation(line: 158, column: 20, scope: !212)
!219 = !DILocalVariable(name: "acceptSocket", scope: !212, file: !32, line: 159, type: !37)
!220 = !DILocation(line: 159, column: 20, scope: !212)
!221 = !DILocalVariable(name: "inputBuffer", scope: !212, file: !32, line: 160, type: !20)
!222 = !DILocation(line: 160, column: 18, scope: !212)
!223 = !DILocation(line: 161, column: 13, scope: !212)
!224 = !DILocation(line: 171, column: 32, scope: !225)
!225 = distinct !DILexicalBlock(scope: !212, file: !32, line: 162, column: 13)
!226 = !DILocation(line: 171, column: 30, scope: !225)
!227 = !DILocation(line: 172, column: 21, scope: !228)
!228 = distinct !DILexicalBlock(scope: !225, file: !32, line: 172, column: 21)
!229 = !DILocation(line: 172, column: 34, scope: !228)
!230 = !DILocation(line: 172, column: 21, scope: !225)
!231 = !DILocation(line: 174, column: 21, scope: !232)
!232 = distinct !DILexicalBlock(scope: !228, file: !32, line: 173, column: 17)
!233 = !DILocation(line: 176, column: 17, scope: !225)
!234 = !DILocation(line: 177, column: 25, scope: !225)
!235 = !DILocation(line: 177, column: 36, scope: !225)
!236 = !DILocation(line: 178, column: 25, scope: !225)
!237 = !DILocation(line: 178, column: 34, scope: !225)
!238 = !DILocation(line: 178, column: 41, scope: !225)
!239 = !DILocation(line: 179, column: 25, scope: !225)
!240 = !DILocation(line: 179, column: 34, scope: !225)
!241 = !DILocation(line: 180, column: 26, scope: !242)
!242 = distinct !DILexicalBlock(scope: !225, file: !32, line: 180, column: 21)
!243 = !DILocation(line: 180, column: 40, scope: !242)
!244 = !DILocation(line: 180, column: 21, scope: !242)
!245 = !DILocation(line: 180, column: 85, scope: !242)
!246 = !DILocation(line: 180, column: 21, scope: !225)
!247 = !DILocation(line: 182, column: 21, scope: !248)
!248 = distinct !DILexicalBlock(scope: !242, file: !32, line: 181, column: 17)
!249 = !DILocation(line: 184, column: 28, scope: !250)
!250 = distinct !DILexicalBlock(scope: !225, file: !32, line: 184, column: 21)
!251 = !DILocation(line: 184, column: 21, scope: !250)
!252 = !DILocation(line: 184, column: 58, scope: !250)
!253 = !DILocation(line: 184, column: 21, scope: !225)
!254 = !DILocation(line: 186, column: 21, scope: !255)
!255 = distinct !DILexicalBlock(scope: !250, file: !32, line: 185, column: 17)
!256 = !DILocation(line: 188, column: 39, scope: !225)
!257 = !DILocation(line: 188, column: 32, scope: !225)
!258 = !DILocation(line: 188, column: 30, scope: !225)
!259 = !DILocation(line: 189, column: 21, scope: !260)
!260 = distinct !DILexicalBlock(scope: !225, file: !32, line: 189, column: 21)
!261 = !DILocation(line: 189, column: 34, scope: !260)
!262 = !DILocation(line: 189, column: 21, scope: !225)
!263 = !DILocation(line: 191, column: 21, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !32, line: 190, column: 17)
!265 = !DILocation(line: 194, column: 35, scope: !225)
!266 = !DILocation(line: 194, column: 49, scope: !225)
!267 = !DILocation(line: 194, column: 30, scope: !225)
!268 = !DILocation(line: 194, column: 28, scope: !225)
!269 = !DILocation(line: 195, column: 21, scope: !270)
!270 = distinct !DILexicalBlock(scope: !225, file: !32, line: 195, column: 21)
!271 = !DILocation(line: 195, column: 32, scope: !270)
!272 = !DILocation(line: 195, column: 48, scope: !270)
!273 = !DILocation(line: 195, column: 51, scope: !270)
!274 = !DILocation(line: 195, column: 62, scope: !270)
!275 = !DILocation(line: 195, column: 21, scope: !225)
!276 = !DILocation(line: 197, column: 21, scope: !277)
!277 = distinct !DILexicalBlock(scope: !270, file: !32, line: 196, column: 17)
!278 = !DILocation(line: 200, column: 29, scope: !225)
!279 = !DILocation(line: 200, column: 17, scope: !225)
!280 = !DILocation(line: 200, column: 41, scope: !225)
!281 = !DILocation(line: 202, column: 29, scope: !225)
!282 = !DILocation(line: 202, column: 24, scope: !225)
!283 = !DILocation(line: 202, column: 22, scope: !225)
!284 = !DILocation(line: 203, column: 13, scope: !225)
!285 = !DILocation(line: 205, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !212, file: !32, line: 205, column: 17)
!287 = !DILocation(line: 205, column: 30, scope: !286)
!288 = !DILocation(line: 205, column: 17, scope: !212)
!289 = !DILocation(line: 207, column: 30, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !32, line: 206, column: 13)
!291 = !DILocation(line: 207, column: 17, scope: !290)
!292 = !DILocation(line: 208, column: 13, scope: !290)
!293 = !DILocation(line: 209, column: 17, scope: !294)
!294 = distinct !DILexicalBlock(scope: !212, file: !32, line: 209, column: 17)
!295 = !DILocation(line: 209, column: 30, scope: !294)
!296 = !DILocation(line: 209, column: 17, scope: !212)
!297 = !DILocation(line: 211, column: 30, scope: !298)
!298 = distinct !DILexicalBlock(scope: !294, file: !32, line: 210, column: 13)
!299 = !DILocation(line: 211, column: 17, scope: !298)
!300 = !DILocation(line: 212, column: 13, scope: !298)
!301 = !DILocation(line: 220, column: 5, scope: !213)
!302 = !DILocation(line: 221, column: 8, scope: !303)
!303 = distinct !DILexicalBlock(scope: !203, file: !32, line: 221, column: 8)
!304 = !DILocation(line: 221, column: 25, scope: !303)
!305 = !DILocation(line: 221, column: 8, scope: !203)
!306 = !DILocation(line: 224, column: 9, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !32, line: 222, column: 5)
!308 = !DILocation(line: 225, column: 5, scope: !307)
!309 = !DILocalVariable(name: "buffer", scope: !310, file: !32, line: 229, type: !161)
!310 = distinct !DILexicalBlock(scope: !311, file: !32, line: 228, column: 9)
!311 = distinct !DILexicalBlock(scope: !303, file: !32, line: 227, column: 5)
!312 = !DILocation(line: 229, column: 17, scope: !310)
!313 = !DILocation(line: 231, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !32, line: 231, column: 17)
!315 = !DILocation(line: 231, column: 22, scope: !314)
!316 = !DILocation(line: 231, column: 27, scope: !314)
!317 = !DILocation(line: 231, column: 30, scope: !314)
!318 = !DILocation(line: 231, column: 35, scope: !314)
!319 = !DILocation(line: 231, column: 17, scope: !310)
!320 = !DILocation(line: 233, column: 37, scope: !321)
!321 = distinct !DILexicalBlock(scope: !314, file: !32, line: 232, column: 13)
!322 = !DILocation(line: 233, column: 30, scope: !321)
!323 = !DILocation(line: 233, column: 17, scope: !321)
!324 = !DILocation(line: 234, column: 13, scope: !321)
!325 = !DILocation(line: 237, column: 17, scope: !326)
!326 = distinct !DILexicalBlock(scope: !314, file: !32, line: 236, column: 13)
!327 = !DILocation(line: 241, column: 1, scope: !203)
!328 = distinct !DISubprogram(name: "goodB2G2", scope: !32, file: !32, line: 244, type: !33, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!329 = !DILocalVariable(name: "data", scope: !328, file: !32, line: 246, type: !37)
!330 = !DILocation(line: 246, column: 9, scope: !328)
!331 = !DILocation(line: 248, column: 10, scope: !328)
!332 = !DILocation(line: 249, column: 8, scope: !333)
!333 = distinct !DILexicalBlock(scope: !328, file: !32, line: 249, column: 8)
!334 = !DILocation(line: 249, column: 25, scope: !333)
!335 = !DILocation(line: 249, column: 8, scope: !328)
!336 = !DILocalVariable(name: "recvResult", scope: !337, file: !32, line: 256, type: !37)
!337 = distinct !DILexicalBlock(scope: !338, file: !32, line: 251, column: 9)
!338 = distinct !DILexicalBlock(scope: !333, file: !32, line: 250, column: 5)
!339 = !DILocation(line: 256, column: 17, scope: !337)
!340 = !DILocalVariable(name: "service", scope: !337, file: !32, line: 257, type: !49)
!341 = !DILocation(line: 257, column: 32, scope: !337)
!342 = !DILocalVariable(name: "listenSocket", scope: !337, file: !32, line: 258, type: !37)
!343 = !DILocation(line: 258, column: 20, scope: !337)
!344 = !DILocalVariable(name: "acceptSocket", scope: !337, file: !32, line: 259, type: !37)
!345 = !DILocation(line: 259, column: 20, scope: !337)
!346 = !DILocalVariable(name: "inputBuffer", scope: !337, file: !32, line: 260, type: !20)
!347 = !DILocation(line: 260, column: 18, scope: !337)
!348 = !DILocation(line: 261, column: 13, scope: !337)
!349 = !DILocation(line: 271, column: 32, scope: !350)
!350 = distinct !DILexicalBlock(scope: !337, file: !32, line: 262, column: 13)
!351 = !DILocation(line: 271, column: 30, scope: !350)
!352 = !DILocation(line: 272, column: 21, scope: !353)
!353 = distinct !DILexicalBlock(scope: !350, file: !32, line: 272, column: 21)
!354 = !DILocation(line: 272, column: 34, scope: !353)
!355 = !DILocation(line: 272, column: 21, scope: !350)
!356 = !DILocation(line: 274, column: 21, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !32, line: 273, column: 17)
!358 = !DILocation(line: 276, column: 17, scope: !350)
!359 = !DILocation(line: 277, column: 25, scope: !350)
!360 = !DILocation(line: 277, column: 36, scope: !350)
!361 = !DILocation(line: 278, column: 25, scope: !350)
!362 = !DILocation(line: 278, column: 34, scope: !350)
!363 = !DILocation(line: 278, column: 41, scope: !350)
!364 = !DILocation(line: 279, column: 25, scope: !350)
!365 = !DILocation(line: 279, column: 34, scope: !350)
!366 = !DILocation(line: 280, column: 26, scope: !367)
!367 = distinct !DILexicalBlock(scope: !350, file: !32, line: 280, column: 21)
!368 = !DILocation(line: 280, column: 40, scope: !367)
!369 = !DILocation(line: 280, column: 21, scope: !367)
!370 = !DILocation(line: 280, column: 85, scope: !367)
!371 = !DILocation(line: 280, column: 21, scope: !350)
!372 = !DILocation(line: 282, column: 21, scope: !373)
!373 = distinct !DILexicalBlock(scope: !367, file: !32, line: 281, column: 17)
!374 = !DILocation(line: 284, column: 28, scope: !375)
!375 = distinct !DILexicalBlock(scope: !350, file: !32, line: 284, column: 21)
!376 = !DILocation(line: 284, column: 21, scope: !375)
!377 = !DILocation(line: 284, column: 58, scope: !375)
!378 = !DILocation(line: 284, column: 21, scope: !350)
!379 = !DILocation(line: 286, column: 21, scope: !380)
!380 = distinct !DILexicalBlock(scope: !375, file: !32, line: 285, column: 17)
!381 = !DILocation(line: 288, column: 39, scope: !350)
!382 = !DILocation(line: 288, column: 32, scope: !350)
!383 = !DILocation(line: 288, column: 30, scope: !350)
!384 = !DILocation(line: 289, column: 21, scope: !385)
!385 = distinct !DILexicalBlock(scope: !350, file: !32, line: 289, column: 21)
!386 = !DILocation(line: 289, column: 34, scope: !385)
!387 = !DILocation(line: 289, column: 21, scope: !350)
!388 = !DILocation(line: 291, column: 21, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !32, line: 290, column: 17)
!390 = !DILocation(line: 294, column: 35, scope: !350)
!391 = !DILocation(line: 294, column: 49, scope: !350)
!392 = !DILocation(line: 294, column: 30, scope: !350)
!393 = !DILocation(line: 294, column: 28, scope: !350)
!394 = !DILocation(line: 295, column: 21, scope: !395)
!395 = distinct !DILexicalBlock(scope: !350, file: !32, line: 295, column: 21)
!396 = !DILocation(line: 295, column: 32, scope: !395)
!397 = !DILocation(line: 295, column: 48, scope: !395)
!398 = !DILocation(line: 295, column: 51, scope: !395)
!399 = !DILocation(line: 295, column: 62, scope: !395)
!400 = !DILocation(line: 295, column: 21, scope: !350)
!401 = !DILocation(line: 297, column: 21, scope: !402)
!402 = distinct !DILexicalBlock(scope: !395, file: !32, line: 296, column: 17)
!403 = !DILocation(line: 300, column: 29, scope: !350)
!404 = !DILocation(line: 300, column: 17, scope: !350)
!405 = !DILocation(line: 300, column: 41, scope: !350)
!406 = !DILocation(line: 302, column: 29, scope: !350)
!407 = !DILocation(line: 302, column: 24, scope: !350)
!408 = !DILocation(line: 302, column: 22, scope: !350)
!409 = !DILocation(line: 303, column: 13, scope: !350)
!410 = !DILocation(line: 305, column: 17, scope: !411)
!411 = distinct !DILexicalBlock(scope: !337, file: !32, line: 305, column: 17)
!412 = !DILocation(line: 305, column: 30, scope: !411)
!413 = !DILocation(line: 305, column: 17, scope: !337)
!414 = !DILocation(line: 307, column: 30, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !32, line: 306, column: 13)
!416 = !DILocation(line: 307, column: 17, scope: !415)
!417 = !DILocation(line: 308, column: 13, scope: !415)
!418 = !DILocation(line: 309, column: 17, scope: !419)
!419 = distinct !DILexicalBlock(scope: !337, file: !32, line: 309, column: 17)
!420 = !DILocation(line: 309, column: 30, scope: !419)
!421 = !DILocation(line: 309, column: 17, scope: !337)
!422 = !DILocation(line: 311, column: 30, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !32, line: 310, column: 13)
!424 = !DILocation(line: 311, column: 17, scope: !423)
!425 = !DILocation(line: 312, column: 13, scope: !423)
!426 = !DILocation(line: 320, column: 5, scope: !338)
!427 = !DILocation(line: 321, column: 8, scope: !428)
!428 = distinct !DILexicalBlock(scope: !328, file: !32, line: 321, column: 8)
!429 = !DILocation(line: 321, column: 25, scope: !428)
!430 = !DILocation(line: 321, column: 8, scope: !328)
!431 = !DILocalVariable(name: "buffer", scope: !432, file: !32, line: 324, type: !161)
!432 = distinct !DILexicalBlock(scope: !433, file: !32, line: 323, column: 9)
!433 = distinct !DILexicalBlock(scope: !428, file: !32, line: 322, column: 5)
!434 = !DILocation(line: 324, column: 17, scope: !432)
!435 = !DILocation(line: 326, column: 17, scope: !436)
!436 = distinct !DILexicalBlock(scope: !432, file: !32, line: 326, column: 17)
!437 = !DILocation(line: 326, column: 22, scope: !436)
!438 = !DILocation(line: 326, column: 27, scope: !436)
!439 = !DILocation(line: 326, column: 30, scope: !436)
!440 = !DILocation(line: 326, column: 35, scope: !436)
!441 = !DILocation(line: 326, column: 17, scope: !432)
!442 = !DILocation(line: 328, column: 37, scope: !443)
!443 = distinct !DILexicalBlock(scope: !436, file: !32, line: 327, column: 13)
!444 = !DILocation(line: 328, column: 30, scope: !443)
!445 = !DILocation(line: 328, column: 17, scope: !443)
!446 = !DILocation(line: 329, column: 13, scope: !443)
!447 = !DILocation(line: 332, column: 17, scope: !448)
!448 = distinct !DILexicalBlock(scope: !436, file: !32, line: 331, column: 13)
!449 = !DILocation(line: 335, column: 5, scope: !433)
!450 = !DILocation(line: 336, column: 1, scope: !328)
!451 = distinct !DISubprogram(name: "goodG2B1", scope: !32, file: !32, line: 339, type: !33, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!452 = !DILocalVariable(name: "data", scope: !451, file: !32, line: 341, type: !37)
!453 = !DILocation(line: 341, column: 9, scope: !451)
!454 = !DILocation(line: 343, column: 10, scope: !451)
!455 = !DILocation(line: 344, column: 8, scope: !456)
!456 = distinct !DILexicalBlock(scope: !451, file: !32, line: 344, column: 8)
!457 = !DILocation(line: 344, column: 25, scope: !456)
!458 = !DILocation(line: 344, column: 8, scope: !451)
!459 = !DILocation(line: 347, column: 9, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !32, line: 345, column: 5)
!461 = !DILocation(line: 348, column: 5, scope: !460)
!462 = !DILocation(line: 353, column: 14, scope: !463)
!463 = distinct !DILexicalBlock(scope: !456, file: !32, line: 350, column: 5)
!464 = !DILocation(line: 355, column: 8, scope: !465)
!465 = distinct !DILexicalBlock(scope: !451, file: !32, line: 355, column: 8)
!466 = !DILocation(line: 355, column: 25, scope: !465)
!467 = !DILocation(line: 355, column: 8, scope: !451)
!468 = !DILocalVariable(name: "buffer", scope: !469, file: !32, line: 358, type: !161)
!469 = distinct !DILexicalBlock(scope: !470, file: !32, line: 357, column: 9)
!470 = distinct !DILexicalBlock(scope: !465, file: !32, line: 356, column: 5)
!471 = !DILocation(line: 358, column: 17, scope: !469)
!472 = !DILocation(line: 361, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !469, file: !32, line: 361, column: 17)
!474 = !DILocation(line: 361, column: 22, scope: !473)
!475 = !DILocation(line: 361, column: 17, scope: !469)
!476 = !DILocation(line: 363, column: 37, scope: !477)
!477 = distinct !DILexicalBlock(scope: !473, file: !32, line: 362, column: 13)
!478 = !DILocation(line: 363, column: 30, scope: !477)
!479 = !DILocation(line: 363, column: 17, scope: !477)
!480 = !DILocation(line: 364, column: 13, scope: !477)
!481 = !DILocation(line: 367, column: 17, scope: !482)
!482 = distinct !DILexicalBlock(scope: !473, file: !32, line: 366, column: 13)
!483 = !DILocation(line: 370, column: 5, scope: !470)
!484 = !DILocation(line: 371, column: 1, scope: !451)
!485 = distinct !DISubprogram(name: "goodG2B2", scope: !32, file: !32, line: 374, type: !33, scopeLine: 375, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!486 = !DILocalVariable(name: "data", scope: !485, file: !32, line: 376, type: !37)
!487 = !DILocation(line: 376, column: 9, scope: !485)
!488 = !DILocation(line: 378, column: 10, scope: !485)
!489 = !DILocation(line: 379, column: 8, scope: !490)
!490 = distinct !DILexicalBlock(scope: !485, file: !32, line: 379, column: 8)
!491 = !DILocation(line: 379, column: 25, scope: !490)
!492 = !DILocation(line: 379, column: 8, scope: !485)
!493 = !DILocation(line: 383, column: 14, scope: !494)
!494 = distinct !DILexicalBlock(scope: !490, file: !32, line: 380, column: 5)
!495 = !DILocation(line: 384, column: 5, scope: !494)
!496 = !DILocation(line: 385, column: 8, scope: !497)
!497 = distinct !DILexicalBlock(scope: !485, file: !32, line: 385, column: 8)
!498 = !DILocation(line: 385, column: 25, scope: !497)
!499 = !DILocation(line: 385, column: 8, scope: !485)
!500 = !DILocalVariable(name: "buffer", scope: !501, file: !32, line: 388, type: !161)
!501 = distinct !DILexicalBlock(scope: !502, file: !32, line: 387, column: 9)
!502 = distinct !DILexicalBlock(scope: !497, file: !32, line: 386, column: 5)
!503 = !DILocation(line: 388, column: 17, scope: !501)
!504 = !DILocation(line: 391, column: 17, scope: !505)
!505 = distinct !DILexicalBlock(scope: !501, file: !32, line: 391, column: 17)
!506 = !DILocation(line: 391, column: 22, scope: !505)
!507 = !DILocation(line: 391, column: 17, scope: !501)
!508 = !DILocation(line: 393, column: 37, scope: !509)
!509 = distinct !DILexicalBlock(scope: !505, file: !32, line: 392, column: 13)
!510 = !DILocation(line: 393, column: 30, scope: !509)
!511 = !DILocation(line: 393, column: 17, scope: !509)
!512 = !DILocation(line: 394, column: 13, scope: !509)
!513 = !DILocation(line: 397, column: 17, scope: !514)
!514 = distinct !DILexicalBlock(scope: !505, file: !32, line: 396, column: 13)
!515 = !DILocation(line: 400, column: 5, scope: !502)
!516 = !DILocation(line: 401, column: 1, scope: !485)
