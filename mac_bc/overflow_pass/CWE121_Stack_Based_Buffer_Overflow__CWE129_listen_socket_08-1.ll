; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08-1.c"
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
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_bad() #0 !dbg !31 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !40
  %tobool = icmp ne i32 %call, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end34, !dbg !42

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !47, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 -1, i32* %listenSocket, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, i32* %acceptSocket, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  br label %do.body, !dbg !74

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !75
  store i32 %call1, i32* %listenSocket, align 4, !dbg !77
  %0 = load i32, i32* %listenSocket, align 4, !dbg !78
  %cmp = icmp eq i32 %0, -1, !dbg !80
  br i1 %cmp, label %if.then2, label %if.end, !dbg !81

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !82

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !84
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !85
  store i8 2, i8* %sin_family, align 1, !dbg !86
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !87
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !88
  store i32 0, i32* %s_addr, align 4, !dbg !89
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !90
  store i16 -30871, i16* %sin_port, align 2, !dbg !91
  %2 = load i32, i32* %listenSocket, align 4, !dbg !92
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !94
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !95
  %cmp4 = icmp eq i32 %call3, -1, !dbg !96
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !97

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !98

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !100
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !102
  %cmp8 = icmp eq i32 %call7, -1, !dbg !103
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !104

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !105

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !107
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !108
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !109
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !110
  %cmp12 = icmp eq i32 %6, -1, !dbg !112
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !113

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !114

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !116
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !117
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !118
  %conv = trunc i64 %call15 to i32, !dbg !118
  store i32 %conv, i32* %recvResult, align 4, !dbg !119
  %8 = load i32, i32* %recvResult, align 4, !dbg !120
  %cmp16 = icmp eq i32 %8, -1, !dbg !122
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !123

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !124
  %cmp18 = icmp eq i32 %9, 0, !dbg !125
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !126

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !127

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !129
  %idxprom = sext i32 %10 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !132
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !133
  store i32 %call23, i32* %data, align 4, !dbg !134
  br label %do.end, !dbg !135

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !136
  %cmp24 = icmp ne i32 %11, -1, !dbg !138
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !139

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !142
  br label %if.end28, !dbg !143

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !144
  %cmp29 = icmp ne i32 %13, -1, !dbg !146
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !147

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !150
  br label %if.end33, !dbg !151

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !152

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 @staticReturnsTrue(), !dbg !153
  %tobool36 = icmp ne i32 %call35, 0, !dbg !153
  br i1 %tobool36, label %if.then37, label %if.end48, !dbg !155

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !156, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !160, metadata !DIExpression()), !dbg !164
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !164
  %16 = load i32, i32* %data, align 4, !dbg !165
  %cmp38 = icmp sge i32 %16, 0, !dbg !167
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !168

if.then40:                                        ; preds = %if.then37
  %17 = load i32, i32* %data, align 4, !dbg !169
  %idxprom41 = sext i32 %17 to i64, !dbg !171
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !171
  store i32 1, i32* %arrayidx42, align 4, !dbg !172
  store i32 0, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.then40
  %18 = load i32, i32* %i, align 4, !dbg !176
  %cmp43 = icmp slt i32 %18, 10, !dbg !178
  br i1 %cmp43, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !180
  %idxprom45 = sext i32 %19 to i64, !dbg !182
  %arrayidx46 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom45, !dbg !182
  %20 = load i32, i32* %arrayidx46, align 4, !dbg !182
  call void @printIntLine(i32 noundef %20), !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !185
  %inc = add nsw i32 %21, 1, !dbg !185
  store i32 %inc, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  br label %if.end47, !dbg !190

if.else:                                          ; preds = %if.then37
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !191
  br label %if.end47

if.end47:                                         ; preds = %if.else, %for.end
  br label %if.end48, !dbg !193

if.end48:                                         ; preds = %if.end47, %if.end34
  ret void, !dbg !194
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_good() #0 !dbg !195 {
entry:
  call void @goodB2G1(), !dbg !196
  call void @goodB2G2(), !dbg !197
  call void @goodG2B1(), !dbg !198
  call void @goodG2B2(), !dbg !199
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !201 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !206, metadata !DIExpression()), !dbg !207
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !208, metadata !DIExpression()), !dbg !209
  %call = call i64 @time(i64* noundef null), !dbg !210
  %conv = trunc i64 %call to i32, !dbg !211
  call void @srand(i32 noundef %conv), !dbg !212
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !213
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_good(), !dbg !214
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !215
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !216
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_bad(), !dbg !217
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !218
  ret i32 0, !dbg !219
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !220 {
entry:
  ret i32 1, !dbg !223
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !224 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !225, metadata !DIExpression()), !dbg !226
  store i32 -1, i32* %data, align 4, !dbg !227
  %call = call i32 @staticReturnsTrue(), !dbg !228
  %tobool = icmp ne i32 %call, 0, !dbg !228
  br i1 %tobool, label %if.then, label %if.end34, !dbg !230

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !231, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !237, metadata !DIExpression()), !dbg !238
  store i32 -1, i32* %listenSocket, align 4, !dbg !238
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !239, metadata !DIExpression()), !dbg !240
  store i32 -1, i32* %acceptSocket, align 4, !dbg !240
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !241, metadata !DIExpression()), !dbg !242
  br label %do.body, !dbg !243

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !244
  store i32 %call1, i32* %listenSocket, align 4, !dbg !246
  %0 = load i32, i32* %listenSocket, align 4, !dbg !247
  %cmp = icmp eq i32 %0, -1, !dbg !249
  br i1 %cmp, label %if.then2, label %if.end, !dbg !250

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !251

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !253
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !253
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !254
  store i8 2, i8* %sin_family, align 1, !dbg !255
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !256
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !257
  store i32 0, i32* %s_addr, align 4, !dbg !258
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !259
  store i16 -30871, i16* %sin_port, align 2, !dbg !260
  %2 = load i32, i32* %listenSocket, align 4, !dbg !261
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !263
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !264
  %cmp4 = icmp eq i32 %call3, -1, !dbg !265
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !266

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !267

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !269
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !271
  %cmp8 = icmp eq i32 %call7, -1, !dbg !272
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !273

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !274

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !276
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !277
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !278
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !279
  %cmp12 = icmp eq i32 %6, -1, !dbg !281
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !282

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !283

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !285
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !286
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !287
  %conv = trunc i64 %call15 to i32, !dbg !287
  store i32 %conv, i32* %recvResult, align 4, !dbg !288
  %8 = load i32, i32* %recvResult, align 4, !dbg !289
  %cmp16 = icmp eq i32 %8, -1, !dbg !291
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !292

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !293
  %cmp18 = icmp eq i32 %9, 0, !dbg !294
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !295

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !296

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !298
  %idxprom = sext i32 %10 to i64, !dbg !299
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !299
  store i8 0, i8* %arrayidx, align 1, !dbg !300
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !301
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !302
  store i32 %call23, i32* %data, align 4, !dbg !303
  br label %do.end, !dbg !304

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !305
  %cmp24 = icmp ne i32 %11, -1, !dbg !307
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !308

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !309
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !311
  br label %if.end28, !dbg !312

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !313
  %cmp29 = icmp ne i32 %13, -1, !dbg !315
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !316

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !317
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !319
  br label %if.end33, !dbg !320

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !321

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 @staticReturnsFalse(), !dbg !322
  %tobool36 = icmp ne i32 %call35, 0, !dbg !322
  br i1 %tobool36, label %if.then37, label %if.else, !dbg !324

