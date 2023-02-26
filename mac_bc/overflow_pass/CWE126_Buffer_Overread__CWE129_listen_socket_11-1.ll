; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_listen_socket_11_bad() #0 !dbg !31 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !36, metadata !DIExpression()), !dbg !38
  store i32 -1, i32* %data, align 4, !dbg !39
  %call = call i32 (...) @globalReturnsTrue(), !dbg !40
  %tobool = icmp ne i32 %call, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end34, !dbg !42

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

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 (...) @globalReturnsTrue(), !dbg !153
  %tobool36 = icmp ne i32 %call35, 0, !dbg !153
  br i1 %tobool36, label %if.then37, label %if.end44, !dbg !155

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !156, metadata !DIExpression()), !dbg !162
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !162
  %16 = load i32, i32* %data, align 4, !dbg !163
  %cmp38 = icmp sge i32 %16, 0, !dbg !165
  br i1 %cmp38, label %if.then40, label %if.else, !dbg !166

if.then40:                                        ; preds = %if.then37
  %17 = load i32, i32* %data, align 4, !dbg !167
  %idxprom41 = sext i32 %17 to i64, !dbg !169
  %arrayidx42 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom41, !dbg !169
  %18 = load i32, i32* %arrayidx42, align 4, !dbg !169
  call void @printIntLine(i32 noundef %18), !dbg !170
  br label %if.end43, !dbg !171

if.else:                                          ; preds = %if.then37
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !172
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.then40
  br label %if.end44, !dbg !174

if.end44:                                         ; preds = %if.end43, %if.end34
  ret void, !dbg !175
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

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
define void @CWE126_Buffer_Overread__CWE129_listen_socket_11_good() #0 !dbg !176 {
entry:
  call void @goodB2G1(), !dbg !177
  call void @goodB2G2(), !dbg !178
  call void @goodG2B1(), !dbg !179
  call void @goodG2B2(), !dbg !180
  ret void, !dbg !181
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !182 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !187, metadata !DIExpression()), !dbg !188
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !189, metadata !DIExpression()), !dbg !190
  %call = call i64 @time(i64* noundef null), !dbg !191
  %conv = trunc i64 %call to i32, !dbg !192
  call void @srand(i32 noundef %conv), !dbg !193
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !194
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_11_good(), !dbg !195
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !196
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !197
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_11_bad(), !dbg !198
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !199
  ret i32 0, !dbg !200
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !201 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !202, metadata !DIExpression()), !dbg !203
  store i32 -1, i32* %data, align 4, !dbg !204
  %call = call i32 (...) @globalReturnsTrue(), !dbg !205
  %tobool = icmp ne i32 %call, 0, !dbg !205
  br i1 %tobool, label %if.then, label %if.end34, !dbg !207

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !208, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !214, metadata !DIExpression()), !dbg !215
  store i32 -1, i32* %listenSocket, align 4, !dbg !215
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !216, metadata !DIExpression()), !dbg !217
  store i32 -1, i32* %acceptSocket, align 4, !dbg !217
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !218, metadata !DIExpression()), !dbg !219
  br label %do.body, !dbg !220

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !221
  store i32 %call1, i32* %listenSocket, align 4, !dbg !223
  %0 = load i32, i32* %listenSocket, align 4, !dbg !224
  %cmp = icmp eq i32 %0, -1, !dbg !226
  br i1 %cmp, label %if.then2, label %if.end, !dbg !227

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !228

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !230
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !230
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !231
  store i8 2, i8* %sin_family, align 1, !dbg !232
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !233
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !234
  store i32 0, i32* %s_addr, align 4, !dbg !235
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !236
  store i16 -30871, i16* %sin_port, align 2, !dbg !237
  %2 = load i32, i32* %listenSocket, align 4, !dbg !238
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !240
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !241
  %cmp4 = icmp eq i32 %call3, -1, !dbg !242
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !243

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !244

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !246
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !248
  %cmp8 = icmp eq i32 %call7, -1, !dbg !249
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !250

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !251

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !253
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !254
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !255
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !256
  %cmp12 = icmp eq i32 %6, -1, !dbg !258
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !259

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !260

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !262
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !263
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !264
  %conv = trunc i64 %call15 to i32, !dbg !264
  store i32 %conv, i32* %recvResult, align 4, !dbg !265
  %8 = load i32, i32* %recvResult, align 4, !dbg !266
  %cmp16 = icmp eq i32 %8, -1, !dbg !268
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !269

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !270
  %cmp18 = icmp eq i32 %9, 0, !dbg !271
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !272

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !273

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !275
  %idxprom = sext i32 %10 to i64, !dbg !276
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !276
  store i8 0, i8* %arrayidx, align 1, !dbg !277
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !278
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !279
  store i32 %call23, i32* %data, align 4, !dbg !280
  br label %do.end, !dbg !281

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !282
  %cmp24 = icmp ne i32 %11, -1, !dbg !284
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !285

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !286
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !288
  br label %if.end28, !dbg !289

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !290
  %cmp29 = icmp ne i32 %13, -1, !dbg !292
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !293

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !294
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !296
  br label %if.end33, !dbg !297

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !298

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 (...) @globalReturnsFalse(), !dbg !299
  %tobool36 = icmp ne i32 %call35, 0, !dbg !299
  br i1 %tobool36, label %if.then37, label %if.else, !dbg !301

