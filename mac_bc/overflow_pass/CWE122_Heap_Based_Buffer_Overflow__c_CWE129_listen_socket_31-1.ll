; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31_bad() #0 !dbg !34 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data32 = alloca i32, align 4
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
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !150, metadata !DIExpression()), !dbg !152
  %15 = load i32, i32* %data, align 4, !dbg !153
  store i32 %15, i32* %dataCopy, align 4, !dbg !152
  call void @llvm.dbg.declare(metadata i32* %data32, metadata !154, metadata !DIExpression()), !dbg !155
  %16 = load i32, i32* %dataCopy, align 4, !dbg !156
  store i32 %16, i32* %data32, align 4, !dbg !155
  call void @llvm.dbg.declare(metadata i32* %i, metadata !157, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !160, metadata !DIExpression()), !dbg !161
  %call33 = call i8* @malloc(i64 noundef 40) #6, !dbg !162
  %17 = bitcast i8* %call33 to i32*, !dbg !163
  store i32* %17, i32** %buffer, align 8, !dbg !161
  %18 = load i32*, i32** %buffer, align 8, !dbg !164
  %cmp34 = icmp eq i32* %18, null, !dbg !166
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !167

if.then36:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !168
  unreachable, !dbg !168

if.end37:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.end37
  %19 = load i32, i32* %i, align 4, !dbg !173
  %cmp38 = icmp slt i32 %19, 10, !dbg !175
  br i1 %cmp38, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !177
  %21 = load i32, i32* %i, align 4, !dbg !179
  %idxprom40 = sext i32 %21 to i64, !dbg !177
  %arrayidx41 = getelementptr inbounds i32, i32* %20, i64 %idxprom40, !dbg !177
  store i32 0, i32* %arrayidx41, align 4, !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !182
  %inc = add nsw i32 %22, 1, !dbg !182
  store i32 %inc, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data32, align 4, !dbg !187
  %cmp42 = icmp sge i32 %23, 0, !dbg !189
  br i1 %cmp42, label %if.then44, label %if.else, !dbg !190

if.then44:                                        ; preds = %for.end
  %24 = load i32*, i32** %buffer, align 8, !dbg !191
  %25 = load i32, i32* %data32, align 4, !dbg !193
  %idxprom45 = sext i32 %25 to i64, !dbg !191
  %arrayidx46 = getelementptr inbounds i32, i32* %24, i64 %idxprom45, !dbg !191
  store i32 1, i32* %arrayidx46, align 4, !dbg !194
  store i32 0, i32* %i, align 4, !dbg !195
  br label %for.cond47, !dbg !197

for.cond47:                                       ; preds = %for.inc53, %if.then44
  %26 = load i32, i32* %i, align 4, !dbg !198
  %cmp48 = icmp slt i32 %26, 10, !dbg !200
  br i1 %cmp48, label %for.body50, label %for.end55, !dbg !201

for.body50:                                       ; preds = %for.cond47
  %27 = load i32*, i32** %buffer, align 8, !dbg !202
  %28 = load i32, i32* %i, align 4, !dbg !204
  %idxprom51 = sext i32 %28 to i64, !dbg !202
  %arrayidx52 = getelementptr inbounds i32, i32* %27, i64 %idxprom51, !dbg !202
  %29 = load i32, i32* %arrayidx52, align 4, !dbg !202
  call void @printIntLine(i32 noundef %29), !dbg !205
  br label %for.inc53, !dbg !206

for.inc53:                                        ; preds = %for.body50
  %30 = load i32, i32* %i, align 4, !dbg !207
  %inc54 = add nsw i32 %30, 1, !dbg !207
  store i32 %inc54, i32* %i, align 4, !dbg !207
  br label %for.cond47, !dbg !208, !llvm.loop !209

for.end55:                                        ; preds = %for.cond47
  br label %if.end56, !dbg !211

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !212
  br label %if.end56

