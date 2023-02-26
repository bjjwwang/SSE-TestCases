; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@badStatic = internal global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !25
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !29
@goodG2BStatic = internal global i32 0, align 4, !dbg !31

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_21_bad() #0 !dbg !40 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 -1, i32* %data, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !47, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !50, metadata !DIExpression()), !dbg !70
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !71, metadata !DIExpression()), !dbg !72
  store i32 -1, i32* %connectSocket, align 4, !dbg !72
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  br label %do.body, !dbg !75

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !76
  store i32 %call, i32* %connectSocket, align 4, !dbg !78
  %0 = load i32, i32* %connectSocket, align 4, !dbg !79
  %cmp = icmp eq i32 %0, -1, !dbg !81
  br i1 %cmp, label %if.then, label %if.end, !dbg !82

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !83

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !85
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !85
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !86
  store i8 2, i8* %sin_family, align 1, !dbg !87
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !88
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !89
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !90
  store i32 %call1, i32* %s_addr, align 4, !dbg !91
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !92
  store i16 -30871, i16* %sin_port, align 2, !dbg !93
  %2 = load i32, i32* %connectSocket, align 4, !dbg !94
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !96
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !97
  %cmp3 = icmp eq i32 %call2, -1, !dbg !98
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !99

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !100

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !102
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !103
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !104
  %conv = trunc i64 %call6 to i32, !dbg !104
  store i32 %conv, i32* %recvResult, align 4, !dbg !105
  %5 = load i32, i32* %recvResult, align 4, !dbg !106
  %cmp7 = icmp eq i32 %5, -1, !dbg !108
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !109

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !110
  %cmp9 = icmp eq i32 %6, 0, !dbg !111
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !112

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !113

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !115
  %idxprom = sext i32 %7 to i64, !dbg !116
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !118
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !119
  store i32 %call14, i32* %data, align 4, !dbg !120
  br label %do.end, !dbg !121

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !122
  %cmp15 = icmp ne i32 %8, -1, !dbg !124
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !125

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !126
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !128
  br label %if.end19, !dbg !129

if.end19:                                         ; preds = %if.then17, %do.end
  store i32 1, i32* @badStatic, align 4, !dbg !130
  %10 = load i32, i32* %data, align 4, !dbg !131
  call void @badSink(i32 noundef %10), !dbg !132
  ret void, !dbg !133
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @inet_addr(i8* noundef) #2

declare i32 @"\01_connect"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #2

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #2

declare i32 @atoi(i8* noundef) #2

declare i32 @"\01_close"(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !134 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = load i32, i32* @badStatic, align 4, !dbg !139
  %tobool = icmp ne i32 %0, 0, !dbg !139
  br i1 %tobool, label %if.then, label %if.end2, !dbg !141

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !142, metadata !DIExpression()), !dbg !148
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !148
  %2 = load i32, i32* %data.addr, align 4, !dbg !149
  %cmp = icmp sge i32 %2, 0, !dbg !151
  br i1 %cmp, label %if.then1, label %if.else, !dbg !152

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !153
  %idxprom = sext i32 %3 to i64, !dbg !155
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !155
  %4 = load i32, i32* %arrayidx, align 4, !dbg !155
  call void @printIntLine(i32 noundef %4), !dbg !156
  br label %if.end, !dbg !157

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !158
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !160

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_21_good() #0 !dbg !162 {
entry:
  call void @goodB2G1(), !dbg !163
  call void @goodB2G2(), !dbg !164
  call void @goodG2B(), !dbg !165
  ret void, !dbg !166
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !167 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !172, metadata !DIExpression()), !dbg !173
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !174, metadata !DIExpression()), !dbg !175
  %call = call i64 @time(i64* noundef null), !dbg !176
  %conv = trunc i64 %call to i32, !dbg !177
  call void @srand(i32 noundef %conv), !dbg !178
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !179
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_21_good(), !dbg !180
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !181
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !182
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_21_bad(), !dbg !183
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !184
  ret i32 0, !dbg !185
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !186 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !187, metadata !DIExpression()), !dbg !188
  store i32 -1, i32* %data, align 4, !dbg !189
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !190, metadata !DIExpression()), !dbg !192
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !193, metadata !DIExpression()), !dbg !194
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !195, metadata !DIExpression()), !dbg !196
  store i32 -1, i32* %connectSocket, align 4, !dbg !196
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !197, metadata !DIExpression()), !dbg !198
  br label %do.body, !dbg !199

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !200
  store i32 %call, i32* %connectSocket, align 4, !dbg !202
  %0 = load i32, i32* %connectSocket, align 4, !dbg !203
  %cmp = icmp eq i32 %0, -1, !dbg !205
  br i1 %cmp, label %if.then, label %if.end, !dbg !206

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !207

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !209
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !209
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !210
  store i8 2, i8* %sin_family, align 1, !dbg !211
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !212
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !213
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !214
  store i32 %call1, i32* %s_addr, align 4, !dbg !215
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !216
  store i16 -30871, i16* %sin_port, align 2, !dbg !217
  %2 = load i32, i32* %connectSocket, align 4, !dbg !218
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !220
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !221
  %cmp3 = icmp eq i32 %call2, -1, !dbg !222
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !223

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !224

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !226
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !227
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !228
  %conv = trunc i64 %call6 to i32, !dbg !228
  store i32 %conv, i32* %recvResult, align 4, !dbg !229
  %5 = load i32, i32* %recvResult, align 4, !dbg !230
  %cmp7 = icmp eq i32 %5, -1, !dbg !232
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !233

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !234
  %cmp9 = icmp eq i32 %6, 0, !dbg !235
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !236

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !237

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !239
  %idxprom = sext i32 %7 to i64, !dbg !240
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !240
  store i8 0, i8* %arrayidx, align 1, !dbg !241
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !242
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !243
  store i32 %call14, i32* %data, align 4, !dbg !244
  br label %do.end, !dbg !245

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !246
  %cmp15 = icmp ne i32 %8, -1, !dbg !248
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !249

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !250
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !252
  br label %if.end19, !dbg !253

