; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_16_bad() #0 !dbg !17 {
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
  br label %while.body, !dbg !40

while.body:                                       ; preds = %entry
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !41
  store i32* %8, i32** %data, align 8, !dbg !43
  br label %while.end, !dbg !44

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !45, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !52, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !54, metadata !DIExpression()), !dbg !58
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !60
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !61
  store i32 0, i32* %arrayidx4, align 4, !dbg !62
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !63
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !64
  store i64 %call6, i64* %destLen, align 8, !dbg !65
  store i64 0, i64* %i, align 8, !dbg !66
  br label %for.cond, !dbg !68

for.cond:                                         ; preds = %for.inc, %while.end
  %9 = load i64, i64* %i, align 8, !dbg !69
  %10 = load i64, i64* %destLen, align 8, !dbg !71
  %cmp = icmp ult i64 %9, %10, !dbg !72
  br i1 %cmp, label %for.body, label %for.end, !dbg !73

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !74
  %12 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !74
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !74
  %14 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !78
  store i32 %13, i32* %arrayidx8, align 4, !dbg !79
  br label %for.inc, !dbg !80

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !81
  %inc = add i64 %15, 1, !dbg !81
  store i64 %inc, i64* %i, align 8, !dbg !81
  br label %for.cond, !dbg !82, !llvm.loop !83

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !86
  store i32 0, i32* %arrayidx9, align 4, !dbg !87
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !88
  call void @printWLine(i32* noundef %arraydecay10), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_loop_16_good() #0 !dbg !91 {
