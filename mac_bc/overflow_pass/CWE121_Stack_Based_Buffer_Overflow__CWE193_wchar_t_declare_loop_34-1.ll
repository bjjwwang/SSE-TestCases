; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType = type { i32* }

@__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i32] [i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 65, i32 0], align 16

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !36, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [10 x i32], [10 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data, align 8, !dbg !42
  %0 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !46
  store i32* %1, i32** %unionFirst, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !48, metadata !DIExpression()), !dbg !50
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !51
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !51
  store i32* %2, i32** %data1, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad.source to i8*), i64 44, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !61, metadata !DIExpression()), !dbg !62
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !63
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !64
  store i64 %call, i64* %sourceLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !69
  %5 = load i64, i64* %sourceLen, align 8, !dbg !71
  %add = add i64 %5, 1, !dbg !72
  %cmp = icmp ult i64 %4, %add, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !77
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !77
  %8 = load i32*, i32** %data1, align 8, !dbg !78
  %9 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !78
  store i32 %7, i32* %arrayidx4, align 4, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %10, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !87
  call void @printWLine(i32* noundef %11), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare i64 @wcslen(i32* noundef) #3

declare void @printWLine(i32* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_good() #0 !dbg !90 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [10 x i32], align 16
  %dataGoodBuffer = alloca [11 x i32], align 16
  %data1 = alloca i32*, align 8
  %source = alloca [11 x i32], align 16
  %i = alloca i64, align 8
  %sourceLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [10 x i32]* %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [11 x i32]* %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [11 x i32], [11 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !122
  store i32* %arraydecay, i32** %data, align 8, !dbg !123
  %0 = load i32*, i32** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %1 = load i32*, i32** %data, align 8, !dbg !126
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !127
  store i32* %1, i32** %unionFirst, align 8, !dbg !128
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !129, metadata !DIExpression()), !dbg !131
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !132
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !132
  store i32* %2, i32** %data1, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata [11 x i32]* %source, metadata !133, metadata !DIExpression()), !dbg !135
  %3 = bitcast [11 x i32]* %source to i8*, !dbg !135
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %3, i8* align 16 bitcast ([11 x i32]* @__const.goodG2B.source to i8*), i64 44, i1 false), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %i, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata i64* %sourceLen, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay2 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 0, !dbg !140
  %call = call i64 @wcslen(i32* noundef %arraydecay2), !dbg !141
  store i64 %call, i64* %sourceLen, align 8, !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i64, i64* %i, align 8, !dbg !146
  %5 = load i64, i64* %sourceLen, align 8, !dbg !148
  %add = add i64 %5, 1, !dbg !149
  %cmp = icmp ult i64 %4, %add, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx3 = getelementptr inbounds [11 x i32], [11 x i32]* %source, i64 0, i64 %6, !dbg !154
  %7 = load i32, i32* %arrayidx3, align 4, !dbg !154
  %8 = load i32*, i32** %data1, align 8, !dbg !155
  %9 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !155
  store i32 %7, i32* %arrayidx4, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %10, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data1, align 8, !dbg !163
  call void @printWLine(i32* noundef %11), !dbg !164
  ret void, !dbg !165
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_bad", scope: !12, file: !12, line: 34, type: !13, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 36, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 36, column: 15, scope: !11)
!24 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 37, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_unionType", file: !12, line: 30, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 26, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !12, line: 28, baseType: !17, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !12, line: 29, baseType: !17, size: 64)
!30 = !DILocation(line: 37, column: 82, scope: !11)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 10)
!35 = !DILocation(line: 38, column: 13, scope: !11)
!36 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 352, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 11)
!40 = !DILocation(line: 39, column: 13, scope: !11)
!41 = !DILocation(line: 42, column: 12, scope: !11)
!42 = !DILocation(line: 42, column: 10, scope: !11)
!43 = !DILocation(line: 43, column: 5, scope: !11)
!44 = !DILocation(line: 43, column: 13, scope: !11)
!45 = !DILocation(line: 44, column: 26, scope: !11)
!46 = !DILocation(line: 44, column: 13, scope: !11)
!47 = !DILocation(line: 44, column: 24, scope: !11)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 46, type: !17)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 45, column: 5)
!50 = !DILocation(line: 46, column: 19, scope: !49)
!51 = !DILocation(line: 46, column: 34, scope: !49)
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 48, type: !37)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 47, column: 9)
!54 = !DILocation(line: 48, column: 21, scope: !53)
!55 = !DILocalVariable(name: "i", scope: !53, file: !12, line: 49, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !59)
!59 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 49, column: 20, scope: !53)
!61 = !DILocalVariable(name: "sourceLen", scope: !53, file: !12, line: 49, type: !56)
!62 = !DILocation(line: 49, column: 23, scope: !53)
!63 = !DILocation(line: 50, column: 32, scope: !53)
!64 = !DILocation(line: 50, column: 25, scope: !53)
!65 = !DILocation(line: 50, column: 23, scope: !53)
!66 = !DILocation(line: 53, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !53, file: !12, line: 53, column: 13)
!68 = !DILocation(line: 53, column: 18, scope: !67)
!69 = !DILocation(line: 53, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !12, line: 53, column: 13)
!71 = !DILocation(line: 53, column: 29, scope: !70)
!72 = !DILocation(line: 53, column: 39, scope: !70)
!73 = !DILocation(line: 53, column: 27, scope: !70)
!74 = !DILocation(line: 53, column: 13, scope: !67)
!75 = !DILocation(line: 55, column: 34, scope: !76)
!76 = distinct !DILexicalBlock(scope: !70, file: !12, line: 54, column: 13)
!77 = !DILocation(line: 55, column: 27, scope: !76)
!78 = !DILocation(line: 55, column: 17, scope: !76)
!79 = !DILocation(line: 55, column: 22, scope: !76)
!80 = !DILocation(line: 55, column: 25, scope: !76)
!81 = !DILocation(line: 56, column: 13, scope: !76)
!82 = !DILocation(line: 53, column: 45, scope: !70)
!83 = !DILocation(line: 53, column: 13, scope: !70)
!84 = distinct !{!84, !74, !85, !86}
!85 = !DILocation(line: 56, column: 13, scope: !67)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 57, column: 24, scope: !53)
!88 = !DILocation(line: 57, column: 13, scope: !53)
!89 = !DILocation(line: 60, column: 1, scope: !11)
!90 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE193_wchar_t_declare_loop_34_good", scope: !12, file: !12, line: 95, type: !13, scopeLine: 96, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DILocation(line: 97, column: 5, scope: !90)
!92 = !DILocation(line: 98, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !94, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DISubroutineType(types: !95)
!95 = !{!22, !22, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !12, line: 109, type: !22)
!100 = !DILocation(line: 109, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !12, line: 109, type: !96)
!102 = !DILocation(line: 109, column: 27, scope: !93)
!103 = !DILocation(line: 112, column: 22, scope: !93)
!104 = !DILocation(line: 112, column: 12, scope: !93)
!105 = !DILocation(line: 112, column: 5, scope: !93)
!106 = !DILocation(line: 114, column: 5, scope: !93)
!107 = !DILocation(line: 115, column: 5, scope: !93)
!108 = !DILocation(line: 116, column: 5, scope: !93)
!109 = !DILocation(line: 119, column: 5, scope: !93)
!110 = !DILocation(line: 120, column: 5, scope: !93)
!111 = !DILocation(line: 121, column: 5, scope: !93)
!112 = !DILocation(line: 123, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!114 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 69, type: !17)
!115 = !DILocation(line: 69, column: 15, scope: !113)
!116 = !DILocalVariable(name: "myUnion", scope: !113, file: !12, line: 70, type: !25)
!117 = !DILocation(line: 70, column: 82, scope: !113)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !12, line: 71, type: !32)
!119 = !DILocation(line: 71, column: 13, scope: !113)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !12, line: 72, type: !37)
!121 = !DILocation(line: 72, column: 13, scope: !113)
!122 = !DILocation(line: 75, column: 12, scope: !113)
!123 = !DILocation(line: 75, column: 10, scope: !113)
!124 = !DILocation(line: 76, column: 5, scope: !113)
!125 = !DILocation(line: 76, column: 13, scope: !113)
!126 = !DILocation(line: 77, column: 26, scope: !113)
!127 = !DILocation(line: 77, column: 13, scope: !113)
!128 = !DILocation(line: 77, column: 24, scope: !113)
!129 = !DILocalVariable(name: "data", scope: !130, file: !12, line: 79, type: !17)
!130 = distinct !DILexicalBlock(scope: !113, file: !12, line: 78, column: 5)
!131 = !DILocation(line: 79, column: 19, scope: !130)
!132 = !DILocation(line: 79, column: 34, scope: !130)
!133 = !DILocalVariable(name: "source", scope: !134, file: !12, line: 81, type: !37)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 80, column: 9)
!135 = !DILocation(line: 81, column: 21, scope: !134)
!136 = !DILocalVariable(name: "i", scope: !134, file: !12, line: 82, type: !56)
!137 = !DILocation(line: 82, column: 20, scope: !134)
!138 = !DILocalVariable(name: "sourceLen", scope: !134, file: !12, line: 82, type: !56)
!139 = !DILocation(line: 82, column: 23, scope: !134)
!140 = !DILocation(line: 83, column: 32, scope: !134)
!141 = !DILocation(line: 83, column: 25, scope: !134)
!142 = !DILocation(line: 83, column: 23, scope: !134)
!143 = !DILocation(line: 86, column: 20, scope: !144)
!144 = distinct !DILexicalBlock(scope: !134, file: !12, line: 86, column: 13)
!145 = !DILocation(line: 86, column: 18, scope: !144)
!146 = !DILocation(line: 86, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 86, column: 13)
!148 = !DILocation(line: 86, column: 29, scope: !147)
!149 = !DILocation(line: 86, column: 39, scope: !147)
!150 = !DILocation(line: 86, column: 27, scope: !147)
!151 = !DILocation(line: 86, column: 13, scope: !144)
!152 = !DILocation(line: 88, column: 34, scope: !153)
!153 = distinct !DILexicalBlock(scope: !147, file: !12, line: 87, column: 13)
!154 = !DILocation(line: 88, column: 27, scope: !153)
!155 = !DILocation(line: 88, column: 17, scope: !153)
!156 = !DILocation(line: 88, column: 22, scope: !153)
!157 = !DILocation(line: 88, column: 25, scope: !153)
!158 = !DILocation(line: 89, column: 13, scope: !153)
!159 = !DILocation(line: 86, column: 45, scope: !147)
!160 = !DILocation(line: 86, column: 13, scope: !147)
!161 = distinct !{!161, !151, !162, !86}
!162 = !DILocation(line: 89, column: 13, scope: !144)
!163 = !DILocation(line: 90, column: 24, scope: !134)
!164 = !DILocation(line: 90, column: 13, scope: !134)
!165 = !DILocation(line: 93, column: 1, scope: !113)
