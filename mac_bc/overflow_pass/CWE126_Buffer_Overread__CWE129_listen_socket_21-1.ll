; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ERROR: Array index is negative\00", align 1
@goodB2G1Static = internal global i32 0, align 4, !dbg !27
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1
@goodB2G2Static = internal global i32 0, align 4, !dbg !31
@goodG2BStatic = internal global i32 0, align 4, !dbg !33

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_listen_socket_21_bad() #0 !dbg !42 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 -1, i32* %data, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !49, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !52, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !73, metadata !DIExpression()), !dbg !74
  store i32 -1, i32* %listenSocket, align 4, !dbg !74
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !75, metadata !DIExpression()), !dbg !76
  store i32 -1, i32* %acceptSocket, align 4, !dbg !76
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !77, metadata !DIExpression()), !dbg !78
  br label %do.body, !dbg !79

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !80
  store i32 %call, i32* %listenSocket, align 4, !dbg !82
  %0 = load i32, i32* %listenSocket, align 4, !dbg !83
  %cmp = icmp eq i32 %0, -1, !dbg !85
  br i1 %cmp, label %if.then, label %if.end, !dbg !86

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !87

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !89
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !90
  store i8 2, i8* %sin_family, align 1, !dbg !91
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !92
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !93
  store i32 0, i32* %s_addr, align 4, !dbg !94
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !95
  store i16 -30871, i16* %sin_port, align 2, !dbg !96
  %2 = load i32, i32* %listenSocket, align 4, !dbg !97
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !99
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !100
  %cmp2 = icmp eq i32 %call1, -1, !dbg !101
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !102

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !103

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !105
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !107
  %cmp6 = icmp eq i32 %call5, -1, !dbg !108
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !109

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !110

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !112
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !113
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !114
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !115
  %cmp10 = icmp eq i32 %6, -1, !dbg !117
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !118

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !119

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !121
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !122
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !123
  %conv = trunc i64 %call13 to i32, !dbg !123
  store i32 %conv, i32* %recvResult, align 4, !dbg !124
  %8 = load i32, i32* %recvResult, align 4, !dbg !125
  %cmp14 = icmp eq i32 %8, -1, !dbg !127
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !128

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !129
  %cmp16 = icmp eq i32 %9, 0, !dbg !130
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !131

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !132

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !134
  %idxprom = sext i32 %10 to i64, !dbg !135
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !135
  store i8 0, i8* %arrayidx, align 1, !dbg !136
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !137
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !138
  store i32 %call21, i32* %data, align 4, !dbg !139
  br label %do.end, !dbg !140

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !141
  %cmp22 = icmp ne i32 %11, -1, !dbg !143
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !144

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !145
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !147
  br label %if.end26, !dbg !148

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !149
  %cmp27 = icmp ne i32 %13, -1, !dbg !151
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !152

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !153
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !155
  br label %if.end31, !dbg !156

if.end31:                                         ; preds = %if.then29, %if.end26
  store i32 1, i32* @badStatic, align 4, !dbg !157
  %15 = load i32, i32* %data, align 4, !dbg !158
  call void @badSink(i32 noundef %15), !dbg !159
  ret void, !dbg !160
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

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink(i32 noundef %data) #0 !dbg !161 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !164, metadata !DIExpression()), !dbg !165
  %0 = load i32, i32* @badStatic, align 4, !dbg !166
  %tobool = icmp ne i32 %0, 0, !dbg !166
  br i1 %tobool, label %if.then, label %if.end2, !dbg !168

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !169, metadata !DIExpression()), !dbg !175
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !175
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !175
  %2 = load i32, i32* %data.addr, align 4, !dbg !176
  %cmp = icmp sge i32 %2, 0, !dbg !178
  br i1 %cmp, label %if.then1, label %if.else, !dbg !179

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !180
  %idxprom = sext i32 %3 to i64, !dbg !182
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !182
  %4 = load i32, i32* %arrayidx, align 4, !dbg !182
  call void @printIntLine(i32 noundef %4), !dbg !183
  br label %if.end, !dbg !184

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !185
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !187

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_listen_socket_21_good() #0 !dbg !189 {
entry:
  call void @goodB2G1(), !dbg !190
  call void @goodB2G2(), !dbg !191
  call void @goodG2B(), !dbg !192
  ret void, !dbg !193
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !194 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !199, metadata !DIExpression()), !dbg !200
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !201, metadata !DIExpression()), !dbg !202
  %call = call i64 @time(i64* noundef null), !dbg !203
  %conv = trunc i64 %call to i32, !dbg !204
  call void @srand(i32 noundef %conv), !dbg !205
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !206
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_21_good(), !dbg !207
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !208
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !209
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_21_bad(), !dbg !210
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !211
  ret i32 0, !dbg !212
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

