; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_01-1.c"
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
@.str.5 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_listen_socket_01_bad() #0 !dbg !31 {
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
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !148, metadata !DIExpression()), !dbg !153
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !153
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !153
  %16 = load i32, i32* %data, align 4, !dbg !154
  %cmp32 = icmp sge i32 %16, 0, !dbg !156
  br i1 %cmp32, label %if.then34, label %if.else, !dbg !157

if.then34:                                        ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !158
  %idxprom35 = sext i32 %17 to i64, !dbg !160
  %arrayidx36 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom35, !dbg !160
  %18 = load i32, i32* %arrayidx36, align 4, !dbg !160
  call void @printIntLine(i32 noundef %18), !dbg !161
  br label %if.end37, !dbg !162

if.else:                                          ; preds = %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !163
  br label %if.end37

if.end37:                                         ; preds = %if.else, %if.then34
  ret void, !dbg !165
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
define void @CWE126_Buffer_Overread__CWE129_listen_socket_01_good() #0 !dbg !166 {
entry:
  call void @goodG2B(), !dbg !167
  call void @goodB2G(), !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !170 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !175, metadata !DIExpression()), !dbg !176
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !177, metadata !DIExpression()), !dbg !178
  %call = call i64 @time(i64* noundef null), !dbg !179
  %conv = trunc i64 %call to i32, !dbg !180
  call void @srand(i32 noundef %conv), !dbg !181
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !182
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_01_good(), !dbg !183
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !184
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !185
  call void @CWE126_Buffer_Overread__CWE129_listen_socket_01_bad(), !dbg !186
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !187
  ret i32 0, !dbg !188
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !189 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !190, metadata !DIExpression()), !dbg !191
  store i32 -1, i32* %data, align 4, !dbg !192
  store i32 7, i32* %data, align 4, !dbg !193
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !194, metadata !DIExpression()), !dbg !196
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !196
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !196
  %1 = load i32, i32* %data, align 4, !dbg !197
  %cmp = icmp sge i32 %1, 0, !dbg !199
  br i1 %cmp, label %if.then, label %if.else, !dbg !200

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %data, align 4, !dbg !201
  %idxprom = sext i32 %2 to i64, !dbg !203
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !203
  %3 = load i32, i32* %arrayidx, align 4, !dbg !203
  call void @printIntLine(i32 noundef %3), !dbg !204
  br label %if.end, !dbg !205

if.else:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0)), !dbg !206
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !208
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !209 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %listenSocket = alloca i32, align 4
  %acceptSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !210, metadata !DIExpression()), !dbg !211
  store i32 -1, i32* %data, align 4, !dbg !212
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !213, metadata !DIExpression()), !dbg !215
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.declare(metadata i32* %listenSocket, metadata !218, metadata !DIExpression()), !dbg !219
  store i32 -1, i32* %listenSocket, align 4, !dbg !219
  call void @llvm.dbg.declare(metadata i32* %acceptSocket, metadata !220, metadata !DIExpression()), !dbg !221
  store i32 -1, i32* %acceptSocket, align 4, !dbg !221
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !222, metadata !DIExpression()), !dbg !223
  br label %do.body, !dbg !224

do.body:                                          ; preds = %entry
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !225
  store i32 %call, i32* %listenSocket, align 4, !dbg !227
  %0 = load i32, i32* %listenSocket, align 4, !dbg !228
  %cmp = icmp eq i32 %0, -1, !dbg !230
  br i1 %cmp, label %if.then, label %if.end, !dbg !231

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !232

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !234
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !234
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !235
  store i8 2, i8* %sin_family, align 1, !dbg !236
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !237
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !238
  store i32 0, i32* %s_addr, align 4, !dbg !239
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !240
  store i16 -30871, i16* %sin_port, align 2, !dbg !241
  %2 = load i32, i32* %listenSocket, align 4, !dbg !242
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !244
  %call1 = call i32 @"\01_bind"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !245
  %cmp2 = icmp eq i32 %call1, -1, !dbg !246
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !247

if.then3:                                         ; preds = %if.end
  br label %do.end, !dbg !248

if.end4:                                          ; preds = %if.end
  %4 = load i32, i32* %listenSocket, align 4, !dbg !250
  %call5 = call i32 @"\01_listen"(i32 noundef %4, i32 noundef 5), !dbg !252
  %cmp6 = icmp eq i32 %call5, -1, !dbg !253
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !254

