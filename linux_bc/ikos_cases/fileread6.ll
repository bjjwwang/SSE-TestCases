; ModuleID = 'linux_bc/ikos_cases/fileread6.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/ikos_cases/fileread6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.BitStream = type { %struct._IO_FILE*, i32, i32, i8 }

@.str = private unnamed_addr constant [3 x i8] c"rb\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %inFileName = alloca [35 x i8], align 16
  %bStart = alloca [35 x i32], align 16
  %bEnd = alloca [35 x i32], align 16
  %inFile = alloca %struct._IO_FILE*, align 8
  %outFile = alloca %struct._IO_FILE*, align 8
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [35 x i8]* %inFileName, metadata !23, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [35 x i32]* %bStart, metadata !29, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [35 x i32]* %bEnd, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %inFile, metadata !35, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %outFile, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i32* %b, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bsIn, metadata !100, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bsWr, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i32* %bitsRead, metadata !112, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %buffHi, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %buffLo, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32* %blockCRC, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %currBlock, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [60 x i8]* %str, metadata !124, metadata !DIExpression()), !dbg !128
  %arraydecay = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !129
  %call = call %struct._IO_FILE* @fopen(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !130
  store %struct._IO_FILE* %call, %struct._IO_FILE** %inFile, align 8, !dbg !131
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8, !dbg !132
  %cmp = icmp eq %struct._IO_FILE* %0, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #4, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8, !dbg !138
  %call1 = call %struct.BitStream* @bsOpenReadStream(%struct._IO_FILE* %1), !dbg !139
  store %struct.BitStream* %call1, %struct.BitStream** %bsIn, align 8, !dbg !140
  store i32 0, i32* %bitsRead, align 4, !dbg !141
  store i32 0, i32* %buffLo, align 4, !dbg !142
  store i32 0, i32* %buffHi, align 4, !dbg !143
  store i32 0, i32* %currBlock, align 4, !dbg !144
  %2 = load i32, i32* %currBlock, align 4, !dbg !145
  %idxprom = zext i32 %2 to i64, !dbg !146
  %arrayidx = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  br label %while.body, !dbg !148

while.body:                                       ; preds = %if.end46, %if.end
  %3 = load %struct.BitStream*, %struct.BitStream** %bsIn, align 8, !dbg !149
  %call2 = call i32 @bsGetBit(%struct.BitStream* %3), !dbg !151
  store i32 %call2, i32* %b, align 4, !dbg !152
  %4 = load i32, i32* %bitsRead, align 4, !dbg !153
  %inc = add i32 %4, 1, !dbg !153
  store i32 %inc, i32* %bitsRead, align 4, !dbg !153
  %5 = load i32, i32* %b, align 4, !dbg !154
  %cmp3 = icmp eq i32 %5, 2, !dbg !156
  br i1 %cmp3, label %if.then4, label %if.end16, !dbg !157

if.then4:                                         ; preds = %while.body
  %6 = load i32, i32* %bitsRead, align 4, !dbg !158
  %7 = load i32, i32* %currBlock, align 4, !dbg !161
  %idxprom5 = zext i32 %7 to i64, !dbg !162
  %arrayidx6 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom5, !dbg !162
  %8 = load i32, i32* %arrayidx6, align 4, !dbg !162
  %cmp7 = icmp uge i32 %6, %8, !dbg !163
  br i1 %cmp7, label %land.lhs.true, label %if.else, !dbg !164

land.lhs.true:                                    ; preds = %if.then4
  %9 = load i32, i32* %bitsRead, align 4, !dbg !165
  %10 = load i32, i32* %currBlock, align 4, !dbg !166
  %idxprom8 = zext i32 %10 to i64, !dbg !167
  %arrayidx9 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom8, !dbg !167
  %11 = load i32, i32* %arrayidx9, align 4, !dbg !167
  %sub = sub i32 %9, %11, !dbg !168
  %cmp10 = icmp uge i32 %sub, 40, !dbg !169
  br i1 %cmp10, label %if.then11, label %if.else, !dbg !170

if.then11:                                        ; preds = %land.lhs.true
  %12 = load i32, i32* %bitsRead, align 4, !dbg !171
  %sub12 = sub i32 %12, 1, !dbg !172
  %13 = load i32, i32* %currBlock, align 4, !dbg !173
  %idxprom13 = zext i32 %13 to i64, !dbg !174
  %arrayidx14 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom13, !dbg !174
  store i32 %sub12, i32* %arrayidx14, align 4, !dbg !175
  br label %if.end15, !dbg !174

if.else:                                          ; preds = %land.lhs.true, %if.then4
  %14 = load i32, i32* %currBlock, align 4, !dbg !176
  %dec = add i32 %14, -1, !dbg !176
  store i32 %dec, i32* %currBlock, align 4, !dbg !176
  br label %if.end15

if.end15:                                         ; preds = %if.else, %if.then11
  br label %while.end, !dbg !177

if.end16:                                         ; preds = %while.body
  %15 = load i32, i32* %currBlock, align 4, !dbg !178
  %inc17 = add i32 %15, 1, !dbg !178
  store i32 %inc17, i32* %currBlock, align 4, !dbg !178
  %16 = load i32, i32* %buffHi, align 4, !dbg !179
  %shl = shl i32 %16, 1, !dbg !180
  %17 = load i32, i32* %buffLo, align 4, !dbg !181
  %shr = lshr i32 %17, 31, !dbg !182
  %or = or i32 %shl, %shr, !dbg !183
  store i32 %or, i32* %buffHi, align 4, !dbg !184
  %18 = load i32, i32* %buffLo, align 4, !dbg !185
  %shl18 = shl i32 %18, 1, !dbg !186
  %19 = load i32, i32* %b, align 4, !dbg !187
  %and = and i32 %19, 1, !dbg !188
  %or19 = or i32 %shl18, %and, !dbg !189
  store i32 %or19, i32* %buffLo, align 4, !dbg !190
  %20 = load i32, i32* %buffHi, align 4, !dbg !191
  %and20 = and i32 %20, 65535, !dbg !193
  %conv = zext i32 %and20 to i64, !dbg !194
  %cmp21 = icmp eq i64 %conv, 12609, !dbg !195
  br i1 %cmp21, label %land.lhs.true23, label %lor.lhs.false, !dbg !196

land.lhs.true23:                                  ; preds = %if.end16
  %21 = load i32, i32* %buffLo, align 4, !dbg !197
  %conv24 = zext i32 %21 to i64, !dbg !197
  %cmp25 = icmp eq i64 %conv24, 1495683929, !dbg !198
  br i1 %cmp25, label %if.then35, label %lor.lhs.false, !dbg !199

lor.lhs.false:                                    ; preds = %land.lhs.true23, %if.end16
  %22 = load i32, i32* %buffHi, align 4, !dbg !200
  %and27 = and i32 %22, 65535, !dbg !201
  %conv28 = zext i32 %and27 to i64, !dbg !202
  %cmp29 = icmp eq i64 %conv28, 6002, !dbg !203
  br i1 %cmp29, label %land.lhs.true31, label %if.end46, !dbg !204

land.lhs.true31:                                  ; preds = %lor.lhs.false
  %23 = load i32, i32* %buffLo, align 4, !dbg !205
  %conv32 = zext i32 %23 to i64, !dbg !205
  %cmp33 = icmp eq i64 %conv32, 1161318544, !dbg !206
  br i1 %cmp33, label %if.then35, label %if.end46, !dbg !207

if.then35:                                        ; preds = %land.lhs.true31, %land.lhs.true23
  %24 = load i32, i32* %bitsRead, align 4, !dbg !208
  %cmp36 = icmp ult i32 %24, -1000, !dbg !211
  br i1 %cmp36, label %if.then38, label %if.else42, !dbg !212

if.then38:                                        ; preds = %if.then35
  %25 = load i32, i32* %bitsRead, align 4, !dbg !213
  %sub39 = sub i32 %25, 49, !dbg !215
  %26 = load i32, i32* %currBlock, align 4, !dbg !216
  %idxprom40 = zext i32 %26 to i64, !dbg !217
  %arrayidx41 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom40, !dbg !217
  store i32 %sub39, i32* %arrayidx41, align 4, !dbg !218
  br label %if.end45, !dbg !219

if.else42:                                        ; preds = %if.then35
  %27 = load i32, i32* %currBlock, align 4, !dbg !220
  %idxprom43 = zext i32 %27 to i64, !dbg !222
  %arrayidx44 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom43, !dbg !222
  store i32 0, i32* %arrayidx44, align 4, !dbg !223
  br label %if.end45

if.end45:                                         ; preds = %if.else42, %if.then38
  br label %if.end46, !dbg !224

if.end46:                                         ; preds = %if.end45, %land.lhs.true31, %lor.lhs.false
  br label %while.body, !dbg !148, !llvm.loop !225

while.end:                                        ; preds = %if.end15
  br label %while.body47, !dbg !227

while.body47:                                     ; preds = %if.end130, %while.end
  %28 = load %struct.BitStream*, %struct.BitStream** %bsIn, align 8, !dbg !228
  %call48 = call i32 @bsGetBit(%struct.BitStream* %28), !dbg !230
  store i32 %call48, i32* %b, align 4, !dbg !231
  %29 = load i32, i32* %b, align 4, !dbg !232
  %cmp49 = icmp eq i32 %29, 2, !dbg !234
  br i1 %cmp49, label %if.then51, label %if.end52, !dbg !235

if.then51:                                        ; preds = %while.body47
  br label %while.end131, !dbg !236

if.end52:                                         ; preds = %while.body47
  %30 = load i32, i32* %buffHi, align 4, !dbg !237
  %shl53 = shl i32 %30, 1, !dbg !238
  %31 = load i32, i32* %buffLo, align 4, !dbg !239
  %shr54 = lshr i32 %31, 31, !dbg !240
  %or55 = or i32 %shl53, %shr54, !dbg !241
  store i32 %or55, i32* %buffHi, align 4, !dbg !242
  %32 = load i32, i32* %buffLo, align 4, !dbg !243
  %shl56 = shl i32 %32, 1, !dbg !244
  %33 = load i32, i32* %b, align 4, !dbg !245
  %and57 = and i32 %33, 1, !dbg !246
  %or58 = or i32 %shl56, %and57, !dbg !247
  store i32 %or58, i32* %buffLo, align 4, !dbg !248
  %34 = load i32, i32* %bitsRead, align 4, !dbg !249
  %35 = load i32, i32* %currBlock, align 4, !dbg !251
  %idxprom59 = zext i32 %35 to i64, !dbg !252
  %arrayidx60 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom59, !dbg !252
  %36 = load i32, i32* %arrayidx60, align 4, !dbg !252
  %add = add nsw i32 47, %36, !dbg !253
  %cmp61 = icmp eq i32 %34, %add, !dbg !254
  br i1 %cmp61, label %if.then63, label %if.end67, !dbg !255

if.then63:                                        ; preds = %if.end52
  %37 = load i32, i32* %buffHi, align 4, !dbg !256
  %shl64 = shl i32 %37, 16, !dbg !257
  %38 = load i32, i32* %buffLo, align 4, !dbg !258
  %shr65 = lshr i32 %38, 16, !dbg !259
  %or66 = or i32 %shl64, %shr65, !dbg !260
  store i32 %or66, i32* %blockCRC, align 4, !dbg !261
  br label %if.end67, !dbg !262

if.end67:                                         ; preds = %if.then63, %if.end52
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** %outFile, align 8, !dbg !263
  %cmp68 = icmp ne %struct._IO_FILE* %39, null, !dbg !265
  br i1 %cmp68, label %land.lhs.true70, label %if.end82, !dbg !266

land.lhs.true70:                                  ; preds = %if.end67
  %40 = load i32, i32* %bitsRead, align 4, !dbg !267
  %41 = load i32, i32* %currBlock, align 4, !dbg !268
  %idxprom71 = zext i32 %41 to i64, !dbg !269
  %arrayidx72 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom71, !dbg !269
  %42 = load i32, i32* %arrayidx72, align 4, !dbg !269
  %cmp73 = icmp uge i32 %40, %42, !dbg !270
  br i1 %cmp73, label %land.lhs.true75, label %if.end82, !dbg !271

land.lhs.true75:                                  ; preds = %land.lhs.true70
  %43 = load i32, i32* %bitsRead, align 4, !dbg !272
  %44 = load i32, i32* %currBlock, align 4, !dbg !273
  %idxprom76 = zext i32 %44 to i64, !dbg !274
  %arrayidx77 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom76, !dbg !274
  %45 = load i32, i32* %arrayidx77, align 4, !dbg !274
  %cmp78 = icmp ule i32 %43, %45, !dbg !275
  br i1 %cmp78, label %if.then80, label %if.end82, !dbg !276

if.then80:                                        ; preds = %land.lhs.true75
  %46 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !277
  %47 = load i32, i32* %b, align 4, !dbg !279
  %call81 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutBit to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* %46, i32 %47), !dbg !280
  br label %if.end82, !dbg !281

