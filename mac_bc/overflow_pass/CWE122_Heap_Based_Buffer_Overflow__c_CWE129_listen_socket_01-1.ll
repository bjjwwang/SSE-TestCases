; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01-1.c"
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
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_bad() #0 !dbg !34 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !42, metadata !DIExpression()), !dbg !44
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !150, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !153, metadata !DIExpression()), !dbg !154
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !155
  %15 = bitcast i8* %call32 to i32*, !dbg !156
  store i32* %15, i32** %buffer, align 8, !dbg !154
  %16 = load i32*, i32** %buffer, align 8, !dbg !157
  %cmp33 = icmp eq i32* %16, null, !dbg !159
  br i1 %cmp33, label %if.then35, label %if.end36, !dbg !160

if.then35:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !161
  unreachable, !dbg !161

if.end36:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !163
  br label %for.cond, !dbg !165

for.cond:                                         ; preds = %for.inc, %if.end36
  %17 = load i32, i32* %i, align 4, !dbg !166
  %cmp37 = icmp slt i32 %17, 10, !dbg !168
  br i1 %cmp37, label %for.body, label %for.end, !dbg !169

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !170
  %19 = load i32, i32* %i, align 4, !dbg !172
  %idxprom39 = sext i32 %19 to i64, !dbg !170
  %arrayidx40 = getelementptr inbounds i32, i32* %18, i64 %idxprom39, !dbg !170
  store i32 0, i32* %arrayidx40, align 4, !dbg !173
  br label %for.inc, !dbg !174

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !175
  %inc = add nsw i32 %20, 1, !dbg !175
  store i32 %inc, i32* %i, align 4, !dbg !175
  br label %for.cond, !dbg !176, !llvm.loop !177

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !180
  %cmp41 = icmp sge i32 %21, 0, !dbg !182
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !183

if.then43:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !184
  %23 = load i32, i32* %data, align 4, !dbg !186
  %idxprom44 = sext i32 %23 to i64, !dbg !184
  %arrayidx45 = getelementptr inbounds i32, i32* %22, i64 %idxprom44, !dbg !184
  store i32 1, i32* %arrayidx45, align 4, !dbg !187
  store i32 0, i32* %i, align 4, !dbg !188
  br label %for.cond46, !dbg !190

for.cond46:                                       ; preds = %for.inc52, %if.then43
  %24 = load i32, i32* %i, align 4, !dbg !191
  %cmp47 = icmp slt i32 %24, 10, !dbg !193
  br i1 %cmp47, label %for.body49, label %for.end54, !dbg !194

for.body49:                                       ; preds = %for.cond46
  %25 = load i32*, i32** %buffer, align 8, !dbg !195
  %26 = load i32, i32* %i, align 4, !dbg !197
  %idxprom50 = sext i32 %26 to i64, !dbg !195
  %arrayidx51 = getelementptr inbounds i32, i32* %25, i64 %idxprom50, !dbg !195
  %27 = load i32, i32* %arrayidx51, align 4, !dbg !195
  call void @printIntLine(i32 noundef %27), !dbg !198
  br label %for.inc52, !dbg !199

for.inc52:                                        ; preds = %for.body49
  %28 = load i32, i32* %i, align 4, !dbg !200
  %inc53 = add nsw i32 %28, 1, !dbg !200
  store i32 %inc53, i32* %i, align 4, !dbg !200
  br label %for.cond46, !dbg !201, !llvm.loop !202

for.end54:                                        ; preds = %for.cond46
  br label %if.end55, !dbg !204

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !205
  br label %if.end55

