; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 100, align 16, !dbg !22
  store i8* %0, i8** %dataBuffer, align 8, !dbg !21
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !23
  store i8* %1, i8** %data, align 8, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !25
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !25
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #5, !dbg !25
  %5 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !30, metadata !DIExpression()), !dbg !35
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !35
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !43, metadata !DIExpression()), !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !45
  %call1 = call i64 @strlen(i8* noundef %7), !dbg !46
  store i64 %call1, i64* %dataLen, align 8, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !51
  %9 = load i64, i64* %dataLen, align 8, !dbg !53
  %cmp = icmp ult i64 %8, %9, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !56
  %11 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !56
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !56
  %13 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !60
  store i8 %12, i8* %arrayidx3, align 1, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %14, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !68
  store i8 0, i8* %arrayidx4, align 1, !dbg !69
  %15 = load i8*, i8** %data, align 8, !dbg !70
  call void @printLine(i8* noundef %15), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @strlen(i8* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* noundef null), !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 noundef %conv), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06_good(), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06_bad(), !dbg !93
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !96 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %0 = alloca i8, i64 100, align 16, !dbg !101
  store i8* %0, i8** %dataBuffer, align 8, !dbg !100
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !102
  store i8* %1, i8** %data, align 8, !dbg !103
  %2 = load i8*, i8** %data, align 8, !dbg !104
  %3 = load i8*, i8** %data, align 8, !dbg !104
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !104
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !104
  %5 = load i8*, i8** %data, align 8, !dbg !107
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !107
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !109, metadata !DIExpression()), !dbg !111
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !111
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !111
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !114, metadata !DIExpression()), !dbg !115
  %7 = load i8*, i8** %data, align 8, !dbg !116
  %call1 = call i64 @strlen(i8* noundef %7), !dbg !117
  store i64 %call1, i64* %dataLen, align 8, !dbg !118
  store i64 0, i64* %i, align 8, !dbg !119
  br label %for.cond, !dbg !121

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !122
  %9 = load i64, i64* %dataLen, align 8, !dbg !124
  %cmp = icmp ult i64 %8, %9, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !127
  %11 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !127
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !127
  %13 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !131
  store i8 %12, i8* %arrayidx3, align 1, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %14, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !138
  store i8 0, i8* %arrayidx4, align 1, !dbg !139
  %15 = load i8*, i8** %data, align 8, !dbg !140
  call void @printLine(i8* noundef %15), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %0 = alloca i8, i64 100, align 16, !dbg !148
  store i8* %0, i8** %dataBuffer, align 8, !dbg !147
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !149
  store i8* %1, i8** %data, align 8, !dbg !150
  %2 = load i8*, i8** %data, align 8, !dbg !151
  %3 = load i8*, i8** %data, align 8, !dbg !151
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !151
  %call = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #5, !dbg !151
  %5 = load i8*, i8** %data, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !154
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !156, metadata !DIExpression()), !dbg !158
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !158
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !161, metadata !DIExpression()), !dbg !162
  %7 = load i8*, i8** %data, align 8, !dbg !163
  %call1 = call i64 @strlen(i8* noundef %7), !dbg !164
  store i64 %call1, i64* %dataLen, align 8, !dbg !165
  store i64 0, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !168

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !169
  %9 = load i64, i64* %dataLen, align 8, !dbg !171
  %cmp = icmp ult i64 %8, %9, !dbg !172
  br i1 %cmp, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !174
  %11 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx2 = getelementptr inbounds i8, i8* %10, i64 %11, !dbg !174
  %12 = load i8, i8* %arrayidx2, align 1, !dbg !174
  %13 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 %13, !dbg !178
  store i8 %12, i8* %arrayidx3, align 1, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %14, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !185
  store i8 0, i8* %arrayidx4, align 1, !dbg !186
  %15 = load i8*, i8** %data, align 8, !dbg !187
  call void @printLine(i8* noundef %15), !dbg !188
  ret void, !dbg !189
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"Homebrew clang version 14.0.6"}
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06_bad", scope: !14, file: !14, line: 27, type: !15, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 29, type: !3)
!19 = !DILocation(line: 29, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 30, type: !3)
!21 = !DILocation(line: 30, column: 12, scope: !13)
!22 = !DILocation(line: 30, column: 33, scope: !13)
!23 = !DILocation(line: 31, column: 12, scope: !13)
!24 = !DILocation(line: 31, column: 10, scope: !13)
!25 = !DILocation(line: 35, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !14, line: 33, column: 5)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 32, column: 8)
!28 = !DILocation(line: 36, column: 9, scope: !26)
!29 = !DILocation(line: 36, column: 21, scope: !26)
!30 = !DILocalVariable(name: "dest", scope: !31, file: !14, line: 39, type: !32)
!31 = distinct !DILexicalBlock(scope: !13, file: !14, line: 38, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 39, column: 14, scope: !31)
!36 = !DILocalVariable(name: "i", scope: !31, file: !14, line: 40, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 31, baseType: !39)
!38 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !40, line: 94, baseType: !41)
!40 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!41 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 40, column: 16, scope: !31)
!43 = !DILocalVariable(name: "dataLen", scope: !31, file: !14, line: 40, type: !37)
!44 = !DILocation(line: 40, column: 19, scope: !31)
!45 = !DILocation(line: 41, column: 26, scope: !31)
!46 = !DILocation(line: 41, column: 19, scope: !31)
!47 = !DILocation(line: 41, column: 17, scope: !31)
!48 = !DILocation(line: 43, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !31, file: !14, line: 43, column: 9)
!50 = !DILocation(line: 43, column: 14, scope: !49)
!51 = !DILocation(line: 43, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 43, column: 9)
!53 = !DILocation(line: 43, column: 25, scope: !52)
!54 = !DILocation(line: 43, column: 23, scope: !52)
!55 = !DILocation(line: 43, column: 9, scope: !49)
!56 = !DILocation(line: 45, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !14, line: 44, column: 9)
!58 = !DILocation(line: 45, column: 28, scope: !57)
!59 = !DILocation(line: 45, column: 18, scope: !57)
!60 = !DILocation(line: 45, column: 13, scope: !57)
!61 = !DILocation(line: 45, column: 21, scope: !57)
!62 = !DILocation(line: 46, column: 9, scope: !57)
!63 = !DILocation(line: 43, column: 35, scope: !52)
!64 = !DILocation(line: 43, column: 9, scope: !52)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 46, column: 9, scope: !49)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 47, column: 9, scope: !31)
!69 = !DILocation(line: 47, column: 20, scope: !31)
!70 = !DILocation(line: 48, column: 19, scope: !31)
!71 = !DILocation(line: 48, column: 9, scope: !31)
!72 = !DILocation(line: 50, column: 1, scope: !13)
!73 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_char_alloca_loop_06_good", scope: !14, file: !14, line: 113, type: !15, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!74 = !DILocation(line: 115, column: 5, scope: !73)
!75 = !DILocation(line: 116, column: 5, scope: !73)
!76 = !DILocation(line: 117, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 129, type: !78, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!78 = !DISubroutineType(types: !79)
!79 = !{!80, !80, !81}
!80 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !14, line: 129, type: !80)
!83 = !DILocation(line: 129, column: 14, scope: !77)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !14, line: 129, type: !81)
!85 = !DILocation(line: 129, column: 27, scope: !77)
!86 = !DILocation(line: 132, column: 22, scope: !77)
!87 = !DILocation(line: 132, column: 12, scope: !77)
!88 = !DILocation(line: 132, column: 5, scope: !77)
!89 = !DILocation(line: 134, column: 5, scope: !77)
!90 = !DILocation(line: 135, column: 5, scope: !77)
!91 = !DILocation(line: 136, column: 5, scope: !77)
!92 = !DILocation(line: 139, column: 5, scope: !77)
!93 = !DILocation(line: 140, column: 5, scope: !77)
!94 = !DILocation(line: 141, column: 5, scope: !77)
!95 = !DILocation(line: 143, column: 5, scope: !77)
!96 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!97 = !DILocalVariable(name: "data", scope: !96, file: !14, line: 59, type: !3)
!98 = !DILocation(line: 59, column: 12, scope: !96)
!99 = !DILocalVariable(name: "dataBuffer", scope: !96, file: !14, line: 60, type: !3)
!100 = !DILocation(line: 60, column: 12, scope: !96)
!101 = !DILocation(line: 60, column: 33, scope: !96)
!102 = !DILocation(line: 61, column: 12, scope: !96)
!103 = !DILocation(line: 61, column: 10, scope: !96)
!104 = !DILocation(line: 70, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !14, line: 68, column: 5)
!106 = distinct !DILexicalBlock(scope: !96, file: !14, line: 62, column: 8)
!107 = !DILocation(line: 71, column: 9, scope: !105)
!108 = !DILocation(line: 71, column: 20, scope: !105)
!109 = !DILocalVariable(name: "dest", scope: !110, file: !14, line: 74, type: !32)
!110 = distinct !DILexicalBlock(scope: !96, file: !14, line: 73, column: 5)
!111 = !DILocation(line: 74, column: 14, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !110, file: !14, line: 75, type: !37)
!113 = !DILocation(line: 75, column: 16, scope: !110)
!114 = !DILocalVariable(name: "dataLen", scope: !110, file: !14, line: 75, type: !37)
!115 = !DILocation(line: 75, column: 19, scope: !110)
!116 = !DILocation(line: 76, column: 26, scope: !110)
!117 = !DILocation(line: 76, column: 19, scope: !110)
!118 = !DILocation(line: 76, column: 17, scope: !110)
!119 = !DILocation(line: 78, column: 16, scope: !120)
!120 = distinct !DILexicalBlock(scope: !110, file: !14, line: 78, column: 9)
!121 = !DILocation(line: 78, column: 14, scope: !120)
!122 = !DILocation(line: 78, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 78, column: 9)
!124 = !DILocation(line: 78, column: 25, scope: !123)
!125 = !DILocation(line: 78, column: 23, scope: !123)
!126 = !DILocation(line: 78, column: 9, scope: !120)
!127 = !DILocation(line: 80, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !123, file: !14, line: 79, column: 9)
!129 = !DILocation(line: 80, column: 28, scope: !128)
!130 = !DILocation(line: 80, column: 18, scope: !128)
!131 = !DILocation(line: 80, column: 13, scope: !128)
!132 = !DILocation(line: 80, column: 21, scope: !128)
!133 = !DILocation(line: 81, column: 9, scope: !128)
!134 = !DILocation(line: 78, column: 35, scope: !123)
!135 = !DILocation(line: 78, column: 9, scope: !123)
!136 = distinct !{!136, !126, !137, !67}
!137 = !DILocation(line: 81, column: 9, scope: !120)
!138 = !DILocation(line: 82, column: 9, scope: !110)
!139 = !DILocation(line: 82, column: 20, scope: !110)
!140 = !DILocation(line: 83, column: 19, scope: !110)
!141 = !DILocation(line: 83, column: 9, scope: !110)
!142 = !DILocation(line: 85, column: 1, scope: !96)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!144 = !DILocalVariable(name: "data", scope: !143, file: !14, line: 90, type: !3)
!145 = !DILocation(line: 90, column: 12, scope: !143)
!146 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !14, line: 91, type: !3)
!147 = !DILocation(line: 91, column: 12, scope: !143)
!148 = !DILocation(line: 91, column: 33, scope: !143)
!149 = !DILocation(line: 92, column: 12, scope: !143)
!150 = !DILocation(line: 92, column: 10, scope: !143)
!151 = !DILocation(line: 96, column: 9, scope: !152)
!152 = distinct !DILexicalBlock(scope: !153, file: !14, line: 94, column: 5)
!153 = distinct !DILexicalBlock(scope: !143, file: !14, line: 93, column: 8)
!154 = !DILocation(line: 97, column: 9, scope: !152)
!155 = !DILocation(line: 97, column: 20, scope: !152)
!156 = !DILocalVariable(name: "dest", scope: !157, file: !14, line: 100, type: !32)
!157 = distinct !DILexicalBlock(scope: !143, file: !14, line: 99, column: 5)
!158 = !DILocation(line: 100, column: 14, scope: !157)
!159 = !DILocalVariable(name: "i", scope: !157, file: !14, line: 101, type: !37)
!160 = !DILocation(line: 101, column: 16, scope: !157)
!161 = !DILocalVariable(name: "dataLen", scope: !157, file: !14, line: 101, type: !37)
!162 = !DILocation(line: 101, column: 19, scope: !157)
!163 = !DILocation(line: 102, column: 26, scope: !157)
!164 = !DILocation(line: 102, column: 19, scope: !157)
!165 = !DILocation(line: 102, column: 17, scope: !157)
!166 = !DILocation(line: 104, column: 16, scope: !167)
!167 = distinct !DILexicalBlock(scope: !157, file: !14, line: 104, column: 9)
!168 = !DILocation(line: 104, column: 14, scope: !167)
!169 = !DILocation(line: 104, column: 21, scope: !170)
!170 = distinct !DILexicalBlock(scope: !167, file: !14, line: 104, column: 9)
!171 = !DILocation(line: 104, column: 25, scope: !170)
!172 = !DILocation(line: 104, column: 23, scope: !170)
!173 = !DILocation(line: 104, column: 9, scope: !167)
!174 = !DILocation(line: 106, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !170, file: !14, line: 105, column: 9)
!176 = !DILocation(line: 106, column: 28, scope: !175)
!177 = !DILocation(line: 106, column: 18, scope: !175)
!178 = !DILocation(line: 106, column: 13, scope: !175)
!179 = !DILocation(line: 106, column: 21, scope: !175)
!180 = !DILocation(line: 107, column: 9, scope: !175)
!181 = !DILocation(line: 104, column: 35, scope: !170)
!182 = !DILocation(line: 104, column: 9, scope: !170)
!183 = distinct !{!183, !173, !184, !67}
!184 = !DILocation(line: 107, column: 9, scope: !167)
!185 = !DILocation(line: 108, column: 9, scope: !157)
!186 = !DILocation(line: 108, column: 20, scope: !157)
!187 = !DILocation(line: 109, column: 19, scope: !157)
!188 = !DILocation(line: 109, column: 9, scope: !157)
!189 = !DILocation(line: 111, column: 1, scope: !143)
