; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_01_bad() #0 !dbg !11 {
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
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i32* %arraydecay4, i32** %data, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64* %i, metadata !44, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !51, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !53, metadata !DIExpression()), !dbg !54
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !55
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !56
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !57
  store i32 0, i32* %arrayidx7, align 4, !dbg !58
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !60
  store i64 %call9, i64* %destLen, align 8, !dbg !61
  store i64 0, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !65
  %1 = load i64, i64* %destLen, align 8, !dbg !67
  %cmp = icmp ult i64 %0, %1, !dbg !68
  br i1 %cmp, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !70
  %3 = load i64, i64* %i, align 8, !dbg !72
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !70
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !70
  %5 = load i64, i64* %i, align 8, !dbg !73
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !74
  store i32 %4, i32* %arrayidx11, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !77
  %inc = add i64 %6, 1, !dbg !77
  store i64 %inc, i64* %i, align 8, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !82
  store i32 0, i32* %arrayidx12, align 4, !dbg !83
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !84
  call void @printWLine(i32* noundef %arraydecay13), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_declare_loop_01_good() #0 !dbg !87 {
entry:
  call void @goodG2B(), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !90 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !96, metadata !DIExpression()), !dbg !97
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !98, metadata !DIExpression()), !dbg !99
  %call = call i64 @time(i64* noundef null), !dbg !100
  %conv = trunc i64 %call to i32, !dbg !101
  call void @srand(i32 noundef %conv), !dbg !102
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !103
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_01_good(), !dbg !104
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !106
  call void @CWE126_Buffer_Overread__wchar_t_declare_loop_01_bad(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !108
  ret i32 0, !dbg !109
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !110 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !111, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !113, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !117
  %call = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 65, i64 noundef 49), !dbg !118
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !119
  store i32 0, i32* %arrayidx, align 4, !dbg !120
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !121
  %call2 = call i32* @wmemset(i32* noundef %arraydecay1, i32 noundef 65, i64 noundef 99), !dbg !122
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !123
  store i32 0, i32* %arrayidx3, align 4, !dbg !124
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !125
  store i32* %arraydecay4, i32** %data, align 8, !dbg !126
  call void @llvm.dbg.declare(metadata i64* %i, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !130, metadata !DIExpression()), !dbg !131
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !132, metadata !DIExpression()), !dbg !133
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  %call6 = call i32* @wmemset(i32* noundef %arraydecay5, i32 noundef 67, i64 noundef 99), !dbg !135
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !136
  store i32 0, i32* %arrayidx7, align 4, !dbg !137
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !138
  %call9 = call i64 @wcslen(i32* noundef %arraydecay8), !dbg !139
  store i64 %call9, i64* %destLen, align 8, !dbg !140
  store i64 0, i64* %i, align 8, !dbg !141
  br label %for.cond, !dbg !143

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !144
  %1 = load i64, i64* %destLen, align 8, !dbg !146
  %cmp = icmp ult i64 %0, %1, !dbg !147
  br i1 %cmp, label %for.body, label %for.end, !dbg !148

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %data, align 8, !dbg !149
  %3 = load i64, i64* %i, align 8, !dbg !151
  %arrayidx10 = getelementptr inbounds i32, i32* %2, i64 %3, !dbg !149
  %4 = load i32, i32* %arrayidx10, align 4, !dbg !149
  %5 = load i64, i64* %i, align 8, !dbg !152
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %5, !dbg !153
  store i32 %4, i32* %arrayidx11, align 4, !dbg !154
  br label %for.inc, !dbg !155

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !156
  %inc = add i64 %6, 1, !dbg !156
  store i64 %inc, i64* %i, align 8, !dbg !156
  br label %for.cond, !dbg !157, !llvm.loop !158

