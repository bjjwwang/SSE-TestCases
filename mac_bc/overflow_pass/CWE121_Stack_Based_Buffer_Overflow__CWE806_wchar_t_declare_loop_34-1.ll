; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !36
  store i32* %arraydecay, i32** %data, align 8, !dbg !37
  %0 = load i32*, i32** %data, align 8, !dbg !38
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 99), !dbg !39
  %1 = load i32*, i32** %data, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %2 = load i32*, i32** %data, align 8, !dbg !42
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !43
  store i32* %2, i32** %unionFirst, align 8, !dbg !44
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !45, metadata !DIExpression()), !dbg !47
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !48
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !48
  store i32* %3, i32** %data1, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !49, metadata !DIExpression()), !dbg !54
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !54
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !61, metadata !DIExpression()), !dbg !62
  %5 = load i32*, i32** %data1, align 8, !dbg !63
  %call2 = call i64 @wcslen(i32* noundef %5), !dbg !64
  store i64 %call2, i64* %dataLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !69
  %7 = load i64, i64* %dataLen, align 8, !dbg !71
  %cmp = icmp ult i64 %6, %7, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data1, align 8, !dbg !74
  %9 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !74
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !74
  %11 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !78
  store i32 %10, i32* %arrayidx4, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %12, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !86
  store i32 0, i32* %arrayidx5, align 4, !dbg !87
  %13 = load i32*, i32** %data1, align 8, !dbg !88
  call void @printWLine(i32* noundef %13), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_good() #0 !dbg !91 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* noundef null), !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 noundef %conv), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_good(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_bad(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  %i = alloca i64, align 8
  %dataLen = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !121
  store i32* %arraydecay, i32** %data, align 8, !dbg !122
  %0 = load i32*, i32** %data, align 8, !dbg !123
  %call = call i32* @wmemset(i32* noundef %0, i32 noundef 65, i64 noundef 49), !dbg !124
  %1 = load i32*, i32** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i32, i32* %1, i64 49, !dbg !125
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %2 = load i32*, i32** %data, align 8, !dbg !127
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !128
  store i32* %2, i32** %unionFirst, align 8, !dbg !129
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !130, metadata !DIExpression()), !dbg !132
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !133
  %3 = load i32*, i32** %unionSecond, align 8, !dbg !133
  store i32* %3, i32** %data1, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !134, metadata !DIExpression()), !dbg !136
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !136
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i64* %dataLen, metadata !139, metadata !DIExpression()), !dbg !140
  %5 = load i32*, i32** %data1, align 8, !dbg !141
  %call2 = call i64 @wcslen(i32* noundef %5), !dbg !142
  store i64 %call2, i64* %dataLen, align 8, !dbg !143
  store i64 0, i64* %i, align 8, !dbg !144
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i64, i64* %i, align 8, !dbg !147
  %7 = load i64, i64* %dataLen, align 8, !dbg !149
  %cmp = icmp ult i64 %6, %7, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %8 = load i32*, i32** %data1, align 8, !dbg !152
  %9 = load i64, i64* %i, align 8, !dbg !154
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !152
  %10 = load i32, i32* %arrayidx3, align 4, !dbg !152
  %11 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx4 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 %11, !dbg !156
  store i32 %10, i32* %arrayidx4, align 4, !dbg !157
  br label %for.inc, !dbg !158

for.inc:                                          ; preds = %for.body
  %12 = load i64, i64* %i, align 8, !dbg !159
  %inc = add i64 %12, 1, !dbg !159
  store i64 %inc, i64* %i, align 8, !dbg !159
  br label %for.cond, !dbg !160, !llvm.loop !161

for.end:                                          ; preds = %for.cond
  %arrayidx5 = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !163
  store i32 0, i32* %arrayidx5, align 4, !dbg !164
  %13 = load i32*, i32** %data1, align 8, !dbg !165
  call void @printWLine(i32* noundef %13), !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 31, column: 15, scope: !11)
