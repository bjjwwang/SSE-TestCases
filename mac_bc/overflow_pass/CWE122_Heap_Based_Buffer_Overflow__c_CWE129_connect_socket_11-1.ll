; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.sockaddr_in = type { i8, i8, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i8, i8, [14 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"127.0.0.1\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"ERROR: Array index is negative.\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.4 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11_bad() #0 !dbg !32 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 -1, i32* %data, align 4, !dbg !39
  %call = call i32 (...) @globalReturnsTrue(), !dbg !40
  %tobool = icmp ne i32 %call, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end22, !dbg !42

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !43, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !47, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !68, metadata !DIExpression()), !dbg !69
  store i32 -1, i32* %connectSocket, align 4, !dbg !69
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !70, metadata !DIExpression()), !dbg !71
  br label %do.body, !dbg !72

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !73
  store i32 %call1, i32* %connectSocket, align 4, !dbg !75
  %0 = load i32, i32* %connectSocket, align 4, !dbg !76
  %cmp = icmp eq i32 %0, -1, !dbg !78
  br i1 %cmp, label %if.then2, label %if.end, !dbg !79

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !80

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !82
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !82
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !83
  store i8 2, i8* %sin_family, align 1, !dbg !84
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !85
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !86
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !87
  store i32 %call3, i32* %s_addr, align 4, !dbg !88
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !89
  store i16 -30871, i16* %sin_port, align 2, !dbg !90
  %2 = load i32, i32* %connectSocket, align 4, !dbg !91
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !93
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !94
  %cmp5 = icmp eq i32 %call4, -1, !dbg !95
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !96

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !97

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !99
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !100
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !101
  %conv = trunc i64 %call8 to i32, !dbg !101
  store i32 %conv, i32* %recvResult, align 4, !dbg !102
  %5 = load i32, i32* %recvResult, align 4, !dbg !103
  %cmp9 = icmp eq i32 %5, -1, !dbg !105
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !106

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !107
  %cmp11 = icmp eq i32 %6, 0, !dbg !108
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !109

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !110

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !112
  %idxprom = sext i32 %7 to i64, !dbg !113
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !113
  store i8 0, i8* %arrayidx, align 1, !dbg !114
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !115
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !116
  store i32 %call16, i32* %data, align 4, !dbg !117
  br label %do.end, !dbg !118

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !119
  %cmp17 = icmp ne i32 %8, -1, !dbg !121
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !122

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !123
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !125
  br label %if.end21, !dbg !126

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !127

if.end22:                                         ; preds = %if.end21, %entry
  %call23 = call i32 (...) @globalReturnsTrue(), !dbg !128
  %tobool24 = icmp ne i32 %call23, 0, !dbg !128
  br i1 %tobool24, label %if.then25, label %if.end50, !dbg !130

if.then25:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !131, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !135, metadata !DIExpression()), !dbg !136
  %call26 = call i8* @malloc(i64 noundef 40) #6, !dbg !137
  %10 = bitcast i8* %call26 to i32*, !dbg !138
  store i32* %10, i32** %buffer, align 8, !dbg !136
  %11 = load i32*, i32** %buffer, align 8, !dbg !139
  %cmp27 = icmp eq i32* %11, null, !dbg !141
  br i1 %cmp27, label %if.then29, label %if.end30, !dbg !142

if.then29:                                        ; preds = %if.then25
  call void @exit(i32 noundef -1) #7, !dbg !143
  unreachable, !dbg !143

if.end30:                                         ; preds = %if.then25
  store i32 0, i32* %i, align 4, !dbg !145
  br label %for.cond, !dbg !147

for.cond:                                         ; preds = %for.inc, %if.end30
  %12 = load i32, i32* %i, align 4, !dbg !148
  %cmp31 = icmp slt i32 %12, 10, !dbg !150
  br i1 %cmp31, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !152
  %14 = load i32, i32* %i, align 4, !dbg !154
  %idxprom33 = sext i32 %14 to i64, !dbg !152
  %arrayidx34 = getelementptr inbounds i32, i32* %13, i64 %idxprom33, !dbg !152
  store i32 0, i32* %arrayidx34, align 4, !dbg !155
  br label %for.inc, !dbg !156

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !157
  %inc = add nsw i32 %15, 1, !dbg !157
  store i32 %inc, i32* %i, align 4, !dbg !157
  br label %for.cond, !dbg !158, !llvm.loop !159

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !162
  %cmp35 = icmp sge i32 %16, 0, !dbg !164
  br i1 %cmp35, label %if.then37, label %if.else, !dbg !165

if.then37:                                        ; preds = %for.end
  %17 = load i32*, i32** %buffer, align 8, !dbg !166
  %18 = load i32, i32* %data, align 4, !dbg !168
  %idxprom38 = sext i32 %18 to i64, !dbg !166
  %arrayidx39 = getelementptr inbounds i32, i32* %17, i64 %idxprom38, !dbg !166
  store i32 1, i32* %arrayidx39, align 4, !dbg !169
  store i32 0, i32* %i, align 4, !dbg !170
  br label %for.cond40, !dbg !172

for.cond40:                                       ; preds = %for.inc46, %if.then37
  %19 = load i32, i32* %i, align 4, !dbg !173
  %cmp41 = icmp slt i32 %19, 10, !dbg !175
  br i1 %cmp41, label %for.body43, label %for.end48, !dbg !176

for.body43:                                       ; preds = %for.cond40
  %20 = load i32*, i32** %buffer, align 8, !dbg !177
  %21 = load i32, i32* %i, align 4, !dbg !179
  %idxprom44 = sext i32 %21 to i64, !dbg !177
  %arrayidx45 = getelementptr inbounds i32, i32* %20, i64 %idxprom44, !dbg !177
  %22 = load i32, i32* %arrayidx45, align 4, !dbg !177
  call void @printIntLine(i32 noundef %22), !dbg !180
  br label %for.inc46, !dbg !181

for.inc46:                                        ; preds = %for.body43
  %23 = load i32, i32* %i, align 4, !dbg !182
  %inc47 = add nsw i32 %23, 1, !dbg !182
  store i32 %inc47, i32* %i, align 4, !dbg !182
  br label %for.cond40, !dbg !183, !llvm.loop !184

for.end48:                                        ; preds = %for.cond40
  br label %if.end49, !dbg !186

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !187
  br label %if.end49

if.end49:                                         ; preds = %if.else, %for.end48
  %24 = load i32*, i32** %buffer, align 8, !dbg !189
  %25 = bitcast i32* %24 to i8*, !dbg !189
  call void @free(i8* noundef %25), !dbg !190
  br label %if.end50, !dbg !191

if.end50:                                         ; preds = %if.end49, %if.end22
  ret void, !dbg !192
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i32 @inet_addr(i8* noundef) #2

declare i32 @"\01_connect"(i32 noundef, %struct.sockaddr* noundef, i32 noundef) #2

declare i64 @"\01_recv"(i32 noundef, i8* noundef, i64 noundef, i32 noundef) #2

declare i32 @atoi(i8* noundef) #2

declare i32 @"\01_close"(i32 noundef) #2

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #4

; Function Attrs: noreturn
declare void @exit(i32 noundef) #5

declare void @printIntLine(i32 noundef) #2

declare void @printLine(i8* noundef) #2

declare void @free(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11_good() #0 !dbg !193 {
entry:
  call void @goodB2G1(), !dbg !194
  call void @goodB2G2(), !dbg !195
  call void @goodG2B1(), !dbg !196
  call void @goodG2B2(), !dbg !197
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
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !211
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11_good(), !dbg !212
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !213
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !214
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11_bad(), !dbg !215
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !216
  ret i32 0, !dbg !217
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !218 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !219, metadata !DIExpression()), !dbg !220
  store i32 -1, i32* %data, align 4, !dbg !221
  %call = call i32 (...) @globalReturnsTrue(), !dbg !222
  %tobool = icmp ne i32 %call, 0, !dbg !222
  br i1 %tobool, label %if.then, label %if.end22, !dbg !224

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !225, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !229, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !231, metadata !DIExpression()), !dbg !232
  store i32 -1, i32* %connectSocket, align 4, !dbg !232
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !233, metadata !DIExpression()), !dbg !234
  br label %do.body, !dbg !235

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !236
  store i32 %call1, i32* %connectSocket, align 4, !dbg !238
  %0 = load i32, i32* %connectSocket, align 4, !dbg !239
  %cmp = icmp eq i32 %0, -1, !dbg !241
  br i1 %cmp, label %if.then2, label %if.end, !dbg !242

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !243

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !245
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !245
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !246
  store i8 2, i8* %sin_family, align 1, !dbg !247
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !248
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !249
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !250
  store i32 %call3, i32* %s_addr, align 4, !dbg !251
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !252
  store i16 -30871, i16* %sin_port, align 2, !dbg !253
  %2 = load i32, i32* %connectSocket, align 4, !dbg !254
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !256
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !257
  %cmp5 = icmp eq i32 %call4, -1, !dbg !258
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !259

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !260

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !262
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !263
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !264
  %conv = trunc i64 %call8 to i32, !dbg !264
  store i32 %conv, i32* %recvResult, align 4, !dbg !265
  %5 = load i32, i32* %recvResult, align 4, !dbg !266
  %cmp9 = icmp eq i32 %5, -1, !dbg !268
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !269

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !270
  %cmp11 = icmp eq i32 %6, 0, !dbg !271
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !272

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !273

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !275
  %idxprom = sext i32 %7 to i64, !dbg !276
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !276
  store i8 0, i8* %arrayidx, align 1, !dbg !277
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !278
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !279
  store i32 %call16, i32* %data, align 4, !dbg !280
  br label %do.end, !dbg !281

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !282
  %cmp17 = icmp ne i32 %8, -1, !dbg !284
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !285

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !286
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !288
  br label %if.end21, !dbg !289

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !290

