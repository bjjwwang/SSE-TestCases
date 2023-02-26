; ModuleID = 'linux_bc/ikos_cases/fileread3.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/ikos_cases/fileread3.c"
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
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !19, metadata !DIExpression()), !dbg !20
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [35 x i8]* %inFileName, metadata !23, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [35 x i32]* %bStart, metadata !29, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %inFile, metadata !33, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %outFile, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32* %b, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bsIn, metadata !98, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bsWr, metadata !108, metadata !DIExpression()), !dbg !109
  call void @llvm.dbg.declare(metadata i32* %bitsRead, metadata !110, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32* %buffHi, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata i32* %buffLo, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i32* %blockCRC, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata i32* %currBlock, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [60 x i8]* %str, metadata !122, metadata !DIExpression()), !dbg !126
  %arraydecay = getelementptr inbounds [35 x i8], [35 x i8]* %inFileName, i64 0, i64 0, !dbg !127
  %call = call %struct._IO_FILE* @fopen(i8* %arraydecay, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0)), !dbg !128
  store %struct._IO_FILE* %call, %struct._IO_FILE** %inFile, align 8, !dbg !129
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8, !dbg !130
  %cmp = icmp eq %struct._IO_FILE* %0, null, !dbg !132
  br i1 %cmp, label %if.then, label %if.end, !dbg !133

if.then:                                          ; preds = %entry
  call void @exit(i32 1) #4, !dbg !134
  unreachable, !dbg !134

if.end:                                           ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** %inFile, align 8, !dbg !136
  %call1 = call %struct.BitStream* @bsOpenReadStream(%struct._IO_FILE* %1), !dbg !137
  store %struct.BitStream* %call1, %struct.BitStream** %bsIn, align 8, !dbg !138
  store i32 0, i32* %bitsRead, align 4, !dbg !139
  store i32 0, i32* %buffLo, align 4, !dbg !140
  store i32 0, i32* %buffHi, align 4, !dbg !141
  store i32 0, i32* %currBlock, align 4, !dbg !142
  %2 = load i32, i32* %currBlock, align 4, !dbg !143
  %idxprom = zext i32 %2 to i64, !dbg !144
  %arrayidx = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom, !dbg !144
  store i32 0, i32* %arrayidx, align 4, !dbg !145
  br label %while.body, !dbg !146

while.body:                                       ; preds = %if.end13, %if.end
  %3 = load %struct.BitStream*, %struct.BitStream** %bsIn, align 8, !dbg !147
  %call2 = call i32 @bsGetBit(%struct.BitStream* %3), !dbg !149
  store i32 %call2, i32* %b, align 4, !dbg !150
  %4 = load i32, i32* %bitsRead, align 4, !dbg !151
  %inc = add i32 %4, 1, !dbg !151
  store i32 %inc, i32* %bitsRead, align 4, !dbg !151
  %5 = load i32, i32* %b, align 4, !dbg !152
  %cmp3 = icmp eq i32 %5, 2, !dbg !154
  br i1 %cmp3, label %if.then4, label %if.end13, !dbg !155

if.then4:                                         ; preds = %while.body
  %6 = load i32, i32* %bitsRead, align 4, !dbg !156
  %7 = load i32, i32* %currBlock, align 4, !dbg !159
  %idxprom5 = zext i32 %7 to i64, !dbg !160
  %arrayidx6 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom5, !dbg !160
  %8 = load i32, i32* %arrayidx6, align 4, !dbg !160
  %cmp7 = icmp uge i32 %6, %8, !dbg !161
  br i1 %cmp7, label %land.lhs.true, label %if.end12, !dbg !162

land.lhs.true:                                    ; preds = %if.then4
  %9 = load i32, i32* %bitsRead, align 4, !dbg !163
  %10 = load i32, i32* %currBlock, align 4, !dbg !164
  %idxprom8 = zext i32 %10 to i64, !dbg !165
  %arrayidx9 = getelementptr inbounds [35 x i32], [35 x i32]* %bStart, i64 0, i64 %idxprom8, !dbg !165
  %11 = load i32, i32* %arrayidx9, align 4, !dbg !165
  %sub = sub i32 %9, %11, !dbg !166
  %cmp10 = icmp uge i32 %sub, 40, !dbg !167
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !168

if.then11:                                        ; preds = %land.lhs.true
  br label %while.end, !dbg !169

