; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@GLOBAL_CONST_TRUE = external constant i32, align 4
@.str = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external constant i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09_bad() #0 !dbg !31 {
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
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !40
  %tobool = icmp ne i32 %0, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end33, !dbg !42

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
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !75
  store i32 %call, i32* %listenSocket, align 4, !dbg !77
  %1 = load i32, i32* %listenSocket, align 4, !dbg !78
  %cmp = icmp eq i32 %1, -1, !dbg !80
  br i1 %cmp, label %if.then1, label %if.end, !dbg !81

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !82

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !84
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !84
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !85
  store i8 2, i8* %sin_family, align 1, !dbg !86
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !87
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !88
  store i32 0, i32* %s_addr, align 4, !dbg !89
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !90
  store i16 -30871, i16* %sin_port, align 2, !dbg !91
  %3 = load i32, i32* %listenSocket, align 4, !dbg !92
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !94
  %call2 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !95
  %cmp3 = icmp eq i32 %call2, -1, !dbg !96
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !97

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !98

if.end5:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !100
  %call6 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !102
  %cmp7 = icmp eq i32 %call6, -1, !dbg !103
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !104

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !105

if.end9:                                          ; preds = %if.end5
  %6 = load i32, i32* %listenSocket, align 4, !dbg !107
  %call10 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !108
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !109
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !110
  %cmp11 = icmp eq i32 %7, -1, !dbg !112
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !113

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !114

if.end13:                                         ; preds = %if.end9
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !116
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !117
  %call14 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !118
  %conv = trunc i64 %call14 to i32, !dbg !118
  store i32 %conv, i32* %recvResult, align 4, !dbg !119
  %9 = load i32, i32* %recvResult, align 4, !dbg !120
  %cmp15 = icmp eq i32 %9, -1, !dbg !122
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !123

lor.lhs.false:                                    ; preds = %if.end13
  %10 = load i32, i32* %recvResult, align 4, !dbg !124
  %cmp17 = icmp eq i32 %10, 0, !dbg !125
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !126

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !127

if.end20:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !129
  %idxprom = sext i32 %11 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !132
  %call22 = call i32 @atoi(i8* noundef %arraydecay21), !dbg !133
  store i32 %call22, i32* %data, align 4, !dbg !134
  br label %do.end, !dbg !135

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !136
  %cmp23 = icmp ne i32 %12, -1, !dbg !138
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !139

if.then25:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call26 = call i32 @"\01_close"(i32 noundef %13), !dbg !142
  br label %if.end27, !dbg !143

if.end27:                                         ; preds = %if.then25, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !144
  %cmp28 = icmp ne i32 %14, -1, !dbg !146
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !147

if.then30:                                        ; preds = %if.end27
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %call31 = call i32 @"\01_close"(i32 noundef %15), !dbg !150
  br label %if.end32, !dbg !151

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %if.end33, !dbg !152

if.end33:                                         ; preds = %if.end32, %entry
  %16 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !153
  %tobool34 = icmp ne i32 %16, 0, !dbg !153
  br i1 %tobool34, label %if.then35, label %if.end46, !dbg !155

if.then35:                                        ; preds = %if.end33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !156, metadata !DIExpression()), !dbg !159
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !160, metadata !DIExpression()), !dbg !164
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !164
  %18 = load i32, i32* %data, align 4, !dbg !165
  %cmp36 = icmp sge i32 %18, 0, !dbg !167
  br i1 %cmp36, label %if.then38, label %if.else, !dbg !168

if.then38:                                        ; preds = %if.then35
  %19 = load i32, i32* %data, align 4, !dbg !169
  %idxprom39 = sext i32 %19 to i64, !dbg !171
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !171
  store i32 1, i32* %arrayidx40, align 4, !dbg !172
  store i32 0, i32* %i, align 4, !dbg !173
  br label %for.cond, !dbg !175

for.cond:                                         ; preds = %for.inc, %if.then38
  %20 = load i32, i32* %i, align 4, !dbg !176
  %cmp41 = icmp slt i32 %20, 10, !dbg !178
  br i1 %cmp41, label %for.body, label %for.end, !dbg !179

for.body:                                         ; preds = %for.cond
  %21 = load i32, i32* %i, align 4, !dbg !180
  %idxprom43 = sext i32 %21 to i64, !dbg !182
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !182
  %22 = load i32, i32* %arrayidx44, align 4, !dbg !182
  call void @printIntLine(i32 noundef %22), !dbg !183
  br label %for.inc, !dbg !184

for.inc:                                          ; preds = %for.body
  %23 = load i32, i32* %i, align 4, !dbg !185
  %inc = add nsw i32 %23, 1, !dbg !185
  store i32 %inc, i32* %i, align 4, !dbg !185
  br label %for.cond, !dbg !186, !llvm.loop !187

for.end:                                          ; preds = %for.cond
  br label %if.end45, !dbg !190

if.else:                                          ; preds = %if.then35
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !191
  br label %if.end45

if.end45:                                         ; preds = %if.else, %for.end
  br label %if.end46, !dbg !193

if.end46:                                         ; preds = %if.end45, %if.end33
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09_good() #0 !dbg !195 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09_good(), !dbg !214
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !215
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !216
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09_bad(), !dbg !217
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !218
  ret i32 0, !dbg !219
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !220 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !221, metadata !DIExpression()), !dbg !222
  store i32 -1, i32* %data, align 4, !dbg !223
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !224
  %tobool = icmp ne i32 %0, 0, !dbg !224
  br i1 %tobool, label %if.then, label %if.end33, !dbg !226

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !227, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !231, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !233, metadata !DIExpression()), !dbg !234
  store i32 -1, i32* %listenSocket, align 4, !dbg !234
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 -1, i32* %acceptSocket, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !237, metadata !DIExpression()), !dbg !238
  br label %do.body, !dbg !239

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !240
  store i32 %call, i32* %listenSocket, align 4, !dbg !242
  %1 = load i32, i32* %listenSocket, align 4, !dbg !243
  %cmp = icmp eq i32 %1, -1, !dbg !245
  br i1 %cmp, label %if.then1, label %if.end, !dbg !246

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !247

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !249
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !249
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !250
  store i8 2, i8* %sin_family, align 1, !dbg !251
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !252
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !253
  store i32 0, i32* %s_addr, align 4, !dbg !254
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !255
  store i16 -30871, i16* %sin_port, align 2, !dbg !256
  %3 = load i32, i32* %listenSocket, align 4, !dbg !257
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !259
  %call2 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !260
  %cmp3 = icmp eq i32 %call2, -1, !dbg !261
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !262

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !263

if.end5:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !265
  %call6 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !267
  %cmp7 = icmp eq i32 %call6, -1, !dbg !268
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !269

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !270

if.end9:                                          ; preds = %if.end5
  %6 = load i32, i32* %listenSocket, align 4, !dbg !272
  %call10 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !273
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !274
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !275
  %cmp11 = icmp eq i32 %7, -1, !dbg !277
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !278

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !279

if.end13:                                         ; preds = %if.end9
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !281
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !282
  %call14 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !283
  %conv = trunc i64 %call14 to i32, !dbg !283
  store i32 %conv, i32* %recvResult, align 4, !dbg !284
  %9 = load i32, i32* %recvResult, align 4, !dbg !285
  %cmp15 = icmp eq i32 %9, -1, !dbg !287
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !288

lor.lhs.false:                                    ; preds = %if.end13
  %10 = load i32, i32* %recvResult, align 4, !dbg !289
  %cmp17 = icmp eq i32 %10, 0, !dbg !290
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !291

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !292