if.end22:                                         ; preds = %if.end21, %entry
  %call23 = call i32 (...) @globalReturnsFalse(), !dbg !291
  %tobool24 = icmp ne i32 %call23, 0, !dbg !291
  br i1 %tobool24, label %if.then25, label %if.else, !dbg !293

if.then25:                                        ; preds = %if.end22
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !294
  br label %if.end53, !dbg !296

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !297, metadata !DIExpression()), !dbg !300
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !301, metadata !DIExpression()), !dbg !302
  %call26 = call i8* @malloc(i64 noundef 40) #6, !dbg !303
  %10 = bitcast i8* %call26 to i32*, !dbg !304
  store i32* %10, i32** %buffer, align 8, !dbg !302
  %11 = load i32*, i32** %buffer, align 8, !dbg !305
  %cmp27 = icmp eq i32* %11, null, !dbg !307
  br i1 %cmp27, label %if.then29, label %if.end30, !dbg !308

if.then29:                                        ; preds = %if.else
  call void @exit(i32 noundef -1) #7, !dbg !309
  unreachable, !dbg !309

if.end30:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !311
  br label %for.cond, !dbg !313

for.cond:                                         ; preds = %for.inc, %if.end30
  %12 = load i32, i32* %i, align 4, !dbg !314
  %cmp31 = icmp slt i32 %12, 10, !dbg !316
  br i1 %cmp31, label %for.body, label %for.end, !dbg !317

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !318
  %14 = load i32, i32* %i, align 4, !dbg !320
  %idxprom33 = sext i32 %14 to i64, !dbg !318
  %arrayidx34 = getelementptr inbounds i32, i32* %13, i64 %idxprom33, !dbg !318
  store i32 0, i32* %arrayidx34, align 4, !dbg !321
  br label %for.inc, !dbg !322

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !323
  %inc = add nsw i32 %15, 1, !dbg !323
  store i32 %inc, i32* %i, align 4, !dbg !323
  br label %for.cond, !dbg !324, !llvm.loop !325

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !327
  %cmp35 = icmp sge i32 %16, 0, !dbg !329
  br i1 %cmp35, label %land.lhs.true, label %if.else51, !dbg !330

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !331
  %cmp37 = icmp slt i32 %17, 10, !dbg !332
  br i1 %cmp37, label %if.then39, label %if.else51, !dbg !333

if.then39:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !334
  %19 = load i32, i32* %data, align 4, !dbg !336
  %idxprom40 = sext i32 %19 to i64, !dbg !334
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !334
  store i32 1, i32* %arrayidx41, align 4, !dbg !337
  store i32 0, i32* %i, align 4, !dbg !338
  br label %for.cond42, !dbg !340

for.cond42:                                       ; preds = %for.inc48, %if.then39
  %20 = load i32, i32* %i, align 4, !dbg !341
  %cmp43 = icmp slt i32 %20, 10, !dbg !343
  br i1 %cmp43, label %for.body45, label %for.end50, !dbg !344

for.body45:                                       ; preds = %for.cond42
  %21 = load i32*, i32** %buffer, align 8, !dbg !345
  %22 = load i32, i32* %i, align 4, !dbg !347
  %idxprom46 = sext i32 %22 to i64, !dbg !345
  %arrayidx47 = getelementptr inbounds i32, i32* %21, i64 %idxprom46, !dbg !345
  %23 = load i32, i32* %arrayidx47, align 4, !dbg !345
  call void @printIntLine(i32 noundef %23), !dbg !348
  br label %for.inc48, !dbg !349

for.inc48:                                        ; preds = %for.body45
  %24 = load i32, i32* %i, align 4, !dbg !350
  %inc49 = add nsw i32 %24, 1, !dbg !350
  store i32 %inc49, i32* %i, align 4, !dbg !350
  br label %for.cond42, !dbg !351, !llvm.loop !352

for.end50:                                        ; preds = %for.cond42
  br label %if.end52, !dbg !354

if.else51:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !355
  br label %if.end52

if.end52:                                         ; preds = %if.else51, %for.end50
  %25 = load i32*, i32** %buffer, align 8, !dbg !357
  %26 = bitcast i32* %25 to i8*, !dbg !357
  call void @free(i8* noundef %26), !dbg !358
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then25
  ret void, !dbg !359
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !360 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !361, metadata !DIExpression()), !dbg !362
  store i32 -1, i32* %data, align 4, !dbg !363
  %call = call i32 (...) @globalReturnsTrue(), !dbg !364
  %tobool = icmp ne i32 %call, 0, !dbg !364
  br i1 %tobool, label %if.then, label %if.end22, !dbg !366

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !367, metadata !DIExpression()), !dbg !370
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !371, metadata !DIExpression()), !dbg !372
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !373, metadata !DIExpression()), !dbg !374
  store i32 -1, i32* %connectSocket, align 4, !dbg !374
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !375, metadata !DIExpression()), !dbg !376
  br label %do.body, !dbg !377

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !378
  store i32 %call1, i32* %connectSocket, align 4, !dbg !380
  %0 = load i32, i32* %connectSocket, align 4, !dbg !381
  %cmp = icmp eq i32 %0, -1, !dbg !383
  br i1 %cmp, label %if.then2, label %if.end, !dbg !384

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !385

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !387
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !387
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !388
  store i8 2, i8* %sin_family, align 1, !dbg !389
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !390
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !391
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !392
  store i32 %call3, i32* %s_addr, align 4, !dbg !393
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !394
  store i16 -30871, i16* %sin_port, align 2, !dbg !395
  %2 = load i32, i32* %connectSocket, align 4, !dbg !396
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !398
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !399
  %cmp5 = icmp eq i32 %call4, -1, !dbg !400
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !401

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !402

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !404
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !405
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !406
  %conv = trunc i64 %call8 to i32, !dbg !406
  store i32 %conv, i32* %recvResult, align 4, !dbg !407
  %5 = load i32, i32* %recvResult, align 4, !dbg !408
  %cmp9 = icmp eq i32 %5, -1, !dbg !410
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !411

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !412
  %cmp11 = icmp eq i32 %6, 0, !dbg !413
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !414

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !415

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !417
  %idxprom = sext i32 %7 to i64, !dbg !418
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !418
  store i8 0, i8* %arrayidx, align 1, !dbg !419
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !420
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !421
  store i32 %call16, i32* %data, align 4, !dbg !422
  br label %do.end, !dbg !423

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !424
  %cmp17 = icmp ne i32 %8, -1, !dbg !426
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !427

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !428
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !430
  br label %if.end21, !dbg !431

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !432

if.end22:                                         ; preds = %if.end21, %entry
  %call23 = call i32 (...) @globalReturnsTrue(), !dbg !433
  %tobool24 = icmp ne i32 %call23, 0, !dbg !433
  br i1 %tobool24, label %if.then25, label %if.end52, !dbg !435

if.then25:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !436, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !440, metadata !DIExpression()), !dbg !441
  %call26 = call i8* @malloc(i64 noundef 40) #6, !dbg !442
  %10 = bitcast i8* %call26 to i32*, !dbg !443
  store i32* %10, i32** %buffer, align 8, !dbg !441
  %11 = load i32*, i32** %buffer, align 8, !dbg !444
  %cmp27 = icmp eq i32* %11, null, !dbg !446
  br i1 %cmp27, label %if.then29, label %if.end30, !dbg !447

