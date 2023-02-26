; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_listen_socket_12_bad() #0 !dbg !31 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer46 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 -1, i32* %data, align 4, !dbg !39
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !40
  %tobool = icmp ne i32 %call, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.else, !dbg !42

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
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !75
  store i32 %call1, i32* %listenSocket, align 4, !dbg !77
  %0 = load i32, i32* %listenSocket, align 4, !dbg !78
  %cmp = icmp eq i32 %0, -1, !dbg !80
  br i1 %cmp, label %if.then2, label %if.end, !dbg !81

if.then2:                                         ; preds = %do.body
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
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !95
  %cmp4 = icmp eq i32 %call3, -1, !dbg !96
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !97

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !98

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !100
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !102
  %cmp8 = icmp eq i32 %call7, -1, !dbg !103
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !104

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !105

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !107
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !108
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !109
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !110
  %cmp12 = icmp eq i32 %6, -1, !dbg !112
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !113

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !114

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !116
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !117
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !118
  %conv = trunc i64 %call15 to i32, !dbg !118
  store i32 %conv, i32* %recvResult, align 4, !dbg !119
  %8 = load i32, i32* %recvResult, align 4, !dbg !120
  %cmp16 = icmp eq i32 %8, -1, !dbg !122
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !123

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !124
  %cmp18 = icmp eq i32 %9, 0, !dbg !125
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !126

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !127

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !129
  %idxprom = sext i32 %10 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !132
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !133
  store i32 %call23, i32* %data, align 4, !dbg !134
  br label %do.end, !dbg !135

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !136
  %cmp24 = icmp ne i32 %11, -1, !dbg !138
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !139

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !140
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !142
  br label %if.end28, !dbg !143

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !144
  %cmp29 = icmp ne i32 %13, -1, !dbg !146
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !147

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !148
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !150
  br label %if.end33, !dbg !151

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !152

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !153
  br label %if.end34

if.end34:                                         ; preds = %if.else, %if.end33
  %call35 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !155
  %tobool36 = icmp ne i32 %call35, 0, !dbg !155
  br i1 %tobool36, label %if.then37, label %if.else45, !dbg !157

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !158, metadata !DIExpression()), !dbg !164
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !164
  %16 = load i32, i32* %data, align 4, !dbg !165
  %cmp38 = icmp sge i32 %16, 0, !dbg !167
  br i1 %cmp38, label %if.then40, label %if.else43, !dbg !168

if.then40:                                        ; preds = %if.then37
  %17 = load i32, i32* %data, align 4, !dbg !169
  %idxprom41 = sext i32 %17 to i64, !dbg !171
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !171
  %18 = load i32, i32* %arrayidx42, align 4, !dbg !171
  call void @printIntLine(i32 noundef %18), !dbg !172
  br label %if.end44, !dbg !173

if.else43:                                        ; preds = %if.then37
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !174
  br label %if.end44

if.end44:                                         ; preds = %if.else43, %if.then40
  br label %if.end56, !dbg !176

if.else45:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer46, metadata !177, metadata !DIExpression()), !dbg !180
  %19 = bitcast [10 x i32]* %buffer46 to i8*, !dbg !180
  call void @llvm.memset.p0i8.i64(i8* align 16 %19, i8 0, i64 40, i1 false), !dbg !180
  %20 = load i32, i32* %data, align 4, !dbg !181
  %cmp47 = icmp sge i32 %20, 0, !dbg !183
  br i1 %cmp47, label %land.lhs.true, label %if.else54, !dbg !184

land.lhs.true:                                    ; preds = %if.else45
  %21 = load i32, i32* %data, align 4, !dbg !185
  %cmp49 = icmp slt i32 %21, 10, !dbg !186
  br i1 %cmp49, label %if.then51, label %if.else54, !dbg !187

if.then51:                                        ; preds = %land.lhs.true
  %22 = load i32, i32* %data, align 4, !dbg !188
  %idxprom52 = sext i32 %22 to i64, !dbg !190
  %arrayidx53 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer46, i64 0, i64 %idxprom52, !dbg !190
  %23 = load i32, i32* %arrayidx53, align 4, !dbg !190
  call void @printIntLine(i32 noundef %23), !dbg !191
  br label %if.end55, !dbg !192

if.else54:                                        ; preds = %land.lhs.true, %if.else45
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !193
  br label %if.end55