if.end56:                                         ; preds = %if.else, %for.end55
  %31 = load i32*, i32** %buffer, align 8, !dbg !214
  %32 = bitcast i32* %31 to i8*, !dbg !214
  call void @free(i8* noundef %32), !dbg !215
  ret void, !dbg !216
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31_good() #0 !dbg !217 {
entry:
  call void @goodG2B(), !dbg !218
  call void @goodB2G(), !dbg !219
  ret void, !dbg !220
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !221 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !226, metadata !DIExpression()), !dbg !227
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !228, metadata !DIExpression()), !dbg !229
  %call = call i64 @time(i64* noundef null), !dbg !230
  %conv = trunc i64 %call to i32, !dbg !231
  call void @srand(i32 noundef %conv), !dbg !232
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !233
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31_good(), !dbg !234
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !235
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !236
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31_bad(), !dbg !237
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !238
  ret i32 0, !dbg !239
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !240 {
entry:
  %data = alloca i32, align 4
  %dataCopy = alloca i32, align 4
  %data1 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !241, metadata !DIExpression()), !dbg !242
  store i32 -1, i32* %data, align 4, !dbg !243
  store i32 7, i32* %data, align 4, !dbg !244
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !245, metadata !DIExpression()), !dbg !247
  %0 = load i32, i32* %data, align 4, !dbg !248
  store i32 %0, i32* %dataCopy, align 4, !dbg !247
  call void @llvm.dbg.declare(metadata i32* %data1, metadata !249, metadata !DIExpression()), !dbg !250
  %1 = load i32, i32* %dataCopy, align 4, !dbg !251
  store i32 %1, i32* %data1, align 4, !dbg !250
  call void @llvm.dbg.declare(metadata i32* %i, metadata !252, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !255, metadata !DIExpression()), !dbg !256
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !257
  %2 = bitcast i8* %call to i32*, !dbg !258
  store i32* %2, i32** %buffer, align 8, !dbg !256
  %3 = load i32*, i32** %buffer, align 8, !dbg !259
  %cmp = icmp eq i32* %3, null, !dbg !261
  br i1 %cmp, label %if.then, label %if.end, !dbg !262

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !263
  unreachable, !dbg !263

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !265
  br label %for.cond, !dbg !267

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i32, i32* %i, align 4, !dbg !268
  %cmp2 = icmp slt i32 %4, 10, !dbg !270
  br i1 %cmp2, label %for.body, label %for.end, !dbg !271

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %buffer, align 8, !dbg !272
  %6 = load i32, i32* %i, align 4, !dbg !274
  %idxprom = sext i32 %6 to i64, !dbg !272
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 %idxprom, !dbg !272
  store i32 0, i32* %arrayidx, align 4, !dbg !275
  br label %for.inc, !dbg !276

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !277
  %inc = add nsw i32 %7, 1, !dbg !277
  store i32 %inc, i32* %i, align 4, !dbg !277
  br label %for.cond, !dbg !278, !llvm.loop !279

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %data1, align 4, !dbg !281
  %cmp3 = icmp sge i32 %8, 0, !dbg !283
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !284

if.then4:                                         ; preds = %for.end
  %9 = load i32*, i32** %buffer, align 8, !dbg !285
  %10 = load i32, i32* %data1, align 4, !dbg !287
  %idxprom5 = sext i32 %10 to i64, !dbg !285
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 %idxprom5, !dbg !285
  store i32 1, i32* %arrayidx6, align 4, !dbg !288
  store i32 0, i32* %i, align 4, !dbg !289
  br label %for.cond7, !dbg !291

for.cond7:                                        ; preds = %for.inc12, %if.then4
  %11 = load i32, i32* %i, align 4, !dbg !292
  %cmp8 = icmp slt i32 %11, 10, !dbg !294
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !295

for.body9:                                        ; preds = %for.cond7
  %12 = load i32*, i32** %buffer, align 8, !dbg !296
  %13 = load i32, i32* %i, align 4, !dbg !298
  %idxprom10 = sext i32 %13 to i64, !dbg !296
  %arrayidx11 = getelementptr inbounds i32, i32* %12, i64 %idxprom10, !dbg !296
  %14 = load i32, i32* %arrayidx11, align 4, !dbg !296
  call void @printIntLine(i32 noundef %14), !dbg !299
  br label %for.inc12, !dbg !300

for.inc12:                                        ; preds = %for.body9
  %15 = load i32, i32* %i, align 4, !dbg !301
  %inc13 = add nsw i32 %15, 1, !dbg !301
  store i32 %inc13, i32* %i, align 4, !dbg !301
  br label %for.cond7, !dbg !302, !llvm.loop !303

for.end14:                                        ; preds = %for.cond7
  br label %if.end15, !dbg !305

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !306
  br label %if.end15