if.then29:                                        ; preds = %if.then25
  call void @exit(i32 noundef -1) #7, !dbg !448
  unreachable, !dbg !448

if.end30:                                         ; preds = %if.then25
  store i32 0, i32* %i, align 4, !dbg !450
  br label %for.cond, !dbg !452

for.cond:                                         ; preds = %for.inc, %if.end30
  %12 = load i32, i32* %i, align 4, !dbg !453
  %cmp31 = icmp slt i32 %12, 10, !dbg !455
  br i1 %cmp31, label %for.body, label %for.end, !dbg !456

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !457
  %14 = load i32, i32* %i, align 4, !dbg !459
  %idxprom33 = sext i32 %14 to i64, !dbg !457
  %arrayidx34 = getelementptr inbounds i32, i32* %13, i64 %idxprom33, !dbg !457
  store i32 0, i32* %arrayidx34, align 4, !dbg !460
  br label %for.inc, !dbg !461

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !462
  %inc = add nsw i32 %15, 1, !dbg !462
  store i32 %inc, i32* %i, align 4, !dbg !462
  br label %for.cond, !dbg !463, !llvm.loop !464

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !466
  %cmp35 = icmp sge i32 %16, 0, !dbg !468
  br i1 %cmp35, label %land.lhs.true, label %if.else, !dbg !469

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !470
  %cmp37 = icmp slt i32 %17, 10, !dbg !471
  br i1 %cmp37, label %if.then39, label %if.else, !dbg !472

if.then39:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !473
  %19 = load i32, i32* %data, align 4, !dbg !475
  %idxprom40 = sext i32 %19 to i64, !dbg !473
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !473
  store i32 1, i32* %arrayidx41, align 4, !dbg !476
  store i32 0, i32* %i, align 4, !dbg !477
  br label %for.cond42, !dbg !479

for.cond42:                                       ; preds = %for.inc48, %if.then39
  %20 = load i32, i32* %i, align 4, !dbg !480
  %cmp43 = icmp slt i32 %20, 10, !dbg !482
  br i1 %cmp43, label %for.body45, label %for.end50, !dbg !483

for.body45:                                       ; preds = %for.cond42
  %21 = load i32*, i32** %buffer, align 8, !dbg !484
  %22 = load i32, i32* %i, align 4, !dbg !486
  %idxprom46 = sext i32 %22 to i64, !dbg !484
  %arrayidx47 = getelementptr inbounds i32, i32* %21, i64 %idxprom46, !dbg !484
  %23 = load i32, i32* %arrayidx47, align 4, !dbg !484
  call void @printIntLine(i32 noundef %23), !dbg !487
  br label %for.inc48, !dbg !488

for.inc48:                                        ; preds = %for.body45
  %24 = load i32, i32* %i, align 4, !dbg !489
  %inc49 = add nsw i32 %24, 1, !dbg !489
  store i32 %inc49, i32* %i, align 4, !dbg !489
  br label %for.cond42, !dbg !490, !llvm.loop !491

for.end50:                                        ; preds = %for.cond42
  br label %if.end51, !dbg !493

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !494
  br label %if.end51

if.end51:                                         ; preds = %if.else, %for.end50
  %25 = load i32*, i32** %buffer, align 8, !dbg !496
  %26 = bitcast i32* %25 to i8*, !dbg !496
  call void @free(i8* noundef %26), !dbg !497
  br label %if.end52, !dbg !498

