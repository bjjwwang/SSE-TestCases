; ModuleID = 'linux_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @badSource(i32* %3), !dbg !36
  store i32* %call, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %5) #5, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  call void @printWLine(i32* %6), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !50 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @badStatic, align 4, !dbg !55
  %tobool = icmp ne i32 %0, 0, !dbg !55
  br i1 %tobool, label %if.then, label %if.end, !dbg !57

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !58
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #5, !dbg !60
  %2 = load i32*, i32** %data.addr, align 8, !dbg !61
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !61
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  br label %if.end, !dbg !63

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !64
  ret i32* %3, !dbg !65
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32* @wcscat(i32*, i32*) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_good() #0 !dbg !66 {
entry:
  call void @goodG2B1(), !dbg !67
  call void @goodG2B2(), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !70 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !76, metadata !DIExpression()), !dbg !77
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !78, metadata !DIExpression()), !dbg !79
  %call = call i64 @time(i64* null) #5, !dbg !80
  %conv = trunc i64 %call to i32, !dbg !81
  call void @srand(i32 %conv) #5, !dbg !82
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !83
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_good(), !dbg !84
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_bad(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  ret i32 0, !dbg !89
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B1() #0 !dbg !90 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !91, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %0 = alloca i8, i64 400, align 16, !dbg !95
  %1 = bitcast i8* %0 to i32*, !dbg !96
  store i32* %1, i32** %dataBuffer, align 8, !dbg !94
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !97
  store i32* %2, i32** %data, align 8, !dbg !98
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !99
  %3 = load i32*, i32** %data, align 8, !dbg !100
  %call = call i32* @goodG2B1Source(i32* %3), !dbg !101
  store i32* %call, i32** %data, align 8, !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !103, metadata !DIExpression()), !dbg !105
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !105
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !105
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !106
  %5 = load i32*, i32** %data, align 8, !dbg !107
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %5) #5, !dbg !108
  %6 = load i32*, i32** %data, align 8, !dbg !109
  call void @printWLine(i32* %6), !dbg !110
  ret void, !dbg !111
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !112 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !115
  %tobool = icmp ne i32 %0, 0, !dbg !115
  br i1 %tobool, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !118
  br label %if.end, !dbg !120

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !121
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !123
  %2 = load i32*, i32** %data.addr, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !126
  ret i32* %3, !dbg !127
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = alloca i8, i64 400, align 16, !dbg !133
  %1 = bitcast i8* %0 to i32*, !dbg !134
  store i32* %1, i32** %dataBuffer, align 8, !dbg !132
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !135
  store i32* %2, i32** %data, align 8, !dbg !136
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !137
  %3 = load i32*, i32** %data, align 8, !dbg !138
  %call = call i32* @goodG2B2Source(i32* %3), !dbg !139
  store i32* %call, i32** %data, align 8, !dbg !140
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !141, metadata !DIExpression()), !dbg !143
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !143
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !143
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !144
  %5 = load i32*, i32** %data, align 8, !dbg !145
  %call1 = call i32* @wcscat(i32* %arraydecay, i32* %5) #5, !dbg !146
  %6 = load i32*, i32** %data, align 8, !dbg !147
  call void @printWLine(i32* %6), !dbg !148
  ret void, !dbg !149
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !150 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !151, metadata !DIExpression()), !dbg !152
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !153
  %tobool = icmp ne i32 %0, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !156
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #5, !dbg !158
  %2 = load i32*, i32** %data.addr, align 8, !dbg !159
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !159
  store i32 0, i32* %arrayidx, align 4, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !162
  ret i32* %3, !dbg !163
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !14, line: 24, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/SVF-tools")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !14, line: 57, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !14, line: 58, type: !9, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_bad", scope: !14, file: !14, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 39, type: !6)
!27 = !DILocation(line: 39, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 40, type: !6)
!29 = !DILocation(line: 40, column: 15, scope: !23)
!30 = !DILocation(line: 40, column: 39, scope: !23)
!31 = !DILocation(line: 40, column: 28, scope: !23)
!32 = !DILocation(line: 41, column: 12, scope: !23)
!33 = !DILocation(line: 41, column: 10, scope: !23)
!34 = !DILocation(line: 42, column: 15, scope: !23)
!35 = !DILocation(line: 43, column: 22, scope: !23)
!36 = !DILocation(line: 43, column: 12, scope: !23)
!37 = !DILocation(line: 43, column: 10, scope: !23)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !23, file: !14, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 45, column: 17, scope: !39)
!44 = !DILocation(line: 47, column: 16, scope: !39)
!45 = !DILocation(line: 47, column: 22, scope: !39)
!46 = !DILocation(line: 47, column: 9, scope: !39)
!47 = !DILocation(line: 48, column: 20, scope: !39)
!48 = !DILocation(line: 48, column: 9, scope: !39)
!49 = !DILocation(line: 50, column: 1, scope: !23)
!50 = distinct !DISubprogram(name: "badSource", scope: !14, file: !14, line: 26, type: !51, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!51 = !DISubroutineType(types: !52)
!52 = !{!6, !6}
!53 = !DILocalVariable(name: "data", arg: 1, scope: !50, file: !14, line: 26, type: !6)
!54 = !DILocation(line: 26, column: 38, scope: !50)
!55 = !DILocation(line: 28, column: 8, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !14, line: 28, column: 8)
!57 = !DILocation(line: 28, column: 8, scope: !50)
!58 = !DILocation(line: 31, column: 17, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !14, line: 29, column: 5)
!60 = !DILocation(line: 31, column: 9, scope: !59)
!61 = !DILocation(line: 32, column: 9, scope: !59)
!62 = !DILocation(line: 32, column: 21, scope: !59)
!63 = !DILocation(line: 33, column: 5, scope: !59)
!64 = !DILocation(line: 34, column: 12, scope: !50)
!65 = !DILocation(line: 34, column: 5, scope: !50)
!66 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__src_wchar_t_alloca_cat_21_good", scope: !14, file: !14, line: 119, type: !24, scopeLine: 120, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!67 = !DILocation(line: 121, column: 5, scope: !66)
!68 = !DILocation(line: 122, column: 5, scope: !66)
!69 = !DILocation(line: 123, column: 1, scope: !66)
!70 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 135, type: !71, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DISubroutineType(types: !72)
!72 = !{!9, !9, !73}
!73 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!76 = !DILocalVariable(name: "argc", arg: 1, scope: !70, file: !14, line: 135, type: !9)
!77 = !DILocation(line: 135, column: 14, scope: !70)
!78 = !DILocalVariable(name: "argv", arg: 2, scope: !70, file: !14, line: 135, type: !73)
!79 = !DILocation(line: 135, column: 27, scope: !70)
!80 = !DILocation(line: 138, column: 22, scope: !70)
!81 = !DILocation(line: 138, column: 12, scope: !70)
!82 = !DILocation(line: 138, column: 5, scope: !70)
!83 = !DILocation(line: 140, column: 5, scope: !70)
!84 = !DILocation(line: 141, column: 5, scope: !70)
!85 = !DILocation(line: 142, column: 5, scope: !70)
!86 = !DILocation(line: 145, column: 5, scope: !70)
!87 = !DILocation(line: 146, column: 5, scope: !70)
!88 = !DILocation(line: 147, column: 5, scope: !70)
!89 = !DILocation(line: 149, column: 5, scope: !70)
!90 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 77, type: !24, scopeLine: 78, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!91 = !DILocalVariable(name: "data", scope: !90, file: !14, line: 79, type: !6)
!92 = !DILocation(line: 79, column: 15, scope: !90)
!93 = !DILocalVariable(name: "dataBuffer", scope: !90, file: !14, line: 80, type: !6)
!94 = !DILocation(line: 80, column: 15, scope: !90)
!95 = !DILocation(line: 80, column: 39, scope: !90)
!96 = !DILocation(line: 80, column: 28, scope: !90)
!97 = !DILocation(line: 81, column: 12, scope: !90)
!98 = !DILocation(line: 81, column: 10, scope: !90)
!99 = !DILocation(line: 82, column: 20, scope: !90)
!100 = !DILocation(line: 83, column: 27, scope: !90)
!101 = !DILocation(line: 83, column: 12, scope: !90)
!102 = !DILocation(line: 83, column: 10, scope: !90)
!103 = !DILocalVariable(name: "dest", scope: !104, file: !14, line: 85, type: !40)
!104 = distinct !DILexicalBlock(scope: !90, file: !14, line: 84, column: 5)
!105 = !DILocation(line: 85, column: 17, scope: !104)
!106 = !DILocation(line: 87, column: 16, scope: !104)
!107 = !DILocation(line: 87, column: 22, scope: !104)
!108 = !DILocation(line: 87, column: 9, scope: !104)
!109 = !DILocation(line: 88, column: 20, scope: !104)
!110 = !DILocation(line: 88, column: 9, scope: !104)
!111 = !DILocation(line: 90, column: 1, scope: !90)
!112 = distinct !DISubprogram(name: "goodG2B1Source", scope: !14, file: !14, line: 61, type: !51, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!113 = !DILocalVariable(name: "data", arg: 1, scope: !112, file: !14, line: 61, type: !6)
!114 = !DILocation(line: 61, column: 43, scope: !112)
!115 = !DILocation(line: 63, column: 8, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !14, line: 63, column: 8)
!117 = !DILocation(line: 63, column: 8, scope: !112)
!118 = !DILocation(line: 66, column: 9, scope: !119)
!119 = distinct !DILexicalBlock(scope: !116, file: !14, line: 64, column: 5)
!120 = !DILocation(line: 67, column: 5, scope: !119)
!121 = !DILocation(line: 71, column: 17, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !14, line: 69, column: 5)
!123 = !DILocation(line: 71, column: 9, scope: !122)
!124 = !DILocation(line: 72, column: 9, scope: !122)
!125 = !DILocation(line: 72, column: 20, scope: !122)
!126 = !DILocation(line: 74, column: 12, scope: !112)
!127 = !DILocation(line: 74, column: 5, scope: !112)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 104, type: !24, scopeLine: 105, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!129 = !DILocalVariable(name: "data", scope: !128, file: !14, line: 106, type: !6)
!130 = !DILocation(line: 106, column: 15, scope: !128)
!131 = !DILocalVariable(name: "dataBuffer", scope: !128, file: !14, line: 107, type: !6)
!132 = !DILocation(line: 107, column: 15, scope: !128)
!133 = !DILocation(line: 107, column: 39, scope: !128)
!134 = !DILocation(line: 107, column: 28, scope: !128)
!135 = !DILocation(line: 108, column: 12, scope: !128)
!136 = !DILocation(line: 108, column: 10, scope: !128)
!137 = !DILocation(line: 109, column: 20, scope: !128)
!138 = !DILocation(line: 110, column: 27, scope: !128)
!139 = !DILocation(line: 110, column: 12, scope: !128)
!140 = !DILocation(line: 110, column: 10, scope: !128)
!141 = !DILocalVariable(name: "dest", scope: !142, file: !14, line: 112, type: !40)
!142 = distinct !DILexicalBlock(scope: !128, file: !14, line: 111, column: 5)
!143 = !DILocation(line: 112, column: 17, scope: !142)
!144 = !DILocation(line: 114, column: 16, scope: !142)
!145 = !DILocation(line: 114, column: 22, scope: !142)
!146 = !DILocation(line: 114, column: 9, scope: !142)
!147 = !DILocation(line: 115, column: 20, scope: !142)
!148 = !DILocation(line: 115, column: 9, scope: !142)
!149 = !DILocation(line: 117, column: 1, scope: !128)
!150 = distinct !DISubprogram(name: "goodG2B2Source", scope: !14, file: !14, line: 93, type: !51, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "data", arg: 1, scope: !150, file: !14, line: 93, type: !6)
!152 = !DILocation(line: 93, column: 43, scope: !150)
!153 = !DILocation(line: 95, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !14, line: 95, column: 8)
!155 = !DILocation(line: 95, column: 8, scope: !150)
!156 = !DILocation(line: 98, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !14, line: 96, column: 5)
!158 = !DILocation(line: 98, column: 9, scope: !157)
!159 = !DILocation(line: 99, column: 9, scope: !157)
!160 = !DILocation(line: 99, column: 20, scope: !157)
!161 = !DILocation(line: 100, column: 5, scope: !157)
!162 = !DILocation(line: 101, column: 12, scope: !150)
!163 = !DILocation(line: 101, column: 5, scope: !150)
