; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18_bad() #0 !dbg !31 {
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
  br label %source, !dbg !40

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !41), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !46, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 -1, i32* %listenSocket, align 4, !dbg !68
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !69, metadata !DIExpression()), !dbg !70
  store i32 -1, i32* %acceptSocket, align 4, !dbg !70
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  br label %do.body, !dbg !73

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !74
  store i32 %call, i32* %listenSocket, align 4, !dbg !76
  %0 = load i32, i32* %listenSocket, align 4, !dbg !77
  %cmp = icmp eq i32 %0, -1, !dbg !79
  br i1 %cmp, label %if.then, label %if.end, !dbg !80

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !81

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !83
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !83
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !84
  store i8 2, i8* %sin_family, align 1, !dbg !85
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !86
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !87
  store i32 0, i32* %s_addr, align 4, !dbg !88
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !89
  store i16 -30871, i16* %sin_port, align 2, !dbg !90
  %2 = load i32, i32* %listenSocket, align 4, !dbg !91
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !93
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !94
  %cmp2 = icmp eq i32 %call1, -1, !dbg !95
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !96

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !97

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !99
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !101
  %cmp6 = icmp eq i32 %call5, -1, !dbg !102
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !103

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !104

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !106
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !107
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !108
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !109
  %cmp10 = icmp eq i32 %6, -1, !dbg !111
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !112

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !113

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !115
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !116
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !117
  %conv = trunc i64 %call13 to i32, !dbg !117
  store i32 %conv, i32* %recvResult, align 4, !dbg !118
  %8 = load i32, i32* %recvResult, align 4, !dbg !119
  %cmp14 = icmp eq i32 %8, -1, !dbg !121
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !122

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !123
  %cmp16 = icmp eq i32 %9, 0, !dbg !124
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !125

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !126

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !128
  %idxprom = sext i32 %10 to i64, !dbg !129
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !131
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !132
  store i32 %call21, i32* %data, align 4, !dbg !133
  br label %do.end, !dbg !134

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !135
  %cmp22 = icmp ne i32 %11, -1, !dbg !137
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !138

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !139
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !141
  br label %if.end26, !dbg !142

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !143
  %cmp27 = icmp ne i32 %13, -1, !dbg !145
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !146

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !147
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !149
  br label %if.end31, !dbg !150

if.end31:                                         ; preds = %if.then29, %if.end26
  br label %sink, !dbg !151

sink:                                             ; preds = %if.end31
  call void @llvm.dbg.label(metadata !152), !dbg !153
  call void @llvm.dbg.declare(metadata i32* %i, metadata !154, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !157, metadata !DIExpression()), !dbg !161
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !161
  %16 = load i32, i32* %data, align 4, !dbg !162
  %cmp32 = icmp sge i32 %16, 0, !dbg !164
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !165

if.then34:                                        ; preds = %sink
  %17 = load i32, i32* %data, align 4, !dbg !166
  %idxprom35 = sext i32 %17 to i64, !dbg !168
  %arrayidx36 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom35, !dbg !168
  store i32 1, i32* %arrayidx36, align 4, !dbg !169
  store i32 0, i32* %i, align 4, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.then34
  %18 = load i32, i32* %i, align 4, !dbg !173
  %cmp37 = icmp slt i32 %18, 10, !dbg !175
  br i1 %cmp37, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !177
  %idxprom39 = sext i32 %19 to i64, !dbg !179
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !179
  %20 = load i32, i32* %arrayidx40, align 4, !dbg !179
  call void @printIntLine(i32 noundef %20), !dbg !180
  br label %for.inc, !dbg !181

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !182
  %inc = add nsw i32 %21, 1, !dbg !182
  store i32 %inc, i32* %i, align 4, !dbg !182
  br label %for.cond, !dbg !183, !llvm.loop !184

for.end:                                          ; preds = %for.cond
  br label %if.end41, !dbg !187

if.else:                                          ; preds = %sink
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !188
  br label %if.end41