if.end20:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !294
  %idxprom = sext i32 %11 to i64, !dbg !295
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !295
  store i8 0, i8* %arrayidx, align 1, !dbg !296
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !297
  %call22 = call i32 @atoi(i8* noundef %arraydecay21), !dbg !298
  store i32 %call22, i32* %data, align 4, !dbg !299
  br label %do.end, !dbg !300

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !301
  %cmp23 = icmp ne i32 %12, -1, !dbg !303
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !304

if.then25:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !305
  %call26 = call i32 @"\01_close"(i32 noundef %13), !dbg !307
  br label %if.end27, !dbg !308

if.end27:                                         ; preds = %if.then25, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !309
  %cmp28 = icmp ne i32 %14, -1, !dbg !311
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !312

if.then30:                                        ; preds = %if.end27
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !313
  %call31 = call i32 @"\01_close"(i32 noundef %15), !dbg !315
  br label %if.end32, !dbg !316

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %if.end33, !dbg !317

if.end33:                                         ; preds = %if.end32, %entry
  %16 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !318
  %tobool34 = icmp ne i32 %16, 0, !dbg !318
  br i1 %tobool34, label %if.then35, label %if.else, !dbg !320

if.then35:                                        ; preds = %if.end33
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !321
  br label %if.end49, !dbg !323

if.else:                                          ; preds = %if.end33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !324, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !328, metadata !DIExpression()), !dbg !329
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !329
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !329
  %18 = load i32, i32* %data, align 4, !dbg !330
  %cmp36 = icmp sge i32 %18, 0, !dbg !332
  br i1 %cmp36, label %land.lhs.true, label %if.else47, !dbg !333

land.lhs.true:                                    ; preds = %if.else
  %19 = load i32, i32* %data, align 4, !dbg !334
  %cmp38 = icmp slt i32 %19, 10, !dbg !335
  br i1 %cmp38, label %if.then40, label %if.else47, !dbg !336

if.then40:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !337
  %idxprom41 = sext i32 %20 to i64, !dbg !339
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !339
  store i32 1, i32* %arrayidx42, align 4, !dbg !340
  store i32 0, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !343

for.cond:                                         ; preds = %for.inc, %if.then40
  %21 = load i32, i32* %i, align 4, !dbg !344
  %cmp43 = icmp slt i32 %21, 10, !dbg !346
  br i1 %cmp43, label %for.body, label %for.end, !dbg !347

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !348
  %idxprom45 = sext i32 %22 to i64, !dbg !350
  %arrayidx46 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom45, !dbg !350
  %23 = load i32, i32* %arrayidx46, align 4, !dbg !350
  call void @printIntLine(i32 noundef %23), !dbg !351
  br label %for.inc, !dbg !352

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !353
  %inc = add nsw i32 %24, 1, !dbg !353
  store i32 %inc, i32* %i, align 4, !dbg !353
  br label %for.cond, !dbg !354, !llvm.loop !355

for.end:                                          ; preds = %for.cond
  br label %if.end48, !dbg !357

if.else47:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !358
  br label %if.end48

if.end48:                                         ; preds = %if.else47, %for.end
  br label %if.end49

if.end49:                                         ; preds = %if.end48, %if.then35
  ret void, !dbg !360
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !361 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !362, metadata !DIExpression()), !dbg !363
  store i32 -1, i32* %data, align 4, !dbg !364
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !365
  %tobool = icmp ne i32 %0, 0, !dbg !365
  br i1 %tobool, label %if.then, label %if.end33, !dbg !367

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !368, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !372, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !374, metadata !DIExpression()), !dbg !375
  store i32 -1, i32* %listenSocket, align 4, !dbg !375
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !376, metadata !DIExpression()), !dbg !377
  store i32 -1, i32* %acceptSocket, align 4, !dbg !377
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !378, metadata !DIExpression()), !dbg !379
  br label %do.body, !dbg !380

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !381
  store i32 %call, i32* %listenSocket, align 4, !dbg !383
  %1 = load i32, i32* %listenSocket, align 4, !dbg !384
  %cmp = icmp eq i32 %1, -1, !dbg !386
  br i1 %cmp, label %if.then1, label %if.end, !dbg !387

if.then1:                                         ; preds = %do.body
  br label %do.end, !dbg !388

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !390
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !390
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !391
  store i8 2, i8* %sin_family, align 1, !dbg !392
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !393
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !394
  store i32 0, i32* %s_addr, align 4, !dbg !395
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !396
  store i16 -30871, i16* %sin_port, align 2, !dbg !397
  %3 = load i32, i32* %listenSocket, align 4, !dbg !398
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !400
  %call2 = call i32 @"\01_bind"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !401
  %cmp3 = icmp eq i32 %call2, -1, !dbg !402
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !403

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !404

if.end5:                                          ; preds = %if.end
  %5 = load i32, i32* %listenSocket, align 4, !dbg !406
  %call6 = call i32 @"\01_listen"(i32 noundef %5, i32 noundef 5), !dbg !408
  %cmp7 = icmp eq i32 %call6, -1, !dbg !409
  br i1 %cmp7, label %if.then8, label %if.end9, !dbg !410

if.then8:                                         ; preds = %if.end5
  br label %do.end, !dbg !411

if.end9:                                          ; preds = %if.end5
  %6 = load i32, i32* %listenSocket, align 4, !dbg !413
  %call10 = call i32 @"\01_accept"(i32 noundef %6, %struct.sockaddr* noundef null, i32* noundef null), !dbg !414
  store i32 %call10, i32* %acceptSocket, align 4, !dbg !415
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !416
  %cmp11 = icmp eq i32 %7, -1, !dbg !418
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !419

if.then12:                                        ; preds = %if.end9
  br label %do.end, !dbg !420