declare void @printIntLine(i32 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !213 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !214, metadata !DIExpression()), !dbg !215
  store i32 -1, i32* %data, align 4, !dbg !216
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !217, metadata !DIExpression()), !dbg !219
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !220, metadata !DIExpression()), !dbg !221
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !222, metadata !DIExpression()), !dbg !223
  store i32 -1, i32* %listenSocket, align 4, !dbg !223
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !224, metadata !DIExpression()), !dbg !225
  store i32 -1, i32* %acceptSocket, align 4, !dbg !225
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !226, metadata !DIExpression()), !dbg !227
  br label %do.body, !dbg !228

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !229
  store i32 %call, i32* %listenSocket, align 4, !dbg !231
  %0 = load i32, i32* %listenSocket, align 4, !dbg !232
  %cmp = icmp eq i32 %0, -1, !dbg !234
  br i1 %cmp, label %if.then, label %if.end, !dbg !235

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !236

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !238
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !238
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !239
  store i8 2, i8* %sin_family, align 1, !dbg !240
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !241
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !242
  store i32 0, i32* %s_addr, align 4, !dbg !243
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !244
  store i16 -30871, i16* %sin_port, align 2, !dbg !245
  %2 = load i32, i32* %listenSocket, align 4, !dbg !246
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !248
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !249
  %cmp2 = icmp eq i32 %call1, -1, !dbg !250
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !251

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !252

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !254
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !256
  %cmp6 = icmp eq i32 %call5, -1, !dbg !257
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !258

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !259

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !261
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !262
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !263
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !264
  %cmp10 = icmp eq i32 %6, -1, !dbg !266
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !267

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !268

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !270
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !271
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !272
  %conv = trunc i64 %call13 to i32, !dbg !272
  store i32 %conv, i32* %recvResult, align 4, !dbg !273
  %8 = load i32, i32* %recvResult, align 4, !dbg !274
  %cmp14 = icmp eq i32 %8, -1, !dbg !276
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !277

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !278
  %cmp16 = icmp eq i32 %9, 0, !dbg !279
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !280

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !281

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !283
  %idxprom = sext i32 %10 to i64, !dbg !284
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !284
  store i8 0, i8* %arrayidx, align 1, !dbg !285
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !286
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !287
  store i32 %call21, i32* %data, align 4, !dbg !288
  br label %do.end, !dbg !289

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !290
  %cmp22 = icmp ne i32 %11, -1, !dbg !292
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !293

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !294
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !296
  br label %if.end26, !dbg !297

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !298
  %cmp27 = icmp ne i32 %13, -1, !dbg !300
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !301

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !302
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !304
  br label %if.end31, !dbg !305

if.end31:                                         ; preds = %if.then29, %if.end26
  store i32 0, i32* @goodB2G1Static, align 4, !dbg !306
  %15 = load i32, i32* %data, align 4, !dbg !307
  call void @goodB2G1Sink(i32 noundef %15), !dbg !308
  ret void, !dbg !309
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1Sink(i32 noundef %data) #0 !dbg !310 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !311, metadata !DIExpression()), !dbg !312
  %0 = load i32, i32* @goodB2G1Static, align 4, !dbg !313
  %tobool = icmp ne i32 %0, 0, !dbg !313
  br i1 %tobool, label %if.then, label %if.else, !dbg !315

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !316
  br label %if.end4, !dbg !318

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !319, metadata !DIExpression()), !dbg !322
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !322
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !322
  %2 = load i32, i32* %data.addr, align 4, !dbg !323
  %cmp = icmp sge i32 %2, 0, !dbg !325
  br i1 %cmp, label %land.lhs.true, label %if.else3, !dbg !326

land.lhs.true:                                    ; preds = %if.else
  %3 = load i32, i32* %data.addr, align 4, !dbg !327
  %cmp1 = icmp slt i32 %3, 10, !dbg !328
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !329

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !330
  %idxprom = sext i32 %4 to i64, !dbg !332
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !332
  %5 = load i32, i32* %arrayidx, align 4, !dbg !332
  call void @printIntLine(i32 noundef %5), !dbg !333
  br label %if.end, !dbg !334

if.else3:                                         ; preds = %land.lhs.true, %if.else
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !335
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  ret void, !dbg !337
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !338 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  call void @llvm.dbg.declare(metadata i32* %data, metadata !339, metadata !DIExpression()), !dbg !340
  store i32 -1, i32* %data, align 4, !dbg !341
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !342, metadata !DIExpression()), !dbg !344
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !347, metadata !DIExpression()), !dbg !348
  store i32 -1, i32* %listenSocket, align 4, !dbg !348
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !349, metadata !DIExpression()), !dbg !350
  store i32 -1, i32* %acceptSocket, align 4, !dbg !350
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !351, metadata !DIExpression()), !dbg !352
  br label %do.body, !dbg !353

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !354
  store i32 %call, i32* %listenSocket, align 4, !dbg !356
  %0 = load i32, i32* %listenSocket, align 4, !dbg !357
  %cmp = icmp eq i32 %0, -1, !dbg !359
  br i1 %cmp, label %if.then, label %if.end, !dbg !360

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !361

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !363
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !363
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !364
  store i8 2, i8* %sin_family, align 1, !dbg !365
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !366
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !367
  store i32 0, i32* %s_addr, align 4, !dbg !368
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !369
  store i16 -30871, i16* %sin_port, align 2, !dbg !370
  %2 = load i32, i32* %listenSocket, align 4, !dbg !371
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !373
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !374
  %cmp2 = icmp eq i32 %call1, -1, !dbg !375
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !376

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !377

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !379
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !381
  %cmp6 = icmp eq i32 %call5, -1, !dbg !382
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !383

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !384

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !386
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !387
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !388
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !389
  %cmp10 = icmp eq i32 %6, -1, !dbg !391
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !392

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !393

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !395
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !396
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !397
  %conv = trunc i64 %call13 to i32, !dbg !397
  store i32 %conv, i32* %recvResult, align 4, !dbg !398
  %8 = load i32, i32* %recvResult, align 4, !dbg !399
  %cmp14 = icmp eq i32 %8, -1, !dbg !401
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !402

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !403
  %cmp16 = icmp eq i32 %9, 0, !dbg !404
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !405

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !406

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !408
  %idxprom = sext i32 %10 to i64, !dbg !409
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !409
  store i8 0, i8* %arrayidx, align 1, !dbg !410
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !411
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !412
  store i32 %call21, i32* %data, align 4, !dbg !413
  br label %do.end, !dbg !414

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !415
  %cmp22 = icmp ne i32 %11, -1, !dbg !417
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !418

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !419
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !421
  br label %if.end26, !dbg !422

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !423
  %cmp27 = icmp ne i32 %13, -1, !dbg !425
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !426

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !427
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !429
  br label %if.end31, !dbg !430

if.end31:                                         ; preds = %if.then29, %if.end26
  store i32 1, i32* @goodB2G2Static, align 4, !dbg !431
  %15 = load i32, i32* %data, align 4, !dbg !432
  call void @goodB2G2Sink(i32 noundef %15), !dbg !433
  ret void, !dbg !434
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2Sink(i32 noundef %data) #0 !dbg !435 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !436, metadata !DIExpression()), !dbg !437
  %0 = load i32, i32* @goodB2G2Static, align 4, !dbg !438
  %tobool = icmp ne i32 %0, 0, !dbg !438
  br i1 %tobool, label %if.then, label %if.end3, !dbg !440

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !441, metadata !DIExpression()), !dbg !444
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !444
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !444
  %2 = load i32, i32* %data.addr, align 4, !dbg !445
  %cmp = icmp sge i32 %2, 0, !dbg !447
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !448

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !449
  %cmp1 = icmp slt i32 %3, 10, !dbg !450
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !451