if.then37:                                        ; preds = %if.end34
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !325
  br label %if.end51, !dbg !327

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !328, metadata !DIExpression()), !dbg !331
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !332, metadata !DIExpression()), !dbg !333
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !333
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !333
  %16 = load i32, i32* %data, align 4, !dbg !334
  %cmp38 = icmp sge i32 %16, 0, !dbg !336
  br i1 %cmp38, label %land.lhs.true, label %if.else49, !dbg !337

land.lhs.true:                                    ; preds = %if.else
  %17 = load i32, i32* %data, align 4, !dbg !338
  %cmp40 = icmp slt i32 %17, 10, !dbg !339
  br i1 %cmp40, label %if.then42, label %if.else49, !dbg !340

if.then42:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !341
  %idxprom43 = sext i32 %18 to i64, !dbg !343
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !343
  store i32 1, i32* %arrayidx44, align 4, !dbg !344
  store i32 0, i32* %i, align 4, !dbg !345
  br label %for.cond, !dbg !347

for.cond:                                         ; preds = %for.inc, %if.then42
  %19 = load i32, i32* %i, align 4, !dbg !348
  %cmp45 = icmp slt i32 %19, 10, !dbg !350
  br i1 %cmp45, label %for.body, label %for.end, !dbg !351

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !352
  %idxprom47 = sext i32 %20 to i64, !dbg !354
  %arrayidx48 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom47, !dbg !354
  %21 = load i32, i32* %arrayidx48, align 4, !dbg !354
  call void @printIntLine(i32 noundef %21), !dbg !355
  br label %for.inc, !dbg !356

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !357
  %inc = add nsw i32 %22, 1, !dbg !357
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
define internal i32 @staticReturnsFalse() #0 !dbg !365 {
entry:
  ret i32 0, !dbg !366
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !367 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !368, metadata !DIExpression()), !dbg !369
  store i32 -1, i32* %data, align 4, !dbg !370
  %call = call i32 @staticReturnsTrue(), !dbg !371
  %tobool = icmp ne i32 %call, 0, !dbg !371
  br i1 %tobool, label %if.then, label %if.end34, !dbg !373

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !374, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !378, metadata !DIExpression()), !dbg !379
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !380, metadata !DIExpression()), !dbg !381
  store i32 -1, i32* %listenSocket, align 4, !dbg !381
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !382, metadata !DIExpression()), !dbg !383
  store i32 -1, i32* %acceptSocket, align 4, !dbg !383
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !384, metadata !DIExpression()), !dbg !385
  br label %do.body, !dbg !386

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !387
  store i32 %call1, i32* %listenSocket, align 4, !dbg !389
  %0 = load i32, i32* %listenSocket, align 4, !dbg !390
  %cmp = icmp eq i32 %0, -1, !dbg !392
  br i1 %cmp, label %if.then2, label %if.end, !dbg !393

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !394

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !396
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !396
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !397
  store i8 2, i8* %sin_family, align 1, !dbg !398
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !399
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !400
  store i32 0, i32* %s_addr, align 4, !dbg !401
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !402
  store i16 -30871, i16* %sin_port, align 2, !dbg !403
  %2 = load i32, i32* %listenSocket, align 4, !dbg !404
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !406
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !407
  %cmp4 = icmp eq i32 %call3, -1, !dbg !408
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !409

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !410

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !412
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !414
  %cmp8 = icmp eq i32 %call7, -1, !dbg !415
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !416

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !417

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !419
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !420
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !421
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !422
  %cmp12 = icmp eq i32 %6, -1, !dbg !424
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !425

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !426

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !428
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !429
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !430
  %conv = trunc i64 %call15 to i32, !dbg !430
  store i32 %conv, i32* %recvResult, align 4, !dbg !431
  %8 = load i32, i32* %recvResult, align 4, !dbg !432
  %cmp16 = icmp eq i32 %8, -1, !dbg !434
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !435

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !436
  %cmp18 = icmp eq i32 %9, 0, !dbg !437
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !438

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !439

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !441
  %idxprom = sext i32 %10 to i64, !dbg !442
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !442
  store i8 0, i8* %arrayidx, align 1, !dbg !443
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !444
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !445
  store i32 %call23, i32* %data, align 4, !dbg !446
  br label %do.end, !dbg !447

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !448
  %cmp24 = icmp ne i32 %11, -1, !dbg !450
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !451

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !452
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !454
  br label %if.end28, !dbg !455

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !456
  %cmp29 = icmp ne i32 %13, -1, !dbg !458
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !459

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !460
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !462
  br label %if.end33, !dbg !463

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !464

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 @staticReturnsTrue(), !dbg !465
  %tobool36 = icmp ne i32 %call35, 0, !dbg !465
  br i1 %tobool36, label %if.then37, label %if.end50, !dbg !467

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !468, metadata !DIExpression()), !dbg !471
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !472, metadata !DIExpression()), !dbg !473
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !473
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !473
  %16 = load i32, i32* %data, align 4, !dbg !474
  %cmp38 = icmp sge i32 %16, 0, !dbg !476
  br i1 %cmp38, label %land.lhs.true, label %if.else, !dbg !477

land.lhs.true:                                    ; preds = %if.then37
  %17 = load i32, i32* %data, align 4, !dbg !478
  %cmp40 = icmp slt i32 %17, 10, !dbg !479
  br i1 %cmp40, label %if.then42, label %if.else, !dbg !480

if.then42:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !481
  %idxprom43 = sext i32 %18 to i64, !dbg !483
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !483
  store i32 1, i32* %arrayidx44, align 4, !dbg !484
  store i32 0, i32* %i, align 4, !dbg !485
  br label %for.cond, !dbg !487

