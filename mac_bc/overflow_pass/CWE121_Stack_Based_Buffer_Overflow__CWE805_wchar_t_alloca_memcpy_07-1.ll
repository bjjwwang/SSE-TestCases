; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 200, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 400, align 16, !dbg !33
  %3 = bitcast i8* %2 to i32*, !dbg !34
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !32
  %4 = load i32, i32* @staticFive, align 4, !dbg !35
  %cmp = icmp eq i32 %4, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !39
  store i32* %5, i32** %data, align 8, !dbg !41
  %6 = load i32*, i32** %data, align 8, !dbg !42
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !42
  store i32 0, i32* %arrayidx, align 4, !dbg !43
  br label %if.end, !dbg !44

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !45, metadata !DIExpression()), !dbg !50
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !51
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !52
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !53
  store i32 0, i32* %arrayidx1, align 4, !dbg !54
  %7 = load i32*, i32** %data, align 8, !dbg !55
  %8 = bitcast i32* %7 to i8*, !dbg !55
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !55
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !55
  %10 = load i32*, i32** %data, align 8, !dbg !55
  %11 = bitcast i32* %10 to i8*, !dbg !55
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !55
  %call3 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #4, !dbg !55
  %13 = load i32*, i32** %data, align 8, !dbg !56
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %14 = load i32*, i32** %data, align 8, !dbg !58
  call void @printWLine(i32* noundef %14), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_good() #0 !dbg !61 {