if.end15:                                         ; preds = %if.else, %for.end14
  %16 = load i32*, i32** %buffer, align 8, !dbg !308
  %17 = bitcast i32* %16 to i8*, !dbg !308
  call void @free(i8* noundef %17), !dbg !309
  ret void, !dbg !310
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !311 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %dataCopy = alloca i32, align 4
  %data32 = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !312, metadata !DIExpression()), !dbg !313
  store i32 -1, i32* %data, align 4, !dbg !314
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !315, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !318, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !320, metadata !DIExpression()), !dbg !321
  store i32 -1, i32* %listenSocket, align 4, !dbg !321
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !322, metadata !DIExpression()), !dbg !323
  store i32 -1, i32* %acceptSocket, align 4, !dbg !323
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !324, metadata !DIExpression()), !dbg !325
  br label %do.body, !dbg !326

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !327
  store i32 %call, i32* %listenSocket, align 4, !dbg !329
  %0 = load i32, i32* %listenSocket, align 4, !dbg !330
  %cmp = icmp eq i32 %0, -1, !dbg !332
  br i1 %cmp, label %if.then, label %if.end, !dbg !333

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !334

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !336
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !336
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !337
  store i8 2, i8* %sin_family, align 1, !dbg !338
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !339
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !340
  store i32 0, i32* %s_addr, align 4, !dbg !341
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !342
  store i16 -30871, i16* %sin_port, align 2, !dbg !343
  %2 = load i32, i32* %listenSocket, align 4, !dbg !344
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !346
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !347
  %cmp2 = icmp eq i32 %call1, -1, !dbg !348
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !349

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !350

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !352
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !354
  %cmp6 = icmp eq i32 %call5, -1, !dbg !355
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !356

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !357

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !359
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !360
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !361
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !362
  %cmp10 = icmp eq i32 %6, -1, !dbg !364
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !365

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !366

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !368
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !369
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !370
  %conv = trunc i64 %call13 to i32, !dbg !370
  store i32 %conv, i32* %recvResult, align 4, !dbg !371
  %8 = load i32, i32* %recvResult, align 4, !dbg !372
  %cmp14 = icmp eq i32 %8, -1, !dbg !374
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !375

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !376
  %cmp16 = icmp eq i32 %9, 0, !dbg !377
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !378

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !379

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !381
  %idxprom = sext i32 %10 to i64, !dbg !382
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !382
  store i8 0, i8* %arrayidx, align 1, !dbg !383
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !384
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !385
  store i32 %call21, i32* %data, align 4, !dbg !386
  br label %do.end, !dbg !387

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !388
  %cmp22 = icmp ne i32 %11, -1, !dbg !390
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !391

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !392
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !394
  br label %if.end26, !dbg !395

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !396
  %cmp27 = icmp ne i32 %13, -1, !dbg !398
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !399

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !400
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !402
  br label %if.end31, !dbg !403

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %dataCopy, metadata !404, metadata !DIExpression()), !dbg !406
  %15 = load i32, i32* %data, align 4, !dbg !407
  store i32 %15, i32* %dataCopy, align 4, !dbg !406
  call void @llvm.dbg.declare(metadata i32* %data32, metadata !408, metadata !DIExpression()), !dbg !409
  %16 = load i32, i32* %dataCopy, align 4, !dbg !410
  store i32 %16, i32* %data32, align 4, !dbg !409
  call void @llvm.dbg.declare(metadata i32* %i, metadata !411, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !414, metadata !DIExpression()), !dbg !415
  %call33 = call i8* @malloc(i64 noundef 40) #6, !dbg !416
  %17 = bitcast i8* %call33 to i32*, !dbg !417
  store i32* %17, i32** %buffer, align 8, !dbg !415
  %18 = load i32*, i32** %buffer, align 8, !dbg !418
  %cmp34 = icmp eq i32* %18, null, !dbg !420
  br i1 %cmp34, label %if.then36, label %if.end37, !dbg !421

if.then36:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !422
  unreachable, !dbg !422

if.end37:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !424
  br label %for.cond, !dbg !426

for.cond:                                         ; preds = %for.inc, %if.end37
  %19 = load i32, i32* %i, align 4, !dbg !427
  %cmp38 = icmp slt i32 %19, 10, !dbg !429
  br i1 %cmp38, label %for.body, label %for.end, !dbg !430

for.body:                                         ; preds = %for.cond
  %20 = load i32*, i32** %buffer, align 8, !dbg !431
  %21 = load i32, i32* %i, align 4, !dbg !433
  %idxprom40 = sext i32 %21 to i64, !dbg !431
  %arrayidx41 = getelementptr inbounds i32, i32* %20, i64 %idxprom40, !dbg !431
  store i32 0, i32* %arrayidx41, align 4, !dbg !434
  br label %for.inc, !dbg !435

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !436
  %inc = add nsw i32 %22, 1, !dbg !436
  store i32 %inc, i32* %i, align 4, !dbg !436
  br label %for.cond, !dbg !437, !llvm.loop !438

for.end:                                          ; preds = %for.cond
  %23 = load i32, i32* %data32, align 4, !dbg !440
  %cmp42 = icmp sge i32 %23, 0, !dbg !442
  br i1 %cmp42, label %land.lhs.true, label %if.else, !dbg !443

land.lhs.true:                                    ; preds = %for.end
  %24 = load i32, i32* %data32, align 4, !dbg !444
  %cmp44 = icmp slt i32 %24, 10, !dbg !445
  br i1 %cmp44, label %if.then46, label %if.else, !dbg !446

if.then46:                                        ; preds = %land.lhs.true
  %25 = load i32*, i32** %buffer, align 8, !dbg !447
  %26 = load i32, i32* %data32, align 4, !dbg !449
  %idxprom47 = sext i32 %26 to i64, !dbg !447
  %arrayidx48 = getelementptr inbounds i32, i32* %25, i64 %idxprom47, !dbg !447
  store i32 1, i32* %arrayidx48, align 4, !dbg !450
  store i32 0, i32* %i, align 4, !dbg !451
  br label %for.cond49, !dbg !453

