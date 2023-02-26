; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_bad() #0 !dbg !21 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = alloca i8, i64 200, align 16, !dbg !29
  %1 = bitcast i8* %0 to i32*, !dbg !30
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = alloca i8, i64 400, align 16, !dbg !33
  %3 = bitcast i8* %2 to i32*, !dbg !34
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !32
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !35
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !36
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !37
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !37
  store i32 0, i32* %arrayidx, align 4, !dbg !38
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !39
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !40
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !41
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !41
  store i32 0, i32* %arrayidx2, align 4, !dbg !42
  %8 = load i32, i32* @staticFive, align 4, !dbg !43
  %cmp = icmp eq i32 %8, 5, !dbg !45
  br i1 %cmp, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !47
  store i32* %9, i32** %data, align 8, !dbg !49
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !56
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !58
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx4, align 4, !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !61
  %11 = load i32*, i32** %data, align 8, !dbg !61
  %12 = bitcast i32* %11 to i8*, !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !61
  %mul = mul i64 %call7, 4, !dbg !61
  %call8 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %12, i64 noundef %mul, i64 noundef 400) #4, !dbg !61
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx9, align 4, !dbg !63
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* noundef %arraydecay10), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* noundef null), !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 noundef %conv), !dbg !83
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_good(), !dbg !85
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_bad(), !dbg !88
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  %0 = alloca i8, i64 200, align 16, !dbg !96
  %1 = bitcast i8* %0 to i32*, !dbg !97
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %2 = alloca i8, i64 400, align 16, !dbg !100
  %3 = bitcast i8* %2 to i32*, !dbg !101
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !99
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !102
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !103
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !104
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !106
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !107
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !108
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !108
  store i32 0, i32* %arrayidx2, align 4, !dbg !109
  %8 = load i32, i32* @staticFive, align 4, !dbg !110
  %cmp = icmp ne i32 %8, 5, !dbg !112
  br i1 %cmp, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !117
  store i32* %9, i32** %data, align 8, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !124
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx4, align 4, !dbg !126
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !127
  %11 = load i32*, i32** %data, align 8, !dbg !127
  %12 = bitcast i32* %11 to i8*, !dbg !127
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !127
  %mul = mul i64 %call7, 4, !dbg !127
  %call8 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %12, i64 noundef %mul, i64 noundef 400) #4, !dbg !127
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx9, align 4, !dbg !129
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* noundef %arraydecay10), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  %0 = alloca i8, i64 200, align 16, !dbg !138
  %1 = bitcast i8* %0 to i32*, !dbg !139
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !137
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !140, metadata !DIExpression()), !dbg !141
  %2 = alloca i8, i64 400, align 16, !dbg !142
  %3 = bitcast i8* %2 to i32*, !dbg !143
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !141
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !144
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !145
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !148
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !149
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !150
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !150
  store i32 0, i32* %arrayidx2, align 4, !dbg !151
  %8 = load i32, i32* @staticFive, align 4, !dbg !152
  %cmp = icmp eq i32 %8, 5, !dbg !154
  br i1 %cmp, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !156
  store i32* %9, i32** %data, align 8, !dbg !158
  br label %if.end, !dbg !159

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !160, metadata !DIExpression()), !dbg !162
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !164
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx4, align 4, !dbg !166
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %10 = bitcast i32* %arraydecay5 to i8*, !dbg !167
  %11 = load i32*, i32** %data, align 8, !dbg !167
  %12 = bitcast i32* %11 to i8*, !dbg !167
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !167
  %mul = mul i64 %call7, 4, !dbg !167
  %call8 = call i8* @__memcpy_chk(i8* noundef %10, i8* noundef %12, i64 noundef %mul, i64 noundef 400) #4, !dbg !167
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx9, align 4, !dbg !169
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* noundef %arraydecay10), !dbg !171
  ret void, !dbg !172
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
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !11}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !7, line: 34, baseType: !8)
!7 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !9, line: 106, baseType: !10)
!9 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!0}
!13 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Homebrew clang version 14.0.6"}
!21 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_bad", scope: !13, file: !13, line: 29, type: !22, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
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
!35 = !DILocation(line: 34, column: 13, scope: !21)
!36 = !DILocation(line: 34, column: 5, scope: !21)
!37 = !DILocation(line: 35, column: 5, scope: !21)
!38 = !DILocation(line: 35, column: 25, scope: !21)
!39 = !DILocation(line: 36, column: 13, scope: !21)
!40 = !DILocation(line: 36, column: 5, scope: !21)
!41 = !DILocation(line: 37, column: 5, scope: !21)
!42 = !DILocation(line: 37, column: 27, scope: !21)
!43 = !DILocation(line: 38, column: 8, scope: !44)
!44 = distinct !DILexicalBlock(scope: !21, file: !13, line: 38, column: 8)
!45 = !DILocation(line: 38, column: 18, scope: !44)
!46 = !DILocation(line: 38, column: 8, scope: !21)
!47 = !DILocation(line: 41, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !13, line: 39, column: 5)
!49 = !DILocation(line: 41, column: 14, scope: !48)
!50 = !DILocation(line: 42, column: 5, scope: !48)
!51 = !DILocalVariable(name: "dest", scope: !52, file: !13, line: 44, type: !53)
!52 = distinct !DILexicalBlock(scope: !21, file: !13, line: 43, column: 5)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 3200, elements: !54)
!54 = !{!55}
!55 = !DISubrange(count: 100)
!56 = !DILocation(line: 44, column: 17, scope: !52)
!57 = !DILocation(line: 45, column: 17, scope: !52)
!58 = !DILocation(line: 45, column: 9, scope: !52)
!59 = !DILocation(line: 46, column: 9, scope: !52)
!60 = !DILocation(line: 46, column: 21, scope: !52)
!61 = !DILocation(line: 49, column: 9, scope: !52)
!62 = !DILocation(line: 50, column: 9, scope: !52)
!63 = !DILocation(line: 50, column: 21, scope: !52)
!64 = !DILocation(line: 51, column: 20, scope: !52)
!65 = !DILocation(line: 51, column: 9, scope: !52)
!66 = !DILocation(line: 53, column: 1, scope: !21)
!67 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_07_good", scope: !13, file: !13, line: 118, type: !22, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!68 = !DILocation(line: 120, column: 5, scope: !67)
!69 = !DILocation(line: 121, column: 5, scope: !67)
!70 = !DILocation(line: 122, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 134, type: !72, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!72 = !DISubroutineType(types: !73)
!73 = !{!10, !10, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !13, line: 134, type: !10)
!78 = !DILocation(line: 134, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !13, line: 134, type: !74)
!80 = !DILocation(line: 134, column: 27, scope: !71)
!81 = !DILocation(line: 137, column: 22, scope: !71)
!82 = !DILocation(line: 137, column: 12, scope: !71)
!83 = !DILocation(line: 137, column: 5, scope: !71)
!84 = !DILocation(line: 139, column: 5, scope: !71)
!85 = !DILocation(line: 140, column: 5, scope: !71)
!86 = !DILocation(line: 141, column: 5, scope: !71)
!87 = !DILocation(line: 144, column: 5, scope: !71)
!88 = !DILocation(line: 145, column: 5, scope: !71)
!89 = !DILocation(line: 146, column: 5, scope: !71)
!90 = !DILocation(line: 148, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !13, file: !13, line: 60, type: !22, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!92 = !DILocalVariable(name: "data", scope: !91, file: !13, line: 62, type: !5)
!93 = !DILocation(line: 62, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !13, line: 63, type: !5)
!95 = !DILocation(line: 63, column: 15, scope: !91)
!96 = !DILocation(line: 63, column: 42, scope: !91)
!97 = !DILocation(line: 63, column: 31, scope: !91)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !13, line: 64, type: !5)
!99 = !DILocation(line: 64, column: 15, scope: !91)
!100 = !DILocation(line: 64, column: 43, scope: !91)
!101 = !DILocation(line: 64, column: 32, scope: !91)
!102 = !DILocation(line: 65, column: 13, scope: !91)
!103 = !DILocation(line: 65, column: 5, scope: !91)
!104 = !DILocation(line: 66, column: 5, scope: !91)
!105 = !DILocation(line: 66, column: 25, scope: !91)
!106 = !DILocation(line: 67, column: 13, scope: !91)
!107 = !DILocation(line: 67, column: 5, scope: !91)
!108 = !DILocation(line: 68, column: 5, scope: !91)
!109 = !DILocation(line: 68, column: 27, scope: !91)
!110 = !DILocation(line: 69, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !91, file: !13, line: 69, column: 8)
!112 = !DILocation(line: 69, column: 18, scope: !111)
!113 = !DILocation(line: 69, column: 8, scope: !91)
!114 = !DILocation(line: 72, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !13, line: 70, column: 5)
!116 = !DILocation(line: 73, column: 5, scope: !115)
!117 = !DILocation(line: 77, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !111, file: !13, line: 75, column: 5)
!119 = !DILocation(line: 77, column: 14, scope: !118)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !13, line: 80, type: !53)
!121 = distinct !DILexicalBlock(scope: !91, file: !13, line: 79, column: 5)
!122 = !DILocation(line: 80, column: 17, scope: !121)
!123 = !DILocation(line: 81, column: 17, scope: !121)
!124 = !DILocation(line: 81, column: 9, scope: !121)
!125 = !DILocation(line: 82, column: 9, scope: !121)
!126 = !DILocation(line: 82, column: 21, scope: !121)
!127 = !DILocation(line: 85, column: 9, scope: !121)
!128 = !DILocation(line: 86, column: 9, scope: !121)
!129 = !DILocation(line: 86, column: 21, scope: !121)
!130 = !DILocation(line: 87, column: 20, scope: !121)
!131 = !DILocation(line: 87, column: 9, scope: !121)
!132 = !DILocation(line: 89, column: 1, scope: !91)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !13, file: !13, line: 92, type: !22, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!134 = !DILocalVariable(name: "data", scope: !133, file: !13, line: 94, type: !5)
!135 = !DILocation(line: 94, column: 15, scope: !133)
!136 = !DILocalVariable(name: "dataBadBuffer", scope: !133, file: !13, line: 95, type: !5)
!137 = !DILocation(line: 95, column: 15, scope: !133)
!138 = !DILocation(line: 95, column: 42, scope: !133)
!139 = !DILocation(line: 95, column: 31, scope: !133)
!140 = !DILocalVariable(name: "dataGoodBuffer", scope: !133, file: !13, line: 96, type: !5)
!141 = !DILocation(line: 96, column: 15, scope: !133)
!142 = !DILocation(line: 96, column: 43, scope: !133)
!143 = !DILocation(line: 96, column: 32, scope: !133)
!144 = !DILocation(line: 97, column: 13, scope: !133)
!145 = !DILocation(line: 97, column: 5, scope: !133)
!146 = !DILocation(line: 98, column: 5, scope: !133)
!147 = !DILocation(line: 98, column: 25, scope: !133)
!148 = !DILocation(line: 99, column: 13, scope: !133)
!149 = !DILocation(line: 99, column: 5, scope: !133)
!150 = !DILocation(line: 100, column: 5, scope: !133)
!151 = !DILocation(line: 100, column: 27, scope: !133)
!152 = !DILocation(line: 101, column: 8, scope: !153)
!153 = distinct !DILexicalBlock(scope: !133, file: !13, line: 101, column: 8)
!154 = !DILocation(line: 101, column: 18, scope: !153)
!155 = !DILocation(line: 101, column: 8, scope: !133)
!156 = !DILocation(line: 104, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !153, file: !13, line: 102, column: 5)
!158 = !DILocation(line: 104, column: 14, scope: !157)
!159 = !DILocation(line: 105, column: 5, scope: !157)
!160 = !DILocalVariable(name: "dest", scope: !161, file: !13, line: 107, type: !53)
!161 = distinct !DILexicalBlock(scope: !133, file: !13, line: 106, column: 5)
!162 = !DILocation(line: 107, column: 17, scope: !161)
!163 = !DILocation(line: 108, column: 17, scope: !161)
!164 = !DILocation(line: 108, column: 9, scope: !161)
!165 = !DILocation(line: 109, column: 9, scope: !161)
!166 = !DILocation(line: 109, column: 21, scope: !161)
!167 = !DILocation(line: 112, column: 9, scope: !161)
!168 = !DILocation(line: 113, column: 9, scope: !161)
!169 = !DILocation(line: 113, column: 21, scope: !161)
!170 = !DILocation(line: 114, column: 20, scope: !161)
!171 = !DILocation(line: 114, column: 9, scope: !161)
!172 = !DILocation(line: 116, column: 1, scope: !133)
