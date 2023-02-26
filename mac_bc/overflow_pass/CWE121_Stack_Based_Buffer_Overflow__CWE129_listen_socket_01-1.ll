; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_bad() #0 !dbg !31 {
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
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !40, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !43, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !64, metadata !DIExpression()), !dbg !65
  store i32 -1, i32* %listenSocket, align 4, !dbg !65
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, i32* %acceptSocket, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  br label %do.body, !dbg !70

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !71
  store i32 %call, i32* %listenSocket, align 4, !dbg !73
  %0 = load i32, i32* %listenSocket, align 4, !dbg !74
  %cmp = icmp eq i32 %0, -1, !dbg !76
  br i1 %cmp, label %if.then, label %if.end, !dbg !77

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !78

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !80
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !81
  store i8 2, i8* %sin_family, align 1, !dbg !82
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !83
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !84
  store i32 0, i32* %s_addr, align 4, !dbg !85
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !86
  store i16 -30871, i16* %sin_port, align 2, !dbg !87
  %2 = load i32, i32* %listenSocket, align 4, !dbg !88
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !90
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !91
  %cmp2 = icmp eq i32 %call1, -1, !dbg !92
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !93

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !94

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !96
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !98
  %cmp6 = icmp eq i32 %call5, -1, !dbg !99
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !100

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !101

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !103
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !104
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !105
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !106
  %cmp10 = icmp eq i32 %6, -1, !dbg !108
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !109

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !110

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !112
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !113
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !114
  %conv = trunc i64 %call13 to i32, !dbg !114
  store i32 %conv, i32* %recvResult, align 4, !dbg !115
  %8 = load i32, i32* %recvResult, align 4, !dbg !116
  %cmp14 = icmp eq i32 %8, -1, !dbg !118
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !119

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !120
  %cmp16 = icmp eq i32 %9, 0, !dbg !121
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !122

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !123

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !125
  %idxprom = sext i32 %10 to i64, !dbg !126
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !126
  store i8 0, i8* %arrayidx, align 1, !dbg !127
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !128
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !129
  store i32 %call21, i32* %data, align 4, !dbg !130
  br label %do.end, !dbg !131

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !132
  %cmp22 = icmp ne i32 %11, -1, !dbg !134
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !135

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !136
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !138
  br label %if.end26, !dbg !139

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !140
  %cmp27 = icmp ne i32 %13, -1, !dbg !142
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !143

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !144
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !146
  br label %if.end31, !dbg !147

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !148, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !151, metadata !DIExpression()), !dbg !155
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !155
  %16 = load i32, i32* %data, align 4, !dbg !156
  %cmp32 = icmp sge i32 %16, 0, !dbg !158
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !159

if.then34:                                        ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !160
  %idxprom35 = sext i32 %17 to i64, !dbg !162
  %arrayidx36 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom35, !dbg !162
  store i32 1, i32* %arrayidx36, align 4, !dbg !163
  store i32 0, i32* %i, align 4, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.then34
  %18 = load i32, i32* %i, align 4, !dbg !167
  %cmp37 = icmp slt i32 %18, 10, !dbg !169
  br i1 %cmp37, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %19 = load i32, i32* %i, align 4, !dbg !171
  %idxprom39 = sext i32 %19 to i64, !dbg !173
  %arrayidx40 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom39, !dbg !173
  %20 = load i32, i32* %arrayidx40, align 4, !dbg !173
  call void @printIntLine(i32 noundef %20), !dbg !174
  br label %for.inc, !dbg !175

for.inc:                                          ; preds = %for.body
  %21 = load i32, i32* %i, align 4, !dbg !176
  %inc = add nsw i32 %21, 1, !dbg !176
  store i32 %inc, i32* %i, align 4, !dbg !176
  br label %for.cond, !dbg !177, !llvm.loop !178

for.end:                                          ; preds = %for.cond
  br label %if.end41, !dbg !181

if.else:                                          ; preds = %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !182
  br label %if.end41

