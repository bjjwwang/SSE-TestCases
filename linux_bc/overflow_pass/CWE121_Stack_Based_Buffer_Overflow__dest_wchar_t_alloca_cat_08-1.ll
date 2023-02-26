; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08_bad() #0 !dbg !15 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call, 0, !dbg !29
  br i1 %tobool, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  store i32* %4, i32** %data, align 8, !dbg !34
  %5 = load i32*, i32** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !35
  store i32 0, i32* %arrayidx, align 4, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !38, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !44
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !45
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !46
  store i32 0, i32* %arrayidx2, align 4, !dbg !47
  %6 = load i32*, i32** %data, align 8, !dbg !48
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !49
  %call4 = call i32* @wcscat(i32* %6, i32* %arraydecay3) #4, !dbg !50
  %7 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %7), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08_good() #0 !dbg !54 {
entry:
  call void @goodG2B1(), !dbg !55
  call void @goodG2B2(), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !58 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !66, metadata !DIExpression()), !dbg !67
  %call = call i64 @time(i64* null) #4, !dbg !68
  %conv = trunc i64 %call to i32, !dbg !69
  call void @srand(i32 %conv) #4, !dbg !70
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !71
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08_good(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !74
  call void @CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08_bad(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  ret i32 0, !dbg !77
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !78 {
entry:
  ret i32 1, !dbg !81
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  %0 = alloca i8, i64 200, align 16, !dbg !87
  %1 = bitcast i8* %0 to i32*, !dbg !88
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !86
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %2 = alloca i8, i64 400, align 16, !dbg !91
  %3 = bitcast i8* %2 to i32*, !dbg !92
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !90
  %call = call i32 @staticReturnsFalse(), !dbg !93
  %tobool = icmp ne i32 %call, 0, !dbg !93
  br i1 %tobool, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  br label %if.end, !dbg !98

if.else:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !99
  store i32* %4, i32** %data, align 8, !dbg !101
  %5 = load i32*, i32** %data, align 8, !dbg !102
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !102
  store i32 0, i32* %arrayidx, align 4, !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !104, metadata !DIExpression()), !dbg !106
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !107
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !108
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !109
  store i32 0, i32* %arrayidx2, align 4, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !112
  %call4 = call i32* @wcscat(i32* %6, i32* %arraydecay3) #4, !dbg !113
  %7 = load i32*, i32** %data, align 8, !dbg !114
  call void @printWLine(i32* %7), !dbg !115
  ret void, !dbg !116
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !117 {
entry:
  ret i32 0, !dbg !118
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !119 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = alloca i8, i64 200, align 16, !dbg !124
  %1 = bitcast i8* %0 to i32*, !dbg !125
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %2 = alloca i8, i64 400, align 16, !dbg !128
  %3 = bitcast i8* %2 to i32*, !dbg !129
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !127
  %call = call i32 @staticReturnsTrue(), !dbg !130
  %tobool = icmp ne i32 %call, 0, !dbg !130
  br i1 %tobool, label %if.then, label %if.end, !dbg !132

if.then:                                          ; preds = %entry
  %4 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !133
  store i32* %4, i32** %data, align 8, !dbg !135
  %5 = load i32*, i32** %data, align 8, !dbg !136
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 0, !dbg !136
  store i32 0, i32* %arrayidx, align 4, !dbg !137
  br label %if.end, !dbg !138

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !139, metadata !DIExpression()), !dbg !141
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !142
  %call1 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #4, !dbg !143
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !144
  store i32 0, i32* %arrayidx2, align 4, !dbg !145
  %6 = load i32*, i32** %data, align 8, !dbg !146
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !147
  %call4 = call i32* @wcscat(i32* %6, i32* %arraydecay3) #4, !dbg !148
  %7 = load i32*, i32** %data, align 8, !dbg !149
  call void @printWLine(i32* %7), !dbg !150
  ret void, !dbg !151
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!15 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 42, scope: !15)
!24 = !DILocation(line: 40, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 41, type: !4)
!26 = !DILocation(line: 41, column: 15, scope: !15)
!27 = !DILocation(line: 41, column: 43, scope: !15)
!28 = !DILocation(line: 41, column: 32, scope: !15)
!29 = !DILocation(line: 42, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !15, file: !16, line: 42, column: 8)
!31 = !DILocation(line: 42, column: 8, scope: !15)
!32 = !DILocation(line: 46, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !16, line: 43, column: 5)
!34 = !DILocation(line: 46, column: 14, scope: !33)
!35 = !DILocation(line: 47, column: 9, scope: !33)
!36 = !DILocation(line: 47, column: 17, scope: !33)
!37 = !DILocation(line: 48, column: 5, scope: !33)
!38 = !DILocalVariable(name: "source", scope: !39, file: !16, line: 50, type: !40)
!39 = distinct !DILexicalBlock(scope: !15, file: !16, line: 49, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 100)
!43 = !DILocation(line: 50, column: 17, scope: !39)
!44 = !DILocation(line: 51, column: 17, scope: !39)
!45 = !DILocation(line: 51, column: 9, scope: !39)
!46 = !DILocation(line: 52, column: 9, scope: !39)
!47 = !DILocation(line: 52, column: 23, scope: !39)
!48 = !DILocation(line: 54, column: 16, scope: !39)
!49 = !DILocation(line: 54, column: 22, scope: !39)
!50 = !DILocation(line: 54, column: 9, scope: !39)
!51 = !DILocation(line: 55, column: 20, scope: !39)
!52 = !DILocation(line: 55, column: 9, scope: !39)
!53 = !DILocation(line: 57, column: 1, scope: !15)
!54 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__dest_wchar_t_alloca_cat_08_good", scope: !16, file: !16, line: 112, type: !17, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocation(line: 114, column: 5, scope: !54)
!56 = !DILocation(line: 115, column: 5, scope: !54)
!57 = !DILocation(line: 116, column: 1, scope: !54)
!58 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 128, type: !59, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DILocalVariable(name: "argc", arg: 1, scope: !58, file: !16, line: 128, type: !7)
!65 = !DILocation(line: 128, column: 14, scope: !58)
!66 = !DILocalVariable(name: "argv", arg: 2, scope: !58, file: !16, line: 128, type: !61)
!67 = !DILocation(line: 128, column: 27, scope: !58)
!68 = !DILocation(line: 131, column: 22, scope: !58)
!69 = !DILocation(line: 131, column: 12, scope: !58)
!70 = !DILocation(line: 131, column: 5, scope: !58)
!71 = !DILocation(line: 133, column: 5, scope: !58)
!72 = !DILocation(line: 134, column: 5, scope: !58)
!73 = !DILocation(line: 135, column: 5, scope: !58)
!74 = !DILocation(line: 138, column: 5, scope: !58)
!75 = !DILocation(line: 139, column: 5, scope: !58)
!76 = !DILocation(line: 140, column: 5, scope: !58)
!77 = !DILocation(line: 142, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !79, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!7}
!81 = !DILocation(line: 27, column: 5, scope: !78)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 64, type: !17, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !16, line: 66, type: !4)
!84 = !DILocation(line: 66, column: 15, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !16, line: 67, type: !4)
!86 = !DILocation(line: 67, column: 15, scope: !82)
!87 = !DILocation(line: 67, column: 42, scope: !82)
!88 = !DILocation(line: 67, column: 31, scope: !82)
!89 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !16, line: 68, type: !4)
!90 = !DILocation(line: 68, column: 15, scope: !82)
!91 = !DILocation(line: 68, column: 43, scope: !82)
!92 = !DILocation(line: 68, column: 32, scope: !82)
!93 = !DILocation(line: 69, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !82, file: !16, line: 69, column: 8)
!95 = !DILocation(line: 69, column: 8, scope: !82)
!96 = !DILocation(line: 72, column: 9, scope: !97)
!97 = distinct !DILexicalBlock(scope: !94, file: !16, line: 70, column: 5)
!98 = !DILocation(line: 73, column: 5, scope: !97)
!99 = !DILocation(line: 77, column: 16, scope: !100)
!100 = distinct !DILexicalBlock(scope: !94, file: !16, line: 75, column: 5)
!101 = !DILocation(line: 77, column: 14, scope: !100)
!102 = !DILocation(line: 78, column: 9, scope: !100)
!103 = !DILocation(line: 78, column: 17, scope: !100)
!104 = !DILocalVariable(name: "source", scope: !105, file: !16, line: 81, type: !40)
!105 = distinct !DILexicalBlock(scope: !82, file: !16, line: 80, column: 5)
!106 = !DILocation(line: 81, column: 17, scope: !105)
!107 = !DILocation(line: 82, column: 17, scope: !105)
!108 = !DILocation(line: 82, column: 9, scope: !105)
!109 = !DILocation(line: 83, column: 9, scope: !105)
!110 = !DILocation(line: 83, column: 23, scope: !105)
!111 = !DILocation(line: 85, column: 16, scope: !105)
!112 = !DILocation(line: 85, column: 22, scope: !105)
!113 = !DILocation(line: 85, column: 9, scope: !105)
!114 = !DILocation(line: 86, column: 20, scope: !105)
!115 = !DILocation(line: 86, column: 9, scope: !105)
!116 = !DILocation(line: 88, column: 1, scope: !82)
!117 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !79, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!118 = !DILocation(line: 32, column: 5, scope: !117)
!119 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 91, type: !17, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!120 = !DILocalVariable(name: "data", scope: !119, file: !16, line: 93, type: !4)
!121 = !DILocation(line: 93, column: 15, scope: !119)
!122 = !DILocalVariable(name: "dataBadBuffer", scope: !119, file: !16, line: 94, type: !4)
!123 = !DILocation(line: 94, column: 15, scope: !119)
!124 = !DILocation(line: 94, column: 42, scope: !119)
!125 = !DILocation(line: 94, column: 31, scope: !119)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !119, file: !16, line: 95, type: !4)
!127 = !DILocation(line: 95, column: 15, scope: !119)
!128 = !DILocation(line: 95, column: 43, scope: !119)
!129 = !DILocation(line: 95, column: 32, scope: !119)
!130 = !DILocation(line: 96, column: 8, scope: !131)
!131 = distinct !DILexicalBlock(scope: !119, file: !16, line: 96, column: 8)
!132 = !DILocation(line: 96, column: 8, scope: !119)
!133 = !DILocation(line: 99, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !16, line: 97, column: 5)
!135 = !DILocation(line: 99, column: 14, scope: !134)
!136 = !DILocation(line: 100, column: 9, scope: !134)
!137 = !DILocation(line: 100, column: 17, scope: !134)
!138 = !DILocation(line: 101, column: 5, scope: !134)
!139 = !DILocalVariable(name: "source", scope: !140, file: !16, line: 103, type: !40)
!140 = distinct !DILexicalBlock(scope: !119, file: !16, line: 102, column: 5)
!141 = !DILocation(line: 103, column: 17, scope: !140)
!142 = !DILocation(line: 104, column: 17, scope: !140)
!143 = !DILocation(line: 104, column: 9, scope: !140)
!144 = !DILocation(line: 105, column: 9, scope: !140)
!145 = !DILocation(line: 105, column: 23, scope: !140)
!146 = !DILocation(line: 107, column: 16, scope: !140)
!147 = !DILocation(line: 107, column: 22, scope: !140)
!148 = !DILocation(line: 107, column: 9, scope: !140)
!149 = !DILocation(line: 108, column: 20, scope: !140)
!150 = !DILocation(line: 108, column: 9, scope: !140)
!151 = !DILocation(line: 110, column: 1, scope: !119)