if.then2:                                         ; preds = %land.lhs.true
  %4 = load i32, i32* %data.addr, align 4, !dbg !452
  %idxprom = sext i32 %4 to i64, !dbg !454
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !454
  %5 = load i32, i32* %arrayidx, align 4, !dbg !454
  call void @printIntLine(i32 noundef %5), !dbg !455
  br label %if.end, !dbg !456

if.else:                                          ; preds = %land.lhs.true, %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !457
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end3, !dbg !459

if.end3:                                          ; preds = %if.end, %entry
  ret void, !dbg !460
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !461 {
entry:
  %data = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %data, metadata !462, metadata !DIExpression()), !dbg !463
  store i32 -1, i32* %data, align 4, !dbg !464
  store i32 7, i32* %data, align 4, !dbg !465
  store i32 1, i32* @goodG2BStatic, align 4, !dbg !466
  %0 = load i32, i32* %data, align 4, !dbg !467
  call void @goodG2BSink(i32 noundef %0), !dbg !468
  ret void, !dbg !469
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink(i32 noundef %data) #0 !dbg !470 {
entry:
  %data.addr = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  store i32 %data, i32* %data.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %data.addr, metadata !471, metadata !DIExpression()), !dbg !472
  %0 = load i32, i32* @goodG2BStatic, align 4, !dbg !473
  %tobool = icmp ne i32 %0, 0, !dbg !473
  br i1 %tobool, label %if.then, label %if.end2, !dbg !475

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !476, metadata !DIExpression()), !dbg !479
  %1 = bitcast [10 x i32]* %buffer to i8*, !dbg !479
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 40, i1 false), !dbg !479
  %2 = load i32, i32* %data.addr, align 4, !dbg !480
  %cmp = icmp sge i32 %2, 0, !dbg !482
  br i1 %cmp, label %if.then1, label %if.else, !dbg !483

if.then1:                                         ; preds = %if.then
  %3 = load i32, i32* %data.addr, align 4, !dbg !484
  %idxprom = sext i32 %3 to i64, !dbg !486
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !486
  %4 = load i32, i32* %arrayidx, align 4, !dbg !486
  call void @printIntLine(i32 noundef %4), !dbg !487
  br label %if.end, !dbg !488