if.end82:                                         ; preds = %if.then80, %land.lhs.true75, %land.lhs.true70, %if.end67
  %48 = load i32, i32* %bitsRead, align 4, !dbg !282
  %inc83 = add i32 %48, 1, !dbg !282
  store i32 %inc83, i32* %bitsRead, align 4, !dbg !282
  %49 = load i32, i32* %bitsRead, align 4, !dbg !283
  %50 = load i32, i32* %currBlock, align 4, !dbg !285
  %idxprom84 = zext i32 %50 to i64, !dbg !286
  %arrayidx85 = getelementptr inbounds [35 x i32], [35 x i32]* %bEnd, i64 0, i64 %idxprom84, !dbg !286
  %51 = load i32, i32* %arrayidx85, align 4, !dbg !286
  %add86 = add nsw i32 %51, 1, !dbg !287
  %cmp87 = icmp eq i32 %49, %add86, !dbg !288
  br i1 %cmp87, label %if.then89, label %if.else107, !dbg !289

if.then89:                                        ; preds = %if.end82
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** %outFile, align 8, !dbg !290
  %cmp90 = icmp ne %struct._IO_FILE* %52, null, !dbg !293
  br i1 %cmp90, label %if.then92, label %if.end101, !dbg !294

if.then92:                                        ; preds = %if.then89
  %53 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !295
  %call93 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* %53, i32 23), !dbg !297
  %54 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !298
  %call94 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* %54, i32 114), !dbg !299
  %55 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !300
  %call95 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* %55, i32 69), !dbg !301
  %56 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !302
  %call96 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* %56, i32 56), !dbg !303
  %57 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !304
  %call97 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* %57, i32 80), !dbg !305
  %58 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !306
  %call98 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUChar to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* %58, i32 144), !dbg !307
  %59 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !308
  %60 = load i32, i32* %blockCRC, align 4, !dbg !309
  %call99 = call i32 (%struct.BitStream*, i32, ...) bitcast (i32 (...)* @bsPutUInt32 to i32 (%struct.BitStream*, i32, ...)*)(%struct.BitStream* %59, i32 %60), !dbg !310
  %61 = load %struct.BitStream*, %struct.BitStream** %bsWr, align 8, !dbg !311
  %call100 = call i32 (%struct.BitStream*, ...) bitcast (i32 (...)* @bsClose to i32 (%struct.BitStream*, ...)*)(%struct.BitStream* %61), !dbg !312
  br label %if.end101, !dbg !313