if.end41:                                         ; preds = %if.else, %for.end
  ret void, !dbg !190
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18_good() #0 !dbg !191 {
entry:
  call void @goodB2G(), !dbg !192
  call void @goodG2B(), !dbg !193
  ret void, !dbg !194
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !195 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !200, metadata !DIExpression()), !dbg !201
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !202, metadata !DIExpression()), !dbg !203
  %call = call i64 @time(i64* noundef null), !dbg !204
  %conv = trunc i64 %call to i32, !dbg !205
  call void @srand(i32 noundef %conv), !dbg !206
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !207
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18_good(), !dbg !208
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !209
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !210
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18_bad(), !dbg !211
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !212
  ret i32 0, !dbg !213
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !214 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !215, metadata !DIExpression()), !dbg !216
  store i32 -1, i32* %data, align 4, !dbg !217
  br label %source, !dbg !218

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !219), !dbg !220
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !221, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !224, metadata !DIExpression()), !dbg !225
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !226, metadata !DIExpression()), !dbg !227
  store i32 -1, i32* %listenSocket, align 4, !dbg !227
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !228, metadata !DIExpression()), !dbg !229
  store i32 -1, i32* %acceptSocket, align 4, !dbg !229
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !230, metadata !DIExpression()), !dbg !231
  br label %do.body, !dbg !232

do.body:                                          ; preds = %source
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !233
  store i32 %call, i32* %listenSocket, align 4, !dbg !235
  %0 = load i32, i32* %listenSocket, align 4, !dbg !236
  %cmp = icmp eq i32 %0, -1, !dbg !238
  br i1 %cmp, label %if.then, label %if.end, !dbg !239

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !240

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !242
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !242
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !243
  store i8 2, i8* %sin_family, align 1, !dbg !244
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !245
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !246
  store i32 0, i32* %s_addr, align 4, !dbg !247
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !248
  store i16 -30871, i16* %sin_port, align 2, !dbg !249
  %2 = load i32, i32* %listenSocket, align 4, !dbg !250
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !252
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !253
  %cmp2 = icmp eq i32 %call1, -1, !dbg !254
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !255

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !256

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !258
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !260
  %cmp6 = icmp eq i32 %call5, -1, !dbg !261
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !262

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !263

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !265
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !266
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !267
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !268
  %cmp10 = icmp eq i32 %6, -1, !dbg !270
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !271

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !272

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !274
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !275
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !276
  %conv = trunc i64 %call13 to i32, !dbg !276
  store i32 %conv, i32* %recvResult, align 4, !dbg !277
  %8 = load i32, i32* %recvResult, align 4, !dbg !278
  %cmp14 = icmp eq i32 %8, -1, !dbg !280
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !281

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !282
  %cmp16 = icmp eq i32 %9, 0, !dbg !283
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !284

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !285

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !287
  %idxprom = sext i32 %10 to i64, !dbg !288
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !288
  store i8 0, i8* %arrayidx, align 1, !dbg !289
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !290
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !291
  store i32 %call21, i32* %data, align 4, !dbg !292
  br label %do.end, !dbg !293

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !294
  %cmp22 = icmp ne i32 %11, -1, !dbg !296
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !297

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !298
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !300
  br label %if.end26, !dbg !301

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !302
  %cmp27 = icmp ne i32 %13, -1, !dbg !304
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !305

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !306
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !308
  br label %if.end31, !dbg !309

if.end31:                                         ; preds = %if.then29, %if.end26
  br label %sink, !dbg !310

sink:                                             ; preds = %if.end31
  call void @llvm.dbg.label(metadata !311), !dbg !312
  call void @llvm.dbg.declare(metadata i32* %i, metadata !313, metadata !DIExpression()), !dbg !315
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !316, metadata !DIExpression()), !dbg !317
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !317
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !317
  %16 = load i32, i32* %data, align 4, !dbg !318
  %cmp32 = icmp sge i32 %16, 0, !dbg !320
  br i1 %cmp32, label %land.lhs.true, label %if.else, !dbg !321

land.lhs.true:                                    ; preds = %sink
  %17 = load i32, i32* %data, align 4, !dbg !322
  %cmp34 = icmp slt i32 %17, 10, !dbg !323
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !324

if.then36:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !325
  %idxprom37 = sext i32 %18 to i64, !dbg !327
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !327
  store i32 1, i32* %arrayidx38, align 4, !dbg !328
  store i32 0, i32* %i, align 4, !dbg !329
  br label %for.cond, !dbg !331

for.cond:                                         ; preds = %for.inc, %if.then36
  %19 = load i32, i32* %i, align 4, !dbg !332
  %cmp39 = icmp slt i32 %19, 10, !dbg !334
  br i1 %cmp39, label %for.body, label %for.end, !dbg !335

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !336
  %idxprom41 = sext i32 %20 to i64, !dbg !338
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !338
  %21 = load i32, i32* %arrayidx42, align 4, !dbg !338
  call void @printIntLine(i32 noundef %21), !dbg !339
  br label %for.inc, !dbg !340

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !341
  %inc = add nsw i32 %22, 1, !dbg !341
  store i32 %inc, i32* %i, align 4, !dbg !341
  br label %for.cond, !dbg !342, !llvm.loop !343