if.end19:                                         ; preds = %if.then17, %do.end
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !254
  %10 = load i32, i32* %data, align 4, !dbg !255
  call void @goodB2G1Sink(i32 noundef %10), !dbg !256
  ret void, !dbg !257
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1Sink(i32 noundef %data) #0 !dbg !258 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !259, metadata !DIExpression()), !dbg !260
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !261
  %tobool = icmp ne i32 %0, 0, !dbg !261
  br i1 %tobool, label %if.then, label %if.else, !dbg !263

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !264
  br label %if.end4, !dbg !266

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !267, metadata !DIExpression()), !dbg !270
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !270
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !270
  %2 = load i32, i32* %data.addr, align 4, !dbg !271
  %cmp = icmp sge i32 %2, 0, !dbg !273
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !274

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !275
  %cmp1 = icmp slt i32 %3, 10, !dbg !276
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !277

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !278
  %idxprom = sext i32 %4 to i64, !dbg !280
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !280
  %5 = load i32, i32* %arrayidx, align 4, !dbg !280
  call void @printIntLine(i32 noundef %5), !dbg !281
  br label %if.end, !dbg !282

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !283
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !285
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !286 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !287, metadata !DIExpression()), !dbg !288
  store i32 -1, i32* %data, align 4, !dbg !289
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !290, metadata !DIExpression()), !dbg !292
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !293, metadata !DIExpression()), !dbg !294
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !295, metadata !DIExpression()), !dbg !296
  store i32 -1, i32* %connectSocket, align 4, !dbg !296
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !297, metadata !DIExpression()), !dbg !298
  br label %do.body, !dbg !299

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !300
  store i32 %call, i32* %connectSocket, align 4, !dbg !302
  %0 = load i32, i32* %connectSocket, align 4, !dbg !303
  %cmp = icmp eq i32 %0, -1, !dbg !305
  br i1 %cmp, label %if.then, label %if.end, !dbg !306

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !307

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !309
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !309
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !310
  store i8 2, i8* %sin_family, align 1, !dbg !311
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !312
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !313
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !314
  store i32 %call1, i32* %s_addr, align 4, !dbg !315
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !316
  store i16 -30871, i16* %sin_port, align 2, !dbg !317
  %2 = load i32, i32* %connectSocket, align 4, !dbg !318
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !320
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !321
  %cmp3 = icmp eq i32 %call2, -1, !dbg !322
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !323

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !324

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !326
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !327
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !328
  %conv = trunc i64 %call6 to i32, !dbg !328
  store i32 %conv, i32* %recvResult, align 4, !dbg !329
  %5 = load i32, i32* %recvResult, align 4, !dbg !330
  %cmp7 = icmp eq i32 %5, -1, !dbg !332
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !333

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !334
  %cmp9 = icmp eq i32 %6, 0, !dbg !335
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !336

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !337

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !339
  %idxprom = sext i32 %7 to i64, !dbg !340
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !340
  store i8 0, i8* %arrayidx, align 1, !dbg !341
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !342
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !343
  store i32 %call14, i32* %data, align 4, !dbg !344
  br label %do.end, !dbg !345

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !346
  %cmp15 = icmp ne i32 %8, -1, !dbg !348
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !349

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !350
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !352
  br label %if.end19, !dbg !353