entry:
  call void @goodG2B1(), !dbg !62
  call void @goodG2B2(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* noundef null), !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 noundef %conv), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !78
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_good(), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_bad(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %0 = alloca i8, i64 200, align 16, !dbg !90
  %1 = bitcast i8* %0 to i32*, !dbg !91
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !92, metadata !DIExpression()), !dbg !93
  %2 = alloca i8, i64 400, align 16, !dbg !94
  %3 = bitcast i8* %2 to i32*, !dbg !95
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !93
  %4 = load i32, i32* @staticFive, align 4, !dbg !96
  %cmp = icmp ne i32 %4, 5, !dbg !98
  br i1 %cmp, label %if.then, label %if.else, !dbg !99

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
  %call3 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #4, !dbg !115
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
  %4 = load i32, i32* @staticFive, align 4, !dbg !132
  %cmp = icmp eq i32 %4, 5, !dbg !134
  br i1 %cmp, label %if.then, label %if.end, !dbg !135

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !136
  store i32* %5, i32** %data, align 8, !dbg !138
  %6 = load i32*, i32** %data, align 8, !dbg !139
  %arrayidx = getelementptr inbounds i32, i32* %6, i64 0, !dbg !139
  store i32 0, i32* %arrayidx, align 4, !dbg !140
  br label %if.end, !dbg !141

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !142, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !145
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !146
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx1, align 4, !dbg !148
  %7 = load i32*, i32** %data, align 8, !dbg !149
  %8 = bitcast i32* %7 to i8*, !dbg !149
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !149
  %9 = bitcast i32* %arraydecay2 to i8*, !dbg !149
  %10 = load i32*, i32** %data, align 8, !dbg !149
  %11 = bitcast i32* %10 to i8*, !dbg !149
  %12 = call i64 @llvm.objectsize.i64.p0i8(i8* %11, i1 false, i1 true, i1 false), !dbg !149
  %call3 = call i8* @__memcpy_chk(i8* noundef %8, i8* noundef %9, i64 noundef 400, i64 noundef %12) #4, !dbg !149
  %13 = load i32*, i32** %data, align 8, !dbg !150
  %arrayidx4 = getelementptr inbounds i32, i32* %13, i64 99, !dbg !150
  store i32 0, i32* %arrayidx4, align 4, !dbg !151
  %14 = load i32*, i32** %data, align 8, !dbg !152
  call void @printWLine(i32* noundef %14), !dbg !153
  ret void, !dbg !154
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !13, line: 25, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !12, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Homebrew clang version 14.0.6"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_bad", scope: !13, file: !13, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !13, line: 31, type: !5)
!26 = !DILocation(line: 31, column: 15, scope: !21)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !13, line: 32, type: !5)
!28 = !DILocation(line: 32, column: 15, scope: !21)
!29 = !DILocation(line: 32, column: 42, scope: !21)
!30 = !DILocation(line: 32, column: 31, scope: !21)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !13, line: 33, type: !5)
!32 = !DILocation(line: 33, column: 15, scope: !21)
!33 = !DILocation(line: 33, column: 43, scope: !21)
!34 = !DILocation(line: 33, column: 32, scope: !21)
!35 = !DILocation(line: 34, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !21, file: !13, line: 34, column: 8)
!37 = !DILocation(line: 34, column: 18, scope: !36)
!38 = !DILocation(line: 34, column: 8, scope: !21)
!39 = !DILocation(line: 38, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !13, line: 35, column: 5)
!41 = !DILocation(line: 38, column: 14, scope: !40)
!42 = !DILocation(line: 39, column: 9, scope: !40)
!43 = !DILocation(line: 39, column: 17, scope: !40)
!44 = !DILocation(line: 40, column: 5, scope: !40)
!45 = !DILocalVariable(name: "source", scope: !46, file: !13, line: 42, type: !47)
!46 = distinct !DILexicalBlock(scope: !21, file: !13, line: 41, column: 5)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 100)
!50 = !DILocation(line: 42, column: 17, scope: !46)
!51 = !DILocation(line: 43, column: 17, scope: !46)
!52 = !DILocation(line: 43, column: 9, scope: !46)
!53 = !DILocation(line: 44, column: 9, scope: !46)
!54 = !DILocation(line: 44, column: 23, scope: !46)
!55 = !DILocation(line: 46, column: 9, scope: !46)
!56 = !DILocation(line: 47, column: 9, scope: !46)
!57 = !DILocation(line: 47, column: 21, scope: !46)
!58 = !DILocation(line: 48, column: 20, scope: !46)
!59 = !DILocation(line: 48, column: 9, scope: !46)
!60 = !DILocation(line: 50, column: 1, scope: !21)
!61 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_wchar_t_alloca_memcpy_07_good", scope: !13, file: !13, line: 107, type: !22, scopeLine: 108, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!62 = !DILocation(line: 109, column: 5, scope: !61)
!63 = !DILocation(line: 110, column: 5, scope: !61)
!64 = !DILocation(line: 111, column: 1, scope: !61)
!65 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 123, type: !66, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!66 = !DISubroutineType(types: !67)
!67 = !{!10, !10, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !13, line: 123, type: !10)
!72 = !DILocation(line: 123, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !13, line: 123, type: !68)
!74 = !DILocation(line: 123, column: 27, scope: !65)
!75 = !DILocation(line: 126, column: 22, scope: !65)
!76 = !DILocation(line: 126, column: 12, scope: !65)
!77 = !DILocation(line: 126, column: 5, scope: !65)
!78 = !DILocation(line: 128, column: 5, scope: !65)
!79 = !DILocation(line: 129, column: 5, scope: !65)
!80 = !DILocation(line: 130, column: 5, scope: !65)
!81 = !DILocation(line: 133, column: 5, scope: !65)
!82 = !DILocation(line: 134, column: 5, scope: !65)
!83 = !DILocation(line: 135, column: 5, scope: !65)
!84 = !DILocation(line: 137, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 57, type: !22, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!86 = !DILocalVariable(name: "data", scope: !85, file: !13, line: 59, type: !5)
!87 = !DILocation(line: 59, column: 15, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !13, line: 60, type: !5)
!89 = !DILocation(line: 60, column: 15, scope: !85)
!90 = !DILocation(line: 60, column: 42, scope: !85)
!91 = !DILocation(line: 60, column: 31, scope: !85)
!92 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !13, line: 61, type: !5)
!93 = !DILocation(line: 61, column: 15, scope: !85)
!94 = !DILocation(line: 61, column: 43, scope: !85)
!95 = !DILocation(line: 61, column: 32, scope: !85)
!96 = !DILocation(line: 62, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !85, file: !13, line: 62, column: 8)
!98 = !DILocation(line: 62, column: 18, scope: !97)
!99 = !DILocation(line: 62, column: 8, scope: !85)
!100 = !DILocation(line: 65, column: 9, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !13, line: 63, column: 5)
!102 = !DILocation(line: 66, column: 5, scope: !101)
!103 = !DILocation(line: 70, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !13, line: 68, column: 5)
!105 = !DILocation(line: 70, column: 14, scope: !104)
!106 = !DILocation(line: 71, column: 9, scope: !104)
!107 = !DILocation(line: 71, column: 17, scope: !104)
!108 = !DILocalVariable(name: "source", scope: !109, file: !13, line: 74, type: !47)
!109 = distinct !DILexicalBlock(scope: !85, file: !13, line: 73, column: 5)
!110 = !DILocation(line: 74, column: 17, scope: !109)
!111 = !DILocation(line: 75, column: 17, scope: !109)
!112 = !DILocation(line: 75, column: 9, scope: !109)
!113 = !DILocation(line: 76, column: 9, scope: !109)
!114 = !DILocation(line: 76, column: 23, scope: !109)
!115 = !DILocation(line: 78, column: 9, scope: !109)
!116 = !DILocation(line: 79, column: 9, scope: !109)
!117 = !DILocation(line: 79, column: 21, scope: !109)
!118 = !DILocation(line: 80, column: 20, scope: !109)
!119 = !DILocation(line: 80, column: 9, scope: !109)
!120 = !DILocation(line: 82, column: 1, scope: !85)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 85, type: !22, scopeLine: 86, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!122 = !DILocalVariable(name: "data", scope: !121, file: !13, line: 87, type: !5)
!123 = !DILocation(line: 87, column: 15, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !13, line: 88, type: !5)
!125 = !DILocation(line: 88, column: 15, scope: !121)
!126 = !DILocation(line: 88, column: 42, scope: !121)
!127 = !DILocation(line: 88, column: 31, scope: !121)
!128 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !13, line: 89, type: !5)
!129 = !DILocation(line: 89, column: 15, scope: !121)
!130 = !DILocation(line: 89, column: 43, scope: !121)
!131 = !DILocation(line: 89, column: 32, scope: !121)
!132 = !DILocation(line: 90, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !121, file: !13, line: 90, column: 8)
!134 = !DILocation(line: 90, column: 18, scope: !133)
!135 = !DILocation(line: 90, column: 8, scope: !121)
!136 = !DILocation(line: 93, column: 16, scope: !137)
!137 = distinct !DILexicalBlock(scope: !133, file: !13, line: 91, column: 5)
!138 = !DILocation(line: 93, column: 14, scope: !137)
!139 = !DILocation(line: 94, column: 9, scope: !137)
!140 = !DILocation(line: 94, column: 17, scope: !137)
!141 = !DILocation(line: 95, column: 5, scope: !137)
!142 = !DILocalVariable(name: "source", scope: !143, file: !13, line: 97, type: !47)
!143 = distinct !DILexicalBlock(scope: !121, file: !13, line: 96, column: 5)
!144 = !DILocation(line: 97, column: 17, scope: !143)
!145 = !DILocation(line: 98, column: 17, scope: !143)
!146 = !DILocation(line: 98, column: 9, scope: !143)
!147 = !DILocation(line: 99, column: 9, scope: !143)
!148 = !DILocation(line: 99, column: 23, scope: !143)
!149 = !DILocation(line: 101, column: 9, scope: !143)
!150 = !DILocation(line: 102, column: 9, scope: !143)
!151 = !DILocation(line: 102, column: 21, scope: !143)
!152 = !DILocation(line: 103, column: 20, scope: !143)
!153 = !DILocation(line: 103, column: 9, scope: !143)
!154 = !DILocation(line: 105, column: 1, scope: !121)
