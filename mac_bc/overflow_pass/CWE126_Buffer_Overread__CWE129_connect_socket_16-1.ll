; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_16-1.c"
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
@.str.6 = private unnamed_addr constant [36 x i8] c"ERROR: Array index is out-of-bounds\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__CWE129_connect_socket_16_bad() #0 !dbg !29 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !34, metadata !DIExpression()), !dbg !36
  store i32 -1, i32* %data, align 4, !dbg !37
  br label %while.body, !dbg !38

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !39, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !43, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !64, metadata !DIExpression()), !dbg !65
  store i32 -1, i32* %connectSocket, align 4, !dbg !65
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !66, metadata !DIExpression()), !dbg !67
  br label %do.body, !dbg !68

do.body:                                          ; preds = %while.body
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !69
  store i32 %call, i32* %connectSocket, align 4, !dbg !71
  %0 = load i32, i32* %connectSocket, align 4, !dbg !72
  %cmp = icmp eq i32 %0, -1, !dbg !74
  br i1 %cmp, label %if.then, label %if.end, !dbg !75

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !76

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !78
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !79
  store i8 2, i8* %sin_family, align 1, !dbg !80
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !81
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !82
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !83
  store i32 %call1, i32* %s_addr, align 4, !dbg !84
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !85
  store i16 -30871, i16* %sin_port, align 2, !dbg !86
  %2 = load i32, i32* %connectSocket, align 4, !dbg !87
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !89
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !90
  %cmp3 = icmp eq i32 %call2, -1, !dbg !91
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !92

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !93

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !95
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !96
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !97
  %conv = trunc i64 %call6 to i32, !dbg !97
  store i32 %conv, i32* %recvResult, align 4, !dbg !98
  %5 = load i32, i32* %recvResult, align 4, !dbg !99
  %cmp7 = icmp eq i32 %5, -1, !dbg !101
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !102

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !103
  %cmp9 = icmp eq i32 %6, 0, !dbg !104
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !105

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !106

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !108
  %idxprom = sext i32 %7 to i64, !dbg !109
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !111
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !112
  store i32 %call14, i32* %data, align 4, !dbg !113
  br label %do.end, !dbg !114

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !115
  %cmp15 = icmp ne i32 %8, -1, !dbg !117
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !118

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !119
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !121
  br label %if.end19, !dbg !122

if.end19:                                         ; preds = %if.then17, %do.end
  br label %while.end, !dbg !123

while.end:                                        ; preds = %if.end19
  br label %while.body20, !dbg !124

while.body20:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !125, metadata !DIExpression()), !dbg !131
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !131
  %11 = load i32, i32* %data, align 4, !dbg !132
  %cmp21 = icmp sge i32 %11, 0, !dbg !134
  br i1 %cmp21, label %if.then23, label %if.else, !dbg !135

if.then23:                                        ; preds = %while.body20
  %12 = load i32, i32* %data, align 4, !dbg !136
  %idxprom24 = sext i32 %12 to i64, !dbg !138
  %arrayidx25 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom24, !dbg !138
  %13 = load i32, i32* %arrayidx25, align 4, !dbg !138
  call void @printIntLine(i32 noundef %13), !dbg !139
  br label %if.end26, !dbg !140

if.else:                                          ; preds = %while.body20
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !141
  br label %if.end26

if.end26:                                         ; preds = %if.else, %if.then23
  br label %while.end27, !dbg !143

while.end27:                                      ; preds = %if.end26
  ret void, !dbg !144
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
define void @CWE126_Buffer_Overread__CWE129_connect_socket_16_good() #0 !dbg !145 {
entry:
  call void @goodB2G(), !dbg !146
  call void @goodG2B(), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !149 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !154, metadata !DIExpression()), !dbg !155
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !156, metadata !DIExpression()), !dbg !157
  %call = call i64 @time(i64* noundef null), !dbg !158
  %conv = trunc i64 %call to i32, !dbg !159
  call void @srand(i32 noundef %conv), !dbg !160
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0)), !dbg !161
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_16_good(), !dbg !162
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0)), !dbg !163
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0)), !dbg !164
  call void @CWE126_Buffer_Overread__CWE129_connect_socket_16_bad(), !dbg !165
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0)), !dbg !166
  ret i32 0, !dbg !167
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodB2G() #0 !dbg !168 {
entry:
  %data = alloca i32, align 4
  %recvResult = alloca i32, align 4
  %service = alloca %struct.sockaddr_in, align 4
  %connectSocket = alloca i32, align 4
  %inputBuffer = alloca [14 x i8], align 1
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !169, metadata !DIExpression()), !dbg !170
  store i32 -1, i32* %data, align 4, !dbg !171
  br label %while.body, !dbg !172

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %recvResult, metadata !173, metadata !DIExpression()), !dbg !176
  call void @llvm.dbg.declare(metadata %struct.sockaddr_in* %service, metadata !177, metadata !DIExpression()), !dbg !178
  call void @llvm.dbg.declare(metadata i32* %connectSocket, metadata !179, metadata !DIExpression()), !dbg !180
  store i32 -1, i32* %connectSocket, align 4, !dbg !180
  call void @llvm.dbg.declare(metadata [14 x i8]* %inputBuffer, metadata !181, metadata !DIExpression()), !dbg !182
  br label %do.body, !dbg !183

