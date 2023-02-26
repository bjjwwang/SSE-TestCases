; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_16_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
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
  br label %while.body, !dbg !42

while.body:                                       ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !43
  store i32* %arraydecay4, i32** %data, align 8, !dbg !45
  br label %while.end, !dbg !46

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !47, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !54, metadata !DIExpression()), !dbg !55
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !56, metadata !DIExpression()), !dbg !57
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !58
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !59
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !60
  store i32 0, i32* %arrayidx7, align 4, !dbg !61
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !62
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !63
  store i64 %call9, i64* %destLen, align 8, !dbg !64
  store i64 0, i64* %i, align 8, !dbg !65
  br label %for.cond, !dbg !67

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !68
  %1 = load i64, i64* %destLen, align 8, !dbg !70
  %cmp = icmp ult i64 %0, %1, !dbg !71
  br i1 %cmp, label %for.body, label %for.end, !dbg !72

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !73
  %3 = load i64, i64* %i, align 8, !dbg !75
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !73
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !73
  %5 = load i64, i64* %i, align 8, !dbg !76
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !77
  store i32 %4, i32* %arrayidx11, align 4, !dbg !78
  br label %for.inc, !dbg !79

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !80
  %inc = add i64 %6, 1, !dbg !80
  store i64 %inc, i64* %i, align 8, !dbg !80
  br label %for.cond, !dbg !81, !llvm.loop !82

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !85
  store i32 0, i32* %arrayidx12, align 4, !dbg !86
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !87
  call void @printWLine(i32* noundef %arraydecay13), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_16_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_16_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_16_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !120
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !121
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !123
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !124
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !125
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx3, align 4, !dbg !127
  br label %while.body, !dbg !128

while.body:                                       ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !129
  store i32* %arraydecay4, i32** %data, align 8, !dbg !131
  br label %while.end, !dbg !132