if.else:                                          ; preds = %if.then
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0)), !dbg !489
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then1
  br label %if.end2, !dbg !491

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !492
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!35, !36, !37, !38, !39, !40}
!llvm.ident = !{!41}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !29, line: 45, type: !30, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !26, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !8, !11, !7}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "u_int32_t", file: !6, line: 30, baseType: !7)
!6 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_u_int32_t.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !9, line: 45, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr", file: !13, line: 412, size: 128, elements: !14)
!13 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/socket.h", directory: "")
!14 = !{!15, !18, !21}
!15 = !DIDerivedType(tag: DW_TAG_member, name: "sa_len", scope: !12, file: !13, line: 413, baseType: !16, size: 8)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !9, line: 43, baseType: !17)
!17 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "sa_family", scope: !12, file: !13, line: 414, baseType: !19, size: 8, offset: 8)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "sa_family_t", file: !20, line: 31, baseType: !16)
!20 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_sa_family_t.h", directory: "")
!21 = !DIDerivedType(tag: DW_TAG_member, name: "sa_data", scope: !12, file: !13, line: 415, baseType: !22, size: 112, offset: 16)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 112, elements: !24)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{!25}
!25 = !DISubrange(count: 14)
!26 = !{!0, !27, !31, !33}
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "goodB2G1Static", scope: !2, file: !29, line: 150, type: !30, isLocal: true, isDefinition: true)
!29 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "goodB2G2Static", scope: !2, file: !29, line: 151, type: !30, isLocal: true, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "goodG2BStatic", scope: !2, file: !29, line: 152, type: !30, isLocal: true, isDefinition: true)
!35 = !{i32 7, !"Dwarf Version", i32 4}
!36 = !{i32 2, !"Debug Info Version", i32 3}
!37 = !{i32 1, !"wchar_size", i32 4}
!38 = !{i32 7, !"PIC Level", i32 2}
!39 = !{i32 7, !"uwtable", i32 1}
!40 = !{i32 7, !"frame-pointer", i32 2}
!41 = !{!"Homebrew clang version 14.0.6"}
!42 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_21_bad", scope: !29, file: !29, line: 67, type: !43, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!43 = !DISubroutineType(types: !44)
!44 = !{null}
!45 = !{}
!46 = !DILocalVariable(name: "data", scope: !42, file: !29, line: 69, type: !30)
!47 = !DILocation(line: 69, column: 9, scope: !42)
!48 = !DILocation(line: 71, column: 10, scope: !42)
!49 = !DILocalVariable(name: "recvResult", scope: !50, file: !29, line: 77, type: !30)
!50 = distinct !DILexicalBlock(scope: !42, file: !29, line: 72, column: 5)
!51 = !DILocation(line: 77, column: 13, scope: !50)
!52 = !DILocalVariable(name: "service", scope: !50, file: !29, line: 78, type: !53)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !54, line: 375, size: 128, elements: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!55 = !{!56, !57, !58, !61, !68}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !53, file: !54, line: 376, baseType: !16, size: 8)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !53, file: !54, line: 377, baseType: !19, size: 8, offset: 8)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !53, file: !54, line: 378, baseType: !59, size: 16, offset: 16)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !60, line: 31, baseType: !8)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !53, file: !54, line: 379, baseType: !62, size: 32, offset: 32)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !54, line: 301, size: 32, elements: !63)
!63 = !{!64}
!64 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !62, file: !54, line: 302, baseType: !65, size: 32)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !66, line: 31, baseType: !67)
!66 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !9, line: 47, baseType: !7)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !53, file: !54, line: 380, baseType: !69, size: 64, offset: 64)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 64, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 8)
!72 = !DILocation(line: 78, column: 28, scope: !50)
!73 = !DILocalVariable(name: "listenSocket", scope: !50, file: !29, line: 79, type: !30)
!74 = !DILocation(line: 79, column: 16, scope: !50)
!75 = !DILocalVariable(name: "acceptSocket", scope: !50, file: !29, line: 80, type: !30)
!76 = !DILocation(line: 80, column: 16, scope: !50)
!77 = !DILocalVariable(name: "inputBuffer", scope: !50, file: !29, line: 81, type: !22)
!78 = !DILocation(line: 81, column: 14, scope: !50)
!79 = !DILocation(line: 82, column: 9, scope: !50)
!80 = !DILocation(line: 92, column: 28, scope: !81)
!81 = distinct !DILexicalBlock(scope: !50, file: !29, line: 83, column: 9)
!82 = !DILocation(line: 92, column: 26, scope: !81)
!83 = !DILocation(line: 93, column: 17, scope: !84)
!84 = distinct !DILexicalBlock(scope: !81, file: !29, line: 93, column: 17)
!85 = !DILocation(line: 93, column: 30, scope: !84)
!86 = !DILocation(line: 93, column: 17, scope: !81)
!87 = !DILocation(line: 95, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !84, file: !29, line: 94, column: 13)
!89 = !DILocation(line: 97, column: 13, scope: !81)
!90 = !DILocation(line: 98, column: 21, scope: !81)
!91 = !DILocation(line: 98, column: 32, scope: !81)
!92 = !DILocation(line: 99, column: 21, scope: !81)
!93 = !DILocation(line: 99, column: 30, scope: !81)
!94 = !DILocation(line: 99, column: 37, scope: !81)
!95 = !DILocation(line: 100, column: 21, scope: !81)
!96 = !DILocation(line: 100, column: 30, scope: !81)
!97 = !DILocation(line: 101, column: 22, scope: !98)
!98 = distinct !DILexicalBlock(scope: !81, file: !29, line: 101, column: 17)
!99 = !DILocation(line: 101, column: 36, scope: !98)
!100 = !DILocation(line: 101, column: 17, scope: !98)
!101 = !DILocation(line: 101, column: 81, scope: !98)
!102 = !DILocation(line: 101, column: 17, scope: !81)
!103 = !DILocation(line: 103, column: 17, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !29, line: 102, column: 13)
!105 = !DILocation(line: 105, column: 24, scope: !106)
!106 = distinct !DILexicalBlock(scope: !81, file: !29, line: 105, column: 17)
!107 = !DILocation(line: 105, column: 17, scope: !106)
!108 = !DILocation(line: 105, column: 54, scope: !106)
!109 = !DILocation(line: 105, column: 17, scope: !81)
!110 = !DILocation(line: 107, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !29, line: 106, column: 13)
!112 = !DILocation(line: 109, column: 35, scope: !81)
!113 = !DILocation(line: 109, column: 28, scope: !81)
!114 = !DILocation(line: 109, column: 26, scope: !81)
!115 = !DILocation(line: 110, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !81, file: !29, line: 110, column: 17)
!117 = !DILocation(line: 110, column: 30, scope: !116)
!118 = !DILocation(line: 110, column: 17, scope: !81)
!119 = !DILocation(line: 112, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !29, line: 111, column: 13)
!121 = !DILocation(line: 115, column: 31, scope: !81)
!122 = !DILocation(line: 115, column: 45, scope: !81)
!123 = !DILocation(line: 115, column: 26, scope: !81)
!124 = !DILocation(line: 115, column: 24, scope: !81)
!125 = !DILocation(line: 116, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !81, file: !29, line: 116, column: 17)
!127 = !DILocation(line: 116, column: 28, scope: !126)
!128 = !DILocation(line: 116, column: 44, scope: !126)
!129 = !DILocation(line: 116, column: 47, scope: !126)
!130 = !DILocation(line: 116, column: 58, scope: !126)
!131 = !DILocation(line: 116, column: 17, scope: !81)
!132 = !DILocation(line: 118, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !29, line: 117, column: 13)
!134 = !DILocation(line: 121, column: 25, scope: !81)
!135 = !DILocation(line: 121, column: 13, scope: !81)
!136 = !DILocation(line: 121, column: 37, scope: !81)
!137 = !DILocation(line: 123, column: 25, scope: !81)
!138 = !DILocation(line: 123, column: 20, scope: !81)
!139 = !DILocation(line: 123, column: 18, scope: !81)
!140 = !DILocation(line: 124, column: 9, scope: !81)
!141 = !DILocation(line: 126, column: 13, scope: !142)
!142 = distinct !DILexicalBlock(scope: !50, file: !29, line: 126, column: 13)
!143 = !DILocation(line: 126, column: 26, scope: !142)
!144 = !DILocation(line: 126, column: 13, scope: !50)
!145 = !DILocation(line: 128, column: 26, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !29, line: 127, column: 9)
!147 = !DILocation(line: 128, column: 13, scope: !146)
!148 = !DILocation(line: 129, column: 9, scope: !146)
!149 = !DILocation(line: 130, column: 13, scope: !150)
!150 = distinct !DILexicalBlock(scope: !50, file: !29, line: 130, column: 13)
!151 = !DILocation(line: 130, column: 26, scope: !150)
!152 = !DILocation(line: 130, column: 13, scope: !50)
!153 = !DILocation(line: 132, column: 26, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !29, line: 131, column: 9)
!155 = !DILocation(line: 132, column: 13, scope: !154)
!156 = !DILocation(line: 133, column: 9, scope: !154)
!157 = !DILocation(line: 141, column: 15, scope: !42)
!158 = !DILocation(line: 142, column: 13, scope: !42)
!159 = !DILocation(line: 142, column: 5, scope: !42)
!160 = !DILocation(line: 143, column: 1, scope: !42)
!161 = distinct !DISubprogram(name: "badSink", scope: !29, file: !29, line: 47, type: !162, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !45)
!162 = !DISubroutineType(types: !163)
!163 = !{null, !30}
!164 = !DILocalVariable(name: "data", arg: 1, scope: !161, file: !29, line: 47, type: !30)
!165 = !DILocation(line: 47, column: 25, scope: !161)
!166 = !DILocation(line: 49, column: 8, scope: !167)
!167 = distinct !DILexicalBlock(scope: !161, file: !29, line: 49, column: 8)
!168 = !DILocation(line: 49, column: 8, scope: !161)
!169 = !DILocalVariable(name: "buffer", scope: !170, file: !29, line: 52, type: !172)
!170 = distinct !DILexicalBlock(scope: !171, file: !29, line: 51, column: 9)
!171 = distinct !DILexicalBlock(scope: !167, file: !29, line: 50, column: 5)
!172 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 320, elements: !173)
!173 = !{!174}
!174 = !DISubrange(count: 10)
!175 = !DILocation(line: 52, column: 17, scope: !170)
!176 = !DILocation(line: 55, column: 17, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !29, line: 55, column: 17)
!178 = !DILocation(line: 55, column: 22, scope: !177)
!179 = !DILocation(line: 55, column: 17, scope: !170)
!180 = !DILocation(line: 57, column: 37, scope: !181)
!181 = distinct !DILexicalBlock(scope: !177, file: !29, line: 56, column: 13)
!182 = !DILocation(line: 57, column: 30, scope: !181)
!183 = !DILocation(line: 57, column: 17, scope: !181)
!184 = !DILocation(line: 58, column: 13, scope: !181)
!185 = !DILocation(line: 61, column: 17, scope: !186)
!186 = distinct !DILexicalBlock(scope: !177, file: !29, line: 60, column: 13)
!187 = !DILocation(line: 64, column: 5, scope: !171)
!188 = !DILocation(line: 65, column: 1, scope: !161)
!189 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_21_good", scope: !29, file: !29, line: 388, type: !43, scopeLine: 389, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!190 = !DILocation(line: 390, column: 5, scope: !189)
!191 = !DILocation(line: 391, column: 5, scope: !189)
!192 = !DILocation(line: 392, column: 5, scope: !189)
!193 = !DILocation(line: 393, column: 1, scope: !189)
!194 = distinct !DISubprogram(name: "main", scope: !29, file: !29, line: 404, type: !195, scopeLine: 405, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !45)
!195 = !DISubroutineType(types: !196)
!196 = !{!30, !30, !197}
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!199 = !DILocalVariable(name: "argc", arg: 1, scope: !194, file: !29, line: 404, type: !30)
!200 = !DILocation(line: 404, column: 14, scope: !194)
!201 = !DILocalVariable(name: "argv", arg: 2, scope: !194, file: !29, line: 404, type: !197)
!202 = !DILocation(line: 404, column: 27, scope: !194)
!203 = !DILocation(line: 407, column: 22, scope: !194)
!204 = !DILocation(line: 407, column: 12, scope: !194)
!205 = !DILocation(line: 407, column: 5, scope: !194)
!206 = !DILocation(line: 409, column: 5, scope: !194)
!207 = !DILocation(line: 410, column: 5, scope: !194)
!208 = !DILocation(line: 411, column: 5, scope: !194)
!209 = !DILocation(line: 414, column: 5, scope: !194)
!210 = !DILocation(line: 415, column: 5, scope: !194)
!211 = !DILocation(line: 416, column: 5, scope: !194)
!212 = !DILocation(line: 418, column: 5, scope: !194)
!213 = distinct !DISubprogram(name: "goodB2G1", scope: !29, file: !29, line: 179, type: !43, scopeLine: 180, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !45)
!214 = !DILocalVariable(name: "data", scope: !213, file: !29, line: 181, type: !30)
!215 = !DILocation(line: 181, column: 9, scope: !213)
!216 = !DILocation(line: 183, column: 10, scope: !213)
!217 = !DILocalVariable(name: "recvResult", scope: !218, file: !29, line: 189, type: !30)
!218 = distinct !DILexicalBlock(scope: !213, file: !29, line: 184, column: 5)
!219 = !DILocation(line: 189, column: 13, scope: !218)
!220 = !DILocalVariable(name: "service", scope: !218, file: !29, line: 190, type: !53)
!221 = !DILocation(line: 190, column: 28, scope: !218)
!222 = !DILocalVariable(name: "listenSocket", scope: !218, file: !29, line: 191, type: !30)
!223 = !DILocation(line: 191, column: 16, scope: !218)
!224 = !DILocalVariable(name: "acceptSocket", scope: !218, file: !29, line: 192, type: !30)
!225 = !DILocation(line: 192, column: 16, scope: !218)
!226 = !DILocalVariable(name: "inputBuffer", scope: !218, file: !29, line: 193, type: !22)
!227 = !DILocation(line: 193, column: 14, scope: !218)
!228 = !DILocation(line: 194, column: 9, scope: !218)
!229 = !DILocation(line: 204, column: 28, scope: !230)
!230 = distinct !DILexicalBlock(scope: !218, file: !29, line: 195, column: 9)
!231 = !DILocation(line: 204, column: 26, scope: !230)
!232 = !DILocation(line: 205, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !29, line: 205, column: 17)
!234 = !DILocation(line: 205, column: 30, scope: !233)
!235 = !DILocation(line: 205, column: 17, scope: !230)
!236 = !DILocation(line: 207, column: 17, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !29, line: 206, column: 13)
!238 = !DILocation(line: 209, column: 13, scope: !230)
!239 = !DILocation(line: 210, column: 21, scope: !230)
!240 = !DILocation(line: 210, column: 32, scope: !230)
!241 = !DILocation(line: 211, column: 21, scope: !230)
!242 = !DILocation(line: 211, column: 30, scope: !230)
!243 = !DILocation(line: 211, column: 37, scope: !230)
!244 = !DILocation(line: 212, column: 21, scope: !230)
!245 = !DILocation(line: 212, column: 30, scope: !230)
!246 = !DILocation(line: 213, column: 22, scope: !247)
!247 = distinct !DILexicalBlock(scope: !230, file: !29, line: 213, column: 17)
!248 = !DILocation(line: 213, column: 36, scope: !247)
!249 = !DILocation(line: 213, column: 17, scope: !247)
!250 = !DILocation(line: 213, column: 81, scope: !247)
!251 = !DILocation(line: 213, column: 17, scope: !230)
!252 = !DILocation(line: 215, column: 17, scope: !253)
!253 = distinct !DILexicalBlock(scope: !247, file: !29, line: 214, column: 13)
!254 = !DILocation(line: 217, column: 24, scope: !255)
!255 = distinct !DILexicalBlock(scope: !230, file: !29, line: 217, column: 17)
!256 = !DILocation(line: 217, column: 17, scope: !255)
!257 = !DILocation(line: 217, column: 54, scope: !255)
!258 = !DILocation(line: 217, column: 17, scope: !230)
!259 = !DILocation(line: 219, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !255, file: !29, line: 218, column: 13)
!261 = !DILocation(line: 221, column: 35, scope: !230)
!262 = !DILocation(line: 221, column: 28, scope: !230)
!263 = !DILocation(line: 221, column: 26, scope: !230)
!264 = !DILocation(line: 222, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !230, file: !29, line: 222, column: 17)
!266 = !DILocation(line: 222, column: 30, scope: !265)
!267 = !DILocation(line: 222, column: 17, scope: !230)
!268 = !DILocation(line: 224, column: 17, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !29, line: 223, column: 13)
!270 = !DILocation(line: 227, column: 31, scope: !230)
!271 = !DILocation(line: 227, column: 45, scope: !230)
!272 = !DILocation(line: 227, column: 26, scope: !230)
!273 = !DILocation(line: 227, column: 24, scope: !230)
!274 = !DILocation(line: 228, column: 17, scope: !275)
!275 = distinct !DILexicalBlock(scope: !230, file: !29, line: 228, column: 17)
!276 = !DILocation(line: 228, column: 28, scope: !275)
!277 = !DILocation(line: 228, column: 44, scope: !275)
!278 = !DILocation(line: 228, column: 47, scope: !275)
!279 = !DILocation(line: 228, column: 58, scope: !275)
!280 = !DILocation(line: 228, column: 17, scope: !230)
!281 = !DILocation(line: 230, column: 17, scope: !282)
!282 = distinct !DILexicalBlock(scope: !275, file: !29, line: 229, column: 13)
!283 = !DILocation(line: 233, column: 25, scope: !230)
!284 = !DILocation(line: 233, column: 13, scope: !230)
!285 = !DILocation(line: 233, column: 37, scope: !230)
!286 = !DILocation(line: 235, column: 25, scope: !230)
!287 = !DILocation(line: 235, column: 20, scope: !230)
!288 = !DILocation(line: 235, column: 18, scope: !230)
!289 = !DILocation(line: 236, column: 9, scope: !230)
!290 = !DILocation(line: 238, column: 13, scope: !291)
!291 = distinct !DILexicalBlock(scope: !218, file: !29, line: 238, column: 13)
!292 = !DILocation(line: 238, column: 26, scope: !291)
!293 = !DILocation(line: 238, column: 13, scope: !218)
!294 = !DILocation(line: 240, column: 26, scope: !295)
!295 = distinct !DILexicalBlock(scope: !291, file: !29, line: 239, column: 9)
!296 = !DILocation(line: 240, column: 13, scope: !295)
!297 = !DILocation(line: 241, column: 9, scope: !295)
!298 = !DILocation(line: 242, column: 13, scope: !299)
!299 = distinct !DILexicalBlock(scope: !218, file: !29, line: 242, column: 13)
!300 = !DILocation(line: 242, column: 26, scope: !299)
!301 = !DILocation(line: 242, column: 13, scope: !218)
!302 = !DILocation(line: 244, column: 26, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !29, line: 243, column: 9)
!304 = !DILocation(line: 244, column: 13, scope: !303)
!305 = !DILocation(line: 245, column: 9, scope: !303)
!306 = !DILocation(line: 253, column: 20, scope: !213)
!307 = !DILocation(line: 254, column: 18, scope: !213)
!308 = !DILocation(line: 254, column: 5, scope: !213)
!309 = !DILocation(line: 255, column: 1, scope: !213)
!310 = distinct !DISubprogram(name: "goodB2G1Sink", scope: !29, file: !29, line: 155, type: !162, scopeLine: 156, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !45)
!311 = !DILocalVariable(name: "data", arg: 1, scope: !310, file: !29, line: 155, type: !30)
!312 = !DILocation(line: 155, column: 30, scope: !310)
!313 = !DILocation(line: 157, column: 8, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !29, line: 157, column: 8)
!315 = !DILocation(line: 157, column: 8, scope: !310)
!316 = !DILocation(line: 160, column: 9, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !29, line: 158, column: 5)
!318 = !DILocation(line: 161, column: 5, scope: !317)
!319 = !DILocalVariable(name: "buffer", scope: !320, file: !29, line: 165, type: !172)
!320 = distinct !DILexicalBlock(scope: !321, file: !29, line: 164, column: 9)
!321 = distinct !DILexicalBlock(scope: !314, file: !29, line: 163, column: 5)
!322 = !DILocation(line: 165, column: 17, scope: !320)
!323 = !DILocation(line: 167, column: 17, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !29, line: 167, column: 17)
!325 = !DILocation(line: 167, column: 22, scope: !324)
!326 = !DILocation(line: 167, column: 27, scope: !324)
!327 = !DILocation(line: 167, column: 30, scope: !324)
!328 = !DILocation(line: 167, column: 35, scope: !324)
!329 = !DILocation(line: 167, column: 17, scope: !320)
!330 = !DILocation(line: 169, column: 37, scope: !331)
!331 = distinct !DILexicalBlock(scope: !324, file: !29, line: 168, column: 13)
!332 = !DILocation(line: 169, column: 30, scope: !331)
!333 = !DILocation(line: 169, column: 17, scope: !331)
!334 = !DILocation(line: 170, column: 13, scope: !331)
!335 = !DILocation(line: 173, column: 17, scope: !336)
!336 = distinct !DILexicalBlock(scope: !324, file: !29, line: 172, column: 13)
!337 = !DILocation(line: 177, column: 1, scope: !310)
!338 = distinct !DISubprogram(name: "goodB2G2", scope: !29, file: !29, line: 277, type: !43, scopeLine: 278, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !45)
!339 = !DILocalVariable(name: "data", scope: !338, file: !29, line: 279, type: !30)
!340 = !DILocation(line: 279, column: 9, scope: !338)
!341 = !DILocation(line: 281, column: 10, scope: !338)
!342 = !DILocalVariable(name: "recvResult", scope: !343, file: !29, line: 287, type: !30)
!343 = distinct !DILexicalBlock(scope: !338, file: !29, line: 282, column: 5)
!344 = !DILocation(line: 287, column: 13, scope: !343)
!345 = !DILocalVariable(name: "service", scope: !343, file: !29, line: 288, type: !53)
!346 = !DILocation(line: 288, column: 28, scope: !343)
!347 = !DILocalVariable(name: "listenSocket", scope: !343, file: !29, line: 289, type: !30)
!348 = !DILocation(line: 289, column: 16, scope: !343)
!349 = !DILocalVariable(name: "acceptSocket", scope: !343, file: !29, line: 290, type: !30)
!350 = !DILocation(line: 290, column: 16, scope: !343)
!351 = !DILocalVariable(name: "inputBuffer", scope: !343, file: !29, line: 291, type: !22)
!352 = !DILocation(line: 291, column: 14, scope: !343)
!353 = !DILocation(line: 292, column: 9, scope: !343)
!354 = !DILocation(line: 302, column: 28, scope: !355)
!355 = distinct !DILexicalBlock(scope: !343, file: !29, line: 293, column: 9)
!356 = !DILocation(line: 302, column: 26, scope: !355)
!357 = !DILocation(line: 303, column: 17, scope: !358)
!358 = distinct !DILexicalBlock(scope: !355, file: !29, line: 303, column: 17)
!359 = !DILocation(line: 303, column: 30, scope: !358)
!360 = !DILocation(line: 303, column: 17, scope: !355)
!361 = !DILocation(line: 305, column: 17, scope: !362)
!362 = distinct !DILexicalBlock(scope: !358, file: !29, line: 304, column: 13)
!363 = !DILocation(line: 307, column: 13, scope: !355)
!364 = !DILocation(line: 308, column: 21, scope: !355)
!365 = !DILocation(line: 308, column: 32, scope: !355)
!366 = !DILocation(line: 309, column: 21, scope: !355)
!367 = !DILocation(line: 309, column: 30, scope: !355)
!368 = !DILocation(line: 309, column: 37, scope: !355)
!369 = !DILocation(line: 310, column: 21, scope: !355)
!370 = !DILocation(line: 310, column: 30, scope: !355)
!371 = !DILocation(line: 311, column: 22, scope: !372)
!372 = distinct !DILexicalBlock(scope: !355, file: !29, line: 311, column: 17)
!373 = !DILocation(line: 311, column: 36, scope: !372)
!374 = !DILocation(line: 311, column: 17, scope: !372)
!375 = !DILocation(line: 311, column: 81, scope: !372)
!376 = !DILocation(line: 311, column: 17, scope: !355)
!377 = !DILocation(line: 313, column: 17, scope: !378)
!378 = distinct !DILexicalBlock(scope: !372, file: !29, line: 312, column: 13)
!379 = !DILocation(line: 315, column: 24, scope: !380)
!380 = distinct !DILexicalBlock(scope: !355, file: !29, line: 315, column: 17)
!381 = !DILocation(line: 315, column: 17, scope: !380)
!382 = !DILocation(line: 315, column: 54, scope: !380)
!383 = !DILocation(line: 315, column: 17, scope: !355)
!384 = !DILocation(line: 317, column: 17, scope: !385)
!385 = distinct !DILexicalBlock(scope: !380, file: !29, line: 316, column: 13)
!386 = !DILocation(line: 319, column: 35, scope: !355)
!387 = !DILocation(line: 319, column: 28, scope: !355)
!388 = !DILocation(line: 319, column: 26, scope: !355)
!389 = !DILocation(line: 320, column: 17, scope: !390)
!390 = distinct !DILexicalBlock(scope: !355, file: !29, line: 320, column: 17)
!391 = !DILocation(line: 320, column: 30, scope: !390)
!392 = !DILocation(line: 320, column: 17, scope: !355)
!393 = !DILocation(line: 322, column: 17, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !29, line: 321, column: 13)
!395 = !DILocation(line: 325, column: 31, scope: !355)
!396 = !DILocation(line: 325, column: 45, scope: !355)
!397 = !DILocation(line: 325, column: 26, scope: !355)
!398 = !DILocation(line: 325, column: 24, scope: !355)
!399 = !DILocation(line: 326, column: 17, scope: !400)
!400 = distinct !DILexicalBlock(scope: !355, file: !29, line: 326, column: 17)
!401 = !DILocation(line: 326, column: 28, scope: !400)
!402 = !DILocation(line: 326, column: 44, scope: !400)
!403 = !DILocation(line: 326, column: 47, scope: !400)
!404 = !DILocation(line: 326, column: 58, scope: !400)
!405 = !DILocation(line: 326, column: 17, scope: !355)
!406 = !DILocation(line: 328, column: 17, scope: !407)
!407 = distinct !DILexicalBlock(scope: !400, file: !29, line: 327, column: 13)
!408 = !DILocation(line: 331, column: 25, scope: !355)
!409 = !DILocation(line: 331, column: 13, scope: !355)
!410 = !DILocation(line: 331, column: 37, scope: !355)
!411 = !DILocation(line: 333, column: 25, scope: !355)
!412 = !DILocation(line: 333, column: 20, scope: !355)
!413 = !DILocation(line: 333, column: 18, scope: !355)
!414 = !DILocation(line: 334, column: 9, scope: !355)
!415 = !DILocation(line: 336, column: 13, scope: !416)
!416 = distinct !DILexicalBlock(scope: !343, file: !29, line: 336, column: 13)
!417 = !DILocation(line: 336, column: 26, scope: !416)
!418 = !DILocation(line: 336, column: 13, scope: !343)
!419 = !DILocation(line: 338, column: 26, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !29, line: 337, column: 9)
!421 = !DILocation(line: 338, column: 13, scope: !420)
!422 = !DILocation(line: 339, column: 9, scope: !420)
!423 = !DILocation(line: 340, column: 13, scope: !424)
!424 = distinct !DILexicalBlock(scope: !343, file: !29, line: 340, column: 13)
!425 = !DILocation(line: 340, column: 26, scope: !424)
!426 = !DILocation(line: 340, column: 13, scope: !343)
!427 = !DILocation(line: 342, column: 26, scope: !428)
!428 = distinct !DILexicalBlock(scope: !424, file: !29, line: 341, column: 9)
!429 = !DILocation(line: 342, column: 13, scope: !428)
!430 = !DILocation(line: 343, column: 9, scope: !428)
!431 = !DILocation(line: 351, column: 20, scope: !338)
!432 = !DILocation(line: 352, column: 18, scope: !338)
!433 = !DILocation(line: 352, column: 5, scope: !338)
!434 = !DILocation(line: 353, column: 1, scope: !338)
!435 = distinct !DISubprogram(name: "goodB2G2Sink", scope: !29, file: !29, line: 258, type: !162, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !45)
!436 = !DILocalVariable(name: "data", arg: 1, scope: !435, file: !29, line: 258, type: !30)
!437 = !DILocation(line: 258, column: 30, scope: !435)
!438 = !DILocation(line: 260, column: 8, scope: !439)
!439 = distinct !DILexicalBlock(scope: !435, file: !29, line: 260, column: 8)
!440 = !DILocation(line: 260, column: 8, scope: !435)
!441 = !DILocalVariable(name: "buffer", scope: !442, file: !29, line: 263, type: !172)
!442 = distinct !DILexicalBlock(scope: !443, file: !29, line: 262, column: 9)
!443 = distinct !DILexicalBlock(scope: !439, file: !29, line: 261, column: 5)
!444 = !DILocation(line: 263, column: 17, scope: !442)
!445 = !DILocation(line: 265, column: 17, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !29, line: 265, column: 17)
!447 = !DILocation(line: 265, column: 22, scope: !446)
!448 = !DILocation(line: 265, column: 27, scope: !446)
!449 = !DILocation(line: 265, column: 30, scope: !446)
!450 = !DILocation(line: 265, column: 35, scope: !446)
!451 = !DILocation(line: 265, column: 17, scope: !442)
!452 = !DILocation(line: 267, column: 37, scope: !453)
!453 = distinct !DILexicalBlock(scope: !446, file: !29, line: 266, column: 13)
!454 = !DILocation(line: 267, column: 30, scope: !453)
!455 = !DILocation(line: 267, column: 17, scope: !453)
!456 = !DILocation(line: 268, column: 13, scope: !453)
!457 = !DILocation(line: 271, column: 17, scope: !458)
!458 = distinct !DILexicalBlock(scope: !446, file: !29, line: 270, column: 13)
!459 = !DILocation(line: 274, column: 5, scope: !443)
!460 = !DILocation(line: 275, column: 1, scope: !435)
!461 = distinct !DISubprogram(name: "goodG2B", scope: !29, file: !29, line: 376, type: !43, scopeLine: 377, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !45)
!462 = !DILocalVariable(name: "data", scope: !461, file: !29, line: 378, type: !30)
!463 = !DILocation(line: 378, column: 9, scope: !461)
!464 = !DILocation(line: 380, column: 10, scope: !461)
!465 = !DILocation(line: 383, column: 10, scope: !461)
!466 = !DILocation(line: 384, column: 19, scope: !461)
!467 = !DILocation(line: 385, column: 17, scope: !461)
!468 = !DILocation(line: 385, column: 5, scope: !461)
!469 = !DILocation(line: 386, column: 1, scope: !461)
!470 = distinct !DISubprogram(name: "goodG2BSink", scope: !29, file: !29, line: 356, type: !162, scopeLine: 357, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !45)
!471 = !DILocalVariable(name: "data", arg: 1, scope: !470, file: !29, line: 356, type: !30)
!472 = !DILocation(line: 356, column: 29, scope: !470)
!473 = !DILocation(line: 358, column: 8, scope: !474)
!474 = distinct !DILexicalBlock(scope: !470, file: !29, line: 358, column: 8)
!475 = !DILocation(line: 358, column: 8, scope: !470)
!476 = !DILocalVariable(name: "buffer", scope: !477, file: !29, line: 361, type: !172)
!477 = distinct !DILexicalBlock(scope: !478, file: !29, line: 360, column: 9)
!478 = distinct !DILexicalBlock(scope: !474, file: !29, line: 359, column: 5)
!479 = !DILocation(line: 361, column: 17, scope: !477)
!480 = !DILocation(line: 364, column: 17, scope: !481)
!481 = distinct !DILexicalBlock(scope: !477, file: !29, line: 364, column: 17)
!482 = !DILocation(line: 364, column: 22, scope: !481)
!483 = !DILocation(line: 364, column: 17, scope: !477)
!484 = !DILocation(line: 366, column: 37, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !29, line: 365, column: 13)
!486 = !DILocation(line: 366, column: 30, scope: !485)
!487 = !DILocation(line: 366, column: 17, scope: !485)
!488 = !DILocation(line: 367, column: 13, scope: !485)
!489 = !DILocation(line: 370, column: 17, scope: !490)
!490 = distinct !DILexicalBlock(scope: !481, file: !29, line: 369, column: 13)
!491 = !DILocation(line: 373, column: 5, scope: !478)
!492 = !DILocation(line: 374, column: 1, scope: !470)
