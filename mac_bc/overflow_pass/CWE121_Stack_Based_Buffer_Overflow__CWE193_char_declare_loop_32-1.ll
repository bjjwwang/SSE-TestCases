; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !16, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !20, metadata !DIExpression()), !dbg !22
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !23, metadata !DIExpression()), !dbg !24
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !25, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !35, metadata !DIExpression()), !dbg !37
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !38
  %1 = load i8*, i8** %0, align 8, !dbg !39
  store i8* %1, i8** %data1, align 8, !dbg !37
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !40
  store i8* %arraydecay, i8** %data1, align 8, !dbg !41
  %2 = load i8*, i8** %data1, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %3 = load i8*, i8** %data1, align 8, !dbg !44
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !45
  store i8* %3, i8** %4, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !47, metadata !DIExpression()), !dbg !49
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !50
  %6 = load i8*, i8** %5, align 8, !dbg !51
  store i8* %6, i8** %data2, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !62, metadata !DIExpression()), !dbg !63
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !64
  %call = call i64 @strlen(i8* noundef %arraydecay3), !dbg !65
  store i64 %call, i64* %sourceLen, align 8, !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !70
  %9 = load i64, i64* %sourceLen, align 8, !dbg !72
  %add = add i64 %9, 1, !dbg !73
  %cmp = icmp ult i64 %8, %add, !dbg !74
  br i1 %cmp, label %for.body, label %for.end, !dbg !75

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %10, !dbg !78
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !78
  %12 = load i8*, i8** %data2, align 8, !dbg !79
  %13 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !79
  store i8 %11, i8* %arrayidx5, align 1, !dbg !81
  br label %for.inc, !dbg !82

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !83
  %inc = add i64 %14, 1, !dbg !83
  store i64 %inc, i64* %i, align 8, !dbg !83
  br label %for.cond, !dbg !84, !llvm.loop !85

for.end:                                          ; preds = %for.cond
  %15 = load i8*, i8** %data2, align 8, !dbg !88
  call void @printLine(i8* noundef %15), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @strlen(i8* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !98, metadata !DIExpression()), !dbg !99
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !100, metadata !DIExpression()), !dbg !101
  %call = call i64 @time(i64* noundef null), !dbg !102
  %conv = trunc i64 %call to i32, !dbg !103
  call void @srand(i32 noundef %conv), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !105
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_good(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i8*, align 8
  %dataPtr1 = alloca i8**, align 8
  %dataPtr2 = alloca i8**, align 8
  %dataBadBuffer = alloca [10 x i8], align 1
  %dataGoodBuffer = alloca [11 x i8], align 1
  %data1 = alloca i8*, align 8
  %data2 = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata i8*** %dataPtr1, metadata !115, metadata !DIExpression()), !dbg !116
  store i8** %data, i8*** %dataPtr1, align 8, !dbg !116
  call void @llvm.dbg.declare(metadata i8*** %dataPtr2, metadata !117, metadata !DIExpression()), !dbg !118
  store i8** %data, i8*** %dataPtr2, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata [10 x i8]* %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [11 x i8]* %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  call void @llvm.dbg.declare(metadata i8** %data1, metadata !123, metadata !DIExpression()), !dbg !125
  %0 = load i8**, i8*** %dataPtr1, align 8, !dbg !126
  %1 = load i8*, i8** %0, align 8, !dbg !127
  store i8* %1, i8** %data1, align 8, !dbg !125
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !128
  store i8* %arraydecay, i8** %data1, align 8, !dbg !129
  %2 = load i8*, i8** %data1, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !131
  %3 = load i8*, i8** %data1, align 8, !dbg !132
  %4 = load i8**, i8*** %dataPtr1, align 8, !dbg !133
  store i8* %3, i8** %4, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i8** %data2, metadata !135, metadata !DIExpression()), !dbg !137
  %5 = load i8**, i8*** %dataPtr2, align 8, !dbg !138
  %6 = load i8*, i8** %5, align 8, !dbg !139
  store i8* %6, i8** %data2, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !140, metadata !DIExpression()), !dbg !142
  %7 = bitcast [11 x i8]* %source to i8*, !dbg !142
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %7, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !142
  call void @llvm.dbg.declare(metadata i64* %i, metadata !143, metadata !DIExpression()), !dbg !144
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !145, metadata !DIExpression()), !dbg !146
  %arraydecay3 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !147
  %call = call i64 @strlen(i8* noundef %arraydecay3), !dbg !148
  store i64 %call, i64* %sourceLen, align 8, !dbg !149
  store i64 0, i64* %i, align 8, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i64, i64* %i, align 8, !dbg !153
  %9 = load i64, i64* %sourceLen, align 8, !dbg !155
  %add = add i64 %9, 1, !dbg !156
  %cmp = icmp ult i64 %8, %add, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %10 = load i64, i64* %i, align 8, !dbg !159
  %arrayidx4 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 %10, !dbg !161
  %11 = load i8, i8* %arrayidx4, align 1, !dbg !161
  %12 = load i8*, i8** %data2, align 8, !dbg !162
  %13 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx5 = getelementptr inbounds i8, i8* %12, i64 %13, !dbg !162
  store i8 %11, i8* %arrayidx5, align 1, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %14, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %15 = load i8*, i8** %data2, align 8, !dbg !170
  call void @printLine(i8* noundef %15), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_bad", scope: !12, file: !12, line: 28, type: !13, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 30, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DILocation(line: 30, column: 12, scope: !11)
