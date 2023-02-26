; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_bad() #0 !dbg !34 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 -1, i32* %data, align 4, !dbg !41
  %call = call i32 @staticReturnsTrue(), !dbg !42
  %tobool = icmp ne i32 %call, 0, !dbg !42
  br i1 %tobool, label %if.then, label %if.end34, !dbg !44

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !45, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !49, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, i32* %listenSocket, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 -1, i32* %acceptSocket, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  br label %do.body, !dbg !76

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !77
  store i32 %call1, i32* %listenSocket, align 4, !dbg !79
  %0 = load i32, i32* %listenSocket, align 4, !dbg !80
  %cmp = icmp eq i32 %0, -1, !dbg !82
  br i1 %cmp, label %if.then2, label %if.end, !dbg !83

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !84

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !86
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !86
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !87
  store i8 2, i8* %sin_family, align 1, !dbg !88
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !89
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !90
  store i32 0, i32* %s_addr, align 4, !dbg !91
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !92
  store i16 -30871, i16* %sin_port, align 2, !dbg !93
  %2 = load i32, i32* %listenSocket, align 4, !dbg !94
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !96
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !97
  %cmp4 = icmp eq i32 %call3, -1, !dbg !98
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !99

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !100

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !102
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !104
  %cmp8 = icmp eq i32 %call7, -1, !dbg !105
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !106

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !107

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !109
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !110
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !111
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !112
  %cmp12 = icmp eq i32 %6, -1, !dbg !114
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !115

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !116

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !118
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !119
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !120
  %conv = trunc i64 %call15 to i32, !dbg !120
  store i32 %conv, i32* %recvResult, align 4, !dbg !121
  %8 = load i32, i32* %recvResult, align 4, !dbg !122
  %cmp16 = icmp eq i32 %8, -1, !dbg !124
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !125

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !126
  %cmp18 = icmp eq i32 %9, 0, !dbg !127
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !128

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !129

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !131
  %idxprom = sext i32 %10 to i64, !dbg !132
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !132
  store i8 0, i8* %arrayidx, align 1, !dbg !133
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !134
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !135
  store i32 %call23, i32* %data, align 4, !dbg !136
  br label %do.end, !dbg !137

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !138
  %cmp24 = icmp ne i32 %11, -1, !dbg !140
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !141

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !142
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !144
  br label %if.end28, !dbg !145

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !146
  %cmp29 = icmp ne i32 %13, -1, !dbg !148
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !149

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !150
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !152
  br label %if.end33, !dbg !153

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !154

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 @staticReturnsTrue(), !dbg !155
  %tobool36 = icmp ne i32 %call35, 0, !dbg !155
  br i1 %tobool36, label %if.then37, label %if.end62, !dbg !157

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !158, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !162, metadata !DIExpression()), !dbg !163
  %call38 = call i8* @malloc(i64 noundef 40) #6, !dbg !164
  %15 = bitcast i8* %call38 to i32*, !dbg !165
  store i32* %15, i32** %buffer, align 8, !dbg !163
  %16 = load i32*, i32** %buffer, align 8, !dbg !166
  %cmp39 = icmp eq i32* %16, null, !dbg !168
  br i1 %cmp39, label %if.then41, label %if.end42, !dbg !169

if.then41:                                        ; preds = %if.then37
  call void @exit(i32 noundef -1) #7, !dbg !170
  unreachable, !dbg !170

if.end42:                                         ; preds = %if.then37
  store i32 0, i32* %i, align 4, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end42
  %17 = load i32, i32* %i, align 4, !dbg !175
  %cmp43 = icmp slt i32 %17, 10, !dbg !177
  br i1 %cmp43, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !179
  %19 = load i32, i32* %i, align 4, !dbg !181
  %idxprom45 = sext i32 %19 to i64, !dbg !179
  %arrayidx46 = getelementptr inbounds i32, i32* %18, i64 %idxprom45, !dbg !179
  store i32 0, i32* %arrayidx46, align 4, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !184
  %inc = add nsw i32 %20, 1, !dbg !184
  store i32 %inc, i32* %i, align 4, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !189
  %cmp47 = icmp sge i32 %21, 0, !dbg !191
  br i1 %cmp47, label %if.then49, label %if.else, !dbg !192

if.then49:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !193
  %23 = load i32, i32* %data, align 4, !dbg !195
  %idxprom50 = sext i32 %23 to i64, !dbg !193
  %arrayidx51 = getelementptr inbounds i32, i32* %22, i64 %idxprom50, !dbg !193
  store i32 1, i32* %arrayidx51, align 4, !dbg !196
  store i32 0, i32* %i, align 4, !dbg !197
  br label %for.cond52, !dbg !199

for.cond52:                                       ; preds = %for.inc58, %if.then49
  %24 = load i32, i32* %i, align 4, !dbg !200
  %cmp53 = icmp slt i32 %24, 10, !dbg !202
  br i1 %cmp53, label %for.body55, label %for.end60, !dbg !203

for.body55:                                       ; preds = %for.cond52
  %25 = load i32*, i32** %buffer, align 8, !dbg !204
  %26 = load i32, i32* %i, align 4, !dbg !206
  %idxprom56 = sext i32 %26 to i64, !dbg !204
  %arrayidx57 = getelementptr inbounds i32, i32* %25, i64 %idxprom56, !dbg !204
  %27 = load i32, i32* %arrayidx57, align 4, !dbg !204
  call void @printIntLine(i32 noundef %27), !dbg !207
  br label %for.inc58, !dbg !208

for.inc58:                                        ; preds = %for.body55
  %28 = load i32, i32* %i, align 4, !dbg !209
  %inc59 = add nsw i32 %28, 1, !dbg !209
  store i32 %inc59, i32* %i, align 4, !dbg !209
  br label %for.cond52, !dbg !210, !llvm.loop !211

for.end60:                                        ; preds = %for.cond52
  br label %if.end61, !dbg !213

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !214
  br label %if.end61

if.end61:                                         ; preds = %if.else, %for.end60
  %29 = load i32*, i32** %buffer, align 8, !dbg !216
  %30 = bitcast i32* %29 to i8*, !dbg !216
  call void @free(i8* noundef %30), !dbg !217
  br label %if.end62, !dbg !218

if.end62:                                         ; preds = %if.end61, %if.end34
  ret void, !dbg !219
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

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_good() #0 !dbg !220 {
entry:
  call void @goodB2G1(), !dbg !221
  call void @goodB2G2(), !dbg !222
  call void @goodG2B1(), !dbg !223
  call void @goodG2B2(), !dbg !224
  ret void, !dbg !225
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !226 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !231, metadata !DIExpression()), !dbg !232
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !233, metadata !DIExpression()), !dbg !234
  %call = call i64 @time(i64* noundef null), !dbg !235
  %conv = trunc i64 %call to i32, !dbg !236
  call void @srand(i32 noundef %conv), !dbg !237
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !238
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_good(), !dbg !239
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !240
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !241
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_bad(), !dbg !242
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !243
  ret i32 0, !dbg !244
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !245 {
entry:
  ret i32 1, !dbg !248
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !249 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 -1, i32* %data, align 4, !dbg !252
  %call = call i32 @staticReturnsTrue(), !dbg !253
  %tobool = icmp ne i32 %call, 0, !dbg !253
  br i1 %tobool, label %if.then, label %if.end34, !dbg !255

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !256, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !260, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !262, metadata !DIExpression()), !dbg !263
  store i32 -1, i32* %listenSocket, align 4, !dbg !263
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 -1, i32* %acceptSocket, align 4, !dbg !265
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !266, metadata !DIExpression()), !dbg !267
  br label %do.body, !dbg !268

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !269
  store i32 %call1, i32* %listenSocket, align 4, !dbg !271
  %0 = load i32, i32* %listenSocket, align 4, !dbg !272
  %cmp = icmp eq i32 %0, -1, !dbg !274
  br i1 %cmp, label %if.then2, label %if.end, !dbg !275

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !276

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !278
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !278
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !279
  store i8 2, i8* %sin_family, align 1, !dbg !280
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !281
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !282
  store i32 0, i32* %s_addr, align 4, !dbg !283
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !284
  store i16 -30871, i16* %sin_port, align 2, !dbg !285
  %2 = load i32, i32* %listenSocket, align 4, !dbg !286
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !288
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !289
  %cmp4 = icmp eq i32 %call3, -1, !dbg !290
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !291

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !292

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !294
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !296
  %cmp8 = icmp eq i32 %call7, -1, !dbg !297
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !298

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !299

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !301
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !302
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !303
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !304
  %cmp12 = icmp eq i32 %6, -1, !dbg !306
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !307

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !308

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !310
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !311
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !312
  %conv = trunc i64 %call15 to i32, !dbg !312
  store i32 %conv, i32* %recvResult, align 4, !dbg !313
  %8 = load i32, i32* %recvResult, align 4, !dbg !314
  %cmp16 = icmp eq i32 %8, -1, !dbg !316
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !317

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !318
  %cmp18 = icmp eq i32 %9, 0, !dbg !319
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !320

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !321

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !323
  %idxprom = sext i32 %10 to i64, !dbg !324
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !324
  store i8 0, i8* %arrayidx, align 1, !dbg !325
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !326
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !327
  store i32 %call23, i32* %data, align 4, !dbg !328
  br label %do.end, !dbg !329

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !330
  %cmp24 = icmp ne i32 %11, -1, !dbg !332
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !333

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !334
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !336
  br label %if.end28, !dbg !337

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !338
  %cmp29 = icmp ne i32 %13, -1, !dbg !340
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !341

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !342
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !344
  br label %if.end33, !dbg !345

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !346

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 @staticReturnsFalse(), !dbg !347
  %tobool36 = icmp ne i32 %call35, 0, !dbg !347
  br i1 %tobool36, label %if.then37, label %if.else, !dbg !349