for.end:                                          ; preds = %for.cond
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx12, align 4, !dbg !161
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !162
  call void @printWLine(i32* noundef %arraydecay13), !dbg !163
  ret void, !dbg !164
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_01_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_declare_loop_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!44 = !DILocalVariable(name: "i", scope: !45, file: !12, line: 35, type: !46)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !47, line: 31, baseType: !48)
!47 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !21, line: 94, baseType: !49)
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 35, column: 16, scope: !45)
!51 = !DILocalVariable(name: "destLen", scope: !45, file: !12, line: 35, type: !46)
!52 = !DILocation(line: 35, column: 19, scope: !45)
!53 = !DILocalVariable(name: "dest", scope: !45, file: !12, line: 36, type: !30)
!54 = !DILocation(line: 36, column: 17, scope: !45)
!55 = !DILocation(line: 37, column: 17, scope: !45)
!56 = !DILocation(line: 37, column: 9, scope: !45)
!57 = !DILocation(line: 38, column: 9, scope: !45)
!58 = !DILocation(line: 38, column: 21, scope: !45)
!59 = !DILocation(line: 39, column: 26, scope: !45)
!60 = !DILocation(line: 39, column: 19, scope: !45)
!61 = !DILocation(line: 39, column: 17, scope: !45)
!62 = !DILocation(line: 42, column: 16, scope: !63)
!63 = distinct !DILexicalBlock(scope: !45, file: !12, line: 42, column: 9)
!64 = !DILocation(line: 42, column: 14, scope: !63)
!65 = !DILocation(line: 42, column: 21, scope: !66)
!66 = distinct !DILexicalBlock(scope: !63, file: !12, line: 42, column: 9)
!67 = !DILocation(line: 42, column: 25, scope: !66)
!68 = !DILocation(line: 42, column: 23, scope: !66)
!69 = !DILocation(line: 42, column: 9, scope: !63)
!70 = !DILocation(line: 44, column: 23, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !12, line: 43, column: 9)
!72 = !DILocation(line: 44, column: 28, scope: !71)
!73 = !DILocation(line: 44, column: 18, scope: !71)
!74 = !DILocation(line: 44, column: 13, scope: !71)
!75 = !DILocation(line: 44, column: 21, scope: !71)
!76 = !DILocation(line: 45, column: 9, scope: !71)
!77 = !DILocation(line: 42, column: 35, scope: !66)
!78 = !DILocation(line: 42, column: 9, scope: !66)
!79 = distinct !{!79, !69, !80, !81}
!80 = !DILocation(line: 45, column: 9, scope: !63)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 46, column: 9, scope: !45)
!83 = !DILocation(line: 46, column: 21, scope: !45)
!84 = !DILocation(line: 47, column: 20, scope: !45)
!85 = !DILocation(line: 47, column: 9, scope: !45)
!86 = !DILocation(line: 49, column: 1, scope: !11)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_loop_01_good", scope: !12, file: !12, line: 84, type: !13, scopeLine: 85, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!88 = !DILocation(line: 86, column: 5, scope: !87)
!89 = !DILocation(line: 87, column: 1, scope: !87)
!90 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 99, type: !91, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DISubroutineType(types: !92)
!92 = !{!22, !22, !93}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!96 = !DILocalVariable(name: "argc", arg: 1, scope: !90, file: !12, line: 99, type: !22)
!97 = !DILocation(line: 99, column: 14, scope: !90)
!98 = !DILocalVariable(name: "argv", arg: 2, scope: !90, file: !12, line: 99, type: !93)
!99 = !DILocation(line: 99, column: 27, scope: !90)
!100 = !DILocation(line: 102, column: 22, scope: !90)
!101 = !DILocation(line: 102, column: 12, scope: !90)
!102 = !DILocation(line: 102, column: 5, scope: !90)
!103 = !DILocation(line: 104, column: 5, scope: !90)
!104 = !DILocation(line: 105, column: 5, scope: !90)
!105 = !DILocation(line: 106, column: 5, scope: !90)
!106 = !DILocation(line: 109, column: 5, scope: !90)
!107 = !DILocation(line: 110, column: 5, scope: !90)
!108 = !DILocation(line: 111, column: 5, scope: !90)
!109 = !DILocation(line: 113, column: 5, scope: !90)
!110 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 56, type: !13, scopeLine: 57, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!111 = !DILocalVariable(name: "data", scope: !110, file: !12, line: 58, type: !17)
!112 = !DILocation(line: 58, column: 15, scope: !110)
!113 = !DILocalVariable(name: "dataBadBuffer", scope: !110, file: !12, line: 59, type: !25)
!114 = !DILocation(line: 59, column: 13, scope: !110)
!115 = !DILocalVariable(name: "dataGoodBuffer", scope: !110, file: !12, line: 60, type: !30)
!116 = !DILocation(line: 60, column: 13, scope: !110)
!117 = !DILocation(line: 61, column: 13, scope: !110)
!118 = !DILocation(line: 61, column: 5, scope: !110)
!119 = !DILocation(line: 62, column: 5, scope: !110)
!120 = !DILocation(line: 62, column: 25, scope: !110)
!121 = !DILocation(line: 63, column: 13, scope: !110)
!122 = !DILocation(line: 63, column: 5, scope: !110)
!123 = !DILocation(line: 64, column: 5, scope: !110)
!124 = !DILocation(line: 64, column: 27, scope: !110)
!125 = !DILocation(line: 66, column: 12, scope: !110)
!126 = !DILocation(line: 66, column: 10, scope: !110)
!127 = !DILocalVariable(name: "i", scope: !128, file: !12, line: 68, type: !46)
!128 = distinct !DILexicalBlock(scope: !110, file: !12, line: 67, column: 5)
!129 = !DILocation(line: 68, column: 16, scope: !128)
!130 = !DILocalVariable(name: "destLen", scope: !128, file: !12, line: 68, type: !46)
!131 = !DILocation(line: 68, column: 19, scope: !128)
!132 = !DILocalVariable(name: "dest", scope: !128, file: !12, line: 69, type: !30)
!133 = !DILocation(line: 69, column: 17, scope: !128)
!134 = !DILocation(line: 70, column: 17, scope: !128)
!135 = !DILocation(line: 70, column: 9, scope: !128)
!136 = !DILocation(line: 71, column: 9, scope: !128)
!137 = !DILocation(line: 71, column: 21, scope: !128)
!138 = !DILocation(line: 72, column: 26, scope: !128)
!139 = !DILocation(line: 72, column: 19, scope: !128)
!140 = !DILocation(line: 72, column: 17, scope: !128)
!141 = !DILocation(line: 75, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !128, file: !12, line: 75, column: 9)
!143 = !DILocation(line: 75, column: 14, scope: !142)
!144 = !DILocation(line: 75, column: 21, scope: !145)
!145 = distinct !DILexicalBlock(scope: !142, file: !12, line: 75, column: 9)
!146 = !DILocation(line: 75, column: 25, scope: !145)
!147 = !DILocation(line: 75, column: 23, scope: !145)
!148 = !DILocation(line: 75, column: 9, scope: !142)
!149 = !DILocation(line: 77, column: 23, scope: !150)
!150 = distinct !DILexicalBlock(scope: !145, file: !12, line: 76, column: 9)
!151 = !DILocation(line: 77, column: 28, scope: !150)
!152 = !DILocation(line: 77, column: 18, scope: !150)
!153 = !DILocation(line: 77, column: 13, scope: !150)
!154 = !DILocation(line: 77, column: 21, scope: !150)
!155 = !DILocation(line: 78, column: 9, scope: !150)
!156 = !DILocation(line: 75, column: 35, scope: !145)
!157 = !DILocation(line: 75, column: 9, scope: !145)
!158 = distinct !{!158, !148, !159, !81}
!159 = !DILocation(line: 78, column: 9, scope: !142)
!160 = !DILocation(line: 79, column: 9, scope: !128)
!161 = !DILocation(line: 79, column: 21, scope: !128)
!162 = !DILocation(line: 80, column: 20, scope: !128)
!163 = !DILocation(line: 80, column: 9, scope: !128)
!164 = !DILocation(line: 82, column: 1, scope: !110)
