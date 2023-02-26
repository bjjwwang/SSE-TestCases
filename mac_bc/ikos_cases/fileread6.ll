; ModuleID = 'mac_bc/ikos_cases/fileread6.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/ikos_cases/fileread6.c"
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
  %split = alloca i8*, align 8
  %ofs = alloca i32, align 4
  %k = alloca i32, align 4
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
  br label %while.body47, !dbg !229

while.body47:                                     ; preds = %if.end130, %while.end
  %28 = load %struct.BitStream*, %struct.BitStream** %bsIn, align 8, !dbg !230
  %call48 = call i32 @bsGetBit(%struct.BitStream* noundef %28), !dbg !232
  store i32 %call48, i32* %b, align 4, !dbg !233
  %29 = load i32, i32* %b, align 4, !dbg !234
  %cmp49 = icmp eq i32 %29, 2, !dbg !236
  br i1 %cmp49, label %if.then51, label %if.end52, !dbg !237

if.then51:                                        ; preds = %while.body47
  br label %while.end131, !dbg !238

if.end52:                                         ; preds = %while.body47
  %30 = load i32, i32* %buffHi, align 4, !dbg !239
  %shl53 = shl i32 %30, 1, !dbg !240
  %31 = load i32, i32* %buffLo, align 4, !dbg !241
  %shr54 = lshr i32 %31, 31, !dbg !242
  %or55 = or i32 %shl53, %shr54, !dbg !243
  store i32 %or55, i32* %buffHi, align 4, !dbg !244
  %32 = load i32, i32* %buffLo, align 4, !dbg !245
  %shl56 = shl i32 %32, 1, !dbg !246
  %33 = load i32, i32* %b, align 4, !dbg !247
  %and57 = and i32 %33, 1, !dbg !248
  %or58 = or i32 %shl56, %and57, !dbg !249
  store i32 %or58, i32* %buffLo, align 4, !dbg !250
  %34 = load i32, i32* %bitsRead, align 4, !dbg !251
  %35 = load i32, i32* %currBlock, align 4, !dbg !253
  %idxprom59 = zext i32 %35 to i64, !dbg !254
  %arrayidx60 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom59, !dbg !254
  %36 = load i32, i32* %arrayidx60, align 4, !dbg !254
  %add = add nsw i32 47, %36, !dbg !255
  %cmp61 = icmp eq i32 %34, %add, !dbg !256
  br i1 %cmp61, label %if.then63, label %if.end67, !dbg !257

if.then63:                                        ; preds = %if.end52
  %37 = load i32, i32* %buffHi, align 4, !dbg !258
  %shl64 = shl i32 %37, 16, !dbg !259
  %38 = load i32, i32* %buffLo, align 4, !dbg !260
  %shr65 = lshr i32 %38, 16, !dbg !261
  %or66 = or i32 %shl64, %shr65, !dbg !262
  store i32 %or66, i32* %blockCRC, align 4, !dbg !263
  br label %if.end67, !dbg !264

if.end67:                                         ; preds = %if.then63, %if.end52
  %39 = load %struct.__sFILE*, %struct.__sFILE** %outFile, align 8, !dbg !265
  %cmp68 = icmp ne %struct.__sFILE* %39, null, !dbg !267
  br i1 %cmp68, label %land.lhs.true70, label %if.end82, !dbg !268

land.lhs.true70:                                  ; preds = %if.end67
  %40 = load i32, i32* %bitsRead, align 4, !dbg !269
  %41 = load i32, i32* %currBlock, align 4, !dbg !270
  %idxprom71 = zext i32 %41 to i64, !dbg !271
  %arrayidx72 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom71, !dbg !271
  %42 = load i32, i32* %arrayidx72, align 4, !dbg !271
  %cmp73 = icmp uge i32 %40, %42, !dbg !272
  br i1 %cmp73, label %land.lhs.true75, label %if.end82, !dbg !273

land.lhs.true75:                                  ; preds = %land.lhs.true70
  %43 = load i32, i32* %bitsRead, align 4, !dbg !274
  %44 = load i32, i32* %currBlock, align 4, !dbg !275
  %idxprom76 = zext i32 %44 to i64, !dbg !276
  %arrayidx77 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom76, !dbg !276
  %45 = load i32, i32* %arrayidx77, align 4, !dbg !276
  %cmp78 = icmp ule i32 %43, %45, !dbg !277
  br i1 %cmp78, label %if.then80, label %if.end82, !dbg !278

if.then80:                                        ; preds = %land.lhs.true75
  %46 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !279
  %47 = load i32, i32* %b, align 4, !dbg !281
  %call81 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutBit to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* noundef %46, i32 noundef %47), !dbg !282
  br label %if.end82, !dbg !283

if.end82:                                         ; preds = %if.then80, %land.lhs.true75, %land.lhs.true70, %if.end67
  %48 = load i32, i32* %bitsRead, align 4, !dbg !284
  %inc83 = add i32 %48, 1, !dbg !284
  store i32 %inc83, i32* %bitsRead, align 4, !dbg !284
  %49 = load i32, i32* %bitsRead, align 4, !dbg !285
  %50 = load i32, i32* %currBlock, align 4, !dbg !287
  %idxprom84 = zext i32 %50 to i64, !dbg !288
  %arrayidx85 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom84, !dbg !288
  %51 = load i32, i32* %arrayidx85, align 4, !dbg !288
  %add86 = add nsw i32 %51, 1, !dbg !289
  %cmp87 = icmp eq i32 %49, %add86, !dbg !290
  br i1 %cmp87, label %if.then89, label %if.else107, !dbg !291

