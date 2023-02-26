; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_14_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  store i32 -1, i32* %data, align 4, !dbg !37
  %0 = load i32, i32* @globalFive, align 4, !dbg !38
  %cmp = icmp eq i32 %0, 5, !dbg !40
  br i1 %cmp, label %if.then, label %if.end22, !dbg !41

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !42, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !46, metadata !DIExpression()), !dbg !66
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !67, metadata !DIExpression()), !dbg !68
  store i32 -1, i32* %connectSocket, align 4, !dbg !68
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !69, metadata !DIExpression()), !dbg !70
  br label %do.body, !dbg !71

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !72
  store i32 %call, i32* %connectSocket, align 4, !dbg !74
  %1 = load i32, i32* %connectSocket, align 4, !dbg !75
  %cmp1 = icmp eq i32 %1, -1, !dbg !77
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !78

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !79

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !81
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !81
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !82
  store i8 2, i8* %sin_family, align 1, !dbg !83
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !84
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !85
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !86
  store i32 %call3, i32* %s_addr, align 4, !dbg !87
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !88
  store i16 -30871, i16* %sin_port, align 2, !dbg !89
  %3 = load i32, i32* %connectSocket, align 4, !dbg !90
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !92
  %call4 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !93
  %cmp5 = icmp eq i32 %call4, -1, !dbg !94
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !95

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !96

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !98
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !99
  %call8 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !100
  %conv = trunc i64 %call8 to i32, !dbg !100
  store i32 %conv, i32* %recvResult, align 4, !dbg !101
  %6 = load i32, i32* %recvResult, align 4, !dbg !102
  %cmp9 = icmp eq i32 %6, -1, !dbg !104
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !105

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !106
  %cmp11 = icmp eq i32 %7, 0, !dbg !107
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !108

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !109

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !111
  %idxprom = sext i32 %8 to i64, !dbg !112
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !112
  store i8 0, i8* %arrayidx, align 1, !dbg !113
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !114
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !115
  store i32 %call16, i32* %data, align 4, !dbg !116
  br label %do.end, !dbg !117

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !118
  %cmp17 = icmp ne i32 %9, -1, !dbg !120
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !121

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !122
  %call20 = call i32 @"\01_close"(i32 noundef %10), !dbg !124
  br label %if.end21, !dbg !125

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !126

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @globalFive, align 4, !dbg !127
  %cmp23 = icmp eq i32 %11, 5, !dbg !129
  br i1 %cmp23, label %if.then25, label %if.end32, !dbg !130

if.then25:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !131, metadata !DIExpression()), !dbg !137
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !137
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !137
  %13 = load i32, i32* %data, align 4, !dbg !138
  %cmp26 = icmp sge i32 %13, 0, !dbg !140
  br i1 %cmp26, label %if.then28, label %if.else, !dbg !141

if.then28:                                        ; preds = %if.then25
  %14 = load i32, i32* %data, align 4, !dbg !142
  %idxprom29 = sext i32 %14 to i64, !dbg !144
  %arrayidx30 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom29, !dbg !144
  %15 = load i32, i32* %arrayidx30, align 4, !dbg !144
  call void @printIntLine(i32 noundef %15), !dbg !145
  br label %if.end31, !dbg !146

if.else:                                          ; preds = %if.then25
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !147
  br label %if.end31

if.end31:                                         ; preds = %if.else, %if.then28
  br label %if.end32, !dbg !149

if.end32:                                         ; preds = %if.end31, %if.end22
  ret void, !dbg !150
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
define void @CWE126_Buffer_Overread__CWE129_connect_socket_14_good() #0 !dbg !151 {
entry:
  call void @goodB2G1(), !dbg !152
  call void @goodB2G2(), !dbg !153
  call void @goodG2B1(), !dbg !154
  call void @goodG2B2(), !dbg !155
  ret void, !dbg !156
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !157 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !162, metadata !DIExpression()), !dbg !163
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !164, metadata !DIExpression()), !dbg !165
  %call = call i64 @time(i64* noundef null), !dbg !166
  %conv = trunc i64 %call to i32, !dbg !167
  call void @srand(i32 noundef %conv), !dbg !168
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !169
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_14_good(), !dbg !170
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !171
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !172
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_14_bad(), !dbg !173
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !174
  ret i32 0, !dbg !175
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !176 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !177, metadata !DIExpression()), !dbg !178
  store i32 -1, i32* %data, align 4, !dbg !179
  %0 = load i32, i32* @globalFive, align 4, !dbg !180
  %cmp = icmp eq i32 %0, 5, !dbg !182
  br i1 %cmp, label %if.then, label %if.end22, !dbg !183

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !184, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !188, metadata !DIExpression()), !dbg !189
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 -1, i32* %connectSocket, align 4, !dbg !191
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !192, metadata !DIExpression()), !dbg !193
  br label %do.body, !dbg !194

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !195
  store i32 %call, i32* %connectSocket, align 4, !dbg !197
  %1 = load i32, i32* %connectSocket, align 4, !dbg !198
  %cmp1 = icmp eq i32 %1, -1, !dbg !200
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !201

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !202

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !204
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !204
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !205
  store i8 2, i8* %sin_family, align 1, !dbg !206
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !207
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !208
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !209
  store i32 %call3, i32* %s_addr, align 4, !dbg !210
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !211
  store i16 -30871, i16* %sin_port, align 2, !dbg !212
  %3 = load i32, i32* %connectSocket, align 4, !dbg !213
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !215
  %call4 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !216
  %cmp5 = icmp eq i32 %call4, -1, !dbg !217
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !218

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !219

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !221
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !222
  %call8 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !223
  %conv = trunc i64 %call8 to i32, !dbg !223
  store i32 %conv, i32* %recvResult, align 4, !dbg !224
  %6 = load i32, i32* %recvResult, align 4, !dbg !225
  %cmp9 = icmp eq i32 %6, -1, !dbg !227
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !228

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !229
  %cmp11 = icmp eq i32 %7, 0, !dbg !230
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !231

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !232

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !234
  %idxprom = sext i32 %8 to i64, !dbg !235
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !235
  store i8 0, i8* %arrayidx, align 1, !dbg !236
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !237
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !238
  store i32 %call16, i32* %data, align 4, !dbg !239
  br label %do.end, !dbg !240

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !241
  %cmp17 = icmp ne i32 %9, -1, !dbg !243
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !244

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !245
  %call20 = call i32 @"\01_close"(i32 noundef %10), !dbg !247
  br label %if.end21, !dbg !248

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !249

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @globalFive, align 4, !dbg !250
  %cmp23 = icmp ne i32 %11, 5, !dbg !252
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !253

