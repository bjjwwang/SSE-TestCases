; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad() #0 !dbg !13 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i1 = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i8** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = alloca i8, i64 10, align 16, !dbg !25
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = alloca i8, i64 11, align 16, !dbg !28
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !27
  store i32 0, i32* %i, align 4, !dbg !29
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %2, 1, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !36
  store i8* %3, i8** %data, align 8, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !39
  store i8 0, i8* %arrayidx, align 1, !dbg !40
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !42
  %inc = add nsw i32 %5, 1, !dbg !42
  store i32 %inc, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !47, metadata !DIExpression()), !dbg !52
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !52
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !53, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !60, metadata !DIExpression()), !dbg !61
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !62
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !63
  store i64 %call, i64* %sourceLen, align 8, !dbg !64
  store i64 0, i64* %i1, align 8, !dbg !65
  br label %for.cond2, !dbg !67

for.cond2:                                        ; preds = %for.inc7, %for.end
  %7 = load i64, i64* %i1, align 8, !dbg !68
  %8 = load i64, i64* %sourceLen, align 8, !dbg !70
  %add = add i64 %8, 1, !dbg !71
  %cmp3 = icmp ult i64 %7, %add, !dbg !72
  br i1 %cmp3, label %for.body4, label %for.end9, !dbg !73

for.body4:                                        ; preds = %for.cond2
  %9 = load i64, i64* %i1, align 8, !dbg !74
  %arrayidx5 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !76
  %10 = load i8, i8* %arrayidx5, align 1, !dbg !76
  %11 = load i8*, i8** %data, align 8, !dbg !77
  %12 = load i64, i64* %i1, align 8, !dbg !78
  %arrayidx6 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !77
  store i8 %10, i8* %arrayidx6, align 1, !dbg !79
  br label %for.inc7, !dbg !80

for.inc7:                                         ; preds = %for.body4
  %13 = load i64, i64* %i1, align 8, !dbg !81
  %inc8 = add i64 %13, 1, !dbg !81
  store i64 %inc8, i64* %i1, align 8, !dbg !81
  br label %for.cond2, !dbg !82, !llvm.loop !83

