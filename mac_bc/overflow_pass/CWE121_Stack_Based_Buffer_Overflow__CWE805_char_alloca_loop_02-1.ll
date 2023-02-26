; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = alloca i8, i64 50, align 16, !dbg !22
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %1 = alloca i8, i64 100, align 16, !dbg !25
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !24
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !26
  store i8* %2, i8** %data, align 8, !dbg !29
  %3 = load i8*, i8** %data, align 8, !dbg !30
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  call void @llvm.dbg.declare(metadata i64* %i, metadata !32, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx1, align 1, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %4, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !57
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !57
  %7 = load i8*, i8** %data, align 8, !dbg !58
  %8 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !58
  store i8 %6, i8* %arrayidx3, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %9, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !67
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !67
  store i8 0, i8* %arrayidx4, align 1, !dbg !68
  %11 = load i8*, i8** %data, align 8, !dbg !69
  call void @printLine(i8* noundef %11), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* noundef null), !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 noundef %conv), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02_good(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02_bad(), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 50, align 16, !dbg !100
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !99
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %1 = alloca i8, i64 100, align 16, !dbg !103
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !102
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !104
  store i8* %2, i8** %data, align 8, !dbg !107
  %3 = load i8*, i8** %data, align 8, !dbg !108
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !109
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx1, align 1, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %4, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !125
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !127
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !127
  %7 = load i8*, i8** %data, align 8, !dbg !128
  %8 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !128
  store i8 %6, i8* %arrayidx3, align 1, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %9, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !136
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !136
  store i8 0, i8* %arrayidx4, align 1, !dbg !137
  %11 = load i8*, i8** %data, align 8, !dbg !138
  call void @printLine(i8* noundef %11), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %0 = alloca i8, i64 50, align 16, !dbg !146
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !145
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !147, metadata !DIExpression()), !dbg !148
  %1 = alloca i8, i64 100, align 16, !dbg !149
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !148
  %2 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !150
  store i8* %2, i8** %data, align 8, !dbg !153
  %3 = load i8*, i8** %data, align 8, !dbg !154
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 0, !dbg !154
  store i8 0, i8* %arrayidx, align 1, !dbg !155
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !161
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx1, align 1, !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !167
  %cmp = icmp ult i64 %4, 100, !dbg !169
  br i1 %cmp, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %5 = load i64, i64* %i, align 8, !dbg !171
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %5, !dbg !173
  %6 = load i8, i8* %arrayidx2, align 1, !dbg !173
  %7 = load i8*, i8** %data, align 8, !dbg !174
  %8 = load i64, i64* %i, align 8, !dbg !175
  %arrayidx3 = getelementptr inbounds i8, i8* %7, i64 %8, !dbg !174
  store i8 %6, i8* %arrayidx3, align 1, !dbg !176
  br label %for.inc, !dbg !177

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !178
  %inc = add i64 %9, 1, !dbg !178
  store i64 %inc, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !179, !llvm.loop !180