for.end:                                          ; preds = %for.cond
  br label %if.end43, !dbg !345

if.else:                                          ; preds = %land.lhs.true, %sink
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !346
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end
  ret void, !dbg !348
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !349 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !350, metadata !DIExpression()), !dbg !351
  store i32 -1, i32* %data, align 4, !dbg !352
  br label %source, !dbg !353

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !354), !dbg !355
  store i32 7, i32* %data, align 4, !dbg !356
  br label %sink, !dbg !357

sink:                                             ; preds = %source
  call void @llvm.dbg.label(metadata !358), !dbg !359
  call void @llvm.dbg.declare(metadata i32* %i, metadata !360, metadata !DIExpression()), !dbg !362
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !363, metadata !DIExpression()), !dbg !364
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !364
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !364
  %1 = load i32, i32* %data, align 4, !dbg !365
  %cmp = icmp sge i32 %1, 0, !dbg !367
  br i1 %cmp, label %if.then, label %if.else, !dbg !368

if.then:                                          ; preds = %sink
  %2 = load i32, i32* %data, align 4, !dbg !369
  %idxprom = sext i32 %2 to i64, !dbg !371
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !371
  store i32 1, i32* %arrayidx, align 4, !dbg !372
  store i32 0, i32* %i, align 4, !dbg !373
  br label %for.cond, !dbg !375

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !376
  %cmp1 = icmp slt i32 %3, 10, !dbg !378
  br i1 %cmp1, label %for.body, label %for.end, !dbg !379

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !380
  %idxprom2 = sext i32 %4 to i64, !dbg !382
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !382
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !382
  call void @printIntLine(i32 noundef %5), !dbg !383
  br label %for.inc, !dbg !384

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !385
  %inc = add nsw i32 %6, 1, !dbg !385
  store i32 %inc, i32* %i, align 4, !dbg !385
  br label %for.cond, !dbg !386, !llvm.loop !387

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !389

