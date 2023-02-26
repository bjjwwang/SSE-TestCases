; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  br label %source, !dbg !31

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !32), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  store i32* %arraydecay, i32** %data, align 8, !dbg !35
  %0 = load i32*, i32** %data, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !38, metadata !DIExpression()), !dbg !40
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !41
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !42
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !43
  store i32 0, i32* %arrayidx3, align 4, !dbg !44
  %1 = load i32*, i32** %data, align 8, !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !46
  %call5 = call i32* @wcsncpy(i32* %1, i32* %arraydecay4, i64 99) #4, !dbg !47
  %2 = load i32*, i32** %data, align 8, !dbg !48
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !48
  store i32 0, i32* %arrayidx6, align 4, !dbg !49
  %3 = load i32*, i32** %data, align 8, !dbg !50
  call void @printWLine(i32* %3), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcsncpy(i32*, i32*, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !62, metadata !DIExpression()), !dbg !63
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !64, metadata !DIExpression()), !dbg !65
  %call = call i64 @time(i64* null) #4, !dbg !66
  %conv = trunc i64 %call to i32, !dbg !67
  call void @srand(i32 %conv) #4, !dbg !68
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !69
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_good(), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !72
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_bad(), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  ret i32 0, !dbg !75
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !76 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %source1 = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !77, metadata !DIExpression()), !dbg !78
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  br label %source, !dbg !83

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !84), !dbg !85
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !86
  store i32* %arraydecay, i32** %data, align 8, !dbg !87
  %0 = load i32*, i32** %data, align 8, !dbg !88
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 0, !dbg !88
  store i32 0, i32* %arrayidx, align 4, !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i32]* %source1, metadata !90, metadata !DIExpression()), !dbg !92
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !93
  %call = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !94
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 99, !dbg !95
  store i32 0, i32* %arrayidx3, align 4, !dbg !96
  %1 = load i32*, i32** %data, align 8, !dbg !97
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %source1, i64 0, i64 0, !dbg !98
  %call5 = call i32* @wcsncpy(i32* %1, i32* %arraydecay4, i64 99) #4, !dbg !99
  %2 = load i32*, i32** %data, align 8, !dbg !100
  %arrayidx6 = getelementptr inbounds i32, i32* %2, i64 99, !dbg !100
  store i32 0, i32* %arrayidx6, align 4, !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  call void @printWLine(i32* %3), !dbg !103
  ret void, !dbg !104
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!31 = !DILocation(line: 28, column: 5, scope: !11)
!32 = !DILabel(scope: !11, name: "source", file: !12, line: 29)
!33 = !DILocation(line: 29, column: 1, scope: !11)
!34 = !DILocation(line: 32, column: 12, scope: !11)
!35 = !DILocation(line: 32, column: 10, scope: !11)
!36 = !DILocation(line: 33, column: 5, scope: !11)
!37 = !DILocation(line: 33, column: 13, scope: !11)
!38 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 35, type: !27)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!40 = !DILocation(line: 35, column: 17, scope: !39)
!41 = !DILocation(line: 36, column: 17, scope: !39)
!42 = !DILocation(line: 36, column: 9, scope: !39)
!43 = !DILocation(line: 37, column: 9, scope: !39)
!44 = !DILocation(line: 37, column: 23, scope: !39)
!45 = !DILocation(line: 39, column: 17, scope: !39)
!46 = !DILocation(line: 39, column: 23, scope: !39)
!47 = !DILocation(line: 39, column: 9, scope: !39)
!48 = !DILocation(line: 40, column: 9, scope: !39)
!49 = !DILocation(line: 40, column: 21, scope: !39)
!50 = !DILocation(line: 41, column: 20, scope: !39)
!51 = !DILocation(line: 41, column: 9, scope: !39)
!52 = !DILocation(line: 43, column: 1, scope: !11)
!53 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_declare_ncpy_18_good", scope: !12, file: !12, line: 71, type: !13, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 73, column: 5, scope: !53)
!55 = !DILocation(line: 74, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 86, type: !57, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!19, !19, !59}
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!62 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !12, line: 86, type: !19)
!63 = !DILocation(line: 86, column: 14, scope: !56)
!64 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !12, line: 86, type: !59)
!65 = !DILocation(line: 86, column: 27, scope: !56)
!66 = !DILocation(line: 89, column: 22, scope: !56)
!67 = !DILocation(line: 89, column: 12, scope: !56)
!68 = !DILocation(line: 89, column: 5, scope: !56)
!69 = !DILocation(line: 91, column: 5, scope: !56)
!70 = !DILocation(line: 92, column: 5, scope: !56)
!71 = !DILocation(line: 93, column: 5, scope: !56)
!72 = !DILocation(line: 96, column: 5, scope: !56)
!73 = !DILocation(line: 97, column: 5, scope: !56)
!74 = !DILocation(line: 98, column: 5, scope: !56)
!75 = !DILocation(line: 100, column: 5, scope: !56)
!76 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 50, type: !13, scopeLine: 51, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DILocalVariable(name: "data", scope: !76, file: !12, line: 52, type: !16)
!78 = !DILocation(line: 52, column: 15, scope: !76)
!79 = !DILocalVariable(name: "dataBadBuffer", scope: !76, file: !12, line: 53, type: !22)
!80 = !DILocation(line: 53, column: 13, scope: !76)
!81 = !DILocalVariable(name: "dataGoodBuffer", scope: !76, file: !12, line: 54, type: !27)
!82 = !DILocation(line: 54, column: 13, scope: !76)
!83 = !DILocation(line: 55, column: 5, scope: !76)
!84 = !DILabel(scope: !76, name: "source", file: !12, line: 56)
!85 = !DILocation(line: 56, column: 1, scope: !76)
!86 = !DILocation(line: 58, column: 12, scope: !76)
!87 = !DILocation(line: 58, column: 10, scope: !76)
!88 = !DILocation(line: 59, column: 5, scope: !76)
!89 = !DILocation(line: 59, column: 13, scope: !76)
!90 = !DILocalVariable(name: "source", scope: !91, file: !12, line: 61, type: !27)
!91 = distinct !DILexicalBlock(scope: !76, file: !12, line: 60, column: 5)
!92 = !DILocation(line: 61, column: 17, scope: !91)
!93 = !DILocation(line: 62, column: 17, scope: !91)
!94 = !DILocation(line: 62, column: 9, scope: !91)
!95 = !DILocation(line: 63, column: 9, scope: !91)
!96 = !DILocation(line: 63, column: 23, scope: !91)
!97 = !DILocation(line: 65, column: 17, scope: !91)
!98 = !DILocation(line: 65, column: 23, scope: !91)
!99 = !DILocation(line: 65, column: 9, scope: !91)
!100 = !DILocation(line: 66, column: 9, scope: !91)
!101 = !DILocation(line: 66, column: 21, scope: !91)
!102 = !DILocation(line: 67, column: 20, scope: !91)
!103 = !DILocation(line: 67, column: 9, scope: !91)
!104 = !DILocation(line: 69, column: 1, scope: !76)