if.then89:                                        ; preds = %if.end82
  %52 = load %struct.__sFILE*, %struct.__sFILE** %outFile, align 8, !dbg !292
  %cmp90 = icmp ne %struct.__sFILE* %52, null, !dbg !295
  br i1 %cmp90, label %if.then92, label %if.end101, !dbg !296

if.then92:                                        ; preds = %if.then89
  %53 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !297
  %call93 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* noundef %53, i32 noundef 23), !dbg !299
  %54 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !300
  %call94 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* noundef %54, i32 noundef 114), !dbg !301
  %55 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !302
  %call95 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* noundef %55, i32 noundef 69), !dbg !303
  %56 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !304
  %call96 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* noundef %56, i32 noundef 56), !dbg !305
  %57 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !306
  %call97 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* noundef %57, i32 noundef 80), !dbg !307
  %58 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !308
  %call98 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* noundef %58, i32 noundef 144), !dbg !309
  %59 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !310
  %60 = load i32, i32* %blockCRC, align 4, !dbg !311
  %call99 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUInt32 to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* noundef %59, i32 noundef %60), !dbg !312
  %61 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !313
  %call100 = call i32 (%struct.BitStream*, ...) bitcast (i32 (...)* @bsClose to i32 (%struct.BitStream*, ...)*)(%struct.BitStream* noundef %61), !dbg !314
  br label %if.end101, !dbg !315

if.end101:                                        ; preds = %if.then92, %if.then89
  %62 = load i32, i32* %currBlock, align 4, !dbg !316
  %cmp102 = icmp uge i32 %62, 30, !dbg !318
  br i1 %cmp102, label %if.then104, label %if.end105, !dbg !319

if.then104:                                       ; preds = %if.end101
  br label %while.end131, !dbg !320

if.end105:                                        ; preds = %if.end101
  %63 = load i32, i32* %currBlock, align 4, !dbg !321
  %inc106 = add i32 %63, 1, !dbg !321
  store i32 %inc106, i32* %currBlock, align 4, !dbg !321
  br label %if.end130, !dbg !322

if.else107:                                       ; preds = %if.end82
  %64 = load i32, i32* %bitsRead, align 4, !dbg !323
  %65 = load i32, i32* %currBlock, align 4, !dbg !325
  %idxprom108 = zext i32 %65 to i64, !dbg !326
  %arrayidx109 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom108, !dbg !326
  %66 = load i32, i32* %arrayidx109, align 4, !dbg !326
  %cmp110 = icmp eq i32 %64, %66, !dbg !327
  br i1 %cmp110, label %if.then112, label %if.end129, !dbg !328

if.then112:                                       ; preds = %if.else107
  call void @llvm.dbg.declare(metadata i8** %split, metadata !329, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata i32* %ofs, metadata !333, metadata !DIExpression()), !dbg !334
  call void @llvm.dbg.declare(metadata i32* %k, metadata !335, metadata !DIExpression()), !dbg !336
  store i32 0, i32* %k, align 4, !dbg !337
  br label %for.cond, !dbg !339

for.cond:                                         ; preds = %for.inc, %if.then112
  %67 = load i32, i32* %k, align 4, !dbg !340
  %cmp113 = icmp slt i32 %67, 50, !dbg !342
  br i1 %cmp113, label %for.body, label %for.end, !dbg !343

for.body:                                         ; preds = %for.cond
  %68 = load i32, i32* %k, align 4, !dbg !344
  %idxprom115 = sext i32 %68 to i64, !dbg !345
  %arrayidx116 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 %idxprom115, !dbg !345
  store i8 0, i8* %arrayidx116, align 1, !dbg !346
  br label %for.inc, !dbg !345

for.inc:                                          ; preds = %for.body
  %69 = load i32, i32* %k, align 4, !dbg !347
  %inc117 = add nsw i32 %69, 1, !dbg !347
  store i32 %inc117, i32* %k, align 4, !dbg !347
  br label %for.cond, !dbg !348, !llvm.loop !349

for.end:                                          ; preds = %for.cond
  %arraydecay118 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !352
  %arraydecay119 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !353
  %call120 = call i8* @strcpy(i8* noundef %arraydecay118, i8* noundef %arraydecay119), !dbg !354
  %arraydecay121 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !355
  %call122 = call i8* @strrchr(i8* noundef %arraydecay121, i32 noundef 40), !dbg !356
  store i8* %call122, i8** %split, align 8, !dbg !357
  %70 = load i8*, i8** %split, align 8, !dbg !358
  %cmp123 = icmp eq i8* %70, null, !dbg !360
  br i1 %cmp123, label %if.then125, label %if.else127, !dbg !361

if.then125:                                       ; preds = %for.end
  %arraydecay126 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !362
  store i8* %arraydecay126, i8** %split, align 8, !dbg !364
  br label %if.end128, !dbg !365

if.else127:                                       ; preds = %for.end
  %71 = load i8*, i8** %split, align 8, !dbg !366
  %incdec.ptr = getelementptr inbounds i8, i8* %71, i32 1, !dbg !366
  store i8* %incdec.ptr, i8** %split, align 8, !dbg !366
  br label %if.end128

