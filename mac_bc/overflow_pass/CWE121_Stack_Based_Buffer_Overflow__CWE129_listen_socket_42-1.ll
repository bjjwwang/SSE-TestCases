; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42-1.c"
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
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_bad() #0 !dbg !31 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 -1, i32* %data, align 4, !dbg !39
  %0 = load i32, i32* %data, align 4, !dbg !40
  %call = call i32 @badSource(i32 noundef %0), !dbg !41
  store i32 %call, i32* %data, align 4, !dbg !42
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !46, metadata !DIExpression()), !dbg !50
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !50
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !50
  %2 = load i32, i32* %data, align 4, !dbg !51
  %cmp = icmp sge i32 %2, 0, !dbg !53
  br i1 %cmp, label %if.then, label %if.else, !dbg !54

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !55
  %idxprom = sext i32 %3 to i64, !dbg !57
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !57
  store i32 1, i32* %arrayidx, align 4, !dbg !58
  store i32 0, i32* %i, align 4, !dbg !59
  br label %for.cond, !dbg !61

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !62
  %cmp1 = icmp slt i32 %4, 10, !dbg !64
  br i1 %cmp1, label %for.body, label %for.end, !dbg !65

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !66
  %idxprom2 = sext i32 %5 to i64, !dbg !68
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !68
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !68
  call void @printIntLine(i32 noundef %6), !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !71
  %inc = add nsw i32 %7, 1, !dbg !71
  store i32 %inc, i32* %i, align 4, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !76

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !77
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !79
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @badSource(i32 noundef %data) #0 !dbg !80 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !85, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !88, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 -1, i32* %listenSocket, align 4, !dbg !110
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !111, metadata !DIExpression()), !dbg !112
  store i32 -1, i32* %acceptSocket, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  br label %do.body, !dbg !115

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !116
  store i32 %call, i32* %listenSocket, align 4, !dbg !118
  %0 = load i32, i32* %listenSocket, align 4, !dbg !119
  %cmp = icmp eq i32 %0, -1, !dbg !121
  br i1 %cmp, label %if.then, label %if.end, !dbg !122

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !123

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !125
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !125
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !126
  store i8 2, i8* %sin_family, align 1, !dbg !127
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !128
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !129
  store i32 0, i32* %s_addr, align 4, !dbg !130
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !131
  store i16 -30871, i16* %sin_port, align 2, !dbg !132
  %2 = load i32, i32* %listenSocket, align 4, !dbg !133
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !135
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !136
  %cmp2 = icmp eq i32 %call1, -1, !dbg !137
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !138

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !139

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !141
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !143
  %cmp6 = icmp eq i32 %call5, -1, !dbg !144
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !145

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !146

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !148
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !149
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !150
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !151
  %cmp10 = icmp eq i32 %6, -1, !dbg !153
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !154

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !155

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !157
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !158
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !159
  %conv = trunc i64 %call13 to i32, !dbg !159
  store i32 %conv, i32* %recvResult, align 4, !dbg !160
  %8 = load i32, i32* %recvResult, align 4, !dbg !161
  %cmp14 = icmp eq i32 %8, -1, !dbg !163
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !164

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !165
  %cmp16 = icmp eq i32 %9, 0, !dbg !166
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !167

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !168

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !170
  %idxprom = sext i32 %10 to i64, !dbg !171
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !171
  store i8 0, i8* %arrayidx, align 1, !dbg !172
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !173
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !174
  store i32 %call21, i32* %data.addr, align 4, !dbg !175
  br label %do.end, !dbg !176

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !177
  %cmp22 = icmp ne i32 %11, -1, !dbg !179
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !180

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !181
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !183
  br label %if.end26, !dbg !184

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !185
  %cmp27 = icmp ne i32 %13, -1, !dbg !187
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !188

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !189
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !191
  br label %if.end31, !dbg !192

if.end31:                                         ; preds = %if.then29, %if.end26
  %15 = load i32, i32* %data.addr, align 4, !dbg !193
  ret i32 %15, !dbg !194
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printIntLine(i32 noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_good() #0 !dbg !195 {
entry:
  call void @goodB2G(), !dbg !196
  call void @goodG2B(), !dbg !197
  ret void, !dbg !198
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !199 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !204, metadata !DIExpression()), !dbg !205
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !206, metadata !DIExpression()), !dbg !207
  %call = call i64 @time(i64* noundef null), !dbg !208
  %conv = trunc i64 %call to i32, !dbg !209
  call void @srand(i32 noundef %conv), !dbg !210
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !211
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_good(), !dbg !212
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !213
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !214
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_bad(), !dbg !215
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !216
  ret i32 0, !dbg !217
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #3