if.end55:                                         ; preds = %if.else54, %if.then51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end44
  ret void, !dbg !195
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

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
define void @CWE126_Buffer_Overread__CWE129_listen_socket_12_good() #0 !dbg !196 {
entry:
  call void @goodB2G(), !dbg !197
  call void @goodG2B(), !dbg !198
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !200 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !205, metadata !DIExpression()), !dbg !206
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !207, metadata !DIExpression()), !dbg !208
  %call = call i64 @time(i64* noundef null), !dbg !209
  %conv = trunc i64 %call to i32, !dbg !210
  call void @srand(i32 noundef %conv), !dbg !211
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !212
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_12_good(), !dbg !213
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !214
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !215
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_12_bad(), !dbg !216
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !217
  ret i32 0, !dbg !218
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !219 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %recvResult34 = alloca i32, align 4
  %service35 = alloca %struct.sockaddr_in, align 4
  %listenSocket36 = alloca i32, align 4
  %acceptSocket37 = alloca i32, align 4
  %inputBuffer38 = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer103 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 -1, i32* %data, align 4, !dbg !222
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !223
  %tobool = icmp ne i32 %call, 0, !dbg !223
  br i1 %tobool, label %if.then, label %if.else, !dbg !225

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !226, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !230, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !232, metadata !DIExpression()), !dbg !233
  store i32 -1, i32* %listenSocket, align 4, !dbg !233
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !234, metadata !DIExpression()), !dbg !235
  store i32 -1, i32* %acceptSocket, align 4, !dbg !235
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !236, metadata !DIExpression()), !dbg !237
  br label %do.body, !dbg !238

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !239
  store i32 %call1, i32* %listenSocket, align 4, !dbg !241
  %0 = load i32, i32* %listenSocket, align 4, !dbg !242
  %cmp = icmp eq i32 %0, -1, !dbg !244
  br i1 %cmp, label %if.then2, label %if.end, !dbg !245

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !246

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !248
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !248
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !249
  store i8 2, i8* %sin_family, align 1, !dbg !250
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !251
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !252
  store i32 0, i32* %s_addr, align 4, !dbg !253
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !254
  store i16 -30871, i16* %sin_port, align 2, !dbg !255
  %2 = load i32, i32* %listenSocket, align 4, !dbg !256
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !258
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !259
  %cmp4 = icmp eq i32 %call3, -1, !dbg !260
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !261

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !262

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !264
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !266
  %cmp8 = icmp eq i32 %call7, -1, !dbg !267
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !268

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !269

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !271
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !272
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !273
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !274
  %cmp12 = icmp eq i32 %6, -1, !dbg !276
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !277

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !278

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !280
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !281
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !282
  %conv = trunc i64 %call15 to i32, !dbg !282
  store i32 %conv, i32* %recvResult, align 4, !dbg !283
  %8 = load i32, i32* %recvResult, align 4, !dbg !284
  %cmp16 = icmp eq i32 %8, -1, !dbg !286
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !287

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !288
  %cmp18 = icmp eq i32 %9, 0, !dbg !289
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !290

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !291

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !293
  %idxprom = sext i32 %10 to i64, !dbg !294
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !294
  store i8 0, i8* %arrayidx, align 1, !dbg !295
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !296
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !297
  store i32 %call23, i32* %data, align 4, !dbg !298
  br label %do.end, !dbg !299

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !300
  %cmp24 = icmp ne i32 %11, -1, !dbg !302
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !303

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !304
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !306
  br label %if.end28, !dbg !307

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !308
  %cmp29 = icmp ne i32 %13, -1, !dbg !310
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !311

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !312
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !314
  br label %if.end33, !dbg !315

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end89, !dbg !316

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult34, metadata !317, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service35, metadata !321, metadata !DIExpression()), !dbg !322
  call void @llvm.dbg.declare(metadata i32* %listenSocket36, metadata !323, metadata !DIExpression()), !dbg !324
  store i32 -1, i32* %listenSocket36, align 4, !dbg !324
  call void @llvm.dbg.declare(metadata i32* %acceptSocket37, metadata !325, metadata !DIExpression()), !dbg !326
  store i32 -1, i32* %acceptSocket37, align 4, !dbg !326
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer38, metadata !327, metadata !DIExpression()), !dbg !328
  br label %do.body39, !dbg !329

do.body39:                                        ; preds = %if.else
  %call40 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !330
  store i32 %call40, i32* %listenSocket36, align 4, !dbg !332
  %15 = load i32, i32* %listenSocket36, align 4, !dbg !333
  %cmp41 = icmp eq i32 %15, -1, !dbg !335
  br i1 %cmp41, label %if.then43, label %if.end44, !dbg !336

if.then43:                                        ; preds = %do.body39
  br label %do.end78, !dbg !337

if.end44:                                         ; preds = %do.body39
  %16 = bitcast %struct.sockaddr_in* %service35 to i8*, !dbg !339
  call void @llvm.memset.p0i8.i64(i8* align 4 %16, i8 0, i64 16, i1 false), !dbg !339
  %sin_family45 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service35, i32 0, i32 1, !dbg !340
  store i8 2, i8* %sin_family45, align 1, !dbg !341
  %sin_addr46 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service35, i32 0, i32 3, !dbg !342
  %s_addr47 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr46, i32 0, i32 0, !dbg !343
  store i32 0, i32* %s_addr47, align 4, !dbg !344
  %sin_port48 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service35, i32 0, i32 2, !dbg !345
  store i16 -30871, i16* %sin_port48, align 2, !dbg !346
  %17 = load i32, i32* %listenSocket36, align 4, !dbg !347
  %18 = bitcast %struct.sockaddr_in* %service35 to %struct.sockaddr*, !dbg !349
  %call49 = call i32 @"\01_bind"(i32 noundef %17, %struct.sockaddr* noundef %18, i32 noundef 16), !dbg !350
  %cmp50 = icmp eq i32 %call49, -1, !dbg !351
  br i1 %cmp50, label %if.then52, label %if.end53, !dbg !352

if.then52:                                        ; preds = %if.end44
  br label %do.end78, !dbg !353

if.end53:                                         ; preds = %if.end44
  %19 = load i32, i32* %listenSocket36, align 4, !dbg !355
  %call54 = call i32 @"\01_listen"(i32 noundef %19, i32 noundef 5), !dbg !357
  %cmp55 = icmp eq i32 %call54, -1, !dbg !358
  br i1 %cmp55, label %if.then57, label %if.end58, !dbg !359

if.then57:                                        ; preds = %if.end53
  br label %do.end78, !dbg !360