if.then7:                                         ; preds = %if.end4
  br label %do.end, !dbg !255

if.end8:                                          ; preds = %if.end4
  %5 = load i32, i32* %listenSocket, align 4, !dbg !257
  %call9 = call i32 @"\01_accept"(i32 noundef %5, %struct.sockaddr* noundef null, i32* noundef null), !dbg !258
  store i32 %call9, i32* %acceptSocket, align 4, !dbg !259
  %6 = load i32, i32* %acceptSocket, align 4, !dbg !260
  %cmp10 = icmp eq i32 %6, -1, !dbg !262
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !263

if.then11:                                        ; preds = %if.end8
  br label %do.end, !dbg !264

if.end12:                                         ; preds = %if.end8
  %7 = load i32, i32* %acceptSocket, align 4, !dbg !266
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !267
  %call13 = call i64 @"\01_recv"(i32 noundef %7, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !268
  %conv = trunc i64 %call13 to i32, !dbg !268
  store i32 %conv, i32* %recvResult, align 4, !dbg !269
  %8 = load i32, i32* %recvResult, align 4, !dbg !270
  %cmp14 = icmp eq i32 %8, -1, !dbg !272
  br i1 %cmp14, label %if.then18, label %lor.lhs.false, !dbg !273

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i32, i32* %recvResult, align 4, !dbg !274
  %cmp16 = icmp eq i32 %9, 0, !dbg !275
  br i1 %cmp16, label %if.then18, label %if.end19, !dbg !276

if.then18:                                        ; preds = %lor.lhs.false, %if.end12
  br label %do.end, !dbg !277

if.end19:                                         ; preds = %lor.lhs.false
  %10 = load i32, i32* %recvResult, align 4, !dbg !279
  %idxprom = sext i32 %10 to i64, !dbg !280
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !280
  store i8 0, i8* %arrayidx, align 1, !dbg !281
  %arraydecay20 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !282
  %call21 = call i32 @atoi(i8* noundef %arraydecay20), !dbg !283
  store i32 %call21, i32* %data, align 4, !dbg !284
  br label %do.end, !dbg !285

do.end:                                           ; preds = %if.end19, %if.then18, %if.then11, %if.then7, %if.then3, %if.then
  %11 = load i32, i32* %listenSocket, align 4, !dbg !286
  %cmp22 = icmp ne i32 %11, -1, !dbg !288
  br i1 %cmp22, label %if.then24, label %if.end26, !dbg !289

if.then24:                                        ; preds = %do.end
  %12 = load i32, i32* %listenSocket, align 4, !dbg !290
  %call25 = call i32 @"\01_close"(i32 noundef %12), !dbg !292
  br label %if.end26, !dbg !293

if.end26:                                         ; preds = %if.then24, %do.end
  %13 = load i32, i32* %acceptSocket, align 4, !dbg !294
  %cmp27 = icmp ne i32 %13, -1, !dbg !296
  br i1 %cmp27, label %if.then29, label %if.end31, !dbg !297

if.then29:                                        ; preds = %if.end26
  %14 = load i32, i32* %acceptSocket, align 4, !dbg !298
  %call30 = call i32 @"\01_close"(i32 noundef %14), !dbg !300
  br label %if.end31, !dbg !301

if.end31:                                         ; preds = %if.then29, %if.end26
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !302, metadata !DIExpression()), !dbg !304
  %15 = bitcast [10 x i32]* %buffer to i8*, !dbg !304
  call void @llvm.memset.p0i8.i64(i8* align 16 %15, i8 0, i64 40, i1 false), !dbg !304
  %16 = load i32, i32* %data, align 4, !dbg !305
  %cmp32 = icmp sge i32 %16, 0, !dbg !307
  br i1 %cmp32, label %land.lhs.true, label %if.else, !dbg !308

land.lhs.true:                                    ; preds = %if.end31
  %17 = load i32, i32* %data, align 4, !dbg !309
  %cmp34 = icmp slt i32 %17, 10, !dbg !310
  br i1 %cmp34, label %if.then36, label %if.else, !dbg !311

