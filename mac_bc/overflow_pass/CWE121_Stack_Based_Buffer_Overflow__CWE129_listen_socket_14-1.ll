; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_bad() #0 !dbg !31 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 -1, i32* %data, align 4, !dbg !39
  %0 = load i32, i32* @globalFive, align 4, !dbg !40
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
  %16 = load i32, i32* @globalFive, align 4, !dbg !154
  %cmp35 = icmp eq i32 %16, 5, !dbg !156
  br i1 %cmp35, label %if.then37, label %if.end48, !dbg !157

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !162, metadata !DIExpression()), !dbg !166
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !166
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !166
  %18 = load i32, i32* %data, align 4, !dbg !167
  %cmp38 = icmp sge i32 %18, 0, !dbg !169
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !170

if.then40:                                        ; preds = %if.then37
  %19 = load i32, i32* %data, align 4, !dbg !171
  %idxprom41 = sext i32 %19 to i64, !dbg !173
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !173
  store i32 1, i32* %arrayidx42, align 4, !dbg !174
  store i32 0, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.then40
  %20 = load i32, i32* %i, align 4, !dbg !178
  %cmp43 = icmp slt i32 %20, 10, !dbg !180
  br i1 %cmp43, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %21 = load i32, i32* %i, align 4, !dbg !182
  %idxprom45 = sext i32 %21 to i64, !dbg !184
  %arrayidx46 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom45, !dbg !184
  %22 = load i32, i32* %arrayidx46, align 4, !dbg !184
  call void @printIntLine(i32 noundef %22), !dbg !185
  br label %for.inc, !dbg !186

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !187
  %inc = add nsw i32 %23, 1, !dbg !187
  store i32 %inc, i32* %i, align 4, !dbg !187
  br label %for.cond, !dbg !188, !llvm.loop !189

for.end:                                          ; preds = %for.cond
  br label %if.end47, !dbg !192

if.else:                                          ; preds = %if.then37
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !193
  br label %if.end47

if.end47:                                         ; preds = %if.else, %for.end
  br label %if.end48, !dbg !195

if.end48:                                         ; preds = %if.end47, %if.end34
  ret void, !dbg !196
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_good() #0 !dbg !197 {
entry:
  call void @goodB2G1(), !dbg !198
  call void @goodB2G2(), !dbg !199
  call void @goodG2B1(), !dbg !200
  call void @goodG2B2(), !dbg !201
  ret void, !dbg !202
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !203 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !208, metadata !DIExpression()), !dbg !209
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !210, metadata !DIExpression()), !dbg !211
  %call = call i64 @time(i64* noundef null), !dbg !212
  %conv = trunc i64 %call to i32, !dbg !213
  call void @srand(i32 noundef %conv), !dbg !214
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !215
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_good(), !dbg !216
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !217
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !218
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_bad(), !dbg !219
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !220
  ret i32 0, !dbg !221
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !222 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 -1, i32* %data, align 4, !dbg !225
  %0 = load i32, i32* @globalFive, align 4, !dbg !226
  %cmp = icmp eq i32 %0, 5, !dbg !228
  br i1 %cmp, label %if.then, label %if.end34, !dbg !229

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !230, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !234, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !236, metadata !DIExpression()), !dbg !237
  store i32 -1, i32* %listenSocket, align 4, !dbg !237
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !238, metadata !DIExpression()), !dbg !239
  store i32 -1, i32* %acceptSocket, align 4, !dbg !239
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !240, metadata !DIExpression()), !dbg !241
  br label %do.body, !dbg !242

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !243
  store i32 %call, i32* %listenSocket, align 4, !dbg !245
  %1 = load i32, i32* %listenSocket, align 4, !dbg !246
  %cmp1 = icmp eq i32 %1, -1, !dbg !248
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !249

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !250

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !252
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !252
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !253
  store i8 2, i8* %sin_family, align 1, !dbg !254
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !255
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !256
  store i32 0, i32* %s_addr, align 4, !dbg !257
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !258
  store i16 -30871, i16* %sin_port, align 2, !dbg !259
  %3 = load i32, i32* %listenSocket, align 4, !dbg !260
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !262
  %call3 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !263
  %cmp4 = icmp eq i32 %call3, -1, !dbg !264
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !265

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !266

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !268
  %call7 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !270
  %cmp8 = icmp eq i32 %call7, -1, !dbg !271
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !272

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !273

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !275
  %call11 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !276
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !277
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !278
  %cmp12 = icmp eq i32 %7, -1, !dbg !280
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !281

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !282

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !284
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !285
  %call15 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !286
  %conv = trunc i64 %call15 to i32, !dbg !286
  store i32 %conv, i32* %recvResult, align 4, !dbg !287
  %9 = load i32, i32* %recvResult, align 4, !dbg !288
  %cmp16 = icmp eq i32 %9, -1, !dbg !290
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !291

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !292
  %cmp18 = icmp eq i32 %10, 0, !dbg !293
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !294

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !295

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !297
  %idxprom = sext i32 %11 to i64, !dbg !298
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !298
  store i8 0, i8* %arrayidx, align 1, !dbg !299
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !300
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !301
  store i32 %call23, i32* %data, align 4, !dbg !302
  br label %do.end, !dbg !303

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !304
  %cmp24 = icmp ne i32 %12, -1, !dbg !306
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !307

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !308
  %call27 = call i32 @"\01_close"(i32 noundef %13), !dbg !310
  br label %if.end28, !dbg !311

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !312
  %cmp29 = icmp ne i32 %14, -1, !dbg !314
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !315

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !316
  %call32 = call i32 @"\01_close"(i32 noundef %15), !dbg !318
  br label %if.end33, !dbg !319

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !320

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !321
  %cmp35 = icmp ne i32 %16, 5, !dbg !323
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !324

if.then37:                                        ; preds = %if.end34
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !325
  br label %if.end51, !dbg !327

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !328, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !332, metadata !DIExpression()), !dbg !333
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !333
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !333
  %18 = load i32, i32* %data, align 4, !dbg !334
  %cmp38 = icmp sge i32 %18, 0, !dbg !336
  br i1 %cmp38, label %land.lhs.true, label %if.else49, !dbg !337

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !338
  %cmp40 = icmp slt i32 %19, 10, !dbg !339
  br i1 %cmp40, label %if.then42, label %if.else49, !dbg !340