if.end58:                                         ; preds = %if.end53
  %20 = load i32, i32* %listenSocket36, align 4, !dbg !362
  %call59 = call i32 @"\01_accept"(i32 noundef %20, %struct.sockaddr* noundef null, i32* noundef null), !dbg !363
  store i32 %call59, i32* %acceptSocket37, align 4, !dbg !364
  %21 = load i32, i32* %acceptSocket37, align 4, !dbg !365
  %cmp60 = icmp eq i32 %21, -1, !dbg !367
  br i1 %cmp60, label %if.then62, label %if.end63, !dbg !368

if.then62:                                        ; preds = %if.end58
  br label %do.end78, !dbg !369

if.end63:                                         ; preds = %if.end58
  %22 = load i32, i32* %acceptSocket37, align 4, !dbg !371
  %arraydecay64 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer38, i64 0, i64 0, !dbg !372
  %call65 = call i64 @"\01_recv"(i32 noundef %22, i8* noundef %arraydecay64, i64 noundef 13, i32 noundef 0), !dbg !373
  %conv66 = trunc i64 %call65 to i32, !dbg !373
  store i32 %conv66, i32* %recvResult34, align 4, !dbg !374
  %23 = load i32, i32* %recvResult34, align 4, !dbg !375
  %cmp67 = icmp eq i32 %23, -1, !dbg !377
  br i1 %cmp67, label %if.then72, label %lor.lhs.false69, !dbg !378

lor.lhs.false69:                                  ; preds = %if.end63
  %24 = load i32, i32* %recvResult34, align 4, !dbg !379
  %cmp70 = icmp eq i32 %24, 0, !dbg !380
  br i1 %cmp70, label %if.then72, label %if.end73, !dbg !381

if.then72:                                        ; preds = %lor.lhs.false69, %if.end63
  br label %do.end78, !dbg !382

if.end73:                                         ; preds = %lor.lhs.false69
  %25 = load i32, i32* %recvResult34, align 4, !dbg !384
  %idxprom74 = sext i32 %25 to i64, !dbg !385
  %arrayidx75 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer38, i64 0, i64 %idxprom74, !dbg !385
  store i8 0, i8* %arrayidx75, align 1, !dbg !386
  %arraydecay76 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer38, i64 0, i64 0, !dbg !387
  %call77 = call i32 @atoi(i8* noundef %arraydecay76), !dbg !388
  store i32 %call77, i32* %data, align 4, !dbg !389
  br label %do.end78, !dbg !390

do.end78:                                         ; preds = %if.end73, %if.then72, %if.then62, %if.then57, %if.then52, %if.then43
  %26 = load i32, i32* %listenSocket36, align 4, !dbg !391
  %cmp79 = icmp ne i32 %26, -1, !dbg !393
  br i1 %cmp79, label %if.then81, label %if.end83, !dbg !394

if.then81:                                        ; preds = %do.end78
  %27 = load i32, i32* %listenSocket36, align 4, !dbg !395
  %call82 = call i32 @"\01_close"(i32 noundef %27), !dbg !397
  br label %if.end83, !dbg !398

if.end83:                                         ; preds = %if.then81, %do.end78
  %28 = load i32, i32* %acceptSocket37, align 4, !dbg !399
  %cmp84 = icmp ne i32 %28, -1, !dbg !401
  br i1 %cmp84, label %if.then86, label %if.end88, !dbg !402

if.then86:                                        ; preds = %if.end83
  %29 = load i32, i32* %acceptSocket37, align 4, !dbg !403
  %call87 = call i32 @"\01_close"(i32 noundef %29), !dbg !405
  br label %if.end88, !dbg !406

if.end88:                                         ; preds = %if.then86, %if.end83
  br label %if.end89

if.end89:                                         ; preds = %if.end88, %if.end33
  %call90 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !407
  %tobool91 = icmp ne i32 %call90, 0, !dbg !407
  br i1 %tobool91, label %if.then92, label %if.else102, !dbg !409

if.then92:                                        ; preds = %if.end89
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !410, metadata !DIExpression()), !dbg !413
  %30 = bitcast [10 x i32]* %buffer to i8*, !dbg !413
  call void @llvm.memset.p0i8.i64(i8* align 16 %30, i8 0, i64 40, i1 false), !dbg !413
  %31 = load i32, i32* %data, align 4, !dbg !414
  %cmp93 = icmp sge i32 %31, 0, !dbg !416
  br i1 %cmp93, label %land.lhs.true, label %if.else100, !dbg !417

land.lhs.true:                                    ; preds = %if.then92
  %32 = load i32, i32* %data, align 4, !dbg !418
  %cmp95 = icmp slt i32 %32, 10, !dbg !419
  br i1 %cmp95, label %if.then97, label %if.else100, !dbg !420

if.then97:                                        ; preds = %land.lhs.true
  %33 = load i32, i32* %data, align 4, !dbg !421
  %idxprom98 = sext i32 %33 to i64, !dbg !423
  %arrayidx99 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom98, !dbg !423
  %34 = load i32, i32* %arrayidx99, align 4, !dbg !423
  call void @printIntLine(i32 noundef %34), !dbg !424
  br label %if.end101, !dbg !425

if.else100:                                       ; preds = %land.lhs.true, %if.then92
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !426
  br label %if.end101

if.end101:                                        ; preds = %if.else100, %if.then97
  br label %if.end114, !dbg !428

if.else102:                                       ; preds = %if.end89
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer103, metadata !429, metadata !DIExpression()), !dbg !432
  %35 = bitcast [10 x i32]* %buffer103 to i8*, !dbg !432
  call void @llvm.memset.p0i8.i64(i8* align 16 %35, i8 0, i64 40, i1 false), !dbg !432
  %36 = load i32, i32* %data, align 4, !dbg !433
  %cmp104 = icmp sge i32 %36, 0, !dbg !435
  br i1 %cmp104, label %land.lhs.true106, label %if.else112, !dbg !436