if.then37:                                        ; preds = %if.end34
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !302
  br label %if.end47, !dbg !304

if.else:                                          ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !305, metadata !DIExpression()), !dbg !308
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !308
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !308
  %16 = load i32, i32* %data, align 4, !dbg !309
  %cmp38 = icmp sge i32 %16, 0, !dbg !311
  br i1 %cmp38, label %land.lhs.true, label %if.else45, !dbg !312

land.lhs.true:                                    ; preds = %if.else
  %17 = load i32, i32* %data, align 4, !dbg !313
  %cmp40 = icmp slt i32 %17, 10, !dbg !314
  br i1 %cmp40, label %if.then42, label %if.else45, !dbg !315

if.then42:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !316
  %idxprom43 = sext i32 %18 to i64, !dbg !318
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !318
  %19 = load i32, i32* %arrayidx44, align 4, !dbg !318
  call void @printIntLine(i32 noundef %19), !dbg !319
  br label %if.end46, !dbg !320

if.else45:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !321
  br label %if.end46

if.end46:                                         ; preds = %if.else45, %if.then42
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then37
  ret void, !dbg !323
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !324 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !325, metadata !DIExpression()), !dbg !326
  store i32 -1, i32* %data, align 4, !dbg !327
  %call = call i32 (...) @globalReturnsTrue(), !dbg !328
  %tobool = icmp ne i32 %call, 0, !dbg !328
  br i1 %tobool, label %if.then, label %if.end34, !dbg !330

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !331, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !335, metadata !DIExpression()), !dbg !336
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !337, metadata !DIExpression()), !dbg !338
  store i32 -1, i32* %listenSocket, align 4, !dbg !338
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !339, metadata !DIExpression()), !dbg !340
  store i32 -1, i32* %acceptSocket, align 4, !dbg !340
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !341, metadata !DIExpression()), !dbg !342
  br label %do.body, !dbg !343

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !344
  store i32 %call1, i32* %listenSocket, align 4, !dbg !346
  %0 = load i32, i32* %listenSocket, align 4, !dbg !347
  %cmp = icmp eq i32 %0, -1, !dbg !349
  br i1 %cmp, label %if.then2, label %if.end, !dbg !350

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !351

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !353
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !353
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !354
  store i8 2, i8* %sin_family, align 1, !dbg !355
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !356
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !357
  store i32 0, i32* %s_addr, align 4, !dbg !358
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !359
  store i16 -30871, i16* %sin_port, align 2, !dbg !360
  %2 = load i32, i32* %listenSocket, align 4, !dbg !361
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !363
  %call3 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !364
  %cmp4 = icmp eq i32 %call3, -1, !dbg !365
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !366

if.then5:                                         ; preds = %if.end
  br label %do.end, !dbg !367

if.end6:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !369
  %call7 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !371
  %cmp8 = icmp eq i32 %call7, -1, !dbg !372
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !373

if.then9:                                         ; preds = %if.end6
  br label %do.end, !dbg !374

if.end10:                                         ; preds = %if.end6
  %5 = load i32, i32* %listenSocket, align 4, !dbg !376
  %call11 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !377
  store i32 %call11, i32* %acceptSocket, align 4, !dbg !378
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !379
  %cmp12 = icmp eq i32 %6, -1, !dbg !381
  br i1 %cmp12, label %if.then13, label %if.end14, !dbg !382

if.then13:                                        ; preds = %if.end10
  br label %do.end, !dbg !383

if.end14:                                         ; preds = %if.end10
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !385
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !386
  %call15 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !387
  %conv = trunc i64 %call15 to i32, !dbg !387
  store i32 %conv, i32* %recvResult, align 4, !dbg !388
  %8 = load i32, i32* %recvResult, align 4, !dbg !389
  %cmp16 = icmp eq i32 %8, -1, !dbg !391
  br i1 %cmp16, label %if.then20, label %lor.lhs.false, !dbg !392

lor.lhs.false:                                    ; preds = %if.end14
  %9 = load i32, i32* %recvResult, align 4, !dbg !393
  %cmp18 = icmp eq i32 %9, 0, !dbg !394
  br i1 %cmp18, label %if.then20, label %if.end21, !dbg !395

if.then20:                                        ; preds = %lor.lhs.false, %if.end14
  br label %do.end, !dbg !396

if.end21:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !398
  %idxprom = sext i32 %10 to i64, !dbg !399
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !399
  store i8 0, i8* %arrayidx, align 1, !dbg !400
  %arraydecay22 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !401
  %call23 = call i32 @atoi(i8* noundef %arraydecay22), !dbg !402
  store i32 %call23, i32* %data, align 4, !dbg !403
  br label %do.end, !dbg !404