if.end12:                                         ; preds = %land.lhs.true, %if.then4
  br label %if.end13, !dbg !171

if.end13:                                         ; preds = %if.end12, %while.body
  %12 = load i32, i32* %currBlock, align 4, !dbg !172
  %inc14 = add i32 %12, 1, !dbg !172
  store i32 %inc14, i32* %currBlock, align 4, !dbg !172
  br label %while.body, !dbg !146, !llvm.loop !173

while.end:                                        ; preds = %if.then11
  %call15 = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 1), !dbg !175
  %13 = load i32, i32* %retval, align 4, !dbg !176
  ret i32 %13, !dbg !176
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: noreturn
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal %struct.BitStream* @bsOpenReadStream(%struct._IO_FILE* %stream) #0 !dbg !177 {
entry:
  %stream.addr = alloca %struct._IO_FILE*, align 8
  %bs = alloca %struct.BitStream*, align 8
  store %struct._IO_FILE* %stream, %struct._IO_FILE** %stream.addr, align 8
  call void @llvm.dbg.declare(metadata %struct._IO_FILE** %stream.addr, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs, metadata !182, metadata !DIExpression()), !dbg !183
  %call = call align 16 i8* @malloc(i64 24), !dbg !184
  %0 = bitcast i8* %call to %struct.BitStream*, !dbg !184
  store %struct.BitStream* %0, %struct.BitStream** %bs, align 8, !dbg !183
  %1 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !185
  %cmp = icmp eq %struct.BitStream* %1, null, !dbg !187
  br i1 %cmp, label %if.then, label %if.end, !dbg !188

if.then:                                          ; preds = %entry
  %call1 = call i32 (i64, ...) bitcast (i32 (...)* @mallocFail to i32 (i64, ...)*)(i64 24), !dbg !189
  br label %if.end, !dbg !189

if.end:                                           ; preds = %if.then, %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** %stream.addr, align 8, !dbg !190
  %3 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !191
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %3, i32 0, i32 0, !dbg !192
  store %struct._IO_FILE* %2, %struct._IO_FILE** %handle, align 8, !dbg !193
  %4 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !194
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !195
  store i32 0, i32* %buffer, align 8, !dbg !196
  %5 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !197
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %5, i32 0, i32 2, !dbg !198
  store i32 0, i32* %buffLive, align 4, !dbg !199
  %6 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !200
  %mode = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 3, !dbg !201
  store i8 114, i8* %mode, align 8, !dbg !202
  %7 = load %struct.BitStream*, %struct.BitStream** %bs, align 8, !dbg !203
  ret %struct.BitStream* %7, !dbg !204
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @bsGetBit(%struct.BitStream* %bs) #0 !dbg !205 {
entry:
  %retval = alloca i32, align 4
  %bs.addr = alloca %struct.BitStream*, align 8
  %retVal = alloca i32, align 4
  store %struct.BitStream* %bs, %struct.BitStream** %bs.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.BitStream** %bs.addr, metadata !208, metadata !DIExpression()), !dbg !209
  %0 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !210
  %buffLive = getelementptr inbounds %struct.BitStream, %struct.BitStream* %0, i32 0, i32 2, !dbg !212
  %1 = load i32, i32* %buffLive, align 4, !dbg !212
  %cmp = icmp sgt i32 %1, 0, !dbg !213
  br i1 %cmp, label %if.then, label %if.else, !dbg !214

if.then:                                          ; preds = %entry
  %2 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !215
  %buffLive1 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %2, i32 0, i32 2, !dbg !217
  %3 = load i32, i32* %buffLive1, align 4, !dbg !218
  %dec = add nsw i32 %3, -1, !dbg !218
  store i32 %dec, i32* %buffLive1, align 4, !dbg !218
  %4 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !219
  %buffer = getelementptr inbounds %struct.BitStream, %struct.BitStream* %4, i32 0, i32 1, !dbg !220
  %5 = load i32, i32* %buffer, align 8, !dbg !220
  %6 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !221
  %buffLive2 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %6, i32 0, i32 2, !dbg !222
  %7 = load i32, i32* %buffLive2, align 4, !dbg !222
  %shr = ashr i32 %5, %7, !dbg !223
  %and = and i32 %shr, 1, !dbg !224
  store i32 %and, i32* %retval, align 4, !dbg !225
  br label %return, !dbg !225

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %retVal, metadata !226, metadata !DIExpression()), !dbg !228
  %8 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !229
  %handle = getelementptr inbounds %struct.BitStream, %struct.BitStream* %8, i32 0, i32 0, !dbg !230
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %handle, align 8, !dbg !230
  %call = call i32 @getc(%struct._IO_FILE* %9), !dbg !231
  store i32 %call, i32* %retVal, align 4, !dbg !228
  %10 = load i32, i32* %retVal, align 4, !dbg !232
  %cmp3 = icmp eq i32 %10, -1, !dbg !234
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !235