declare i32 @"\01_bind"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #3

declare i32 @"\01_listen"(i32 noundef, i32 noundef) #3

declare i32 @"\01_accept"(i32 noundef, %struct.sockaddr* noundef, i32* noundef) #3

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #3

declare i32 @atoi(i8* noundef) #3

declare i32 @"\01_close"(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !218 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %data, align 4, !dbg !221
  %0 = load i32, i32* %data, align 4, !dbg !222
  %call = call i32 @goodB2GSource(i32 noundef %0), !dbg !223
  store i32 %call, i32* %data, align 4, !dbg !224
  call void @llvm.dbg.declare(metadata i32* %i, metadata !225, metadata !DIExpression()), !dbg !227
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !228, metadata !DIExpression()), !dbg !229
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !229
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !229
  %2 = load i32, i32* %data, align 4, !dbg !230
  %cmp = icmp sge i32 %2, 0, !dbg !232
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !233

land.lhs.true:                                    ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !234
  %cmp1 = icmp slt i32 %3, 10, !dbg !235
  br i1 %cmp1, label %if.then, label %if.else, !dbg !236

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %data, align 4, !dbg !237
  %idxprom = sext i32 %4 to i64, !dbg !239
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !239
  store i32 1, i32* %arrayidx, align 4, !dbg !240
  store i32 0, i32* %i, align 4, !dbg !241
  br label %for.cond, !dbg !243

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32, i32* %i, align 4, !dbg !244
  %cmp2 = icmp slt i32 %5, 10, !dbg !246
  br i1 %cmp2, label %for.body, label %for.end, !dbg !247

for.body:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !dbg !248
  %idxprom3 = sext i32 %6 to i64, !dbg !250
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !250
  %7 = load i32, i32* %arrayidx4, align 4, !dbg !250
  call void @printIntLine(i32 noundef %7), !dbg !251
  br label %for.inc, !dbg !252

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !dbg !253
  %inc = add nsw i32 %8, 1, !dbg !253
  store i32 %inc, i32* %i, align 4, !dbg !253
  br label %for.cond, !dbg !254, !llvm.loop !255

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !257

if.else:                                          ; preds = %land.lhs.true, %entry
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !258
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !260
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodB2GSource(i32 noundef %data) #0 !dbg !261 {
entry:
  %data.addr = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !262, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !264, metadata !DIExpression()), !dbg !266
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !267, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !269, metadata !DIExpression()), !dbg !270
  store i32 -1, i32* %listenSocket, align 4, !dbg !270
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %acceptSocket, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !273, metadata !DIExpression()), !dbg !274
  br label %do.body, !dbg !275

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !276
  store i32 %call, i32* %listenSocket, align 4, !dbg !278
  %0 = load i32, i32* %listenSocket, align 4, !dbg !279
  %cmp = icmp eq i32 %0, -1, !dbg !281
  br i1 %cmp, label %if.then, label %if.end, !dbg !282

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !283

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !285
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !285
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !286
  store i8 2, i8* %sin_family, align 1, !dbg !287
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !288
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !289
  store i32 0, i32* %s_addr, align 4, !dbg !290
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !291
  store i16 -30871, i16* %sin_port, align 2, !dbg !292
  %2 = load i32, i32* %listenSocket, align 4, !dbg !293
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !295
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !296
  %cmp2 = icmp eq i32 %call1, -1, !dbg !297
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !298

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !299

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !301
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !303
  %cmp6 = icmp eq i32 %call5, -1, !dbg !304
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !305

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !306

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !308
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !309
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !310
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !311
  %cmp10 = icmp eq i32 %6, -1, !dbg !313
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !314

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !315

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !317
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !318
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !319
  %conv = trunc i64 %call13 to i32, !dbg !319
  store i32 %conv, i32* %recvResult, align 4, !dbg !320
  %8 = load i32, i32* %recvResult, align 4, !dbg !321
  %cmp14 = icmp eq i32 %8, -1, !dbg !323
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !324

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !325
  %cmp16 = icmp eq i32 %9, 0, !dbg !326
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !327

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !328

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !330
  %idxprom = sext i32 %10 to i64, !dbg !331
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !331
  store i8 0, i8* %arrayidx, align 1, !dbg !332
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !333
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !334
  store i32 %call21, i32* %data.addr, align 4, !dbg !335
  br label %do.end, !dbg !336

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !337
  %cmp22 = icmp ne i32 %11, -1, !dbg !339
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !340

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !341
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !343
  br label %if.end26, !dbg !344

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !345
  %cmp27 = icmp ne i32 %13, -1, !dbg !347
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !348

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !349
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !351
  br label %if.end31, !dbg !352