for.cond49:                                       ; preds = %for.inc55, %if.then46
  %27 = load i32, i32* %i, align 4, !dbg !454
  %cmp50 = icmp slt i32 %27, 10, !dbg !456
  br i1 %cmp50, label %for.body52, label %for.end57, !dbg !457

for.body52:                                       ; preds = %for.cond49
  %28 = load i32*, i32** %buffer, align 8, !dbg !458
  %29 = load i32, i32* %i, align 4, !dbg !460
  %idxprom53 = sext i32 %29 to i64, !dbg !458
  %arrayidx54 = getelementptr inbounds i32, i32* %28, i64 %idxprom53, !dbg !458
  %30 = load i32, i32* %arrayidx54, align 4, !dbg !458
  call void @printIntLine(i32 noundef %30), !dbg !461
  br label %for.inc55, !dbg !462

for.inc55:                                        ; preds = %for.body52
  %31 = load i32, i32* %i, align 4, !dbg !463
  %inc56 = add nsw i32 %31, 1, !dbg !463
  store i32 %inc56, i32* %i, align 4, !dbg !463
  br label %for.cond49, !dbg !464, !llvm.loop !465

for.end57:                                        ; preds = %for.cond49
  br label %if.end58, !dbg !467

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !468
  br label %if.end58