if.end128:                                        ; preds = %if.else127, %if.then125
  br label %if.end129, !dbg !368

if.end129:                                        ; preds = %if.end128, %if.else107
  br label %if.end130

if.end130:                                        ; preds = %if.end129, %if.end105
  br label %while.body47, !dbg !229, !llvm.loop !369

while.end131:                                     ; preds = %if.then104, %if.then51
  %call132 = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 noundef 1), !dbg !371
  %72 = load i32, i32* %retval, align 4, !dbg !372
  ret i32 %72, !dbg !372
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %struct.BitStream* @bsOpenReadStream(%struct.__sFILE* noundef %stream) #0 !dbg !373 {
entry:
  %stream.addr = alloca %struct.__sFILE*, align 8
  %bs = alloca %struct.BitStream*, align 8
  store %struct.__sFILE* %stream, %struct.__sFILE** %stream.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %stream.addr, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs, metadata !378, metadata !DIExpression()), !dbg !379
  %call = call i8* @malloc(i64 noundef 24), !dbg !380
  %0 = bitcast i8* %call to %struct.BitStream*, !dbg !380
  store %struct.BitStream* %0, %struct.BitStream** %bs, align 8, !dbg !379
  %1 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !381
  %cmp = icmp eq %struct.BitStream* %1, null, !dbg !383
  br i1 %cmp, label %if.then, label %if.end, !dbg !384

if.then:                                          ; preds = %entry
  %call1 = call i32 (i64, ...) bitcast (i32 (...)* @mallocFail to i32 (i64, ...)*)(i64 noundef 24), !dbg !385
  br label %if.end, !dbg !385

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.__sFILE*, %struct.__sFILE** %stream.addr, align 8, !dbg !386
  %3 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !387
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %3, i32 0, i32 0, !dbg !388
  store %struct.__sFILE* %2, %struct.__sFILE** %handle, align 8, !dbg !389
  %4 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !390
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !391
  store i32 0, i32* %buffer, align 8, !dbg !392
  %5 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !393
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %5, i32 0, i32 2, !dbg !394
  store i32 0, i32* %buffLive, align 4, !dbg !395
  %6 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !396
  %mode = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 3, !dbg !397
  store i8 114, i8* %mode, align 8, !dbg !398
  %7 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !399
  ret %struct.BitStream* %7, !dbg !400
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @bsGetBit(%struct.BitStream* noundef %bs) #0 !dbg !401 {
entry:
  %retval = alloca i32, align 4
  %bs.addr = alloca %struct.BitStream*, align 8
  %retVal = alloca i32, align 4
  store %struct.BitStream* %bs, %struct.BitStream** %bs.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs.addr, metadata !404, metadata !DIExpression()), !dbg !405
  %0 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !406
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %0, i32 0, i32 2, !dbg !408
  %1 = load i32, i32* %buffLive, align 4, !dbg !408
  %cmp = icmp sgt i32 %1, 0, !dbg !409
  br i1 %cmp, label %if.then, label %if.else, !dbg !410

if.then:                                          ; preds = %entry
  %2 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !411
  %buffLive1 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %2, i32 0, i32 2, !dbg !413
  %3 = load i32, i32* %buffLive1, align 4, !dbg !414
  %dec = add nsw i32 %3, -1, !dbg !414
  store i32 %dec, i32* %buffLive1, align 4, !dbg !414
  %4 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !415
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !416
  %5 = load i32, i32* %buffer, align 8, !dbg !416
  %6 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !417
  %buffLive2 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 2, !dbg !418
  %7 = load i32, i32* %buffLive2, align 4, !dbg !418
  %shr = ashr i32 %5, %7, !dbg !419
  %and = and i32 %shr, 1, !dbg !420
  store i32 %and, i32* %retval, align 4, !dbg !421
  br label %return, !dbg !421

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %retVal, metadata !422, metadata !DIExpression()), !dbg !424
  %8 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !425
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %8, i32 0, i32 0, !dbg !426
  %9 = load %struct.__sFILE*, %struct.__sFILE** %handle, align 8, !dbg !426
  %call = call i32 @getc(%struct.__sFILE* noundef %9), !dbg !427
  store i32 %call, i32* %retVal, align 4, !dbg !424
  %10 = load i32, i32* %retVal, align 4, !dbg !428
  %cmp3 = icmp eq i32 %10, -1, !dbg !430
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !431

if.then4:                                         ; preds = %if.else
  store i32 10000, i32* %retval, align 4, !dbg !432
  br label %return, !dbg !432

if.end:                                           ; preds = %if.else
  %11 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !434
  %buffLive5 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %11, i32 0, i32 2, !dbg !435
  store i32 7, i32* %buffLive5, align 4, !dbg !436
  %12 = load i32, i32* %retVal, align 4, !dbg !437
  %13 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !438
  %buffer6 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %13, i32 0, i32 1, !dbg !439
  store i32 %12, i32* %buffer6, align 8, !dbg !440
  %14 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !441
  %buffer7 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %14, i32 0, i32 1, !dbg !442
  %15 = load i32, i32* %buffer7, align 8, !dbg !442
  %shr8 = ashr i32 %15, 7, !dbg !443
  %and9 = and i32 %shr8, 1, !dbg !444
  store i32 %and9, i32* %retval, align 4, !dbg !445
  br label %return, !dbg !445

