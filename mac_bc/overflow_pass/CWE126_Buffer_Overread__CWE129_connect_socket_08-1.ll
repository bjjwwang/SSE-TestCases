; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_08_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  store i32 -1, i32* %data, align 4, !dbg !37
  %call = call i32 @staticReturnsTrue(), !dbg !38
  %tobool = icmp ne i32 %call, 0, !dbg !38
  br i1 %tobool, label %if.then, label %if.end22, !dbg !40

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

if.end22:                                         ; preds = %if.end21, %entry
  %call23 = call i32 @staticReturnsTrue(), !dbg !126
  %tobool24 = icmp ne i32 %call23, 0, !dbg !126
  br i1 %tobool24, label %if.then25, label %if.end32, !dbg !128

if.then25:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !129, metadata !DIExpression()), !dbg !135
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !135
  %11 = load i32, i32* %data, align 4, !dbg !136
  %cmp26 = icmp sge i32 %11, 0, !dbg !138
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !139

if.then28:                                        ; preds = %if.then25
  %12 = load i32, i32* %data, align 4, !dbg !140
  %idxprom29 = sext i32 %12 to i64, !dbg !142
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !142
  %13 = load i32, i32* %arrayidx30, align 4, !dbg !142
  call void @printIntLine(i32 noundef %13), !dbg !143
  br label %if.end31, !dbg !144

if.else:                                          ; preds = %if.then25
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !145
  br label %if.end31

if.end31:                                         ; preds = %if.else, %if.then28
  br label %if.end32, !dbg !147

if.end32:                                         ; preds = %if.end31, %if.end22
  ret void, !dbg !148
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

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_08_good() #0 !dbg !149 {
entry:
  call void @goodB2G1(), !dbg !150
  call void @goodB2G2(), !dbg !151
  call void @goodG2B1(), !dbg !152
  call void @goodG2B2(), !dbg !153
  ret void, !dbg !154
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !155 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !160, metadata !DIExpression()), !dbg !161
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !162, metadata !DIExpression()), !dbg !163
  %call = call i64 @time(i64* noundef null), !dbg !164
  %conv = trunc i64 %call to i32, !dbg !165
  call void @srand(i32 noundef %conv), !dbg !166
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !167
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_08_good(), !dbg !168
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !169
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !170
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_08_bad(), !dbg !171
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !172
  ret i32 0, !dbg !173
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !174 {
entry:
  ret i32 1, !dbg !177
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !178 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !179, metadata !DIExpression()), !dbg !180
  store i32 -1, i32* %data, align 4, !dbg !181
  %call = call i32 @staticReturnsTrue(), !dbg !182
  %tobool = icmp ne i32 %call, 0, !dbg !182
  br i1 %tobool, label %if.then, label %if.end22, !dbg !184

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !185, metadata !DIExpression()), !dbg !188
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !189, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !191, metadata !DIExpression()), !dbg !192
  store i32 -1, i32* %connectSocket, align 4, !dbg !192
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !193, metadata !DIExpression()), !dbg !194
  br label %do.body, !dbg !195

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !196
  store i32 %call1, i32* %connectSocket, align 4, !dbg !198
  %0 = load i32, i32* %connectSocket, align 4, !dbg !199
  %cmp = icmp eq i32 %0, -1, !dbg !201
  br i1 %cmp, label %if.then2, label %if.end, !dbg !202

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !203

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !205
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !205
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !206
  store i8 2, i8* %sin_family, align 1, !dbg !207
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !208
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !209
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !210
  store i32 %call3, i32* %s_addr, align 4, !dbg !211
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !212
  store i16 -30871, i16* %sin_port, align 2, !dbg !213
  %2 = load i32, i32* %connectSocket, align 4, !dbg !214
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !216
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !217
  %cmp5 = icmp eq i32 %call4, -1, !dbg !218
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !219

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !220

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !222
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !223
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !224
  %conv = trunc i64 %call8 to i32, !dbg !224
  store i32 %conv, i32* %recvResult, align 4, !dbg !225
  %5 = load i32, i32* %recvResult, align 4, !dbg !226
  %cmp9 = icmp eq i32 %5, -1, !dbg !228
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !229

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !230
  %cmp11 = icmp eq i32 %6, 0, !dbg !231
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !232

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !233

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !235
  %idxprom = sext i32 %7 to i64, !dbg !236
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !236
  store i8 0, i8* %arrayidx, align 1, !dbg !237
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !238
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !239
  store i32 %call16, i32* %data, align 4, !dbg !240
  br label %do.end, !dbg !241

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !242
  %cmp17 = icmp ne i32 %8, -1, !dbg !244
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !245

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !246
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !248
  br label %if.end21, !dbg !249

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !250

if.end22:                                         ; preds = %if.end21, %entry
  %call23 = call i32 @staticReturnsFalse(), !dbg !251
  %tobool24 = icmp ne i32 %call23, 0, !dbg !251
  br i1 %tobool24, label %if.then25, label %if.else, !dbg !253

