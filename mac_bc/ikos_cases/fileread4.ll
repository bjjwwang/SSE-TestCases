; ModuleID = 'mac_bc/ikos_cases/fileread4.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/ikos_cases/fileread4.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct.BitStream = type { %struct.__sFILE*, i32, i32, i8 }

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %inFileName = alloca [35 x i8], align 16
  %bStart = alloca [35 x i32], align 16
  %bEnd = alloca [35 x i32], align 16
  %inFile = alloca %struct.__sFILE*, align 8
  %outFile = alloca %struct.__sFILE*, align 8
  %b = alloca i32, align 4
  %bsIn = alloca %struct.BitStream*, align 8
  %bsWr = alloca %struct.BitStream*, align 8
  %bitsRead = alloca i32, align 4
  %buffHi = alloca i32, align 4
  %buffLo = alloca i32, align 4
  %blockCRC = alloca i32, align 4
  %currBlock = alloca i32, align 4
  %str = alloca [60 x i8], align 16
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [35 x i8]* %inFileName, metadata !24, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [35 x i32]* %bStart, metadata !30, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata [35 x i32]* %bEnd, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %inFile, metadata !36, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %outFile, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32* %b, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bsIn, metadata !102, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bsWr, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32* %bitsRead, metadata !114, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %buffHi, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32* %buffLo, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %blockCRC, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32* %currBlock, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [60 x i8]* %str, metadata !126, metadata !DIExpression()), !dbg !130
  %arraydecay = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !131
  %call = call %struct.__sFILE* @"\01_fopen"(i8* noundef %arraydecay, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !132
  store %struct.__sFILE* %call, %struct.__sFILE** %inFile, align 8, !dbg !133
  %0 = load %struct.__sFILE*, %struct.__sFILE** %inFile, align 8, !dbg !134
  %cmp = icmp eq %struct.__sFILE* %0, null, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 1) #4, !dbg !138
  unreachable, !dbg !138

if.end:                                           ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** %inFile, align 8, !dbg !140
  %call1 = call %struct.BitStream* @bsOpenReadStream(%struct.__sFILE* noundef %1), !dbg !141
  store %struct.BitStream* %call1, %struct.BitStream** %bsIn, align 8, !dbg !142
  store i32 0, i32* %bitsRead, align 4, !dbg !143
  store i32 0, i32* %buffLo, align 4, !dbg !144
  store i32 0, i32* %buffHi, align 4, !dbg !145
  store i32 0, i32* %currBlock, align 4, !dbg !146
  %2 = load i32, i32* %currBlock, align 4, !dbg !147
  %idxprom = zext i32 %2 to i64, !dbg !148
  %arrayidx = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom, !dbg !148
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  br label %while.body, !dbg !150

while.body:                                       ; preds = %if.end46, %if.end
  %3 = load %struct.BitStream*, %struct.BitStream** %bsIn, align 8, !dbg !151
  %call2 = call i32 @bsGetBit(%struct.BitStream* noundef %3), !dbg !153
  store i32 %call2, i32* %b, align 4, !dbg !154
  %4 = load i32, i32* %bitsRead, align 4, !dbg !155
  %inc = add i32 %4, 1, !dbg !155
  store i32 %inc, i32* %bitsRead, align 4, !dbg !155
  %5 = load i32, i32* %b, align 4, !dbg !156
  %cmp3 = icmp eq i32 %5, 2, !dbg !158
  br i1 %cmp3, label %if.then4, label %if.end16, !dbg !159

if.then4:                                         ; preds = %while.body
  %6 = load i32, i32* %bitsRead, align 4, !dbg !160
  %7 = load i32, i32* %currBlock, align 4, !dbg !163
  %idxprom5 = zext i32 %7 to i64, !dbg !164
  %arrayidx6 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom5, !dbg !164
  %8 = load i32, i32* %arrayidx6, align 4, !dbg !164
  %cmp7 = icmp uge i32 %6, %8, !dbg !165
  br i1 %cmp7, label %land.lhs.true, label %if.else, !dbg !166

