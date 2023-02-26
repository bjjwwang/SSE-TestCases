; ModuleID = 'mac_bc/ikos_cases/fileread3.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/ikos_cases/fileread3.c"
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
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %inFile, metadata !34, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %outFile, metadata !96, metadata !DIExpression()), !dbg !97
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
  %call = call %struct.__sFILE* @"\01_fopen"(i8* noundef %arraydecay, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !130
  store %struct.__sFILE* %call, %struct.__sFILE** %inFile, align 8, !dbg !131
  %0 = load %struct.__sFILE*, %struct.__sFILE** %inFile, align 8, !dbg !132
  %cmp = icmp eq %struct.__sFILE* %0, null, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 1) #4, !dbg !136
  unreachable, !dbg !136

if.end:                                           ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** %inFile, align 8, !dbg !138
  %call1 = call %struct.BitStream* @bsOpenReadStream(%struct.__sFILE* noundef %1), !dbg !139
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

while.body:                                       ; preds = %if.end13, %if.end
  %3 = load %struct.BitStream*, %struct.BitStream** %bsIn, align 8, !dbg !149
  %call2 = call i32 @bsGetBit(%struct.BitStream* noundef %3), !dbg !151
  store i32 %call2, i32* %b, align 4, !dbg !152
  %4 = load i32, i32* %bitsRead, align 4, !dbg !153
  %inc = add i32 %4, 1, !dbg !153
  store i32 %inc, i32* %bitsRead, align 4, !dbg !153
  %5 = load i32, i32* %b, align 4, !dbg !154
  %cmp3 = icmp eq i32 %5, 2, !dbg !156
  br i1 %cmp3, label %if.then4, label %if.end13, !dbg !157

if.then4:                                         ; preds = %while.body
  %6 = load i32, i32* %bitsRead, align 4, !dbg !158
  %7 = load i32, i32* %currBlock, align 4, !dbg !161
  %idxprom5 = zext i32 %7 to i64, !dbg !162
  %arrayidx6 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom5, !dbg !162
  %8 = load i32, i32* %arrayidx6, align 4, !dbg !162
  %cmp7 = icmp uge i32 %6, %8, !dbg !163
  br i1 %cmp7, label %land.lhs.true, label %if.end12, !dbg !164

land.lhs.true:                                    ; preds = %if.then4
  %9 = load i32, i32* %bitsRead, align 4, !dbg !165
  %10 = load i32, i32* %currBlock, align 4, !dbg !166
  %idxprom8 = zext i32 %10 to i64, !dbg !167
  %arrayidx9 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom8, !dbg !167
  %11 = load i32, i32* %arrayidx9, align 4, !dbg !167
  %sub = sub i32 %9, %11, !dbg !168
  %cmp10 = icmp uge i32 %sub, 40, !dbg !169
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !170

if.then11:                                        ; preds = %land.lhs.true
  br label %while.end, !dbg !171

if.end12:                                         ; preds = %land.lhs.true, %if.then4
  br label %if.end13, !dbg !173

if.end13:                                         ; preds = %if.end12, %while.body
  %12 = load i32, i32* %currBlock, align 4, !dbg !174
  %inc14 = add i32 %12, 1, !dbg !174
  store i32 %inc14, i32* %currBlock, align 4, !dbg !174
  br label %while.body, !dbg !148, !llvm.loop !175

while.end:                                        ; preds = %if.then11
  %call15 = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 noundef 1), !dbg !177
  %13 = load i32, i32* %retval, align 4, !dbg !178
  ret i32 %13, !dbg !178
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare %struct.__sFILE* @"\01_fopen"(i8* noundef, i8* noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal %struct.BitStream* @bsOpenReadStream(%struct.__sFILE* noundef %stream) #0 !dbg !179 {
entry:
  %stream.addr = alloca %struct.__sFILE*, align 8
  %bs = alloca %struct.BitStream*, align 8
  store %struct.__sFILE* %stream, %struct.__sFILE** %stream.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.__sFILE** %stream.addr, metadata !182, metadata !DIExpression()), !dbg !183
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs, metadata !184, metadata !DIExpression()), !dbg !185
  %call = call i8* @malloc(i64 noundef 24), !dbg !186
  %0 = bitcast i8* %call to %struct.BitStream*, !dbg !186
  store %struct.BitStream* %0, %struct.BitStream** %bs, align 8, !dbg !185
  %1 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !187
  %cmp = icmp eq %struct.BitStream* %1, null, !dbg !189
  br i1 %cmp, label %if.then, label %if.end, !dbg !190