do.body:                                          ; preds = %while.body
  %call = call i32 @socket(i32 noundef 2, i32 noundef 1, i32 noundef 6), !dbg !184
  store i32 %call, i32* %connectSocket, align 4, !dbg !186
  %0 = load i32, i32* %connectSocket, align 4, !dbg !187
  %cmp = icmp eq i32 %0, -1, !dbg !189
  br i1 %cmp, label %if.then, label %if.end, !dbg !190

if.then:                                          ; preds = %do.body
  br label %do.end, !dbg !191

if.end:                                           ; preds = %do.body
  %1 = bitcast %struct.sockaddr_in* %service to i8*, !dbg !193
  call void @llvm.memset.p0i8.i64(i8* align 4 %1, i8 0, i64 16, i1 false), !dbg !193
  %sin_family = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 1, !dbg !194
  store i8 2, i8* %sin_family, align 1, !dbg !195
  %call1 = call i32 @inet_addr(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0)), !dbg !196
  %sin_addr = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 3, !dbg !197
  %s_addr = getelementptr inbounds %struct.in_addr, %struct.in_addr* %sin_addr, i32 0, i32 0, !dbg !198
  store i32 %call1, i32* %s_addr, align 4, !dbg !199
  %sin_port = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %service, i32 0, i32 2, !dbg !200
  store i16 -30871, i16* %sin_port, align 2, !dbg !201
  %2 = load i32, i32* %connectSocket, align 4, !dbg !202
  %3 = bitcast %struct.sockaddr_in* %service to %struct.sockaddr*, !dbg !204
  %call2 = call i32 @"\01_connect"(i32 noundef %2, %struct.sockaddr* noundef %3, i32 noundef 16), !dbg !205
  %cmp3 = icmp eq i32 %call2, -1, !dbg !206
  br i1 %cmp3, label %if.then4, label %if.end5, !dbg !207

if.then4:                                         ; preds = %if.end
  br label %do.end, !dbg !208

if.end5:                                          ; preds = %if.end
  %4 = load i32, i32* %connectSocket, align 4, !dbg !210
  %arraydecay = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !211
  %call6 = call i64 @"\01_recv"(i32 noundef %4, i8* noundef %arraydecay, i64 noundef 13, i32 noundef 0), !dbg !212
  %conv = trunc i64 %call6 to i32, !dbg !212
  store i32 %conv, i32* %recvResult, align 4, !dbg !213
  %5 = load i32, i32* %recvResult, align 4, !dbg !214
  %cmp7 = icmp eq i32 %5, -1, !dbg !216
  br i1 %cmp7, label %if.then11, label %lor.lhs.false, !dbg !217

lor.lhs.false:                                    ; preds = %if.end5
  %6 = load i32, i32* %recvResult, align 4, !dbg !218
  %cmp9 = icmp eq i32 %6, 0, !dbg !219
  br i1 %cmp9, label %if.then11, label %if.end12, !dbg !220

if.then11:                                        ; preds = %lor.lhs.false, %if.end5
  br label %do.end, !dbg !221

if.end12:                                         ; preds = %lor.lhs.false
  %7 = load i32, i32* %recvResult, align 4, !dbg !223
  %idxprom = sext i32 %7 to i64, !dbg !224
  %arrayidx = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 %idxprom, !dbg !224
  store i8 0, i8* %arrayidx, align 1, !dbg !225
  %arraydecay13 = getelementptr inbounds [14 x i8], [14 x i8]* %inputBuffer, i64 0, i64 0, !dbg !226
  %call14 = call i32 @atoi(i8* noundef %arraydecay13), !dbg !227
  store i32 %call14, i32* %data, align 4, !dbg !228
  br label %do.end, !dbg !229