if.end55:                                         ; preds = %if.else, %for.end54
  %29 = load i32*, i32** %buffer, align 8, !dbg !207
  %30 = bitcast i32* %29 to i8*, !dbg !207
  call void @free(i8* noundef %30), !dbg !208
  ret void, !dbg !209
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_good() #0 !dbg !210 {
entry:
  call void @goodG2B(), !dbg !211
  call void @goodB2G(), !dbg !212
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !214 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !219, metadata !DIExpression()), !dbg !220
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !221, metadata !DIExpression()), !dbg !222
  %call = call i64 @time(i64* noundef null), !dbg !223
  %conv = trunc i64 %call to i32, !dbg !224
  call void @srand(i32 noundef %conv), !dbg !225
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !226
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_good(), !dbg !227
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !228
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !229
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_bad(), !dbg !230
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !231
  ret i32 0, !dbg !232
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !233 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !234, metadata !DIExpression()), !dbg !235
  store i32 -1, i32* %data, align 4, !dbg !236
  store i32 7, i32* %data, align 4, !dbg !237
  call void @llvm.dbg.declare(metadata i32* %i, metadata !238, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !241, metadata !DIExpression()), !dbg !242
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !243
  %0 = bitcast i8* %call to i32*, !dbg !244
  store i32* %0, i32** %buffer, align 8, !dbg !242
  %1 = load i32*, i32** %buffer, align 8, !dbg !245
  %cmp = icmp eq i32* %1, null, !dbg !247
  br i1 %cmp, label %if.then, label %if.end, !dbg !248

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !249
  unreachable, !dbg !249

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !251
  br label %for.cond, !dbg !253

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !254
  %cmp1 = icmp slt i32 %2, 10, !dbg !256
  br i1 %cmp1, label %for.body, label %for.end, !dbg !257

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !258
  %4 = load i32, i32* %i, align 4, !dbg !260
  %idxprom = sext i32 %4 to i64, !dbg !258
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !258
  store i32 0, i32* %arrayidx, align 4, !dbg !261
  br label %for.inc, !dbg !262

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !263
  %inc = add nsw i32 %5, 1, !dbg !263
  store i32 %inc, i32* %i, align 4, !dbg !263
  br label %for.cond, !dbg !264, !llvm.loop !265

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !267
  %cmp2 = icmp sge i32 %6, 0, !dbg !269
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !270

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !271
  %8 = load i32, i32* %data, align 4, !dbg !273
  %idxprom4 = sext i32 %8 to i64, !dbg !271
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !271
  store i32 1, i32* %arrayidx5, align 4, !dbg !274
  store i32 0, i32* %i, align 4, !dbg !275
  br label %for.cond6, !dbg !277

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !278
  %cmp7 = icmp slt i32 %9, 10, !dbg !280
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !281

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !282
  %11 = load i32, i32* %i, align 4, !dbg !284
  %idxprom9 = sext i32 %11 to i64, !dbg !282
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !282
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !282
  call void @printIntLine(i32 noundef %12), !dbg !285
  br label %for.inc11, !dbg !286

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !287
  %inc12 = add nsw i32 %13, 1, !dbg !287
  store i32 %inc12, i32* %i, align 4, !dbg !287
  br label %for.cond6, !dbg !288, !llvm.loop !289

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !291

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !292
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !294
  %15 = bitcast i32* %14 to i8*, !dbg !294
  call void @free(i8* noundef %15), !dbg !295
  ret void, !dbg !296
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !297 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !298, metadata !DIExpression()), !dbg !299
  store i32 -1, i32* %data, align 4, !dbg !300
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !301, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !304, metadata !DIExpression()), !dbg !305
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !306, metadata !DIExpression()), !dbg !307
  store i32 -1, i32* %listenSocket, align 4, !dbg !307
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !308, metadata !DIExpression()), !dbg !309
  store i32 -1, i32* %acceptSocket, align 4, !dbg !309
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !310, metadata !DIExpression()), !dbg !311
  br label %do.body, !dbg !312

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !313
  store i32 %call, i32* %listenSocket, align 4, !dbg !315
  %0 = load i32, i32* %listenSocket, align 4, !dbg !316
  %cmp = icmp eq i32 %0, -1, !dbg !318
  br i1 %cmp, label %if.then, label %if.end, !dbg !319

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !320

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !322
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !322
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !323
  store i8 2, i8* %sin_family, align 1, !dbg !324
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !325
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !326
  store i32 0, i32* %s_addr, align 4, !dbg !327
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !328
  store i16 -30871, i16* %sin_port, align 2, !dbg !329
  %2 = load i32, i32* %listenSocket, align 4, !dbg !330
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !332
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !333
  %cmp2 = icmp eq i32 %call1, -1, !dbg !334
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !335

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !336

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !338
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !340
  %cmp6 = icmp eq i32 %call5, -1, !dbg !341
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !342

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !343

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !345
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !346
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !347
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !348
  %cmp10 = icmp eq i32 %6, -1, !dbg !350
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !351

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !352

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !354
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !355
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !356
  %conv = trunc i64 %call13 to i32, !dbg !356
  store i32 %conv, i32* %recvResult, align 4, !dbg !357
  %8 = load i32, i32* %recvResult, align 4, !dbg !358
  %cmp14 = icmp eq i32 %8, -1, !dbg !360
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !361

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !362
  %cmp16 = icmp eq i32 %9, 0, !dbg !363
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !364

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !365

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !367
  %idxprom = sext i32 %10 to i64, !dbg !368
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !368
  store i8 0, i8* %arrayidx, align 1, !dbg !369
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !370
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !371
  store i32 %call21, i32* %data, align 4, !dbg !372
  br label %do.end, !dbg !373

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !374
  %cmp22 = icmp ne i32 %11, -1, !dbg !376
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !377

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !378
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !380
  br label %if.end26, !dbg !381

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !382
  %cmp27 = icmp ne i32 %13, -1, !dbg !384
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !385

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !386
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !388
  br label %if.end31, !dbg !389

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !390, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !393, metadata !DIExpression()), !dbg !394
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !395
  %15 = bitcast i8* %call32 to i32*, !dbg !396
  store i32* %15, i32** %buffer, align 8, !dbg !394
  %16 = load i32*, i32** %buffer, align 8, !dbg !397
  %cmp33 = icmp eq i32* %16, null, !dbg !399
  br i1 %cmp33, label %if.then35, label %if.end36, !dbg !400

if.then35:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !401
  unreachable, !dbg !401

if.end36:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !403
  br label %for.cond, !dbg !405

