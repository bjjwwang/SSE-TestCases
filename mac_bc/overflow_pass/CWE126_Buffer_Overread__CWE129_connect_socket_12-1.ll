; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@.str.3 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_12_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer34 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  store i32 -1, i32* %data, align 4, !dbg !37
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !38
  %tobool = icmp ne i32 %call, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.else, !dbg !40

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !41, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !45, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !66, metadata !DIExpression()), !dbg !67
  store i32 -1, i32* %connectSocket, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  br label %do.body, !dbg !70

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !71
  store i32 %call1, i32* %connectSocket, align 4, !dbg !73
  %0 = load i32, i32* %connectSocket, align 4, !dbg !74
  %cmp = icmp eq i32 %0, -1, !dbg !76
  br i1 %cmp, label %if.then2, label %if.end, !dbg !77

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !78

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !80
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !80
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !81
  store i8 2, i8* %sin_family, align 1, !dbg !82
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !83
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !84
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !85
  store i32 %call3, i32* %s_addr, align 4, !dbg !86
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !87
  store i16 -30871, i16* %sin_port, align 2, !dbg !88
  %2 = load i32, i32* %connectSocket, align 4, !dbg !89
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !91
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !92
  %cmp5 = icmp eq i32 %call4, -1, !dbg !93
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !94

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !95

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !97
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !98
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !99
  %conv = trunc i64 %call8 to i32, !dbg !99
  store i32 %conv, i32* %recvResult, align 4, !dbg !100
  %5 = load i32, i32* %recvResult, align 4, !dbg !101
  %cmp9 = icmp eq i32 %5, -1, !dbg !103
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !104

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !105
  %cmp11 = icmp eq i32 %6, 0, !dbg !106
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !107

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !108

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !110
  %idxprom = sext i32 %7 to i64, !dbg !111
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !113
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !114
  store i32 %call16, i32* %data, align 4, !dbg !115
  br label %do.end, !dbg !116

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !117
  %cmp17 = icmp ne i32 %8, -1, !dbg !119
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !120

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !121
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !123
  br label %if.end21, !dbg !124

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !125

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !126
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.end21
  %call23 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !128
  %tobool24 = icmp ne i32 %call23, 0, !dbg !128
  br i1 %tobool24, label %if.then25, label %if.else33, !dbg !130

if.then25:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !137
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !137
  %11 = load i32, i32* %data, align 4, !dbg !138
  %cmp26 = icmp sge i32 %11, 0, !dbg !140
  br i1 %cmp26, label %if.then28, label %if.else31, !dbg !141

if.then28:                                        ; preds = %if.then25
  %12 = load i32, i32* %data, align 4, !dbg !142
  %idxprom29 = sext i32 %12 to i64, !dbg !144
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !144
  %13 = load i32, i32* %arrayidx30, align 4, !dbg !144
  call void @printIntLine(i32 noundef %13), !dbg !145
  br label %if.end32, !dbg !146

if.else31:                                        ; preds = %if.then25
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !147
  br label %if.end32

if.end32:                                         ; preds = %if.else31, %if.then28
  br label %if.end44, !dbg !149

if.else33:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer34, metadata !150, metadata !DIExpression()), !dbg !153
  %14 = bitcast [10 x i32]* %buffer34 to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %14, i8 0, i64 40, i1 false), !dbg !153
  %15 = load i32, i32* %data, align 4, !dbg !154
  %cmp35 = icmp sge i32 %15, 0, !dbg !156
  br i1 %cmp35, label %land.lhs.true, label %if.else42, !dbg !157

land.lhs.true:                                    ; preds = %if.else33
  %16 = load i32, i32* %data, align 4, !dbg !158
  %cmp37 = icmp slt i32 %16, 10, !dbg !159
  br i1 %cmp37, label %if.then39, label %if.else42, !dbg !160

if.then39:                                        ; preds = %land.lhs.true
  %17 = load i32, i32* %data, align 4, !dbg !161
  %idxprom40 = sext i32 %17 to i64, !dbg !163
  %arrayidx41 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer34, i64 0, i64 %idxprom40, !dbg !163
  %18 = load i32, i32* %arrayidx41, align 4, !dbg !163
  call void @printIntLine(i32 noundef %18), !dbg !164
  br label %if.end43, !dbg !165

if.else42:                                        ; preds = %land.lhs.true, %if.else33
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !166
  br label %if.end43

if.end43:                                         ; preds = %if.else42, %if.then39
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.end32
  ret void, !dbg !168
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrueOrFalse(...) #2

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @inet_addr(i8* noundef) #2

declare i32 @"\01_connect"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #2

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #2

declare i32 @atoi(i8* noundef) #2

