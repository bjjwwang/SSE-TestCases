; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType = type { i32* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion, metadata !24, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !36, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !41
  store i32* %arraydecay, i32** %data, align 8, !dbg !42
  %0 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !46
  store i32* %1, i32** %unionFirst, align 8, !dbg !47
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !48, metadata !DIExpression()), !dbg !50
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !51
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !51
  store i32* %2, i32** %data1, align 8, !dbg !50
  call void @llvm.dbg.declare(metadata i64* %i, metadata !52, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !59, metadata !DIExpression()), !dbg !60
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !61
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !62
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !63
  store i32 0, i32* %arrayidx3, align 4, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !68
  %cmp = icmp ult i64 %3, 100, !dbg !70
  br i1 %cmp, label %for.body, label %for.end, !dbg !71

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !74
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !74
  %6 = load i32*, i32** %data1, align 8, !dbg !75
  %7 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !75
  store i32 %5, i32* %arrayidx5, align 4, !dbg !77
  br label %for.inc, !dbg !78

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !79
  %inc = add i64 %8, 1, !dbg !79
  store i64 %inc, i64* %i, align 8, !dbg !79
  br label %for.cond, !dbg !80, !llvm.loop !81

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !84
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !84
  store i32 0, i32* %arrayidx6, align 4, !dbg !85
  %10 = load i32*, i32** %data1, align 8, !dbg !86
  call void @printWLine(i32* noundef %10), !dbg !87
  ret void, !dbg !88
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_good() #0 !dbg !89 {
entry:
  call void @goodG2B(), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !92 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_good(), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !108
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_bad(), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !110
  ret i32 0, !dbg !111
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !112 {
entry:
  %data = alloca i32*, align 8
  %myUnion = alloca %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %data1 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  store i32* %arraydecay, i32** %data, align 8, !dbg !122
  %0 = load i32*, i32** %data, align 8, !dbg !123
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !123
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %1 = load i32*, i32** %data, align 8, !dbg !125
  %unionFirst = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !126
  store i32* %1, i32** %unionFirst, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i32** %data1, metadata !128, metadata !DIExpression()), !dbg !130
  %unionSecond = bitcast %union.CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType* %myUnion to i32**, !dbg !131
  %2 = load i32*, i32** %unionSecond, align 8, !dbg !131
  store i32* %2, i32** %data1, align 8, !dbg !130
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !135, metadata !DIExpression()), !dbg !136
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !137
  %call = call i32* @wmemset(i32* noundef %arraydecay2, i32 noundef 67, i64 noundef 99), !dbg !138
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !139
  store i32 0, i32* %arrayidx3, align 4, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i64, i64* %i, align 8, !dbg !144
  %cmp = icmp ult i64 %3, 100, !dbg !146
  br i1 %cmp, label %for.body, label %for.end, !dbg !147

for.body:                                         ; preds = %for.cond
  %4 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %4, !dbg !150
  %5 = load i32, i32* %arrayidx4, align 4, !dbg !150
  %6 = load i32*, i32** %data1, align 8, !dbg !151
  %7 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx5 = getelementptr inbounds i32, i32* %6, i64 %7, !dbg !151
  store i32 %5, i32* %arrayidx5, align 4, !dbg !153
  br label %for.inc, !dbg !154

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !155
  %inc = add i64 %8, 1, !dbg !155
  store i64 %inc, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !156, !llvm.loop !157