if.then25:                                        ; preds = %if.end22
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !254
  br label %if.end35, !dbg !256

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !257, metadata !DIExpression()), !dbg !260
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !260
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !260
  %11 = load i32, i32* %data, align 4, !dbg !261
  %cmp26 = icmp sge i32 %11, 0, !dbg !263
  br i1 %cmp26, label %land.lhs.true, label %if.else33, !dbg !264

land.lhs.true:                                    ; preds = %if.else
  %12 = load i32, i32* %data, align 4, !dbg !265
  %cmp28 = icmp slt i32 %12, 10, !dbg !266
  br i1 %cmp28, label %if.then30, label %if.else33, !dbg !267

if.then30:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !268
  %idxprom31 = sext i32 %13 to i64, !dbg !270
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !270
  %14 = load i32, i32* %arrayidx32, align 4, !dbg !270
  call void @printIntLine(i32 noundef %14), !dbg !271
  br label %if.end34, !dbg !272

if.else33:                                        ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !273
  br label %if.end34

if.end34:                                         ; preds = %if.else33, %if.then30
  br label %if.end35

if.end35:                                         ; preds = %if.end34, %if.then25
  ret void, !dbg !275
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !276 {
entry:
  ret i32 0, !dbg !277
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !278 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !279, metadata !DIExpression()), !dbg !280
  store i32 -1, i32* %data, align 4, !dbg !281
  %call = call i32 @staticReturnsTrue(), !dbg !282
  %tobool = icmp ne i32 %call, 0, !dbg !282
  br i1 %tobool, label %if.then, label %if.end22, !dbg !284

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !285, metadata !DIExpression()), !dbg !288
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !289, metadata !DIExpression()), !dbg !290
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !291, metadata !DIExpression()), !dbg !292
  store i32 -1, i32* %connectSocket, align 4, !dbg !292
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !293, metadata !DIExpression()), !dbg !294
  br label %do.body, !dbg !295

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !296
  store i32 %call1, i32* %connectSocket, align 4, !dbg !298
  %0 = load i32, i32* %connectSocket, align 4, !dbg !299
  %cmp = icmp eq i32 %0, -1, !dbg !301
  br i1 %cmp, label %if.then2, label %if.end, !dbg !302

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !303

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !305
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !305
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !306
  store i8 2, i8* %sin_family, align 1, !dbg !307
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !308
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !309
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !310
  store i32 %call3, i32* %s_addr, align 4, !dbg !311
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !312
  store i16 -30871, i16* %sin_port, align 2, !dbg !313
  %2 = load i32, i32* %connectSocket, align 4, !dbg !314
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !316
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !317
  %cmp5 = icmp eq i32 %call4, -1, !dbg !318
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !319

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !320

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !322
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !323
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !324
  %conv = trunc i64 %call8 to i32, !dbg !324
  store i32 %conv, i32* %recvResult, align 4, !dbg !325
  %5 = load i32, i32* %recvResult, align 4, !dbg !326
  %cmp9 = icmp eq i32 %5, -1, !dbg !328
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !329

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !330
  %cmp11 = icmp eq i32 %6, 0, !dbg !331
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !332

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !333

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !335
  %idxprom = sext i32 %7 to i64, !dbg !336
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !336
  store i8 0, i8* %arrayidx, align 1, !dbg !337
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !338
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !339
  store i32 %call16, i32* %data, align 4, !dbg !340
  br label %do.end, !dbg !341

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !342
  %cmp17 = icmp ne i32 %8, -1, !dbg !344
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !345

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !346
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !348
  br label %if.end21, !dbg !349

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !350

if.end22:                                         ; preds = %if.end21, %entry
  %call23 = call i32 @staticReturnsTrue(), !dbg !351
  %tobool24 = icmp ne i32 %call23, 0, !dbg !351
  br i1 %tobool24, label %if.then25, label %if.end34, !dbg !353

if.then25:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !354, metadata !DIExpression()), !dbg !357
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !357
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !357
  %11 = load i32, i32* %data, align 4, !dbg !358
  %cmp26 = icmp sge i32 %11, 0, !dbg !360
  br i1 %cmp26, label %land.lhs.true, label %if.else, !dbg !361

land.lhs.true:                                    ; preds = %if.then25
  %12 = load i32, i32* %data, align 4, !dbg !362
  %cmp28 = icmp slt i32 %12, 10, !dbg !363
  br i1 %cmp28, label %if.then30, label %if.else, !dbg !364

if.then30:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !365
  %idxprom31 = sext i32 %13 to i64, !dbg !367
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !367
  %14 = load i32, i32* %arrayidx32, align 4, !dbg !367
  call void @printIntLine(i32 noundef %14), !dbg !368
  br label %if.end33, !dbg !369

if.else:                                          ; preds = %land.lhs.true, %if.then25
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !370
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.then30
  br label %if.end34, !dbg !372

