; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08-1.c"
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_bad() #0 !dbg !32 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !40
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
  %call23 = call i32 @staticReturnsTrue(), !dbg !128
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
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_good() #0 !dbg !193 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_good(), !dbg !212
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !213
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !214
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_bad(), !dbg !215
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !216
  ret i32 0, !dbg !217
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !218 {
entry:
  ret i32 1, !dbg !221
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G1() #0 !dbg !222 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !223, metadata !DIExpression()), !dbg !224
  store i32 -1, i32* %data, align 4, !dbg !225
  %call = call i32 @staticReturnsTrue(), !dbg !226
  %tobool = icmp ne i32 %call, 0, !dbg !226
  br i1 %tobool, label %if.then, label %if.end22, !dbg !228

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !229, metadata !DIExpression()), !dbg !232
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !233, metadata !DIExpression()), !dbg !234
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !235, metadata !DIExpression()), !dbg !236
  store i32 -1, i32* %connectSocket, align 4, !dbg !236
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !237, metadata !DIExpression()), !dbg !238
  br label %do.body, !dbg !239

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !240
  store i32 %call1, i32* %connectSocket, align 4, !dbg !242
  %0 = load i32, i32* %connectSocket, align 4, !dbg !243
  %cmp = icmp eq i32 %0, -1, !dbg !245
  br i1 %cmp, label %if.then2, label %if.end, !dbg !246

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !247

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !249
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !249
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !250
  store i8 2, i8* %sin_family, align 1, !dbg !251
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !252
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !253
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !254
  store i32 %call3, i32* %s_addr, align 4, !dbg !255
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !256
  store i16 -30871, i16* %sin_port, align 2, !dbg !257
  %2 = load i32, i32* %connectSocket, align 4, !dbg !258
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !260
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !261
  %cmp5 = icmp eq i32 %call4, -1, !dbg !262
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !263

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !264

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !266
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !267
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !268
  %conv = trunc i64 %call8 to i32, !dbg !268
  store i32 %conv, i32* %recvResult, align 4, !dbg !269
  %5 = load i32, i32* %recvResult, align 4, !dbg !270
  %cmp9 = icmp eq i32 %5, -1, !dbg !272
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !273

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !274
  %cmp11 = icmp eq i32 %6, 0, !dbg !275
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !276

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !277

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !279
  %idxprom = sext i32 %7 to i64, !dbg !280
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !280
  store i8 0, i8* %arrayidx, align 1, !dbg !281
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !282
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !283
  store i32 %call16, i32* %data, align 4, !dbg !284
  br label %do.end, !dbg !285

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !286
  %cmp17 = icmp ne i32 %8, -1, !dbg !288
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !289

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !290
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !292
  br label %if.end21, !dbg !293

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !294

if.end22:                                         ; preds = %if.end21, %entry
  %call23 = call i32 @staticReturnsFalse(), !dbg !295
  %tobool24 = icmp ne i32 %call23, 0, !dbg !295
  br i1 %tobool24, label %if.then25, label %if.else, !dbg !297

if.then25:                                        ; preds = %if.end22
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !298
  br label %if.end53, !dbg !300

if.else:                                          ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !301, metadata !DIExpression()), !dbg !304
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !305, metadata !DIExpression()), !dbg !306
  %call26 = call i8* @malloc(i64 noundef 40) #6, !dbg !307
  %10 = bitcast i8* %call26 to i32*, !dbg !308
  store i32* %10, i32** %buffer, align 8, !dbg !306
  %11 = load i32*, i32** %buffer, align 8, !dbg !309
  %cmp27 = icmp eq i32* %11, null, !dbg !311
  br i1 %cmp27, label %if.then29, label %if.end30, !dbg !312

if.then29:                                        ; preds = %if.else
  call void @exit(i32 noundef -1) #7, !dbg !313
  unreachable, !dbg !313

if.end30:                                         ; preds = %if.else
  store i32 0, i32* %i, align 4, !dbg !315
  br label %for.cond, !dbg !317

for.cond:                                         ; preds = %for.inc, %if.end30
  %12 = load i32, i32* %i, align 4, !dbg !318
  %cmp31 = icmp slt i32 %12, 10, !dbg !320
  br i1 %cmp31, label %for.body, label %for.end, !dbg !321

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !322
  %14 = load i32, i32* %i, align 4, !dbg !324
  %idxprom33 = sext i32 %14 to i64, !dbg !322
  %arrayidx34 = getelementptr inbounds i32, i32* %13, i64 %idxprom33, !dbg !322
  store i32 0, i32* %arrayidx34, align 4, !dbg !325
  br label %for.inc, !dbg !326

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !327
  %inc = add nsw i32 %15, 1, !dbg !327
  store i32 %inc, i32* %i, align 4, !dbg !327
  br label %for.cond, !dbg !328, !llvm.loop !329

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !331
  %cmp35 = icmp sge i32 %16, 0, !dbg !333
  br i1 %cmp35, label %land.lhs.true, label %if.else51, !dbg !334

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !335
  %cmp37 = icmp slt i32 %17, 10, !dbg !336
  br i1 %cmp37, label %if.then39, label %if.else51, !dbg !337

if.then39:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !338
  %19 = load i32, i32* %data, align 4, !dbg !340
  %idxprom40 = sext i32 %19 to i64, !dbg !338
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !338
  store i32 1, i32* %arrayidx41, align 4, !dbg !341
  store i32 0, i32* %i, align 4, !dbg !342
  br label %for.cond42, !dbg !344

for.cond42:                                       ; preds = %for.inc48, %if.then39
  %20 = load i32, i32* %i, align 4, !dbg !345
  %cmp43 = icmp slt i32 %20, 10, !dbg !347
  br i1 %cmp43, label %for.body45, label %for.end50, !dbg !348

for.body45:                                       ; preds = %for.cond42
  %21 = load i32*, i32** %buffer, align 8, !dbg !349
  %22 = load i32, i32* %i, align 4, !dbg !351
  %idxprom46 = sext i32 %22 to i64, !dbg !349
  %arrayidx47 = getelementptr inbounds i32, i32* %21, i64 %idxprom46, !dbg !349
  %23 = load i32, i32* %arrayidx47, align 4, !dbg !349
  call void @printIntLine(i32 noundef %23), !dbg !352
  br label %for.inc48, !dbg !353

for.inc48:                                        ; preds = %for.body45
  %24 = load i32, i32* %i, align 4, !dbg !354
  %inc49 = add nsw i32 %24, 1, !dbg !354
  store i32 %inc49, i32* %i, align 4, !dbg !354
  br label %for.cond42, !dbg !355, !llvm.loop !356

for.end50:                                        ; preds = %for.cond42
  br label %if.end52, !dbg !358

if.else51:                                        ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !359
  br label %if.end52

if.end52:                                         ; preds = %if.else51, %for.end50
  %25 = load i32*, i32** %buffer, align 8, !dbg !361
  %26 = bitcast i32* %25 to i8*, !dbg !361
  call void @free(i8* noundef %26), !dbg !362
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then25
  ret void, !dbg !363
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !364 {
entry:
  ret i32 0, !dbg !365
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G2() #0 !dbg !366 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !367, metadata !DIExpression()), !dbg !368
  store i32 -1, i32* %data, align 4, !dbg !369
  %call = call i32 @staticReturnsTrue(), !dbg !370
  %tobool = icmp ne i32 %call, 0, !dbg !370
  br i1 %tobool, label %if.then, label %if.end22, !dbg !372

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !373, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !377, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !379, metadata !DIExpression()), !dbg !380
  store i32 -1, i32* %connectSocket, align 4, !dbg !380
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !381, metadata !DIExpression()), !dbg !382
  br label %do.body, !dbg !383

do.body:                                          ; preds = %if.then
  %call1 = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !384
  store i32 %call1, i32* %connectSocket, align 4, !dbg !386
  %0 = load i32, i32* %connectSocket, align 4, !dbg !387
  %cmp = icmp eq i32 %0, -1, !dbg !389
  br i1 %cmp, label %if.then2, label %if.end, !dbg !390

if.then2:                                         ; preds = %do.body
  br label %do.end, !dbg !391

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !393
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !393
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !394
  store i8 2, i8* %sin_family, align 1, !dbg !395
  %call3 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !396
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !397
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !398
  store i32 %call3, i32* %s_addr, align 4, !dbg !399
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !400
  store i16 -30871, i16* %sin_port, align 2, !dbg !401
  %2 = load i32, i32* %connectSocket, align 4, !dbg !402
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !404
  %call4 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !405
  %cmp5 = icmp eq i32 %call4, -1, !dbg !406
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !407