if.then25:                                        ; preds = %if.end22
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !254
  br label %if.end35, !dbg !256

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !257, metadata !DIExpression()), !dbg !260
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !260
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !260
  %13 = load i32, i32* %data, align 4, !dbg !261
  %cmp26 = icmp sge i32 %13, 0, !dbg !263
  br i1 %cmp26, label %land.lhs.true, label %if.else33, !dbg !264

land.lhs.true:                                    ; preds = %if.else
  %14 = load i32, i32* %data, align 4, !dbg !265
  %cmp28 = icmp slt i32 %14, 10, !dbg !266
  br i1 %cmp28, label %if.then30, label %if.else33, !dbg !267

if.then30:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !268
  %idxprom31 = sext i32 %15 to i64, !dbg !270
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !270
  %16 = load i32, i32* %arrayidx32, align 4, !dbg !270
  call void @printIntLine(i32 noundef %16), !dbg !271
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
define internal void @goodB2G2() #0 !dbg !276 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !277, metadata !DIExpression()), !dbg !278
  store i32 -1, i32* %data, align 4, !dbg !279
  %0 = load i32, i32* @globalFive, align 4, !dbg !280
  %cmp = icmp eq i32 %0, 5, !dbg !282
  br i1 %cmp, label %if.then, label %if.end22, !dbg !283

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !284, metadata !DIExpression()), !dbg !287
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !288, metadata !DIExpression()), !dbg !289
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !290, metadata !DIExpression()), !dbg !291
  store i32 -1, i32* %connectSocket, align 4, !dbg !291
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !292, metadata !DIExpression()), !dbg !293
  br label %do.body, !dbg !294

do.body:                                          ; preds = %if.then
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !295
  store i32 %call, i32* %connectSocket, align 4, !dbg !297
  %1 = load i32, i32* %connectSocket, align 4, !dbg !298
  %cmp1 = icmp eq i32 %1, -1, !dbg !300
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !301

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !302

if.end:                                           ; preds = %do.body
  %2 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !304
  call void @llvm.memset.p0i8.i64(i8* align 4 %2, i8 0, i64 16, i1 false), !dbg !304
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !305
  store i8 2, i8* %sin_family, align 1, !dbg !306
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !307
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !308
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !309
  store i32 %call3, i32* %s_addr, align 4, !dbg !310
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !311
  store i16 -30871, i16* %sin_port, align 2, !dbg !312
  %3 = load i32, i32* %connectSocket, align 4, !dbg !313
  %4 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !315
  %call4 = call i32 @"\01_connect"(i32 noundef %3, %struct.sockaddr* noundef %4, i32 noundef 16), !dbg !316
  %cmp5 = icmp eq i32 %call4, -1, !dbg !317
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !318

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !319

if.end7:                                          ; preds = %if.end
  %5 = load i32, i32* %connectSocket, align 4, !dbg !321
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !322
  %call8 = call i64 @"\01_recv"(i32 noundef %5, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !323
  %conv = trunc i64 %call8 to i32, !dbg !323
  store i32 %conv, i32* %recvResult, align 4, !dbg !324
  %6 = load i32, i32* %recvResult, align 4, !dbg !325
  %cmp9 = icmp eq i32 %6, -1, !dbg !327
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !328

lor.lhs.false:                                    ; preds = %if.end7
  %7 = load i32, i32* %recvResult, align 4, !dbg !329
  %cmp11 = icmp eq i32 %7, 0, !dbg !330
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !331

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !332

if.end14:                                         ; preds = %lor.lhs.false
  %8 = load i32, i32* %recvResult, align 4, !dbg !334
  %idxprom = sext i32 %8 to i64, !dbg !335
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !335
  store i8 0, i8* %arrayidx, align 1, !dbg !336
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !337
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !338
  store i32 %call16, i32* %data, align 4, !dbg !339
  br label %do.end, !dbg !340

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %9 = load i32, i32* %connectSocket, align 4, !dbg !341
  %cmp17 = icmp ne i32 %9, -1, !dbg !343
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !344

if.then19:                                        ; preds = %do.end
  %10 = load i32, i32* %connectSocket, align 4, !dbg !345
  %call20 = call i32 @"\01_close"(i32 noundef %10), !dbg !347
  br label %if.end21, !dbg !348

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !349

if.end22:                                         ; preds = %if.end21, %entry
  %11 = load i32, i32* @globalFive, align 4, !dbg !350
  %cmp23 = icmp eq i32 %11, 5, !dbg !352
  br i1 %cmp23, label %if.then25, label %if.end34, !dbg !353

if.then25:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !354, metadata !DIExpression()), !dbg !357
  %12 = bitcast [10 x i32]* %buffer to i8*, !dbg !357
  call void @llvm.memset.p0i8.i64(i8* align 16 %12, i8 0, i64 40, i1 false), !dbg !357
  %13 = load i32, i32* %data, align 4, !dbg !358
  %cmp26 = icmp sge i32 %13, 0, !dbg !360
  br i1 %cmp26, label %land.lhs.true, label %if.else, !dbg !361