if.end41:                                         ; preds = %if.else, %for.end
  ret void, !dbg !184
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_good() #0 !dbg !185 {
entry:
  call void @goodG2B(), !dbg !186
  call void @goodB2G(), !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !189 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !194, metadata !DIExpression()), !dbg !195
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !196, metadata !DIExpression()), !dbg !197
  %call = call i64 @time(i64* noundef null), !dbg !198
  %conv = trunc i64 %call to i32, !dbg !199
  call void @srand(i32 noundef %conv), !dbg !200
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !201
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_good(), !dbg !202
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !203
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !204
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_bad(), !dbg !205
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !206
  ret i32 0, !dbg !207
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !208 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !209, metadata !DIExpression()), !dbg !210
  store i32 -1, i32* %data, align 4, !dbg !211
  store i32 7, i32* %data, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata i32* %i, metadata !213, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !216, metadata !DIExpression()), !dbg !217
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !217
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !217
  %1 = load i32, i32* %data, align 4, !dbg !218
  %cmp = icmp sge i32 %1, 0, !dbg !220
  br i1 %cmp, label %if.then, label %if.else, !dbg !221

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !222
  %idxprom = sext i32 %2 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !224
  store i32 1, i32* %arrayidx, align 4, !dbg !225
  store i32 0, i32* %i, align 4, !dbg !226
  br label %for.cond, !dbg !228

for.cond:                                         ; preds = %for.inc, %if.then
  %3 = load i32, i32* %i, align 4, !dbg !229
  %cmp1 = icmp slt i32 %3, 10, !dbg !231
  br i1 %cmp1, label %for.body, label %for.end, !dbg !232

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !233
  %idxprom2 = sext i32 %4 to i64, !dbg !235
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !235
  %5 = load i32, i32* %arrayidx3, align 4, !dbg !235
  call void @printIntLine(i32 noundef %5), !dbg !236
  br label %for.inc, !dbg !237

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !238
  %inc = add nsw i32 %6, 1, !dbg !238
  store i32 %inc, i32* %i, align 4, !dbg !238
  br label %for.cond, !dbg !239, !llvm.loop !240

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !242

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !243
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !245
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !246 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !247, metadata !DIExpression()), !dbg !248
  store i32 -1, i32* %data, align 4, !dbg !249
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !250, metadata !DIExpression()), !dbg !252
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !253, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !255, metadata !DIExpression()), !dbg !256
  store i32 -1, i32* %listenSocket, align 4, !dbg !256
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !257, metadata !DIExpression()), !dbg !258
  store i32 -1, i32* %acceptSocket, align 4, !dbg !258
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !259, metadata !DIExpression()), !dbg !260
  br label %do.body, !dbg !261

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !262
  store i32 %call, i32* %listenSocket, align 4, !dbg !264
  %0 = load i32, i32* %listenSocket, align 4, !dbg !265
  %cmp = icmp eq i32 %0, -1, !dbg !267
  br i1 %cmp, label %if.then, label %if.end, !dbg !268

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !269

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !271
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !271
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !272
  store i8 2, i8* %sin_family, align 1, !dbg !273
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !274
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !275
  store i32 0, i32* %s_addr, align 4, !dbg !276
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !277
  store i16 -30871, i16* %sin_port, align 2, !dbg !278
  %2 = load i32, i32* %listenSocket, align 4, !dbg !279
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !281
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !282
  %cmp2 = icmp eq i32 %call1, -1, !dbg !283
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !284

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !285

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !287
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !289
  %cmp6 = icmp eq i32 %call5, -1, !dbg !290
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !291

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !292

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !294
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !295
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !296
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !297
  %cmp10 = icmp eq i32 %6, -1, !dbg !299
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !300

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !301

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !303
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !304
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !305
  %conv = trunc i64 %call13 to i32, !dbg !305
  store i32 %conv, i32* %recvResult, align 4, !dbg !306
  %8 = load i32, i32* %recvResult, align 4, !dbg !307
  %cmp14 = icmp eq i32 %8, -1, !dbg !309
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !310

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !311
  %cmp16 = icmp eq i32 %9, 0, !dbg !312
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !313

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !314

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !316
  %idxprom = sext i32 %10 to i64, !dbg !317
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !317
  store i8 0, i8* %arrayidx, align 1, !dbg !318
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !319
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !320
  store i32 %call21, i32* %data, align 4, !dbg !321
  br label %do.end, !dbg !322

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !323
  %cmp22 = icmp ne i32 %11, -1, !dbg !325
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !326

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !327
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !329
  br label %if.end26, !dbg !330

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !331
  %cmp27 = icmp ne i32 %13, -1, !dbg !333
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !334

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !335
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !337
  br label %if.end31, !dbg !338

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata i32* %i, metadata !339, metadata !DIExpression()), !dbg !341
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !342, metadata !DIExpression()), !dbg !343
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !343
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !343
  %16 = load i32, i32* %data, align 4, !dbg !344
  %cmp32 = icmp sge i32 %16, 0, !dbg !346
  br i1 %cmp32, label %land.lhs.true, label %if.else, !dbg !347

