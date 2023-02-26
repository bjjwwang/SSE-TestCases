; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_31_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data5 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !16, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !35
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay4, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !44, metadata !DIExpression()), !dbg !46
  %0 = load i32*, i32** %data, align 8, !dbg !47
  store i32* %0, i32** %dataCopy, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !48, metadata !DIExpression()), !dbg !49
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !50
  store i32* %1, i32** %data5, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !58, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !60, metadata !DIExpression()), !dbg !61
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !63
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !64
  store i32 0, i32* %arrayidx8, align 4, !dbg !65
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !66
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !67
  store i64 %call10, i64* %destLen, align 8, !dbg !68
  store i64 0, i64* %i, align 8, !dbg !69
  br label %for.cond, !dbg !71

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !72
  %3 = load i64, i64* %destLen, align 8, !dbg !74
  %cmp = icmp ult i64 %2, %3, !dbg !75
  br i1 %cmp, label %for.body, label %for.end, !dbg !76

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data5, align 8, !dbg !77
  %5 = load i64, i64* %i, align 8, !dbg !79
  %arrayidx11 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !77
  %6 = load i32, i32* %arrayidx11, align 4, !dbg !77
  %7 = load i64, i64* %i, align 8, !dbg !80
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !81
  store i32 %6, i32* %arrayidx12, align 4, !dbg !82
  br label %for.inc, !dbg !83

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !84
  %inc = add i64 %8, 1, !dbg !84
  store i64 %inc, i64* %i, align 8, !dbg !84
  br label %for.cond, !dbg !85, !llvm.loop !86

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !89
  store i32 0, i32* %arrayidx13, align 4, !dbg !90
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !91
  call void @printWLine(i32* noundef %arraydecay14), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_31_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !103, metadata !DIExpression()), !dbg !104
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i64 @time(i64* noundef null), !dbg !107
  %conv = trunc i64 %call to i32, !dbg !108
  call void @srand(i32 noundef %conv), !dbg !109
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_31_good(), !dbg !111
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !112
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !113
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_31_bad(), !dbg !114
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !115
  ret i32 0, !dbg !116
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !117 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dataCopy = alloca i32*, align 8
  %data5 = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !124
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !125
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !127
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !128
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !129
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !130
  store i32 0, i32* %arrayidx3, align 4, !dbg !131
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !132
  store i32* %arraydecay4, i32** %data, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i32** %dataCopy, metadata !134, metadata !DIExpression()), !dbg !136
  %0 = load i32*, i32** %data, align 8, !dbg !137
  store i32* %0, i32** %dataCopy, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i32** %data5, metadata !138, metadata !DIExpression()), !dbg !139
  %1 = load i32*, i32** %dataCopy, align 8, !dbg !140
  store i32* %1, i32** %data5, align 8, !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  %call7 = call i32* @wmemset(i32* noundef %arraydecay6, i32 noundef 67, i64 noundef 99), !dbg !149
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !150
  store i32 0, i32* %arrayidx8, align 4, !dbg !151
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !152
  %call10 = call i64 @wcslen(i32* noundef %arraydecay9), !dbg !153
  store i64 %call10, i64* %destLen, align 8, !dbg !154
  store i64 0, i64* %i, align 8, !dbg !155
  br label %for.cond, !dbg !157

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !158
  %3 = load i64, i64* %destLen, align 8, !dbg !160
  %cmp = icmp ult i64 %2, %3, !dbg !161
  br i1 %cmp, label %for.body, label %for.end, !dbg !162

for.body:                                         ; preds = %for.cond
  %4 = load i32*, i32** %data5, align 8, !dbg !163
  %5 = load i64, i64* %i, align 8, !dbg !165
  %arrayidx11 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !163
  %6 = load i32, i32* %arrayidx11, align 4, !dbg !163
  %7 = load i64, i64* %i, align 8, !dbg !166
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %7, !dbg !167
  store i32 %6, i32* %arrayidx12, align 4, !dbg !168
  br label %for.inc, !dbg !169

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !170
  %inc = add i64 %8, 1, !dbg !170
  store i64 %inc, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !171, !llvm.loop !172

