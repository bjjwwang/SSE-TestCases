; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_bad() #0 !dbg !38 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 -1, i32* %data, align 4, !dbg !44
  %0 = load i32, i32* @staticFive, align 4, !dbg !45
  %cmp = icmp eq i32 %0, 5, !dbg !47
  br i1 %cmp, label %if.then, label %if.end34, !dbg !48

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !49, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !53, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !74, metadata !DIExpression()), !dbg !75
  store i32 -1, i32* %listenSocket, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !76, metadata !DIExpression()), !dbg !77
  store i32 -1, i32* %acceptSocket, align 4, !dbg !77
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  br label %do.body, !dbg !80

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !81
  store i32 %call, i32* %listenSocket, align 4, !dbg !83
  %1 = load i32, i32* %listenSocket, align 4, !dbg !84
  %cmp1 = icmp eq i32 %1, -1, !dbg !86
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !87

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !88

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !90
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !90
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !91
  store i8 2, i8* %sin_family, align 1, !dbg !92
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !93
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !94
  store i32 0, i32* %s_addr, align 4, !dbg !95
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !96
  store i16 -30871, i16* %sin_port, align 2, !dbg !97
  %3 = load i32, i32* %listenSocket, align 4, !dbg !98
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !100
  %call3 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !101
  %cmp4 = icmp eq i32 %call3, -1, !dbg !102
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !103

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !104

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !106
  %call7 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !108
  %cmp8 = icmp eq i32 %call7, -1, !dbg !109
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !110

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !111

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !113
  %call11 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !114
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !115
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !116
  %cmp12 = icmp eq i32 %7, -1, !dbg !118
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !119

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !120

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !122
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !123
  %call15 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !124
  %conv = trunc i64 %call15 to i32, !dbg !124
  store i32 %conv, i32* %recvResult, align 4, !dbg !125
  %9 = load i32, i32* %recvResult, align 4, !dbg !126
  %cmp16 = icmp eq i32 %9, -1, !dbg !128
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !129

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !130
  %cmp18 = icmp eq i32 %10, 0, !dbg !131
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !132

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !133

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !135
  %idxprom = sext i32 %11 to i64, !dbg !136
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !136
  store i8 0, i8* %arrayidx, align 1, !dbg !137
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !138
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !139
  store i32 %call23, i32* %data, align 4, !dbg !140
  br label %do.end, !dbg !141

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !142
  %cmp24 = icmp ne i32 %12, -1, !dbg !144
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !145

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !146
  %call27 = call i32 @"\01_close"(i32 noundef %13), !dbg !148
  br label %if.end28, !dbg !149

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !150
  %cmp29 = icmp ne i32 %14, -1, !dbg !152
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !153

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !154
  %call32 = call i32 @"\01_close"(i32 noundef %15), !dbg !156
  br label %if.end33, !dbg !157

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !158

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !159
  %cmp35 = icmp eq i32 %16, 5, !dbg !161
  br i1 %cmp35, label %if.then37, label %if.end62, !dbg !162

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !163, metadata !DIExpression()), !dbg !166
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !167, metadata !DIExpression()), !dbg !168
  %call38 = call i8* @malloc(i64 noundef 40) #6, !dbg !169
  %17 = bitcast i8* %call38 to i32*, !dbg !170
  store i32* %17, i32** %buffer, align 8, !dbg !168
  %18 = load i32*, i32** %buffer, align 8, !dbg !171
  %cmp39 = icmp eq i32* %18, null, !dbg !173
  br i1 %cmp39, label %if.then41, label %if.end42, !dbg !174

if.then41:                                        ; preds = %if.then37
  call void @exit(i32 noundef -1) #7, !dbg !175
  unreachable, !dbg !175

if.end42:                                         ; preds = %if.then37
  store i32 0, i32* %i, align 4, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %if.end42
  %19 = load i32, i32* %i, align 4, !dbg !180
  %cmp43 = icmp slt i32 %19, 10, !dbg !182
  br i1 %cmp43, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !184
  %21 = load i32, i32* %i, align 4, !dbg !186
  %idxprom45 = sext i32 %21 to i64, !dbg !184
  %arrayidx46 = getelementptr inbounds i32, i32* %20, i64 %idxprom45, !dbg !184
  store i32 0, i32* %arrayidx46, align 4, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !189
  %inc = add nsw i32 %22, 1, !dbg !189
  store i32 %inc, i32* %i, align 4, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !194
  %cmp47 = icmp sge i32 %23, 0, !dbg !196
  br i1 %cmp47, label %if.then49, label %if.else, !dbg !197

if.then49:                                        ; preds = %for.end
  %24 = load i32*, i32** %buffer, align 8, !dbg !198
  %25 = load i32, i32* %data, align 4, !dbg !200
  %idxprom50 = sext i32 %25 to i64, !dbg !198
  %arrayidx51 = getelementptr inbounds i32, i32* %24, i64 %idxprom50, !dbg !198
  store i32 1, i32* %arrayidx51, align 4, !dbg !201
  store i32 0, i32* %i, align 4, !dbg !202
  br label %for.cond52, !dbg !204

for.cond52:                                       ; preds = %for.inc58, %if.then49
  %26 = load i32, i32* %i, align 4, !dbg !205
  %cmp53 = icmp slt i32 %26, 10, !dbg !207
  br i1 %cmp53, label %for.body55, label %for.end60, !dbg !208

for.body55:                                       ; preds = %for.cond52
  %27 = load i32*, i32** %buffer, align 8, !dbg !209
  %28 = load i32, i32* %i, align 4, !dbg !211
  %idxprom56 = sext i32 %28 to i64, !dbg !209
  %arrayidx57 = getelementptr inbounds i32, i32* %27, i64 %idxprom56, !dbg !209
  %29 = load i32, i32* %arrayidx57, align 4, !dbg !209
  call void @printIntLine(i32 noundef %29), !dbg !212
  br label %for.inc58, !dbg !213

for.inc58:                                        ; preds = %for.body55
  %30 = load i32, i32* %i, align 4, !dbg !214
  %inc59 = add nsw i32 %30, 1, !dbg !214
  store i32 %inc59, i32* %i, align 4, !dbg !214
  br label %for.cond52, !dbg !215, !llvm.loop !216

for.end60:                                        ; preds = %for.cond52
  br label %if.end61, !dbg !218

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !219
  br label %if.end61

if.end61:                                         ; preds = %if.else, %for.end60
  %31 = load i32*, i32** %buffer, align 8, !dbg !221
  %32 = bitcast i32* %31 to i8*, !dbg !221
  call void @free(i8* noundef %32), !dbg !222
  br label %if.end62, !dbg !223

if.end62:                                         ; preds = %if.end61, %if.end34
  ret void, !dbg !224
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_good() #0 !dbg !225 {
entry:
  call void @goodB2G1(), !dbg !226
  call void @goodB2G2(), !dbg !227
  call void @goodG2B1(), !dbg !228
  call void @goodG2B2(), !dbg !229
  ret void, !dbg !230
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !231 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !236, metadata !DIExpression()), !dbg !237
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !238, metadata !DIExpression()), !dbg !239
  %call = call i64 @time(i64* noundef null), !dbg !240
  %conv = trunc i64 %call to i32, !dbg !241
  call void @srand(i32 noundef %conv), !dbg !242
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !243
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_good(), !dbg !244
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !245
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !246
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_bad(), !dbg !247
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !248
  ret i32 0, !dbg !249
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !250 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !251, metadata !DIExpression()), !dbg !252
  store i32 -1, i32* %data, align 4, !dbg !253
  %0 = load i32, i32* @staticFive, align 4, !dbg !254
  %cmp = icmp eq i32 %0, 5, !dbg !256
  br i1 %cmp, label %if.then, label %if.end34, !dbg !257

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !258, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !264, metadata !DIExpression()), !dbg !265
  store i32 -1, i32* %listenSocket, align 4, !dbg !265
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !266, metadata !DIExpression()), !dbg !267
  store i32 -1, i32* %acceptSocket, align 4, !dbg !267
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !268, metadata !DIExpression()), !dbg !269
  br label %do.body, !dbg !270

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !271
  store i32 %call, i32* %listenSocket, align 4, !dbg !273
  %1 = load i32, i32* %listenSocket, align 4, !dbg !274
  %cmp1 = icmp eq i32 %1, -1, !dbg !276
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !277

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !278

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !280
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !280
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !281
  store i8 2, i8* %sin_family, align 1, !dbg !282
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !283
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !284
  store i32 0, i32* %s_addr, align 4, !dbg !285
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !286
  store i16 -30871, i16* %sin_port, align 2, !dbg !287
  %3 = load i32, i32* %listenSocket, align 4, !dbg !288
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !290
  %call3 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !291
  %cmp4 = icmp eq i32 %call3, -1, !dbg !292
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !293

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !294

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !296
  %call7 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !298
  %cmp8 = icmp eq i32 %call7, -1, !dbg !299
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !300

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !301

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !303
  %call11 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !304
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !305
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !306
  %cmp12 = icmp eq i32 %7, -1, !dbg !308
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !309

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !310

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !312
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !313
  %call15 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !314
  %conv = trunc i64 %call15 to i32, !dbg !314
  store i32 %conv, i32* %recvResult, align 4, !dbg !315
  %9 = load i32, i32* %recvResult, align 4, !dbg !316
  %cmp16 = icmp eq i32 %9, -1, !dbg !318
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !319

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !320
  %cmp18 = icmp eq i32 %10, 0, !dbg !321
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !322

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !323

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !325
  %idxprom = sext i32 %11 to i64, !dbg !326
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !326
  store i8 0, i8* %arrayidx, align 1, !dbg !327
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !328
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !329
  store i32 %call23, i32* %data, align 4, !dbg !330
  br label %do.end, !dbg !331

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !332
  %cmp24 = icmp ne i32 %12, -1, !dbg !334
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !335

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !336
  %call27 = call i32 @"\01_close"(i32 noundef %13), !dbg !338
  br label %if.end28, !dbg !339

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !340
  %cmp29 = icmp ne i32 %14, -1, !dbg !342
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !343

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !344
  %call32 = call i32 @"\01_close"(i32 noundef %15), !dbg !346
  br label %if.end33, !dbg !347

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !348

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !349
  %cmp35 = icmp ne i32 %16, 5, !dbg !351
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !352