land.lhs.true:                                    ; preds = %if.then4
  %9 = load i32, i32* %bitsRead, align 4, !dbg !167
  %10 = load i32, i32* %currBlock, align 4, !dbg !168
  %idxprom8 = zext i32 %10 to i64, !dbg !169
  %arrayidx9 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom8, !dbg !169
  %11 = load i32, i32* %arrayidx9, align 4, !dbg !169
  %sub = sub i32 %9, %11, !dbg !170
  %cmp10 = icmp uge i32 %sub, 40, !dbg !171
  br i1 %cmp10, label %if.then11, label %if.else, !dbg !172

if.then11:                                        ; preds = %land.lhs.true
  %12 = load i32, i32* %bitsRead, align 4, !dbg !173
  %sub12 = sub i32 %12, 1, !dbg !174
  %13 = load i32, i32* %currBlock, align 4, !dbg !175
  %idxprom13 = zext i32 %13 to i64, !dbg !176
  %arrayidx14 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom13, !dbg !176
  store i32 %sub12, i32* %arrayidx14, align 4, !dbg !177
  br label %if.end15, !dbg !176

if.else:                                          ; preds = %land.lhs.true, %if.then4
  %14 = load i32, i32* %currBlock, align 4, !dbg !178
  %dec = add i32 %14, -1, !dbg !178
  store i32 %dec, i32* %currBlock, align 4, !dbg !178
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then11
  br label %while.end, !dbg !179

if.end16:                                         ; preds = %while.body
  %15 = load i32, i32* %currBlock, align 4, !dbg !180
  %inc17 = add i32 %15, 1, !dbg !180
  store i32 %inc17, i32* %currBlock, align 4, !dbg !180
  %16 = load i32, i32* %buffHi, align 4, !dbg !181
  %shl = shl i32 %16, 1, !dbg !182
  %17 = load i32, i32* %buffLo, align 4, !dbg !183
  %shr = lshr i32 %17, 31, !dbg !184
  %or = or i32 %shl, %shr, !dbg !185
  store i32 %or, i32* %buffHi, align 4, !dbg !186
  %18 = load i32, i32* %buffLo, align 4, !dbg !187
  %shl18 = shl i32 %18, 1, !dbg !188
  %19 = load i32, i32* %b, align 4, !dbg !189
  %and = and i32 %19, 1, !dbg !190
  %or19 = or i32 %shl18, %and, !dbg !191
  store i32 %or19, i32* %buffLo, align 4, !dbg !192
  %20 = load i32, i32* %buffHi, align 4, !dbg !193
  %and20 = and i32 %20, 65535, !dbg !195
  %conv = zext i32 %and20 to i64, !dbg !196
  %cmp21 = icmp eq i64 %conv, 12609, !dbg !197
  br i1 %cmp21, label %land.lhs.true23, label %lor.lhs.false, !dbg !198

land.lhs.true23:                                  ; preds = %if.end16
  %21 = load i32, i32* %buffLo, align 4, !dbg !199
  %conv24 = zext i32 %21 to i64, !dbg !199
  %cmp25 = icmp eq i64 %conv24, 1495683929, !dbg !200
  br i1 %cmp25, label %if.then35, label %lor.lhs.false, !dbg !201

lor.lhs.false:                                    ; preds = %land.lhs.true23, %if.end16
  %22 = load i32, i32* %buffHi, align 4, !dbg !202
  %and27 = and i32 %22, 65535, !dbg !203
  %conv28 = zext i32 %and27 to i64, !dbg !204
  %cmp29 = icmp eq i64 %conv28, 6002, !dbg !205
  br i1 %cmp29, label %land.lhs.true31, label %if.end46, !dbg !206

land.lhs.true31:                                  ; preds = %lor.lhs.false
  %23 = load i32, i32* %buffLo, align 4, !dbg !207
  %conv32 = zext i32 %23 to i64, !dbg !207
  %cmp33 = icmp eq i64 %conv32, 1161318544, !dbg !208
  br i1 %cmp33, label %if.then35, label %if.end46, !dbg !209

if.then35:                                        ; preds = %land.lhs.true31, %land.lhs.true23
  %24 = load i32, i32* %bitsRead, align 4, !dbg !210
  %cmp36 = icmp ult i32 %24, -1000, !dbg !213
  br i1 %cmp36, label %if.then38, label %if.else42, !dbg !214