if.end52:                                         ; preds = %if.end51, %if.end22
  ret void, !dbg !499
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !500 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !501, metadata !DIExpression()), !dbg !502
  store i32 -1, i32* %data, align 4, !dbg !503
  %call = call i32 (...) @globalReturnsFalse(), !dbg !504
  %tobool = icmp ne i32 %call, 0, !dbg !504
  br i1 %tobool, label %if.then, label %if.else, !dbg !506

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !507
  br label %if.end, !dbg !509

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !510
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !512
  %tobool2 = icmp ne i32 %call1, 0, !dbg !512
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !514

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !515, metadata !DIExpression()), !dbg !518
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !519, metadata !DIExpression()), !dbg !520
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !521
  %0 = bitcast i8* %call4 to i32*, !dbg !522
  store i32* %0, i32** %buffer, align 8, !dbg !520
  %1 = load i32*, i32** %buffer, align 8, !dbg !523
  %cmp = icmp eq i32* %1, null, !dbg !525
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !526

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #7, !dbg !527
  unreachable, !dbg !527

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !529
  br label %for.cond, !dbg !531

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !532
  %cmp7 = icmp slt i32 %2, 10, !dbg !534
  br i1 %cmp7, label %for.body, label %for.end, !dbg !535

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !536
  %4 = load i32, i32* %i, align 4, !dbg !538
  %idxprom = sext i32 %4 to i64, !dbg !536
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !536
  store i32 0, i32* %arrayidx, align 4, !dbg !539
  br label %for.inc, !dbg !540

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !541
  %inc = add nsw i32 %5, 1, !dbg !541
  store i32 %inc, i32* %i, align 4, !dbg !541
  br label %for.cond, !dbg !542, !llvm.loop !543

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !545
  %cmp8 = icmp sge i32 %6, 0, !dbg !547
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !548

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !549
  %8 = load i32, i32* %data, align 4, !dbg !551
  %idxprom10 = sext i32 %8 to i64, !dbg !549
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !549
  store i32 1, i32* %arrayidx11, align 4, !dbg !552
  store i32 0, i32* %i, align 4, !dbg !553
  br label %for.cond12, !dbg !555

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !556
  %cmp13 = icmp slt i32 %9, 10, !dbg !558
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !559

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !560
  %11 = load i32, i32* %i, align 4, !dbg !562
  %idxprom15 = sext i32 %11 to i64, !dbg !560
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !560
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !560
  call void @printIntLine(i32 noundef %12), !dbg !563
  br label %for.inc17, !dbg !564

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !565
  %inc18 = add nsw i32 %13, 1, !dbg !565
  store i32 %inc18, i32* %i, align 4, !dbg !565
  br label %for.cond12, !dbg !566, !llvm.loop !567

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !569

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !570
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !572
  %15 = bitcast i32* %14 to i8*, !dbg !572
  call void @free(i8* noundef %15), !dbg !573
  br label %if.end22, !dbg !574

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !575
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !576 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !577, metadata !DIExpression()), !dbg !578
  store i32 -1, i32* %data, align 4, !dbg !579
  %call = call i32 (...) @globalReturnsTrue(), !dbg !580
  %tobool = icmp ne i32 %call, 0, !dbg !580
  br i1 %tobool, label %if.then, label %if.end, !dbg !582

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !583
  br label %if.end, !dbg !585

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !586
  %tobool2 = icmp ne i32 %call1, 0, !dbg !586
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !588

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !589, metadata !DIExpression()), !dbg !592
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !593, metadata !DIExpression()), !dbg !594
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !595
  %0 = bitcast i8* %call4 to i32*, !dbg !596
  store i32* %0, i32** %buffer, align 8, !dbg !594
  %1 = load i32*, i32** %buffer, align 8, !dbg !597
  %cmp = icmp eq i32* %1, null, !dbg !599
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !600

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #7, !dbg !601
  unreachable, !dbg !601

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !603
  br label %for.cond, !dbg !605

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !606
  %cmp7 = icmp slt i32 %2, 10, !dbg !608
  br i1 %cmp7, label %for.body, label %for.end, !dbg !609

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !610
  %4 = load i32, i32* %i, align 4, !dbg !612
  %idxprom = sext i32 %4 to i64, !dbg !610
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !610
  store i32 0, i32* %arrayidx, align 4, !dbg !613
  br label %for.inc, !dbg !614

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !615
  %inc = add nsw i32 %5, 1, !dbg !615
  store i32 %inc, i32* %i, align 4, !dbg !615
  br label %for.cond, !dbg !616, !llvm.loop !617

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !619
  %cmp8 = icmp sge i32 %6, 0, !dbg !621
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !622

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !623
  %8 = load i32, i32* %data, align 4, !dbg !625
  %idxprom10 = sext i32 %8 to i64, !dbg !623
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !623
  store i32 1, i32* %arrayidx11, align 4, !dbg !626
  store i32 0, i32* %i, align 4, !dbg !627
  br label %for.cond12, !dbg !629

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !630
  %cmp13 = icmp slt i32 %9, 10, !dbg !632
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !633

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !634
  %11 = load i32, i32* %i, align 4, !dbg !636
  %idxprom15 = sext i32 %11 to i64, !dbg !634
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !634
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !634
  call void @printIntLine(i32 noundef %12), !dbg !637
  br label %for.inc17, !dbg !638

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !639
  %inc18 = add nsw i32 %13, 1, !dbg !639
  store i32 %inc18, i32* %i, align 4, !dbg !639
  br label %for.cond12, !dbg !640, !llvm.loop !641

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !643

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !644
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !646
  %15 = bitcast i32* %14 to i8*, !dbg !646
  call void @free(i8* noundef %15), !dbg !647
  br label %if.end21, !dbg !648

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !649
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!25, !26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !6, !21, !23, !24}
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
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"PIC Level", i32 2}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"Homebrew clang version 14.0.6"}
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11_bad", scope: !33, file: !33, line: 44, type: !34, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!33 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !{}
!37 = !DILocalVariable(name: "data", scope: !32, file: !33, line: 46, type: !22)
!38 = !DILocation(line: 46, column: 9, scope: !32)
!39 = !DILocation(line: 48, column: 10, scope: !32)
!40 = !DILocation(line: 49, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !33, line: 49, column: 8)
!42 = !DILocation(line: 49, column: 8, scope: !32)
!43 = !DILocalVariable(name: "recvResult", scope: !44, file: !33, line: 56, type: !22)
!44 = distinct !DILexicalBlock(scope: !45, file: !33, line: 51, column: 9)
!45 = distinct !DILexicalBlock(scope: !41, file: !33, line: 50, column: 5)
!46 = !DILocation(line: 56, column: 17, scope: !44)
!47 = !DILocalVariable(name: "service", scope: !44, file: !33, line: 57, type: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !49, line: 375, size: 128, elements: !50)
!49 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!50 = !{!51, !52, !53, !56, !63}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !48, file: !49, line: 376, baseType: !11, size: 8)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !48, file: !49, line: 377, baseType: !14, size: 8, offset: 8)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !48, file: !49, line: 378, baseType: !54, size: 16, offset: 16)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !55, line: 31, baseType: !3)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !48, file: !49, line: 379, baseType: !57, size: 32, offset: 32)
!57 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !49, line: 301, size: 32, elements: !58)
!58 = !{!59}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !57, file: !49, line: 302, baseType: !60, size: 32)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !61, line: 31, baseType: !62)
!61 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !24)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !48, file: !49, line: 380, baseType: !64, size: 64, offset: 64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 8)
!67 = !DILocation(line: 57, column: 32, scope: !44)
!68 = !DILocalVariable(name: "connectSocket", scope: !44, file: !33, line: 58, type: !22)
!69 = !DILocation(line: 58, column: 20, scope: !44)
!70 = !DILocalVariable(name: "inputBuffer", scope: !44, file: !33, line: 59, type: !17)
!71 = !DILocation(line: 59, column: 18, scope: !44)
!72 = !DILocation(line: 60, column: 13, scope: !44)
!73 = !DILocation(line: 70, column: 33, scope: !74)
!74 = distinct !DILexicalBlock(scope: !44, file: !33, line: 61, column: 13)
!75 = !DILocation(line: 70, column: 31, scope: !74)
!76 = !DILocation(line: 71, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !33, line: 71, column: 21)
!78 = !DILocation(line: 71, column: 35, scope: !77)
!79 = !DILocation(line: 71, column: 21, scope: !74)
!80 = !DILocation(line: 73, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !33, line: 72, column: 17)
!82 = !DILocation(line: 75, column: 17, scope: !74)
!83 = !DILocation(line: 76, column: 25, scope: !74)
!84 = !DILocation(line: 76, column: 36, scope: !74)
!85 = !DILocation(line: 77, column: 43, scope: !74)
!86 = !DILocation(line: 77, column: 25, scope: !74)
!87 = !DILocation(line: 77, column: 34, scope: !74)
!88 = !DILocation(line: 77, column: 41, scope: !74)
!89 = !DILocation(line: 78, column: 25, scope: !74)
!90 = !DILocation(line: 78, column: 34, scope: !74)
!91 = !DILocation(line: 79, column: 29, scope: !92)
!92 = distinct !DILexicalBlock(scope: !74, file: !33, line: 79, column: 21)
!93 = !DILocation(line: 79, column: 44, scope: !92)
!94 = !DILocation(line: 79, column: 21, scope: !92)
!95 = !DILocation(line: 79, column: 89, scope: !92)
!96 = !DILocation(line: 79, column: 21, scope: !74)
!97 = !DILocation(line: 81, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !33, line: 80, column: 17)
!99 = !DILocation(line: 85, column: 35, scope: !74)
!100 = !DILocation(line: 85, column: 50, scope: !74)
!101 = !DILocation(line: 85, column: 30, scope: !74)
!102 = !DILocation(line: 85, column: 28, scope: !74)
!103 = !DILocation(line: 86, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !74, file: !33, line: 86, column: 21)
!105 = !DILocation(line: 86, column: 32, scope: !104)
!106 = !DILocation(line: 86, column: 48, scope: !104)
!107 = !DILocation(line: 86, column: 51, scope: !104)
!108 = !DILocation(line: 86, column: 62, scope: !104)
!109 = !DILocation(line: 86, column: 21, scope: !74)
!110 = !DILocation(line: 88, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !33, line: 87, column: 17)
!112 = !DILocation(line: 91, column: 29, scope: !74)
!113 = !DILocation(line: 91, column: 17, scope: !74)
!114 = !DILocation(line: 91, column: 41, scope: !74)
!115 = !DILocation(line: 93, column: 29, scope: !74)
!116 = !DILocation(line: 93, column: 24, scope: !74)
!117 = !DILocation(line: 93, column: 22, scope: !74)
!118 = !DILocation(line: 94, column: 13, scope: !74)
!119 = !DILocation(line: 96, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !44, file: !33, line: 96, column: 17)
!121 = !DILocation(line: 96, column: 31, scope: !120)
!122 = !DILocation(line: 96, column: 17, scope: !44)
!123 = !DILocation(line: 98, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !33, line: 97, column: 13)
!125 = !DILocation(line: 98, column: 17, scope: !124)
!126 = !DILocation(line: 99, column: 13, scope: !124)
!127 = !DILocation(line: 107, column: 5, scope: !45)
!128 = !DILocation(line: 108, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !32, file: !33, line: 108, column: 8)
!130 = !DILocation(line: 108, column: 8, scope: !32)
!131 = !DILocalVariable(name: "i", scope: !132, file: !33, line: 111, type: !22)
!132 = distinct !DILexicalBlock(scope: !133, file: !33, line: 110, column: 9)
!133 = distinct !DILexicalBlock(scope: !129, file: !33, line: 109, column: 5)
!134 = !DILocation(line: 111, column: 17, scope: !132)
!135 = !DILocalVariable(name: "buffer", scope: !132, file: !33, line: 112, type: !21)
!136 = !DILocation(line: 112, column: 19, scope: !132)
!137 = !DILocation(line: 112, column: 35, scope: !132)
!138 = !DILocation(line: 112, column: 28, scope: !132)
!139 = !DILocation(line: 113, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !33, line: 113, column: 17)
!141 = !DILocation(line: 113, column: 24, scope: !140)
!142 = !DILocation(line: 113, column: 17, scope: !132)
!143 = !DILocation(line: 113, column: 34, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !33, line: 113, column: 33)
!145 = !DILocation(line: 115, column: 20, scope: !146)
!146 = distinct !DILexicalBlock(scope: !132, file: !33, line: 115, column: 13)
!147 = !DILocation(line: 115, column: 18, scope: !146)
!148 = !DILocation(line: 115, column: 25, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !33, line: 115, column: 13)
!150 = !DILocation(line: 115, column: 27, scope: !149)
!151 = !DILocation(line: 115, column: 13, scope: !146)
!152 = !DILocation(line: 117, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !33, line: 116, column: 13)
!154 = !DILocation(line: 117, column: 24, scope: !153)
!155 = !DILocation(line: 117, column: 27, scope: !153)
!156 = !DILocation(line: 118, column: 13, scope: !153)
!157 = !DILocation(line: 115, column: 34, scope: !149)
!158 = !DILocation(line: 115, column: 13, scope: !149)
!159 = distinct !{!159, !151, !160, !161}
!160 = !DILocation(line: 118, column: 13, scope: !146)
!161 = !{!"llvm.loop.mustprogress"}
!162 = !DILocation(line: 121, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !132, file: !33, line: 121, column: 17)
!164 = !DILocation(line: 121, column: 22, scope: !163)
!165 = !DILocation(line: 121, column: 17, scope: !132)
!166 = !DILocation(line: 123, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !33, line: 122, column: 13)
!168 = !DILocation(line: 123, column: 24, scope: !167)
!169 = !DILocation(line: 123, column: 30, scope: !167)
!170 = !DILocation(line: 125, column: 23, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !33, line: 125, column: 17)
!172 = !DILocation(line: 125, column: 21, scope: !171)
!173 = !DILocation(line: 125, column: 28, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !33, line: 125, column: 17)
!175 = !DILocation(line: 125, column: 30, scope: !174)
!176 = !DILocation(line: 125, column: 17, scope: !171)
!177 = !DILocation(line: 127, column: 34, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !33, line: 126, column: 17)
!179 = !DILocation(line: 127, column: 41, scope: !178)
!180 = !DILocation(line: 127, column: 21, scope: !178)
!181 = !DILocation(line: 128, column: 17, scope: !178)
!182 = !DILocation(line: 125, column: 37, scope: !174)
!183 = !DILocation(line: 125, column: 17, scope: !174)
!184 = distinct !{!184, !176, !185, !161}
!185 = !DILocation(line: 128, column: 17, scope: !171)
!186 = !DILocation(line: 129, column: 13, scope: !167)
!187 = !DILocation(line: 132, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !163, file: !33, line: 131, column: 13)
!189 = !DILocation(line: 134, column: 18, scope: !132)
!190 = !DILocation(line: 134, column: 13, scope: !132)
!191 = !DILocation(line: 136, column: 5, scope: !133)
!192 = !DILocation(line: 137, column: 1, scope: !32)
!193 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_11_good", scope: !33, file: !33, line: 429, type: !34, scopeLine: 430, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!194 = !DILocation(line: 431, column: 5, scope: !193)
!195 = !DILocation(line: 432, column: 5, scope: !193)
!196 = !DILocation(line: 433, column: 5, scope: !193)
!197 = !DILocation(line: 434, column: 5, scope: !193)
!198 = !DILocation(line: 435, column: 1, scope: !193)
!199 = distinct !DISubprogram(name: "main", scope: !33, file: !33, line: 446, type: !200, scopeLine: 447, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!200 = !DISubroutineType(types: !201)
!201 = !{!22, !22, !202}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!204 = !DILocalVariable(name: "argc", arg: 1, scope: !199, file: !33, line: 446, type: !22)
!205 = !DILocation(line: 446, column: 14, scope: !199)
!206 = !DILocalVariable(name: "argv", arg: 2, scope: !199, file: !33, line: 446, type: !202)
!207 = !DILocation(line: 446, column: 27, scope: !199)
!208 = !DILocation(line: 449, column: 22, scope: !199)
!209 = !DILocation(line: 449, column: 12, scope: !199)
!210 = !DILocation(line: 449, column: 5, scope: !199)
!211 = !DILocation(line: 451, column: 5, scope: !199)
!212 = !DILocation(line: 452, column: 5, scope: !199)
!213 = !DILocation(line: 453, column: 5, scope: !199)
!214 = !DILocation(line: 456, column: 5, scope: !199)
!215 = !DILocation(line: 457, column: 5, scope: !199)
!216 = !DILocation(line: 458, column: 5, scope: !199)
!217 = !DILocation(line: 460, column: 5, scope: !199)
!218 = distinct !DISubprogram(name: "goodB2G1", scope: !33, file: !33, line: 144, type: !34, scopeLine: 145, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!219 = !DILocalVariable(name: "data", scope: !218, file: !33, line: 146, type: !22)
!220 = !DILocation(line: 146, column: 9, scope: !218)
!221 = !DILocation(line: 148, column: 10, scope: !218)
!222 = !DILocation(line: 149, column: 8, scope: !223)
!223 = distinct !DILexicalBlock(scope: !218, file: !33, line: 149, column: 8)
!224 = !DILocation(line: 149, column: 8, scope: !218)
!225 = !DILocalVariable(name: "recvResult", scope: !226, file: !33, line: 156, type: !22)
!226 = distinct !DILexicalBlock(scope: !227, file: !33, line: 151, column: 9)
!227 = distinct !DILexicalBlock(scope: !223, file: !33, line: 150, column: 5)
!228 = !DILocation(line: 156, column: 17, scope: !226)
!229 = !DILocalVariable(name: "service", scope: !226, file: !33, line: 157, type: !48)
!230 = !DILocation(line: 157, column: 32, scope: !226)
!231 = !DILocalVariable(name: "connectSocket", scope: !226, file: !33, line: 158, type: !22)
!232 = !DILocation(line: 158, column: 20, scope: !226)
!233 = !DILocalVariable(name: "inputBuffer", scope: !226, file: !33, line: 159, type: !17)
!234 = !DILocation(line: 159, column: 18, scope: !226)
!235 = !DILocation(line: 160, column: 13, scope: !226)
!236 = !DILocation(line: 170, column: 33, scope: !237)
!237 = distinct !DILexicalBlock(scope: !226, file: !33, line: 161, column: 13)
!238 = !DILocation(line: 170, column: 31, scope: !237)
!239 = !DILocation(line: 171, column: 21, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !33, line: 171, column: 21)
!241 = !DILocation(line: 171, column: 35, scope: !240)
!242 = !DILocation(line: 171, column: 21, scope: !237)
!243 = !DILocation(line: 173, column: 21, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !33, line: 172, column: 17)
!245 = !DILocation(line: 175, column: 17, scope: !237)
!246 = !DILocation(line: 176, column: 25, scope: !237)
!247 = !DILocation(line: 176, column: 36, scope: !237)
!248 = !DILocation(line: 177, column: 43, scope: !237)
!249 = !DILocation(line: 177, column: 25, scope: !237)
!250 = !DILocation(line: 177, column: 34, scope: !237)
!251 = !DILocation(line: 177, column: 41, scope: !237)
!252 = !DILocation(line: 178, column: 25, scope: !237)
!253 = !DILocation(line: 178, column: 34, scope: !237)
!254 = !DILocation(line: 179, column: 29, scope: !255)
!255 = distinct !DILexicalBlock(scope: !237, file: !33, line: 179, column: 21)
!256 = !DILocation(line: 179, column: 44, scope: !255)
!257 = !DILocation(line: 179, column: 21, scope: !255)
!258 = !DILocation(line: 179, column: 89, scope: !255)
!259 = !DILocation(line: 179, column: 21, scope: !237)
!260 = !DILocation(line: 181, column: 21, scope: !261)
!261 = distinct !DILexicalBlock(scope: !255, file: !33, line: 180, column: 17)
!262 = !DILocation(line: 185, column: 35, scope: !237)
!263 = !DILocation(line: 185, column: 50, scope: !237)
!264 = !DILocation(line: 185, column: 30, scope: !237)
!265 = !DILocation(line: 185, column: 28, scope: !237)
!266 = !DILocation(line: 186, column: 21, scope: !267)
!267 = distinct !DILexicalBlock(scope: !237, file: !33, line: 186, column: 21)
!268 = !DILocation(line: 186, column: 32, scope: !267)
!269 = !DILocation(line: 186, column: 48, scope: !267)
!270 = !DILocation(line: 186, column: 51, scope: !267)
!271 = !DILocation(line: 186, column: 62, scope: !267)
!272 = !DILocation(line: 186, column: 21, scope: !237)
!273 = !DILocation(line: 188, column: 21, scope: !274)
!274 = distinct !DILexicalBlock(scope: !267, file: !33, line: 187, column: 17)
!275 = !DILocation(line: 191, column: 29, scope: !237)
!276 = !DILocation(line: 191, column: 17, scope: !237)
!277 = !DILocation(line: 191, column: 41, scope: !237)
!278 = !DILocation(line: 193, column: 29, scope: !237)
!279 = !DILocation(line: 193, column: 24, scope: !237)
!280 = !DILocation(line: 193, column: 22, scope: !237)
!281 = !DILocation(line: 194, column: 13, scope: !237)
!282 = !DILocation(line: 196, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !226, file: !33, line: 196, column: 17)
!284 = !DILocation(line: 196, column: 31, scope: !283)
!285 = !DILocation(line: 196, column: 17, scope: !226)
!286 = !DILocation(line: 198, column: 30, scope: !287)
!287 = distinct !DILexicalBlock(scope: !283, file: !33, line: 197, column: 13)
!288 = !DILocation(line: 198, column: 17, scope: !287)
!289 = !DILocation(line: 199, column: 13, scope: !287)
!290 = !DILocation(line: 207, column: 5, scope: !227)
!291 = !DILocation(line: 208, column: 8, scope: !292)
!292 = distinct !DILexicalBlock(scope: !218, file: !33, line: 208, column: 8)
!293 = !DILocation(line: 208, column: 8, scope: !218)
!294 = !DILocation(line: 211, column: 9, scope: !295)
!295 = distinct !DILexicalBlock(scope: !292, file: !33, line: 209, column: 5)
!296 = !DILocation(line: 212, column: 5, scope: !295)
!297 = !DILocalVariable(name: "i", scope: !298, file: !33, line: 216, type: !22)
!298 = distinct !DILexicalBlock(scope: !299, file: !33, line: 215, column: 9)
!299 = distinct !DILexicalBlock(scope: !292, file: !33, line: 214, column: 5)
!300 = !DILocation(line: 216, column: 17, scope: !298)
!301 = !DILocalVariable(name: "buffer", scope: !298, file: !33, line: 217, type: !21)
!302 = !DILocation(line: 217, column: 19, scope: !298)
!303 = !DILocation(line: 217, column: 35, scope: !298)
!304 = !DILocation(line: 217, column: 28, scope: !298)
!305 = !DILocation(line: 218, column: 17, scope: !306)
!306 = distinct !DILexicalBlock(scope: !298, file: !33, line: 218, column: 17)
!307 = !DILocation(line: 218, column: 24, scope: !306)
!308 = !DILocation(line: 218, column: 17, scope: !298)
!309 = !DILocation(line: 218, column: 34, scope: !310)
!310 = distinct !DILexicalBlock(scope: !306, file: !33, line: 218, column: 33)
!311 = !DILocation(line: 220, column: 20, scope: !312)
!312 = distinct !DILexicalBlock(scope: !298, file: !33, line: 220, column: 13)
!313 = !DILocation(line: 220, column: 18, scope: !312)
!314 = !DILocation(line: 220, column: 25, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !33, line: 220, column: 13)
!316 = !DILocation(line: 220, column: 27, scope: !315)
!317 = !DILocation(line: 220, column: 13, scope: !312)
!318 = !DILocation(line: 222, column: 17, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !33, line: 221, column: 13)
!320 = !DILocation(line: 222, column: 24, scope: !319)
!321 = !DILocation(line: 222, column: 27, scope: !319)
!322 = !DILocation(line: 223, column: 13, scope: !319)
!323 = !DILocation(line: 220, column: 34, scope: !315)
!324 = !DILocation(line: 220, column: 13, scope: !315)
!325 = distinct !{!325, !317, !326, !161}
!326 = !DILocation(line: 223, column: 13, scope: !312)
!327 = !DILocation(line: 225, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !298, file: !33, line: 225, column: 17)
!329 = !DILocation(line: 225, column: 22, scope: !328)
!330 = !DILocation(line: 225, column: 27, scope: !328)
!331 = !DILocation(line: 225, column: 30, scope: !328)
!332 = !DILocation(line: 225, column: 35, scope: !328)
!333 = !DILocation(line: 225, column: 17, scope: !298)
!334 = !DILocation(line: 227, column: 17, scope: !335)
!335 = distinct !DILexicalBlock(scope: !328, file: !33, line: 226, column: 13)
!336 = !DILocation(line: 227, column: 24, scope: !335)
!337 = !DILocation(line: 227, column: 30, scope: !335)
!338 = !DILocation(line: 229, column: 23, scope: !339)
!339 = distinct !DILexicalBlock(scope: !335, file: !33, line: 229, column: 17)
!340 = !DILocation(line: 229, column: 21, scope: !339)
!341 = !DILocation(line: 229, column: 28, scope: !342)
!342 = distinct !DILexicalBlock(scope: !339, file: !33, line: 229, column: 17)
!343 = !DILocation(line: 229, column: 30, scope: !342)
!344 = !DILocation(line: 229, column: 17, scope: !339)
!345 = !DILocation(line: 231, column: 34, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !33, line: 230, column: 17)
!347 = !DILocation(line: 231, column: 41, scope: !346)
!348 = !DILocation(line: 231, column: 21, scope: !346)
!349 = !DILocation(line: 232, column: 17, scope: !346)
!350 = !DILocation(line: 229, column: 37, scope: !342)
!351 = !DILocation(line: 229, column: 17, scope: !342)
!352 = distinct !{!352, !344, !353, !161}
!353 = !DILocation(line: 232, column: 17, scope: !339)
!354 = !DILocation(line: 233, column: 13, scope: !335)
!355 = !DILocation(line: 236, column: 17, scope: !356)
!356 = distinct !DILexicalBlock(scope: !328, file: !33, line: 235, column: 13)
!357 = !DILocation(line: 238, column: 18, scope: !298)
!358 = !DILocation(line: 238, column: 13, scope: !298)
!359 = !DILocation(line: 241, column: 1, scope: !218)
!360 = distinct !DISubprogram(name: "goodB2G2", scope: !33, file: !33, line: 244, type: !34, scopeLine: 245, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!361 = !DILocalVariable(name: "data", scope: !360, file: !33, line: 246, type: !22)
!362 = !DILocation(line: 246, column: 9, scope: !360)
!363 = !DILocation(line: 248, column: 10, scope: !360)
!364 = !DILocation(line: 249, column: 8, scope: !365)
!365 = distinct !DILexicalBlock(scope: !360, file: !33, line: 249, column: 8)
!366 = !DILocation(line: 249, column: 8, scope: !360)
!367 = !DILocalVariable(name: "recvResult", scope: !368, file: !33, line: 256, type: !22)
!368 = distinct !DILexicalBlock(scope: !369, file: !33, line: 251, column: 9)
!369 = distinct !DILexicalBlock(scope: !365, file: !33, line: 250, column: 5)
!370 = !DILocation(line: 256, column: 17, scope: !368)
!371 = !DILocalVariable(name: "service", scope: !368, file: !33, line: 257, type: !48)
!372 = !DILocation(line: 257, column: 32, scope: !368)
!373 = !DILocalVariable(name: "connectSocket", scope: !368, file: !33, line: 258, type: !22)
!374 = !DILocation(line: 258, column: 20, scope: !368)
!375 = !DILocalVariable(name: "inputBuffer", scope: !368, file: !33, line: 259, type: !17)
!376 = !DILocation(line: 259, column: 18, scope: !368)
!377 = !DILocation(line: 260, column: 13, scope: !368)
!378 = !DILocation(line: 270, column: 33, scope: !379)
!379 = distinct !DILexicalBlock(scope: !368, file: !33, line: 261, column: 13)
!380 = !DILocation(line: 270, column: 31, scope: !379)
!381 = !DILocation(line: 271, column: 21, scope: !382)
!382 = distinct !DILexicalBlock(scope: !379, file: !33, line: 271, column: 21)
!383 = !DILocation(line: 271, column: 35, scope: !382)
!384 = !DILocation(line: 271, column: 21, scope: !379)
!385 = !DILocation(line: 273, column: 21, scope: !386)
!386 = distinct !DILexicalBlock(scope: !382, file: !33, line: 272, column: 17)
!387 = !DILocation(line: 275, column: 17, scope: !379)
!388 = !DILocation(line: 276, column: 25, scope: !379)
!389 = !DILocation(line: 276, column: 36, scope: !379)
!390 = !DILocation(line: 277, column: 43, scope: !379)
!391 = !DILocation(line: 277, column: 25, scope: !379)
!392 = !DILocation(line: 277, column: 34, scope: !379)
!393 = !DILocation(line: 277, column: 41, scope: !379)
!394 = !DILocation(line: 278, column: 25, scope: !379)
!395 = !DILocation(line: 278, column: 34, scope: !379)
!396 = !DILocation(line: 279, column: 29, scope: !397)
!397 = distinct !DILexicalBlock(scope: !379, file: !33, line: 279, column: 21)
!398 = !DILocation(line: 279, column: 44, scope: !397)
!399 = !DILocation(line: 279, column: 21, scope: !397)
!400 = !DILocation(line: 279, column: 89, scope: !397)
!401 = !DILocation(line: 279, column: 21, scope: !379)
!402 = !DILocation(line: 281, column: 21, scope: !403)
!403 = distinct !DILexicalBlock(scope: !397, file: !33, line: 280, column: 17)
!404 = !DILocation(line: 285, column: 35, scope: !379)
!405 = !DILocation(line: 285, column: 50, scope: !379)
!406 = !DILocation(line: 285, column: 30, scope: !379)
!407 = !DILocation(line: 285, column: 28, scope: !379)
!408 = !DILocation(line: 286, column: 21, scope: !409)
!409 = distinct !DILexicalBlock(scope: !379, file: !33, line: 286, column: 21)
!410 = !DILocation(line: 286, column: 32, scope: !409)
!411 = !DILocation(line: 286, column: 48, scope: !409)
!412 = !DILocation(line: 286, column: 51, scope: !409)
!413 = !DILocation(line: 286, column: 62, scope: !409)
!414 = !DILocation(line: 286, column: 21, scope: !379)
!415 = !DILocation(line: 288, column: 21, scope: !416)
!416 = distinct !DILexicalBlock(scope: !409, file: !33, line: 287, column: 17)
!417 = !DILocation(line: 291, column: 29, scope: !379)
!418 = !DILocation(line: 291, column: 17, scope: !379)
!419 = !DILocation(line: 291, column: 41, scope: !379)
!420 = !DILocation(line: 293, column: 29, scope: !379)
!421 = !DILocation(line: 293, column: 24, scope: !379)
!422 = !DILocation(line: 293, column: 22, scope: !379)
!423 = !DILocation(line: 294, column: 13, scope: !379)
!424 = !DILocation(line: 296, column: 17, scope: !425)
!425 = distinct !DILexicalBlock(scope: !368, file: !33, line: 296, column: 17)
!426 = !DILocation(line: 296, column: 31, scope: !425)
!427 = !DILocation(line: 296, column: 17, scope: !368)
!428 = !DILocation(line: 298, column: 30, scope: !429)
!429 = distinct !DILexicalBlock(scope: !425, file: !33, line: 297, column: 13)
!430 = !DILocation(line: 298, column: 17, scope: !429)
!431 = !DILocation(line: 299, column: 13, scope: !429)
!432 = !DILocation(line: 307, column: 5, scope: !369)
!433 = !DILocation(line: 308, column: 8, scope: !434)
!434 = distinct !DILexicalBlock(scope: !360, file: !33, line: 308, column: 8)
!435 = !DILocation(line: 308, column: 8, scope: !360)
!436 = !DILocalVariable(name: "i", scope: !437, file: !33, line: 311, type: !22)
!437 = distinct !DILexicalBlock(scope: !438, file: !33, line: 310, column: 9)
!438 = distinct !DILexicalBlock(scope: !434, file: !33, line: 309, column: 5)
!439 = !DILocation(line: 311, column: 17, scope: !437)
!440 = !DILocalVariable(name: "buffer", scope: !437, file: !33, line: 312, type: !21)
!441 = !DILocation(line: 312, column: 19, scope: !437)
!442 = !DILocation(line: 312, column: 35, scope: !437)
!443 = !DILocation(line: 312, column: 28, scope: !437)
!444 = !DILocation(line: 313, column: 17, scope: !445)
!445 = distinct !DILexicalBlock(scope: !437, file: !33, line: 313, column: 17)
!446 = !DILocation(line: 313, column: 24, scope: !445)
!447 = !DILocation(line: 313, column: 17, scope: !437)
!448 = !DILocation(line: 313, column: 34, scope: !449)
!449 = distinct !DILexicalBlock(scope: !445, file: !33, line: 313, column: 33)
!450 = !DILocation(line: 315, column: 20, scope: !451)
!451 = distinct !DILexicalBlock(scope: !437, file: !33, line: 315, column: 13)
!452 = !DILocation(line: 315, column: 18, scope: !451)
!453 = !DILocation(line: 315, column: 25, scope: !454)
!454 = distinct !DILexicalBlock(scope: !451, file: !33, line: 315, column: 13)
!455 = !DILocation(line: 315, column: 27, scope: !454)
!456 = !DILocation(line: 315, column: 13, scope: !451)
!457 = !DILocation(line: 317, column: 17, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !33, line: 316, column: 13)
!459 = !DILocation(line: 317, column: 24, scope: !458)
!460 = !DILocation(line: 317, column: 27, scope: !458)
!461 = !DILocation(line: 318, column: 13, scope: !458)
!462 = !DILocation(line: 315, column: 34, scope: !454)
!463 = !DILocation(line: 315, column: 13, scope: !454)
!464 = distinct !{!464, !456, !465, !161}
!465 = !DILocation(line: 318, column: 13, scope: !451)
!466 = !DILocation(line: 320, column: 17, scope: !467)
!467 = distinct !DILexicalBlock(scope: !437, file: !33, line: 320, column: 17)
!468 = !DILocation(line: 320, column: 22, scope: !467)
!469 = !DILocation(line: 320, column: 27, scope: !467)
!470 = !DILocation(line: 320, column: 30, scope: !467)
!471 = !DILocation(line: 320, column: 35, scope: !467)
!472 = !DILocation(line: 320, column: 17, scope: !437)
!473 = !DILocation(line: 322, column: 17, scope: !474)
!474 = distinct !DILexicalBlock(scope: !467, file: !33, line: 321, column: 13)
!475 = !DILocation(line: 322, column: 24, scope: !474)
!476 = !DILocation(line: 322, column: 30, scope: !474)
!477 = !DILocation(line: 324, column: 23, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !33, line: 324, column: 17)
!479 = !DILocation(line: 324, column: 21, scope: !478)
!480 = !DILocation(line: 324, column: 28, scope: !481)
!481 = distinct !DILexicalBlock(scope: !478, file: !33, line: 324, column: 17)
!482 = !DILocation(line: 324, column: 30, scope: !481)
!483 = !DILocation(line: 324, column: 17, scope: !478)
!484 = !DILocation(line: 326, column: 34, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !33, line: 325, column: 17)
!486 = !DILocation(line: 326, column: 41, scope: !485)
!487 = !DILocation(line: 326, column: 21, scope: !485)
!488 = !DILocation(line: 327, column: 17, scope: !485)
!489 = !DILocation(line: 324, column: 37, scope: !481)
!490 = !DILocation(line: 324, column: 17, scope: !481)
!491 = distinct !{!491, !483, !492, !161}
!492 = !DILocation(line: 327, column: 17, scope: !478)
!493 = !DILocation(line: 328, column: 13, scope: !474)
!494 = !DILocation(line: 331, column: 17, scope: !495)
!495 = distinct !DILexicalBlock(scope: !467, file: !33, line: 330, column: 13)
!496 = !DILocation(line: 333, column: 18, scope: !437)
!497 = !DILocation(line: 333, column: 13, scope: !437)
!498 = !DILocation(line: 335, column: 5, scope: !438)
!499 = !DILocation(line: 336, column: 1, scope: !360)
!500 = distinct !DISubprogram(name: "goodG2B1", scope: !33, file: !33, line: 339, type: !34, scopeLine: 340, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!501 = !DILocalVariable(name: "data", scope: !500, file: !33, line: 341, type: !22)
!502 = !DILocation(line: 341, column: 9, scope: !500)
!503 = !DILocation(line: 343, column: 10, scope: !500)
!504 = !DILocation(line: 344, column: 8, scope: !505)
!505 = distinct !DILexicalBlock(scope: !500, file: !33, line: 344, column: 8)
!506 = !DILocation(line: 344, column: 8, scope: !500)
!507 = !DILocation(line: 347, column: 9, scope: !508)
!508 = distinct !DILexicalBlock(scope: !505, file: !33, line: 345, column: 5)
!509 = !DILocation(line: 348, column: 5, scope: !508)
!510 = !DILocation(line: 353, column: 14, scope: !511)
!511 = distinct !DILexicalBlock(scope: !505, file: !33, line: 350, column: 5)
!512 = !DILocation(line: 355, column: 8, scope: !513)
!513 = distinct !DILexicalBlock(scope: !500, file: !33, line: 355, column: 8)
!514 = !DILocation(line: 355, column: 8, scope: !500)
!515 = !DILocalVariable(name: "i", scope: !516, file: !33, line: 358, type: !22)
!516 = distinct !DILexicalBlock(scope: !517, file: !33, line: 357, column: 9)
!517 = distinct !DILexicalBlock(scope: !513, file: !33, line: 356, column: 5)
!518 = !DILocation(line: 358, column: 17, scope: !516)
!519 = !DILocalVariable(name: "buffer", scope: !516, file: !33, line: 359, type: !21)
!520 = !DILocation(line: 359, column: 19, scope: !516)
!521 = !DILocation(line: 359, column: 35, scope: !516)
!522 = !DILocation(line: 359, column: 28, scope: !516)
!523 = !DILocation(line: 360, column: 17, scope: !524)
!524 = distinct !DILexicalBlock(scope: !516, file: !33, line: 360, column: 17)
!525 = !DILocation(line: 360, column: 24, scope: !524)
!526 = !DILocation(line: 360, column: 17, scope: !516)
!527 = !DILocation(line: 360, column: 34, scope: !528)
!528 = distinct !DILexicalBlock(scope: !524, file: !33, line: 360, column: 33)
!529 = !DILocation(line: 362, column: 20, scope: !530)
!530 = distinct !DILexicalBlock(scope: !516, file: !33, line: 362, column: 13)
!531 = !DILocation(line: 362, column: 18, scope: !530)
!532 = !DILocation(line: 362, column: 25, scope: !533)
!533 = distinct !DILexicalBlock(scope: !530, file: !33, line: 362, column: 13)
!534 = !DILocation(line: 362, column: 27, scope: !533)
!535 = !DILocation(line: 362, column: 13, scope: !530)
!536 = !DILocation(line: 364, column: 17, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !33, line: 363, column: 13)
!538 = !DILocation(line: 364, column: 24, scope: !537)
!539 = !DILocation(line: 364, column: 27, scope: !537)
!540 = !DILocation(line: 365, column: 13, scope: !537)
!541 = !DILocation(line: 362, column: 34, scope: !533)
!542 = !DILocation(line: 362, column: 13, scope: !533)
!543 = distinct !{!543, !535, !544, !161}
!544 = !DILocation(line: 365, column: 13, scope: !530)
!545 = !DILocation(line: 368, column: 17, scope: !546)
!546 = distinct !DILexicalBlock(scope: !516, file: !33, line: 368, column: 17)
!547 = !DILocation(line: 368, column: 22, scope: !546)
!548 = !DILocation(line: 368, column: 17, scope: !516)
!549 = !DILocation(line: 370, column: 17, scope: !550)
!550 = distinct !DILexicalBlock(scope: !546, file: !33, line: 369, column: 13)
!551 = !DILocation(line: 370, column: 24, scope: !550)
!552 = !DILocation(line: 370, column: 30, scope: !550)
!553 = !DILocation(line: 372, column: 23, scope: !554)
!554 = distinct !DILexicalBlock(scope: !550, file: !33, line: 372, column: 17)
!555 = !DILocation(line: 372, column: 21, scope: !554)
!556 = !DILocation(line: 372, column: 28, scope: !557)
!557 = distinct !DILexicalBlock(scope: !554, file: !33, line: 372, column: 17)
!558 = !DILocation(line: 372, column: 30, scope: !557)
!559 = !DILocation(line: 372, column: 17, scope: !554)
!560 = !DILocation(line: 374, column: 34, scope: !561)
!561 = distinct !DILexicalBlock(scope: !557, file: !33, line: 373, column: 17)
!562 = !DILocation(line: 374, column: 41, scope: !561)
!563 = !DILocation(line: 374, column: 21, scope: !561)
!564 = !DILocation(line: 375, column: 17, scope: !561)
!565 = !DILocation(line: 372, column: 37, scope: !557)
!566 = !DILocation(line: 372, column: 17, scope: !557)
!567 = distinct !{!567, !559, !568, !161}
!568 = !DILocation(line: 375, column: 17, scope: !554)
!569 = !DILocation(line: 376, column: 13, scope: !550)
!570 = !DILocation(line: 379, column: 17, scope: !571)
!571 = distinct !DILexicalBlock(scope: !546, file: !33, line: 378, column: 13)
!572 = !DILocation(line: 381, column: 18, scope: !516)
!573 = !DILocation(line: 381, column: 13, scope: !516)
!574 = !DILocation(line: 383, column: 5, scope: !517)
!575 = !DILocation(line: 384, column: 1, scope: !500)
!576 = distinct !DISubprogram(name: "goodG2B2", scope: !33, file: !33, line: 387, type: !34, scopeLine: 388, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!577 = !DILocalVariable(name: "data", scope: !576, file: !33, line: 389, type: !22)
!578 = !DILocation(line: 389, column: 9, scope: !576)
!579 = !DILocation(line: 391, column: 10, scope: !576)
!580 = !DILocation(line: 392, column: 8, scope: !581)
!581 = distinct !DILexicalBlock(scope: !576, file: !33, line: 392, column: 8)
!582 = !DILocation(line: 392, column: 8, scope: !576)
!583 = !DILocation(line: 396, column: 14, scope: !584)
!584 = distinct !DILexicalBlock(scope: !581, file: !33, line: 393, column: 5)
!585 = !DILocation(line: 397, column: 5, scope: !584)
!586 = !DILocation(line: 398, column: 8, scope: !587)
!587 = distinct !DILexicalBlock(scope: !576, file: !33, line: 398, column: 8)
!588 = !DILocation(line: 398, column: 8, scope: !576)
!589 = !DILocalVariable(name: "i", scope: !590, file: !33, line: 401, type: !22)
!590 = distinct !DILexicalBlock(scope: !591, file: !33, line: 400, column: 9)
!591 = distinct !DILexicalBlock(scope: !587, file: !33, line: 399, column: 5)
!592 = !DILocation(line: 401, column: 17, scope: !590)
!593 = !DILocalVariable(name: "buffer", scope: !590, file: !33, line: 402, type: !21)
!594 = !DILocation(line: 402, column: 19, scope: !590)
!595 = !DILocation(line: 402, column: 35, scope: !590)
!596 = !DILocation(line: 402, column: 28, scope: !590)
!597 = !DILocation(line: 403, column: 17, scope: !598)
!598 = distinct !DILexicalBlock(scope: !590, file: !33, line: 403, column: 17)
!599 = !DILocation(line: 403, column: 24, scope: !598)
!600 = !DILocation(line: 403, column: 17, scope: !590)
!601 = !DILocation(line: 403, column: 34, scope: !602)
!602 = distinct !DILexicalBlock(scope: !598, file: !33, line: 403, column: 33)
!603 = !DILocation(line: 405, column: 20, scope: !604)
!604 = distinct !DILexicalBlock(scope: !590, file: !33, line: 405, column: 13)
!605 = !DILocation(line: 405, column: 18, scope: !604)
!606 = !DILocation(line: 405, column: 25, scope: !607)
!607 = distinct !DILexicalBlock(scope: !604, file: !33, line: 405, column: 13)
!608 = !DILocation(line: 405, column: 27, scope: !607)
!609 = !DILocation(line: 405, column: 13, scope: !604)
!610 = !DILocation(line: 407, column: 17, scope: !611)
!611 = distinct !DILexicalBlock(scope: !607, file: !33, line: 406, column: 13)
!612 = !DILocation(line: 407, column: 24, scope: !611)
!613 = !DILocation(line: 407, column: 27, scope: !611)
!614 = !DILocation(line: 408, column: 13, scope: !611)
!615 = !DILocation(line: 405, column: 34, scope: !607)
!616 = !DILocation(line: 405, column: 13, scope: !607)
!617 = distinct !{!617, !609, !618, !161}
!618 = !DILocation(line: 408, column: 13, scope: !604)
!619 = !DILocation(line: 411, column: 17, scope: !620)
!620 = distinct !DILexicalBlock(scope: !590, file: !33, line: 411, column: 17)
!621 = !DILocation(line: 411, column: 22, scope: !620)
!622 = !DILocation(line: 411, column: 17, scope: !590)
!623 = !DILocation(line: 413, column: 17, scope: !624)
!624 = distinct !DILexicalBlock(scope: !620, file: !33, line: 412, column: 13)
!625 = !DILocation(line: 413, column: 24, scope: !624)
!626 = !DILocation(line: 413, column: 30, scope: !624)
!627 = !DILocation(line: 415, column: 23, scope: !628)
!628 = distinct !DILexicalBlock(scope: !624, file: !33, line: 415, column: 17)
!629 = !DILocation(line: 415, column: 21, scope: !628)
!630 = !DILocation(line: 415, column: 28, scope: !631)
!631 = distinct !DILexicalBlock(scope: !628, file: !33, line: 415, column: 17)
!632 = !DILocation(line: 415, column: 30, scope: !631)
!633 = !DILocation(line: 415, column: 17, scope: !628)
!634 = !DILocation(line: 417, column: 34, scope: !635)
!635 = distinct !DILexicalBlock(scope: !631, file: !33, line: 416, column: 17)
!636 = !DILocation(line: 417, column: 41, scope: !635)
!637 = !DILocation(line: 417, column: 21, scope: !635)
!638 = !DILocation(line: 418, column: 17, scope: !635)
!639 = !DILocation(line: 415, column: 37, scope: !631)
!640 = !DILocation(line: 415, column: 17, scope: !631)
!641 = distinct !{!641, !633, !642, !161}
!642 = !DILocation(line: 418, column: 17, scope: !628)
!643 = !DILocation(line: 419, column: 13, scope: !624)
!644 = !DILocation(line: 422, column: 17, scope: !645)
!645 = distinct !DILexicalBlock(scope: !620, file: !33, line: 421, column: 13)
!646 = !DILocation(line: 424, column: 18, scope: !590)
!647 = !DILocation(line: 424, column: 13, scope: !590)
!648 = !DILocation(line: 426, column: 5, scope: !591)
!649 = !DILocation(line: 427, column: 1, scope: !576)
