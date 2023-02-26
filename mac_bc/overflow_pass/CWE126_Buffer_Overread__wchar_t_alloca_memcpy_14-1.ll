; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@globalFive = external global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14_bad() #0 !dbg !17 {
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
  %8 = load i32, i32* @globalFive, align 4, !dbg !40
  %cmp = icmp eq i32 %8, 5, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !44
  store i32* %9, i32** %data, align 8, !dbg !46
  br label %if.end, !dbg !47

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !48, metadata !DIExpression()), !dbg !53
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !55
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !56
  store i32 0, i32* %arrayidx4, align 4, !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !58
  %11 = load i32*, i32** %data, align 8, !dbg !58
  %12 = bitcast i32* %11 to i8*, !dbg !58
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !58
  %mul = mul i64 %call7, 4, !dbg !58
  %call8 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %12, i64 noundef %mul, i64 noundef 400) #4, !dbg !58
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx9, align 4, !dbg !60
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* noundef %arraydecay10), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* noundef null), !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 noundef %conv), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14_good(), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14_bad(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !88 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !89, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !91, metadata !DIExpression()), !dbg !92
  %0 = alloca i8, i64 200, align 16, !dbg !93
  %1 = bitcast i8* %0 to i32*, !dbg !94
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !92
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %2 = alloca i8, i64 400, align 16, !dbg !97
  %3 = bitcast i8* %2 to i32*, !dbg !98
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !96
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !99
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !100
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !101
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !101
  store i32 0, i32* %arrayidx, align 4, !dbg !102
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !103
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !104
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !105
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !105
  store i32 0, i32* %arrayidx2, align 4, !dbg !106
  %8 = load i32, i32* @globalFive, align 4, !dbg !107
  %cmp = icmp ne i32 %8, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  store i32* %9, i32** %data, align 8, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !117, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !120
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !121
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx4, align 4, !dbg !123
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !124
  %11 = load i32*, i32** %data, align 8, !dbg !124
  %12 = bitcast i32* %11 to i8*, !dbg !124
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !124
  %mul = mul i64 %call7, 4, !dbg !124
  %call8 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %12, i64 noundef %mul, i64 noundef 400) #4, !dbg !124
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx9, align 4, !dbg !126
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* noundef %arraydecay10), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !130 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !131, metadata !DIExpression()), !dbg !132
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !133, metadata !DIExpression()), !dbg !134
  %0 = alloca i8, i64 200, align 16, !dbg !135
  %1 = bitcast i8* %0 to i32*, !dbg !136
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !134
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  %2 = alloca i8, i64 400, align 16, !dbg !139
  %3 = bitcast i8* %2 to i32*, !dbg !140
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !138
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !141
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !142
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !144
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !145
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !146
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !147
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !147
  store i32 0, i32* %arrayidx2, align 4, !dbg !148
  %8 = load i32, i32* @globalFive, align 4, !dbg !149
  %cmp = icmp eq i32 %8, 5, !dbg !151
  br i1 %cmp, label %if.then, label %if.end, !dbg !152

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !153
  store i32* %9, i32** %data, align 8, !dbg !155
  br label %if.end, !dbg !156

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !157, metadata !DIExpression()), !dbg !159
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !160
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !161
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !162
  store i32 0, i32* %arrayidx4, align 4, !dbg !163
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !164
  %11 = load i32*, i32** %data, align 8, !dbg !164
  %12 = bitcast i32* %11 to i8*, !dbg !164
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !164
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !164
  %mul = mul i64 %call7, 4, !dbg !164
  %call8 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %12, i64 noundef %mul, i64 noundef 400) #4, !dbg !164
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx9, align 4, !dbg !166
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  call void @printWLine(i32* noundef %arraydecay10), !dbg !168
  ret void, !dbg !169
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!42 = !DILocation(line: 32, column: 18, scope: !41)
!43 = !DILocation(line: 32, column: 8, scope: !17)
!44 = !DILocation(line: 35, column: 16, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !18, line: 33, column: 5)
!46 = !DILocation(line: 35, column: 14, scope: !45)
!47 = !DILocation(line: 36, column: 5, scope: !45)
!48 = !DILocalVariable(name: "dest", scope: !49, file: !18, line: 38, type: !50)
!49 = distinct !DILexicalBlock(scope: !17, file: !18, line: 37, column: 5)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 100)
!53 = !DILocation(line: 38, column: 17, scope: !49)
!54 = !DILocation(line: 39, column: 17, scope: !49)
!55 = !DILocation(line: 39, column: 9, scope: !49)
!56 = !DILocation(line: 40, column: 9, scope: !49)
!57 = !DILocation(line: 40, column: 21, scope: !49)
!58 = !DILocation(line: 43, column: 9, scope: !49)
!59 = !DILocation(line: 44, column: 9, scope: !49)
!60 = !DILocation(line: 44, column: 21, scope: !49)
!61 = !DILocation(line: 45, column: 20, scope: !49)
!62 = !DILocation(line: 45, column: 9, scope: !49)
!63 = !DILocation(line: 47, column: 1, scope: !17)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_14_good", scope: !18, file: !18, line: 112, type: !19, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!65 = !DILocation(line: 114, column: 5, scope: !64)
!66 = !DILocation(line: 115, column: 5, scope: !64)
!67 = !DILocation(line: 116, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 128, type: !69, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!69 = !DISubroutineType(types: !70)
!70 = !{!8, !8, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !18, line: 128, type: !8)
!75 = !DILocation(line: 128, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !18, line: 128, type: !71)
!77 = !DILocation(line: 128, column: 27, scope: !68)
!78 = !DILocation(line: 131, column: 22, scope: !68)
!79 = !DILocation(line: 131, column: 12, scope: !68)
!80 = !DILocation(line: 131, column: 5, scope: !68)
!81 = !DILocation(line: 133, column: 5, scope: !68)
!82 = !DILocation(line: 134, column: 5, scope: !68)
!83 = !DILocation(line: 135, column: 5, scope: !68)
!84 = !DILocation(line: 138, column: 5, scope: !68)
!85 = !DILocation(line: 139, column: 5, scope: !68)
!86 = !DILocation(line: 140, column: 5, scope: !68)
!87 = !DILocation(line: 142, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!89 = !DILocalVariable(name: "data", scope: !88, file: !18, line: 56, type: !3)
!90 = !DILocation(line: 56, column: 15, scope: !88)
!91 = !DILocalVariable(name: "dataBadBuffer", scope: !88, file: !18, line: 57, type: !3)
!92 = !DILocation(line: 57, column: 15, scope: !88)
!93 = !DILocation(line: 57, column: 42, scope: !88)
!94 = !DILocation(line: 57, column: 31, scope: !88)
!95 = !DILocalVariable(name: "dataGoodBuffer", scope: !88, file: !18, line: 58, type: !3)
!96 = !DILocation(line: 58, column: 15, scope: !88)
!97 = !DILocation(line: 58, column: 43, scope: !88)
!98 = !DILocation(line: 58, column: 32, scope: !88)
!99 = !DILocation(line: 59, column: 13, scope: !88)
!100 = !DILocation(line: 59, column: 5, scope: !88)
!101 = !DILocation(line: 60, column: 5, scope: !88)
!102 = !DILocation(line: 60, column: 25, scope: !88)
!103 = !DILocation(line: 61, column: 13, scope: !88)
!104 = !DILocation(line: 61, column: 5, scope: !88)
!105 = !DILocation(line: 62, column: 5, scope: !88)
!106 = !DILocation(line: 62, column: 27, scope: !88)
!107 = !DILocation(line: 63, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !88, file: !18, line: 63, column: 8)
!109 = !DILocation(line: 63, column: 18, scope: !108)
!110 = !DILocation(line: 63, column: 8, scope: !88)
!111 = !DILocation(line: 66, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !18, line: 64, column: 5)
!113 = !DILocation(line: 67, column: 5, scope: !112)
!114 = !DILocation(line: 71, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !18, line: 69, column: 5)
!116 = !DILocation(line: 71, column: 14, scope: !115)
!117 = !DILocalVariable(name: "dest", scope: !118, file: !18, line: 74, type: !50)
!118 = distinct !DILexicalBlock(scope: !88, file: !18, line: 73, column: 5)
!119 = !DILocation(line: 74, column: 17, scope: !118)
!120 = !DILocation(line: 75, column: 17, scope: !118)
!121 = !DILocation(line: 75, column: 9, scope: !118)
!122 = !DILocation(line: 76, column: 9, scope: !118)
!123 = !DILocation(line: 76, column: 21, scope: !118)
!124 = !DILocation(line: 79, column: 9, scope: !118)
!125 = !DILocation(line: 80, column: 9, scope: !118)
!126 = !DILocation(line: 80, column: 21, scope: !118)
!127 = !DILocation(line: 81, column: 20, scope: !118)
!128 = !DILocation(line: 81, column: 9, scope: !118)
!129 = !DILocation(line: 83, column: 1, scope: !88)
!130 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 86, type: !19, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!131 = !DILocalVariable(name: "data", scope: !130, file: !18, line: 88, type: !3)
!132 = !DILocation(line: 88, column: 15, scope: !130)
!133 = !DILocalVariable(name: "dataBadBuffer", scope: !130, file: !18, line: 89, type: !3)
!134 = !DILocation(line: 89, column: 15, scope: !130)
!135 = !DILocation(line: 89, column: 42, scope: !130)
!136 = !DILocation(line: 89, column: 31, scope: !130)
!137 = !DILocalVariable(name: "dataGoodBuffer", scope: !130, file: !18, line: 90, type: !3)
!138 = !DILocation(line: 90, column: 15, scope: !130)
!139 = !DILocation(line: 90, column: 43, scope: !130)
!140 = !DILocation(line: 90, column: 32, scope: !130)
!141 = !DILocation(line: 91, column: 13, scope: !130)
!142 = !DILocation(line: 91, column: 5, scope: !130)
!143 = !DILocation(line: 92, column: 5, scope: !130)
!144 = !DILocation(line: 92, column: 25, scope: !130)
!145 = !DILocation(line: 93, column: 13, scope: !130)
!146 = !DILocation(line: 93, column: 5, scope: !130)
!147 = !DILocation(line: 94, column: 5, scope: !130)
!148 = !DILocation(line: 94, column: 27, scope: !130)
!149 = !DILocation(line: 95, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !130, file: !18, line: 95, column: 8)
!151 = !DILocation(line: 95, column: 18, scope: !150)
!152 = !DILocation(line: 95, column: 8, scope: !130)
!153 = !DILocation(line: 98, column: 16, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !18, line: 96, column: 5)
!155 = !DILocation(line: 98, column: 14, scope: !154)
!156 = !DILocation(line: 99, column: 5, scope: !154)
!157 = !DILocalVariable(name: "dest", scope: !158, file: !18, line: 101, type: !50)
!158 = distinct !DILexicalBlock(scope: !130, file: !18, line: 100, column: 5)
!159 = !DILocation(line: 101, column: 17, scope: !158)
!160 = !DILocation(line: 102, column: 17, scope: !158)
!161 = !DILocation(line: 102, column: 9, scope: !158)
!162 = !DILocation(line: 103, column: 9, scope: !158)
!163 = !DILocation(line: 103, column: 21, scope: !158)
!164 = !DILocation(line: 106, column: 9, scope: !158)
!165 = !DILocation(line: 107, column: 9, scope: !158)
!166 = !DILocation(line: 107, column: 21, scope: !158)
!167 = !DILocation(line: 108, column: 20, scope: !158)
!168 = !DILocation(line: 108, column: 9, scope: !158)
!169 = !DILocation(line: 110, column: 1, scope: !130)