land.lhs.true:                                    ; preds = %if.then25
  %14 = load i32, i32* %data, align 4, !dbg !362
  %cmp28 = icmp slt i32 %14, 10, !dbg !363
  br i1 %cmp28, label %if.then30, label %if.else, !dbg !364

if.then30:                                        ; preds = %land.lhs.true
  %15 = load i32, i32* %data, align 4, !dbg !365
  %idxprom31 = sext i32 %15 to i64, !dbg !367
  %arrayidx32 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom31, !dbg !367
  %16 = load i32, i32* %arrayidx32, align 4, !dbg !367
  call void @printIntLine(i32 noundef %16), !dbg !368
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !378
  %cmp = icmp ne i32 %0, 5, !dbg !380
  br i1 %cmp, label %if.then, label %if.else, !dbg !381

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !382
  br label %if.end, !dbg !384

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !385
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @globalFive, align 4, !dbg !387
  %cmp1 = icmp eq i32 %1, 5, !dbg !389
  br i1 %cmp1, label %if.then2, label %if.end7, !dbg !390

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !391, metadata !DIExpression()), !dbg !394
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !394
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !394
  %3 = load i32, i32* %data, align 4, !dbg !395
  %cmp3 = icmp sge i32 %3, 0, !dbg !397
  br i1 %cmp3, label %if.then4, label %if.else5, !dbg !398

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !399
  %idxprom = sext i32 %4 to i64, !dbg !401
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !401
  %5 = load i32, i32* %arrayidx, align 4, !dbg !401
  call void @printIntLine(i32 noundef %5), !dbg !402
  br label %if.end6, !dbg !403

if.else5:                                         ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !404
  br label %if.end6

if.end6:                                          ; preds = %if.else5, %if.then4
  br label %if.end7, !dbg !406

if.end7:                                          ; preds = %if.end6, %if.end
  ret void, !dbg !407
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !408 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !409, metadata !DIExpression()), !dbg !410
  store i32 -1, i32* %data, align 4, !dbg !411
  %0 = load i32, i32* @globalFive, align 4, !dbg !412
  %cmp = icmp eq i32 %0, 5, !dbg !414
  br i1 %cmp, label %if.then, label %if.end, !dbg !415

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !416
  br label %if.end, !dbg !418

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @globalFive, align 4, !dbg !419
  %cmp1 = icmp eq i32 %1, 5, !dbg !421
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !422

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !423, metadata !DIExpression()), !dbg !426
  %2 = bitcast [10 x i32]* %buffer to i8*, !dbg !426
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 40, i1 false), !dbg !426
  %3 = load i32, i32* %data, align 4, !dbg !427
  %cmp3 = icmp sge i32 %3, 0, !dbg !429
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !430

if.then4:                                         ; preds = %if.then2
  %4 = load i32, i32* %data, align 4, !dbg !431
  %idxprom = sext i32 %4 to i64, !dbg !433
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !433
  %5 = load i32, i32* %arrayidx, align 4, !dbg !433
  call void @printIntLine(i32 noundef %5), !dbg !434
  br label %if.end5, !dbg !435

if.else:                                          ; preds = %if.then2
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !436
  br label %if.end5

if.end5:                                          ; preds = %if.else, %if.then4
  br label %if.end6, !dbg !438