for.end9:                                         ; preds = %for.cond2
  %14 = load i8*, i8** %data, align 8, !dbg !85
  call void @printLine(i8* noundef %14), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !95, metadata !DIExpression()), !dbg !96
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !97, metadata !DIExpression()), !dbg !98
  %call = call i64 @time(i64* noundef null), !dbg !99
  %conv = trunc i64 %call to i32, !dbg !100
  call void @srand(i32 noundef %conv), !dbg !101
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !102
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_good(), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !107
  ret i32 0, !dbg !108
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !109 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !110, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.declare(metadata i8** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 10, align 16, !dbg !116
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %1 = alloca i8, i64 11, align 16, !dbg !119
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !118
  store i32 0, i32* %h, align 4, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %h, align 4, !dbg !123
  %cmp = icmp slt i32 %2, 1, !dbg !125
  br i1 %cmp, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %3 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !127
  store i8* %3, i8** %data, align 8, !dbg !129
  %4 = load i8*, i8** %data, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 0, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %h, align 4, !dbg !133
  %inc = add nsw i32 %5, 1, !dbg !133
  store i32 %inc, i32* %h, align 4, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  %6 = bitcast [11 x i8]* %source to i8*, !dbg !139
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %6, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !142, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !144
  %call = call i64 @strlen(i8* noundef %arraydecay), !dbg !145
  store i64 %call, i64* %sourceLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond1, !dbg !149

for.cond1:                                        ; preds = %for.inc6, %for.end
  %7 = load i64, i64* %i, align 8, !dbg !150
  %8 = load i64, i64* %sourceLen, align 8, !dbg !152
  %add = add i64 %8, 1, !dbg !153
  %cmp2 = icmp ult i64 %7, %add, !dbg !154
  br i1 %cmp2, label %for.body3, label %for.end8, !dbg !155

for.body3:                                        ; preds = %for.cond1
  %9 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %9, !dbg !158
  %10 = load i8, i8* %arrayidx4, align 1, !dbg !158
  %11 = load i8*, i8** %data, align 8, !dbg !159
  %12 = load i64, i64* %i, align 8, !dbg !160
  %arrayidx5 = getelementptr inbounds i8, i8* %11, i64 %12, !dbg !159
  store i8 %10, i8* %arrayidx5, align 1, !dbg !161
  br label %for.inc6, !dbg !162

for.inc6:                                         ; preds = %for.body3
  %13 = load i64, i64* %i, align 8, !dbg !163
  %inc7 = add i64 %13, 1, !dbg !163
  store i64 %inc7, i64* %i, align 8, !dbg !163
  br label %for.cond1, !dbg !164, !llvm.loop !165

for.end8:                                         ; preds = %for.cond1
  %14 = load i8*, i8** %data, align 8, !dbg !167
  call void @printLine(i8* noundef %14), !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!13 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_bad", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !{}
!18 = !DILocalVariable(name: "i", scope: !13, file: !14, line: 30, type: !19)
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 30, column: 9, scope: !13)
!21 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 31, type: !3)
!22 = !DILocation(line: 31, column: 12, scope: !13)
!23 = !DILocalVariable(name: "dataBadBuffer", scope: !13, file: !14, line: 32, type: !3)
!24 = !DILocation(line: 32, column: 12, scope: !13)
!25 = !DILocation(line: 32, column: 36, scope: !13)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !13, file: !14, line: 33, type: !3)
!27 = !DILocation(line: 33, column: 12, scope: !13)
!28 = !DILocation(line: 33, column: 37, scope: !13)
!29 = !DILocation(line: 34, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!31 = !DILocation(line: 34, column: 9, scope: !30)
!32 = !DILocation(line: 34, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !14, line: 34, column: 5)
!34 = !DILocation(line: 34, column: 18, scope: !33)
!35 = !DILocation(line: 34, column: 5, scope: !30)
!36 = !DILocation(line: 38, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !14, line: 35, column: 5)
!38 = !DILocation(line: 38, column: 14, scope: !37)
!39 = !DILocation(line: 39, column: 9, scope: !37)
!40 = !DILocation(line: 39, column: 17, scope: !37)
!41 = !DILocation(line: 40, column: 5, scope: !37)
!42 = !DILocation(line: 34, column: 24, scope: !33)
!43 = !DILocation(line: 34, column: 5, scope: !33)
!44 = distinct !{!44, !35, !45, !46}
!45 = !DILocation(line: 40, column: 5, scope: !30)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocalVariable(name: "source", scope: !48, file: !14, line: 42, type: !49)
!48 = distinct !DILexicalBlock(scope: !13, file: !14, line: 41, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 11)
!52 = !DILocation(line: 42, column: 14, scope: !48)
!53 = !DILocalVariable(name: "i", scope: !48, file: !14, line: 43, type: !54)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 31, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !57, line: 94, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!58 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 43, column: 16, scope: !48)
!60 = !DILocalVariable(name: "sourceLen", scope: !48, file: !14, line: 43, type: !54)
!61 = !DILocation(line: 43, column: 19, scope: !48)
!62 = !DILocation(line: 44, column: 28, scope: !48)
!63 = !DILocation(line: 44, column: 21, scope: !48)
!64 = !DILocation(line: 44, column: 19, scope: !48)
!65 = !DILocation(line: 47, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !48, file: !14, line: 47, column: 9)
!67 = !DILocation(line: 47, column: 14, scope: !66)
!68 = !DILocation(line: 47, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !14, line: 47, column: 9)
!70 = !DILocation(line: 47, column: 25, scope: !69)
!71 = !DILocation(line: 47, column: 35, scope: !69)
!72 = !DILocation(line: 47, column: 23, scope: !69)
!73 = !DILocation(line: 47, column: 9, scope: !66)
!74 = !DILocation(line: 49, column: 30, scope: !75)
!75 = distinct !DILexicalBlock(scope: !69, file: !14, line: 48, column: 9)
!76 = !DILocation(line: 49, column: 23, scope: !75)
!77 = !DILocation(line: 49, column: 13, scope: !75)
!78 = !DILocation(line: 49, column: 18, scope: !75)
!79 = !DILocation(line: 49, column: 21, scope: !75)
!80 = !DILocation(line: 50, column: 9, scope: !75)
!81 = !DILocation(line: 47, column: 41, scope: !69)
!82 = !DILocation(line: 47, column: 9, scope: !69)
!83 = distinct !{!83, !73, !84, !46}
!84 = !DILocation(line: 50, column: 9, scope: !66)
!85 = !DILocation(line: 51, column: 19, scope: !48)
!86 = !DILocation(line: 51, column: 9, scope: !48)
!87 = !DILocation(line: 53, column: 1, scope: !13)
!88 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_alloca_loop_17_good", scope: !14, file: !14, line: 87, type: !15, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!89 = !DILocation(line: 89, column: 5, scope: !88)
!90 = !DILocation(line: 90, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 102, type: !92, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !17)
!92 = !DISubroutineType(types: !93)
!93 = !{!19, !19, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!95 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !14, line: 102, type: !19)
!96 = !DILocation(line: 102, column: 14, scope: !91)
!97 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !14, line: 102, type: !94)
!98 = !DILocation(line: 102, column: 27, scope: !91)
!99 = !DILocation(line: 105, column: 22, scope: !91)
!100 = !DILocation(line: 105, column: 12, scope: !91)
!101 = !DILocation(line: 105, column: 5, scope: !91)
!102 = !DILocation(line: 107, column: 5, scope: !91)
!103 = !DILocation(line: 108, column: 5, scope: !91)
!104 = !DILocation(line: 109, column: 5, scope: !91)
!105 = !DILocation(line: 112, column: 5, scope: !91)
!106 = !DILocation(line: 113, column: 5, scope: !91)
!107 = !DILocation(line: 114, column: 5, scope: !91)
!108 = !DILocation(line: 116, column: 5, scope: !91)
!109 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !17)
!110 = !DILocalVariable(name: "h", scope: !109, file: !14, line: 62, type: !19)
!111 = !DILocation(line: 62, column: 9, scope: !109)
!112 = !DILocalVariable(name: "data", scope: !109, file: !14, line: 63, type: !3)
!113 = !DILocation(line: 63, column: 12, scope: !109)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !109, file: !14, line: 64, type: !3)
!115 = !DILocation(line: 64, column: 12, scope: !109)
!116 = !DILocation(line: 64, column: 36, scope: !109)
!117 = !DILocalVariable(name: "dataGoodBuffer", scope: !109, file: !14, line: 65, type: !3)
!118 = !DILocation(line: 65, column: 12, scope: !109)
!119 = !DILocation(line: 65, column: 37, scope: !109)
!120 = !DILocation(line: 66, column: 11, scope: !121)
!121 = distinct !DILexicalBlock(scope: !109, file: !14, line: 66, column: 5)
!122 = !DILocation(line: 66, column: 9, scope: !121)
!123 = !DILocation(line: 66, column: 16, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !14, line: 66, column: 5)
!125 = !DILocation(line: 66, column: 18, scope: !124)
!126 = !DILocation(line: 66, column: 5, scope: !121)
!127 = !DILocation(line: 70, column: 16, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !14, line: 67, column: 5)
!129 = !DILocation(line: 70, column: 14, scope: !128)
!130 = !DILocation(line: 71, column: 9, scope: !128)
!131 = !DILocation(line: 71, column: 17, scope: !128)
!132 = !DILocation(line: 72, column: 5, scope: !128)
!133 = !DILocation(line: 66, column: 24, scope: !124)
!134 = !DILocation(line: 66, column: 5, scope: !124)
!135 = distinct !{!135, !126, !136, !46}
!136 = !DILocation(line: 72, column: 5, scope: !121)
!137 = !DILocalVariable(name: "source", scope: !138, file: !14, line: 74, type: !49)
!138 = distinct !DILexicalBlock(scope: !109, file: !14, line: 73, column: 5)
!139 = !DILocation(line: 74, column: 14, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !138, file: !14, line: 75, type: !54)
!141 = !DILocation(line: 75, column: 16, scope: !138)
!142 = !DILocalVariable(name: "sourceLen", scope: !138, file: !14, line: 75, type: !54)
!143 = !DILocation(line: 75, column: 19, scope: !138)
!144 = !DILocation(line: 76, column: 28, scope: !138)
!145 = !DILocation(line: 76, column: 21, scope: !138)
!146 = !DILocation(line: 76, column: 19, scope: !138)
!147 = !DILocation(line: 79, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !138, file: !14, line: 79, column: 9)
!149 = !DILocation(line: 79, column: 14, scope: !148)
!150 = !DILocation(line: 79, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !14, line: 79, column: 9)
!152 = !DILocation(line: 79, column: 25, scope: !151)
!153 = !DILocation(line: 79, column: 35, scope: !151)
!154 = !DILocation(line: 79, column: 23, scope: !151)
!155 = !DILocation(line: 79, column: 9, scope: !148)
!156 = !DILocation(line: 81, column: 30, scope: !157)
!157 = distinct !DILexicalBlock(scope: !151, file: !14, line: 80, column: 9)
!158 = !DILocation(line: 81, column: 23, scope: !157)
!159 = !DILocation(line: 81, column: 13, scope: !157)
!160 = !DILocation(line: 81, column: 18, scope: !157)
!161 = !DILocation(line: 81, column: 21, scope: !157)
!162 = !DILocation(line: 82, column: 9, scope: !157)
!163 = !DILocation(line: 79, column: 41, scope: !151)
!164 = !DILocation(line: 79, column: 9, scope: !151)
!165 = distinct !{!165, !155, !166, !46}
!166 = !DILocation(line: 82, column: 9, scope: !148)
!167 = !DILocation(line: 83, column: 19, scope: !138)
!168 = !DILocation(line: 83, column: 9, scope: !138)
!169 = !DILocation(line: 85, column: 1, scope: !109)