if.then38:                                        ; preds = %if.then35
  %25 = load i32, i32* %bitsRead, align 4, !dbg !215
  %sub39 = sub i32 %25, 49, !dbg !217
  %26 = load i32, i32* %currBlock, align 4, !dbg !218
  %idxprom40 = zext i32 %26 to i64, !dbg !219
  %arrayidx41 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom40, !dbg !219
  store i32 %sub39, i32* %arrayidx41, align 4, !dbg !220
  br label %if.end45, !dbg !221

if.else42:                                        ; preds = %if.then35
  %27 = load i32, i32* %currBlock, align 4, !dbg !222
  %idxprom43 = zext i32 %27 to i64, !dbg !224
  %arrayidx44 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom43, !dbg !224
  store i32 0, i32* %arrayidx44, align 4, !dbg !225
  br label %if.end45

if.end45:                                         ; preds = %if.else42, %if.then38
  br label %if.end46, !dbg !226

if.end46:                                         ; preds = %if.end45, %land.lhs.true31, %lor.lhs.false
  br label %while.body, !dbg !150, !llvm.loop !227

while.end:                                        ; preds = %if.end15
  %call47 = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 noundef 1), !dbg !229
  %28 = load i32, i32* %retval, align 4, !dbg !230
  ret i32 %28, !dbg !230
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %struct.BitStream* @bsOpenReadStream(%struct.__sFILE* noundef %stream) #0 !dbg !231 {
entry:
  %stream.addr = alloca %struct.__sFILE*, align 8
  %bs = alloca %struct.BitStream*, align 8
  store %struct.__sFILE* %stream, %struct.__sFILE** %stream.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %stream.addr, metadata !234, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs, metadata !236, metadata !DIExpression()), !dbg !237
  %call = call i8* @malloc(i64 noundef 24), !dbg !238
  %0 = bitcast i8* %call to %struct.BitStream*, !dbg !238
  store %struct.BitStream* %0, %struct.BitStream** %bs, align 8, !dbg !237
  %1 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !239
  %cmp = icmp eq %struct.BitStream* %1, null, !dbg !241
  br i1 %cmp, label %if.then, label %if.end, !dbg !242

if.then:                                          ; preds = %entry
  %call1 = call i32 (i64, ...) bitcast (i32 (...)* @mallocFail to i32 (i64, ...)*)(i64 noundef 24), !dbg !243
  br label %if.end, !dbg !243

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.__sFILE*, %struct.__sFILE** %stream.addr, align 8, !dbg !244
  %3 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !245
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %3, i32 0, i32 0, !dbg !246
  store %struct.__sFILE* %2, %struct.__sFILE** %handle, align 8, !dbg !247
  %4 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !248
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !249
  store i32 0, i32* %buffer, align 8, !dbg !250
  %5 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !251
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %5, i32 0, i32 2, !dbg !252
  store i32 0, i32* %buffLive, align 4, !dbg !253
  %6 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !254
  %mode = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 3, !dbg !255
  store i8 114, i8* %mode, align 8, !dbg !256
  %7 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !257
  ret %struct.BitStream* %7, !dbg !258
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @bsGetBit(%struct.BitStream* noundef %bs) #0 !dbg !259 {
entry:
  %retval = alloca i32, align 4
  %bs.addr = alloca %struct.BitStream*, align 8
  %retVal = alloca i32, align 4
  store %struct.BitStream* %bs, %struct.BitStream** %bs.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs.addr, metadata !262, metadata !DIExpression()), !dbg !263
  %0 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !264
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %0, i32 0, i32 2, !dbg !266
  %1 = load i32, i32* %buffLive, align 4, !dbg !266
  %cmp = icmp sgt i32 %1, 0, !dbg !267
  br i1 %cmp, label %if.then, label %if.else, !dbg !268