do.end:                                           ; preds = %if.end21, %if.then20, %if.then13, %if.then9, %if.then5, %if.then2
  %11 = load i32, i32* %listenSocket, align 4, !dbg !405
  %cmp24 = icmp ne i32 %11, -1, !dbg !407
  br i1 %cmp24, label %if.then26, label %if.end28, !dbg !408

if.then26:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !409
  %call27 = call i32 @"\01_close"(i32 noundef %12), !dbg !411
  br label %if.end28, !dbg !412

if.end28:                                         ; preds = %if.then26, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !413
  %cmp29 = icmp ne i32 %13, -1, !dbg !415
  br i1 %cmp29, label %if.then31, label %if.end33, !dbg !416

if.then31:                                        ; preds = %if.end28
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !417
  %call32 = call i32 @"\01_close"(i32 noundef %14), !dbg !419
  br label %if.end33, !dbg !420

if.end33:                                         ; preds = %if.then31, %if.end28
  br label %if.end34, !dbg !421

if.end34:                                         ; preds = %if.end33, %entry
  %call35 = call i32 (...) @globalReturnsTrue(), !dbg !422
  %tobool36 = icmp ne i32 %call35, 0, !dbg !422
  br i1 %tobool36, label %if.then37, label %if.end46, !dbg !424

if.then37:                                        ; preds = %if.end34
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !425, metadata !DIExpression()), !dbg !428
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !428
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !428
  %16 = load i32, i32* %data, align 4, !dbg !429
  %cmp38 = icmp sge i32 %16, 0, !dbg !431
  br i1 %cmp38, label %land.lhs.true, label %if.else, !dbg !432

land.lhs.true:                                    ; preds = %if.then37
  %17 = load i32, i32* %data, align 4, !dbg !433
  %cmp40 = icmp slt i32 %17, 10, !dbg !434
  br i1 %cmp40, label %if.then42, label %if.else, !dbg !435

if.then42:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !436
  %idxprom43 = sext i32 %18 to i64, !dbg !438
  %arrayidx44 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom43, !dbg !438
  %19 = load i32, i32* %arrayidx44, align 4, !dbg !438
  call void @printIntLine(i32 noundef %19), !dbg !439
  br label %if.end45, !dbg !440

if.else:                                          ; preds = %land.lhs.true, %if.then37
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !441
  br label %if.end45

if.end45:                                         ; preds = %if.else, %if.then42
  br label %if.end46, !dbg !443