for.cond:                                         ; preds = %for.inc, %if.end36
  %17 = load i32, i32* %i, align 4, !dbg !406
  %cmp37 = icmp slt i32 %17, 10, !dbg !408
  br i1 %cmp37, label %for.body, label %for.end, !dbg !409

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !410
  %19 = load i32, i32* %i, align 4, !dbg !412
  %idxprom39 = sext i32 %19 to i64, !dbg !410
  %arrayidx40 = getelementptr inbounds i32, i32* %18, i64 %idxprom39, !dbg !410
  store i32 0, i32* %arrayidx40, align 4, !dbg !413
  br label %for.inc, !dbg !414

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !415
  %inc = add nsw i32 %20, 1, !dbg !415
  store i32 %inc, i32* %i, align 4, !dbg !415
  br label %for.cond, !dbg !416, !llvm.loop !417

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !419
  %cmp41 = icmp sge i32 %21, 0, !dbg !421
  br i1 %cmp41, label %land.lhs.true, label %if.else, !dbg !422

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !423
  %cmp43 = icmp slt i32 %22, 10, !dbg !424
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !425

if.then45:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !426
  %24 = load i32, i32* %data, align 4, !dbg !428
  %idxprom46 = sext i32 %24 to i64, !dbg !426
  %arrayidx47 = getelementptr inbounds i32, i32* %23, i64 %idxprom46, !dbg !426
  store i32 1, i32* %arrayidx47, align 4, !dbg !429
  store i32 0, i32* %i, align 4, !dbg !430
  br label %for.cond48, !dbg !432

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %25 = load i32, i32* %i, align 4, !dbg !433
  %cmp49 = icmp slt i32 %25, 10, !dbg !435
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !436

for.body51:                                       ; preds = %for.cond48
  %26 = load i32*, i32** %buffer, align 8, !dbg !437
  %27 = load i32, i32* %i, align 4, !dbg !439
  %idxprom52 = sext i32 %27 to i64, !dbg !437
  %arrayidx53 = getelementptr inbounds i32, i32* %26, i64 %idxprom52, !dbg !437
  %28 = load i32, i32* %arrayidx53, align 4, !dbg !437
  call void @printIntLine(i32 noundef %28), !dbg !440
  br label %for.inc54, !dbg !441

for.inc54:                                        ; preds = %for.body51
  %29 = load i32, i32* %i, align 4, !dbg !442
  %inc55 = add nsw i32 %29, 1, !dbg !442
  store i32 %inc55, i32* %i, align 4, !dbg !442
  br label %for.cond48, !dbg !443, !llvm.loop !444

for.end56:                                        ; preds = %for.cond48
  br label %if.end57, !dbg !446

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !447
  br label %if.end57