if.then37:                                        ; preds = %if.end34
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !353
  br label %if.end65, !dbg !355

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !356, metadata !DIExpression()), !dbg !359
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !360, metadata !DIExpression()), !dbg !361
  %call38 = call i8* @malloc(i64 noundef 40) #6, !dbg !362
  %17 = bitcast i8* %call38 to i32*, !dbg !363
  store i32* %17, i32** %buffer, align 8, !dbg !361
  %18 = load i32*, i32** %buffer, align 8, !dbg !364
  %cmp39 = icmp eq i32* %18, null, !dbg !366
  br i1 %cmp39, label %if.then41, label %if.end42, !dbg !367

if.then41:                                        ; preds = %if.else
  call void @exit(i32 noundef -1) #7, !dbg !368
  unreachable, !dbg !368

if.end42:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !370
  br label %for.cond, !dbg !372

for.cond:                                         ; preds = %for.inc, %if.end42
  %19 = load i32, i32* %i, align 4, !dbg !373
  %cmp43 = icmp slt i32 %19, 10, !dbg !375
  br i1 %cmp43, label %for.body, label %for.end, !dbg !376

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !377
  %21 = load i32, i32* %i, align 4, !dbg !379
  %idxprom45 = sext i32 %21 to i64, !dbg !377
  %arrayidx46 = getelementptr inbounds i32, i32* %20, i64 %idxprom45, !dbg !377
  store i32 0, i32* %arrayidx46, align 4, !dbg !380
  br label %for.inc, !dbg !381

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !382
  %inc = add nsw i32 %22, 1, !dbg !382
  store i32 %inc, i32* %i, align 4, !dbg !382
  br label %for.cond, !dbg !383, !llvm.loop !384

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !386
  %cmp47 = icmp sge i32 %23, 0, !dbg !388
  br i1 %cmp47, label %land.lhs.true, label %if.else63, !dbg !389

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !390
  %cmp49 = icmp slt i32 %24, 10, !dbg !391
  br i1 %cmp49, label %if.then51, label %if.else63, !dbg !392

if.then51:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !393
  %26 = load i32, i32* %data, align 4, !dbg !395
  %idxprom52 = sext i32 %26 to i64, !dbg !393
  %arrayidx53 = getelementptr inbounds i32, i32* %25, i64 %idxprom52, !dbg !393
  store i32 1, i32* %arrayidx53, align 4, !dbg !396
  store i32 0, i32* %i, align 4, !dbg !397
  br label %for.cond54, !dbg !399

for.cond54:                                       ; preds = %for.inc60, %if.then51
  %27 = load i32, i32* %i, align 4, !dbg !400
  %cmp55 = icmp slt i32 %27, 10, !dbg !402
  br i1 %cmp55, label %for.body57, label %for.end62, !dbg !403

for.body57:                                       ; preds = %for.cond54
  %28 = load i32*, i32** %buffer, align 8, !dbg !404
  %29 = load i32, i32* %i, align 4, !dbg !406
  %idxprom58 = sext i32 %29 to i64, !dbg !404
  %arrayidx59 = getelementptr inbounds i32, i32* %28, i64 %idxprom58, !dbg !404
  %30 = load i32, i32* %arrayidx59, align 4, !dbg !404
  call void @printIntLine(i32 noundef %30), !dbg !407
  br label %for.inc60, !dbg !408

for.inc60:                                        ; preds = %for.body57
  %31 = load i32, i32* %i, align 4, !dbg !409
  %inc61 = add nsw i32 %31, 1, !dbg !409
  store i32 %inc61, i32* %i, align 4, !dbg !409
  br label %for.cond54, !dbg !410, !llvm.loop !411

for.end62:                                        ; preds = %for.cond54
  br label %if.end64, !dbg !413

if.else63:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !414
  br label %if.end64

if.end64:                                         ; preds = %if.else63, %for.end62
  %32 = load i32*, i32** %buffer, align 8, !dbg !416
  %33 = bitcast i32* %32 to i8*, !dbg !416
  call void @free(i8* noundef %33), !dbg !417
  br label %if.end65

if.end65:                                         ; preds = %if.end64, %if.then37
  ret void, !dbg !418
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !419 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !420, metadata !DIExpression()), !dbg !421
  store i32 -1, i32* %data, align 4, !dbg !422
  %0 = load i32, i32* @staticFive, align 4, !dbg !423
  %cmp = icmp eq i32 %0, 5, !dbg !425
  br i1 %cmp, label %if.then, label %if.end34, !dbg !426

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !427, metadata !DIExpression()), !dbg !430
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !431, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !433, metadata !DIExpression()), !dbg !434
  store i32 -1, i32* %listenSocket, align 4, !dbg !434
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !435, metadata !DIExpression()), !dbg !436
  store i32 -1, i32* %acceptSocket, align 4, !dbg !436
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !437, metadata !DIExpression()), !dbg !438
  br label %do.body, !dbg !439

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !440
  store i32 %call, i32* %listenSocket, align 4, !dbg !442
  %1 = load i32, i32* %listenSocket, align 4, !dbg !443
  %cmp1 = icmp eq i32 %1, -1, !dbg !445
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !446

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !447

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !449
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !449
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !450
  store i8 2, i8* %sin_family, align 1, !dbg !451
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !452
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !453
  store i32 0, i32* %s_addr, align 4, !dbg !454
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !455
  store i16 -30871, i16* %sin_port, align 2, !dbg !456
  %3 = load i32, i32* %listenSocket, align 4, !dbg !457
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !459
  %call3 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !460
  %cmp4 = icmp eq i32 %call3, -1, !dbg !461
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !462

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !463

if.end6:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !465
  %call7 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !467
  %cmp8 = icmp eq i32 %call7, -1, !dbg !468
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !469

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !470

if.end10:                                         ; preds = %if.end6
  %6 = load i32, i32* %listenSocket, align 4, !dbg !472
  %call11 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !473
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !474
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !475
  %cmp12 = icmp eq i32 %7, -1, !dbg !477
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !478

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !479

if.end14:                                         ; preds = %if.end10
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !481
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !482
  %call15 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !483
  %conv = trunc i64 %call15 to i32, !dbg !483
  store i32 %conv, i32* %recvResult, align 4, !dbg !484
  %9 = load i32, i32* %recvResult, align 4, !dbg !485
  %cmp16 = icmp eq i32 %9, -1, !dbg !487
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !488

lor.lhs.false:                                    ; preds = %if.end14
  %10 = load i32, i32* %recvResult, align 4, !dbg !489
  %cmp18 = icmp eq i32 %10, 0, !dbg !490
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !491

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !492

if.end21:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !494
  %idxprom = sext i32 %11 to i64, !dbg !495
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !495
  store i8 0, i8* %arrayidx, align 1, !dbg !496
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !497
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !498
  store i32 %call23, i32* %data, align 4, !dbg !499
  br label %do.end, !dbg !500

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %12 = load i32, i32* %listenSocket, align 4, !dbg !501
  %cmp24 = icmp ne i32 %12, -1, !dbg !503
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !504

if.then26:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !505
  %call27 = call i32 @"\01_close"(i32 noundef %13), !dbg !507
  br label %if.end28, !dbg !508

if.end28:                                         ; preds = %if.then26, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !509
  %cmp29 = icmp ne i32 %14, -1, !dbg !511
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !512

if.then31:                                        ; preds = %if.end28
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !513
  %call32 = call i32 @"\01_close"(i32 noundef %15), !dbg !515
  br label %if.end33, !dbg !516

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !517

if.end34:                                         ; preds = %if.end33, %entry
  %16 = load i32, i32* @staticFive, align 4, !dbg !518
  %cmp35 = icmp eq i32 %16, 5, !dbg !520
  br i1 %cmp35, label %if.then37, label %if.end64, !dbg !521

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !522, metadata !DIExpression()), !dbg !525
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !526, metadata !DIExpression()), !dbg !527
  %call38 = call i8* @malloc(i64 noundef 40) #6, !dbg !528
  %17 = bitcast i8* %call38 to i32*, !dbg !529
  store i32* %17, i32** %buffer, align 8, !dbg !527
  %18 = load i32*, i32** %buffer, align 8, !dbg !530
  %cmp39 = icmp eq i32* %18, null, !dbg !532
  br i1 %cmp39, label %if.then41, label %if.end42, !dbg !533

if.then41:                                        ; preds = %if.then37
  call void @exit(i32 noundef -1) #7, !dbg !534
  unreachable, !dbg !534

if.end42:                                         ; preds = %if.then37
  store i32 0, i32* %i, align 4, !dbg !536
  br label %for.cond, !dbg !538

for.cond:                                         ; preds = %for.inc, %if.end42
  %19 = load i32, i32* %i, align 4, !dbg !539
  %cmp43 = icmp slt i32 %19, 10, !dbg !541
  br i1 %cmp43, label %for.body, label %for.end, !dbg !542

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !543
  %21 = load i32, i32* %i, align 4, !dbg !545
  %idxprom45 = sext i32 %21 to i64, !dbg !543
  %arrayidx46 = getelementptr inbounds i32, i32* %20, i64 %idxprom45, !dbg !543
  store i32 0, i32* %arrayidx46, align 4, !dbg !546
  br label %for.inc, !dbg !547

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !548
  %inc = add nsw i32 %22, 1, !dbg !548
  store i32 %inc, i32* %i, align 4, !dbg !548
  br label %for.cond, !dbg !549, !llvm.loop !550

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data, align 4, !dbg !552
  %cmp47 = icmp sge i32 %23, 0, !dbg !554
  br i1 %cmp47, label %land.lhs.true, label %if.else, !dbg !555

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data, align 4, !dbg !556
  %cmp49 = icmp slt i32 %24, 10, !dbg !557
  br i1 %cmp49, label %if.then51, label %if.else, !dbg !558