for.cond:                                         ; preds = %for.inc, %if.then42
  %19 = load i32, i32* %i, align 4, !dbg !488
  %cmp45 = icmp slt i32 %19, 10, !dbg !490
  br i1 %cmp45, label %for.body, label %for.end, !dbg !491

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !492
  %idxprom47 = sext i32 %20 to i64, !dbg !494
  %arrayidx48 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom47, !dbg !494
  %21 = load i32, i32* %arrayidx48, align 4, !dbg !494
  call void @printIntLine(i32 noundef %21), !dbg !495
  br label %for.inc, !dbg !496

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !497
  %inc = add nsw i32 %22, 1, !dbg !497
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
  %call = call i32 @staticReturnsFalse(), !dbg !510
  %tobool = icmp ne i32 %call, 0, !dbg !510
  br i1 %tobool, label %if.then, label %if.else, !dbg !512

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !513
  br label %if.end, !dbg !515

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !516
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !518
  %tobool2 = icmp ne i32 %call1, 0, !dbg !518
  br i1 %tobool2, label %if.then3, label %if.end10, !dbg !520

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !521, metadata !DIExpression()), !dbg !524
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !525, metadata !DIExpression()), !dbg !526
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !526
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !526
  %1 = load i32, i32* %data, align 4, !dbg !527
  %cmp = icmp sge i32 %1, 0, !dbg !529
  br i1 %cmp, label %if.then4, label %if.else8, !dbg !530

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !531
  %idxprom = sext i32 %2 to i64, !dbg !533
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !533
  store i32 1, i32* %arrayidx, align 4, !dbg !534
  store i32 0, i32* %i, align 4, !dbg !535
  br label %for.cond, !dbg !537

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !538
  %cmp5 = icmp slt i32 %3, 10, !dbg !540
  br i1 %cmp5, label %for.body, label %for.end, !dbg !541

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !542
  %idxprom6 = sext i32 %4 to i64, !dbg !544
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !544
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !544
  call void @printIntLine(i32 noundef %5), !dbg !545
  br label %for.inc, !dbg !546

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !547
  %inc = add nsw i32 %6, 1, !dbg !547
  store i32 %inc, i32* %i, align 4, !dbg !547
  br label %for.cond, !dbg !548, !llvm.loop !549

for.end:                                          ; preds = %for.cond
  br label %if.end9, !dbg !551

if.else8:                                         ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !552
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %for.end
  br label %if.end10, !dbg !554

if.end10:                                         ; preds = %if.end9, %if.end
  ret void, !dbg !555
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !556 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !557, metadata !DIExpression()), !dbg !558
  store i32 -1, i32* %data, align 4, !dbg !559
  %call = call i32 @staticReturnsTrue(), !dbg !560
  %tobool = icmp ne i32 %call, 0, !dbg !560
  br i1 %tobool, label %if.then, label %if.end, !dbg !562

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !563
  br label %if.end, !dbg !565

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !566
  %tobool2 = icmp ne i32 %call1, 0, !dbg !566
  br i1 %tobool2, label %if.then3, label %if.end9, !dbg !568

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !569, metadata !DIExpression()), !dbg !572
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !573, metadata !DIExpression()), !dbg !574
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !574
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !574
  %1 = load i32, i32* %data, align 4, !dbg !575
  %cmp = icmp sge i32 %1, 0, !dbg !577
  br i1 %cmp, label %if.then4, label %if.else, !dbg !578

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !579
  %idxprom = sext i32 %2 to i64, !dbg !581
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !581
  store i32 1, i32* %arrayidx, align 4, !dbg !582
  store i32 0, i32* %i, align 4, !dbg !583
  br label %for.cond, !dbg !585

for.cond:                                         ; preds = %for.inc, %if.then4
  %3 = load i32, i32* %i, align 4, !dbg !586
  %cmp5 = icmp slt i32 %3, 10, !dbg !588
  br i1 %cmp5, label %for.body, label %for.end, !dbg !589

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !590
  %idxprom6 = sext i32 %4 to i64, !dbg !592
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !592
  %5 = load i32, i32* %arrayidx7, align 4, !dbg !592
  call void @printIntLine(i32 noundef %5), !dbg !593
  br label %for.inc, !dbg !594

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !595
  %inc = add nsw i32 %6, 1, !dbg !595
  store i32 %inc, i32* %i, align 4, !dbg !595
  br label %for.cond, !dbg !596, !llvm.loop !597

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !599

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !600
  br label %if.end8