if.then36:                                        ; preds = %land.lhs.true
  %18 = load i32, i32* %data, align 4, !dbg !312
  %idxprom37 = sext i32 %18 to i64, !dbg !314
  %arrayidx38 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom37, !dbg !314
  %19 = load i32, i32* %arrayidx38, align 4, !dbg !314
  call void @printIntLine(i32 noundef %19), !dbg !315
  br label %if.end39, !dbg !316

if.else:                                          ; preds = %land.lhs.true, %if.end31
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.5, i64 0, i64 0)), !dbg !317
  br label %if.end39

if.end39:                                         ; preds = %if.else, %if.then36
  ret void, !dbg !319
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!24, !25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!31 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_01_bad", scope: !32, file: !32, line: 44, type: !33, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!32 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_listen_socket_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!148 = !DILocalVariable(name: "buffer", scope: !149, file: !32, line: 119, type: !150)
!149 = distinct !DILexicalBlock(scope: !31, file: !32, line: 118, column: 5)
!150 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 320, elements: !151)
!151 = !{!152}
!152 = !DISubrange(count: 10)
!153 = !DILocation(line: 119, column: 13, scope: !149)
!154 = !DILocation(line: 122, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !149, file: !32, line: 122, column: 13)
!156 = !DILocation(line: 122, column: 18, scope: !155)
!157 = !DILocation(line: 122, column: 13, scope: !149)
!158 = !DILocation(line: 124, column: 33, scope: !159)
!159 = distinct !DILexicalBlock(scope: !155, file: !32, line: 123, column: 9)
!160 = !DILocation(line: 124, column: 26, scope: !159)
!161 = !DILocation(line: 124, column: 13, scope: !159)
!162 = !DILocation(line: 125, column: 9, scope: !159)
!163 = !DILocation(line: 128, column: 13, scope: !164)
!164 = distinct !DILexicalBlock(scope: !155, file: !32, line: 127, column: 9)
!165 = !DILocation(line: 131, column: 1, scope: !31)
!166 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_listen_socket_01_good", scope: !32, file: !32, line: 250, type: !33, scopeLine: 251, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!167 = !DILocation(line: 252, column: 5, scope: !166)
!168 = !DILocation(line: 253, column: 5, scope: !166)
!169 = !DILocation(line: 254, column: 1, scope: !166)
!170 = distinct !DISubprogram(name: "main", scope: !32, file: !32, line: 265, type: !171, scopeLine: 266, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!171 = !DISubroutineType(types: !172)
!172 = !{!37, !37, !173}
!173 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!175 = !DILocalVariable(name: "argc", arg: 1, scope: !170, file: !32, line: 265, type: !37)
!176 = !DILocation(line: 265, column: 14, scope: !170)
!177 = !DILocalVariable(name: "argv", arg: 2, scope: !170, file: !32, line: 265, type: !173)
!178 = !DILocation(line: 265, column: 27, scope: !170)
!179 = !DILocation(line: 268, column: 22, scope: !170)
!180 = !DILocation(line: 268, column: 12, scope: !170)
!181 = !DILocation(line: 268, column: 5, scope: !170)
!182 = !DILocation(line: 270, column: 5, scope: !170)
!183 = !DILocation(line: 271, column: 5, scope: !170)
!184 = !DILocation(line: 272, column: 5, scope: !170)
!185 = !DILocation(line: 275, column: 5, scope: !170)
!186 = !DILocation(line: 276, column: 5, scope: !170)
!187 = !DILocation(line: 277, column: 5, scope: !170)
!188 = !DILocation(line: 279, column: 5, scope: !170)
!189 = distinct !DISubprogram(name: "goodG2B", scope: !32, file: !32, line: 138, type: !33, scopeLine: 139, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!190 = !DILocalVariable(name: "data", scope: !189, file: !32, line: 140, type: !37)
!191 = !DILocation(line: 140, column: 9, scope: !189)
!192 = !DILocation(line: 142, column: 10, scope: !189)
!193 = !DILocation(line: 145, column: 10, scope: !189)
!194 = !DILocalVariable(name: "buffer", scope: !195, file: !32, line: 147, type: !150)
!195 = distinct !DILexicalBlock(scope: !189, file: !32, line: 146, column: 5)
!196 = !DILocation(line: 147, column: 13, scope: !195)
!197 = !DILocation(line: 150, column: 13, scope: !198)
!198 = distinct !DILexicalBlock(scope: !195, file: !32, line: 150, column: 13)
!199 = !DILocation(line: 150, column: 18, scope: !198)
!200 = !DILocation(line: 150, column: 13, scope: !195)
!201 = !DILocation(line: 152, column: 33, scope: !202)
!202 = distinct !DILexicalBlock(scope: !198, file: !32, line: 151, column: 9)
!203 = !DILocation(line: 152, column: 26, scope: !202)
!204 = !DILocation(line: 152, column: 13, scope: !202)
!205 = !DILocation(line: 153, column: 9, scope: !202)
!206 = !DILocation(line: 156, column: 13, scope: !207)
!207 = distinct !DILexicalBlock(scope: !198, file: !32, line: 155, column: 9)
!208 = !DILocation(line: 159, column: 1, scope: !189)
!209 = distinct !DISubprogram(name: "goodB2G", scope: !32, file: !32, line: 162, type: !33, scopeLine: 163, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !35)
!210 = !DILocalVariable(name: "data", scope: !209, file: !32, line: 164, type: !37)
!211 = !DILocation(line: 164, column: 9, scope: !209)
!212 = !DILocation(line: 166, column: 10, scope: !209)
!213 = !DILocalVariable(name: "recvResult", scope: !214, file: !32, line: 172, type: !37)
!214 = distinct !DILexicalBlock(scope: !209, file: !32, line: 167, column: 5)
!215 = !DILocation(line: 172, column: 13, scope: !214)
!216 = !DILocalVariable(name: "service", scope: !214, file: !32, line: 173, type: !44)
!217 = !DILocation(line: 173, column: 28, scope: !214)
!218 = !DILocalVariable(name: "listenSocket", scope: !214, file: !32, line: 174, type: !37)
!219 = !DILocation(line: 174, column: 16, scope: !214)
!220 = !DILocalVariable(name: "acceptSocket", scope: !214, file: !32, line: 175, type: !37)
!221 = !DILocation(line: 175, column: 16, scope: !214)
!222 = !DILocalVariable(name: "inputBuffer", scope: !214, file: !32, line: 176, type: !20)
!223 = !DILocation(line: 176, column: 14, scope: !214)
!224 = !DILocation(line: 177, column: 9, scope: !214)
!225 = !DILocation(line: 187, column: 28, scope: !226)
!226 = distinct !DILexicalBlock(scope: !214, file: !32, line: 178, column: 9)
!227 = !DILocation(line: 187, column: 26, scope: !226)
!228 = !DILocation(line: 188, column: 17, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !32, line: 188, column: 17)
!230 = !DILocation(line: 188, column: 30, scope: !229)
!231 = !DILocation(line: 188, column: 17, scope: !226)
!232 = !DILocation(line: 190, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !32, line: 189, column: 13)
!234 = !DILocation(line: 192, column: 13, scope: !226)
!235 = !DILocation(line: 193, column: 21, scope: !226)
!236 = !DILocation(line: 193, column: 32, scope: !226)
!237 = !DILocation(line: 194, column: 21, scope: !226)
!238 = !DILocation(line: 194, column: 30, scope: !226)
!239 = !DILocation(line: 194, column: 37, scope: !226)
!240 = !DILocation(line: 195, column: 21, scope: !226)
!241 = !DILocation(line: 195, column: 30, scope: !226)
!242 = !DILocation(line: 196, column: 22, scope: !243)
!243 = distinct !DILexicalBlock(scope: !226, file: !32, line: 196, column: 17)
!244 = !DILocation(line: 196, column: 36, scope: !243)
!245 = !DILocation(line: 196, column: 17, scope: !243)
!246 = !DILocation(line: 196, column: 81, scope: !243)
!247 = !DILocation(line: 196, column: 17, scope: !226)
!248 = !DILocation(line: 198, column: 17, scope: !249)
!249 = distinct !DILexicalBlock(scope: !243, file: !32, line: 197, column: 13)
!250 = !DILocation(line: 200, column: 24, scope: !251)
!251 = distinct !DILexicalBlock(scope: !226, file: !32, line: 200, column: 17)
!252 = !DILocation(line: 200, column: 17, scope: !251)
!253 = !DILocation(line: 200, column: 54, scope: !251)
!254 = !DILocation(line: 200, column: 17, scope: !226)
!255 = !DILocation(line: 202, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !251, file: !32, line: 201, column: 13)
!257 = !DILocation(line: 204, column: 35, scope: !226)
!258 = !DILocation(line: 204, column: 28, scope: !226)
!259 = !DILocation(line: 204, column: 26, scope: !226)
!260 = !DILocation(line: 205, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !226, file: !32, line: 205, column: 17)
!262 = !DILocation(line: 205, column: 30, scope: !261)
!263 = !DILocation(line: 205, column: 17, scope: !226)
!264 = !DILocation(line: 207, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !261, file: !32, line: 206, column: 13)
!266 = !DILocation(line: 210, column: 31, scope: !226)
!267 = !DILocation(line: 210, column: 45, scope: !226)
!268 = !DILocation(line: 210, column: 26, scope: !226)
!269 = !DILocation(line: 210, column: 24, scope: !226)
!270 = !DILocation(line: 211, column: 17, scope: !271)
!271 = distinct !DILexicalBlock(scope: !226, file: !32, line: 211, column: 17)
!272 = !DILocation(line: 211, column: 28, scope: !271)
!273 = !DILocation(line: 211, column: 44, scope: !271)
!274 = !DILocation(line: 211, column: 47, scope: !271)
!275 = !DILocation(line: 211, column: 58, scope: !271)
!276 = !DILocation(line: 211, column: 17, scope: !226)
!277 = !DILocation(line: 213, column: 17, scope: !278)
!278 = distinct !DILexicalBlock(scope: !271, file: !32, line: 212, column: 13)
!279 = !DILocation(line: 216, column: 25, scope: !226)
!280 = !DILocation(line: 216, column: 13, scope: !226)
!281 = !DILocation(line: 216, column: 37, scope: !226)
!282 = !DILocation(line: 218, column: 25, scope: !226)
!283 = !DILocation(line: 218, column: 20, scope: !226)
!284 = !DILocation(line: 218, column: 18, scope: !226)
!285 = !DILocation(line: 219, column: 9, scope: !226)
!286 = !DILocation(line: 221, column: 13, scope: !287)
!287 = distinct !DILexicalBlock(scope: !214, file: !32, line: 221, column: 13)
!288 = !DILocation(line: 221, column: 26, scope: !287)
!289 = !DILocation(line: 221, column: 13, scope: !214)
!290 = !DILocation(line: 223, column: 26, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !32, line: 222, column: 9)
!292 = !DILocation(line: 223, column: 13, scope: !291)
!293 = !DILocation(line: 224, column: 9, scope: !291)
!294 = !DILocation(line: 225, column: 13, scope: !295)
!295 = distinct !DILexicalBlock(scope: !214, file: !32, line: 225, column: 13)
!296 = !DILocation(line: 225, column: 26, scope: !295)
!297 = !DILocation(line: 225, column: 13, scope: !214)
!298 = !DILocation(line: 227, column: 26, scope: !299)
!299 = distinct !DILexicalBlock(scope: !295, file: !32, line: 226, column: 9)
!300 = !DILocation(line: 227, column: 13, scope: !299)
!301 = !DILocation(line: 228, column: 9, scope: !299)
!302 = !DILocalVariable(name: "buffer", scope: !303, file: !32, line: 237, type: !150)
!303 = distinct !DILexicalBlock(scope: !209, file: !32, line: 236, column: 5)
!304 = !DILocation(line: 237, column: 13, scope: !303)
!305 = !DILocation(line: 239, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !303, file: !32, line: 239, column: 13)
!307 = !DILocation(line: 239, column: 18, scope: !306)
!308 = !DILocation(line: 239, column: 23, scope: !306)
!309 = !DILocation(line: 239, column: 26, scope: !306)
!310 = !DILocation(line: 239, column: 31, scope: !306)
!311 = !DILocation(line: 239, column: 13, scope: !303)
!312 = !DILocation(line: 241, column: 33, scope: !313)
!313 = distinct !DILexicalBlock(scope: !306, file: !32, line: 240, column: 9)
!314 = !DILocation(line: 241, column: 26, scope: !313)
!315 = !DILocation(line: 241, column: 13, scope: !313)
!316 = !DILocation(line: 242, column: 9, scope: !313)
!317 = !DILocation(line: 245, column: 13, scope: !318)
!318 = distinct !DILexicalBlock(scope: !306, file: !32, line: 244, column: 9)
!319 = !DILocation(line: 248, column: 1, scope: !209)