!20 = !DILocalVariable(name: "dataPtr1", scope: !11, file: !12, line: 31, type: !21)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!22 = !DILocation(line: 31, column: 13, scope: !11)
!23 = !DILocalVariable(name: "dataPtr2", scope: !11, file: !12, line: 32, type: !21)
!24 = !DILocation(line: 32, column: 13, scope: !11)
!25 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 80, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 10)
!29 = !DILocation(line: 33, column: 10, scope: !11)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DILocation(line: 34, column: 10, scope: !11)
!35 = !DILocalVariable(name: "data", scope: !36, file: !12, line: 36, type: !17)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 35, column: 5)
!37 = !DILocation(line: 36, column: 16, scope: !36)
!38 = !DILocation(line: 36, column: 24, scope: !36)
!39 = !DILocation(line: 36, column: 23, scope: !36)
!40 = !DILocation(line: 39, column: 16, scope: !36)
!41 = !DILocation(line: 39, column: 14, scope: !36)
!42 = !DILocation(line: 40, column: 9, scope: !36)
!43 = !DILocation(line: 40, column: 17, scope: !36)
!44 = !DILocation(line: 41, column: 21, scope: !36)
!45 = !DILocation(line: 41, column: 10, scope: !36)
!46 = !DILocation(line: 41, column: 19, scope: !36)
!47 = !DILocalVariable(name: "data", scope: !48, file: !12, line: 44, type: !17)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 5)
!49 = !DILocation(line: 44, column: 16, scope: !48)
!50 = !DILocation(line: 44, column: 24, scope: !48)
!51 = !DILocation(line: 44, column: 23, scope: !48)
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 46, type: !31)
!53 = distinct !DILexicalBlock(scope: !48, file: !12, line: 45, column: 9)
!54 = !DILocation(line: 46, column: 18, scope: !53)
!55 = !DILocalVariable(name: "i", scope: !53, file: !12, line: 47, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !59, line: 94, baseType: !60)
!59 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!60 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 47, column: 20, scope: !53)
!62 = !DILocalVariable(name: "sourceLen", scope: !53, file: !12, line: 47, type: !56)
!63 = !DILocation(line: 47, column: 23, scope: !53)
!64 = !DILocation(line: 48, column: 32, scope: !53)
!65 = !DILocation(line: 48, column: 25, scope: !53)
!66 = !DILocation(line: 48, column: 23, scope: !53)
!67 = !DILocation(line: 51, column: 20, scope: !68)
!68 = distinct !DILexicalBlock(scope: !53, file: !12, line: 51, column: 13)
!69 = !DILocation(line: 51, column: 18, scope: !68)
!70 = !DILocation(line: 51, column: 25, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !12, line: 51, column: 13)
!72 = !DILocation(line: 51, column: 29, scope: !71)
!73 = !DILocation(line: 51, column: 39, scope: !71)
!74 = !DILocation(line: 51, column: 27, scope: !71)
!75 = !DILocation(line: 51, column: 13, scope: !68)
!76 = !DILocation(line: 53, column: 34, scope: !77)
!77 = distinct !DILexicalBlock(scope: !71, file: !12, line: 52, column: 13)
!78 = !DILocation(line: 53, column: 27, scope: !77)
!79 = !DILocation(line: 53, column: 17, scope: !77)
!80 = !DILocation(line: 53, column: 22, scope: !77)
!81 = !DILocation(line: 53, column: 25, scope: !77)
!82 = !DILocation(line: 54, column: 13, scope: !77)
!83 = !DILocation(line: 51, column: 45, scope: !71)
!84 = !DILocation(line: 51, column: 13, scope: !71)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 54, column: 13, scope: !68)
!87 = !{!"llvm.loop.mustprogress"}
!88 = !DILocation(line: 55, column: 23, scope: !53)
!89 = !DILocation(line: 55, column: 13, scope: !53)
!90 = !DILocation(line: 58, column: 1, scope: !11)
!91 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_char_declare_loop_32_good", scope: !12, file: !12, line: 97, type: !13, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DILocation(line: 99, column: 5, scope: !91)
!93 = !DILocation(line: 100, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 111, type: !95, scopeLine: 112, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!95 = !DISubroutineType(types: !96)
!96 = !{!97, !97, !21}
!97 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !12, line: 111, type: !97)
!99 = !DILocation(line: 111, column: 14, scope: !94)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !12, line: 111, type: !21)
!101 = !DILocation(line: 111, column: 27, scope: !94)
!102 = !DILocation(line: 114, column: 22, scope: !94)
!103 = !DILocation(line: 114, column: 12, scope: !94)
!104 = !DILocation(line: 114, column: 5, scope: !94)
!105 = !DILocation(line: 116, column: 5, scope: !94)
!106 = !DILocation(line: 117, column: 5, scope: !94)
!107 = !DILocation(line: 118, column: 5, scope: !94)
!108 = !DILocation(line: 121, column: 5, scope: !94)
!109 = !DILocation(line: 122, column: 5, scope: !94)
!110 = !DILocation(line: 123, column: 5, scope: !94)
!111 = !DILocation(line: 125, column: 5, scope: !94)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 65, type: !13, scopeLine: 66, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 67, type: !17)
!114 = !DILocation(line: 67, column: 12, scope: !112)
!115 = !DILocalVariable(name: "dataPtr1", scope: !112, file: !12, line: 68, type: !21)
!116 = !DILocation(line: 68, column: 13, scope: !112)
!117 = !DILocalVariable(name: "dataPtr2", scope: !112, file: !12, line: 69, type: !21)
!118 = !DILocation(line: 69, column: 13, scope: !112)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !12, line: 70, type: !26)
!120 = !DILocation(line: 70, column: 10, scope: !112)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !12, line: 71, type: !31)
!122 = !DILocation(line: 71, column: 10, scope: !112)
!123 = !DILocalVariable(name: "data", scope: !124, file: !12, line: 73, type: !17)
!124 = distinct !DILexicalBlock(scope: !112, file: !12, line: 72, column: 5)
!125 = !DILocation(line: 73, column: 16, scope: !124)
!126 = !DILocation(line: 73, column: 24, scope: !124)
!127 = !DILocation(line: 73, column: 23, scope: !124)
!128 = !DILocation(line: 76, column: 16, scope: !124)
!129 = !DILocation(line: 76, column: 14, scope: !124)
!130 = !DILocation(line: 77, column: 9, scope: !124)
!131 = !DILocation(line: 77, column: 17, scope: !124)
!132 = !DILocation(line: 78, column: 21, scope: !124)
!133 = !DILocation(line: 78, column: 10, scope: !124)
!134 = !DILocation(line: 78, column: 19, scope: !124)
!135 = !DILocalVariable(name: "data", scope: !136, file: !12, line: 81, type: !17)
!136 = distinct !DILexicalBlock(scope: !112, file: !12, line: 80, column: 5)
!137 = !DILocation(line: 81, column: 16, scope: !136)
!138 = !DILocation(line: 81, column: 24, scope: !136)
!139 = !DILocation(line: 81, column: 23, scope: !136)
!140 = !DILocalVariable(name: "source", scope: !141, file: !12, line: 83, type: !31)
!141 = distinct !DILexicalBlock(scope: !136, file: !12, line: 82, column: 9)
!142 = !DILocation(line: 83, column: 18, scope: !141)
!143 = !DILocalVariable(name: "i", scope: !141, file: !12, line: 84, type: !56)
!144 = !DILocation(line: 84, column: 20, scope: !141)
!145 = !DILocalVariable(name: "sourceLen", scope: !141, file: !12, line: 84, type: !56)
!146 = !DILocation(line: 84, column: 23, scope: !141)
!147 = !DILocation(line: 85, column: 32, scope: !141)
!148 = !DILocation(line: 85, column: 25, scope: !141)
!149 = !DILocation(line: 85, column: 23, scope: !141)
!150 = !DILocation(line: 88, column: 20, scope: !151)
!151 = distinct !DILexicalBlock(scope: !141, file: !12, line: 88, column: 13)
!152 = !DILocation(line: 88, column: 18, scope: !151)
!153 = !DILocation(line: 88, column: 25, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !12, line: 88, column: 13)
!155 = !DILocation(line: 88, column: 29, scope: !154)
!156 = !DILocation(line: 88, column: 39, scope: !154)
!157 = !DILocation(line: 88, column: 27, scope: !154)
!158 = !DILocation(line: 88, column: 13, scope: !151)
!159 = !DILocation(line: 90, column: 34, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !12, line: 89, column: 13)
!161 = !DILocation(line: 90, column: 27, scope: !160)
!162 = !DILocation(line: 90, column: 17, scope: !160)
!163 = !DILocation(line: 90, column: 22, scope: !160)
!164 = !DILocation(line: 90, column: 25, scope: !160)
!165 = !DILocation(line: 91, column: 13, scope: !160)
!166 = !DILocation(line: 88, column: 45, scope: !154)
!167 = !DILocation(line: 88, column: 13, scope: !154)
!168 = distinct !{!168, !158, !169, !87}
!169 = !DILocation(line: 91, column: 13, scope: !151)
!170 = !DILocation(line: 92, column: 23, scope: !141)
!171 = !DILocation(line: 92, column: 13, scope: !141)
!172 = !DILocation(line: 95, column: 1, scope: !112)