if.end101:                                        ; preds = %if.then92, %if.then89
  %62 = load i32, i32* %currBlock, align 4, !dbg !314
  %cmp102 = icmp uge i32 %62, 30, !dbg !316
  br i1 %cmp102, label %if.then104, label %if.end105, !dbg !317

if.then104:                                       ; preds = %if.end101
  br label %while.end131, !dbg !318

if.end105:                                        ; preds = %if.end101
  %63 = load i32, i32* %currBlock, align 4, !dbg !319
  %inc106 = add i32 %63, 1, !dbg !319
  store i32 %inc106, i32* %currBlock, align 4, !dbg !319
  br label %if.end130, !dbg !320

if.else107:                                       ; preds = %if.end82
  %64 = load i32, i32* %bitsRead, align 4, !dbg !321
  %65 = load i32, i32* %currBlock, align 4, !dbg !323
  %idxprom108 = zext i32 %65 to i64, !dbg !324
  %arrayidx109 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom108, !dbg !324
  %66 = load i32, i32* %arrayidx109, align 4, !dbg !324
  %cmp110 = icmp eq i32 %64, %66, !dbg !325
  br i1 %cmp110, label %if.then112, label %if.end129, !dbg !326

if.then112:                                       ; preds = %if.else107
  call void @llvm.dbg.declare(metadata i8** %split, metadata !327, metadata !DIExpression()), !dbg !330
  call void @llvm.dbg.declare(metadata i32* %ofs, metadata !331, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata i32* %k, metadata !333, metadata !DIExpression()), !dbg !334
  store i32 0, i32* %k, align 4, !dbg !335
  br label %for.cond, !dbg !337

for.cond:                                         ; preds = %for.inc, %if.then112
  %67 = load i32, i32* %k, align 4, !dbg !338
  %cmp113 = icmp slt i32 %67, 50, !dbg !340
  br i1 %cmp113, label %for.body, label %for.end, !dbg !341

for.body:                                         ; preds = %for.cond
  %68 = load i32, i32* %k, align 4, !dbg !342
  %idxprom115 = sext i32 %68 to i64, !dbg !343
  %arrayidx116 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 %idxprom115, !dbg !343
  store i8 0, i8* %arrayidx116, align 1, !dbg !344
  br label %for.inc, !dbg !343

for.inc:                                          ; preds = %for.body
  %69 = load i32, i32* %k, align 4, !dbg !345
  %inc117 = add nsw i32 %69, 1, !dbg !345
  store i32 %inc117, i32* %k, align 4, !dbg !345
  br label %for.cond, !dbg !346, !llvm.loop !347

for.end:                                          ; preds = %for.cond
  %arraydecay118 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !350
  %arraydecay119 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !351
  %call120 = call i8* @strcpy(i8* %arraydecay118, i8* %arraydecay119), !dbg !352
  %arraydecay121 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !353
  %call122 = call i8* @strrchr(i8* %arraydecay121, i32 40), !dbg !354
  store i8* %call122, i8** %split, align 8, !dbg !355
  %70 = load i8*, i8** %split, align 8, !dbg !356
  %cmp123 = icmp eq i8* %70, null, !dbg !358
  br i1 %cmp123, label %if.then125, label %if.else127, !dbg !359

if.then125:                                       ; preds = %for.end
  %arraydecay126 = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !360
  store i8* %arraydecay126, i8** %split, align 8, !dbg !362
  br label %if.end128, !dbg !363

if.else127:                                       ; preds = %for.end
  %71 = load i8*, i8** %split, align 8, !dbg !364
  %incdec.ptr = getelementptr inbounds i8, i8* %71, i32 1, !dbg !364
  store i8* %incdec.ptr, i8** %split, align 8, !dbg !364
  br label %if.end128

if.end128:                                        ; preds = %if.else127, %if.then125
  br label %if.end129, !dbg !366

if.end129:                                        ; preds = %if.end128, %if.else107
  br label %if.end130

if.end130:                                        ; preds = %if.end129, %if.end105
  br label %while.body47, !dbg !227, !llvm.loop !367