if.end8:                                          ; preds = %if.else, %for.end
  br label %if.end9, !dbg !602

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !603
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_bad", scope: !32, file: !32, line: 57, type: !33, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 59, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 59, column: 9, scope: !31)
!39 = !DILocation(line: 61, column: 10, scope: !31)
!40 = !DILocation(line: 62, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !31, file: !32, line: 62, column: 8)
!42 = !DILocation(line: 62, column: 8, scope: !31)
!43 = !DILocalVariable(name: "recvResult", scope: !44, file: !32, line: 69, type: !37)
!44 = distinct !DILexicalBlock(scope: !45, file: !32, line: 64, column: 9)
!45 = distinct !DILexicalBlock(scope: !41, file: !32, line: 63, column: 5)
!46 = !DILocation(line: 69, column: 17, scope: !44)
!47 = !DILocalVariable(name: "service", scope: !44, file: !32, line: 70, type: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !49, line: 375, size: 128, elements: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!50 = !{!51, !52, !53, !56, !63}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !48, file: !49, line: 376, baseType: !14, size: 8)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !48, file: !49, line: 377, baseType: !17, size: 8, offset: 8)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !48, file: !49, line: 378, baseType: !54, size: 16, offset: 16)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !55, line: 31, baseType: !6)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !48, file: !49, line: 379, baseType: !57, size: 32, offset: 32)
!57 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !49, line: 301, size: 32, elements: !58)
!58 = !{!59}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !57, file: !49, line: 302, baseType: !60, size: 32)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !61, line: 31, baseType: !62)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 47, baseType: !5)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !48, file: !49, line: 380, baseType: !64, size: 64, offset: 64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 64, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 8)
!67 = !DILocation(line: 70, column: 32, scope: !44)
!68 = !DILocalVariable(name: "listenSocket", scope: !44, file: !32, line: 71, type: !37)
!69 = !DILocation(line: 71, column: 20, scope: !44)
!70 = !DILocalVariable(name: "acceptSocket", scope: !44, file: !32, line: 72, type: !37)
!71 = !DILocation(line: 72, column: 20, scope: !44)
!72 = !DILocalVariable(name: "inputBuffer", scope: !44, file: !32, line: 73, type: !20)
!73 = !DILocation(line: 73, column: 18, scope: !44)
!74 = !DILocation(line: 74, column: 13, scope: !44)
!75 = !DILocation(line: 84, column: 32, scope: !76)
!76 = distinct !DILexicalBlock(scope: !44, file: !32, line: 75, column: 13)
!77 = !DILocation(line: 84, column: 30, scope: !76)
!78 = !DILocation(line: 85, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !32, line: 85, column: 21)
!80 = !DILocation(line: 85, column: 34, scope: !79)
!81 = !DILocation(line: 85, column: 21, scope: !76)
!82 = !DILocation(line: 87, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !32, line: 86, column: 17)
!84 = !DILocation(line: 89, column: 17, scope: !76)
!85 = !DILocation(line: 90, column: 25, scope: !76)
!86 = !DILocation(line: 90, column: 36, scope: !76)
!87 = !DILocation(line: 91, column: 25, scope: !76)
!88 = !DILocation(line: 91, column: 34, scope: !76)
!89 = !DILocation(line: 91, column: 41, scope: !76)
!90 = !DILocation(line: 92, column: 25, scope: !76)
!91 = !DILocation(line: 92, column: 34, scope: !76)
!92 = !DILocation(line: 93, column: 26, scope: !93)
!93 = distinct !DILexicalBlock(scope: !76, file: !32, line: 93, column: 21)
!94 = !DILocation(line: 93, column: 40, scope: !93)
!95 = !DILocation(line: 93, column: 21, scope: !93)
!96 = !DILocation(line: 93, column: 85, scope: !93)
!97 = !DILocation(line: 93, column: 21, scope: !76)
!98 = !DILocation(line: 95, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !32, line: 94, column: 17)
!100 = !DILocation(line: 97, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !76, file: !32, line: 97, column: 21)
!102 = !DILocation(line: 97, column: 21, scope: !101)
!103 = !DILocation(line: 97, column: 58, scope: !101)
!104 = !DILocation(line: 97, column: 21, scope: !76)
!105 = !DILocation(line: 99, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !32, line: 98, column: 17)
!107 = !DILocation(line: 101, column: 39, scope: !76)
!108 = !DILocation(line: 101, column: 32, scope: !76)
!109 = !DILocation(line: 101, column: 30, scope: !76)
!110 = !DILocation(line: 102, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !76, file: !32, line: 102, column: 21)
!112 = !DILocation(line: 102, column: 34, scope: !111)
!113 = !DILocation(line: 102, column: 21, scope: !76)
!114 = !DILocation(line: 104, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !32, line: 103, column: 17)
!116 = !DILocation(line: 107, column: 35, scope: !76)
!117 = !DILocation(line: 107, column: 49, scope: !76)
!118 = !DILocation(line: 107, column: 30, scope: !76)
!119 = !DILocation(line: 107, column: 28, scope: !76)
!120 = !DILocation(line: 108, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !76, file: !32, line: 108, column: 21)
!122 = !DILocation(line: 108, column: 32, scope: !121)
!123 = !DILocation(line: 108, column: 48, scope: !121)
!124 = !DILocation(line: 108, column: 51, scope: !121)
!125 = !DILocation(line: 108, column: 62, scope: !121)
!126 = !DILocation(line: 108, column: 21, scope: !76)
!127 = !DILocation(line: 110, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !32, line: 109, column: 17)
!129 = !DILocation(line: 113, column: 29, scope: !76)
!130 = !DILocation(line: 113, column: 17, scope: !76)
!131 = !DILocation(line: 113, column: 41, scope: !76)
!132 = !DILocation(line: 115, column: 29, scope: !76)
!133 = !DILocation(line: 115, column: 24, scope: !76)
!134 = !DILocation(line: 115, column: 22, scope: !76)
!135 = !DILocation(line: 116, column: 13, scope: !76)
!136 = !DILocation(line: 118, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !44, file: !32, line: 118, column: 17)
!138 = !DILocation(line: 118, column: 30, scope: !137)
!139 = !DILocation(line: 118, column: 17, scope: !44)
!140 = !DILocation(line: 120, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !32, line: 119, column: 13)
!142 = !DILocation(line: 120, column: 17, scope: !141)
!143 = !DILocation(line: 121, column: 13, scope: !141)
!144 = !DILocation(line: 122, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !44, file: !32, line: 122, column: 17)
!146 = !DILocation(line: 122, column: 30, scope: !145)
!147 = !DILocation(line: 122, column: 17, scope: !44)
!148 = !DILocation(line: 124, column: 30, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !32, line: 123, column: 13)
!150 = !DILocation(line: 124, column: 17, scope: !149)
!151 = !DILocation(line: 125, column: 13, scope: !149)
!152 = !DILocation(line: 133, column: 5, scope: !45)
!153 = !DILocation(line: 134, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !31, file: !32, line: 134, column: 8)
!155 = !DILocation(line: 134, column: 8, scope: !31)
!156 = !DILocalVariable(name: "i", scope: !157, file: !32, line: 137, type: !37)
!157 = distinct !DILexicalBlock(scope: !158, file: !32, line: 136, column: 9)
!158 = distinct !DILexicalBlock(scope: !154, file: !32, line: 135, column: 5)
!159 = !DILocation(line: 137, column: 17, scope: !157)
!160 = !DILocalVariable(name: "buffer", scope: !157, file: !32, line: 138, type: !161)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !162)
!162 = !{!163}
!163 = !DISubrange(count: 10)
!164 = !DILocation(line: 138, column: 17, scope: !157)
!165 = !DILocation(line: 141, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !157, file: !32, line: 141, column: 17)
!167 = !DILocation(line: 141, column: 22, scope: !166)
!168 = !DILocation(line: 141, column: 17, scope: !157)
!169 = !DILocation(line: 143, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !32, line: 142, column: 13)
!171 = !DILocation(line: 143, column: 17, scope: !170)
!172 = !DILocation(line: 143, column: 30, scope: !170)
!173 = !DILocation(line: 145, column: 23, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !32, line: 145, column: 17)
!175 = !DILocation(line: 145, column: 21, scope: !174)
!176 = !DILocation(line: 145, column: 28, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !32, line: 145, column: 17)
!178 = !DILocation(line: 145, column: 30, scope: !177)
!179 = !DILocation(line: 145, column: 17, scope: !174)
!180 = !DILocation(line: 147, column: 41, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !32, line: 146, column: 17)
!182 = !DILocation(line: 147, column: 34, scope: !181)
!183 = !DILocation(line: 147, column: 21, scope: !181)
!184 = !DILocation(line: 148, column: 17, scope: !181)
!185 = !DILocation(line: 145, column: 37, scope: !177)
!186 = !DILocation(line: 145, column: 17, scope: !177)
!187 = distinct !{!187, !179, !188, !189}
!188 = !DILocation(line: 148, column: 17, scope: !174)
!189 = !{!"llvm.loop.mustprogress"}
!190 = !DILocation(line: 149, column: 13, scope: !170)
!191 = !DILocation(line: 152, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !166, file: !32, line: 151, column: 13)
!193 = !DILocation(line: 155, column: 5, scope: !158)
!194 = !DILocation(line: 156, column: 1, scope: !31)
!195 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_08_good", scope: !32, file: !32, line: 446, type: !33, scopeLine: 447, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!196 = !DILocation(line: 448, column: 5, scope: !195)
!197 = !DILocation(line: 449, column: 5, scope: !195)
!198 = !DILocation(line: 450, column: 5, scope: !195)
!199 = !DILocation(line: 451, column: 5, scope: !195)
!200 = !DILocation(line: 452, column: 1, scope: !195)
!201 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 463, type: !202, scopeLine: 464, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!202 = !DISubroutineType(types: !203)
!203 = !{!37, !37, !204}
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!206 = !DILocalVariable(name: "argc", arg: 1, scope: !201, file: !32, line: 463, type: !37)
!207 = !DILocation(line: 463, column: 14, scope: !201)
!208 = !DILocalVariable(name: "argv", arg: 2, scope: !201, file: !32, line: 463, type: !204)
!209 = !DILocation(line: 463, column: 27, scope: !201)
!210 = !DILocation(line: 466, column: 22, scope: !201)
!211 = !DILocation(line: 466, column: 12, scope: !201)
!212 = !DILocation(line: 466, column: 5, scope: !201)
!213 = !DILocation(line: 468, column: 5, scope: !201)
!214 = !DILocation(line: 469, column: 5, scope: !201)
!215 = !DILocation(line: 470, column: 5, scope: !201)
!216 = !DILocation(line: 473, column: 5, scope: !201)
!217 = !DILocation(line: 474, column: 5, scope: !201)
!218 = !DILocation(line: 475, column: 5, scope: !201)
!219 = !DILocation(line: 477, column: 5, scope: !201)
!220 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !32, file: !32, line: 45, type: !221, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!221 = !DISubroutineType(types: !222)
!222 = !{!37}
!223 = !DILocation(line: 47, column: 5, scope: !220)
!224 = distinct !DISubprogram(name: "goodB2G1", scope: !32, file: !32, line: 163, type: !33, scopeLine: 164, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!225 = !DILocalVariable(name: "data", scope: !224, file: !32, line: 165, type: !37)
!226 = !DILocation(line: 165, column: 9, scope: !224)
!227 = !DILocation(line: 167, column: 10, scope: !224)
!228 = !DILocation(line: 168, column: 8, scope: !229)
!229 = distinct !DILexicalBlock(scope: !224, file: !32, line: 168, column: 8)
!230 = !DILocation(line: 168, column: 8, scope: !224)
!231 = !DILocalVariable(name: "recvResult", scope: !232, file: !32, line: 175, type: !37)
!232 = distinct !DILexicalBlock(scope: !233, file: !32, line: 170, column: 9)
!233 = distinct !DILexicalBlock(scope: !229, file: !32, line: 169, column: 5)
!234 = !DILocation(line: 175, column: 17, scope: !232)
!235 = !DILocalVariable(name: "service", scope: !232, file: !32, line: 176, type: !48)
!236 = !DILocation(line: 176, column: 32, scope: !232)
!237 = !DILocalVariable(name: "listenSocket", scope: !232, file: !32, line: 177, type: !37)
!238 = !DILocation(line: 177, column: 20, scope: !232)
!239 = !DILocalVariable(name: "acceptSocket", scope: !232, file: !32, line: 178, type: !37)
!240 = !DILocation(line: 178, column: 20, scope: !232)
!241 = !DILocalVariable(name: "inputBuffer", scope: !232, file: !32, line: 179, type: !20)
!242 = !DILocation(line: 179, column: 18, scope: !232)
!243 = !DILocation(line: 180, column: 13, scope: !232)
!244 = !DILocation(line: 190, column: 32, scope: !245)
!245 = distinct !DILexicalBlock(scope: !232, file: !32, line: 181, column: 13)
!246 = !DILocation(line: 190, column: 30, scope: !245)
!247 = !DILocation(line: 191, column: 21, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !32, line: 191, column: 21)
!249 = !DILocation(line: 191, column: 34, scope: !248)
!250 = !DILocation(line: 191, column: 21, scope: !245)
!251 = !DILocation(line: 193, column: 21, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !32, line: 192, column: 17)
!253 = !DILocation(line: 195, column: 17, scope: !245)
!254 = !DILocation(line: 196, column: 25, scope: !245)
!255 = !DILocation(line: 196, column: 36, scope: !245)
!256 = !DILocation(line: 197, column: 25, scope: !245)
!257 = !DILocation(line: 197, column: 34, scope: !245)
!258 = !DILocation(line: 197, column: 41, scope: !245)
!259 = !DILocation(line: 198, column: 25, scope: !245)
!260 = !DILocation(line: 198, column: 34, scope: !245)
!261 = !DILocation(line: 199, column: 26, scope: !262)
!262 = distinct !DILexicalBlock(scope: !245, file: !32, line: 199, column: 21)
!263 = !DILocation(line: 199, column: 40, scope: !262)
!264 = !DILocation(line: 199, column: 21, scope: !262)
!265 = !DILocation(line: 199, column: 85, scope: !262)
!266 = !DILocation(line: 199, column: 21, scope: !245)
!267 = !DILocation(line: 201, column: 21, scope: !268)
!268 = distinct !DILexicalBlock(scope: !262, file: !32, line: 200, column: 17)
!269 = !DILocation(line: 203, column: 28, scope: !270)
!270 = distinct !DILexicalBlock(scope: !245, file: !32, line: 203, column: 21)
!271 = !DILocation(line: 203, column: 21, scope: !270)
!272 = !DILocation(line: 203, column: 58, scope: !270)
!273 = !DILocation(line: 203, column: 21, scope: !245)
!274 = !DILocation(line: 205, column: 21, scope: !275)
!275 = distinct !DILexicalBlock(scope: !270, file: !32, line: 204, column: 17)
!276 = !DILocation(line: 207, column: 39, scope: !245)
!277 = !DILocation(line: 207, column: 32, scope: !245)
!278 = !DILocation(line: 207, column: 30, scope: !245)
!279 = !DILocation(line: 208, column: 21, scope: !280)
!280 = distinct !DILexicalBlock(scope: !245, file: !32, line: 208, column: 21)
!281 = !DILocation(line: 208, column: 34, scope: !280)
!282 = !DILocation(line: 208, column: 21, scope: !245)
!283 = !DILocation(line: 210, column: 21, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !32, line: 209, column: 17)
!285 = !DILocation(line: 213, column: 35, scope: !245)
!286 = !DILocation(line: 213, column: 49, scope: !245)
!287 = !DILocation(line: 213, column: 30, scope: !245)
!288 = !DILocation(line: 213, column: 28, scope: !245)
!289 = !DILocation(line: 214, column: 21, scope: !290)
!290 = distinct !DILexicalBlock(scope: !245, file: !32, line: 214, column: 21)
!291 = !DILocation(line: 214, column: 32, scope: !290)
!292 = !DILocation(line: 214, column: 48, scope: !290)
!293 = !DILocation(line: 214, column: 51, scope: !290)
!294 = !DILocation(line: 214, column: 62, scope: !290)
!295 = !DILocation(line: 214, column: 21, scope: !245)
!296 = !DILocation(line: 216, column: 21, scope: !297)
!297 = distinct !DILexicalBlock(scope: !290, file: !32, line: 215, column: 17)
!298 = !DILocation(line: 219, column: 29, scope: !245)
!299 = !DILocation(line: 219, column: 17, scope: !245)
!300 = !DILocation(line: 219, column: 41, scope: !245)
!301 = !DILocation(line: 221, column: 29, scope: !245)
!302 = !DILocation(line: 221, column: 24, scope: !245)
!303 = !DILocation(line: 221, column: 22, scope: !245)
!304 = !DILocation(line: 222, column: 13, scope: !245)
!305 = !DILocation(line: 224, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !232, file: !32, line: 224, column: 17)
!307 = !DILocation(line: 224, column: 30, scope: !306)
!308 = !DILocation(line: 224, column: 17, scope: !232)
!309 = !DILocation(line: 226, column: 30, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !32, line: 225, column: 13)
!311 = !DILocation(line: 226, column: 17, scope: !310)
!312 = !DILocation(line: 227, column: 13, scope: !310)
!313 = !DILocation(line: 228, column: 17, scope: !314)
!314 = distinct !DILexicalBlock(scope: !232, file: !32, line: 228, column: 17)
!315 = !DILocation(line: 228, column: 30, scope: !314)
!316 = !DILocation(line: 228, column: 17, scope: !232)
!317 = !DILocation(line: 230, column: 30, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !32, line: 229, column: 13)
!319 = !DILocation(line: 230, column: 17, scope: !318)
!320 = !DILocation(line: 231, column: 13, scope: !318)
!321 = !DILocation(line: 239, column: 5, scope: !233)
!322 = !DILocation(line: 240, column: 8, scope: !323)
!323 = distinct !DILexicalBlock(scope: !224, file: !32, line: 240, column: 8)
!324 = !DILocation(line: 240, column: 8, scope: !224)
!325 = !DILocation(line: 243, column: 9, scope: !326)
!326 = distinct !DILexicalBlock(scope: !323, file: !32, line: 241, column: 5)
!327 = !DILocation(line: 244, column: 5, scope: !326)
!328 = !DILocalVariable(name: "i", scope: !329, file: !32, line: 248, type: !37)
!329 = distinct !DILexicalBlock(scope: !330, file: !32, line: 247, column: 9)
!330 = distinct !DILexicalBlock(scope: !323, file: !32, line: 246, column: 5)
!331 = !DILocation(line: 248, column: 17, scope: !329)
!332 = !DILocalVariable(name: "buffer", scope: !329, file: !32, line: 249, type: !161)
!333 = !DILocation(line: 249, column: 17, scope: !329)
!334 = !DILocation(line: 251, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !329, file: !32, line: 251, column: 17)
!336 = !DILocation(line: 251, column: 22, scope: !335)
!337 = !DILocation(line: 251, column: 27, scope: !335)
!338 = !DILocation(line: 251, column: 30, scope: !335)
!339 = !DILocation(line: 251, column: 35, scope: !335)
!340 = !DILocation(line: 251, column: 17, scope: !329)
!341 = !DILocation(line: 253, column: 24, scope: !342)
!342 = distinct !DILexicalBlock(scope: !335, file: !32, line: 252, column: 13)
!343 = !DILocation(line: 253, column: 17, scope: !342)
!344 = !DILocation(line: 253, column: 30, scope: !342)
!345 = !DILocation(line: 255, column: 23, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !32, line: 255, column: 17)
!347 = !DILocation(line: 255, column: 21, scope: !346)
!348 = !DILocation(line: 255, column: 28, scope: !349)
!349 = distinct !DILexicalBlock(scope: !346, file: !32, line: 255, column: 17)
!350 = !DILocation(line: 255, column: 30, scope: !349)
!351 = !DILocation(line: 255, column: 17, scope: !346)
!352 = !DILocation(line: 257, column: 41, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !32, line: 256, column: 17)
!354 = !DILocation(line: 257, column: 34, scope: !353)
!355 = !DILocation(line: 257, column: 21, scope: !353)
!356 = !DILocation(line: 258, column: 17, scope: !353)
!357 = !DILocation(line: 255, column: 37, scope: !349)
!358 = !DILocation(line: 255, column: 17, scope: !349)
!359 = distinct !{!359, !351, !360, !189}
!360 = !DILocation(line: 258, column: 17, scope: !346)
!361 = !DILocation(line: 259, column: 13, scope: !342)
!362 = !DILocation(line: 262, column: 17, scope: !363)
!363 = distinct !DILexicalBlock(scope: !335, file: !32, line: 261, column: 13)
!364 = !DILocation(line: 266, column: 1, scope: !224)
!365 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !32, file: !32, line: 50, type: !221, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!366 = !DILocation(line: 52, column: 5, scope: !365)
!367 = distinct !DISubprogram(name: "goodB2G2", scope: !32, file: !32, line: 269, type: !33, scopeLine: 270, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!368 = !DILocalVariable(name: "data", scope: !367, file: !32, line: 271, type: !37)
!369 = !DILocation(line: 271, column: 9, scope: !367)
!370 = !DILocation(line: 273, column: 10, scope: !367)
!371 = !DILocation(line: 274, column: 8, scope: !372)
!372 = distinct !DILexicalBlock(scope: !367, file: !32, line: 274, column: 8)
!373 = !DILocation(line: 274, column: 8, scope: !367)
!374 = !DILocalVariable(name: "recvResult", scope: !375, file: !32, line: 281, type: !37)
!375 = distinct !DILexicalBlock(scope: !376, file: !32, line: 276, column: 9)
!376 = distinct !DILexicalBlock(scope: !372, file: !32, line: 275, column: 5)
!377 = !DILocation(line: 281, column: 17, scope: !375)
!378 = !DILocalVariable(name: "service", scope: !375, file: !32, line: 282, type: !48)
!379 = !DILocation(line: 282, column: 32, scope: !375)
!380 = !DILocalVariable(name: "listenSocket", scope: !375, file: !32, line: 283, type: !37)
!381 = !DILocation(line: 283, column: 20, scope: !375)
!382 = !DILocalVariable(name: "acceptSocket", scope: !375, file: !32, line: 284, type: !37)
!383 = !DILocation(line: 284, column: 20, scope: !375)
!384 = !DILocalVariable(name: "inputBuffer", scope: !375, file: !32, line: 285, type: !20)
!385 = !DILocation(line: 285, column: 18, scope: !375)
!386 = !DILocation(line: 286, column: 13, scope: !375)
!387 = !DILocation(line: 296, column: 32, scope: !388)
!388 = distinct !DILexicalBlock(scope: !375, file: !32, line: 287, column: 13)
!389 = !DILocation(line: 296, column: 30, scope: !388)
!390 = !DILocation(line: 297, column: 21, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !32, line: 297, column: 21)
!392 = !DILocation(line: 297, column: 34, scope: !391)
!393 = !DILocation(line: 297, column: 21, scope: !388)
!394 = !DILocation(line: 299, column: 21, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !32, line: 298, column: 17)
!396 = !DILocation(line: 301, column: 17, scope: !388)
!397 = !DILocation(line: 302, column: 25, scope: !388)
!398 = !DILocation(line: 302, column: 36, scope: !388)
!399 = !DILocation(line: 303, column: 25, scope: !388)
!400 = !DILocation(line: 303, column: 34, scope: !388)
!401 = !DILocation(line: 303, column: 41, scope: !388)
!402 = !DILocation(line: 304, column: 25, scope: !388)
!403 = !DILocation(line: 304, column: 34, scope: !388)
!404 = !DILocation(line: 305, column: 26, scope: !405)
!405 = distinct !DILexicalBlock(scope: !388, file: !32, line: 305, column: 21)
!406 = !DILocation(line: 305, column: 40, scope: !405)
!407 = !DILocation(line: 305, column: 21, scope: !405)
!408 = !DILocation(line: 305, column: 85, scope: !405)
!409 = !DILocation(line: 305, column: 21, scope: !388)
!410 = !DILocation(line: 307, column: 21, scope: !411)
!411 = distinct !DILexicalBlock(scope: !405, file: !32, line: 306, column: 17)
!412 = !DILocation(line: 309, column: 28, scope: !413)
!413 = distinct !DILexicalBlock(scope: !388, file: !32, line: 309, column: 21)
!414 = !DILocation(line: 309, column: 21, scope: !413)
!415 = !DILocation(line: 309, column: 58, scope: !413)
!416 = !DILocation(line: 309, column: 21, scope: !388)
!417 = !DILocation(line: 311, column: 21, scope: !418)
!418 = distinct !DILexicalBlock(scope: !413, file: !32, line: 310, column: 17)
!419 = !DILocation(line: 313, column: 39, scope: !388)
!420 = !DILocation(line: 313, column: 32, scope: !388)
!421 = !DILocation(line: 313, column: 30, scope: !388)
!422 = !DILocation(line: 314, column: 21, scope: !423)
!423 = distinct !DILexicalBlock(scope: !388, file: !32, line: 314, column: 21)
!424 = !DILocation(line: 314, column: 34, scope: !423)
!425 = !DILocation(line: 314, column: 21, scope: !388)
!426 = !DILocation(line: 316, column: 21, scope: !427)
!427 = distinct !DILexicalBlock(scope: !423, file: !32, line: 315, column: 17)
!428 = !DILocation(line: 319, column: 35, scope: !388)
!429 = !DILocation(line: 319, column: 49, scope: !388)
!430 = !DILocation(line: 319, column: 30, scope: !388)
!431 = !DILocation(line: 319, column: 28, scope: !388)
!432 = !DILocation(line: 320, column: 21, scope: !433)
!433 = distinct !DILexicalBlock(scope: !388, file: !32, line: 320, column: 21)
!434 = !DILocation(line: 320, column: 32, scope: !433)
!435 = !DILocation(line: 320, column: 48, scope: !433)
!436 = !DILocation(line: 320, column: 51, scope: !433)
!437 = !DILocation(line: 320, column: 62, scope: !433)
!438 = !DILocation(line: 320, column: 21, scope: !388)
!439 = !DILocation(line: 322, column: 21, scope: !440)
!440 = distinct !DILexicalBlock(scope: !433, file: !32, line: 321, column: 17)
!441 = !DILocation(line: 325, column: 29, scope: !388)
!442 = !DILocation(line: 325, column: 17, scope: !388)
!443 = !DILocation(line: 325, column: 41, scope: !388)
!444 = !DILocation(line: 327, column: 29, scope: !388)
!445 = !DILocation(line: 327, column: 24, scope: !388)
!446 = !DILocation(line: 327, column: 22, scope: !388)
!447 = !DILocation(line: 328, column: 13, scope: !388)
!448 = !DILocation(line: 330, column: 17, scope: !449)
!449 = distinct !DILexicalBlock(scope: !375, file: !32, line: 330, column: 17)
!450 = !DILocation(line: 330, column: 30, scope: !449)
!451 = !DILocation(line: 330, column: 17, scope: !375)
!452 = !DILocation(line: 332, column: 30, scope: !453)
!453 = distinct !DILexicalBlock(scope: !449, file: !32, line: 331, column: 13)
!454 = !DILocation(line: 332, column: 17, scope: !453)
!455 = !DILocation(line: 333, column: 13, scope: !453)
!456 = !DILocation(line: 334, column: 17, scope: !457)
!457 = distinct !DILexicalBlock(scope: !375, file: !32, line: 334, column: 17)
!458 = !DILocation(line: 334, column: 30, scope: !457)
!459 = !DILocation(line: 334, column: 17, scope: !375)
!460 = !DILocation(line: 336, column: 30, scope: !461)
!461 = distinct !DILexicalBlock(scope: !457, file: !32, line: 335, column: 13)
!462 = !DILocation(line: 336, column: 17, scope: !461)
!463 = !DILocation(line: 337, column: 13, scope: !461)
!464 = !DILocation(line: 345, column: 5, scope: !376)
!465 = !DILocation(line: 346, column: 8, scope: !466)
!466 = distinct !DILexicalBlock(scope: !367, file: !32, line: 346, column: 8)
!467 = !DILocation(line: 346, column: 8, scope: !367)
!468 = !DILocalVariable(name: "i", scope: !469, file: !32, line: 349, type: !37)
!469 = distinct !DILexicalBlock(scope: !470, file: !32, line: 348, column: 9)
!470 = distinct !DILexicalBlock(scope: !466, file: !32, line: 347, column: 5)
!471 = !DILocation(line: 349, column: 17, scope: !469)
!472 = !DILocalVariable(name: "buffer", scope: !469, file: !32, line: 350, type: !161)
!473 = !DILocation(line: 350, column: 17, scope: !469)
!474 = !DILocation(line: 352, column: 17, scope: !475)
!475 = distinct !DILexicalBlock(scope: !469, file: !32, line: 352, column: 17)
!476 = !DILocation(line: 352, column: 22, scope: !475)
!477 = !DILocation(line: 352, column: 27, scope: !475)
!478 = !DILocation(line: 352, column: 30, scope: !475)
!479 = !DILocation(line: 352, column: 35, scope: !475)
!480 = !DILocation(line: 352, column: 17, scope: !469)
!481 = !DILocation(line: 354, column: 24, scope: !482)
!482 = distinct !DILexicalBlock(scope: !475, file: !32, line: 353, column: 13)
!483 = !DILocation(line: 354, column: 17, scope: !482)
!484 = !DILocation(line: 354, column: 30, scope: !482)
!485 = !DILocation(line: 356, column: 23, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !32, line: 356, column: 17)
!487 = !DILocation(line: 356, column: 21, scope: !486)
!488 = !DILocation(line: 356, column: 28, scope: !489)
!489 = distinct !DILexicalBlock(scope: !486, file: !32, line: 356, column: 17)
!490 = !DILocation(line: 356, column: 30, scope: !489)
!491 = !DILocation(line: 356, column: 17, scope: !486)
!492 = !DILocation(line: 358, column: 41, scope: !493)
!493 = distinct !DILexicalBlock(scope: !489, file: !32, line: 357, column: 17)
!494 = !DILocation(line: 358, column: 34, scope: !493)
!495 = !DILocation(line: 358, column: 21, scope: !493)
!496 = !DILocation(line: 359, column: 17, scope: !493)
!497 = !DILocation(line: 356, column: 37, scope: !489)
!498 = !DILocation(line: 356, column: 17, scope: !489)
!499 = distinct !{!499, !491, !500, !189}
!500 = !DILocation(line: 359, column: 17, scope: !486)
!501 = !DILocation(line: 360, column: 13, scope: !482)
!502 = !DILocation(line: 363, column: 17, scope: !503)
!503 = distinct !DILexicalBlock(scope: !475, file: !32, line: 362, column: 13)
!504 = !DILocation(line: 366, column: 5, scope: !470)
!505 = !DILocation(line: 367, column: 1, scope: !367)
!506 = distinct !DISubprogram(name: "goodG2B1", scope: !32, file: !32, line: 370, type: !33, scopeLine: 371, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!507 = !DILocalVariable(name: "data", scope: !506, file: !32, line: 372, type: !37)
!508 = !DILocation(line: 372, column: 9, scope: !506)
!509 = !DILocation(line: 374, column: 10, scope: !506)
!510 = !DILocation(line: 375, column: 8, scope: !511)
!511 = distinct !DILexicalBlock(scope: !506, file: !32, line: 375, column: 8)
!512 = !DILocation(line: 375, column: 8, scope: !506)
!513 = !DILocation(line: 378, column: 9, scope: !514)
!514 = distinct !DILexicalBlock(scope: !511, file: !32, line: 376, column: 5)
!515 = !DILocation(line: 379, column: 5, scope: !514)
!516 = !DILocation(line: 384, column: 14, scope: !517)
!517 = distinct !DILexicalBlock(scope: !511, file: !32, line: 381, column: 5)
!518 = !DILocation(line: 386, column: 8, scope: !519)
!519 = distinct !DILexicalBlock(scope: !506, file: !32, line: 386, column: 8)
!520 = !DILocation(line: 386, column: 8, scope: !506)
!521 = !DILocalVariable(name: "i", scope: !522, file: !32, line: 389, type: !37)
!522 = distinct !DILexicalBlock(scope: !523, file: !32, line: 388, column: 9)
!523 = distinct !DILexicalBlock(scope: !519, file: !32, line: 387, column: 5)
!524 = !DILocation(line: 389, column: 17, scope: !522)
!525 = !DILocalVariable(name: "buffer", scope: !522, file: !32, line: 390, type: !161)
!526 = !DILocation(line: 390, column: 17, scope: !522)
!527 = !DILocation(line: 393, column: 17, scope: !528)
!528 = distinct !DILexicalBlock(scope: !522, file: !32, line: 393, column: 17)
!529 = !DILocation(line: 393, column: 22, scope: !528)
!530 = !DILocation(line: 393, column: 17, scope: !522)
!531 = !DILocation(line: 395, column: 24, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !32, line: 394, column: 13)
!533 = !DILocation(line: 395, column: 17, scope: !532)
!534 = !DILocation(line: 395, column: 30, scope: !532)
!535 = !DILocation(line: 397, column: 23, scope: !536)
!536 = distinct !DILexicalBlock(scope: !532, file: !32, line: 397, column: 17)
!537 = !DILocation(line: 397, column: 21, scope: !536)
!538 = !DILocation(line: 397, column: 28, scope: !539)
!539 = distinct !DILexicalBlock(scope: !536, file: !32, line: 397, column: 17)
!540 = !DILocation(line: 397, column: 30, scope: !539)
!541 = !DILocation(line: 397, column: 17, scope: !536)
!542 = !DILocation(line: 399, column: 41, scope: !543)
!543 = distinct !DILexicalBlock(scope: !539, file: !32, line: 398, column: 17)
!544 = !DILocation(line: 399, column: 34, scope: !543)
!545 = !DILocation(line: 399, column: 21, scope: !543)
!546 = !DILocation(line: 400, column: 17, scope: !543)
!547 = !DILocation(line: 397, column: 37, scope: !539)
!548 = !DILocation(line: 397, column: 17, scope: !539)
!549 = distinct !{!549, !541, !550, !189}
!550 = !DILocation(line: 400, column: 17, scope: !536)
!551 = !DILocation(line: 401, column: 13, scope: !532)
!552 = !DILocation(line: 404, column: 17, scope: !553)
!553 = distinct !DILexicalBlock(scope: !528, file: !32, line: 403, column: 13)
!554 = !DILocation(line: 407, column: 5, scope: !523)
!555 = !DILocation(line: 408, column: 1, scope: !506)
!556 = distinct !DISubprogram(name: "goodG2B2", scope: !32, file: !32, line: 411, type: !33, scopeLine: 412, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!557 = !DILocalVariable(name: "data", scope: !556, file: !32, line: 413, type: !37)
!558 = !DILocation(line: 413, column: 9, scope: !556)
!559 = !DILocation(line: 415, column: 10, scope: !556)
!560 = !DILocation(line: 416, column: 8, scope: !561)
!561 = distinct !DILexicalBlock(scope: !556, file: !32, line: 416, column: 8)
!562 = !DILocation(line: 416, column: 8, scope: !556)
!563 = !DILocation(line: 420, column: 14, scope: !564)
!564 = distinct !DILexicalBlock(scope: !561, file: !32, line: 417, column: 5)
!565 = !DILocation(line: 421, column: 5, scope: !564)
!566 = !DILocation(line: 422, column: 8, scope: !567)
!567 = distinct !DILexicalBlock(scope: !556, file: !32, line: 422, column: 8)
!568 = !DILocation(line: 422, column: 8, scope: !556)
!569 = !DILocalVariable(name: "i", scope: !570, file: !32, line: 425, type: !37)
!570 = distinct !DILexicalBlock(scope: !571, file: !32, line: 424, column: 9)
!571 = distinct !DILexicalBlock(scope: !567, file: !32, line: 423, column: 5)
!572 = !DILocation(line: 425, column: 17, scope: !570)
!573 = !DILocalVariable(name: "buffer", scope: !570, file: !32, line: 426, type: !161)
!574 = !DILocation(line: 426, column: 17, scope: !570)
!575 = !DILocation(line: 429, column: 17, scope: !576)
!576 = distinct !DILexicalBlock(scope: !570, file: !32, line: 429, column: 17)
!577 = !DILocation(line: 429, column: 22, scope: !576)
!578 = !DILocation(line: 429, column: 17, scope: !570)
!579 = !DILocation(line: 431, column: 24, scope: !580)
!580 = distinct !DILexicalBlock(scope: !576, file: !32, line: 430, column: 13)
!581 = !DILocation(line: 431, column: 17, scope: !580)
!582 = !DILocation(line: 431, column: 30, scope: !580)
!583 = !DILocation(line: 433, column: 23, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !32, line: 433, column: 17)
!585 = !DILocation(line: 433, column: 21, scope: !584)
!586 = !DILocation(line: 433, column: 28, scope: !587)
!587 = distinct !DILexicalBlock(scope: !584, file: !32, line: 433, column: 17)
!588 = !DILocation(line: 433, column: 30, scope: !587)
!589 = !DILocation(line: 433, column: 17, scope: !584)
!590 = !DILocation(line: 435, column: 41, scope: !591)
!591 = distinct !DILexicalBlock(scope: !587, file: !32, line: 434, column: 17)
!592 = !DILocation(line: 435, column: 34, scope: !591)
!593 = !DILocation(line: 435, column: 21, scope: !591)
!594 = !DILocation(line: 436, column: 17, scope: !591)
!595 = !DILocation(line: 433, column: 37, scope: !587)
!596 = !DILocation(line: 433, column: 17, scope: !587)
!597 = distinct !{!597, !589, !598, !189}
!598 = !DILocation(line: 436, column: 17, scope: !584)
!599 = !DILocation(line: 437, column: 13, scope: !580)
!600 = !DILocation(line: 440, column: 17, scope: !601)
!601 = distinct !DILexicalBlock(scope: !576, file: !32, line: 439, column: 13)
!602 = !DILocation(line: 443, column: 5, scope: !571)
!603 = !DILocation(line: 444, column: 1, scope: !556)
