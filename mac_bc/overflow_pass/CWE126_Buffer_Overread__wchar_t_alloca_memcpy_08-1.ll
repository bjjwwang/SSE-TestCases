; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_bad() #0 !dbg !17 {
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
  %call3 = call i32 @staticReturnsTrue(), !dbg !40
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
  %call9 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !57
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx10, align 4, !dbg !59
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  call void @printWLine(i32* noundef %arraydecay11), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_good() #0 !dbg !63 {
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
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_good(), !dbg !81
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !82
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_bad(), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !85
  ret i32 0, !dbg !86
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !87 {
entry:
  ret i32 1, !dbg !90
}

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
  %call3 = call i32 @staticReturnsFalse(), !dbg !110
  %tobool = icmp ne i32 %call3, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !116
  store i32* %8, i32** %data, align 8, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !119, metadata !DIExpression()), !dbg !121
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !122
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !123
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx5, align 4, !dbg !125
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %9 = bitcast i32* %arraydecay6 to i8*, !dbg !126
  %10 = load i32*, i32** %data, align 8, !dbg !126
  %11 = bitcast i32* %10 to i8*, !dbg !126
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !126
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !126
  %mul = mul i64 %call8, 4, !dbg !126
  %call9 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !126
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !127
  store i32 0, i32* %arrayidx10, align 4, !dbg !128
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* noundef %arraydecay11), !dbg !130
  ret void, !dbg !131
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !132 {
entry:
  ret i32 0, !dbg !133
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !134 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !137, metadata !DIExpression()), !dbg !138
  %0 = alloca i8, i64 200, align 16, !dbg !139
  %1 = bitcast i8* %0 to i32*, !dbg !140
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !138
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !141, metadata !DIExpression()), !dbg !142
  %2 = alloca i8, i64 400, align 16, !dbg !143
  %3 = bitcast i8* %2 to i32*, !dbg !144
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !142
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !145
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !146
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !147
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !147
  store i32 0, i32* %arrayidx, align 4, !dbg !148
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !149
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !150
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !151
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !151
  store i32 0, i32* %arrayidx2, align 4, !dbg !152
  %call3 = call i32 @staticReturnsTrue(), !dbg !153
  %tobool = icmp ne i32 %call3, 0, !dbg !153
  br i1 %tobool, label %if.then, label %if.end, !dbg !155

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !156
  store i32* %8, i32** %data, align 8, !dbg !158
  br label %if.end, !dbg !159

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !160, metadata !DIExpression()), !dbg !162
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %call4 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !164
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx5, align 4, !dbg !166
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %9 = bitcast i32* %arraydecay6 to i8*, !dbg !167
  %10 = load i32*, i32** %data, align 8, !dbg !167
  %11 = bitcast i32* %10 to i8*, !dbg !167
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %call8 = call i64 @wcslen(i32* noundef %arraydecay7), !dbg !167
  %mul = mul i64 %call8, 4, !dbg !167
  %call9 = call i8* @__memcpy_chk(i8* noundef %9, i8* noundef %11, i64 noundef %mul, i64 noundef 400) #4, !dbg !167
  %arrayidx10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx10, align 4, !dbg !169
  %arraydecay11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* noundef %arraydecay11), !dbg !171
  ret void, !dbg !172
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_bad", scope: !18, file: !18, line: 37, type: !19, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 39, type: !3)
!23 = !DILocation(line: 39, column: 15, scope: !17)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 40, type: !3)
!25 = !DILocation(line: 40, column: 15, scope: !17)
!26 = !DILocation(line: 40, column: 42, scope: !17)
!27 = !DILocation(line: 40, column: 31, scope: !17)
!28 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 41, type: !3)
!29 = !DILocation(line: 41, column: 15, scope: !17)
!30 = !DILocation(line: 41, column: 43, scope: !17)
!31 = !DILocation(line: 41, column: 32, scope: !17)
!32 = !DILocation(line: 42, column: 13, scope: !17)
!33 = !DILocation(line: 42, column: 5, scope: !17)
!34 = !DILocation(line: 43, column: 5, scope: !17)
!35 = !DILocation(line: 43, column: 25, scope: !17)
!36 = !DILocation(line: 44, column: 13, scope: !17)
!37 = !DILocation(line: 44, column: 5, scope: !17)
!38 = !DILocation(line: 45, column: 5, scope: !17)
!39 = !DILocation(line: 45, column: 27, scope: !17)
!40 = !DILocation(line: 46, column: 8, scope: !41)
!41 = distinct !DILexicalBlock(scope: !17, file: !18, line: 46, column: 8)
!42 = !DILocation(line: 46, column: 8, scope: !17)
!43 = !DILocation(line: 49, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !18, line: 47, column: 5)
!45 = !DILocation(line: 49, column: 14, scope: !44)
!46 = !DILocation(line: 50, column: 5, scope: !44)
!47 = !DILocalVariable(name: "dest", scope: !48, file: !18, line: 52, type: !49)
!48 = distinct !DILexicalBlock(scope: !17, file: !18, line: 51, column: 5)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 52, column: 17, scope: !48)
!53 = !DILocation(line: 53, column: 17, scope: !48)
!54 = !DILocation(line: 53, column: 9, scope: !48)
!55 = !DILocation(line: 54, column: 9, scope: !48)
!56 = !DILocation(line: 54, column: 21, scope: !48)
!57 = !DILocation(line: 57, column: 9, scope: !48)
!58 = !DILocation(line: 58, column: 9, scope: !48)
!59 = !DILocation(line: 58, column: 21, scope: !48)
!60 = !DILocation(line: 59, column: 20, scope: !48)
!61 = !DILocation(line: 59, column: 9, scope: !48)
!62 = !DILocation(line: 61, column: 1, scope: !17)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_good", scope: !18, file: !18, line: 126, type: !19, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!64 = !DILocation(line: 128, column: 5, scope: !63)
!65 = !DILocation(line: 129, column: 5, scope: !63)
!66 = !DILocation(line: 130, column: 1, scope: !63)
!67 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 142, type: !68, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!68 = !DISubroutineType(types: !69)
!69 = !{!8, !8, !70}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!73 = !DILocalVariable(name: "argc", arg: 1, scope: !67, file: !18, line: 142, type: !8)
!74 = !DILocation(line: 142, column: 14, scope: !67)
!75 = !DILocalVariable(name: "argv", arg: 2, scope: !67, file: !18, line: 142, type: !70)
!76 = !DILocation(line: 142, column: 27, scope: !67)
!77 = !DILocation(line: 145, column: 22, scope: !67)
!78 = !DILocation(line: 145, column: 12, scope: !67)
!79 = !DILocation(line: 145, column: 5, scope: !67)
!80 = !DILocation(line: 147, column: 5, scope: !67)
!81 = !DILocation(line: 148, column: 5, scope: !67)
!82 = !DILocation(line: 149, column: 5, scope: !67)
!83 = !DILocation(line: 152, column: 5, scope: !67)
!84 = !DILocation(line: 153, column: 5, scope: !67)
!85 = !DILocation(line: 154, column: 5, scope: !67)
!86 = !DILocation(line: 156, column: 5, scope: !67)
!87 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !18, file: !18, line: 25, type: !88, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!88 = !DISubroutineType(types: !89)
!89 = !{!8}
!90 = !DILocation(line: 27, column: 5, scope: !87)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !18, file: !18, line: 68, type: !19, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!92 = !DILocalVariable(name: "data", scope: !91, file: !18, line: 70, type: !3)
!93 = !DILocation(line: 70, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !18, line: 71, type: !3)
!95 = !DILocation(line: 71, column: 15, scope: !91)
!96 = !DILocation(line: 71, column: 42, scope: !91)
!97 = !DILocation(line: 71, column: 31, scope: !91)
!98 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !18, line: 72, type: !3)
!99 = !DILocation(line: 72, column: 15, scope: !91)
!100 = !DILocation(line: 72, column: 43, scope: !91)
!101 = !DILocation(line: 72, column: 32, scope: !91)
!102 = !DILocation(line: 73, column: 13, scope: !91)
!103 = !DILocation(line: 73, column: 5, scope: !91)
!104 = !DILocation(line: 74, column: 5, scope: !91)
!105 = !DILocation(line: 74, column: 25, scope: !91)
!106 = !DILocation(line: 75, column: 13, scope: !91)
!107 = !DILocation(line: 75, column: 5, scope: !91)
!108 = !DILocation(line: 76, column: 5, scope: !91)
!109 = !DILocation(line: 76, column: 27, scope: !91)
!110 = !DILocation(line: 77, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !91, file: !18, line: 77, column: 8)
!112 = !DILocation(line: 77, column: 8, scope: !91)
!113 = !DILocation(line: 80, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !18, line: 78, column: 5)
!115 = !DILocation(line: 81, column: 5, scope: !114)
!116 = !DILocation(line: 85, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !18, line: 83, column: 5)
!118 = !DILocation(line: 85, column: 14, scope: !117)
!119 = !DILocalVariable(name: "dest", scope: !120, file: !18, line: 88, type: !49)
!120 = distinct !DILexicalBlock(scope: !91, file: !18, line: 87, column: 5)
!121 = !DILocation(line: 88, column: 17, scope: !120)
!122 = !DILocation(line: 89, column: 17, scope: !120)
!123 = !DILocation(line: 89, column: 9, scope: !120)
!124 = !DILocation(line: 90, column: 9, scope: !120)
!125 = !DILocation(line: 90, column: 21, scope: !120)
!126 = !DILocation(line: 93, column: 9, scope: !120)
!127 = !DILocation(line: 94, column: 9, scope: !120)
!128 = !DILocation(line: 94, column: 21, scope: !120)
!129 = !DILocation(line: 95, column: 20, scope: !120)
!130 = !DILocation(line: 95, column: 9, scope: !120)
!131 = !DILocation(line: 97, column: 1, scope: !91)
!132 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !18, file: !18, line: 30, type: !88, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!133 = !DILocation(line: 32, column: 5, scope: !132)
!134 = distinct !DISubprogram(name: "goodG2B2", scope: !18, file: !18, line: 100, type: !19, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!135 = !DILocalVariable(name: "data", scope: !134, file: !18, line: 102, type: !3)
!136 = !DILocation(line: 102, column: 15, scope: !134)
!137 = !DILocalVariable(name: "dataBadBuffer", scope: !134, file: !18, line: 103, type: !3)
!138 = !DILocation(line: 103, column: 15, scope: !134)
!139 = !DILocation(line: 103, column: 42, scope: !134)
!140 = !DILocation(line: 103, column: 31, scope: !134)
!141 = !DILocalVariable(name: "dataGoodBuffer", scope: !134, file: !18, line: 104, type: !3)
!142 = !DILocation(line: 104, column: 15, scope: !134)
!143 = !DILocation(line: 104, column: 43, scope: !134)
!144 = !DILocation(line: 104, column: 32, scope: !134)
!145 = !DILocation(line: 105, column: 13, scope: !134)
!146 = !DILocation(line: 105, column: 5, scope: !134)
!147 = !DILocation(line: 106, column: 5, scope: !134)
!148 = !DILocation(line: 106, column: 25, scope: !134)
!149 = !DILocation(line: 107, column: 13, scope: !134)
!150 = !DILocation(line: 107, column: 5, scope: !134)
!151 = !DILocation(line: 108, column: 5, scope: !134)
!152 = !DILocation(line: 108, column: 27, scope: !134)
!153 = !DILocation(line: 109, column: 8, scope: !154)
!154 = distinct !DILexicalBlock(scope: !134, file: !18, line: 109, column: 8)
!155 = !DILocation(line: 109, column: 8, scope: !134)
!156 = !DILocation(line: 112, column: 16, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !18, line: 110, column: 5)
!158 = !DILocation(line: 112, column: 14, scope: !157)
!159 = !DILocation(line: 113, column: 5, scope: !157)
!160 = !DILocalVariable(name: "dest", scope: !161, file: !18, line: 115, type: !49)
!161 = distinct !DILexicalBlock(scope: !134, file: !18, line: 114, column: 5)
!162 = !DILocation(line: 115, column: 17, scope: !161)
!163 = !DILocation(line: 116, column: 17, scope: !161)
!164 = !DILocation(line: 116, column: 9, scope: !161)
!165 = !DILocation(line: 117, column: 9, scope: !161)
!166 = !DILocation(line: 117, column: 21, scope: !161)
!167 = !DILocation(line: 120, column: 9, scope: !161)
!168 = !DILocation(line: 121, column: 9, scope: !161)
!169 = !DILocation(line: 121, column: 21, scope: !161)
!170 = !DILocation(line: 122, column: 20, scope: !161)
!171 = !DILocation(line: 122, column: 9, scope: !161)
!172 = !DILocation(line: 124, column: 1, scope: !134)
