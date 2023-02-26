; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !13
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = alloca i8, i64 200, align 16, !dbg !31
  %1 = bitcast i8* %0 to i32*, !dbg !32
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = alloca i8, i64 400, align 16, !dbg !35
  %3 = bitcast i8* %2 to i32*, !dbg !36
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !34
  %4 = load i32, i32* @staticTrue, align 4, !dbg !37
  %tobool = icmp ne i32 %4, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %5, i32** %data, align 8, !dbg !42
  %6 = load i32*, i32** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !43
  store i32 0, i32* %arrayidx, align 4, !dbg !44
  br label %if.end, !dbg !45

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !46, metadata !DIExpression()), !dbg !51
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !52
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !53
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !54
  store i32 0, i32* %arrayidx1, align 4, !dbg !55
  %7 = load i32*, i32** %data, align 8, !dbg !56
  %8 = bitcast i32* %7 to i8*, !dbg !56
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !56
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !56
  %10 = load i32*, i32** %data, align 8, !dbg !56
  %11 = bitcast i32* %10 to i8*, !dbg !56
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !56
  %call3 = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #4, !dbg !56
  %13 = load i32*, i32** %data, align 8, !dbg !57
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !57
  store i32 0, i32* %arrayidx4, align 4, !dbg !58
  %14 = load i32*, i32** %data, align 8, !dbg !59
  call void @printWLine(i32* noundef %14), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05_good() #0 !dbg !62 {
entry:
  call void @goodG2B1(), !dbg !63
  call void @goodG2B2(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !66 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !72, metadata !DIExpression()), !dbg !73
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !74, metadata !DIExpression()), !dbg !75
  %call = call i64 @time(i64* noundef null), !dbg !76
  %conv = trunc i64 %call to i32, !dbg !77
  call void @srand(i32 noundef %conv), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05_good(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05_bad(), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  ret i32 0, !dbg !85
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !86 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !89, metadata !DIExpression()), !dbg !90
  %0 = alloca i8, i64 200, align 16, !dbg !91
  %1 = bitcast i8* %0 to i32*, !dbg !92
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !93, metadata !DIExpression()), !dbg !94
  %2 = alloca i8, i64 400, align 16, !dbg !95
  %3 = bitcast i8* %2 to i32*, !dbg !96
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !94
  %4 = load i32, i32* @staticFalse, align 4, !dbg !97
  %tobool = icmp ne i32 %4, 0, !dbg !97
  br i1 %tobool, label %if.then, label %if.else, !dbg !99

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !100
  br label %if.end, !dbg !102