if.end31:                                         ; preds = %if.then29, %if.end26
  %15 = load i32, i32* %data.addr, align 4, !dbg !353
  ret i32 %15, !dbg !354
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !355 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !356, metadata !DIExpression()), !dbg !357
  store i32 -1, i32* %data, align 4, !dbg !358
  %0 = load i32, i32* %data, align 4, !dbg !359
  %call = call i32 @goodG2BSource(i32 noundef %0), !dbg !360
  store i32 %call, i32* %data, align 4, !dbg !361
  call void @llvm.dbg.declare(metadata i32* %i, metadata !362, metadata !DIExpression()), !dbg !364
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !365, metadata !DIExpression()), !dbg !366
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !366
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !366
  %2 = load i32, i32* %data, align 4, !dbg !367
  %cmp = icmp sge i32 %2, 0, !dbg !369
  br i1 %cmp, label %if.then, label %if.else, !dbg !370

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %data, align 4, !dbg !371
  %idxprom = sext i32 %3 to i64, !dbg !373
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !373
  store i32 1, i32* %arrayidx, align 4, !dbg !374
  store i32 0, i32* %i, align 4, !dbg !375
  br label %for.cond, !dbg !377

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !378
  %cmp1 = icmp slt i32 %4, 10, !dbg !380
  br i1 %cmp1, label %for.body, label %for.end, !dbg !381