while.end:                                        ; preds = %while.body
  call void @llvm.dbg.declare(metadata i64* %i, metadata !133, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !141
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !142
  store i32 0, i32* %arrayidx7, align 4, !dbg !143
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !144
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !145
  store i64 %call9, i64* %destLen, align 8, !dbg !146
  store i64 0, i64* %i, align 8, !dbg !147
  br label %for.cond, !dbg !149

for.cond:                                         ; preds = %for.inc, %while.end
  %0 = load i64, i64* %i, align 8, !dbg !150
  %1 = load i64, i64* %destLen, align 8, !dbg !152
  %cmp = icmp ult i64 %0, %1, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !155
  %3 = load i64, i64* %i, align 8, !dbg !157
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !155
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !155
  %5 = load i64, i64* %i, align 8, !dbg !158
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !159
  store i32 %4, i32* %arrayidx11, align 4, !dbg !160
  br label %for.inc, !dbg !161

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !162
  %inc = add i64 %6, 1, !dbg !162
  store i64 %inc, i64* %i, align 8, !dbg !162
  br label %for.cond, !dbg !163, !llvm.loop !164

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !166
  store i32 0, i32* %arrayidx12, align 4, !dbg !167
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  call void @printWLine(i32* noundef %arraydecay13), !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_16_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!42 = !DILocation(line: 32, column: 5, scope: !11)
!43 = !DILocation(line: 35, column: 16, scope: !44)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!45 = !DILocation(line: 35, column: 14, scope: !44)
!46 = !DILocation(line: 36, column: 9, scope: !44)
!47 = !DILocalVariable(name: "i", scope: !48, file: !12, line: 39, type: !49)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!49 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !50, line: 31, baseType: !51)
!50 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !52)
!52 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!53 = !DILocation(line: 39, column: 16, scope: !48)
!54 = !DILocalVariable(name: "destLen", scope: !48, file: !12, line: 39, type: !49)
!55 = !DILocation(line: 39, column: 19, scope: !48)
!56 = !DILocalVariable(name: "dest", scope: !48, file: !12, line: 40, type: !30)
!57 = !DILocation(line: 40, column: 17, scope: !48)
!58 = !DILocation(line: 41, column: 17, scope: !48)
!59 = !DILocation(line: 41, column: 9, scope: !48)
!60 = !DILocation(line: 42, column: 9, scope: !48)
!61 = !DILocation(line: 42, column: 21, scope: !48)
!62 = !DILocation(line: 43, column: 26, scope: !48)
!63 = !DILocation(line: 43, column: 19, scope: !48)
!64 = !DILocation(line: 43, column: 17, scope: !48)
!65 = !DILocation(line: 46, column: 16, scope: !66)
!66 = distinct !DILexicalBlock(scope: !48, file: !12, line: 46, column: 9)
!67 = !DILocation(line: 46, column: 14, scope: !66)
!68 = !DILocation(line: 46, column: 21, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !12, line: 46, column: 9)
!70 = !DILocation(line: 46, column: 25, scope: !69)
!71 = !DILocation(line: 46, column: 23, scope: !69)
!72 = !DILocation(line: 46, column: 9, scope: !66)
!73 = !DILocation(line: 48, column: 23, scope: !74)
!74 = distinct !DILexicalBlock(scope: !69, file: !12, line: 47, column: 9)
!75 = !DILocation(line: 48, column: 28, scope: !74)
!76 = !DILocation(line: 48, column: 18, scope: !74)
!77 = !DILocation(line: 48, column: 13, scope: !74)
!78 = !DILocation(line: 48, column: 21, scope: !74)
!79 = !DILocation(line: 49, column: 9, scope: !74)
!80 = !DILocation(line: 46, column: 35, scope: !69)
!81 = !DILocation(line: 46, column: 9, scope: !69)
!82 = distinct !{!82, !72, !83, !84}
!83 = !DILocation(line: 49, column: 9, scope: !66)
!84 = !{!"llvm.loop.mustprogress"}
!85 = !DILocation(line: 50, column: 9, scope: !48)
!86 = !DILocation(line: 50, column: 21, scope: !48)
!87 = !DILocation(line: 51, column: 20, scope: !48)
!88 = !DILocation(line: 51, column: 9, scope: !48)
!89 = !DILocation(line: 53, column: 1, scope: !11)
!90 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_16_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DILocation(line: 94, column: 5, scope: !90)
!92 = !DILocation(line: 95, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !94, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DISubroutineType(types: !95)
!95 = !{!22, !22, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !12, line: 107, type: !22)
!100 = !DILocation(line: 107, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !12, line: 107, type: !96)
!102 = !DILocation(line: 107, column: 27, scope: !93)
!103 = !DILocation(line: 110, column: 22, scope: !93)
!104 = !DILocation(line: 110, column: 12, scope: !93)
!105 = !DILocation(line: 110, column: 5, scope: !93)
!106 = !DILocation(line: 112, column: 5, scope: !93)
!107 = !DILocation(line: 113, column: 5, scope: !93)
!108 = !DILocation(line: 114, column: 5, scope: !93)
!109 = !DILocation(line: 117, column: 5, scope: !93)
!110 = !DILocation(line: 118, column: 5, scope: !93)
!111 = !DILocation(line: 119, column: 5, scope: !93)
!112 = !DILocation(line: 121, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!114 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 62, type: !17)
!115 = !DILocation(line: 62, column: 15, scope: !113)
!116 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !12, line: 63, type: !25)
!117 = !DILocation(line: 63, column: 13, scope: !113)
!118 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !12, line: 64, type: !30)
!119 = !DILocation(line: 64, column: 13, scope: !113)
!120 = !DILocation(line: 65, column: 13, scope: !113)
!121 = !DILocation(line: 65, column: 5, scope: !113)
!122 = !DILocation(line: 66, column: 5, scope: !113)
!123 = !DILocation(line: 66, column: 25, scope: !113)
!124 = !DILocation(line: 67, column: 13, scope: !113)
!125 = !DILocation(line: 67, column: 5, scope: !113)
!126 = !DILocation(line: 68, column: 5, scope: !113)
!127 = !DILocation(line: 68, column: 27, scope: !113)
!128 = !DILocation(line: 69, column: 5, scope: !113)
!129 = !DILocation(line: 72, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !113, file: !12, line: 70, column: 5)
!131 = !DILocation(line: 72, column: 14, scope: !130)
!132 = !DILocation(line: 73, column: 9, scope: !130)
!133 = !DILocalVariable(name: "i", scope: !134, file: !12, line: 76, type: !49)
!134 = distinct !DILexicalBlock(scope: !113, file: !12, line: 75, column: 5)
!135 = !DILocation(line: 76, column: 16, scope: !134)
!136 = !DILocalVariable(name: "destLen", scope: !134, file: !12, line: 76, type: !49)
!137 = !DILocation(line: 76, column: 19, scope: !134)
!138 = !DILocalVariable(name: "dest", scope: !134, file: !12, line: 77, type: !30)
!139 = !DILocation(line: 77, column: 17, scope: !134)
!140 = !DILocation(line: 78, column: 17, scope: !134)
!141 = !DILocation(line: 78, column: 9, scope: !134)
!142 = !DILocation(line: 79, column: 9, scope: !134)
!143 = !DILocation(line: 79, column: 21, scope: !134)
!144 = !DILocation(line: 80, column: 26, scope: !134)
!145 = !DILocation(line: 80, column: 19, scope: !134)
!146 = !DILocation(line: 80, column: 17, scope: !134)
!147 = !DILocation(line: 83, column: 16, scope: !148)
!148 = distinct !DILexicalBlock(scope: !134, file: !12, line: 83, column: 9)
!149 = !DILocation(line: 83, column: 14, scope: !148)
!150 = !DILocation(line: 83, column: 21, scope: !151)
!151 = distinct !DILexicalBlock(scope: !148, file: !12, line: 83, column: 9)
!152 = !DILocation(line: 83, column: 25, scope: !151)
!153 = !DILocation(line: 83, column: 23, scope: !151)
!154 = !DILocation(line: 83, column: 9, scope: !148)
!155 = !DILocation(line: 85, column: 23, scope: !156)
!156 = distinct !DILexicalBlock(scope: !151, file: !12, line: 84, column: 9)
!157 = !DILocation(line: 85, column: 28, scope: !156)
!158 = !DILocation(line: 85, column: 18, scope: !156)
!159 = !DILocation(line: 85, column: 13, scope: !156)
!160 = !DILocation(line: 85, column: 21, scope: !156)
!161 = !DILocation(line: 86, column: 9, scope: !156)
!162 = !DILocation(line: 83, column: 35, scope: !151)
!163 = !DILocation(line: 83, column: 9, scope: !151)
!164 = distinct !{!164, !154, !165, !84}
!165 = !DILocation(line: 86, column: 9, scope: !148)
!166 = !DILocation(line: 87, column: 9, scope: !134)
!167 = !DILocation(line: 87, column: 21, scope: !134)
!168 = !DILocation(line: 88, column: 20, scope: !134)
!169 = !DILocation(line: 88, column: 9, scope: !134)
!170 = !DILocation(line: 90, column: 1, scope: !113)