if.then6:                                         ; preds = %if.end
  br label %do.end, !dbg !408

if.end7:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !410
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !411
  %call8 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !412
  %conv = trunc i64 %call8 to i32, !dbg !412
  store i32 %conv, i32* %recvResult, align 4, !dbg !413
  %5 = load i32, i32* %recvResult, align 4, !dbg !414
  %cmp9 = icmp eq i32 %5, -1, !dbg !416
  br i1 %cmp9, label %if.then13, label %lor.lhs.false, !dbg !417

lor.lhs.false:                                    ; preds = %if.end7
  %6 = load i32, i32* %recvResult, align 4, !dbg !418
  %cmp11 = icmp eq i32 %6, 0, !dbg !419
  br i1 %cmp11, label %if.then13, label %if.end14, !dbg !420

if.then13:                                        ; preds = %lor.lhs.false, %if.end7
  br label %do.end, !dbg !421

if.end14:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !423
  %idxprom = sext i32 %7 to i64, !dbg !424
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !424
  store i8 0, i8* %arrayidx, align 1, !dbg !425
  %arraydecay15 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !426
  %call16 = call i32 @atoi(i8* noundef %arraydecay15), !dbg !427
  store i32 %call16, i32* %data, align 4, !dbg !428
  br label %do.end, !dbg !429

do.end:                                           ; preds = %if.end14, %if.then13, %if.then6, %if.then2
  %8 = load i32, i32* %connectSocket, align 4, !dbg !430
  %cmp17 = icmp ne i32 %8, -1, !dbg !432
  br i1 %cmp17, label %if.then19, label %if.end21, !dbg !433

if.then19:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !434
  %call20 = call i32 @"\01_close"(i32 noundef %9), !dbg !436
  br label %if.end21, !dbg !437

if.end21:                                         ; preds = %if.then19, %do.end
  br label %if.end22, !dbg !438

if.end22:                                         ; preds = %if.end21, %entry
  %call23 = call i32 @staticReturnsTrue(), !dbg !439
  %tobool24 = icmp ne i32 %call23, 0, !dbg !439
  br i1 %tobool24, label %if.then25, label %if.end52, !dbg !441

if.then25:                                        ; preds = %if.end22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !442, metadata !DIExpression()), !dbg !445
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !446, metadata !DIExpression()), !dbg !447
  %call26 = call i8* @malloc(i64 noundef 40) #6, !dbg !448
  %10 = bitcast i8* %call26 to i32*, !dbg !449
  store i32* %10, i32** %buffer, align 8, !dbg !447
  %11 = load i32*, i32** %buffer, align 8, !dbg !450
  %cmp27 = icmp eq i32* %11, null, !dbg !452
  br i1 %cmp27, label %if.then29, label %if.end30, !dbg !453

if.then29:                                        ; preds = %if.then25
  call void @exit(i32 noundef -1) #7, !dbg !454
  unreachable, !dbg !454

if.end30:                                         ; preds = %if.then25
  store i32 0, i32* %i, align 4, !dbg !456
  br label %for.cond, !dbg !458

for.cond:                                         ; preds = %for.inc, %if.end30
  %12 = load i32, i32* %i, align 4, !dbg !459
  %cmp31 = icmp slt i32 %12, 10, !dbg !461
  br i1 %cmp31, label %for.body, label %for.end, !dbg !462

for.body:                                         ; preds = %for.cond
  %13 = load i32*, i32** %buffer, align 8, !dbg !463
  %14 = load i32, i32* %i, align 4, !dbg !465
  %idxprom33 = sext i32 %14 to i64, !dbg !463
  %arrayidx34 = getelementptr inbounds i32, i32* %13, i64 %idxprom33, !dbg !463
  store i32 0, i32* %arrayidx34, align 4, !dbg !466
  br label %for.inc, !dbg !467

for.inc:                                          ; preds = %for.body
  %15 = load i32, i32* %i, align 4, !dbg !468
  %inc = add nsw i32 %15, 1, !dbg !468
  store i32 %inc, i32* %i, align 4, !dbg !468
  br label %for.cond, !dbg !469, !llvm.loop !470

for.end:                                          ; preds = %for.cond
  %16 = load i32, i32* %data, align 4, !dbg !472
  %cmp35 = icmp sge i32 %16, 0, !dbg !474
  br i1 %cmp35, label %land.lhs.true, label %if.else, !dbg !475

land.lhs.true:                                    ; preds = %for.end
  %17 = load i32, i32* %data, align 4, !dbg !476
  %cmp37 = icmp slt i32 %17, 10, !dbg !477
  br i1 %cmp37, label %if.then39, label %if.else, !dbg !478

if.then39:                                        ; preds = %land.lhs.true
  %18 = load i32*, i32** %buffer, align 8, !dbg !479
  %19 = load i32, i32* %data, align 4, !dbg !481
  %idxprom40 = sext i32 %19 to i64, !dbg !479
  %arrayidx41 = getelementptr inbounds i32, i32* %18, i64 %idxprom40, !dbg !479
  store i32 1, i32* %arrayidx41, align 4, !dbg !482
  store i32 0, i32* %i, align 4, !dbg !483
  br label %for.cond42, !dbg !485

for.cond42:                                       ; preds = %for.inc48, %if.then39
  %20 = load i32, i32* %i, align 4, !dbg !486
  %cmp43 = icmp slt i32 %20, 10, !dbg !488
  br i1 %cmp43, label %for.body45, label %for.end50, !dbg !489

for.body45:                                       ; preds = %for.cond42
  %21 = load i32*, i32** %buffer, align 8, !dbg !490
  %22 = load i32, i32* %i, align 4, !dbg !492
  %idxprom46 = sext i32 %22 to i64, !dbg !490
  %arrayidx47 = getelementptr inbounds i32, i32* %21, i64 %idxprom46, !dbg !490
  %23 = load i32, i32* %arrayidx47, align 4, !dbg !490
  call void @printIntLine(i32 noundef %23), !dbg !493
  br label %for.inc48, !dbg !494

for.inc48:                                        ; preds = %for.body45
  %24 = load i32, i32* %i, align 4, !dbg !495
  %inc49 = add nsw i32 %24, 1, !dbg !495
  store i32 %inc49, i32* %i, align 4, !dbg !495
  br label %for.cond42, !dbg !496, !llvm.loop !497

for.end50:                                        ; preds = %for.cond42
  br label %if.end51, !dbg !499

if.else:                                          ; preds = %land.lhs.true, %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0)), !dbg !500
  br label %if.end51

if.end51:                                         ; preds = %if.else, %for.end50
  %25 = load i32*, i32** %buffer, align 8, !dbg !502
  %26 = bitcast i32* %25 to i8*, !dbg !502
  call void @free(i8* noundef %26), !dbg !503
  br label %if.end52, !dbg !504

if.end52:                                         ; preds = %if.end51, %if.end22
  ret void, !dbg !505
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !506 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !507, metadata !DIExpression()), !dbg !508
  store i32 -1, i32* %data, align 4, !dbg !509
  %call = call i32 @staticReturnsFalse(), !dbg !510
  %tobool = icmp ne i32 %call, 0, !dbg !510
  br i1 %tobool, label %if.then, label %if.else, !dbg !512

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i64 0, i64 0)), !dbg !513
  br label %if.end, !dbg !515