if.end6:                                          ; preds = %if.end5, %if.end
  ret void, !dbg !439
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_14_bad", scope: !30, file: !30, line: 44, type: !31, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 46, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 46, column: 9, scope: !29)
!37 = !DILocation(line: 48, column: 10, scope: !29)
!38 = !DILocation(line: 49, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !29, file: !30, line: 49, column: 8)
!40 = !DILocation(line: 49, column: 18, scope: !39)
!41 = !DILocation(line: 49, column: 8, scope: !29)
!42 = !DILocalVariable(name: "recvResult", scope: !43, file: !30, line: 56, type: !35)
!43 = distinct !DILexicalBlock(scope: !44, file: !30, line: 51, column: 9)
!44 = distinct !DILexicalBlock(scope: !39, file: !30, line: 50, column: 5)
!45 = !DILocation(line: 56, column: 17, scope: !43)
!46 = !DILocalVariable(name: "service", scope: !43, file: !30, line: 57, type: !47)
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !48, line: 375, size: 128, elements: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!49 = !{!50, !51, !52, !55, !62}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !47, file: !48, line: 376, baseType: !11, size: 8)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !47, file: !48, line: 377, baseType: !14, size: 8, offset: 8)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !47, file: !48, line: 378, baseType: !53, size: 16, offset: 16)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !54, line: 31, baseType: !3)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !47, file: !48, line: 379, baseType: !56, size: 32, offset: 32)
!56 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !48, line: 301, size: 32, elements: !57)
!57 = !{!58}
!58 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !56, file: !48, line: 302, baseType: !59, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !60, line: 31, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !47, file: !48, line: 380, baseType: !63, size: 64, offset: 64)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 8)
!66 = !DILocation(line: 57, column: 32, scope: !43)
!67 = !DILocalVariable(name: "connectSocket", scope: !43, file: !30, line: 58, type: !35)
!68 = !DILocation(line: 58, column: 20, scope: !43)
!69 = !DILocalVariable(name: "inputBuffer", scope: !43, file: !30, line: 59, type: !17)
!70 = !DILocation(line: 59, column: 18, scope: !43)
!71 = !DILocation(line: 60, column: 13, scope: !43)
!72 = !DILocation(line: 70, column: 33, scope: !73)
!73 = distinct !DILexicalBlock(scope: !43, file: !30, line: 61, column: 13)
!74 = !DILocation(line: 70, column: 31, scope: !73)
!75 = !DILocation(line: 71, column: 21, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !30, line: 71, column: 21)
!77 = !DILocation(line: 71, column: 35, scope: !76)
!78 = !DILocation(line: 71, column: 21, scope: !73)
!79 = !DILocation(line: 73, column: 21, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !30, line: 72, column: 17)
!81 = !DILocation(line: 75, column: 17, scope: !73)
!82 = !DILocation(line: 76, column: 25, scope: !73)
!83 = !DILocation(line: 76, column: 36, scope: !73)
!84 = !DILocation(line: 77, column: 43, scope: !73)
!85 = !DILocation(line: 77, column: 25, scope: !73)
!86 = !DILocation(line: 77, column: 34, scope: !73)
!87 = !DILocation(line: 77, column: 41, scope: !73)
!88 = !DILocation(line: 78, column: 25, scope: !73)
!89 = !DILocation(line: 78, column: 34, scope: !73)
!90 = !DILocation(line: 79, column: 29, scope: !91)
!91 = distinct !DILexicalBlock(scope: !73, file: !30, line: 79, column: 21)
!92 = !DILocation(line: 79, column: 44, scope: !91)
!93 = !DILocation(line: 79, column: 21, scope: !91)
!94 = !DILocation(line: 79, column: 89, scope: !91)
!95 = !DILocation(line: 79, column: 21, scope: !73)
!96 = !DILocation(line: 81, column: 21, scope: !97)
!97 = distinct !DILexicalBlock(scope: !91, file: !30, line: 80, column: 17)
!98 = !DILocation(line: 85, column: 35, scope: !73)
!99 = !DILocation(line: 85, column: 50, scope: !73)
!100 = !DILocation(line: 85, column: 30, scope: !73)
!101 = !DILocation(line: 85, column: 28, scope: !73)
!102 = !DILocation(line: 86, column: 21, scope: !103)
!103 = distinct !DILexicalBlock(scope: !73, file: !30, line: 86, column: 21)
!104 = !DILocation(line: 86, column: 32, scope: !103)
!105 = !DILocation(line: 86, column: 48, scope: !103)
!106 = !DILocation(line: 86, column: 51, scope: !103)
!107 = !DILocation(line: 86, column: 62, scope: !103)
!108 = !DILocation(line: 86, column: 21, scope: !73)
!109 = !DILocation(line: 88, column: 21, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !30, line: 87, column: 17)
!111 = !DILocation(line: 91, column: 29, scope: !73)
!112 = !DILocation(line: 91, column: 17, scope: !73)
!113 = !DILocation(line: 91, column: 41, scope: !73)
!114 = !DILocation(line: 93, column: 29, scope: !73)
!115 = !DILocation(line: 93, column: 24, scope: !73)
!116 = !DILocation(line: 93, column: 22, scope: !73)
!117 = !DILocation(line: 94, column: 13, scope: !73)
!118 = !DILocation(line: 96, column: 17, scope: !119)
!119 = distinct !DILexicalBlock(scope: !43, file: !30, line: 96, column: 17)
!120 = !DILocation(line: 96, column: 31, scope: !119)
!121 = !DILocation(line: 96, column: 17, scope: !43)
!122 = !DILocation(line: 98, column: 30, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !30, line: 97, column: 13)
!124 = !DILocation(line: 98, column: 17, scope: !123)
!125 = !DILocation(line: 99, column: 13, scope: !123)
!126 = !DILocation(line: 107, column: 5, scope: !44)
!127 = !DILocation(line: 108, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !29, file: !30, line: 108, column: 8)
!129 = !DILocation(line: 108, column: 18, scope: !128)
!130 = !DILocation(line: 108, column: 8, scope: !29)
!131 = !DILocalVariable(name: "buffer", scope: !132, file: !30, line: 111, type: !134)
!132 = distinct !DILexicalBlock(scope: !133, file: !30, line: 110, column: 9)
!133 = distinct !DILexicalBlock(scope: !128, file: !30, line: 109, column: 5)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !135)
!135 = !{!136}
!136 = !DISubrange(count: 10)
!137 = !DILocation(line: 111, column: 17, scope: !132)
!138 = !DILocation(line: 114, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !132, file: !30, line: 114, column: 17)
!140 = !DILocation(line: 114, column: 22, scope: !139)
!141 = !DILocation(line: 114, column: 17, scope: !132)
!142 = !DILocation(line: 116, column: 37, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !30, line: 115, column: 13)
!144 = !DILocation(line: 116, column: 30, scope: !143)
!145 = !DILocation(line: 116, column: 17, scope: !143)
!146 = !DILocation(line: 117, column: 13, scope: !143)
!147 = !DILocation(line: 120, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !139, file: !30, line: 119, column: 13)
!149 = !DILocation(line: 123, column: 5, scope: !133)
!150 = !DILocation(line: 124, column: 1, scope: !29)
!151 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_14_good", scope: !30, file: !30, line: 364, type: !31, scopeLine: 365, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!152 = !DILocation(line: 366, column: 5, scope: !151)
!153 = !DILocation(line: 367, column: 5, scope: !151)
!154 = !DILocation(line: 368, column: 5, scope: !151)
!155 = !DILocation(line: 369, column: 5, scope: !151)
!156 = !DILocation(line: 370, column: 1, scope: !151)
!157 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 381, type: !158, scopeLine: 382, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!158 = !DISubroutineType(types: !159)
!159 = !{!35, !35, !160}
!160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !161, size: 64)
!161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!162 = !DILocalVariable(name: "argc", arg: 1, scope: !157, file: !30, line: 381, type: !35)
!163 = !DILocation(line: 381, column: 14, scope: !157)
!164 = !DILocalVariable(name: "argv", arg: 2, scope: !157, file: !30, line: 381, type: !160)
!165 = !DILocation(line: 381, column: 27, scope: !157)
!166 = !DILocation(line: 384, column: 22, scope: !157)
!167 = !DILocation(line: 384, column: 12, scope: !157)
!168 = !DILocation(line: 384, column: 5, scope: !157)
!169 = !DILocation(line: 386, column: 5, scope: !157)
!170 = !DILocation(line: 387, column: 5, scope: !157)
!171 = !DILocation(line: 388, column: 5, scope: !157)
!172 = !DILocation(line: 391, column: 5, scope: !157)
!173 = !DILocation(line: 392, column: 5, scope: !157)
!174 = !DILocation(line: 393, column: 5, scope: !157)
!175 = !DILocation(line: 395, column: 5, scope: !157)
!176 = distinct !DISubprogram(name: "goodB2G1", scope: !30, file: !30, line: 131, type: !31, scopeLine: 132, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!177 = !DILocalVariable(name: "data", scope: !176, file: !30, line: 133, type: !35)
!178 = !DILocation(line: 133, column: 9, scope: !176)
!179 = !DILocation(line: 135, column: 10, scope: !176)
!180 = !DILocation(line: 136, column: 8, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !30, line: 136, column: 8)
!182 = !DILocation(line: 136, column: 18, scope: !181)
!183 = !DILocation(line: 136, column: 8, scope: !176)
!184 = !DILocalVariable(name: "recvResult", scope: !185, file: !30, line: 143, type: !35)
!185 = distinct !DILexicalBlock(scope: !186, file: !30, line: 138, column: 9)
!186 = distinct !DILexicalBlock(scope: !181, file: !30, line: 137, column: 5)
!187 = !DILocation(line: 143, column: 17, scope: !185)
!188 = !DILocalVariable(name: "service", scope: !185, file: !30, line: 144, type: !47)
!189 = !DILocation(line: 144, column: 32, scope: !185)
!190 = !DILocalVariable(name: "connectSocket", scope: !185, file: !30, line: 145, type: !35)
!191 = !DILocation(line: 145, column: 20, scope: !185)
!192 = !DILocalVariable(name: "inputBuffer", scope: !185, file: !30, line: 146, type: !17)
!193 = !DILocation(line: 146, column: 18, scope: !185)
!194 = !DILocation(line: 147, column: 13, scope: !185)
!195 = !DILocation(line: 157, column: 33, scope: !196)
!196 = distinct !DILexicalBlock(scope: !185, file: !30, line: 148, column: 13)
!197 = !DILocation(line: 157, column: 31, scope: !196)
!198 = !DILocation(line: 158, column: 21, scope: !199)
!199 = distinct !DILexicalBlock(scope: !196, file: !30, line: 158, column: 21)
!200 = !DILocation(line: 158, column: 35, scope: !199)
!201 = !DILocation(line: 158, column: 21, scope: !196)
!202 = !DILocation(line: 160, column: 21, scope: !203)
!203 = distinct !DILexicalBlock(scope: !199, file: !30, line: 159, column: 17)
!204 = !DILocation(line: 162, column: 17, scope: !196)
!205 = !DILocation(line: 163, column: 25, scope: !196)
!206 = !DILocation(line: 163, column: 36, scope: !196)
!207 = !DILocation(line: 164, column: 43, scope: !196)
!208 = !DILocation(line: 164, column: 25, scope: !196)
!209 = !DILocation(line: 164, column: 34, scope: !196)
!210 = !DILocation(line: 164, column: 41, scope: !196)
!211 = !DILocation(line: 165, column: 25, scope: !196)
!212 = !DILocation(line: 165, column: 34, scope: !196)
!213 = !DILocation(line: 166, column: 29, scope: !214)
!214 = distinct !DILexicalBlock(scope: !196, file: !30, line: 166, column: 21)
!215 = !DILocation(line: 166, column: 44, scope: !214)
!216 = !DILocation(line: 166, column: 21, scope: !214)
!217 = !DILocation(line: 166, column: 89, scope: !214)
!218 = !DILocation(line: 166, column: 21, scope: !196)
!219 = !DILocation(line: 168, column: 21, scope: !220)
!220 = distinct !DILexicalBlock(scope: !214, file: !30, line: 167, column: 17)
!221 = !DILocation(line: 172, column: 35, scope: !196)
!222 = !DILocation(line: 172, column: 50, scope: !196)
!223 = !DILocation(line: 172, column: 30, scope: !196)
!224 = !DILocation(line: 172, column: 28, scope: !196)
!225 = !DILocation(line: 173, column: 21, scope: !226)
!226 = distinct !DILexicalBlock(scope: !196, file: !30, line: 173, column: 21)
!227 = !DILocation(line: 173, column: 32, scope: !226)
!228 = !DILocation(line: 173, column: 48, scope: !226)
!229 = !DILocation(line: 173, column: 51, scope: !226)
!230 = !DILocation(line: 173, column: 62, scope: !226)
!231 = !DILocation(line: 173, column: 21, scope: !196)
!232 = !DILocation(line: 175, column: 21, scope: !233)
!233 = distinct !DILexicalBlock(scope: !226, file: !30, line: 174, column: 17)
!234 = !DILocation(line: 178, column: 29, scope: !196)
!235 = !DILocation(line: 178, column: 17, scope: !196)
!236 = !DILocation(line: 178, column: 41, scope: !196)
!237 = !DILocation(line: 180, column: 29, scope: !196)
!238 = !DILocation(line: 180, column: 24, scope: !196)
!239 = !DILocation(line: 180, column: 22, scope: !196)
!240 = !DILocation(line: 181, column: 13, scope: !196)
!241 = !DILocation(line: 183, column: 17, scope: !242)
!242 = distinct !DILexicalBlock(scope: !185, file: !30, line: 183, column: 17)
!243 = !DILocation(line: 183, column: 31, scope: !242)
!244 = !DILocation(line: 183, column: 17, scope: !185)
!245 = !DILocation(line: 185, column: 30, scope: !246)
!246 = distinct !DILexicalBlock(scope: !242, file: !30, line: 184, column: 13)
!247 = !DILocation(line: 185, column: 17, scope: !246)
!248 = !DILocation(line: 186, column: 13, scope: !246)
!249 = !DILocation(line: 194, column: 5, scope: !186)
!250 = !DILocation(line: 195, column: 8, scope: !251)
!251 = distinct !DILexicalBlock(scope: !176, file: !30, line: 195, column: 8)
!252 = !DILocation(line: 195, column: 18, scope: !251)
!253 = !DILocation(line: 195, column: 8, scope: !176)
!254 = !DILocation(line: 198, column: 9, scope: !255)
!255 = distinct !DILexicalBlock(scope: !251, file: !30, line: 196, column: 5)
!256 = !DILocation(line: 199, column: 5, scope: !255)
!257 = !DILocalVariable(name: "buffer", scope: !258, file: !30, line: 203, type: !134)
!258 = distinct !DILexicalBlock(scope: !259, file: !30, line: 202, column: 9)
!259 = distinct !DILexicalBlock(scope: !251, file: !30, line: 201, column: 5)
!260 = !DILocation(line: 203, column: 17, scope: !258)
!261 = !DILocation(line: 205, column: 17, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !30, line: 205, column: 17)
!263 = !DILocation(line: 205, column: 22, scope: !262)
!264 = !DILocation(line: 205, column: 27, scope: !262)
!265 = !DILocation(line: 205, column: 30, scope: !262)
!266 = !DILocation(line: 205, column: 35, scope: !262)
!267 = !DILocation(line: 205, column: 17, scope: !258)
!268 = !DILocation(line: 207, column: 37, scope: !269)
!269 = distinct !DILexicalBlock(scope: !262, file: !30, line: 206, column: 13)
!270 = !DILocation(line: 207, column: 30, scope: !269)
!271 = !DILocation(line: 207, column: 17, scope: !269)
!272 = !DILocation(line: 208, column: 13, scope: !269)
!273 = !DILocation(line: 211, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !262, file: !30, line: 210, column: 13)
!275 = !DILocation(line: 215, column: 1, scope: !176)
!276 = distinct !DISubprogram(name: "goodB2G2", scope: !30, file: !30, line: 218, type: !31, scopeLine: 219, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!277 = !DILocalVariable(name: "data", scope: !276, file: !30, line: 220, type: !35)
!278 = !DILocation(line: 220, column: 9, scope: !276)
!279 = !DILocation(line: 222, column: 10, scope: !276)
!280 = !DILocation(line: 223, column: 8, scope: !281)
!281 = distinct !DILexicalBlock(scope: !276, file: !30, line: 223, column: 8)
!282 = !DILocation(line: 223, column: 18, scope: !281)
!283 = !DILocation(line: 223, column: 8, scope: !276)
!284 = !DILocalVariable(name: "recvResult", scope: !285, file: !30, line: 230, type: !35)
!285 = distinct !DILexicalBlock(scope: !286, file: !30, line: 225, column: 9)
!286 = distinct !DILexicalBlock(scope: !281, file: !30, line: 224, column: 5)
!287 = !DILocation(line: 230, column: 17, scope: !285)
!288 = !DILocalVariable(name: "service", scope: !285, file: !30, line: 231, type: !47)
!289 = !DILocation(line: 231, column: 32, scope: !285)
!290 = !DILocalVariable(name: "connectSocket", scope: !285, file: !30, line: 232, type: !35)
!291 = !DILocation(line: 232, column: 20, scope: !285)
!292 = !DILocalVariable(name: "inputBuffer", scope: !285, file: !30, line: 233, type: !17)
!293 = !DILocation(line: 233, column: 18, scope: !285)
!294 = !DILocation(line: 234, column: 13, scope: !285)
!295 = !DILocation(line: 244, column: 33, scope: !296)
!296 = distinct !DILexicalBlock(scope: !285, file: !30, line: 235, column: 13)
!297 = !DILocation(line: 244, column: 31, scope: !296)
!298 = !DILocation(line: 245, column: 21, scope: !299)
!299 = distinct !DILexicalBlock(scope: !296, file: !30, line: 245, column: 21)
!300 = !DILocation(line: 245, column: 35, scope: !299)
!301 = !DILocation(line: 245, column: 21, scope: !296)
!302 = !DILocation(line: 247, column: 21, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !30, line: 246, column: 17)
!304 = !DILocation(line: 249, column: 17, scope: !296)
!305 = !DILocation(line: 250, column: 25, scope: !296)
!306 = !DILocation(line: 250, column: 36, scope: !296)
!307 = !DILocation(line: 251, column: 43, scope: !296)
!308 = !DILocation(line: 251, column: 25, scope: !296)
!309 = !DILocation(line: 251, column: 34, scope: !296)
!310 = !DILocation(line: 251, column: 41, scope: !296)
!311 = !DILocation(line: 252, column: 25, scope: !296)
!312 = !DILocation(line: 252, column: 34, scope: !296)
!313 = !DILocation(line: 253, column: 29, scope: !314)
!314 = distinct !DILexicalBlock(scope: !296, file: !30, line: 253, column: 21)
!315 = !DILocation(line: 253, column: 44, scope: !314)
!316 = !DILocation(line: 253, column: 21, scope: !314)
!317 = !DILocation(line: 253, column: 89, scope: !314)
!318 = !DILocation(line: 253, column: 21, scope: !296)
!319 = !DILocation(line: 255, column: 21, scope: !320)
!320 = distinct !DILexicalBlock(scope: !314, file: !30, line: 254, column: 17)
!321 = !DILocation(line: 259, column: 35, scope: !296)
!322 = !DILocation(line: 259, column: 50, scope: !296)
!323 = !DILocation(line: 259, column: 30, scope: !296)
!324 = !DILocation(line: 259, column: 28, scope: !296)
!325 = !DILocation(line: 260, column: 21, scope: !326)
!326 = distinct !DILexicalBlock(scope: !296, file: !30, line: 260, column: 21)
!327 = !DILocation(line: 260, column: 32, scope: !326)
!328 = !DILocation(line: 260, column: 48, scope: !326)
!329 = !DILocation(line: 260, column: 51, scope: !326)
!330 = !DILocation(line: 260, column: 62, scope: !326)
!331 = !DILocation(line: 260, column: 21, scope: !296)
!332 = !DILocation(line: 262, column: 21, scope: !333)
!333 = distinct !DILexicalBlock(scope: !326, file: !30, line: 261, column: 17)
!334 = !DILocation(line: 265, column: 29, scope: !296)
!335 = !DILocation(line: 265, column: 17, scope: !296)
!336 = !DILocation(line: 265, column: 41, scope: !296)
!337 = !DILocation(line: 267, column: 29, scope: !296)
!338 = !DILocation(line: 267, column: 24, scope: !296)
!339 = !DILocation(line: 267, column: 22, scope: !296)
!340 = !DILocation(line: 268, column: 13, scope: !296)
!341 = !DILocation(line: 270, column: 17, scope: !342)
!342 = distinct !DILexicalBlock(scope: !285, file: !30, line: 270, column: 17)
!343 = !DILocation(line: 270, column: 31, scope: !342)
!344 = !DILocation(line: 270, column: 17, scope: !285)
!345 = !DILocation(line: 272, column: 30, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !30, line: 271, column: 13)
!347 = !DILocation(line: 272, column: 17, scope: !346)
!348 = !DILocation(line: 273, column: 13, scope: !346)
!349 = !DILocation(line: 281, column: 5, scope: !286)
!350 = !DILocation(line: 282, column: 8, scope: !351)
!351 = distinct !DILexicalBlock(scope: !276, file: !30, line: 282, column: 8)
!352 = !DILocation(line: 282, column: 18, scope: !351)
!353 = !DILocation(line: 282, column: 8, scope: !276)
!354 = !DILocalVariable(name: "buffer", scope: !355, file: !30, line: 285, type: !134)
!355 = distinct !DILexicalBlock(scope: !356, file: !30, line: 284, column: 9)
!356 = distinct !DILexicalBlock(scope: !351, file: !30, line: 283, column: 5)
!357 = !DILocation(line: 285, column: 17, scope: !355)
!358 = !DILocation(line: 287, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !30, line: 287, column: 17)
!360 = !DILocation(line: 287, column: 22, scope: !359)
!361 = !DILocation(line: 287, column: 27, scope: !359)
!362 = !DILocation(line: 287, column: 30, scope: !359)
!363 = !DILocation(line: 287, column: 35, scope: !359)
!364 = !DILocation(line: 287, column: 17, scope: !355)
!365 = !DILocation(line: 289, column: 37, scope: !366)
!366 = distinct !DILexicalBlock(scope: !359, file: !30, line: 288, column: 13)
!367 = !DILocation(line: 289, column: 30, scope: !366)
!368 = !DILocation(line: 289, column: 17, scope: !366)
!369 = !DILocation(line: 290, column: 13, scope: !366)
!370 = !DILocation(line: 293, column: 17, scope: !371)
!371 = distinct !DILexicalBlock(scope: !359, file: !30, line: 292, column: 13)
!372 = !DILocation(line: 296, column: 5, scope: !356)
!373 = !DILocation(line: 297, column: 1, scope: !276)
!374 = distinct !DISubprogram(name: "goodG2B1", scope: !30, file: !30, line: 300, type: !31, scopeLine: 301, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!375 = !DILocalVariable(name: "data", scope: !374, file: !30, line: 302, type: !35)
!376 = !DILocation(line: 302, column: 9, scope: !374)
!377 = !DILocation(line: 304, column: 10, scope: !374)
!378 = !DILocation(line: 305, column: 8, scope: !379)
!379 = distinct !DILexicalBlock(scope: !374, file: !30, line: 305, column: 8)
!380 = !DILocation(line: 305, column: 18, scope: !379)
!381 = !DILocation(line: 305, column: 8, scope: !374)
!382 = !DILocation(line: 308, column: 9, scope: !383)
!383 = distinct !DILexicalBlock(scope: !379, file: !30, line: 306, column: 5)
!384 = !DILocation(line: 309, column: 5, scope: !383)
!385 = !DILocation(line: 314, column: 14, scope: !386)
!386 = distinct !DILexicalBlock(scope: !379, file: !30, line: 311, column: 5)
!387 = !DILocation(line: 316, column: 8, scope: !388)
!388 = distinct !DILexicalBlock(scope: !374, file: !30, line: 316, column: 8)
!389 = !DILocation(line: 316, column: 18, scope: !388)
!390 = !DILocation(line: 316, column: 8, scope: !374)
!391 = !DILocalVariable(name: "buffer", scope: !392, file: !30, line: 319, type: !134)
!392 = distinct !DILexicalBlock(scope: !393, file: !30, line: 318, column: 9)
!393 = distinct !DILexicalBlock(scope: !388, file: !30, line: 317, column: 5)
!394 = !DILocation(line: 319, column: 17, scope: !392)
!395 = !DILocation(line: 322, column: 17, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !30, line: 322, column: 17)
!397 = !DILocation(line: 322, column: 22, scope: !396)
!398 = !DILocation(line: 322, column: 17, scope: !392)
!399 = !DILocation(line: 324, column: 37, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !30, line: 323, column: 13)
!401 = !DILocation(line: 324, column: 30, scope: !400)
!402 = !DILocation(line: 324, column: 17, scope: !400)
!403 = !DILocation(line: 325, column: 13, scope: !400)
!404 = !DILocation(line: 328, column: 17, scope: !405)
!405 = distinct !DILexicalBlock(scope: !396, file: !30, line: 327, column: 13)
!406 = !DILocation(line: 331, column: 5, scope: !393)
!407 = !DILocation(line: 332, column: 1, scope: !374)
!408 = distinct !DISubprogram(name: "goodG2B2", scope: !30, file: !30, line: 335, type: !31, scopeLine: 336, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!409 = !DILocalVariable(name: "data", scope: !408, file: !30, line: 337, type: !35)
!410 = !DILocation(line: 337, column: 9, scope: !408)
!411 = !DILocation(line: 339, column: 10, scope: !408)
!412 = !DILocation(line: 340, column: 8, scope: !413)
!413 = distinct !DILexicalBlock(scope: !408, file: !30, line: 340, column: 8)
!414 = !DILocation(line: 340, column: 18, scope: !413)
!415 = !DILocation(line: 340, column: 8, scope: !408)
!416 = !DILocation(line: 344, column: 14, scope: !417)
!417 = distinct !DILexicalBlock(scope: !413, file: !30, line: 341, column: 5)
!418 = !DILocation(line: 345, column: 5, scope: !417)
!419 = !DILocation(line: 346, column: 8, scope: !420)
!420 = distinct !DILexicalBlock(scope: !408, file: !30, line: 346, column: 8)
!421 = !DILocation(line: 346, column: 18, scope: !420)
!422 = !DILocation(line: 346, column: 8, scope: !408)
!423 = !DILocalVariable(name: "buffer", scope: !424, file: !30, line: 349, type: !134)
!424 = distinct !DILexicalBlock(scope: !425, file: !30, line: 348, column: 9)
!425 = distinct !DILexicalBlock(scope: !420, file: !30, line: 347, column: 5)
!426 = !DILocation(line: 349, column: 17, scope: !424)
!427 = !DILocation(line: 352, column: 17, scope: !428)
!428 = distinct !DILexicalBlock(scope: !424, file: !30, line: 352, column: 17)
!429 = !DILocation(line: 352, column: 22, scope: !428)
!430 = !DILocation(line: 352, column: 17, scope: !424)
!431 = !DILocation(line: 354, column: 37, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !30, line: 353, column: 13)
!433 = !DILocation(line: 354, column: 30, scope: !432)
!434 = !DILocation(line: 354, column: 17, scope: !432)
!435 = !DILocation(line: 355, column: 13, scope: !432)
!436 = !DILocation(line: 358, column: 17, scope: !437)
!437 = distinct !DILexicalBlock(scope: !428, file: !30, line: 357, column: 13)
!438 = !DILocation(line: 361, column: 5, scope: !425)
!439 = !DILocation(line: 362, column: 1, scope: !408)