land.lhs.true:                                    ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !348
  %cmp34 = icmp slt i32 %17, 10, !dbg !349
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !350

if.then36:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !351
  %idxprom37 = sext i32 %18 to i64, !dbg !353
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !353
  store i32 1, i32* %arrayidx38, align 4, !dbg !354
  store i32 0, i32* %i, align 4, !dbg !355
  br label %for.cond, !dbg !357

for.cond:                                         ; preds = %for.inc, %if.then36
  %19 = load i32, i32* %i, align 4, !dbg !358
  %cmp39 = icmp slt i32 %19, 10, !dbg !360
  br i1 %cmp39, label %for.body, label %for.end, !dbg !361

for.body:                                         ; preds = %for.cond
  %20 = load i32, i32* %i, align 4, !dbg !362
  %idxprom41 = sext i32 %20 to i64, !dbg !364
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !364
  %21 = load i32, i32* %arrayidx42, align 4, !dbg !364
  call void @printIntLine(i32 noundef %21), !dbg !365
  br label %for.inc, !dbg !366

for.inc:                                          ; preds = %for.body
  %22 = load i32, i32* %i, align 4, !dbg !367
  %inc = add nsw i32 %22, 1, !dbg !367
  store i32 %inc, i32* %i, align 4, !dbg !367
  br label %for.cond, !dbg !368, !llvm.loop !369

for.end:                                          ; preds = %for.cond
  br label %if.end43, !dbg !371

if.else:                                          ; preds = %land.lhs.true, %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !372
  br label %if.end43