declare i32 @"\01_close"(i32 noundef) #2

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_12_good() #0 !dbg !169 {
entry:
  call void @goodB2G(), !dbg !170
  call void @goodG2B(), !dbg !171
  ret void, !dbg !172
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !173 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !178, metadata !DIExpression()), !dbg !179
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !180, metadata !DIExpression()), !dbg !181
  %call = call i64 @time(i64* noundef null), !dbg !182
  %conv = trunc i64 %call to i32, !dbg !183
  call void @srand(i32 noundef %conv), !dbg !184
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.3, i64 0, i64 0)), !dbg !185
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_12_good(), !dbg !186
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0)), !dbg !187
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.5, i64 0, i64 0)), !dbg !188
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_12_bad(), !dbg !189
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0)), !dbg !190
  ret i32 0, !dbg !191
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !192 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %recvResult22 = alloca i32, align 4
  %service23 = alloca %struct.sockaddr_in, align 4
  %connectSocket24 = alloca i32, align 4
  %inputBuffer25 = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  %buffer76 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !193, metadata !DIExpression()), !dbg !194
  store i32 -1, i32* %data, align 4, !dbg !195
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !196
  %tobool = icmp ne i32 %call, 0, !dbg !196
  br i1 %tobool, label %if.then, label %if.else, !dbg !198

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !199, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !203, metadata !DIExpression()), !dbg !204
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !205, metadata !DIExpression()), !dbg !206
  store i32 -1, i32* %connectSocket, align 4, !dbg !206
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !207, metadata !DIExpression()), !dbg !208
  br label %do.body, !dbg !209

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !210
  store i32 %call1, i32* %connectSocket, align 4, !dbg !212
  %0 = load i32, i32* %connectSocket, align 4, !dbg !213
  %cmp = icmp eq i32 %0, -1, !dbg !215
  br i1 %cmp, label %if.then2, label %if.end, !dbg !216

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !217

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !219
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !219
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !220
  store i8 2, i8* %sin_family, align 1, !dbg !221
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !222
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !223
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !224
  store i32 %call3, i32* %s_addr, align 4, !dbg !225
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !226
  store i16 -30871, i16* %sin_port, align 2, !dbg !227
  %2 = load i32, i32* %connectSocket, align 4, !dbg !228
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !230
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !231
  %cmp5 = icmp eq i32 %call4, -1, !dbg !232
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !233

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !234

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !236
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !237
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !238
  %conv = trunc i64 %call8 to i32, !dbg !238
  store i32 %conv, i32* %recvResult, align 4, !dbg !239
  %5 = load i32, i32* %recvResult, align 4, !dbg !240
  %cmp9 = icmp eq i32 %5, -1, !dbg !242
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !243

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !244
  %cmp11 = icmp eq i32 %6, 0, !dbg !245
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !246

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !247

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !249
  %idxprom = sext i32 %7 to i64, !dbg !250
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !250
  store i8 0, i8* %arrayidx, align 1, !dbg !251
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !252
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !253
  store i32 %call16, i32* %data, align 4, !dbg !254
  br label %do.end, !dbg !255

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !256
  %cmp17 = icmp ne i32 %8, -1, !dbg !258
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !259

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !260
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !262
  br label %if.end21, !dbg !263

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end62, !dbg !264

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult22, metadata !265, metadata !DIExpression()), !dbg !268
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service23, metadata !269, metadata !DIExpression()), !dbg !270
  call void @llvm.dbg.declare(metadata i32* %connectSocket24, metadata !271, metadata !DIExpression()), !dbg !272
  store i32 -1, i32* %connectSocket24, align 4, !dbg !272
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer25, metadata !273, metadata !DIExpression()), !dbg !274
  br label %do.body26, !dbg !275

do.body26:                                        ; preds = %if.else
  %call27 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !276
  store i32 %call27, i32* %connectSocket24, align 4, !dbg !278
  %10 = load i32, i32* %connectSocket24, align 4, !dbg !279
  %cmp28 = icmp eq i32 %10, -1, !dbg !281
  br i1 %cmp28, label %if.then30, label %if.end31, !dbg !282

if.then30:                                        ; preds = %do.body26
  br label %do.end56, !dbg !283

if.end31:                                         ; preds = %do.body26
  %11 = bitcast %struct.sockaddr_in* %service23 to i8*, !dbg !285
  call void @llvm.memset.p0i8.i64(i8* align 4 %11, i8 0, i64 16, i1 false), !dbg !285
  %sin_family32 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service23, i32 0, i32 1, !dbg !286
  store i8 2, i8* %sin_family32, align 1, !dbg !287
  %call33 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !288
  %sin_addr34 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service23, i32 0, i32 3, !dbg !289
  %s_addr35 = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr34, i32 0, i32 0, !dbg !290
  store i32 %call33, i32* %s_addr35, align 4, !dbg !291
  %sin_port36 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service23, i32 0, i32 2, !dbg !292
  store i16 -30871, i16* %sin_port36, align 2, !dbg !293
  %12 = load i32, i32* %connectSocket24, align 4, !dbg !294
  %13 = bitcast %struct.sockaddr_in* %service23 to %struct.sockaddr*, !dbg !296
  %call37 = call i32 @"\01_connect"(i32 noundef %12, %struct.sockaddr* noundef %13, i32 noundef 16), !dbg !297
  %cmp38 = icmp eq i32 %call37, -1, !dbg !298
  br i1 %cmp38, label %if.then40, label %if.end41, !dbg !299

if.then40:                                        ; preds = %if.end31
  br label %do.end56, !dbg !300

if.end41:                                         ; preds = %if.end31
  %14 = load i32, i32* %connectSocket24, align 4, !dbg !302
  %arraydecay42 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer25, i64 0, i64 0, !dbg !303
  %call43 = call i64 @"\01_recv"(i32 noundef %14, i8* noundef %arraydecay42, i64 noundef 13, i32 noundef 0), !dbg !304
  %conv44 = trunc i64 %call43 to i32, !dbg !304
  store i32 %conv44, i32* %recvResult22, align 4, !dbg !305
  %15 = load i32, i32* %recvResult22, align 4, !dbg !306
  %cmp45 = icmp eq i32 %15, -1, !dbg !308
  br i1 %cmp45, label %if.then50, label %lor.lhs.false47, !dbg !309

lor.lhs.false47:                                  ; preds = %if.end41
  %16 = load i32, i32* %recvResult22, align 4, !dbg !310
  %cmp48 = icmp eq i32 %16, 0, !dbg !311
  br i1 %cmp48, label %if.then50, label %if.end51, !dbg !312