if.then51:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !559
  %26 = load i32, i32* %data, align 4, !dbg !561
  %idxprom52 = sext i32 %26 to i64, !dbg !559
  %arrayidx53 = getelementptr inbounds i32, i32* %25, i64 %idxprom52, !dbg !559
  store i32 1, i32* %arrayidx53, align 4, !dbg !562
  store i32 0, i32* %i, align 4, !dbg !563
  br label %for.cond54, !dbg !565

for.cond54:                                       ; preds = %for.inc60, %if.then51
  %27 = load i32, i32* %i, align 4, !dbg !566
  %cmp55 = icmp slt i32 %27, 10, !dbg !568
  br i1 %cmp55, label %for.body57, label %for.end62, !dbg !569

for.body57:                                       ; preds = %for.cond54
  %28 = load i32*, i32** %buffer, align 8, !dbg !570
  %29 = load i32, i32* %i, align 4, !dbg !572
  %idxprom58 = sext i32 %29 to i64, !dbg !570
  %arrayidx59 = getelementptr inbounds i32, i32* %28, i64 %idxprom58, !dbg !570
  %30 = load i32, i32* %arrayidx59, align 4, !dbg !570
  call void @printIntLine(i32 noundef %30), !dbg !573
  br label %for.inc60, !dbg !574

for.inc60:                                        ; preds = %for.body57
  %31 = load i32, i32* %i, align 4, !dbg !575
  %inc61 = add nsw i32 %31, 1, !dbg !575
  store i32 %inc61, i32* %i, align 4, !dbg !575
  br label %for.cond54, !dbg !576, !llvm.loop !577

for.end62:                                        ; preds = %for.cond54
  br label %if.end63, !dbg !579

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !580
  br label %if.end63

if.end63:                                         ; preds = %if.else, %for.end62
  %32 = load i32*, i32** %buffer, align 8, !dbg !582
  %33 = bitcast i32* %32 to i8*, !dbg !582
  call void @free(i8* noundef %33), !dbg !583
  br label %if.end64, !dbg !584

if.end64:                                         ; preds = %if.end63, %if.end34
  ret void, !dbg !585
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !586 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !587, metadata !DIExpression()), !dbg !588
  store i32 -1, i32* %data, align 4, !dbg !589
  %0 = load i32, i32* @staticFive, align 4, !dbg !590
  %cmp = icmp ne i32 %0, 5, !dbg !592
  br i1 %cmp, label %if.then, label %if.else, !dbg !593

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !594
  br label %if.end, !dbg !596

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !597
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !599
  %cmp1 = icmp eq i32 %1, 5, !dbg !601
  br i1 %cmp1, label %if.then2, label %if.end21, !dbg !602

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !603, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !607, metadata !DIExpression()), !dbg !608
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !609
  %2 = bitcast i8* %call to i32*, !dbg !610
  store i32* %2, i32** %buffer, align 8, !dbg !608
  %3 = load i32*, i32** %buffer, align 8, !dbg !611
  %cmp3 = icmp eq i32* %3, null, !dbg !613
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !614

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #7, !dbg !615
  unreachable, !dbg !615

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !617
  br label %for.cond, !dbg !619

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !620
  %cmp6 = icmp slt i32 %4, 10, !dbg !622
  br i1 %cmp6, label %for.body, label %for.end, !dbg !623

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !624
  %6 = load i32, i32* %i, align 4, !dbg !626
  %idxprom = sext i32 %6 to i64, !dbg !624
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !624
  store i32 0, i32* %arrayidx, align 4, !dbg !627
  br label %for.inc, !dbg !628

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !629
  %inc = add nsw i32 %7, 1, !dbg !629
  store i32 %inc, i32* %i, align 4, !dbg !629
  br label %for.cond, !dbg !630, !llvm.loop !631

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !633
  %cmp7 = icmp sge i32 %8, 0, !dbg !635
  br i1 %cmp7, label %if.then8, label %if.else19, !dbg !636

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !637
  %10 = load i32, i32* %data, align 4, !dbg !639
  %idxprom9 = sext i32 %10 to i64, !dbg !637
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !637
  store i32 1, i32* %arrayidx10, align 4, !dbg !640
  store i32 0, i32* %i, align 4, !dbg !641
  br label %for.cond11, !dbg !643

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !644
  %cmp12 = icmp slt i32 %11, 10, !dbg !646
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !647

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !648
  %13 = load i32, i32* %i, align 4, !dbg !650
  %idxprom14 = sext i32 %13 to i64, !dbg !648
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !648
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !648
  call void @printIntLine(i32 noundef %14), !dbg !651
  br label %for.inc16, !dbg !652

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !653
  %inc17 = add nsw i32 %15, 1, !dbg !653
  store i32 %inc17, i32* %i, align 4, !dbg !653
  br label %for.cond11, !dbg !654, !llvm.loop !655

for.end18:                                        ; preds = %for.cond11
  br label %if.end20, !dbg !657

if.else19:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !658
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !660
  %17 = bitcast i32* %16 to i8*, !dbg !660
  call void @free(i8* noundef %17), !dbg !661
  br label %if.end21, !dbg !662

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !663
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !664 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !665, metadata !DIExpression()), !dbg !666
  store i32 -1, i32* %data, align 4, !dbg !667
  %0 = load i32, i32* @staticFive, align 4, !dbg !668
  %cmp = icmp eq i32 %0, 5, !dbg !670
  br i1 %cmp, label %if.then, label %if.end, !dbg !671

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !672
  br label %if.end, !dbg !674

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !675
  %cmp1 = icmp eq i32 %1, 5, !dbg !677
  br i1 %cmp1, label %if.then2, label %if.end20, !dbg !678

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !679, metadata !DIExpression()), !dbg !682
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !683, metadata !DIExpression()), !dbg !684
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !685
  %2 = bitcast i8* %call to i32*, !dbg !686
  store i32* %2, i32** %buffer, align 8, !dbg !684
  %3 = load i32*, i32** %buffer, align 8, !dbg !687
  %cmp3 = icmp eq i32* %3, null, !dbg !689
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !690

if.then4:                                         ; preds = %if.then2
  call void @exit(i32 noundef -1) #7, !dbg !691
  unreachable, !dbg !691

if.end5:                                          ; preds = %if.then2
  store i32 0, i32* %i, align 4, !dbg !693
  br label %for.cond, !dbg !695

for.cond:                                         ; preds = %for.inc, %if.end5
  %4 = load i32, i32* %i, align 4, !dbg !696
  %cmp6 = icmp slt i32 %4, 10, !dbg !698
  br i1 %cmp6, label %for.body, label %for.end, !dbg !699

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !700
  %6 = load i32, i32* %i, align 4, !dbg !702
  %idxprom = sext i32 %6 to i64, !dbg !700
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !700
  store i32 0, i32* %arrayidx, align 4, !dbg !703
  br label %for.inc, !dbg !704

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !705
  %inc = add nsw i32 %7, 1, !dbg !705
  store i32 %inc, i32* %i, align 4, !dbg !705
  br label %for.cond, !dbg !706, !llvm.loop !707

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data, align 4, !dbg !709
  %cmp7 = icmp sge i32 %8, 0, !dbg !711
  br i1 %cmp7, label %if.then8, label %if.else, !dbg !712

if.then8:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !713
  %10 = load i32, i32* %data, align 4, !dbg !715
  %idxprom9 = sext i32 %10 to i64, !dbg !713
  %arrayidx10 = getelementptr inbounds i32, i32* %9, i64 %idxprom9, !dbg !713
  store i32 1, i32* %arrayidx10, align 4, !dbg !716
  store i32 0, i32* %i, align 4, !dbg !717
  br label %for.cond11, !dbg !719

for.cond11:                                       ; preds = %for.inc16, %if.then8
  %11 = load i32, i32* %i, align 4, !dbg !720
  %cmp12 = icmp slt i32 %11, 10, !dbg !722
  br i1 %cmp12, label %for.body13, label %for.end18, !dbg !723

for.body13:                                       ; preds = %for.cond11
  %12 = load i32*, i32** %buffer, align 8, !dbg !724
  %13 = load i32, i32* %i, align 4, !dbg !726
  %idxprom14 = sext i32 %13 to i64, !dbg !724
  %arrayidx15 = getelementptr inbounds i32, i32* %12, i64 %idxprom14, !dbg !724
  %14 = load i32, i32* %arrayidx15, align 4, !dbg !724
  call void @printIntLine(i32 noundef %14), !dbg !727
  br label %for.inc16, !dbg !728

for.inc16:                                        ; preds = %for.body13
  %15 = load i32, i32* %i, align 4, !dbg !729
  %inc17 = add nsw i32 %15, 1, !dbg !729
  store i32 %inc17, i32* %i, align 4, !dbg !729
  br label %for.cond11, !dbg !730, !llvm.loop !731

for.end18:                                        ; preds = %for.cond11
  br label %if.end19, !dbg !733

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !734
  br label %if.end19

if.end19:                                         ; preds = %if.else, %for.end18
  %16 = load i32*, i32** %buffer, align 8, !dbg !736
  %17 = bitcast i32* %16 to i8*, !dbg !736
  call void @free(i8* noundef %17), !dbg !737
  br label %if.end20, !dbg !738