do.end:                                           ; preds = %if.end12, %if.then11, %if.then4, %if.then
  %8 = load i32, i32* %connectSocket, align 4, !dbg !230
  %cmp15 = icmp ne i32 %8, -1, !dbg !232
  br i1 %cmp15, label %if.then17, label %if.end19, !dbg !233

if.then17:                                        ; preds = %do.end
  %9 = load i32, i32* %connectSocket, align 4, !dbg !234
  %call18 = call i32 @"\01_close"(i32 noundef %9), !dbg !236
  br label %if.end19, !dbg !237

if.end19:                                         ; preds = %if.then17, %do.end
  br label %while.end, !dbg !238

while.end:                                        ; preds = %if.end19
  br label %while.body20, !dbg !239

while.body20:                                     ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !240, metadata !DIExpression()), !dbg !243
  %10 = bitcast [10 x i32]* %buffer to i8*, !dbg !243
  call void @llvm.memset.p0i8.i64(i8* align 16 %10, i8 0, i64 40, i1 false), !dbg !243
  %11 = load i32, i32* %data, align 4, !dbg !244
  %cmp21 = icmp sge i32 %11, 0, !dbg !246
  br i1 %cmp21, label %land.lhs.true, label %if.else, !dbg !247

land.lhs.true:                                    ; preds = %while.body20
  %12 = load i32, i32* %data, align 4, !dbg !248
  %cmp23 = icmp slt i32 %12, 10, !dbg !249
  br i1 %cmp23, label %if.then25, label %if.else, !dbg !250

if.then25:                                        ; preds = %land.lhs.true
  %13 = load i32, i32* %data, align 4, !dbg !251
  %idxprom26 = sext i32 %13 to i64, !dbg !253
  %arrayidx27 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom26, !dbg !253
  %14 = load i32, i32* %arrayidx27, align 4, !dbg !253
  call void @printIntLine(i32 noundef %14), !dbg !254
  br label %if.end28, !dbg !255

if.else:                                          ; preds = %land.lhs.true, %while.body20
  call void @printLine(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.6, i64 0, i64 0)), !dbg !256
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  br label %while.end29, !dbg !258

while.end29:                                      ; preds = %if.end28
  ret void, !dbg !259
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !260 {
entry:
  %data = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %data, metadata !261, metadata !DIExpression()), !dbg !262
  store i32 -1, i32* %data, align 4, !dbg !263
  br label %while.body, !dbg !264

while.body:                                       ; preds = %entry
  store i32 7, i32* %data, align 4, !dbg !265
  br label %while.end, !dbg !267

while.end:                                        ; preds = %while.body
  br label %while.body1, !dbg !268

while.body1:                                      ; preds = %while.end
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !269, metadata !DIExpression()), !dbg !272
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !272
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !272
  %1 = load i32, i32* %data, align 4, !dbg !273
  %cmp = icmp sge i32 %1, 0, !dbg !275
  br i1 %cmp, label %if.then, label %if.else, !dbg !276

if.then:                                          ; preds = %while.body1
  %2 = load i32, i32* %data, align 4, !dbg !277
  %idxprom = sext i32 %2 to i64, !dbg !279
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !279
  %3 = load i32, i32* %arrayidx, align 4, !dbg !279
  call void @printIntLine(i32 noundef %3), !dbg !280
  br label %if.end, !dbg !281

if.else:                                          ; preds = %while.body1
  call void @printLine(i8* noundef getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)), !dbg !282
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.end2, !dbg !284