if.then:                                          ; preds = %entry
  %2 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !269
  %buffLive1 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %2, i32 0, i32 2, !dbg !271
  %3 = load i32, i32* %buffLive1, align 4, !dbg !272
  %dec = add nsw i32 %3, -1, !dbg !272
  store i32 %dec, i32* %buffLive1, align 4, !dbg !272
  %4 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !273
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !274
  %5 = load i32, i32* %buffer, align 8, !dbg !274
  %6 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !275
  %buffLive2 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 2, !dbg !276
  %7 = load i32, i32* %buffLive2, align 4, !dbg !276
  %shr = ashr i32 %5, %7, !dbg !277
  %and = and i32 %shr, 1, !dbg !278
  store i32 %and, i32* %retval, align 4, !dbg !279
  br label %return, !dbg !279

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %retVal, metadata !280, metadata !DIExpression()), !dbg !282
  %8 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !283
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %8, i32 0, i32 0, !dbg !284
  %9 = load %struct.__sFILE*, %struct.__sFILE** %handle, align 8, !dbg !284
  %call = call i32 @getc(%struct.__sFILE* noundef %9), !dbg !285
  store i32 %call, i32* %retVal, align 4, !dbg !282
  %10 = load i32, i32* %retVal, align 4, !dbg !286
  %cmp3 = icmp eq i32 %10, -1, !dbg !288
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !289

if.then4:                                         ; preds = %if.else
  store i32 10000, i32* %retval, align 4, !dbg !290
  br label %return, !dbg !290

if.end:                                           ; preds = %if.else
  %11 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !292
  %buffLive5 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %11, i32 0, i32 2, !dbg !293
  store i32 7, i32* %buffLive5, align 4, !dbg !294
  %12 = load i32, i32* %retVal, align 4, !dbg !295
  %13 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !296
  %buffer6 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %13, i32 0, i32 1, !dbg !297
  store i32 %12, i32* %buffer6, align 8, !dbg !298
  %14 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !299
  %buffer7 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %14, i32 0, i32 1, !dbg !300
  %15 = load i32, i32* %buffer7, align 8, !dbg !300
  %shr8 = ashr i32 %15, 7, !dbg !301
  %and9 = and i32 %shr8, 1, !dbg !302
  store i32 %and9, i32* %retval, align 4, !dbg !303
  br label %return, !dbg !303

return:                                           ; preds = %if.end, %if.then4, %if.then
  %16 = load i32, i32* %retval, align 4, !dbg !304
  ret i32 %16, !dbg !304
}

declare i32 @svf_assert(...) #2

declare i8* @malloc(i64 noundef) #2

declare i32 @mallocFail(...) #2