while.end131:                                     ; preds = %if.then104, %if.then51
  %call132 = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 1), !dbg !369
  %72 = load i32, i32* %retval, align 4, !dbg !370
  ret i32 %72, !dbg !370
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: noreturn
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.BitStream* @bsOpenReadStream(%struct._IO_FILE* %stream) #0 !dbg !371 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 8
  %bs = alloca %struct.BitStream*, align 8
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %stream.addr, metadata !374, metadata !DIExpression()), !dbg !375
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs, metadata !376, metadata !DIExpression()), !dbg !377
  %call = call align 16 i8* @malloc(i64 24), !dbg !378
  %0 = bitcast i8* %call to %struct.BitStream*, !dbg !378
  store %struct.BitStream* %0, %struct.BitStream** %bs, align 8, !dbg !377
  %1 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !379
  %cmp = icmp eq %struct.BitStream* %1, null, !dbg !381
  br i1 %cmp, label %if.then, label %if.end, !dbg !382

if.then:                                          ; preds = %entry
  %call1 = call i32 (i64, ...) bitcast (i32 (...)* @mallocFail to i32 (i64, ...)*)(i64 24), !dbg !383
  br label %if.end, !dbg !383

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 8, !dbg !384
  %3 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !385
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %3, i32 0, i32 0, !dbg !386
  store %struct._IO_FILE* %2, %struct._IO_FILE** %handle, align 8, !dbg !387
  %4 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !388
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !389
  store i32 0, i32* %buffer, align 8, !dbg !390
  %5 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !391
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %5, i32 0, i32 2, !dbg !392
  store i32 0, i32* %buffLive, align 4, !dbg !393
  %6 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !394
  %mode = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 3, !dbg !395
  store i8 114, i8* %mode, align 8, !dbg !396
  %7 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !397
  ret %struct.BitStream* %7, !dbg !398
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @bsGetBit(%struct.BitStream* %bs) #0 !dbg !399 {
entry:
  %retval = alloca i32, align 4
  %bs.addr = alloca %struct.BitStream*, align 8
  %retVal = alloca i32, align 4
  store %struct.BitStream* %bs, %struct.BitStream** %bs.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs.addr, metadata !402, metadata !DIExpression()), !dbg !403
  %0 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !404
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %0, i32 0, i32 2, !dbg !406
  %1 = load i32, i32* %buffLive, align 4, !dbg !406
  %cmp = icmp sgt i32 %1, 0, !dbg !407
  br i1 %cmp, label %if.then, label %if.else, !dbg !408

if.then:                                          ; preds = %entry
  %2 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !409
  %buffLive1 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %2, i32 0, i32 2, !dbg !411
  %3 = load i32, i32* %buffLive1, align 4, !dbg !412
  %dec = add nsw i32 %3, -1, !dbg !412
  store i32 %dec, i32* %buffLive1, align 4, !dbg !412
  %4 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !413
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !414
  %5 = load i32, i32* %buffer, align 8, !dbg !414
  %6 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !415
  %buffLive2 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 2, !dbg !416
  %7 = load i32, i32* %buffLive2, align 4, !dbg !416
  %shr = ashr i32 %5, %7, !dbg !417
  %and = and i32 %shr, 1, !dbg !418
  store i32 %and, i32* %retval, align 4, !dbg !419
  br label %return, !dbg !419

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %retVal, metadata !420, metadata !DIExpression()), !dbg !422
  %8 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !423
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %8, i32 0, i32 0, !dbg !424
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %handle, align 8, !dbg !424
  %call = call i32 @getc(%struct._IO_FILE* %9), !dbg !425
  store i32 %call, i32* %retVal, align 4, !dbg !422
  %10 = load i32, i32* %retVal, align 4, !dbg !426
  %cmp3 = icmp eq i32 %10, -1, !dbg !428
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !429

if.then4:                                         ; preds = %if.else
  store i32 10000, i32* %retval, align 4, !dbg !430
  br label %return, !dbg !430

if.end:                                           ; preds = %if.else
  %11 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !432
  %buffLive5 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %11, i32 0, i32 2, !dbg !433
  store i32 7, i32* %buffLive5, align 4, !dbg !434
  %12 = load i32, i32* %retVal, align 4, !dbg !435
  %13 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !436
  %buffer6 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %13, i32 0, i32 1, !dbg !437
  store i32 %12, i32* %buffer6, align 8, !dbg !438
  %14 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !439
  %buffer7 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %14, i32 0, i32 1, !dbg !440
  %15 = load i32, i32* %buffer7, align 8, !dbg !440
  %shr8 = ashr i32 %15, 7, !dbg !441
  %and9 = and i32 %shr8, 1, !dbg !442
  store i32 %and9, i32* %retval, align 4, !dbg !443
  br label %return, !dbg !443

return:                                           ; preds = %if.end, %if.then4, %if.then
  %16 = load i32, i32* %retval, align 4, !dbg !444
  ret i32 %16, !dbg !444
}

declare dso_local i32 @bsPutBit(...) #2

declare dso_local i32 @bsPutUChar(...) #2

declare dso_local i32 @bsPutUInt32(...) #2

declare dso_local i32 @bsClose(...) #2

declare dso_local i8* @strcpy(i8*, i8*) #2

declare dso_local i8* @strrchr(i8*, i32) #2

declare dso_local i32 @svf_assert(...) #2

declare dso_local align 16 i8* @malloc(i64) #2

declare dso_local i32 @mallocFail(...) #2