if.then37:                                        ; preds = %if.end34
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !350
  br label %if.end65, !dbg !352

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !353, metadata !DIExpression()), !dbg !356
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !357, metadata !DIExpression()), !dbg !358
  %call38 = call i8* @malloc(i64 noundef 40) #6, !dbg !359
  %15 = bitcast i8* %call38 to i32*, !dbg !360
  store i32* %15, i32** %buffer, align 8, !dbg !358
  %16 = load i32*, i32** %buffer, align 8, !dbg !361
  %cmp39 = icmp eq i32* %16, null, !dbg !363
  br i1 %cmp39, label %if.then41, label %if.end42, !dbg !364

if.then41:                                        ; preds = %if.else
  call void @exit(i32 noundef -1) #7, !dbg !365
  unreachable, !dbg !365

if.end42:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !367
  br label %for.cond, !dbg !369

for.cond:                                         ; preds = %for.inc, %if.end42
  %17 = load i32, i32* %i, align 4, !dbg !370
  %cmp43 = icmp slt i32 %17, 10, !dbg !372
  br i1 %cmp43, label %for.body, label %for.end, !dbg !373

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !374
  %19 = load i32, i32* %i, align 4, !dbg !376
  %idxprom45 = sext i32 %19 to i64, !dbg !374
  %arrayidx46 = getelementptr inbounds i32, i32* %18, i64 %idxprom45, !dbg !374
  store i32 0, i32* %arrayidx46, align 4, !dbg !377
  br label %for.inc, !dbg !378

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !379
  %inc = add nsw i32 %20, 1, !dbg !379
  store i32 %inc, i32* %i, align 4, !dbg !379
  br label %for.cond, !dbg !380, !llvm.loop !381

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !383
  %cmp47 = icmp sge i32 %21, 0, !dbg !385
  br i1 %cmp47, label %land.lhs.true, label %if.else63, !dbg !386

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !387
  %cmp49 = icmp slt i32 %22, 10, !dbg !388
  br i1 %cmp49, label %if.then51, label %if.else63, !dbg !389

if.then51:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !390
  %24 = load i32, i32* %data, align 4, !dbg !392
  %idxprom52 = sext i32 %24 to i64, !dbg !390
  %arrayidx53 = getelementptr inbounds i32, i32* %23, i64 %idxprom52, !dbg !390
  store i32 1, i32* %arrayidx53, align 4, !dbg !393
  store i32 0, i32* %i, align 4, !dbg !394
  br label %for.cond54, !dbg !396

for.cond54:                                       ; preds = %for.inc60, %if.then51
  %25 = load i32, i32* %i, align 4, !dbg !397
  %cmp55 = icmp slt i32 %25, 10, !dbg !399
  br i1 %cmp55, label %for.body57, label %for.end62, !dbg !400

for.body57:                                       ; preds = %for.cond54
  %26 = load i32*, i32** %buffer, align 8, !dbg !401
  %27 = load i32, i32* %i, align 4, !dbg !403
  %idxprom58 = sext i32 %27 to i64, !dbg !401
  %arrayidx59 = getelementptr inbounds i32, i32* %26, i64 %idxprom58, !dbg !401
  %28 = load i32, i32* %arrayidx59, align 4, !dbg !401
  call void @printIntLine(i32 noundef %28), !dbg !404
  br label %for.inc60, !dbg !405

for.inc60:                                        ; preds = %for.body57
  %29 = load i32, i32* %i, align 4, !dbg !406
  %inc61 = add nsw i32 %29, 1, !dbg !406
  store i32 %inc61, i32* %i, align 4, !dbg !406
  br label %for.cond54, !dbg !407, !llvm.loop !408

for.end62:                                        ; preds = %for.cond54
  br label %if.end64, !dbg !410

if.else63:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !411
  br label %if.end64

if.end64:                                         ; preds = %if.else63, %for.end62
  %30 = load i32*, i32** %buffer, align 8, !dbg !413
  %31 = bitcast i32* %30 to i8*, !dbg !413
  call void @free(i8* noundef %31), !dbg !414
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.then37
  ret void, !dbg !415
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !416 {
entry:
  ret i32 0, !dbg !417
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !418 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !419, metadata !DIExpression()), !dbg !420
  store i32 -1, i32* %data, align 4, !dbg !421
  %call = call i32 @staticReturnsTrue(), !dbg !422
  %tobool = icmp ne i32 %call, 0, !dbg !422
  br i1 %tobool, label %if.then, label %if.end34, !dbg !424

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !425, metadata !DIExpression()), !dbg !428
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !429, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !431, metadata !DIExpression()), !dbg !432
  store i32 -1, i32* %listenSocket, align 4, !dbg !432
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !433, metadata !DIExpression()), !dbg !434
  store i32 -1, i32* %acceptSocket, align 4, !dbg !434
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !435, metadata !DIExpression()), !dbg !436
  br label %do.body, !dbg !437

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !438
  store i32 %call1, i32* %listenSocket, align 4, !dbg !440
  %0 = load i32, i32* %listenSocket, align 4, !dbg !441
  %cmp = icmp eq i32 %0, -1, !dbg !443
  br i1 %cmp, label %if.then2, label %if.end, !dbg !444

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !445

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !447
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !447
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !448
  store i8 2, i8* %sin_family, align 1, !dbg !449
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !450
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !451
  store i32 0, i32* %s_addr, align 4, !dbg !452
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !453
  store i16 -30871, i16* %sin_port, align 2, !dbg !454
  %2 = load i32, i32* %listenSocket, align 4, !dbg !455
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !457
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !458
  %cmp4 = icmp eq i32 %call3, -1, !dbg !459
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !460

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !461

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !463
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !465
  %cmp8 = icmp eq i32 %call7, -1, !dbg !466
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !467

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !468

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !470
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !471
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !472
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !473
  %cmp12 = icmp eq i32 %6, -1, !dbg !475
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !476

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !477

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !479
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !480
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !481
  %conv = trunc i64 %call15 to i32, !dbg !481
  store i32 %conv, i32* %recvResult, align 4, !dbg !482
  %8 = load i32, i32* %recvResult, align 4, !dbg !483
  %cmp16 = icmp eq i32 %8, -1, !dbg !485
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !486

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !487
  %cmp18 = icmp eq i32 %9, 0, !dbg !488
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !489

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !490

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !492
  %idxprom = sext i32 %10 to i64, !dbg !493
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !493
  store i8 0, i8* %arrayidx, align 1, !dbg !494
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !495
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !496
  store i32 %call23, i32* %data, align 4, !dbg !497
  br label %do.end, !dbg !498

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !499
  %cmp24 = icmp ne i32 %11, -1, !dbg !501
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !502

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !503
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !505
  br label %if.end28, !dbg !506

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !507
  %cmp29 = icmp ne i32 %13, -1, !dbg !509
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !510

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !511
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !513
  br label %if.end33, !dbg !514

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !515

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 @staticReturnsTrue(), !dbg !516
  %tobool36 = icmp ne i32 %call35, 0, !dbg !516
  br i1 %tobool36, label %if.then37, label %if.end64, !dbg !518

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !519, metadata !DIExpression()), !dbg !522
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !523, metadata !DIExpression()), !dbg !524
  %call38 = call i8* @malloc(i64 noundef 40) #6, !dbg !525
  %15 = bitcast i8* %call38 to i32*, !dbg !526
  store i32* %15, i32** %buffer, align 8, !dbg !524
  %16 = load i32*, i32** %buffer, align 8, !dbg !527
  %cmp39 = icmp eq i32* %16, null, !dbg !529
  br i1 %cmp39, label %if.then41, label %if.end42, !dbg !530

if.then41:                                        ; preds = %if.then37
  call void @exit(i32 noundef -1) #7, !dbg !531
  unreachable, !dbg !531

if.end42:                                         ; preds = %if.then37
  store i32 0, i32* %i, align 4, !dbg !533
  br label %for.cond, !dbg !535

for.cond:                                         ; preds = %for.inc, %if.end42
  %17 = load i32, i32* %i, align 4, !dbg !536
  %cmp43 = icmp slt i32 %17, 10, !dbg !538
  br i1 %cmp43, label %for.body, label %for.end, !dbg !539

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !540
  %19 = load i32, i32* %i, align 4, !dbg !542
  %idxprom45 = sext i32 %19 to i64, !dbg !540
  %arrayidx46 = getelementptr inbounds i32, i32* %18, i64 %idxprom45, !dbg !540
  store i32 0, i32* %arrayidx46, align 4, !dbg !543
  br label %for.inc, !dbg !544

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !545
  %inc = add nsw i32 %20, 1, !dbg !545
  store i32 %inc, i32* %i, align 4, !dbg !545
  br label %for.cond, !dbg !546, !llvm.loop !547

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !549
  %cmp47 = icmp sge i32 %21, 0, !dbg !551
  br i1 %cmp47, label %land.lhs.true, label %if.else, !dbg !552

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !553
  %cmp49 = icmp slt i32 %22, 10, !dbg !554
  br i1 %cmp49, label %if.then51, label %if.else, !dbg !555