if.end13:                                         ; preds = %if.end9
  %8 = load i32, i32* %acceptSocket, align 4, !dbg !422
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !423
  %call14 = call i64 @"\01_recv"(i32 noundef %8, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !424
  %conv = trunc i64 %call14 to i32, !dbg !424
  store i32 %conv, i32* %recvResult, align 4, !dbg !425
  %9 = load i32, i32* %recvResult, align 4, !dbg !426
  %cmp15 = icmp eq i32 %9, -1, !dbg !428
  br i1 %cmp15, label %if.then19, label %lor.lhs.false, !dbg !429

lor.lhs.false:                                    ; preds = %if.end13
  %10 = load i32, i32* %recvResult, align 4, !dbg !430
  %cmp17 = icmp eq i32 %10, 0, !dbg !431
  br i1 %cmp17, label %if.then19, label %if.end20, !dbg !432

if.then19:                                        ; preds = %lor.lhs.false, %if.end13
  br label %do.end, !dbg !433

if.end20:                                         ; preds = %lor.lhs.false
  %11 = load i32, i32* %recvResult, align 4, !dbg !435
  %idxprom = sext i32 %11 to i64, !dbg !436
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !436
  store i8 0, i8* %arrayidx, align 1, !dbg !437
  %arraydecay21 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !438
  %call22 = call i32 @atoi(i8* noundef %arraydecay21), !dbg !439
  store i32 %call22, i32* %data, align 4, !dbg !440
  br label %do.end, !dbg !441

do.end:                                           ; preds = %if.end20, %if.then19, %if.then12, %if.then8, %if.then4, %if.then1
  %12 = load i32, i32* %listenSocket, align 4, !dbg !442
  %cmp23 = icmp ne i32 %12, -1, !dbg !444
  br i1 %cmp23, label %if.then25, label %if.end27, !dbg !445

if.then25:                                        ; preds = %do.end
  %13 = load i32, i32* %listenSocket, align 4, !dbg !446
  %call26 = call i32 @"\01_close"(i32 noundef %13), !dbg !448
  br label %if.end27, !dbg !449

if.end27:                                         ; preds = %if.then25, %do.end
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !450
  %cmp28 = icmp ne i32 %14, -1, !dbg !452
  br i1 %cmp28, label %if.then30, label %if.end32, !dbg !453

if.then30:                                        ; preds = %if.end27
  %15 = load i32, i32* %acceptSocket, align 4, !dbg !454
  %call31 = call i32 @"\01_close"(i32 noundef %15), !dbg !456
  br label %if.end32, !dbg !457

if.end32:                                         ; preds = %if.then30, %if.end27
  br label %if.end33, !dbg !458

if.end33:                                         ; preds = %if.end32, %entry
  %16 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !459
  %tobool34 = icmp ne i32 %16, 0, !dbg !459
  br i1 %tobool34, label %if.then35, label %if.end48, !dbg !461

if.then35:                                        ; preds = %if.end33
  call void @llvm.dbg.declare(metadata i32* %i, metadata !462, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !466, metadata !DIExpression()), !dbg !467
  %17 = bitcast [10 x i32]* %buffer to i8*, !dbg !467
  call void @llvm.memset.p0i8.i64(i8* align 16 %17, i8 0, i64 40, i1 false), !dbg !467
  %18 = load i32, i32* %data, align 4, !dbg !468
  %cmp36 = icmp sge i32 %18, 0, !dbg !470
  br i1 %cmp36, label %land.lhs.true, label %if.else, !dbg !471

land.lhs.true:                                    ; preds = %if.then35
  %19 = load i32, i32* %data, align 4, !dbg !472
  %cmp38 = icmp slt i32 %19, 10, !dbg !473
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !474

if.then40:                                        ; preds = %land.lhs.true
  %20 = load i32, i32* %data, align 4, !dbg !475
  %idxprom41 = sext i32 %20 to i64, !dbg !477
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !477
  store i32 1, i32* %arrayidx42, align 4, !dbg !478
  store i32 0, i32* %i, align 4, !dbg !479
  br label %for.cond, !dbg !481

for.cond:                                         ; preds = %for.inc, %if.then40
  %21 = load i32, i32* %i, align 4, !dbg !482
  %cmp43 = icmp slt i32 %21, 10, !dbg !484
  br i1 %cmp43, label %for.body, label %for.end, !dbg !485

for.body:                                         ; preds = %for.cond
  %22 = load i32, i32* %i, align 4, !dbg !486
  %idxprom45 = sext i32 %22 to i64, !dbg !488
  %arrayidx46 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom45, !dbg !488
  %23 = load i32, i32* %arrayidx46, align 4, !dbg !488
  call void @printIntLine(i32 noundef %23), !dbg !489
  br label %for.inc, !dbg !490

for.inc:                                          ; preds = %for.body
  %24 = load i32, i32* %i, align 4, !dbg !491
  %inc = add nsw i32 %24, 1, !dbg !491
  store i32 %inc, i32* %i, align 4, !dbg !491
  br label %for.cond, !dbg !492, !llvm.loop !493

for.end:                                          ; preds = %for.cond
  br label %if.end47, !dbg !495

if.else:                                          ; preds = %land.lhs.true, %if.then35
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !496
  br label %if.end47

if.end47:                                         ; preds = %if.else, %for.end
  br label %if.end48, !dbg !498

if.end48:                                         ; preds = %if.end47, %if.end33
  ret void, !dbg !499
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !500 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !501, metadata !DIExpression()), !dbg !502
  store i32 -1, i32* %data, align 4, !dbg !503
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !504
  %tobool = icmp ne i32 %0, 0, !dbg !504
  br i1 %tobool, label %if.then, label %if.else, !dbg !506

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !507
  br label %if.end, !dbg !509

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !510
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !512
  %tobool1 = icmp ne i32 %1, 0, !dbg !512
  br i1 %tobool1, label %if.then2, label %if.end9, !dbg !514

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !515, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !519, metadata !DIExpression()), !dbg !520
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !520
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !520
  %3 = load i32, i32* %data, align 4, !dbg !521
  %cmp = icmp sge i32 %3, 0, !dbg !523
  br i1 %cmp, label %if.then3, label %if.else7, !dbg !524

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !525
  %idxprom = sext i32 %4 to i64, !dbg !527
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !527
  store i32 1, i32* %arrayidx, align 4, !dbg !528
  store i32 0, i32* %i, align 4, !dbg !529
  br label %for.cond, !dbg !531

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !532
  %cmp4 = icmp slt i32 %5, 10, !dbg !534
  br i1 %cmp4, label %for.body, label %for.end, !dbg !535

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !536
  %idxprom5 = sext i32 %6 to i64, !dbg !538
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !538
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !538
  call void @printIntLine(i32 noundef %7), !dbg !539
  br label %for.inc, !dbg !540

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !541
  %inc = add nsw i32 %8, 1, !dbg !541
  store i32 %inc, i32* %i, align 4, !dbg !541
  br label %for.cond, !dbg !542, !llvm.loop !543

for.end:                                          ; preds = %for.cond
  br label %if.end8, !dbg !545

if.else7:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !546
  br label %if.end8

if.end8:                                          ; preds = %if.else7, %for.end
  br label %if.end9, !dbg !548

if.end9:                                          ; preds = %if.end8, %if.end
  ret void, !dbg !549
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !550 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !551, metadata !DIExpression()), !dbg !552
  store i32 -1, i32* %data, align 4, !dbg !553
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !554
  %tobool = icmp ne i32 %0, 0, !dbg !554
  br i1 %tobool, label %if.then, label %if.end, !dbg !556

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !557
  br label %if.end, !dbg !559

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !560
  %tobool1 = icmp ne i32 %1, 0, !dbg !560
  br i1 %tobool1, label %if.then2, label %if.end8, !dbg !562

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !563, metadata !DIExpression()), !dbg !566
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !567, metadata !DIExpression()), !dbg !568
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !568
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !568
  %3 = load i32, i32* %data, align 4, !dbg !569
  %cmp = icmp sge i32 %3, 0, !dbg !571
  br i1 %cmp, label %if.then3, label %if.else, !dbg !572

if.then3:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !573
  %idxprom = sext i32 %4 to i64, !dbg !575
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !575
  store i32 1, i32* %arrayidx, align 4, !dbg !576
  store i32 0, i32* %i, align 4, !dbg !577
  br label %for.cond, !dbg !579

for.cond:                                         ; preds = %for.inc, %if.then3
  %5 = load i32, i32* %i, align 4, !dbg !580
  %cmp4 = icmp slt i32 %5, 10, !dbg !582
  br i1 %cmp4, label %for.body, label %for.end, !dbg !583

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !584
  %idxprom5 = sext i32 %6 to i64, !dbg !586
  %arrayidx6 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !586
  %7 = load i32, i32* %arrayidx6, align 4, !dbg !586
  call void @printIntLine(i32 noundef %7), !dbg !587
  br label %for.inc, !dbg !588

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !589
  %inc = add nsw i32 %8, 1, !dbg !589
  store i32 %inc, i32* %i, align 4, !dbg !589
  br label %for.cond, !dbg !590, !llvm.loop !591

for.end:                                          ; preds = %for.cond
  br label %if.end7, !dbg !593

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !594
  br label %if.end7

if.end7:                                          ; preds = %if.else, %for.end
  br label %if.end8, !dbg !596