!24 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_unionType", file: !12, line: 25, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !12, line: 23, baseType: !17, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !12, line: 24, baseType: !17, size: 64)
!30 = !DILocation(line: 32, column: 82, scope: !11)
!31 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 33, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 33, column: 13, scope: !11)
!36 = !DILocation(line: 34, column: 12, scope: !11)
!37 = !DILocation(line: 34, column: 10, scope: !11)
!38 = !DILocation(line: 36, column: 13, scope: !11)
!39 = !DILocation(line: 36, column: 5, scope: !11)
!40 = !DILocation(line: 37, column: 5, scope: !11)
!41 = !DILocation(line: 37, column: 17, scope: !11)
!42 = !DILocation(line: 38, column: 26, scope: !11)
!43 = !DILocation(line: 38, column: 13, scope: !11)
!44 = !DILocation(line: 38, column: 24, scope: !11)
!45 = !DILocalVariable(name: "data", scope: !46, file: !12, line: 40, type: !17)
!46 = distinct !DILexicalBlock(scope: !11, file: !12, line: 39, column: 5)
!47 = !DILocation(line: 40, column: 19, scope: !46)
!48 = !DILocation(line: 40, column: 34, scope: !46)
!49 = !DILocalVariable(name: "dest", scope: !50, file: !12, line: 42, type: !51)
!50 = distinct !DILexicalBlock(scope: !46, file: !12, line: 41, column: 9)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 50)
!54 = !DILocation(line: 42, column: 21, scope: !50)
!55 = !DILocalVariable(name: "i", scope: !50, file: !12, line: 43, type: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 31, baseType: !58)
!57 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !59)
!59 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!60 = !DILocation(line: 43, column: 20, scope: !50)
!61 = !DILocalVariable(name: "dataLen", scope: !50, file: !12, line: 43, type: !56)
!62 = !DILocation(line: 43, column: 23, scope: !50)
!63 = !DILocation(line: 44, column: 30, scope: !50)
!64 = !DILocation(line: 44, column: 23, scope: !50)
!65 = !DILocation(line: 44, column: 21, scope: !50)
!66 = !DILocation(line: 46, column: 20, scope: !67)
!67 = distinct !DILexicalBlock(scope: !50, file: !12, line: 46, column: 13)
!68 = !DILocation(line: 46, column: 18, scope: !67)
!69 = !DILocation(line: 46, column: 25, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !12, line: 46, column: 13)
!71 = !DILocation(line: 46, column: 29, scope: !70)
!72 = !DILocation(line: 46, column: 27, scope: !70)
!73 = !DILocation(line: 46, column: 13, scope: !67)
!74 = !DILocation(line: 48, column: 27, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !12, line: 47, column: 13)
!76 = !DILocation(line: 48, column: 32, scope: !75)
!77 = !DILocation(line: 48, column: 22, scope: !75)
!78 = !DILocation(line: 48, column: 17, scope: !75)
!79 = !DILocation(line: 48, column: 25, scope: !75)
!80 = !DILocation(line: 49, column: 13, scope: !75)
!81 = !DILocation(line: 46, column: 39, scope: !70)
!82 = !DILocation(line: 46, column: 13, scope: !70)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 49, column: 13, scope: !67)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 50, column: 13, scope: !50)
!87 = !DILocation(line: 50, column: 24, scope: !50)
!88 = !DILocation(line: 51, column: 24, scope: !50)
!89 = !DILocation(line: 51, column: 13, scope: !50)
!90 = !DILocation(line: 54, column: 1, scope: !11)
!91 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_declare_loop_34_good", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!92 = !DILocation(line: 90, column: 5, scope: !91)
!93 = !DILocation(line: 91, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 102, type: !95, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!95 = !DISubroutineType(types: !96)
!96 = !{!22, !22, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !12, line: 102, type: !22)
!101 = !DILocation(line: 102, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !12, line: 102, type: !97)
!103 = !DILocation(line: 102, column: 27, scope: !94)
!104 = !DILocation(line: 105, column: 22, scope: !94)
!105 = !DILocation(line: 105, column: 12, scope: !94)
!106 = !DILocation(line: 105, column: 5, scope: !94)
!107 = !DILocation(line: 107, column: 5, scope: !94)
!108 = !DILocation(line: 108, column: 5, scope: !94)
!109 = !DILocation(line: 109, column: 5, scope: !94)
!110 = !DILocation(line: 112, column: 5, scope: !94)
!111 = !DILocation(line: 113, column: 5, scope: !94)
!112 = !DILocation(line: 114, column: 5, scope: !94)
!113 = !DILocation(line: 116, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 61, type: !13, scopeLine: 62, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 63, type: !17)
!116 = !DILocation(line: 63, column: 15, scope: !114)
!117 = !DILocalVariable(name: "myUnion", scope: !114, file: !12, line: 64, type: !25)
!118 = !DILocation(line: 64, column: 82, scope: !114)
!119 = !DILocalVariable(name: "dataBuffer", scope: !114, file: !12, line: 65, type: !32)
!120 = !DILocation(line: 65, column: 13, scope: !114)
!121 = !DILocation(line: 66, column: 12, scope: !114)
!122 = !DILocation(line: 66, column: 10, scope: !114)
!123 = !DILocation(line: 68, column: 13, scope: !114)
!124 = !DILocation(line: 68, column: 5, scope: !114)
!125 = !DILocation(line: 69, column: 5, scope: !114)
!126 = !DILocation(line: 69, column: 16, scope: !114)
!127 = !DILocation(line: 70, column: 26, scope: !114)
!128 = !DILocation(line: 70, column: 13, scope: !114)
!129 = !DILocation(line: 70, column: 24, scope: !114)
!130 = !DILocalVariable(name: "data", scope: !131, file: !12, line: 72, type: !17)
!131 = distinct !DILexicalBlock(scope: !114, file: !12, line: 71, column: 5)
!132 = !DILocation(line: 72, column: 19, scope: !131)
!133 = !DILocation(line: 72, column: 34, scope: !131)
!134 = !DILocalVariable(name: "dest", scope: !135, file: !12, line: 74, type: !51)
!135 = distinct !DILexicalBlock(scope: !131, file: !12, line: 73, column: 9)
!136 = !DILocation(line: 74, column: 21, scope: !135)
!137 = !DILocalVariable(name: "i", scope: !135, file: !12, line: 75, type: !56)
!138 = !DILocation(line: 75, column: 20, scope: !135)
!139 = !DILocalVariable(name: "dataLen", scope: !135, file: !12, line: 75, type: !56)
!140 = !DILocation(line: 75, column: 23, scope: !135)
!141 = !DILocation(line: 76, column: 30, scope: !135)
!142 = !DILocation(line: 76, column: 23, scope: !135)
!143 = !DILocation(line: 76, column: 21, scope: !135)
!144 = !DILocation(line: 78, column: 20, scope: !145)
!145 = distinct !DILexicalBlock(scope: !135, file: !12, line: 78, column: 13)
!146 = !DILocation(line: 78, column: 18, scope: !145)
!147 = !DILocation(line: 78, column: 25, scope: !148)
!148 = distinct !DILexicalBlock(scope: !145, file: !12, line: 78, column: 13)
!149 = !DILocation(line: 78, column: 29, scope: !148)
!150 = !DILocation(line: 78, column: 27, scope: !148)
!151 = !DILocation(line: 78, column: 13, scope: !145)
!152 = !DILocation(line: 80, column: 27, scope: !153)
!153 = distinct !DILexicalBlock(scope: !148, file: !12, line: 79, column: 13)
!154 = !DILocation(line: 80, column: 32, scope: !153)
!155 = !DILocation(line: 80, column: 22, scope: !153)
!156 = !DILocation(line: 80, column: 17, scope: !153)
!157 = !DILocation(line: 80, column: 25, scope: !153)
!158 = !DILocation(line: 81, column: 13, scope: !153)
!159 = !DILocation(line: 78, column: 39, scope: !148)
!160 = !DILocation(line: 78, column: 13, scope: !148)
!161 = distinct !{!161, !151, !162, !85}
!162 = !DILocation(line: 81, column: 13, scope: !145)
!163 = !DILocation(line: 82, column: 13, scope: !135)
!164 = !DILocation(line: 82, column: 24, scope: !135)
!165 = !DILocation(line: 83, column: 24, scope: !135)
!166 = !DILocation(line: 83, column: 13, scope: !135)
!167 = !DILocation(line: 86, column: 1, scope: !114)
