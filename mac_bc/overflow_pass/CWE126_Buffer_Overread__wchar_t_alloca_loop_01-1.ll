; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_01_bad() #0 !dbg !17 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
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
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i64* %i, metadata !42, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !51, metadata !DIExpression()), !dbg !55
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !57
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !58
  store i32 0, i32* %arrayidx4, align 4, !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !60
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !61
  store i64 %call6, i64* %destLen, align 8, !dbg !62
  store i64 0, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !66
  %10 = load i64, i64* %destLen, align 8, !dbg !68
  %cmp = icmp ult i64 %9, %10, !dbg !69
  br i1 %cmp, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !71
  %12 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !71
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !71
  %14 = load i64, i64* %i, align 8, !dbg !74
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !75
  store i32 %13, i32* %arrayidx8, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !78
  %inc = add i64 %15, 1, !dbg !78
  store i64 %inc, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !83
  store i32 0, i32* %arrayidx9, align 4, !dbg !84
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !85
  call void @printWLine(i32* noundef %arraydecay10), !dbg !86
  ret void, !dbg !87
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_01_good() #0 !dbg !88 {
entry:
  call void @goodG2B(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !91 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i64 @time(i64* noundef null), !dbg !101
  %conv = trunc i64 %call to i32, !dbg !102
  call void @srand(i32 noundef %conv), !dbg !103
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !104
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_01_good(), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_01_bad(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !109
  ret i32 0, !dbg !110
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !111 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !112, metadata !DIExpression()), !dbg !113
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !114, metadata !DIExpression()), !dbg !115
  %0 = alloca i8, i64 200, align 16, !dbg !116
  %1 = bitcast i8* %0 to i32*, !dbg !117
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !115
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %2 = alloca i8, i64 400, align 16, !dbg !120
  %3 = bitcast i8* %2 to i32*, !dbg !121
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !119
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !122
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !123
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !126
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !127
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !128
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !128
  store i32 0, i32* %arrayidx2, align 4, !dbg !129
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !130
  store i32* %8, i32** %data, align 8, !dbg !131
  call void @llvm.dbg.declare(metadata i64* %i, metadata !132, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !135, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !137, metadata !DIExpression()), !dbg !138
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !139
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !140
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx4, align 4, !dbg !142
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !144
  store i64 %call6, i64* %destLen, align 8, !dbg !145
  store i64 0, i64* %i, align 8, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i64, i64* %i, align 8, !dbg !149
  %10 = load i64, i64* %destLen, align 8, !dbg !151
  %cmp = icmp ult i64 %9, %10, !dbg !152
  br i1 %cmp, label %for.body, label %for.end, !dbg !153

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !154
  %12 = load i64, i64* %i, align 8, !dbg !156
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !154
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !154
  %14 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !158
  store i32 %13, i32* %arrayidx8, align 4, !dbg !159
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !161
  %inc = add i64 %15, 1, !dbg !161
  store i64 %inc, i64* %i, align 8, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !165
  store i32 0, i32* %arrayidx9, align 4, !dbg !166
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  call void @printWLine(i32* noundef %arraydecay10), !dbg !168
  ret void, !dbg !169
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_01_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!40 = !DILocation(line: 33, column: 12, scope: !17)
!41 = !DILocation(line: 33, column: 10, scope: !17)
!42 = !DILocalVariable(name: "i", scope: !43, file: !18, line: 35, type: !44)
!43 = distinct !DILexicalBlock(scope: !17, file: !18, line: 34, column: 5)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 31, baseType: !46)
!45 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !47)
!47 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!48 = !DILocation(line: 35, column: 16, scope: !43)
!49 = !DILocalVariable(name: "destLen", scope: !43, file: !18, line: 35, type: !44)
!50 = !DILocation(line: 35, column: 19, scope: !43)
!51 = !DILocalVariable(name: "dest", scope: !43, file: !18, line: 36, type: !52)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 100)
!55 = !DILocation(line: 36, column: 17, scope: !43)
!56 = !DILocation(line: 37, column: 17, scope: !43)
!57 = !DILocation(line: 37, column: 9, scope: !43)
!58 = !DILocation(line: 38, column: 9, scope: !43)
!59 = !DILocation(line: 38, column: 21, scope: !43)
!60 = !DILocation(line: 39, column: 26, scope: !43)
!61 = !DILocation(line: 39, column: 19, scope: !43)
!62 = !DILocation(line: 39, column: 17, scope: !43)
!63 = !DILocation(line: 42, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !43, file: !18, line: 42, column: 9)
!65 = !DILocation(line: 42, column: 14, scope: !64)
!66 = !DILocation(line: 42, column: 21, scope: !67)
!67 = distinct !DILexicalBlock(scope: !64, file: !18, line: 42, column: 9)
!68 = !DILocation(line: 42, column: 25, scope: !67)
!69 = !DILocation(line: 42, column: 23, scope: !67)
!70 = !DILocation(line: 42, column: 9, scope: !64)
!71 = !DILocation(line: 44, column: 23, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !18, line: 43, column: 9)
!73 = !DILocation(line: 44, column: 28, scope: !72)
!74 = !DILocation(line: 44, column: 18, scope: !72)
!75 = !DILocation(line: 44, column: 13, scope: !72)
!76 = !DILocation(line: 44, column: 21, scope: !72)
!77 = !DILocation(line: 45, column: 9, scope: !72)
!78 = !DILocation(line: 42, column: 35, scope: !67)
!79 = !DILocation(line: 42, column: 9, scope: !67)
!80 = distinct !{!80, !70, !81, !82}
!81 = !DILocation(line: 45, column: 9, scope: !64)
!82 = !{!"llvm.loop.mustprogress"}
!83 = !DILocation(line: 46, column: 9, scope: !43)
!84 = !DILocation(line: 46, column: 21, scope: !43)
!85 = !DILocation(line: 47, column: 20, scope: !43)
!86 = !DILocation(line: 47, column: 9, scope: !43)
!87 = !DILocation(line: 49, column: 1, scope: !17)
!88 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_01_good", scope: !18, file: !18, line: 84, type: !19, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!89 = !DILocation(line: 86, column: 5, scope: !88)
!90 = !DILocation(line: 87, column: 1, scope: !88)
!91 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 99, type: !92, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!92 = !DISubroutineType(types: !93)
!93 = !{!8, !8, !94}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!96 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!97 = !DILocalVariable(name: "argc", arg: 1, scope: !91, file: !18, line: 99, type: !8)
!98 = !DILocation(line: 99, column: 14, scope: !91)
!99 = !DILocalVariable(name: "argv", arg: 2, scope: !91, file: !18, line: 99, type: !94)
!100 = !DILocation(line: 99, column: 27, scope: !91)
!101 = !DILocation(line: 102, column: 22, scope: !91)
!102 = !DILocation(line: 102, column: 12, scope: !91)
!103 = !DILocation(line: 102, column: 5, scope: !91)
!104 = !DILocation(line: 104, column: 5, scope: !91)
!105 = !DILocation(line: 105, column: 5, scope: !91)
!106 = !DILocation(line: 106, column: 5, scope: !91)
!107 = !DILocation(line: 109, column: 5, scope: !91)
!108 = !DILocation(line: 110, column: 5, scope: !91)
!109 = !DILocation(line: 111, column: 5, scope: !91)
!110 = !DILocation(line: 113, column: 5, scope: !91)
!111 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 56, type: !19, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!112 = !DILocalVariable(name: "data", scope: !111, file: !18, line: 58, type: !3)
!113 = !DILocation(line: 58, column: 15, scope: !111)
!114 = !DILocalVariable(name: "dataBadBuffer", scope: !111, file: !18, line: 59, type: !3)
!115 = !DILocation(line: 59, column: 15, scope: !111)
!116 = !DILocation(line: 59, column: 42, scope: !111)
!117 = !DILocation(line: 59, column: 31, scope: !111)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !111, file: !18, line: 60, type: !3)
!119 = !DILocation(line: 60, column: 15, scope: !111)
!120 = !DILocation(line: 60, column: 43, scope: !111)
!121 = !DILocation(line: 60, column: 32, scope: !111)
!122 = !DILocation(line: 61, column: 13, scope: !111)
!123 = !DILocation(line: 61, column: 5, scope: !111)
!124 = !DILocation(line: 62, column: 5, scope: !111)
!125 = !DILocation(line: 62, column: 25, scope: !111)
!126 = !DILocation(line: 63, column: 13, scope: !111)
!127 = !DILocation(line: 63, column: 5, scope: !111)
!128 = !DILocation(line: 64, column: 5, scope: !111)
!129 = !DILocation(line: 64, column: 27, scope: !111)
!130 = !DILocation(line: 66, column: 12, scope: !111)
!131 = !DILocation(line: 66, column: 10, scope: !111)
!132 = !DILocalVariable(name: "i", scope: !133, file: !18, line: 68, type: !44)
!133 = distinct !DILexicalBlock(scope: !111, file: !18, line: 67, column: 5)
!134 = !DILocation(line: 68, column: 16, scope: !133)
!135 = !DILocalVariable(name: "destLen", scope: !133, file: !18, line: 68, type: !44)
!136 = !DILocation(line: 68, column: 19, scope: !133)
!137 = !DILocalVariable(name: "dest", scope: !133, file: !18, line: 69, type: !52)
!138 = !DILocation(line: 69, column: 17, scope: !133)
!139 = !DILocation(line: 70, column: 17, scope: !133)
!140 = !DILocation(line: 70, column: 9, scope: !133)
!141 = !DILocation(line: 71, column: 9, scope: !133)
!142 = !DILocation(line: 71, column: 21, scope: !133)
!143 = !DILocation(line: 72, column: 26, scope: !133)
!144 = !DILocation(line: 72, column: 19, scope: !133)
!145 = !DILocation(line: 72, column: 17, scope: !133)
!146 = !DILocation(line: 75, column: 16, scope: !147)
!147 = distinct !DILexicalBlock(scope: !133, file: !18, line: 75, column: 9)
!148 = !DILocation(line: 75, column: 14, scope: !147)
!149 = !DILocation(line: 75, column: 21, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !18, line: 75, column: 9)
!151 = !DILocation(line: 75, column: 25, scope: !150)
!152 = !DILocation(line: 75, column: 23, scope: !150)
!153 = !DILocation(line: 75, column: 9, scope: !147)
!154 = !DILocation(line: 77, column: 23, scope: !155)
!155 = distinct !DILexicalBlock(scope: !150, file: !18, line: 76, column: 9)
!156 = !DILocation(line: 77, column: 28, scope: !155)
!157 = !DILocation(line: 77, column: 18, scope: !155)
!158 = !DILocation(line: 77, column: 13, scope: !155)
!159 = !DILocation(line: 77, column: 21, scope: !155)
!160 = !DILocation(line: 78, column: 9, scope: !155)
!161 = !DILocation(line: 75, column: 35, scope: !150)
!162 = !DILocation(line: 75, column: 9, scope: !150)
!163 = distinct !{!163, !153, !164, !82}
!164 = !DILocation(line: 78, column: 9, scope: !147)
!165 = !DILocation(line: 79, column: 9, scope: !133)
!166 = !DILocation(line: 79, column: 21, scope: !133)
!167 = !DILocation(line: 80, column: 20, scope: !133)
!168 = !DILocation(line: 80, column: 9, scope: !133)
!169 = !DILocation(line: 82, column: 1, scope: !111)