land.lhs.true106:                                 ; preds = %if.else102
  %37 = load i32, i32* %data, align 4, !dbg !437
  %cmp107 = icmp slt i32 %37, 10, !dbg !438
  br i1 %cmp107, label %if.then109, label %if.else112, !dbg !439

if.then109:                                       ; preds = %land.lhs.true106
  %38 = load i32, i32* %data, align 4, !dbg !440
  %idxprom110 = sext i32 %38 to i64, !dbg !442
  %arrayidx111 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer103, i64 0, i64 %idxprom110, !dbg !442
  %39 = load i32, i32* %arrayidx111, align 4, !dbg !442
  call void @printIntLine(i32 noundef %39), !dbg !443
  br label %if.end113, !dbg !444

if.else112:                                       ; preds = %land.lhs.true106, %if.else102
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0)), !dbg !445
  br label %if.end113

if.end113:                                        ; preds = %if.else112, %if.then109
  br label %if.end114

if.end114:                                        ; preds = %if.end113, %if.end101
  ret void, !dbg !447
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !448 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !449, metadata !DIExpression()), !dbg !450
  store i32 -1, i32* %data, align 4, !dbg !451
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !452
  %tobool = icmp ne i32 %call, 0, !dbg !452
  br i1 %tobool, label %if.then, label %if.else, !dbg !454

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !455
  br label %if.end, !dbg !457

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !458
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !460
  %tobool2 = icmp ne i32 %call1, 0, !dbg !460
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !462

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !463, metadata !DIExpression()), !dbg !466
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !466
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !466
  %1 = load i32, i32* %data, align 4, !dbg !467
  %cmp = icmp sge i32 %1, 0, !dbg !469
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !470

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !471
  %idxprom = sext i32 %2 to i64, !dbg !473
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !473
  %3 = load i32, i32* %arrayidx, align 4, !dbg !473
  call void @printIntLine(i32 noundef %3), !dbg !474
  br label %if.end6, !dbg !475

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !476
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end15, !dbg !478

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !479, metadata !DIExpression()), !dbg !482
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !482
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !482
  %5 = load i32, i32* %data, align 4, !dbg !483
  %cmp9 = icmp sge i32 %5, 0, !dbg !485
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !486

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !487
  %idxprom11 = sext i32 %6 to i64, !dbg !489
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom11, !dbg !489
  %7 = load i32, i32* %arrayidx12, align 4, !dbg !489
  call void @printIntLine(i32 noundef %7), !dbg !490
  br label %if.end14, !dbg !491