if.then42:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !341
  %idxprom43 = sext i32 %20 to i64, !dbg !343
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !343
  store i32 1, i32* %arrayidx44, align 4, !dbg !344
  store i32 0, i32* %i, align 4, !dbg !345
  br label %for.cond, !dbg !347

for.cond:                                         ; preds = %for.inc, %if.then42
  %21 = load i32, i32* %i, align 4, !dbg !348
  %cmp45 = icmp slt i32 %21, 10, !dbg !350
  br i1 %cmp45, label %for.body, label %for.end, !dbg !351

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !352
  %idxprom47 = sext i32 %22 to i64, !dbg !354
  %arrayidx48 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom47, !dbg !354
  %23 = load i32, i32* %arrayidx48, align 4, !dbg !354
  call void @printIntLine(i32 noundef %23), !dbg !355
  br label %for.inc, !dbg !356

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !357
  %inc = add nsw i32 %24, 1, !dbg !357
  store i32 %inc, i32* %i, align 4, !dbg !357
  br label %for.cond, !dbg !358, !llvm.loop !359

for.end:                                          ; preds = %for.cond
  br label %if.end50, !dbg !361

if.else49:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !362
  br label %if.end50

if.end50:                                         ; preds = %if.else49, %for.end
  br label %if.end51

if.end51:                                         ; preds = %if.end50, %if.then37
  ret void, !dbg !364
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !365 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !366, metadata !DIExpression()), !dbg !367
  store i32 -1, i32* %data, align 4, !dbg !368
  %0 = load i32, i32* @globalFive, align 4, !dbg !369
  %cmp = icmp eq i32 %0, 5, !dbg !371
  br i1 %cmp, label %if.then, label %if.end34, !dbg !372

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !373, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !377, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !379, metadata !DIExpression()), !dbg !380
  store i32 -1, i32* %listenSocket, align 4, !dbg !380
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !381, metadata !DIExpression()), !dbg !382
  store i32 -1, i32* %acceptSocket, align 4, !dbg !382
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !383, metadata !DIExpression()), !dbg !384
  br label %do.body, !dbg !385

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !386
  store i32 %call, i32* %listenSocket, align 4, !dbg !388
  %1 = load i32, i32* %listenSocket, align 4, !dbg !389
  %cmp1 = icmp eq i32 %1, -1, !dbg !391
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !392

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !393

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !395
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !395
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !396
  store i8 2, i8* %sin_family, align 1, !dbg !397
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !398
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !399
  store i32 0, i32* %s_addr, align 4, !dbg !400
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !401
  store i16 -30871, i16* %sin_port, align 2, !dbg !402
  %3 = load i32, i32* %listenSocket, align 4, !dbg !403
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !405
  %call3 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !406
  %cmp4 = icmp eq i32 %call3, -1, !dbg !407
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !408

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !409

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !411
  %call7 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !413
  %cmp8 = icmp eq i32 %call7, -1, !dbg !414
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !415

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !416

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !418
  %call11 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !419
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !420
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !421
  %cmp12 = icmp eq i32 %7, -1, !dbg !423
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !424

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !425

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !427
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !428
  %call15 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !429
  %conv = trunc i64 %call15 to i32, !dbg !429
  store i32 %conv, i32* %recvResult, align 4, !dbg !430
  %9 = load i32, i32* %recvResult, align 4, !dbg !431
  %cmp16 = icmp eq i32 %9, -1, !dbg !433
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !434

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !435
  %cmp18 = icmp eq i32 %10, 0, !dbg !436
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !437

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !438

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !440
  %idxprom = sext i32 %11 to i64, !dbg !441
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !441
  store i8 0, i8* %arrayidx, align 1, !dbg !442
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !443
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !444
  store i32 %call23, i32* %data, align 4, !dbg !445
  br label %do.end, !dbg !446

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !447
  %cmp24 = icmp ne i32 %12, -1, !dbg !449
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !450

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !451
  %call27 = call i32 @"\01_close"(i32 noundef %13), !dbg !453
  br label %if.end28, !dbg !454

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !455
  %cmp29 = icmp ne i32 %14, -1, !dbg !457
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !458

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !459
  %call32 = call i32 @"\01_close"(i32 noundef %15), !dbg !461
  br label %if.end33, !dbg !462

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !463

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @globalFive, align 4, !dbg !464
  %cmp35 = icmp eq i32 %16, 5, !dbg !466
  br i1 %cmp35, label %if.then37, label %if.end50, !dbg !467

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !468, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !472, metadata !DIExpression()), !dbg !473
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !473
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !473
  %18 = load i32, i32* %data, align 4, !dbg !474
  %cmp38 = icmp sge i32 %18, 0, !dbg !476
  br i1 %cmp38, label %land.lhs.true, label %if.else, !dbg !477

land.lhs.true:                                    ; preds = %if.then37
  %19 = load i32, i32* %data, align 4, !dbg !478
  %cmp40 = icmp slt i32 %19, 10, !dbg !479
  br i1 %cmp40, label %if.then42, label %if.else, !dbg !480

if.then42:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !481
  %idxprom43 = sext i32 %20 to i64, !dbg !483
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !483
  store i32 1, i32* %arrayidx44, align 4, !dbg !484
  store i32 0, i32* %i, align 4, !dbg !485
  br label %for.cond, !dbg !487

for.cond:                                         ; preds = %for.inc, %if.then42
  %21 = load i32, i32* %i, align 4, !dbg !488
  %cmp45 = icmp slt i32 %21, 10, !dbg !490
  br i1 %cmp45, label %for.body, label %for.end, !dbg !491

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !492
  %idxprom47 = sext i32 %22 to i64, !dbg !494
  %arrayidx48 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom47, !dbg !494
  %23 = load i32, i32* %arrayidx48, align 4, !dbg !494
  call void @printIntLine(i32 noundef %23), !dbg !495
  br label %for.inc, !dbg !496

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !497
  %inc = add nsw i32 %24, 1, !dbg !497
  store i32 %inc, i32* %i, align 4, !dbg !497
  br label %for.cond, !dbg !498, !llvm.loop !499

