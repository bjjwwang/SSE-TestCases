; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_bad() #0 !dbg !34 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !47, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 -1, i32* %listenSocket, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !70, metadata !DIExpression()), !dbg !71
  store i32 -1, i32* %acceptSocket, align 4, !dbg !71
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !72, metadata !DIExpression()), !dbg !73
  br label %do.body, !dbg !74

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !75
  store i32 %call, i32* %listenSocket, align 4, !dbg !77
  %0 = load i32, i32* %listenSocket, align 4, !dbg !78
  %cmp = icmp eq i32 %0, -1, !dbg !80
  br i1 %cmp, label %if.then, label %if.end, !dbg !81

if.then:                                          ; preds = %do.body
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
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !95
  %cmp2 = icmp eq i32 %call1, -1, !dbg !96
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !97

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !98

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !100
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !102
  %cmp6 = icmp eq i32 %call5, -1, !dbg !103
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !104

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !105

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !107
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !108
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !109
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !110
  %cmp10 = icmp eq i32 %6, -1, !dbg !112
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !113

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !114

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !116
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !117
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !118
  %conv = trunc i64 %call13 to i32, !dbg !118
  store i32 %conv, i32* %recvResult, align 4, !dbg !119
  %8 = load i32, i32* %recvResult, align 4, !dbg !120
  %cmp14 = icmp eq i32 %8, -1, !dbg !122
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !123

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !124
  %cmp16 = icmp eq i32 %9, 0, !dbg !125
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !126

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !127

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !129
  %idxprom = sext i32 %10 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !132
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !133
  store i32 %call21, i32* %data, align 4, !dbg !134
  br label %do.end, !dbg !135

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !136
  %cmp22 = icmp ne i32 %11, -1, !dbg !138
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !139

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !142
  br label %if.end26, !dbg !143

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !144
  %cmp27 = icmp ne i32 %13, -1, !dbg !146
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !147

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !150
  br label %if.end31, !dbg !151

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !152, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !157, metadata !DIExpression()), !dbg !158
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !159
  %15 = bitcast i8* %call32 to i32*, !dbg !160
  store i32* %15, i32** %buffer, align 8, !dbg !158
  %16 = load i32*, i32** %buffer, align 8, !dbg !161
  %cmp33 = icmp eq i32* %16, null, !dbg !163
  br i1 %cmp33, label %if.then35, label %if.end36, !dbg !164

if.then35:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !165
  unreachable, !dbg !165

if.end36:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.end36
  %17 = load i32, i32* %i, align 4, !dbg !170
  %cmp37 = icmp slt i32 %17, 10, !dbg !172
  br i1 %cmp37, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !174
  %19 = load i32, i32* %i, align 4, !dbg !176
  %idxprom39 = sext i32 %19 to i64, !dbg !174
  %arrayidx40 = getelementptr inbounds i32, i32* %18, i64 %idxprom39, !dbg !174
  store i32 0, i32* %arrayidx40, align 4, !dbg !177
  br label %for.inc, !dbg !178

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !179
  %inc = add nsw i32 %20, 1, !dbg !179
  store i32 %inc, i32* %i, align 4, !dbg !179
  br label %for.cond, !dbg !180, !llvm.loop !181

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !184
  %cmp41 = icmp sge i32 %21, 0, !dbg !186
  br i1 %cmp41, label %if.then43, label %if.else, !dbg !187

if.then43:                                        ; preds = %for.end
  %22 = load i32*, i32** %buffer, align 8, !dbg !188
  %23 = load i32, i32* %data, align 4, !dbg !190
  %idxprom44 = sext i32 %23 to i64, !dbg !188
  %arrayidx45 = getelementptr inbounds i32, i32* %22, i64 %idxprom44, !dbg !188
  store i32 1, i32* %arrayidx45, align 4, !dbg !191
  store i32 0, i32* %i, align 4, !dbg !192
  br label %for.cond46, !dbg !194

for.cond46:                                       ; preds = %for.inc52, %if.then43
  %24 = load i32, i32* %i, align 4, !dbg !195
  %cmp47 = icmp slt i32 %24, 10, !dbg !197
  br i1 %cmp47, label %for.body49, label %for.end54, !dbg !198

for.body49:                                       ; preds = %for.cond46
  %25 = load i32*, i32** %buffer, align 8, !dbg !199
  %26 = load i32, i32* %i, align 4, !dbg !201
  %idxprom50 = sext i32 %26 to i64, !dbg !199
  %arrayidx51 = getelementptr inbounds i32, i32* %25, i64 %idxprom50, !dbg !199
  %27 = load i32, i32* %arrayidx51, align 4, !dbg !199
  call void @printIntLine(i32 noundef %27), !dbg !202
  br label %for.inc52, !dbg !203

for.inc52:                                        ; preds = %for.body49
  %28 = load i32, i32* %i, align 4, !dbg !204
  %inc53 = add nsw i32 %28, 1, !dbg !204
  store i32 %inc53, i32* %i, align 4, !dbg !204
  br label %for.cond46, !dbg !205, !llvm.loop !206

for.end54:                                        ; preds = %for.cond46
  br label %if.end55, !dbg !208

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !209
  br label %if.end55

if.end55:                                         ; preds = %if.else, %for.end54
  %29 = load i32*, i32** %buffer, align 8, !dbg !211
  %30 = bitcast i32* %29 to i8*, !dbg !211
  call void @free(i8* noundef %30), !dbg !212
  ret void, !dbg !213
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_good() #0 !dbg !214 {
entry:
  call void @goodB2G1(), !dbg !215
  call void @goodB2G2(), !dbg !216
  call void @goodG2B1(), !dbg !217
  call void @goodG2B2(), !dbg !218
  ret void, !dbg !219
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !220 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !225, metadata !DIExpression()), !dbg !226
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !227, metadata !DIExpression()), !dbg !228
  %call = call i64 @time(i64* noundef null), !dbg !229
  %conv = trunc i64 %call to i32, !dbg !230
  call void @srand(i32 noundef %conv), !dbg !231
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !232
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_good(), !dbg !233
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !234
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !235
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_bad(), !dbg !236
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !237
  ret i32 0, !dbg !238
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !239 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !240, metadata !DIExpression()), !dbg !241
  store i32 -1, i32* %data, align 4, !dbg !242
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !243, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !250, metadata !DIExpression()), !dbg !251
  store i32 -1, i32* %listenSocket, align 4, !dbg !251
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !252, metadata !DIExpression()), !dbg !253
  store i32 -1, i32* %acceptSocket, align 4, !dbg !253
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !254, metadata !DIExpression()), !dbg !255
  br label %do.body, !dbg !256

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !257
  store i32 %call, i32* %listenSocket, align 4, !dbg !259
  %0 = load i32, i32* %listenSocket, align 4, !dbg !260
  %cmp = icmp eq i32 %0, -1, !dbg !262
  br i1 %cmp, label %if.then, label %if.end, !dbg !263

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !264

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !266
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !266
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !267
  store i8 2, i8* %sin_family, align 1, !dbg !268
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !269
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !270
  store i32 0, i32* %s_addr, align 4, !dbg !271
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !272
  store i16 -30871, i16* %sin_port, align 2, !dbg !273
  %2 = load i32, i32* %listenSocket, align 4, !dbg !274
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !276
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !277
  %cmp2 = icmp eq i32 %call1, -1, !dbg !278
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !279

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !280

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !282
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !284
  %cmp6 = icmp eq i32 %call5, -1, !dbg !285
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !286

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !287

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !289
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !290
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !291
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !292
  %cmp10 = icmp eq i32 %6, -1, !dbg !294
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !295

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !296

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !298
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !299
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !300
  %conv = trunc i64 %call13 to i32, !dbg !300
  store i32 %conv, i32* %recvResult, align 4, !dbg !301
  %8 = load i32, i32* %recvResult, align 4, !dbg !302
  %cmp14 = icmp eq i32 %8, -1, !dbg !304
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !305

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !306
  %cmp16 = icmp eq i32 %9, 0, !dbg !307
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !308

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !309

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !311
  %idxprom = sext i32 %10 to i64, !dbg !312
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !312
  store i8 0, i8* %arrayidx, align 1, !dbg !313
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !314
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !315
  store i32 %call21, i32* %data, align 4, !dbg !316
  br label %do.end, !dbg !317

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !318
  %cmp22 = icmp ne i32 %11, -1, !dbg !320
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !321

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !322
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !324
  br label %if.end26, !dbg !325

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !326
  %cmp27 = icmp ne i32 %13, -1, !dbg !328
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !329

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !330
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !332
  br label %if.end31, !dbg !333

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !334, metadata !DIExpression()), !dbg !338
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !339, metadata !DIExpression()), !dbg !340
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !341
  %15 = bitcast i8* %call32 to i32*, !dbg !342
  store i32* %15, i32** %buffer, align 8, !dbg !340
  %16 = load i32*, i32** %buffer, align 8, !dbg !343
  %cmp33 = icmp eq i32* %16, null, !dbg !345
  br i1 %cmp33, label %if.then35, label %if.end36, !dbg !346