if.end34:                                         ; preds = %if.end33, %if.end22
  ret void, !dbg !373
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !374 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !375, metadata !DIExpression()), !dbg !376
  store i32 -1, i32* %data, align 4, !dbg !377
  %call = call i32 @staticReturnsFalse(), !dbg !378
  %tobool = icmp ne i32 %call, 0, !dbg !378
  br i1 %tobool, label %if.then, label %if.else, !dbg !380

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !381
  br label %if.end, !dbg !383

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !384
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !386
  %tobool2 = icmp ne i32 %call1, 0, !dbg !386
  br i1 %tobool2, label %if.then3, label %if.end7, !dbg !388

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !389, metadata !DIExpression()), !dbg !392
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !392
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !392
  %1 = load i32, i32* %data, align 4, !dbg !393
  %cmp = icmp sge i32 %1, 0, !dbg !395
  br i1 %cmp, label %if.then4, label %if.else5, !dbg !396

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !397
  %idxprom = sext i32 %2 to i64, !dbg !399
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !399
  %3 = load i32, i32* %arrayidx, align 4, !dbg !399
  call void @printIntLine(i32 noundef %3), !dbg !400
  br label %if.end6, !dbg !401

if.else5:                                         ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !402
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !404

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !405
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !406 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !407, metadata !DIExpression()), !dbg !408
  store i32 -1, i32* %data, align 4, !dbg !409
  %call = call i32 @staticReturnsTrue(), !dbg !410
  %tobool = icmp ne i32 %call, 0, !dbg !410
  br i1 %tobool, label %if.then, label %if.end, !dbg !412

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !413
  br label %if.end, !dbg !415

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !416
  %tobool2 = icmp ne i32 %call1, 0, !dbg !416
  br i1 %tobool2, label %if.then3, label %if.end6, !dbg !418

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !419, metadata !DIExpression()), !dbg !422
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !422
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !422
  %1 = load i32, i32* %data, align 4, !dbg !423
  %cmp = icmp sge i32 %1, 0, !dbg !425
  br i1 %cmp, label %if.then4, label %if.else, !dbg !426

if.then4:                                         ; preds = %if.then3
  %2 = load i32, i32* %data, align 4, !dbg !427
  %idxprom = sext i32 %2 to i64, !dbg !429
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !429
  %3 = load i32, i32* %arrayidx, align 4, !dbg !429
  call void @printIntLine(i32 noundef %3), !dbg !430
  br label %if.end5, !dbg !431