if.else13:                                        ; preds = %if.else7
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !492
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end6
  ret void, !dbg !494
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_12_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!153 = !DILocation(line: 125, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !41, file: !32, line: 122, column: 5)
!155 = !DILocation(line: 127, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !31, file: !32, line: 127, column: 8)
!157 = !DILocation(line: 127, column: 8, scope: !31)
!158 = !DILocalVariable(name: "buffer", scope: !159, file: !32, line: 130, type: !161)
!159 = distinct !DILexicalBlock(scope: !160, file: !32, line: 129, column: 9)
!160 = distinct !DILexicalBlock(scope: !156, file: !32, line: 128, column: 5)
!161 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !162)
!162 = !{!163}
!163 = !DISubrange(count: 10)
!164 = !DILocation(line: 130, column: 17, scope: !159)
!165 = !DILocation(line: 133, column: 17, scope: !166)
!166 = distinct !DILexicalBlock(scope: !159, file: !32, line: 133, column: 17)
!167 = !DILocation(line: 133, column: 22, scope: !166)
!168 = !DILocation(line: 133, column: 17, scope: !159)
!169 = !DILocation(line: 135, column: 37, scope: !170)
!170 = distinct !DILexicalBlock(scope: !166, file: !32, line: 134, column: 13)
!171 = !DILocation(line: 135, column: 30, scope: !170)
!172 = !DILocation(line: 135, column: 17, scope: !170)
!173 = !DILocation(line: 136, column: 13, scope: !170)
!174 = !DILocation(line: 139, column: 17, scope: !175)
!175 = distinct !DILexicalBlock(scope: !166, file: !32, line: 138, column: 13)
!176 = !DILocation(line: 142, column: 5, scope: !160)
!177 = !DILocalVariable(name: "buffer", scope: !178, file: !32, line: 146, type: !161)
!178 = distinct !DILexicalBlock(scope: !179, file: !32, line: 145, column: 9)
!179 = distinct !DILexicalBlock(scope: !156, file: !32, line: 144, column: 5)
!180 = !DILocation(line: 146, column: 17, scope: !178)
!181 = !DILocation(line: 148, column: 17, scope: !182)
!182 = distinct !DILexicalBlock(scope: !178, file: !32, line: 148, column: 17)
!183 = !DILocation(line: 148, column: 22, scope: !182)
!184 = !DILocation(line: 148, column: 27, scope: !182)
!185 = !DILocation(line: 148, column: 30, scope: !182)
!186 = !DILocation(line: 148, column: 35, scope: !182)
!187 = !DILocation(line: 148, column: 17, scope: !178)
!188 = !DILocation(line: 150, column: 37, scope: !189)
!189 = distinct !DILexicalBlock(scope: !182, file: !32, line: 149, column: 13)
!190 = !DILocation(line: 150, column: 30, scope: !189)
!191 = !DILocation(line: 150, column: 17, scope: !189)
!192 = !DILocation(line: 151, column: 13, scope: !189)
!193 = !DILocation(line: 154, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !182, file: !32, line: 153, column: 13)
!195 = !DILocation(line: 158, column: 1, scope: !31)
!196 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_12_good", scope: !32, file: !32, line: 402, type: !33, scopeLine: 403, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!197 = !DILocation(line: 404, column: 5, scope: !196)
!198 = !DILocation(line: 405, column: 5, scope: !196)
!199 = !DILocation(line: 406, column: 1, scope: !196)
!200 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 417, type: !201, scopeLine: 418, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!201 = !DISubroutineType(types: !202)
!202 = !{!37, !37, !203}
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!205 = !DILocalVariable(name: "argc", arg: 1, scope: !200, file: !32, line: 417, type: !37)
!206 = !DILocation(line: 417, column: 14, scope: !200)
!207 = !DILocalVariable(name: "argv", arg: 2, scope: !200, file: !32, line: 417, type: !203)
!208 = !DILocation(line: 417, column: 27, scope: !200)
!209 = !DILocation(line: 420, column: 22, scope: !200)
!210 = !DILocation(line: 420, column: 12, scope: !200)
!211 = !DILocation(line: 420, column: 5, scope: !200)
!212 = !DILocation(line: 422, column: 5, scope: !200)
!213 = !DILocation(line: 423, column: 5, scope: !200)
!214 = !DILocation(line: 424, column: 5, scope: !200)
!215 = !DILocation(line: 427, column: 5, scope: !200)
!216 = !DILocation(line: 428, column: 5, scope: !200)
!217 = !DILocation(line: 429, column: 5, scope: !200)
!218 = !DILocation(line: 431, column: 5, scope: !200)
!219 = distinct !DISubprogram(name: "goodB2G", scope: !32, file: !32, line: 167, type: !33, scopeLine: 168, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!220 = !DILocalVariable(name: "data", scope: !219, file: !32, line: 169, type: !37)
!221 = !DILocation(line: 169, column: 9, scope: !219)
!222 = !DILocation(line: 171, column: 10, scope: !219)
!223 = !DILocation(line: 172, column: 8, scope: !224)
!224 = distinct !DILexicalBlock(scope: !219, file: !32, line: 172, column: 8)
!225 = !DILocation(line: 172, column: 8, scope: !219)
!226 = !DILocalVariable(name: "recvResult", scope: !227, file: !32, line: 179, type: !37)
!227 = distinct !DILexicalBlock(scope: !228, file: !32, line: 174, column: 9)
!228 = distinct !DILexicalBlock(scope: !224, file: !32, line: 173, column: 5)
!229 = !DILocation(line: 179, column: 17, scope: !227)
!230 = !DILocalVariable(name: "service", scope: !227, file: !32, line: 180, type: !48)
!231 = !DILocation(line: 180, column: 32, scope: !227)
!232 = !DILocalVariable(name: "listenSocket", scope: !227, file: !32, line: 181, type: !37)
!233 = !DILocation(line: 181, column: 20, scope: !227)
!234 = !DILocalVariable(name: "acceptSocket", scope: !227, file: !32, line: 182, type: !37)
!235 = !DILocation(line: 182, column: 20, scope: !227)
!236 = !DILocalVariable(name: "inputBuffer", scope: !227, file: !32, line: 183, type: !20)
!237 = !DILocation(line: 183, column: 18, scope: !227)
!238 = !DILocation(line: 184, column: 13, scope: !227)
!239 = !DILocation(line: 194, column: 32, scope: !240)
!240 = distinct !DILexicalBlock(scope: !227, file: !32, line: 185, column: 13)
!241 = !DILocation(line: 194, column: 30, scope: !240)
!242 = !DILocation(line: 195, column: 21, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !32, line: 195, column: 21)
!244 = !DILocation(line: 195, column: 34, scope: !243)
!245 = !DILocation(line: 195, column: 21, scope: !240)
!246 = !DILocation(line: 197, column: 21, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !32, line: 196, column: 17)
!248 = !DILocation(line: 199, column: 17, scope: !240)
!249 = !DILocation(line: 200, column: 25, scope: !240)
!250 = !DILocation(line: 200, column: 36, scope: !240)
!251 = !DILocation(line: 201, column: 25, scope: !240)
!252 = !DILocation(line: 201, column: 34, scope: !240)
!253 = !DILocation(line: 201, column: 41, scope: !240)
!254 = !DILocation(line: 202, column: 25, scope: !240)
!255 = !DILocation(line: 202, column: 34, scope: !240)
!256 = !DILocation(line: 203, column: 26, scope: !257)
!257 = distinct !DILexicalBlock(scope: !240, file: !32, line: 203, column: 21)
!258 = !DILocation(line: 203, column: 40, scope: !257)
!259 = !DILocation(line: 203, column: 21, scope: !257)
!260 = !DILocation(line: 203, column: 85, scope: !257)
!261 = !DILocation(line: 203, column: 21, scope: !240)
!262 = !DILocation(line: 205, column: 21, scope: !263)
!263 = distinct !DILexicalBlock(scope: !257, file: !32, line: 204, column: 17)
!264 = !DILocation(line: 207, column: 28, scope: !265)
!265 = distinct !DILexicalBlock(scope: !240, file: !32, line: 207, column: 21)
!266 = !DILocation(line: 207, column: 21, scope: !265)
!267 = !DILocation(line: 207, column: 58, scope: !265)
!268 = !DILocation(line: 207, column: 21, scope: !240)
!269 = !DILocation(line: 209, column: 21, scope: !270)
!270 = distinct !DILexicalBlock(scope: !265, file: !32, line: 208, column: 17)
!271 = !DILocation(line: 211, column: 39, scope: !240)
!272 = !DILocation(line: 211, column: 32, scope: !240)
!273 = !DILocation(line: 211, column: 30, scope: !240)
!274 = !DILocation(line: 212, column: 21, scope: !275)
!275 = distinct !DILexicalBlock(scope: !240, file: !32, line: 212, column: 21)
!276 = !DILocation(line: 212, column: 34, scope: !275)
!277 = !DILocation(line: 212, column: 21, scope: !240)
!278 = !DILocation(line: 214, column: 21, scope: !279)
!279 = distinct !DILexicalBlock(scope: !275, file: !32, line: 213, column: 17)
!280 = !DILocation(line: 217, column: 35, scope: !240)
!281 = !DILocation(line: 217, column: 49, scope: !240)
!282 = !DILocation(line: 217, column: 30, scope: !240)
!283 = !DILocation(line: 217, column: 28, scope: !240)
!284 = !DILocation(line: 218, column: 21, scope: !285)
!285 = distinct !DILexicalBlock(scope: !240, file: !32, line: 218, column: 21)
!286 = !DILocation(line: 218, column: 32, scope: !285)
!287 = !DILocation(line: 218, column: 48, scope: !285)
!288 = !DILocation(line: 218, column: 51, scope: !285)
!289 = !DILocation(line: 218, column: 62, scope: !285)
!290 = !DILocation(line: 218, column: 21, scope: !240)
!291 = !DILocation(line: 220, column: 21, scope: !292)
!292 = distinct !DILexicalBlock(scope: !285, file: !32, line: 219, column: 17)
!293 = !DILocation(line: 223, column: 29, scope: !240)
!294 = !DILocation(line: 223, column: 17, scope: !240)
!295 = !DILocation(line: 223, column: 41, scope: !240)
!296 = !DILocation(line: 225, column: 29, scope: !240)
!297 = !DILocation(line: 225, column: 24, scope: !240)
!298 = !DILocation(line: 225, column: 22, scope: !240)
!299 = !DILocation(line: 226, column: 13, scope: !240)
!300 = !DILocation(line: 228, column: 17, scope: !301)
!301 = distinct !DILexicalBlock(scope: !227, file: !32, line: 228, column: 17)
!302 = !DILocation(line: 228, column: 30, scope: !301)
!303 = !DILocation(line: 228, column: 17, scope: !227)
!304 = !DILocation(line: 230, column: 30, scope: !305)
!305 = distinct !DILexicalBlock(scope: !301, file: !32, line: 229, column: 13)
!306 = !DILocation(line: 230, column: 17, scope: !305)
!307 = !DILocation(line: 231, column: 13, scope: !305)
!308 = !DILocation(line: 232, column: 17, scope: !309)
!309 = distinct !DILexicalBlock(scope: !227, file: !32, line: 232, column: 17)
!310 = !DILocation(line: 232, column: 30, scope: !309)
!311 = !DILocation(line: 232, column: 17, scope: !227)
!312 = !DILocation(line: 234, column: 30, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !32, line: 233, column: 13)
!314 = !DILocation(line: 234, column: 17, scope: !313)
!315 = !DILocation(line: 235, column: 13, scope: !313)
!316 = !DILocation(line: 243, column: 5, scope: !228)
!317 = !DILocalVariable(name: "recvResult", scope: !318, file: !32, line: 251, type: !37)
!318 = distinct !DILexicalBlock(scope: !319, file: !32, line: 246, column: 9)
!319 = distinct !DILexicalBlock(scope: !224, file: !32, line: 245, column: 5)
!320 = !DILocation(line: 251, column: 17, scope: !318)
!321 = !DILocalVariable(name: "service", scope: !318, file: !32, line: 252, type: !48)
!322 = !DILocation(line: 252, column: 32, scope: !318)
!323 = !DILocalVariable(name: "listenSocket", scope: !318, file: !32, line: 253, type: !37)
!324 = !DILocation(line: 253, column: 20, scope: !318)
!325 = !DILocalVariable(name: "acceptSocket", scope: !318, file: !32, line: 254, type: !37)
!326 = !DILocation(line: 254, column: 20, scope: !318)
!327 = !DILocalVariable(name: "inputBuffer", scope: !318, file: !32, line: 255, type: !20)
!328 = !DILocation(line: 255, column: 18, scope: !318)
!329 = !DILocation(line: 256, column: 13, scope: !318)
!330 = !DILocation(line: 266, column: 32, scope: !331)
!331 = distinct !DILexicalBlock(scope: !318, file: !32, line: 257, column: 13)
!332 = !DILocation(line: 266, column: 30, scope: !331)
!333 = !DILocation(line: 267, column: 21, scope: !334)
!334 = distinct !DILexicalBlock(scope: !331, file: !32, line: 267, column: 21)
!335 = !DILocation(line: 267, column: 34, scope: !334)
!336 = !DILocation(line: 267, column: 21, scope: !331)
!337 = !DILocation(line: 269, column: 21, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !32, line: 268, column: 17)
!339 = !DILocation(line: 271, column: 17, scope: !331)
!340 = !DILocation(line: 272, column: 25, scope: !331)
!341 = !DILocation(line: 272, column: 36, scope: !331)
!342 = !DILocation(line: 273, column: 25, scope: !331)
!343 = !DILocation(line: 273, column: 34, scope: !331)
!344 = !DILocation(line: 273, column: 41, scope: !331)
!345 = !DILocation(line: 274, column: 25, scope: !331)
!346 = !DILocation(line: 274, column: 34, scope: !331)
!347 = !DILocation(line: 275, column: 26, scope: !348)
!348 = distinct !DILexicalBlock(scope: !331, file: !32, line: 275, column: 21)
!349 = !DILocation(line: 275, column: 40, scope: !348)
!350 = !DILocation(line: 275, column: 21, scope: !348)
!351 = !DILocation(line: 275, column: 85, scope: !348)
!352 = !DILocation(line: 275, column: 21, scope: !331)
!353 = !DILocation(line: 277, column: 21, scope: !354)
!354 = distinct !DILexicalBlock(scope: !348, file: !32, line: 276, column: 17)
!355 = !DILocation(line: 279, column: 28, scope: !356)
!356 = distinct !DILexicalBlock(scope: !331, file: !32, line: 279, column: 21)
!357 = !DILocation(line: 279, column: 21, scope: !356)
!358 = !DILocation(line: 279, column: 58, scope: !356)
!359 = !DILocation(line: 279, column: 21, scope: !331)
!360 = !DILocation(line: 281, column: 21, scope: !361)
!361 = distinct !DILexicalBlock(scope: !356, file: !32, line: 280, column: 17)
!362 = !DILocation(line: 283, column: 39, scope: !331)
!363 = !DILocation(line: 283, column: 32, scope: !331)
!364 = !DILocation(line: 283, column: 30, scope: !331)
!365 = !DILocation(line: 284, column: 21, scope: !366)
!366 = distinct !DILexicalBlock(scope: !331, file: !32, line: 284, column: 21)
!367 = !DILocation(line: 284, column: 34, scope: !366)
!368 = !DILocation(line: 284, column: 21, scope: !331)
!369 = !DILocation(line: 286, column: 21, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !32, line: 285, column: 17)
!371 = !DILocation(line: 289, column: 35, scope: !331)
!372 = !DILocation(line: 289, column: 49, scope: !331)
!373 = !DILocation(line: 289, column: 30, scope: !331)
!374 = !DILocation(line: 289, column: 28, scope: !331)
!375 = !DILocation(line: 290, column: 21, scope: !376)
!376 = distinct !DILexicalBlock(scope: !331, file: !32, line: 290, column: 21)
!377 = !DILocation(line: 290, column: 32, scope: !376)
!378 = !DILocation(line: 290, column: 48, scope: !376)
!379 = !DILocation(line: 290, column: 51, scope: !376)
!380 = !DILocation(line: 290, column: 62, scope: !376)
!381 = !DILocation(line: 290, column: 21, scope: !331)
!382 = !DILocation(line: 292, column: 21, scope: !383)
!383 = distinct !DILexicalBlock(scope: !376, file: !32, line: 291, column: 17)
!384 = !DILocation(line: 295, column: 29, scope: !331)
!385 = !DILocation(line: 295, column: 17, scope: !331)
!386 = !DILocation(line: 295, column: 41, scope: !331)
!387 = !DILocation(line: 297, column: 29, scope: !331)
!388 = !DILocation(line: 297, column: 24, scope: !331)
!389 = !DILocation(line: 297, column: 22, scope: !331)
!390 = !DILocation(line: 298, column: 13, scope: !331)
!391 = !DILocation(line: 300, column: 17, scope: !392)
!392 = distinct !DILexicalBlock(scope: !318, file: !32, line: 300, column: 17)
!393 = !DILocation(line: 300, column: 30, scope: !392)
!394 = !DILocation(line: 300, column: 17, scope: !318)
!395 = !DILocation(line: 302, column: 30, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !32, line: 301, column: 13)
!397 = !DILocation(line: 302, column: 17, scope: !396)
!398 = !DILocation(line: 303, column: 13, scope: !396)
!399 = !DILocation(line: 304, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !318, file: !32, line: 304, column: 17)
!401 = !DILocation(line: 304, column: 30, scope: !400)
!402 = !DILocation(line: 304, column: 17, scope: !318)
!403 = !DILocation(line: 306, column: 30, scope: !404)
!404 = distinct !DILexicalBlock(scope: !400, file: !32, line: 305, column: 13)
!405 = !DILocation(line: 306, column: 17, scope: !404)
!406 = !DILocation(line: 307, column: 13, scope: !404)
!407 = !DILocation(line: 316, column: 8, scope: !408)
!408 = distinct !DILexicalBlock(scope: !219, file: !32, line: 316, column: 8)
!409 = !DILocation(line: 316, column: 8, scope: !219)
!410 = !DILocalVariable(name: "buffer", scope: !411, file: !32, line: 319, type: !161)
!411 = distinct !DILexicalBlock(scope: !412, file: !32, line: 318, column: 9)
!412 = distinct !DILexicalBlock(scope: !408, file: !32, line: 317, column: 5)
!413 = !DILocation(line: 319, column: 17, scope: !411)
!414 = !DILocation(line: 321, column: 17, scope: !415)
!415 = distinct !DILexicalBlock(scope: !411, file: !32, line: 321, column: 17)
!416 = !DILocation(line: 321, column: 22, scope: !415)
!417 = !DILocation(line: 321, column: 27, scope: !415)
!418 = !DILocation(line: 321, column: 30, scope: !415)
!419 = !DILocation(line: 321, column: 35, scope: !415)
!420 = !DILocation(line: 321, column: 17, scope: !411)
!421 = !DILocation(line: 323, column: 37, scope: !422)
!422 = distinct !DILexicalBlock(scope: !415, file: !32, line: 322, column: 13)
!423 = !DILocation(line: 323, column: 30, scope: !422)
!424 = !DILocation(line: 323, column: 17, scope: !422)
!425 = !DILocation(line: 324, column: 13, scope: !422)
!426 = !DILocation(line: 327, column: 17, scope: !427)
!427 = distinct !DILexicalBlock(scope: !415, file: !32, line: 326, column: 13)
!428 = !DILocation(line: 330, column: 5, scope: !412)
!429 = !DILocalVariable(name: "buffer", scope: !430, file: !32, line: 334, type: !161)
!430 = distinct !DILexicalBlock(scope: !431, file: !32, line: 333, column: 9)
!431 = distinct !DILexicalBlock(scope: !408, file: !32, line: 332, column: 5)
!432 = !DILocation(line: 334, column: 17, scope: !430)
!433 = !DILocation(line: 336, column: 17, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !32, line: 336, column: 17)
!435 = !DILocation(line: 336, column: 22, scope: !434)
!436 = !DILocation(line: 336, column: 27, scope: !434)
!437 = !DILocation(line: 336, column: 30, scope: !434)
!438 = !DILocation(line: 336, column: 35, scope: !434)
!439 = !DILocation(line: 336, column: 17, scope: !430)
!440 = !DILocation(line: 338, column: 37, scope: !441)
!441 = distinct !DILexicalBlock(scope: !434, file: !32, line: 337, column: 13)
!442 = !DILocation(line: 338, column: 30, scope: !441)
!443 = !DILocation(line: 338, column: 17, scope: !441)
!444 = !DILocation(line: 339, column: 13, scope: !441)
!445 = !DILocation(line: 342, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !434, file: !32, line: 341, column: 13)
!447 = !DILocation(line: 346, column: 1, scope: !219)
!448 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 351, type: !33, scopeLine: 352, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!449 = !DILocalVariable(name: "data", scope: !448, file: !32, line: 353, type: !37)
!450 = !DILocation(line: 353, column: 9, scope: !448)
!451 = !DILocation(line: 355, column: 10, scope: !448)
!452 = !DILocation(line: 356, column: 8, scope: !453)
!453 = distinct !DILexicalBlock(scope: !448, file: !32, line: 356, column: 8)
!454 = !DILocation(line: 356, column: 8, scope: !448)
!455 = !DILocation(line: 360, column: 14, scope: !456)
!456 = distinct !DILexicalBlock(scope: !453, file: !32, line: 357, column: 5)
!457 = !DILocation(line: 361, column: 5, scope: !456)
!458 = !DILocation(line: 366, column: 14, scope: !459)
!459 = distinct !DILexicalBlock(scope: !453, file: !32, line: 363, column: 5)
!460 = !DILocation(line: 368, column: 8, scope: !461)
!461 = distinct !DILexicalBlock(scope: !448, file: !32, line: 368, column: 8)
!462 = !DILocation(line: 368, column: 8, scope: !448)
!463 = !DILocalVariable(name: "buffer", scope: !464, file: !32, line: 371, type: !161)
!464 = distinct !DILexicalBlock(scope: !465, file: !32, line: 370, column: 9)
!465 = distinct !DILexicalBlock(scope: !461, file: !32, line: 369, column: 5)
!466 = !DILocation(line: 371, column: 17, scope: !464)
!467 = !DILocation(line: 374, column: 17, scope: !468)
!468 = distinct !DILexicalBlock(scope: !464, file: !32, line: 374, column: 17)
!469 = !DILocation(line: 374, column: 22, scope: !468)
!470 = !DILocation(line: 374, column: 17, scope: !464)
!471 = !DILocation(line: 376, column: 37, scope: !472)
!472 = distinct !DILexicalBlock(scope: !468, file: !32, line: 375, column: 13)
!473 = !DILocation(line: 376, column: 30, scope: !472)
!474 = !DILocation(line: 376, column: 17, scope: !472)
!475 = !DILocation(line: 377, column: 13, scope: !472)
!476 = !DILocation(line: 380, column: 17, scope: !477)
!477 = distinct !DILexicalBlock(scope: !468, file: !32, line: 379, column: 13)
!478 = !DILocation(line: 383, column: 5, scope: !465)
!479 = !DILocalVariable(name: "buffer", scope: !480, file: !32, line: 387, type: !161)
!480 = distinct !DILexicalBlock(scope: !481, file: !32, line: 386, column: 9)
!481 = distinct !DILexicalBlock(scope: !461, file: !32, line: 385, column: 5)
!482 = !DILocation(line: 387, column: 17, scope: !480)
!483 = !DILocation(line: 390, column: 17, scope: !484)
!484 = distinct !DILexicalBlock(scope: !480, file: !32, line: 390, column: 17)
!485 = !DILocation(line: 390, column: 22, scope: !484)
!486 = !DILocation(line: 390, column: 17, scope: !480)
!487 = !DILocation(line: 392, column: 37, scope: !488)
!488 = distinct !DILexicalBlock(scope: !484, file: !32, line: 391, column: 13)
!489 = !DILocation(line: 392, column: 30, scope: !488)
!490 = !DILocation(line: 392, column: 17, scope: !488)
!491 = !DILocation(line: 393, column: 13, scope: !488)
!492 = !DILocation(line: 396, column: 17, scope: !493)
!493 = distinct !DILexicalBlock(scope: !484, file: !32, line: 395, column: 13)
!494 = !DILocation(line: 400, column: 1, scope: !448)