if.then35:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !347
  unreachable, !dbg !347

if.end36:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !349
  br label %for.cond, !dbg !351

for.cond:                                         ; preds = %for.inc, %if.end36
  %17 = load i32, i32* %i, align 4, !dbg !352
  %cmp37 = icmp slt i32 %17, 10, !dbg !354
  br i1 %cmp37, label %for.body, label %for.end, !dbg !355

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !356
  %19 = load i32, i32* %i, align 4, !dbg !358
  %idxprom39 = sext i32 %19 to i64, !dbg !356
  %arrayidx40 = getelementptr inbounds i32, i32* %18, i64 %idxprom39, !dbg !356
  store i32 0, i32* %arrayidx40, align 4, !dbg !359
  br label %for.inc, !dbg !360

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !361
  %inc = add nsw i32 %20, 1, !dbg !361
  store i32 %inc, i32* %i, align 4, !dbg !361
  br label %for.cond, !dbg !362, !llvm.loop !363

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !365
  %cmp41 = icmp sge i32 %21, 0, !dbg !367
  br i1 %cmp41, label %land.lhs.true, label %if.else, !dbg !368

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !369
  %cmp43 = icmp slt i32 %22, 10, !dbg !370
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !371

if.then45:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !372
  %24 = load i32, i32* %data, align 4, !dbg !374
  %idxprom46 = sext i32 %24 to i64, !dbg !372
  %arrayidx47 = getelementptr inbounds i32, i32* %23, i64 %idxprom46, !dbg !372
  store i32 1, i32* %arrayidx47, align 4, !dbg !375
  store i32 0, i32* %i, align 4, !dbg !376
  br label %for.cond48, !dbg !378

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %25 = load i32, i32* %i, align 4, !dbg !379
  %cmp49 = icmp slt i32 %25, 10, !dbg !381
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !382

for.body51:                                       ; preds = %for.cond48
  %26 = load i32*, i32** %buffer, align 8, !dbg !383
  %27 = load i32, i32* %i, align 4, !dbg !385
  %idxprom52 = sext i32 %27 to i64, !dbg !383
  %arrayidx53 = getelementptr inbounds i32, i32* %26, i64 %idxprom52, !dbg !383
  %28 = load i32, i32* %arrayidx53, align 4, !dbg !383
  call void @printIntLine(i32 noundef %28), !dbg !386
  br label %for.inc54, !dbg !387

for.inc54:                                        ; preds = %for.body51
  %29 = load i32, i32* %i, align 4, !dbg !388
  %inc55 = add nsw i32 %29, 1, !dbg !388
  store i32 %inc55, i32* %i, align 4, !dbg !388
  br label %for.cond48, !dbg !389, !llvm.loop !390

for.end56:                                        ; preds = %for.cond48
  br label %if.end57, !dbg !392

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !393
  br label %if.end57

if.end57:                                         ; preds = %if.else, %for.end56
  %30 = load i32*, i32** %buffer, align 8, !dbg !395
  %31 = bitcast i32* %30 to i8*, !dbg !395
  call void @free(i8* noundef %31), !dbg !396
  ret void, !dbg !397
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !398 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !399, metadata !DIExpression()), !dbg !400
  store i32 -1, i32* %data, align 4, !dbg !401
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !402, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !407, metadata !DIExpression()), !dbg !408
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !409, metadata !DIExpression()), !dbg !410
  store i32 -1, i32* %listenSocket, align 4, !dbg !410
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !411, metadata !DIExpression()), !dbg !412
  store i32 -1, i32* %acceptSocket, align 4, !dbg !412
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !413, metadata !DIExpression()), !dbg !414
  br label %do.body, !dbg !415

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !416
  store i32 %call, i32* %listenSocket, align 4, !dbg !418
  %0 = load i32, i32* %listenSocket, align 4, !dbg !419
  %cmp = icmp eq i32 %0, -1, !dbg !421
  br i1 %cmp, label %if.then, label %if.end, !dbg !422

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !423

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !425
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !425
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !426
  store i8 2, i8* %sin_family, align 1, !dbg !427
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !428
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !429
  store i32 0, i32* %s_addr, align 4, !dbg !430
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !431
  store i16 -30871, i16* %sin_port, align 2, !dbg !432
  %2 = load i32, i32* %listenSocket, align 4, !dbg !433
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !435
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !436
  %cmp2 = icmp eq i32 %call1, -1, !dbg !437
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !438

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !439

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !441
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !443
  %cmp6 = icmp eq i32 %call5, -1, !dbg !444
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !445

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !446

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !448
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !449
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !450
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !451
  %cmp10 = icmp eq i32 %6, -1, !dbg !453
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !454

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !455

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !457
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !458
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !459
  %conv = trunc i64 %call13 to i32, !dbg !459
  store i32 %conv, i32* %recvResult, align 4, !dbg !460
  %8 = load i32, i32* %recvResult, align 4, !dbg !461
  %cmp14 = icmp eq i32 %8, -1, !dbg !463
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !464

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !465
  %cmp16 = icmp eq i32 %9, 0, !dbg !466
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !467

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !468

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !470
  %idxprom = sext i32 %10 to i64, !dbg !471
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !471
  store i8 0, i8* %arrayidx, align 1, !dbg !472
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !473
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !474
  store i32 %call21, i32* %data, align 4, !dbg !475
  br label %do.end, !dbg !476

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !477
  %cmp22 = icmp ne i32 %11, -1, !dbg !479
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !480

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !481
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !483
  br label %if.end26, !dbg !484

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !485
  %cmp27 = icmp ne i32 %13, -1, !dbg !487
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !488

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !489
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !491
  br label %if.end31, !dbg !492

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !493, metadata !DIExpression()), !dbg !497
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !498, metadata !DIExpression()), !dbg !499
  %call32 = call i8* @malloc(i64 noundef 40) #6, !dbg !500
  %15 = bitcast i8* %call32 to i32*, !dbg !501
  store i32* %15, i32** %buffer, align 8, !dbg !499
  %16 = load i32*, i32** %buffer, align 8, !dbg !502
  %cmp33 = icmp eq i32* %16, null, !dbg !504
  br i1 %cmp33, label %if.then35, label %if.end36, !dbg !505

if.then35:                                        ; preds = %if.end31
  call void @exit(i32 noundef -1) #7, !dbg !506
  unreachable, !dbg !506

if.end36:                                         ; preds = %if.end31
  store i32 0, i32* %i, align 4, !dbg !508
  br label %for.cond, !dbg !510

for.cond:                                         ; preds = %for.inc, %if.end36
  %17 = load i32, i32* %i, align 4, !dbg !511
  %cmp37 = icmp slt i32 %17, 10, !dbg !513
  br i1 %cmp37, label %for.body, label %for.end, !dbg !514

for.body:                                         ; preds = %for.cond
  %18 = load i32*, i32** %buffer, align 8, !dbg !515
  %19 = load i32, i32* %i, align 4, !dbg !517
  %idxprom39 = sext i32 %19 to i64, !dbg !515
  %arrayidx40 = getelementptr inbounds i32, i32* %18, i64 %idxprom39, !dbg !515
  store i32 0, i32* %arrayidx40, align 4, !dbg !518
  br label %for.inc, !dbg !519

for.inc:                                          ; preds = %for.body
  %20 = load i32, i32* %i, align 4, !dbg !520
  %inc = add nsw i32 %20, 1, !dbg !520
  store i32 %inc, i32* %i, align 4, !dbg !520
  br label %for.cond, !dbg !521, !llvm.loop !522

for.end:                                          ; preds = %for.cond
  %21 = load i32, i32* %data, align 4, !dbg !524
  %cmp41 = icmp sge i32 %21, 0, !dbg !526
  br i1 %cmp41, label %land.lhs.true, label %if.else, !dbg !527

land.lhs.true:                                    ; preds = %for.end
  %22 = load i32, i32* %data, align 4, !dbg !528
  %cmp43 = icmp slt i32 %22, 10, !dbg !529
  br i1 %cmp43, label %if.then45, label %if.else, !dbg !530

if.then45:                                        ; preds = %land.lhs.true
  %23 = load i32*, i32** %buffer, align 8, !dbg !531
  %24 = load i32, i32* %data, align 4, !dbg !533
  %idxprom46 = sext i32 %24 to i64, !dbg !531
  %arrayidx47 = getelementptr inbounds i32, i32* %23, i64 %idxprom46, !dbg !531
  store i32 1, i32* %arrayidx47, align 4, !dbg !534
  store i32 0, i32* %i, align 4, !dbg !535
  br label %for.cond48, !dbg !537

