; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !31
  store i32* %arraydecay, i32** %data, align 8, !dbg !32
  %0 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !40, metadata !DIExpression()), !dbg !41
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !42
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !43
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !44
  store i32 0, i32* %arrayidx2, align 4, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !55
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !55
  %4 = load i32*, i32** %data, align 8, !dbg !56
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !56
  store i32 %3, i32* %arrayidx4, align 4, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !65
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !65
  store i32 0, i32* %arrayidx5, align 4, !dbg !66
  %8 = load i32*, i32** %data, align 8, !dbg !67
  call void @printWLine(i32* %8), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_good() #0 !dbg !70 {
entry:
  call void @goodG2B(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #4, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #4, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !93 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !100
  store i32* %arraydecay, i32** %data, align 8, !dbg !101
  %0 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  call void @llvm.dbg.declare(metadata i64* %i, metadata !104, metadata !DIExpression()), !dbg !106
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !107, metadata !DIExpression()), !dbg !108
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !109
  %call = call i32* @wmemset(i32* %arraydecay1, i32 67, i64 99) #4, !dbg !110
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !111
  store i32 0, i32* %arrayidx2, align 4, !dbg !112
  store i64 0, i64* %i, align 8, !dbg !113
  br label %for.cond, !dbg !115

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, i64* %i, align 8, !dbg !116
  %cmp = icmp ult i64 %1, 100, !dbg !118
  br i1 %cmp, label %for.body, label %for.end, !dbg !119

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !120
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !122
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !122
  %4 = load i32*, i32** %data, align 8, !dbg !123
  %5 = load i64, i64* %i, align 8, !dbg !124
  %arrayidx4 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !123
  store i32 %3, i32* %arrayidx4, align 4, !dbg !125
  br label %for.inc, !dbg !126

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !127
  %inc = add i64 %6, 1, !dbg !127
  store i64 %inc, i64* %i, align 8, !dbg !127
  br label %for.cond, !dbg !128, !llvm.loop !129

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !131
  %arrayidx5 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !131
  store i32 0, i32* %arrayidx5, align 4, !dbg !132
  %8 = load i32*, i32** %data, align 8, !dbg !133
  call void @printWLine(i32* %8), !dbg !134
  ret void, !dbg !135
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 1600, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 50)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 100)
!30 = !DILocation(line: 27, column: 13, scope: !11)
!31 = !DILocation(line: 30, column: 12, scope: !11)
!32 = !DILocation(line: 30, column: 10, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 13, scope: !11)
!35 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 33, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !38)
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 33, column: 16, scope: !36)
!40 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 34, type: !27)
!41 = !DILocation(line: 34, column: 17, scope: !36)
!42 = !DILocation(line: 35, column: 17, scope: !36)
!43 = !DILocation(line: 35, column: 9, scope: !36)
!44 = !DILocation(line: 36, column: 9, scope: !36)
!45 = !DILocation(line: 36, column: 23, scope: !36)
!46 = !DILocation(line: 38, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !12, line: 38, column: 9)
!48 = !DILocation(line: 38, column: 14, scope: !47)
!49 = !DILocation(line: 38, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 38, column: 9)
!51 = !DILocation(line: 38, column: 23, scope: !50)
!52 = !DILocation(line: 38, column: 9, scope: !47)
!53 = !DILocation(line: 40, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 39, column: 9)
!55 = !DILocation(line: 40, column: 23, scope: !54)
!56 = !DILocation(line: 40, column: 13, scope: !54)
!57 = !DILocation(line: 40, column: 18, scope: !54)
!58 = !DILocation(line: 40, column: 21, scope: !54)
!59 = !DILocation(line: 41, column: 9, scope: !54)
!60 = !DILocation(line: 38, column: 31, scope: !50)
!61 = !DILocation(line: 38, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 41, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 42, column: 9, scope: !36)
!66 = !DILocation(line: 42, column: 21, scope: !36)
!67 = !DILocation(line: 43, column: 20, scope: !36)
!68 = !DILocation(line: 43, column: 9, scope: !36)
!69 = !DILocation(line: 45, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_loop_01_good", scope: !12, file: !12, line: 75, type: !13, scopeLine: 76, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 77, column: 5, scope: !70)
!72 = !DILocation(line: 78, column: 1, scope: !70)
!73 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 90, type: !74, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!19, !19, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !12, line: 90, type: !19)
!80 = !DILocation(line: 90, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !12, line: 90, type: !76)
!82 = !DILocation(line: 90, column: 27, scope: !73)
!83 = !DILocation(line: 93, column: 22, scope: !73)
!84 = !DILocation(line: 93, column: 12, scope: !73)
!85 = !DILocation(line: 93, column: 5, scope: !73)
!86 = !DILocation(line: 95, column: 5, scope: !73)
!87 = !DILocation(line: 96, column: 5, scope: !73)
!88 = !DILocation(line: 97, column: 5, scope: !73)
!89 = !DILocation(line: 100, column: 5, scope: !73)
!90 = !DILocation(line: 101, column: 5, scope: !73)
!91 = !DILocation(line: 102, column: 5, scope: !73)
!92 = !DILocation(line: 104, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !13, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 54, type: !16)
!95 = !DILocation(line: 54, column: 15, scope: !93)
!96 = !DILocalVariable(name: "dataBadBuffer", scope: !93, file: !12, line: 55, type: !22)
!97 = !DILocation(line: 55, column: 13, scope: !93)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !93, file: !12, line: 56, type: !27)
!99 = !DILocation(line: 56, column: 13, scope: !93)
!100 = !DILocation(line: 58, column: 12, scope: !93)
!101 = !DILocation(line: 58, column: 10, scope: !93)
!102 = !DILocation(line: 59, column: 5, scope: !93)
!103 = !DILocation(line: 59, column: 13, scope: !93)
!104 = !DILocalVariable(name: "i", scope: !105, file: !12, line: 61, type: !37)
!105 = distinct !DILexicalBlock(scope: !93, file: !12, line: 60, column: 5)
!106 = !DILocation(line: 61, column: 16, scope: !105)
!107 = !DILocalVariable(name: "source", scope: !105, file: !12, line: 62, type: !27)
!108 = !DILocation(line: 62, column: 17, scope: !105)
!109 = !DILocation(line: 63, column: 17, scope: !105)
!110 = !DILocation(line: 63, column: 9, scope: !105)
!111 = !DILocation(line: 64, column: 9, scope: !105)
!112 = !DILocation(line: 64, column: 23, scope: !105)
!113 = !DILocation(line: 66, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !105, file: !12, line: 66, column: 9)
!115 = !DILocation(line: 66, column: 14, scope: !114)
!116 = !DILocation(line: 66, column: 21, scope: !117)
!117 = distinct !DILexicalBlock(scope: !114, file: !12, line: 66, column: 9)
!118 = !DILocation(line: 66, column: 23, scope: !117)
!119 = !DILocation(line: 66, column: 9, scope: !114)
!120 = !DILocation(line: 68, column: 30, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !12, line: 67, column: 9)
!122 = !DILocation(line: 68, column: 23, scope: !121)
!123 = !DILocation(line: 68, column: 13, scope: !121)
!124 = !DILocation(line: 68, column: 18, scope: !121)
!125 = !DILocation(line: 68, column: 21, scope: !121)
!126 = !DILocation(line: 69, column: 9, scope: !121)
!127 = !DILocation(line: 66, column: 31, scope: !117)
!128 = !DILocation(line: 66, column: 9, scope: !117)
!129 = distinct !{!129, !119, !130, !64}
!130 = !DILocation(line: 69, column: 9, scope: !114)
!131 = !DILocation(line: 70, column: 9, scope: !105)
!132 = !DILocation(line: 70, column: 21, scope: !105)
!133 = !DILocation(line: 71, column: 20, scope: !105)
!134 = !DILocation(line: 71, column: 9, scope: !105)
!135 = !DILocation(line: 73, column: 1, scope: !93)