entry:
  call void @goodG2B(), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !94 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* noundef null), !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 noundef %conv), !dbg !106
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_16_good(), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__wchar_t_alloca_loop_16_bad(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = alloca i8, i64 200, align 16, !dbg !119
  %1 = bitcast i8* %0 to i32*, !dbg !120
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !118
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %2 = alloca i8, i64 400, align 16, !dbg !123
  %3 = bitcast i8* %2 to i32*, !dbg !124
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !122
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !125
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !126
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !127
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !129
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !130
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !131
  store i32 0, i32* %arrayidx2, align 4, !dbg !132
  br label %while.body, !dbg !133

while.body:                                       ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !134
  store i32* %8, i32** %data, align 8, !dbg !136
  br label %while.end, !dbg !137

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !145
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !146
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !147
  store i32 0, i32* %arrayidx4, align 4, !dbg !148
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !149
  %call6 = call i64 @wcslen(i32* noundef %arraydecay5), !dbg !150
  store i64 %call6, i64* %destLen, align 8, !dbg !151
  store i64 0, i64* %i, align 8, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %while.end
  %9 = load i64, i64* %i, align 8, !dbg !155
  %10 = load i64, i64* %destLen, align 8, !dbg !157
  %cmp = icmp ult i64 %9, %10, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !160
  %12 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 %12, !dbg !160
  %13 = load i32, i32* %arrayidx7, align 4, !dbg !160
  %14 = load i64, i64* %i, align 8, !dbg !163
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %14, !dbg !164
  store i32 %13, i32* %arrayidx8, align 4, !dbg !165
  br label %for.inc, !dbg !166

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !167
  %inc = add i64 %15, 1, !dbg !167
  store i64 %inc, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !168, !llvm.loop !169

for.end:                                          ; preds = %for.cond
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !171
  store i32 0, i32* %arrayidx9, align 4, !dbg !172
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !173
  call void @printWLine(i32* noundef %arraydecay10), !dbg !174
  ret void, !dbg !175
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_16_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!40 = !DILocation(line: 32, column: 5, scope: !17)
!41 = !DILocation(line: 35, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !17, file: !18, line: 33, column: 5)
!43 = !DILocation(line: 35, column: 14, scope: !42)
!44 = !DILocation(line: 36, column: 9, scope: !42)
!45 = !DILocalVariable(name: "i", scope: !46, file: !18, line: 39, type: !47)
!46 = distinct !DILexicalBlock(scope: !17, file: !18, line: 38, column: 5)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !48, line: 31, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !7, line: 94, baseType: !50)
!50 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DILocation(line: 39, column: 16, scope: !46)
!52 = !DILocalVariable(name: "destLen", scope: !46, file: !18, line: 39, type: !47)
!53 = !DILocation(line: 39, column: 19, scope: !46)
!54 = !DILocalVariable(name: "dest", scope: !46, file: !18, line: 40, type: !55)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 100)
!58 = !DILocation(line: 40, column: 17, scope: !46)
!59 = !DILocation(line: 41, column: 17, scope: !46)
!60 = !DILocation(line: 41, column: 9, scope: !46)
!61 = !DILocation(line: 42, column: 9, scope: !46)
!62 = !DILocation(line: 42, column: 21, scope: !46)
!63 = !DILocation(line: 43, column: 26, scope: !46)
!64 = !DILocation(line: 43, column: 19, scope: !46)
!65 = !DILocation(line: 43, column: 17, scope: !46)
!66 = !DILocation(line: 46, column: 16, scope: !67)
!67 = distinct !DILexicalBlock(scope: !46, file: !18, line: 46, column: 9)
!68 = !DILocation(line: 46, column: 14, scope: !67)
!69 = !DILocation(line: 46, column: 21, scope: !70)
!70 = distinct !DILexicalBlock(scope: !67, file: !18, line: 46, column: 9)
!71 = !DILocation(line: 46, column: 25, scope: !70)
!72 = !DILocation(line: 46, column: 23, scope: !70)
!73 = !DILocation(line: 46, column: 9, scope: !67)
!74 = !DILocation(line: 48, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !18, line: 47, column: 9)
!76 = !DILocation(line: 48, column: 28, scope: !75)
!77 = !DILocation(line: 48, column: 18, scope: !75)
!78 = !DILocation(line: 48, column: 13, scope: !75)
!79 = !DILocation(line: 48, column: 21, scope: !75)
!80 = !DILocation(line: 49, column: 9, scope: !75)
!81 = !DILocation(line: 46, column: 35, scope: !70)
!82 = !DILocation(line: 46, column: 9, scope: !70)
!83 = distinct !{!83, !73, !84, !85}
!84 = !DILocation(line: 49, column: 9, scope: !67)
!85 = !{!"llvm.loop.mustprogress"}
!86 = !DILocation(line: 50, column: 9, scope: !46)
!87 = !DILocation(line: 50, column: 21, scope: !46)
!88 = !DILocation(line: 51, column: 20, scope: !46)
!89 = !DILocation(line: 51, column: 9, scope: !46)
!90 = !DILocation(line: 53, column: 1, scope: !17)
!91 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_loop_16_good", scope: !18, file: !18, line: 92, type: !19, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!92 = !DILocation(line: 94, column: 5, scope: !91)
!93 = !DILocation(line: 95, column: 1, scope: !91)
!94 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 107, type: !95, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!95 = !DISubroutineType(types: !96)
!96 = !{!8, !8, !97}
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!99 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !94, file: !18, line: 107, type: !8)
!101 = !DILocation(line: 107, column: 14, scope: !94)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !94, file: !18, line: 107, type: !97)
!103 = !DILocation(line: 107, column: 27, scope: !94)
!104 = !DILocation(line: 110, column: 22, scope: !94)
!105 = !DILocation(line: 110, column: 12, scope: !94)
!106 = !DILocation(line: 110, column: 5, scope: !94)
!107 = !DILocation(line: 112, column: 5, scope: !94)
!108 = !DILocation(line: 113, column: 5, scope: !94)
!109 = !DILocation(line: 114, column: 5, scope: !94)
!110 = !DILocation(line: 117, column: 5, scope: !94)
!111 = !DILocation(line: 118, column: 5, scope: !94)
!112 = !DILocation(line: 119, column: 5, scope: !94)
!113 = !DILocation(line: 121, column: 5, scope: !94)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 60, type: !19, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!115 = !DILocalVariable(name: "data", scope: !114, file: !18, line: 62, type: !3)
!116 = !DILocation(line: 62, column: 15, scope: !114)
!117 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !18, line: 63, type: !3)
!118 = !DILocation(line: 63, column: 15, scope: !114)
!119 = !DILocation(line: 63, column: 42, scope: !114)
!120 = !DILocation(line: 63, column: 31, scope: !114)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !18, line: 64, type: !3)
!122 = !DILocation(line: 64, column: 15, scope: !114)
!123 = !DILocation(line: 64, column: 43, scope: !114)
!124 = !DILocation(line: 64, column: 32, scope: !114)
!125 = !DILocation(line: 65, column: 13, scope: !114)
!126 = !DILocation(line: 65, column: 5, scope: !114)
!127 = !DILocation(line: 66, column: 5, scope: !114)
!128 = !DILocation(line: 66, column: 25, scope: !114)
!129 = !DILocation(line: 67, column: 13, scope: !114)
!130 = !DILocation(line: 67, column: 5, scope: !114)
!131 = !DILocation(line: 68, column: 5, scope: !114)
!132 = !DILocation(line: 68, column: 27, scope: !114)
!133 = !DILocation(line: 69, column: 5, scope: !114)
!134 = !DILocation(line: 72, column: 16, scope: !135)
!135 = distinct !DILexicalBlock(scope: !114, file: !18, line: 70, column: 5)
!136 = !DILocation(line: 72, column: 14, scope: !135)
!137 = !DILocation(line: 73, column: 9, scope: !135)
!138 = !DILocalVariable(name: "i", scope: !139, file: !18, line: 76, type: !47)
!139 = distinct !DILexicalBlock(scope: !114, file: !18, line: 75, column: 5)
!140 = !DILocation(line: 76, column: 16, scope: !139)
!141 = !DILocalVariable(name: "destLen", scope: !139, file: !18, line: 76, type: !47)
!142 = !DILocation(line: 76, column: 19, scope: !139)
!143 = !DILocalVariable(name: "dest", scope: !139, file: !18, line: 77, type: !55)
!144 = !DILocation(line: 77, column: 17, scope: !139)
!145 = !DILocation(line: 78, column: 17, scope: !139)
!146 = !DILocation(line: 78, column: 9, scope: !139)
!147 = !DILocation(line: 79, column: 9, scope: !139)
!148 = !DILocation(line: 79, column: 21, scope: !139)
!149 = !DILocation(line: 80, column: 26, scope: !139)
!150 = !DILocation(line: 80, column: 19, scope: !139)
!151 = !DILocation(line: 80, column: 17, scope: !139)
!152 = !DILocation(line: 83, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !139, file: !18, line: 83, column: 9)
!154 = !DILocation(line: 83, column: 14, scope: !153)
!155 = !DILocation(line: 83, column: 21, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !18, line: 83, column: 9)
!157 = !DILocation(line: 83, column: 25, scope: !156)
!158 = !DILocation(line: 83, column: 23, scope: !156)
!159 = !DILocation(line: 83, column: 9, scope: !153)
!160 = !DILocation(line: 85, column: 23, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !18, line: 84, column: 9)
!162 = !DILocation(line: 85, column: 28, scope: !161)
!163 = !DILocation(line: 85, column: 18, scope: !161)
!164 = !DILocation(line: 85, column: 13, scope: !161)
!165 = !DILocation(line: 85, column: 21, scope: !161)
!166 = !DILocation(line: 86, column: 9, scope: !161)
!167 = !DILocation(line: 83, column: 35, scope: !156)
!168 = !DILocation(line: 83, column: 9, scope: !156)
!169 = distinct !{!169, !159, !170, !85}
!170 = !DILocation(line: 86, column: 9, scope: !153)
!171 = !DILocation(line: 87, column: 9, scope: !139)
!172 = !DILocation(line: 87, column: 21, scope: !139)
!173 = !DILocation(line: 88, column: 20, scope: !139)
!174 = !DILocation(line: 88, column: 9, scope: !139)
!175 = !DILocation(line: 90, column: 1, scope: !114)