for.cond48:                                       ; preds = %for.inc54, %if.then45
  %25 = load i32, i32* %i, align 4, !dbg !538
  %cmp49 = icmp slt i32 %25, 10, !dbg !540
  br i1 %cmp49, label %for.body51, label %for.end56, !dbg !541

for.body51:                                       ; preds = %for.cond48
  %26 = load i32*, i32** %buffer, align 8, !dbg !542
  %27 = load i32, i32* %i, align 4, !dbg !544
  %idxprom52 = sext i32 %27 to i64, !dbg !542
  %arrayidx53 = getelementptr inbounds i32, i32* %26, i64 %idxprom52, !dbg !542
  %28 = load i32, i32* %arrayidx53, align 4, !dbg !542
  call void @printIntLine(i32 noundef %28), !dbg !545
  br label %for.inc54, !dbg !546

for.inc54:                                        ; preds = %for.body51
  %29 = load i32, i32* %i, align 4, !dbg !547
  %inc55 = add nsw i32 %29, 1, !dbg !547
  store i32 %inc55, i32* %i, align 4, !dbg !547
  br label %for.cond48, !dbg !548, !llvm.loop !549

for.end56:                                        ; preds = %for.cond48
  br label %if.end57, !dbg !551

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !552
  br label %if.end57

if.end57:                                         ; preds = %if.else, %for.end56
  %30 = load i32*, i32** %buffer, align 8, !dbg !554
  %31 = bitcast i32* %30 to i8*, !dbg !554
  call void @free(i8* noundef %31), !dbg !555
  ret void, !dbg !556
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !557 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !558, metadata !DIExpression()), !dbg !559
  store i32 -1, i32* %data, align 4, !dbg !560
  store i32 7, i32* %data, align 4, !dbg !561
  call void @llvm.dbg.declare(metadata i32* %i, metadata !564, metadata !DIExpression()), !dbg !568
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !569, metadata !DIExpression()), !dbg !570
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !571
  %0 = bitcast i8* %call to i32*, !dbg !572
  store i32* %0, i32** %buffer, align 8, !dbg !570
  %1 = load i32*, i32** %buffer, align 8, !dbg !573
  %cmp = icmp eq i32* %1, null, !dbg !575
  br i1 %cmp, label %if.then, label %if.end, !dbg !576

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !577
  unreachable, !dbg !577

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !579
  br label %for.cond, !dbg !581

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !582
  %cmp1 = icmp slt i32 %2, 10, !dbg !584
  br i1 %cmp1, label %for.body, label %for.end, !dbg !585

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !586
  %4 = load i32, i32* %i, align 4, !dbg !588
  %idxprom = sext i32 %4 to i64, !dbg !586
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !586
  store i32 0, i32* %arrayidx, align 4, !dbg !589
  br label %for.inc, !dbg !590

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !591
  %inc = add nsw i32 %5, 1, !dbg !591
  store i32 %inc, i32* %i, align 4, !dbg !591
  br label %for.cond, !dbg !592, !llvm.loop !593

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !595
  %cmp2 = icmp sge i32 %6, 0, !dbg !597
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !598

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !599
  %8 = load i32, i32* %data, align 4, !dbg !601
  %idxprom4 = sext i32 %8 to i64, !dbg !599
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !599
  store i32 1, i32* %arrayidx5, align 4, !dbg !602
  store i32 0, i32* %i, align 4, !dbg !603
  br label %for.cond6, !dbg !605

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !606
  %cmp7 = icmp slt i32 %9, 10, !dbg !608
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !609

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !610
  %11 = load i32, i32* %i, align 4, !dbg !612
  %idxprom9 = sext i32 %11 to i64, !dbg !610
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !610
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !610
  call void @printIntLine(i32 noundef %12), !dbg !613
  br label %for.inc11, !dbg !614

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !615
  %inc12 = add nsw i32 %13, 1, !dbg !615
  store i32 %inc12, i32* %i, align 4, !dbg !615
  br label %for.cond6, !dbg !616, !llvm.loop !617

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !619

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !620
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !622
  %15 = bitcast i32* %14 to i8*, !dbg !622
  call void @free(i8* noundef %15), !dbg !623
  ret void, !dbg !624
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !625 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !626, metadata !DIExpression()), !dbg !627
  store i32 -1, i32* %data, align 4, !dbg !628
  store i32 7, i32* %data, align 4, !dbg !629
  call void @llvm.dbg.declare(metadata i32* %i, metadata !632, metadata !DIExpression()), !dbg !636
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !637, metadata !DIExpression()), !dbg !638
  %call = call i8* @malloc(i64 noundef 40) #6, !dbg !639
  %0 = bitcast i8* %call to i32*, !dbg !640
  store i32* %0, i32** %buffer, align 8, !dbg !638
  %1 = load i32*, i32** %buffer, align 8, !dbg !641
  %cmp = icmp eq i32* %1, null, !dbg !643
  br i1 %cmp, label %if.then, label %if.end, !dbg !644

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !645
  unreachable, !dbg !645

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4, !dbg !647
  br label %for.cond, !dbg !649

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32, i32* %i, align 4, !dbg !650
  %cmp1 = icmp slt i32 %2, 10, !dbg !652
  br i1 %cmp1, label %for.body, label %for.end, !dbg !653

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !654
  %4 = load i32, i32* %i, align 4, !dbg !656
  %idxprom = sext i32 %4 to i64, !dbg !654
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !654
  store i32 0, i32* %arrayidx, align 4, !dbg !657
  br label %for.inc, !dbg !658

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !659
  %inc = add nsw i32 %5, 1, !dbg !659
  store i32 %inc, i32* %i, align 4, !dbg !659
  br label %for.cond, !dbg !660, !llvm.loop !661

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !663
  %cmp2 = icmp sge i32 %6, 0, !dbg !665
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !666

if.then3:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !667
  %8 = load i32, i32* %data, align 4, !dbg !669
  %idxprom4 = sext i32 %8 to i64, !dbg !667
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 %idxprom4, !dbg !667
  store i32 1, i32* %arrayidx5, align 4, !dbg !670
  store i32 0, i32* %i, align 4, !dbg !671
  br label %for.cond6, !dbg !673

for.cond6:                                        ; preds = %for.inc11, %if.then3
  %9 = load i32, i32* %i, align 4, !dbg !674
  %cmp7 = icmp slt i32 %9, 10, !dbg !676
  br i1 %cmp7, label %for.body8, label %for.end13, !dbg !677

for.body8:                                        ; preds = %for.cond6
  %10 = load i32*, i32** %buffer, align 8, !dbg !678
  %11 = load i32, i32* %i, align 4, !dbg !680
  %idxprom9 = sext i32 %11 to i64, !dbg !678
  %arrayidx10 = getelementptr inbounds i32, i32* %10, i64 %idxprom9, !dbg !678
  %12 = load i32, i32* %arrayidx10, align 4, !dbg !678
  call void @printIntLine(i32 noundef %12), !dbg !681
  br label %for.inc11, !dbg !682

for.inc11:                                        ; preds = %for.body8
  %13 = load i32, i32* %i, align 4, !dbg !683
  %inc12 = add nsw i32 %13, 1, !dbg !683
  store i32 %inc12, i32* %i, align 4, !dbg !683
  br label %for.cond6, !dbg !684, !llvm.loop !685

for.end13:                                        ; preds = %for.cond6
  br label %if.end14, !dbg !687

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !688
  br label %if.end14