for.end:                                          ; preds = %for.cond
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !174
  store i32 0, i32* %arrayidx13, align 4, !dbg !175
  %arraydecay14 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !176
  call void @printWLine(i32* noundef %arraydecay14), !dbg !177
  ret void, !dbg !178
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_31_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !19, line: 34, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_wchar_t.h", directory: "")
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_wchar_t", file: !21, line: 106, baseType: !22)
!21 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !DILocation(line: 25, column: 15, scope: !11)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 26, column: 13, scope: !11)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 27, column: 13, scope: !11)
!34 = !DILocation(line: 28, column: 13, scope: !11)
!35 = !DILocation(line: 28, column: 5, scope: !11)
!36 = !DILocation(line: 29, column: 5, scope: !11)
!37 = !DILocation(line: 29, column: 25, scope: !11)
!38 = !DILocation(line: 30, column: 13, scope: !11)
!39 = !DILocation(line: 30, column: 5, scope: !11)
!40 = !DILocation(line: 31, column: 5, scope: !11)
!41 = !DILocation(line: 31, column: 27, scope: !11)
!42 = !DILocation(line: 33, column: 12, scope: !11)
!43 = !DILocation(line: 33, column: 10, scope: !11)
!44 = !DILocalVariable(name: "dataCopy", scope: !45, file: !12, line: 35, type: !17)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!46 = !DILocation(line: 35, column: 19, scope: !45)
!47 = !DILocation(line: 35, column: 30, scope: !45)
!48 = !DILocalVariable(name: "data", scope: !45, file: !12, line: 36, type: !17)
!49 = !DILocation(line: 36, column: 19, scope: !45)
!50 = !DILocation(line: 36, column: 26, scope: !45)
!51 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 38, type: !53)
!52 = distinct !DILexicalBlock(scope: !45, file: !12, line: 37, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 31, baseType: !55)
!54 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !56)
!56 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!57 = !DILocation(line: 38, column: 20, scope: !52)
!58 = !DILocalVariable(name: "destLen", scope: !52, file: !12, line: 38, type: !53)
!59 = !DILocation(line: 38, column: 23, scope: !52)
!60 = !DILocalVariable(name: "dest", scope: !52, file: !12, line: 39, type: !30)
!61 = !DILocation(line: 39, column: 21, scope: !52)
!62 = !DILocation(line: 40, column: 21, scope: !52)
!63 = !DILocation(line: 40, column: 13, scope: !52)
!64 = !DILocation(line: 41, column: 13, scope: !52)
!65 = !DILocation(line: 41, column: 25, scope: !52)
!66 = !DILocation(line: 42, column: 30, scope: !52)
!67 = !DILocation(line: 42, column: 23, scope: !52)
!68 = !DILocation(line: 42, column: 21, scope: !52)
!69 = !DILocation(line: 45, column: 20, scope: !70)
!70 = distinct !DILexicalBlock(scope: !52, file: !12, line: 45, column: 13)
!71 = !DILocation(line: 45, column: 18, scope: !70)
!72 = !DILocation(line: 45, column: 25, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !12, line: 45, column: 13)
!74 = !DILocation(line: 45, column: 29, scope: !73)
!75 = !DILocation(line: 45, column: 27, scope: !73)
!76 = !DILocation(line: 45, column: 13, scope: !70)
!77 = !DILocation(line: 47, column: 27, scope: !78)
!78 = distinct !DILexicalBlock(scope: !73, file: !12, line: 46, column: 13)
!79 = !DILocation(line: 47, column: 32, scope: !78)
!80 = !DILocation(line: 47, column: 22, scope: !78)
!81 = !DILocation(line: 47, column: 17, scope: !78)
!82 = !DILocation(line: 47, column: 25, scope: !78)
!83 = !DILocation(line: 48, column: 13, scope: !78)
!84 = !DILocation(line: 45, column: 39, scope: !73)
!85 = !DILocation(line: 45, column: 13, scope: !73)
!86 = distinct !{!86, !76, !87, !88}
!87 = !DILocation(line: 48, column: 13, scope: !70)
!88 = !{!"llvm.loop.mustprogress"}
!89 = !DILocation(line: 49, column: 13, scope: !52)
!90 = !DILocation(line: 49, column: 25, scope: !52)
!91 = !DILocation(line: 50, column: 24, scope: !52)
!92 = !DILocation(line: 50, column: 13, scope: !52)
!93 = !DILocation(line: 53, column: 1, scope: !11)
!94 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_31_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!95 = !DILocation(line: 94, column: 5, scope: !94)
!96 = !DILocation(line: 95, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 106, type: !98, scopeLine: 107, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!98 = !DISubroutineType(types: !99)
!99 = !{!22, !22, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!103 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !12, line: 106, type: !22)
!104 = !DILocation(line: 106, column: 14, scope: !97)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !12, line: 106, type: !100)
!106 = !DILocation(line: 106, column: 27, scope: !97)
!107 = !DILocation(line: 109, column: 22, scope: !97)
!108 = !DILocation(line: 109, column: 12, scope: !97)
!109 = !DILocation(line: 109, column: 5, scope: !97)
!110 = !DILocation(line: 111, column: 5, scope: !97)
!111 = !DILocation(line: 112, column: 5, scope: !97)
!112 = !DILocation(line: 113, column: 5, scope: !97)
!113 = !DILocation(line: 116, column: 5, scope: !97)
!114 = !DILocation(line: 117, column: 5, scope: !97)
!115 = !DILocation(line: 118, column: 5, scope: !97)
!116 = !DILocation(line: 120, column: 5, scope: !97)
!117 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!118 = !DILocalVariable(name: "data", scope: !117, file: !12, line: 62, type: !17)
!119 = !DILocation(line: 62, column: 15, scope: !117)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !117, file: !12, line: 63, type: !25)
!121 = !DILocation(line: 63, column: 13, scope: !117)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !117, file: !12, line: 64, type: !30)
!123 = !DILocation(line: 64, column: 13, scope: !117)
!124 = !DILocation(line: 65, column: 13, scope: !117)
!125 = !DILocation(line: 65, column: 5, scope: !117)
!126 = !DILocation(line: 66, column: 5, scope: !117)
!127 = !DILocation(line: 66, column: 25, scope: !117)
!128 = !DILocation(line: 67, column: 13, scope: !117)
!129 = !DILocation(line: 67, column: 5, scope: !117)
!130 = !DILocation(line: 68, column: 5, scope: !117)
!131 = !DILocation(line: 68, column: 27, scope: !117)
!132 = !DILocation(line: 70, column: 12, scope: !117)
!133 = !DILocation(line: 70, column: 10, scope: !117)
!134 = !DILocalVariable(name: "dataCopy", scope: !135, file: !12, line: 72, type: !17)
!135 = distinct !DILexicalBlock(scope: !117, file: !12, line: 71, column: 5)
!136 = !DILocation(line: 72, column: 19, scope: !135)
!137 = !DILocation(line: 72, column: 30, scope: !135)
!138 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 73, type: !17)
!139 = !DILocation(line: 73, column: 19, scope: !135)
!140 = !DILocation(line: 73, column: 26, scope: !135)
!141 = !DILocalVariable(name: "i", scope: !142, file: !12, line: 75, type: !53)
!142 = distinct !DILexicalBlock(scope: !135, file: !12, line: 74, column: 9)
!143 = !DILocation(line: 75, column: 20, scope: !142)
!144 = !DILocalVariable(name: "destLen", scope: !142, file: !12, line: 75, type: !53)
!145 = !DILocation(line: 75, column: 23, scope: !142)
!146 = !DILocalVariable(name: "dest", scope: !142, file: !12, line: 76, type: !30)
!147 = !DILocation(line: 76, column: 21, scope: !142)
!148 = !DILocation(line: 77, column: 21, scope: !142)
!149 = !DILocation(line: 77, column: 13, scope: !142)
!150 = !DILocation(line: 78, column: 13, scope: !142)
!151 = !DILocation(line: 78, column: 25, scope: !142)
!152 = !DILocation(line: 79, column: 30, scope: !142)
!153 = !DILocation(line: 79, column: 23, scope: !142)
!154 = !DILocation(line: 79, column: 21, scope: !142)
!155 = !DILocation(line: 82, column: 20, scope: !156)
!156 = distinct !DILexicalBlock(scope: !142, file: !12, line: 82, column: 13)
!157 = !DILocation(line: 82, column: 18, scope: !156)
!158 = !DILocation(line: 82, column: 25, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 82, column: 13)
!160 = !DILocation(line: 82, column: 29, scope: !159)
!161 = !DILocation(line: 82, column: 27, scope: !159)
!162 = !DILocation(line: 82, column: 13, scope: !156)
!163 = !DILocation(line: 84, column: 27, scope: !164)
!164 = distinct !DILexicalBlock(scope: !159, file: !12, line: 83, column: 13)
!165 = !DILocation(line: 84, column: 32, scope: !164)
!166 = !DILocation(line: 84, column: 22, scope: !164)
!167 = !DILocation(line: 84, column: 17, scope: !164)
!168 = !DILocation(line: 84, column: 25, scope: !164)
!169 = !DILocation(line: 85, column: 13, scope: !164)
!170 = !DILocation(line: 82, column: 39, scope: !159)
!171 = !DILocation(line: 82, column: 13, scope: !159)
!172 = distinct !{!172, !162, !173, !88}
!173 = !DILocation(line: 85, column: 13, scope: !156)
!174 = !DILocation(line: 86, column: 13, scope: !142)
!175 = !DILocation(line: 86, column: 25, scope: !142)
!176 = !DILocation(line: 87, column: 24, scope: !142)
!177 = !DILocation(line: 87, column: 13, scope: !142)
!178 = !DILocation(line: 90, column: 1, scope: !117)