for.body:                                         ; preds = %for.cond
  %5 = load i32, i32* %i, align 4, !dbg !382
  %idxprom2 = sext i32 %5 to i64, !dbg !384
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !384
  %6 = load i32, i32* %arrayidx3, align 4, !dbg !384
  call void @printIntLine(i32 noundef %6), !dbg !385
  br label %for.inc, !dbg !386

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !387
  %inc = add nsw i32 %7, 1, !dbg !387
  store i32 %inc, i32* %i, align 4, !dbg !387
  br label %for.cond, !dbg !388, !llvm.loop !389

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !391

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0)), !dbg !392
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void, !dbg !394
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @goodG2BSource(i32 noundef %data) #0 !dbg !395 {
entry:
  %data.addr = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !396, metadata !DIExpression()), !dbg !397
  store i32 7, i32* %data.addr, align 4, !dbg !398
  %0 = load i32, i32* %data.addr, align 4, !dbg !399
  ret i32 %0, !dbg !400
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4, !6, !9}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !5, line: 30, baseType: !3)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_u_int32_t.h", directory: "")
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
!31 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_bad", scope: !32, file: !32, line: 118, type: !33, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !{}
!36 = !DILocalVariable(name: "data", scope: !31, file: !32, line: 120, type: !37)
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DILocation(line: 120, column: 9, scope: !31)
!39 = !DILocation(line: 122, column: 10, scope: !31)
!40 = !DILocation(line: 123, column: 22, scope: !31)
!41 = !DILocation(line: 123, column: 12, scope: !31)
!42 = !DILocation(line: 123, column: 10, scope: !31)
!43 = !DILocalVariable(name: "i", scope: !44, file: !32, line: 125, type: !37)
!44 = distinct !DILexicalBlock(scope: !31, file: !32, line: 124, column: 5)
!45 = !DILocation(line: 125, column: 13, scope: !44)
!46 = !DILocalVariable(name: "buffer", scope: !44, file: !32, line: 126, type: !47)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 10)
!50 = !DILocation(line: 126, column: 13, scope: !44)
!51 = !DILocation(line: 129, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !32, line: 129, column: 13)
!53 = !DILocation(line: 129, column: 18, scope: !52)
!54 = !DILocation(line: 129, column: 13, scope: !44)
!55 = !DILocation(line: 131, column: 20, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !32, line: 130, column: 9)
!57 = !DILocation(line: 131, column: 13, scope: !56)
!58 = !DILocation(line: 131, column: 26, scope: !56)
!59 = !DILocation(line: 133, column: 19, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !32, line: 133, column: 13)
!61 = !DILocation(line: 133, column: 17, scope: !60)
!62 = !DILocation(line: 133, column: 24, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !32, line: 133, column: 13)
!64 = !DILocation(line: 133, column: 26, scope: !63)
!65 = !DILocation(line: 133, column: 13, scope: !60)
!66 = !DILocation(line: 135, column: 37, scope: !67)
!67 = distinct !DILexicalBlock(scope: !63, file: !32, line: 134, column: 13)
!68 = !DILocation(line: 135, column: 30, scope: !67)
!69 = !DILocation(line: 135, column: 17, scope: !67)
!70 = !DILocation(line: 136, column: 13, scope: !67)
!71 = !DILocation(line: 133, column: 33, scope: !63)
!72 = !DILocation(line: 133, column: 13, scope: !63)
!73 = distinct !{!73, !65, !74, !75}
!74 = !DILocation(line: 136, column: 13, scope: !60)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 137, column: 9, scope: !56)
!77 = !DILocation(line: 140, column: 13, scope: !78)
!78 = distinct !DILexicalBlock(scope: !52, file: !32, line: 139, column: 9)
!79 = !DILocation(line: 143, column: 1, scope: !31)
!80 = distinct !DISubprogram(name: "badSource", scope: !32, file: !32, line: 44, type: !81, scopeLine: 45, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!81 = !DISubroutineType(types: !82)
!82 = !{!37, !37}
!83 = !DILocalVariable(name: "data", arg: 1, scope: !80, file: !32, line: 44, type: !37)
!84 = !DILocation(line: 44, column: 26, scope: !80)
!85 = !DILocalVariable(name: "recvResult", scope: !86, file: !32, line: 51, type: !37)
!86 = distinct !DILexicalBlock(scope: !80, file: !32, line: 46, column: 5)
!87 = !DILocation(line: 51, column: 13, scope: !86)
!88 = !DILocalVariable(name: "service", scope: !86, file: !32, line: 52, type: !89)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !90, line: 375, size: 128, elements: !91)
!90 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!91 = !{!92, !93, !94, !97, !104}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !89, file: !90, line: 376, baseType: !14, size: 8)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !89, file: !90, line: 377, baseType: !17, size: 8, offset: 8)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !89, file: !90, line: 378, baseType: !95, size: 16, offset: 16)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !96, line: 31, baseType: !6)
!96 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!97 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !89, file: !90, line: 379, baseType: !98, size: 32, offset: 32)
!98 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !90, line: 301, size: 32, elements: !99)
!99 = !{!100}
!100 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !98, file: !90, line: 302, baseType: !101, size: 32)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !102, line: 31, baseType: !103)
!102 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !7, line: 47, baseType: !3)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !89, file: !90, line: 380, baseType: !105, size: 64, offset: 64)
!105 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 64, elements: !106)
!106 = !{!107}
!107 = !DISubrange(count: 8)
!108 = !DILocation(line: 52, column: 28, scope: !86)
!109 = !DILocalVariable(name: "listenSocket", scope: !86, file: !32, line: 53, type: !37)
!110 = !DILocation(line: 53, column: 16, scope: !86)
!111 = !DILocalVariable(name: "acceptSocket", scope: !86, file: !32, line: 54, type: !37)
!112 = !DILocation(line: 54, column: 16, scope: !86)
!113 = !DILocalVariable(name: "inputBuffer", scope: !86, file: !32, line: 55, type: !20)
!114 = !DILocation(line: 55, column: 14, scope: !86)
!115 = !DILocation(line: 56, column: 9, scope: !86)
!116 = !DILocation(line: 66, column: 28, scope: !117)
!117 = distinct !DILexicalBlock(scope: !86, file: !32, line: 57, column: 9)
!118 = !DILocation(line: 66, column: 26, scope: !117)
!119 = !DILocation(line: 67, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !117, file: !32, line: 67, column: 17)
!121 = !DILocation(line: 67, column: 30, scope: !120)
!122 = !DILocation(line: 67, column: 17, scope: !117)
!123 = !DILocation(line: 69, column: 17, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !32, line: 68, column: 13)
!125 = !DILocation(line: 71, column: 13, scope: !117)
!126 = !DILocation(line: 72, column: 21, scope: !117)
!127 = !DILocation(line: 72, column: 32, scope: !117)
!128 = !DILocation(line: 73, column: 21, scope: !117)
!129 = !DILocation(line: 73, column: 30, scope: !117)
!130 = !DILocation(line: 73, column: 37, scope: !117)
!131 = !DILocation(line: 74, column: 21, scope: !117)
!132 = !DILocation(line: 74, column: 30, scope: !117)
!133 = !DILocation(line: 75, column: 22, scope: !134)
!134 = distinct !DILexicalBlock(scope: !117, file: !32, line: 75, column: 17)
!135 = !DILocation(line: 75, column: 36, scope: !134)
!136 = !DILocation(line: 75, column: 17, scope: !134)
!137 = !DILocation(line: 75, column: 81, scope: !134)
!138 = !DILocation(line: 75, column: 17, scope: !117)
!139 = !DILocation(line: 77, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !32, line: 76, column: 13)
!141 = !DILocation(line: 79, column: 24, scope: !142)
!142 = distinct !DILexicalBlock(scope: !117, file: !32, line: 79, column: 17)
!143 = !DILocation(line: 79, column: 17, scope: !142)
!144 = !DILocation(line: 79, column: 54, scope: !142)
!145 = !DILocation(line: 79, column: 17, scope: !117)
!146 = !DILocation(line: 81, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !32, line: 80, column: 13)
!148 = !DILocation(line: 83, column: 35, scope: !117)
!149 = !DILocation(line: 83, column: 28, scope: !117)
!150 = !DILocation(line: 83, column: 26, scope: !117)
!151 = !DILocation(line: 84, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !117, file: !32, line: 84, column: 17)
!153 = !DILocation(line: 84, column: 30, scope: !152)
!154 = !DILocation(line: 84, column: 17, scope: !117)
!155 = !DILocation(line: 86, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !32, line: 85, column: 13)
!157 = !DILocation(line: 89, column: 31, scope: !117)
!158 = !DILocation(line: 89, column: 45, scope: !117)
!159 = !DILocation(line: 89, column: 26, scope: !117)
!160 = !DILocation(line: 89, column: 24, scope: !117)
!161 = !DILocation(line: 90, column: 17, scope: !162)
!162 = distinct !DILexicalBlock(scope: !117, file: !32, line: 90, column: 17)
!163 = !DILocation(line: 90, column: 28, scope: !162)
!164 = !DILocation(line: 90, column: 44, scope: !162)
!165 = !DILocation(line: 90, column: 47, scope: !162)
!166 = !DILocation(line: 90, column: 58, scope: !162)
!167 = !DILocation(line: 90, column: 17, scope: !117)
!168 = !DILocation(line: 92, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !162, file: !32, line: 91, column: 13)
!170 = !DILocation(line: 95, column: 25, scope: !117)
!171 = !DILocation(line: 95, column: 13, scope: !117)
!172 = !DILocation(line: 95, column: 37, scope: !117)
!173 = !DILocation(line: 97, column: 25, scope: !117)
!174 = !DILocation(line: 97, column: 20, scope: !117)
!175 = !DILocation(line: 97, column: 18, scope: !117)
!176 = !DILocation(line: 98, column: 9, scope: !117)
!177 = !DILocation(line: 100, column: 13, scope: !178)
!178 = distinct !DILexicalBlock(scope: !86, file: !32, line: 100, column: 13)
!179 = !DILocation(line: 100, column: 26, scope: !178)
!180 = !DILocation(line: 100, column: 13, scope: !86)
!181 = !DILocation(line: 102, column: 26, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !32, line: 101, column: 9)
!183 = !DILocation(line: 102, column: 13, scope: !182)
!184 = !DILocation(line: 103, column: 9, scope: !182)
!185 = !DILocation(line: 104, column: 13, scope: !186)
!186 = distinct !DILexicalBlock(scope: !86, file: !32, line: 104, column: 13)
!187 = !DILocation(line: 104, column: 26, scope: !186)
!188 = !DILocation(line: 104, column: 13, scope: !86)
!189 = !DILocation(line: 106, column: 26, scope: !190)
!190 = distinct !DILexicalBlock(scope: !186, file: !32, line: 105, column: 9)
!191 = !DILocation(line: 106, column: 13, scope: !190)
!192 = !DILocation(line: 107, column: 9, scope: !190)
!193 = !DILocation(line: 115, column: 12, scope: !80)
!194 = !DILocation(line: 115, column: 5, scope: !80)
!195 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE129_listen_socket_42_good", scope: !32, file: !32, line: 286, type: !33, scopeLine: 287, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!196 = !DILocation(line: 288, column: 5, scope: !195)
!197 = !DILocation(line: 289, column: 5, scope: !195)
!198 = !DILocation(line: 290, column: 1, scope: !195)
!199 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 301, type: !200, scopeLine: 302, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!200 = !DISubroutineType(types: !201)
!201 = !{!37, !37, !202}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!204 = !DILocalVariable(name: "argc", arg: 1, scope: !199, file: !32, line: 301, type: !37)
!205 = !DILocation(line: 301, column: 14, scope: !199)
!206 = !DILocalVariable(name: "argv", arg: 2, scope: !199, file: !32, line: 301, type: !202)
!207 = !DILocation(line: 301, column: 27, scope: !199)
!208 = !DILocation(line: 304, column: 22, scope: !199)
!209 = !DILocation(line: 304, column: 12, scope: !199)
!210 = !DILocation(line: 304, column: 5, scope: !199)
!211 = !DILocation(line: 306, column: 5, scope: !199)
!212 = !DILocation(line: 307, column: 5, scope: !199)
!213 = !DILocation(line: 308, column: 5, scope: !199)
!214 = !DILocation(line: 311, column: 5, scope: !199)
!215 = !DILocation(line: 312, column: 5, scope: !199)
!216 = !DILocation(line: 313, column: 5, scope: !199)
!217 = !DILocation(line: 315, column: 5, scope: !199)
!218 = distinct !DISubprogram(name: "goodB2G", scope: !32, file: !32, line: 260, type: !33, scopeLine: 261, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!219 = !DILocalVariable(name: "data", scope: !218, file: !32, line: 262, type: !37)
!220 = !DILocation(line: 262, column: 9, scope: !218)
!221 = !DILocation(line: 264, column: 10, scope: !218)
!222 = !DILocation(line: 265, column: 26, scope: !218)
!223 = !DILocation(line: 265, column: 12, scope: !218)
!224 = !DILocation(line: 265, column: 10, scope: !218)
!225 = !DILocalVariable(name: "i", scope: !226, file: !32, line: 267, type: !37)
!226 = distinct !DILexicalBlock(scope: !218, file: !32, line: 266, column: 5)
!227 = !DILocation(line: 267, column: 13, scope: !226)
!228 = !DILocalVariable(name: "buffer", scope: !226, file: !32, line: 268, type: !47)
!229 = !DILocation(line: 268, column: 13, scope: !226)
!230 = !DILocation(line: 270, column: 13, scope: !231)
!231 = distinct !DILexicalBlock(scope: !226, file: !32, line: 270, column: 13)
!232 = !DILocation(line: 270, column: 18, scope: !231)
!233 = !DILocation(line: 270, column: 23, scope: !231)
!234 = !DILocation(line: 270, column: 26, scope: !231)
!235 = !DILocation(line: 270, column: 31, scope: !231)
!236 = !DILocation(line: 270, column: 13, scope: !226)
!237 = !DILocation(line: 272, column: 20, scope: !238)
!238 = distinct !DILexicalBlock(scope: !231, file: !32, line: 271, column: 9)
!239 = !DILocation(line: 272, column: 13, scope: !238)
!240 = !DILocation(line: 272, column: 26, scope: !238)
!241 = !DILocation(line: 274, column: 19, scope: !242)
!242 = distinct !DILexicalBlock(scope: !238, file: !32, line: 274, column: 13)
!243 = !DILocation(line: 274, column: 17, scope: !242)
!244 = !DILocation(line: 274, column: 24, scope: !245)
!245 = distinct !DILexicalBlock(scope: !242, file: !32, line: 274, column: 13)
!246 = !DILocation(line: 274, column: 26, scope: !245)
!247 = !DILocation(line: 274, column: 13, scope: !242)
!248 = !DILocation(line: 276, column: 37, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !32, line: 275, column: 13)
!250 = !DILocation(line: 276, column: 30, scope: !249)
!251 = !DILocation(line: 276, column: 17, scope: !249)
!252 = !DILocation(line: 277, column: 13, scope: !249)
!253 = !DILocation(line: 274, column: 33, scope: !245)
!254 = !DILocation(line: 274, column: 13, scope: !245)
!255 = distinct !{!255, !247, !256, !75}
!256 = !DILocation(line: 277, column: 13, scope: !242)
!257 = !DILocation(line: 278, column: 9, scope: !238)
!258 = !DILocation(line: 281, column: 13, scope: !259)
!259 = distinct !DILexicalBlock(scope: !231, file: !32, line: 280, column: 9)
!260 = !DILocation(line: 284, column: 1, scope: !218)
!261 = distinct !DISubprogram(name: "goodB2GSource", scope: !32, file: !32, line: 186, type: !81, scopeLine: 187, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!262 = !DILocalVariable(name: "data", arg: 1, scope: !261, file: !32, line: 186, type: !37)
!263 = !DILocation(line: 186, column: 30, scope: !261)
!264 = !DILocalVariable(name: "recvResult", scope: !265, file: !32, line: 193, type: !37)
!265 = distinct !DILexicalBlock(scope: !261, file: !32, line: 188, column: 5)
!266 = !DILocation(line: 193, column: 13, scope: !265)
!267 = !DILocalVariable(name: "service", scope: !265, file: !32, line: 194, type: !89)
!268 = !DILocation(line: 194, column: 28, scope: !265)
!269 = !DILocalVariable(name: "listenSocket", scope: !265, file: !32, line: 195, type: !37)
!270 = !DILocation(line: 195, column: 16, scope: !265)
!271 = !DILocalVariable(name: "acceptSocket", scope: !265, file: !32, line: 196, type: !37)
!272 = !DILocation(line: 196, column: 16, scope: !265)
!273 = !DILocalVariable(name: "inputBuffer", scope: !265, file: !32, line: 197, type: !20)
!274 = !DILocation(line: 197, column: 14, scope: !265)
!275 = !DILocation(line: 198, column: 9, scope: !265)
!276 = !DILocation(line: 208, column: 28, scope: !277)
!277 = distinct !DILexicalBlock(scope: !265, file: !32, line: 199, column: 9)
!278 = !DILocation(line: 208, column: 26, scope: !277)
!279 = !DILocation(line: 209, column: 17, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !32, line: 209, column: 17)
!281 = !DILocation(line: 209, column: 30, scope: !280)
!282 = !DILocation(line: 209, column: 17, scope: !277)
!283 = !DILocation(line: 211, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !32, line: 210, column: 13)
!285 = !DILocation(line: 213, column: 13, scope: !277)
!286 = !DILocation(line: 214, column: 21, scope: !277)
!287 = !DILocation(line: 214, column: 32, scope: !277)
!288 = !DILocation(line: 215, column: 21, scope: !277)
!289 = !DILocation(line: 215, column: 30, scope: !277)
!290 = !DILocation(line: 215, column: 37, scope: !277)
!291 = !DILocation(line: 216, column: 21, scope: !277)
!292 = !DILocation(line: 216, column: 30, scope: !277)
!293 = !DILocation(line: 217, column: 22, scope: !294)
!294 = distinct !DILexicalBlock(scope: !277, file: !32, line: 217, column: 17)
!295 = !DILocation(line: 217, column: 36, scope: !294)
!296 = !DILocation(line: 217, column: 17, scope: !294)
!297 = !DILocation(line: 217, column: 81, scope: !294)
!298 = !DILocation(line: 217, column: 17, scope: !277)
!299 = !DILocation(line: 219, column: 17, scope: !300)
!300 = distinct !DILexicalBlock(scope: !294, file: !32, line: 218, column: 13)
!301 = !DILocation(line: 221, column: 24, scope: !302)
!302 = distinct !DILexicalBlock(scope: !277, file: !32, line: 221, column: 17)
!303 = !DILocation(line: 221, column: 17, scope: !302)
!304 = !DILocation(line: 221, column: 54, scope: !302)
!305 = !DILocation(line: 221, column: 17, scope: !277)
!306 = !DILocation(line: 223, column: 17, scope: !307)
!307 = distinct !DILexicalBlock(scope: !302, file: !32, line: 222, column: 13)
!308 = !DILocation(line: 225, column: 35, scope: !277)
!309 = !DILocation(line: 225, column: 28, scope: !277)
!310 = !DILocation(line: 225, column: 26, scope: !277)
!311 = !DILocation(line: 226, column: 17, scope: !312)
!312 = distinct !DILexicalBlock(scope: !277, file: !32, line: 226, column: 17)
!313 = !DILocation(line: 226, column: 30, scope: !312)
!314 = !DILocation(line: 226, column: 17, scope: !277)
!315 = !DILocation(line: 228, column: 17, scope: !316)
!316 = distinct !DILexicalBlock(scope: !312, file: !32, line: 227, column: 13)
!317 = !DILocation(line: 231, column: 31, scope: !277)
!318 = !DILocation(line: 231, column: 45, scope: !277)
!319 = !DILocation(line: 231, column: 26, scope: !277)
!320 = !DILocation(line: 231, column: 24, scope: !277)
!321 = !DILocation(line: 232, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !277, file: !32, line: 232, column: 17)
!323 = !DILocation(line: 232, column: 28, scope: !322)
!324 = !DILocation(line: 232, column: 44, scope: !322)
!325 = !DILocation(line: 232, column: 47, scope: !322)
!326 = !DILocation(line: 232, column: 58, scope: !322)
!327 = !DILocation(line: 232, column: 17, scope: !277)
!328 = !DILocation(line: 234, column: 17, scope: !329)
!329 = distinct !DILexicalBlock(scope: !322, file: !32, line: 233, column: 13)
!330 = !DILocation(line: 237, column: 25, scope: !277)
!331 = !DILocation(line: 237, column: 13, scope: !277)
!332 = !DILocation(line: 237, column: 37, scope: !277)
!333 = !DILocation(line: 239, column: 25, scope: !277)
!334 = !DILocation(line: 239, column: 20, scope: !277)
!335 = !DILocation(line: 239, column: 18, scope: !277)
!336 = !DILocation(line: 240, column: 9, scope: !277)
!337 = !DILocation(line: 242, column: 13, scope: !338)
!338 = distinct !DILexicalBlock(scope: !265, file: !32, line: 242, column: 13)
!339 = !DILocation(line: 242, column: 26, scope: !338)
!340 = !DILocation(line: 242, column: 13, scope: !265)
!341 = !DILocation(line: 244, column: 26, scope: !342)
!342 = distinct !DILexicalBlock(scope: !338, file: !32, line: 243, column: 9)
!343 = !DILocation(line: 244, column: 13, scope: !342)
!344 = !DILocation(line: 245, column: 9, scope: !342)
!345 = !DILocation(line: 246, column: 13, scope: !346)
!346 = distinct !DILexicalBlock(scope: !265, file: !32, line: 246, column: 13)
!347 = !DILocation(line: 246, column: 26, scope: !346)
!348 = !DILocation(line: 246, column: 13, scope: !265)
!349 = !DILocation(line: 248, column: 26, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !32, line: 247, column: 9)
!351 = !DILocation(line: 248, column: 13, scope: !350)
!352 = !DILocation(line: 249, column: 9, scope: !350)
!353 = !DILocation(line: 257, column: 12, scope: !261)
!354 = !DILocation(line: 257, column: 5, scope: !261)
!355 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 158, type: !33, scopeLine: 159, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!356 = !DILocalVariable(name: "data", scope: !355, file: !32, line: 160, type: !37)
!357 = !DILocation(line: 160, column: 9, scope: !355)
!358 = !DILocation(line: 162, column: 10, scope: !355)
!359 = !DILocation(line: 163, column: 26, scope: !355)
!360 = !DILocation(line: 163, column: 12, scope: !355)
!361 = !DILocation(line: 163, column: 10, scope: !355)
!362 = !DILocalVariable(name: "i", scope: !363, file: !32, line: 165, type: !37)
!363 = distinct !DILexicalBlock(scope: !355, file: !32, line: 164, column: 5)
!364 = !DILocation(line: 165, column: 13, scope: !363)
!365 = !DILocalVariable(name: "buffer", scope: !363, file: !32, line: 166, type: !47)
!366 = !DILocation(line: 166, column: 13, scope: !363)
!367 = !DILocation(line: 169, column: 13, scope: !368)
!368 = distinct !DILexicalBlock(scope: !363, file: !32, line: 169, column: 13)
!369 = !DILocation(line: 169, column: 18, scope: !368)
!370 = !DILocation(line: 169, column: 13, scope: !363)
!371 = !DILocation(line: 171, column: 20, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !32, line: 170, column: 9)
!373 = !DILocation(line: 171, column: 13, scope: !372)
!374 = !DILocation(line: 171, column: 26, scope: !372)
!375 = !DILocation(line: 173, column: 19, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !32, line: 173, column: 13)
!377 = !DILocation(line: 173, column: 17, scope: !376)
!378 = !DILocation(line: 173, column: 24, scope: !379)
!379 = distinct !DILexicalBlock(scope: !376, file: !32, line: 173, column: 13)
!380 = !DILocation(line: 173, column: 26, scope: !379)
!381 = !DILocation(line: 173, column: 13, scope: !376)
!382 = !DILocation(line: 175, column: 37, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !32, line: 174, column: 13)
!384 = !DILocation(line: 175, column: 30, scope: !383)
!385 = !DILocation(line: 175, column: 17, scope: !383)
!386 = !DILocation(line: 176, column: 13, scope: !383)
!387 = !DILocation(line: 173, column: 33, scope: !379)
!388 = !DILocation(line: 173, column: 13, scope: !379)
!389 = distinct !{!389, !381, !390, !75}
!390 = !DILocation(line: 176, column: 13, scope: !376)
!391 = !DILocation(line: 177, column: 9, scope: !372)
!392 = !DILocation(line: 180, column: 13, scope: !393)
!393 = distinct !DILexicalBlock(scope: !368, file: !32, line: 179, column: 9)
!394 = !DILocation(line: 183, column: 1, scope: !355)
!395 = distinct !DISubprogram(name: "goodG2BSource", scope: !32, file: !32, line: 150, type: !81, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!396 = !DILocalVariable(name: "data", arg: 1, scope: !395, file: !32, line: 150, type: !37)
!397 = !DILocation(line: 150, column: 30, scope: !395)
!398 = !DILocation(line: 154, column: 10, scope: !395)
!399 = !DILocation(line: 155, column: 12, scope: !395)
!400 = !DILocation(line: 155, column: 5, scope: !395)