if.end58:                                         ; preds = %if.else, %for.end57
  %32 = load i32*, i32** %buffer, align 8, !dbg !470
  %33 = bitcast i32* %32 to i8*, !dbg !470
  call void @free(i8* noundef %33), !dbg !471
  ret void, !dbg !472
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31_bad", scope: !35, file: !35, line: 44, type: !36, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!35 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!150 = !DILocalVariable(name: "dataCopy", scope: !151, file: !35, line: 119, type: !25)
!151 = distinct !DILexicalBlock(scope: !34, file: !35, line: 118, column: 5)
!152 = !DILocation(line: 119, column: 13, scope: !151)
!153 = !DILocation(line: 119, column: 24, scope: !151)
!154 = !DILocalVariable(name: "data", scope: !151, file: !35, line: 120, type: !25)
!155 = !DILocation(line: 120, column: 13, scope: !151)
!156 = !DILocation(line: 120, column: 20, scope: !151)
!157 = !DILocalVariable(name: "i", scope: !158, file: !35, line: 122, type: !25)
!158 = distinct !DILexicalBlock(scope: !151, file: !35, line: 121, column: 9)
!159 = !DILocation(line: 122, column: 17, scope: !158)
!160 = !DILocalVariable(name: "buffer", scope: !158, file: !35, line: 123, type: !24)
!161 = !DILocation(line: 123, column: 19, scope: !158)
!162 = !DILocation(line: 123, column: 35, scope: !158)
!163 = !DILocation(line: 123, column: 28, scope: !158)
!164 = !DILocation(line: 124, column: 17, scope: !165)
!165 = distinct !DILexicalBlock(scope: !158, file: !35, line: 124, column: 17)
!166 = !DILocation(line: 124, column: 24, scope: !165)
!167 = !DILocation(line: 124, column: 17, scope: !158)
!168 = !DILocation(line: 124, column: 34, scope: !169)
!169 = distinct !DILexicalBlock(scope: !165, file: !35, line: 124, column: 33)
!170 = !DILocation(line: 126, column: 20, scope: !171)
!171 = distinct !DILexicalBlock(scope: !158, file: !35, line: 126, column: 13)
!172 = !DILocation(line: 126, column: 18, scope: !171)
!173 = !DILocation(line: 126, column: 25, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !35, line: 126, column: 13)
!175 = !DILocation(line: 126, column: 27, scope: !174)
!176 = !DILocation(line: 126, column: 13, scope: !171)
!177 = !DILocation(line: 128, column: 17, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !35, line: 127, column: 13)
!179 = !DILocation(line: 128, column: 24, scope: !178)
!180 = !DILocation(line: 128, column: 27, scope: !178)
!181 = !DILocation(line: 129, column: 13, scope: !178)
!182 = !DILocation(line: 126, column: 34, scope: !174)
!183 = !DILocation(line: 126, column: 13, scope: !174)
!184 = distinct !{!184, !176, !185, !186}
!185 = !DILocation(line: 129, column: 13, scope: !171)
!186 = !{!"llvm.loop.mustprogress"}
!187 = !DILocation(line: 132, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !158, file: !35, line: 132, column: 17)
!189 = !DILocation(line: 132, column: 22, scope: !188)
!190 = !DILocation(line: 132, column: 17, scope: !158)
!191 = !DILocation(line: 134, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !35, line: 133, column: 13)
!193 = !DILocation(line: 134, column: 24, scope: !192)
!194 = !DILocation(line: 134, column: 30, scope: !192)
!195 = !DILocation(line: 136, column: 23, scope: !196)
!196 = distinct !DILexicalBlock(scope: !192, file: !35, line: 136, column: 17)
!197 = !DILocation(line: 136, column: 21, scope: !196)
!198 = !DILocation(line: 136, column: 28, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !35, line: 136, column: 17)
!200 = !DILocation(line: 136, column: 30, scope: !199)
!201 = !DILocation(line: 136, column: 17, scope: !196)
!202 = !DILocation(line: 138, column: 34, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !35, line: 137, column: 17)
!204 = !DILocation(line: 138, column: 41, scope: !203)
!205 = !DILocation(line: 138, column: 21, scope: !203)
!206 = !DILocation(line: 139, column: 17, scope: !203)
!207 = !DILocation(line: 136, column: 37, scope: !199)
!208 = !DILocation(line: 136, column: 17, scope: !199)
!209 = distinct !{!209, !201, !210, !186}
!210 = !DILocation(line: 139, column: 17, scope: !196)
!211 = !DILocation(line: 140, column: 13, scope: !192)
!212 = !DILocation(line: 143, column: 17, scope: !213)
!213 = distinct !DILexicalBlock(scope: !188, file: !35, line: 142, column: 13)
!214 = !DILocation(line: 145, column: 18, scope: !158)
!215 = !DILocation(line: 145, column: 13, scope: !158)
!216 = !DILocation(line: 148, column: 1, scope: !34)
!217 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_31_good", scope: !35, file: !35, line: 301, type: !36, scopeLine: 302, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!218 = !DILocation(line: 303, column: 5, scope: !217)
!219 = !DILocation(line: 304, column: 5, scope: !217)
!220 = !DILocation(line: 305, column: 1, scope: !217)
!221 = distinct !DISubprogram(name: "main", scope: !35, file: !35, line: 315, type: !222, scopeLine: 316, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!222 = !DISubroutineType(types: !223)
!223 = !{!25, !25, !224}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!226 = !DILocalVariable(name: "argc", arg: 1, scope: !221, file: !35, line: 315, type: !25)
!227 = !DILocation(line: 315, column: 14, scope: !221)
!228 = !DILocalVariable(name: "argv", arg: 2, scope: !221, file: !35, line: 315, type: !224)
!229 = !DILocation(line: 315, column: 27, scope: !221)
!230 = !DILocation(line: 318, column: 22, scope: !221)
!231 = !DILocation(line: 318, column: 12, scope: !221)
!232 = !DILocation(line: 318, column: 5, scope: !221)
!233 = !DILocation(line: 320, column: 5, scope: !221)
!234 = !DILocation(line: 321, column: 5, scope: !221)
!235 = !DILocation(line: 322, column: 5, scope: !221)
!236 = !DILocation(line: 325, column: 5, scope: !221)
!237 = !DILocation(line: 326, column: 5, scope: !221)
!238 = !DILocation(line: 327, column: 5, scope: !221)
!239 = !DILocation(line: 329, column: 5, scope: !221)
!240 = distinct !DISubprogram(name: "goodG2B", scope: !35, file: !35, line: 155, type: !36, scopeLine: 156, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!241 = !DILocalVariable(name: "data", scope: !240, file: !35, line: 157, type: !25)
!242 = !DILocation(line: 157, column: 9, scope: !240)
!243 = !DILocation(line: 159, column: 10, scope: !240)
!244 = !DILocation(line: 162, column: 10, scope: !240)
!245 = !DILocalVariable(name: "dataCopy", scope: !246, file: !35, line: 164, type: !25)
!246 = distinct !DILexicalBlock(scope: !240, file: !35, line: 163, column: 5)
!247 = !DILocation(line: 164, column: 13, scope: !246)
!248 = !DILocation(line: 164, column: 24, scope: !246)
!249 = !DILocalVariable(name: "data", scope: !246, file: !35, line: 165, type: !25)
!250 = !DILocation(line: 165, column: 13, scope: !246)
!251 = !DILocation(line: 165, column: 20, scope: !246)
!252 = !DILocalVariable(name: "i", scope: !253, file: !35, line: 167, type: !25)
!253 = distinct !DILexicalBlock(scope: !246, file: !35, line: 166, column: 9)
!254 = !DILocation(line: 167, column: 17, scope: !253)
!255 = !DILocalVariable(name: "buffer", scope: !253, file: !35, line: 168, type: !24)
!256 = !DILocation(line: 168, column: 19, scope: !253)
!257 = !DILocation(line: 168, column: 35, scope: !253)
!258 = !DILocation(line: 168, column: 28, scope: !253)
!259 = !DILocation(line: 169, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !253, file: !35, line: 169, column: 17)
!261 = !DILocation(line: 169, column: 24, scope: !260)
!262 = !DILocation(line: 169, column: 17, scope: !253)
!263 = !DILocation(line: 169, column: 34, scope: !264)
!264 = distinct !DILexicalBlock(scope: !260, file: !35, line: 169, column: 33)
!265 = !DILocation(line: 171, column: 20, scope: !266)
!266 = distinct !DILexicalBlock(scope: !253, file: !35, line: 171, column: 13)
!267 = !DILocation(line: 171, column: 18, scope: !266)
!268 = !DILocation(line: 171, column: 25, scope: !269)
!269 = distinct !DILexicalBlock(scope: !266, file: !35, line: 171, column: 13)
!270 = !DILocation(line: 171, column: 27, scope: !269)
!271 = !DILocation(line: 171, column: 13, scope: !266)
!272 = !DILocation(line: 173, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !269, file: !35, line: 172, column: 13)
!274 = !DILocation(line: 173, column: 24, scope: !273)
!275 = !DILocation(line: 173, column: 27, scope: !273)
!276 = !DILocation(line: 174, column: 13, scope: !273)
!277 = !DILocation(line: 171, column: 34, scope: !269)
!278 = !DILocation(line: 171, column: 13, scope: !269)
!279 = distinct !{!279, !271, !280, !186}
!280 = !DILocation(line: 174, column: 13, scope: !266)
!281 = !DILocation(line: 177, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !253, file: !35, line: 177, column: 17)
!283 = !DILocation(line: 177, column: 22, scope: !282)
!284 = !DILocation(line: 177, column: 17, scope: !253)
!285 = !DILocation(line: 179, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !282, file: !35, line: 178, column: 13)
!287 = !DILocation(line: 179, column: 24, scope: !286)
!288 = !DILocation(line: 179, column: 30, scope: !286)
!289 = !DILocation(line: 181, column: 23, scope: !290)
!290 = distinct !DILexicalBlock(scope: !286, file: !35, line: 181, column: 17)
!291 = !DILocation(line: 181, column: 21, scope: !290)
!292 = !DILocation(line: 181, column: 28, scope: !293)
!293 = distinct !DILexicalBlock(scope: !290, file: !35, line: 181, column: 17)
!294 = !DILocation(line: 181, column: 30, scope: !293)
!295 = !DILocation(line: 181, column: 17, scope: !290)
!296 = !DILocation(line: 183, column: 34, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !35, line: 182, column: 17)
!298 = !DILocation(line: 183, column: 41, scope: !297)
!299 = !DILocation(line: 183, column: 21, scope: !297)
!300 = !DILocation(line: 184, column: 17, scope: !297)
!301 = !DILocation(line: 181, column: 37, scope: !293)
!302 = !DILocation(line: 181, column: 17, scope: !293)
!303 = distinct !{!303, !295, !304, !186}
!304 = !DILocation(line: 184, column: 17, scope: !290)
!305 = !DILocation(line: 185, column: 13, scope: !286)
!306 = !DILocation(line: 188, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !282, file: !35, line: 187, column: 13)
!308 = !DILocation(line: 190, column: 18, scope: !253)
!309 = !DILocation(line: 190, column: 13, scope: !253)
!310 = !DILocation(line: 193, column: 1, scope: !240)
!311 = distinct !DISubprogram(name: "goodB2G", scope: !35, file: !35, line: 196, type: !36, scopeLine: 197, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!312 = !DILocalVariable(name: "data", scope: !311, file: !35, line: 198, type: !25)
!313 = !DILocation(line: 198, column: 9, scope: !311)
!314 = !DILocation(line: 200, column: 10, scope: !311)
!315 = !DILocalVariable(name: "recvResult", scope: !316, file: !35, line: 206, type: !25)
!316 = distinct !DILexicalBlock(scope: !311, file: !35, line: 201, column: 5)
!317 = !DILocation(line: 206, column: 13, scope: !316)
!318 = !DILocalVariable(name: "service", scope: !316, file: !35, line: 207, type: !46)
!319 = !DILocation(line: 207, column: 28, scope: !316)
!320 = !DILocalVariable(name: "listenSocket", scope: !316, file: !35, line: 208, type: !25)
!321 = !DILocation(line: 208, column: 16, scope: !316)
!322 = !DILocalVariable(name: "acceptSocket", scope: !316, file: !35, line: 209, type: !25)
!323 = !DILocation(line: 209, column: 16, scope: !316)
!324 = !DILocalVariable(name: "inputBuffer", scope: !316, file: !35, line: 210, type: !20)
!325 = !DILocation(line: 210, column: 14, scope: !316)
!326 = !DILocation(line: 211, column: 9, scope: !316)
!327 = !DILocation(line: 221, column: 28, scope: !328)
!328 = distinct !DILexicalBlock(scope: !316, file: !35, line: 212, column: 9)
!329 = !DILocation(line: 221, column: 26, scope: !328)
!330 = !DILocation(line: 222, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !328, file: !35, line: 222, column: 17)
!332 = !DILocation(line: 222, column: 30, scope: !331)
!333 = !DILocation(line: 222, column: 17, scope: !328)
!334 = !DILocation(line: 224, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !331, file: !35, line: 223, column: 13)
!336 = !DILocation(line: 226, column: 13, scope: !328)
!337 = !DILocation(line: 227, column: 21, scope: !328)
!338 = !DILocation(line: 227, column: 32, scope: !328)
!339 = !DILocation(line: 228, column: 21, scope: !328)
!340 = !DILocation(line: 228, column: 30, scope: !328)
!341 = !DILocation(line: 228, column: 37, scope: !328)
!342 = !DILocation(line: 229, column: 21, scope: !328)
!343 = !DILocation(line: 229, column: 30, scope: !328)
!344 = !DILocation(line: 230, column: 22, scope: !345)
!345 = distinct !DILexicalBlock(scope: !328, file: !35, line: 230, column: 17)
!346 = !DILocation(line: 230, column: 36, scope: !345)
!347 = !DILocation(line: 230, column: 17, scope: !345)
!348 = !DILocation(line: 230, column: 81, scope: !345)
!349 = !DILocation(line: 230, column: 17, scope: !328)
!350 = !DILocation(line: 232, column: 17, scope: !351)
!351 = distinct !DILexicalBlock(scope: !345, file: !35, line: 231, column: 13)
!352 = !DILocation(line: 234, column: 24, scope: !353)
!353 = distinct !DILexicalBlock(scope: !328, file: !35, line: 234, column: 17)
!354 = !DILocation(line: 234, column: 17, scope: !353)
!355 = !DILocation(line: 234, column: 54, scope: !353)
!356 = !DILocation(line: 234, column: 17, scope: !328)
!357 = !DILocation(line: 236, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !353, file: !35, line: 235, column: 13)
!359 = !DILocation(line: 238, column: 35, scope: !328)
!360 = !DILocation(line: 238, column: 28, scope: !328)
!361 = !DILocation(line: 238, column: 26, scope: !328)
!362 = !DILocation(line: 239, column: 17, scope: !363)
!363 = distinct !DILexicalBlock(scope: !328, file: !35, line: 239, column: 17)
!364 = !DILocation(line: 239, column: 30, scope: !363)
!365 = !DILocation(line: 239, column: 17, scope: !328)
!366 = !DILocation(line: 241, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !363, file: !35, line: 240, column: 13)
!368 = !DILocation(line: 244, column: 31, scope: !328)
!369 = !DILocation(line: 244, column: 45, scope: !328)
!370 = !DILocation(line: 244, column: 26, scope: !328)
!371 = !DILocation(line: 244, column: 24, scope: !328)
!372 = !DILocation(line: 245, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !328, file: !35, line: 245, column: 17)
!374 = !DILocation(line: 245, column: 28, scope: !373)
!375 = !DILocation(line: 245, column: 44, scope: !373)
!376 = !DILocation(line: 245, column: 47, scope: !373)
!377 = !DILocation(line: 245, column: 58, scope: !373)
!378 = !DILocation(line: 245, column: 17, scope: !328)
!379 = !DILocation(line: 247, column: 17, scope: !380)
!380 = distinct !DILexicalBlock(scope: !373, file: !35, line: 246, column: 13)
!381 = !DILocation(line: 250, column: 25, scope: !328)
!382 = !DILocation(line: 250, column: 13, scope: !328)
!383 = !DILocation(line: 250, column: 37, scope: !328)
!384 = !DILocation(line: 252, column: 25, scope: !328)
!385 = !DILocation(line: 252, column: 20, scope: !328)
!386 = !DILocation(line: 252, column: 18, scope: !328)
!387 = !DILocation(line: 253, column: 9, scope: !328)
!388 = !DILocation(line: 255, column: 13, scope: !389)
!389 = distinct !DILexicalBlock(scope: !316, file: !35, line: 255, column: 13)
!390 = !DILocation(line: 255, column: 26, scope: !389)
!391 = !DILocation(line: 255, column: 13, scope: !316)
!392 = !DILocation(line: 257, column: 26, scope: !393)
!393 = distinct !DILexicalBlock(scope: !389, file: !35, line: 256, column: 9)
!394 = !DILocation(line: 257, column: 13, scope: !393)
!395 = !DILocation(line: 258, column: 9, scope: !393)
!396 = !DILocation(line: 259, column: 13, scope: !397)
!397 = distinct !DILexicalBlock(scope: !316, file: !35, line: 259, column: 13)
!398 = !DILocation(line: 259, column: 26, scope: !397)
!399 = !DILocation(line: 259, column: 13, scope: !316)
!400 = !DILocation(line: 261, column: 26, scope: !401)
!401 = distinct !DILexicalBlock(scope: !397, file: !35, line: 260, column: 9)
!402 = !DILocation(line: 261, column: 13, scope: !401)
!403 = !DILocation(line: 262, column: 9, scope: !401)
!404 = !DILocalVariable(name: "dataCopy", scope: !405, file: !35, line: 271, type: !25)
!405 = distinct !DILexicalBlock(scope: !311, file: !35, line: 270, column: 5)
!406 = !DILocation(line: 271, column: 13, scope: !405)
!407 = !DILocation(line: 271, column: 24, scope: !405)
!408 = !DILocalVariable(name: "data", scope: !405, file: !35, line: 272, type: !25)
!409 = !DILocation(line: 272, column: 13, scope: !405)
!410 = !DILocation(line: 272, column: 20, scope: !405)
!411 = !DILocalVariable(name: "i", scope: !412, file: !35, line: 274, type: !25)
!412 = distinct !DILexicalBlock(scope: !405, file: !35, line: 273, column: 9)
!413 = !DILocation(line: 274, column: 17, scope: !412)
!414 = !DILocalVariable(name: "buffer", scope: !412, file: !35, line: 275, type: !24)
!415 = !DILocation(line: 275, column: 19, scope: !412)
!416 = !DILocation(line: 275, column: 35, scope: !412)
!417 = !DILocation(line: 275, column: 28, scope: !412)
!418 = !DILocation(line: 276, column: 17, scope: !419)
!419 = distinct !DILexicalBlock(scope: !412, file: !35, line: 276, column: 17)
!420 = !DILocation(line: 276, column: 24, scope: !419)
!421 = !DILocation(line: 276, column: 17, scope: !412)
!422 = !DILocation(line: 276, column: 34, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !35, line: 276, column: 33)
!424 = !DILocation(line: 278, column: 20, scope: !425)
!425 = distinct !DILexicalBlock(scope: !412, file: !35, line: 278, column: 13)
!426 = !DILocation(line: 278, column: 18, scope: !425)
!427 = !DILocation(line: 278, column: 25, scope: !428)
!428 = distinct !DILexicalBlock(scope: !425, file: !35, line: 278, column: 13)
!429 = !DILocation(line: 278, column: 27, scope: !428)
!430 = !DILocation(line: 278, column: 13, scope: !425)
!431 = !DILocation(line: 280, column: 17, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !35, line: 279, column: 13)
!433 = !DILocation(line: 280, column: 24, scope: !432)
!434 = !DILocation(line: 280, column: 27, scope: !432)
!435 = !DILocation(line: 281, column: 13, scope: !432)
!436 = !DILocation(line: 278, column: 34, scope: !428)
!437 = !DILocation(line: 278, column: 13, scope: !428)
!438 = distinct !{!438, !430, !439, !186}
!439 = !DILocation(line: 281, column: 13, scope: !425)
!440 = !DILocation(line: 283, column: 17, scope: !441)
!441 = distinct !DILexicalBlock(scope: !412, file: !35, line: 283, column: 17)
!442 = !DILocation(line: 283, column: 22, scope: !441)
!443 = !DILocation(line: 283, column: 27, scope: !441)
!444 = !DILocation(line: 283, column: 30, scope: !441)
!445 = !DILocation(line: 283, column: 35, scope: !441)
!446 = !DILocation(line: 283, column: 17, scope: !412)
!447 = !DILocation(line: 285, column: 17, scope: !448)
!448 = distinct !DILexicalBlock(scope: !441, file: !35, line: 284, column: 13)
!449 = !DILocation(line: 285, column: 24, scope: !448)
!450 = !DILocation(line: 285, column: 30, scope: !448)
!451 = !DILocation(line: 287, column: 23, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !35, line: 287, column: 17)
!453 = !DILocation(line: 287, column: 21, scope: !452)
!454 = !DILocation(line: 287, column: 28, scope: !455)
!455 = distinct !DILexicalBlock(scope: !452, file: !35, line: 287, column: 17)
!456 = !DILocation(line: 287, column: 30, scope: !455)
!457 = !DILocation(line: 287, column: 17, scope: !452)
!458 = !DILocation(line: 289, column: 34, scope: !459)
!459 = distinct !DILexicalBlock(scope: !455, file: !35, line: 288, column: 17)
!460 = !DILocation(line: 289, column: 41, scope: !459)
!461 = !DILocation(line: 289, column: 21, scope: !459)
!462 = !DILocation(line: 290, column: 17, scope: !459)
!463 = !DILocation(line: 287, column: 37, scope: !455)
!464 = !DILocation(line: 287, column: 17, scope: !455)
!465 = distinct !{!465, !457, !466, !186}
!466 = !DILocation(line: 290, column: 17, scope: !452)
!467 = !DILocation(line: 291, column: 13, scope: !448)
!468 = !DILocation(line: 294, column: 17, scope: !469)
!469 = distinct !DILexicalBlock(scope: !441, file: !35, line: 293, column: 13)
!470 = !DILocation(line: 296, column: 18, scope: !412)
!471 = !DILocation(line: 296, column: 13, scope: !412)
!472 = !DILocation(line: 299, column: 1, scope: !311)