if.end8:                                          ; preds = %if.end7, %if.end
  ret void, !dbg !597
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocation(line: 48, column: 10, scope: !31)
!40 = !DILocation(line: 49, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !31, file: !32, line: 49, column: 8)
!42 = !DILocation(line: 49, column: 8, scope: !31)
!43 = !DILocalVariable(name: "recvResult", scope: !44, file: !32, line: 56, type: !37)
!44 = distinct !DILexicalBlock(scope: !45, file: !32, line: 51, column: 9)
!45 = distinct !DILexicalBlock(scope: !41, file: !32, line: 50, column: 5)
!46 = !DILocation(line: 56, column: 17, scope: !44)
!47 = !DILocalVariable(name: "service", scope: !44, file: !32, line: 57, type: !48)
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
!67 = !DILocation(line: 57, column: 32, scope: !44)
!68 = !DILocalVariable(name: "listenSocket", scope: !44, file: !32, line: 58, type: !37)
!69 = !DILocation(line: 58, column: 20, scope: !44)
!70 = !DILocalVariable(name: "acceptSocket", scope: !44, file: !32, line: 59, type: !37)
!71 = !DILocation(line: 59, column: 20, scope: !44)
!72 = !DILocalVariable(name: "inputBuffer", scope: !44, file: !32, line: 60, type: !20)
!73 = !DILocation(line: 60, column: 18, scope: !44)
!74 = !DILocation(line: 61, column: 13, scope: !44)
!75 = !DILocation(line: 71, column: 32, scope: !76)
!76 = distinct !DILexicalBlock(scope: !44, file: !32, line: 62, column: 13)
!77 = !DILocation(line: 71, column: 30, scope: !76)
!78 = !DILocation(line: 72, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !32, line: 72, column: 21)
!80 = !DILocation(line: 72, column: 34, scope: !79)
!81 = !DILocation(line: 72, column: 21, scope: !76)
!82 = !DILocation(line: 74, column: 21, scope: !83)
!83 = distinct !DILexicalBlock(scope: !79, file: !32, line: 73, column: 17)
!84 = !DILocation(line: 76, column: 17, scope: !76)
!85 = !DILocation(line: 77, column: 25, scope: !76)
!86 = !DILocation(line: 77, column: 36, scope: !76)
!87 = !DILocation(line: 78, column: 25, scope: !76)
!88 = !DILocation(line: 78, column: 34, scope: !76)
!89 = !DILocation(line: 78, column: 41, scope: !76)
!90 = !DILocation(line: 79, column: 25, scope: !76)
!91 = !DILocation(line: 79, column: 34, scope: !76)
!92 = !DILocation(line: 80, column: 26, scope: !93)
!93 = distinct !DILexicalBlock(scope: !76, file: !32, line: 80, column: 21)
!94 = !DILocation(line: 80, column: 40, scope: !93)
!95 = !DILocation(line: 80, column: 21, scope: !93)
!96 = !DILocation(line: 80, column: 85, scope: !93)
!97 = !DILocation(line: 80, column: 21, scope: !76)
!98 = !DILocation(line: 82, column: 21, scope: !99)
!99 = distinct !DILexicalBlock(scope: !93, file: !32, line: 81, column: 17)
!100 = !DILocation(line: 84, column: 28, scope: !101)
!101 = distinct !DILexicalBlock(scope: !76, file: !32, line: 84, column: 21)
!102 = !DILocation(line: 84, column: 21, scope: !101)
!103 = !DILocation(line: 84, column: 58, scope: !101)
!104 = !DILocation(line: 84, column: 21, scope: !76)
!105 = !DILocation(line: 86, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !101, file: !32, line: 85, column: 17)
!107 = !DILocation(line: 88, column: 39, scope: !76)
!108 = !DILocation(line: 88, column: 32, scope: !76)
!109 = !DILocation(line: 88, column: 30, scope: !76)
!110 = !DILocation(line: 89, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !76, file: !32, line: 89, column: 21)
!112 = !DILocation(line: 89, column: 34, scope: !111)
!113 = !DILocation(line: 89, column: 21, scope: !76)
!114 = !DILocation(line: 91, column: 21, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !32, line: 90, column: 17)
!116 = !DILocation(line: 94, column: 35, scope: !76)
!117 = !DILocation(line: 94, column: 49, scope: !76)
!118 = !DILocation(line: 94, column: 30, scope: !76)
!119 = !DILocation(line: 94, column: 28, scope: !76)
!120 = !DILocation(line: 95, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !76, file: !32, line: 95, column: 21)
!122 = !DILocation(line: 95, column: 32, scope: !121)
!123 = !DILocation(line: 95, column: 48, scope: !121)
!124 = !DILocation(line: 95, column: 51, scope: !121)
!125 = !DILocation(line: 95, column: 62, scope: !121)
!126 = !DILocation(line: 95, column: 21, scope: !76)
!127 = !DILocation(line: 97, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !121, file: !32, line: 96, column: 17)
!129 = !DILocation(line: 100, column: 29, scope: !76)
!130 = !DILocation(line: 100, column: 17, scope: !76)
!131 = !DILocation(line: 100, column: 41, scope: !76)
!132 = !DILocation(line: 102, column: 29, scope: !76)
!133 = !DILocation(line: 102, column: 24, scope: !76)
!134 = !DILocation(line: 102, column: 22, scope: !76)
!135 = !DILocation(line: 103, column: 13, scope: !76)
!136 = !DILocation(line: 105, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !44, file: !32, line: 105, column: 17)
!138 = !DILocation(line: 105, column: 30, scope: !137)
!139 = !DILocation(line: 105, column: 17, scope: !44)
!140 = !DILocation(line: 107, column: 30, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !32, line: 106, column: 13)
!142 = !DILocation(line: 107, column: 17, scope: !141)
!143 = !DILocation(line: 108, column: 13, scope: !141)
!144 = !DILocation(line: 109, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !44, file: !32, line: 109, column: 17)
!146 = !DILocation(line: 109, column: 30, scope: !145)
!147 = !DILocation(line: 109, column: 17, scope: !44)
!148 = !DILocation(line: 111, column: 30, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !32, line: 110, column: 13)
!150 = !DILocation(line: 111, column: 17, scope: !149)
!151 = !DILocation(line: 112, column: 13, scope: !149)
!152 = !DILocation(line: 120, column: 5, scope: !45)
!153 = !DILocation(line: 121, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !31, file: !32, line: 121, column: 8)
!155 = !DILocation(line: 121, column: 8, scope: !31)
!156 = !DILocalVariable(name: "i", scope: !157, file: !32, line: 124, type: !37)
!157 = distinct !DILexicalBlock(scope: !158, file: !32, line: 123, column: 9)
!158 = distinct !DILexicalBlock(scope: !154, file: !32, line: 122, column: 5)
!159 = !DILocation(line: 124, column: 17, scope: !157)
!160 = !DILocalVariable(name: "buffer", scope: !157, file: !32, line: 125, type: !161)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !162)
!162 = !{!163}
!163 = !DISubrange(count: 10)
!164 = !DILocation(line: 125, column: 17, scope: !157)
!165 = !DILocation(line: 128, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !157, file: !32, line: 128, column: 17)
!167 = !DILocation(line: 128, column: 22, scope: !166)
!168 = !DILocation(line: 128, column: 17, scope: !157)
!169 = !DILocation(line: 130, column: 24, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !32, line: 129, column: 13)
!171 = !DILocation(line: 130, column: 17, scope: !170)
!172 = !DILocation(line: 130, column: 30, scope: !170)
!173 = !DILocation(line: 132, column: 23, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !32, line: 132, column: 17)
!175 = !DILocation(line: 132, column: 21, scope: !174)
!176 = !DILocation(line: 132, column: 28, scope: !177)
!177 = distinct !DILexicalBlock(scope: !174, file: !32, line: 132, column: 17)
!178 = !DILocation(line: 132, column: 30, scope: !177)
!179 = !DILocation(line: 132, column: 17, scope: !174)
!180 = !DILocation(line: 134, column: 41, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !32, line: 133, column: 17)
!182 = !DILocation(line: 134, column: 34, scope: !181)
!183 = !DILocation(line: 134, column: 21, scope: !181)
!184 = !DILocation(line: 135, column: 17, scope: !181)
!185 = !DILocation(line: 132, column: 37, scope: !177)
!186 = !DILocation(line: 132, column: 17, scope: !177)
!187 = distinct !{!187, !179, !188, !189}
!188 = !DILocation(line: 135, column: 17, scope: !174)
!189 = !{!"llvm.loop.mustprogress"}
!190 = !DILocation(line: 136, column: 13, scope: !170)
!191 = !DILocation(line: 139, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !166, file: !32, line: 138, column: 13)
!193 = !DILocation(line: 142, column: 5, scope: !158)
!194 = !DILocation(line: 143, column: 1, scope: !31)
!195 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_09_good", scope: !32, file: !32, line: 433, type: !33, scopeLine: 434, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!196 = !DILocation(line: 435, column: 5, scope: !195)
!197 = !DILocation(line: 436, column: 5, scope: !195)
!198 = !DILocation(line: 437, column: 5, scope: !195)
!199 = !DILocation(line: 438, column: 5, scope: !195)
!200 = !DILocation(line: 439, column: 1, scope: !195)
!201 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 450, type: !202, scopeLine: 451, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!202 = !DISubroutineType(types: !203)
!203 = !{!37, !37, !204}
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!206 = !DILocalVariable(name: "argc", arg: 1, scope: !201, file: !32, line: 450, type: !37)
!207 = !DILocation(line: 450, column: 14, scope: !201)
!208 = !DILocalVariable(name: "argv", arg: 2, scope: !201, file: !32, line: 450, type: !204)
!209 = !DILocation(line: 450, column: 27, scope: !201)
!210 = !DILocation(line: 453, column: 22, scope: !201)
!211 = !DILocation(line: 453, column: 12, scope: !201)
!212 = !DILocation(line: 453, column: 5, scope: !201)
!213 = !DILocation(line: 455, column: 5, scope: !201)
!214 = !DILocation(line: 456, column: 5, scope: !201)
!215 = !DILocation(line: 457, column: 5, scope: !201)
!216 = !DILocation(line: 460, column: 5, scope: !201)
!217 = !DILocation(line: 461, column: 5, scope: !201)
!218 = !DILocation(line: 462, column: 5, scope: !201)
!219 = !DILocation(line: 464, column: 5, scope: !201)
!220 = distinct !DISubprogram(name: "goodB2G1", scope: !32, file: !32, line: 150, type: !33, scopeLine: 151, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!221 = !DILocalVariable(name: "data", scope: !220, file: !32, line: 152, type: !37)
!222 = !DILocation(line: 152, column: 9, scope: !220)
!223 = !DILocation(line: 154, column: 10, scope: !220)
!224 = !DILocation(line: 155, column: 8, scope: !225)
!225 = distinct !DILexicalBlock(scope: !220, file: !32, line: 155, column: 8)
!226 = !DILocation(line: 155, column: 8, scope: !220)
!227 = !DILocalVariable(name: "recvResult", scope: !228, file: !32, line: 162, type: !37)
!228 = distinct !DILexicalBlock(scope: !229, file: !32, line: 157, column: 9)
!229 = distinct !DILexicalBlock(scope: !225, file: !32, line: 156, column: 5)
!230 = !DILocation(line: 162, column: 17, scope: !228)
!231 = !DILocalVariable(name: "service", scope: !228, file: !32, line: 163, type: !48)
!232 = !DILocation(line: 163, column: 32, scope: !228)
!233 = !DILocalVariable(name: "listenSocket", scope: !228, file: !32, line: 164, type: !37)
!234 = !DILocation(line: 164, column: 20, scope: !228)
!235 = !DILocalVariable(name: "acceptSocket", scope: !228, file: !32, line: 165, type: !37)
!236 = !DILocation(line: 165, column: 20, scope: !228)
!237 = !DILocalVariable(name: "inputBuffer", scope: !228, file: !32, line: 166, type: !20)
!238 = !DILocation(line: 166, column: 18, scope: !228)
!239 = !DILocation(line: 167, column: 13, scope: !228)
!240 = !DILocation(line: 177, column: 32, scope: !241)
!241 = distinct !DILexicalBlock(scope: !228, file: !32, line: 168, column: 13)
!242 = !DILocation(line: 177, column: 30, scope: !241)
!243 = !DILocation(line: 178, column: 21, scope: !244)
!244 = distinct !DILexicalBlock(scope: !241, file: !32, line: 178, column: 21)
!245 = !DILocation(line: 178, column: 34, scope: !244)
!246 = !DILocation(line: 178, column: 21, scope: !241)
!247 = !DILocation(line: 180, column: 21, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !32, line: 179, column: 17)
!249 = !DILocation(line: 182, column: 17, scope: !241)
!250 = !DILocation(line: 183, column: 25, scope: !241)
!251 = !DILocation(line: 183, column: 36, scope: !241)
!252 = !DILocation(line: 184, column: 25, scope: !241)
!253 = !DILocation(line: 184, column: 34, scope: !241)
!254 = !DILocation(line: 184, column: 41, scope: !241)
!255 = !DILocation(line: 185, column: 25, scope: !241)
!256 = !DILocation(line: 185, column: 34, scope: !241)
!257 = !DILocation(line: 186, column: 26, scope: !258)
!258 = distinct !DILexicalBlock(scope: !241, file: !32, line: 186, column: 21)
!259 = !DILocation(line: 186, column: 40, scope: !258)
!260 = !DILocation(line: 186, column: 21, scope: !258)
!261 = !DILocation(line: 186, column: 85, scope: !258)
!262 = !DILocation(line: 186, column: 21, scope: !241)
!263 = !DILocation(line: 188, column: 21, scope: !264)
!264 = distinct !DILexicalBlock(scope: !258, file: !32, line: 187, column: 17)
!265 = !DILocation(line: 190, column: 28, scope: !266)
!266 = distinct !DILexicalBlock(scope: !241, file: !32, line: 190, column: 21)
!267 = !DILocation(line: 190, column: 21, scope: !266)
!268 = !DILocation(line: 190, column: 58, scope: !266)
!269 = !DILocation(line: 190, column: 21, scope: !241)
!270 = !DILocation(line: 192, column: 21, scope: !271)
!271 = distinct !DILexicalBlock(scope: !266, file: !32, line: 191, column: 17)
!272 = !DILocation(line: 194, column: 39, scope: !241)
!273 = !DILocation(line: 194, column: 32, scope: !241)
!274 = !DILocation(line: 194, column: 30, scope: !241)
!275 = !DILocation(line: 195, column: 21, scope: !276)
!276 = distinct !DILexicalBlock(scope: !241, file: !32, line: 195, column: 21)
!277 = !DILocation(line: 195, column: 34, scope: !276)
!278 = !DILocation(line: 195, column: 21, scope: !241)
!279 = !DILocation(line: 197, column: 21, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !32, line: 196, column: 17)
!281 = !DILocation(line: 200, column: 35, scope: !241)
!282 = !DILocation(line: 200, column: 49, scope: !241)
!283 = !DILocation(line: 200, column: 30, scope: !241)
!284 = !DILocation(line: 200, column: 28, scope: !241)
!285 = !DILocation(line: 201, column: 21, scope: !286)
!286 = distinct !DILexicalBlock(scope: !241, file: !32, line: 201, column: 21)
!287 = !DILocation(line: 201, column: 32, scope: !286)
!288 = !DILocation(line: 201, column: 48, scope: !286)
!289 = !DILocation(line: 201, column: 51, scope: !286)
!290 = !DILocation(line: 201, column: 62, scope: !286)
!291 = !DILocation(line: 201, column: 21, scope: !241)
!292 = !DILocation(line: 203, column: 21, scope: !293)
!293 = distinct !DILexicalBlock(scope: !286, file: !32, line: 202, column: 17)
!294 = !DILocation(line: 206, column: 29, scope: !241)
!295 = !DILocation(line: 206, column: 17, scope: !241)
!296 = !DILocation(line: 206, column: 41, scope: !241)
!297 = !DILocation(line: 208, column: 29, scope: !241)
!298 = !DILocation(line: 208, column: 24, scope: !241)
!299 = !DILocation(line: 208, column: 22, scope: !241)
!300 = !DILocation(line: 209, column: 13, scope: !241)
!301 = !DILocation(line: 211, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !228, file: !32, line: 211, column: 17)
!303 = !DILocation(line: 211, column: 30, scope: !302)
!304 = !DILocation(line: 211, column: 17, scope: !228)
!305 = !DILocation(line: 213, column: 30, scope: !306)
!306 = distinct !DILexicalBlock(scope: !302, file: !32, line: 212, column: 13)
!307 = !DILocation(line: 213, column: 17, scope: !306)
!308 = !DILocation(line: 214, column: 13, scope: !306)
!309 = !DILocation(line: 215, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !228, file: !32, line: 215, column: 17)
!311 = !DILocation(line: 215, column: 30, scope: !310)
!312 = !DILocation(line: 215, column: 17, scope: !228)
!313 = !DILocation(line: 217, column: 30, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !32, line: 216, column: 13)
!315 = !DILocation(line: 217, column: 17, scope: !314)
!316 = !DILocation(line: 218, column: 13, scope: !314)
!317 = !DILocation(line: 226, column: 5, scope: !229)
!318 = !DILocation(line: 227, column: 8, scope: !319)
!319 = distinct !DILexicalBlock(scope: !220, file: !32, line: 227, column: 8)
!320 = !DILocation(line: 227, column: 8, scope: !220)
!321 = !DILocation(line: 230, column: 9, scope: !322)
!322 = distinct !DILexicalBlock(scope: !319, file: !32, line: 228, column: 5)
!323 = !DILocation(line: 231, column: 5, scope: !322)
!324 = !DILocalVariable(name: "i", scope: !325, file: !32, line: 235, type: !37)
!325 = distinct !DILexicalBlock(scope: !326, file: !32, line: 234, column: 9)
!326 = distinct !DILexicalBlock(scope: !319, file: !32, line: 233, column: 5)
!327 = !DILocation(line: 235, column: 17, scope: !325)
!328 = !DILocalVariable(name: "buffer", scope: !325, file: !32, line: 236, type: !161)
!329 = !DILocation(line: 236, column: 17, scope: !325)
!330 = !DILocation(line: 238, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !325, file: !32, line: 238, column: 17)
!332 = !DILocation(line: 238, column: 22, scope: !331)
!333 = !DILocation(line: 238, column: 27, scope: !331)
!334 = !DILocation(line: 238, column: 30, scope: !331)
!335 = !DILocation(line: 238, column: 35, scope: !331)
!336 = !DILocation(line: 238, column: 17, scope: !325)
!337 = !DILocation(line: 240, column: 24, scope: !338)
!338 = distinct !DILexicalBlock(scope: !331, file: !32, line: 239, column: 13)
!339 = !DILocation(line: 240, column: 17, scope: !338)
!340 = !DILocation(line: 240, column: 30, scope: !338)
!341 = !DILocation(line: 242, column: 23, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !32, line: 242, column: 17)
!343 = !DILocation(line: 242, column: 21, scope: !342)
!344 = !DILocation(line: 242, column: 28, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !32, line: 242, column: 17)
!346 = !DILocation(line: 242, column: 30, scope: !345)
!347 = !DILocation(line: 242, column: 17, scope: !342)
!348 = !DILocation(line: 244, column: 41, scope: !349)
!349 = distinct !DILexicalBlock(scope: !345, file: !32, line: 243, column: 17)
!350 = !DILocation(line: 244, column: 34, scope: !349)
!351 = !DILocation(line: 244, column: 21, scope: !349)
!352 = !DILocation(line: 245, column: 17, scope: !349)
!353 = !DILocation(line: 242, column: 37, scope: !345)
!354 = !DILocation(line: 242, column: 17, scope: !345)
!355 = distinct !{!355, !347, !356, !189}
!356 = !DILocation(line: 245, column: 17, scope: !342)
!357 = !DILocation(line: 246, column: 13, scope: !338)
!358 = !DILocation(line: 249, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !331, file: !32, line: 248, column: 13)
!360 = !DILocation(line: 253, column: 1, scope: !220)
!361 = distinct !DISubprogram(name: "goodB2G2", scope: !32, file: !32, line: 256, type: !33, scopeLine: 257, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!362 = !DILocalVariable(name: "data", scope: !361, file: !32, line: 258, type: !37)
!363 = !DILocation(line: 258, column: 9, scope: !361)
!364 = !DILocation(line: 260, column: 10, scope: !361)
!365 = !DILocation(line: 261, column: 8, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !32, line: 261, column: 8)
!367 = !DILocation(line: 261, column: 8, scope: !361)
!368 = !DILocalVariable(name: "recvResult", scope: !369, file: !32, line: 268, type: !37)
!369 = distinct !DILexicalBlock(scope: !370, file: !32, line: 263, column: 9)
!370 = distinct !DILexicalBlock(scope: !366, file: !32, line: 262, column: 5)
!371 = !DILocation(line: 268, column: 17, scope: !369)
!372 = !DILocalVariable(name: "service", scope: !369, file: !32, line: 269, type: !48)
!373 = !DILocation(line: 269, column: 32, scope: !369)
!374 = !DILocalVariable(name: "listenSocket", scope: !369, file: !32, line: 270, type: !37)
!375 = !DILocation(line: 270, column: 20, scope: !369)
!376 = !DILocalVariable(name: "acceptSocket", scope: !369, file: !32, line: 271, type: !37)
!377 = !DILocation(line: 271, column: 20, scope: !369)
!378 = !DILocalVariable(name: "inputBuffer", scope: !369, file: !32, line: 272, type: !20)
!379 = !DILocation(line: 272, column: 18, scope: !369)
!380 = !DILocation(line: 273, column: 13, scope: !369)
!381 = !DILocation(line: 283, column: 32, scope: !382)
!382 = distinct !DILexicalBlock(scope: !369, file: !32, line: 274, column: 13)
!383 = !DILocation(line: 283, column: 30, scope: !382)
!384 = !DILocation(line: 284, column: 21, scope: !385)
!385 = distinct !DILexicalBlock(scope: !382, file: !32, line: 284, column: 21)
!386 = !DILocation(line: 284, column: 34, scope: !385)
!387 = !DILocation(line: 284, column: 21, scope: !382)
!388 = !DILocation(line: 286, column: 21, scope: !389)
!389 = distinct !DILexicalBlock(scope: !385, file: !32, line: 285, column: 17)
!390 = !DILocation(line: 288, column: 17, scope: !382)
!391 = !DILocation(line: 289, column: 25, scope: !382)
!392 = !DILocation(line: 289, column: 36, scope: !382)
!393 = !DILocation(line: 290, column: 25, scope: !382)
!394 = !DILocation(line: 290, column: 34, scope: !382)
!395 = !DILocation(line: 290, column: 41, scope: !382)
!396 = !DILocation(line: 291, column: 25, scope: !382)
!397 = !DILocation(line: 291, column: 34, scope: !382)
!398 = !DILocation(line: 292, column: 26, scope: !399)
!399 = distinct !DILexicalBlock(scope: !382, file: !32, line: 292, column: 21)
!400 = !DILocation(line: 292, column: 40, scope: !399)
!401 = !DILocation(line: 292, column: 21, scope: !399)
!402 = !DILocation(line: 292, column: 85, scope: !399)
!403 = !DILocation(line: 292, column: 21, scope: !382)
!404 = !DILocation(line: 294, column: 21, scope: !405)
!405 = distinct !DILexicalBlock(scope: !399, file: !32, line: 293, column: 17)
!406 = !DILocation(line: 296, column: 28, scope: !407)
!407 = distinct !DILexicalBlock(scope: !382, file: !32, line: 296, column: 21)
!408 = !DILocation(line: 296, column: 21, scope: !407)
!409 = !DILocation(line: 296, column: 58, scope: !407)
!410 = !DILocation(line: 296, column: 21, scope: !382)
!411 = !DILocation(line: 298, column: 21, scope: !412)
!412 = distinct !DILexicalBlock(scope: !407, file: !32, line: 297, column: 17)
!413 = !DILocation(line: 300, column: 39, scope: !382)
!414 = !DILocation(line: 300, column: 32, scope: !382)
!415 = !DILocation(line: 300, column: 30, scope: !382)
!416 = !DILocation(line: 301, column: 21, scope: !417)
!417 = distinct !DILexicalBlock(scope: !382, file: !32, line: 301, column: 21)
!418 = !DILocation(line: 301, column: 34, scope: !417)
!419 = !DILocation(line: 301, column: 21, scope: !382)
!420 = !DILocation(line: 303, column: 21, scope: !421)
!421 = distinct !DILexicalBlock(scope: !417, file: !32, line: 302, column: 17)
!422 = !DILocation(line: 306, column: 35, scope: !382)
!423 = !DILocation(line: 306, column: 49, scope: !382)
!424 = !DILocation(line: 306, column: 30, scope: !382)
!425 = !DILocation(line: 306, column: 28, scope: !382)
!426 = !DILocation(line: 307, column: 21, scope: !427)
!427 = distinct !DILexicalBlock(scope: !382, file: !32, line: 307, column: 21)
!428 = !DILocation(line: 307, column: 32, scope: !427)
!429 = !DILocation(line: 307, column: 48, scope: !427)
!430 = !DILocation(line: 307, column: 51, scope: !427)
!431 = !DILocation(line: 307, column: 62, scope: !427)
!432 = !DILocation(line: 307, column: 21, scope: !382)
!433 = !DILocation(line: 309, column: 21, scope: !434)
!434 = distinct !DILexicalBlock(scope: !427, file: !32, line: 308, column: 17)
!435 = !DILocation(line: 312, column: 29, scope: !382)
!436 = !DILocation(line: 312, column: 17, scope: !382)
!437 = !DILocation(line: 312, column: 41, scope: !382)
!438 = !DILocation(line: 314, column: 29, scope: !382)
!439 = !DILocation(line: 314, column: 24, scope: !382)
!440 = !DILocation(line: 314, column: 22, scope: !382)
!441 = !DILocation(line: 315, column: 13, scope: !382)
!442 = !DILocation(line: 317, column: 17, scope: !443)
!443 = distinct !DILexicalBlock(scope: !369, file: !32, line: 317, column: 17)
!444 = !DILocation(line: 317, column: 30, scope: !443)
!445 = !DILocation(line: 317, column: 17, scope: !369)
!446 = !DILocation(line: 319, column: 30, scope: !447)
!447 = distinct !DILexicalBlock(scope: !443, file: !32, line: 318, column: 13)
!448 = !DILocation(line: 319, column: 17, scope: !447)
!449 = !DILocation(line: 320, column: 13, scope: !447)
!450 = !DILocation(line: 321, column: 17, scope: !451)
!451 = distinct !DILexicalBlock(scope: !369, file: !32, line: 321, column: 17)
!452 = !DILocation(line: 321, column: 30, scope: !451)
!453 = !DILocation(line: 321, column: 17, scope: !369)
!454 = !DILocation(line: 323, column: 30, scope: !455)
!455 = distinct !DILexicalBlock(scope: !451, file: !32, line: 322, column: 13)
!456 = !DILocation(line: 323, column: 17, scope: !455)
!457 = !DILocation(line: 324, column: 13, scope: !455)
!458 = !DILocation(line: 332, column: 5, scope: !370)
!459 = !DILocation(line: 333, column: 8, scope: !460)
!460 = distinct !DILexicalBlock(scope: !361, file: !32, line: 333, column: 8)
!461 = !DILocation(line: 333, column: 8, scope: !361)
!462 = !DILocalVariable(name: "i", scope: !463, file: !32, line: 336, type: !37)
!463 = distinct !DILexicalBlock(scope: !464, file: !32, line: 335, column: 9)
!464 = distinct !DILexicalBlock(scope: !460, file: !32, line: 334, column: 5)
!465 = !DILocation(line: 336, column: 17, scope: !463)
!466 = !DILocalVariable(name: "buffer", scope: !463, file: !32, line: 337, type: !161)
!467 = !DILocation(line: 337, column: 17, scope: !463)
!468 = !DILocation(line: 339, column: 17, scope: !469)
!469 = distinct !DILexicalBlock(scope: !463, file: !32, line: 339, column: 17)
!470 = !DILocation(line: 339, column: 22, scope: !469)
!471 = !DILocation(line: 339, column: 27, scope: !469)
!472 = !DILocation(line: 339, column: 30, scope: !469)
!473 = !DILocation(line: 339, column: 35, scope: !469)
!474 = !DILocation(line: 339, column: 17, scope: !463)
!475 = !DILocation(line: 341, column: 24, scope: !476)
!476 = distinct !DILexicalBlock(scope: !469, file: !32, line: 340, column: 13)
!477 = !DILocation(line: 341, column: 17, scope: !476)
!478 = !DILocation(line: 341, column: 30, scope: !476)
!479 = !DILocation(line: 343, column: 23, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !32, line: 343, column: 17)
!481 = !DILocation(line: 343, column: 21, scope: !480)
!482 = !DILocation(line: 343, column: 28, scope: !483)
!483 = distinct !DILexicalBlock(scope: !480, file: !32, line: 343, column: 17)
!484 = !DILocation(line: 343, column: 30, scope: !483)
!485 = !DILocation(line: 343, column: 17, scope: !480)
!486 = !DILocation(line: 345, column: 41, scope: !487)
!487 = distinct !DILexicalBlock(scope: !483, file: !32, line: 344, column: 17)
!488 = !DILocation(line: 345, column: 34, scope: !487)
!489 = !DILocation(line: 345, column: 21, scope: !487)
!490 = !DILocation(line: 346, column: 17, scope: !487)
!491 = !DILocation(line: 343, column: 37, scope: !483)
!492 = !DILocation(line: 343, column: 17, scope: !483)
!493 = distinct !{!493, !485, !494, !189}
!494 = !DILocation(line: 346, column: 17, scope: !480)
!495 = !DILocation(line: 347, column: 13, scope: !476)
!496 = !DILocation(line: 350, column: 17, scope: !497)
!497 = distinct !DILexicalBlock(scope: !469, file: !32, line: 349, column: 13)
!498 = !DILocation(line: 353, column: 5, scope: !464)
!499 = !DILocation(line: 354, column: 1, scope: !361)
!500 = distinct !DISubprogram(name: "goodG2B1", scope: !32, file: !32, line: 357, type: !33, scopeLine: 358, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!501 = !DILocalVariable(name: "data", scope: !500, file: !32, line: 359, type: !37)
!502 = !DILocation(line: 359, column: 9, scope: !500)
!503 = !DILocation(line: 361, column: 10, scope: !500)
!504 = !DILocation(line: 362, column: 8, scope: !505)
!505 = distinct !DILexicalBlock(scope: !500, file: !32, line: 362, column: 8)
!506 = !DILocation(line: 362, column: 8, scope: !500)
!507 = !DILocation(line: 365, column: 9, scope: !508)
!508 = distinct !DILexicalBlock(scope: !505, file: !32, line: 363, column: 5)
!509 = !DILocation(line: 366, column: 5, scope: !508)
!510 = !DILocation(line: 371, column: 14, scope: !511)
!511 = distinct !DILexicalBlock(scope: !505, file: !32, line: 368, column: 5)
!512 = !DILocation(line: 373, column: 8, scope: !513)
!513 = distinct !DILexicalBlock(scope: !500, file: !32, line: 373, column: 8)
!514 = !DILocation(line: 373, column: 8, scope: !500)
!515 = !DILocalVariable(name: "i", scope: !516, file: !32, line: 376, type: !37)
!516 = distinct !DILexicalBlock(scope: !517, file: !32, line: 375, column: 9)
!517 = distinct !DILexicalBlock(scope: !513, file: !32, line: 374, column: 5)
!518 = !DILocation(line: 376, column: 17, scope: !516)
!519 = !DILocalVariable(name: "buffer", scope: !516, file: !32, line: 377, type: !161)
!520 = !DILocation(line: 377, column: 17, scope: !516)
!521 = !DILocation(line: 380, column: 17, scope: !522)
!522 = distinct !DILexicalBlock(scope: !516, file: !32, line: 380, column: 17)
!523 = !DILocation(line: 380, column: 22, scope: !522)
!524 = !DILocation(line: 380, column: 17, scope: !516)
!525 = !DILocation(line: 382, column: 24, scope: !526)
!526 = distinct !DILexicalBlock(scope: !522, file: !32, line: 381, column: 13)
!527 = !DILocation(line: 382, column: 17, scope: !526)
!528 = !DILocation(line: 382, column: 30, scope: !526)
!529 = !DILocation(line: 384, column: 23, scope: !530)
!530 = distinct !DILexicalBlock(scope: !526, file: !32, line: 384, column: 17)
!531 = !DILocation(line: 384, column: 21, scope: !530)
!532 = !DILocation(line: 384, column: 28, scope: !533)
!533 = distinct !DILexicalBlock(scope: !530, file: !32, line: 384, column: 17)
!534 = !DILocation(line: 384, column: 30, scope: !533)
!535 = !DILocation(line: 384, column: 17, scope: !530)
!536 = !DILocation(line: 386, column: 41, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !32, line: 385, column: 17)
!538 = !DILocation(line: 386, column: 34, scope: !537)
!539 = !DILocation(line: 386, column: 21, scope: !537)
!540 = !DILocation(line: 387, column: 17, scope: !537)
!541 = !DILocation(line: 384, column: 37, scope: !533)
!542 = !DILocation(line: 384, column: 17, scope: !533)
!543 = distinct !{!543, !535, !544, !189}
!544 = !DILocation(line: 387, column: 17, scope: !530)
!545 = !DILocation(line: 388, column: 13, scope: !526)
!546 = !DILocation(line: 391, column: 17, scope: !547)
!547 = distinct !DILexicalBlock(scope: !522, file: !32, line: 390, column: 13)
!548 = !DILocation(line: 394, column: 5, scope: !517)
!549 = !DILocation(line: 395, column: 1, scope: !500)
!550 = distinct !DISubprogram(name: "goodG2B2", scope: !32, file: !32, line: 398, type: !33, scopeLine: 399, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!551 = !DILocalVariable(name: "data", scope: !550, file: !32, line: 400, type: !37)
!552 = !DILocation(line: 400, column: 9, scope: !550)
!553 = !DILocation(line: 402, column: 10, scope: !550)
!554 = !DILocation(line: 403, column: 8, scope: !555)
!555 = distinct !DILexicalBlock(scope: !550, file: !32, line: 403, column: 8)
!556 = !DILocation(line: 403, column: 8, scope: !550)
!557 = !DILocation(line: 407, column: 14, scope: !558)
!558 = distinct !DILexicalBlock(scope: !555, file: !32, line: 404, column: 5)
!559 = !DILocation(line: 408, column: 5, scope: !558)
!560 = !DILocation(line: 409, column: 8, scope: !561)
!561 = distinct !DILexicalBlock(scope: !550, file: !32, line: 409, column: 8)
!562 = !DILocation(line: 409, column: 8, scope: !550)
!563 = !DILocalVariable(name: "i", scope: !564, file: !32, line: 412, type: !37)
!564 = distinct !DILexicalBlock(scope: !565, file: !32, line: 411, column: 9)
!565 = distinct !DILexicalBlock(scope: !561, file: !32, line: 410, column: 5)
!566 = !DILocation(line: 412, column: 17, scope: !564)
!567 = !DILocalVariable(name: "buffer", scope: !564, file: !32, line: 413, type: !161)
!568 = !DILocation(line: 413, column: 17, scope: !564)
!569 = !DILocation(line: 416, column: 17, scope: !570)
!570 = distinct !DILexicalBlock(scope: !564, file: !32, line: 416, column: 17)
!571 = !DILocation(line: 416, column: 22, scope: !570)
!572 = !DILocation(line: 416, column: 17, scope: !564)
!573 = !DILocation(line: 418, column: 24, scope: !574)
!574 = distinct !DILexicalBlock(scope: !570, file: !32, line: 417, column: 13)
!575 = !DILocation(line: 418, column: 17, scope: !574)
!576 = !DILocation(line: 418, column: 30, scope: !574)
!577 = !DILocation(line: 420, column: 23, scope: !578)
!578 = distinct !DILexicalBlock(scope: !574, file: !32, line: 420, column: 17)
!579 = !DILocation(line: 420, column: 21, scope: !578)
!580 = !DILocation(line: 420, column: 28, scope: !581)
!581 = distinct !DILexicalBlock(scope: !578, file: !32, line: 420, column: 17)
!582 = !DILocation(line: 420, column: 30, scope: !581)
!583 = !DILocation(line: 420, column: 17, scope: !578)
!584 = !DILocation(line: 422, column: 41, scope: !585)
!585 = distinct !DILexicalBlock(scope: !581, file: !32, line: 421, column: 17)
!586 = !DILocation(line: 422, column: 34, scope: !585)
!587 = !DILocation(line: 422, column: 21, scope: !585)
!588 = !DILocation(line: 423, column: 17, scope: !585)
!589 = !DILocation(line: 420, column: 37, scope: !581)
!590 = !DILocation(line: 420, column: 17, scope: !581)
!591 = distinct !{!591, !583, !592, !189}
!592 = !DILocation(line: 423, column: 17, scope: !578)
!593 = !DILocation(line: 424, column: 13, scope: !574)
!594 = !DILocation(line: 427, column: 17, scope: !595)
!595 = distinct !DILexicalBlock(scope: !570, file: !32, line: 426, column: 13)
!596 = !DILocation(line: 430, column: 5, scope: !565)
!597 = !DILocation(line: 431, column: 1, scope: !550)