if.else:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !516
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call1 = call i32 @staticReturnsTrue(), !dbg !518
  %tobool2 = icmp ne i32 %call1, 0, !dbg !518
  br i1 %tobool2, label %if.then3, label %if.end22, !dbg !520

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !521, metadata !DIExpression()), !dbg !524
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !525, metadata !DIExpression()), !dbg !526
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !527
  %0 = bitcast i8* %call4 to i32*, !dbg !528
  store i32* %0, i32** %buffer, align 8, !dbg !526
  %1 = load i32*, i32** %buffer, align 8, !dbg !529
  %cmp = icmp eq i32* %1, null, !dbg !531
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !532

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #7, !dbg !533
  unreachable, !dbg !533

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !535
  br label %for.cond, !dbg !537

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !538
  %cmp7 = icmp slt i32 %2, 10, !dbg !540
  br i1 %cmp7, label %for.body, label %for.end, !dbg !541

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !542
  %4 = load i32, i32* %i, align 4, !dbg !544
  %idxprom = sext i32 %4 to i64, !dbg !542
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !542
  store i32 0, i32* %arrayidx, align 4, !dbg !545
  br label %for.inc, !dbg !546

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !547
  %inc = add nsw i32 %5, 1, !dbg !547
  store i32 %inc, i32* %i, align 4, !dbg !547
  br label %for.cond, !dbg !548, !llvm.loop !549

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !551
  %cmp8 = icmp sge i32 %6, 0, !dbg !553
  br i1 %cmp8, label %if.then9, label %if.else20, !dbg !554

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !555
  %8 = load i32, i32* %data, align 4, !dbg !557
  %idxprom10 = sext i32 %8 to i64, !dbg !555
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !555
  store i32 1, i32* %arrayidx11, align 4, !dbg !558
  store i32 0, i32* %i, align 4, !dbg !559
  br label %for.cond12, !dbg !561

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !562
  %cmp13 = icmp slt i32 %9, 10, !dbg !564
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !565

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !566
  %11 = load i32, i32* %i, align 4, !dbg !568
  %idxprom15 = sext i32 %11 to i64, !dbg !566
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !566
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !566
  call void @printIntLine(i32 noundef %12), !dbg !569
  br label %for.inc17, !dbg !570

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !571
  %inc18 = add nsw i32 %13, 1, !dbg !571
  store i32 %inc18, i32* %i, align 4, !dbg !571
  br label %for.cond12, !dbg !572, !llvm.loop !573

for.end19:                                        ; preds = %for.cond12
  br label %if.end21, !dbg !575

if.else20:                                        ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !576
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !578
  %15 = bitcast i32* %14 to i8*, !dbg !578
  call void @free(i8* noundef %15), !dbg !579
  br label %if.end22, !dbg !580

if.end22:                                         ; preds = %if.end21, %if.end
  ret void, !dbg !581
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !582 {
entry:
  %data = alloca i32, align 4
  %i = alloca i32, align 4
  %buffer = alloca i32*, align 8
  call void @llvm.dbg.declare(metadata i32* %data, metadata !583, metadata !DIExpression()), !dbg !584
  store i32 -1, i32* %data, align 4, !dbg !585
  %call = call i32 @staticReturnsTrue(), !dbg !586
  %tobool = icmp ne i32 %call, 0, !dbg !586
  br i1 %tobool, label %if.then, label %if.end, !dbg !588

if.then:                                          ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !589
  br label %if.end, !dbg !591

if.end:                                           ; preds = %if.then, %entry
  %call1 = call i32 @staticReturnsTrue(), !dbg !592
  %tobool2 = icmp ne i32 %call1, 0, !dbg !592
  br i1 %tobool2, label %if.then3, label %if.end21, !dbg !594

if.then3:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !595, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !599, metadata !DIExpression()), !dbg !600
  %call4 = call i8* @malloc(i64 noundef 40) #6, !dbg !601
  %0 = bitcast i8* %call4 to i32*, !dbg !602
  store i32* %0, i32** %buffer, align 8, !dbg !600
  %1 = load i32*, i32** %buffer, align 8, !dbg !603
  %cmp = icmp eq i32* %1, null, !dbg !605
  br i1 %cmp, label %if.then5, label %if.end6, !dbg !606

if.then5:                                         ; preds = %if.then3
  call void @exit(i32 noundef -1) #7, !dbg !607
  unreachable, !dbg !607

if.end6:                                          ; preds = %if.then3
  store i32 0, i32* %i, align 4, !dbg !609
  br label %for.cond, !dbg !611

for.cond:                                         ; preds = %for.inc, %if.end6
  %2 = load i32, i32* %i, align 4, !dbg !612
  %cmp7 = icmp slt i32 %2, 10, !dbg !614
  br i1 %cmp7, label %for.body, label %for.end, !dbg !615

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %buffer, align 8, !dbg !616
  %4 = load i32, i32* %i, align 4, !dbg !618
  %idxprom = sext i32 %4 to i64, !dbg !616
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !616
  store i32 0, i32* %arrayidx, align 4, !dbg !619
  br label %for.inc, !dbg !620

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !621
  %inc = add nsw i32 %5, 1, !dbg !621
  store i32 %inc, i32* %i, align 4, !dbg !621
  br label %for.cond, !dbg !622, !llvm.loop !623

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %data, align 4, !dbg !625
  %cmp8 = icmp sge i32 %6, 0, !dbg !627
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !628

if.then9:                                         ; preds = %for.end
  %7 = load i32*, i32** %buffer, align 8, !dbg !629
  %8 = load i32, i32* %data, align 4, !dbg !631
  %idxprom10 = sext i32 %8 to i64, !dbg !629
  %arrayidx11 = getelementptr inbounds i32, i32* %7, i64 %idxprom10, !dbg !629
  store i32 1, i32* %arrayidx11, align 4, !dbg !632
  store i32 0, i32* %i, align 4, !dbg !633
  br label %for.cond12, !dbg !635

for.cond12:                                       ; preds = %for.inc17, %if.then9
  %9 = load i32, i32* %i, align 4, !dbg !636
  %cmp13 = icmp slt i32 %9, 10, !dbg !638
  br i1 %cmp13, label %for.body14, label %for.end19, !dbg !639

for.body14:                                       ; preds = %for.cond12
  %10 = load i32*, i32** %buffer, align 8, !dbg !640
  %11 = load i32, i32* %i, align 4, !dbg !642
  %idxprom15 = sext i32 %11 to i64, !dbg !640
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %idxprom15, !dbg !640
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !640
  call void @printIntLine(i32 noundef %12), !dbg !643
  br label %for.inc17, !dbg !644

for.inc17:                                        ; preds = %for.body14
  %13 = load i32, i32* %i, align 4, !dbg !645
  %inc18 = add nsw i32 %13, 1, !dbg !645
  store i32 %inc18, i32* %i, align 4, !dbg !645
  br label %for.cond12, !dbg !646, !llvm.loop !647

for.end19:                                        ; preds = %for.cond12
  br label %if.end20, !dbg !649

if.else:                                          ; preds = %for.end
  call void @printLine(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0)), !dbg !650
  br label %if.end20

if.end20:                                         ; preds = %if.else, %for.end19
  %14 = load i32*, i32** %buffer, align 8, !dbg !652
  %15 = bitcast i32* %14 to i8*, !dbg !652
  call void @free(i8* noundef %15), !dbg !653
  br label %if.end21, !dbg !654