declare dso_local i32 @getc(%struct._IO_FILE*) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/ikos_cases/fileread6.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 48, type: !13, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/ikos_cases/fileread6.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "argc", arg: 1, scope: !11, file: !12, line: 48, type: !15)
!20 = !DILocation(line: 48, column: 14, scope: !11)
!21 = !DILocalVariable(name: "argv", arg: 2, scope: !11, file: !12, line: 48, type: !16)
!22 = !DILocation(line: 48, column: 27, scope: !11)
!23 = !DILocalVariable(name: "inFileName", scope: !11, file: !12, line: 49, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 280, elements: !26)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "Char", file: !12, line: 5, baseType: !18)
!26 = !{!27}
!27 = !DISubrange(count: 35)
!28 = !DILocation(line: 49, column: 10, scope: !11)
!29 = !DILocalVariable(name: "bStart", scope: !11, file: !12, line: 50, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 1120, elements: !26)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "Int32", file: !12, line: 3, baseType: !15)
!32 = !DILocation(line: 50, column: 11, scope: !11)
!33 = !DILocalVariable(name: "bEnd", scope: !11, file: !12, line: 51, type: !30)
!34 = !DILocation(line: 51, column: 11, scope: !11)
!35 = !DILocalVariable(name: "inFile", scope: !11, file: !12, line: 52, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !38, line: 7, baseType: !39)
!38 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!39 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !40, line: 49, size: 1728, elements: !41)
!40 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!41 = !{!42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !57, !59, !60, !61, !65, !67, !69, !73, !76, !78, !81, !84, !85, !86, !90, !91}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !39, file: !40, line: 51, baseType: !15, size: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !39, file: !40, line: 54, baseType: !17, size: 64, offset: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !39, file: !40, line: 55, baseType: !17, size: 64, offset: 128)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !39, file: !40, line: 56, baseType: !17, size: 64, offset: 192)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !39, file: !40, line: 57, baseType: !17, size: 64, offset: 256)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !39, file: !40, line: 58, baseType: !17, size: 64, offset: 320)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !39, file: !40, line: 59, baseType: !17, size: 64, offset: 384)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !39, file: !40, line: 60, baseType: !17, size: 64, offset: 448)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !39, file: !40, line: 61, baseType: !17, size: 64, offset: 512)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !39, file: !40, line: 64, baseType: !17, size: 64, offset: 576)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !39, file: !40, line: 65, baseType: !17, size: 64, offset: 640)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !39, file: !40, line: 66, baseType: !17, size: 64, offset: 704)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !39, file: !40, line: 68, baseType: !55, size: 64, offset: 768)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !40, line: 36, flags: DIFlagFwdDecl)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !39, file: !40, line: 70, baseType: !58, size: 64, offset: 832)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !39, file: !40, line: 72, baseType: !15, size: 32, offset: 896)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !39, file: !40, line: 73, baseType: !15, size: 32, offset: 928)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !39, file: !40, line: 74, baseType: !62, size: 64, offset: 960)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !63, line: 152, baseType: !64)
!63 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!64 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !39, file: !40, line: 77, baseType: !66, size: 16, offset: 1024)
!66 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !39, file: !40, line: 78, baseType: !68, size: 8, offset: 1040)
!68 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !39, file: !40, line: 79, baseType: !70, size: 8, offset: 1048)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 8, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 1)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !39, file: !40, line: 81, baseType: !74, size: 64, offset: 1088)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !40, line: 43, baseType: null)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !39, file: !40, line: 89, baseType: !77, size: 64, offset: 1152)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !63, line: 153, baseType: !64)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !39, file: !40, line: 91, baseType: !79, size: 64, offset: 1216)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !80, size: 64)
!80 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !40, line: 37, flags: DIFlagFwdDecl)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !39, file: !40, line: 92, baseType: !82, size: 64, offset: 1280)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !40, line: 38, flags: DIFlagFwdDecl)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !39, file: !40, line: 93, baseType: !58, size: 64, offset: 1344)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !39, file: !40, line: 94, baseType: !4, size: 64, offset: 1408)
!86 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !39, file: !40, line: 95, baseType: !87, size: 64, offset: 1472)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !88, line: 46, baseType: !89)
!88 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!89 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !39, file: !40, line: 96, baseType: !15, size: 32, offset: 1536)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !39, file: !40, line: 98, baseType: !92, size: 160, offset: 1568)
!92 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !93)
!93 = !{!94}
!94 = !DISubrange(count: 20)
!95 = !DILocation(line: 52, column: 17, scope: !11)
!96 = !DILocalVariable(name: "outFile", scope: !11, file: !12, line: 53, type: !36)
!97 = !DILocation(line: 53, column: 17, scope: !11)
!98 = !DILocalVariable(name: "b", scope: !11, file: !12, line: 54, type: !31)
!99 = !DILocation(line: 54, column: 12, scope: !11)
!100 = !DILocalVariable(name: "bsIn", scope: !11, file: !12, line: 55, type: !101)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "BitStream", file: !12, line: 18, baseType: !103)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !12, line: 13, size: 192, elements: !104)
!104 = !{!105, !106, !107, !108}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "handle", scope: !103, file: !12, line: 14, baseType: !36, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !103, file: !12, line: 15, baseType: !31, size: 32, offset: 64)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "buffLive", scope: !103, file: !12, line: 16, baseType: !31, size: 32, offset: 96)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !103, file: !12, line: 17, baseType: !25, size: 8, offset: 128)
!109 = !DILocation(line: 55, column: 17, scope: !11)
!110 = !DILocalVariable(name: "bsWr", scope: !11, file: !12, line: 55, type: !101)
!111 = !DILocation(line: 55, column: 24, scope: !11)
!112 = !DILocalVariable(name: "bitsRead", scope: !11, file: !12, line: 56, type: !113)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "UInt32", file: !12, line: 2, baseType: !114)
!114 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!115 = !DILocation(line: 56, column: 17, scope: !11)
!116 = !DILocalVariable(name: "buffHi", scope: !11, file: !12, line: 56, type: !113)
!117 = !DILocation(line: 56, column: 27, scope: !11)
!118 = !DILocalVariable(name: "buffLo", scope: !11, file: !12, line: 56, type: !113)
!119 = !DILocation(line: 56, column: 35, scope: !11)
!120 = !DILocalVariable(name: "blockCRC", scope: !11, file: !12, line: 56, type: !113)
!121 = !DILocation(line: 56, column: 43, scope: !11)
!122 = !DILocalVariable(name: "currBlock", scope: !11, file: !12, line: 56, type: !113)
!123 = !DILocation(line: 56, column: 53, scope: !11)
!124 = !DILocalVariable(name: "str", scope: !11, file: !12, line: 57, type: !125)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 480, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 60)
!128 = !DILocation(line: 57, column: 10, scope: !11)
!129 = !DILocation(line: 59, column: 22, scope: !11)
!130 = !DILocation(line: 59, column: 14, scope: !11)
!131 = !DILocation(line: 59, column: 12, scope: !11)
!132 = !DILocation(line: 60, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !11, file: !12, line: 60, column: 9)
!134 = !DILocation(line: 60, column: 16, scope: !133)
!135 = !DILocation(line: 60, column: 9, scope: !11)
!136 = !DILocation(line: 61, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !12, line: 60, column: 25)
!138 = !DILocation(line: 63, column: 31, scope: !11)
!139 = !DILocation(line: 63, column: 12, scope: !11)
!140 = !DILocation(line: 63, column: 10, scope: !11)
!141 = !DILocation(line: 65, column: 14, scope: !11)
!142 = !DILocation(line: 66, column: 21, scope: !11)
!143 = !DILocation(line: 66, column: 12, scope: !11)
!144 = !DILocation(line: 67, column: 15, scope: !11)
!145 = !DILocation(line: 68, column: 12, scope: !11)
!146 = !DILocation(line: 68, column: 5, scope: !11)
!147 = !DILocation(line: 68, column: 23, scope: !11)
!148 = !DILocation(line: 69, column: 5, scope: !11)
!149 = !DILocation(line: 70, column: 22, scope: !150)
!150 = distinct !DILexicalBlock(scope: !11, file: !12, line: 69, column: 15)
!151 = !DILocation(line: 70, column: 13, scope: !150)
!152 = !DILocation(line: 70, column: 11, scope: !150)
!153 = !DILocation(line: 71, column: 17, scope: !150)
!154 = !DILocation(line: 72, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !12, line: 72, column: 13)
!156 = !DILocation(line: 72, column: 15, scope: !155)
!157 = !DILocation(line: 72, column: 13, scope: !150)
!158 = !DILocation(line: 73, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !160, file: !12, line: 73, column: 17)
!160 = distinct !DILexicalBlock(scope: !155, file: !12, line: 72, column: 21)
!161 = !DILocation(line: 73, column: 36, scope: !159)
!162 = !DILocation(line: 73, column: 29, scope: !159)
!163 = !DILocation(line: 73, column: 26, scope: !159)
!164 = !DILocation(line: 73, column: 47, scope: !159)
!165 = !DILocation(line: 74, column: 18, scope: !159)
!166 = !DILocation(line: 74, column: 36, scope: !159)
!167 = !DILocation(line: 74, column: 29, scope: !159)
!168 = !DILocation(line: 74, column: 27, scope: !159)
!169 = !DILocation(line: 74, column: 48, scope: !159)
!170 = !DILocation(line: 73, column: 17, scope: !160)
!171 = !DILocation(line: 75, column: 35, scope: !159)
!172 = !DILocation(line: 75, column: 43, scope: !159)
!173 = !DILocation(line: 75, column: 22, scope: !159)
!174 = !DILocation(line: 75, column: 17, scope: !159)
!175 = !DILocation(line: 75, column: 33, scope: !159)
!176 = !DILocation(line: 77, column: 26, scope: !159)
!177 = !DILocation(line: 78, column: 13, scope: !160)
!178 = !DILocation(line: 80, column: 18, scope: !150)
!179 = !DILocation(line: 81, column: 19, scope: !150)
!180 = !DILocation(line: 81, column: 26, scope: !150)
!181 = !DILocation(line: 81, column: 35, scope: !150)
!182 = !DILocation(line: 81, column: 42, scope: !150)
!183 = !DILocation(line: 81, column: 32, scope: !150)
!184 = !DILocation(line: 81, column: 16, scope: !150)
!185 = !DILocation(line: 82, column: 19, scope: !150)
!186 = !DILocation(line: 82, column: 26, scope: !150)
!187 = !DILocation(line: 82, column: 35, scope: !150)
!188 = !DILocation(line: 82, column: 37, scope: !150)
!189 = !DILocation(line: 82, column: 32, scope: !150)
!190 = !DILocation(line: 82, column: 16, scope: !150)
!191 = !DILocation(line: 83, column: 17, scope: !192)
!192 = distinct !DILexicalBlock(scope: !150, file: !12, line: 83, column: 14)
!193 = !DILocation(line: 83, column: 24, scope: !192)
!194 = !DILocation(line: 83, column: 16, scope: !192)
!195 = !DILocation(line: 83, column: 38, scope: !192)
!196 = !DILocation(line: 83, column: 58, scope: !192)
!197 = !DILocation(line: 83, column: 61, scope: !192)
!198 = !DILocation(line: 83, column: 68, scope: !192)
!199 = !DILocation(line: 83, column: 87, scope: !192)
!200 = !DILocation(line: 84, column: 17, scope: !192)
!201 = !DILocation(line: 84, column: 24, scope: !192)
!202 = !DILocation(line: 84, column: 16, scope: !192)
!203 = !DILocation(line: 84, column: 38, scope: !192)
!204 = !DILocation(line: 84, column: 58, scope: !192)
!205 = !DILocation(line: 84, column: 61, scope: !192)
!206 = !DILocation(line: 84, column: 68, scope: !192)
!207 = !DILocation(line: 83, column: 14, scope: !150)
!208 = !DILocation(line: 86, column: 17, scope: !209)
!209 = distinct !DILexicalBlock(scope: !210, file: !12, line: 86, column: 17)
!210 = distinct !DILexicalBlock(scope: !192, file: !12, line: 85, column: 9)
!211 = !DILocation(line: 86, column: 26, scope: !209)
!212 = !DILocation(line: 86, column: 17, scope: !210)
!213 = !DILocation(line: 88, column: 35, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !12, line: 87, column: 13)
!215 = !DILocation(line: 88, column: 43, scope: !214)
!216 = !DILocation(line: 88, column: 22, scope: !214)
!217 = !DILocation(line: 88, column: 17, scope: !214)
!218 = !DILocation(line: 88, column: 33, scope: !214)
!219 = !DILocation(line: 89, column: 13, scope: !214)
!220 = !DILocation(line: 90, column: 22, scope: !221)
!221 = distinct !DILexicalBlock(scope: !209, file: !12, line: 89, column: 20)
!222 = !DILocation(line: 90, column: 17, scope: !221)
!223 = !DILocation(line: 90, column: 33, scope: !221)
!224 = !DILocation(line: 92, column: 9, scope: !210)
!225 = distinct !{!225, !148, !226}
!226 = !DILocation(line: 93, column: 5, scope: !11)
!227 = !DILocation(line: 95, column: 5, scope: !11)
!228 = !DILocation(line: 96, column: 22, scope: !229)
!229 = distinct !DILexicalBlock(scope: !11, file: !12, line: 95, column: 15)
!230 = !DILocation(line: 96, column: 13, scope: !229)
!231 = !DILocation(line: 96, column: 11, scope: !229)
!232 = !DILocation(line: 97, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !12, line: 97, column: 13)
!234 = !DILocation(line: 97, column: 15, scope: !233)
!235 = !DILocation(line: 97, column: 13, scope: !229)
!236 = !DILocation(line: 97, column: 21, scope: !233)
!237 = !DILocation(line: 98, column: 19, scope: !229)
!238 = !DILocation(line: 98, column: 26, scope: !229)
!239 = !DILocation(line: 98, column: 35, scope: !229)
!240 = !DILocation(line: 98, column: 42, scope: !229)
!241 = !DILocation(line: 98, column: 32, scope: !229)
!242 = !DILocation(line: 98, column: 16, scope: !229)
!243 = !DILocation(line: 99, column: 19, scope: !229)
!244 = !DILocation(line: 99, column: 26, scope: !229)
!245 = !DILocation(line: 99, column: 35, scope: !229)
!246 = !DILocation(line: 99, column: 37, scope: !229)
!247 = !DILocation(line: 99, column: 32, scope: !229)
!248 = !DILocation(line: 99, column: 16, scope: !229)
!249 = !DILocation(line: 100, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !229, file: !12, line: 100, column: 13)
!251 = !DILocation(line: 100, column: 37, scope: !250)
!252 = !DILocation(line: 100, column: 30, scope: !250)
!253 = !DILocation(line: 100, column: 28, scope: !250)
!254 = !DILocation(line: 100, column: 22, scope: !250)
!255 = !DILocation(line: 100, column: 13, scope: !229)
!256 = !DILocation(line: 101, column: 25, scope: !250)
!257 = !DILocation(line: 101, column: 32, scope: !250)
!258 = !DILocation(line: 101, column: 42, scope: !250)
!259 = !DILocation(line: 101, column: 49, scope: !250)
!260 = !DILocation(line: 101, column: 39, scope: !250)
!261 = !DILocation(line: 101, column: 22, scope: !250)
!262 = !DILocation(line: 101, column: 13, scope: !250)
!263 = !DILocation(line: 103, column: 13, scope: !264)
!264 = distinct !DILexicalBlock(scope: !229, file: !12, line: 103, column: 13)
!265 = !DILocation(line: 103, column: 21, scope: !264)
!266 = !DILocation(line: 103, column: 29, scope: !264)
!267 = !DILocation(line: 103, column: 32, scope: !264)
!268 = !DILocation(line: 103, column: 51, scope: !264)
!269 = !DILocation(line: 103, column: 44, scope: !264)
!270 = !DILocation(line: 103, column: 41, scope: !264)
!271 = !DILocation(line: 104, column: 13, scope: !264)
!272 = !DILocation(line: 104, column: 16, scope: !264)
!273 = !DILocation(line: 104, column: 33, scope: !264)
!274 = !DILocation(line: 104, column: 28, scope: !264)
!275 = !DILocation(line: 104, column: 25, scope: !264)
!276 = !DILocation(line: 103, column: 13, scope: !229)
!277 = !DILocation(line: 105, column: 22, scope: !278)
!278 = distinct !DILexicalBlock(scope: !264, file: !12, line: 104, column: 45)
!279 = !DILocation(line: 105, column: 28, scope: !278)
!280 = !DILocation(line: 105, column: 13, scope: !278)
!281 = !DILocation(line: 106, column: 9, scope: !278)
!282 = !DILocation(line: 108, column: 17, scope: !229)
!283 = !DILocation(line: 109, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !229, file: !12, line: 109, column: 13)
!285 = !DILocation(line: 109, column: 30, scope: !284)
!286 = !DILocation(line: 109, column: 25, scope: !284)
!287 = !DILocation(line: 109, column: 40, scope: !284)
!288 = !DILocation(line: 109, column: 22, scope: !284)
!289 = !DILocation(line: 109, column: 13, scope: !229)
!290 = !DILocation(line: 110, column: 17, scope: !291)
!291 = distinct !DILexicalBlock(scope: !292, file: !12, line: 110, column: 17)
!292 = distinct !DILexicalBlock(scope: !284, file: !12, line: 109, column: 44)
!293 = !DILocation(line: 110, column: 25, scope: !291)
!294 = !DILocation(line: 110, column: 17, scope: !292)
!295 = !DILocation(line: 111, column: 30, scope: !296)
!296 = distinct !DILexicalBlock(scope: !291, file: !12, line: 110, column: 34)
!297 = !DILocation(line: 111, column: 17, scope: !296)
!298 = !DILocation(line: 111, column: 57, scope: !296)
!299 = !DILocation(line: 111, column: 44, scope: !296)
!300 = !DILocation(line: 112, column: 30, scope: !296)
!301 = !DILocation(line: 112, column: 17, scope: !296)
!302 = !DILocation(line: 112, column: 57, scope: !296)
!303 = !DILocation(line: 112, column: 44, scope: !296)
!304 = !DILocation(line: 113, column: 30, scope: !296)
!305 = !DILocation(line: 113, column: 17, scope: !296)
!306 = !DILocation(line: 113, column: 57, scope: !296)
!307 = !DILocation(line: 113, column: 44, scope: !296)
!308 = !DILocation(line: 114, column: 31, scope: !296)
!309 = !DILocation(line: 114, column: 37, scope: !296)
!310 = !DILocation(line: 114, column: 17, scope: !296)
!311 = !DILocation(line: 115, column: 27, scope: !296)
!312 = !DILocation(line: 115, column: 17, scope: !296)
!313 = !DILocation(line: 116, column: 13, scope: !296)
!314 = !DILocation(line: 117, column: 17, scope: !315)
!315 = distinct !DILexicalBlock(scope: !292, file: !12, line: 117, column: 17)
!316 = !DILocation(line: 117, column: 27, scope: !315)
!317 = !DILocation(line: 117, column: 17, scope: !292)
!318 = !DILocation(line: 117, column: 34, scope: !315)
!319 = !DILocation(line: 118, column: 22, scope: !292)
!320 = !DILocation(line: 119, column: 9, scope: !292)
!321 = !DILocation(line: 120, column: 13, scope: !322)
!322 = distinct !DILexicalBlock(scope: !284, file: !12, line: 120, column: 13)
!323 = !DILocation(line: 120, column: 32, scope: !322)
!324 = !DILocation(line: 120, column: 25, scope: !322)
!325 = !DILocation(line: 120, column: 22, scope: !322)
!326 = !DILocation(line: 120, column: 13, scope: !284)
!327 = !DILocalVariable(name: "split", scope: !328, file: !12, line: 123, type: !329)
!328 = distinct !DILexicalBlock(scope: !322, file: !12, line: 120, column: 44)
!329 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!330 = !DILocation(line: 123, column: 19, scope: !328)
!331 = !DILocalVariable(name: "ofs", scope: !328, file: !12, line: 124, type: !31)
!332 = !DILocation(line: 124, column: 19, scope: !328)
!333 = !DILocalVariable(name: "k", scope: !328, file: !12, line: 124, type: !31)
!334 = !DILocation(line: 124, column: 24, scope: !328)
!335 = !DILocation(line: 125, column: 20, scope: !336)
!336 = distinct !DILexicalBlock(scope: !328, file: !12, line: 125, column: 13)
!337 = !DILocation(line: 125, column: 18, scope: !336)
!338 = !DILocation(line: 125, column: 25, scope: !339)
!339 = distinct !DILexicalBlock(scope: !336, file: !12, line: 125, column: 13)
!340 = !DILocation(line: 125, column: 27, scope: !339)
!341 = !DILocation(line: 125, column: 13, scope: !336)
!342 = !DILocation(line: 126, column: 28, scope: !339)
!343 = !DILocation(line: 126, column: 17, scope: !339)
!344 = !DILocation(line: 126, column: 31, scope: !339)
!345 = !DILocation(line: 125, column: 34, scope: !339)
!346 = !DILocation(line: 125, column: 13, scope: !339)
!347 = distinct !{!347, !341, !348, !349}
!348 = !DILocation(line: 126, column: 33, scope: !336)
!349 = !{!"llvm.loop.mustprogress"}
!350 = !DILocation(line: 127, column: 20, scope: !328)
!351 = !DILocation(line: 127, column: 32, scope: !328)
!352 = !DILocation(line: 127, column: 13, scope: !328)
!353 = !DILocation(line: 128, column: 29, scope: !328)
!354 = !DILocation(line: 128, column: 21, scope: !328)
!355 = !DILocation(line: 128, column: 19, scope: !328)
!356 = !DILocation(line: 129, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !328, file: !12, line: 129, column: 17)
!358 = !DILocation(line: 129, column: 23, scope: !357)
!359 = !DILocation(line: 129, column: 17, scope: !328)
!360 = !DILocation(line: 130, column: 25, scope: !361)
!361 = distinct !DILexicalBlock(scope: !357, file: !12, line: 129, column: 32)
!362 = !DILocation(line: 130, column: 23, scope: !361)
!363 = !DILocation(line: 131, column: 13, scope: !361)
!364 = !DILocation(line: 132, column: 17, scope: !365)
!365 = distinct !DILexicalBlock(scope: !357, file: !12, line: 131, column: 20)
!366 = !DILocation(line: 134, column: 9, scope: !328)
!367 = distinct !{!367, !227, !368}
!368 = !DILocation(line: 135, column: 5, scope: !11)
!369 = !DILocation(line: 136, column: 5, scope: !11)
!370 = !DILocation(line: 137, column: 1, scope: !11)
!371 = distinct !DISubprogram(name: "bsOpenReadStream", scope: !12, file: !12, line: 20, type: !372, scopeLine: 21, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!372 = !DISubroutineType(types: !373)
!373 = !{!101, !36}
!374 = !DILocalVariable(name: "stream", arg: 1, scope: !371, file: !12, line: 20, type: !36)
!375 = !DILocation(line: 20, column: 44, scope: !371)
!376 = !DILocalVariable(name: "bs", scope: !371, file: !12, line: 22, type: !101)
!377 = !DILocation(line: 22, column: 16, scope: !371)
!378 = !DILocation(line: 22, column: 21, scope: !371)
!379 = !DILocation(line: 23, column: 9, scope: !380)
!380 = distinct !DILexicalBlock(scope: !371, file: !12, line: 23, column: 9)
!381 = !DILocation(line: 23, column: 12, scope: !380)
!382 = !DILocation(line: 23, column: 9, scope: !371)
!383 = !DILocation(line: 23, column: 21, scope: !380)
!384 = !DILocation(line: 24, column: 18, scope: !371)
!385 = !DILocation(line: 24, column: 5, scope: !371)
!386 = !DILocation(line: 24, column: 9, scope: !371)
!387 = !DILocation(line: 24, column: 16, scope: !371)
!388 = !DILocation(line: 25, column: 5, scope: !371)
!389 = !DILocation(line: 25, column: 9, scope: !371)
!390 = !DILocation(line: 25, column: 16, scope: !371)
!391 = !DILocation(line: 26, column: 5, scope: !371)
!392 = !DILocation(line: 26, column: 9, scope: !371)
!393 = !DILocation(line: 26, column: 18, scope: !371)
!394 = !DILocation(line: 27, column: 5, scope: !371)
!395 = !DILocation(line: 27, column: 9, scope: !371)
!396 = !DILocation(line: 27, column: 14, scope: !371)
!397 = !DILocation(line: 28, column: 12, scope: !371)
!398 = !DILocation(line: 28, column: 5, scope: !371)
!399 = distinct !DISubprogram(name: "bsGetBit", scope: !12, file: !12, line: 31, type: !400, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!400 = !DISubroutineType(types: !401)
!401 = !{!31, !101}
!402 = !DILocalVariable(name: "bs", arg: 1, scope: !399, file: !12, line: 31, type: !101)
!403 = !DILocation(line: 31, column: 36, scope: !399)
!404 = !DILocation(line: 33, column: 9, scope: !405)
!405 = distinct !DILexicalBlock(scope: !399, file: !12, line: 33, column: 9)
!406 = !DILocation(line: 33, column: 13, scope: !405)
!407 = !DILocation(line: 33, column: 22, scope: !405)
!408 = !DILocation(line: 33, column: 9, scope: !399)
!409 = !DILocation(line: 34, column: 9, scope: !410)
!410 = distinct !DILexicalBlock(scope: !405, file: !12, line: 33, column: 27)
!411 = !DILocation(line: 34, column: 13, scope: !410)
!412 = !DILocation(line: 34, column: 22, scope: !410)
!413 = !DILocation(line: 35, column: 20, scope: !410)
!414 = !DILocation(line: 35, column: 24, scope: !410)
!415 = !DILocation(line: 35, column: 36, scope: !410)
!416 = !DILocation(line: 35, column: 40, scope: !410)
!417 = !DILocation(line: 35, column: 32, scope: !410)
!418 = !DILocation(line: 35, column: 51, scope: !410)
!419 = !DILocation(line: 35, column: 9, scope: !410)
!420 = !DILocalVariable(name: "retVal", scope: !421, file: !12, line: 37, type: !31)
!421 = distinct !DILexicalBlock(scope: !405, file: !12, line: 36, column: 12)
!422 = !DILocation(line: 37, column: 15, scope: !421)
!423 = !DILocation(line: 37, column: 31, scope: !421)
!424 = !DILocation(line: 37, column: 35, scope: !421)
!425 = !DILocation(line: 37, column: 24, scope: !421)
!426 = !DILocation(line: 38, column: 14, scope: !427)
!427 = distinct !DILexicalBlock(scope: !421, file: !12, line: 38, column: 14)
!428 = !DILocation(line: 38, column: 21, scope: !427)
!429 = !DILocation(line: 38, column: 14, scope: !421)
!430 = !DILocation(line: 39, column: 13, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !12, line: 38, column: 30)
!432 = !DILocation(line: 41, column: 9, scope: !421)
!433 = !DILocation(line: 41, column: 13, scope: !421)
!434 = !DILocation(line: 41, column: 22, scope: !421)
!435 = !DILocation(line: 42, column: 22, scope: !421)
!436 = !DILocation(line: 42, column: 9, scope: !421)
!437 = !DILocation(line: 42, column: 13, scope: !421)
!438 = !DILocation(line: 42, column: 20, scope: !421)
!439 = !DILocation(line: 43, column: 20, scope: !421)
!440 = !DILocation(line: 43, column: 24, scope: !421)
!441 = !DILocation(line: 43, column: 32, scope: !421)
!442 = !DILocation(line: 43, column: 38, scope: !421)
!443 = !DILocation(line: 43, column: 9, scope: !421)
!444 = !DILocation(line: 45, column: 1, scope: !399)