if.end20:                                         ; preds = %if.end19, %if.end
  ret void, !dbg !739
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!31, !32, !33, !34, !35, !36}
!llvm.ident = !{!37}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !30, line: 45, type: !27, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !29, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !8, !11, !26, !28, !7}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !6, line: 30, baseType: !7)
!6 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_u_int32_t.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 45, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !13, line: 412, size: 128, elements: !14)
!13 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!14 = !{!15, !18, !21}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !12, file: !13, line: 413, baseType: !16, size: 8)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 43, baseType: !17)
!17 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !12, file: !13, line: 414, baseType: !19, size: 8, offset: 8)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !20, line: 31, baseType: !16)
!20 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!21 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !12, file: !13, line: 415, baseType: !22, size: 112, offset: 16)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!29 = !{!0}
!30 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !{i32 7, !"Dwarf Version", i32 4}
!32 = !{i32 2, !"Debug Info Version", i32 3}
!33 = !{i32 1, !"wchar_size", i32 4}
!34 = !{i32 7, !"PIC Level", i32 2}
!35 = !{i32 7, !"uwtable", i32 1}
!36 = !{i32 7, !"frame-pointer", i32 2}
!37 = !{!"Homebrew clang version 14.0.6"}
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_bad", scope: !30, file: !30, line: 49, type: !39, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !41)
!39 = !DISubroutineType(types: !40)
!40 = !{null}
!41 = !{}
!42 = !DILocalVariable(name: "data", scope: !38, file: !30, line: 51, type: !27)
!43 = !DILocation(line: 51, column: 9, scope: !38)
!44 = !DILocation(line: 53, column: 10, scope: !38)
!45 = !DILocation(line: 54, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !38, file: !30, line: 54, column: 8)
!47 = !DILocation(line: 54, column: 18, scope: !46)
!48 = !DILocation(line: 54, column: 8, scope: !38)
!49 = !DILocalVariable(name: "recvResult", scope: !50, file: !30, line: 61, type: !27)
!50 = distinct !DILexicalBlock(scope: !51, file: !30, line: 56, column: 9)
!51 = distinct !DILexicalBlock(scope: !46, file: !30, line: 55, column: 5)
!52 = !DILocation(line: 61, column: 17, scope: !50)
!53 = !DILocalVariable(name: "service", scope: !50, file: !30, line: 62, type: !54)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !55, line: 375, size: 128, elements: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!56 = !{!57, !58, !59, !62, !69}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !54, file: !55, line: 376, baseType: !16, size: 8)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !54, file: !55, line: 377, baseType: !19, size: 8, offset: 8)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !54, file: !55, line: 378, baseType: !60, size: 16, offset: 16)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !61, line: 31, baseType: !8)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!62 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !54, file: !55, line: 379, baseType: !63, size: 32, offset: 32)
!63 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !55, line: 301, size: 32, elements: !64)
!64 = !{!65}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !63, file: !55, line: 302, baseType: !66, size: 32)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !67, line: 31, baseType: !68)
!67 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 47, baseType: !7)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !54, file: !55, line: 380, baseType: !70, size: 64, offset: 64)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 64, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 8)
!73 = !DILocation(line: 62, column: 32, scope: !50)
!74 = !DILocalVariable(name: "listenSocket", scope: !50, file: !30, line: 63, type: !27)
!75 = !DILocation(line: 63, column: 20, scope: !50)
!76 = !DILocalVariable(name: "acceptSocket", scope: !50, file: !30, line: 64, type: !27)
!77 = !DILocation(line: 64, column: 20, scope: !50)
!78 = !DILocalVariable(name: "inputBuffer", scope: !50, file: !30, line: 65, type: !22)
!79 = !DILocation(line: 65, column: 18, scope: !50)
!80 = !DILocation(line: 66, column: 13, scope: !50)
!81 = !DILocation(line: 76, column: 32, scope: !82)
!82 = distinct !DILexicalBlock(scope: !50, file: !30, line: 67, column: 13)
!83 = !DILocation(line: 76, column: 30, scope: !82)
!84 = !DILocation(line: 77, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !82, file: !30, line: 77, column: 21)
!86 = !DILocation(line: 77, column: 34, scope: !85)
!87 = !DILocation(line: 77, column: 21, scope: !82)
!88 = !DILocation(line: 79, column: 21, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !30, line: 78, column: 17)
!90 = !DILocation(line: 81, column: 17, scope: !82)
!91 = !DILocation(line: 82, column: 25, scope: !82)
!92 = !DILocation(line: 82, column: 36, scope: !82)
!93 = !DILocation(line: 83, column: 25, scope: !82)
!94 = !DILocation(line: 83, column: 34, scope: !82)
!95 = !DILocation(line: 83, column: 41, scope: !82)
!96 = !DILocation(line: 84, column: 25, scope: !82)
!97 = !DILocation(line: 84, column: 34, scope: !82)
!98 = !DILocation(line: 85, column: 26, scope: !99)
!99 = distinct !DILexicalBlock(scope: !82, file: !30, line: 85, column: 21)
!100 = !DILocation(line: 85, column: 40, scope: !99)
!101 = !DILocation(line: 85, column: 21, scope: !99)
!102 = !DILocation(line: 85, column: 85, scope: !99)
!103 = !DILocation(line: 85, column: 21, scope: !82)
!104 = !DILocation(line: 87, column: 21, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !30, line: 86, column: 17)
!106 = !DILocation(line: 89, column: 28, scope: !107)
!107 = distinct !DILexicalBlock(scope: !82, file: !30, line: 89, column: 21)
!108 = !DILocation(line: 89, column: 21, scope: !107)
!109 = !DILocation(line: 89, column: 58, scope: !107)
!110 = !DILocation(line: 89, column: 21, scope: !82)
!111 = !DILocation(line: 91, column: 21, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !30, line: 90, column: 17)
!113 = !DILocation(line: 93, column: 39, scope: !82)
!114 = !DILocation(line: 93, column: 32, scope: !82)
!115 = !DILocation(line: 93, column: 30, scope: !82)
!116 = !DILocation(line: 94, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !82, file: !30, line: 94, column: 21)
!118 = !DILocation(line: 94, column: 34, scope: !117)
!119 = !DILocation(line: 94, column: 21, scope: !82)
!120 = !DILocation(line: 96, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !30, line: 95, column: 17)
!122 = !DILocation(line: 99, column: 35, scope: !82)
!123 = !DILocation(line: 99, column: 49, scope: !82)
!124 = !DILocation(line: 99, column: 30, scope: !82)
!125 = !DILocation(line: 99, column: 28, scope: !82)
!126 = !DILocation(line: 100, column: 21, scope: !127)
!127 = distinct !DILexicalBlock(scope: !82, file: !30, line: 100, column: 21)
!128 = !DILocation(line: 100, column: 32, scope: !127)
!129 = !DILocation(line: 100, column: 48, scope: !127)
!130 = !DILocation(line: 100, column: 51, scope: !127)
!131 = !DILocation(line: 100, column: 62, scope: !127)
!132 = !DILocation(line: 100, column: 21, scope: !82)
!133 = !DILocation(line: 102, column: 21, scope: !134)
!134 = distinct !DILexicalBlock(scope: !127, file: !30, line: 101, column: 17)
!135 = !DILocation(line: 105, column: 29, scope: !82)
!136 = !DILocation(line: 105, column: 17, scope: !82)
!137 = !DILocation(line: 105, column: 41, scope: !82)
!138 = !DILocation(line: 107, column: 29, scope: !82)
!139 = !DILocation(line: 107, column: 24, scope: !82)
!140 = !DILocation(line: 107, column: 22, scope: !82)
!141 = !DILocation(line: 108, column: 13, scope: !82)
!142 = !DILocation(line: 110, column: 17, scope: !143)
!143 = distinct !DILexicalBlock(scope: !50, file: !30, line: 110, column: 17)
!144 = !DILocation(line: 110, column: 30, scope: !143)
!145 = !DILocation(line: 110, column: 17, scope: !50)
!146 = !DILocation(line: 112, column: 30, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !30, line: 111, column: 13)
!148 = !DILocation(line: 112, column: 17, scope: !147)
!149 = !DILocation(line: 113, column: 13, scope: !147)
!150 = !DILocation(line: 114, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !50, file: !30, line: 114, column: 17)
!152 = !DILocation(line: 114, column: 30, scope: !151)
!153 = !DILocation(line: 114, column: 17, scope: !50)
!154 = !DILocation(line: 116, column: 30, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !30, line: 115, column: 13)
!156 = !DILocation(line: 116, column: 17, scope: !155)
!157 = !DILocation(line: 117, column: 13, scope: !155)
!158 = !DILocation(line: 125, column: 5, scope: !51)
!159 = !DILocation(line: 126, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !38, file: !30, line: 126, column: 8)
!161 = !DILocation(line: 126, column: 18, scope: !160)
!162 = !DILocation(line: 126, column: 8, scope: !38)
!163 = !DILocalVariable(name: "i", scope: !164, file: !30, line: 129, type: !27)
!164 = distinct !DILexicalBlock(scope: !165, file: !30, line: 128, column: 9)
!165 = distinct !DILexicalBlock(scope: !160, file: !30, line: 127, column: 5)
!166 = !DILocation(line: 129, column: 17, scope: !164)
!167 = !DILocalVariable(name: "buffer", scope: !164, file: !30, line: 130, type: !26)
!168 = !DILocation(line: 130, column: 19, scope: !164)
!169 = !DILocation(line: 130, column: 35, scope: !164)
!170 = !DILocation(line: 130, column: 28, scope: !164)
!171 = !DILocation(line: 131, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !164, file: !30, line: 131, column: 17)
!173 = !DILocation(line: 131, column: 24, scope: !172)
!174 = !DILocation(line: 131, column: 17, scope: !164)
!175 = !DILocation(line: 131, column: 34, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !30, line: 131, column: 33)
!177 = !DILocation(line: 133, column: 20, scope: !178)
!178 = distinct !DILexicalBlock(scope: !164, file: !30, line: 133, column: 13)
!179 = !DILocation(line: 133, column: 18, scope: !178)
!180 = !DILocation(line: 133, column: 25, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !30, line: 133, column: 13)
!182 = !DILocation(line: 133, column: 27, scope: !181)
!183 = !DILocation(line: 133, column: 13, scope: !178)
!184 = !DILocation(line: 135, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !30, line: 134, column: 13)
!186 = !DILocation(line: 135, column: 24, scope: !185)
!187 = !DILocation(line: 135, column: 27, scope: !185)
!188 = !DILocation(line: 136, column: 13, scope: !185)
!189 = !DILocation(line: 133, column: 34, scope: !181)
!190 = !DILocation(line: 133, column: 13, scope: !181)
!191 = distinct !{!191, !183, !192, !193}
!192 = !DILocation(line: 136, column: 13, scope: !178)
!193 = !{!"llvm.loop.mustprogress"}
!194 = !DILocation(line: 139, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !164, file: !30, line: 139, column: 17)
!196 = !DILocation(line: 139, column: 22, scope: !195)
!197 = !DILocation(line: 139, column: 17, scope: !164)
!198 = !DILocation(line: 141, column: 17, scope: !199)
!199 = distinct !DILexicalBlock(scope: !195, file: !30, line: 140, column: 13)
!200 = !DILocation(line: 141, column: 24, scope: !199)
!201 = !DILocation(line: 141, column: 30, scope: !199)
!202 = !DILocation(line: 143, column: 23, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !30, line: 143, column: 17)
!204 = !DILocation(line: 143, column: 21, scope: !203)
!205 = !DILocation(line: 143, column: 28, scope: !206)
!206 = distinct !DILexicalBlock(scope: !203, file: !30, line: 143, column: 17)
!207 = !DILocation(line: 143, column: 30, scope: !206)
!208 = !DILocation(line: 143, column: 17, scope: !203)
!209 = !DILocation(line: 145, column: 34, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !30, line: 144, column: 17)
!211 = !DILocation(line: 145, column: 41, scope: !210)
!212 = !DILocation(line: 145, column: 21, scope: !210)
!213 = !DILocation(line: 146, column: 17, scope: !210)
!214 = !DILocation(line: 143, column: 37, scope: !206)
!215 = !DILocation(line: 143, column: 17, scope: !206)
!216 = distinct !{!216, !208, !217, !193}
!217 = !DILocation(line: 146, column: 17, scope: !203)
!218 = !DILocation(line: 147, column: 13, scope: !199)
!219 = !DILocation(line: 150, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !195, file: !30, line: 149, column: 13)
!221 = !DILocation(line: 152, column: 18, scope: !164)
!222 = !DILocation(line: 152, column: 13, scope: !164)
!223 = !DILocation(line: 154, column: 5, scope: !165)
!224 = !DILocation(line: 155, column: 1, scope: !38)
!225 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_07_good", scope: !30, file: !30, line: 473, type: !39, scopeLine: 474, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !41)
!226 = !DILocation(line: 475, column: 5, scope: !225)
!227 = !DILocation(line: 476, column: 5, scope: !225)
!228 = !DILocation(line: 477, column: 5, scope: !225)
!229 = !DILocation(line: 478, column: 5, scope: !225)
!230 = !DILocation(line: 479, column: 1, scope: !225)
!231 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 490, type: !232, scopeLine: 491, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !41)
!232 = !DISubroutineType(types: !233)
!233 = !{!27, !27, !234}
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!235 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!236 = !DILocalVariable(name: "argc", arg: 1, scope: !231, file: !30, line: 490, type: !27)
!237 = !DILocation(line: 490, column: 14, scope: !231)
!238 = !DILocalVariable(name: "argv", arg: 2, scope: !231, file: !30, line: 490, type: !234)
!239 = !DILocation(line: 490, column: 27, scope: !231)
!240 = !DILocation(line: 493, column: 22, scope: !231)
!241 = !DILocation(line: 493, column: 12, scope: !231)
!242 = !DILocation(line: 493, column: 5, scope: !231)
!243 = !DILocation(line: 495, column: 5, scope: !231)
!244 = !DILocation(line: 496, column: 5, scope: !231)
!245 = !DILocation(line: 497, column: 5, scope: !231)
!246 = !DILocation(line: 500, column: 5, scope: !231)
!247 = !DILocation(line: 501, column: 5, scope: !231)
!248 = !DILocation(line: 502, column: 5, scope: !231)
!249 = !DILocation(line: 504, column: 5, scope: !231)
!250 = distinct !DISubprogram(name: "goodB2G1", scope: !30, file: !30, line: 162, type: !39, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !41)
!251 = !DILocalVariable(name: "data", scope: !250, file: !30, line: 164, type: !27)
!252 = !DILocation(line: 164, column: 9, scope: !250)
!253 = !DILocation(line: 166, column: 10, scope: !250)
!254 = !DILocation(line: 167, column: 8, scope: !255)
!255 = distinct !DILexicalBlock(scope: !250, file: !30, line: 167, column: 8)
!256 = !DILocation(line: 167, column: 18, scope: !255)
!257 = !DILocation(line: 167, column: 8, scope: !250)
!258 = !DILocalVariable(name: "recvResult", scope: !259, file: !30, line: 174, type: !27)
!259 = distinct !DILexicalBlock(scope: !260, file: !30, line: 169, column: 9)
!260 = distinct !DILexicalBlock(scope: !255, file: !30, line: 168, column: 5)
!261 = !DILocation(line: 174, column: 17, scope: !259)
!262 = !DILocalVariable(name: "service", scope: !259, file: !30, line: 175, type: !54)
!263 = !DILocation(line: 175, column: 32, scope: !259)
!264 = !DILocalVariable(name: "listenSocket", scope: !259, file: !30, line: 176, type: !27)
!265 = !DILocation(line: 176, column: 20, scope: !259)
!266 = !DILocalVariable(name: "acceptSocket", scope: !259, file: !30, line: 177, type: !27)
!267 = !DILocation(line: 177, column: 20, scope: !259)
!268 = !DILocalVariable(name: "inputBuffer", scope: !259, file: !30, line: 178, type: !22)
!269 = !DILocation(line: 178, column: 18, scope: !259)
!270 = !DILocation(line: 179, column: 13, scope: !259)
!271 = !DILocation(line: 189, column: 32, scope: !272)
!272 = distinct !DILexicalBlock(scope: !259, file: !30, line: 180, column: 13)
!273 = !DILocation(line: 189, column: 30, scope: !272)
!274 = !DILocation(line: 190, column: 21, scope: !275)
!275 = distinct !DILexicalBlock(scope: !272, file: !30, line: 190, column: 21)
!276 = !DILocation(line: 190, column: 34, scope: !275)
!277 = !DILocation(line: 190, column: 21, scope: !272)
!278 = !DILocation(line: 192, column: 21, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !30, line: 191, column: 17)
!280 = !DILocation(line: 194, column: 17, scope: !272)
!281 = !DILocation(line: 195, column: 25, scope: !272)
!282 = !DILocation(line: 195, column: 36, scope: !272)
!283 = !DILocation(line: 196, column: 25, scope: !272)
!284 = !DILocation(line: 196, column: 34, scope: !272)
!285 = !DILocation(line: 196, column: 41, scope: !272)
!286 = !DILocation(line: 197, column: 25, scope: !272)
!287 = !DILocation(line: 197, column: 34, scope: !272)
!288 = !DILocation(line: 198, column: 26, scope: !289)
!289 = distinct !DILexicalBlock(scope: !272, file: !30, line: 198, column: 21)
!290 = !DILocation(line: 198, column: 40, scope: !289)
!291 = !DILocation(line: 198, column: 21, scope: !289)
!292 = !DILocation(line: 198, column: 85, scope: !289)
!293 = !DILocation(line: 198, column: 21, scope: !272)
!294 = !DILocation(line: 200, column: 21, scope: !295)
!295 = distinct !DILexicalBlock(scope: !289, file: !30, line: 199, column: 17)
!296 = !DILocation(line: 202, column: 28, scope: !297)
!297 = distinct !DILexicalBlock(scope: !272, file: !30, line: 202, column: 21)
!298 = !DILocation(line: 202, column: 21, scope: !297)
!299 = !DILocation(line: 202, column: 58, scope: !297)
!300 = !DILocation(line: 202, column: 21, scope: !272)
!301 = !DILocation(line: 204, column: 21, scope: !302)
!302 = distinct !DILexicalBlock(scope: !297, file: !30, line: 203, column: 17)
!303 = !DILocation(line: 206, column: 39, scope: !272)
!304 = !DILocation(line: 206, column: 32, scope: !272)
!305 = !DILocation(line: 206, column: 30, scope: !272)
!306 = !DILocation(line: 207, column: 21, scope: !307)
!307 = distinct !DILexicalBlock(scope: !272, file: !30, line: 207, column: 21)
!308 = !DILocation(line: 207, column: 34, scope: !307)
!309 = !DILocation(line: 207, column: 21, scope: !272)
!310 = !DILocation(line: 209, column: 21, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !30, line: 208, column: 17)
!312 = !DILocation(line: 212, column: 35, scope: !272)
!313 = !DILocation(line: 212, column: 49, scope: !272)
!314 = !DILocation(line: 212, column: 30, scope: !272)
!315 = !DILocation(line: 212, column: 28, scope: !272)
!316 = !DILocation(line: 213, column: 21, scope: !317)
!317 = distinct !DILexicalBlock(scope: !272, file: !30, line: 213, column: 21)
!318 = !DILocation(line: 213, column: 32, scope: !317)
!319 = !DILocation(line: 213, column: 48, scope: !317)
!320 = !DILocation(line: 213, column: 51, scope: !317)
!321 = !DILocation(line: 213, column: 62, scope: !317)
!322 = !DILocation(line: 213, column: 21, scope: !272)
!323 = !DILocation(line: 215, column: 21, scope: !324)
!324 = distinct !DILexicalBlock(scope: !317, file: !30, line: 214, column: 17)
!325 = !DILocation(line: 218, column: 29, scope: !272)
!326 = !DILocation(line: 218, column: 17, scope: !272)
!327 = !DILocation(line: 218, column: 41, scope: !272)
!328 = !DILocation(line: 220, column: 29, scope: !272)
!329 = !DILocation(line: 220, column: 24, scope: !272)
!330 = !DILocation(line: 220, column: 22, scope: !272)
!331 = !DILocation(line: 221, column: 13, scope: !272)
!332 = !DILocation(line: 223, column: 17, scope: !333)
!333 = distinct !DILexicalBlock(scope: !259, file: !30, line: 223, column: 17)
!334 = !DILocation(line: 223, column: 30, scope: !333)
!335 = !DILocation(line: 223, column: 17, scope: !259)
!336 = !DILocation(line: 225, column: 30, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !30, line: 224, column: 13)
!338 = !DILocation(line: 225, column: 17, scope: !337)
!339 = !DILocation(line: 226, column: 13, scope: !337)
!340 = !DILocation(line: 227, column: 17, scope: !341)
!341 = distinct !DILexicalBlock(scope: !259, file: !30, line: 227, column: 17)
!342 = !DILocation(line: 227, column: 30, scope: !341)
!343 = !DILocation(line: 227, column: 17, scope: !259)
!344 = !DILocation(line: 229, column: 30, scope: !345)
!345 = distinct !DILexicalBlock(scope: !341, file: !30, line: 228, column: 13)
!346 = !DILocation(line: 229, column: 17, scope: !345)
!347 = !DILocation(line: 230, column: 13, scope: !345)
!348 = !DILocation(line: 238, column: 5, scope: !260)
!349 = !DILocation(line: 239, column: 8, scope: !350)
!350 = distinct !DILexicalBlock(scope: !250, file: !30, line: 239, column: 8)
!351 = !DILocation(line: 239, column: 18, scope: !350)
!352 = !DILocation(line: 239, column: 8, scope: !250)
!353 = !DILocation(line: 242, column: 9, scope: !354)
!354 = distinct !DILexicalBlock(scope: !350, file: !30, line: 240, column: 5)
!355 = !DILocation(line: 243, column: 5, scope: !354)
!356 = !DILocalVariable(name: "i", scope: !357, file: !30, line: 247, type: !27)
!357 = distinct !DILexicalBlock(scope: !358, file: !30, line: 246, column: 9)
!358 = distinct !DILexicalBlock(scope: !350, file: !30, line: 245, column: 5)
!359 = !DILocation(line: 247, column: 17, scope: !357)
!360 = !DILocalVariable(name: "buffer", scope: !357, file: !30, line: 248, type: !26)
!361 = !DILocation(line: 248, column: 19, scope: !357)
!362 = !DILocation(line: 248, column: 35, scope: !357)
!363 = !DILocation(line: 248, column: 28, scope: !357)
!364 = !DILocation(line: 249, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !357, file: !30, line: 249, column: 17)
!366 = !DILocation(line: 249, column: 24, scope: !365)
!367 = !DILocation(line: 249, column: 17, scope: !357)
!368 = !DILocation(line: 249, column: 34, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !30, line: 249, column: 33)
!370 = !DILocation(line: 251, column: 20, scope: !371)
!371 = distinct !DILexicalBlock(scope: !357, file: !30, line: 251, column: 13)
!372 = !DILocation(line: 251, column: 18, scope: !371)
!373 = !DILocation(line: 251, column: 25, scope: !374)
!374 = distinct !DILexicalBlock(scope: !371, file: !30, line: 251, column: 13)
!375 = !DILocation(line: 251, column: 27, scope: !374)
!376 = !DILocation(line: 251, column: 13, scope: !371)
!377 = !DILocation(line: 253, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !374, file: !30, line: 252, column: 13)
!379 = !DILocation(line: 253, column: 24, scope: !378)
!380 = !DILocation(line: 253, column: 27, scope: !378)
!381 = !DILocation(line: 254, column: 13, scope: !378)
!382 = !DILocation(line: 251, column: 34, scope: !374)
!383 = !DILocation(line: 251, column: 13, scope: !374)
!384 = distinct !{!384, !376, !385, !193}
!385 = !DILocation(line: 254, column: 13, scope: !371)
!386 = !DILocation(line: 256, column: 17, scope: !387)
!387 = distinct !DILexicalBlock(scope: !357, file: !30, line: 256, column: 17)
!388 = !DILocation(line: 256, column: 22, scope: !387)
!389 = !DILocation(line: 256, column: 27, scope: !387)
!390 = !DILocation(line: 256, column: 30, scope: !387)
!391 = !DILocation(line: 256, column: 35, scope: !387)
!392 = !DILocation(line: 256, column: 17, scope: !357)
!393 = !DILocation(line: 258, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !387, file: !30, line: 257, column: 13)
!395 = !DILocation(line: 258, column: 24, scope: !394)
!396 = !DILocation(line: 258, column: 30, scope: !394)
!397 = !DILocation(line: 260, column: 23, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !30, line: 260, column: 17)
!399 = !DILocation(line: 260, column: 21, scope: !398)
!400 = !DILocation(line: 260, column: 28, scope: !401)
!401 = distinct !DILexicalBlock(scope: !398, file: !30, line: 260, column: 17)
!402 = !DILocation(line: 260, column: 30, scope: !401)
!403 = !DILocation(line: 260, column: 17, scope: !398)
!404 = !DILocation(line: 262, column: 34, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !30, line: 261, column: 17)
!406 = !DILocation(line: 262, column: 41, scope: !405)
!407 = !DILocation(line: 262, column: 21, scope: !405)
!408 = !DILocation(line: 263, column: 17, scope: !405)
!409 = !DILocation(line: 260, column: 37, scope: !401)
!410 = !DILocation(line: 260, column: 17, scope: !401)
!411 = distinct !{!411, !403, !412, !193}
!412 = !DILocation(line: 263, column: 17, scope: !398)
!413 = !DILocation(line: 264, column: 13, scope: !394)
!414 = !DILocation(line: 267, column: 17, scope: !415)
!415 = distinct !DILexicalBlock(scope: !387, file: !30, line: 266, column: 13)
!416 = !DILocation(line: 269, column: 18, scope: !357)
!417 = !DILocation(line: 269, column: 13, scope: !357)
!418 = !DILocation(line: 272, column: 1, scope: !250)
!419 = distinct !DISubprogram(name: "goodB2G2", scope: !30, file: !30, line: 275, type: !39, scopeLine: 276, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !41)
!420 = !DILocalVariable(name: "data", scope: !419, file: !30, line: 277, type: !27)
!421 = !DILocation(line: 277, column: 9, scope: !419)
!422 = !DILocation(line: 279, column: 10, scope: !419)
!423 = !DILocation(line: 280, column: 8, scope: !424)
!424 = distinct !DILexicalBlock(scope: !419, file: !30, line: 280, column: 8)
!425 = !DILocation(line: 280, column: 18, scope: !424)
!426 = !DILocation(line: 280, column: 8, scope: !419)
!427 = !DILocalVariable(name: "recvResult", scope: !428, file: !30, line: 287, type: !27)
!428 = distinct !DILexicalBlock(scope: !429, file: !30, line: 282, column: 9)
!429 = distinct !DILexicalBlock(scope: !424, file: !30, line: 281, column: 5)
!430 = !DILocation(line: 287, column: 17, scope: !428)
!431 = !DILocalVariable(name: "service", scope: !428, file: !30, line: 288, type: !54)
!432 = !DILocation(line: 288, column: 32, scope: !428)
!433 = !DILocalVariable(name: "listenSocket", scope: !428, file: !30, line: 289, type: !27)
!434 = !DILocation(line: 289, column: 20, scope: !428)
!435 = !DILocalVariable(name: "acceptSocket", scope: !428, file: !30, line: 290, type: !27)
!436 = !DILocation(line: 290, column: 20, scope: !428)
!437 = !DILocalVariable(name: "inputBuffer", scope: !428, file: !30, line: 291, type: !22)
!438 = !DILocation(line: 291, column: 18, scope: !428)
!439 = !DILocation(line: 292, column: 13, scope: !428)
!440 = !DILocation(line: 302, column: 32, scope: !441)
!441 = distinct !DILexicalBlock(scope: !428, file: !30, line: 293, column: 13)
!442 = !DILocation(line: 302, column: 30, scope: !441)
!443 = !DILocation(line: 303, column: 21, scope: !444)
!444 = distinct !DILexicalBlock(scope: !441, file: !30, line: 303, column: 21)
!445 = !DILocation(line: 303, column: 34, scope: !444)
!446 = !DILocation(line: 303, column: 21, scope: !441)
!447 = !DILocation(line: 305, column: 21, scope: !448)
!448 = distinct !DILexicalBlock(scope: !444, file: !30, line: 304, column: 17)
!449 = !DILocation(line: 307, column: 17, scope: !441)
!450 = !DILocation(line: 308, column: 25, scope: !441)
!451 = !DILocation(line: 308, column: 36, scope: !441)
!452 = !DILocation(line: 309, column: 25, scope: !441)
!453 = !DILocation(line: 309, column: 34, scope: !441)
!454 = !DILocation(line: 309, column: 41, scope: !441)
!455 = !DILocation(line: 310, column: 25, scope: !441)
!456 = !DILocation(line: 310, column: 34, scope: !441)
!457 = !DILocation(line: 311, column: 26, scope: !458)
!458 = distinct !DILexicalBlock(scope: !441, file: !30, line: 311, column: 21)
!459 = !DILocation(line: 311, column: 40, scope: !458)
!460 = !DILocation(line: 311, column: 21, scope: !458)
!461 = !DILocation(line: 311, column: 85, scope: !458)
!462 = !DILocation(line: 311, column: 21, scope: !441)
!463 = !DILocation(line: 313, column: 21, scope: !464)
!464 = distinct !DILexicalBlock(scope: !458, file: !30, line: 312, column: 17)
!465 = !DILocation(line: 315, column: 28, scope: !466)
!466 = distinct !DILexicalBlock(scope: !441, file: !30, line: 315, column: 21)
!467 = !DILocation(line: 315, column: 21, scope: !466)
!468 = !DILocation(line: 315, column: 58, scope: !466)
!469 = !DILocation(line: 315, column: 21, scope: !441)
!470 = !DILocation(line: 317, column: 21, scope: !471)
!471 = distinct !DILexicalBlock(scope: !466, file: !30, line: 316, column: 17)
!472 = !DILocation(line: 319, column: 39, scope: !441)
!473 = !DILocation(line: 319, column: 32, scope: !441)
!474 = !DILocation(line: 319, column: 30, scope: !441)
!475 = !DILocation(line: 320, column: 21, scope: !476)
!476 = distinct !DILexicalBlock(scope: !441, file: !30, line: 320, column: 21)
!477 = !DILocation(line: 320, column: 34, scope: !476)
!478 = !DILocation(line: 320, column: 21, scope: !441)
!479 = !DILocation(line: 322, column: 21, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !30, line: 321, column: 17)
!481 = !DILocation(line: 325, column: 35, scope: !441)
!482 = !DILocation(line: 325, column: 49, scope: !441)
!483 = !DILocation(line: 325, column: 30, scope: !441)
!484 = !DILocation(line: 325, column: 28, scope: !441)
!485 = !DILocation(line: 326, column: 21, scope: !486)
!486 = distinct !DILexicalBlock(scope: !441, file: !30, line: 326, column: 21)
!487 = !DILocation(line: 326, column: 32, scope: !486)
!488 = !DILocation(line: 326, column: 48, scope: !486)
!489 = !DILocation(line: 326, column: 51, scope: !486)
!490 = !DILocation(line: 326, column: 62, scope: !486)
!491 = !DILocation(line: 326, column: 21, scope: !441)
!492 = !DILocation(line: 328, column: 21, scope: !493)
!493 = distinct !DILexicalBlock(scope: !486, file: !30, line: 327, column: 17)
!494 = !DILocation(line: 331, column: 29, scope: !441)
!495 = !DILocation(line: 331, column: 17, scope: !441)
!496 = !DILocation(line: 331, column: 41, scope: !441)
!497 = !DILocation(line: 333, column: 29, scope: !441)
!498 = !DILocation(line: 333, column: 24, scope: !441)
!499 = !DILocation(line: 333, column: 22, scope: !441)
!500 = !DILocation(line: 334, column: 13, scope: !441)
!501 = !DILocation(line: 336, column: 17, scope: !502)
!502 = distinct !DILexicalBlock(scope: !428, file: !30, line: 336, column: 17)
!503 = !DILocation(line: 336, column: 30, scope: !502)
!504 = !DILocation(line: 336, column: 17, scope: !428)
!505 = !DILocation(line: 338, column: 30, scope: !506)
!506 = distinct !DILexicalBlock(scope: !502, file: !30, line: 337, column: 13)
!507 = !DILocation(line: 338, column: 17, scope: !506)
!508 = !DILocation(line: 339, column: 13, scope: !506)
!509 = !DILocation(line: 340, column: 17, scope: !510)
!510 = distinct !DILexicalBlock(scope: !428, file: !30, line: 340, column: 17)
!511 = !DILocation(line: 340, column: 30, scope: !510)
!512 = !DILocation(line: 340, column: 17, scope: !428)
!513 = !DILocation(line: 342, column: 30, scope: !514)
!514 = distinct !DILexicalBlock(scope: !510, file: !30, line: 341, column: 13)
!515 = !DILocation(line: 342, column: 17, scope: !514)
!516 = !DILocation(line: 343, column: 13, scope: !514)
!517 = !DILocation(line: 351, column: 5, scope: !429)
!518 = !DILocation(line: 352, column: 8, scope: !519)
!519 = distinct !DILexicalBlock(scope: !419, file: !30, line: 352, column: 8)
!520 = !DILocation(line: 352, column: 18, scope: !519)
!521 = !DILocation(line: 352, column: 8, scope: !419)
!522 = !DILocalVariable(name: "i", scope: !523, file: !30, line: 355, type: !27)
!523 = distinct !DILexicalBlock(scope: !524, file: !30, line: 354, column: 9)
!524 = distinct !DILexicalBlock(scope: !519, file: !30, line: 353, column: 5)
!525 = !DILocation(line: 355, column: 17, scope: !523)
!526 = !DILocalVariable(name: "buffer", scope: !523, file: !30, line: 356, type: !26)
!527 = !DILocation(line: 356, column: 19, scope: !523)
!528 = !DILocation(line: 356, column: 35, scope: !523)
!529 = !DILocation(line: 356, column: 28, scope: !523)
!530 = !DILocation(line: 357, column: 17, scope: !531)
!531 = distinct !DILexicalBlock(scope: !523, file: !30, line: 357, column: 17)
!532 = !DILocation(line: 357, column: 24, scope: !531)
!533 = !DILocation(line: 357, column: 17, scope: !523)
!534 = !DILocation(line: 357, column: 34, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !30, line: 357, column: 33)
!536 = !DILocation(line: 359, column: 20, scope: !537)
!537 = distinct !DILexicalBlock(scope: !523, file: !30, line: 359, column: 13)
!538 = !DILocation(line: 359, column: 18, scope: !537)
!539 = !DILocation(line: 359, column: 25, scope: !540)
!540 = distinct !DILexicalBlock(scope: !537, file: !30, line: 359, column: 13)
!541 = !DILocation(line: 359, column: 27, scope: !540)
!542 = !DILocation(line: 359, column: 13, scope: !537)
!543 = !DILocation(line: 361, column: 17, scope: !544)
!544 = distinct !DILexicalBlock(scope: !540, file: !30, line: 360, column: 13)
!545 = !DILocation(line: 361, column: 24, scope: !544)
!546 = !DILocation(line: 361, column: 27, scope: !544)
!547 = !DILocation(line: 362, column: 13, scope: !544)
!548 = !DILocation(line: 359, column: 34, scope: !540)
!549 = !DILocation(line: 359, column: 13, scope: !540)
!550 = distinct !{!550, !542, !551, !193}
!551 = !DILocation(line: 362, column: 13, scope: !537)
!552 = !DILocation(line: 364, column: 17, scope: !553)
!553 = distinct !DILexicalBlock(scope: !523, file: !30, line: 364, column: 17)
!554 = !DILocation(line: 364, column: 22, scope: !553)
!555 = !DILocation(line: 364, column: 27, scope: !553)
!556 = !DILocation(line: 364, column: 30, scope: !553)
!557 = !DILocation(line: 364, column: 35, scope: !553)
!558 = !DILocation(line: 364, column: 17, scope: !523)
!559 = !DILocation(line: 366, column: 17, scope: !560)
!560 = distinct !DILexicalBlock(scope: !553, file: !30, line: 365, column: 13)
!561 = !DILocation(line: 366, column: 24, scope: !560)
!562 = !DILocation(line: 366, column: 30, scope: !560)
!563 = !DILocation(line: 368, column: 23, scope: !564)
!564 = distinct !DILexicalBlock(scope: !560, file: !30, line: 368, column: 17)
!565 = !DILocation(line: 368, column: 21, scope: !564)
!566 = !DILocation(line: 368, column: 28, scope: !567)
!567 = distinct !DILexicalBlock(scope: !564, file: !30, line: 368, column: 17)
!568 = !DILocation(line: 368, column: 30, scope: !567)
!569 = !DILocation(line: 368, column: 17, scope: !564)
!570 = !DILocation(line: 370, column: 34, scope: !571)
!571 = distinct !DILexicalBlock(scope: !567, file: !30, line: 369, column: 17)
!572 = !DILocation(line: 370, column: 41, scope: !571)
!573 = !DILocation(line: 370, column: 21, scope: !571)
!574 = !DILocation(line: 371, column: 17, scope: !571)
!575 = !DILocation(line: 368, column: 37, scope: !567)
!576 = !DILocation(line: 368, column: 17, scope: !567)
!577 = distinct !{!577, !569, !578, !193}
!578 = !DILocation(line: 371, column: 17, scope: !564)
!579 = !DILocation(line: 372, column: 13, scope: !560)
!580 = !DILocation(line: 375, column: 17, scope: !581)
!581 = distinct !DILexicalBlock(scope: !553, file: !30, line: 374, column: 13)
!582 = !DILocation(line: 377, column: 18, scope: !523)
!583 = !DILocation(line: 377, column: 13, scope: !523)
!584 = !DILocation(line: 379, column: 5, scope: !524)
!585 = !DILocation(line: 380, column: 1, scope: !419)
!586 = distinct !DISubprogram(name: "goodG2B1", scope: !30, file: !30, line: 383, type: !39, scopeLine: 384, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !41)
!587 = !DILocalVariable(name: "data", scope: !586, file: !30, line: 385, type: !27)
!588 = !DILocation(line: 385, column: 9, scope: !586)
!589 = !DILocation(line: 387, column: 10, scope: !586)
!590 = !DILocation(line: 388, column: 8, scope: !591)
!591 = distinct !DILexicalBlock(scope: !586, file: !30, line: 388, column: 8)
!592 = !DILocation(line: 388, column: 18, scope: !591)
!593 = !DILocation(line: 388, column: 8, scope: !586)
!594 = !DILocation(line: 391, column: 9, scope: !595)
!595 = distinct !DILexicalBlock(scope: !591, file: !30, line: 389, column: 5)
!596 = !DILocation(line: 392, column: 5, scope: !595)
!597 = !DILocation(line: 397, column: 14, scope: !598)
!598 = distinct !DILexicalBlock(scope: !591, file: !30, line: 394, column: 5)
!599 = !DILocation(line: 399, column: 8, scope: !600)
!600 = distinct !DILexicalBlock(scope: !586, file: !30, line: 399, column: 8)
!601 = !DILocation(line: 399, column: 18, scope: !600)
!602 = !DILocation(line: 399, column: 8, scope: !586)
!603 = !DILocalVariable(name: "i", scope: !604, file: !30, line: 402, type: !27)
!604 = distinct !DILexicalBlock(scope: !605, file: !30, line: 401, column: 9)
!605 = distinct !DILexicalBlock(scope: !600, file: !30, line: 400, column: 5)
!606 = !DILocation(line: 402, column: 17, scope: !604)
!607 = !DILocalVariable(name: "buffer", scope: !604, file: !30, line: 403, type: !26)
!608 = !DILocation(line: 403, column: 19, scope: !604)
!609 = !DILocation(line: 403, column: 35, scope: !604)
!610 = !DILocation(line: 403, column: 28, scope: !604)
!611 = !DILocation(line: 404, column: 17, scope: !612)
!612 = distinct !DILexicalBlock(scope: !604, file: !30, line: 404, column: 17)
!613 = !DILocation(line: 404, column: 24, scope: !612)
!614 = !DILocation(line: 404, column: 17, scope: !604)
!615 = !DILocation(line: 404, column: 34, scope: !616)
!616 = distinct !DILexicalBlock(scope: !612, file: !30, line: 404, column: 33)
!617 = !DILocation(line: 406, column: 20, scope: !618)
!618 = distinct !DILexicalBlock(scope: !604, file: !30, line: 406, column: 13)
!619 = !DILocation(line: 406, column: 18, scope: !618)
!620 = !DILocation(line: 406, column: 25, scope: !621)
!621 = distinct !DILexicalBlock(scope: !618, file: !30, line: 406, column: 13)
!622 = !DILocation(line: 406, column: 27, scope: !621)
!623 = !DILocation(line: 406, column: 13, scope: !618)
!624 = !DILocation(line: 408, column: 17, scope: !625)
!625 = distinct !DILexicalBlock(scope: !621, file: !30, line: 407, column: 13)
!626 = !DILocation(line: 408, column: 24, scope: !625)
!627 = !DILocation(line: 408, column: 27, scope: !625)
!628 = !DILocation(line: 409, column: 13, scope: !625)
!629 = !DILocation(line: 406, column: 34, scope: !621)
!630 = !DILocation(line: 406, column: 13, scope: !621)
!631 = distinct !{!631, !623, !632, !193}
!632 = !DILocation(line: 409, column: 13, scope: !618)
!633 = !DILocation(line: 412, column: 17, scope: !634)
!634 = distinct !DILexicalBlock(scope: !604, file: !30, line: 412, column: 17)
!635 = !DILocation(line: 412, column: 22, scope: !634)
!636 = !DILocation(line: 412, column: 17, scope: !604)
!637 = !DILocation(line: 414, column: 17, scope: !638)
!638 = distinct !DILexicalBlock(scope: !634, file: !30, line: 413, column: 13)
!639 = !DILocation(line: 414, column: 24, scope: !638)
!640 = !DILocation(line: 414, column: 30, scope: !638)
!641 = !DILocation(line: 416, column: 23, scope: !642)
!642 = distinct !DILexicalBlock(scope: !638, file: !30, line: 416, column: 17)
!643 = !DILocation(line: 416, column: 21, scope: !642)
!644 = !DILocation(line: 416, column: 28, scope: !645)
!645 = distinct !DILexicalBlock(scope: !642, file: !30, line: 416, column: 17)
!646 = !DILocation(line: 416, column: 30, scope: !645)
!647 = !DILocation(line: 416, column: 17, scope: !642)
!648 = !DILocation(line: 418, column: 34, scope: !649)
!649 = distinct !DILexicalBlock(scope: !645, file: !30, line: 417, column: 17)
!650 = !DILocation(line: 418, column: 41, scope: !649)
!651 = !DILocation(line: 418, column: 21, scope: !649)
!652 = !DILocation(line: 419, column: 17, scope: !649)
!653 = !DILocation(line: 416, column: 37, scope: !645)
!654 = !DILocation(line: 416, column: 17, scope: !645)
!655 = distinct !{!655, !647, !656, !193}
!656 = !DILocation(line: 419, column: 17, scope: !642)
!657 = !DILocation(line: 420, column: 13, scope: !638)
!658 = !DILocation(line: 423, column: 17, scope: !659)
!659 = distinct !DILexicalBlock(scope: !634, file: !30, line: 422, column: 13)
!660 = !DILocation(line: 425, column: 18, scope: !604)
!661 = !DILocation(line: 425, column: 13, scope: !604)
!662 = !DILocation(line: 427, column: 5, scope: !605)
!663 = !DILocation(line: 428, column: 1, scope: !586)
!664 = distinct !DISubprogram(name: "goodG2B2", scope: !30, file: !30, line: 431, type: !39, scopeLine: 432, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !41)
!665 = !DILocalVariable(name: "data", scope: !664, file: !30, line: 433, type: !27)
!666 = !DILocation(line: 433, column: 9, scope: !664)
!667 = !DILocation(line: 435, column: 10, scope: !664)
!668 = !DILocation(line: 436, column: 8, scope: !669)
!669 = distinct !DILexicalBlock(scope: !664, file: !30, line: 436, column: 8)
!670 = !DILocation(line: 436, column: 18, scope: !669)
!671 = !DILocation(line: 436, column: 8, scope: !664)
!672 = !DILocation(line: 440, column: 14, scope: !673)
!673 = distinct !DILexicalBlock(scope: !669, file: !30, line: 437, column: 5)
!674 = !DILocation(line: 441, column: 5, scope: !673)
!675 = !DILocation(line: 442, column: 8, scope: !676)
!676 = distinct !DILexicalBlock(scope: !664, file: !30, line: 442, column: 8)
!677 = !DILocation(line: 442, column: 18, scope: !676)
!678 = !DILocation(line: 442, column: 8, scope: !664)
!679 = !DILocalVariable(name: "i", scope: !680, file: !30, line: 445, type: !27)
!680 = distinct !DILexicalBlock(scope: !681, file: !30, line: 444, column: 9)
!681 = distinct !DILexicalBlock(scope: !676, file: !30, line: 443, column: 5)
!682 = !DILocation(line: 445, column: 17, scope: !680)
!683 = !DILocalVariable(name: "buffer", scope: !680, file: !30, line: 446, type: !26)
!684 = !DILocation(line: 446, column: 19, scope: !680)
!685 = !DILocation(line: 446, column: 35, scope: !680)
!686 = !DILocation(line: 446, column: 28, scope: !680)
!687 = !DILocation(line: 447, column: 17, scope: !688)
!688 = distinct !DILexicalBlock(scope: !680, file: !30, line: 447, column: 17)
!689 = !DILocation(line: 447, column: 24, scope: !688)
!690 = !DILocation(line: 447, column: 17, scope: !680)
!691 = !DILocation(line: 447, column: 34, scope: !692)
!692 = distinct !DILexicalBlock(scope: !688, file: !30, line: 447, column: 33)
!693 = !DILocation(line: 449, column: 20, scope: !694)
!694 = distinct !DILexicalBlock(scope: !680, file: !30, line: 449, column: 13)
!695 = !DILocation(line: 449, column: 18, scope: !694)
!696 = !DILocation(line: 449, column: 25, scope: !697)
!697 = distinct !DILexicalBlock(scope: !694, file: !30, line: 449, column: 13)
!698 = !DILocation(line: 449, column: 27, scope: !697)
!699 = !DILocation(line: 449, column: 13, scope: !694)
!700 = !DILocation(line: 451, column: 17, scope: !701)
!701 = distinct !DILexicalBlock(scope: !697, file: !30, line: 450, column: 13)
!702 = !DILocation(line: 451, column: 24, scope: !701)
!703 = !DILocation(line: 451, column: 27, scope: !701)
!704 = !DILocation(line: 452, column: 13, scope: !701)
!705 = !DILocation(line: 449, column: 34, scope: !697)
!706 = !DILocation(line: 449, column: 13, scope: !697)
!707 = distinct !{!707, !699, !708, !193}
!708 = !DILocation(line: 452, column: 13, scope: !694)
!709 = !DILocation(line: 455, column: 17, scope: !710)
!710 = distinct !DILexicalBlock(scope: !680, file: !30, line: 455, column: 17)
!711 = !DILocation(line: 455, column: 22, scope: !710)
!712 = !DILocation(line: 455, column: 17, scope: !680)
!713 = !DILocation(line: 457, column: 17, scope: !714)
!714 = distinct !DILexicalBlock(scope: !710, file: !30, line: 456, column: 13)
!715 = !DILocation(line: 457, column: 24, scope: !714)
!716 = !DILocation(line: 457, column: 30, scope: !714)
!717 = !DILocation(line: 459, column: 23, scope: !718)
!718 = distinct !DILexicalBlock(scope: !714, file: !30, line: 459, column: 17)
!719 = !DILocation(line: 459, column: 21, scope: !718)
!720 = !DILocation(line: 459, column: 28, scope: !721)
!721 = distinct !DILexicalBlock(scope: !718, file: !30, line: 459, column: 17)
!722 = !DILocation(line: 459, column: 30, scope: !721)
!723 = !DILocation(line: 459, column: 17, scope: !718)
!724 = !DILocation(line: 461, column: 34, scope: !725)
!725 = distinct !DILexicalBlock(scope: !721, file: !30, line: 460, column: 17)
!726 = !DILocation(line: 461, column: 41, scope: !725)
!727 = !DILocation(line: 461, column: 21, scope: !725)
!728 = !DILocation(line: 462, column: 17, scope: !725)
!729 = !DILocation(line: 459, column: 37, scope: !721)
!730 = !DILocation(line: 459, column: 17, scope: !721)
!731 = distinct !{!731, !723, !732, !193}
!732 = !DILocation(line: 462, column: 17, scope: !718)
!733 = !DILocation(line: 463, column: 13, scope: !714)
!734 = !DILocation(line: 466, column: 17, scope: !735)
!735 = distinct !DILexicalBlock(scope: !710, file: !30, line: 465, column: 13)
!736 = !DILocation(line: 468, column: 18, scope: !680)
!737 = !DILocation(line: 468, column: 13, scope: !680)
!738 = !DILocation(line: 470, column: 5, scope: !681)
!739 = !DILocation(line: 471, column: 1, scope: !664)