if.end57:                                         ; preds = %if.else, %for.end56
  %30 = load i32*, i32** %buffer, align 8, !dbg !449
  %31 = bitcast i32* %30 to i8*, !dbg !449
  call void @free(i8* noundef %31), !dbg !450
  ret void, !dbg !451
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_bad", scope: !35, file: !35, line: 44, type: !36, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!35 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !{}
!39 = !DILocalVariable(name: "data", scope: !34, file: !35, line: 46, type: !25)
!40 = !DILocation(line: 46, column: 9, scope: !34)
!41 = !DILocation(line: 48, column: 10, scope: !34)
!42 = !DILocalVariable(name: "recvResult", scope: !43, file: !35, line: 54, type: !25)
!43 = distinct !DILexicalBlock(scope: !34, file: !35, line: 49, column: 5)
!44 = !DILocation(line: 54, column: 13, scope: !43)
!45 = !DILocalVariable(name: "service", scope: !43, file: !35, line: 55, type: !46)
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
!65 = !DILocation(line: 55, column: 28, scope: !43)
!66 = !DILocalVariable(name: "listenSocket", scope: !43, file: !35, line: 56, type: !25)
!67 = !DILocation(line: 56, column: 16, scope: !43)
!68 = !DILocalVariable(name: "acceptSocket", scope: !43, file: !35, line: 57, type: !25)
!69 = !DILocation(line: 57, column: 16, scope: !43)
!70 = !DILocalVariable(name: "inputBuffer", scope: !43, file: !35, line: 58, type: !20)
!71 = !DILocation(line: 58, column: 14, scope: !43)
!72 = !DILocation(line: 59, column: 9, scope: !43)
!73 = !DILocation(line: 69, column: 28, scope: !74)
!74 = distinct !DILexicalBlock(scope: !43, file: !35, line: 60, column: 9)
!75 = !DILocation(line: 69, column: 26, scope: !74)
!76 = !DILocation(line: 70, column: 17, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !35, line: 70, column: 17)
!78 = !DILocation(line: 70, column: 30, scope: !77)
!79 = !DILocation(line: 70, column: 17, scope: !74)
!80 = !DILocation(line: 72, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !35, line: 71, column: 13)
!82 = !DILocation(line: 74, column: 13, scope: !74)
!83 = !DILocation(line: 75, column: 21, scope: !74)
!84 = !DILocation(line: 75, column: 32, scope: !74)
!85 = !DILocation(line: 76, column: 21, scope: !74)
!86 = !DILocation(line: 76, column: 30, scope: !74)
!87 = !DILocation(line: 76, column: 37, scope: !74)
!88 = !DILocation(line: 77, column: 21, scope: !74)
!89 = !DILocation(line: 77, column: 30, scope: !74)
!90 = !DILocation(line: 78, column: 22, scope: !91)
!91 = distinct !DILexicalBlock(scope: !74, file: !35, line: 78, column: 17)
!92 = !DILocation(line: 78, column: 36, scope: !91)
!93 = !DILocation(line: 78, column: 17, scope: !91)
!94 = !DILocation(line: 78, column: 81, scope: !91)
!95 = !DILocation(line: 78, column: 17, scope: !74)
!96 = !DILocation(line: 80, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !35, line: 79, column: 13)
!98 = !DILocation(line: 82, column: 24, scope: !99)
!99 = distinct !DILexicalBlock(scope: !74, file: !35, line: 82, column: 17)
!100 = !DILocation(line: 82, column: 17, scope: !99)
!101 = !DILocation(line: 82, column: 54, scope: !99)
!102 = !DILocation(line: 82, column: 17, scope: !74)
!103 = !DILocation(line: 84, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !99, file: !35, line: 83, column: 13)
!105 = !DILocation(line: 86, column: 35, scope: !74)
!106 = !DILocation(line: 86, column: 28, scope: !74)
!107 = !DILocation(line: 86, column: 26, scope: !74)
!108 = !DILocation(line: 87, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !74, file: !35, line: 87, column: 17)
!110 = !DILocation(line: 87, column: 30, scope: !109)
!111 = !DILocation(line: 87, column: 17, scope: !74)
!112 = !DILocation(line: 89, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !35, line: 88, column: 13)
!114 = !DILocation(line: 92, column: 31, scope: !74)
!115 = !DILocation(line: 92, column: 45, scope: !74)
!116 = !DILocation(line: 92, column: 26, scope: !74)
!117 = !DILocation(line: 92, column: 24, scope: !74)
!118 = !DILocation(line: 93, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !74, file: !35, line: 93, column: 17)
!120 = !DILocation(line: 93, column: 28, scope: !119)
!121 = !DILocation(line: 93, column: 44, scope: !119)
!122 = !DILocation(line: 93, column: 47, scope: !119)
!123 = !DILocation(line: 93, column: 58, scope: !119)
!124 = !DILocation(line: 93, column: 17, scope: !74)
!125 = !DILocation(line: 95, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !119, file: !35, line: 94, column: 13)
!127 = !DILocation(line: 98, column: 25, scope: !74)
!128 = !DILocation(line: 98, column: 13, scope: !74)
!129 = !DILocation(line: 98, column: 37, scope: !74)
!130 = !DILocation(line: 100, column: 25, scope: !74)
!131 = !DILocation(line: 100, column: 20, scope: !74)
!132 = !DILocation(line: 100, column: 18, scope: !74)
!133 = !DILocation(line: 101, column: 9, scope: !74)
!134 = !DILocation(line: 103, column: 13, scope: !135)
!135 = distinct !DILexicalBlock(scope: !43, file: !35, line: 103, column: 13)
!136 = !DILocation(line: 103, column: 26, scope: !135)
!137 = !DILocation(line: 103, column: 13, scope: !43)
!138 = !DILocation(line: 105, column: 26, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !35, line: 104, column: 9)
!140 = !DILocation(line: 105, column: 13, scope: !139)
!141 = !DILocation(line: 106, column: 9, scope: !139)
!142 = !DILocation(line: 107, column: 13, scope: !143)
!143 = distinct !DILexicalBlock(scope: !43, file: !35, line: 107, column: 13)
!144 = !DILocation(line: 107, column: 26, scope: !143)
!145 = !DILocation(line: 107, column: 13, scope: !43)
!146 = !DILocation(line: 109, column: 26, scope: !147)
!147 = distinct !DILexicalBlock(scope: !143, file: !35, line: 108, column: 9)
!148 = !DILocation(line: 109, column: 13, scope: !147)
!149 = !DILocation(line: 110, column: 9, scope: !147)
!150 = !DILocalVariable(name: "i", scope: !151, file: !35, line: 119, type: !25)
!151 = distinct !DILexicalBlock(scope: !34, file: !35, line: 118, column: 5)
!152 = !DILocation(line: 119, column: 13, scope: !151)
!153 = !DILocalVariable(name: "buffer", scope: !151, file: !35, line: 120, type: !24)
!154 = !DILocation(line: 120, column: 15, scope: !151)
!155 = !DILocation(line: 120, column: 31, scope: !151)
!156 = !DILocation(line: 120, column: 24, scope: !151)
!157 = !DILocation(line: 121, column: 13, scope: !158)
!158 = distinct !DILexicalBlock(scope: !151, file: !35, line: 121, column: 13)
!159 = !DILocation(line: 121, column: 20, scope: !158)
!160 = !DILocation(line: 121, column: 13, scope: !151)
!161 = !DILocation(line: 121, column: 30, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !35, line: 121, column: 29)
!163 = !DILocation(line: 123, column: 16, scope: !164)
!164 = distinct !DILexicalBlock(scope: !151, file: !35, line: 123, column: 9)
!165 = !DILocation(line: 123, column: 14, scope: !164)
!166 = !DILocation(line: 123, column: 21, scope: !167)
!167 = distinct !DILexicalBlock(scope: !164, file: !35, line: 123, column: 9)
!168 = !DILocation(line: 123, column: 23, scope: !167)
!169 = !DILocation(line: 123, column: 9, scope: !164)
!170 = !DILocation(line: 125, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !35, line: 124, column: 9)
!172 = !DILocation(line: 125, column: 20, scope: !171)
!173 = !DILocation(line: 125, column: 23, scope: !171)
!174 = !DILocation(line: 126, column: 9, scope: !171)
!175 = !DILocation(line: 123, column: 30, scope: !167)
!176 = !DILocation(line: 123, column: 9, scope: !167)
!177 = distinct !{!177, !169, !178, !179}
!178 = !DILocation(line: 126, column: 9, scope: !164)
!179 = !{!"llvm.loop.mustprogress"}
!180 = !DILocation(line: 129, column: 13, scope: !181)
!181 = distinct !DILexicalBlock(scope: !151, file: !35, line: 129, column: 13)
!182 = !DILocation(line: 129, column: 18, scope: !181)
!183 = !DILocation(line: 129, column: 13, scope: !151)
!184 = !DILocation(line: 131, column: 13, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !35, line: 130, column: 9)
!186 = !DILocation(line: 131, column: 20, scope: !185)
!187 = !DILocation(line: 131, column: 26, scope: !185)
!188 = !DILocation(line: 133, column: 19, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !35, line: 133, column: 13)
!190 = !DILocation(line: 133, column: 17, scope: !189)
!191 = !DILocation(line: 133, column: 24, scope: !192)
!192 = distinct !DILexicalBlock(scope: !189, file: !35, line: 133, column: 13)
!193 = !DILocation(line: 133, column: 26, scope: !192)
!194 = !DILocation(line: 133, column: 13, scope: !189)
!195 = !DILocation(line: 135, column: 30, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !35, line: 134, column: 13)
!197 = !DILocation(line: 135, column: 37, scope: !196)
!198 = !DILocation(line: 135, column: 17, scope: !196)
!199 = !DILocation(line: 136, column: 13, scope: !196)
!200 = !DILocation(line: 133, column: 33, scope: !192)
!201 = !DILocation(line: 133, column: 13, scope: !192)
!202 = distinct !{!202, !194, !203, !179}
!203 = !DILocation(line: 136, column: 13, scope: !189)
!204 = !DILocation(line: 137, column: 9, scope: !185)
!205 = !DILocation(line: 140, column: 13, scope: !206)
!206 = distinct !DILexicalBlock(scope: !181, file: !35, line: 139, column: 9)
!207 = !DILocation(line: 142, column: 14, scope: !151)
!208 = !DILocation(line: 142, column: 9, scope: !151)
!209 = !DILocation(line: 144, column: 1, scope: !34)
!210 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_01_good", scope: !35, file: !35, line: 289, type: !36, scopeLine: 290, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!211 = !DILocation(line: 291, column: 5, scope: !210)
!212 = !DILocation(line: 292, column: 5, scope: !210)
!213 = !DILocation(line: 293, column: 1, scope: !210)
!214 = distinct !DISubprogram(name: "main", scope: !35, file: !35, line: 304, type: !215, scopeLine: 305, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!215 = !DISubroutineType(types: !216)
!216 = !{!25, !25, !217}
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !218, size: 64)
!218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!219 = !DILocalVariable(name: "argc", arg: 1, scope: !214, file: !35, line: 304, type: !25)
!220 = !DILocation(line: 304, column: 14, scope: !214)
!221 = !DILocalVariable(name: "argv", arg: 2, scope: !214, file: !35, line: 304, type: !217)
!222 = !DILocation(line: 304, column: 27, scope: !214)
!223 = !DILocation(line: 307, column: 22, scope: !214)
!224 = !DILocation(line: 307, column: 12, scope: !214)
!225 = !DILocation(line: 307, column: 5, scope: !214)
!226 = !DILocation(line: 309, column: 5, scope: !214)
!227 = !DILocation(line: 310, column: 5, scope: !214)
!228 = !DILocation(line: 311, column: 5, scope: !214)
!229 = !DILocation(line: 314, column: 5, scope: !214)
!230 = !DILocation(line: 315, column: 5, scope: !214)
!231 = !DILocation(line: 316, column: 5, scope: !214)
!232 = !DILocation(line: 318, column: 5, scope: !214)
!233 = distinct !DISubprogram(name: "goodG2B", scope: !35, file: !35, line: 151, type: !36, scopeLine: 152, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!234 = !DILocalVariable(name: "data", scope: !233, file: !35, line: 153, type: !25)
!235 = !DILocation(line: 153, column: 9, scope: !233)
!236 = !DILocation(line: 155, column: 10, scope: !233)
!237 = !DILocation(line: 158, column: 10, scope: !233)
!238 = !DILocalVariable(name: "i", scope: !239, file: !35, line: 160, type: !25)
!239 = distinct !DILexicalBlock(scope: !233, file: !35, line: 159, column: 5)
!240 = !DILocation(line: 160, column: 13, scope: !239)
!241 = !DILocalVariable(name: "buffer", scope: !239, file: !35, line: 161, type: !24)
!242 = !DILocation(line: 161, column: 15, scope: !239)
!243 = !DILocation(line: 161, column: 31, scope: !239)
!244 = !DILocation(line: 161, column: 24, scope: !239)
!245 = !DILocation(line: 162, column: 13, scope: !246)
!246 = distinct !DILexicalBlock(scope: !239, file: !35, line: 162, column: 13)
!247 = !DILocation(line: 162, column: 20, scope: !246)
!248 = !DILocation(line: 162, column: 13, scope: !239)
!249 = !DILocation(line: 162, column: 30, scope: !250)
!250 = distinct !DILexicalBlock(scope: !246, file: !35, line: 162, column: 29)
!251 = !DILocation(line: 164, column: 16, scope: !252)
!252 = distinct !DILexicalBlock(scope: !239, file: !35, line: 164, column: 9)
!253 = !DILocation(line: 164, column: 14, scope: !252)
!254 = !DILocation(line: 164, column: 21, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !35, line: 164, column: 9)
!256 = !DILocation(line: 164, column: 23, scope: !255)
!257 = !DILocation(line: 164, column: 9, scope: !252)
!258 = !DILocation(line: 166, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !255, file: !35, line: 165, column: 9)
!260 = !DILocation(line: 166, column: 20, scope: !259)
!261 = !DILocation(line: 166, column: 23, scope: !259)
!262 = !DILocation(line: 167, column: 9, scope: !259)
!263 = !DILocation(line: 164, column: 30, scope: !255)
!264 = !DILocation(line: 164, column: 9, scope: !255)
!265 = distinct !{!265, !257, !266, !179}
!266 = !DILocation(line: 167, column: 9, scope: !252)
!267 = !DILocation(line: 170, column: 13, scope: !268)
!268 = distinct !DILexicalBlock(scope: !239, file: !35, line: 170, column: 13)
!269 = !DILocation(line: 170, column: 18, scope: !268)
!270 = !DILocation(line: 170, column: 13, scope: !239)
!271 = !DILocation(line: 172, column: 13, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !35, line: 171, column: 9)
!273 = !DILocation(line: 172, column: 20, scope: !272)
!274 = !DILocation(line: 172, column: 26, scope: !272)
!275 = !DILocation(line: 174, column: 19, scope: !276)
!276 = distinct !DILexicalBlock(scope: !272, file: !35, line: 174, column: 13)
!277 = !DILocation(line: 174, column: 17, scope: !276)
!278 = !DILocation(line: 174, column: 24, scope: !279)
!279 = distinct !DILexicalBlock(scope: !276, file: !35, line: 174, column: 13)
!280 = !DILocation(line: 174, column: 26, scope: !279)
!281 = !DILocation(line: 174, column: 13, scope: !276)
!282 = !DILocation(line: 176, column: 30, scope: !283)
!283 = distinct !DILexicalBlock(scope: !279, file: !35, line: 175, column: 13)
!284 = !DILocation(line: 176, column: 37, scope: !283)
!285 = !DILocation(line: 176, column: 17, scope: !283)
!286 = !DILocation(line: 177, column: 13, scope: !283)
!287 = !DILocation(line: 174, column: 33, scope: !279)
!288 = !DILocation(line: 174, column: 13, scope: !279)
!289 = distinct !{!289, !281, !290, !179}
!290 = !DILocation(line: 177, column: 13, scope: !276)
!291 = !DILocation(line: 178, column: 9, scope: !272)
!292 = !DILocation(line: 181, column: 13, scope: !293)
!293 = distinct !DILexicalBlock(scope: !268, file: !35, line: 180, column: 9)
!294 = !DILocation(line: 183, column: 14, scope: !239)
!295 = !DILocation(line: 183, column: 9, scope: !239)
!296 = !DILocation(line: 185, column: 1, scope: !233)
!297 = distinct !DISubprogram(name: "goodB2G", scope: !35, file: !35, line: 188, type: !36, scopeLine: 189, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!298 = !DILocalVariable(name: "data", scope: !297, file: !35, line: 190, type: !25)
!299 = !DILocation(line: 190, column: 9, scope: !297)
!300 = !DILocation(line: 192, column: 10, scope: !297)
!301 = !DILocalVariable(name: "recvResult", scope: !302, file: !35, line: 198, type: !25)
!302 = distinct !DILexicalBlock(scope: !297, file: !35, line: 193, column: 5)
!303 = !DILocation(line: 198, column: 13, scope: !302)
!304 = !DILocalVariable(name: "service", scope: !302, file: !35, line: 199, type: !46)
!305 = !DILocation(line: 199, column: 28, scope: !302)
!306 = !DILocalVariable(name: "listenSocket", scope: !302, file: !35, line: 200, type: !25)
!307 = !DILocation(line: 200, column: 16, scope: !302)
!308 = !DILocalVariable(name: "acceptSocket", scope: !302, file: !35, line: 201, type: !25)
!309 = !DILocation(line: 201, column: 16, scope: !302)
!310 = !DILocalVariable(name: "inputBuffer", scope: !302, file: !35, line: 202, type: !20)
!311 = !DILocation(line: 202, column: 14, scope: !302)
!312 = !DILocation(line: 203, column: 9, scope: !302)
!313 = !DILocation(line: 213, column: 28, scope: !314)
!314 = distinct !DILexicalBlock(scope: !302, file: !35, line: 204, column: 9)
!315 = !DILocation(line: 213, column: 26, scope: !314)
!316 = !DILocation(line: 214, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !35, line: 214, column: 17)
!318 = !DILocation(line: 214, column: 30, scope: !317)
!319 = !DILocation(line: 214, column: 17, scope: !314)
!320 = !DILocation(line: 216, column: 17, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !35, line: 215, column: 13)
!322 = !DILocation(line: 218, column: 13, scope: !314)
!323 = !DILocation(line: 219, column: 21, scope: !314)
!324 = !DILocation(line: 219, column: 32, scope: !314)
!325 = !DILocation(line: 220, column: 21, scope: !314)
!326 = !DILocation(line: 220, column: 30, scope: !314)
!327 = !DILocation(line: 220, column: 37, scope: !314)
!328 = !DILocation(line: 221, column: 21, scope: !314)
!329 = !DILocation(line: 221, column: 30, scope: !314)
!330 = !DILocation(line: 222, column: 22, scope: !331)
!331 = distinct !DILexicalBlock(scope: !314, file: !35, line: 222, column: 17)
!332 = !DILocation(line: 222, column: 36, scope: !331)
!333 = !DILocation(line: 222, column: 17, scope: !331)
!334 = !DILocation(line: 222, column: 81, scope: !331)
!335 = !DILocation(line: 222, column: 17, scope: !314)
!336 = !DILocation(line: 224, column: 17, scope: !337)
!337 = distinct !DILexicalBlock(scope: !331, file: !35, line: 223, column: 13)
!338 = !DILocation(line: 226, column: 24, scope: !339)
!339 = distinct !DILexicalBlock(scope: !314, file: !35, line: 226, column: 17)
!340 = !DILocation(line: 226, column: 17, scope: !339)
!341 = !DILocation(line: 226, column: 54, scope: !339)
!342 = !DILocation(line: 226, column: 17, scope: !314)
!343 = !DILocation(line: 228, column: 17, scope: !344)
!344 = distinct !DILexicalBlock(scope: !339, file: !35, line: 227, column: 13)
!345 = !DILocation(line: 230, column: 35, scope: !314)
!346 = !DILocation(line: 230, column: 28, scope: !314)
!347 = !DILocation(line: 230, column: 26, scope: !314)
!348 = !DILocation(line: 231, column: 17, scope: !349)
!349 = distinct !DILexicalBlock(scope: !314, file: !35, line: 231, column: 17)
!350 = !DILocation(line: 231, column: 30, scope: !349)
!351 = !DILocation(line: 231, column: 17, scope: !314)
!352 = !DILocation(line: 233, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !35, line: 232, column: 13)
!354 = !DILocation(line: 236, column: 31, scope: !314)
!355 = !DILocation(line: 236, column: 45, scope: !314)
!356 = !DILocation(line: 236, column: 26, scope: !314)
!357 = !DILocation(line: 236, column: 24, scope: !314)
!358 = !DILocation(line: 237, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !314, file: !35, line: 237, column: 17)
!360 = !DILocation(line: 237, column: 28, scope: !359)
!361 = !DILocation(line: 237, column: 44, scope: !359)
!362 = !DILocation(line: 237, column: 47, scope: !359)
!363 = !DILocation(line: 237, column: 58, scope: !359)
!364 = !DILocation(line: 237, column: 17, scope: !314)
!365 = !DILocation(line: 239, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !359, file: !35, line: 238, column: 13)
!367 = !DILocation(line: 242, column: 25, scope: !314)
!368 = !DILocation(line: 242, column: 13, scope: !314)
!369 = !DILocation(line: 242, column: 37, scope: !314)
!370 = !DILocation(line: 244, column: 25, scope: !314)
!371 = !DILocation(line: 244, column: 20, scope: !314)
!372 = !DILocation(line: 244, column: 18, scope: !314)
!373 = !DILocation(line: 245, column: 9, scope: !314)
!374 = !DILocation(line: 247, column: 13, scope: !375)
!375 = distinct !DILexicalBlock(scope: !302, file: !35, line: 247, column: 13)
!376 = !DILocation(line: 247, column: 26, scope: !375)
!377 = !DILocation(line: 247, column: 13, scope: !302)
!378 = !DILocation(line: 249, column: 26, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !35, line: 248, column: 9)
!380 = !DILocation(line: 249, column: 13, scope: !379)
!381 = !DILocation(line: 250, column: 9, scope: !379)
!382 = !DILocation(line: 251, column: 13, scope: !383)
!383 = distinct !DILexicalBlock(scope: !302, file: !35, line: 251, column: 13)
!384 = !DILocation(line: 251, column: 26, scope: !383)
!385 = !DILocation(line: 251, column: 13, scope: !302)
!386 = !DILocation(line: 253, column: 26, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !35, line: 252, column: 9)
!388 = !DILocation(line: 253, column: 13, scope: !387)
!389 = !DILocation(line: 254, column: 9, scope: !387)
!390 = !DILocalVariable(name: "i", scope: !391, file: !35, line: 263, type: !25)
!391 = distinct !DILexicalBlock(scope: !297, file: !35, line: 262, column: 5)
!392 = !DILocation(line: 263, column: 13, scope: !391)
!393 = !DILocalVariable(name: "buffer", scope: !391, file: !35, line: 264, type: !24)
!394 = !DILocation(line: 264, column: 15, scope: !391)
!395 = !DILocation(line: 264, column: 31, scope: !391)
!396 = !DILocation(line: 264, column: 24, scope: !391)
!397 = !DILocation(line: 265, column: 13, scope: !398)
!398 = distinct !DILexicalBlock(scope: !391, file: !35, line: 265, column: 13)
!399 = !DILocation(line: 265, column: 20, scope: !398)
!400 = !DILocation(line: 265, column: 13, scope: !391)
!401 = !DILocation(line: 265, column: 30, scope: !402)
!402 = distinct !DILexicalBlock(scope: !398, file: !35, line: 265, column: 29)
!403 = !DILocation(line: 267, column: 16, scope: !404)
!404 = distinct !DILexicalBlock(scope: !391, file: !35, line: 267, column: 9)
!405 = !DILocation(line: 267, column: 14, scope: !404)
!406 = !DILocation(line: 267, column: 21, scope: !407)
!407 = distinct !DILexicalBlock(scope: !404, file: !35, line: 267, column: 9)
!408 = !DILocation(line: 267, column: 23, scope: !407)
!409 = !DILocation(line: 267, column: 9, scope: !404)
!410 = !DILocation(line: 269, column: 13, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !35, line: 268, column: 9)
!412 = !DILocation(line: 269, column: 20, scope: !411)
!413 = !DILocation(line: 269, column: 23, scope: !411)
!414 = !DILocation(line: 270, column: 9, scope: !411)
!415 = !DILocation(line: 267, column: 30, scope: !407)
!416 = !DILocation(line: 267, column: 9, scope: !407)
!417 = distinct !{!417, !409, !418, !179}
!418 = !DILocation(line: 270, column: 9, scope: !404)
!419 = !DILocation(line: 272, column: 13, scope: !420)
!420 = distinct !DILexicalBlock(scope: !391, file: !35, line: 272, column: 13)
!421 = !DILocation(line: 272, column: 18, scope: !420)
!422 = !DILocation(line: 272, column: 23, scope: !420)
!423 = !DILocation(line: 272, column: 26, scope: !420)
!424 = !DILocation(line: 272, column: 31, scope: !420)
!425 = !DILocation(line: 272, column: 13, scope: !391)
!426 = !DILocation(line: 274, column: 13, scope: !427)
!427 = distinct !DILexicalBlock(scope: !420, file: !35, line: 273, column: 9)
!428 = !DILocation(line: 274, column: 20, scope: !427)
!429 = !DILocation(line: 274, column: 26, scope: !427)
!430 = !DILocation(line: 276, column: 19, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !35, line: 276, column: 13)
!432 = !DILocation(line: 276, column: 17, scope: !431)
!433 = !DILocation(line: 276, column: 24, scope: !434)
!434 = distinct !DILexicalBlock(scope: !431, file: !35, line: 276, column: 13)
!435 = !DILocation(line: 276, column: 26, scope: !434)
!436 = !DILocation(line: 276, column: 13, scope: !431)
!437 = !DILocation(line: 278, column: 30, scope: !438)
!438 = distinct !DILexicalBlock(scope: !434, file: !35, line: 277, column: 13)
!439 = !DILocation(line: 278, column: 37, scope: !438)
!440 = !DILocation(line: 278, column: 17, scope: !438)
!441 = !DILocation(line: 279, column: 13, scope: !438)
!442 = !DILocation(line: 276, column: 33, scope: !434)
!443 = !DILocation(line: 276, column: 13, scope: !434)
!444 = distinct !{!444, !436, !445, !179}
!445 = !DILocation(line: 279, column: 13, scope: !431)
!446 = !DILocation(line: 280, column: 9, scope: !427)
!447 = !DILocation(line: 283, column: 13, scope: !448)
!448 = distinct !DILexicalBlock(scope: !420, file: !35, line: 282, column: 9)
!449 = !DILocation(line: 285, column: 14, scope: !391)
!450 = !DILocation(line: 285, column: 9, scope: !391)
!451 = !DILocation(line: 287, column: 1, scope: !297)