declare i32 @getc(%struct.__sFILE* noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/ikos_cases/fileread4.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 49, type: !13, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!12 = !DIFile(filename: "src/ikos_cases/fileread4.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{}
!20 = !DILocalVariable(name: "argc", arg: 1, scope: !11, file: !12, line: 49, type: !15)
!21 = !DILocation(line: 49, column: 14, scope: !11)
!22 = !DILocalVariable(name: "argv", arg: 2, scope: !11, file: !12, line: 49, type: !16)
!23 = !DILocation(line: 49, column: 27, scope: !11)
!24 = !DILocalVariable(name: "inFileName", scope: !11, file: !12, line: 50, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 280, elements: !27)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "Char", file: !12, line: 6, baseType: !18)
!27 = !{!28}
!28 = !DISubrange(count: 35)
!29 = !DILocation(line: 50, column: 10, scope: !11)
!30 = !DILocalVariable(name: "bStart", scope: !11, file: !12, line: 51, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 1120, elements: !27)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "Int32", file: !12, line: 4, baseType: !15)
!33 = !DILocation(line: 51, column: 11, scope: !11)
!34 = !DILocalVariable(name: "bEnd", scope: !11, file: !12, line: 52, type: !31)
!35 = !DILocation(line: 52, column: 11, scope: !11)
!36 = !DILocalVariable(name: "inFile", scope: !11, file: !12, line: 53, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !39, line: 157, baseType: !40)
!39 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/_stdio.h", directory: "")
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !39, line: 126, size: 1216, elements: !41)
!41 = !{!42, !45, !46, !47, !49, !50, !55, !56, !57, !61, !65, !75, !81, !82, !85, !86, !90, !94, !95, !96}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !40, file: !39, line: 127, baseType: !43, size: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !40, file: !39, line: 128, baseType: !15, size: 32, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !40, file: !39, line: 129, baseType: !15, size: 32, offset: 96)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !40, file: !39, line: 130, baseType: !48, size: 16, offset: 128)
!48 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !40, file: !39, line: 131, baseType: !48, size: 16, offset: 144)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !40, file: !39, line: 132, baseType: !51, size: 128, offset: 192)
!51 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !39, line: 92, size: 128, elements: !52)
!52 = !{!53, !54}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !51, file: !39, line: 93, baseType: !43, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !51, file: !39, line: 94, baseType: !15, size: 32, offset: 64)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !40, file: !39, line: 133, baseType: !15, size: 32, offset: 320)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !40, file: !39, line: 136, baseType: !3, size: 64, offset: 384)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !40, file: !39, line: 137, baseType: !58, size: 64, offset: 448)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DISubroutineType(types: !60)
!60 = !{!15, !3}
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !40, file: !39, line: 138, baseType: !62, size: 64, offset: 512)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DISubroutineType(types: !64)
!64 = !{!15, !3, !17, !15}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !40, file: !39, line: 139, baseType: !66, size: 64, offset: 576)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !3, !69, !15}
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !39, line: 81, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !71, line: 71, baseType: !72)
!71 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types.h", directory: "")
!72 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !73, line: 48, baseType: !74)
!73 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!74 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !40, file: !39, line: 140, baseType: !76, size: 64, offset: 640)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DISubroutineType(types: !78)
!78 = !{!15, !3, !79, !15}
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !40, file: !39, line: 143, baseType: !51, size: 128, offset: 704)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !40, file: !39, line: 144, baseType: !83, size: 64, offset: 832)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !39, line: 98, flags: DIFlagFwdDecl)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !40, file: !39, line: 145, baseType: !15, size: 32, offset: 896)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !40, file: !39, line: 148, baseType: !87, size: 24, offset: 928)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 24, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 3)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !40, file: !39, line: 149, baseType: !91, size: 8, offset: 952)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 8, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 1)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !40, file: !39, line: 152, baseType: !51, size: 128, offset: 960)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !40, file: !39, line: 155, baseType: !15, size: 32, offset: 1088)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !40, file: !39, line: 156, baseType: !69, size: 64, offset: 1152)
!97 = !DILocation(line: 53, column: 17, scope: !11)
!98 = !DILocalVariable(name: "outFile", scope: !11, file: !12, line: 54, type: !37)
!99 = !DILocation(line: 54, column: 17, scope: !11)
!100 = !DILocalVariable(name: "b", scope: !11, file: !12, line: 55, type: !32)
!101 = !DILocation(line: 55, column: 12, scope: !11)
!102 = !DILocalVariable(name: "bsIn", scope: !11, file: !12, line: 56, type: !103)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "BitStream", file: !12, line: 19, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !12, line: 14, size: 192, elements: !106)
!106 = !{!107, !108, !109, !110}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "handle", scope: !105, file: !12, line: 15, baseType: !37, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !105, file: !12, line: 16, baseType: !32, size: 32, offset: 64)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "buffLive", scope: !105, file: !12, line: 17, baseType: !32, size: 32, offset: 96)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !105, file: !12, line: 18, baseType: !26, size: 8, offset: 128)
!111 = !DILocation(line: 56, column: 17, scope: !11)
!112 = !DILocalVariable(name: "bsWr", scope: !11, file: !12, line: 56, type: !103)
!113 = !DILocation(line: 56, column: 24, scope: !11)
!114 = !DILocalVariable(name: "bitsRead", scope: !11, file: !12, line: 57, type: !115)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "UInt32", file: !12, line: 3, baseType: !116)
!116 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!117 = !DILocation(line: 57, column: 17, scope: !11)
!118 = !DILocalVariable(name: "buffHi", scope: !11, file: !12, line: 57, type: !115)
!119 = !DILocation(line: 57, column: 27, scope: !11)
!120 = !DILocalVariable(name: "buffLo", scope: !11, file: !12, line: 57, type: !115)
!121 = !DILocation(line: 57, column: 35, scope: !11)
!122 = !DILocalVariable(name: "blockCRC", scope: !11, file: !12, line: 57, type: !115)
!123 = !DILocation(line: 57, column: 43, scope: !11)
!124 = !DILocalVariable(name: "currBlock", scope: !11, file: !12, line: 57, type: !115)
!125 = !DILocation(line: 57, column: 53, scope: !11)
!126 = !DILocalVariable(name: "str", scope: !11, file: !12, line: 58, type: !127)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 480, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 60)
!130 = !DILocation(line: 58, column: 10, scope: !11)
!131 = !DILocation(line: 60, column: 22, scope: !11)
!132 = !DILocation(line: 60, column: 14, scope: !11)
!133 = !DILocation(line: 60, column: 12, scope: !11)
!134 = !DILocation(line: 61, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !11, file: !12, line: 61, column: 9)
!136 = !DILocation(line: 61, column: 16, scope: !135)
!137 = !DILocation(line: 61, column: 9, scope: !11)
!138 = !DILocation(line: 62, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !12, line: 61, column: 25)
!140 = !DILocation(line: 64, column: 31, scope: !11)
!141 = !DILocation(line: 64, column: 12, scope: !11)
!142 = !DILocation(line: 64, column: 10, scope: !11)
!143 = !DILocation(line: 66, column: 14, scope: !11)
!144 = !DILocation(line: 67, column: 21, scope: !11)
!145 = !DILocation(line: 67, column: 12, scope: !11)
!146 = !DILocation(line: 68, column: 15, scope: !11)
!147 = !DILocation(line: 69, column: 12, scope: !11)
!148 = !DILocation(line: 69, column: 5, scope: !11)
!149 = !DILocation(line: 69, column: 23, scope: !11)
!150 = !DILocation(line: 70, column: 5, scope: !11)
!151 = !DILocation(line: 71, column: 22, scope: !152)
!152 = distinct !DILexicalBlock(scope: !11, file: !12, line: 70, column: 15)
!153 = !DILocation(line: 71, column: 13, scope: !152)
!154 = !DILocation(line: 71, column: 11, scope: !152)
!155 = !DILocation(line: 72, column: 17, scope: !152)
!156 = !DILocation(line: 73, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !12, line: 73, column: 13)
!158 = !DILocation(line: 73, column: 15, scope: !157)
!159 = !DILocation(line: 73, column: 13, scope: !152)
!160 = !DILocation(line: 74, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !162, file: !12, line: 74, column: 17)
!162 = distinct !DILexicalBlock(scope: !157, file: !12, line: 73, column: 21)
!163 = !DILocation(line: 74, column: 36, scope: !161)
!164 = !DILocation(line: 74, column: 29, scope: !161)
!165 = !DILocation(line: 74, column: 26, scope: !161)
!166 = !DILocation(line: 74, column: 47, scope: !161)
!167 = !DILocation(line: 75, column: 18, scope: !161)
!168 = !DILocation(line: 75, column: 36, scope: !161)
!169 = !DILocation(line: 75, column: 29, scope: !161)
!170 = !DILocation(line: 75, column: 27, scope: !161)
!171 = !DILocation(line: 75, column: 48, scope: !161)
!172 = !DILocation(line: 74, column: 17, scope: !162)
!173 = !DILocation(line: 76, column: 35, scope: !161)
!174 = !DILocation(line: 76, column: 43, scope: !161)
!175 = !DILocation(line: 76, column: 22, scope: !161)
!176 = !DILocation(line: 76, column: 17, scope: !161)
!177 = !DILocation(line: 76, column: 33, scope: !161)
!178 = !DILocation(line: 78, column: 26, scope: !161)
!179 = !DILocation(line: 79, column: 13, scope: !162)
!180 = !DILocation(line: 81, column: 18, scope: !152)
!181 = !DILocation(line: 82, column: 19, scope: !152)
!182 = !DILocation(line: 82, column: 26, scope: !152)
!183 = !DILocation(line: 82, column: 35, scope: !152)
!184 = !DILocation(line: 82, column: 42, scope: !152)
!185 = !DILocation(line: 82, column: 32, scope: !152)
!186 = !DILocation(line: 82, column: 16, scope: !152)
!187 = !DILocation(line: 83, column: 19, scope: !152)
!188 = !DILocation(line: 83, column: 26, scope: !152)
!189 = !DILocation(line: 83, column: 35, scope: !152)
!190 = !DILocation(line: 83, column: 37, scope: !152)
!191 = !DILocation(line: 83, column: 32, scope: !152)
!192 = !DILocation(line: 83, column: 16, scope: !152)
!193 = !DILocation(line: 84, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !152, file: !12, line: 84, column: 14)
!195 = !DILocation(line: 84, column: 24, scope: !194)
!196 = !DILocation(line: 84, column: 16, scope: !194)
!197 = !DILocation(line: 84, column: 38, scope: !194)
!198 = !DILocation(line: 84, column: 58, scope: !194)
!199 = !DILocation(line: 84, column: 61, scope: !194)
!200 = !DILocation(line: 84, column: 68, scope: !194)
!201 = !DILocation(line: 84, column: 87, scope: !194)
!202 = !DILocation(line: 85, column: 17, scope: !194)
!203 = !DILocation(line: 85, column: 24, scope: !194)
!204 = !DILocation(line: 85, column: 16, scope: !194)
!205 = !DILocation(line: 85, column: 38, scope: !194)
!206 = !DILocation(line: 85, column: 58, scope: !194)
!207 = !DILocation(line: 85, column: 61, scope: !194)
!208 = !DILocation(line: 85, column: 68, scope: !194)
!209 = !DILocation(line: 84, column: 14, scope: !152)
!210 = !DILocation(line: 87, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !12, line: 87, column: 17)
!212 = distinct !DILexicalBlock(scope: !194, file: !12, line: 86, column: 9)
!213 = !DILocation(line: 87, column: 26, scope: !211)
!214 = !DILocation(line: 87, column: 17, scope: !212)
!215 = !DILocation(line: 89, column: 35, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !12, line: 88, column: 13)
!217 = !DILocation(line: 89, column: 43, scope: !216)
!218 = !DILocation(line: 89, column: 22, scope: !216)
!219 = !DILocation(line: 89, column: 17, scope: !216)
!220 = !DILocation(line: 89, column: 33, scope: !216)
!221 = !DILocation(line: 90, column: 13, scope: !216)
!222 = !DILocation(line: 91, column: 22, scope: !223)
!223 = distinct !DILexicalBlock(scope: !211, file: !12, line: 90, column: 20)
!224 = !DILocation(line: 91, column: 17, scope: !223)
!225 = !DILocation(line: 91, column: 33, scope: !223)
!226 = !DILocation(line: 93, column: 9, scope: !212)
!227 = distinct !{!227, !150, !228}
!228 = !DILocation(line: 94, column: 5, scope: !11)
!229 = !DILocation(line: 95, column: 5, scope: !11)
!230 = !DILocation(line: 96, column: 1, scope: !11)
!231 = distinct !DISubprogram(name: "bsOpenReadStream", scope: !12, file: !12, line: 21, type: !232, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!232 = !DISubroutineType(types: !233)
!233 = !{!103, !37}
!234 = !DILocalVariable(name: "stream", arg: 1, scope: !231, file: !12, line: 21, type: !37)
!235 = !DILocation(line: 21, column: 44, scope: !231)
!236 = !DILocalVariable(name: "bs", scope: !231, file: !12, line: 23, type: !103)
!237 = !DILocation(line: 23, column: 16, scope: !231)
!238 = !DILocation(line: 23, column: 21, scope: !231)
!239 = !DILocation(line: 24, column: 9, scope: !240)
!240 = distinct !DILexicalBlock(scope: !231, file: !12, line: 24, column: 9)
!241 = !DILocation(line: 24, column: 12, scope: !240)
!242 = !DILocation(line: 24, column: 9, scope: !231)
!243 = !DILocation(line: 24, column: 21, scope: !240)
!244 = !DILocation(line: 25, column: 18, scope: !231)
!245 = !DILocation(line: 25, column: 5, scope: !231)
!246 = !DILocation(line: 25, column: 9, scope: !231)
!247 = !DILocation(line: 25, column: 16, scope: !231)
!248 = !DILocation(line: 26, column: 5, scope: !231)
!249 = !DILocation(line: 26, column: 9, scope: !231)
!250 = !DILocation(line: 26, column: 16, scope: !231)
!251 = !DILocation(line: 27, column: 5, scope: !231)
!252 = !DILocation(line: 27, column: 9, scope: !231)
!253 = !DILocation(line: 27, column: 18, scope: !231)
!254 = !DILocation(line: 28, column: 5, scope: !231)
!255 = !DILocation(line: 28, column: 9, scope: !231)
!256 = !DILocation(line: 28, column: 14, scope: !231)
!257 = !DILocation(line: 29, column: 12, scope: !231)
!258 = !DILocation(line: 29, column: 5, scope: !231)
!259 = distinct !DISubprogram(name: "bsGetBit", scope: !12, file: !12, line: 32, type: !260, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!260 = !DISubroutineType(types: !261)
!261 = !{!32, !103}
!262 = !DILocalVariable(name: "bs", arg: 1, scope: !259, file: !12, line: 32, type: !103)
!263 = !DILocation(line: 32, column: 36, scope: !259)
!264 = !DILocation(line: 34, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !259, file: !12, line: 34, column: 9)
!266 = !DILocation(line: 34, column: 13, scope: !265)
!267 = !DILocation(line: 34, column: 22, scope: !265)
!268 = !DILocation(line: 34, column: 9, scope: !259)
!269 = !DILocation(line: 35, column: 9, scope: !270)
!270 = distinct !DILexicalBlock(scope: !265, file: !12, line: 34, column: 27)
!271 = !DILocation(line: 35, column: 13, scope: !270)
!272 = !DILocation(line: 35, column: 22, scope: !270)
!273 = !DILocation(line: 36, column: 20, scope: !270)
!274 = !DILocation(line: 36, column: 24, scope: !270)
!275 = !DILocation(line: 36, column: 36, scope: !270)
!276 = !DILocation(line: 36, column: 40, scope: !270)
!277 = !DILocation(line: 36, column: 32, scope: !270)
!278 = !DILocation(line: 36, column: 51, scope: !270)
!279 = !DILocation(line: 36, column: 9, scope: !270)
!280 = !DILocalVariable(name: "retVal", scope: !281, file: !12, line: 38, type: !32)
!281 = distinct !DILexicalBlock(scope: !265, file: !12, line: 37, column: 12)
!282 = !DILocation(line: 38, column: 15, scope: !281)
!283 = !DILocation(line: 38, column: 31, scope: !281)
!284 = !DILocation(line: 38, column: 35, scope: !281)
!285 = !DILocation(line: 38, column: 24, scope: !281)
!286 = !DILocation(line: 39, column: 14, scope: !287)
!287 = distinct !DILexicalBlock(scope: !281, file: !12, line: 39, column: 14)
!288 = !DILocation(line: 39, column: 21, scope: !287)
!289 = !DILocation(line: 39, column: 14, scope: !281)
!290 = !DILocation(line: 40, column: 13, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !12, line: 39, column: 30)
!292 = !DILocation(line: 42, column: 9, scope: !281)
!293 = !DILocation(line: 42, column: 13, scope: !281)
!294 = !DILocation(line: 42, column: 22, scope: !281)
!295 = !DILocation(line: 43, column: 22, scope: !281)
!296 = !DILocation(line: 43, column: 9, scope: !281)
!297 = !DILocation(line: 43, column: 13, scope: !281)
!298 = !DILocation(line: 43, column: 20, scope: !281)
!299 = !DILocation(line: 44, column: 20, scope: !281)
!300 = !DILocation(line: 44, column: 24, scope: !281)
!301 = !DILocation(line: 44, column: 32, scope: !281)
!302 = !DILocation(line: 44, column: 38, scope: !281)
!303 = !DILocation(line: 44, column: 9, scope: !281)
!304 = !DILocation(line: 46, column: 1, scope: !259)
