; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  store i32* %4, i32** %data, align 8, !dbg !32
  %5 = load i32*, i32** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !33
  store i32 0, i32* %arrayidx, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !35, metadata !DIExpression()), !dbg !40
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !41
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !42
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx1, align 4, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call3 = call i32* @wcscpy(i32* %6, i32* %arraydecay2) #4, !dbg !47
  %7 = load i32*, i32** %data, align 8, !dbg !48
  call void @printWLine(i32* %7), !dbg !49
  ret void, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscpy(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02_good() #0 !dbg !51 {
entry:
  call void @goodG2B1(), !dbg !52
  call void @goodG2B2(), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !55 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #4, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #4, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  %0 = alloca i8, i64 200, align 16, !dbg !80
  %1 = bitcast i8* %0 to i32*, !dbg !81
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !79
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !82, metadata !DIExpression()), !dbg !83
  %2 = alloca i8, i64 400, align 16, !dbg !84
  %3 = bitcast i8* %2 to i32*, !dbg !85
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !83
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !86
  store i32* %4, i32** %data, align 8, !dbg !89
  %5 = load i32*, i32** %data, align 8, !dbg !90
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !90
  store i32 0, i32* %arrayidx, align 4, !dbg !91
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !92, metadata !DIExpression()), !dbg !94
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !95
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !96
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !97
  store i32 0, i32* %arrayidx1, align 4, !dbg !98
  %6 = load i32*, i32** %data, align 8, !dbg !99
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !100
  %call3 = call i32* @wcscpy(i32* %6, i32* %arraydecay2) #4, !dbg !101
  %7 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %7), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !108, metadata !DIExpression()), !dbg !109
  %0 = alloca i8, i64 200, align 16, !dbg !110
  %1 = bitcast i8* %0 to i32*, !dbg !111
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !109
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !112, metadata !DIExpression()), !dbg !113
  %2 = alloca i8, i64 400, align 16, !dbg !114
  %3 = bitcast i8* %2 to i32*, !dbg !115
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !113
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !116
  store i32* %4, i32** %data, align 8, !dbg !119
  %5 = load i32*, i32** %data, align 8, !dbg !120
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !122, metadata !DIExpression()), !dbg !124
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !125
  %call = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !126
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx1, align 4, !dbg !128
  %6 = load i32*, i32** %data, align 8, !dbg !129
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !130
  %call3 = call i32* @wcscpy(i32* %6, i32* %arraydecay2) #4, !dbg !131
  %7 = load i32*, i32** %data, align 8, !dbg !132
  call void @printWLine(i32* %7), !dbg !133
  ret void, !dbg !134
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02_bad", scope: !16, file: !16, line: 23, type: !17, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 25, type: !4)
!20 = !DILocation(line: 25, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !15)
!23 = !DILocation(line: 26, column: 42, scope: !15)
!24 = !DILocation(line: 26, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 27, type: !4)
!26 = !DILocation(line: 27, column: 15, scope: !15)
!27 = !DILocation(line: 27, column: 43, scope: !15)
!28 = !DILocation(line: 27, column: 32, scope: !15)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !16, line: 29, column: 5)
!31 = distinct !DILexicalBlock(scope: !15, file: !16, line: 28, column: 8)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 9, scope: !30)
!34 = !DILocation(line: 33, column: 17, scope: !30)
!35 = !DILocalVariable(name: "source", scope: !36, file: !16, line: 36, type: !37)
!36 = distinct !DILexicalBlock(scope: !15, file: !16, line: 35, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 100)
!40 = !DILocation(line: 36, column: 17, scope: !36)
!41 = !DILocation(line: 37, column: 17, scope: !36)
!42 = !DILocation(line: 37, column: 9, scope: !36)
!43 = !DILocation(line: 38, column: 9, scope: !36)
!44 = !DILocation(line: 38, column: 23, scope: !36)
!45 = !DILocation(line: 40, column: 16, scope: !36)
!46 = !DILocation(line: 40, column: 22, scope: !36)
!47 = !DILocation(line: 40, column: 9, scope: !36)
!48 = !DILocation(line: 41, column: 20, scope: !36)
!49 = !DILocation(line: 41, column: 9, scope: !36)
!50 = !DILocation(line: 43, column: 1, scope: !15)
!51 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cpy_02_good", scope: !16, file: !16, line: 98, type: !17, scopeLine: 99, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!52 = !DILocation(line: 100, column: 5, scope: !51)
!53 = !DILocation(line: 101, column: 5, scope: !51)
!54 = !DILocation(line: 102, column: 1, scope: !51)
!55 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 114, type: !56, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{!7, !7, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !16, line: 114, type: !7)
!62 = !DILocation(line: 114, column: 14, scope: !55)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !16, line: 114, type: !58)
!64 = !DILocation(line: 114, column: 27, scope: !55)
!65 = !DILocation(line: 117, column: 22, scope: !55)
!66 = !DILocation(line: 117, column: 12, scope: !55)
!67 = !DILocation(line: 117, column: 5, scope: !55)
!68 = !DILocation(line: 119, column: 5, scope: !55)
!69 = !DILocation(line: 120, column: 5, scope: !55)
!70 = !DILocation(line: 121, column: 5, scope: !55)
!71 = !DILocation(line: 124, column: 5, scope: !55)
!72 = !DILocation(line: 125, column: 5, scope: !55)
!73 = !DILocation(line: 126, column: 5, scope: !55)
!74 = !DILocation(line: 128, column: 5, scope: !55)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 50, type: !17, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !16, line: 52, type: !4)
!77 = !DILocation(line: 52, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !16, line: 53, type: !4)
!79 = !DILocation(line: 53, column: 15, scope: !75)
!80 = !DILocation(line: 53, column: 42, scope: !75)
!81 = !DILocation(line: 53, column: 31, scope: !75)
!82 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !16, line: 54, type: !4)
!83 = !DILocation(line: 54, column: 15, scope: !75)
!84 = !DILocation(line: 54, column: 43, scope: !75)
!85 = !DILocation(line: 54, column: 32, scope: !75)
!86 = !DILocation(line: 63, column: 16, scope: !87)
!87 = distinct !DILexicalBlock(scope: !88, file: !16, line: 61, column: 5)
!88 = distinct !DILexicalBlock(scope: !75, file: !16, line: 55, column: 8)
!89 = !DILocation(line: 63, column: 14, scope: !87)
!90 = !DILocation(line: 64, column: 9, scope: !87)
!91 = !DILocation(line: 64, column: 17, scope: !87)
!92 = !DILocalVariable(name: "source", scope: !93, file: !16, line: 67, type: !37)
!93 = distinct !DILexicalBlock(scope: !75, file: !16, line: 66, column: 5)
!94 = !DILocation(line: 67, column: 17, scope: !93)
!95 = !DILocation(line: 68, column: 17, scope: !93)
!96 = !DILocation(line: 68, column: 9, scope: !93)
!97 = !DILocation(line: 69, column: 9, scope: !93)
!98 = !DILocation(line: 69, column: 23, scope: !93)
!99 = !DILocation(line: 71, column: 16, scope: !93)
!100 = !DILocation(line: 71, column: 22, scope: !93)
!101 = !DILocation(line: 71, column: 9, scope: !93)
!102 = !DILocation(line: 72, column: 20, scope: !93)
!103 = !DILocation(line: 72, column: 9, scope: !93)
!104 = !DILocation(line: 74, column: 1, scope: !75)
!105 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 77, type: !17, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !16, line: 79, type: !4)
!107 = !DILocation(line: 79, column: 15, scope: !105)
!108 = !DILocalVariable(name: "dataBadBuffer", scope: !105, file: !16, line: 80, type: !4)
!109 = !DILocation(line: 80, column: 15, scope: !105)
!110 = !DILocation(line: 80, column: 42, scope: !105)
!111 = !DILocation(line: 80, column: 31, scope: !105)
!112 = !DILocalVariable(name: "dataGoodBuffer", scope: !105, file: !16, line: 81, type: !4)
!113 = !DILocation(line: 81, column: 15, scope: !105)
!114 = !DILocation(line: 81, column: 43, scope: !105)
!115 = !DILocation(line: 81, column: 32, scope: !105)
!116 = !DILocation(line: 85, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !16, line: 83, column: 5)
!118 = distinct !DILexicalBlock(scope: !105, file: !16, line: 82, column: 8)
!119 = !DILocation(line: 85, column: 14, scope: !117)
!120 = !DILocation(line: 86, column: 9, scope: !117)
!121 = !DILocation(line: 86, column: 17, scope: !117)
!122 = !DILocalVariable(name: "source", scope: !123, file: !16, line: 89, type: !37)
!123 = distinct !DILexicalBlock(scope: !105, file: !16, line: 88, column: 5)
!124 = !DILocation(line: 89, column: 17, scope: !123)
!125 = !DILocation(line: 90, column: 17, scope: !123)
!126 = !DILocation(line: 90, column: 9, scope: !123)
!127 = !DILocation(line: 91, column: 9, scope: !123)
!128 = !DILocation(line: 91, column: 23, scope: !123)
!129 = !DILocation(line: 93, column: 16, scope: !123)
!130 = !DILocation(line: 93, column: 22, scope: !123)
!131 = !DILocation(line: 93, column: 9, scope: !123)
!132 = !DILocation(line: 94, column: 20, scope: !123)
!133 = !DILocation(line: 94, column: 9, scope: !123)
!134 = !DILocation(line: 96, column: 1, scope: !105)