if.then51:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !556
  %24 = load i32, i32* %data, align 4, !dbg !558
  %idxprom52 = sext i32 %24 to i64, !dbg !556
  %arrayidx53 = getelementptr inbounds i32, i32* %23, i64 %idxprom52, !dbg !556
  store i32 1, i32* %arrayidx53, align 4, !dbg !559
  store i32 0, i32* %i, align 4, !dbg !560
  br label %for.cond54, !dbg !562

for.cond54:                                       ; preds = %for.inc60, %if.then51
  %25 = load i32, i32* %i, align 4, !dbg !563
  %cmp55 = icmp slt i32 %25, 10, !dbg !565
  br i1 %cmp55, label %for.body57, label %for.end62, !dbg !566

for.body57:                                       ; preds = %for.cond54
  %26 = load i32*, i32** %buffer, align 8, !dbg !567
  %27 = load i32, i32* %i, align 4, !dbg !569
  %idxprom58 = sext i32 %27 to i64, !dbg !567
  %arrayidx59 = getelementptr inbounds i32, i32* %26, i64 %idxprom58, !dbg !567
  %28 = load i32, i32* %arrayidx59, align 4, !dbg !567
  call void @printIntLine(i32 noundef %28), !dbg !570
  br label %for.inc60, !dbg !571

for.inc60:                                        ; preds = %for.body57
  %29 = load i32, i32* %i, align 4, !dbg !572
  %inc61 = add nsw i32 %29, 1, !dbg !572
  store i32 %inc61, i32* %i, align 4, !dbg !572
  br label %for.cond54, !dbg !573, !llvm.loop !574

for.end62:                                        ; preds = %for.cond54
  br label %if.end63, !dbg !576

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !577
  br label %if.end63

if.end63:                                         ; preds = %if.else, %for.end62
  %30 = load i32*, i32** %buffer, align 8, !dbg !579
  %31 = bitcast i32* %30 to i8*, !dbg !579
  call void @free(i8* noundef %31), !dbg !580
  br label %if.end64, !dbg !581