if.else:                                          ; preds = %if.then3
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !432
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !434

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !435
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_08_bad", scope: !30, file: !30, line: 57, type: !31, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 59, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 59, column: 9, scope: !29)
!37 = !DILocation(line: 61, column: 10, scope: !29)
!38 = !DILocation(line: 62, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !30, line: 62, column: 8)
!40 = !DILocation(line: 62, column: 8, scope: !29)
!41 = !DILocalVariable(name: "recvResult", scope: !42, file: !30, line: 69, type: !35)
!42 = distinct !DILexicalBlock(scope: !43, file: !30, line: 64, column: 9)
!43 = distinct !DILexicalBlock(scope: !39, file: !30, line: 63, column: 5)
!44 = !DILocation(line: 69, column: 17, scope: !42)
!45 = !DILocalVariable(name: "service", scope: !42, file: !30, line: 70, type: !46)
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
!65 = !DILocation(line: 70, column: 32, scope: !42)
!66 = !DILocalVariable(name: "connectSocket", scope: !42, file: !30, line: 71, type: !35)
!67 = !DILocation(line: 71, column: 20, scope: !42)
!68 = !DILocalVariable(name: "inputBuffer", scope: !42, file: !30, line: 72, type: !17)
!69 = !DILocation(line: 72, column: 18, scope: !42)
!70 = !DILocation(line: 73, column: 13, scope: !42)
!71 = !DILocation(line: 83, column: 33, scope: !72)
!72 = distinct !DILexicalBlock(scope: !42, file: !30, line: 74, column: 13)
!73 = !DILocation(line: 83, column: 31, scope: !72)
!74 = !DILocation(line: 84, column: 21, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !30, line: 84, column: 21)
!76 = !DILocation(line: 84, column: 35, scope: !75)
!77 = !DILocation(line: 84, column: 21, scope: !72)
!78 = !DILocation(line: 86, column: 21, scope: !79)
!79 = distinct !DILexicalBlock(scope: !75, file: !30, line: 85, column: 17)
!80 = !DILocation(line: 88, column: 17, scope: !72)
!81 = !DILocation(line: 89, column: 25, scope: !72)
!82 = !DILocation(line: 89, column: 36, scope: !72)
!83 = !DILocation(line: 90, column: 43, scope: !72)
!84 = !DILocation(line: 90, column: 25, scope: !72)
!85 = !DILocation(line: 90, column: 34, scope: !72)
!86 = !DILocation(line: 90, column: 41, scope: !72)
!87 = !DILocation(line: 91, column: 25, scope: !72)
!88 = !DILocation(line: 91, column: 34, scope: !72)
!89 = !DILocation(line: 92, column: 29, scope: !90)
!90 = distinct !DILexicalBlock(scope: !72, file: !30, line: 92, column: 21)
!91 = !DILocation(line: 92, column: 44, scope: !90)
!92 = !DILocation(line: 92, column: 21, scope: !90)
!93 = !DILocation(line: 92, column: 89, scope: !90)
!94 = !DILocation(line: 92, column: 21, scope: !72)
!95 = !DILocation(line: 94, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !90, file: !30, line: 93, column: 17)
!97 = !DILocation(line: 98, column: 35, scope: !72)
!98 = !DILocation(line: 98, column: 50, scope: !72)
!99 = !DILocation(line: 98, column: 30, scope: !72)
!100 = !DILocation(line: 98, column: 28, scope: !72)
!101 = !DILocation(line: 99, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !72, file: !30, line: 99, column: 21)
!103 = !DILocation(line: 99, column: 32, scope: !102)
!104 = !DILocation(line: 99, column: 48, scope: !102)
!105 = !DILocation(line: 99, column: 51, scope: !102)
!106 = !DILocation(line: 99, column: 62, scope: !102)
!107 = !DILocation(line: 99, column: 21, scope: !72)
!108 = !DILocation(line: 101, column: 21, scope: !109)
!109 = distinct !DILexicalBlock(scope: !102, file: !30, line: 100, column: 17)
!110 = !DILocation(line: 104, column: 29, scope: !72)
!111 = !DILocation(line: 104, column: 17, scope: !72)
!112 = !DILocation(line: 104, column: 41, scope: !72)
!113 = !DILocation(line: 106, column: 29, scope: !72)
!114 = !DILocation(line: 106, column: 24, scope: !72)
!115 = !DILocation(line: 106, column: 22, scope: !72)
!116 = !DILocation(line: 107, column: 13, scope: !72)
!117 = !DILocation(line: 109, column: 17, scope: !118)
!118 = distinct !DILexicalBlock(scope: !42, file: !30, line: 109, column: 17)
!119 = !DILocation(line: 109, column: 31, scope: !118)
!120 = !DILocation(line: 109, column: 17, scope: !42)
!121 = !DILocation(line: 111, column: 30, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !30, line: 110, column: 13)
!123 = !DILocation(line: 111, column: 17, scope: !122)
!124 = !DILocation(line: 112, column: 13, scope: !122)
!125 = !DILocation(line: 120, column: 5, scope: !43)
!126 = !DILocation(line: 121, column: 8, scope: !127)
!127 = distinct !DILexicalBlock(scope: !29, file: !30, line: 121, column: 8)
!128 = !DILocation(line: 121, column: 8, scope: !29)
!129 = !DILocalVariable(name: "buffer", scope: !130, file: !30, line: 124, type: !132)
!130 = distinct !DILexicalBlock(scope: !131, file: !30, line: 123, column: 9)
!131 = distinct !DILexicalBlock(scope: !127, file: !30, line: 122, column: 5)
!132 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !133)
!133 = !{!134}
!134 = !DISubrange(count: 10)
!135 = !DILocation(line: 124, column: 17, scope: !130)
!136 = !DILocation(line: 127, column: 17, scope: !137)
!137 = distinct !DILexicalBlock(scope: !130, file: !30, line: 127, column: 17)
!138 = !DILocation(line: 127, column: 22, scope: !137)
!139 = !DILocation(line: 127, column: 17, scope: !130)
!140 = !DILocation(line: 129, column: 37, scope: !141)
!141 = distinct !DILexicalBlock(scope: !137, file: !30, line: 128, column: 13)
!142 = !DILocation(line: 129, column: 30, scope: !141)
!143 = !DILocation(line: 129, column: 17, scope: !141)
!144 = !DILocation(line: 130, column: 13, scope: !141)
!145 = !DILocation(line: 133, column: 17, scope: !146)
!146 = distinct !DILexicalBlock(scope: !137, file: !30, line: 132, column: 13)
!147 = !DILocation(line: 136, column: 5, scope: !131)
!148 = !DILocation(line: 137, column: 1, scope: !29)
!149 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_08_good", scope: !30, file: !30, line: 377, type: !31, scopeLine: 378, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!150 = !DILocation(line: 379, column: 5, scope: !149)
!151 = !DILocation(line: 380, column: 5, scope: !149)
!152 = !DILocation(line: 381, column: 5, scope: !149)
!153 = !DILocation(line: 382, column: 5, scope: !149)
!154 = !DILocation(line: 383, column: 1, scope: !149)
!155 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 394, type: !156, scopeLine: 395, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!156 = !DISubroutineType(types: !157)
!157 = !{!35, !35, !158}
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!160 = !DILocalVariable(name: "argc", arg: 1, scope: !155, file: !30, line: 394, type: !35)
!161 = !DILocation(line: 394, column: 14, scope: !155)
!162 = !DILocalVariable(name: "argv", arg: 2, scope: !155, file: !30, line: 394, type: !158)
!163 = !DILocation(line: 394, column: 27, scope: !155)
!164 = !DILocation(line: 397, column: 22, scope: !155)
!165 = !DILocation(line: 397, column: 12, scope: !155)
!166 = !DILocation(line: 397, column: 5, scope: !155)
!167 = !DILocation(line: 399, column: 5, scope: !155)
!168 = !DILocation(line: 400, column: 5, scope: !155)
!169 = !DILocation(line: 401, column: 5, scope: !155)
!170 = !DILocation(line: 404, column: 5, scope: !155)
!171 = !DILocation(line: 405, column: 5, scope: !155)
!172 = !DILocation(line: 406, column: 5, scope: !155)
!173 = !DILocation(line: 408, column: 5, scope: !155)
!174 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !30, file: !30, line: 45, type: !175, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!175 = !DISubroutineType(types: !176)
!176 = !{!35}
!177 = !DILocation(line: 47, column: 5, scope: !174)
!178 = distinct !DISubprogram(name: "goodB2G1", scope: !30, file: !30, line: 144, type: !31, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!179 = !DILocalVariable(name: "data", scope: !178, file: !30, line: 146, type: !35)
!180 = !DILocation(line: 146, column: 9, scope: !178)
!181 = !DILocation(line: 148, column: 10, scope: !178)
!182 = !DILocation(line: 149, column: 8, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !30, line: 149, column: 8)
!184 = !DILocation(line: 149, column: 8, scope: !178)
!185 = !DILocalVariable(name: "recvResult", scope: !186, file: !30, line: 156, type: !35)
!186 = distinct !DILexicalBlock(scope: !187, file: !30, line: 151, column: 9)
!187 = distinct !DILexicalBlock(scope: !183, file: !30, line: 150, column: 5)
!188 = !DILocation(line: 156, column: 17, scope: !186)
!189 = !DILocalVariable(name: "service", scope: !186, file: !30, line: 157, type: !46)
!190 = !DILocation(line: 157, column: 32, scope: !186)
!191 = !DILocalVariable(name: "connectSocket", scope: !186, file: !30, line: 158, type: !35)
!192 = !DILocation(line: 158, column: 20, scope: !186)
!193 = !DILocalVariable(name: "inputBuffer", scope: !186, file: !30, line: 159, type: !17)
!194 = !DILocation(line: 159, column: 18, scope: !186)
!195 = !DILocation(line: 160, column: 13, scope: !186)
!196 = !DILocation(line: 170, column: 33, scope: !197)
!197 = distinct !DILexicalBlock(scope: !186, file: !30, line: 161, column: 13)
!198 = !DILocation(line: 170, column: 31, scope: !197)
!199 = !DILocation(line: 171, column: 21, scope: !200)
!200 = distinct !DILexicalBlock(scope: !197, file: !30, line: 171, column: 21)
!201 = !DILocation(line: 171, column: 35, scope: !200)
!202 = !DILocation(line: 171, column: 21, scope: !197)
!203 = !DILocation(line: 173, column: 21, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !30, line: 172, column: 17)
!205 = !DILocation(line: 175, column: 17, scope: !197)
!206 = !DILocation(line: 176, column: 25, scope: !197)
!207 = !DILocation(line: 176, column: 36, scope: !197)
!208 = !DILocation(line: 177, column: 43, scope: !197)
!209 = !DILocation(line: 177, column: 25, scope: !197)
!210 = !DILocation(line: 177, column: 34, scope: !197)
!211 = !DILocation(line: 177, column: 41, scope: !197)
!212 = !DILocation(line: 178, column: 25, scope: !197)
!213 = !DILocation(line: 178, column: 34, scope: !197)
!214 = !DILocation(line: 179, column: 29, scope: !215)
!215 = distinct !DILexicalBlock(scope: !197, file: !30, line: 179, column: 21)
!216 = !DILocation(line: 179, column: 44, scope: !215)
!217 = !DILocation(line: 179, column: 21, scope: !215)
!218 = !DILocation(line: 179, column: 89, scope: !215)
!219 = !DILocation(line: 179, column: 21, scope: !197)
!220 = !DILocation(line: 181, column: 21, scope: !221)
!221 = distinct !DILexicalBlock(scope: !215, file: !30, line: 180, column: 17)
!222 = !DILocation(line: 185, column: 35, scope: !197)
!223 = !DILocation(line: 185, column: 50, scope: !197)
!224 = !DILocation(line: 185, column: 30, scope: !197)
!225 = !DILocation(line: 185, column: 28, scope: !197)
!226 = !DILocation(line: 186, column: 21, scope: !227)
!227 = distinct !DILexicalBlock(scope: !197, file: !30, line: 186, column: 21)
!228 = !DILocation(line: 186, column: 32, scope: !227)
!229 = !DILocation(line: 186, column: 48, scope: !227)
!230 = !DILocation(line: 186, column: 51, scope: !227)
!231 = !DILocation(line: 186, column: 62, scope: !227)
!232 = !DILocation(line: 186, column: 21, scope: !197)
!233 = !DILocation(line: 188, column: 21, scope: !234)
!234 = distinct !DILexicalBlock(scope: !227, file: !30, line: 187, column: 17)
!235 = !DILocation(line: 191, column: 29, scope: !197)
!236 = !DILocation(line: 191, column: 17, scope: !197)
!237 = !DILocation(line: 191, column: 41, scope: !197)
!238 = !DILocation(line: 193, column: 29, scope: !197)
!239 = !DILocation(line: 193, column: 24, scope: !197)
!240 = !DILocation(line: 193, column: 22, scope: !197)
!241 = !DILocation(line: 194, column: 13, scope: !197)
!242 = !DILocation(line: 196, column: 17, scope: !243)
!243 = distinct !DILexicalBlock(scope: !186, file: !30, line: 196, column: 17)
!244 = !DILocation(line: 196, column: 31, scope: !243)
!245 = !DILocation(line: 196, column: 17, scope: !186)
!246 = !DILocation(line: 198, column: 30, scope: !247)
!247 = distinct !DILexicalBlock(scope: !243, file: !30, line: 197, column: 13)
!248 = !DILocation(line: 198, column: 17, scope: !247)
!249 = !DILocation(line: 199, column: 13, scope: !247)
!250 = !DILocation(line: 207, column: 5, scope: !187)
!251 = !DILocation(line: 208, column: 8, scope: !252)
!252 = distinct !DILexicalBlock(scope: !178, file: !30, line: 208, column: 8)
!253 = !DILocation(line: 208, column: 8, scope: !178)
!254 = !DILocation(line: 211, column: 9, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !30, line: 209, column: 5)
!256 = !DILocation(line: 212, column: 5, scope: !255)
!257 = !DILocalVariable(name: "buffer", scope: !258, file: !30, line: 216, type: !132)
!258 = distinct !DILexicalBlock(scope: !259, file: !30, line: 215, column: 9)
!259 = distinct !DILexicalBlock(scope: !252, file: !30, line: 214, column: 5)
!260 = !DILocation(line: 216, column: 17, scope: !258)
!261 = !DILocation(line: 218, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !30, line: 218, column: 17)
!263 = !DILocation(line: 218, column: 22, scope: !262)
!264 = !DILocation(line: 218, column: 27, scope: !262)
!265 = !DILocation(line: 218, column: 30, scope: !262)
!266 = !DILocation(line: 218, column: 35, scope: !262)
!267 = !DILocation(line: 218, column: 17, scope: !258)
!268 = !DILocation(line: 220, column: 37, scope: !269)
!269 = distinct !DILexicalBlock(scope: !262, file: !30, line: 219, column: 13)
!270 = !DILocation(line: 220, column: 30, scope: !269)
!271 = !DILocation(line: 220, column: 17, scope: !269)
!272 = !DILocation(line: 221, column: 13, scope: !269)
!273 = !DILocation(line: 224, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !262, file: !30, line: 223, column: 13)
!275 = !DILocation(line: 228, column: 1, scope: !178)
!276 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !30, file: !30, line: 50, type: !175, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!277 = !DILocation(line: 52, column: 5, scope: !276)
!278 = distinct !DISubprogram(name: "goodB2G2", scope: !30, file: !30, line: 231, type: !31, scopeLine: 232, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!279 = !DILocalVariable(name: "data", scope: !278, file: !30, line: 233, type: !35)
!280 = !DILocation(line: 233, column: 9, scope: !278)
!281 = !DILocation(line: 235, column: 10, scope: !278)
!282 = !DILocation(line: 236, column: 8, scope: !283)
!283 = distinct !DILexicalBlock(scope: !278, file: !30, line: 236, column: 8)
!284 = !DILocation(line: 236, column: 8, scope: !278)
!285 = !DILocalVariable(name: "recvResult", scope: !286, file: !30, line: 243, type: !35)
!286 = distinct !DILexicalBlock(scope: !287, file: !30, line: 238, column: 9)
!287 = distinct !DILexicalBlock(scope: !283, file: !30, line: 237, column: 5)
!288 = !DILocation(line: 243, column: 17, scope: !286)
!289 = !DILocalVariable(name: "service", scope: !286, file: !30, line: 244, type: !46)
!290 = !DILocation(line: 244, column: 32, scope: !286)
!291 = !DILocalVariable(name: "connectSocket", scope: !286, file: !30, line: 245, type: !35)
!292 = !DILocation(line: 245, column: 20, scope: !286)
!293 = !DILocalVariable(name: "inputBuffer", scope: !286, file: !30, line: 246, type: !17)
!294 = !DILocation(line: 246, column: 18, scope: !286)
!295 = !DILocation(line: 247, column: 13, scope: !286)
!296 = !DILocation(line: 257, column: 33, scope: !297)
!297 = distinct !DILexicalBlock(scope: !286, file: !30, line: 248, column: 13)
!298 = !DILocation(line: 257, column: 31, scope: !297)
!299 = !DILocation(line: 258, column: 21, scope: !300)
!300 = distinct !DILexicalBlock(scope: !297, file: !30, line: 258, column: 21)
!301 = !DILocation(line: 258, column: 35, scope: !300)
!302 = !DILocation(line: 258, column: 21, scope: !297)
!303 = !DILocation(line: 260, column: 21, scope: !304)
!304 = distinct !DILexicalBlock(scope: !300, file: !30, line: 259, column: 17)
!305 = !DILocation(line: 262, column: 17, scope: !297)
!306 = !DILocation(line: 263, column: 25, scope: !297)
!307 = !DILocation(line: 263, column: 36, scope: !297)
!308 = !DILocation(line: 264, column: 43, scope: !297)
!309 = !DILocation(line: 264, column: 25, scope: !297)
!310 = !DILocation(line: 264, column: 34, scope: !297)
!311 = !DILocation(line: 264, column: 41, scope: !297)
!312 = !DILocation(line: 265, column: 25, scope: !297)
!313 = !DILocation(line: 265, column: 34, scope: !297)
!314 = !DILocation(line: 266, column: 29, scope: !315)
!315 = distinct !DILexicalBlock(scope: !297, file: !30, line: 266, column: 21)
!316 = !DILocation(line: 266, column: 44, scope: !315)
!317 = !DILocation(line: 266, column: 21, scope: !315)
!318 = !DILocation(line: 266, column: 89, scope: !315)
!319 = !DILocation(line: 266, column: 21, scope: !297)
!320 = !DILocation(line: 268, column: 21, scope: !321)
!321 = distinct !DILexicalBlock(scope: !315, file: !30, line: 267, column: 17)
!322 = !DILocation(line: 272, column: 35, scope: !297)
!323 = !DILocation(line: 272, column: 50, scope: !297)
!324 = !DILocation(line: 272, column: 30, scope: !297)
!325 = !DILocation(line: 272, column: 28, scope: !297)
!326 = !DILocation(line: 273, column: 21, scope: !327)
!327 = distinct !DILexicalBlock(scope: !297, file: !30, line: 273, column: 21)
!328 = !DILocation(line: 273, column: 32, scope: !327)
!329 = !DILocation(line: 273, column: 48, scope: !327)
!330 = !DILocation(line: 273, column: 51, scope: !327)
!331 = !DILocation(line: 273, column: 62, scope: !327)
!332 = !DILocation(line: 273, column: 21, scope: !297)
!333 = !DILocation(line: 275, column: 21, scope: !334)
!334 = distinct !DILexicalBlock(scope: !327, file: !30, line: 274, column: 17)
!335 = !DILocation(line: 278, column: 29, scope: !297)
!336 = !DILocation(line: 278, column: 17, scope: !297)
!337 = !DILocation(line: 278, column: 41, scope: !297)
!338 = !DILocation(line: 280, column: 29, scope: !297)
!339 = !DILocation(line: 280, column: 24, scope: !297)
!340 = !DILocation(line: 280, column: 22, scope: !297)
!341 = !DILocation(line: 281, column: 13, scope: !297)
!342 = !DILocation(line: 283, column: 17, scope: !343)
!343 = distinct !DILexicalBlock(scope: !286, file: !30, line: 283, column: 17)
!344 = !DILocation(line: 283, column: 31, scope: !343)
!345 = !DILocation(line: 283, column: 17, scope: !286)
!346 = !DILocation(line: 285, column: 30, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !30, line: 284, column: 13)
!348 = !DILocation(line: 285, column: 17, scope: !347)
!349 = !DILocation(line: 286, column: 13, scope: !347)
!350 = !DILocation(line: 294, column: 5, scope: !287)
!351 = !DILocation(line: 295, column: 8, scope: !352)
!352 = distinct !DILexicalBlock(scope: !278, file: !30, line: 295, column: 8)
!353 = !DILocation(line: 295, column: 8, scope: !278)
!354 = !DILocalVariable(name: "buffer", scope: !355, file: !30, line: 298, type: !132)
!355 = distinct !DILexicalBlock(scope: !356, file: !30, line: 297, column: 9)
!356 = distinct !DILexicalBlock(scope: !352, file: !30, line: 296, column: 5)
!357 = !DILocation(line: 298, column: 17, scope: !355)
!358 = !DILocation(line: 300, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !30, line: 300, column: 17)
!360 = !DILocation(line: 300, column: 22, scope: !359)
!361 = !DILocation(line: 300, column: 27, scope: !359)
!362 = !DILocation(line: 300, column: 30, scope: !359)
!363 = !DILocation(line: 300, column: 35, scope: !359)
!364 = !DILocation(line: 300, column: 17, scope: !355)
!365 = !DILocation(line: 302, column: 37, scope: !366)
!366 = distinct !DILexicalBlock(scope: !359, file: !30, line: 301, column: 13)
!367 = !DILocation(line: 302, column: 30, scope: !366)
!368 = !DILocation(line: 302, column: 17, scope: !366)
!369 = !DILocation(line: 303, column: 13, scope: !366)
!370 = !DILocation(line: 306, column: 17, scope: !371)
!371 = distinct !DILexicalBlock(scope: !359, file: !30, line: 305, column: 13)
!372 = !DILocation(line: 309, column: 5, scope: !356)
!373 = !DILocation(line: 310, column: 1, scope: !278)
!374 = distinct !DISubprogram(name: "goodG2B1", scope: !30, file: !30, line: 313, type: !31, scopeLine: 314, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!375 = !DILocalVariable(name: "data", scope: !374, file: !30, line: 315, type: !35)
!376 = !DILocation(line: 315, column: 9, scope: !374)
!377 = !DILocation(line: 317, column: 10, scope: !374)
!378 = !DILocation(line: 318, column: 8, scope: !379)
!379 = distinct !DILexicalBlock(scope: !374, file: !30, line: 318, column: 8)
!380 = !DILocation(line: 318, column: 8, scope: !374)
!381 = !DILocation(line: 321, column: 9, scope: !382)
!382 = distinct !DILexicalBlock(scope: !379, file: !30, line: 319, column: 5)
!383 = !DILocation(line: 322, column: 5, scope: !382)
!384 = !DILocation(line: 327, column: 14, scope: !385)
!385 = distinct !DILexicalBlock(scope: !379, file: !30, line: 324, column: 5)
!386 = !DILocation(line: 329, column: 8, scope: !387)
!387 = distinct !DILexicalBlock(scope: !374, file: !30, line: 329, column: 8)
!388 = !DILocation(line: 329, column: 8, scope: !374)
!389 = !DILocalVariable(name: "buffer", scope: !390, file: !30, line: 332, type: !132)
!390 = distinct !DILexicalBlock(scope: !391, file: !30, line: 331, column: 9)
!391 = distinct !DILexicalBlock(scope: !387, file: !30, line: 330, column: 5)
!392 = !DILocation(line: 332, column: 17, scope: !390)
!393 = !DILocation(line: 335, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !30, line: 335, column: 17)
!395 = !DILocation(line: 335, column: 22, scope: !394)
!396 = !DILocation(line: 335, column: 17, scope: !390)
!397 = !DILocation(line: 337, column: 37, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !30, line: 336, column: 13)
!399 = !DILocation(line: 337, column: 30, scope: !398)
!400 = !DILocation(line: 337, column: 17, scope: !398)
!401 = !DILocation(line: 338, column: 13, scope: !398)
!402 = !DILocation(line: 341, column: 17, scope: !403)
!403 = distinct !DILexicalBlock(scope: !394, file: !30, line: 340, column: 13)
!404 = !DILocation(line: 344, column: 5, scope: !391)
!405 = !DILocation(line: 345, column: 1, scope: !374)
!406 = distinct !DISubprogram(name: "goodG2B2", scope: !30, file: !30, line: 348, type: !31, scopeLine: 349, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!407 = !DILocalVariable(name: "data", scope: !406, file: !30, line: 350, type: !35)
!408 = !DILocation(line: 350, column: 9, scope: !406)
!409 = !DILocation(line: 352, column: 10, scope: !406)
!410 = !DILocation(line: 353, column: 8, scope: !411)
!411 = distinct !DILexicalBlock(scope: !406, file: !30, line: 353, column: 8)
!412 = !DILocation(line: 353, column: 8, scope: !406)
!413 = !DILocation(line: 357, column: 14, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !30, line: 354, column: 5)
!415 = !DILocation(line: 358, column: 5, scope: !414)
!416 = !DILocation(line: 359, column: 8, scope: !417)
!417 = distinct !DILexicalBlock(scope: !406, file: !30, line: 359, column: 8)
!418 = !DILocation(line: 359, column: 8, scope: !406)
!419 = !DILocalVariable(name: "buffer", scope: !420, file: !30, line: 362, type: !132)
!420 = distinct !DILexicalBlock(scope: !421, file: !30, line: 361, column: 9)
!421 = distinct !DILexicalBlock(scope: !417, file: !30, line: 360, column: 5)
!422 = !DILocation(line: 362, column: 17, scope: !420)
!423 = !DILocation(line: 365, column: 17, scope: !424)
!424 = distinct !DILexicalBlock(scope: !420, file: !30, line: 365, column: 17)
!425 = !DILocation(line: 365, column: 22, scope: !424)
!426 = !DILocation(line: 365, column: 17, scope: !420)
!427 = !DILocation(line: 367, column: 37, scope: !428)
!428 = distinct !DILexicalBlock(scope: !424, file: !30, line: 366, column: 13)
!429 = !DILocation(line: 367, column: 30, scope: !428)
!430 = !DILocation(line: 367, column: 17, scope: !428)
!431 = !DILocation(line: 368, column: 13, scope: !428)
!432 = !DILocation(line: 371, column: 17, scope: !433)
!433 = distinct !DILexicalBlock(scope: !424, file: !30, line: 370, column: 13)
!434 = !DILocation(line: 374, column: 5, scope: !421)
!435 = !DILocation(line: 375, column: 1, scope: !406)