if.else:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !103
  store i32* %5, i32** %data, align 8, !dbg !105
  %6 = load i32*, i32** %data, align 8, !dbg !106
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !106
  store i32 0, i32* %arrayidx, align 4, !dbg !107
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !111
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !112
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !113
  store i32 0, i32* %arrayidx1, align 4, !dbg !114
  %7 = load i32*, i32** %data, align 8, !dbg !115
  %8 = bitcast i32* %7 to i8*, !dbg !115
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !115
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !115
  %10 = load i32*, i32** %data, align 8, !dbg !115
  %11 = bitcast i32* %10 to i8*, !dbg !115
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !115
  %call3 = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #4, !dbg !115
  %13 = load i32*, i32** %data, align 8, !dbg !116
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !116
  store i32 0, i32* %arrayidx4, align 4, !dbg !117
  %14 = load i32*, i32** %data, align 8, !dbg !118
  call void @printWLine(i32* noundef %14), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  %0 = alloca i8, i64 200, align 16, !dbg !126
  %1 = bitcast i8* %0 to i32*, !dbg !127
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !125
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  %2 = alloca i8, i64 400, align 16, !dbg !130
  %3 = bitcast i8* %2 to i32*, !dbg !131
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !129
  %4 = load i32, i32* @staticTrue, align 4, !dbg !132
  %tobool = icmp ne i32 %4, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !135
  store i32* %5, i32** %data, align 8, !dbg !137
  %6 = load i32*, i32** %data, align 8, !dbg !138
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !138
  store i32 0, i32* %arrayidx, align 4, !dbg !139
  br label %if.end, !dbg !140

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !141, metadata !DIExpression()), !dbg !143
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !144
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !145
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx1, align 4, !dbg !147
  %7 = load i32*, i32** %data, align 8, !dbg !148
  %8 = bitcast i32* %7 to i8*, !dbg !148
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !148
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !148
  %10 = load i32*, i32** %data, align 8, !dbg !148
  %11 = bitcast i32* %10 to i8*, !dbg !148
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !148
  %call3 = call i8* @__memmove_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #4, !dbg !148
  %13 = load i32*, i32** %data, align 8, !dbg !149
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !149
  store i32 0, i32* %arrayidx4, align 4, !dbg !150
  %14 = load i32*, i32** %data, align 8, !dbg !151
  call void @printWLine(i32* noundef %14), !dbg !152
  ret void, !dbg !153
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !15, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0, !13}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !15, line: 26, type: !10, isLocal: true, isDefinition: true)
!15 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05_bad", scope: !15, file: !15, line: 30, type: !24, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !15, line: 32, type: !5)
!28 = !DILocation(line: 32, column: 15, scope: !23)
!29 = !DILocalVariable(name: "dataBadBuffer", scope: !23, file: !15, line: 33, type: !5)
!30 = !DILocation(line: 33, column: 15, scope: !23)
!31 = !DILocation(line: 33, column: 42, scope: !23)
!32 = !DILocation(line: 33, column: 31, scope: !23)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !23, file: !15, line: 34, type: !5)
!34 = !DILocation(line: 34, column: 15, scope: !23)
!35 = !DILocation(line: 34, column: 43, scope: !23)
!36 = !DILocation(line: 34, column: 32, scope: !23)
!37 = !DILocation(line: 35, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 8)
!39 = !DILocation(line: 35, column: 8, scope: !23)
!40 = !DILocation(line: 39, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !15, line: 36, column: 5)
!42 = !DILocation(line: 39, column: 14, scope: !41)
!43 = !DILocation(line: 40, column: 9, scope: !41)
!44 = !DILocation(line: 40, column: 17, scope: !41)
!45 = !DILocation(line: 41, column: 5, scope: !41)
!46 = !DILocalVariable(name: "source", scope: !47, file: !15, line: 43, type: !48)
!47 = distinct !DILexicalBlock(scope: !23, file: !15, line: 42, column: 5)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 100)
!51 = !DILocation(line: 43, column: 17, scope: !47)
!52 = !DILocation(line: 44, column: 17, scope: !47)
!53 = !DILocation(line: 44, column: 9, scope: !47)
!54 = !DILocation(line: 45, column: 9, scope: !47)
!55 = !DILocation(line: 45, column: 23, scope: !47)
!56 = !DILocation(line: 47, column: 9, scope: !47)
!57 = !DILocation(line: 48, column: 9, scope: !47)
!58 = !DILocation(line: 48, column: 21, scope: !47)
!59 = !DILocation(line: 49, column: 20, scope: !47)
!60 = !DILocation(line: 49, column: 9, scope: !47)
!61 = !DILocation(line: 51, column: 1, scope: !23)
!62 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memmove_05_good", scope: !15, file: !15, line: 108, type: !24, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!63 = !DILocation(line: 110, column: 5, scope: !62)
!64 = !DILocation(line: 111, column: 5, scope: !62)
!65 = !DILocation(line: 112, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 124, type: !67, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!67 = !DISubroutineType(types: !68)
!68 = !{!10, !10, !69}
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!72 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !15, line: 124, type: !10)
!73 = !DILocation(line: 124, column: 14, scope: !66)
!74 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !15, line: 124, type: !69)
!75 = !DILocation(line: 124, column: 27, scope: !66)
!76 = !DILocation(line: 127, column: 22, scope: !66)
!77 = !DILocation(line: 127, column: 12, scope: !66)
!78 = !DILocation(line: 127, column: 5, scope: !66)
!79 = !DILocation(line: 129, column: 5, scope: !66)
!80 = !DILocation(line: 130, column: 5, scope: !66)
!81 = !DILocation(line: 131, column: 5, scope: !66)
!82 = !DILocation(line: 134, column: 5, scope: !66)
!83 = !DILocation(line: 135, column: 5, scope: !66)
!84 = !DILocation(line: 136, column: 5, scope: !66)
!85 = !DILocation(line: 138, column: 5, scope: !66)
!86 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 58, type: !24, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 60, type: !5)
!88 = !DILocation(line: 60, column: 15, scope: !86)
!89 = !DILocalVariable(name: "dataBadBuffer", scope: !86, file: !15, line: 61, type: !5)
!90 = !DILocation(line: 61, column: 15, scope: !86)
!91 = !DILocation(line: 61, column: 42, scope: !86)
!92 = !DILocation(line: 61, column: 31, scope: !86)
!93 = !DILocalVariable(name: "dataGoodBuffer", scope: !86, file: !15, line: 62, type: !5)
!94 = !DILocation(line: 62, column: 15, scope: !86)
!95 = !DILocation(line: 62, column: 43, scope: !86)
!96 = !DILocation(line: 62, column: 32, scope: !86)
!97 = !DILocation(line: 63, column: 8, scope: !98)
!98 = distinct !DILexicalBlock(scope: !86, file: !15, line: 63, column: 8)
!99 = !DILocation(line: 63, column: 8, scope: !86)
!100 = !DILocation(line: 66, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !15, line: 64, column: 5)
!102 = !DILocation(line: 67, column: 5, scope: !101)
!103 = !DILocation(line: 71, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !98, file: !15, line: 69, column: 5)
!105 = !DILocation(line: 71, column: 14, scope: !104)
!106 = !DILocation(line: 72, column: 9, scope: !104)
!107 = !DILocation(line: 72, column: 17, scope: !104)
!108 = !DILocalVariable(name: "source", scope: !109, file: !15, line: 75, type: !48)
!109 = distinct !DILexicalBlock(scope: !86, file: !15, line: 74, column: 5)
!110 = !DILocation(line: 75, column: 17, scope: !109)
!111 = !DILocation(line: 76, column: 17, scope: !109)
!112 = !DILocation(line: 76, column: 9, scope: !109)
!113 = !DILocation(line: 77, column: 9, scope: !109)
!114 = !DILocation(line: 77, column: 23, scope: !109)
!115 = !DILocation(line: 79, column: 9, scope: !109)
!116 = !DILocation(line: 80, column: 9, scope: !109)
!117 = !DILocation(line: 80, column: 21, scope: !109)
!118 = !DILocation(line: 81, column: 20, scope: !109)
!119 = !DILocation(line: 81, column: 9, scope: !109)
!120 = !DILocation(line: 83, column: 1, scope: !86)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !24, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!122 = !DILocalVariable(name: "data", scope: !121, file: !15, line: 88, type: !5)
!123 = !DILocation(line: 88, column: 15, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !15, line: 89, type: !5)
!125 = !DILocation(line: 89, column: 15, scope: !121)
!126 = !DILocation(line: 89, column: 42, scope: !121)
!127 = !DILocation(line: 89, column: 31, scope: !121)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !15, line: 90, type: !5)
!129 = !DILocation(line: 90, column: 15, scope: !121)
!130 = !DILocation(line: 90, column: 43, scope: !121)
!131 = !DILocation(line: 90, column: 32, scope: !121)
!132 = !DILocation(line: 91, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !121, file: !15, line: 91, column: 8)
!134 = !DILocation(line: 91, column: 8, scope: !121)
!135 = !DILocation(line: 94, column: 16, scope: !136)
!136 = distinct !DILexicalBlock(scope: !133, file: !15, line: 92, column: 5)
!137 = !DILocation(line: 94, column: 14, scope: !136)
!138 = !DILocation(line: 95, column: 9, scope: !136)
!139 = !DILocation(line: 95, column: 17, scope: !136)
!140 = !DILocation(line: 96, column: 5, scope: !136)
!141 = !DILocalVariable(name: "source", scope: !142, file: !15, line: 98, type: !48)
!142 = distinct !DILexicalBlock(scope: !121, file: !15, line: 97, column: 5)
!143 = !DILocation(line: 98, column: 17, scope: !142)
!144 = !DILocation(line: 99, column: 17, scope: !142)
!145 = !DILocation(line: 99, column: 9, scope: !142)
!146 = !DILocation(line: 100, column: 9, scope: !142)
!147 = !DILocation(line: 100, column: 23, scope: !142)
!148 = !DILocation(line: 102, column: 9, scope: !142)
!149 = !DILocation(line: 103, column: 9, scope: !142)
!150 = !DILocation(line: 103, column: 21, scope: !142)
!151 = !DILocation(line: 104, column: 20, scope: !142)
!152 = !DILocation(line: 104, column: 9, scope: !142)
!153 = !DILocation(line: 106, column: 1, scope: !121)