if.end43:                                         ; preds = %if.else, %for.end
  ret void, !dbg !374
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 46, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 46, column: 9, scope: !31)
!39 = !DILocation(line: 48, column: 10, scope: !31)
!40 = !DILocalVariable(name: "recvResult", scope: !41, file: !32, line: 54, type: !37)
!41 = distinct !DILexicalBlock(scope: !31, file: !32, line: 49, column: 5)
!42 = !DILocation(line: 54, column: 13, scope: !41)
!43 = !DILocalVariable(name: "service", scope: !41, file: !32, line: 55, type: !44)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !45, line: 375, size: 128, elements: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!46 = !{!47, !48, !49, !52, !59}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !44, file: !45, line: 376, baseType: !14, size: 8)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !44, file: !45, line: 377, baseType: !17, size: 8, offset: 8)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !44, file: !45, line: 378, baseType: !50, size: 16, offset: 16)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !51, line: 31, baseType: !6)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !44, file: !45, line: 379, baseType: !53, size: 32, offset: 32)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !45, line: 301, size: 32, elements: !54)
!54 = !{!55}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !53, file: !45, line: 302, baseType: !56, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 47, baseType: !5)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !44, file: !45, line: 380, baseType: !60, size: 64, offset: 64)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 64, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 8)
!63 = !DILocation(line: 55, column: 28, scope: !41)
!64 = !DILocalVariable(name: "listenSocket", scope: !41, file: !32, line: 56, type: !37)
!65 = !DILocation(line: 56, column: 16, scope: !41)
!66 = !DILocalVariable(name: "acceptSocket", scope: !41, file: !32, line: 57, type: !37)
!67 = !DILocation(line: 57, column: 16, scope: !41)
!68 = !DILocalVariable(name: "inputBuffer", scope: !41, file: !32, line: 58, type: !20)
!69 = !DILocation(line: 58, column: 14, scope: !41)
!70 = !DILocation(line: 59, column: 9, scope: !41)
!71 = !DILocation(line: 69, column: 28, scope: !72)
!72 = distinct !DILexicalBlock(scope: !41, file: !32, line: 60, column: 9)
!73 = !DILocation(line: 69, column: 26, scope: !72)
!74 = !DILocation(line: 70, column: 17, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !32, line: 70, column: 17)
!76 = !DILocation(line: 70, column: 30, scope: !75)
!77 = !DILocation(line: 70, column: 17, scope: !72)
!78 = !DILocation(line: 72, column: 17, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !32, line: 71, column: 13)
!80 = !DILocation(line: 74, column: 13, scope: !72)
!81 = !DILocation(line: 75, column: 21, scope: !72)
!82 = !DILocation(line: 75, column: 32, scope: !72)
!83 = !DILocation(line: 76, column: 21, scope: !72)
!84 = !DILocation(line: 76, column: 30, scope: !72)
!85 = !DILocation(line: 76, column: 37, scope: !72)
!86 = !DILocation(line: 77, column: 21, scope: !72)
!87 = !DILocation(line: 77, column: 30, scope: !72)
!88 = !DILocation(line: 78, column: 22, scope: !89)
!89 = distinct !DILexicalBlock(scope: !72, file: !32, line: 78, column: 17)
!90 = !DILocation(line: 78, column: 36, scope: !89)
!91 = !DILocation(line: 78, column: 17, scope: !89)
!92 = !DILocation(line: 78, column: 81, scope: !89)
!93 = !DILocation(line: 78, column: 17, scope: !72)
!94 = !DILocation(line: 80, column: 17, scope: !95)
!95 = distinct !DILexicalBlock(scope: !89, file: !32, line: 79, column: 13)
!96 = !DILocation(line: 82, column: 24, scope: !97)
!97 = distinct !DILexicalBlock(scope: !72, file: !32, line: 82, column: 17)
!98 = !DILocation(line: 82, column: 17, scope: !97)
!99 = !DILocation(line: 82, column: 54, scope: !97)
!100 = !DILocation(line: 82, column: 17, scope: !72)
!101 = !DILocation(line: 84, column: 17, scope: !102)
!102 = distinct !DILexicalBlock(scope: !97, file: !32, line: 83, column: 13)
!103 = !DILocation(line: 86, column: 35, scope: !72)
!104 = !DILocation(line: 86, column: 28, scope: !72)
!105 = !DILocation(line: 86, column: 26, scope: !72)
!106 = !DILocation(line: 87, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !72, file: !32, line: 87, column: 17)
!108 = !DILocation(line: 87, column: 30, scope: !107)
!109 = !DILocation(line: 87, column: 17, scope: !72)
!110 = !DILocation(line: 89, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !32, line: 88, column: 13)
!112 = !DILocation(line: 92, column: 31, scope: !72)
!113 = !DILocation(line: 92, column: 45, scope: !72)
!114 = !DILocation(line: 92, column: 26, scope: !72)
!115 = !DILocation(line: 92, column: 24, scope: !72)
!116 = !DILocation(line: 93, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !72, file: !32, line: 93, column: 17)
!118 = !DILocation(line: 93, column: 28, scope: !117)
!119 = !DILocation(line: 93, column: 44, scope: !117)
!120 = !DILocation(line: 93, column: 47, scope: !117)
!121 = !DILocation(line: 93, column: 58, scope: !117)
!122 = !DILocation(line: 93, column: 17, scope: !72)
!123 = !DILocation(line: 95, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !117, file: !32, line: 94, column: 13)
!125 = !DILocation(line: 98, column: 25, scope: !72)
!126 = !DILocation(line: 98, column: 13, scope: !72)
!127 = !DILocation(line: 98, column: 37, scope: !72)
!128 = !DILocation(line: 100, column: 25, scope: !72)
!129 = !DILocation(line: 100, column: 20, scope: !72)
!130 = !DILocation(line: 100, column: 18, scope: !72)
!131 = !DILocation(line: 101, column: 9, scope: !72)
!132 = !DILocation(line: 103, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !41, file: !32, line: 103, column: 13)
!134 = !DILocation(line: 103, column: 26, scope: !133)
!135 = !DILocation(line: 103, column: 13, scope: !41)
!136 = !DILocation(line: 105, column: 26, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !32, line: 104, column: 9)
!138 = !DILocation(line: 105, column: 13, scope: !137)
!139 = !DILocation(line: 106, column: 9, scope: !137)
!140 = !DILocation(line: 107, column: 13, scope: !141)
!141 = distinct !DILexicalBlock(scope: !41, file: !32, line: 107, column: 13)
!142 = !DILocation(line: 107, column: 26, scope: !141)
!143 = !DILocation(line: 107, column: 13, scope: !41)
!144 = !DILocation(line: 109, column: 26, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !32, line: 108, column: 9)
!146 = !DILocation(line: 109, column: 13, scope: !145)
!147 = !DILocation(line: 110, column: 9, scope: !145)
!148 = !DILocalVariable(name: "i", scope: !149, file: !32, line: 119, type: !37)
!149 = distinct !DILexicalBlock(scope: !31, file: !32, line: 118, column: 5)
!150 = !DILocation(line: 119, column: 13, scope: !149)
!151 = !DILocalVariable(name: "buffer", scope: !149, file: !32, line: 120, type: !152)
!152 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !153)
!153 = !{!154}
!154 = !DISubrange(count: 10)
!155 = !DILocation(line: 120, column: 13, scope: !149)
!156 = !DILocation(line: 123, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !149, file: !32, line: 123, column: 13)
!158 = !DILocation(line: 123, column: 18, scope: !157)
!159 = !DILocation(line: 123, column: 13, scope: !149)
!160 = !DILocation(line: 125, column: 20, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !32, line: 124, column: 9)
!162 = !DILocation(line: 125, column: 13, scope: !161)
!163 = !DILocation(line: 125, column: 26, scope: !161)
!164 = !DILocation(line: 127, column: 19, scope: !165)
!165 = distinct !DILexicalBlock(scope: !161, file: !32, line: 127, column: 13)
!166 = !DILocation(line: 127, column: 17, scope: !165)
!167 = !DILocation(line: 127, column: 24, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !32, line: 127, column: 13)
!169 = !DILocation(line: 127, column: 26, scope: !168)
!170 = !DILocation(line: 127, column: 13, scope: !165)
!171 = !DILocation(line: 129, column: 37, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !32, line: 128, column: 13)
!173 = !DILocation(line: 129, column: 30, scope: !172)
!174 = !DILocation(line: 129, column: 17, scope: !172)
!175 = !DILocation(line: 130, column: 13, scope: !172)
!176 = !DILocation(line: 127, column: 33, scope: !168)
!177 = !DILocation(line: 127, column: 13, scope: !168)
!178 = distinct !{!178, !170, !179, !180}
!179 = !DILocation(line: 130, column: 13, scope: !165)
!180 = !{!"llvm.loop.mustprogress"}
!181 = !DILocation(line: 131, column: 9, scope: !161)
!182 = !DILocation(line: 134, column: 13, scope: !183)
!183 = distinct !DILexicalBlock(scope: !157, file: !32, line: 133, column: 9)
!184 = !DILocation(line: 137, column: 1, scope: !31)
!185 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_01_good", scope: !32, file: !32, line: 268, type: !33, scopeLine: 269, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!186 = !DILocation(line: 270, column: 5, scope: !185)
!187 = !DILocation(line: 271, column: 5, scope: !185)
!188 = !DILocation(line: 272, column: 1, scope: !185)
!189 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 283, type: !190, scopeLine: 284, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!190 = !DISubroutineType(types: !191)
!191 = !{!37, !37, !192}
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!194 = !DILocalVariable(name: "argc", arg: 1, scope: !189, file: !32, line: 283, type: !37)
!195 = !DILocation(line: 283, column: 14, scope: !189)
!196 = !DILocalVariable(name: "argv", arg: 2, scope: !189, file: !32, line: 283, type: !192)
!197 = !DILocation(line: 283, column: 27, scope: !189)
!198 = !DILocation(line: 286, column: 22, scope: !189)
!199 = !DILocation(line: 286, column: 12, scope: !189)
!200 = !DILocation(line: 286, column: 5, scope: !189)
!201 = !DILocation(line: 288, column: 5, scope: !189)
!202 = !DILocation(line: 289, column: 5, scope: !189)
!203 = !DILocation(line: 290, column: 5, scope: !189)
!204 = !DILocation(line: 293, column: 5, scope: !189)
!205 = !DILocation(line: 294, column: 5, scope: !189)
!206 = !DILocation(line: 295, column: 5, scope: !189)
!207 = !DILocation(line: 297, column: 5, scope: !189)
!208 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 144, type: !33, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!209 = !DILocalVariable(name: "data", scope: !208, file: !32, line: 146, type: !37)
!210 = !DILocation(line: 146, column: 9, scope: !208)
!211 = !DILocation(line: 148, column: 10, scope: !208)
!212 = !DILocation(line: 151, column: 10, scope: !208)
!213 = !DILocalVariable(name: "i", scope: !214, file: !32, line: 153, type: !37)
!214 = distinct !DILexicalBlock(scope: !208, file: !32, line: 152, column: 5)
!215 = !DILocation(line: 153, column: 13, scope: !214)
!216 = !DILocalVariable(name: "buffer", scope: !214, file: !32, line: 154, type: !152)
!217 = !DILocation(line: 154, column: 13, scope: !214)
!218 = !DILocation(line: 157, column: 13, scope: !219)
!219 = distinct !DILexicalBlock(scope: !214, file: !32, line: 157, column: 13)
!220 = !DILocation(line: 157, column: 18, scope: !219)
!221 = !DILocation(line: 157, column: 13, scope: !214)
!222 = !DILocation(line: 159, column: 20, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !32, line: 158, column: 9)
!224 = !DILocation(line: 159, column: 13, scope: !223)
!225 = !DILocation(line: 159, column: 26, scope: !223)
!226 = !DILocation(line: 161, column: 19, scope: !227)
!227 = distinct !DILexicalBlock(scope: !223, file: !32, line: 161, column: 13)
!228 = !DILocation(line: 161, column: 17, scope: !227)
!229 = !DILocation(line: 161, column: 24, scope: !230)
!230 = distinct !DILexicalBlock(scope: !227, file: !32, line: 161, column: 13)
!231 = !DILocation(line: 161, column: 26, scope: !230)
!232 = !DILocation(line: 161, column: 13, scope: !227)
!233 = !DILocation(line: 163, column: 37, scope: !234)
!234 = distinct !DILexicalBlock(scope: !230, file: !32, line: 162, column: 13)
!235 = !DILocation(line: 163, column: 30, scope: !234)
!236 = !DILocation(line: 163, column: 17, scope: !234)
!237 = !DILocation(line: 164, column: 13, scope: !234)
!238 = !DILocation(line: 161, column: 33, scope: !230)
!239 = !DILocation(line: 161, column: 13, scope: !230)
!240 = distinct !{!240, !232, !241, !180}
!241 = !DILocation(line: 164, column: 13, scope: !227)
!242 = !DILocation(line: 165, column: 9, scope: !223)
!243 = !DILocation(line: 168, column: 13, scope: !244)
!244 = distinct !DILexicalBlock(scope: !219, file: !32, line: 167, column: 9)
!245 = !DILocation(line: 171, column: 1, scope: !208)
!246 = distinct !DISubprogram(name: "goodB2G", scope: !32, file: !32, line: 174, type: !33, scopeLine: 175, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!247 = !DILocalVariable(name: "data", scope: !246, file: !32, line: 176, type: !37)
!248 = !DILocation(line: 176, column: 9, scope: !246)
!249 = !DILocation(line: 178, column: 10, scope: !246)
!250 = !DILocalVariable(name: "recvResult", scope: !251, file: !32, line: 184, type: !37)
!251 = distinct !DILexicalBlock(scope: !246, file: !32, line: 179, column: 5)
!252 = !DILocation(line: 184, column: 13, scope: !251)
!253 = !DILocalVariable(name: "service", scope: !251, file: !32, line: 185, type: !44)
!254 = !DILocation(line: 185, column: 28, scope: !251)
!255 = !DILocalVariable(name: "listenSocket", scope: !251, file: !32, line: 186, type: !37)
!256 = !DILocation(line: 186, column: 16, scope: !251)
!257 = !DILocalVariable(name: "acceptSocket", scope: !251, file: !32, line: 187, type: !37)
!258 = !DILocation(line: 187, column: 16, scope: !251)
!259 = !DILocalVariable(name: "inputBuffer", scope: !251, file: !32, line: 188, type: !20)
!260 = !DILocation(line: 188, column: 14, scope: !251)
!261 = !DILocation(line: 189, column: 9, scope: !251)
!262 = !DILocation(line: 199, column: 28, scope: !263)
!263 = distinct !DILexicalBlock(scope: !251, file: !32, line: 190, column: 9)
!264 = !DILocation(line: 199, column: 26, scope: !263)
!265 = !DILocation(line: 200, column: 17, scope: !266)
!266 = distinct !DILexicalBlock(scope: !263, file: !32, line: 200, column: 17)
!267 = !DILocation(line: 200, column: 30, scope: !266)
!268 = !DILocation(line: 200, column: 17, scope: !263)
!269 = !DILocation(line: 202, column: 17, scope: !270)
!270 = distinct !DILexicalBlock(scope: !266, file: !32, line: 201, column: 13)
!271 = !DILocation(line: 204, column: 13, scope: !263)
!272 = !DILocation(line: 205, column: 21, scope: !263)
!273 = !DILocation(line: 205, column: 32, scope: !263)
!274 = !DILocation(line: 206, column: 21, scope: !263)
!275 = !DILocation(line: 206, column: 30, scope: !263)
!276 = !DILocation(line: 206, column: 37, scope: !263)
!277 = !DILocation(line: 207, column: 21, scope: !263)
!278 = !DILocation(line: 207, column: 30, scope: !263)
!279 = !DILocation(line: 208, column: 22, scope: !280)
!280 = distinct !DILexicalBlock(scope: !263, file: !32, line: 208, column: 17)
!281 = !DILocation(line: 208, column: 36, scope: !280)
!282 = !DILocation(line: 208, column: 17, scope: !280)
!283 = !DILocation(line: 208, column: 81, scope: !280)
!284 = !DILocation(line: 208, column: 17, scope: !263)
!285 = !DILocation(line: 210, column: 17, scope: !286)
!286 = distinct !DILexicalBlock(scope: !280, file: !32, line: 209, column: 13)
!287 = !DILocation(line: 212, column: 24, scope: !288)
!288 = distinct !DILexicalBlock(scope: !263, file: !32, line: 212, column: 17)
!289 = !DILocation(line: 212, column: 17, scope: !288)
!290 = !DILocation(line: 212, column: 54, scope: !288)
!291 = !DILocation(line: 212, column: 17, scope: !263)
!292 = !DILocation(line: 214, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !288, file: !32, line: 213, column: 13)
!294 = !DILocation(line: 216, column: 35, scope: !263)
!295 = !DILocation(line: 216, column: 28, scope: !263)
!296 = !DILocation(line: 216, column: 26, scope: !263)
!297 = !DILocation(line: 217, column: 17, scope: !298)
!298 = distinct !DILexicalBlock(scope: !263, file: !32, line: 217, column: 17)
!299 = !DILocation(line: 217, column: 30, scope: !298)
!300 = !DILocation(line: 217, column: 17, scope: !263)
!301 = !DILocation(line: 219, column: 17, scope: !302)
!302 = distinct !DILexicalBlock(scope: !298, file: !32, line: 218, column: 13)
!303 = !DILocation(line: 222, column: 31, scope: !263)
!304 = !DILocation(line: 222, column: 45, scope: !263)
!305 = !DILocation(line: 222, column: 26, scope: !263)
!306 = !DILocation(line: 222, column: 24, scope: !263)
!307 = !DILocation(line: 223, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !263, file: !32, line: 223, column: 17)
!309 = !DILocation(line: 223, column: 28, scope: !308)
!310 = !DILocation(line: 223, column: 44, scope: !308)
!311 = !DILocation(line: 223, column: 47, scope: !308)
!312 = !DILocation(line: 223, column: 58, scope: !308)
!313 = !DILocation(line: 223, column: 17, scope: !263)
!314 = !DILocation(line: 225, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !308, file: !32, line: 224, column: 13)
!316 = !DILocation(line: 228, column: 25, scope: !263)
!317 = !DILocation(line: 228, column: 13, scope: !263)
!318 = !DILocation(line: 228, column: 37, scope: !263)
!319 = !DILocation(line: 230, column: 25, scope: !263)
!320 = !DILocation(line: 230, column: 20, scope: !263)
!321 = !DILocation(line: 230, column: 18, scope: !263)
!322 = !DILocation(line: 231, column: 9, scope: !263)
!323 = !DILocation(line: 233, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !251, file: !32, line: 233, column: 13)
!325 = !DILocation(line: 233, column: 26, scope: !324)
!326 = !DILocation(line: 233, column: 13, scope: !251)
!327 = !DILocation(line: 235, column: 26, scope: !328)
!328 = distinct !DILexicalBlock(scope: !324, file: !32, line: 234, column: 9)
!329 = !DILocation(line: 235, column: 13, scope: !328)
!330 = !DILocation(line: 236, column: 9, scope: !328)
!331 = !DILocation(line: 237, column: 13, scope: !332)
!332 = distinct !DILexicalBlock(scope: !251, file: !32, line: 237, column: 13)
!333 = !DILocation(line: 237, column: 26, scope: !332)
!334 = !DILocation(line: 237, column: 13, scope: !251)
!335 = !DILocation(line: 239, column: 26, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !32, line: 238, column: 9)
!337 = !DILocation(line: 239, column: 13, scope: !336)
!338 = !DILocation(line: 240, column: 9, scope: !336)
!339 = !DILocalVariable(name: "i", scope: !340, file: !32, line: 249, type: !37)
!340 = distinct !DILexicalBlock(scope: !246, file: !32, line: 248, column: 5)
!341 = !DILocation(line: 249, column: 13, scope: !340)
!342 = !DILocalVariable(name: "buffer", scope: !340, file: !32, line: 250, type: !152)
!343 = !DILocation(line: 250, column: 13, scope: !340)
!344 = !DILocation(line: 252, column: 13, scope: !345)
!345 = distinct !DILexicalBlock(scope: !340, file: !32, line: 252, column: 13)
!346 = !DILocation(line: 252, column: 18, scope: !345)
!347 = !DILocation(line: 252, column: 23, scope: !345)
!348 = !DILocation(line: 252, column: 26, scope: !345)
!349 = !DILocation(line: 252, column: 31, scope: !345)
!350 = !DILocation(line: 252, column: 13, scope: !340)
!351 = !DILocation(line: 254, column: 20, scope: !352)
!352 = distinct !DILexicalBlock(scope: !345, file: !32, line: 253, column: 9)
!353 = !DILocation(line: 254, column: 13, scope: !352)
!354 = !DILocation(line: 254, column: 26, scope: !352)
!355 = !DILocation(line: 256, column: 19, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !32, line: 256, column: 13)
!357 = !DILocation(line: 256, column: 17, scope: !356)
!358 = !DILocation(line: 256, column: 24, scope: !359)
!359 = distinct !DILexicalBlock(scope: !356, file: !32, line: 256, column: 13)
!360 = !DILocation(line: 256, column: 26, scope: !359)
!361 = !DILocation(line: 256, column: 13, scope: !356)
!362 = !DILocation(line: 258, column: 37, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !32, line: 257, column: 13)
!364 = !DILocation(line: 258, column: 30, scope: !363)
!365 = !DILocation(line: 258, column: 17, scope: !363)
!366 = !DILocation(line: 259, column: 13, scope: !363)
!367 = !DILocation(line: 256, column: 33, scope: !359)
!368 = !DILocation(line: 256, column: 13, scope: !359)
!369 = distinct !{!369, !361, !370, !180}
!370 = !DILocation(line: 259, column: 13, scope: !356)
!371 = !DILocation(line: 260, column: 9, scope: !352)
!372 = !DILocation(line: 263, column: 13, scope: !373)
!373 = distinct !DILexicalBlock(scope: !345, file: !32, line: 262, column: 9)
!374 = !DILocation(line: 266, column: 1, scope: !246)
