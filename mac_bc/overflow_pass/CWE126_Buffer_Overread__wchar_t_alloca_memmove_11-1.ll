; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_11_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = alloca i8, i64 200, align 16, !dbg !26
  %1 = bitcast i8* %0 to i32*, !dbg !27
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %2 = alloca i8, i64 400, align 16, !dbg !30
  %3 = bitcast i8* %2 to i32*, !dbg !31
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !29
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !32
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !33
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !34
  store i32 0, i32* %arrayidx, align 4, !dbg !35
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !37
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !38
  store i32 0, i32* %arrayidx2, align 4, !dbg !39
  %call3 = call i32 (...) @globalReturnsTrue(), !dbg !40
  %tobool = icmp ne i32 %call3, 0, !dbg !40
  br i1 %tobool, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !43
  store i32* %8, i32** %data, align 8, !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !47, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !54
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx5, align 4, !dbg !56
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %9 = bitcast i32* %arraydecay6 to i8*, !dbg !57
  %10 = load i32*, i32** %data, align 8, !dbg !57
  %11 = bitcast i32* %10 to i8*, !dbg !57
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !57
  %mul = mul i64 %call8, 4, !dbg !57
  %call9 = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !57
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx10, align 4, !dbg !59
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* noundef %arraydecay11), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_11_good() #0 !dbg !63 {
entry:
  call void @goodG2B1(), !dbg !64
  call void @goodG2B2(), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !67 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !75, metadata !DIExpression()), !dbg !76
  %call = call i64 @time(i64* noundef null), !dbg !77
  %conv = trunc i64 %call to i32, !dbg !78
  call void @srand(i32 noundef %conv), !dbg !79
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !80
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_11_good(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memmove_11_bad(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !87 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %0 = alloca i8, i64 200, align 16, !dbg !92
  %1 = bitcast i8* %0 to i32*, !dbg !93
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !91
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %2 = alloca i8, i64 400, align 16, !dbg !96
  %3 = bitcast i8* %2 to i32*, !dbg !97
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !95
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !98
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !99
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !100
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !102
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !103
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !104
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !104
  store i32 0, i32* %arrayidx2, align 4, !dbg !105
  %call3 = call i32 (...) @globalReturnsFalse(), !dbg !106
  %tobool = icmp ne i32 %call3, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !112
  store i32* %8, i32** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !115, metadata !DIExpression()), !dbg !117
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !118
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !119
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !120
  store i32 0, i32* %arrayidx5, align 4, !dbg !121
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %9 = bitcast i32* %arraydecay6 to i8*, !dbg !122
  %10 = load i32*, i32** %data, align 8, !dbg !122
  %11 = bitcast i32* %10 to i8*, !dbg !122
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !122
  %mul = mul i64 %call8, 4, !dbg !122
  %call9 = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !122
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx10, align 4, !dbg !124
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* noundef %arraydecay11), !dbg !126
  ret void, !dbg !127
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !128 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = alloca i8, i64 200, align 16, !dbg !133
  %1 = bitcast i8* %0 to i32*, !dbg !134
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !132
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %2 = alloca i8, i64 400, align 16, !dbg !137
  %3 = bitcast i8* %2 to i32*, !dbg !138
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !136
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !139
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !140
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !141
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !141
  store i32 0, i32* %arrayidx, align 4, !dbg !142
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !143
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !144
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !145
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !145
  store i32 0, i32* %arrayidx2, align 4, !dbg !146
  %call3 = call i32 (...) @globalReturnsTrue(), !dbg !147
  %tobool = icmp ne i32 %call3, 0, !dbg !147
  br i1 %tobool, label %if.then, label %if.end, !dbg !149

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !150
  store i32* %8, i32** %data, align 8, !dbg !152
  br label %if.end, !dbg !153

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !154, metadata !DIExpression()), !dbg !156
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !157
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !158
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !159
  store i32 0, i32* %arrayidx5, align 4, !dbg !160
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  %9 = bitcast i32* %arraydecay6 to i8*, !dbg !161
  %10 = load i32*, i32** %data, align 8, !dbg !161
  %11 = bitcast i32* %10 to i8*, !dbg !161
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !161
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !161
  %mul = mul i64 %call8, 4, !dbg !161
  %call9 = call i8* @__memmove_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !161
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !162
  store i32 0, i32* %arrayidx10, align 4, !dbg !163
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  call void @printWLine(i32* noundef %arraydecay11), !dbg !165
  ret void, !dbg !166
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !9}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !5, line: 34, baseType: !6)
!5 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !7, line: 106, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_11_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memmove_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 25, type: !3)
!23 = !DILocation(line: 25, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocation(line: 26, column: 42, scope: !17)
!27 = !DILocation(line: 26, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 27, type: !3)
!29 = !DILocation(line: 27, column: 15, scope: !17)
!30 = !DILocation(line: 27, column: 43, scope: !17)
!31 = !DILocation(line: 27, column: 32, scope: !17)
!32 = !DILocation(line: 28, column: 13, scope: !17)
!33 = !DILocation(line: 28, column: 5, scope: !17)
!34 = !DILocation(line: 29, column: 5, scope: !17)
!35 = !DILocation(line: 29, column: 25, scope: !17)
!36 = !DILocation(line: 30, column: 13, scope: !17)
!37 = !DILocation(line: 30, column: 5, scope: !17)
!38 = !DILocation(line: 31, column: 5, scope: !17)
!39 = !DILocation(line: 31, column: 27, scope: !17)
!40 = !DILocation(line: 32, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !17, file: !18, line: 32, column: 8)
!42 = !DILocation(line: 32, column: 8, scope: !17)
!43 = !DILocation(line: 35, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !18, line: 33, column: 5)
!45 = !DILocation(line: 35, column: 14, scope: !44)
!46 = !DILocation(line: 36, column: 5, scope: !44)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !18, line: 38, type: !49)
!48 = distinct !DILexicalBlock(scope: !17, file: !18, line: 37, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 38, column: 17, scope: !48)
!53 = !DILocation(line: 39, column: 17, scope: !48)
!54 = !DILocation(line: 39, column: 9, scope: !48)
!55 = !DILocation(line: 40, column: 9, scope: !48)
!56 = !DILocation(line: 40, column: 21, scope: !48)
!57 = !DILocation(line: 43, column: 9, scope: !48)
!58 = !DILocation(line: 44, column: 9, scope: !48)
!59 = !DILocation(line: 44, column: 21, scope: !48)
!60 = !DILocation(line: 45, column: 20, scope: !48)
!61 = !DILocation(line: 45, column: 9, scope: !48)
!62 = !DILocation(line: 47, column: 1, scope: !17)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memmove_11_good", scope: !18, file: !18, line: 112, type: !19, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!64 = !DILocation(line: 114, column: 5, scope: !63)
!65 = !DILocation(line: 115, column: 5, scope: !63)
!66 = !DILocation(line: 116, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 128, type: !68, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DISubroutineType(types: !69)
!69 = !{!8, !8, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !18, line: 128, type: !8)
!74 = !DILocation(line: 128, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !18, line: 128, type: !70)
!76 = !DILocation(line: 128, column: 27, scope: !67)
!77 = !DILocation(line: 131, column: 22, scope: !67)
!78 = !DILocation(line: 131, column: 12, scope: !67)
!79 = !DILocation(line: 131, column: 5, scope: !67)
!80 = !DILocation(line: 133, column: 5, scope: !67)
!81 = !DILocation(line: 134, column: 5, scope: !67)
!82 = !DILocation(line: 135, column: 5, scope: !67)
!83 = !DILocation(line: 138, column: 5, scope: !67)
!84 = !DILocation(line: 139, column: 5, scope: !67)
!85 = !DILocation(line: 140, column: 5, scope: !67)
!86 = !DILocation(line: 142, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!88 = !DILocalVariable(name: "data", scope: !87, file: !18, line: 56, type: !3)
!89 = !DILocation(line: 56, column: 15, scope: !87)
!90 = !DILocalVariable(name: "dataBadBuffer", scope: !87, file: !18, line: 57, type: !3)
!91 = !DILocation(line: 57, column: 15, scope: !87)
!92 = !DILocation(line: 57, column: 42, scope: !87)
!93 = !DILocation(line: 57, column: 31, scope: !87)
!94 = !DILocalVariable(name: "dataGoodBuffer", scope: !87, file: !18, line: 58, type: !3)
!95 = !DILocation(line: 58, column: 15, scope: !87)
!96 = !DILocation(line: 58, column: 43, scope: !87)
!97 = !DILocation(line: 58, column: 32, scope: !87)
!98 = !DILocation(line: 59, column: 13, scope: !87)
!99 = !DILocation(line: 59, column: 5, scope: !87)
!100 = !DILocation(line: 60, column: 5, scope: !87)
!101 = !DILocation(line: 60, column: 25, scope: !87)
!102 = !DILocation(line: 61, column: 13, scope: !87)
!103 = !DILocation(line: 61, column: 5, scope: !87)
!104 = !DILocation(line: 62, column: 5, scope: !87)
!105 = !DILocation(line: 62, column: 27, scope: !87)
!106 = !DILocation(line: 63, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !87, file: !18, line: 63, column: 8)
!108 = !DILocation(line: 63, column: 8, scope: !87)
!109 = !DILocation(line: 66, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !18, line: 64, column: 5)
!111 = !DILocation(line: 67, column: 5, scope: !110)
!112 = !DILocation(line: 71, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !18, line: 69, column: 5)
!114 = !DILocation(line: 71, column: 14, scope: !113)
!115 = !DILocalVariable(name: "dest", scope: !116, file: !18, line: 74, type: !49)
!116 = distinct !DILexicalBlock(scope: !87, file: !18, line: 73, column: 5)
!117 = !DILocation(line: 74, column: 17, scope: !116)
!118 = !DILocation(line: 75, column: 17, scope: !116)
!119 = !DILocation(line: 75, column: 9, scope: !116)
!120 = !DILocation(line: 76, column: 9, scope: !116)
!121 = !DILocation(line: 76, column: 21, scope: !116)
!122 = !DILocation(line: 79, column: 9, scope: !116)
!123 = !DILocation(line: 80, column: 9, scope: !116)
!124 = !DILocation(line: 80, column: 21, scope: !116)
!125 = !DILocation(line: 81, column: 20, scope: !116)
!126 = !DILocation(line: 81, column: 9, scope: !116)
!127 = !DILocation(line: 83, column: 1, scope: !87)
!128 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!129 = !DILocalVariable(name: "data", scope: !128, file: !18, line: 88, type: !3)
!130 = !DILocation(line: 88, column: 15, scope: !128)
!131 = !DILocalVariable(name: "dataBadBuffer", scope: !128, file: !18, line: 89, type: !3)
!132 = !DILocation(line: 89, column: 15, scope: !128)
!133 = !DILocation(line: 89, column: 42, scope: !128)
!134 = !DILocation(line: 89, column: 31, scope: !128)
!135 = !DILocalVariable(name: "dataGoodBuffer", scope: !128, file: !18, line: 90, type: !3)
!136 = !DILocation(line: 90, column: 15, scope: !128)
!137 = !DILocation(line: 90, column: 43, scope: !128)
!138 = !DILocation(line: 90, column: 32, scope: !128)
!139 = !DILocation(line: 91, column: 13, scope: !128)
!140 = !DILocation(line: 91, column: 5, scope: !128)
!141 = !DILocation(line: 92, column: 5, scope: !128)
!142 = !DILocation(line: 92, column: 25, scope: !128)
!143 = !DILocation(line: 93, column: 13, scope: !128)
!144 = !DILocation(line: 93, column: 5, scope: !128)
!145 = !DILocation(line: 94, column: 5, scope: !128)
!146 = !DILocation(line: 94, column: 27, scope: !128)
!147 = !DILocation(line: 95, column: 8, scope: !148)
!148 = distinct !DILexicalBlock(scope: !128, file: !18, line: 95, column: 8)
!149 = !DILocation(line: 95, column: 8, scope: !128)
!150 = !DILocation(line: 98, column: 16, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !18, line: 96, column: 5)
!152 = !DILocation(line: 98, column: 14, scope: !151)
!153 = !DILocation(line: 99, column: 5, scope: !151)
!154 = !DILocalVariable(name: "dest", scope: !155, file: !18, line: 101, type: !49)
!155 = distinct !DILexicalBlock(scope: !128, file: !18, line: 100, column: 5)
!156 = !DILocation(line: 101, column: 17, scope: !155)
!157 = !DILocation(line: 102, column: 17, scope: !155)
!158 = !DILocation(line: 102, column: 9, scope: !155)
!159 = !DILocation(line: 103, column: 9, scope: !155)
!160 = !DILocation(line: 103, column: 21, scope: !155)
!161 = !DILocation(line: 106, column: 9, scope: !155)
!162 = !DILocation(line: 107, column: 9, scope: !155)
!163 = !DILocation(line: 107, column: 21, scope: !155)
!164 = !DILocation(line: 108, column: 20, scope: !155)
!165 = !DILocation(line: 108, column: 9, scope: !155)
!166 = !DILocation(line: 110, column: 1, scope: !128)