return:                                           ; preds = %if.end, %if.then4, %if.then
  %16 = load i32, i32* %retval, align 4, !dbg !446
  ret i32 %16, !dbg !446
}

declare i32 @bsPutBit(...) #2

declare i32 @bsPutUChar(...) #2

declare i32 @bsPutUInt32(...) #2

declare i32 @bsClose(...) #2

declare i8* @strcpy(i8* noundef, i8* noundef) #2

declare i8* @strrchr(i8* noundef, i32 noundef) #2

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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/ikos_cases/fileread6.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 48, type: !13, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!12 = !DIFile(filename: "src/ikos_cases/fileread6.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{}
!20 = !DILocalVariable(name: "argc", arg: 1, scope: !11, file: !12, line: 48, type: !15)
!21 = !DILocation(line: 48, column: 14, scope: !11)
!22 = !DILocalVariable(name: "argv", arg: 2, scope: !11, file: !12, line: 48, type: !16)
!23 = !DILocation(line: 48, column: 27, scope: !11)
!24 = !DILocalVariable(name: "inFileName", scope: !11, file: !12, line: 49, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 280, elements: !27)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "Char", file: !12, line: 5, baseType: !18)
!27 = !{!28}
!28 = !DISubrange(count: 35)
!29 = !DILocation(line: 49, column: 10, scope: !11)
!30 = !DILocalVariable(name: "bStart", scope: !11, file: !12, line: 50, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 1120, elements: !27)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "Int32", file: !12, line: 3, baseType: !15)
!33 = !DILocation(line: 50, column: 11, scope: !11)
!34 = !DILocalVariable(name: "bEnd", scope: !11, file: !12, line: 51, type: !31)
!35 = !DILocation(line: 51, column: 11, scope: !11)
!36 = !DILocalVariable(name: "inFile", scope: !11, file: !12, line: 52, type: !37)
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
!97 = !DILocation(line: 52, column: 17, scope: !11)
!98 = !DILocalVariable(name: "outFile", scope: !11, file: !12, line: 53, type: !37)
!99 = !DILocation(line: 53, column: 17, scope: !11)
!100 = !DILocalVariable(name: "b", scope: !11, file: !12, line: 54, type: !32)
!101 = !DILocation(line: 54, column: 12, scope: !11)
!102 = !DILocalVariable(name: "bsIn", scope: !11, file: !12, line: 55, type: !103)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "BitStream", file: !12, line: 18, baseType: !105)
!105 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !12, line: 13, size: 192, elements: !106)
!106 = !{!107, !108, !109, !110}
!107 = !DIDerivedType(tag: DW_TAG_member, name: "handle", scope: !105, file: !12, line: 14, baseType: !37, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !105, file: !12, line: 15, baseType: !32, size: 32, offset: 64)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "buffLive", scope: !105, file: !12, line: 16, baseType: !32, size: 32, offset: 96)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !105, file: !12, line: 17, baseType: !26, size: 8, offset: 128)
!111 = !DILocation(line: 55, column: 17, scope: !11)
!112 = !DILocalVariable(name: "bsWr", scope: !11, file: !12, line: 55, type: !103)
!113 = !DILocation(line: 55, column: 24, scope: !11)
!114 = !DILocalVariable(name: "bitsRead", scope: !11, file: !12, line: 56, type: !115)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "UInt32", file: !12, line: 2, baseType: !116)
!116 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!117 = !DILocation(line: 56, column: 17, scope: !11)
!118 = !DILocalVariable(name: "buffHi", scope: !11, file: !12, line: 56, type: !115)
!119 = !DILocation(line: 56, column: 27, scope: !11)
!120 = !DILocalVariable(name: "buffLo", scope: !11, file: !12, line: 56, type: !115)
!121 = !DILocation(line: 56, column: 35, scope: !11)
!122 = !DILocalVariable(name: "blockCRC", scope: !11, file: !12, line: 56, type: !115)
!123 = !DILocation(line: 56, column: 43, scope: !11)
!124 = !DILocalVariable(name: "currBlock", scope: !11, file: !12, line: 56, type: !115)
!125 = !DILocation(line: 56, column: 53, scope: !11)
!126 = !DILocalVariable(name: "str", scope: !11, file: !12, line: 57, type: !127)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 480, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 60)
!130 = !DILocation(line: 57, column: 10, scope: !11)
!131 = !DILocation(line: 59, column: 22, scope: !11)
!132 = !DILocation(line: 59, column: 14, scope: !11)
!133 = !DILocation(line: 59, column: 12, scope: !11)
!134 = !DILocation(line: 60, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !11, file: !12, line: 60, column: 9)
!136 = !DILocation(line: 60, column: 16, scope: !135)
!137 = !DILocation(line: 60, column: 9, scope: !11)
!138 = !DILocation(line: 61, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !12, line: 60, column: 25)
!140 = !DILocation(line: 63, column: 31, scope: !11)
!141 = !DILocation(line: 63, column: 12, scope: !11)
!142 = !DILocation(line: 63, column: 10, scope: !11)
!143 = !DILocation(line: 65, column: 14, scope: !11)
!144 = !DILocation(line: 66, column: 21, scope: !11)
!145 = !DILocation(line: 66, column: 12, scope: !11)
!146 = !DILocation(line: 67, column: 15, scope: !11)
!147 = !DILocation(line: 68, column: 12, scope: !11)
!148 = !DILocation(line: 68, column: 5, scope: !11)
!149 = !DILocation(line: 68, column: 23, scope: !11)
!150 = !DILocation(line: 69, column: 5, scope: !11)
!151 = !DILocation(line: 70, column: 22, scope: !152)
!152 = distinct !DILexicalBlock(scope: !11, file: !12, line: 69, column: 15)
!153 = !DILocation(line: 70, column: 13, scope: !152)
!154 = !DILocation(line: 70, column: 11, scope: !152)
!155 = !DILocation(line: 71, column: 17, scope: !152)
!156 = !DILocation(line: 72, column: 13, scope: !157)
!157 = distinct !DILexicalBlock(scope: !152, file: !12, line: 72, column: 13)
!158 = !DILocation(line: 72, column: 15, scope: !157)
!159 = !DILocation(line: 72, column: 13, scope: !152)
!160 = !DILocation(line: 73, column: 17, scope: !161)
!161 = distinct !DILexicalBlock(scope: !162, file: !12, line: 73, column: 17)
!162 = distinct !DILexicalBlock(scope: !157, file: !12, line: 72, column: 21)
!163 = !DILocation(line: 73, column: 36, scope: !161)
!164 = !DILocation(line: 73, column: 29, scope: !161)
!165 = !DILocation(line: 73, column: 26, scope: !161)
!166 = !DILocation(line: 73, column: 47, scope: !161)
!167 = !DILocation(line: 74, column: 18, scope: !161)
!168 = !DILocation(line: 74, column: 36, scope: !161)
!169 = !DILocation(line: 74, column: 29, scope: !161)
!170 = !DILocation(line: 74, column: 27, scope: !161)
!171 = !DILocation(line: 74, column: 48, scope: !161)
!172 = !DILocation(line: 73, column: 17, scope: !162)
!173 = !DILocation(line: 75, column: 35, scope: !161)
!174 = !DILocation(line: 75, column: 43, scope: !161)
!175 = !DILocation(line: 75, column: 22, scope: !161)
!176 = !DILocation(line: 75, column: 17, scope: !161)
!177 = !DILocation(line: 75, column: 33, scope: !161)
!178 = !DILocation(line: 77, column: 26, scope: !161)
!179 = !DILocation(line: 78, column: 13, scope: !162)
!180 = !DILocation(line: 80, column: 18, scope: !152)
!181 = !DILocation(line: 81, column: 19, scope: !152)
!182 = !DILocation(line: 81, column: 26, scope: !152)
!183 = !DILocation(line: 81, column: 35, scope: !152)
!184 = !DILocation(line: 81, column: 42, scope: !152)
!185 = !DILocation(line: 81, column: 32, scope: !152)
!186 = !DILocation(line: 81, column: 16, scope: !152)
!187 = !DILocation(line: 82, column: 19, scope: !152)
!188 = !DILocation(line: 82, column: 26, scope: !152)
!189 = !DILocation(line: 82, column: 35, scope: !152)
!190 = !DILocation(line: 82, column: 37, scope: !152)
!191 = !DILocation(line: 82, column: 32, scope: !152)
!192 = !DILocation(line: 82, column: 16, scope: !152)
!193 = !DILocation(line: 83, column: 17, scope: !194)
!194 = distinct !DILexicalBlock(scope: !152, file: !12, line: 83, column: 14)
!195 = !DILocation(line: 83, column: 24, scope: !194)
!196 = !DILocation(line: 83, column: 16, scope: !194)
!197 = !DILocation(line: 83, column: 38, scope: !194)
!198 = !DILocation(line: 83, column: 58, scope: !194)
!199 = !DILocation(line: 83, column: 61, scope: !194)
!200 = !DILocation(line: 83, column: 68, scope: !194)
!201 = !DILocation(line: 83, column: 87, scope: !194)
!202 = !DILocation(line: 84, column: 17, scope: !194)
!203 = !DILocation(line: 84, column: 24, scope: !194)
!204 = !DILocation(line: 84, column: 16, scope: !194)
!205 = !DILocation(line: 84, column: 38, scope: !194)
!206 = !DILocation(line: 84, column: 58, scope: !194)
!207 = !DILocation(line: 84, column: 61, scope: !194)
!208 = !DILocation(line: 84, column: 68, scope: !194)
!209 = !DILocation(line: 83, column: 14, scope: !152)
!210 = !DILocation(line: 86, column: 17, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !12, line: 86, column: 17)
!212 = distinct !DILexicalBlock(scope: !194, file: !12, line: 85, column: 9)
!213 = !DILocation(line: 86, column: 26, scope: !211)
!214 = !DILocation(line: 86, column: 17, scope: !212)
!215 = !DILocation(line: 88, column: 35, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !12, line: 87, column: 13)
!217 = !DILocation(line: 88, column: 43, scope: !216)
!218 = !DILocation(line: 88, column: 22, scope: !216)
!219 = !DILocation(line: 88, column: 17, scope: !216)
!220 = !DILocation(line: 88, column: 33, scope: !216)
!221 = !DILocation(line: 89, column: 13, scope: !216)
!222 = !DILocation(line: 90, column: 22, scope: !223)
!223 = distinct !DILexicalBlock(scope: !211, file: !12, line: 89, column: 20)
!224 = !DILocation(line: 90, column: 17, scope: !223)
!225 = !DILocation(line: 90, column: 33, scope: !223)
!226 = !DILocation(line: 92, column: 9, scope: !212)
!227 = distinct !{!227, !150, !228}
!228 = !DILocation(line: 93, column: 5, scope: !11)
!229 = !DILocation(line: 95, column: 5, scope: !11)
!230 = !DILocation(line: 96, column: 22, scope: !231)
!231 = distinct !DILexicalBlock(scope: !11, file: !12, line: 95, column: 15)
!232 = !DILocation(line: 96, column: 13, scope: !231)
!233 = !DILocation(line: 96, column: 11, scope: !231)
!234 = !DILocation(line: 97, column: 13, scope: !235)
!235 = distinct !DILexicalBlock(scope: !231, file: !12, line: 97, column: 13)
!236 = !DILocation(line: 97, column: 15, scope: !235)
!237 = !DILocation(line: 97, column: 13, scope: !231)
!238 = !DILocation(line: 97, column: 21, scope: !235)
!239 = !DILocation(line: 98, column: 19, scope: !231)
!240 = !DILocation(line: 98, column: 26, scope: !231)
!241 = !DILocation(line: 98, column: 35, scope: !231)
!242 = !DILocation(line: 98, column: 42, scope: !231)
!243 = !DILocation(line: 98, column: 32, scope: !231)
!244 = !DILocation(line: 98, column: 16, scope: !231)
!245 = !DILocation(line: 99, column: 19, scope: !231)
!246 = !DILocation(line: 99, column: 26, scope: !231)
!247 = !DILocation(line: 99, column: 35, scope: !231)
!248 = !DILocation(line: 99, column: 37, scope: !231)
!249 = !DILocation(line: 99, column: 32, scope: !231)
!250 = !DILocation(line: 99, column: 16, scope: !231)
!251 = !DILocation(line: 100, column: 13, scope: !252)
!252 = distinct !DILexicalBlock(scope: !231, file: !12, line: 100, column: 13)
!253 = !DILocation(line: 100, column: 37, scope: !252)
!254 = !DILocation(line: 100, column: 30, scope: !252)
!255 = !DILocation(line: 100, column: 28, scope: !252)
!256 = !DILocation(line: 100, column: 22, scope: !252)
!257 = !DILocation(line: 100, column: 13, scope: !231)
!258 = !DILocation(line: 101, column: 25, scope: !252)
!259 = !DILocation(line: 101, column: 32, scope: !252)
!260 = !DILocation(line: 101, column: 42, scope: !252)
!261 = !DILocation(line: 101, column: 49, scope: !252)
!262 = !DILocation(line: 101, column: 39, scope: !252)
!263 = !DILocation(line: 101, column: 22, scope: !252)
!264 = !DILocation(line: 101, column: 13, scope: !252)
!265 = !DILocation(line: 103, column: 13, scope: !266)
!266 = distinct !DILexicalBlock(scope: !231, file: !12, line: 103, column: 13)
!267 = !DILocation(line: 103, column: 21, scope: !266)
!268 = !DILocation(line: 103, column: 29, scope: !266)
!269 = !DILocation(line: 103, column: 32, scope: !266)
!270 = !DILocation(line: 103, column: 51, scope: !266)
!271 = !DILocation(line: 103, column: 44, scope: !266)
!272 = !DILocation(line: 103, column: 41, scope: !266)
!273 = !DILocation(line: 104, column: 13, scope: !266)
!274 = !DILocation(line: 104, column: 16, scope: !266)
!275 = !DILocation(line: 104, column: 33, scope: !266)
!276 = !DILocation(line: 104, column: 28, scope: !266)
!277 = !DILocation(line: 104, column: 25, scope: !266)
!278 = !DILocation(line: 103, column: 13, scope: !231)
!279 = !DILocation(line: 105, column: 22, scope: !280)
!280 = distinct !DILexicalBlock(scope: !266, file: !12, line: 104, column: 45)
!281 = !DILocation(line: 105, column: 28, scope: !280)
!282 = !DILocation(line: 105, column: 13, scope: !280)
!283 = !DILocation(line: 106, column: 9, scope: !280)
!284 = !DILocation(line: 108, column: 17, scope: !231)
!285 = !DILocation(line: 109, column: 13, scope: !286)
!286 = distinct !DILexicalBlock(scope: !231, file: !12, line: 109, column: 13)
!287 = !DILocation(line: 109, column: 30, scope: !286)
!288 = !DILocation(line: 109, column: 25, scope: !286)
!289 = !DILocation(line: 109, column: 40, scope: !286)
!290 = !DILocation(line: 109, column: 22, scope: !286)
!291 = !DILocation(line: 109, column: 13, scope: !231)
!292 = !DILocation(line: 110, column: 17, scope: !293)
!293 = distinct !DILexicalBlock(scope: !294, file: !12, line: 110, column: 17)
!294 = distinct !DILexicalBlock(scope: !286, file: !12, line: 109, column: 44)
!295 = !DILocation(line: 110, column: 25, scope: !293)
!296 = !DILocation(line: 110, column: 17, scope: !294)
!297 = !DILocation(line: 111, column: 30, scope: !298)
!298 = distinct !DILexicalBlock(scope: !293, file: !12, line: 110, column: 34)
!299 = !DILocation(line: 111, column: 17, scope: !298)
!300 = !DILocation(line: 111, column: 57, scope: !298)
!301 = !DILocation(line: 111, column: 44, scope: !298)
!302 = !DILocation(line: 112, column: 30, scope: !298)
!303 = !DILocation(line: 112, column: 17, scope: !298)
!304 = !DILocation(line: 112, column: 57, scope: !298)
!305 = !DILocation(line: 112, column: 44, scope: !298)
!306 = !DILocation(line: 113, column: 30, scope: !298)
!307 = !DILocation(line: 113, column: 17, scope: !298)
!308 = !DILocation(line: 113, column: 57, scope: !298)
!309 = !DILocation(line: 113, column: 44, scope: !298)
!310 = !DILocation(line: 114, column: 31, scope: !298)
!311 = !DILocation(line: 114, column: 37, scope: !298)
!312 = !DILocation(line: 114, column: 17, scope: !298)
!313 = !DILocation(line: 115, column: 27, scope: !298)
!314 = !DILocation(line: 115, column: 17, scope: !298)
!315 = !DILocation(line: 116, column: 13, scope: !298)
!316 = !DILocation(line: 117, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !294, file: !12, line: 117, column: 17)
!318 = !DILocation(line: 117, column: 27, scope: !317)
!319 = !DILocation(line: 117, column: 17, scope: !294)
!320 = !DILocation(line: 117, column: 34, scope: !317)
!321 = !DILocation(line: 118, column: 22, scope: !294)
!322 = !DILocation(line: 119, column: 9, scope: !294)
!323 = !DILocation(line: 120, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !286, file: !12, line: 120, column: 13)
!325 = !DILocation(line: 120, column: 32, scope: !324)
!326 = !DILocation(line: 120, column: 25, scope: !324)
!327 = !DILocation(line: 120, column: 22, scope: !324)
!328 = !DILocation(line: 120, column: 13, scope: !286)
!329 = !DILocalVariable(name: "split", scope: !330, file: !12, line: 123, type: !331)
!330 = distinct !DILexicalBlock(scope: !324, file: !12, line: 120, column: 44)
!331 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!332 = !DILocation(line: 123, column: 19, scope: !330)
!333 = !DILocalVariable(name: "ofs", scope: !330, file: !12, line: 124, type: !32)
!334 = !DILocation(line: 124, column: 19, scope: !330)
!335 = !DILocalVariable(name: "k", scope: !330, file: !12, line: 124, type: !32)
!336 = !DILocation(line: 124, column: 24, scope: !330)
!337 = !DILocation(line: 125, column: 20, scope: !338)
!338 = distinct !DILexicalBlock(scope: !330, file: !12, line: 125, column: 13)
!339 = !DILocation(line: 125, column: 18, scope: !338)
!340 = !DILocation(line: 125, column: 25, scope: !341)
!341 = distinct !DILexicalBlock(scope: !338, file: !12, line: 125, column: 13)
!342 = !DILocation(line: 125, column: 27, scope: !341)
!343 = !DILocation(line: 125, column: 13, scope: !338)
!344 = !DILocation(line: 126, column: 28, scope: !341)
!345 = !DILocation(line: 126, column: 17, scope: !341)
!346 = !DILocation(line: 126, column: 31, scope: !341)
!347 = !DILocation(line: 125, column: 34, scope: !341)
!348 = !DILocation(line: 125, column: 13, scope: !341)
!349 = distinct !{!349, !343, !350, !351}
!350 = !DILocation(line: 126, column: 33, scope: !338)
!351 = !{!"llvm.loop.mustprogress"}
!352 = !DILocation(line: 127, column: 20, scope: !330)
!353 = !DILocation(line: 127, column: 32, scope: !330)
!354 = !DILocation(line: 127, column: 13, scope: !330)
!355 = !DILocation(line: 128, column: 29, scope: !330)
!356 = !DILocation(line: 128, column: 21, scope: !330)
!357 = !DILocation(line: 128, column: 19, scope: !330)
!358 = !DILocation(line: 129, column: 17, scope: !359)
!359 = distinct !DILexicalBlock(scope: !330, file: !12, line: 129, column: 17)
!360 = !DILocation(line: 129, column: 23, scope: !359)
!361 = !DILocation(line: 129, column: 17, scope: !330)
!362 = !DILocation(line: 130, column: 25, scope: !363)
!363 = distinct !DILexicalBlock(scope: !359, file: !12, line: 129, column: 32)
!364 = !DILocation(line: 130, column: 23, scope: !363)
!365 = !DILocation(line: 131, column: 13, scope: !363)
!366 = !DILocation(line: 132, column: 17, scope: !367)
!367 = distinct !DILexicalBlock(scope: !359, file: !12, line: 131, column: 20)
!368 = !DILocation(line: 134, column: 9, scope: !330)
!369 = distinct !{!369, !229, !370}
!370 = !DILocation(line: 135, column: 5, scope: !11)
!371 = !DILocation(line: 136, column: 5, scope: !11)
!372 = !DILocation(line: 137, column: 1, scope: !11)
!373 = distinct !DISubprogram(name: "bsOpenReadStream", scope: !12, file: !12, line: 20, type: !374, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!374 = !DISubroutineType(types: !375)
!375 = !{!103, !37}
!376 = !DILocalVariable(name: "stream", arg: 1, scope: !373, file: !12, line: 20, type: !37)
!377 = !DILocation(line: 20, column: 44, scope: !373)
!378 = !DILocalVariable(name: "bs", scope: !373, file: !12, line: 22, type: !103)
!379 = !DILocation(line: 22, column: 16, scope: !373)
!380 = !DILocation(line: 22, column: 21, scope: !373)
!381 = !DILocation(line: 23, column: 9, scope: !382)
!382 = distinct !DILexicalBlock(scope: !373, file: !12, line: 23, column: 9)
!383 = !DILocation(line: 23, column: 12, scope: !382)
!384 = !DILocation(line: 23, column: 9, scope: !373)
!385 = !DILocation(line: 23, column: 21, scope: !382)
!386 = !DILocation(line: 24, column: 18, scope: !373)
!387 = !DILocation(line: 24, column: 5, scope: !373)
!388 = !DILocation(line: 24, column: 9, scope: !373)
!389 = !DILocation(line: 24, column: 16, scope: !373)
!390 = !DILocation(line: 25, column: 5, scope: !373)
!391 = !DILocation(line: 25, column: 9, scope: !373)
!392 = !DILocation(line: 25, column: 16, scope: !373)
!393 = !DILocation(line: 26, column: 5, scope: !373)
!394 = !DILocation(line: 26, column: 9, scope: !373)
!395 = !DILocation(line: 26, column: 18, scope: !373)
!396 = !DILocation(line: 27, column: 5, scope: !373)
!397 = !DILocation(line: 27, column: 9, scope: !373)
!398 = !DILocation(line: 27, column: 14, scope: !373)
!399 = !DILocation(line: 28, column: 12, scope: !373)
!400 = !DILocation(line: 28, column: 5, scope: !373)
!401 = distinct !DISubprogram(name: "bsGetBit", scope: !12, file: !12, line: 31, type: !402, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!402 = !DISubroutineType(types: !403)
!403 = !{!32, !103}
!404 = !DILocalVariable(name: "bs", arg: 1, scope: !401, file: !12, line: 31, type: !103)
!405 = !DILocation(line: 31, column: 36, scope: !401)
!406 = !DILocation(line: 33, column: 9, scope: !407)
!407 = distinct !DILexicalBlock(scope: !401, file: !12, line: 33, column: 9)
!408 = !DILocation(line: 33, column: 13, scope: !407)
!409 = !DILocation(line: 33, column: 22, scope: !407)
!410 = !DILocation(line: 33, column: 9, scope: !401)
!411 = !DILocation(line: 34, column: 9, scope: !412)
!412 = distinct !DILexicalBlock(scope: !407, file: !12, line: 33, column: 27)
!413 = !DILocation(line: 34, column: 13, scope: !412)
!414 = !DILocation(line: 34, column: 22, scope: !412)
!415 = !DILocation(line: 35, column: 20, scope: !412)
!416 = !DILocation(line: 35, column: 24, scope: !412)
!417 = !DILocation(line: 35, column: 36, scope: !412)
!418 = !DILocation(line: 35, column: 40, scope: !412)
!419 = !DILocation(line: 35, column: 32, scope: !412)
!420 = !DILocation(line: 35, column: 51, scope: !412)
!421 = !DILocation(line: 35, column: 9, scope: !412)
!422 = !DILocalVariable(name: "retVal", scope: !423, file: !12, line: 37, type: !32)
!423 = distinct !DILexicalBlock(scope: !407, file: !12, line: 36, column: 12)
!424 = !DILocation(line: 37, column: 15, scope: !423)
!425 = !DILocation(line: 37, column: 31, scope: !423)
!426 = !DILocation(line: 37, column: 35, scope: !423)
!427 = !DILocation(line: 37, column: 24, scope: !423)
!428 = !DILocation(line: 38, column: 14, scope: !429)
!429 = distinct !DILexicalBlock(scope: !423, file: !12, line: 38, column: 14)
!430 = !DILocation(line: 38, column: 21, scope: !429)
!431 = !DILocation(line: 38, column: 14, scope: !423)
!432 = !DILocation(line: 39, column: 13, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !12, line: 38, column: 30)
!434 = !DILocation(line: 41, column: 9, scope: !423)
!435 = !DILocation(line: 41, column: 13, scope: !423)
!436 = !DILocation(line: 41, column: 22, scope: !423)
!437 = !DILocation(line: 42, column: 22, scope: !423)
!438 = !DILocation(line: 42, column: 9, scope: !423)
!439 = !DILocation(line: 42, column: 13, scope: !423)
!440 = !DILocation(line: 42, column: 20, scope: !423)
!441 = !DILocation(line: 43, column: 20, scope: !423)
!442 = !DILocation(line: 43, column: 24, scope: !423)
!443 = !DILocation(line: 43, column: 32, scope: !423)
!444 = !DILocation(line: 43, column: 38, scope: !423)
!445 = !DILocation(line: 43, column: 9, scope: !423)
!446 = !DILocation(line: 45, column: 1, scope: !401)
