; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = alloca i8, i64 10, align 16, !dbg !27
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !26
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %1 = alloca i8, i64 11, align 16, !dbg !30
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !29
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !31, metadata !DIExpression()), !dbg !33
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !34
  %3 = load i8*, i8** %2, align 8, !dbg !35
  store i8* %3, i8** %data1, align 8, !dbg !33
  %4 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %4, i8** %data1, align 8, !dbg !37
  %5 = load i8*, i8** %data1, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !38
  store i8 0, i8* %arrayidx, align 1, !dbg !39
  %6 = load i8*, i8** %data1, align 8, !dbg !40
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !41
  store i8* %6, i8** %7, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !43, metadata !DIExpression()), !dbg !45
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !46
  %9 = load i8*, i8** %8, align 8, !dbg !47
  store i8* %9, i8** %data2, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !48, metadata !DIExpression()), !dbg !53
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %i, metadata !54, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !61, metadata !DIExpression()), !dbg !62
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !63
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !64
  store i64 %call, i64* %sourceLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !69
  %12 = load i64, i64* %sourceLen, align 8, !dbg !71
  %add = add i64 %12, 1, !dbg !72
  %cmp = icmp ult i64 %11, %add, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %13, !dbg !77
  %14 = load i8, i8* %arrayidx3, align 1, !dbg !77
  %15 = load i8*, i8** %data2, align 8, !dbg !78
  %16 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !78
  store i8 %14, i8* %arrayidx4, align 1, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %17, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %18 = load i8*, i8** %data2, align 8, !dbg !87
  call void @printLine(i8* noundef %18), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* noundef null), !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 noundef %conv), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_good(), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !114, metadata !DIExpression()), !dbg !115
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !116, metadata !DIExpression()), !dbg !117
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !117
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = alloca i8, i64 10, align 16, !dbg !120
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !119
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %1 = alloca i8, i64 11, align 16, !dbg !123
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !122
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !124, metadata !DIExpression()), !dbg !126
  %2 = load i8**, i8*** %dataPtr1, align 8, !dbg !127
  %3 = load i8*, i8** %2, align 8, !dbg !128
  store i8* %3, i8** %data1, align 8, !dbg !126
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !129
  store i8* %4, i8** %data1, align 8, !dbg !130
  %5 = load i8*, i8** %data1, align 8, !dbg !131
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !131
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  %6 = load i8*, i8** %data1, align 8, !dbg !133
  %7 = load i8**, i8*** %dataPtr1, align 8, !dbg !134
  store i8* %6, i8** %7, align 8, !dbg !135
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !136, metadata !DIExpression()), !dbg !138
  %8 = load i8**, i8*** %dataPtr2, align 8, !dbg !139
  %9 = load i8*, i8** %8, align 8, !dbg !140
  store i8* %9, i8** %data2, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  %10 = bitcast [11 x i8]* %source to i8*, !dbg !143
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %10, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %i, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !148
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !149
  store i64 %call, i64* %sourceLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %11 = load i64, i64* %i, align 8, !dbg !154
  %12 = load i64, i64* %sourceLen, align 8, !dbg !156
  %add = add i64 %12, 1, !dbg !157
  %cmp = icmp ult i64 %11, %add, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %13 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %13, !dbg !162
  %14 = load i8, i8* %arrayidx3, align 1, !dbg !162
  %15 = load i8*, i8** %data2, align 8, !dbg !163
  %16 = load i64, i64* %i, align 8, !dbg !164
  %arrayidx4 = getelementptr inbounds i8, i8* %15, i64 %16, !dbg !163
  store i8 %14, i8* %arrayidx4, align 1, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %17 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %17, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %18 = load i8*, i8** %data2, align 8, !dbg !171
  call void @printLine(i8* noundef %18), !dbg !172
  ret void, !dbg !173
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 30, type: !3)
!19 = !DILocation(line: 30, column: 12, scope: !13)
!20 = !DILocalVariable(name: "dataPtr1", scope: !13, file: !14, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!22 = !DILocation(line: 31, column: 13, scope: !13)
!23 = !DILocalVariable(name: "dataPtr2", scope: !13, file: !14, line: 32, type: !21)
!24 = !DILocation(line: 32, column: 13, scope: !13)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 33, type: !3)
!26 = !DILocation(line: 33, column: 12, scope: !13)
!27 = !DILocation(line: 33, column: 36, scope: !13)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 34, type: !3)
!29 = !DILocation(line: 34, column: 12, scope: !13)
!30 = !DILocation(line: 34, column: 37, scope: !13)
!31 = !DILocalVariable(name: "data", scope: !32, file: !14, line: 36, type: !3)
!32 = distinct !DILexicalBlock(scope: !13, file: !14, line: 35, column: 5)
!33 = !DILocation(line: 36, column: 16, scope: !32)
!34 = !DILocation(line: 36, column: 24, scope: !32)
!35 = !DILocation(line: 36, column: 23, scope: !32)
!36 = !DILocation(line: 39, column: 16, scope: !32)
!37 = !DILocation(line: 39, column: 14, scope: !32)
!38 = !DILocation(line: 40, column: 9, scope: !32)
!39 = !DILocation(line: 40, column: 17, scope: !32)
!40 = !DILocation(line: 41, column: 21, scope: !32)
!41 = !DILocation(line: 41, column: 10, scope: !32)
!42 = !DILocation(line: 41, column: 19, scope: !32)
!43 = !DILocalVariable(name: "data", scope: !44, file: !14, line: 44, type: !3)
!44 = distinct !DILexicalBlock(scope: !13, file: !14, line: 43, column: 5)
!45 = !DILocation(line: 44, column: 16, scope: !44)
!46 = !DILocation(line: 44, column: 24, scope: !44)
!47 = !DILocation(line: 44, column: 23, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !49, file: !14, line: 46, type: !50)
!49 = distinct !DILexicalBlock(scope: !44, file: !14, line: 45, column: 9)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 11)
!53 = !DILocation(line: 46, column: 18, scope: !49)
!54 = !DILocalVariable(name: "i", scope: !49, file: !14, line: 47, type: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !56, line: 31, baseType: !57)
!56 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !58, line: 94, baseType: !59)
!58 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!59 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 47, column: 20, scope: !49)
!61 = !DILocalVariable(name: "sourceLen", scope: !49, file: !14, line: 47, type: !55)
!62 = !DILocation(line: 47, column: 23, scope: !49)
!63 = !DILocation(line: 48, column: 32, scope: !49)
!64 = !DILocation(line: 48, column: 25, scope: !49)
!65 = !DILocation(line: 48, column: 23, scope: !49)
!66 = !DILocation(line: 51, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !49, file: !14, line: 51, column: 13)
!68 = !DILocation(line: 51, column: 18, scope: !67)
!69 = !DILocation(line: 51, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !14, line: 51, column: 13)
!71 = !DILocation(line: 51, column: 29, scope: !70)
!72 = !DILocation(line: 51, column: 39, scope: !70)
!73 = !DILocation(line: 51, column: 27, scope: !70)
!74 = !DILocation(line: 51, column: 13, scope: !67)
!75 = !DILocation(line: 53, column: 34, scope: !76)
!76 = distinct !DILexicalBlock(scope: !70, file: !14, line: 52, column: 13)
!77 = !DILocation(line: 53, column: 27, scope: !76)
!78 = !DILocation(line: 53, column: 17, scope: !76)
!79 = !DILocation(line: 53, column: 22, scope: !76)
!80 = !DILocation(line: 53, column: 25, scope: !76)
!81 = !DILocation(line: 54, column: 13, scope: !76)
!82 = !DILocation(line: 51, column: 45, scope: !70)
!83 = !DILocation(line: 51, column: 13, scope: !70)
!84 = distinct !{!84, !74, !85, !86}
!85 = !DILocation(line: 54, column: 13, scope: !67)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 55, column: 23, scope: !49)
!88 = !DILocation(line: 55, column: 13, scope: !49)
!89 = !DILocation(line: 58, column: 1, scope: !13)
!90 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_32_good", scope: !14, file: !14, line: 97, type: !15, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!91 = !DILocation(line: 99, column: 5, scope: !90)
!92 = !DILocation(line: 100, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 111, type: !94, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!94 = !DISubroutineType(types: !95)
!95 = !{!96, !96, !21}
!96 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !14, line: 111, type: !96)
!98 = !DILocation(line: 111, column: 14, scope: !93)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !14, line: 111, type: !21)
!100 = !DILocation(line: 111, column: 27, scope: !93)
!101 = !DILocation(line: 114, column: 22, scope: !93)
!102 = !DILocation(line: 114, column: 12, scope: !93)
!103 = !DILocation(line: 114, column: 5, scope: !93)
!104 = !DILocation(line: 116, column: 5, scope: !93)
!105 = !DILocation(line: 117, column: 5, scope: !93)
!106 = !DILocation(line: 118, column: 5, scope: !93)
!107 = !DILocation(line: 121, column: 5, scope: !93)
!108 = !DILocation(line: 122, column: 5, scope: !93)
!109 = !DILocation(line: 123, column: 5, scope: !93)
!110 = !DILocation(line: 125, column: 5, scope: !93)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 65, type: !15, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!112 = !DILocalVariable(name: "data", scope: !111, file: !14, line: 67, type: !3)
!113 = !DILocation(line: 67, column: 12, scope: !111)
!114 = !DILocalVariable(name: "dataPtr1", scope: !111, file: !14, line: 68, type: !21)
!115 = !DILocation(line: 68, column: 13, scope: !111)
!116 = !DILocalVariable(name: "dataPtr2", scope: !111, file: !14, line: 69, type: !21)
!117 = !DILocation(line: 69, column: 13, scope: !111)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !14, line: 70, type: !3)
!119 = !DILocation(line: 70, column: 12, scope: !111)
!120 = !DILocation(line: 70, column: 36, scope: !111)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !14, line: 71, type: !3)
!122 = !DILocation(line: 71, column: 12, scope: !111)
!123 = !DILocation(line: 71, column: 37, scope: !111)
!124 = !DILocalVariable(name: "data", scope: !125, file: !14, line: 73, type: !3)
!125 = distinct !DILexicalBlock(scope: !111, file: !14, line: 72, column: 5)
!126 = !DILocation(line: 73, column: 16, scope: !125)
!127 = !DILocation(line: 73, column: 24, scope: !125)
!128 = !DILocation(line: 73, column: 23, scope: !125)
!129 = !DILocation(line: 76, column: 16, scope: !125)
!130 = !DILocation(line: 76, column: 14, scope: !125)
!131 = !DILocation(line: 77, column: 9, scope: !125)
!132 = !DILocation(line: 77, column: 17, scope: !125)
!133 = !DILocation(line: 78, column: 21, scope: !125)
!134 = !DILocation(line: 78, column: 10, scope: !125)
!135 = !DILocation(line: 78, column: 19, scope: !125)
!136 = !DILocalVariable(name: "data", scope: !137, file: !14, line: 81, type: !3)
!137 = distinct !DILexicalBlock(scope: !111, file: !14, line: 80, column: 5)
!138 = !DILocation(line: 81, column: 16, scope: !137)
!139 = !DILocation(line: 81, column: 24, scope: !137)
!140 = !DILocation(line: 81, column: 23, scope: !137)
!141 = !DILocalVariable(name: "source", scope: !142, file: !14, line: 83, type: !50)
!142 = distinct !DILexicalBlock(scope: !137, file: !14, line: 82, column: 9)
!143 = !DILocation(line: 83, column: 18, scope: !142)
!144 = !DILocalVariable(name: "i", scope: !142, file: !14, line: 84, type: !55)
!145 = !DILocation(line: 84, column: 20, scope: !142)
!146 = !DILocalVariable(name: "sourceLen", scope: !142, file: !14, line: 84, type: !55)
!147 = !DILocation(line: 84, column: 23, scope: !142)
!148 = !DILocation(line: 85, column: 32, scope: !142)
!149 = !DILocation(line: 85, column: 25, scope: !142)
!150 = !DILocation(line: 85, column: 23, scope: !142)
!151 = !DILocation(line: 88, column: 20, scope: !152)
!152 = distinct !DILexicalBlock(scope: !142, file: !14, line: 88, column: 13)
!153 = !DILocation(line: 88, column: 18, scope: !152)
!154 = !DILocation(line: 88, column: 25, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !14, line: 88, column: 13)
!156 = !DILocation(line: 88, column: 29, scope: !155)
!157 = !DILocation(line: 88, column: 39, scope: !155)
!158 = !DILocation(line: 88, column: 27, scope: !155)
!159 = !DILocation(line: 88, column: 13, scope: !152)
!160 = !DILocation(line: 90, column: 34, scope: !161)
!161 = distinct !DILexicalBlock(scope: !155, file: !14, line: 89, column: 13)
!162 = !DILocation(line: 90, column: 27, scope: !161)
!163 = !DILocation(line: 90, column: 17, scope: !161)
!164 = !DILocation(line: 90, column: 22, scope: !161)
!165 = !DILocation(line: 90, column: 25, scope: !161)
!166 = !DILocation(line: 91, column: 13, scope: !161)
!167 = !DILocation(line: 88, column: 45, scope: !155)
!168 = !DILocation(line: 88, column: 13, scope: !155)
!169 = distinct !{!169, !159, !170, !86}
!170 = !DILocation(line: 91, column: 13, scope: !152)
!171 = !DILocation(line: 92, column: 23, scope: !142)
!172 = !DILocation(line: 92, column: 13, scope: !142)
!173 = !DILocation(line: 95, column: 1, scope: !111)