if.then:                                          ; preds = %entry
  %call1 = call i32 (i64, ...) bitcast (i32 (...)* @mallocFail to i32 (i64, ...)*)(i64 noundef 24), !dbg !191
  br label %if.end, !dbg !191

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct.__sFILE*, %struct.__sFILE** %stream.addr, align 8, !dbg !192
  %3 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !193
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %3, i32 0, i32 0, !dbg !194
  store %struct.__sFILE* %2, %struct.__sFILE** %handle, align 8, !dbg !195
  %4 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !196
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !197
  store i32 0, i32* %buffer, align 8, !dbg !198
  %5 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !199
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %5, i32 0, i32 2, !dbg !200
  store i32 0, i32* %buffLive, align 4, !dbg !201
  %6 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !202
  %mode = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 3, !dbg !203
  store i8 114, i8* %mode, align 8, !dbg !204
  %7 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !205
  ret %struct.BitStream* %7, !dbg !206
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @bsGetBit(%struct.BitStream* noundef %bs) #0 !dbg !207 {
entry:
  %retval = alloca i32, align 4
  %bs.addr = alloca %struct.BitStream*, align 8
  %retVal = alloca i32, align 4
  store %struct.BitStream* %bs, %struct.BitStream** %bs.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs.addr, metadata !210, metadata !DIExpression()), !dbg !211
  %0 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !212
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %0, i32 0, i32 2, !dbg !214
  %1 = load i32, i32* %buffLive, align 4, !dbg !214
  %cmp = icmp sgt i32 %1, 0, !dbg !215
  br i1 %cmp, label %if.then, label %if.else, !dbg !216

if.then:                                          ; preds = %entry
  %2 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !217
  %buffLive1 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %2, i32 0, i32 2, !dbg !219
  %3 = load i32, i32* %buffLive1, align 4, !dbg !220
  %dec = add nsw i32 %3, -1, !dbg !220
  store i32 %dec, i32* %buffLive1, align 4, !dbg !220
  %4 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !221
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !222
  %5 = load i32, i32* %buffer, align 8, !dbg !222
  %6 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !223
  %buffLive2 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 2, !dbg !224
  %7 = load i32, i32* %buffLive2, align 4, !dbg !224
  %shr = ashr i32 %5, %7, !dbg !225
  %and = and i32 %shr, 1, !dbg !226
  store i32 %and, i32* %retval, align 4, !dbg !227
  br label %return, !dbg !227

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %retVal, metadata !228, metadata !DIExpression()), !dbg !230
  %8 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !231
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %8, i32 0, i32 0, !dbg !232
  %9 = load %struct.__sFILE*, %struct.__sFILE** %handle, align 8, !dbg !232
  %call = call i32 @getc(%struct.__sFILE* noundef %9), !dbg !233
  store i32 %call, i32* %retVal, align 4, !dbg !230
  %10 = load i32, i32* %retVal, align 4, !dbg !234
  %cmp3 = icmp eq i32 %10, -1, !dbg !236
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !237

if.then4:                                         ; preds = %if.else
  store i32 2, i32* %retval, align 4, !dbg !238
  br label %return, !dbg !238