while.end2:                                       ; preds = %if.end
  ret void, !dbg !285
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!29 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_16_bad", scope: !30, file: !30, line: 44, type: !31, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!30 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__CWE129_connect_socket_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !{}
!34 = !DILocalVariable(name: "data", scope: !29, file: !30, line: 46, type: !35)
!35 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!36 = !DILocation(line: 46, column: 9, scope: !29)
!37 = !DILocation(line: 48, column: 10, scope: !29)
!38 = !DILocation(line: 49, column: 5, scope: !29)
!39 = !DILocalVariable(name: "recvResult", scope: !40, file: !30, line: 56, type: !35)
!40 = distinct !DILexicalBlock(scope: !41, file: !30, line: 51, column: 9)
!41 = distinct !DILexicalBlock(scope: !29, file: !30, line: 50, column: 5)
!42 = !DILocation(line: 56, column: 17, scope: !40)
!43 = !DILocalVariable(name: "service", scope: !40, file: !30, line: 57, type: !44)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sockaddr_in", file: !45, line: 375, size: 128, elements: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/netinet/in.h", directory: "")
!46 = !{!47, !48, !49, !52, !59}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "sin_len", scope: !44, file: !45, line: 376, baseType: !11, size: 8)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "sin_family", scope: !44, file: !45, line: 377, baseType: !14, size: 8, offset: 8)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "sin_port", scope: !44, file: !45, line: 378, baseType: !50, size: 16, offset: 16)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_port_t", file: !51, line: 31, baseType: !3)
!51 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_port_t.h", directory: "")
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sin_addr", scope: !44, file: !45, line: 379, baseType: !53, size: 32, offset: 32)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in_addr", file: !45, line: 301, size: 32, elements: !54)
!54 = !{!55}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "s_addr", scope: !53, file: !45, line: 302, baseType: !56, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "in_addr_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_in_addr_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !4, line: 47, baseType: !21)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "sin_zero", scope: !44, file: !45, line: 380, baseType: !60, size: 64, offset: 64)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 8)
!63 = !DILocation(line: 57, column: 32, scope: !40)
!64 = !DILocalVariable(name: "connectSocket", scope: !40, file: !30, line: 58, type: !35)
!65 = !DILocation(line: 58, column: 20, scope: !40)
!66 = !DILocalVariable(name: "inputBuffer", scope: !40, file: !30, line: 59, type: !17)
!67 = !DILocation(line: 59, column: 18, scope: !40)
!68 = !DILocation(line: 60, column: 13, scope: !40)
!69 = !DILocation(line: 70, column: 33, scope: !70)
!70 = distinct !DILexicalBlock(scope: !40, file: !30, line: 61, column: 13)
!71 = !DILocation(line: 70, column: 31, scope: !70)
!72 = !DILocation(line: 71, column: 21, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !30, line: 71, column: 21)
!74 = !DILocation(line: 71, column: 35, scope: !73)
!75 = !DILocation(line: 71, column: 21, scope: !70)
!76 = !DILocation(line: 73, column: 21, scope: !77)
!77 = distinct !DILexicalBlock(scope: !73, file: !30, line: 72, column: 17)
!78 = !DILocation(line: 75, column: 17, scope: !70)
!79 = !DILocation(line: 76, column: 25, scope: !70)
!80 = !DILocation(line: 76, column: 36, scope: !70)
!81 = !DILocation(line: 77, column: 43, scope: !70)
!82 = !DILocation(line: 77, column: 25, scope: !70)
!83 = !DILocation(line: 77, column: 34, scope: !70)
!84 = !DILocation(line: 77, column: 41, scope: !70)
!85 = !DILocation(line: 78, column: 25, scope: !70)
!86 = !DILocation(line: 78, column: 34, scope: !70)
!87 = !DILocation(line: 79, column: 29, scope: !88)
!88 = distinct !DILexicalBlock(scope: !70, file: !30, line: 79, column: 21)
!89 = !DILocation(line: 79, column: 44, scope: !88)
!90 = !DILocation(line: 79, column: 21, scope: !88)
!91 = !DILocation(line: 79, column: 89, scope: !88)
!92 = !DILocation(line: 79, column: 21, scope: !70)
!93 = !DILocation(line: 81, column: 21, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !30, line: 80, column: 17)
!95 = !DILocation(line: 85, column: 35, scope: !70)
!96 = !DILocation(line: 85, column: 50, scope: !70)
!97 = !DILocation(line: 85, column: 30, scope: !70)
!98 = !DILocation(line: 85, column: 28, scope: !70)
!99 = !DILocation(line: 86, column: 21, scope: !100)
!100 = distinct !DILexicalBlock(scope: !70, file: !30, line: 86, column: 21)
!101 = !DILocation(line: 86, column: 32, scope: !100)
!102 = !DILocation(line: 86, column: 48, scope: !100)
!103 = !DILocation(line: 86, column: 51, scope: !100)
!104 = !DILocation(line: 86, column: 62, scope: !100)
!105 = !DILocation(line: 86, column: 21, scope: !70)
!106 = !DILocation(line: 88, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !100, file: !30, line: 87, column: 17)
!108 = !DILocation(line: 91, column: 29, scope: !70)
!109 = !DILocation(line: 91, column: 17, scope: !70)
!110 = !DILocation(line: 91, column: 41, scope: !70)
!111 = !DILocation(line: 93, column: 29, scope: !70)
!112 = !DILocation(line: 93, column: 24, scope: !70)
!113 = !DILocation(line: 93, column: 22, scope: !70)
!114 = !DILocation(line: 94, column: 13, scope: !70)
!115 = !DILocation(line: 96, column: 17, scope: !116)
!116 = distinct !DILexicalBlock(scope: !40, file: !30, line: 96, column: 17)
!117 = !DILocation(line: 96, column: 31, scope: !116)
!118 = !DILocation(line: 96, column: 17, scope: !40)
!119 = !DILocation(line: 98, column: 30, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !30, line: 97, column: 13)
!121 = !DILocation(line: 98, column: 17, scope: !120)
!122 = !DILocation(line: 99, column: 13, scope: !120)
!123 = !DILocation(line: 107, column: 9, scope: !41)
!124 = !DILocation(line: 109, column: 5, scope: !29)
!125 = !DILocalVariable(name: "buffer", scope: !126, file: !30, line: 112, type: !128)
!126 = distinct !DILexicalBlock(scope: !127, file: !30, line: 111, column: 9)
!127 = distinct !DILexicalBlock(scope: !29, file: !30, line: 110, column: 5)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 320, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 10)
!131 = !DILocation(line: 112, column: 17, scope: !126)
!132 = !DILocation(line: 115, column: 17, scope: !133)
!133 = distinct !DILexicalBlock(scope: !126, file: !30, line: 115, column: 17)
!134 = !DILocation(line: 115, column: 22, scope: !133)
!135 = !DILocation(line: 115, column: 17, scope: !126)
!136 = !DILocation(line: 117, column: 37, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !30, line: 116, column: 13)
!138 = !DILocation(line: 117, column: 30, scope: !137)
!139 = !DILocation(line: 117, column: 17, scope: !137)
!140 = !DILocation(line: 118, column: 13, scope: !137)
!141 = !DILocation(line: 121, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !133, file: !30, line: 120, column: 13)
!143 = !DILocation(line: 124, column: 9, scope: !127)
!144 = !DILocation(line: 126, column: 1, scope: !29)
!145 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__CWE129_connect_socket_16_good", scope: !30, file: !30, line: 248, type: !31, scopeLine: 249, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!146 = !DILocation(line: 250, column: 5, scope: !145)
!147 = !DILocation(line: 251, column: 5, scope: !145)
!148 = !DILocation(line: 252, column: 1, scope: !145)
!149 = distinct !DISubprogram(name: "main", scope: !30, file: !30, line: 263, type: !150, scopeLine: 264, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !33)
!150 = !DISubroutineType(types: !151)
!151 = !{!35, !35, !152}
!152 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !153, size: 64)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!154 = !DILocalVariable(name: "argc", arg: 1, scope: !149, file: !30, line: 263, type: !35)
!155 = !DILocation(line: 263, column: 14, scope: !149)
!156 = !DILocalVariable(name: "argv", arg: 2, scope: !149, file: !30, line: 263, type: !152)
!157 = !DILocation(line: 263, column: 27, scope: !149)
!158 = !DILocation(line: 266, column: 22, scope: !149)
!159 = !DILocation(line: 266, column: 12, scope: !149)
!160 = !DILocation(line: 266, column: 5, scope: !149)
!161 = !DILocation(line: 268, column: 5, scope: !149)
!162 = !DILocation(line: 269, column: 5, scope: !149)
!163 = !DILocation(line: 270, column: 5, scope: !149)
!164 = !DILocation(line: 273, column: 5, scope: !149)
!165 = !DILocation(line: 274, column: 5, scope: !149)
!166 = !DILocation(line: 275, column: 5, scope: !149)
!167 = !DILocation(line: 277, column: 5, scope: !149)
!168 = distinct !DISubprogram(name: "goodB2G", scope: !30, file: !30, line: 133, type: !31, scopeLine: 134, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!169 = !DILocalVariable(name: "data", scope: !168, file: !30, line: 135, type: !35)
!170 = !DILocation(line: 135, column: 9, scope: !168)
!171 = !DILocation(line: 137, column: 10, scope: !168)
!172 = !DILocation(line: 138, column: 5, scope: !168)
!173 = !DILocalVariable(name: "recvResult", scope: !174, file: !30, line: 145, type: !35)
!174 = distinct !DILexicalBlock(scope: !175, file: !30, line: 140, column: 9)
!175 = distinct !DILexicalBlock(scope: !168, file: !30, line: 139, column: 5)
!176 = !DILocation(line: 145, column: 17, scope: !174)
!177 = !DILocalVariable(name: "service", scope: !174, file: !30, line: 146, type: !44)
!178 = !DILocation(line: 146, column: 32, scope: !174)
!179 = !DILocalVariable(name: "connectSocket", scope: !174, file: !30, line: 147, type: !35)
!180 = !DILocation(line: 147, column: 20, scope: !174)
!181 = !DILocalVariable(name: "inputBuffer", scope: !174, file: !30, line: 148, type: !17)
!182 = !DILocation(line: 148, column: 18, scope: !174)
!183 = !DILocation(line: 149, column: 13, scope: !174)
!184 = !DILocation(line: 159, column: 33, scope: !185)
!185 = distinct !DILexicalBlock(scope: !174, file: !30, line: 150, column: 13)
!186 = !DILocation(line: 159, column: 31, scope: !185)
!187 = !DILocation(line: 160, column: 21, scope: !188)
!188 = distinct !DILexicalBlock(scope: !185, file: !30, line: 160, column: 21)
!189 = !DILocation(line: 160, column: 35, scope: !188)
!190 = !DILocation(line: 160, column: 21, scope: !185)
!191 = !DILocation(line: 162, column: 21, scope: !192)
!192 = distinct !DILexicalBlock(scope: !188, file: !30, line: 161, column: 17)
!193 = !DILocation(line: 164, column: 17, scope: !185)
!194 = !DILocation(line: 165, column: 25, scope: !185)
!195 = !DILocation(line: 165, column: 36, scope: !185)
!196 = !DILocation(line: 166, column: 43, scope: !185)
!197 = !DILocation(line: 166, column: 25, scope: !185)
!198 = !DILocation(line: 166, column: 34, scope: !185)
!199 = !DILocation(line: 166, column: 41, scope: !185)
!200 = !DILocation(line: 167, column: 25, scope: !185)
!201 = !DILocation(line: 167, column: 34, scope: !185)
!202 = !DILocation(line: 168, column: 29, scope: !203)
!203 = distinct !DILexicalBlock(scope: !185, file: !30, line: 168, column: 21)
!204 = !DILocation(line: 168, column: 44, scope: !203)
!205 = !DILocation(line: 168, column: 21, scope: !203)
!206 = !DILocation(line: 168, column: 89, scope: !203)
!207 = !DILocation(line: 168, column: 21, scope: !185)
!208 = !DILocation(line: 170, column: 21, scope: !209)
!209 = distinct !DILexicalBlock(scope: !203, file: !30, line: 169, column: 17)
!210 = !DILocation(line: 174, column: 35, scope: !185)
!211 = !DILocation(line: 174, column: 50, scope: !185)
!212 = !DILocation(line: 174, column: 30, scope: !185)
!213 = !DILocation(line: 174, column: 28, scope: !185)
!214 = !DILocation(line: 175, column: 21, scope: !215)
!215 = distinct !DILexicalBlock(scope: !185, file: !30, line: 175, column: 21)
!216 = !DILocation(line: 175, column: 32, scope: !215)
!217 = !DILocation(line: 175, column: 48, scope: !215)
!218 = !DILocation(line: 175, column: 51, scope: !215)
!219 = !DILocation(line: 175, column: 62, scope: !215)
!220 = !DILocation(line: 175, column: 21, scope: !185)
!221 = !DILocation(line: 177, column: 21, scope: !222)
!222 = distinct !DILexicalBlock(scope: !215, file: !30, line: 176, column: 17)
!223 = !DILocation(line: 180, column: 29, scope: !185)
!224 = !DILocation(line: 180, column: 17, scope: !185)
!225 = !DILocation(line: 180, column: 41, scope: !185)
!226 = !DILocation(line: 182, column: 29, scope: !185)
!227 = !DILocation(line: 182, column: 24, scope: !185)
!228 = !DILocation(line: 182, column: 22, scope: !185)
!229 = !DILocation(line: 183, column: 13, scope: !185)
!230 = !DILocation(line: 185, column: 17, scope: !231)
!231 = distinct !DILexicalBlock(scope: !174, file: !30, line: 185, column: 17)
!232 = !DILocation(line: 185, column: 31, scope: !231)
!233 = !DILocation(line: 185, column: 17, scope: !174)
!234 = !DILocation(line: 187, column: 30, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !30, line: 186, column: 13)
!236 = !DILocation(line: 187, column: 17, scope: !235)
!237 = !DILocation(line: 188, column: 13, scope: !235)
!238 = !DILocation(line: 196, column: 9, scope: !175)
!239 = !DILocation(line: 198, column: 5, scope: !168)
!240 = !DILocalVariable(name: "buffer", scope: !241, file: !30, line: 201, type: !128)
!241 = distinct !DILexicalBlock(scope: !242, file: !30, line: 200, column: 9)
!242 = distinct !DILexicalBlock(scope: !168, file: !30, line: 199, column: 5)
!243 = !DILocation(line: 201, column: 17, scope: !241)
!244 = !DILocation(line: 203, column: 17, scope: !245)
!245 = distinct !DILexicalBlock(scope: !241, file: !30, line: 203, column: 17)
!246 = !DILocation(line: 203, column: 22, scope: !245)
!247 = !DILocation(line: 203, column: 27, scope: !245)
!248 = !DILocation(line: 203, column: 30, scope: !245)
!249 = !DILocation(line: 203, column: 35, scope: !245)
!250 = !DILocation(line: 203, column: 17, scope: !241)
!251 = !DILocation(line: 205, column: 37, scope: !252)
!252 = distinct !DILexicalBlock(scope: !245, file: !30, line: 204, column: 13)
!253 = !DILocation(line: 205, column: 30, scope: !252)
!254 = !DILocation(line: 205, column: 17, scope: !252)
!255 = !DILocation(line: 206, column: 13, scope: !252)
!256 = !DILocation(line: 209, column: 17, scope: !257)
!257 = distinct !DILexicalBlock(scope: !245, file: !30, line: 208, column: 13)
!258 = !DILocation(line: 212, column: 9, scope: !242)
!259 = !DILocation(line: 214, column: 1, scope: !168)
!260 = distinct !DISubprogram(name: "goodG2B", scope: !30, file: !30, line: 217, type: !31, scopeLine: 218, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !33)
!261 = !DILocalVariable(name: "data", scope: !260, file: !30, line: 219, type: !35)
!262 = !DILocation(line: 219, column: 9, scope: !260)
!263 = !DILocation(line: 221, column: 10, scope: !260)
!264 = !DILocation(line: 222, column: 5, scope: !260)
!265 = !DILocation(line: 226, column: 14, scope: !266)
!266 = distinct !DILexicalBlock(scope: !260, file: !30, line: 223, column: 5)
!267 = !DILocation(line: 227, column: 9, scope: !266)
!268 = !DILocation(line: 229, column: 5, scope: !260)
!269 = !DILocalVariable(name: "buffer", scope: !270, file: !30, line: 232, type: !128)
!270 = distinct !DILexicalBlock(scope: !271, file: !30, line: 231, column: 9)
!271 = distinct !DILexicalBlock(scope: !260, file: !30, line: 230, column: 5)
!272 = !DILocation(line: 232, column: 17, scope: !270)
!273 = !DILocation(line: 235, column: 17, scope: !274)
!274 = distinct !DILexicalBlock(scope: !270, file: !30, line: 235, column: 17)
!275 = !DILocation(line: 235, column: 22, scope: !274)
!276 = !DILocation(line: 235, column: 17, scope: !270)
!277 = !DILocation(line: 237, column: 37, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !30, line: 236, column: 13)
!279 = !DILocation(line: 237, column: 30, scope: !278)
!280 = !DILocation(line: 237, column: 17, scope: !278)
!281 = !DILocation(line: 238, column: 13, scope: !278)
!282 = !DILocation(line: 241, column: 17, scope: !283)
!283 = distinct !DILexicalBlock(scope: !274, file: !30, line: 240, column: 13)
!284 = !DILocation(line: 244, column: 9, scope: !271)
!285 = !DILocation(line: 246, column: 1, scope: !260)