if.then50:                                        ; preds = %lor.lhs.false47, %if.end41
  br label %do.end56, !dbg !313

if.end51:                                         ; preds = %lor.lhs.false47
  %17 = load i32, i32* %recvResult22, align 4, !dbg !315
  %idxprom52 = sext i32 %17 to i64, !dbg !316
  %arrayidx53 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer25, i64 0, i64 %idxprom52, !dbg !316
  store i8 0, i8* %arrayidx53, align 1, !dbg !317
  %arraydecay54 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer25, i64 0, i64 0, !dbg !318
  %call55 = call i32 @atoi(i8* noundef %arraydecay54), !dbg !319
  store i32 %call55, i32* %data, align 4, !dbg !320
  br label %do.end56, !dbg !321

do.end56:                                         ; preds = %if.end51, %if.then50, %if.then40, %if.then30
  %18 = load i32, i32* %connectSocket24, align 4, !dbg !322
  %cmp57 = icmp ne i32 %18, -1, !dbg !324
  br i1 %cmp57, label %if.then59, label %if.end61, !dbg !325

if.then59:                                        ; preds = %do.end56
  %19 = load i32, i32* %connectSocket24, align 4, !dbg !326
  %call60 = call i32 @"\01_close"(i32 noundef %19), !dbg !328
  br label %if.end61, !dbg !329

if.end61:                                         ; preds = %if.then59, %do.end56
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %if.end21
  %call63 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !330
  %tobool64 = icmp ne i32 %call63, 0, !dbg !330
  br i1 %tobool64, label %if.then65, label %if.else75, !dbg !332

if.then65:                                        ; preds = %if.end62
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !333, metadata !DIExpression()), !dbg !336
  %20 = bitcast [10 x i32]* %buffer to i8*, !dbg !336
  call void @llvm.memset.p0i8.i64(i8* align 16 %20, i8 0, i64 40, i1 false), !dbg !336
  %21 = load i32, i32* %data, align 4, !dbg !337
  %cmp66 = icmp sge i32 %21, 0, !dbg !339
  br i1 %cmp66, label %land.lhs.true, label %if.else73, !dbg !340

land.lhs.true:                                    ; preds = %if.then65
  %22 = load i32, i32* %data, align 4, !dbg !341
  %cmp68 = icmp slt i32 %22, 10, !dbg !342
  br i1 %cmp68, label %if.then70, label %if.else73, !dbg !343

if.then70:                                        ; preds = %land.lhs.true
  %23 = load i32, i32* %data, align 4, !dbg !344
  %idxprom71 = sext i32 %23 to i64, !dbg !346
  %arrayidx72 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom71, !dbg !346
  %24 = load i32, i32* %arrayidx72, align 4, !dbg !346
  call void @printIntLine(i32 noundef %24), !dbg !347
  br label %if.end74, !dbg !348

if.else73:                                        ; preds = %land.lhs.true, %if.then65
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !349
  br label %if.end74

if.end74:                                         ; preds = %if.else73, %if.then70
  br label %if.end87, !dbg !351

if.else75:                                        ; preds = %if.end62
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer76, metadata !352, metadata !DIExpression()), !dbg !355
  %25 = bitcast [10 x i32]* %buffer76 to i8*, !dbg !355
  call void @llvm.memset.p0i8.i64(i8* align 16 %25, i8 0, i64 40, i1 false), !dbg !355
  %26 = load i32, i32* %data, align 4, !dbg !356
  %cmp77 = icmp sge i32 %26, 0, !dbg !358
  br i1 %cmp77, label %land.lhs.true79, label %if.else85, !dbg !359

land.lhs.true79:                                  ; preds = %if.else75
  %27 = load i32, i32* %data, align 4, !dbg !360
  %cmp80 = icmp slt i32 %27, 10, !dbg !361
  br i1 %cmp80, label %if.then82, label %if.else85, !dbg !362

if.then82:                                        ; preds = %land.lhs.true79
  %28 = load i32, i32* %data, align 4, !dbg !363
  %idxprom83 = sext i32 %28 to i64, !dbg !365
  %arrayidx84 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer76, i64 0, i64 %idxprom83, !dbg !365
  %29 = load i32, i32* %arrayidx84, align 4, !dbg !365
  call void @printIntLine(i32 noundef %29), !dbg !366
  br label %if.end86, !dbg !367

if.else85:                                        ; preds = %land.lhs.true79, %if.else75
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)), !dbg !368
  br label %if.end86

if.end86:                                         ; preds = %if.else85, %if.then82
  br label %if.end87

if.end87:                                         ; preds = %if.end86, %if.end74
  ret void, !dbg !370
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !371 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %buffer8 = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !372, metadata !DIExpression()), !dbg !373
  store i32 -1, i32* %data, align 4, !dbg !374
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !375
  %tobool = icmp ne i32 %call, 0, !dbg !375
  br i1 %tobool, label %if.then, label %if.else, !dbg !377

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !378
  br label %if.end, !dbg !380

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !381
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !383
  %tobool2 = icmp ne i32 %call1, 0, !dbg !383
  br i1 %tobool2, label %if.then3, label %if.else7, !dbg !385

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !386, metadata !DIExpression()), !dbg !389
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !389
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !389
  %1 = load i32, i32* %data, align 4, !dbg !390
  %cmp = icmp sge i32 %1, 0, !dbg !392
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !393

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !394
  %idxprom = sext i32 %2 to i64, !dbg !396
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !396
  %3 = load i32, i32* %arrayidx, align 4, !dbg !396
  call void @printIntLine(i32 noundef %3), !dbg !397
  br label %if.end6, !dbg !398

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !399
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end15, !dbg !401