if.end:                                           ; preds = %if.else
  %11 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !240
  %buffLive5 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %11, i32 0, i32 2, !dbg !241
  store i32 7, i32* %buffLive5, align 4, !dbg !242
  %12 = load i32, i32* %retVal, align 4, !dbg !243
  %13 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !244
  %buffer6 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %13, i32 0, i32 1, !dbg !245
  store i32 %12, i32* %buffer6, align 8, !dbg !246
  %14 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !247
  %buffer7 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %14, i32 0, i32 1, !dbg !248
  %15 = load i32, i32* %buffer7, align 8, !dbg !248
  %shr8 = ashr i32 %15, 7, !dbg !249
  %and9 = and i32 %shr8, 1, !dbg !250
  store i32 %and9, i32* %retval, align 4, !dbg !251
  br label %return, !dbg !251

return:                                           ; preds = %if.end, %if.then4, %if.then
  %16 = load i32, i32* %retval, align 4, !dbg !252
  ret i32 %16, !dbg !252
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/ikos_cases/fileread3.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 43, type: !13, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!12 = !DIFile(filename: "src/ikos_cases/fileread3.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{}
!20 = !DILocalVariable(name: "argc", arg: 1, scope: !11, file: !12, line: 43, type: !15)
!21 = !DILocation(line: 43, column: 14, scope: !11)
!22 = !DILocalVariable(name: "argv", arg: 2, scope: !11, file: !12, line: 43, type: !16)
!23 = !DILocation(line: 43, column: 27, scope: !11)
!24 = !DILocalVariable(name: "inFileName", scope: !11, file: !12, line: 44, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 280, elements: !27)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "Char", file: !12, line: 5, baseType: !18)
!27 = !{!28}
!28 = !DISubrange(count: 35)
!29 = !DILocation(line: 44, column: 10, scope: !11)
!30 = !DILocalVariable(name: "bStart", scope: !11, file: !12, line: 45, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 1120, elements: !27)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "Int32", file: !12, line: 3, baseType: !15)
!33 = !DILocation(line: 45, column: 11, scope: !11)
!34 = !DILocalVariable(name: "inFile", scope: !11, file: !12, line: 46, type: !35)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !37, line: 157, baseType: !38)
!37 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/_stdio.h", directory: "")
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !37, line: 126, size: 1216, elements: !39)
!39 = !{!40, !43, !44, !45, !47, !48, !53, !54, !55, !59, !63, !73, !79, !80, !83, !84, !88, !92, !93, !94}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !38, file: !37, line: 127, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !38, file: !37, line: 128, baseType: !15, size: 32, offset: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !38, file: !37, line: 129, baseType: !15, size: 32, offset: 96)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !38, file: !37, line: 130, baseType: !46, size: 16, offset: 128)
!46 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !38, file: !37, line: 131, baseType: !46, size: 16, offset: 144)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !38, file: !37, line: 132, baseType: !49, size: 128, offset: 192)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !37, line: 92, size: 128, elements: !50)
!50 = !{!51, !52}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !49, file: !37, line: 93, baseType: !41, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !49, file: !37, line: 94, baseType: !15, size: 32, offset: 64)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !38, file: !37, line: 133, baseType: !15, size: 32, offset: 320)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !38, file: !37, line: 136, baseType: !3, size: 64, offset: 384)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !38, file: !37, line: 137, baseType: !56, size: 64, offset: 448)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DISubroutineType(types: !58)
!58 = !{!15, !3}
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !38, file: !37, line: 138, baseType: !60, size: 64, offset: 512)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DISubroutineType(types: !62)
!62 = !{!15, !3, !17, !15}
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !38, file: !37, line: 139, baseType: !64, size: 64, offset: 576)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !3, !67, !15}
!67 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !37, line: 81, baseType: !68)
!68 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !69, line: 71, baseType: !70)
!69 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types.h", directory: "")
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !71, line: 48, baseType: !72)
!71 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!72 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !38, file: !37, line: 140, baseType: !74, size: 64, offset: 640)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DISubroutineType(types: !76)
!76 = !{!15, !3, !77, !15}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !38, file: !37, line: 143, baseType: !49, size: 128, offset: 704)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !38, file: !37, line: 144, baseType: !81, size: 64, offset: 832)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !37, line: 98, flags: DIFlagFwdDecl)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !38, file: !37, line: 145, baseType: !15, size: 32, offset: 896)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !38, file: !37, line: 148, baseType: !85, size: 24, offset: 928)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 24, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 3)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !38, file: !37, line: 149, baseType: !89, size: 8, offset: 952)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 8, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 1)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !38, file: !37, line: 152, baseType: !49, size: 128, offset: 960)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !38, file: !37, line: 155, baseType: !15, size: 32, offset: 1088)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !38, file: !37, line: 156, baseType: !67, size: 64, offset: 1152)
!95 = !DILocation(line: 46, column: 17, scope: !11)
!96 = !DILocalVariable(name: "outFile", scope: !11, file: !12, line: 47, type: !35)
!97 = !DILocation(line: 47, column: 17, scope: !11)
!98 = !DILocalVariable(name: "b", scope: !11, file: !12, line: 48, type: !32)
!99 = !DILocation(line: 48, column: 12, scope: !11)
!100 = !DILocalVariable(name: "bsIn", scope: !11, file: !12, line: 49, type: !101)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "BitStream", file: !12, line: 13, baseType: !103)
!103 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !12, line: 8, size: 192, elements: !104)
!104 = !{!105, !106, !107, !108}
!105 = !DIDerivedType(tag: DW_TAG_member, name: "handle", scope: !103, file: !12, line: 9, baseType: !35, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !103, file: !12, line: 10, baseType: !32, size: 32, offset: 64)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "buffLive", scope: !103, file: !12, line: 11, baseType: !32, size: 32, offset: 96)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !103, file: !12, line: 12, baseType: !26, size: 8, offset: 128)
!109 = !DILocation(line: 49, column: 17, scope: !11)
!110 = !DILocalVariable(name: "bsWr", scope: !11, file: !12, line: 49, type: !101)
!111 = !DILocation(line: 49, column: 24, scope: !11)
!112 = !DILocalVariable(name: "bitsRead", scope: !11, file: !12, line: 50, type: !113)
!113 = !DIDerivedType(tag: DW_TAG_typedef, name: "UInt32", file: !12, line: 2, baseType: !114)
!114 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!115 = !DILocation(line: 50, column: 17, scope: !11)
!116 = !DILocalVariable(name: "buffHi", scope: !11, file: !12, line: 50, type: !113)
!117 = !DILocation(line: 50, column: 27, scope: !11)
!118 = !DILocalVariable(name: "buffLo", scope: !11, file: !12, line: 50, type: !113)
!119 = !DILocation(line: 50, column: 35, scope: !11)
!120 = !DILocalVariable(name: "blockCRC", scope: !11, file: !12, line: 50, type: !113)
!121 = !DILocation(line: 50, column: 43, scope: !11)
!122 = !DILocalVariable(name: "currBlock", scope: !11, file: !12, line: 50, type: !113)
!123 = !DILocation(line: 50, column: 53, scope: !11)
!124 = !DILocalVariable(name: "str", scope: !11, file: !12, line: 51, type: !125)
!125 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 480, elements: !126)
!126 = !{!127}
!127 = !DISubrange(count: 60)
!128 = !DILocation(line: 51, column: 10, scope: !11)
!129 = !DILocation(line: 53, column: 22, scope: !11)
!130 = !DILocation(line: 53, column: 14, scope: !11)
!131 = !DILocation(line: 53, column: 12, scope: !11)
!132 = !DILocation(line: 54, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !11, file: !12, line: 54, column: 9)
!134 = !DILocation(line: 54, column: 16, scope: !133)
!135 = !DILocation(line: 54, column: 9, scope: !11)
!136 = !DILocation(line: 55, column: 9, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !12, line: 54, column: 25)
!138 = !DILocation(line: 57, column: 31, scope: !11)
!139 = !DILocation(line: 57, column: 12, scope: !11)
!140 = !DILocation(line: 57, column: 10, scope: !11)
!141 = !DILocation(line: 59, column: 14, scope: !11)
!142 = !DILocation(line: 60, column: 21, scope: !11)
!143 = !DILocation(line: 60, column: 12, scope: !11)
!144 = !DILocation(line: 61, column: 15, scope: !11)
!145 = !DILocation(line: 62, column: 12, scope: !11)
!146 = !DILocation(line: 62, column: 5, scope: !11)
!147 = !DILocation(line: 62, column: 23, scope: !11)
!148 = !DILocation(line: 63, column: 5, scope: !11)
!149 = !DILocation(line: 64, column: 22, scope: !150)
!150 = distinct !DILexicalBlock(scope: !11, file: !12, line: 63, column: 15)
!151 = !DILocation(line: 64, column: 13, scope: !150)
!152 = !DILocation(line: 64, column: 11, scope: !150)
!153 = !DILocation(line: 65, column: 17, scope: !150)
!154 = !DILocation(line: 66, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !12, line: 66, column: 13)
!156 = !DILocation(line: 66, column: 15, scope: !155)
!157 = !DILocation(line: 66, column: 13, scope: !150)
!158 = !DILocation(line: 67, column: 17, scope: !159)
!159 = distinct !DILexicalBlock(scope: !160, file: !12, line: 67, column: 17)
!160 = distinct !DILexicalBlock(scope: !155, file: !12, line: 66, column: 21)
!161 = !DILocation(line: 67, column: 36, scope: !159)
!162 = !DILocation(line: 67, column: 29, scope: !159)
!163 = !DILocation(line: 67, column: 26, scope: !159)
!164 = !DILocation(line: 67, column: 47, scope: !159)
!165 = !DILocation(line: 68, column: 18, scope: !159)
!166 = !DILocation(line: 68, column: 36, scope: !159)
!167 = !DILocation(line: 68, column: 29, scope: !159)
!168 = !DILocation(line: 68, column: 27, scope: !159)
!169 = !DILocation(line: 68, column: 48, scope: !159)
!170 = !DILocation(line: 67, column: 17, scope: !160)
!171 = !DILocation(line: 69, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !159, file: !12, line: 68, column: 55)
!173 = !DILocation(line: 71, column: 9, scope: !160)
!174 = !DILocation(line: 72, column: 18, scope: !150)
!175 = distinct !{!175, !148, !176}
!176 = !DILocation(line: 73, column: 5, scope: !11)
!177 = !DILocation(line: 74, column: 5, scope: !11)
!178 = !DILocation(line: 75, column: 1, scope: !11)
!179 = distinct !DISubprogram(name: "bsOpenReadStream", scope: !12, file: !12, line: 15, type: !180, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!180 = !DISubroutineType(types: !181)
!181 = !{!101, !35}
!182 = !DILocalVariable(name: "stream", arg: 1, scope: !179, file: !12, line: 15, type: !35)
!183 = !DILocation(line: 15, column: 44, scope: !179)
!184 = !DILocalVariable(name: "bs", scope: !179, file: !12, line: 17, type: !101)
!185 = !DILocation(line: 17, column: 16, scope: !179)
!186 = !DILocation(line: 17, column: 21, scope: !179)
!187 = !DILocation(line: 18, column: 9, scope: !188)
!188 = distinct !DILexicalBlock(scope: !179, file: !12, line: 18, column: 9)
!189 = !DILocation(line: 18, column: 12, scope: !188)
!190 = !DILocation(line: 18, column: 9, scope: !179)
!191 = !DILocation(line: 18, column: 21, scope: !188)
!192 = !DILocation(line: 19, column: 18, scope: !179)
!193 = !DILocation(line: 19, column: 5, scope: !179)
!194 = !DILocation(line: 19, column: 9, scope: !179)
!195 = !DILocation(line: 19, column: 16, scope: !179)
!196 = !DILocation(line: 20, column: 5, scope: !179)
!197 = !DILocation(line: 20, column: 9, scope: !179)
!198 = !DILocation(line: 20, column: 16, scope: !179)
!199 = !DILocation(line: 21, column: 5, scope: !179)
!200 = !DILocation(line: 21, column: 9, scope: !179)
!201 = !DILocation(line: 21, column: 18, scope: !179)
!202 = !DILocation(line: 22, column: 5, scope: !179)
!203 = !DILocation(line: 22, column: 9, scope: !179)
!204 = !DILocation(line: 22, column: 14, scope: !179)
!205 = !DILocation(line: 23, column: 12, scope: !179)
!206 = !DILocation(line: 23, column: 5, scope: !179)
!207 = distinct !DISubprogram(name: "bsGetBit", scope: !12, file: !12, line: 26, type: !208, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!208 = !DISubroutineType(types: !209)
!209 = !{!32, !101}
!210 = !DILocalVariable(name: "bs", arg: 1, scope: !207, file: !12, line: 26, type: !101)
!211 = !DILocation(line: 26, column: 36, scope: !207)
!212 = !DILocation(line: 28, column: 9, scope: !213)
!213 = distinct !DILexicalBlock(scope: !207, file: !12, line: 28, column: 9)
!214 = !DILocation(line: 28, column: 13, scope: !213)
!215 = !DILocation(line: 28, column: 22, scope: !213)
!216 = !DILocation(line: 28, column: 9, scope: !207)
!217 = !DILocation(line: 29, column: 9, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !12, line: 28, column: 27)
!219 = !DILocation(line: 29, column: 13, scope: !218)
!220 = !DILocation(line: 29, column: 22, scope: !218)
!221 = !DILocation(line: 30, column: 20, scope: !218)
!222 = !DILocation(line: 30, column: 24, scope: !218)
!223 = !DILocation(line: 30, column: 36, scope: !218)
!224 = !DILocation(line: 30, column: 40, scope: !218)
!225 = !DILocation(line: 30, column: 32, scope: !218)
!226 = !DILocation(line: 30, column: 51, scope: !218)
!227 = !DILocation(line: 30, column: 9, scope: !218)
!228 = !DILocalVariable(name: "retVal", scope: !229, file: !12, line: 32, type: !32)
!229 = distinct !DILexicalBlock(scope: !213, file: !12, line: 31, column: 12)
!230 = !DILocation(line: 32, column: 15, scope: !229)
!231 = !DILocation(line: 32, column: 31, scope: !229)
!232 = !DILocation(line: 32, column: 35, scope: !229)
!233 = !DILocation(line: 32, column: 24, scope: !229)
!234 = !DILocation(line: 33, column: 14, scope: !235)
!235 = distinct !DILexicalBlock(scope: !229, file: !12, line: 33, column: 14)
!236 = !DILocation(line: 33, column: 21, scope: !235)
!237 = !DILocation(line: 33, column: 14, scope: !229)
!238 = !DILocation(line: 34, column: 13, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !12, line: 33, column: 30)
!240 = !DILocation(line: 36, column: 9, scope: !229)
!241 = !DILocation(line: 36, column: 13, scope: !229)
!242 = !DILocation(line: 36, column: 22, scope: !229)
!243 = !DILocation(line: 37, column: 22, scope: !229)
!244 = !DILocation(line: 37, column: 9, scope: !229)
!245 = !DILocation(line: 37, column: 13, scope: !229)
!246 = !DILocation(line: 37, column: 20, scope: !229)
!247 = !DILocation(line: 38, column: 20, scope: !229)
!248 = !DILocation(line: 38, column: 24, scope: !229)
!249 = !DILocation(line: 38, column: 32, scope: !229)
!250 = !DILocation(line: 38, column: 38, scope: !229)
!251 = !DILocation(line: 38, column: 9, scope: !229)
!252 = !DILocation(line: 40, column: 1, scope: !207)