if.end64:                                         ; preds = %if.end63, %if.end34
  ret void, !dbg !582
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !583 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !584, metadata !DIExpression()), !dbg !585
  store i32 -1, i32* %data, align 4, !dbg !586
  %call = call i32 @staticReturnsFalse(), !dbg !587
  %tobool = icmp ne i32 %call, 0, !dbg !587
  br i1 %tobool, label %if.then, label %if.else, !dbg !589

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !590
  br label %if.end, !dbg !592

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !593
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !595
  %tobool2 = icmp ne i32 %call1, 0, !dbg !595
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !597

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !598, metadata !DIExpression()), !dbg !601
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !602, metadata !DIExpression()), !dbg !603
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !604
  %0 = bitcast i8* %call4 to i32*, !dbg !605
  store i32* %0, i32** %buffer, align 8, !dbg !603
  %1 = load i32*, i32** %buffer, align 8, !dbg !606
  %cmp = icmp eq i32* %1, null, !dbg !608
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !609

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #7, !dbg !610
  unreachable, !dbg !610

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !612
  br label %for.cond, !dbg !614

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !615
  %cmp7 = icmp slt i32 %2, 10, !dbg !617
  br i1 %cmp7, label %for.body, label %for.end, !dbg !618

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !619
  %4 = load i32, i32* %i, align 4, !dbg !621
  %idxprom = sext i32 %4 to i64, !dbg !619
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !619
  store i32 0, i32* %arrayidx, align 4, !dbg !622
  br label %for.inc, !dbg !623

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !624
  %inc = add nsw i32 %5, 1, !dbg !624
  store i32 %inc, i32* %i, align 4, !dbg !624
  br label %for.cond, !dbg !625, !llvm.loop !626

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !628
  %cmp8 = icmp sge i32 %6, 0, !dbg !630
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !631

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !632
  %8 = load i32, i32* %data, align 4, !dbg !634
  %idxprom10 = sext i32 %8 to i64, !dbg !632
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !632
  store i32 1, i32* %arrayidx11, align 4, !dbg !635
  store i32 0, i32* %i, align 4, !dbg !636
  br label %for.cond12, !dbg !638

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !639
  %cmp13 = icmp slt i32 %9, 10, !dbg !641
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !642

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !643
  %11 = load i32, i32* %i, align 4, !dbg !645
  %idxprom15 = sext i32 %11 to i64, !dbg !643
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !643
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !643
  call void @printIntLine(i32 noundef %12), !dbg !646
  br label %for.inc17, !dbg !647

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !648
  %inc18 = add nsw i32 %13, 1, !dbg !648
  store i32 %inc18, i32* %i, align 4, !dbg !648
  br label %for.cond12, !dbg !649, !llvm.loop !650

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !652

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !653
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !655
  %15 = bitcast i32* %14 to i8*, !dbg !655
  call void @free(i8* noundef %15), !dbg !656
  br label %if.end22, !dbg !657

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !658
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !659 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !660, metadata !DIExpression()), !dbg !661
  store i32 -1, i32* %data, align 4, !dbg !662
  %call = call i32 @staticReturnsTrue(), !dbg !663
  %tobool = icmp ne i32 %call, 0, !dbg !663
  br i1 %tobool, label %if.then, label %if.end, !dbg !665

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !666
  br label %if.end, !dbg !668

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !669
  %tobool2 = icmp ne i32 %call1, 0, !dbg !669
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !671

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !672, metadata !DIExpression()), !dbg !675
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !676, metadata !DIExpression()), !dbg !677
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !678
  %0 = bitcast i8* %call4 to i32*, !dbg !679
  store i32* %0, i32** %buffer, align 8, !dbg !677
  %1 = load i32*, i32** %buffer, align 8, !dbg !680
  %cmp = icmp eq i32* %1, null, !dbg !682
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !683

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #7, !dbg !684
  unreachable, !dbg !684

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !686
  br label %for.cond, !dbg !688

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !689
  %cmp7 = icmp slt i32 %2, 10, !dbg !691
  br i1 %cmp7, label %for.body, label %for.end, !dbg !692

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !693
  %4 = load i32, i32* %i, align 4, !dbg !695
  %idxprom = sext i32 %4 to i64, !dbg !693
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !693
  store i32 0, i32* %arrayidx, align 4, !dbg !696
  br label %for.inc, !dbg !697

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !698
  %inc = add nsw i32 %5, 1, !dbg !698
  store i32 %inc, i32* %i, align 4, !dbg !698
  br label %for.cond, !dbg !699, !llvm.loop !700

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !702
  %cmp8 = icmp sge i32 %6, 0, !dbg !704
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !705

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !706
  %8 = load i32, i32* %data, align 4, !dbg !708
  %idxprom10 = sext i32 %8 to i64, !dbg !706
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !706
  store i32 1, i32* %arrayidx11, align 4, !dbg !709
  store i32 0, i32* %i, align 4, !dbg !710
  br label %for.cond12, !dbg !712

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !713
  %cmp13 = icmp slt i32 %9, 10, !dbg !715
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !716

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !717
  %11 = load i32, i32* %i, align 4, !dbg !719
  %idxprom15 = sext i32 %11 to i64, !dbg !717
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !717
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !717
  call void @printIntLine(i32 noundef %12), !dbg !720
  br label %for.inc17, !dbg !721

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !722
  %inc18 = add nsw i32 %13, 1, !dbg !722
  store i32 %inc18, i32* %i, align 4, !dbg !722
  br label %for.cond12, !dbg !723, !llvm.loop !724

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !726

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !727
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !729
  %15 = bitcast i32* %14 to i8*, !dbg !729
  call void @free(i8* noundef %15), !dbg !730
  br label %if.end21, !dbg !731

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !732
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!27, !28, !29, !30, !31, !32}
!llvm.ident = !{!33}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !9, !24, !26, !5}
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
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!27 = !{i32 7, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"PIC Level", i32 2}
!31 = !{i32 7, !"uwtable", i32 1}
!32 = !{i32 7, !"frame-pointer", i32 2}
!33 = !{!"Homebrew clang version 14.0.6"}
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_bad", scope: !35, file: !35, line: 57, type: !36, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!35 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !{}
!39 = !DILocalVariable(name: "data", scope: !34, file: !35, line: 59, type: !25)
!40 = !DILocation(line: 59, column: 9, scope: !34)
!41 = !DILocation(line: 61, column: 10, scope: !34)
!42 = !DILocation(line: 62, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !34, file: !35, line: 62, column: 8)
!44 = !DILocation(line: 62, column: 8, scope: !34)
!45 = !DILocalVariable(name: "recvResult", scope: !46, file: !35, line: 69, type: !25)
!46 = distinct !DILexicalBlock(scope: !47, file: !35, line: 64, column: 9)
!47 = distinct !DILexicalBlock(scope: !43, file: !35, line: 63, column: 5)
!48 = !DILocation(line: 69, column: 17, scope: !46)
!49 = !DILocalVariable(name: "service", scope: !46, file: !35, line: 70, type: !50)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !51, line: 375, size: 128, elements: !52)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!52 = !{!53, !54, !55, !58, !65}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !50, file: !51, line: 376, baseType: !14, size: 8)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !50, file: !51, line: 377, baseType: !17, size: 8, offset: 8)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !50, file: !51, line: 378, baseType: !56, size: 16, offset: 16)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !57, line: 31, baseType: !6)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !50, file: !51, line: 379, baseType: !59, size: 32, offset: 32)
!59 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !51, line: 301, size: 32, elements: !60)
!60 = !{!61}
!61 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !59, file: !51, line: 302, baseType: !62, size: 32)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !63, line: 31, baseType: !64)
!63 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 47, baseType: !5)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !50, file: !51, line: 380, baseType: !66, size: 64, offset: 64)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 64, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 8)
!69 = !DILocation(line: 70, column: 32, scope: !46)
!70 = !DILocalVariable(name: "listenSocket", scope: !46, file: !35, line: 71, type: !25)
!71 = !DILocation(line: 71, column: 20, scope: !46)
!72 = !DILocalVariable(name: "acceptSocket", scope: !46, file: !35, line: 72, type: !25)
!73 = !DILocation(line: 72, column: 20, scope: !46)
!74 = !DILocalVariable(name: "inputBuffer", scope: !46, file: !35, line: 73, type: !20)
!75 = !DILocation(line: 73, column: 18, scope: !46)
!76 = !DILocation(line: 74, column: 13, scope: !46)
!77 = !DILocation(line: 84, column: 32, scope: !78)
!78 = distinct !DILexicalBlock(scope: !46, file: !35, line: 75, column: 13)
!79 = !DILocation(line: 84, column: 30, scope: !78)
!80 = !DILocation(line: 85, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !78, file: !35, line: 85, column: 21)
!82 = !DILocation(line: 85, column: 34, scope: !81)
!83 = !DILocation(line: 85, column: 21, scope: !78)
!84 = !DILocation(line: 87, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !35, line: 86, column: 17)
!86 = !DILocation(line: 89, column: 17, scope: !78)
!87 = !DILocation(line: 90, column: 25, scope: !78)
!88 = !DILocation(line: 90, column: 36, scope: !78)
!89 = !DILocation(line: 91, column: 25, scope: !78)
!90 = !DILocation(line: 91, column: 34, scope: !78)
!91 = !DILocation(line: 91, column: 41, scope: !78)
!92 = !DILocation(line: 92, column: 25, scope: !78)
!93 = !DILocation(line: 92, column: 34, scope: !78)
!94 = !DILocation(line: 93, column: 26, scope: !95)
!95 = distinct !DILexicalBlock(scope: !78, file: !35, line: 93, column: 21)
!96 = !DILocation(line: 93, column: 40, scope: !95)
!97 = !DILocation(line: 93, column: 21, scope: !95)
!98 = !DILocation(line: 93, column: 85, scope: !95)
!99 = !DILocation(line: 93, column: 21, scope: !78)
!100 = !DILocation(line: 95, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !35, line: 94, column: 17)
!102 = !DILocation(line: 97, column: 28, scope: !103)
!103 = distinct !DILexicalBlock(scope: !78, file: !35, line: 97, column: 21)
!104 = !DILocation(line: 97, column: 21, scope: !103)
!105 = !DILocation(line: 97, column: 58, scope: !103)
!106 = !DILocation(line: 97, column: 21, scope: !78)
!107 = !DILocation(line: 99, column: 21, scope: !108)
!108 = distinct !DILexicalBlock(scope: !103, file: !35, line: 98, column: 17)
!109 = !DILocation(line: 101, column: 39, scope: !78)
!110 = !DILocation(line: 101, column: 32, scope: !78)
!111 = !DILocation(line: 101, column: 30, scope: !78)
!112 = !DILocation(line: 102, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !78, file: !35, line: 102, column: 21)
!114 = !DILocation(line: 102, column: 34, scope: !113)
!115 = !DILocation(line: 102, column: 21, scope: !78)
!116 = !DILocation(line: 104, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !35, line: 103, column: 17)
!118 = !DILocation(line: 107, column: 35, scope: !78)
!119 = !DILocation(line: 107, column: 49, scope: !78)
!120 = !DILocation(line: 107, column: 30, scope: !78)
!121 = !DILocation(line: 107, column: 28, scope: !78)
!122 = !DILocation(line: 108, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !78, file: !35, line: 108, column: 21)
!124 = !DILocation(line: 108, column: 32, scope: !123)
!125 = !DILocation(line: 108, column: 48, scope: !123)
!126 = !DILocation(line: 108, column: 51, scope: !123)
!127 = !DILocation(line: 108, column: 62, scope: !123)
!128 = !DILocation(line: 108, column: 21, scope: !78)
!129 = !DILocation(line: 110, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !123, file: !35, line: 109, column: 17)
!131 = !DILocation(line: 113, column: 29, scope: !78)
!132 = !DILocation(line: 113, column: 17, scope: !78)
!133 = !DILocation(line: 113, column: 41, scope: !78)
!134 = !DILocation(line: 115, column: 29, scope: !78)
!135 = !DILocation(line: 115, column: 24, scope: !78)
!136 = !DILocation(line: 115, column: 22, scope: !78)
!137 = !DILocation(line: 116, column: 13, scope: !78)
!138 = !DILocation(line: 118, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !46, file: !35, line: 118, column: 17)
!140 = !DILocation(line: 118, column: 30, scope: !139)
!141 = !DILocation(line: 118, column: 17, scope: !46)
!142 = !DILocation(line: 120, column: 30, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !35, line: 119, column: 13)
!144 = !DILocation(line: 120, column: 17, scope: !143)
!145 = !DILocation(line: 121, column: 13, scope: !143)
!146 = !DILocation(line: 122, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !46, file: !35, line: 122, column: 17)
!148 = !DILocation(line: 122, column: 30, scope: !147)
!149 = !DILocation(line: 122, column: 17, scope: !46)
!150 = !DILocation(line: 124, column: 30, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !35, line: 123, column: 13)
!152 = !DILocation(line: 124, column: 17, scope: !151)
!153 = !DILocation(line: 125, column: 13, scope: !151)
!154 = !DILocation(line: 133, column: 5, scope: !47)
!155 = !DILocation(line: 134, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !34, file: !35, line: 134, column: 8)
!157 = !DILocation(line: 134, column: 8, scope: !34)
!158 = !DILocalVariable(name: "i", scope: !159, file: !35, line: 137, type: !25)
!159 = distinct !DILexicalBlock(scope: !160, file: !35, line: 136, column: 9)
!160 = distinct !DILexicalBlock(scope: !156, file: !35, line: 135, column: 5)
!161 = !DILocation(line: 137, column: 17, scope: !159)
!162 = !DILocalVariable(name: "buffer", scope: !159, file: !35, line: 138, type: !24)
!163 = !DILocation(line: 138, column: 19, scope: !159)
!164 = !DILocation(line: 138, column: 35, scope: !159)
!165 = !DILocation(line: 138, column: 28, scope: !159)
!166 = !DILocation(line: 139, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !159, file: !35, line: 139, column: 17)
!168 = !DILocation(line: 139, column: 24, scope: !167)
!169 = !DILocation(line: 139, column: 17, scope: !159)
!170 = !DILocation(line: 139, column: 34, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !35, line: 139, column: 33)
!172 = !DILocation(line: 141, column: 20, scope: !173)
!173 = distinct !DILexicalBlock(scope: !159, file: !35, line: 141, column: 13)
!174 = !DILocation(line: 141, column: 18, scope: !173)
!175 = !DILocation(line: 141, column: 25, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !35, line: 141, column: 13)
!177 = !DILocation(line: 141, column: 27, scope: !176)
!178 = !DILocation(line: 141, column: 13, scope: !173)
!179 = !DILocation(line: 143, column: 17, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !35, line: 142, column: 13)
!181 = !DILocation(line: 143, column: 24, scope: !180)
!182 = !DILocation(line: 143, column: 27, scope: !180)
!183 = !DILocation(line: 144, column: 13, scope: !180)
!184 = !DILocation(line: 141, column: 34, scope: !176)
!185 = !DILocation(line: 141, column: 13, scope: !176)
!186 = distinct !{!186, !178, !187, !188}
!187 = !DILocation(line: 144, column: 13, scope: !173)
!188 = !{!"llvm.loop.mustprogress"}
!189 = !DILocation(line: 147, column: 17, scope: !190)
!190 = distinct !DILexicalBlock(scope: !159, file: !35, line: 147, column: 17)
!191 = !DILocation(line: 147, column: 22, scope: !190)
!192 = !DILocation(line: 147, column: 17, scope: !159)
!193 = !DILocation(line: 149, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !190, file: !35, line: 148, column: 13)
!195 = !DILocation(line: 149, column: 24, scope: !194)
!196 = !DILocation(line: 149, column: 30, scope: !194)
!197 = !DILocation(line: 151, column: 23, scope: !198)
!198 = distinct !DILexicalBlock(scope: !194, file: !35, line: 151, column: 17)
!199 = !DILocation(line: 151, column: 21, scope: !198)
!200 = !DILocation(line: 151, column: 28, scope: !201)
!201 = distinct !DILexicalBlock(scope: !198, file: !35, line: 151, column: 17)
!202 = !DILocation(line: 151, column: 30, scope: !201)
!203 = !DILocation(line: 151, column: 17, scope: !198)
!204 = !DILocation(line: 153, column: 34, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !35, line: 152, column: 17)
!206 = !DILocation(line: 153, column: 41, scope: !205)
!207 = !DILocation(line: 153, column: 21, scope: !205)
!208 = !DILocation(line: 154, column: 17, scope: !205)
!209 = !DILocation(line: 151, column: 37, scope: !201)
!210 = !DILocation(line: 151, column: 17, scope: !201)
!211 = distinct !{!211, !203, !212, !188}
!212 = !DILocation(line: 154, column: 17, scope: !198)
!213 = !DILocation(line: 155, column: 13, scope: !194)
!214 = !DILocation(line: 158, column: 17, scope: !215)
!215 = distinct !DILexicalBlock(scope: !190, file: !35, line: 157, column: 13)
!216 = !DILocation(line: 160, column: 18, scope: !159)
!217 = !DILocation(line: 160, column: 13, scope: !159)
!218 = !DILocation(line: 162, column: 5, scope: !160)
!219 = !DILocation(line: 163, column: 1, scope: !34)
!220 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_08_good", scope: !35, file: !35, line: 481, type: !36, scopeLine: 482, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!221 = !DILocation(line: 483, column: 5, scope: !220)
!222 = !DILocation(line: 484, column: 5, scope: !220)
!223 = !DILocation(line: 485, column: 5, scope: !220)
!224 = !DILocation(line: 486, column: 5, scope: !220)
!225 = !DILocation(line: 487, column: 1, scope: !220)
!226 = distinct !DISubprogram(name: "main", scope: !35, file: !35, line: 498, type: !227, scopeLine: 499, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!227 = !DISubroutineType(types: !228)
!228 = !{!25, !25, !229}
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!231 = !DILocalVariable(name: "argc", arg: 1, scope: !226, file: !35, line: 498, type: !25)
!232 = !DILocation(line: 498, column: 14, scope: !226)
!233 = !DILocalVariable(name: "argv", arg: 2, scope: !226, file: !35, line: 498, type: !229)
!234 = !DILocation(line: 498, column: 27, scope: !226)
!235 = !DILocation(line: 501, column: 22, scope: !226)
!236 = !DILocation(line: 501, column: 12, scope: !226)
!237 = !DILocation(line: 501, column: 5, scope: !226)
!238 = !DILocation(line: 503, column: 5, scope: !226)
!239 = !DILocation(line: 504, column: 5, scope: !226)
!240 = !DILocation(line: 505, column: 5, scope: !226)
!241 = !DILocation(line: 508, column: 5, scope: !226)
!242 = !DILocation(line: 509, column: 5, scope: !226)
!243 = !DILocation(line: 510, column: 5, scope: !226)
!244 = !DILocation(line: 512, column: 5, scope: !226)
!245 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !35, file: !35, line: 45, type: !246, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!246 = !DISubroutineType(types: !247)
!247 = !{!25}
!248 = !DILocation(line: 47, column: 5, scope: !245)
!249 = distinct !DISubprogram(name: "goodB2G1", scope: !35, file: !35, line: 170, type: !36, scopeLine: 171, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!250 = !DILocalVariable(name: "data", scope: !249, file: !35, line: 172, type: !25)
!251 = !DILocation(line: 172, column: 9, scope: !249)
!252 = !DILocation(line: 174, column: 10, scope: !249)
!253 = !DILocation(line: 175, column: 8, scope: !254)
!254 = distinct !DILexicalBlock(scope: !249, file: !35, line: 175, column: 8)
!255 = !DILocation(line: 175, column: 8, scope: !249)
!256 = !DILocalVariable(name: "recvResult", scope: !257, file: !35, line: 182, type: !25)
!257 = distinct !DILexicalBlock(scope: !258, file: !35, line: 177, column: 9)
!258 = distinct !DILexicalBlock(scope: !254, file: !35, line: 176, column: 5)
!259 = !DILocation(line: 182, column: 17, scope: !257)
!260 = !DILocalVariable(name: "service", scope: !257, file: !35, line: 183, type: !50)
!261 = !DILocation(line: 183, column: 32, scope: !257)
!262 = !DILocalVariable(name: "listenSocket", scope: !257, file: !35, line: 184, type: !25)
!263 = !DILocation(line: 184, column: 20, scope: !257)
!264 = !DILocalVariable(name: "acceptSocket", scope: !257, file: !35, line: 185, type: !25)
!265 = !DILocation(line: 185, column: 20, scope: !257)
!266 = !DILocalVariable(name: "inputBuffer", scope: !257, file: !35, line: 186, type: !20)
!267 = !DILocation(line: 186, column: 18, scope: !257)
!268 = !DILocation(line: 187, column: 13, scope: !257)
!269 = !DILocation(line: 197, column: 32, scope: !270)
!270 = distinct !DILexicalBlock(scope: !257, file: !35, line: 188, column: 13)
!271 = !DILocation(line: 197, column: 30, scope: !270)
!272 = !DILocation(line: 198, column: 21, scope: !273)
!273 = distinct !DILexicalBlock(scope: !270, file: !35, line: 198, column: 21)
!274 = !DILocation(line: 198, column: 34, scope: !273)
!275 = !DILocation(line: 198, column: 21, scope: !270)
!276 = !DILocation(line: 200, column: 21, scope: !277)
!277 = distinct !DILexicalBlock(scope: !273, file: !35, line: 199, column: 17)
!278 = !DILocation(line: 202, column: 17, scope: !270)
!279 = !DILocation(line: 203, column: 25, scope: !270)
!280 = !DILocation(line: 203, column: 36, scope: !270)
!281 = !DILocation(line: 204, column: 25, scope: !270)
!282 = !DILocation(line: 204, column: 34, scope: !270)
!283 = !DILocation(line: 204, column: 41, scope: !270)
!284 = !DILocation(line: 205, column: 25, scope: !270)
!285 = !DILocation(line: 205, column: 34, scope: !270)
!286 = !DILocation(line: 206, column: 26, scope: !287)
!287 = distinct !DILexicalBlock(scope: !270, file: !35, line: 206, column: 21)
!288 = !DILocation(line: 206, column: 40, scope: !287)
!289 = !DILocation(line: 206, column: 21, scope: !287)
!290 = !DILocation(line: 206, column: 85, scope: !287)
!291 = !DILocation(line: 206, column: 21, scope: !270)
!292 = !DILocation(line: 208, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !287, file: !35, line: 207, column: 17)
!294 = !DILocation(line: 210, column: 28, scope: !295)
!295 = distinct !DILexicalBlock(scope: !270, file: !35, line: 210, column: 21)
!296 = !DILocation(line: 210, column: 21, scope: !295)
!297 = !DILocation(line: 210, column: 58, scope: !295)
!298 = !DILocation(line: 210, column: 21, scope: !270)
!299 = !DILocation(line: 212, column: 21, scope: !300)
!300 = distinct !DILexicalBlock(scope: !295, file: !35, line: 211, column: 17)
!301 = !DILocation(line: 214, column: 39, scope: !270)
!302 = !DILocation(line: 214, column: 32, scope: !270)
!303 = !DILocation(line: 214, column: 30, scope: !270)
!304 = !DILocation(line: 215, column: 21, scope: !305)
!305 = distinct !DILexicalBlock(scope: !270, file: !35, line: 215, column: 21)
!306 = !DILocation(line: 215, column: 34, scope: !305)
!307 = !DILocation(line: 215, column: 21, scope: !270)
!308 = !DILocation(line: 217, column: 21, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !35, line: 216, column: 17)
!310 = !DILocation(line: 220, column: 35, scope: !270)
!311 = !DILocation(line: 220, column: 49, scope: !270)
!312 = !DILocation(line: 220, column: 30, scope: !270)
!313 = !DILocation(line: 220, column: 28, scope: !270)
!314 = !DILocation(line: 221, column: 21, scope: !315)
!315 = distinct !DILexicalBlock(scope: !270, file: !35, line: 221, column: 21)
!316 = !DILocation(line: 221, column: 32, scope: !315)
!317 = !DILocation(line: 221, column: 48, scope: !315)
!318 = !DILocation(line: 221, column: 51, scope: !315)
!319 = !DILocation(line: 221, column: 62, scope: !315)
!320 = !DILocation(line: 221, column: 21, scope: !270)
!321 = !DILocation(line: 223, column: 21, scope: !322)
!322 = distinct !DILexicalBlock(scope: !315, file: !35, line: 222, column: 17)
!323 = !DILocation(line: 226, column: 29, scope: !270)
!324 = !DILocation(line: 226, column: 17, scope: !270)
!325 = !DILocation(line: 226, column: 41, scope: !270)
!326 = !DILocation(line: 228, column: 29, scope: !270)
!327 = !DILocation(line: 228, column: 24, scope: !270)
!328 = !DILocation(line: 228, column: 22, scope: !270)
!329 = !DILocation(line: 229, column: 13, scope: !270)
!330 = !DILocation(line: 231, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !257, file: !35, line: 231, column: 17)
!332 = !DILocation(line: 231, column: 30, scope: !331)
!333 = !DILocation(line: 231, column: 17, scope: !257)
!334 = !DILocation(line: 233, column: 30, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !35, line: 232, column: 13)
!336 = !DILocation(line: 233, column: 17, scope: !335)
!337 = !DILocation(line: 234, column: 13, scope: !335)
!338 = !DILocation(line: 235, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !257, file: !35, line: 235, column: 17)
!340 = !DILocation(line: 235, column: 30, scope: !339)
!341 = !DILocation(line: 235, column: 17, scope: !257)
!342 = !DILocation(line: 237, column: 30, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !35, line: 236, column: 13)
!344 = !DILocation(line: 237, column: 17, scope: !343)
!345 = !DILocation(line: 238, column: 13, scope: !343)
!346 = !DILocation(line: 246, column: 5, scope: !258)
!347 = !DILocation(line: 247, column: 8, scope: !348)
!348 = distinct !DILexicalBlock(scope: !249, file: !35, line: 247, column: 8)
!349 = !DILocation(line: 247, column: 8, scope: !249)
!350 = !DILocation(line: 250, column: 9, scope: !351)
!351 = distinct !DILexicalBlock(scope: !348, file: !35, line: 248, column: 5)
!352 = !DILocation(line: 251, column: 5, scope: !351)
!353 = !DILocalVariable(name: "i", scope: !354, file: !35, line: 255, type: !25)
!354 = distinct !DILexicalBlock(scope: !355, file: !35, line: 254, column: 9)
!355 = distinct !DILexicalBlock(scope: !348, file: !35, line: 253, column: 5)
!356 = !DILocation(line: 255, column: 17, scope: !354)
!357 = !DILocalVariable(name: "buffer", scope: !354, file: !35, line: 256, type: !24)
!358 = !DILocation(line: 256, column: 19, scope: !354)
!359 = !DILocation(line: 256, column: 35, scope: !354)
!360 = !DILocation(line: 256, column: 28, scope: !354)
!361 = !DILocation(line: 257, column: 17, scope: !362)
!362 = distinct !DILexicalBlock(scope: !354, file: !35, line: 257, column: 17)
!363 = !DILocation(line: 257, column: 24, scope: !362)
!364 = !DILocation(line: 257, column: 17, scope: !354)
!365 = !DILocation(line: 257, column: 34, scope: !366)
!366 = distinct !DILexicalBlock(scope: !362, file: !35, line: 257, column: 33)
!367 = !DILocation(line: 259, column: 20, scope: !368)
!368 = distinct !DILexicalBlock(scope: !354, file: !35, line: 259, column: 13)
!369 = !DILocation(line: 259, column: 18, scope: !368)
!370 = !DILocation(line: 259, column: 25, scope: !371)
!371 = distinct !DILexicalBlock(scope: !368, file: !35, line: 259, column: 13)
!372 = !DILocation(line: 259, column: 27, scope: !371)
!373 = !DILocation(line: 259, column: 13, scope: !368)
!374 = !DILocation(line: 261, column: 17, scope: !375)
!375 = distinct !DILexicalBlock(scope: !371, file: !35, line: 260, column: 13)
!376 = !DILocation(line: 261, column: 24, scope: !375)
!377 = !DILocation(line: 261, column: 27, scope: !375)
!378 = !DILocation(line: 262, column: 13, scope: !375)
!379 = !DILocation(line: 259, column: 34, scope: !371)
!380 = !DILocation(line: 259, column: 13, scope: !371)
!381 = distinct !{!381, !373, !382, !188}
!382 = !DILocation(line: 262, column: 13, scope: !368)
!383 = !DILocation(line: 264, column: 17, scope: !384)
!384 = distinct !DILexicalBlock(scope: !354, file: !35, line: 264, column: 17)
!385 = !DILocation(line: 264, column: 22, scope: !384)
!386 = !DILocation(line: 264, column: 27, scope: !384)
!387 = !DILocation(line: 264, column: 30, scope: !384)
!388 = !DILocation(line: 264, column: 35, scope: !384)
!389 = !DILocation(line: 264, column: 17, scope: !354)
!390 = !DILocation(line: 266, column: 17, scope: !391)
!391 = distinct !DILexicalBlock(scope: !384, file: !35, line: 265, column: 13)
!392 = !DILocation(line: 266, column: 24, scope: !391)
!393 = !DILocation(line: 266, column: 30, scope: !391)
!394 = !DILocation(line: 268, column: 23, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !35, line: 268, column: 17)
!396 = !DILocation(line: 268, column: 21, scope: !395)
!397 = !DILocation(line: 268, column: 28, scope: !398)
!398 = distinct !DILexicalBlock(scope: !395, file: !35, line: 268, column: 17)
!399 = !DILocation(line: 268, column: 30, scope: !398)
!400 = !DILocation(line: 268, column: 17, scope: !395)
!401 = !DILocation(line: 270, column: 34, scope: !402)
!402 = distinct !DILexicalBlock(scope: !398, file: !35, line: 269, column: 17)
!403 = !DILocation(line: 270, column: 41, scope: !402)
!404 = !DILocation(line: 270, column: 21, scope: !402)
!405 = !DILocation(line: 271, column: 17, scope: !402)
!406 = !DILocation(line: 268, column: 37, scope: !398)
!407 = !DILocation(line: 268, column: 17, scope: !398)
!408 = distinct !{!408, !400, !409, !188}
!409 = !DILocation(line: 271, column: 17, scope: !395)
!410 = !DILocation(line: 272, column: 13, scope: !391)
!411 = !DILocation(line: 275, column: 17, scope: !412)
!412 = distinct !DILexicalBlock(scope: !384, file: !35, line: 274, column: 13)
!413 = !DILocation(line: 277, column: 18, scope: !354)
!414 = !DILocation(line: 277, column: 13, scope: !354)
!415 = !DILocation(line: 280, column: 1, scope: !249)
!416 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !35, file: !35, line: 50, type: !246, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!417 = !DILocation(line: 52, column: 5, scope: !416)
!418 = distinct !DISubprogram(name: "goodB2G2", scope: !35, file: !35, line: 283, type: !36, scopeLine: 284, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!419 = !DILocalVariable(name: "data", scope: !418, file: !35, line: 285, type: !25)
!420 = !DILocation(line: 285, column: 9, scope: !418)
!421 = !DILocation(line: 287, column: 10, scope: !418)
!422 = !DILocation(line: 288, column: 8, scope: !423)
!423 = distinct !DILexicalBlock(scope: !418, file: !35, line: 288, column: 8)
!424 = !DILocation(line: 288, column: 8, scope: !418)
!425 = !DILocalVariable(name: "recvResult", scope: !426, file: !35, line: 295, type: !25)
!426 = distinct !DILexicalBlock(scope: !427, file: !35, line: 290, column: 9)
!427 = distinct !DILexicalBlock(scope: !423, file: !35, line: 289, column: 5)
!428 = !DILocation(line: 295, column: 17, scope: !426)
!429 = !DILocalVariable(name: "service", scope: !426, file: !35, line: 296, type: !50)
!430 = !DILocation(line: 296, column: 32, scope: !426)
!431 = !DILocalVariable(name: "listenSocket", scope: !426, file: !35, line: 297, type: !25)
!432 = !DILocation(line: 297, column: 20, scope: !426)
!433 = !DILocalVariable(name: "acceptSocket", scope: !426, file: !35, line: 298, type: !25)
!434 = !DILocation(line: 298, column: 20, scope: !426)
!435 = !DILocalVariable(name: "inputBuffer", scope: !426, file: !35, line: 299, type: !20)
!436 = !DILocation(line: 299, column: 18, scope: !426)
!437 = !DILocation(line: 300, column: 13, scope: !426)
!438 = !DILocation(line: 310, column: 32, scope: !439)
!439 = distinct !DILexicalBlock(scope: !426, file: !35, line: 301, column: 13)
!440 = !DILocation(line: 310, column: 30, scope: !439)
!441 = !DILocation(line: 311, column: 21, scope: !442)
!442 = distinct !DILexicalBlock(scope: !439, file: !35, line: 311, column: 21)
!443 = !DILocation(line: 311, column: 34, scope: !442)
!444 = !DILocation(line: 311, column: 21, scope: !439)
!445 = !DILocation(line: 313, column: 21, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !35, line: 312, column: 17)
!447 = !DILocation(line: 315, column: 17, scope: !439)
!448 = !DILocation(line: 316, column: 25, scope: !439)
!449 = !DILocation(line: 316, column: 36, scope: !439)
!450 = !DILocation(line: 317, column: 25, scope: !439)
!451 = !DILocation(line: 317, column: 34, scope: !439)
!452 = !DILocation(line: 317, column: 41, scope: !439)
!453 = !DILocation(line: 318, column: 25, scope: !439)
!454 = !DILocation(line: 318, column: 34, scope: !439)
!455 = !DILocation(line: 319, column: 26, scope: !456)
!456 = distinct !DILexicalBlock(scope: !439, file: !35, line: 319, column: 21)
!457 = !DILocation(line: 319, column: 40, scope: !456)
!458 = !DILocation(line: 319, column: 21, scope: !456)
!459 = !DILocation(line: 319, column: 85, scope: !456)
!460 = !DILocation(line: 319, column: 21, scope: !439)
!461 = !DILocation(line: 321, column: 21, scope: !462)
!462 = distinct !DILexicalBlock(scope: !456, file: !35, line: 320, column: 17)
!463 = !DILocation(line: 323, column: 28, scope: !464)
!464 = distinct !DILexicalBlock(scope: !439, file: !35, line: 323, column: 21)
!465 = !DILocation(line: 323, column: 21, scope: !464)
!466 = !DILocation(line: 323, column: 58, scope: !464)
!467 = !DILocation(line: 323, column: 21, scope: !439)
!468 = !DILocation(line: 325, column: 21, scope: !469)
!469 = distinct !DILexicalBlock(scope: !464, file: !35, line: 324, column: 17)
!470 = !DILocation(line: 327, column: 39, scope: !439)
!471 = !DILocation(line: 327, column: 32, scope: !439)
!472 = !DILocation(line: 327, column: 30, scope: !439)
!473 = !DILocation(line: 328, column: 21, scope: !474)
!474 = distinct !DILexicalBlock(scope: !439, file: !35, line: 328, column: 21)
!475 = !DILocation(line: 328, column: 34, scope: !474)
!476 = !DILocation(line: 328, column: 21, scope: !439)
!477 = !DILocation(line: 330, column: 21, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !35, line: 329, column: 17)
!479 = !DILocation(line: 333, column: 35, scope: !439)
!480 = !DILocation(line: 333, column: 49, scope: !439)
!481 = !DILocation(line: 333, column: 30, scope: !439)
!482 = !DILocation(line: 333, column: 28, scope: !439)
!483 = !DILocation(line: 334, column: 21, scope: !484)
!484 = distinct !DILexicalBlock(scope: !439, file: !35, line: 334, column: 21)
!485 = !DILocation(line: 334, column: 32, scope: !484)
!486 = !DILocation(line: 334, column: 48, scope: !484)
!487 = !DILocation(line: 334, column: 51, scope: !484)
!488 = !DILocation(line: 334, column: 62, scope: !484)
!489 = !DILocation(line: 334, column: 21, scope: !439)
!490 = !DILocation(line: 336, column: 21, scope: !491)
!491 = distinct !DILexicalBlock(scope: !484, file: !35, line: 335, column: 17)
!492 = !DILocation(line: 339, column: 29, scope: !439)
!493 = !DILocation(line: 339, column: 17, scope: !439)
!494 = !DILocation(line: 339, column: 41, scope: !439)
!495 = !DILocation(line: 341, column: 29, scope: !439)
!496 = !DILocation(line: 341, column: 24, scope: !439)
!497 = !DILocation(line: 341, column: 22, scope: !439)
!498 = !DILocation(line: 342, column: 13, scope: !439)
!499 = !DILocation(line: 344, column: 17, scope: !500)
!500 = distinct !DILexicalBlock(scope: !426, file: !35, line: 344, column: 17)
!501 = !DILocation(line: 344, column: 30, scope: !500)
!502 = !DILocation(line: 344, column: 17, scope: !426)
!503 = !DILocation(line: 346, column: 30, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !35, line: 345, column: 13)
!505 = !DILocation(line: 346, column: 17, scope: !504)
!506 = !DILocation(line: 347, column: 13, scope: !504)
!507 = !DILocation(line: 348, column: 17, scope: !508)
!508 = distinct !DILexicalBlock(scope: !426, file: !35, line: 348, column: 17)
!509 = !DILocation(line: 348, column: 30, scope: !508)
!510 = !DILocation(line: 348, column: 17, scope: !426)
!511 = !DILocation(line: 350, column: 30, scope: !512)
!512 = distinct !DILexicalBlock(scope: !508, file: !35, line: 349, column: 13)
!513 = !DILocation(line: 350, column: 17, scope: !512)
!514 = !DILocation(line: 351, column: 13, scope: !512)
!515 = !DILocation(line: 359, column: 5, scope: !427)
!516 = !DILocation(line: 360, column: 8, scope: !517)
!517 = distinct !DILexicalBlock(scope: !418, file: !35, line: 360, column: 8)
!518 = !DILocation(line: 360, column: 8, scope: !418)
!519 = !DILocalVariable(name: "i", scope: !520, file: !35, line: 363, type: !25)
!520 = distinct !DILexicalBlock(scope: !521, file: !35, line: 362, column: 9)
!521 = distinct !DILexicalBlock(scope: !517, file: !35, line: 361, column: 5)
!522 = !DILocation(line: 363, column: 17, scope: !520)
!523 = !DILocalVariable(name: "buffer", scope: !520, file: !35, line: 364, type: !24)
!524 = !DILocation(line: 364, column: 19, scope: !520)
!525 = !DILocation(line: 364, column: 35, scope: !520)
!526 = !DILocation(line: 364, column: 28, scope: !520)
!527 = !DILocation(line: 365, column: 17, scope: !528)
!528 = distinct !DILexicalBlock(scope: !520, file: !35, line: 365, column: 17)
!529 = !DILocation(line: 365, column: 24, scope: !528)
!530 = !DILocation(line: 365, column: 17, scope: !520)
!531 = !DILocation(line: 365, column: 34, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !35, line: 365, column: 33)
!533 = !DILocation(line: 367, column: 20, scope: !534)
!534 = distinct !DILexicalBlock(scope: !520, file: !35, line: 367, column: 13)
!535 = !DILocation(line: 367, column: 18, scope: !534)
!536 = !DILocation(line: 367, column: 25, scope: !537)
!537 = distinct !DILexicalBlock(scope: !534, file: !35, line: 367, column: 13)
!538 = !DILocation(line: 367, column: 27, scope: !537)
!539 = !DILocation(line: 367, column: 13, scope: !534)
!540 = !DILocation(line: 369, column: 17, scope: !541)
!541 = distinct !DILexicalBlock(scope: !537, file: !35, line: 368, column: 13)
!542 = !DILocation(line: 369, column: 24, scope: !541)
!543 = !DILocation(line: 369, column: 27, scope: !541)
!544 = !DILocation(line: 370, column: 13, scope: !541)
!545 = !DILocation(line: 367, column: 34, scope: !537)
!546 = !DILocation(line: 367, column: 13, scope: !537)
!547 = distinct !{!547, !539, !548, !188}
!548 = !DILocation(line: 370, column: 13, scope: !534)
!549 = !DILocation(line: 372, column: 17, scope: !550)
!550 = distinct !DILexicalBlock(scope: !520, file: !35, line: 372, column: 17)
!551 = !DILocation(line: 372, column: 22, scope: !550)
!552 = !DILocation(line: 372, column: 27, scope: !550)
!553 = !DILocation(line: 372, column: 30, scope: !550)
!554 = !DILocation(line: 372, column: 35, scope: !550)
!555 = !DILocation(line: 372, column: 17, scope: !520)
!556 = !DILocation(line: 374, column: 17, scope: !557)
!557 = distinct !DILexicalBlock(scope: !550, file: !35, line: 373, column: 13)
!558 = !DILocation(line: 374, column: 24, scope: !557)
!559 = !DILocation(line: 374, column: 30, scope: !557)
!560 = !DILocation(line: 376, column: 23, scope: !561)
!561 = distinct !DILexicalBlock(scope: !557, file: !35, line: 376, column: 17)
!562 = !DILocation(line: 376, column: 21, scope: !561)
!563 = !DILocation(line: 376, column: 28, scope: !564)
!564 = distinct !DILexicalBlock(scope: !561, file: !35, line: 376, column: 17)
!565 = !DILocation(line: 376, column: 30, scope: !564)
!566 = !DILocation(line: 376, column: 17, scope: !561)
!567 = !DILocation(line: 378, column: 34, scope: !568)
!568 = distinct !DILexicalBlock(scope: !564, file: !35, line: 377, column: 17)
!569 = !DILocation(line: 378, column: 41, scope: !568)
!570 = !DILocation(line: 378, column: 21, scope: !568)
!571 = !DILocation(line: 379, column: 17, scope: !568)
!572 = !DILocation(line: 376, column: 37, scope: !564)
!573 = !DILocation(line: 376, column: 17, scope: !564)
!574 = distinct !{!574, !566, !575, !188}
!575 = !DILocation(line: 379, column: 17, scope: !561)
!576 = !DILocation(line: 380, column: 13, scope: !557)
!577 = !DILocation(line: 383, column: 17, scope: !578)
!578 = distinct !DILexicalBlock(scope: !550, file: !35, line: 382, column: 13)
!579 = !DILocation(line: 385, column: 18, scope: !520)
!580 = !DILocation(line: 385, column: 13, scope: !520)
!581 = !DILocation(line: 387, column: 5, scope: !521)
!582 = !DILocation(line: 388, column: 1, scope: !418)
!583 = distinct !DISubprogram(name: "goodG2B1", scope: !35, file: !35, line: 391, type: !36, scopeLine: 392, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!584 = !DILocalVariable(name: "data", scope: !583, file: !35, line: 393, type: !25)
!585 = !DILocation(line: 393, column: 9, scope: !583)
!586 = !DILocation(line: 395, column: 10, scope: !583)
!587 = !DILocation(line: 396, column: 8, scope: !588)
!588 = distinct !DILexicalBlock(scope: !583, file: !35, line: 396, column: 8)
!589 = !DILocation(line: 396, column: 8, scope: !583)
!590 = !DILocation(line: 399, column: 9, scope: !591)
!591 = distinct !DILexicalBlock(scope: !588, file: !35, line: 397, column: 5)
!592 = !DILocation(line: 400, column: 5, scope: !591)
!593 = !DILocation(line: 405, column: 14, scope: !594)
!594 = distinct !DILexicalBlock(scope: !588, file: !35, line: 402, column: 5)
!595 = !DILocation(line: 407, column: 8, scope: !596)
!596 = distinct !DILexicalBlock(scope: !583, file: !35, line: 407, column: 8)
!597 = !DILocation(line: 407, column: 8, scope: !583)
!598 = !DILocalVariable(name: "i", scope: !599, file: !35, line: 410, type: !25)
!599 = distinct !DILexicalBlock(scope: !600, file: !35, line: 409, column: 9)
!600 = distinct !DILexicalBlock(scope: !596, file: !35, line: 408, column: 5)
!601 = !DILocation(line: 410, column: 17, scope: !599)
!602 = !DILocalVariable(name: "buffer", scope: !599, file: !35, line: 411, type: !24)
!603 = !DILocation(line: 411, column: 19, scope: !599)
!604 = !DILocation(line: 411, column: 35, scope: !599)
!605 = !DILocation(line: 411, column: 28, scope: !599)
!606 = !DILocation(line: 412, column: 17, scope: !607)
!607 = distinct !DILexicalBlock(scope: !599, file: !35, line: 412, column: 17)
!608 = !DILocation(line: 412, column: 24, scope: !607)
!609 = !DILocation(line: 412, column: 17, scope: !599)
!610 = !DILocation(line: 412, column: 34, scope: !611)
!611 = distinct !DILexicalBlock(scope: !607, file: !35, line: 412, column: 33)
!612 = !DILocation(line: 414, column: 20, scope: !613)
!613 = distinct !DILexicalBlock(scope: !599, file: !35, line: 414, column: 13)
!614 = !DILocation(line: 414, column: 18, scope: !613)
!615 = !DILocation(line: 414, column: 25, scope: !616)
!616 = distinct !DILexicalBlock(scope: !613, file: !35, line: 414, column: 13)
!617 = !DILocation(line: 414, column: 27, scope: !616)
!618 = !DILocation(line: 414, column: 13, scope: !613)
!619 = !DILocation(line: 416, column: 17, scope: !620)
!620 = distinct !DILexicalBlock(scope: !616, file: !35, line: 415, column: 13)
!621 = !DILocation(line: 416, column: 24, scope: !620)
!622 = !DILocation(line: 416, column: 27, scope: !620)
!623 = !DILocation(line: 417, column: 13, scope: !620)
!624 = !DILocation(line: 414, column: 34, scope: !616)
!625 = !DILocation(line: 414, column: 13, scope: !616)
!626 = distinct !{!626, !618, !627, !188}
!627 = !DILocation(line: 417, column: 13, scope: !613)
!628 = !DILocation(line: 420, column: 17, scope: !629)
!629 = distinct !DILexicalBlock(scope: !599, file: !35, line: 420, column: 17)
!630 = !DILocation(line: 420, column: 22, scope: !629)
!631 = !DILocation(line: 420, column: 17, scope: !599)
!632 = !DILocation(line: 422, column: 17, scope: !633)
!633 = distinct !DILexicalBlock(scope: !629, file: !35, line: 421, column: 13)
!634 = !DILocation(line: 422, column: 24, scope: !633)
!635 = !DILocation(line: 422, column: 30, scope: !633)
!636 = !DILocation(line: 424, column: 23, scope: !637)
!637 = distinct !DILexicalBlock(scope: !633, file: !35, line: 424, column: 17)
!638 = !DILocation(line: 424, column: 21, scope: !637)
!639 = !DILocation(line: 424, column: 28, scope: !640)
!640 = distinct !DILexicalBlock(scope: !637, file: !35, line: 424, column: 17)
!641 = !DILocation(line: 424, column: 30, scope: !640)
!642 = !DILocation(line: 424, column: 17, scope: !637)
!643 = !DILocation(line: 426, column: 34, scope: !644)
!644 = distinct !DILexicalBlock(scope: !640, file: !35, line: 425, column: 17)
!645 = !DILocation(line: 426, column: 41, scope: !644)
!646 = !DILocation(line: 426, column: 21, scope: !644)
!647 = !DILocation(line: 427, column: 17, scope: !644)
!648 = !DILocation(line: 424, column: 37, scope: !640)
!649 = !DILocation(line: 424, column: 17, scope: !640)
!650 = distinct !{!650, !642, !651, !188}
!651 = !DILocation(line: 427, column: 17, scope: !637)
!652 = !DILocation(line: 428, column: 13, scope: !633)
!653 = !DILocation(line: 431, column: 17, scope: !654)
!654 = distinct !DILexicalBlock(scope: !629, file: !35, line: 430, column: 13)
!655 = !DILocation(line: 433, column: 18, scope: !599)
!656 = !DILocation(line: 433, column: 13, scope: !599)
!657 = !DILocation(line: 435, column: 5, scope: !600)
!658 = !DILocation(line: 436, column: 1, scope: !583)
!659 = distinct !DISubprogram(name: "goodG2B2", scope: !35, file: !35, line: 439, type: !36, scopeLine: 440, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!660 = !DILocalVariable(name: "data", scope: !659, file: !35, line: 441, type: !25)
!661 = !DILocation(line: 441, column: 9, scope: !659)
!662 = !DILocation(line: 443, column: 10, scope: !659)
!663 = !DILocation(line: 444, column: 8, scope: !664)
!664 = distinct !DILexicalBlock(scope: !659, file: !35, line: 444, column: 8)
!665 = !DILocation(line: 444, column: 8, scope: !659)
!666 = !DILocation(line: 448, column: 14, scope: !667)
!667 = distinct !DILexicalBlock(scope: !664, file: !35, line: 445, column: 5)
!668 = !DILocation(line: 449, column: 5, scope: !667)
!669 = !DILocation(line: 450, column: 8, scope: !670)
!670 = distinct !DILexicalBlock(scope: !659, file: !35, line: 450, column: 8)
!671 = !DILocation(line: 450, column: 8, scope: !659)
!672 = !DILocalVariable(name: "i", scope: !673, file: !35, line: 453, type: !25)
!673 = distinct !DILexicalBlock(scope: !674, file: !35, line: 452, column: 9)
!674 = distinct !DILexicalBlock(scope: !670, file: !35, line: 451, column: 5)
!675 = !DILocation(line: 453, column: 17, scope: !673)
!676 = !DILocalVariable(name: "buffer", scope: !673, file: !35, line: 454, type: !24)
!677 = !DILocation(line: 454, column: 19, scope: !673)
!678 = !DILocation(line: 454, column: 35, scope: !673)
!679 = !DILocation(line: 454, column: 28, scope: !673)
!680 = !DILocation(line: 455, column: 17, scope: !681)
!681 = distinct !DILexicalBlock(scope: !673, file: !35, line: 455, column: 17)
!682 = !DILocation(line: 455, column: 24, scope: !681)
!683 = !DILocation(line: 455, column: 17, scope: !673)
!684 = !DILocation(line: 455, column: 34, scope: !685)
!685 = distinct !DILexicalBlock(scope: !681, file: !35, line: 455, column: 33)
!686 = !DILocation(line: 457, column: 20, scope: !687)
!687 = distinct !DILexicalBlock(scope: !673, file: !35, line: 457, column: 13)
!688 = !DILocation(line: 457, column: 18, scope: !687)
!689 = !DILocation(line: 457, column: 25, scope: !690)
!690 = distinct !DILexicalBlock(scope: !687, file: !35, line: 457, column: 13)
!691 = !DILocation(line: 457, column: 27, scope: !690)
!692 = !DILocation(line: 457, column: 13, scope: !687)
!693 = !DILocation(line: 459, column: 17, scope: !694)
!694 = distinct !DILexicalBlock(scope: !690, file: !35, line: 458, column: 13)
!695 = !DILocation(line: 459, column: 24, scope: !694)
!696 = !DILocation(line: 459, column: 27, scope: !694)
!697 = !DILocation(line: 460, column: 13, scope: !694)
!698 = !DILocation(line: 457, column: 34, scope: !690)
!699 = !DILocation(line: 457, column: 13, scope: !690)
!700 = distinct !{!700, !692, !701, !188}
!701 = !DILocation(line: 460, column: 13, scope: !687)
!702 = !DILocation(line: 463, column: 17, scope: !703)
!703 = distinct !DILexicalBlock(scope: !673, file: !35, line: 463, column: 17)
!704 = !DILocation(line: 463, column: 22, scope: !703)
!705 = !DILocation(line: 463, column: 17, scope: !673)
!706 = !DILocation(line: 465, column: 17, scope: !707)
!707 = distinct !DILexicalBlock(scope: !703, file: !35, line: 464, column: 13)
!708 = !DILocation(line: 465, column: 24, scope: !707)
!709 = !DILocation(line: 465, column: 30, scope: !707)
!710 = !DILocation(line: 467, column: 23, scope: !711)
!711 = distinct !DILexicalBlock(scope: !707, file: !35, line: 467, column: 17)
!712 = !DILocation(line: 467, column: 21, scope: !711)
!713 = !DILocation(line: 467, column: 28, scope: !714)
!714 = distinct !DILexicalBlock(scope: !711, file: !35, line: 467, column: 17)
!715 = !DILocation(line: 467, column: 30, scope: !714)
!716 = !DILocation(line: 467, column: 17, scope: !711)
!717 = !DILocation(line: 469, column: 34, scope: !718)
!718 = distinct !DILexicalBlock(scope: !714, file: !35, line: 468, column: 17)
!719 = !DILocation(line: 469, column: 41, scope: !718)
!720 = !DILocation(line: 469, column: 21, scope: !718)
!721 = !DILocation(line: 470, column: 17, scope: !718)
!722 = !DILocation(line: 467, column: 37, scope: !714)
!723 = !DILocation(line: 467, column: 17, scope: !714)
!724 = distinct !{!724, !716, !725, !188}
!725 = !DILocation(line: 470, column: 17, scope: !711)
!726 = !DILocation(line: 471, column: 13, scope: !707)
!727 = !DILocation(line: 474, column: 17, scope: !728)
!728 = distinct !DILexicalBlock(scope: !703, file: !35, line: 473, column: 13)
!729 = !DILocation(line: 476, column: 18, scope: !673)
!730 = !DILocation(line: 476, column: 13, scope: !673)
!731 = !DILocation(line: 478, column: 5, scope: !674)
!732 = !DILocation(line: 479, column: 1, scope: !659)