for.end:                                          ; preds = %for.cond
  br label %if.end49, !dbg !501

if.else:                                          ; preds = %land.lhs.true, %if.then37
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !502
  br label %if.end49

if.end49:                                         ; preds = %if.else, %for.end
  br label %if.end50, !dbg !504

if.end50:                                         ; preds = %if.end49, %if.end34
  ret void, !dbg !505
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !506 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !507, metadata !DIExpression()), !dbg !508
  store i32 -1, i32* %data, align 4, !dbg !509
  %0 = load i32, i32* @globalFive, align 4, !dbg !510
  %cmp = icmp ne i32 %0, 5, !dbg !512
  br i1 %cmp, label %if.then, label %if.else, !dbg !513

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !514
  br label %if.end, !dbg !516

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !517
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !519
  %cmp1 = icmp eq i32 %1, 5, !dbg !521
  br i1 %cmp1, label %if.then2, label %if.end10, !dbg !522

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !523, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !527, metadata !DIExpression()), !dbg !528
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !528
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !528
  %3 = load i32, i32* %data, align 4, !dbg !529
  %cmp3 = icmp sge i32 %3, 0, !dbg !531
  br i1 %cmp3, label %if.then4, label %if.else8, !dbg !532

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !533
  %idxprom = sext i32 %4 to i64, !dbg !535
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !535
  store i32 1, i32* %arrayidx, align 4, !dbg !536
  store i32 0, i32* %i, align 4, !dbg !537
  br label %for.cond, !dbg !539

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !540
  %cmp5 = icmp slt i32 %5, 10, !dbg !542
  br i1 %cmp5, label %for.body, label %for.end, !dbg !543

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !544
  %idxprom6 = sext i32 %6 to i64, !dbg !546
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !546
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !546
  call void @printIntLine(i32 noundef %7), !dbg !547
  br label %for.inc, !dbg !548

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !549
  %inc = add nsw i32 %8, 1, !dbg !549
  store i32 %inc, i32* %i, align 4, !dbg !549
  br label %for.cond, !dbg !550, !llvm.loop !551

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !553

if.else8:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !554
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !556

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !557
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !558 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !559, metadata !DIExpression()), !dbg !560
  store i32 -1, i32* %data, align 4, !dbg !561
  %0 = load i32, i32* @globalFive, align 4, !dbg !562
  %cmp = icmp eq i32 %0, 5, !dbg !564
  br i1 %cmp, label %if.then, label %if.end, !dbg !565

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !566
  br label %if.end, !dbg !568

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !569
  %cmp1 = icmp eq i32 %1, 5, !dbg !571
  br i1 %cmp1, label %if.then2, label %if.end9, !dbg !572

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !573, metadata !DIExpression()), !dbg !576
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !577, metadata !DIExpression()), !dbg !578
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !578
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !578
  %3 = load i32, i32* %data, align 4, !dbg !579
  %cmp3 = icmp sge i32 %3, 0, !dbg !581
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !582

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !583
  %idxprom = sext i32 %4 to i64, !dbg !585
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !585
  store i32 1, i32* %arrayidx, align 4, !dbg !586
  store i32 0, i32* %i, align 4, !dbg !587
  br label %for.cond, !dbg !589