if.end46:                                         ; preds = %if.end45, %if.end34
  ret void, !dbg !444
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !445 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !446, metadata !DIExpression()), !dbg !447
  store i32 -1, i32* %data, align 4, !dbg !448
  %call = call i32 (...) @globalReturnsFalse(), !dbg !449
  %tobool = icmp ne i32 %call, 0, !dbg !449
  br i1 %tobool, label %if.then, label %if.else, !dbg !451

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !452
  br label %if.end, !dbg !454

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !455
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !457
  %tobool2 = icmp ne i32 %call1, 0, !dbg !457
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !459

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !460, metadata !DIExpression()), !dbg !463
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !463
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !463
  %1 = load i32, i32* %data, align 4, !dbg !464
  %cmp = icmp sge i32 %1, 0, !dbg !466
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !467

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !468
  %idxprom = sext i32 %2 to i64, !dbg !470
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !470
  %3 = load i32, i32* %arrayidx, align 4, !dbg !470
  call void @printIntLine(i32 noundef %3), !dbg !471
  br label %if.end6, !dbg !472

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !473
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !475

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !476
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !477 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !478, metadata !DIExpression()), !dbg !479
  store i32 -1, i32* %data, align 4, !dbg !480
  %call = call i32 (...) @globalReturnsTrue(), !dbg !481
  %tobool = icmp ne i32 %call, 0, !dbg !481
  br i1 %tobool, label %if.then, label %if.end, !dbg !483

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !484
  br label %if.end, !dbg !486

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !487
  %tobool2 = icmp ne i32 %call1, 0, !dbg !487
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !489

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !490, metadata !DIExpression()), !dbg !493
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !493
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !493
  %1 = load i32, i32* %data, align 4, !dbg !494
  %cmp = icmp sge i32 %1, 0, !dbg !496
  br i1 %cmp, label %if.then4, label %if.else, !dbg !497

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !498
  %idxprom = sext i32 %2 to i64, !dbg !500
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !500
  %3 = load i32, i32* %arrayidx, align 4, !dbg !500
  call void @printIntLine(i32 noundef %3), !dbg !501
  br label %if.end5, !dbg !502

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !503
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !505

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !506
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_11_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!156 = !DILocalVariable(name: "buffer", scope: !157, file: !32, line: 124, type: !159)
!157 = distinct !DILexicalBlock(scope: !158, file: !32, line: 123, column: 9)
!158 = distinct !DILexicalBlock(scope: !154, file: !32, line: 122, column: 5)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 10)
!162 = !DILocation(line: 124, column: 17, scope: !157)
!163 = !DILocation(line: 127, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !157, file: !32, line: 127, column: 17)
!165 = !DILocation(line: 127, column: 22, scope: !164)
!166 = !DILocation(line: 127, column: 17, scope: !157)
!167 = !DILocation(line: 129, column: 37, scope: !168)
!168 = distinct !DILexicalBlock(scope: !164, file: !32, line: 128, column: 13)
!169 = !DILocation(line: 129, column: 30, scope: !168)
!170 = !DILocation(line: 129, column: 17, scope: !168)
!171 = !DILocation(line: 130, column: 13, scope: !168)
!172 = !DILocation(line: 133, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !164, file: !32, line: 132, column: 13)
!174 = !DILocation(line: 136, column: 5, scope: !158)
!175 = !DILocation(line: 137, column: 1, scope: !31)
!176 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_11_good", scope: !32, file: !32, line: 403, type: !33, scopeLine: 404, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!177 = !DILocation(line: 405, column: 5, scope: !176)
!178 = !DILocation(line: 406, column: 5, scope: !176)
!179 = !DILocation(line: 407, column: 5, scope: !176)
!180 = !DILocation(line: 408, column: 5, scope: !176)
!181 = !DILocation(line: 409, column: 1, scope: !176)
!182 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 420, type: !183, scopeLine: 421, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!183 = !DISubroutineType(types: !184)
!184 = !{!37, !37, !185}
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!187 = !DILocalVariable(name: "argc", arg: 1, scope: !182, file: !32, line: 420, type: !37)
!188 = !DILocation(line: 420, column: 14, scope: !182)
!189 = !DILocalVariable(name: "argv", arg: 2, scope: !182, file: !32, line: 420, type: !185)
!190 = !DILocation(line: 420, column: 27, scope: !182)
!191 = !DILocation(line: 423, column: 22, scope: !182)
!192 = !DILocation(line: 423, column: 12, scope: !182)
!193 = !DILocation(line: 423, column: 5, scope: !182)
!194 = !DILocation(line: 425, column: 5, scope: !182)
!195 = !DILocation(line: 426, column: 5, scope: !182)
!196 = !DILocation(line: 427, column: 5, scope: !182)
!197 = !DILocation(line: 430, column: 5, scope: !182)
!198 = !DILocation(line: 431, column: 5, scope: !182)
!199 = !DILocation(line: 432, column: 5, scope: !182)
!200 = !DILocation(line: 434, column: 5, scope: !182)
!201 = distinct !DISubprogram(name: "goodB2G1", scope: !32, file: !32, line: 144, type: !33, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!202 = !DILocalVariable(name: "data", scope: !201, file: !32, line: 146, type: !37)
!203 = !DILocation(line: 146, column: 9, scope: !201)
!204 = !DILocation(line: 148, column: 10, scope: !201)
!205 = !DILocation(line: 149, column: 8, scope: !206)
!206 = distinct !DILexicalBlock(scope: !201, file: !32, line: 149, column: 8)
!207 = !DILocation(line: 149, column: 8, scope: !201)
!208 = !DILocalVariable(name: "recvResult", scope: !209, file: !32, line: 156, type: !37)
!209 = distinct !DILexicalBlock(scope: !210, file: !32, line: 151, column: 9)
!210 = distinct !DILexicalBlock(scope: !206, file: !32, line: 150, column: 5)
!211 = !DILocation(line: 156, column: 17, scope: !209)
!212 = !DILocalVariable(name: "service", scope: !209, file: !32, line: 157, type: !48)
!213 = !DILocation(line: 157, column: 32, scope: !209)
!214 = !DILocalVariable(name: "listenSocket", scope: !209, file: !32, line: 158, type: !37)
!215 = !DILocation(line: 158, column: 20, scope: !209)
!216 = !DILocalVariable(name: "acceptSocket", scope: !209, file: !32, line: 159, type: !37)
!217 = !DILocation(line: 159, column: 20, scope: !209)
!218 = !DILocalVariable(name: "inputBuffer", scope: !209, file: !32, line: 160, type: !20)
!219 = !DILocation(line: 160, column: 18, scope: !209)
!220 = !DILocation(line: 161, column: 13, scope: !209)
!221 = !DILocation(line: 171, column: 32, scope: !222)
!222 = distinct !DILexicalBlock(scope: !209, file: !32, line: 162, column: 13)
!223 = !DILocation(line: 171, column: 30, scope: !222)
!224 = !DILocation(line: 172, column: 21, scope: !225)
!225 = distinct !DILexicalBlock(scope: !222, file: !32, line: 172, column: 21)
!226 = !DILocation(line: 172, column: 34, scope: !225)
!227 = !DILocation(line: 172, column: 21, scope: !222)
!228 = !DILocation(line: 174, column: 21, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !32, line: 173, column: 17)
!230 = !DILocation(line: 176, column: 17, scope: !222)
!231 = !DILocation(line: 177, column: 25, scope: !222)
!232 = !DILocation(line: 177, column: 36, scope: !222)
!233 = !DILocation(line: 178, column: 25, scope: !222)
!234 = !DILocation(line: 178, column: 34, scope: !222)
!235 = !DILocation(line: 178, column: 41, scope: !222)
!236 = !DILocation(line: 179, column: 25, scope: !222)
!237 = !DILocation(line: 179, column: 34, scope: !222)
!238 = !DILocation(line: 180, column: 26, scope: !239)
!239 = distinct !DILexicalBlock(scope: !222, file: !32, line: 180, column: 21)
!240 = !DILocation(line: 180, column: 40, scope: !239)
!241 = !DILocation(line: 180, column: 21, scope: !239)
!242 = !DILocation(line: 180, column: 85, scope: !239)
!243 = !DILocation(line: 180, column: 21, scope: !222)
!244 = !DILocation(line: 182, column: 21, scope: !245)
!245 = distinct !DILexicalBlock(scope: !239, file: !32, line: 181, column: 17)
!246 = !DILocation(line: 184, column: 28, scope: !247)
!247 = distinct !DILexicalBlock(scope: !222, file: !32, line: 184, column: 21)
!248 = !DILocation(line: 184, column: 21, scope: !247)
!249 = !DILocation(line: 184, column: 58, scope: !247)
!250 = !DILocation(line: 184, column: 21, scope: !222)
!251 = !DILocation(line: 186, column: 21, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !32, line: 185, column: 17)
!253 = !DILocation(line: 188, column: 39, scope: !222)
!254 = !DILocation(line: 188, column: 32, scope: !222)
!255 = !DILocation(line: 188, column: 30, scope: !222)
!256 = !DILocation(line: 189, column: 21, scope: !257)
!257 = distinct !DILexicalBlock(scope: !222, file: !32, line: 189, column: 21)
!258 = !DILocation(line: 189, column: 34, scope: !257)
!259 = !DILocation(line: 189, column: 21, scope: !222)
!260 = !DILocation(line: 191, column: 21, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !32, line: 190, column: 17)
!262 = !DILocation(line: 194, column: 35, scope: !222)
!263 = !DILocation(line: 194, column: 49, scope: !222)
!264 = !DILocation(line: 194, column: 30, scope: !222)
!265 = !DILocation(line: 194, column: 28, scope: !222)
!266 = !DILocation(line: 195, column: 21, scope: !267)
!267 = distinct !DILexicalBlock(scope: !222, file: !32, line: 195, column: 21)
!268 = !DILocation(line: 195, column: 32, scope: !267)
!269 = !DILocation(line: 195, column: 48, scope: !267)
!270 = !DILocation(line: 195, column: 51, scope: !267)
!271 = !DILocation(line: 195, column: 62, scope: !267)
!272 = !DILocation(line: 195, column: 21, scope: !222)
!273 = !DILocation(line: 197, column: 21, scope: !274)
!274 = distinct !DILexicalBlock(scope: !267, file: !32, line: 196, column: 17)
!275 = !DILocation(line: 200, column: 29, scope: !222)
!276 = !DILocation(line: 200, column: 17, scope: !222)
!277 = !DILocation(line: 200, column: 41, scope: !222)
!278 = !DILocation(line: 202, column: 29, scope: !222)
!279 = !DILocation(line: 202, column: 24, scope: !222)
!280 = !DILocation(line: 202, column: 22, scope: !222)
!281 = !DILocation(line: 203, column: 13, scope: !222)
!282 = !DILocation(line: 205, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !209, file: !32, line: 205, column: 17)
!284 = !DILocation(line: 205, column: 30, scope: !283)
!285 = !DILocation(line: 205, column: 17, scope: !209)
!286 = !DILocation(line: 207, column: 30, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !32, line: 206, column: 13)
!288 = !DILocation(line: 207, column: 17, scope: !287)
!289 = !DILocation(line: 208, column: 13, scope: !287)
!290 = !DILocation(line: 209, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !209, file: !32, line: 209, column: 17)
!292 = !DILocation(line: 209, column: 30, scope: !291)
!293 = !DILocation(line: 209, column: 17, scope: !209)
!294 = !DILocation(line: 211, column: 30, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !32, line: 210, column: 13)
!296 = !DILocation(line: 211, column: 17, scope: !295)
!297 = !DILocation(line: 212, column: 13, scope: !295)
!298 = !DILocation(line: 220, column: 5, scope: !210)
!299 = !DILocation(line: 221, column: 8, scope: !300)
!300 = distinct !DILexicalBlock(scope: !201, file: !32, line: 221, column: 8)
!301 = !DILocation(line: 221, column: 8, scope: !201)
!302 = !DILocation(line: 224, column: 9, scope: !303)
!303 = distinct !DILexicalBlock(scope: !300, file: !32, line: 222, column: 5)
!304 = !DILocation(line: 225, column: 5, scope: !303)
!305 = !DILocalVariable(name: "buffer", scope: !306, file: !32, line: 229, type: !159)
!306 = distinct !DILexicalBlock(scope: !307, file: !32, line: 228, column: 9)
!307 = distinct !DILexicalBlock(scope: !300, file: !32, line: 227, column: 5)
!308 = !DILocation(line: 229, column: 17, scope: !306)
!309 = !DILocation(line: 231, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !32, line: 231, column: 17)
!311 = !DILocation(line: 231, column: 22, scope: !310)
!312 = !DILocation(line: 231, column: 27, scope: !310)
!313 = !DILocation(line: 231, column: 30, scope: !310)
!314 = !DILocation(line: 231, column: 35, scope: !310)
!315 = !DILocation(line: 231, column: 17, scope: !306)
!316 = !DILocation(line: 233, column: 37, scope: !317)
!317 = distinct !DILexicalBlock(scope: !310, file: !32, line: 232, column: 13)
!318 = !DILocation(line: 233, column: 30, scope: !317)
!319 = !DILocation(line: 233, column: 17, scope: !317)
!320 = !DILocation(line: 234, column: 13, scope: !317)
!321 = !DILocation(line: 237, column: 17, scope: !322)
!322 = distinct !DILexicalBlock(scope: !310, file: !32, line: 236, column: 13)
!323 = !DILocation(line: 241, column: 1, scope: !201)
!324 = distinct !DISubprogram(name: "goodB2G2", scope: !32, file: !32, line: 244, type: !33, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!325 = !DILocalVariable(name: "data", scope: !324, file: !32, line: 246, type: !37)
!326 = !DILocation(line: 246, column: 9, scope: !324)
!327 = !DILocation(line: 248, column: 10, scope: !324)
!328 = !DILocation(line: 249, column: 8, scope: !329)
!329 = distinct !DILexicalBlock(scope: !324, file: !32, line: 249, column: 8)
!330 = !DILocation(line: 249, column: 8, scope: !324)
!331 = !DILocalVariable(name: "recvResult", scope: !332, file: !32, line: 256, type: !37)
!332 = distinct !DILexicalBlock(scope: !333, file: !32, line: 251, column: 9)
!333 = distinct !DILexicalBlock(scope: !329, file: !32, line: 250, column: 5)
!334 = !DILocation(line: 256, column: 17, scope: !332)
!335 = !DILocalVariable(name: "service", scope: !332, file: !32, line: 257, type: !48)
!336 = !DILocation(line: 257, column: 32, scope: !332)
!337 = !DILocalVariable(name: "listenSocket", scope: !332, file: !32, line: 258, type: !37)
!338 = !DILocation(line: 258, column: 20, scope: !332)
!339 = !DILocalVariable(name: "acceptSocket", scope: !332, file: !32, line: 259, type: !37)
!340 = !DILocation(line: 259, column: 20, scope: !332)
!341 = !DILocalVariable(name: "inputBuffer", scope: !332, file: !32, line: 260, type: !20)
!342 = !DILocation(line: 260, column: 18, scope: !332)
!343 = !DILocation(line: 261, column: 13, scope: !332)
!344 = !DILocation(line: 271, column: 32, scope: !345)
!345 = distinct !DILexicalBlock(scope: !332, file: !32, line: 262, column: 13)
!346 = !DILocation(line: 271, column: 30, scope: !345)
!347 = !DILocation(line: 272, column: 21, scope: !348)
!348 = distinct !DILexicalBlock(scope: !345, file: !32, line: 272, column: 21)
!349 = !DILocation(line: 272, column: 34, scope: !348)
!350 = !DILocation(line: 272, column: 21, scope: !345)
!351 = !DILocation(line: 274, column: 21, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !32, line: 273, column: 17)
!353 = !DILocation(line: 276, column: 17, scope: !345)
!354 = !DILocation(line: 277, column: 25, scope: !345)
!355 = !DILocation(line: 277, column: 36, scope: !345)
!356 = !DILocation(line: 278, column: 25, scope: !345)
!357 = !DILocation(line: 278, column: 34, scope: !345)
!358 = !DILocation(line: 278, column: 41, scope: !345)
!359 = !DILocation(line: 279, column: 25, scope: !345)
!360 = !DILocation(line: 279, column: 34, scope: !345)
!361 = !DILocation(line: 280, column: 26, scope: !362)
!362 = distinct !DILexicalBlock(scope: !345, file: !32, line: 280, column: 21)
!363 = !DILocation(line: 280, column: 40, scope: !362)
!364 = !DILocation(line: 280, column: 21, scope: !362)
!365 = !DILocation(line: 280, column: 85, scope: !362)
!366 = !DILocation(line: 280, column: 21, scope: !345)
!367 = !DILocation(line: 282, column: 21, scope: !368)
!368 = distinct !DILexicalBlock(scope: !362, file: !32, line: 281, column: 17)
!369 = !DILocation(line: 284, column: 28, scope: !370)
!370 = distinct !DILexicalBlock(scope: !345, file: !32, line: 284, column: 21)
!371 = !DILocation(line: 284, column: 21, scope: !370)
!372 = !DILocation(line: 284, column: 58, scope: !370)
!373 = !DILocation(line: 284, column: 21, scope: !345)
!374 = !DILocation(line: 286, column: 21, scope: !375)
!375 = distinct !DILexicalBlock(scope: !370, file: !32, line: 285, column: 17)
!376 = !DILocation(line: 288, column: 39, scope: !345)
!377 = !DILocation(line: 288, column: 32, scope: !345)
!378 = !DILocation(line: 288, column: 30, scope: !345)
!379 = !DILocation(line: 289, column: 21, scope: !380)
!380 = distinct !DILexicalBlock(scope: !345, file: !32, line: 289, column: 21)
!381 = !DILocation(line: 289, column: 34, scope: !380)
!382 = !DILocation(line: 289, column: 21, scope: !345)
!383 = !DILocation(line: 291, column: 21, scope: !384)
!384 = distinct !DILexicalBlock(scope: !380, file: !32, line: 290, column: 17)
!385 = !DILocation(line: 294, column: 35, scope: !345)
!386 = !DILocation(line: 294, column: 49, scope: !345)
!387 = !DILocation(line: 294, column: 30, scope: !345)
!388 = !DILocation(line: 294, column: 28, scope: !345)
!389 = !DILocation(line: 295, column: 21, scope: !390)
!390 = distinct !DILexicalBlock(scope: !345, file: !32, line: 295, column: 21)
!391 = !DILocation(line: 295, column: 32, scope: !390)
!392 = !DILocation(line: 295, column: 48, scope: !390)
!393 = !DILocation(line: 295, column: 51, scope: !390)
!394 = !DILocation(line: 295, column: 62, scope: !390)
!395 = !DILocation(line: 295, column: 21, scope: !345)
!396 = !DILocation(line: 297, column: 21, scope: !397)
!397 = distinct !DILexicalBlock(scope: !390, file: !32, line: 296, column: 17)
!398 = !DILocation(line: 300, column: 29, scope: !345)
!399 = !DILocation(line: 300, column: 17, scope: !345)
!400 = !DILocation(line: 300, column: 41, scope: !345)
!401 = !DILocation(line: 302, column: 29, scope: !345)
!402 = !DILocation(line: 302, column: 24, scope: !345)
!403 = !DILocation(line: 302, column: 22, scope: !345)
!404 = !DILocation(line: 303, column: 13, scope: !345)
!405 = !DILocation(line: 305, column: 17, scope: !406)
!406 = distinct !DILexicalBlock(scope: !332, file: !32, line: 305, column: 17)
!407 = !DILocation(line: 305, column: 30, scope: !406)
!408 = !DILocation(line: 305, column: 17, scope: !332)
!409 = !DILocation(line: 307, column: 30, scope: !410)
!410 = distinct !DILexicalBlock(scope: !406, file: !32, line: 306, column: 13)
!411 = !DILocation(line: 307, column: 17, scope: !410)
!412 = !DILocation(line: 308, column: 13, scope: !410)
!413 = !DILocation(line: 309, column: 17, scope: !414)
!414 = distinct !DILexicalBlock(scope: !332, file: !32, line: 309, column: 17)
!415 = !DILocation(line: 309, column: 30, scope: !414)
!416 = !DILocation(line: 309, column: 17, scope: !332)
!417 = !DILocation(line: 311, column: 30, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !32, line: 310, column: 13)
!419 = !DILocation(line: 311, column: 17, scope: !418)
!420 = !DILocation(line: 312, column: 13, scope: !418)
!421 = !DILocation(line: 320, column: 5, scope: !333)
!422 = !DILocation(line: 321, column: 8, scope: !423)
!423 = distinct !DILexicalBlock(scope: !324, file: !32, line: 321, column: 8)
!424 = !DILocation(line: 321, column: 8, scope: !324)
!425 = !DILocalVariable(name: "buffer", scope: !426, file: !32, line: 324, type: !159)
!426 = distinct !DILexicalBlock(scope: !427, file: !32, line: 323, column: 9)
!427 = distinct !DILexicalBlock(scope: !423, file: !32, line: 322, column: 5)
!428 = !DILocation(line: 324, column: 17, scope: !426)
!429 = !DILocation(line: 326, column: 17, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !32, line: 326, column: 17)
!431 = !DILocation(line: 326, column: 22, scope: !430)
!432 = !DILocation(line: 326, column: 27, scope: !430)
!433 = !DILocation(line: 326, column: 30, scope: !430)
!434 = !DILocation(line: 326, column: 35, scope: !430)
!435 = !DILocation(line: 326, column: 17, scope: !426)
!436 = !DILocation(line: 328, column: 37, scope: !437)
!437 = distinct !DILexicalBlock(scope: !430, file: !32, line: 327, column: 13)
!438 = !DILocation(line: 328, column: 30, scope: !437)
!439 = !DILocation(line: 328, column: 17, scope: !437)
!440 = !DILocation(line: 329, column: 13, scope: !437)
!441 = !DILocation(line: 332, column: 17, scope: !442)
!442 = distinct !DILexicalBlock(scope: !430, file: !32, line: 331, column: 13)
!443 = !DILocation(line: 335, column: 5, scope: !427)
!444 = !DILocation(line: 336, column: 1, scope: !324)
!445 = distinct !DISubprogram(name: "goodG2B1", scope: !32, file: !32, line: 339, type: !33, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!446 = !DILocalVariable(name: "data", scope: !445, file: !32, line: 341, type: !37)
!447 = !DILocation(line: 341, column: 9, scope: !445)
!448 = !DILocation(line: 343, column: 10, scope: !445)
!449 = !DILocation(line: 344, column: 8, scope: !450)
!450 = distinct !DILexicalBlock(scope: !445, file: !32, line: 344, column: 8)
!451 = !DILocation(line: 344, column: 8, scope: !445)
!452 = !DILocation(line: 347, column: 9, scope: !453)
!453 = distinct !DILexicalBlock(scope: !450, file: !32, line: 345, column: 5)
!454 = !DILocation(line: 348, column: 5, scope: !453)
!455 = !DILocation(line: 353, column: 14, scope: !456)
!456 = distinct !DILexicalBlock(scope: !450, file: !32, line: 350, column: 5)
!457 = !DILocation(line: 355, column: 8, scope: !458)
!458 = distinct !DILexicalBlock(scope: !445, file: !32, line: 355, column: 8)
!459 = !DILocation(line: 355, column: 8, scope: !445)
!460 = !DILocalVariable(name: "buffer", scope: !461, file: !32, line: 358, type: !159)
!461 = distinct !DILexicalBlock(scope: !462, file: !32, line: 357, column: 9)
!462 = distinct !DILexicalBlock(scope: !458, file: !32, line: 356, column: 5)
!463 = !DILocation(line: 358, column: 17, scope: !461)
!464 = !DILocation(line: 361, column: 17, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !32, line: 361, column: 17)
!466 = !DILocation(line: 361, column: 22, scope: !465)
!467 = !DILocation(line: 361, column: 17, scope: !461)
!468 = !DILocation(line: 363, column: 37, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !32, line: 362, column: 13)
!470 = !DILocation(line: 363, column: 30, scope: !469)
!471 = !DILocation(line: 363, column: 17, scope: !469)
!472 = !DILocation(line: 364, column: 13, scope: !469)
!473 = !DILocation(line: 367, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !465, file: !32, line: 366, column: 13)
!475 = !DILocation(line: 370, column: 5, scope: !462)
!476 = !DILocation(line: 371, column: 1, scope: !445)
!477 = distinct !DISubprogram(name: "goodG2B2", scope: !32, file: !32, line: 374, type: !33, scopeLine: 375, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!478 = !DILocalVariable(name: "data", scope: !477, file: !32, line: 376, type: !37)
!479 = !DILocation(line: 376, column: 9, scope: !477)
!480 = !DILocation(line: 378, column: 10, scope: !477)
!481 = !DILocation(line: 379, column: 8, scope: !482)
!482 = distinct !DILexicalBlock(scope: !477, file: !32, line: 379, column: 8)
!483 = !DILocation(line: 379, column: 8, scope: !477)
!484 = !DILocation(line: 383, column: 14, scope: !485)
!485 = distinct !DILexicalBlock(scope: !482, file: !32, line: 380, column: 5)
!486 = !DILocation(line: 384, column: 5, scope: !485)
!487 = !DILocation(line: 385, column: 8, scope: !488)
!488 = distinct !DILexicalBlock(scope: !477, file: !32, line: 385, column: 8)
!489 = !DILocation(line: 385, column: 8, scope: !477)
!490 = !DILocalVariable(name: "buffer", scope: !491, file: !32, line: 388, type: !159)
!491 = distinct !DILexicalBlock(scope: !492, file: !32, line: 387, column: 9)
!492 = distinct !DILexicalBlock(scope: !488, file: !32, line: 386, column: 5)
!493 = !DILocation(line: 388, column: 17, scope: !491)
!494 = !DILocation(line: 391, column: 17, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !32, line: 391, column: 17)
!496 = !DILocation(line: 391, column: 22, scope: !495)
!497 = !DILocation(line: 391, column: 17, scope: !491)
!498 = !DILocation(line: 393, column: 37, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !32, line: 392, column: 13)
!500 = !DILocation(line: 393, column: 30, scope: !499)
!501 = !DILocation(line: 393, column: 17, scope: !499)
!502 = !DILocation(line: 394, column: 13, scope: !499)
!503 = !DILocation(line: 397, column: 17, scope: !504)
!504 = distinct !DILexicalBlock(scope: !495, file: !32, line: 396, column: 13)
!505 = !DILocation(line: 400, column: 5, scope: !492)
!506 = !DILocation(line: 401, column: 1, scope: !477)