for.end:                                          ; preds = %for.cond
  %10 = load i8*, i8** %data, align 8, !dbg !182
  %arrayidx4 = getelementptr inbounds i8, i8* %10, i64 99, !dbg !182
  store i8 0, i8* %arrayidx4, align 1, !dbg !183
  %11 = load i8*, i8** %data, align 8, !dbg !184
  call void @printLine(i8* noundef %11), !dbg !185
  ret void, !dbg !186
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !3)
!19 = !DILocation(line: 25, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 26, type: !3)
!21 = !DILocation(line: 26, column: 12, scope: !13)
!22 = !DILocation(line: 26, column: 36, scope: !13)
!23 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 27, type: !3)
!24 = !DILocation(line: 27, column: 12, scope: !13)
!25 = !DILocation(line: 27, column: 37, scope: !13)
!26 = !DILocation(line: 32, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !14, line: 29, column: 5)
!28 = distinct !DILexicalBlock(scope: !13, file: !14, line: 28, column: 8)
!29 = !DILocation(line: 32, column: 14, scope: !27)
!30 = !DILocation(line: 33, column: 9, scope: !27)
!31 = !DILocation(line: 33, column: 17, scope: !27)
!32 = !DILocalVariable(name: "i", scope: !33, file: !14, line: 36, type: !34)
!33 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !35, line: 31, baseType: !36)
!35 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !37, line: 94, baseType: !38)
!37 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 36, column: 16, scope: !33)
!40 = !DILocalVariable(name: "source", scope: !33, file: !14, line: 37, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 37, column: 14, scope: !33)
!45 = !DILocation(line: 38, column: 9, scope: !33)
!46 = !DILocation(line: 39, column: 9, scope: !33)
!47 = !DILocation(line: 39, column: 23, scope: !33)
!48 = !DILocation(line: 41, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !33, file: !14, line: 41, column: 9)
!50 = !DILocation(line: 41, column: 14, scope: !49)
!51 = !DILocation(line: 41, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 41, column: 9)
!53 = !DILocation(line: 41, column: 23, scope: !52)
!54 = !DILocation(line: 41, column: 9, scope: !49)
!55 = !DILocation(line: 43, column: 30, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 42, column: 9)
!57 = !DILocation(line: 43, column: 23, scope: !56)
!58 = !DILocation(line: 43, column: 13, scope: !56)
!59 = !DILocation(line: 43, column: 18, scope: !56)
!60 = !DILocation(line: 43, column: 21, scope: !56)
!61 = !DILocation(line: 44, column: 9, scope: !56)
!62 = !DILocation(line: 41, column: 31, scope: !52)
!63 = !DILocation(line: 41, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 44, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 45, column: 9, scope: !33)
!68 = !DILocation(line: 45, column: 21, scope: !33)
!69 = !DILocation(line: 46, column: 19, scope: !33)
!70 = !DILocation(line: 46, column: 9, scope: !33)
!71 = !DILocation(line: 48, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_char_alloca_loop_02_good", scope: !14, file: !14, line: 113, type: !15, scopeLine: 114, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!73 = !DILocation(line: 115, column: 5, scope: !72)
!74 = !DILocation(line: 116, column: 5, scope: !72)
!75 = !DILocation(line: 117, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 129, type: !77, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !14, line: 129, type: !79)
!82 = !DILocation(line: 129, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !14, line: 129, type: !80)
!84 = !DILocation(line: 129, column: 27, scope: !76)
!85 = !DILocation(line: 132, column: 22, scope: !76)
!86 = !DILocation(line: 132, column: 12, scope: !76)
!87 = !DILocation(line: 132, column: 5, scope: !76)
!88 = !DILocation(line: 134, column: 5, scope: !76)
!89 = !DILocation(line: 135, column: 5, scope: !76)
!90 = !DILocation(line: 136, column: 5, scope: !76)
!91 = !DILocation(line: 139, column: 5, scope: !76)
!92 = !DILocation(line: 140, column: 5, scope: !76)
!93 = !DILocation(line: 141, column: 5, scope: !76)
!94 = !DILocation(line: 143, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 57, type: !3)
!97 = !DILocation(line: 57, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBadBuffer", scope: !95, file: !14, line: 58, type: !3)
!99 = !DILocation(line: 58, column: 12, scope: !95)
!100 = !DILocation(line: 58, column: 36, scope: !95)
!101 = !DILocalVariable(name: "dataGoodBuffer", scope: !95, file: !14, line: 59, type: !3)
!102 = !DILocation(line: 59, column: 12, scope: !95)
!103 = !DILocation(line: 59, column: 37, scope: !95)
!104 = !DILocation(line: 68, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !106, file: !14, line: 66, column: 5)
!106 = distinct !DILexicalBlock(scope: !95, file: !14, line: 60, column: 8)
!107 = !DILocation(line: 68, column: 14, scope: !105)
!108 = !DILocation(line: 69, column: 9, scope: !105)
!109 = !DILocation(line: 69, column: 17, scope: !105)
!110 = !DILocalVariable(name: "i", scope: !111, file: !14, line: 72, type: !34)
!111 = distinct !DILexicalBlock(scope: !95, file: !14, line: 71, column: 5)
!112 = !DILocation(line: 72, column: 16, scope: !111)
!113 = !DILocalVariable(name: "source", scope: !111, file: !14, line: 73, type: !41)
!114 = !DILocation(line: 73, column: 14, scope: !111)
!115 = !DILocation(line: 74, column: 9, scope: !111)
!116 = !DILocation(line: 75, column: 9, scope: !111)
!117 = !DILocation(line: 75, column: 23, scope: !111)
!118 = !DILocation(line: 77, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !14, line: 77, column: 9)
!120 = !DILocation(line: 77, column: 14, scope: !119)
!121 = !DILocation(line: 77, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !14, line: 77, column: 9)
!123 = !DILocation(line: 77, column: 23, scope: !122)
!124 = !DILocation(line: 77, column: 9, scope: !119)
!125 = !DILocation(line: 79, column: 30, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !14, line: 78, column: 9)
!127 = !DILocation(line: 79, column: 23, scope: !126)
!128 = !DILocation(line: 79, column: 13, scope: !126)
!129 = !DILocation(line: 79, column: 18, scope: !126)
!130 = !DILocation(line: 79, column: 21, scope: !126)
!131 = !DILocation(line: 80, column: 9, scope: !126)
!132 = !DILocation(line: 77, column: 31, scope: !122)
!133 = !DILocation(line: 77, column: 9, scope: !122)
!134 = distinct !{!134, !124, !135, !66}
!135 = !DILocation(line: 80, column: 9, scope: !119)
!136 = !DILocation(line: 81, column: 9, scope: !111)
!137 = !DILocation(line: 81, column: 21, scope: !111)
!138 = !DILocation(line: 82, column: 19, scope: !111)
!139 = !DILocation(line: 82, column: 9, scope: !111)
!140 = !DILocation(line: 84, column: 1, scope: !95)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!142 = !DILocalVariable(name: "data", scope: !141, file: !14, line: 89, type: !3)
!143 = !DILocation(line: 89, column: 12, scope: !141)
!144 = !DILocalVariable(name: "dataBadBuffer", scope: !141, file: !14, line: 90, type: !3)
!145 = !DILocation(line: 90, column: 12, scope: !141)
!146 = !DILocation(line: 90, column: 36, scope: !141)
!147 = !DILocalVariable(name: "dataGoodBuffer", scope: !141, file: !14, line: 91, type: !3)
!148 = !DILocation(line: 91, column: 12, scope: !141)
!149 = !DILocation(line: 91, column: 37, scope: !141)
!150 = !DILocation(line: 95, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !14, line: 93, column: 5)
!152 = distinct !DILexicalBlock(scope: !141, file: !14, line: 92, column: 8)
!153 = !DILocation(line: 95, column: 14, scope: !151)
!154 = !DILocation(line: 96, column: 9, scope: !151)
!155 = !DILocation(line: 96, column: 17, scope: !151)
!156 = !DILocalVariable(name: "i", scope: !157, file: !14, line: 99, type: !34)
!157 = distinct !DILexicalBlock(scope: !141, file: !14, line: 98, column: 5)
!158 = !DILocation(line: 99, column: 16, scope: !157)
!159 = !DILocalVariable(name: "source", scope: !157, file: !14, line: 100, type: !41)
!160 = !DILocation(line: 100, column: 14, scope: !157)
!161 = !DILocation(line: 101, column: 9, scope: !157)
!162 = !DILocation(line: 102, column: 9, scope: !157)
!163 = !DILocation(line: 102, column: 23, scope: !157)
!164 = !DILocation(line: 104, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !157, file: !14, line: 104, column: 9)
!166 = !DILocation(line: 104, column: 14, scope: !165)
!167 = !DILocation(line: 104, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !14, line: 104, column: 9)
!169 = !DILocation(line: 104, column: 23, scope: !168)
!170 = !DILocation(line: 104, column: 9, scope: !165)
!171 = !DILocation(line: 106, column: 30, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !14, line: 105, column: 9)
!173 = !DILocation(line: 106, column: 23, scope: !172)
!174 = !DILocation(line: 106, column: 13, scope: !172)
!175 = !DILocation(line: 106, column: 18, scope: !172)
!176 = !DILocation(line: 106, column: 21, scope: !172)
!177 = !DILocation(line: 107, column: 9, scope: !172)
!178 = !DILocation(line: 104, column: 31, scope: !168)
!179 = !DILocation(line: 104, column: 9, scope: !168)
!180 = distinct !{!180, !170, !181, !66}
!181 = !DILocation(line: 107, column: 9, scope: !165)
!182 = !DILocation(line: 108, column: 9, scope: !157)
!183 = !DILocation(line: 108, column: 21, scope: !157)
!184 = !DILocation(line: 109, column: 19, scope: !157)
!185 = !DILocation(line: 109, column: 9, scope: !157)
!186 = !DILocation(line: 111, column: 1, scope: !141)