if.end19:                                         ; preds = %if.then17, %do.end
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !354
  %10 = load i32, i32* %data, align 4, !dbg !355
  call void @goodB2G2Sink(i32 noundef %10), !dbg !356
  ret void, !dbg !357
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2Sink(i32 noundef %data) #0 !dbg !358 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !359, metadata !DIExpression()), !dbg !360
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !361
  %tobool = icmp ne i32 %0, 0, !dbg !361
  br i1 %tobool, label %if.then, label %if.end3, !dbg !363

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !364, metadata !DIExpression()), !dbg !367
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !367
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !367
  %2 = load i32, i32* %data.addr, align 4, !dbg !368
  %cmp = icmp sge i32 %2, 0, !dbg !370
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !371

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !372
  %cmp1 = icmp slt i32 %3, 10, !dbg !373
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !374

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !375
  %idxprom = sext i32 %4 to i64, !dbg !377
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !377
  %5 = load i32, i32* %arrayidx, align 4, !dbg !377
  call void @printIntLine(i32 noundef %5), !dbg !378
  br label %if.end, !dbg !379

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !380
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !382

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !383
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !384 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !385, metadata !DIExpression()), !dbg !386
  store i32 -1, i32* %data, align 4, !dbg !387
  store i32 7, i32* %data, align 4, !dbg !388
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !389
  %0 = load i32, i32* %data, align 4, !dbg !390
  call void @goodG2BSink(i32 noundef %0), !dbg !391
  ret void, !dbg !392
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !393 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !394, metadata !DIExpression()), !dbg !395
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !396
  %tobool = icmp ne i32 %0, 0, !dbg !396
  br i1 %tobool, label %if.then, label %if.end2, !dbg !398

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !399, metadata !DIExpression()), !dbg !402
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !402
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !402
  %2 = load i32, i32* %data.addr, align 4, !dbg !403
  %cmp = icmp sge i32 %2, 0, !dbg !405
  br i1 %cmp, label %if.then1, label %if.else, !dbg !406

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !407
  %idxprom = sext i32 %3 to i64, !dbg !409
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !409
  %4 = load i32, i32* %arrayidx, align 4, !dbg !409
  call void @printIntLine(i32 noundef %4), !dbg !410
  br label %if.end, !dbg !411

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0)), !dbg !412
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !414

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !415
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!33, !34, !35, !36, !37, !38}
!llvm.ident = !{!39}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !27, line: 45, type: !28, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !24, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !8, !23}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !6, line: 45, baseType: !7)
!6 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!7 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !10, line: 412, size: 128, elements: !11)
!10 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!11 = !{!12, !15, !18}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !9, file: !10, line: 413, baseType: !13, size: 8)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !6, line: 43, baseType: !14)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !9, file: !10, line: 414, baseType: !16, size: 8, offset: 8)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !17, line: 31, baseType: !13)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!18 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !9, file: !10, line: 415, baseType: !19, size: 112, offset: 16)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 112, elements: !21)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 14)
!23 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!24 = !{!0, !25, !29, !31}
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !27, line: 137, type: !28, isLocal: true, isDefinition: true)
!27 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!28 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !27, line: 138, type: !28, isLocal: true, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !27, line: 139, type: !28, isLocal: true, isDefinition: true)
!33 = !{i32 7, !"Dwarf Version", i32 4}
!34 = !{i32 2, !"Debug Info Version", i32 3}
!35 = !{i32 1, !"wchar_size", i32 4}
!36 = !{i32 7, !"PIC Level", i32 2}
!37 = !{i32 7, !"uwtable", i32 1}
!38 = !{i32 7, !"frame-pointer", i32 2}
!39 = !{!"Homebrew clang version 14.0.6"}
!40 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_21_bad", scope: !27, file: !27, line: 67, type: !41, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !43)
!41 = !DISubroutineType(types: !42)
!42 = !{null}
!43 = !{}
!44 = !DILocalVariable(name: "data", scope: !40, file: !27, line: 69, type: !28)
!45 = !DILocation(line: 69, column: 9, scope: !40)
!46 = !DILocation(line: 71, column: 10, scope: !40)
!47 = !DILocalVariable(name: "recvResult", scope: !48, file: !27, line: 77, type: !28)
!48 = distinct !DILexicalBlock(scope: !40, file: !27, line: 72, column: 5)
!49 = !DILocation(line: 77, column: 13, scope: !48)
!50 = !DILocalVariable(name: "service", scope: !48, file: !27, line: 78, type: !51)
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !52, line: 375, size: 128, elements: !53)
!52 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!53 = !{!54, !55, !56, !59, !66}
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !51, file: !52, line: 376, baseType: !13, size: 8)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !51, file: !52, line: 377, baseType: !16, size: 8, offset: 8)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !51, file: !52, line: 378, baseType: !57, size: 16, offset: 16)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !58, line: 31, baseType: !5)
!58 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !51, file: !52, line: 379, baseType: !60, size: 32, offset: 32)
!60 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !52, line: 301, size: 32, elements: !61)
!61 = !{!62}
!62 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !60, file: !52, line: 302, baseType: !63, size: 32)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !64, line: 31, baseType: !65)
!64 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !6, line: 47, baseType: !23)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !51, file: !52, line: 380, baseType: !67, size: 64, offset: 64)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 64, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 8)
!70 = !DILocation(line: 78, column: 28, scope: !48)
!71 = !DILocalVariable(name: "connectSocket", scope: !48, file: !27, line: 79, type: !28)
!72 = !DILocation(line: 79, column: 16, scope: !48)
!73 = !DILocalVariable(name: "inputBuffer", scope: !48, file: !27, line: 80, type: !19)
!74 = !DILocation(line: 80, column: 14, scope: !48)
!75 = !DILocation(line: 81, column: 9, scope: !48)
!76 = !DILocation(line: 91, column: 29, scope: !77)
!77 = distinct !DILexicalBlock(scope: !48, file: !27, line: 82, column: 9)
!78 = !DILocation(line: 91, column: 27, scope: !77)
!79 = !DILocation(line: 92, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !77, file: !27, line: 92, column: 17)
!81 = !DILocation(line: 92, column: 31, scope: !80)
!82 = !DILocation(line: 92, column: 17, scope: !77)
!83 = !DILocation(line: 94, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !27, line: 93, column: 13)
!85 = !DILocation(line: 96, column: 13, scope: !77)
!86 = !DILocation(line: 97, column: 21, scope: !77)
!87 = !DILocation(line: 97, column: 32, scope: !77)
!88 = !DILocation(line: 98, column: 39, scope: !77)
!89 = !DILocation(line: 98, column: 21, scope: !77)
!90 = !DILocation(line: 98, column: 30, scope: !77)
!91 = !DILocation(line: 98, column: 37, scope: !77)
!92 = !DILocation(line: 99, column: 21, scope: !77)
!93 = !DILocation(line: 99, column: 30, scope: !77)
!94 = !DILocation(line: 100, column: 25, scope: !95)
!95 = distinct !DILexicalBlock(scope: !77, file: !27, line: 100, column: 17)
!96 = !DILocation(line: 100, column: 40, scope: !95)
!97 = !DILocation(line: 100, column: 17, scope: !95)
!98 = !DILocation(line: 100, column: 85, scope: !95)
!99 = !DILocation(line: 100, column: 17, scope: !77)
!100 = !DILocation(line: 102, column: 17, scope: !101)
!101 = distinct !DILexicalBlock(scope: !95, file: !27, line: 101, column: 13)
!102 = !DILocation(line: 106, column: 31, scope: !77)
!103 = !DILocation(line: 106, column: 46, scope: !77)
!104 = !DILocation(line: 106, column: 26, scope: !77)
!105 = !DILocation(line: 106, column: 24, scope: !77)
!106 = !DILocation(line: 107, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !77, file: !27, line: 107, column: 17)
!108 = !DILocation(line: 107, column: 28, scope: !107)
!109 = !DILocation(line: 107, column: 44, scope: !107)
!110 = !DILocation(line: 107, column: 47, scope: !107)
!111 = !DILocation(line: 107, column: 58, scope: !107)
!112 = !DILocation(line: 107, column: 17, scope: !77)
!113 = !DILocation(line: 109, column: 17, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !27, line: 108, column: 13)
!115 = !DILocation(line: 112, column: 25, scope: !77)
!116 = !DILocation(line: 112, column: 13, scope: !77)
!117 = !DILocation(line: 112, column: 37, scope: !77)
!118 = !DILocation(line: 114, column: 25, scope: !77)
!119 = !DILocation(line: 114, column: 20, scope: !77)
!120 = !DILocation(line: 114, column: 18, scope: !77)
!121 = !DILocation(line: 115, column: 9, scope: !77)
!122 = !DILocation(line: 117, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !48, file: !27, line: 117, column: 13)
!124 = !DILocation(line: 117, column: 27, scope: !123)
!125 = !DILocation(line: 117, column: 13, scope: !48)
!126 = !DILocation(line: 119, column: 26, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !27, line: 118, column: 9)
!128 = !DILocation(line: 119, column: 13, scope: !127)
!129 = !DILocation(line: 120, column: 9, scope: !127)
!130 = !DILocation(line: 128, column: 15, scope: !40)
!131 = !DILocation(line: 129, column: 13, scope: !40)
!132 = !DILocation(line: 129, column: 5, scope: !40)
!133 = !DILocation(line: 130, column: 1, scope: !40)
!134 = distinct !DISubprogram(name: "badSink", scope: !27, file: !27, line: 47, type: !135, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!135 = !DISubroutineType(types: !136)
!136 = !{null, !28}
!137 = !DILocalVariable(name: "data", arg: 1, scope: !134, file: !27, line: 47, type: !28)
!138 = !DILocation(line: 47, column: 25, scope: !134)
!139 = !DILocation(line: 49, column: 8, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !27, line: 49, column: 8)
!141 = !DILocation(line: 49, column: 8, scope: !134)
!142 = !DILocalVariable(name: "buffer", scope: !143, file: !27, line: 52, type: !145)
!143 = distinct !DILexicalBlock(scope: !144, file: !27, line: 51, column: 9)
!144 = distinct !DILexicalBlock(scope: !140, file: !27, line: 50, column: 5)
!145 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 320, elements: !146)
!146 = !{!147}
!147 = !DISubrange(count: 10)
!148 = !DILocation(line: 52, column: 17, scope: !143)
!149 = !DILocation(line: 55, column: 17, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !27, line: 55, column: 17)
!151 = !DILocation(line: 55, column: 22, scope: !150)
!152 = !DILocation(line: 55, column: 17, scope: !143)
!153 = !DILocation(line: 57, column: 37, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !27, line: 56, column: 13)
!155 = !DILocation(line: 57, column: 30, scope: !154)
!156 = !DILocation(line: 57, column: 17, scope: !154)
!157 = !DILocation(line: 58, column: 13, scope: !154)
!158 = !DILocation(line: 61, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !150, file: !27, line: 60, column: 13)
!160 = !DILocation(line: 64, column: 5, scope: !144)
!161 = !DILocation(line: 65, column: 1, scope: !134)
!162 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_21_good", scope: !27, file: !27, line: 349, type: !41, scopeLine: 350, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !43)
!163 = !DILocation(line: 351, column: 5, scope: !162)
!164 = !DILocation(line: 352, column: 5, scope: !162)
!165 = !DILocation(line: 353, column: 5, scope: !162)
!166 = !DILocation(line: 354, column: 1, scope: !162)
!167 = distinct !DISubprogram(name: "main", scope: !27, file: !27, line: 365, type: !168, scopeLine: 366, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !43)
!168 = !DISubroutineType(types: !169)
!169 = !{!28, !28, !170}
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!172 = !DILocalVariable(name: "argc", arg: 1, scope: !167, file: !27, line: 365, type: !28)
!173 = !DILocation(line: 365, column: 14, scope: !167)
!174 = !DILocalVariable(name: "argv", arg: 2, scope: !167, file: !27, line: 365, type: !170)
!175 = !DILocation(line: 365, column: 27, scope: !167)
!176 = !DILocation(line: 368, column: 22, scope: !167)
!177 = !DILocation(line: 368, column: 12, scope: !167)
!178 = !DILocation(line: 368, column: 5, scope: !167)
!179 = !DILocation(line: 370, column: 5, scope: !167)
!180 = !DILocation(line: 371, column: 5, scope: !167)
!181 = !DILocation(line: 372, column: 5, scope: !167)
!182 = !DILocation(line: 375, column: 5, scope: !167)
!183 = !DILocation(line: 376, column: 5, scope: !167)
!184 = !DILocation(line: 377, column: 5, scope: !167)
!185 = !DILocation(line: 379, column: 5, scope: !167)
!186 = distinct !DISubprogram(name: "goodB2G1", scope: !27, file: !27, line: 166, type: !41, scopeLine: 167, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!187 = !DILocalVariable(name: "data", scope: !186, file: !27, line: 168, type: !28)
!188 = !DILocation(line: 168, column: 9, scope: !186)
!189 = !DILocation(line: 170, column: 10, scope: !186)
!190 = !DILocalVariable(name: "recvResult", scope: !191, file: !27, line: 176, type: !28)
!191 = distinct !DILexicalBlock(scope: !186, file: !27, line: 171, column: 5)
!192 = !DILocation(line: 176, column: 13, scope: !191)
!193 = !DILocalVariable(name: "service", scope: !191, file: !27, line: 177, type: !51)
!194 = !DILocation(line: 177, column: 28, scope: !191)
!195 = !DILocalVariable(name: "connectSocket", scope: !191, file: !27, line: 178, type: !28)
!196 = !DILocation(line: 178, column: 16, scope: !191)
!197 = !DILocalVariable(name: "inputBuffer", scope: !191, file: !27, line: 179, type: !19)
!198 = !DILocation(line: 179, column: 14, scope: !191)
!199 = !DILocation(line: 180, column: 9, scope: !191)
!200 = !DILocation(line: 190, column: 29, scope: !201)
!201 = distinct !DILexicalBlock(scope: !191, file: !27, line: 181, column: 9)
!202 = !DILocation(line: 190, column: 27, scope: !201)
!203 = !DILocation(line: 191, column: 17, scope: !204)
!204 = distinct !DILexicalBlock(scope: !201, file: !27, line: 191, column: 17)
!205 = !DILocation(line: 191, column: 31, scope: !204)
!206 = !DILocation(line: 191, column: 17, scope: !201)
!207 = !DILocation(line: 193, column: 17, scope: !208)
!208 = distinct !DILexicalBlock(scope: !204, file: !27, line: 192, column: 13)
!209 = !DILocation(line: 195, column: 13, scope: !201)
!210 = !DILocation(line: 196, column: 21, scope: !201)
!211 = !DILocation(line: 196, column: 32, scope: !201)
!212 = !DILocation(line: 197, column: 39, scope: !201)
!213 = !DILocation(line: 197, column: 21, scope: !201)
!214 = !DILocation(line: 197, column: 30, scope: !201)
!215 = !DILocation(line: 197, column: 37, scope: !201)
!216 = !DILocation(line: 198, column: 21, scope: !201)
!217 = !DILocation(line: 198, column: 30, scope: !201)
!218 = !DILocation(line: 199, column: 25, scope: !219)
!219 = distinct !DILexicalBlock(scope: !201, file: !27, line: 199, column: 17)
!220 = !DILocation(line: 199, column: 40, scope: !219)
!221 = !DILocation(line: 199, column: 17, scope: !219)
!222 = !DILocation(line: 199, column: 85, scope: !219)
!223 = !DILocation(line: 199, column: 17, scope: !201)
!224 = !DILocation(line: 201, column: 17, scope: !225)
!225 = distinct !DILexicalBlock(scope: !219, file: !27, line: 200, column: 13)
!226 = !DILocation(line: 205, column: 31, scope: !201)
!227 = !DILocation(line: 205, column: 46, scope: !201)
!228 = !DILocation(line: 205, column: 26, scope: !201)
!229 = !DILocation(line: 205, column: 24, scope: !201)
!230 = !DILocation(line: 206, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !201, file: !27, line: 206, column: 17)
!232 = !DILocation(line: 206, column: 28, scope: !231)
!233 = !DILocation(line: 206, column: 44, scope: !231)
!234 = !DILocation(line: 206, column: 47, scope: !231)
!235 = !DILocation(line: 206, column: 58, scope: !231)
!236 = !DILocation(line: 206, column: 17, scope: !201)
!237 = !DILocation(line: 208, column: 17, scope: !238)
!238 = distinct !DILexicalBlock(scope: !231, file: !27, line: 207, column: 13)
!239 = !DILocation(line: 211, column: 25, scope: !201)
!240 = !DILocation(line: 211, column: 13, scope: !201)
!241 = !DILocation(line: 211, column: 37, scope: !201)
!242 = !DILocation(line: 213, column: 25, scope: !201)
!243 = !DILocation(line: 213, column: 20, scope: !201)
!244 = !DILocation(line: 213, column: 18, scope: !201)
!245 = !DILocation(line: 214, column: 9, scope: !201)
!246 = !DILocation(line: 216, column: 13, scope: !247)
!247 = distinct !DILexicalBlock(scope: !191, file: !27, line: 216, column: 13)
!248 = !DILocation(line: 216, column: 27, scope: !247)
!249 = !DILocation(line: 216, column: 13, scope: !191)
!250 = !DILocation(line: 218, column: 26, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !27, line: 217, column: 9)
!252 = !DILocation(line: 218, column: 13, scope: !251)
!253 = !DILocation(line: 219, column: 9, scope: !251)
!254 = !DILocation(line: 227, column: 20, scope: !186)
!255 = !DILocation(line: 228, column: 18, scope: !186)
!256 = !DILocation(line: 228, column: 5, scope: !186)
!257 = !DILocation(line: 229, column: 1, scope: !186)
!258 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !27, file: !27, line: 142, type: !135, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!259 = !DILocalVariable(name: "data", arg: 1, scope: !258, file: !27, line: 142, type: !28)
!260 = !DILocation(line: 142, column: 30, scope: !258)
!261 = !DILocation(line: 144, column: 8, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !27, line: 144, column: 8)
!263 = !DILocation(line: 144, column: 8, scope: !258)
!264 = !DILocation(line: 147, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !262, file: !27, line: 145, column: 5)
!266 = !DILocation(line: 148, column: 5, scope: !265)
!267 = !DILocalVariable(name: "buffer", scope: !268, file: !27, line: 152, type: !145)
!268 = distinct !DILexicalBlock(scope: !269, file: !27, line: 151, column: 9)
!269 = distinct !DILexicalBlock(scope: !262, file: !27, line: 150, column: 5)
!270 = !DILocation(line: 152, column: 17, scope: !268)
!271 = !DILocation(line: 154, column: 17, scope: !272)
!272 = distinct !DILexicalBlock(scope: !268, file: !27, line: 154, column: 17)
!273 = !DILocation(line: 154, column: 22, scope: !272)
!274 = !DILocation(line: 154, column: 27, scope: !272)
!275 = !DILocation(line: 154, column: 30, scope: !272)
!276 = !DILocation(line: 154, column: 35, scope: !272)
!277 = !DILocation(line: 154, column: 17, scope: !268)
!278 = !DILocation(line: 156, column: 37, scope: !279)
!279 = distinct !DILexicalBlock(scope: !272, file: !27, line: 155, column: 13)
!280 = !DILocation(line: 156, column: 30, scope: !279)
!281 = !DILocation(line: 156, column: 17, scope: !279)
!282 = !DILocation(line: 157, column: 13, scope: !279)
!283 = !DILocation(line: 160, column: 17, scope: !284)
!284 = distinct !DILexicalBlock(scope: !272, file: !27, line: 159, column: 13)
!285 = !DILocation(line: 164, column: 1, scope: !258)
!286 = distinct !DISubprogram(name: "goodB2G2", scope: !27, file: !27, line: 251, type: !41, scopeLine: 252, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!287 = !DILocalVariable(name: "data", scope: !286, file: !27, line: 253, type: !28)
!288 = !DILocation(line: 253, column: 9, scope: !286)
!289 = !DILocation(line: 255, column: 10, scope: !286)
!290 = !DILocalVariable(name: "recvResult", scope: !291, file: !27, line: 261, type: !28)
!291 = distinct !DILexicalBlock(scope: !286, file: !27, line: 256, column: 5)
!292 = !DILocation(line: 261, column: 13, scope: !291)
!293 = !DILocalVariable(name: "service", scope: !291, file: !27, line: 262, type: !51)
!294 = !DILocation(line: 262, column: 28, scope: !291)
!295 = !DILocalVariable(name: "connectSocket", scope: !291, file: !27, line: 263, type: !28)
!296 = !DILocation(line: 263, column: 16, scope: !291)
!297 = !DILocalVariable(name: "inputBuffer", scope: !291, file: !27, line: 264, type: !19)
!298 = !DILocation(line: 264, column: 14, scope: !291)
!299 = !DILocation(line: 265, column: 9, scope: !291)
!300 = !DILocation(line: 275, column: 29, scope: !301)
!301 = distinct !DILexicalBlock(scope: !291, file: !27, line: 266, column: 9)
!302 = !DILocation(line: 275, column: 27, scope: !301)
!303 = !DILocation(line: 276, column: 17, scope: !304)
!304 = distinct !DILexicalBlock(scope: !301, file: !27, line: 276, column: 17)
!305 = !DILocation(line: 276, column: 31, scope: !304)
!306 = !DILocation(line: 276, column: 17, scope: !301)
!307 = !DILocation(line: 278, column: 17, scope: !308)
!308 = distinct !DILexicalBlock(scope: !304, file: !27, line: 277, column: 13)
!309 = !DILocation(line: 280, column: 13, scope: !301)
!310 = !DILocation(line: 281, column: 21, scope: !301)
!311 = !DILocation(line: 281, column: 32, scope: !301)
!312 = !DILocation(line: 282, column: 39, scope: !301)
!313 = !DILocation(line: 282, column: 21, scope: !301)
!314 = !DILocation(line: 282, column: 30, scope: !301)
!315 = !DILocation(line: 282, column: 37, scope: !301)
!316 = !DILocation(line: 283, column: 21, scope: !301)
!317 = !DILocation(line: 283, column: 30, scope: !301)
!318 = !DILocation(line: 284, column: 25, scope: !319)
!319 = distinct !DILexicalBlock(scope: !301, file: !27, line: 284, column: 17)
!320 = !DILocation(line: 284, column: 40, scope: !319)
!321 = !DILocation(line: 284, column: 17, scope: !319)
!322 = !DILocation(line: 284, column: 85, scope: !319)
!323 = !DILocation(line: 284, column: 17, scope: !301)
!324 = !DILocation(line: 286, column: 17, scope: !325)
!325 = distinct !DILexicalBlock(scope: !319, file: !27, line: 285, column: 13)
!326 = !DILocation(line: 290, column: 31, scope: !301)
!327 = !DILocation(line: 290, column: 46, scope: !301)
!328 = !DILocation(line: 290, column: 26, scope: !301)
!329 = !DILocation(line: 290, column: 24, scope: !301)
!330 = !DILocation(line: 291, column: 17, scope: !331)
!331 = distinct !DILexicalBlock(scope: !301, file: !27, line: 291, column: 17)
!332 = !DILocation(line: 291, column: 28, scope: !331)
!333 = !DILocation(line: 291, column: 44, scope: !331)
!334 = !DILocation(line: 291, column: 47, scope: !331)
!335 = !DILocation(line: 291, column: 58, scope: !331)
!336 = !DILocation(line: 291, column: 17, scope: !301)
!337 = !DILocation(line: 293, column: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !331, file: !27, line: 292, column: 13)
!339 = !DILocation(line: 296, column: 25, scope: !301)
!340 = !DILocation(line: 296, column: 13, scope: !301)
!341 = !DILocation(line: 296, column: 37, scope: !301)
!342 = !DILocation(line: 298, column: 25, scope: !301)
!343 = !DILocation(line: 298, column: 20, scope: !301)
!344 = !DILocation(line: 298, column: 18, scope: !301)
!345 = !DILocation(line: 299, column: 9, scope: !301)
!346 = !DILocation(line: 301, column: 13, scope: !347)
!347 = distinct !DILexicalBlock(scope: !291, file: !27, line: 301, column: 13)
!348 = !DILocation(line: 301, column: 27, scope: !347)
!349 = !DILocation(line: 301, column: 13, scope: !291)
!350 = !DILocation(line: 303, column: 26, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !27, line: 302, column: 9)
!352 = !DILocation(line: 303, column: 13, scope: !351)
!353 = !DILocation(line: 304, column: 9, scope: !351)
!354 = !DILocation(line: 312, column: 20, scope: !286)
!355 = !DILocation(line: 313, column: 18, scope: !286)
!356 = !DILocation(line: 313, column: 5, scope: !286)
!357 = !DILocation(line: 314, column: 1, scope: !286)
!358 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !27, file: !27, line: 232, type: !135, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!359 = !DILocalVariable(name: "data", arg: 1, scope: !358, file: !27, line: 232, type: !28)
!360 = !DILocation(line: 232, column: 30, scope: !358)
!361 = !DILocation(line: 234, column: 8, scope: !362)
!362 = distinct !DILexicalBlock(scope: !358, file: !27, line: 234, column: 8)
!363 = !DILocation(line: 234, column: 8, scope: !358)
!364 = !DILocalVariable(name: "buffer", scope: !365, file: !27, line: 237, type: !145)
!365 = distinct !DILexicalBlock(scope: !366, file: !27, line: 236, column: 9)
!366 = distinct !DILexicalBlock(scope: !362, file: !27, line: 235, column: 5)
!367 = !DILocation(line: 237, column: 17, scope: !365)
!368 = !DILocation(line: 239, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !365, file: !27, line: 239, column: 17)
!370 = !DILocation(line: 239, column: 22, scope: !369)
!371 = !DILocation(line: 239, column: 27, scope: !369)
!372 = !DILocation(line: 239, column: 30, scope: !369)
!373 = !DILocation(line: 239, column: 35, scope: !369)
!374 = !DILocation(line: 239, column: 17, scope: !365)
!375 = !DILocation(line: 241, column: 37, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !27, line: 240, column: 13)
!377 = !DILocation(line: 241, column: 30, scope: !376)
!378 = !DILocation(line: 241, column: 17, scope: !376)
!379 = !DILocation(line: 242, column: 13, scope: !376)
!380 = !DILocation(line: 245, column: 17, scope: !381)
!381 = distinct !DILexicalBlock(scope: !369, file: !27, line: 244, column: 13)
!382 = !DILocation(line: 248, column: 5, scope: !366)
!383 = !DILocation(line: 249, column: 1, scope: !358)
!384 = distinct !DISubprogram(name: "goodG2B", scope: !27, file: !27, line: 337, type: !41, scopeLine: 338, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!385 = !DILocalVariable(name: "data", scope: !384, file: !27, line: 339, type: !28)
!386 = !DILocation(line: 339, column: 9, scope: !384)
!387 = !DILocation(line: 341, column: 10, scope: !384)
!388 = !DILocation(line: 344, column: 10, scope: !384)
!389 = !DILocation(line: 345, column: 19, scope: !384)
!390 = !DILocation(line: 346, column: 17, scope: !384)
!391 = !DILocation(line: 346, column: 5, scope: !384)
!392 = !DILocation(line: 347, column: 1, scope: !384)
!393 = distinct !DISubprogram(name: "goodG2BSink", scope: !27, file: !27, line: 317, type: !135, scopeLine: 318, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !43)
!394 = !DILocalVariable(name: "data", arg: 1, scope: !393, file: !27, line: 317, type: !28)
!395 = !DILocation(line: 317, column: 29, scope: !393)
!396 = !DILocation(line: 319, column: 8, scope: !397)
!397 = distinct !DILexicalBlock(scope: !393, file: !27, line: 319, column: 8)
!398 = !DILocation(line: 319, column: 8, scope: !393)
!399 = !DILocalVariable(name: "buffer", scope: !400, file: !27, line: 322, type: !145)
!400 = distinct !DILexicalBlock(scope: !401, file: !27, line: 321, column: 9)
!401 = distinct !DILexicalBlock(scope: !397, file: !27, line: 320, column: 5)
!402 = !DILocation(line: 322, column: 17, scope: !400)
!403 = !DILocation(line: 325, column: 17, scope: !404)
!404 = distinct !DILexicalBlock(scope: !400, file: !27, line: 325, column: 17)
!405 = !DILocation(line: 325, column: 22, scope: !404)
!406 = !DILocation(line: 325, column: 17, scope: !400)
!407 = !DILocation(line: 327, column: 37, scope: !408)
!408 = distinct !DILexicalBlock(scope: !404, file: !27, line: 326, column: 13)
!409 = !DILocation(line: 327, column: 30, scope: !408)
!410 = !DILocation(line: 327, column: 17, scope: !408)
!411 = !DILocation(line: 328, column: 13, scope: !408)
!412 = !DILocation(line: 331, column: 17, scope: !413)
!413 = distinct !DILexicalBlock(scope: !404, file: !27, line: 330, column: 13)
!414 = !DILocation(line: 334, column: 5, scope: !401)
!415 = !DILocation(line: 335, column: 1, scope: !393)