if.end21:                                         ; preds = %if.end20, %if.end
  ret void, !dbg !655
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_bad", scope: !33, file: !33, line: 57, type: !34, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!33 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!34 = !DISubroutineType(types: !35)
!35 = !{null}
!36 = !{}
!37 = !DILocalVariable(name: "data", scope: !32, file: !33, line: 59, type: !22)
!38 = !DILocation(line: 59, column: 9, scope: !32)
!39 = !DILocation(line: 61, column: 10, scope: !32)
!40 = !DILocation(line: 62, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !32, file: !33, line: 62, column: 8)
!42 = !DILocation(line: 62, column: 8, scope: !32)
!43 = !DILocalVariable(name: "recvResult", scope: !44, file: !33, line: 69, type: !22)
!44 = distinct !DILexicalBlock(scope: !45, file: !33, line: 64, column: 9)
!45 = distinct !DILexicalBlock(scope: !41, file: !33, line: 63, column: 5)
!46 = !DILocation(line: 69, column: 17, scope: !44)
!47 = !DILocalVariable(name: "service", scope: !44, file: !33, line: 70, type: !48)
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
!67 = !DILocation(line: 70, column: 32, scope: !44)
!68 = !DILocalVariable(name: "connectSocket", scope: !44, file: !33, line: 71, type: !22)
!69 = !DILocation(line: 71, column: 20, scope: !44)
!70 = !DILocalVariable(name: "inputBuffer", scope: !44, file: !33, line: 72, type: !17)
!71 = !DILocation(line: 72, column: 18, scope: !44)
!72 = !DILocation(line: 73, column: 13, scope: !44)
!73 = !DILocation(line: 83, column: 33, scope: !74)
!74 = distinct !DILexicalBlock(scope: !44, file: !33, line: 74, column: 13)
!75 = !DILocation(line: 83, column: 31, scope: !74)
!76 = !DILocation(line: 84, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !74, file: !33, line: 84, column: 21)
!78 = !DILocation(line: 84, column: 35, scope: !77)
!79 = !DILocation(line: 84, column: 21, scope: !74)
!80 = !DILocation(line: 86, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !33, line: 85, column: 17)
!82 = !DILocation(line: 88, column: 17, scope: !74)
!83 = !DILocation(line: 89, column: 25, scope: !74)
!84 = !DILocation(line: 89, column: 36, scope: !74)
!85 = !DILocation(line: 90, column: 43, scope: !74)
!86 = !DILocation(line: 90, column: 25, scope: !74)
!87 = !DILocation(line: 90, column: 34, scope: !74)
!88 = !DILocation(line: 90, column: 41, scope: !74)
!89 = !DILocation(line: 91, column: 25, scope: !74)
!90 = !DILocation(line: 91, column: 34, scope: !74)
!91 = !DILocation(line: 92, column: 29, scope: !92)
!92 = distinct !DILexicalBlock(scope: !74, file: !33, line: 92, column: 21)
!93 = !DILocation(line: 92, column: 44, scope: !92)
!94 = !DILocation(line: 92, column: 21, scope: !92)
!95 = !DILocation(line: 92, column: 89, scope: !92)
!96 = !DILocation(line: 92, column: 21, scope: !74)
!97 = !DILocation(line: 94, column: 21, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !33, line: 93, column: 17)
!99 = !DILocation(line: 98, column: 35, scope: !74)
!100 = !DILocation(line: 98, column: 50, scope: !74)
!101 = !DILocation(line: 98, column: 30, scope: !74)
!102 = !DILocation(line: 98, column: 28, scope: !74)
!103 = !DILocation(line: 99, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !74, file: !33, line: 99, column: 21)
!105 = !DILocation(line: 99, column: 32, scope: !104)
!106 = !DILocation(line: 99, column: 48, scope: !104)
!107 = !DILocation(line: 99, column: 51, scope: !104)
!108 = !DILocation(line: 99, column: 62, scope: !104)
!109 = !DILocation(line: 99, column: 21, scope: !74)
!110 = !DILocation(line: 101, column: 21, scope: !111)
!111 = distinct !DILexicalBlock(scope: !104, file: !33, line: 100, column: 17)
!112 = !DILocation(line: 104, column: 29, scope: !74)
!113 = !DILocation(line: 104, column: 17, scope: !74)
!114 = !DILocation(line: 104, column: 41, scope: !74)
!115 = !DILocation(line: 106, column: 29, scope: !74)
!116 = !DILocation(line: 106, column: 24, scope: !74)
!117 = !DILocation(line: 106, column: 22, scope: !74)
!118 = !DILocation(line: 107, column: 13, scope: !74)
!119 = !DILocation(line: 109, column: 17, scope: !120)
!120 = distinct !DILexicalBlock(scope: !44, file: !33, line: 109, column: 17)
!121 = !DILocation(line: 109, column: 31, scope: !120)
!122 = !DILocation(line: 109, column: 17, scope: !44)
!123 = !DILocation(line: 111, column: 30, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !33, line: 110, column: 13)
!125 = !DILocation(line: 111, column: 17, scope: !124)
!126 = !DILocation(line: 112, column: 13, scope: !124)
!127 = !DILocation(line: 120, column: 5, scope: !45)
!128 = !DILocation(line: 121, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !32, file: !33, line: 121, column: 8)
!130 = !DILocation(line: 121, column: 8, scope: !32)
!131 = !DILocalVariable(name: "i", scope: !132, file: !33, line: 124, type: !22)
!132 = distinct !DILexicalBlock(scope: !133, file: !33, line: 123, column: 9)
!133 = distinct !DILexicalBlock(scope: !129, file: !33, line: 122, column: 5)
!134 = !DILocation(line: 124, column: 17, scope: !132)
!135 = !DILocalVariable(name: "buffer", scope: !132, file: !33, line: 125, type: !21)
!136 = !DILocation(line: 125, column: 19, scope: !132)
!137 = !DILocation(line: 125, column: 35, scope: !132)
!138 = !DILocation(line: 125, column: 28, scope: !132)
!139 = !DILocation(line: 126, column: 17, scope: !140)
!140 = distinct !DILexicalBlock(scope: !132, file: !33, line: 126, column: 17)
!141 = !DILocation(line: 126, column: 24, scope: !140)
!142 = !DILocation(line: 126, column: 17, scope: !132)
!143 = !DILocation(line: 126, column: 34, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !33, line: 126, column: 33)
!145 = !DILocation(line: 128, column: 20, scope: !146)
!146 = distinct !DILexicalBlock(scope: !132, file: !33, line: 128, column: 13)
!147 = !DILocation(line: 128, column: 18, scope: !146)
!148 = !DILocation(line: 128, column: 25, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !33, line: 128, column: 13)
!150 = !DILocation(line: 128, column: 27, scope: !149)
!151 = !DILocation(line: 128, column: 13, scope: !146)
!152 = !DILocation(line: 130, column: 17, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !33, line: 129, column: 13)
!154 = !DILocation(line: 130, column: 24, scope: !153)
!155 = !DILocation(line: 130, column: 27, scope: !153)
!156 = !DILocation(line: 131, column: 13, scope: !153)
!157 = !DILocation(line: 128, column: 34, scope: !149)
!158 = !DILocation(line: 128, column: 13, scope: !149)
!159 = distinct !{!159, !151, !160, !161}
!160 = !DILocation(line: 131, column: 13, scope: !146)
!161 = !{!"llvm.loop.mustprogress"}
!162 = !DILocation(line: 134, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !132, file: !33, line: 134, column: 17)
!164 = !DILocation(line: 134, column: 22, scope: !163)
!165 = !DILocation(line: 134, column: 17, scope: !132)
!166 = !DILocation(line: 136, column: 17, scope: !167)
!167 = distinct !DILexicalBlock(scope: !163, file: !33, line: 135, column: 13)
!168 = !DILocation(line: 136, column: 24, scope: !167)
!169 = !DILocation(line: 136, column: 30, scope: !167)
!170 = !DILocation(line: 138, column: 23, scope: !171)
!171 = distinct !DILexicalBlock(scope: !167, file: !33, line: 138, column: 17)
!172 = !DILocation(line: 138, column: 21, scope: !171)
!173 = !DILocation(line: 138, column: 28, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !33, line: 138, column: 17)
!175 = !DILocation(line: 138, column: 30, scope: !174)
!176 = !DILocation(line: 138, column: 17, scope: !171)
!177 = !DILocation(line: 140, column: 34, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !33, line: 139, column: 17)
!179 = !DILocation(line: 140, column: 41, scope: !178)
!180 = !DILocation(line: 140, column: 21, scope: !178)
!181 = !DILocation(line: 141, column: 17, scope: !178)
!182 = !DILocation(line: 138, column: 37, scope: !174)
!183 = !DILocation(line: 138, column: 17, scope: !174)
!184 = distinct !{!184, !176, !185, !161}
!185 = !DILocation(line: 141, column: 17, scope: !171)
!186 = !DILocation(line: 142, column: 13, scope: !167)
!187 = !DILocation(line: 145, column: 17, scope: !188)
!188 = distinct !DILexicalBlock(scope: !163, file: !33, line: 144, column: 13)
!189 = !DILocation(line: 147, column: 18, scope: !132)
!190 = !DILocation(line: 147, column: 13, scope: !132)
!191 = !DILocation(line: 149, column: 5, scope: !133)
!192 = !DILocation(line: 150, column: 1, scope: !32)
!193 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE129_connect_socket_08_good", scope: !33, file: !33, line: 442, type: !34, scopeLine: 443, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!194 = !DILocation(line: 444, column: 5, scope: !193)
!195 = !DILocation(line: 445, column: 5, scope: !193)
!196 = !DILocation(line: 446, column: 5, scope: !193)
!197 = !DILocation(line: 447, column: 5, scope: !193)
!198 = !DILocation(line: 448, column: 1, scope: !193)
!199 = distinct !DISubprogram(name: "main", scope: !33, file: !33, line: 459, type: !200, scopeLine: 460, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !36)
!200 = !DISubroutineType(types: !201)
!201 = !{!22, !22, !202}
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!204 = !DILocalVariable(name: "argc", arg: 1, scope: !199, file: !33, line: 459, type: !22)
!205 = !DILocation(line: 459, column: 14, scope: !199)
!206 = !DILocalVariable(name: "argv", arg: 2, scope: !199, file: !33, line: 459, type: !202)
!207 = !DILocation(line: 459, column: 27, scope: !199)
!208 = !DILocation(line: 462, column: 22, scope: !199)
!209 = !DILocation(line: 462, column: 12, scope: !199)
!210 = !DILocation(line: 462, column: 5, scope: !199)
!211 = !DILocation(line: 464, column: 5, scope: !199)
!212 = !DILocation(line: 465, column: 5, scope: !199)
!213 = !DILocation(line: 466, column: 5, scope: !199)
!214 = !DILocation(line: 469, column: 5, scope: !199)
!215 = !DILocation(line: 470, column: 5, scope: !199)
!216 = !DILocation(line: 471, column: 5, scope: !199)
!217 = !DILocation(line: 473, column: 5, scope: !199)
!218 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !33, file: !33, line: 45, type: !219, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!219 = !DISubroutineType(types: !220)
!220 = !{!22}
!221 = !DILocation(line: 47, column: 5, scope: !218)
!222 = distinct !DISubprogram(name: "goodB2G1", scope: !33, file: !33, line: 157, type: !34, scopeLine: 158, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!223 = !DILocalVariable(name: "data", scope: !222, file: !33, line: 159, type: !22)
!224 = !DILocation(line: 159, column: 9, scope: !222)
!225 = !DILocation(line: 161, column: 10, scope: !222)
!226 = !DILocation(line: 162, column: 8, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !33, line: 162, column: 8)
!228 = !DILocation(line: 162, column: 8, scope: !222)
!229 = !DILocalVariable(name: "recvResult", scope: !230, file: !33, line: 169, type: !22)
!230 = distinct !DILexicalBlock(scope: !231, file: !33, line: 164, column: 9)
!231 = distinct !DILexicalBlock(scope: !227, file: !33, line: 163, column: 5)
!232 = !DILocation(line: 169, column: 17, scope: !230)
!233 = !DILocalVariable(name: "service", scope: !230, file: !33, line: 170, type: !48)
!234 = !DILocation(line: 170, column: 32, scope: !230)
!235 = !DILocalVariable(name: "connectSocket", scope: !230, file: !33, line: 171, type: !22)
!236 = !DILocation(line: 171, column: 20, scope: !230)
!237 = !DILocalVariable(name: "inputBuffer", scope: !230, file: !33, line: 172, type: !17)
!238 = !DILocation(line: 172, column: 18, scope: !230)
!239 = !DILocation(line: 173, column: 13, scope: !230)
!240 = !DILocation(line: 183, column: 33, scope: !241)
!241 = distinct !DILexicalBlock(scope: !230, file: !33, line: 174, column: 13)
!242 = !DILocation(line: 183, column: 31, scope: !241)
!243 = !DILocation(line: 184, column: 21, scope: !244)
!244 = distinct !DILexicalBlock(scope: !241, file: !33, line: 184, column: 21)
!245 = !DILocation(line: 184, column: 35, scope: !244)
!246 = !DILocation(line: 184, column: 21, scope: !241)
!247 = !DILocation(line: 186, column: 21, scope: !248)
!248 = distinct !DILexicalBlock(scope: !244, file: !33, line: 185, column: 17)
!249 = !DILocation(line: 188, column: 17, scope: !241)
!250 = !DILocation(line: 189, column: 25, scope: !241)
!251 = !DILocation(line: 189, column: 36, scope: !241)
!252 = !DILocation(line: 190, column: 43, scope: !241)
!253 = !DILocation(line: 190, column: 25, scope: !241)
!254 = !DILocation(line: 190, column: 34, scope: !241)
!255 = !DILocation(line: 190, column: 41, scope: !241)
!256 = !DILocation(line: 191, column: 25, scope: !241)
!257 = !DILocation(line: 191, column: 34, scope: !241)
!258 = !DILocation(line: 192, column: 29, scope: !259)
!259 = distinct !DILexicalBlock(scope: !241, file: !33, line: 192, column: 21)
!260 = !DILocation(line: 192, column: 44, scope: !259)
!261 = !DILocation(line: 192, column: 21, scope: !259)
!262 = !DILocation(line: 192, column: 89, scope: !259)
!263 = !DILocation(line: 192, column: 21, scope: !241)
!264 = !DILocation(line: 194, column: 21, scope: !265)
!265 = distinct !DILexicalBlock(scope: !259, file: !33, line: 193, column: 17)
!266 = !DILocation(line: 198, column: 35, scope: !241)
!267 = !DILocation(line: 198, column: 50, scope: !241)
!268 = !DILocation(line: 198, column: 30, scope: !241)
!269 = !DILocation(line: 198, column: 28, scope: !241)
!270 = !DILocation(line: 199, column: 21, scope: !271)
!271 = distinct !DILexicalBlock(scope: !241, file: !33, line: 199, column: 21)
!272 = !DILocation(line: 199, column: 32, scope: !271)
!273 = !DILocation(line: 199, column: 48, scope: !271)
!274 = !DILocation(line: 199, column: 51, scope: !271)
!275 = !DILocation(line: 199, column: 62, scope: !271)
!276 = !DILocation(line: 199, column: 21, scope: !241)
!277 = !DILocation(line: 201, column: 21, scope: !278)
!278 = distinct !DILexicalBlock(scope: !271, file: !33, line: 200, column: 17)
!279 = !DILocation(line: 204, column: 29, scope: !241)
!280 = !DILocation(line: 204, column: 17, scope: !241)
!281 = !DILocation(line: 204, column: 41, scope: !241)
!282 = !DILocation(line: 206, column: 29, scope: !241)
!283 = !DILocation(line: 206, column: 24, scope: !241)
!284 = !DILocation(line: 206, column: 22, scope: !241)
!285 = !DILocation(line: 207, column: 13, scope: !241)
!286 = !DILocation(line: 209, column: 17, scope: !287)
!287 = distinct !DILexicalBlock(scope: !230, file: !33, line: 209, column: 17)
!288 = !DILocation(line: 209, column: 31, scope: !287)
!289 = !DILocation(line: 209, column: 17, scope: !230)
!290 = !DILocation(line: 211, column: 30, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !33, line: 210, column: 13)
!292 = !DILocation(line: 211, column: 17, scope: !291)
!293 = !DILocation(line: 212, column: 13, scope: !291)
!294 = !DILocation(line: 220, column: 5, scope: !231)
!295 = !DILocation(line: 221, column: 8, scope: !296)
!296 = distinct !DILexicalBlock(scope: !222, file: !33, line: 221, column: 8)
!297 = !DILocation(line: 221, column: 8, scope: !222)
!298 = !DILocation(line: 224, column: 9, scope: !299)
!299 = distinct !DILexicalBlock(scope: !296, file: !33, line: 222, column: 5)
!300 = !DILocation(line: 225, column: 5, scope: !299)
!301 = !DILocalVariable(name: "i", scope: !302, file: !33, line: 229, type: !22)
!302 = distinct !DILexicalBlock(scope: !303, file: !33, line: 228, column: 9)
!303 = distinct !DILexicalBlock(scope: !296, file: !33, line: 227, column: 5)
!304 = !DILocation(line: 229, column: 17, scope: !302)
!305 = !DILocalVariable(name: "buffer", scope: !302, file: !33, line: 230, type: !21)
!306 = !DILocation(line: 230, column: 19, scope: !302)
!307 = !DILocation(line: 230, column: 35, scope: !302)
!308 = !DILocation(line: 230, column: 28, scope: !302)
!309 = !DILocation(line: 231, column: 17, scope: !310)
!310 = distinct !DILexicalBlock(scope: !302, file: !33, line: 231, column: 17)
!311 = !DILocation(line: 231, column: 24, scope: !310)
!312 = !DILocation(line: 231, column: 17, scope: !302)
!313 = !DILocation(line: 231, column: 34, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !33, line: 231, column: 33)
!315 = !DILocation(line: 233, column: 20, scope: !316)
!316 = distinct !DILexicalBlock(scope: !302, file: !33, line: 233, column: 13)
!317 = !DILocation(line: 233, column: 18, scope: !316)
!318 = !DILocation(line: 233, column: 25, scope: !319)
!319 = distinct !DILexicalBlock(scope: !316, file: !33, line: 233, column: 13)
!320 = !DILocation(line: 233, column: 27, scope: !319)
!321 = !DILocation(line: 233, column: 13, scope: !316)
!322 = !DILocation(line: 235, column: 17, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !33, line: 234, column: 13)
!324 = !DILocation(line: 235, column: 24, scope: !323)
!325 = !DILocation(line: 235, column: 27, scope: !323)
!326 = !DILocation(line: 236, column: 13, scope: !323)
!327 = !DILocation(line: 233, column: 34, scope: !319)
!328 = !DILocation(line: 233, column: 13, scope: !319)
!329 = distinct !{!329, !321, !330, !161}
!330 = !DILocation(line: 236, column: 13, scope: !316)
!331 = !DILocation(line: 238, column: 17, scope: !332)
!332 = distinct !DILexicalBlock(scope: !302, file: !33, line: 238, column: 17)
!333 = !DILocation(line: 238, column: 22, scope: !332)
!334 = !DILocation(line: 238, column: 27, scope: !332)
!335 = !DILocation(line: 238, column: 30, scope: !332)
!336 = !DILocation(line: 238, column: 35, scope: !332)
!337 = !DILocation(line: 238, column: 17, scope: !302)
!338 = !DILocation(line: 240, column: 17, scope: !339)
!339 = distinct !DILexicalBlock(scope: !332, file: !33, line: 239, column: 13)
!340 = !DILocation(line: 240, column: 24, scope: !339)
!341 = !DILocation(line: 240, column: 30, scope: !339)
!342 = !DILocation(line: 242, column: 23, scope: !343)
!343 = distinct !DILexicalBlock(scope: !339, file: !33, line: 242, column: 17)
!344 = !DILocation(line: 242, column: 21, scope: !343)
!345 = !DILocation(line: 242, column: 28, scope: !346)
!346 = distinct !DILexicalBlock(scope: !343, file: !33, line: 242, column: 17)
!347 = !DILocation(line: 242, column: 30, scope: !346)
!348 = !DILocation(line: 242, column: 17, scope: !343)
!349 = !DILocation(line: 244, column: 34, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !33, line: 243, column: 17)
!351 = !DILocation(line: 244, column: 41, scope: !350)
!352 = !DILocation(line: 244, column: 21, scope: !350)
!353 = !DILocation(line: 245, column: 17, scope: !350)
!354 = !DILocation(line: 242, column: 37, scope: !346)
!355 = !DILocation(line: 242, column: 17, scope: !346)
!356 = distinct !{!356, !348, !357, !161}
!357 = !DILocation(line: 245, column: 17, scope: !343)
!358 = !DILocation(line: 246, column: 13, scope: !339)
!359 = !DILocation(line: 249, column: 17, scope: !360)
!360 = distinct !DILexicalBlock(scope: !332, file: !33, line: 248, column: 13)
!361 = !DILocation(line: 251, column: 18, scope: !302)
!362 = !DILocation(line: 251, column: 13, scope: !302)
!363 = !DILocation(line: 254, column: 1, scope: !222)
!364 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !33, file: !33, line: 50, type: !219, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!365 = !DILocation(line: 52, column: 5, scope: !364)
!366 = distinct !DISubprogram(name: "goodB2G2", scope: !33, file: !33, line: 257, type: !34, scopeLine: 258, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!367 = !DILocalVariable(name: "data", scope: !366, file: !33, line: 259, type: !22)
!368 = !DILocation(line: 259, column: 9, scope: !366)
!369 = !DILocation(line: 261, column: 10, scope: !366)
!370 = !DILocation(line: 262, column: 8, scope: !371)
!371 = distinct !DILexicalBlock(scope: !366, file: !33, line: 262, column: 8)
!372 = !DILocation(line: 262, column: 8, scope: !366)
!373 = !DILocalVariable(name: "recvResult", scope: !374, file: !33, line: 269, type: !22)
!374 = distinct !DILexicalBlock(scope: !375, file: !33, line: 264, column: 9)
!375 = distinct !DILexicalBlock(scope: !371, file: !33, line: 263, column: 5)
!376 = !DILocation(line: 269, column: 17, scope: !374)
!377 = !DILocalVariable(name: "service", scope: !374, file: !33, line: 270, type: !48)
!378 = !DILocation(line: 270, column: 32, scope: !374)
!379 = !DILocalVariable(name: "connectSocket", scope: !374, file: !33, line: 271, type: !22)
!380 = !DILocation(line: 271, column: 20, scope: !374)
!381 = !DILocalVariable(name: "inputBuffer", scope: !374, file: !33, line: 272, type: !17)
!382 = !DILocation(line: 272, column: 18, scope: !374)
!383 = !DILocation(line: 273, column: 13, scope: !374)
!384 = !DILocation(line: 283, column: 33, scope: !385)
!385 = distinct !DILexicalBlock(scope: !374, file: !33, line: 274, column: 13)
!386 = !DILocation(line: 283, column: 31, scope: !385)
!387 = !DILocation(line: 284, column: 21, scope: !388)
!388 = distinct !DILexicalBlock(scope: !385, file: !33, line: 284, column: 21)
!389 = !DILocation(line: 284, column: 35, scope: !388)
!390 = !DILocation(line: 284, column: 21, scope: !385)
!391 = !DILocation(line: 286, column: 21, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !33, line: 285, column: 17)
!393 = !DILocation(line: 288, column: 17, scope: !385)
!394 = !DILocation(line: 289, column: 25, scope: !385)
!395 = !DILocation(line: 289, column: 36, scope: !385)
!396 = !DILocation(line: 290, column: 43, scope: !385)
!397 = !DILocation(line: 290, column: 25, scope: !385)
!398 = !DILocation(line: 290, column: 34, scope: !385)
!399 = !DILocation(line: 290, column: 41, scope: !385)
!400 = !DILocation(line: 291, column: 25, scope: !385)
!401 = !DILocation(line: 291, column: 34, scope: !385)
!402 = !DILocation(line: 292, column: 29, scope: !403)
!403 = distinct !DILexicalBlock(scope: !385, file: !33, line: 292, column: 21)
!404 = !DILocation(line: 292, column: 44, scope: !403)
!405 = !DILocation(line: 292, column: 21, scope: !403)
!406 = !DILocation(line: 292, column: 89, scope: !403)
!407 = !DILocation(line: 292, column: 21, scope: !385)
!408 = !DILocation(line: 294, column: 21, scope: !409)
!409 = distinct !DILexicalBlock(scope: !403, file: !33, line: 293, column: 17)
!410 = !DILocation(line: 298, column: 35, scope: !385)
!411 = !DILocation(line: 298, column: 50, scope: !385)
!412 = !DILocation(line: 298, column: 30, scope: !385)
!413 = !DILocation(line: 298, column: 28, scope: !385)
!414 = !DILocation(line: 299, column: 21, scope: !415)
!415 = distinct !DILexicalBlock(scope: !385, file: !33, line: 299, column: 21)
!416 = !DILocation(line: 299, column: 32, scope: !415)
!417 = !DILocation(line: 299, column: 48, scope: !415)
!418 = !DILocation(line: 299, column: 51, scope: !415)
!419 = !DILocation(line: 299, column: 62, scope: !415)
!420 = !DILocation(line: 299, column: 21, scope: !385)
!421 = !DILocation(line: 301, column: 21, scope: !422)
!422 = distinct !DILexicalBlock(scope: !415, file: !33, line: 300, column: 17)
!423 = !DILocation(line: 304, column: 29, scope: !385)
!424 = !DILocation(line: 304, column: 17, scope: !385)
!425 = !DILocation(line: 304, column: 41, scope: !385)
!426 = !DILocation(line: 306, column: 29, scope: !385)
!427 = !DILocation(line: 306, column: 24, scope: !385)
!428 = !DILocation(line: 306, column: 22, scope: !385)
!429 = !DILocation(line: 307, column: 13, scope: !385)
!430 = !DILocation(line: 309, column: 17, scope: !431)
!431 = distinct !DILexicalBlock(scope: !374, file: !33, line: 309, column: 17)
!432 = !DILocation(line: 309, column: 31, scope: !431)
!433 = !DILocation(line: 309, column: 17, scope: !374)
!434 = !DILocation(line: 311, column: 30, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !33, line: 310, column: 13)
!436 = !DILocation(line: 311, column: 17, scope: !435)
!437 = !DILocation(line: 312, column: 13, scope: !435)
!438 = !DILocation(line: 320, column: 5, scope: !375)
!439 = !DILocation(line: 321, column: 8, scope: !440)
!440 = distinct !DILexicalBlock(scope: !366, file: !33, line: 321, column: 8)
!441 = !DILocation(line: 321, column: 8, scope: !366)
!442 = !DILocalVariable(name: "i", scope: !443, file: !33, line: 324, type: !22)
!443 = distinct !DILexicalBlock(scope: !444, file: !33, line: 323, column: 9)
!444 = distinct !DILexicalBlock(scope: !440, file: !33, line: 322, column: 5)
!445 = !DILocation(line: 324, column: 17, scope: !443)
!446 = !DILocalVariable(name: "buffer", scope: !443, file: !33, line: 325, type: !21)
!447 = !DILocation(line: 325, column: 19, scope: !443)
!448 = !DILocation(line: 325, column: 35, scope: !443)
!449 = !DILocation(line: 325, column: 28, scope: !443)
!450 = !DILocation(line: 326, column: 17, scope: !451)
!451 = distinct !DILexicalBlock(scope: !443, file: !33, line: 326, column: 17)
!452 = !DILocation(line: 326, column: 24, scope: !451)
!453 = !DILocation(line: 326, column: 17, scope: !443)
!454 = !DILocation(line: 326, column: 34, scope: !455)
!455 = distinct !DILexicalBlock(scope: !451, file: !33, line: 326, column: 33)
!456 = !DILocation(line: 328, column: 20, scope: !457)
!457 = distinct !DILexicalBlock(scope: !443, file: !33, line: 328, column: 13)
!458 = !DILocation(line: 328, column: 18, scope: !457)
!459 = !DILocation(line: 328, column: 25, scope: !460)
!460 = distinct !DILexicalBlock(scope: !457, file: !33, line: 328, column: 13)
!461 = !DILocation(line: 328, column: 27, scope: !460)
!462 = !DILocation(line: 328, column: 13, scope: !457)
!463 = !DILocation(line: 330, column: 17, scope: !464)
!464 = distinct !DILexicalBlock(scope: !460, file: !33, line: 329, column: 13)
!465 = !DILocation(line: 330, column: 24, scope: !464)
!466 = !DILocation(line: 330, column: 27, scope: !464)
!467 = !DILocation(line: 331, column: 13, scope: !464)
!468 = !DILocation(line: 328, column: 34, scope: !460)
!469 = !DILocation(line: 328, column: 13, scope: !460)
!470 = distinct !{!470, !462, !471, !161}
!471 = !DILocation(line: 331, column: 13, scope: !457)
!472 = !DILocation(line: 333, column: 17, scope: !473)
!473 = distinct !DILexicalBlock(scope: !443, file: !33, line: 333, column: 17)
!474 = !DILocation(line: 333, column: 22, scope: !473)
!475 = !DILocation(line: 333, column: 27, scope: !473)
!476 = !DILocation(line: 333, column: 30, scope: !473)
!477 = !DILocation(line: 333, column: 35, scope: !473)
!478 = !DILocation(line: 333, column: 17, scope: !443)
!479 = !DILocation(line: 335, column: 17, scope: !480)
!480 = distinct !DILexicalBlock(scope: !473, file: !33, line: 334, column: 13)
!481 = !DILocation(line: 335, column: 24, scope: !480)
!482 = !DILocation(line: 335, column: 30, scope: !480)
!483 = !DILocation(line: 337, column: 23, scope: !484)
!484 = distinct !DILexicalBlock(scope: !480, file: !33, line: 337, column: 17)
!485 = !DILocation(line: 337, column: 21, scope: !484)
!486 = !DILocation(line: 337, column: 28, scope: !487)
!487 = distinct !DILexicalBlock(scope: !484, file: !33, line: 337, column: 17)
!488 = !DILocation(line: 337, column: 30, scope: !487)
!489 = !DILocation(line: 337, column: 17, scope: !484)
!490 = !DILocation(line: 339, column: 34, scope: !491)
!491 = distinct !DILexicalBlock(scope: !487, file: !33, line: 338, column: 17)
!492 = !DILocation(line: 339, column: 41, scope: !491)
!493 = !DILocation(line: 339, column: 21, scope: !491)
!494 = !DILocation(line: 340, column: 17, scope: !491)
!495 = !DILocation(line: 337, column: 37, scope: !487)
!496 = !DILocation(line: 337, column: 17, scope: !487)
!497 = distinct !{!497, !489, !498, !161}
!498 = !DILocation(line: 340, column: 17, scope: !484)
!499 = !DILocation(line: 341, column: 13, scope: !480)
!500 = !DILocation(line: 344, column: 17, scope: !501)
!501 = distinct !DILexicalBlock(scope: !473, file: !33, line: 343, column: 13)
!502 = !DILocation(line: 346, column: 18, scope: !443)
!503 = !DILocation(line: 346, column: 13, scope: !443)
!504 = !DILocation(line: 348, column: 5, scope: !444)
!505 = !DILocation(line: 349, column: 1, scope: !366)
!506 = distinct !DISubprogram(name: "goodG2B1", scope: !33, file: !33, line: 352, type: !34, scopeLine: 353, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!507 = !DILocalVariable(name: "data", scope: !506, file: !33, line: 354, type: !22)
!508 = !DILocation(line: 354, column: 9, scope: !506)
!509 = !DILocation(line: 356, column: 10, scope: !506)
!510 = !DILocation(line: 357, column: 8, scope: !511)
!511 = distinct !DILexicalBlock(scope: !506, file: !33, line: 357, column: 8)
!512 = !DILocation(line: 357, column: 8, scope: !506)
!513 = !DILocation(line: 360, column: 9, scope: !514)
!514 = distinct !DILexicalBlock(scope: !511, file: !33, line: 358, column: 5)
!515 = !DILocation(line: 361, column: 5, scope: !514)
!516 = !DILocation(line: 366, column: 14, scope: !517)
!517 = distinct !DILexicalBlock(scope: !511, file: !33, line: 363, column: 5)
!518 = !DILocation(line: 368, column: 8, scope: !519)
!519 = distinct !DILexicalBlock(scope: !506, file: !33, line: 368, column: 8)
!520 = !DILocation(line: 368, column: 8, scope: !506)
!521 = !DILocalVariable(name: "i", scope: !522, file: !33, line: 371, type: !22)
!522 = distinct !DILexicalBlock(scope: !523, file: !33, line: 370, column: 9)
!523 = distinct !DILexicalBlock(scope: !519, file: !33, line: 369, column: 5)
!524 = !DILocation(line: 371, column: 17, scope: !522)
!525 = !DILocalVariable(name: "buffer", scope: !522, file: !33, line: 372, type: !21)
!526 = !DILocation(line: 372, column: 19, scope: !522)
!527 = !DILocation(line: 372, column: 35, scope: !522)
!528 = !DILocation(line: 372, column: 28, scope: !522)
!529 = !DILocation(line: 373, column: 17, scope: !530)
!530 = distinct !DILexicalBlock(scope: !522, file: !33, line: 373, column: 17)
!531 = !DILocation(line: 373, column: 24, scope: !530)
!532 = !DILocation(line: 373, column: 17, scope: !522)
!533 = !DILocation(line: 373, column: 34, scope: !534)
!534 = distinct !DILexicalBlock(scope: !530, file: !33, line: 373, column: 33)
!535 = !DILocation(line: 375, column: 20, scope: !536)
!536 = distinct !DILexicalBlock(scope: !522, file: !33, line: 375, column: 13)
!537 = !DILocation(line: 375, column: 18, scope: !536)
!538 = !DILocation(line: 375, column: 25, scope: !539)
!539 = distinct !DILexicalBlock(scope: !536, file: !33, line: 375, column: 13)
!540 = !DILocation(line: 375, column: 27, scope: !539)
!541 = !DILocation(line: 375, column: 13, scope: !536)
!542 = !DILocation(line: 377, column: 17, scope: !543)
!543 = distinct !DILexicalBlock(scope: !539, file: !33, line: 376, column: 13)
!544 = !DILocation(line: 377, column: 24, scope: !543)
!545 = !DILocation(line: 377, column: 27, scope: !543)
!546 = !DILocation(line: 378, column: 13, scope: !543)
!547 = !DILocation(line: 375, column: 34, scope: !539)
!548 = !DILocation(line: 375, column: 13, scope: !539)
!549 = distinct !{!549, !541, !550, !161}
!550 = !DILocation(line: 378, column: 13, scope: !536)
!551 = !DILocation(line: 381, column: 17, scope: !552)
!552 = distinct !DILexicalBlock(scope: !522, file: !33, line: 381, column: 17)
!553 = !DILocation(line: 381, column: 22, scope: !552)
!554 = !DILocation(line: 381, column: 17, scope: !522)
!555 = !DILocation(line: 383, column: 17, scope: !556)
!556 = distinct !DILexicalBlock(scope: !552, file: !33, line: 382, column: 13)
!557 = !DILocation(line: 383, column: 24, scope: !556)
!558 = !DILocation(line: 383, column: 30, scope: !556)
!559 = !DILocation(line: 385, column: 23, scope: !560)
!560 = distinct !DILexicalBlock(scope: !556, file: !33, line: 385, column: 17)
!561 = !DILocation(line: 385, column: 21, scope: !560)
!562 = !DILocation(line: 385, column: 28, scope: !563)
!563 = distinct !DILexicalBlock(scope: !560, file: !33, line: 385, column: 17)
!564 = !DILocation(line: 385, column: 30, scope: !563)
!565 = !DILocation(line: 385, column: 17, scope: !560)
!566 = !DILocation(line: 387, column: 34, scope: !567)
!567 = distinct !DILexicalBlock(scope: !563, file: !33, line: 386, column: 17)
!568 = !DILocation(line: 387, column: 41, scope: !567)
!569 = !DILocation(line: 387, column: 21, scope: !567)
!570 = !DILocation(line: 388, column: 17, scope: !567)
!571 = !DILocation(line: 385, column: 37, scope: !563)
!572 = !DILocation(line: 385, column: 17, scope: !563)
!573 = distinct !{!573, !565, !574, !161}
!574 = !DILocation(line: 388, column: 17, scope: !560)
!575 = !DILocation(line: 389, column: 13, scope: !556)
!576 = !DILocation(line: 392, column: 17, scope: !577)
!577 = distinct !DILexicalBlock(scope: !552, file: !33, line: 391, column: 13)
!578 = !DILocation(line: 394, column: 18, scope: !522)
!579 = !DILocation(line: 394, column: 13, scope: !522)
!580 = !DILocation(line: 396, column: 5, scope: !523)
!581 = !DILocation(line: 397, column: 1, scope: !506)
!582 = distinct !DISubprogram(name: "goodG2B2", scope: !33, file: !33, line: 400, type: !34, scopeLine: 401, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !36)
!583 = !DILocalVariable(name: "data", scope: !582, file: !33, line: 402, type: !22)
!584 = !DILocation(line: 402, column: 9, scope: !582)
!585 = !DILocation(line: 404, column: 10, scope: !582)
!586 = !DILocation(line: 405, column: 8, scope: !587)
!587 = distinct !DILexicalBlock(scope: !582, file: !33, line: 405, column: 8)
!588 = !DILocation(line: 405, column: 8, scope: !582)
!589 = !DILocation(line: 409, column: 14, scope: !590)
!590 = distinct !DILexicalBlock(scope: !587, file: !33, line: 406, column: 5)
!591 = !DILocation(line: 410, column: 5, scope: !590)
!592 = !DILocation(line: 411, column: 8, scope: !593)
!593 = distinct !DILexicalBlock(scope: !582, file: !33, line: 411, column: 8)
!594 = !DILocation(line: 411, column: 8, scope: !582)
!595 = !DILocalVariable(name: "i", scope: !596, file: !33, line: 414, type: !22)
!596 = distinct !DILexicalBlock(scope: !597, file: !33, line: 413, column: 9)
!597 = distinct !DILexicalBlock(scope: !593, file: !33, line: 412, column: 5)
!598 = !DILocation(line: 414, column: 17, scope: !596)
!599 = !DILocalVariable(name: "buffer", scope: !596, file: !33, line: 415, type: !21)
!600 = !DILocation(line: 415, column: 19, scope: !596)
!601 = !DILocation(line: 415, column: 35, scope: !596)
!602 = !DILocation(line: 415, column: 28, scope: !596)
!603 = !DILocation(line: 416, column: 17, scope: !604)
!604 = distinct !DILexicalBlock(scope: !596, file: !33, line: 416, column: 17)
!605 = !DILocation(line: 416, column: 24, scope: !604)
!606 = !DILocation(line: 416, column: 17, scope: !596)
!607 = !DILocation(line: 416, column: 34, scope: !608)
!608 = distinct !DILexicalBlock(scope: !604, file: !33, line: 416, column: 33)
!609 = !DILocation(line: 418, column: 20, scope: !610)
!610 = distinct !DILexicalBlock(scope: !596, file: !33, line: 418, column: 13)
!611 = !DILocation(line: 418, column: 18, scope: !610)
!612 = !DILocation(line: 418, column: 25, scope: !613)
!613 = distinct !DILexicalBlock(scope: !610, file: !33, line: 418, column: 13)
!614 = !DILocation(line: 418, column: 27, scope: !613)
!615 = !DILocation(line: 418, column: 13, scope: !610)
!616 = !DILocation(line: 420, column: 17, scope: !617)
!617 = distinct !DILexicalBlock(scope: !613, file: !33, line: 419, column: 13)
!618 = !DILocation(line: 420, column: 24, scope: !617)
!619 = !DILocation(line: 420, column: 27, scope: !617)
!620 = !DILocation(line: 421, column: 13, scope: !617)
!621 = !DILocation(line: 418, column: 34, scope: !613)
!622 = !DILocation(line: 418, column: 13, scope: !613)
!623 = distinct !{!623, !615, !624, !161}
!624 = !DILocation(line: 421, column: 13, scope: !610)
!625 = !DILocation(line: 424, column: 17, scope: !626)
!626 = distinct !DILexicalBlock(scope: !596, file: !33, line: 424, column: 17)
!627 = !DILocation(line: 424, column: 22, scope: !626)
!628 = !DILocation(line: 424, column: 17, scope: !596)
!629 = !DILocation(line: 426, column: 17, scope: !630)
!630 = distinct !DILexicalBlock(scope: !626, file: !33, line: 425, column: 13)
!631 = !DILocation(line: 426, column: 24, scope: !630)
!632 = !DILocation(line: 426, column: 30, scope: !630)
!633 = !DILocation(line: 428, column: 23, scope: !634)
!634 = distinct !DILexicalBlock(scope: !630, file: !33, line: 428, column: 17)
!635 = !DILocation(line: 428, column: 21, scope: !634)
!636 = !DILocation(line: 428, column: 28, scope: !637)
!637 = distinct !DILexicalBlock(scope: !634, file: !33, line: 428, column: 17)
!638 = !DILocation(line: 428, column: 30, scope: !637)
!639 = !DILocation(line: 428, column: 17, scope: !634)
!640 = !DILocation(line: 430, column: 34, scope: !641)
!641 = distinct !DILexicalBlock(scope: !637, file: !33, line: 429, column: 17)
!642 = !DILocation(line: 430, column: 41, scope: !641)
!643 = !DILocation(line: 430, column: 21, scope: !641)
!644 = !DILocation(line: 431, column: 17, scope: !641)
!645 = !DILocation(line: 428, column: 37, scope: !637)
!646 = !DILocation(line: 428, column: 17, scope: !637)
!647 = distinct !{!647, !639, !648, !161}
!648 = !DILocation(line: 431, column: 17, scope: !634)
!649 = !DILocation(line: 432, column: 13, scope: !630)
!650 = !DILocation(line: 435, column: 17, scope: !651)
!651 = distinct !DILexicalBlock(scope: !626, file: !33, line: 434, column: 13)
!652 = !DILocation(line: 437, column: 18, scope: !596)
!653 = !DILocation(line: 437, column: 13, scope: !596)
!654 = !DILocation(line: 439, column: 5, scope: !597)
!655 = !DILocation(line: 440, column: 1, scope: !582)