for.end:                                          ; preds = %for.cond
  %9 = load i32*, i32** %data1, align 8, !dbg !159
  %arrayidx6 = getelementptr inbounds i32, i32* %9, i64 99, !dbg !159
  store i32 0, i32* %arrayidx6, align 4, !dbg !160
  %10 = load i32*, i32** %data1, align 8, !dbg !161
  call void @printWLine(i32* noundef %10), !dbg !162
  ret void, !dbg !163
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_unionType", file: !12, line: 25, baseType: !26)
!26 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !26, file: !12, line: 23, baseType: !17, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !26, file: !12, line: 24, baseType: !17, size: 64)
!30 = !DILocation(line: 32, column: 82, scope: !11)
!31 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 50)
!35 = !DILocation(line: 33, column: 13, scope: !11)
!36 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 34, column: 13, scope: !11)
!41 = !DILocation(line: 37, column: 12, scope: !11)
!42 = !DILocation(line: 37, column: 10, scope: !11)
!43 = !DILocation(line: 38, column: 5, scope: !11)
!44 = !DILocation(line: 38, column: 13, scope: !11)
!45 = !DILocation(line: 39, column: 26, scope: !11)
!46 = !DILocation(line: 39, column: 13, scope: !11)
!47 = !DILocation(line: 39, column: 24, scope: !11)
!48 = !DILocalVariable(name: "data", scope: !49, file: !12, line: 41, type: !17)
!49 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 5)
!50 = !DILocation(line: 41, column: 19, scope: !49)
!51 = !DILocation(line: 41, column: 34, scope: !49)
!52 = !DILocalVariable(name: "i", scope: !53, file: !12, line: 43, type: !54)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 42, column: 9)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !55, line: 31, baseType: !56)
!55 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !57)
!57 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 43, column: 20, scope: !53)
!59 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 44, type: !37)
!60 = !DILocation(line: 44, column: 21, scope: !53)
!61 = !DILocation(line: 45, column: 21, scope: !53)
!62 = !DILocation(line: 45, column: 13, scope: !53)
!63 = !DILocation(line: 46, column: 13, scope: !53)
!64 = !DILocation(line: 46, column: 27, scope: !53)
!65 = !DILocation(line: 48, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !53, file: !12, line: 48, column: 13)
!67 = !DILocation(line: 48, column: 18, scope: !66)
!68 = !DILocation(line: 48, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !12, line: 48, column: 13)
!70 = !DILocation(line: 48, column: 27, scope: !69)
!71 = !DILocation(line: 48, column: 13, scope: !66)
!72 = !DILocation(line: 50, column: 34, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !12, line: 49, column: 13)
!74 = !DILocation(line: 50, column: 27, scope: !73)
!75 = !DILocation(line: 50, column: 17, scope: !73)
!76 = !DILocation(line: 50, column: 22, scope: !73)
!77 = !DILocation(line: 50, column: 25, scope: !73)
!78 = !DILocation(line: 51, column: 13, scope: !73)
!79 = !DILocation(line: 48, column: 35, scope: !69)
!80 = !DILocation(line: 48, column: 13, scope: !69)
!81 = distinct !{!81, !71, !82, !83}
!82 = !DILocation(line: 51, column: 13, scope: !66)
!83 = !{!"llvm.loop.mustprogress"}
!84 = !DILocation(line: 52, column: 13, scope: !53)
!85 = !DILocation(line: 52, column: 25, scope: !53)
!86 = !DILocation(line: 53, column: 24, scope: !53)
!87 = !DILocation(line: 53, column: 13, scope: !53)
!88 = !DILocation(line: 56, column: 1, scope: !11)
!89 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_34_good", scope: !12, file: !12, line: 91, type: !13, scopeLine: 92, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!90 = !DILocation(line: 93, column: 5, scope: !89)
!91 = !DILocation(line: 94, column: 1, scope: !89)
!92 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 105, type: !93, scopeLine: 106, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!93 = !DISubroutineType(types: !94)
!94 = !{!22, !22, !95}
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!98 = !DILocalVariable(name: "argc", arg: 1, scope: !92, file: !12, line: 105, type: !22)
!99 = !DILocation(line: 105, column: 14, scope: !92)
!100 = !DILocalVariable(name: "argv", arg: 2, scope: !92, file: !12, line: 105, type: !95)
!101 = !DILocation(line: 105, column: 27, scope: !92)
!102 = !DILocation(line: 108, column: 22, scope: !92)
!103 = !DILocation(line: 108, column: 12, scope: !92)
!104 = !DILocation(line: 108, column: 5, scope: !92)
!105 = !DILocation(line: 110, column: 5, scope: !92)
!106 = !DILocation(line: 111, column: 5, scope: !92)
!107 = !DILocation(line: 112, column: 5, scope: !92)
!108 = !DILocation(line: 115, column: 5, scope: !92)
!109 = !DILocation(line: 116, column: 5, scope: !92)
!110 = !DILocation(line: 117, column: 5, scope: !92)
!111 = !DILocation(line: 119, column: 5, scope: !92)
!112 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 63, type: !13, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!113 = !DILocalVariable(name: "data", scope: !112, file: !12, line: 65, type: !17)
!114 = !DILocation(line: 65, column: 15, scope: !112)
!115 = !DILocalVariable(name: "myUnion", scope: !112, file: !12, line: 66, type: !25)
!116 = !DILocation(line: 66, column: 82, scope: !112)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !112, file: !12, line: 67, type: !32)
!118 = !DILocation(line: 67, column: 13, scope: !112)
!119 = !DILocalVariable(name: "dataGoodBuffer", scope: !112, file: !12, line: 68, type: !37)
!120 = !DILocation(line: 68, column: 13, scope: !112)
!121 = !DILocation(line: 70, column: 12, scope: !112)
!122 = !DILocation(line: 70, column: 10, scope: !112)
!123 = !DILocation(line: 71, column: 5, scope: !112)
!124 = !DILocation(line: 71, column: 13, scope: !112)
!125 = !DILocation(line: 72, column: 26, scope: !112)
!126 = !DILocation(line: 72, column: 13, scope: !112)
!127 = !DILocation(line: 72, column: 24, scope: !112)
!128 = !DILocalVariable(name: "data", scope: !129, file: !12, line: 74, type: !17)
!129 = distinct !DILexicalBlock(scope: !112, file: !12, line: 73, column: 5)
!130 = !DILocation(line: 74, column: 19, scope: !129)
!131 = !DILocation(line: 74, column: 34, scope: !129)
!132 = !DILocalVariable(name: "i", scope: !133, file: !12, line: 76, type: !54)
!133 = distinct !DILexicalBlock(scope: !129, file: !12, line: 75, column: 9)
!134 = !DILocation(line: 76, column: 20, scope: !133)
!135 = !DILocalVariable(name: "source", scope: !133, file: !12, line: 77, type: !37)
!136 = !DILocation(line: 77, column: 21, scope: !133)
!137 = !DILocation(line: 78, column: 21, scope: !133)
!138 = !DILocation(line: 78, column: 13, scope: !133)
!139 = !DILocation(line: 79, column: 13, scope: !133)
!140 = !DILocation(line: 79, column: 27, scope: !133)
!141 = !DILocation(line: 81, column: 20, scope: !142)
!142 = distinct !DILexicalBlock(scope: !133, file: !12, line: 81, column: 13)
!143 = !DILocation(line: 81, column: 18, scope: !142)
!144 = !DILocation(line: 81, column: 25, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 81, column: 13)
!146 = !DILocation(line: 81, column: 27, scope: !145)
!147 = !DILocation(line: 81, column: 13, scope: !142)
!148 = !DILocation(line: 83, column: 34, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !12, line: 82, column: 13)
!150 = !DILocation(line: 83, column: 27, scope: !149)
!151 = !DILocation(line: 83, column: 17, scope: !149)
!152 = !DILocation(line: 83, column: 22, scope: !149)
!153 = !DILocation(line: 83, column: 25, scope: !149)
!154 = !DILocation(line: 84, column: 13, scope: !149)
!155 = !DILocation(line: 81, column: 35, scope: !145)
!156 = !DILocation(line: 81, column: 13, scope: !145)
!157 = distinct !{!157, !147, !158, !83}
!158 = !DILocation(line: 84, column: 13, scope: !142)
!159 = !DILocation(line: 85, column: 13, scope: !133)
!160 = !DILocation(line: 85, column: 25, scope: !133)
!161 = !DILocation(line: 86, column: 24, scope: !133)
!162 = !DILocation(line: 86, column: 13, scope: !133)
!163 = !DILocation(line: 89, column: 1, scope: !112)