if.then4:                                         ; preds = %if.else
  store i32 2, i32* %retval, align 4, !dbg !236
  br label %return, !dbg !236

if.end:                                           ; preds = %if.else
  %11 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !238
  %buffLive5 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %11, i32 0, i32 2, !dbg !239
  store i32 7, i32* %buffLive5, align 4, !dbg !240
  %12 = load i32, i32* %retVal, align 4, !dbg !241
  %13 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !242
  %buffer6 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %13, i32 0, i32 1, !dbg !243
  store i32 %12, i32* %buffer6, align 8, !dbg !244
  %14 = load %struct.BitStream*, %struct.BitStream** %bs.addr, align 8, !dbg !245
  %buffer7 = getelementptr inbounds %struct.BitStream, %struct.BitStream* %14, i32 0, i32 1, !dbg !246
  %15 = load i32, i32* %buffer7, align 8, !dbg !246
  %shr8 = ashr i32 %15, 7, !dbg !247
  %and9 = and i32 %shr8, 1, !dbg !248
  store i32 %and9, i32* %retval, align 4, !dbg !249
  br label %return, !dbg !249

return:                                           ; preds = %if.end, %if.then4, %if.then
  %16 = load i32, i32* %retval, align 4, !dbg !250
  ret i32 %16, !dbg !250
}

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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/ikos_cases/fileread3.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 43, type: !13, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/ikos_cases/fileread3.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{!15, !15, !16}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocalVariable(name: "argc", arg: 1, scope: !11, file: !12, line: 43, type: !15)
!20 = !DILocation(line: 43, column: 14, scope: !11)
!21 = !DILocalVariable(name: "argv", arg: 2, scope: !11, file: !12, line: 43, type: !16)
!22 = !DILocation(line: 43, column: 27, scope: !11)
!23 = !DILocalVariable(name: "inFileName", scope: !11, file: !12, line: 44, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 280, elements: !26)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "Char", file: !12, line: 5, baseType: !18)
!26 = !{!27}
!27 = !DISubrange(count: 35)
!28 = !DILocation(line: 44, column: 10, scope: !11)
!29 = !DILocalVariable(name: "bStart", scope: !11, file: !12, line: 45, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 1120, elements: !26)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "Int32", file: !12, line: 3, baseType: !15)
!32 = !DILocation(line: 45, column: 11, scope: !11)
!33 = !DILocalVariable(name: "inFile", scope: !11, file: !12, line: 46, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !36, line: 7, baseType: !37)
!36 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !38, line: 49, size: 1728, elements: !39)
!38 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!39 = !{!40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !55, !57, !58, !59, !63, !65, !67, !71, !74, !76, !79, !82, !83, !84, !88, !89}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !37, file: !38, line: 51, baseType: !15, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !37, file: !38, line: 54, baseType: !17, size: 64, offset: 64)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !37, file: !38, line: 55, baseType: !17, size: 64, offset: 128)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !37, file: !38, line: 56, baseType: !17, size: 64, offset: 192)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !37, file: !38, line: 57, baseType: !17, size: 64, offset: 256)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !37, file: !38, line: 58, baseType: !17, size: 64, offset: 320)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !37, file: !38, line: 59, baseType: !17, size: 64, offset: 384)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !37, file: !38, line: 60, baseType: !17, size: 64, offset: 448)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !37, file: !38, line: 61, baseType: !17, size: 64, offset: 512)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !37, file: !38, line: 64, baseType: !17, size: 64, offset: 576)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !37, file: !38, line: 65, baseType: !17, size: 64, offset: 640)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !37, file: !38, line: 66, baseType: !17, size: 64, offset: 704)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !37, file: !38, line: 68, baseType: !53, size: 64, offset: 768)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !38, line: 36, flags: DIFlagFwdDecl)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !37, file: !38, line: 70, baseType: !56, size: 64, offset: 832)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !37, file: !38, line: 72, baseType: !15, size: 32, offset: 896)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !37, file: !38, line: 73, baseType: !15, size: 32, offset: 928)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !37, file: !38, line: 74, baseType: !60, size: 64, offset: 960)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !61, line: 152, baseType: !62)
!61 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!62 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !37, file: !38, line: 77, baseType: !64, size: 16, offset: 1024)
!64 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !37, file: !38, line: 78, baseType: !66, size: 8, offset: 1040)
!66 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !37, file: !38, line: 79, baseType: !68, size: 8, offset: 1048)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 8, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 1)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !37, file: !38, line: 81, baseType: !72, size: 64, offset: 1088)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !38, line: 43, baseType: null)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !37, file: !38, line: 89, baseType: !75, size: 64, offset: 1152)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !61, line: 153, baseType: !62)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !37, file: !38, line: 91, baseType: !77, size: 64, offset: 1216)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !38, line: 37, flags: DIFlagFwdDecl)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !37, file: !38, line: 92, baseType: !80, size: 64, offset: 1280)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !38, line: 38, flags: DIFlagFwdDecl)
!82 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !37, file: !38, line: 93, baseType: !56, size: 64, offset: 1344)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !37, file: !38, line: 94, baseType: !4, size: 64, offset: 1408)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !37, file: !38, line: 95, baseType: !85, size: 64, offset: 1472)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !86, line: 46, baseType: !87)
!86 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!87 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !37, file: !38, line: 96, baseType: !15, size: 32, offset: 1536)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !37, file: !38, line: 98, baseType: !90, size: 160, offset: 1568)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !91)
!91 = !{!92}
!92 = !DISubrange(count: 20)
!93 = !DILocation(line: 46, column: 17, scope: !11)
!94 = !DILocalVariable(name: "outFile", scope: !11, file: !12, line: 47, type: !34)
!95 = !DILocation(line: 47, column: 17, scope: !11)
!96 = !DILocalVariable(name: "b", scope: !11, file: !12, line: 48, type: !31)
!97 = !DILocation(line: 48, column: 12, scope: !11)
!98 = !DILocalVariable(name: "bsIn", scope: !11, file: !12, line: 49, type: !99)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "BitStream", file: !12, line: 13, baseType: !101)
!101 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !12, line: 8, size: 192, elements: !102)
!102 = !{!103, !104, !105, !106}
!103 = !DIDerivedType(tag: DW_TAG_member, name: "handle", scope: !101, file: !12, line: 9, baseType: !34, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "buffer", scope: !101, file: !12, line: 10, baseType: !31, size: 32, offset: 64)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "buffLive", scope: !101, file: !12, line: 11, baseType: !31, size: 32, offset: 96)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !101, file: !12, line: 12, baseType: !25, size: 8, offset: 128)
!107 = !DILocation(line: 49, column: 17, scope: !11)
!108 = !DILocalVariable(name: "bsWr", scope: !11, file: !12, line: 49, type: !99)
!109 = !DILocation(line: 49, column: 24, scope: !11)
!110 = !DILocalVariable(name: "bitsRead", scope: !11, file: !12, line: 50, type: !111)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "UInt32", file: !12, line: 2, baseType: !112)
!112 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!113 = !DILocation(line: 50, column: 17, scope: !11)
!114 = !DILocalVariable(name: "buffHi", scope: !11, file: !12, line: 50, type: !111)
!115 = !DILocation(line: 50, column: 27, scope: !11)
!116 = !DILocalVariable(name: "buffLo", scope: !11, file: !12, line: 50, type: !111)
!117 = !DILocation(line: 50, column: 35, scope: !11)
!118 = !DILocalVariable(name: "blockCRC", scope: !11, file: !12, line: 50, type: !111)
!119 = !DILocation(line: 50, column: 43, scope: !11)
!120 = !DILocalVariable(name: "currBlock", scope: !11, file: !12, line: 50, type: !111)
!121 = !DILocation(line: 50, column: 53, scope: !11)
!122 = !DILocalVariable(name: "str", scope: !11, file: !12, line: 51, type: !123)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 480, elements: !124)
!124 = !{!125}
!125 = !DISubrange(count: 60)
!126 = !DILocation(line: 51, column: 10, scope: !11)
!127 = !DILocation(line: 53, column: 22, scope: !11)
!128 = !DILocation(line: 53, column: 14, scope: !11)
!129 = !DILocation(line: 53, column: 12, scope: !11)
!130 = !DILocation(line: 54, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !11, file: !12, line: 54, column: 9)
!132 = !DILocation(line: 54, column: 16, scope: !131)
!133 = !DILocation(line: 54, column: 9, scope: !11)
!134 = !DILocation(line: 55, column: 9, scope: !135)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 54, column: 25)
!136 = !DILocation(line: 57, column: 31, scope: !11)
!137 = !DILocation(line: 57, column: 12, scope: !11)
!138 = !DILocation(line: 57, column: 10, scope: !11)
!139 = !DILocation(line: 59, column: 14, scope: !11)
!140 = !DILocation(line: 60, column: 21, scope: !11)
!141 = !DILocation(line: 60, column: 12, scope: !11)
!142 = !DILocation(line: 61, column: 15, scope: !11)
!143 = !DILocation(line: 62, column: 12, scope: !11)
!144 = !DILocation(line: 62, column: 5, scope: !11)
!145 = !DILocation(line: 62, column: 23, scope: !11)
!146 = !DILocation(line: 63, column: 5, scope: !11)
!147 = !DILocation(line: 64, column: 22, scope: !148)
!148 = distinct !DILexicalBlock(scope: !11, file: !12, line: 63, column: 15)
!149 = !DILocation(line: 64, column: 13, scope: !148)
!150 = !DILocation(line: 64, column: 11, scope: !148)
!151 = !DILocation(line: 65, column: 17, scope: !148)
!152 = !DILocation(line: 66, column: 13, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 66, column: 13)
!154 = !DILocation(line: 66, column: 15, scope: !153)
!155 = !DILocation(line: 66, column: 13, scope: !148)
!156 = !DILocation(line: 67, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !158, file: !12, line: 67, column: 17)
!158 = distinct !DILexicalBlock(scope: !153, file: !12, line: 66, column: 21)
!159 = !DILocation(line: 67, column: 36, scope: !157)
!160 = !DILocation(line: 67, column: 29, scope: !157)
!161 = !DILocation(line: 67, column: 26, scope: !157)
!162 = !DILocation(line: 67, column: 47, scope: !157)
!163 = !DILocation(line: 68, column: 18, scope: !157)
!164 = !DILocation(line: 68, column: 36, scope: !157)
!165 = !DILocation(line: 68, column: 29, scope: !157)
!166 = !DILocation(line: 68, column: 27, scope: !157)
!167 = !DILocation(line: 68, column: 48, scope: !157)
!168 = !DILocation(line: 67, column: 17, scope: !158)
!169 = !DILocation(line: 69, column: 17, scope: !170)
!170 = distinct !DILexicalBlock(scope: !157, file: !12, line: 68, column: 55)
!171 = !DILocation(line: 71, column: 9, scope: !158)
!172 = !DILocation(line: 72, column: 18, scope: !148)
!173 = distinct !{!173, !146, !174}
!174 = !DILocation(line: 73, column: 5, scope: !11)
!175 = !DILocation(line: 74, column: 5, scope: !11)
!176 = !DILocation(line: 75, column: 1, scope: !11)
!177 = distinct !DISubprogram(name: "bsOpenReadStream", scope: !12, file: !12, line: 15, type: !178, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!178 = !DISubroutineType(types: !179)
!179 = !{!99, !34}
!180 = !DILocalVariable(name: "stream", arg: 1, scope: !177, file: !12, line: 15, type: !34)
!181 = !DILocation(line: 15, column: 44, scope: !177)
!182 = !DILocalVariable(name: "bs", scope: !177, file: !12, line: 17, type: !99)
!183 = !DILocation(line: 17, column: 16, scope: !177)
!184 = !DILocation(line: 17, column: 21, scope: !177)
!185 = !DILocation(line: 18, column: 9, scope: !186)
!186 = distinct !DILexicalBlock(scope: !177, file: !12, line: 18, column: 9)
!187 = !DILocation(line: 18, column: 12, scope: !186)
!188 = !DILocation(line: 18, column: 9, scope: !177)
!189 = !DILocation(line: 18, column: 21, scope: !186)
!190 = !DILocation(line: 19, column: 18, scope: !177)
!191 = !DILocation(line: 19, column: 5, scope: !177)
!192 = !DILocation(line: 19, column: 9, scope: !177)
!193 = !DILocation(line: 19, column: 16, scope: !177)
!194 = !DILocation(line: 20, column: 5, scope: !177)
!195 = !DILocation(line: 20, column: 9, scope: !177)
!196 = !DILocation(line: 20, column: 16, scope: !177)
!197 = !DILocation(line: 21, column: 5, scope: !177)
!198 = !DILocation(line: 21, column: 9, scope: !177)
!199 = !DILocation(line: 21, column: 18, scope: !177)
!200 = !DILocation(line: 22, column: 5, scope: !177)
!201 = !DILocation(line: 22, column: 9, scope: !177)
!202 = !DILocation(line: 22, column: 14, scope: !177)
!203 = !DILocation(line: 23, column: 12, scope: !177)
!204 = !DILocation(line: 23, column: 5, scope: !177)
!205 = distinct !DISubprogram(name: "bsGetBit", scope: !12, file: !12, line: 26, type: !206, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!206 = !DISubroutineType(types: !207)
!207 = !{!31, !99}
!208 = !DILocalVariable(name: "bs", arg: 1, scope: !205, file: !12, line: 26, type: !99)
!209 = !DILocation(line: 26, column: 36, scope: !205)
!210 = !DILocation(line: 28, column: 9, scope: !211)
!211 = distinct !DILexicalBlock(scope: !205, file: !12, line: 28, column: 9)
!212 = !DILocation(line: 28, column: 13, scope: !211)
!213 = !DILocation(line: 28, column: 22, scope: !211)
!214 = !DILocation(line: 28, column: 9, scope: !205)
!215 = !DILocation(line: 29, column: 9, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !12, line: 28, column: 27)
!217 = !DILocation(line: 29, column: 13, scope: !216)
!218 = !DILocation(line: 29, column: 22, scope: !216)
!219 = !DILocation(line: 30, column: 20, scope: !216)
!220 = !DILocation(line: 30, column: 24, scope: !216)
!221 = !DILocation(line: 30, column: 36, scope: !216)
!222 = !DILocation(line: 30, column: 40, scope: !216)
!223 = !DILocation(line: 30, column: 32, scope: !216)
!224 = !DILocation(line: 30, column: 51, scope: !216)
!225 = !DILocation(line: 30, column: 9, scope: !216)
!226 = !DILocalVariable(name: "retVal", scope: !227, file: !12, line: 32, type: !31)
!227 = distinct !DILexicalBlock(scope: !211, file: !12, line: 31, column: 12)
!228 = !DILocation(line: 32, column: 15, scope: !227)
!229 = !DILocation(line: 32, column: 31, scope: !227)
!230 = !DILocation(line: 32, column: 35, scope: !227)
!231 = !DILocation(line: 32, column: 24, scope: !227)
!232 = !DILocation(line: 33, column: 14, scope: !233)
!233 = distinct !DILexicalBlock(scope: !227, file: !12, line: 33, column: 14)
!234 = !DILocation(line: 33, column: 21, scope: !233)
!235 = !DILocation(line: 33, column: 14, scope: !227)
!236 = !DILocation(line: 34, column: 13, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !12, line: 33, column: 30)
!238 = !DILocation(line: 36, column: 9, scope: !227)
!239 = !DILocation(line: 36, column: 13, scope: !227)
!240 = !DILocation(line: 36, column: 22, scope: !227)
!241 = !DILocation(line: 37, column: 22, scope: !227)
!242 = !DILocation(line: 37, column: 9, scope: !227)
!243 = !DILocation(line: 37, column: 13, scope: !227)
!244 = !DILocation(line: 37, column: 20, scope: !227)
!245 = !DILocation(line: 38, column: 20, scope: !227)
!246 = !DILocation(line: 38, column: 24, scope: !227)
!247 = !DILocation(line: 38, column: 32, scope: !227)
!248 = !DILocation(line: 38, column: 38, scope: !227)
!249 = !DILocation(line: 38, column: 9, scope: !227)
!250 = !DILocation(line: 40, column: 1, scope: !205)