if.else:                                          ; preds = %sink
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !390
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !392
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocation(line: 48, column: 10, scope: !31)
!40 = !DILocation(line: 49, column: 5, scope: !31)
!41 = !DILabel(scope: !31, name: "source", file: !32, line: 50)
!42 = !DILocation(line: 50, column: 1, scope: !31)
!43 = !DILocalVariable(name: "recvResult", scope: !44, file: !32, line: 56, type: !37)
!44 = distinct !DILexicalBlock(scope: !31, file: !32, line: 51, column: 5)
!45 = !DILocation(line: 56, column: 13, scope: !44)
!46 = !DILocalVariable(name: "service", scope: !44, file: !32, line: 57, type: !47)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !48, line: 375, size: 128, elements: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!49 = !{!50, !51, !52, !55, !62}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !47, file: !48, line: 376, baseType: !14, size: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !47, file: !48, line: 377, baseType: !17, size: 8, offset: 8)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !47, file: !48, line: 378, baseType: !53, size: 16, offset: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !54, line: 31, baseType: !6)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !47, file: !48, line: 379, baseType: !56, size: 32, offset: 32)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !48, line: 301, size: 32, elements: !57)
!57 = !{!58}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !56, file: !48, line: 302, baseType: !59, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !60, line: 31, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 47, baseType: !5)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !47, file: !48, line: 380, baseType: !63, size: 64, offset: 64)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 64, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 8)
!66 = !DILocation(line: 57, column: 28, scope: !44)
!67 = !DILocalVariable(name: "listenSocket", scope: !44, file: !32, line: 58, type: !37)
!68 = !DILocation(line: 58, column: 16, scope: !44)
!69 = !DILocalVariable(name: "acceptSocket", scope: !44, file: !32, line: 59, type: !37)
!70 = !DILocation(line: 59, column: 16, scope: !44)
!71 = !DILocalVariable(name: "inputBuffer", scope: !44, file: !32, line: 60, type: !20)
!72 = !DILocation(line: 60, column: 14, scope: !44)
!73 = !DILocation(line: 61, column: 9, scope: !44)
!74 = !DILocation(line: 71, column: 28, scope: !75)
!75 = distinct !DILexicalBlock(scope: !44, file: !32, line: 62, column: 9)
!76 = !DILocation(line: 71, column: 26, scope: !75)
!77 = !DILocation(line: 72, column: 17, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !32, line: 72, column: 17)
!79 = !DILocation(line: 72, column: 30, scope: !78)
!80 = !DILocation(line: 72, column: 17, scope: !75)
!81 = !DILocation(line: 74, column: 17, scope: !82)
!82 = distinct !DILexicalBlock(scope: !78, file: !32, line: 73, column: 13)
!83 = !DILocation(line: 76, column: 13, scope: !75)
!84 = !DILocation(line: 77, column: 21, scope: !75)
!85 = !DILocation(line: 77, column: 32, scope: !75)
!86 = !DILocation(line: 78, column: 21, scope: !75)
!87 = !DILocation(line: 78, column: 30, scope: !75)
!88 = !DILocation(line: 78, column: 37, scope: !75)
!89 = !DILocation(line: 79, column: 21, scope: !75)
!90 = !DILocation(line: 79, column: 30, scope: !75)
!91 = !DILocation(line: 80, column: 22, scope: !92)
!92 = distinct !DILexicalBlock(scope: !75, file: !32, line: 80, column: 17)
!93 = !DILocation(line: 80, column: 36, scope: !92)
!94 = !DILocation(line: 80, column: 17, scope: !92)
!95 = !DILocation(line: 80, column: 81, scope: !92)
!96 = !DILocation(line: 80, column: 17, scope: !75)
!97 = !DILocation(line: 82, column: 17, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !32, line: 81, column: 13)
!99 = !DILocation(line: 84, column: 24, scope: !100)
!100 = distinct !DILexicalBlock(scope: !75, file: !32, line: 84, column: 17)
!101 = !DILocation(line: 84, column: 17, scope: !100)
!102 = !DILocation(line: 84, column: 54, scope: !100)
!103 = !DILocation(line: 84, column: 17, scope: !75)
!104 = !DILocation(line: 86, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !32, line: 85, column: 13)
!106 = !DILocation(line: 88, column: 35, scope: !75)
!107 = !DILocation(line: 88, column: 28, scope: !75)
!108 = !DILocation(line: 88, column: 26, scope: !75)
!109 = !DILocation(line: 89, column: 17, scope: !110)
!110 = distinct !DILexicalBlock(scope: !75, file: !32, line: 89, column: 17)
!111 = !DILocation(line: 89, column: 30, scope: !110)
!112 = !DILocation(line: 89, column: 17, scope: !75)
!113 = !DILocation(line: 91, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !32, line: 90, column: 13)
!115 = !DILocation(line: 94, column: 31, scope: !75)
!116 = !DILocation(line: 94, column: 45, scope: !75)
!117 = !DILocation(line: 94, column: 26, scope: !75)
!118 = !DILocation(line: 94, column: 24, scope: !75)
!119 = !DILocation(line: 95, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !75, file: !32, line: 95, column: 17)
!121 = !DILocation(line: 95, column: 28, scope: !120)
!122 = !DILocation(line: 95, column: 44, scope: !120)
!123 = !DILocation(line: 95, column: 47, scope: !120)
!124 = !DILocation(line: 95, column: 58, scope: !120)
!125 = !DILocation(line: 95, column: 17, scope: !75)
!126 = !DILocation(line: 97, column: 17, scope: !127)
!127 = distinct !DILexicalBlock(scope: !120, file: !32, line: 96, column: 13)
!128 = !DILocation(line: 100, column: 25, scope: !75)
!129 = !DILocation(line: 100, column: 13, scope: !75)
!130 = !DILocation(line: 100, column: 37, scope: !75)
!131 = !DILocation(line: 102, column: 25, scope: !75)
!132 = !DILocation(line: 102, column: 20, scope: !75)
!133 = !DILocation(line: 102, column: 18, scope: !75)
!134 = !DILocation(line: 103, column: 9, scope: !75)
!135 = !DILocation(line: 105, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !44, file: !32, line: 105, column: 13)
!137 = !DILocation(line: 105, column: 26, scope: !136)
!138 = !DILocation(line: 105, column: 13, scope: !44)
!139 = !DILocation(line: 107, column: 26, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !32, line: 106, column: 9)
!141 = !DILocation(line: 107, column: 13, scope: !140)
!142 = !DILocation(line: 108, column: 9, scope: !140)
!143 = !DILocation(line: 109, column: 13, scope: !144)
!144 = distinct !DILexicalBlock(scope: !44, file: !32, line: 109, column: 13)
!145 = !DILocation(line: 109, column: 26, scope: !144)
!146 = !DILocation(line: 109, column: 13, scope: !44)
!147 = !DILocation(line: 111, column: 26, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !32, line: 110, column: 9)
!149 = !DILocation(line: 111, column: 13, scope: !148)
!150 = !DILocation(line: 112, column: 9, scope: !148)
!151 = !DILocation(line: 120, column: 5, scope: !31)
!152 = !DILabel(scope: !31, name: "sink", file: !32, line: 121)
!153 = !DILocation(line: 121, column: 1, scope: !31)
!154 = !DILocalVariable(name: "i", scope: !155, file: !32, line: 123, type: !37)
!155 = distinct !DILexicalBlock(scope: !31, file: !32, line: 122, column: 5)
!156 = !DILocation(line: 123, column: 13, scope: !155)
!157 = !DILocalVariable(name: "buffer", scope: !155, file: !32, line: 124, type: !158)
!158 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !159)
!159 = !{!160}
!160 = !DISubrange(count: 10)
!161 = !DILocation(line: 124, column: 13, scope: !155)
!162 = !DILocation(line: 127, column: 13, scope: !163)
!163 = distinct !DILexicalBlock(scope: !155, file: !32, line: 127, column: 13)
!164 = !DILocation(line: 127, column: 18, scope: !163)
!165 = !DILocation(line: 127, column: 13, scope: !155)
!166 = !DILocation(line: 129, column: 20, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !32, line: 128, column: 9)
!168 = !DILocation(line: 129, column: 13, scope: !167)
!169 = !DILocation(line: 129, column: 26, scope: !167)
!170 = !DILocation(line: 131, column: 19, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !32, line: 131, column: 13)
!172 = !DILocation(line: 131, column: 17, scope: !171)
!173 = !DILocation(line: 131, column: 24, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !32, line: 131, column: 13)
!175 = !DILocation(line: 131, column: 26, scope: !174)
!176 = !DILocation(line: 131, column: 13, scope: !171)
!177 = !DILocation(line: 133, column: 37, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !32, line: 132, column: 13)
!179 = !DILocation(line: 133, column: 30, scope: !178)
!180 = !DILocation(line: 133, column: 17, scope: !178)
!181 = !DILocation(line: 134, column: 13, scope: !178)
!182 = !DILocation(line: 131, column: 33, scope: !174)
!183 = !DILocation(line: 131, column: 13, scope: !174)
!184 = distinct !{!184, !176, !185, !186}
!185 = !DILocation(line: 134, column: 13, scope: !171)
!186 = !{!"llvm.loop.mustprogress"}
!187 = !DILocation(line: 135, column: 9, scope: !167)
!188 = !DILocation(line: 138, column: 13, scope: !189)
!189 = distinct !DILexicalBlock(scope: !163, file: !32, line: 137, column: 9)
!190 = !DILocation(line: 141, column: 1, scope: !31)
!191 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_18_good", scope: !32, file: !32, line: 280, type: !33, scopeLine: 281, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!192 = !DILocation(line: 282, column: 5, scope: !191)
!193 = !DILocation(line: 283, column: 5, scope: !191)
!194 = !DILocation(line: 284, column: 1, scope: !191)
!195 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 295, type: !196, scopeLine: 296, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!196 = !DISubroutineType(types: !197)
!197 = !{!37, !37, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!200 = !DILocalVariable(name: "argc", arg: 1, scope: !195, file: !32, line: 295, type: !37)
!201 = !DILocation(line: 295, column: 14, scope: !195)
!202 = !DILocalVariable(name: "argv", arg: 2, scope: !195, file: !32, line: 295, type: !198)
!203 = !DILocation(line: 295, column: 27, scope: !195)
!204 = !DILocation(line: 298, column: 22, scope: !195)
!205 = !DILocation(line: 298, column: 12, scope: !195)
!206 = !DILocation(line: 298, column: 5, scope: !195)
!207 = !DILocation(line: 300, column: 5, scope: !195)
!208 = !DILocation(line: 301, column: 5, scope: !195)
!209 = !DILocation(line: 302, column: 5, scope: !195)
!210 = !DILocation(line: 305, column: 5, scope: !195)
!211 = !DILocation(line: 306, column: 5, scope: !195)
!212 = !DILocation(line: 307, column: 5, scope: !195)
!213 = !DILocation(line: 309, column: 5, scope: !195)
!214 = distinct !DISubprogram(name: "goodB2G", scope: !32, file: !32, line: 148, type: !33, scopeLine: 149, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!215 = !DILocalVariable(name: "data", scope: !214, file: !32, line: 150, type: !37)
!216 = !DILocation(line: 150, column: 9, scope: !214)
!217 = !DILocation(line: 152, column: 10, scope: !214)
!218 = !DILocation(line: 153, column: 5, scope: !214)
!219 = !DILabel(scope: !214, name: "source", file: !32, line: 154)
!220 = !DILocation(line: 154, column: 1, scope: !214)
!221 = !DILocalVariable(name: "recvResult", scope: !222, file: !32, line: 160, type: !37)
!222 = distinct !DILexicalBlock(scope: !214, file: !32, line: 155, column: 5)
!223 = !DILocation(line: 160, column: 13, scope: !222)
!224 = !DILocalVariable(name: "service", scope: !222, file: !32, line: 161, type: !47)
!225 = !DILocation(line: 161, column: 28, scope: !222)
!226 = !DILocalVariable(name: "listenSocket", scope: !222, file: !32, line: 162, type: !37)
!227 = !DILocation(line: 162, column: 16, scope: !222)
!228 = !DILocalVariable(name: "acceptSocket", scope: !222, file: !32, line: 163, type: !37)
!229 = !DILocation(line: 163, column: 16, scope: !222)
!230 = !DILocalVariable(name: "inputBuffer", scope: !222, file: !32, line: 164, type: !20)
!231 = !DILocation(line: 164, column: 14, scope: !222)
!232 = !DILocation(line: 165, column: 9, scope: !222)
!233 = !DILocation(line: 175, column: 28, scope: !234)
!234 = distinct !DILexicalBlock(scope: !222, file: !32, line: 166, column: 9)
!235 = !DILocation(line: 175, column: 26, scope: !234)
!236 = !DILocation(line: 176, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !234, file: !32, line: 176, column: 17)
!238 = !DILocation(line: 176, column: 30, scope: !237)
!239 = !DILocation(line: 176, column: 17, scope: !234)
!240 = !DILocation(line: 178, column: 17, scope: !241)
!241 = distinct !DILexicalBlock(scope: !237, file: !32, line: 177, column: 13)
!242 = !DILocation(line: 180, column: 13, scope: !234)
!243 = !DILocation(line: 181, column: 21, scope: !234)
!244 = !DILocation(line: 181, column: 32, scope: !234)
!245 = !DILocation(line: 182, column: 21, scope: !234)
!246 = !DILocation(line: 182, column: 30, scope: !234)
!247 = !DILocation(line: 182, column: 37, scope: !234)
!248 = !DILocation(line: 183, column: 21, scope: !234)
!249 = !DILocation(line: 183, column: 30, scope: !234)
!250 = !DILocation(line: 184, column: 22, scope: !251)
!251 = distinct !DILexicalBlock(scope: !234, file: !32, line: 184, column: 17)
!252 = !DILocation(line: 184, column: 36, scope: !251)
!253 = !DILocation(line: 184, column: 17, scope: !251)
!254 = !DILocation(line: 184, column: 81, scope: !251)
!255 = !DILocation(line: 184, column: 17, scope: !234)
!256 = !DILocation(line: 186, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !251, file: !32, line: 185, column: 13)
!258 = !DILocation(line: 188, column: 24, scope: !259)
!259 = distinct !DILexicalBlock(scope: !234, file: !32, line: 188, column: 17)
!260 = !DILocation(line: 188, column: 17, scope: !259)
!261 = !DILocation(line: 188, column: 54, scope: !259)
!262 = !DILocation(line: 188, column: 17, scope: !234)
!263 = !DILocation(line: 190, column: 17, scope: !264)
!264 = distinct !DILexicalBlock(scope: !259, file: !32, line: 189, column: 13)
!265 = !DILocation(line: 192, column: 35, scope: !234)
!266 = !DILocation(line: 192, column: 28, scope: !234)
!267 = !DILocation(line: 192, column: 26, scope: !234)
!268 = !DILocation(line: 193, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !234, file: !32, line: 193, column: 17)
!270 = !DILocation(line: 193, column: 30, scope: !269)
!271 = !DILocation(line: 193, column: 17, scope: !234)
!272 = !DILocation(line: 195, column: 17, scope: !273)
!273 = distinct !DILexicalBlock(scope: !269, file: !32, line: 194, column: 13)
!274 = !DILocation(line: 198, column: 31, scope: !234)
!275 = !DILocation(line: 198, column: 45, scope: !234)
!276 = !DILocation(line: 198, column: 26, scope: !234)
!277 = !DILocation(line: 198, column: 24, scope: !234)
!278 = !DILocation(line: 199, column: 17, scope: !279)
!279 = distinct !DILexicalBlock(scope: !234, file: !32, line: 199, column: 17)
!280 = !DILocation(line: 199, column: 28, scope: !279)
!281 = !DILocation(line: 199, column: 44, scope: !279)
!282 = !DILocation(line: 199, column: 47, scope: !279)
!283 = !DILocation(line: 199, column: 58, scope: !279)
!284 = !DILocation(line: 199, column: 17, scope: !234)
!285 = !DILocation(line: 201, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !279, file: !32, line: 200, column: 13)
!287 = !DILocation(line: 204, column: 25, scope: !234)
!288 = !DILocation(line: 204, column: 13, scope: !234)
!289 = !DILocation(line: 204, column: 37, scope: !234)
!290 = !DILocation(line: 206, column: 25, scope: !234)
!291 = !DILocation(line: 206, column: 20, scope: !234)
!292 = !DILocation(line: 206, column: 18, scope: !234)
!293 = !DILocation(line: 207, column: 9, scope: !234)
!294 = !DILocation(line: 209, column: 13, scope: !295)
!295 = distinct !DILexicalBlock(scope: !222, file: !32, line: 209, column: 13)
!296 = !DILocation(line: 209, column: 26, scope: !295)
!297 = !DILocation(line: 209, column: 13, scope: !222)
!298 = !DILocation(line: 211, column: 26, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !32, line: 210, column: 9)
!300 = !DILocation(line: 211, column: 13, scope: !299)
!301 = !DILocation(line: 212, column: 9, scope: !299)
!302 = !DILocation(line: 213, column: 13, scope: !303)
!303 = distinct !DILexicalBlock(scope: !222, file: !32, line: 213, column: 13)
!304 = !DILocation(line: 213, column: 26, scope: !303)
!305 = !DILocation(line: 213, column: 13, scope: !222)
!306 = !DILocation(line: 215, column: 26, scope: !307)
!307 = distinct !DILexicalBlock(scope: !303, file: !32, line: 214, column: 9)
!308 = !DILocation(line: 215, column: 13, scope: !307)
!309 = !DILocation(line: 216, column: 9, scope: !307)
!310 = !DILocation(line: 224, column: 5, scope: !214)
!311 = !DILabel(scope: !214, name: "sink", file: !32, line: 225)
!312 = !DILocation(line: 225, column: 1, scope: !214)
!313 = !DILocalVariable(name: "i", scope: !314, file: !32, line: 227, type: !37)
!314 = distinct !DILexicalBlock(scope: !214, file: !32, line: 226, column: 5)
!315 = !DILocation(line: 227, column: 13, scope: !314)
!316 = !DILocalVariable(name: "buffer", scope: !314, file: !32, line: 228, type: !158)
!317 = !DILocation(line: 228, column: 13, scope: !314)
!318 = !DILocation(line: 230, column: 13, scope: !319)
!319 = distinct !DILexicalBlock(scope: !314, file: !32, line: 230, column: 13)
!320 = !DILocation(line: 230, column: 18, scope: !319)
!321 = !DILocation(line: 230, column: 23, scope: !319)
!322 = !DILocation(line: 230, column: 26, scope: !319)
!323 = !DILocation(line: 230, column: 31, scope: !319)
!324 = !DILocation(line: 230, column: 13, scope: !314)
!325 = !DILocation(line: 232, column: 20, scope: !326)
!326 = distinct !DILexicalBlock(scope: !319, file: !32, line: 231, column: 9)
!327 = !DILocation(line: 232, column: 13, scope: !326)
!328 = !DILocation(line: 232, column: 26, scope: !326)
!329 = !DILocation(line: 234, column: 19, scope: !330)
!330 = distinct !DILexicalBlock(scope: !326, file: !32, line: 234, column: 13)
!331 = !DILocation(line: 234, column: 17, scope: !330)
!332 = !DILocation(line: 234, column: 24, scope: !333)
!333 = distinct !DILexicalBlock(scope: !330, file: !32, line: 234, column: 13)
!334 = !DILocation(line: 234, column: 26, scope: !333)
!335 = !DILocation(line: 234, column: 13, scope: !330)
!336 = !DILocation(line: 236, column: 37, scope: !337)
!337 = distinct !DILexicalBlock(scope: !333, file: !32, line: 235, column: 13)
!338 = !DILocation(line: 236, column: 30, scope: !337)
!339 = !DILocation(line: 236, column: 17, scope: !337)
!340 = !DILocation(line: 237, column: 13, scope: !337)
!341 = !DILocation(line: 234, column: 33, scope: !333)
!342 = !DILocation(line: 234, column: 13, scope: !333)
!343 = distinct !{!343, !335, !344, !186}
!344 = !DILocation(line: 237, column: 13, scope: !330)
!345 = !DILocation(line: 238, column: 9, scope: !326)
!346 = !DILocation(line: 241, column: 13, scope: !347)
!347 = distinct !DILexicalBlock(scope: !319, file: !32, line: 240, column: 9)
!348 = !DILocation(line: 244, column: 1, scope: !214)
!349 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 247, type: !33, scopeLine: 248, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!350 = !DILocalVariable(name: "data", scope: !349, file: !32, line: 249, type: !37)
!351 = !DILocation(line: 249, column: 9, scope: !349)
!352 = !DILocation(line: 251, column: 10, scope: !349)
!353 = !DILocation(line: 252, column: 5, scope: !349)
!354 = !DILabel(scope: !349, name: "source", file: !32, line: 253)
!355 = !DILocation(line: 253, column: 1, scope: !349)
!356 = !DILocation(line: 256, column: 10, scope: !349)
!357 = !DILocation(line: 257, column: 5, scope: !349)
!358 = !DILabel(scope: !349, name: "sink", file: !32, line: 258)
!359 = !DILocation(line: 258, column: 1, scope: !349)
!360 = !DILocalVariable(name: "i", scope: !361, file: !32, line: 260, type: !37)
!361 = distinct !DILexicalBlock(scope: !349, file: !32, line: 259, column: 5)
!362 = !DILocation(line: 260, column: 13, scope: !361)
!363 = !DILocalVariable(name: "buffer", scope: !361, file: !32, line: 261, type: !158)
!364 = !DILocation(line: 261, column: 13, scope: !361)
!365 = !DILocation(line: 264, column: 13, scope: !366)
!366 = distinct !DILexicalBlock(scope: !361, file: !32, line: 264, column: 13)
!367 = !DILocation(line: 264, column: 18, scope: !366)
!368 = !DILocation(line: 264, column: 13, scope: !361)
!369 = !DILocation(line: 266, column: 20, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !32, line: 265, column: 9)
!371 = !DILocation(line: 266, column: 13, scope: !370)
!372 = !DILocation(line: 266, column: 26, scope: !370)
!373 = !DILocation(line: 268, column: 19, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !32, line: 268, column: 13)
!375 = !DILocation(line: 268, column: 17, scope: !374)
!376 = !DILocation(line: 268, column: 24, scope: !377)
!377 = distinct !DILexicalBlock(scope: !374, file: !32, line: 268, column: 13)
!378 = !DILocation(line: 268, column: 26, scope: !377)
!379 = !DILocation(line: 268, column: 13, scope: !374)
!380 = !DILocation(line: 270, column: 37, scope: !381)
!381 = distinct !DILexicalBlock(scope: !377, file: !32, line: 269, column: 13)
!382 = !DILocation(line: 270, column: 30, scope: !381)
!383 = !DILocation(line: 270, column: 17, scope: !381)
!384 = !DILocation(line: 271, column: 13, scope: !381)
!385 = !DILocation(line: 268, column: 33, scope: !377)
!386 = !DILocation(line: 268, column: 13, scope: !377)
!387 = distinct !{!387, !379, !388, !186}
!388 = !DILocation(line: 271, column: 13, scope: !374)
!389 = !DILocation(line: 272, column: 9, scope: !370)
!390 = !DILocation(line: 275, column: 13, scope: !391)
!391 = distinct !DILexicalBlock(scope: !366, file: !32, line: 274, column: 9)
!392 = !DILocation(line: 278, column: 1, scope: !349)