if.end14:                                         ; preds = %if.else, %for.end13
  %14 = load i32*, i32** %buffer, align 8, !dbg !690
  %15 = bitcast i32* %14 to i8*, !dbg !690
  call void @free(i8* noundef %15), !dbg !691
  ret void, !dbg !692
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_bad", scope: !35, file: !35, line: 49, type: !36, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!35 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!36 = !DISubroutineType(types: !37)
!37 = !{null}
!38 = !{}
!39 = !DILocalVariable(name: "data", scope: !34, file: !35, line: 51, type: !25)
!40 = !DILocation(line: 51, column: 9, scope: !34)
!41 = !DILocation(line: 53, column: 10, scope: !34)
!42 = !DILocalVariable(name: "recvResult", scope: !43, file: !35, line: 61, type: !25)
!43 = distinct !DILexicalBlock(scope: !44, file: !35, line: 56, column: 9)
!44 = distinct !DILexicalBlock(scope: !45, file: !35, line: 55, column: 5)
!45 = distinct !DILexicalBlock(scope: !34, file: !35, line: 54, column: 8)
!46 = !DILocation(line: 61, column: 17, scope: !43)
!47 = !DILocalVariable(name: "service", scope: !43, file: !35, line: 62, type: !48)
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
!67 = !DILocation(line: 62, column: 32, scope: !43)
!68 = !DILocalVariable(name: "listenSocket", scope: !43, file: !35, line: 63, type: !25)
!69 = !DILocation(line: 63, column: 20, scope: !43)
!70 = !DILocalVariable(name: "acceptSocket", scope: !43, file: !35, line: 64, type: !25)
!71 = !DILocation(line: 64, column: 20, scope: !43)
!72 = !DILocalVariable(name: "inputBuffer", scope: !43, file: !35, line: 65, type: !20)
!73 = !DILocation(line: 65, column: 18, scope: !43)
!74 = !DILocation(line: 66, column: 13, scope: !43)
!75 = !DILocation(line: 76, column: 32, scope: !76)
!76 = distinct !DILexicalBlock(scope: !43, file: !35, line: 67, column: 13)
!77 = !DILocation(line: 76, column: 30, scope: !76)
!78 = !DILocation(line: 77, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !35, line: 77, column: 21)
!80 = !DILocation(line: 77, column: 34, scope: !79)
!81 = !DILocation(line: 77, column: 21, scope: !76)
!82 = !DILocation(line: 79, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !35, line: 78, column: 17)
!84 = !DILocation(line: 81, column: 17, scope: !76)
!85 = !DILocation(line: 82, column: 25, scope: !76)
!86 = !DILocation(line: 82, column: 36, scope: !76)
!87 = !DILocation(line: 83, column: 25, scope: !76)
!88 = !DILocation(line: 83, column: 34, scope: !76)
!89 = !DILocation(line: 83, column: 41, scope: !76)
!90 = !DILocation(line: 84, column: 25, scope: !76)
!91 = !DILocation(line: 84, column: 34, scope: !76)
!92 = !DILocation(line: 85, column: 26, scope: !93)
!93 = distinct !DILexicalBlock(scope: !76, file: !35, line: 85, column: 21)
!94 = !DILocation(line: 85, column: 40, scope: !93)
!95 = !DILocation(line: 85, column: 21, scope: !93)
!96 = !DILocation(line: 85, column: 85, scope: !93)
!97 = !DILocation(line: 85, column: 21, scope: !76)
!98 = !DILocation(line: 87, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !35, line: 86, column: 17)
!100 = !DILocation(line: 89, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !76, file: !35, line: 89, column: 21)
!102 = !DILocation(line: 89, column: 21, scope: !101)
!103 = !DILocation(line: 89, column: 58, scope: !101)
!104 = !DILocation(line: 89, column: 21, scope: !76)
!105 = !DILocation(line: 91, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !35, line: 90, column: 17)
!107 = !DILocation(line: 93, column: 39, scope: !76)
!108 = !DILocation(line: 93, column: 32, scope: !76)
!109 = !DILocation(line: 93, column: 30, scope: !76)
!110 = !DILocation(line: 94, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !76, file: !35, line: 94, column: 21)
!112 = !DILocation(line: 94, column: 34, scope: !111)
!113 = !DILocation(line: 94, column: 21, scope: !76)
!114 = !DILocation(line: 96, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !35, line: 95, column: 17)
!116 = !DILocation(line: 99, column: 35, scope: !76)
!117 = !DILocation(line: 99, column: 49, scope: !76)
!118 = !DILocation(line: 99, column: 30, scope: !76)
!119 = !DILocation(line: 99, column: 28, scope: !76)
!120 = !DILocation(line: 100, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !76, file: !35, line: 100, column: 21)
!122 = !DILocation(line: 100, column: 32, scope: !121)
!123 = !DILocation(line: 100, column: 48, scope: !121)
!124 = !DILocation(line: 100, column: 51, scope: !121)
!125 = !DILocation(line: 100, column: 62, scope: !121)
!126 = !DILocation(line: 100, column: 21, scope: !76)
!127 = !DILocation(line: 102, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !35, line: 101, column: 17)
!129 = !DILocation(line: 105, column: 29, scope: !76)
!130 = !DILocation(line: 105, column: 17, scope: !76)
!131 = !DILocation(line: 105, column: 41, scope: !76)
!132 = !DILocation(line: 107, column: 29, scope: !76)
!133 = !DILocation(line: 107, column: 24, scope: !76)
!134 = !DILocation(line: 107, column: 22, scope: !76)
!135 = !DILocation(line: 108, column: 13, scope: !76)
!136 = !DILocation(line: 110, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !43, file: !35, line: 110, column: 17)
!138 = !DILocation(line: 110, column: 30, scope: !137)
!139 = !DILocation(line: 110, column: 17, scope: !43)
!140 = !DILocation(line: 112, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !35, line: 111, column: 13)
!142 = !DILocation(line: 112, column: 17, scope: !141)
!143 = !DILocation(line: 113, column: 13, scope: !141)
!144 = !DILocation(line: 114, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !43, file: !35, line: 114, column: 17)
!146 = !DILocation(line: 114, column: 30, scope: !145)
!147 = !DILocation(line: 114, column: 17, scope: !43)
!148 = !DILocation(line: 116, column: 30, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !35, line: 115, column: 13)
!150 = !DILocation(line: 116, column: 17, scope: !149)
!151 = !DILocation(line: 117, column: 13, scope: !149)
!152 = !DILocalVariable(name: "i", scope: !153, file: !35, line: 129, type: !25)
!153 = distinct !DILexicalBlock(scope: !154, file: !35, line: 128, column: 9)
!154 = distinct !DILexicalBlock(scope: !155, file: !35, line: 127, column: 5)
!155 = distinct !DILexicalBlock(scope: !34, file: !35, line: 126, column: 8)
!156 = !DILocation(line: 129, column: 17, scope: !153)
!157 = !DILocalVariable(name: "buffer", scope: !153, file: !35, line: 130, type: !24)
!158 = !DILocation(line: 130, column: 19, scope: !153)
!159 = !DILocation(line: 130, column: 35, scope: !153)
!160 = !DILocation(line: 130, column: 28, scope: !153)
!161 = !DILocation(line: 131, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !153, file: !35, line: 131, column: 17)
!163 = !DILocation(line: 131, column: 24, scope: !162)
!164 = !DILocation(line: 131, column: 17, scope: !153)
!165 = !DILocation(line: 131, column: 34, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !35, line: 131, column: 33)
!167 = !DILocation(line: 133, column: 20, scope: !168)
!168 = distinct !DILexicalBlock(scope: !153, file: !35, line: 133, column: 13)
!169 = !DILocation(line: 133, column: 18, scope: !168)
!170 = !DILocation(line: 133, column: 25, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !35, line: 133, column: 13)
!172 = !DILocation(line: 133, column: 27, scope: !171)
!173 = !DILocation(line: 133, column: 13, scope: !168)
!174 = !DILocation(line: 135, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !35, line: 134, column: 13)
!176 = !DILocation(line: 135, column: 24, scope: !175)
!177 = !DILocation(line: 135, column: 27, scope: !175)
!178 = !DILocation(line: 136, column: 13, scope: !175)
!179 = !DILocation(line: 133, column: 34, scope: !171)
!180 = !DILocation(line: 133, column: 13, scope: !171)
!181 = distinct !{!181, !173, !182, !183}
!182 = !DILocation(line: 136, column: 13, scope: !168)
!183 = !{!"llvm.loop.mustprogress"}
!184 = !DILocation(line: 139, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !153, file: !35, line: 139, column: 17)
!186 = !DILocation(line: 139, column: 22, scope: !185)
!187 = !DILocation(line: 139, column: 17, scope: !153)
!188 = !DILocation(line: 141, column: 17, scope: !189)
!189 = distinct !DILexicalBlock(scope: !185, file: !35, line: 140, column: 13)
!190 = !DILocation(line: 141, column: 24, scope: !189)
!191 = !DILocation(line: 141, column: 30, scope: !189)
!192 = !DILocation(line: 143, column: 23, scope: !193)
!193 = distinct !DILexicalBlock(scope: !189, file: !35, line: 143, column: 17)
!194 = !DILocation(line: 143, column: 21, scope: !193)
!195 = !DILocation(line: 143, column: 28, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !35, line: 143, column: 17)
!197 = !DILocation(line: 143, column: 30, scope: !196)
!198 = !DILocation(line: 143, column: 17, scope: !193)
!199 = !DILocation(line: 145, column: 34, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !35, line: 144, column: 17)
!201 = !DILocation(line: 145, column: 41, scope: !200)
!202 = !DILocation(line: 145, column: 21, scope: !200)
!203 = !DILocation(line: 146, column: 17, scope: !200)
!204 = !DILocation(line: 143, column: 37, scope: !196)
!205 = !DILocation(line: 143, column: 17, scope: !196)
!206 = distinct !{!206, !198, !207, !183}
!207 = !DILocation(line: 146, column: 17, scope: !193)
!208 = !DILocation(line: 147, column: 13, scope: !189)
!209 = !DILocation(line: 150, column: 17, scope: !210)
!210 = distinct !DILexicalBlock(scope: !185, file: !35, line: 149, column: 13)
!211 = !DILocation(line: 152, column: 18, scope: !153)
!212 = !DILocation(line: 152, column: 13, scope: !153)
!213 = !DILocation(line: 155, column: 1, scope: !34)
!214 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_listen_socket_06_good", scope: !35, file: !35, line: 473, type: !36, scopeLine: 474, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!215 = !DILocation(line: 475, column: 5, scope: !214)
!216 = !DILocation(line: 476, column: 5, scope: !214)
!217 = !DILocation(line: 477, column: 5, scope: !214)
!218 = !DILocation(line: 478, column: 5, scope: !214)
!219 = !DILocation(line: 479, column: 1, scope: !214)
!220 = distinct !DISubprogram(name: "main", scope: !35, file: !35, line: 490, type: !221, scopeLine: 491, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !38)
!221 = !DISubroutineType(types: !222)
!222 = !{!25, !25, !223}
!223 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !224, size: 64)
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!225 = !DILocalVariable(name: "argc", arg: 1, scope: !220, file: !35, line: 490, type: !25)
!226 = !DILocation(line: 490, column: 14, scope: !220)
!227 = !DILocalVariable(name: "argv", arg: 2, scope: !220, file: !35, line: 490, type: !223)
!228 = !DILocation(line: 490, column: 27, scope: !220)
!229 = !DILocation(line: 493, column: 22, scope: !220)
!230 = !DILocation(line: 493, column: 12, scope: !220)
!231 = !DILocation(line: 493, column: 5, scope: !220)
!232 = !DILocation(line: 495, column: 5, scope: !220)
!233 = !DILocation(line: 496, column: 5, scope: !220)
!234 = !DILocation(line: 497, column: 5, scope: !220)
!235 = !DILocation(line: 500, column: 5, scope: !220)
!236 = !DILocation(line: 501, column: 5, scope: !220)
!237 = !DILocation(line: 502, column: 5, scope: !220)
!238 = !DILocation(line: 504, column: 5, scope: !220)
!239 = distinct !DISubprogram(name: "goodB2G1", scope: !35, file: !35, line: 162, type: !36, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!240 = !DILocalVariable(name: "data", scope: !239, file: !35, line: 164, type: !25)
!241 = !DILocation(line: 164, column: 9, scope: !239)
!242 = !DILocation(line: 166, column: 10, scope: !239)
!243 = !DILocalVariable(name: "recvResult", scope: !244, file: !35, line: 174, type: !25)
!244 = distinct !DILexicalBlock(scope: !245, file: !35, line: 169, column: 9)
!245 = distinct !DILexicalBlock(scope: !246, file: !35, line: 168, column: 5)
!246 = distinct !DILexicalBlock(scope: !239, file: !35, line: 167, column: 8)
!247 = !DILocation(line: 174, column: 17, scope: !244)
!248 = !DILocalVariable(name: "service", scope: !244, file: !35, line: 175, type: !48)
!249 = !DILocation(line: 175, column: 32, scope: !244)
!250 = !DILocalVariable(name: "listenSocket", scope: !244, file: !35, line: 176, type: !25)
!251 = !DILocation(line: 176, column: 20, scope: !244)
!252 = !DILocalVariable(name: "acceptSocket", scope: !244, file: !35, line: 177, type: !25)
!253 = !DILocation(line: 177, column: 20, scope: !244)
!254 = !DILocalVariable(name: "inputBuffer", scope: !244, file: !35, line: 178, type: !20)
!255 = !DILocation(line: 178, column: 18, scope: !244)
!256 = !DILocation(line: 179, column: 13, scope: !244)
!257 = !DILocation(line: 189, column: 32, scope: !258)
!258 = distinct !DILexicalBlock(scope: !244, file: !35, line: 180, column: 13)
!259 = !DILocation(line: 189, column: 30, scope: !258)
!260 = !DILocation(line: 190, column: 21, scope: !261)
!261 = distinct !DILexicalBlock(scope: !258, file: !35, line: 190, column: 21)
!262 = !DILocation(line: 190, column: 34, scope: !261)
!263 = !DILocation(line: 190, column: 21, scope: !258)
!264 = !DILocation(line: 192, column: 21, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !35, line: 191, column: 17)
!266 = !DILocation(line: 194, column: 17, scope: !258)
!267 = !DILocation(line: 195, column: 25, scope: !258)
!268 = !DILocation(line: 195, column: 36, scope: !258)
!269 = !DILocation(line: 196, column: 25, scope: !258)
!270 = !DILocation(line: 196, column: 34, scope: !258)
!271 = !DILocation(line: 196, column: 41, scope: !258)
!272 = !DILocation(line: 197, column: 25, scope: !258)
!273 = !DILocation(line: 197, column: 34, scope: !258)
!274 = !DILocation(line: 198, column: 26, scope: !275)
!275 = distinct !DILexicalBlock(scope: !258, file: !35, line: 198, column: 21)
!276 = !DILocation(line: 198, column: 40, scope: !275)
!277 = !DILocation(line: 198, column: 21, scope: !275)
!278 = !DILocation(line: 198, column: 85, scope: !275)
!279 = !DILocation(line: 198, column: 21, scope: !258)
!280 = !DILocation(line: 200, column: 21, scope: !281)
!281 = distinct !DILexicalBlock(scope: !275, file: !35, line: 199, column: 17)
!282 = !DILocation(line: 202, column: 28, scope: !283)
!283 = distinct !DILexicalBlock(scope: !258, file: !35, line: 202, column: 21)
!284 = !DILocation(line: 202, column: 21, scope: !283)
!285 = !DILocation(line: 202, column: 58, scope: !283)
!286 = !DILocation(line: 202, column: 21, scope: !258)
!287 = !DILocation(line: 204, column: 21, scope: !288)
!288 = distinct !DILexicalBlock(scope: !283, file: !35, line: 203, column: 17)
!289 = !DILocation(line: 206, column: 39, scope: !258)
!290 = !DILocation(line: 206, column: 32, scope: !258)
!291 = !DILocation(line: 206, column: 30, scope: !258)
!292 = !DILocation(line: 207, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !258, file: !35, line: 207, column: 21)
!294 = !DILocation(line: 207, column: 34, scope: !293)
!295 = !DILocation(line: 207, column: 21, scope: !258)
!296 = !DILocation(line: 209, column: 21, scope: !297)
!297 = distinct !DILexicalBlock(scope: !293, file: !35, line: 208, column: 17)
!298 = !DILocation(line: 212, column: 35, scope: !258)
!299 = !DILocation(line: 212, column: 49, scope: !258)
!300 = !DILocation(line: 212, column: 30, scope: !258)
!301 = !DILocation(line: 212, column: 28, scope: !258)
!302 = !DILocation(line: 213, column: 21, scope: !303)
!303 = distinct !DILexicalBlock(scope: !258, file: !35, line: 213, column: 21)
!304 = !DILocation(line: 213, column: 32, scope: !303)
!305 = !DILocation(line: 213, column: 48, scope: !303)
!306 = !DILocation(line: 213, column: 51, scope: !303)
!307 = !DILocation(line: 213, column: 62, scope: !303)
!308 = !DILocation(line: 213, column: 21, scope: !258)
!309 = !DILocation(line: 215, column: 21, scope: !310)
!310 = distinct !DILexicalBlock(scope: !303, file: !35, line: 214, column: 17)
!311 = !DILocation(line: 218, column: 29, scope: !258)
!312 = !DILocation(line: 218, column: 17, scope: !258)
!313 = !DILocation(line: 218, column: 41, scope: !258)
!314 = !DILocation(line: 220, column: 29, scope: !258)
!315 = !DILocation(line: 220, column: 24, scope: !258)
!316 = !DILocation(line: 220, column: 22, scope: !258)
!317 = !DILocation(line: 221, column: 13, scope: !258)
!318 = !DILocation(line: 223, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !244, file: !35, line: 223, column: 17)
!320 = !DILocation(line: 223, column: 30, scope: !319)
!321 = !DILocation(line: 223, column: 17, scope: !244)
!322 = !DILocation(line: 225, column: 30, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !35, line: 224, column: 13)
!324 = !DILocation(line: 225, column: 17, scope: !323)
!325 = !DILocation(line: 226, column: 13, scope: !323)
!326 = !DILocation(line: 227, column: 17, scope: !327)
!327 = distinct !DILexicalBlock(scope: !244, file: !35, line: 227, column: 17)
!328 = !DILocation(line: 227, column: 30, scope: !327)
!329 = !DILocation(line: 227, column: 17, scope: !244)
!330 = !DILocation(line: 229, column: 30, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !35, line: 228, column: 13)
!332 = !DILocation(line: 229, column: 17, scope: !331)
!333 = !DILocation(line: 230, column: 13, scope: !331)
!334 = !DILocalVariable(name: "i", scope: !335, file: !35, line: 247, type: !25)
!335 = distinct !DILexicalBlock(scope: !336, file: !35, line: 246, column: 9)
!336 = distinct !DILexicalBlock(scope: !337, file: !35, line: 245, column: 5)
!337 = distinct !DILexicalBlock(scope: !239, file: !35, line: 239, column: 8)
!338 = !DILocation(line: 247, column: 17, scope: !335)
!339 = !DILocalVariable(name: "buffer", scope: !335, file: !35, line: 248, type: !24)
!340 = !DILocation(line: 248, column: 19, scope: !335)
!341 = !DILocation(line: 248, column: 35, scope: !335)
!342 = !DILocation(line: 248, column: 28, scope: !335)
!343 = !DILocation(line: 249, column: 17, scope: !344)
!344 = distinct !DILexicalBlock(scope: !335, file: !35, line: 249, column: 17)
!345 = !DILocation(line: 249, column: 24, scope: !344)
!346 = !DILocation(line: 249, column: 17, scope: !335)
!347 = !DILocation(line: 249, column: 34, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !35, line: 249, column: 33)
!349 = !DILocation(line: 251, column: 20, scope: !350)
!350 = distinct !DILexicalBlock(scope: !335, file: !35, line: 251, column: 13)
!351 = !DILocation(line: 251, column: 18, scope: !350)
!352 = !DILocation(line: 251, column: 25, scope: !353)
!353 = distinct !DILexicalBlock(scope: !350, file: !35, line: 251, column: 13)
!354 = !DILocation(line: 251, column: 27, scope: !353)
!355 = !DILocation(line: 251, column: 13, scope: !350)
!356 = !DILocation(line: 253, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !35, line: 252, column: 13)
!358 = !DILocation(line: 253, column: 24, scope: !357)
!359 = !DILocation(line: 253, column: 27, scope: !357)
!360 = !DILocation(line: 254, column: 13, scope: !357)
!361 = !DILocation(line: 251, column: 34, scope: !353)
!362 = !DILocation(line: 251, column: 13, scope: !353)
!363 = distinct !{!363, !355, !364, !183}
!364 = !DILocation(line: 254, column: 13, scope: !350)
!365 = !DILocation(line: 256, column: 17, scope: !366)
!366 = distinct !DILexicalBlock(scope: !335, file: !35, line: 256, column: 17)
!367 = !DILocation(line: 256, column: 22, scope: !366)
!368 = !DILocation(line: 256, column: 27, scope: !366)
!369 = !DILocation(line: 256, column: 30, scope: !366)
!370 = !DILocation(line: 256, column: 35, scope: !366)
!371 = !DILocation(line: 256, column: 17, scope: !335)
!372 = !DILocation(line: 258, column: 17, scope: !373)
!373 = distinct !DILexicalBlock(scope: !366, file: !35, line: 257, column: 13)
!374 = !DILocation(line: 258, column: 24, scope: !373)
!375 = !DILocation(line: 258, column: 30, scope: !373)
!376 = !DILocation(line: 260, column: 23, scope: !377)
!377 = distinct !DILexicalBlock(scope: !373, file: !35, line: 260, column: 17)
!378 = !DILocation(line: 260, column: 21, scope: !377)
!379 = !DILocation(line: 260, column: 28, scope: !380)
!380 = distinct !DILexicalBlock(scope: !377, file: !35, line: 260, column: 17)
!381 = !DILocation(line: 260, column: 30, scope: !380)
!382 = !DILocation(line: 260, column: 17, scope: !377)
!383 = !DILocation(line: 262, column: 34, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !35, line: 261, column: 17)
!385 = !DILocation(line: 262, column: 41, scope: !384)
!386 = !DILocation(line: 262, column: 21, scope: !384)
!387 = !DILocation(line: 263, column: 17, scope: !384)
!388 = !DILocation(line: 260, column: 37, scope: !380)
!389 = !DILocation(line: 260, column: 17, scope: !380)
!390 = distinct !{!390, !382, !391, !183}
!391 = !DILocation(line: 263, column: 17, scope: !377)
!392 = !DILocation(line: 264, column: 13, scope: !373)
!393 = !DILocation(line: 267, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !366, file: !35, line: 266, column: 13)
!395 = !DILocation(line: 269, column: 18, scope: !335)
!396 = !DILocation(line: 269, column: 13, scope: !335)
!397 = !DILocation(line: 272, column: 1, scope: !239)
!398 = distinct !DISubprogram(name: "goodB2G2", scope: !35, file: !35, line: 275, type: !36, scopeLine: 276, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!399 = !DILocalVariable(name: "data", scope: !398, file: !35, line: 277, type: !25)
!400 = !DILocation(line: 277, column: 9, scope: !398)
!401 = !DILocation(line: 279, column: 10, scope: !398)
!402 = !DILocalVariable(name: "recvResult", scope: !403, file: !35, line: 287, type: !25)
!403 = distinct !DILexicalBlock(scope: !404, file: !35, line: 282, column: 9)
!404 = distinct !DILexicalBlock(scope: !405, file: !35, line: 281, column: 5)
!405 = distinct !DILexicalBlock(scope: !398, file: !35, line: 280, column: 8)
!406 = !DILocation(line: 287, column: 17, scope: !403)
!407 = !DILocalVariable(name: "service", scope: !403, file: !35, line: 288, type: !48)
!408 = !DILocation(line: 288, column: 32, scope: !403)
!409 = !DILocalVariable(name: "listenSocket", scope: !403, file: !35, line: 289, type: !25)
!410 = !DILocation(line: 289, column: 20, scope: !403)
!411 = !DILocalVariable(name: "acceptSocket", scope: !403, file: !35, line: 290, type: !25)
!412 = !DILocation(line: 290, column: 20, scope: !403)
!413 = !DILocalVariable(name: "inputBuffer", scope: !403, file: !35, line: 291, type: !20)
!414 = !DILocation(line: 291, column: 18, scope: !403)
!415 = !DILocation(line: 292, column: 13, scope: !403)
!416 = !DILocation(line: 302, column: 32, scope: !417)
!417 = distinct !DILexicalBlock(scope: !403, file: !35, line: 293, column: 13)
!418 = !DILocation(line: 302, column: 30, scope: !417)
!419 = !DILocation(line: 303, column: 21, scope: !420)
!420 = distinct !DILexicalBlock(scope: !417, file: !35, line: 303, column: 21)
!421 = !DILocation(line: 303, column: 34, scope: !420)
!422 = !DILocation(line: 303, column: 21, scope: !417)
!423 = !DILocation(line: 305, column: 21, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !35, line: 304, column: 17)
!425 = !DILocation(line: 307, column: 17, scope: !417)
!426 = !DILocation(line: 308, column: 25, scope: !417)
!427 = !DILocation(line: 308, column: 36, scope: !417)
!428 = !DILocation(line: 309, column: 25, scope: !417)
!429 = !DILocation(line: 309, column: 34, scope: !417)
!430 = !DILocation(line: 309, column: 41, scope: !417)
!431 = !DILocation(line: 310, column: 25, scope: !417)
!432 = !DILocation(line: 310, column: 34, scope: !417)
!433 = !DILocation(line: 311, column: 26, scope: !434)
!434 = distinct !DILexicalBlock(scope: !417, file: !35, line: 311, column: 21)
!435 = !DILocation(line: 311, column: 40, scope: !434)
!436 = !DILocation(line: 311, column: 21, scope: !434)
!437 = !DILocation(line: 311, column: 85, scope: !434)
!438 = !DILocation(line: 311, column: 21, scope: !417)
!439 = !DILocation(line: 313, column: 21, scope: !440)
!440 = distinct !DILexicalBlock(scope: !434, file: !35, line: 312, column: 17)
!441 = !DILocation(line: 315, column: 28, scope: !442)
!442 = distinct !DILexicalBlock(scope: !417, file: !35, line: 315, column: 21)
!443 = !DILocation(line: 315, column: 21, scope: !442)
!444 = !DILocation(line: 315, column: 58, scope: !442)
!445 = !DILocation(line: 315, column: 21, scope: !417)
!446 = !DILocation(line: 317, column: 21, scope: !447)
!447 = distinct !DILexicalBlock(scope: !442, file: !35, line: 316, column: 17)
!448 = !DILocation(line: 319, column: 39, scope: !417)
!449 = !DILocation(line: 319, column: 32, scope: !417)
!450 = !DILocation(line: 319, column: 30, scope: !417)
!451 = !DILocation(line: 320, column: 21, scope: !452)
!452 = distinct !DILexicalBlock(scope: !417, file: !35, line: 320, column: 21)
!453 = !DILocation(line: 320, column: 34, scope: !452)
!454 = !DILocation(line: 320, column: 21, scope: !417)
!455 = !DILocation(line: 322, column: 21, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !35, line: 321, column: 17)
!457 = !DILocation(line: 325, column: 35, scope: !417)
!458 = !DILocation(line: 325, column: 49, scope: !417)
!459 = !DILocation(line: 325, column: 30, scope: !417)
!460 = !DILocation(line: 325, column: 28, scope: !417)
!461 = !DILocation(line: 326, column: 21, scope: !462)
!462 = distinct !DILexicalBlock(scope: !417, file: !35, line: 326, column: 21)
!463 = !DILocation(line: 326, column: 32, scope: !462)
!464 = !DILocation(line: 326, column: 48, scope: !462)
!465 = !DILocation(line: 326, column: 51, scope: !462)
!466 = !DILocation(line: 326, column: 62, scope: !462)
!467 = !DILocation(line: 326, column: 21, scope: !417)
!468 = !DILocation(line: 328, column: 21, scope: !469)
!469 = distinct !DILexicalBlock(scope: !462, file: !35, line: 327, column: 17)
!470 = !DILocation(line: 331, column: 29, scope: !417)
!471 = !DILocation(line: 331, column: 17, scope: !417)
!472 = !DILocation(line: 331, column: 41, scope: !417)
!473 = !DILocation(line: 333, column: 29, scope: !417)
!474 = !DILocation(line: 333, column: 24, scope: !417)
!475 = !DILocation(line: 333, column: 22, scope: !417)
!476 = !DILocation(line: 334, column: 13, scope: !417)
!477 = !DILocation(line: 336, column: 17, scope: !478)
!478 = distinct !DILexicalBlock(scope: !403, file: !35, line: 336, column: 17)
!479 = !DILocation(line: 336, column: 30, scope: !478)
!480 = !DILocation(line: 336, column: 17, scope: !403)
!481 = !DILocation(line: 338, column: 30, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !35, line: 337, column: 13)
!483 = !DILocation(line: 338, column: 17, scope: !482)
!484 = !DILocation(line: 339, column: 13, scope: !482)
!485 = !DILocation(line: 340, column: 17, scope: !486)
!486 = distinct !DILexicalBlock(scope: !403, file: !35, line: 340, column: 17)
!487 = !DILocation(line: 340, column: 30, scope: !486)
!488 = !DILocation(line: 340, column: 17, scope: !403)
!489 = !DILocation(line: 342, column: 30, scope: !490)
!490 = distinct !DILexicalBlock(scope: !486, file: !35, line: 341, column: 13)
!491 = !DILocation(line: 342, column: 17, scope: !490)
!492 = !DILocation(line: 343, column: 13, scope: !490)
!493 = !DILocalVariable(name: "i", scope: !494, file: !35, line: 355, type: !25)
!494 = distinct !DILexicalBlock(scope: !495, file: !35, line: 354, column: 9)
!495 = distinct !DILexicalBlock(scope: !496, file: !35, line: 353, column: 5)
!496 = distinct !DILexicalBlock(scope: !398, file: !35, line: 352, column: 8)
!497 = !DILocation(line: 355, column: 17, scope: !494)
!498 = !DILocalVariable(name: "buffer", scope: !494, file: !35, line: 356, type: !24)
!499 = !DILocation(line: 356, column: 19, scope: !494)
!500 = !DILocation(line: 356, column: 35, scope: !494)
!501 = !DILocation(line: 356, column: 28, scope: !494)
!502 = !DILocation(line: 357, column: 17, scope: !503)
!503 = distinct !DILexicalBlock(scope: !494, file: !35, line: 357, column: 17)
!504 = !DILocation(line: 357, column: 24, scope: !503)
!505 = !DILocation(line: 357, column: 17, scope: !494)
!506 = !DILocation(line: 357, column: 34, scope: !507)
!507 = distinct !DILexicalBlock(scope: !503, file: !35, line: 357, column: 33)
!508 = !DILocation(line: 359, column: 20, scope: !509)
!509 = distinct !DILexicalBlock(scope: !494, file: !35, line: 359, column: 13)
!510 = !DILocation(line: 359, column: 18, scope: !509)
!511 = !DILocation(line: 359, column: 25, scope: !512)
!512 = distinct !DILexicalBlock(scope: !509, file: !35, line: 359, column: 13)
!513 = !DILocation(line: 359, column: 27, scope: !512)
!514 = !DILocation(line: 359, column: 13, scope: !509)
!515 = !DILocation(line: 361, column: 17, scope: !516)
!516 = distinct !DILexicalBlock(scope: !512, file: !35, line: 360, column: 13)
!517 = !DILocation(line: 361, column: 24, scope: !516)
!518 = !DILocation(line: 361, column: 27, scope: !516)
!519 = !DILocation(line: 362, column: 13, scope: !516)
!520 = !DILocation(line: 359, column: 34, scope: !512)
!521 = !DILocation(line: 359, column: 13, scope: !512)
!522 = distinct !{!522, !514, !523, !183}
!523 = !DILocation(line: 362, column: 13, scope: !509)
!524 = !DILocation(line: 364, column: 17, scope: !525)
!525 = distinct !DILexicalBlock(scope: !494, file: !35, line: 364, column: 17)
!526 = !DILocation(line: 364, column: 22, scope: !525)
!527 = !DILocation(line: 364, column: 27, scope: !525)
!528 = !DILocation(line: 364, column: 30, scope: !525)
!529 = !DILocation(line: 364, column: 35, scope: !525)
!530 = !DILocation(line: 364, column: 17, scope: !494)
!531 = !DILocation(line: 366, column: 17, scope: !532)
!532 = distinct !DILexicalBlock(scope: !525, file: !35, line: 365, column: 13)
!533 = !DILocation(line: 366, column: 24, scope: !532)
!534 = !DILocation(line: 366, column: 30, scope: !532)
!535 = !DILocation(line: 368, column: 23, scope: !536)
!536 = distinct !DILexicalBlock(scope: !532, file: !35, line: 368, column: 17)
!537 = !DILocation(line: 368, column: 21, scope: !536)
!538 = !DILocation(line: 368, column: 28, scope: !539)
!539 = distinct !DILexicalBlock(scope: !536, file: !35, line: 368, column: 17)
!540 = !DILocation(line: 368, column: 30, scope: !539)
!541 = !DILocation(line: 368, column: 17, scope: !536)
!542 = !DILocation(line: 370, column: 34, scope: !543)
!543 = distinct !DILexicalBlock(scope: !539, file: !35, line: 369, column: 17)
!544 = !DILocation(line: 370, column: 41, scope: !543)
!545 = !DILocation(line: 370, column: 21, scope: !543)
!546 = !DILocation(line: 371, column: 17, scope: !543)
!547 = !DILocation(line: 368, column: 37, scope: !539)
!548 = !DILocation(line: 368, column: 17, scope: !539)
!549 = distinct !{!549, !541, !550, !183}
!550 = !DILocation(line: 371, column: 17, scope: !536)
!551 = !DILocation(line: 372, column: 13, scope: !532)
!552 = !DILocation(line: 375, column: 17, scope: !553)
!553 = distinct !DILexicalBlock(scope: !525, file: !35, line: 374, column: 13)
!554 = !DILocation(line: 377, column: 18, scope: !494)
!555 = !DILocation(line: 377, column: 13, scope: !494)
!556 = !DILocation(line: 380, column: 1, scope: !398)
!557 = distinct !DISubprogram(name: "goodG2B1", scope: !35, file: !35, line: 383, type: !36, scopeLine: 384, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!558 = !DILocalVariable(name: "data", scope: !557, file: !35, line: 385, type: !25)
!559 = !DILocation(line: 385, column: 9, scope: !557)
!560 = !DILocation(line: 387, column: 10, scope: !557)
!561 = !DILocation(line: 397, column: 14, scope: !562)
!562 = distinct !DILexicalBlock(scope: !563, file: !35, line: 394, column: 5)
!563 = distinct !DILexicalBlock(scope: !557, file: !35, line: 388, column: 8)
!564 = !DILocalVariable(name: "i", scope: !565, file: !35, line: 402, type: !25)
!565 = distinct !DILexicalBlock(scope: !566, file: !35, line: 401, column: 9)
!566 = distinct !DILexicalBlock(scope: !567, file: !35, line: 400, column: 5)
!567 = distinct !DILexicalBlock(scope: !557, file: !35, line: 399, column: 8)
!568 = !DILocation(line: 402, column: 17, scope: !565)
!569 = !DILocalVariable(name: "buffer", scope: !565, file: !35, line: 403, type: !24)
!570 = !DILocation(line: 403, column: 19, scope: !565)
!571 = !DILocation(line: 403, column: 35, scope: !565)
!572 = !DILocation(line: 403, column: 28, scope: !565)
!573 = !DILocation(line: 404, column: 17, scope: !574)
!574 = distinct !DILexicalBlock(scope: !565, file: !35, line: 404, column: 17)
!575 = !DILocation(line: 404, column: 24, scope: !574)
!576 = !DILocation(line: 404, column: 17, scope: !565)
!577 = !DILocation(line: 404, column: 34, scope: !578)
!578 = distinct !DILexicalBlock(scope: !574, file: !35, line: 404, column: 33)
!579 = !DILocation(line: 406, column: 20, scope: !580)
!580 = distinct !DILexicalBlock(scope: !565, file: !35, line: 406, column: 13)
!581 = !DILocation(line: 406, column: 18, scope: !580)
!582 = !DILocation(line: 406, column: 25, scope: !583)
!583 = distinct !DILexicalBlock(scope: !580, file: !35, line: 406, column: 13)
!584 = !DILocation(line: 406, column: 27, scope: !583)
!585 = !DILocation(line: 406, column: 13, scope: !580)
!586 = !DILocation(line: 408, column: 17, scope: !587)
!587 = distinct !DILexicalBlock(scope: !583, file: !35, line: 407, column: 13)
!588 = !DILocation(line: 408, column: 24, scope: !587)
!589 = !DILocation(line: 408, column: 27, scope: !587)
!590 = !DILocation(line: 409, column: 13, scope: !587)
!591 = !DILocation(line: 406, column: 34, scope: !583)
!592 = !DILocation(line: 406, column: 13, scope: !583)
!593 = distinct !{!593, !585, !594, !183}
!594 = !DILocation(line: 409, column: 13, scope: !580)
!595 = !DILocation(line: 412, column: 17, scope: !596)
!596 = distinct !DILexicalBlock(scope: !565, file: !35, line: 412, column: 17)
!597 = !DILocation(line: 412, column: 22, scope: !596)
!598 = !DILocation(line: 412, column: 17, scope: !565)
!599 = !DILocation(line: 414, column: 17, scope: !600)
!600 = distinct !DILexicalBlock(scope: !596, file: !35, line: 413, column: 13)
!601 = !DILocation(line: 414, column: 24, scope: !600)
!602 = !DILocation(line: 414, column: 30, scope: !600)
!603 = !DILocation(line: 416, column: 23, scope: !604)
!604 = distinct !DILexicalBlock(scope: !600, file: !35, line: 416, column: 17)
!605 = !DILocation(line: 416, column: 21, scope: !604)
!606 = !DILocation(line: 416, column: 28, scope: !607)
!607 = distinct !DILexicalBlock(scope: !604, file: !35, line: 416, column: 17)
!608 = !DILocation(line: 416, column: 30, scope: !607)
!609 = !DILocation(line: 416, column: 17, scope: !604)
!610 = !DILocation(line: 418, column: 34, scope: !611)
!611 = distinct !DILexicalBlock(scope: !607, file: !35, line: 417, column: 17)
!612 = !DILocation(line: 418, column: 41, scope: !611)
!613 = !DILocation(line: 418, column: 21, scope: !611)
!614 = !DILocation(line: 419, column: 17, scope: !611)
!615 = !DILocation(line: 416, column: 37, scope: !607)
!616 = !DILocation(line: 416, column: 17, scope: !607)
!617 = distinct !{!617, !609, !618, !183}
!618 = !DILocation(line: 419, column: 17, scope: !604)
!619 = !DILocation(line: 420, column: 13, scope: !600)
!620 = !DILocation(line: 423, column: 17, scope: !621)
!621 = distinct !DILexicalBlock(scope: !596, file: !35, line: 422, column: 13)
!622 = !DILocation(line: 425, column: 18, scope: !565)
!623 = !DILocation(line: 425, column: 13, scope: !565)
!624 = !DILocation(line: 428, column: 1, scope: !557)
!625 = distinct !DISubprogram(name: "goodG2B2", scope: !35, file: !35, line: 431, type: !36, scopeLine: 432, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !38)
!626 = !DILocalVariable(name: "data", scope: !625, file: !35, line: 433, type: !25)
!627 = !DILocation(line: 433, column: 9, scope: !625)
!628 = !DILocation(line: 435, column: 10, scope: !625)
!629 = !DILocation(line: 440, column: 14, scope: !630)
!630 = distinct !DILexicalBlock(scope: !631, file: !35, line: 437, column: 5)
!631 = distinct !DILexicalBlock(scope: !625, file: !35, line: 436, column: 8)
!632 = !DILocalVariable(name: "i", scope: !633, file: !35, line: 445, type: !25)
!633 = distinct !DILexicalBlock(scope: !634, file: !35, line: 444, column: 9)
!634 = distinct !DILexicalBlock(scope: !635, file: !35, line: 443, column: 5)
!635 = distinct !DILexicalBlock(scope: !625, file: !35, line: 442, column: 8)
!636 = !DILocation(line: 445, column: 17, scope: !633)
!637 = !DILocalVariable(name: "buffer", scope: !633, file: !35, line: 446, type: !24)
!638 = !DILocation(line: 446, column: 19, scope: !633)
!639 = !DILocation(line: 446, column: 35, scope: !633)
!640 = !DILocation(line: 446, column: 28, scope: !633)
!641 = !DILocation(line: 447, column: 17, scope: !642)
!642 = distinct !DILexicalBlock(scope: !633, file: !35, line: 447, column: 17)
!643 = !DILocation(line: 447, column: 24, scope: !642)
!644 = !DILocation(line: 447, column: 17, scope: !633)
!645 = !DILocation(line: 447, column: 34, scope: !646)
!646 = distinct !DILexicalBlock(scope: !642, file: !35, line: 447, column: 33)
!647 = !DILocation(line: 449, column: 20, scope: !648)
!648 = distinct !DILexicalBlock(scope: !633, file: !35, line: 449, column: 13)
!649 = !DILocation(line: 449, column: 18, scope: !648)
!650 = !DILocation(line: 449, column: 25, scope: !651)
!651 = distinct !DILexicalBlock(scope: !648, file: !35, line: 449, column: 13)
!652 = !DILocation(line: 449, column: 27, scope: !651)
!653 = !DILocation(line: 449, column: 13, scope: !648)
!654 = !DILocation(line: 451, column: 17, scope: !655)
!655 = distinct !DILexicalBlock(scope: !651, file: !35, line: 450, column: 13)
!656 = !DILocation(line: 451, column: 24, scope: !655)
!657 = !DILocation(line: 451, column: 27, scope: !655)
!658 = !DILocation(line: 452, column: 13, scope: !655)
!659 = !DILocation(line: 449, column: 34, scope: !651)
!660 = !DILocation(line: 449, column: 13, scope: !651)
!661 = distinct !{!661, !653, !662, !183}
!662 = !DILocation(line: 452, column: 13, scope: !648)
!663 = !DILocation(line: 455, column: 17, scope: !664)
!664 = distinct !DILexicalBlock(scope: !633, file: !35, line: 455, column: 17)
!665 = !DILocation(line: 455, column: 22, scope: !664)
!666 = !DILocation(line: 455, column: 17, scope: !633)
!667 = !DILocation(line: 457, column: 17, scope: !668)
!668 = distinct !DILexicalBlock(scope: !664, file: !35, line: 456, column: 13)
!669 = !DILocation(line: 457, column: 24, scope: !668)
!670 = !DILocation(line: 457, column: 30, scope: !668)
!671 = !DILocation(line: 459, column: 23, scope: !672)
!672 = distinct !DILexicalBlock(scope: !668, file: !35, line: 459, column: 17)
!673 = !DILocation(line: 459, column: 21, scope: !672)
!674 = !DILocation(line: 459, column: 28, scope: !675)
!675 = distinct !DILexicalBlock(scope: !672, file: !35, line: 459, column: 17)
!676 = !DILocation(line: 459, column: 30, scope: !675)
!677 = !DILocation(line: 459, column: 17, scope: !672)
!678 = !DILocation(line: 461, column: 34, scope: !679)
!679 = distinct !DILexicalBlock(scope: !675, file: !35, line: 460, column: 17)
!680 = !DILocation(line: 461, column: 41, scope: !679)
!681 = !DILocation(line: 461, column: 21, scope: !679)
!682 = !DILocation(line: 462, column: 17, scope: !679)
!683 = !DILocation(line: 459, column: 37, scope: !675)
!684 = !DILocation(line: 459, column: 17, scope: !675)
!685 = distinct !{!685, !677, !686, !183}
!686 = !DILocation(line: 462, column: 17, scope: !672)
!687 = !DILocation(line: 463, column: 13, scope: !668)
!688 = !DILocation(line: 466, column: 17, scope: !689)
!689 = distinct !DILexicalBlock(scope: !664, file: !35, line: 465, column: 13)
!690 = !DILocation(line: 468, column: 18, scope: !633)
!691 = !DILocation(line: 468, column: 13, scope: !633)
!692 = !DILocation(line: 471, column: 1, scope: !625)