if.else7:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer8, metadata !402, metadata !DIExpression()), !dbg !405
  %4 = bitcast [10 x i32]* %buffer8 to i8*, !dbg !405
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 40, i1 false), !dbg !405
  %5 = load i32, i32* %data, align 4, !dbg !406
  %cmp9 = icmp sge i32 %5, 0, !dbg !408
  br i1 %cmp9, label %if.then10, label %if.else13, !dbg !409

if.then10:                                        ; preds = %if.else7
  %6 = load i32, i32* %data, align 4, !dbg !410
  %idxprom11 = sext i32 %6 to i64, !dbg !412
  %arrayidx12 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer8, i64 0, i64 %idxprom11, !dbg !412
  %7 = load i32, i32* %arrayidx12, align 4, !dbg !412
  call void @printIntLine(i32 noundef %7), !dbg !413
  br label %if.end14, !dbg !414

if.else13:                                        ; preds = %if.else7
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !415
  br label %if.end14

if.end14:                                         ; preds = %if.else13, %if.then10
  br label %if.end15

if.end15:                                         ; preds = %if.end14, %if.end6
  ret void, !dbg !417
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !21}
!3 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !4, line: 45, baseType: !5)
!4 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!5 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !8, line: 412, size: 128, elements: !9)
!8 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!9 = !{!10, !13, !16}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !7, file: !8, line: 413, baseType: !11, size: 8)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !4, line: 43, baseType: !12)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !7, file: !8, line: 414, baseType: !14, size: 8, offset: 8)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !15, line: 31, baseType: !11)
!15 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!16 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !7, file: !8, line: 415, baseType: !17, size: 112, offset: 16)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 112, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 14)
!21 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"PIC Level", i32 2}
!26 = !{i32 7, !"uwtable", i32 1}
!27 = !{i32 7, !"frame-pointer", i32 2}
!28 = !{!"Homebrew clang version 14.0.6"}
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_12_bad", scope: !30, file: !30, line: 44, type: !31, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 46, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 46, column: 9, scope: !29)
!37 = !DILocation(line: 48, column: 10, scope: !29)
!38 = !DILocation(line: 49, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !30, line: 49, column: 8)
!40 = !DILocation(line: 49, column: 8, scope: !29)
!41 = !DILocalVariable(name: "recvResult", scope: !42, file: !30, line: 56, type: !35)
!42 = distinct !DILexicalBlock(scope: !43, file: !30, line: 51, column: 9)
!43 = distinct !DILexicalBlock(scope: !39, file: !30, line: 50, column: 5)
!44 = !DILocation(line: 56, column: 17, scope: !42)
!45 = !DILocalVariable(name: "service", scope: !42, file: !30, line: 57, type: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !47, line: 375, size: 128, elements: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!48 = !{!49, !50, !51, !54, !61}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !46, file: !47, line: 376, baseType: !11, size: 8)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !46, file: !47, line: 377, baseType: !14, size: 8, offset: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !46, file: !47, line: 378, baseType: !52, size: 16, offset: 16)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !53, line: 31, baseType: !3)
!53 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!54 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !46, file: !47, line: 379, baseType: !55, size: 32, offset: 32)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !47, line: 301, size: 32, elements: !56)
!56 = !{!57}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !55, file: !47, line: 302, baseType: !58, size: 32)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !59, line: 31, baseType: !60)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !46, file: !47, line: 380, baseType: !62, size: 64, offset: 64)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 8)
!65 = !DILocation(line: 57, column: 32, scope: !42)
!66 = !DILocalVariable(name: "connectSocket", scope: !42, file: !30, line: 58, type: !35)
!67 = !DILocation(line: 58, column: 20, scope: !42)
!68 = !DILocalVariable(name: "inputBuffer", scope: !42, file: !30, line: 59, type: !17)
!69 = !DILocation(line: 59, column: 18, scope: !42)
!70 = !DILocation(line: 60, column: 13, scope: !42)
!71 = !DILocation(line: 70, column: 33, scope: !72)
!72 = distinct !DILexicalBlock(scope: !42, file: !30, line: 61, column: 13)
!73 = !DILocation(line: 70, column: 31, scope: !72)
!74 = !DILocation(line: 71, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !30, line: 71, column: 21)
!76 = !DILocation(line: 71, column: 35, scope: !75)
!77 = !DILocation(line: 71, column: 21, scope: !72)
!78 = !DILocation(line: 73, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !30, line: 72, column: 17)
!80 = !DILocation(line: 75, column: 17, scope: !72)
!81 = !DILocation(line: 76, column: 25, scope: !72)
!82 = !DILocation(line: 76, column: 36, scope: !72)
!83 = !DILocation(line: 77, column: 43, scope: !72)
!84 = !DILocation(line: 77, column: 25, scope: !72)
!85 = !DILocation(line: 77, column: 34, scope: !72)
!86 = !DILocation(line: 77, column: 41, scope: !72)
!87 = !DILocation(line: 78, column: 25, scope: !72)
!88 = !DILocation(line: 78, column: 34, scope: !72)
!89 = !DILocation(line: 79, column: 29, scope: !90)
!90 = distinct !DILexicalBlock(scope: !72, file: !30, line: 79, column: 21)
!91 = !DILocation(line: 79, column: 44, scope: !90)
!92 = !DILocation(line: 79, column: 21, scope: !90)
!93 = !DILocation(line: 79, column: 89, scope: !90)
!94 = !DILocation(line: 79, column: 21, scope: !72)
!95 = !DILocation(line: 81, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !30, line: 80, column: 17)
!97 = !DILocation(line: 85, column: 35, scope: !72)
!98 = !DILocation(line: 85, column: 50, scope: !72)
!99 = !DILocation(line: 85, column: 30, scope: !72)
!100 = !DILocation(line: 85, column: 28, scope: !72)
!101 = !DILocation(line: 86, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !72, file: !30, line: 86, column: 21)
!103 = !DILocation(line: 86, column: 32, scope: !102)
!104 = !DILocation(line: 86, column: 48, scope: !102)
!105 = !DILocation(line: 86, column: 51, scope: !102)
!106 = !DILocation(line: 86, column: 62, scope: !102)
!107 = !DILocation(line: 86, column: 21, scope: !72)
!108 = !DILocation(line: 88, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !30, line: 87, column: 17)
!110 = !DILocation(line: 91, column: 29, scope: !72)
!111 = !DILocation(line: 91, column: 17, scope: !72)
!112 = !DILocation(line: 91, column: 41, scope: !72)
!113 = !DILocation(line: 93, column: 29, scope: !72)
!114 = !DILocation(line: 93, column: 24, scope: !72)
!115 = !DILocation(line: 93, column: 22, scope: !72)
!116 = !DILocation(line: 94, column: 13, scope: !72)
!117 = !DILocation(line: 96, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !42, file: !30, line: 96, column: 17)
!119 = !DILocation(line: 96, column: 31, scope: !118)
!120 = !DILocation(line: 96, column: 17, scope: !42)
!121 = !DILocation(line: 98, column: 30, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !30, line: 97, column: 13)
!123 = !DILocation(line: 98, column: 17, scope: !122)
!124 = !DILocation(line: 99, column: 13, scope: !122)
!125 = !DILocation(line: 107, column: 5, scope: !43)
!126 = !DILocation(line: 112, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !39, file: !30, line: 109, column: 5)
!128 = !DILocation(line: 114, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !29, file: !30, line: 114, column: 8)
!130 = !DILocation(line: 114, column: 8, scope: !29)
!131 = !DILocalVariable(name: "buffer", scope: !132, file: !30, line: 117, type: !134)
!132 = distinct !DILexicalBlock(scope: !133, file: !30, line: 116, column: 9)
!133 = distinct !DILexicalBlock(scope: !129, file: !30, line: 115, column: 5)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 10)
!137 = !DILocation(line: 117, column: 17, scope: !132)
!138 = !DILocation(line: 120, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !30, line: 120, column: 17)
!140 = !DILocation(line: 120, column: 22, scope: !139)
!141 = !DILocation(line: 120, column: 17, scope: !132)
!142 = !DILocation(line: 122, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !30, line: 121, column: 13)
!144 = !DILocation(line: 122, column: 30, scope: !143)
!145 = !DILocation(line: 122, column: 17, scope: !143)
!146 = !DILocation(line: 123, column: 13, scope: !143)
!147 = !DILocation(line: 126, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !139, file: !30, line: 125, column: 13)
!149 = !DILocation(line: 129, column: 5, scope: !133)
!150 = !DILocalVariable(name: "buffer", scope: !151, file: !30, line: 133, type: !134)
!151 = distinct !DILexicalBlock(scope: !152, file: !30, line: 132, column: 9)
!152 = distinct !DILexicalBlock(scope: !129, file: !30, line: 131, column: 5)
!153 = !DILocation(line: 133, column: 17, scope: !151)
!154 = !DILocation(line: 135, column: 17, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !30, line: 135, column: 17)
!156 = !DILocation(line: 135, column: 22, scope: !155)
!157 = !DILocation(line: 135, column: 27, scope: !155)
!158 = !DILocation(line: 135, column: 30, scope: !155)
!159 = !DILocation(line: 135, column: 35, scope: !155)
!160 = !DILocation(line: 135, column: 17, scope: !151)
!161 = !DILocation(line: 137, column: 37, scope: !162)
!162 = distinct !DILexicalBlock(scope: !155, file: !30, line: 136, column: 13)
!163 = !DILocation(line: 137, column: 30, scope: !162)
!164 = !DILocation(line: 137, column: 17, scope: !162)
!165 = !DILocation(line: 138, column: 13, scope: !162)
!166 = !DILocation(line: 141, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !155, file: !30, line: 140, column: 13)
!168 = !DILocation(line: 145, column: 1, scope: !29)
!169 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_12_good", scope: !30, file: !30, line: 363, type: !31, scopeLine: 364, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!170 = !DILocation(line: 365, column: 5, scope: !169)
!171 = !DILocation(line: 366, column: 5, scope: !169)
!172 = !DILocation(line: 367, column: 1, scope: !169)
!173 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 378, type: !174, scopeLine: 379, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!174 = !DISubroutineType(types: !175)
!175 = !{!35, !35, !176}
!176 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !177, size: 64)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!178 = !DILocalVariable(name: "argc", arg: 1, scope: !173, file: !30, line: 378, type: !35)
!179 = !DILocation(line: 378, column: 14, scope: !173)
!180 = !DILocalVariable(name: "argv", arg: 2, scope: !173, file: !30, line: 378, type: !176)
!181 = !DILocation(line: 378, column: 27, scope: !173)
!182 = !DILocation(line: 381, column: 22, scope: !173)
!183 = !DILocation(line: 381, column: 12, scope: !173)
!184 = !DILocation(line: 381, column: 5, scope: !173)
!185 = !DILocation(line: 383, column: 5, scope: !173)
!186 = !DILocation(line: 384, column: 5, scope: !173)
!187 = !DILocation(line: 385, column: 5, scope: !173)
!188 = !DILocation(line: 388, column: 5, scope: !173)
!189 = !DILocation(line: 389, column: 5, scope: !173)
!190 = !DILocation(line: 390, column: 5, scope: !173)
!191 = !DILocation(line: 392, column: 5, scope: !173)
!192 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 154, type: !31, scopeLine: 155, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!193 = !DILocalVariable(name: "data", scope: !192, file: !30, line: 156, type: !35)
!194 = !DILocation(line: 156, column: 9, scope: !192)
!195 = !DILocation(line: 158, column: 10, scope: !192)
!196 = !DILocation(line: 159, column: 8, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !30, line: 159, column: 8)
!198 = !DILocation(line: 159, column: 8, scope: !192)
!199 = !DILocalVariable(name: "recvResult", scope: !200, file: !30, line: 166, type: !35)
!200 = distinct !DILexicalBlock(scope: !201, file: !30, line: 161, column: 9)
!201 = distinct !DILexicalBlock(scope: !197, file: !30, line: 160, column: 5)
!202 = !DILocation(line: 166, column: 17, scope: !200)
!203 = !DILocalVariable(name: "service", scope: !200, file: !30, line: 167, type: !46)
!204 = !DILocation(line: 167, column: 32, scope: !200)
!205 = !DILocalVariable(name: "connectSocket", scope: !200, file: !30, line: 168, type: !35)
!206 = !DILocation(line: 168, column: 20, scope: !200)
!207 = !DILocalVariable(name: "inputBuffer", scope: !200, file: !30, line: 169, type: !17)
!208 = !DILocation(line: 169, column: 18, scope: !200)
!209 = !DILocation(line: 170, column: 13, scope: !200)
!210 = !DILocation(line: 180, column: 33, scope: !211)
!211 = distinct !DILexicalBlock(scope: !200, file: !30, line: 171, column: 13)
!212 = !DILocation(line: 180, column: 31, scope: !211)
!213 = !DILocation(line: 181, column: 21, scope: !214)
!214 = distinct !DILexicalBlock(scope: !211, file: !30, line: 181, column: 21)
!215 = !DILocation(line: 181, column: 35, scope: !214)
!216 = !DILocation(line: 181, column: 21, scope: !211)
!217 = !DILocation(line: 183, column: 21, scope: !218)
!218 = distinct !DILexicalBlock(scope: !214, file: !30, line: 182, column: 17)
!219 = !DILocation(line: 185, column: 17, scope: !211)
!220 = !DILocation(line: 186, column: 25, scope: !211)
!221 = !DILocation(line: 186, column: 36, scope: !211)
!222 = !DILocation(line: 187, column: 43, scope: !211)
!223 = !DILocation(line: 187, column: 25, scope: !211)
!224 = !DILocation(line: 187, column: 34, scope: !211)
!225 = !DILocation(line: 187, column: 41, scope: !211)
!226 = !DILocation(line: 188, column: 25, scope: !211)
!227 = !DILocation(line: 188, column: 34, scope: !211)
!228 = !DILocation(line: 189, column: 29, scope: !229)
!229 = distinct !DILexicalBlock(scope: !211, file: !30, line: 189, column: 21)
!230 = !DILocation(line: 189, column: 44, scope: !229)
!231 = !DILocation(line: 189, column: 21, scope: !229)
!232 = !DILocation(line: 189, column: 89, scope: !229)
!233 = !DILocation(line: 189, column: 21, scope: !211)
!234 = !DILocation(line: 191, column: 21, scope: !235)
!235 = distinct !DILexicalBlock(scope: !229, file: !30, line: 190, column: 17)
!236 = !DILocation(line: 195, column: 35, scope: !211)
!237 = !DILocation(line: 195, column: 50, scope: !211)
!238 = !DILocation(line: 195, column: 30, scope: !211)
!239 = !DILocation(line: 195, column: 28, scope: !211)
!240 = !DILocation(line: 196, column: 21, scope: !241)
!241 = distinct !DILexicalBlock(scope: !211, file: !30, line: 196, column: 21)
!242 = !DILocation(line: 196, column: 32, scope: !241)
!243 = !DILocation(line: 196, column: 48, scope: !241)
!244 = !DILocation(line: 196, column: 51, scope: !241)
!245 = !DILocation(line: 196, column: 62, scope: !241)
!246 = !DILocation(line: 196, column: 21, scope: !211)
!247 = !DILocation(line: 198, column: 21, scope: !248)
!248 = distinct !DILexicalBlock(scope: !241, file: !30, line: 197, column: 17)
!249 = !DILocation(line: 201, column: 29, scope: !211)
!250 = !DILocation(line: 201, column: 17, scope: !211)
!251 = !DILocation(line: 201, column: 41, scope: !211)
!252 = !DILocation(line: 203, column: 29, scope: !211)
!253 = !DILocation(line: 203, column: 24, scope: !211)
!254 = !DILocation(line: 203, column: 22, scope: !211)
!255 = !DILocation(line: 204, column: 13, scope: !211)
!256 = !DILocation(line: 206, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !200, file: !30, line: 206, column: 17)
!258 = !DILocation(line: 206, column: 31, scope: !257)
!259 = !DILocation(line: 206, column: 17, scope: !200)
!260 = !DILocation(line: 208, column: 30, scope: !261)
!261 = distinct !DILexicalBlock(scope: !257, file: !30, line: 207, column: 13)
!262 = !DILocation(line: 208, column: 17, scope: !261)
!263 = !DILocation(line: 209, column: 13, scope: !261)
!264 = !DILocation(line: 217, column: 5, scope: !201)
!265 = !DILocalVariable(name: "recvResult", scope: !266, file: !30, line: 225, type: !35)
!266 = distinct !DILexicalBlock(scope: !267, file: !30, line: 220, column: 9)
!267 = distinct !DILexicalBlock(scope: !197, file: !30, line: 219, column: 5)
!268 = !DILocation(line: 225, column: 17, scope: !266)
!269 = !DILocalVariable(name: "service", scope: !266, file: !30, line: 226, type: !46)
!270 = !DILocation(line: 226, column: 32, scope: !266)
!271 = !DILocalVariable(name: "connectSocket", scope: !266, file: !30, line: 227, type: !35)
!272 = !DILocation(line: 227, column: 20, scope: !266)
!273 = !DILocalVariable(name: "inputBuffer", scope: !266, file: !30, line: 228, type: !17)
!274 = !DILocation(line: 228, column: 18, scope: !266)
!275 = !DILocation(line: 229, column: 13, scope: !266)
!276 = !DILocation(line: 239, column: 33, scope: !277)
!277 = distinct !DILexicalBlock(scope: !266, file: !30, line: 230, column: 13)
!278 = !DILocation(line: 239, column: 31, scope: !277)
!279 = !DILocation(line: 240, column: 21, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !30, line: 240, column: 21)
!281 = !DILocation(line: 240, column: 35, scope: !280)
!282 = !DILocation(line: 240, column: 21, scope: !277)
!283 = !DILocation(line: 242, column: 21, scope: !284)
!284 = distinct !DILexicalBlock(scope: !280, file: !30, line: 241, column: 17)
!285 = !DILocation(line: 244, column: 17, scope: !277)
!286 = !DILocation(line: 245, column: 25, scope: !277)
!287 = !DILocation(line: 245, column: 36, scope: !277)
!288 = !DILocation(line: 246, column: 43, scope: !277)
!289 = !DILocation(line: 246, column: 25, scope: !277)
!290 = !DILocation(line: 246, column: 34, scope: !277)
!291 = !DILocation(line: 246, column: 41, scope: !277)
!292 = !DILocation(line: 247, column: 25, scope: !277)
!293 = !DILocation(line: 247, column: 34, scope: !277)
!294 = !DILocation(line: 248, column: 29, scope: !295)
!295 = distinct !DILexicalBlock(scope: !277, file: !30, line: 248, column: 21)
!296 = !DILocation(line: 248, column: 44, scope: !295)
!297 = !DILocation(line: 248, column: 21, scope: !295)
!298 = !DILocation(line: 248, column: 89, scope: !295)
!299 = !DILocation(line: 248, column: 21, scope: !277)
!300 = !DILocation(line: 250, column: 21, scope: !301)
!301 = distinct !DILexicalBlock(scope: !295, file: !30, line: 249, column: 17)
!302 = !DILocation(line: 254, column: 35, scope: !277)
!303 = !DILocation(line: 254, column: 50, scope: !277)
!304 = !DILocation(line: 254, column: 30, scope: !277)
!305 = !DILocation(line: 254, column: 28, scope: !277)
!306 = !DILocation(line: 255, column: 21, scope: !307)
!307 = distinct !DILexicalBlock(scope: !277, file: !30, line: 255, column: 21)
!308 = !DILocation(line: 255, column: 32, scope: !307)
!309 = !DILocation(line: 255, column: 48, scope: !307)
!310 = !DILocation(line: 255, column: 51, scope: !307)
!311 = !DILocation(line: 255, column: 62, scope: !307)
!312 = !DILocation(line: 255, column: 21, scope: !277)
!313 = !DILocation(line: 257, column: 21, scope: !314)
!314 = distinct !DILexicalBlock(scope: !307, file: !30, line: 256, column: 17)
!315 = !DILocation(line: 260, column: 29, scope: !277)
!316 = !DILocation(line: 260, column: 17, scope: !277)
!317 = !DILocation(line: 260, column: 41, scope: !277)
!318 = !DILocation(line: 262, column: 29, scope: !277)
!319 = !DILocation(line: 262, column: 24, scope: !277)
!320 = !DILocation(line: 262, column: 22, scope: !277)
!321 = !DILocation(line: 263, column: 13, scope: !277)
!322 = !DILocation(line: 265, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !266, file: !30, line: 265, column: 17)
!324 = !DILocation(line: 265, column: 31, scope: !323)
!325 = !DILocation(line: 265, column: 17, scope: !266)
!326 = !DILocation(line: 267, column: 30, scope: !327)
!327 = distinct !DILexicalBlock(scope: !323, file: !30, line: 266, column: 13)
!328 = !DILocation(line: 267, column: 17, scope: !327)
!329 = !DILocation(line: 268, column: 13, scope: !327)
!330 = !DILocation(line: 277, column: 8, scope: !331)
!331 = distinct !DILexicalBlock(scope: !192, file: !30, line: 277, column: 8)
!332 = !DILocation(line: 277, column: 8, scope: !192)
!333 = !DILocalVariable(name: "buffer", scope: !334, file: !30, line: 280, type: !134)
!334 = distinct !DILexicalBlock(scope: !335, file: !30, line: 279, column: 9)
!335 = distinct !DILexicalBlock(scope: !331, file: !30, line: 278, column: 5)
!336 = !DILocation(line: 280, column: 17, scope: !334)
!337 = !DILocation(line: 282, column: 17, scope: !338)
!338 = distinct !DILexicalBlock(scope: !334, file: !30, line: 282, column: 17)
!339 = !DILocation(line: 282, column: 22, scope: !338)
!340 = !DILocation(line: 282, column: 27, scope: !338)
!341 = !DILocation(line: 282, column: 30, scope: !338)
!342 = !DILocation(line: 282, column: 35, scope: !338)
!343 = !DILocation(line: 282, column: 17, scope: !334)
!344 = !DILocation(line: 284, column: 37, scope: !345)
!345 = distinct !DILexicalBlock(scope: !338, file: !30, line: 283, column: 13)
!346 = !DILocation(line: 284, column: 30, scope: !345)
!347 = !DILocation(line: 284, column: 17, scope: !345)
!348 = !DILocation(line: 285, column: 13, scope: !345)
!349 = !DILocation(line: 288, column: 17, scope: !350)
!350 = distinct !DILexicalBlock(scope: !338, file: !30, line: 287, column: 13)
!351 = !DILocation(line: 291, column: 5, scope: !335)
!352 = !DILocalVariable(name: "buffer", scope: !353, file: !30, line: 295, type: !134)
!353 = distinct !DILexicalBlock(scope: !354, file: !30, line: 294, column: 9)
!354 = distinct !DILexicalBlock(scope: !331, file: !30, line: 293, column: 5)
!355 = !DILocation(line: 295, column: 17, scope: !353)
!356 = !DILocation(line: 297, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !30, line: 297, column: 17)
!358 = !DILocation(line: 297, column: 22, scope: !357)
!359 = !DILocation(line: 297, column: 27, scope: !357)
!360 = !DILocation(line: 297, column: 30, scope: !357)
!361 = !DILocation(line: 297, column: 35, scope: !357)
!362 = !DILocation(line: 297, column: 17, scope: !353)
!363 = !DILocation(line: 299, column: 37, scope: !364)
!364 = distinct !DILexicalBlock(scope: !357, file: !30, line: 298, column: 13)
!365 = !DILocation(line: 299, column: 30, scope: !364)
!366 = !DILocation(line: 299, column: 17, scope: !364)
!367 = !DILocation(line: 300, column: 13, scope: !364)
!368 = !DILocation(line: 303, column: 17, scope: !369)
!369 = distinct !DILexicalBlock(scope: !357, file: !30, line: 302, column: 13)
!370 = !DILocation(line: 307, column: 1, scope: !192)
!371 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 312, type: !31, scopeLine: 313, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!372 = !DILocalVariable(name: "data", scope: !371, file: !30, line: 314, type: !35)
!373 = !DILocation(line: 314, column: 9, scope: !371)
!374 = !DILocation(line: 316, column: 10, scope: !371)
!375 = !DILocation(line: 317, column: 8, scope: !376)
!376 = distinct !DILexicalBlock(scope: !371, file: !30, line: 317, column: 8)
!377 = !DILocation(line: 317, column: 8, scope: !371)
!378 = !DILocation(line: 321, column: 14, scope: !379)
!379 = distinct !DILexicalBlock(scope: !376, file: !30, line: 318, column: 5)
!380 = !DILocation(line: 322, column: 5, scope: !379)
!381 = !DILocation(line: 327, column: 14, scope: !382)
!382 = distinct !DILexicalBlock(scope: !376, file: !30, line: 324, column: 5)
!383 = !DILocation(line: 329, column: 8, scope: !384)
!384 = distinct !DILexicalBlock(scope: !371, file: !30, line: 329, column: 8)
!385 = !DILocation(line: 329, column: 8, scope: !371)
!386 = !DILocalVariable(name: "buffer", scope: !387, file: !30, line: 332, type: !134)
!387 = distinct !DILexicalBlock(scope: !388, file: !30, line: 331, column: 9)
!388 = distinct !DILexicalBlock(scope: !384, file: !30, line: 330, column: 5)
!389 = !DILocation(line: 332, column: 17, scope: !387)
!390 = !DILocation(line: 335, column: 17, scope: !391)
!391 = distinct !DILexicalBlock(scope: !387, file: !30, line: 335, column: 17)
!392 = !DILocation(line: 335, column: 22, scope: !391)
!393 = !DILocation(line: 335, column: 17, scope: !387)
!394 = !DILocation(line: 337, column: 37, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !30, line: 336, column: 13)
!396 = !DILocation(line: 337, column: 30, scope: !395)
!397 = !DILocation(line: 337, column: 17, scope: !395)
!398 = !DILocation(line: 338, column: 13, scope: !395)
!399 = !DILocation(line: 341, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !391, file: !30, line: 340, column: 13)
!401 = !DILocation(line: 344, column: 5, scope: !388)
!402 = !DILocalVariable(name: "buffer", scope: !403, file: !30, line: 348, type: !134)
!403 = distinct !DILexicalBlock(scope: !404, file: !30, line: 347, column: 9)
!404 = distinct !DILexicalBlock(scope: !384, file: !30, line: 346, column: 5)
!405 = !DILocation(line: 348, column: 17, scope: !403)
!406 = !DILocation(line: 351, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !403, file: !30, line: 351, column: 17)
!408 = !DILocation(line: 351, column: 22, scope: !407)
!409 = !DILocation(line: 351, column: 17, scope: !403)
!410 = !DILocation(line: 353, column: 37, scope: !411)
!411 = distinct !DILexicalBlock(scope: !407, file: !30, line: 352, column: 13)
!412 = !DILocation(line: 353, column: 30, scope: !411)
!413 = !DILocation(line: 353, column: 17, scope: !411)
!414 = !DILocation(line: 354, column: 13, scope: !411)
!415 = !DILocation(line: 357, column: 17, scope: !416)
!416 = distinct !DILexicalBlock(scope: !407, file: !30, line: 356, column: 13)
!417 = !DILocation(line: 361, column: 1, scope: !371)