for.cond:                                         ; preds = %for.inc, %if.then4
  %5 = load i32, i32* %i, align 4, !dbg !590
  %cmp5 = icmp slt i32 %5, 10, !dbg !592
  br i1 %cmp5, label %for.body, label %for.end, !dbg !593

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !594
  %idxprom6 = sext i32 %6 to i64, !dbg !596
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !596
  %7 = load i32, i32* %arrayidx7, align 4, !dbg !596
  call void @printIntLine(i32 noundef %7), !dbg !597
  br label %for.inc, !dbg !598

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !599
  %inc = add nsw i32 %8, 1, !dbg !599
  store i32 %inc, i32* %i, align 4, !dbg !599
  br label %for.cond, !dbg !600, !llvm.loop !601

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !603

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !604
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !606

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !607
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocation(line: 48, column: 10, scope: !31)
!40 = !DILocation(line: 49, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !31, file: !32, line: 49, column: 8)
!42 = !DILocation(line: 49, column: 18, scope: !41)
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
!156 = !DILocation(line: 121, column: 18, scope: !155)
!157 = !DILocation(line: 121, column: 8, scope: !31)
!158 = !DILocalVariable(name: "i", scope: !159, file: !32, line: 124, type: !37)
!159 = distinct !DILexicalBlock(scope: !160, file: !32, line: 123, column: 9)
!160 = distinct !DILexicalBlock(scope: !155, file: !32, line: 122, column: 5)
!161 = !DILocation(line: 124, column: 17, scope: !159)
!162 = !DILocalVariable(name: "buffer", scope: !159, file: !32, line: 125, type: !163)
!163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !164)
!164 = !{!165}
!165 = !DISubrange(count: 10)
!166 = !DILocation(line: 125, column: 17, scope: !159)
!167 = !DILocation(line: 128, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !159, file: !32, line: 128, column: 17)
!169 = !DILocation(line: 128, column: 22, scope: !168)
!170 = !DILocation(line: 128, column: 17, scope: !159)
!171 = !DILocation(line: 130, column: 24, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !32, line: 129, column: 13)
!173 = !DILocation(line: 130, column: 17, scope: !172)
!174 = !DILocation(line: 130, column: 30, scope: !172)
!175 = !DILocation(line: 132, column: 23, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !32, line: 132, column: 17)
!177 = !DILocation(line: 132, column: 21, scope: !176)
!178 = !DILocation(line: 132, column: 28, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !32, line: 132, column: 17)
!180 = !DILocation(line: 132, column: 30, scope: !179)
!181 = !DILocation(line: 132, column: 17, scope: !176)
!182 = !DILocation(line: 134, column: 41, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !32, line: 133, column: 17)
!184 = !DILocation(line: 134, column: 34, scope: !183)
!185 = !DILocation(line: 134, column: 21, scope: !183)
!186 = !DILocation(line: 135, column: 17, scope: !183)
!187 = !DILocation(line: 132, column: 37, scope: !179)
!188 = !DILocation(line: 132, column: 17, scope: !179)
!189 = distinct !{!189, !181, !190, !191}
!190 = !DILocation(line: 135, column: 17, scope: !176)
!191 = !{!"llvm.loop.mustprogress"}
!192 = !DILocation(line: 136, column: 13, scope: !172)
!193 = !DILocation(line: 139, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !168, file: !32, line: 138, column: 13)
!195 = !DILocation(line: 142, column: 5, scope: !160)
!196 = !DILocation(line: 143, column: 1, scope: !31)
!197 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_14_good", scope: !32, file: !32, line: 433, type: !33, scopeLine: 434, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!198 = !DILocation(line: 435, column: 5, scope: !197)
!199 = !DILocation(line: 436, column: 5, scope: !197)
!200 = !DILocation(line: 437, column: 5, scope: !197)
!201 = !DILocation(line: 438, column: 5, scope: !197)
!202 = !DILocation(line: 439, column: 1, scope: !197)
!203 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 450, type: !204, scopeLine: 451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!204 = !DISubroutineType(types: !205)
!205 = !{!37, !37, !206}
!206 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !207, size: 64)
!207 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!208 = !DILocalVariable(name: "argc", arg: 1, scope: !203, file: !32, line: 450, type: !37)
!209 = !DILocation(line: 450, column: 14, scope: !203)
!210 = !DILocalVariable(name: "argv", arg: 2, scope: !203, file: !32, line: 450, type: !206)
!211 = !DILocation(line: 450, column: 27, scope: !203)
!212 = !DILocation(line: 453, column: 22, scope: !203)
!213 = !DILocation(line: 453, column: 12, scope: !203)
!214 = !DILocation(line: 453, column: 5, scope: !203)
!215 = !DILocation(line: 455, column: 5, scope: !203)
!216 = !DILocation(line: 456, column: 5, scope: !203)
!217 = !DILocation(line: 457, column: 5, scope: !203)
!218 = !DILocation(line: 460, column: 5, scope: !203)
!219 = !DILocation(line: 461, column: 5, scope: !203)
!220 = !DILocation(line: 462, column: 5, scope: !203)
!221 = !DILocation(line: 464, column: 5, scope: !203)
!222 = distinct !DISubprogram(name: "goodB2G1", scope: !32, file: !32, line: 150, type: !33, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!223 = !DILocalVariable(name: "data", scope: !222, file: !32, line: 152, type: !37)
!224 = !DILocation(line: 152, column: 9, scope: !222)
!225 = !DILocation(line: 154, column: 10, scope: !222)
!226 = !DILocation(line: 155, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !32, line: 155, column: 8)
!228 = !DILocation(line: 155, column: 18, scope: !227)
!229 = !DILocation(line: 155, column: 8, scope: !222)
!230 = !DILocalVariable(name: "recvResult", scope: !231, file: !32, line: 162, type: !37)
!231 = distinct !DILexicalBlock(scope: !232, file: !32, line: 157, column: 9)
!232 = distinct !DILexicalBlock(scope: !227, file: !32, line: 156, column: 5)
!233 = !DILocation(line: 162, column: 17, scope: !231)
!234 = !DILocalVariable(name: "service", scope: !231, file: !32, line: 163, type: !49)
!235 = !DILocation(line: 163, column: 32, scope: !231)
!236 = !DILocalVariable(name: "listenSocket", scope: !231, file: !32, line: 164, type: !37)
!237 = !DILocation(line: 164, column: 20, scope: !231)
!238 = !DILocalVariable(name: "acceptSocket", scope: !231, file: !32, line: 165, type: !37)
!239 = !DILocation(line: 165, column: 20, scope: !231)
!240 = !DILocalVariable(name: "inputBuffer", scope: !231, file: !32, line: 166, type: !20)
!241 = !DILocation(line: 166, column: 18, scope: !231)
!242 = !DILocation(line: 167, column: 13, scope: !231)
!243 = !DILocation(line: 177, column: 32, scope: !244)
!244 = distinct !DILexicalBlock(scope: !231, file: !32, line: 168, column: 13)
!245 = !DILocation(line: 177, column: 30, scope: !244)
!246 = !DILocation(line: 178, column: 21, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !32, line: 178, column: 21)
!248 = !DILocation(line: 178, column: 34, scope: !247)
!249 = !DILocation(line: 178, column: 21, scope: !244)
!250 = !DILocation(line: 180, column: 21, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !32, line: 179, column: 17)
!252 = !DILocation(line: 182, column: 17, scope: !244)
!253 = !DILocation(line: 183, column: 25, scope: !244)
!254 = !DILocation(line: 183, column: 36, scope: !244)
!255 = !DILocation(line: 184, column: 25, scope: !244)
!256 = !DILocation(line: 184, column: 34, scope: !244)
!257 = !DILocation(line: 184, column: 41, scope: !244)
!258 = !DILocation(line: 185, column: 25, scope: !244)
!259 = !DILocation(line: 185, column: 34, scope: !244)
!260 = !DILocation(line: 186, column: 26, scope: !261)
!261 = distinct !DILexicalBlock(scope: !244, file: !32, line: 186, column: 21)
!262 = !DILocation(line: 186, column: 40, scope: !261)
!263 = !DILocation(line: 186, column: 21, scope: !261)
!264 = !DILocation(line: 186, column: 85, scope: !261)
!265 = !DILocation(line: 186, column: 21, scope: !244)
!266 = !DILocation(line: 188, column: 21, scope: !267)
!267 = distinct !DILexicalBlock(scope: !261, file: !32, line: 187, column: 17)
!268 = !DILocation(line: 190, column: 28, scope: !269)
!269 = distinct !DILexicalBlock(scope: !244, file: !32, line: 190, column: 21)
!270 = !DILocation(line: 190, column: 21, scope: !269)
!271 = !DILocation(line: 190, column: 58, scope: !269)
!272 = !DILocation(line: 190, column: 21, scope: !244)
!273 = !DILocation(line: 192, column: 21, scope: !274)
!274 = distinct !DILexicalBlock(scope: !269, file: !32, line: 191, column: 17)
!275 = !DILocation(line: 194, column: 39, scope: !244)
!276 = !DILocation(line: 194, column: 32, scope: !244)
!277 = !DILocation(line: 194, column: 30, scope: !244)
!278 = !DILocation(line: 195, column: 21, scope: !279)
!279 = distinct !DILexicalBlock(scope: !244, file: !32, line: 195, column: 21)
!280 = !DILocation(line: 195, column: 34, scope: !279)
!281 = !DILocation(line: 195, column: 21, scope: !244)
!282 = !DILocation(line: 197, column: 21, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !32, line: 196, column: 17)
!284 = !DILocation(line: 200, column: 35, scope: !244)
!285 = !DILocation(line: 200, column: 49, scope: !244)
!286 = !DILocation(line: 200, column: 30, scope: !244)
!287 = !DILocation(line: 200, column: 28, scope: !244)
!288 = !DILocation(line: 201, column: 21, scope: !289)
!289 = distinct !DILexicalBlock(scope: !244, file: !32, line: 201, column: 21)
!290 = !DILocation(line: 201, column: 32, scope: !289)
!291 = !DILocation(line: 201, column: 48, scope: !289)
!292 = !DILocation(line: 201, column: 51, scope: !289)
!293 = !DILocation(line: 201, column: 62, scope: !289)
!294 = !DILocation(line: 201, column: 21, scope: !244)
!295 = !DILocation(line: 203, column: 21, scope: !296)
!296 = distinct !DILexicalBlock(scope: !289, file: !32, line: 202, column: 17)
!297 = !DILocation(line: 206, column: 29, scope: !244)
!298 = !DILocation(line: 206, column: 17, scope: !244)
!299 = !DILocation(line: 206, column: 41, scope: !244)
!300 = !DILocation(line: 208, column: 29, scope: !244)
!301 = !DILocation(line: 208, column: 24, scope: !244)
!302 = !DILocation(line: 208, column: 22, scope: !244)
!303 = !DILocation(line: 209, column: 13, scope: !244)
!304 = !DILocation(line: 211, column: 17, scope: !305)
!305 = distinct !DILexicalBlock(scope: !231, file: !32, line: 211, column: 17)
!306 = !DILocation(line: 211, column: 30, scope: !305)
!307 = !DILocation(line: 211, column: 17, scope: !231)
!308 = !DILocation(line: 213, column: 30, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !32, line: 212, column: 13)
!310 = !DILocation(line: 213, column: 17, scope: !309)
!311 = !DILocation(line: 214, column: 13, scope: !309)
!312 = !DILocation(line: 215, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !231, file: !32, line: 215, column: 17)
!314 = !DILocation(line: 215, column: 30, scope: !313)
!315 = !DILocation(line: 215, column: 17, scope: !231)
!316 = !DILocation(line: 217, column: 30, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !32, line: 216, column: 13)
!318 = !DILocation(line: 217, column: 17, scope: !317)
!319 = !DILocation(line: 218, column: 13, scope: !317)
!320 = !DILocation(line: 226, column: 5, scope: !232)
!321 = !DILocation(line: 227, column: 8, scope: !322)
!322 = distinct !DILexicalBlock(scope: !222, file: !32, line: 227, column: 8)
!323 = !DILocation(line: 227, column: 18, scope: !322)
!324 = !DILocation(line: 227, column: 8, scope: !222)
!325 = !DILocation(line: 230, column: 9, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !32, line: 228, column: 5)
!327 = !DILocation(line: 231, column: 5, scope: !326)
!328 = !DILocalVariable(name: "i", scope: !329, file: !32, line: 235, type: !37)
!329 = distinct !DILexicalBlock(scope: !330, file: !32, line: 234, column: 9)
!330 = distinct !DILexicalBlock(scope: !322, file: !32, line: 233, column: 5)
!331 = !DILocation(line: 235, column: 17, scope: !329)
!332 = !DILocalVariable(name: "buffer", scope: !329, file: !32, line: 236, type: !163)
!333 = !DILocation(line: 236, column: 17, scope: !329)
!334 = !DILocation(line: 238, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !329, file: !32, line: 238, column: 17)
!336 = !DILocation(line: 238, column: 22, scope: !335)
!337 = !DILocation(line: 238, column: 27, scope: !335)
!338 = !DILocation(line: 238, column: 30, scope: !335)
!339 = !DILocation(line: 238, column: 35, scope: !335)
!340 = !DILocation(line: 238, column: 17, scope: !329)
!341 = !DILocation(line: 240, column: 24, scope: !342)
!342 = distinct !DILexicalBlock(scope: !335, file: !32, line: 239, column: 13)
!343 = !DILocation(line: 240, column: 17, scope: !342)
!344 = !DILocation(line: 240, column: 30, scope: !342)
!345 = !DILocation(line: 242, column: 23, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !32, line: 242, column: 17)
!347 = !DILocation(line: 242, column: 21, scope: !346)
!348 = !DILocation(line: 242, column: 28, scope: !349)
!349 = distinct !DILexicalBlock(scope: !346, file: !32, line: 242, column: 17)
!350 = !DILocation(line: 242, column: 30, scope: !349)
!351 = !DILocation(line: 242, column: 17, scope: !346)
!352 = !DILocation(line: 244, column: 41, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !32, line: 243, column: 17)
!354 = !DILocation(line: 244, column: 34, scope: !353)
!355 = !DILocation(line: 244, column: 21, scope: !353)
!356 = !DILocation(line: 245, column: 17, scope: !353)
!357 = !DILocation(line: 242, column: 37, scope: !349)
!358 = !DILocation(line: 242, column: 17, scope: !349)
!359 = distinct !{!359, !351, !360, !191}
!360 = !DILocation(line: 245, column: 17, scope: !346)
!361 = !DILocation(line: 246, column: 13, scope: !342)
!362 = !DILocation(line: 249, column: 17, scope: !363)
!363 = distinct !DILexicalBlock(scope: !335, file: !32, line: 248, column: 13)
!364 = !DILocation(line: 253, column: 1, scope: !222)
!365 = distinct !DISubprogram(name: "goodB2G2", scope: !32, file: !32, line: 256, type: !33, scopeLine: 257, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!366 = !DILocalVariable(name: "data", scope: !365, file: !32, line: 258, type: !37)
!367 = !DILocation(line: 258, column: 9, scope: !365)
!368 = !DILocation(line: 260, column: 10, scope: !365)
!369 = !DILocation(line: 261, column: 8, scope: !370)
!370 = distinct !DILexicalBlock(scope: !365, file: !32, line: 261, column: 8)
!371 = !DILocation(line: 261, column: 18, scope: !370)
!372 = !DILocation(line: 261, column: 8, scope: !365)
!373 = !DILocalVariable(name: "recvResult", scope: !374, file: !32, line: 268, type: !37)
!374 = distinct !DILexicalBlock(scope: !375, file: !32, line: 263, column: 9)
!375 = distinct !DILexicalBlock(scope: !370, file: !32, line: 262, column: 5)
!376 = !DILocation(line: 268, column: 17, scope: !374)
!377 = !DILocalVariable(name: "service", scope: !374, file: !32, line: 269, type: !49)
!378 = !DILocation(line: 269, column: 32, scope: !374)
!379 = !DILocalVariable(name: "listenSocket", scope: !374, file: !32, line: 270, type: !37)
!380 = !DILocation(line: 270, column: 20, scope: !374)
!381 = !DILocalVariable(name: "acceptSocket", scope: !374, file: !32, line: 271, type: !37)
!382 = !DILocation(line: 271, column: 20, scope: !374)
!383 = !DILocalVariable(name: "inputBuffer", scope: !374, file: !32, line: 272, type: !20)
!384 = !DILocation(line: 272, column: 18, scope: !374)
!385 = !DILocation(line: 273, column: 13, scope: !374)
!386 = !DILocation(line: 283, column: 32, scope: !387)
!387 = distinct !DILexicalBlock(scope: !374, file: !32, line: 274, column: 13)
!388 = !DILocation(line: 283, column: 30, scope: !387)
!389 = !DILocation(line: 284, column: 21, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !32, line: 284, column: 21)
!391 = !DILocation(line: 284, column: 34, scope: !390)
!392 = !DILocation(line: 284, column: 21, scope: !387)
!393 = !DILocation(line: 286, column: 21, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !32, line: 285, column: 17)
!395 = !DILocation(line: 288, column: 17, scope: !387)
!396 = !DILocation(line: 289, column: 25, scope: !387)
!397 = !DILocation(line: 289, column: 36, scope: !387)
!398 = !DILocation(line: 290, column: 25, scope: !387)
!399 = !DILocation(line: 290, column: 34, scope: !387)
!400 = !DILocation(line: 290, column: 41, scope: !387)
!401 = !DILocation(line: 291, column: 25, scope: !387)
!402 = !DILocation(line: 291, column: 34, scope: !387)
!403 = !DILocation(line: 292, column: 26, scope: !404)
!404 = distinct !DILexicalBlock(scope: !387, file: !32, line: 292, column: 21)
!405 = !DILocation(line: 292, column: 40, scope: !404)
!406 = !DILocation(line: 292, column: 21, scope: !404)
!407 = !DILocation(line: 292, column: 85, scope: !404)
!408 = !DILocation(line: 292, column: 21, scope: !387)
!409 = !DILocation(line: 294, column: 21, scope: !410)
!410 = distinct !DILexicalBlock(scope: !404, file: !32, line: 293, column: 17)
!411 = !DILocation(line: 296, column: 28, scope: !412)
!412 = distinct !DILexicalBlock(scope: !387, file: !32, line: 296, column: 21)
!413 = !DILocation(line: 296, column: 21, scope: !412)
!414 = !DILocation(line: 296, column: 58, scope: !412)
!415 = !DILocation(line: 296, column: 21, scope: !387)
!416 = !DILocation(line: 298, column: 21, scope: !417)
!417 = distinct !DILexicalBlock(scope: !412, file: !32, line: 297, column: 17)
!418 = !DILocation(line: 300, column: 39, scope: !387)
!419 = !DILocation(line: 300, column: 32, scope: !387)
!420 = !DILocation(line: 300, column: 30, scope: !387)
!421 = !DILocation(line: 301, column: 21, scope: !422)
!422 = distinct !DILexicalBlock(scope: !387, file: !32, line: 301, column: 21)
!423 = !DILocation(line: 301, column: 34, scope: !422)
!424 = !DILocation(line: 301, column: 21, scope: !387)
!425 = !DILocation(line: 303, column: 21, scope: !426)
!426 = distinct !DILexicalBlock(scope: !422, file: !32, line: 302, column: 17)
!427 = !DILocation(line: 306, column: 35, scope: !387)
!428 = !DILocation(line: 306, column: 49, scope: !387)
!429 = !DILocation(line: 306, column: 30, scope: !387)
!430 = !DILocation(line: 306, column: 28, scope: !387)
!431 = !DILocation(line: 307, column: 21, scope: !432)
!432 = distinct !DILexicalBlock(scope: !387, file: !32, line: 307, column: 21)
!433 = !DILocation(line: 307, column: 32, scope: !432)
!434 = !DILocation(line: 307, column: 48, scope: !432)
!435 = !DILocation(line: 307, column: 51, scope: !432)
!436 = !DILocation(line: 307, column: 62, scope: !432)
!437 = !DILocation(line: 307, column: 21, scope: !387)
!438 = !DILocation(line: 309, column: 21, scope: !439)
!439 = distinct !DILexicalBlock(scope: !432, file: !32, line: 308, column: 17)
!440 = !DILocation(line: 312, column: 29, scope: !387)
!441 = !DILocation(line: 312, column: 17, scope: !387)
!442 = !DILocation(line: 312, column: 41, scope: !387)
!443 = !DILocation(line: 314, column: 29, scope: !387)
!444 = !DILocation(line: 314, column: 24, scope: !387)
!445 = !DILocation(line: 314, column: 22, scope: !387)
!446 = !DILocation(line: 315, column: 13, scope: !387)
!447 = !DILocation(line: 317, column: 17, scope: !448)
!448 = distinct !DILexicalBlock(scope: !374, file: !32, line: 317, column: 17)
!449 = !DILocation(line: 317, column: 30, scope: !448)
!450 = !DILocation(line: 317, column: 17, scope: !374)
!451 = !DILocation(line: 319, column: 30, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !32, line: 318, column: 13)
!453 = !DILocation(line: 319, column: 17, scope: !452)
!454 = !DILocation(line: 320, column: 13, scope: !452)
!455 = !DILocation(line: 321, column: 17, scope: !456)
!456 = distinct !DILexicalBlock(scope: !374, file: !32, line: 321, column: 17)
!457 = !DILocation(line: 321, column: 30, scope: !456)
!458 = !DILocation(line: 321, column: 17, scope: !374)
!459 = !DILocation(line: 323, column: 30, scope: !460)
!460 = distinct !DILexicalBlock(scope: !456, file: !32, line: 322, column: 13)
!461 = !DILocation(line: 323, column: 17, scope: !460)
!462 = !DILocation(line: 324, column: 13, scope: !460)
!463 = !DILocation(line: 332, column: 5, scope: !375)
!464 = !DILocation(line: 333, column: 8, scope: !465)
!465 = distinct !DILexicalBlock(scope: !365, file: !32, line: 333, column: 8)
!466 = !DILocation(line: 333, column: 18, scope: !465)
!467 = !DILocation(line: 333, column: 8, scope: !365)
!468 = !DILocalVariable(name: "i", scope: !469, file: !32, line: 336, type: !37)
!469 = distinct !DILexicalBlock(scope: !470, file: !32, line: 335, column: 9)
!470 = distinct !DILexicalBlock(scope: !465, file: !32, line: 334, column: 5)
!471 = !DILocation(line: 336, column: 17, scope: !469)
!472 = !DILocalVariable(name: "buffer", scope: !469, file: !32, line: 337, type: !163)
!473 = !DILocation(line: 337, column: 17, scope: !469)
!474 = !DILocation(line: 339, column: 17, scope: !475)
!475 = distinct !DILexicalBlock(scope: !469, file: !32, line: 339, column: 17)
!476 = !DILocation(line: 339, column: 22, scope: !475)
!477 = !DILocation(line: 339, column: 27, scope: !475)
!478 = !DILocation(line: 339, column: 30, scope: !475)
!479 = !DILocation(line: 339, column: 35, scope: !475)
!480 = !DILocation(line: 339, column: 17, scope: !469)
!481 = !DILocation(line: 341, column: 24, scope: !482)
!482 = distinct !DILexicalBlock(scope: !475, file: !32, line: 340, column: 13)
!483 = !DILocation(line: 341, column: 17, scope: !482)
!484 = !DILocation(line: 341, column: 30, scope: !482)
!485 = !DILocation(line: 343, column: 23, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !32, line: 343, column: 17)
!487 = !DILocation(line: 343, column: 21, scope: !486)
!488 = !DILocation(line: 343, column: 28, scope: !489)
!489 = distinct !DILexicalBlock(scope: !486, file: !32, line: 343, column: 17)
!490 = !DILocation(line: 343, column: 30, scope: !489)
!491 = !DILocation(line: 343, column: 17, scope: !486)
!492 = !DILocation(line: 345, column: 41, scope: !493)
!493 = distinct !DILexicalBlock(scope: !489, file: !32, line: 344, column: 17)
!494 = !DILocation(line: 345, column: 34, scope: !493)
!495 = !DILocation(line: 345, column: 21, scope: !493)
!496 = !DILocation(line: 346, column: 17, scope: !493)
!497 = !DILocation(line: 343, column: 37, scope: !489)
!498 = !DILocation(line: 343, column: 17, scope: !489)
!499 = distinct !{!499, !491, !500, !191}
!500 = !DILocation(line: 346, column: 17, scope: !486)
!501 = !DILocation(line: 347, column: 13, scope: !482)
!502 = !DILocation(line: 350, column: 17, scope: !503)
!503 = distinct !DILexicalBlock(scope: !475, file: !32, line: 349, column: 13)
!504 = !DILocation(line: 353, column: 5, scope: !470)
!505 = !DILocation(line: 354, column: 1, scope: !365)
!506 = distinct !DISubprogram(name: "goodG2B1", scope: !32, file: !32, line: 357, type: !33, scopeLine: 358, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!507 = !DILocalVariable(name: "data", scope: !506, file: !32, line: 359, type: !37)
!508 = !DILocation(line: 359, column: 9, scope: !506)
!509 = !DILocation(line: 361, column: 10, scope: !506)
!510 = !DILocation(line: 362, column: 8, scope: !511)
!511 = distinct !DILexicalBlock(scope: !506, file: !32, line: 362, column: 8)
!512 = !DILocation(line: 362, column: 18, scope: !511)
!513 = !DILocation(line: 362, column: 8, scope: !506)
!514 = !DILocation(line: 365, column: 9, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !32, line: 363, column: 5)
!516 = !DILocation(line: 366, column: 5, scope: !515)
!517 = !DILocation(line: 371, column: 14, scope: !518)
!518 = distinct !DILexicalBlock(scope: !511, file: !32, line: 368, column: 5)
!519 = !DILocation(line: 373, column: 8, scope: !520)
!520 = distinct !DILexicalBlock(scope: !506, file: !32, line: 373, column: 8)
!521 = !DILocation(line: 373, column: 18, scope: !520)
!522 = !DILocation(line: 373, column: 8, scope: !506)
!523 = !DILocalVariable(name: "i", scope: !524, file: !32, line: 376, type: !37)
!524 = distinct !DILexicalBlock(scope: !525, file: !32, line: 375, column: 9)
!525 = distinct !DILexicalBlock(scope: !520, file: !32, line: 374, column: 5)
!526 = !DILocation(line: 376, column: 17, scope: !524)
!527 = !DILocalVariable(name: "buffer", scope: !524, file: !32, line: 377, type: !163)
!528 = !DILocation(line: 377, column: 17, scope: !524)
!529 = !DILocation(line: 380, column: 17, scope: !530)
!530 = distinct !DILexicalBlock(scope: !524, file: !32, line: 380, column: 17)
!531 = !DILocation(line: 380, column: 22, scope: !530)
!532 = !DILocation(line: 380, column: 17, scope: !524)
!533 = !DILocation(line: 382, column: 24, scope: !534)
!534 = distinct !DILexicalBlock(scope: !530, file: !32, line: 381, column: 13)
!535 = !DILocation(line: 382, column: 17, scope: !534)
!536 = !DILocation(line: 382, column: 30, scope: !534)
!537 = !DILocation(line: 384, column: 23, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !32, line: 384, column: 17)
!539 = !DILocation(line: 384, column: 21, scope: !538)
!540 = !DILocation(line: 384, column: 28, scope: !541)
!541 = distinct !DILexicalBlock(scope: !538, file: !32, line: 384, column: 17)
!542 = !DILocation(line: 384, column: 30, scope: !541)
!543 = !DILocation(line: 384, column: 17, scope: !538)
!544 = !DILocation(line: 386, column: 41, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !32, line: 385, column: 17)
!546 = !DILocation(line: 386, column: 34, scope: !545)
!547 = !DILocation(line: 386, column: 21, scope: !545)
!548 = !DILocation(line: 387, column: 17, scope: !545)
!549 = !DILocation(line: 384, column: 37, scope: !541)
!550 = !DILocation(line: 384, column: 17, scope: !541)
!551 = distinct !{!551, !543, !552, !191}
!552 = !DILocation(line: 387, column: 17, scope: !538)
!553 = !DILocation(line: 388, column: 13, scope: !534)
!554 = !DILocation(line: 391, column: 17, scope: !555)
!555 = distinct !DILexicalBlock(scope: !530, file: !32, line: 390, column: 13)
!556 = !DILocation(line: 394, column: 5, scope: !525)
!557 = !DILocation(line: 395, column: 1, scope: !506)
!558 = distinct !DISubprogram(name: "goodG2B2", scope: !32, file: !32, line: 398, type: !33, scopeLine: 399, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!559 = !DILocalVariable(name: "data", scope: !558, file: !32, line: 400, type: !37)
!560 = !DILocation(line: 400, column: 9, scope: !558)
!561 = !DILocation(line: 402, column: 10, scope: !558)
!562 = !DILocation(line: 403, column: 8, scope: !563)
!563 = distinct !DILexicalBlock(scope: !558, file: !32, line: 403, column: 8)
!564 = !DILocation(line: 403, column: 18, scope: !563)
!565 = !DILocation(line: 403, column: 8, scope: !558)
!566 = !DILocation(line: 407, column: 14, scope: !567)
!567 = distinct !DILexicalBlock(scope: !563, file: !32, line: 404, column: 5)
!568 = !DILocation(line: 408, column: 5, scope: !567)
!569 = !DILocation(line: 409, column: 8, scope: !570)
!570 = distinct !DILexicalBlock(scope: !558, file: !32, line: 409, column: 8)
!571 = !DILocation(line: 409, column: 18, scope: !570)
!572 = !DILocation(line: 409, column: 8, scope: !558)
!573 = !DILocalVariable(name: "i", scope: !574, file: !32, line: 412, type: !37)
!574 = distinct !DILexicalBlock(scope: !575, file: !32, line: 411, column: 9)
!575 = distinct !DILexicalBlock(scope: !570, file: !32, line: 410, column: 5)
!576 = !DILocation(line: 412, column: 17, scope: !574)
!577 = !DILocalVariable(name: "buffer", scope: !574, file: !32, line: 413, type: !163)
!578 = !DILocation(line: 413, column: 17, scope: !574)
!579 = !DILocation(line: 416, column: 17, scope: !580)
!580 = distinct !DILexicalBlock(scope: !574, file: !32, line: 416, column: 17)
!581 = !DILocation(line: 416, column: 22, scope: !580)
!582 = !DILocation(line: 416, column: 17, scope: !574)
!583 = !DILocation(line: 418, column: 24, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !32, line: 417, column: 13)
!585 = !DILocation(line: 418, column: 17, scope: !584)
!586 = !DILocation(line: 418, column: 30, scope: !584)
!587 = !DILocation(line: 420, column: 23, scope: !588)
!588 = distinct !DILexicalBlock(scope: !584, file: !32, line: 420, column: 17)
!589 = !DILocation(line: 420, column: 21, scope: !588)
!590 = !DILocation(line: 420, column: 28, scope: !591)
!591 = distinct !DILexicalBlock(scope: !588, file: !32, line: 420, column: 17)
!592 = !DILocation(line: 420, column: 30, scope: !591)
!593 = !DILocation(line: 420, column: 17, scope: !588)
!594 = !DILocation(line: 422, column: 41, scope: !595)
!595 = distinct !DILexicalBlock(scope: !591, file: !32, line: 421, column: 17)
!596 = !DILocation(line: 422, column: 34, scope: !595)
!597 = !DILocation(line: 422, column: 21, scope: !595)
!598 = !DILocation(line: 423, column: 17, scope: !595)
!599 = !DILocation(line: 420, column: 37, scope: !591)
!600 = !DILocation(line: 420, column: 17, scope: !591)
!601 = distinct !{!601, !593, !602, !191}
!602 = !DILocation(line: 423, column: 17, scope: !588)
!603 = !DILocation(line: 424, column: 13, scope: !584)
!604 = !DILocation(line: 427, column: 17, scope: !605)
!605 = distinct !DILexicalBlock(scope: !580, file: !32, line: 426, column: 13)
!606 = !DILocation(line: 430, column: 5, scope: !575)
!607 = !DILocation(line: 431, column: 1, scope: !558)
