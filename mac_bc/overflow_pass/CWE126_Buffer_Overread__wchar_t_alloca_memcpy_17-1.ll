; ModuleID = 'mac_bc/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_bad() #0 !dbg !17 {
entry:
  %i = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32** %data, metadata !24, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = alloca i8, i64 200, align 16, !dbg !28
  %1 = bitcast i8* %0 to i32*, !dbg !29
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !30, metadata !DIExpression()), !dbg !31
  %2 = alloca i8, i64 400, align 16, !dbg !32
  %3 = bitcast i8* %2 to i32*, !dbg !33
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !31
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !34
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !35
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !36
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !38
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !39
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !40
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !40
  store i32 0, i32* %arrayidx2, align 4, !dbg !41
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !44

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %i, align 4, !dbg !45
  %cmp = icmp slt i32 %8, 1, !dbg !47
  br i1 %cmp, label %for.body, label %for.end, !dbg !48

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %dataBadBuffer, align 8, !dbg !49
  store i32* %9, i32** %data, align 8, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !dbg !53
  %inc = add nsw i32 %10, 1, !dbg !53
  store i32 %inc, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !58, metadata !DIExpression()), !dbg !63
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !65
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !66
  store i32 0, i32* %arrayidx4, align 4, !dbg !67
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  %11 = bitcast i32* %arraydecay5 to i8*, !dbg !68
  %12 = load i32*, i32** %data, align 8, !dbg !68
  %13 = bitcast i32* %12 to i8*, !dbg !68
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !68
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !68
  %mul = mul i64 %call7, 4, !dbg !68
  %call8 = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %13, i64 noundef %mul, i64 noundef 400) #4, !dbg !68
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx9, align 4, !dbg !70
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  call void @printWLine(i32* noundef %arraydecay10), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @wmemset(i32* noundef, i32 noundef, i64 noundef) #2

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

declare i64 @wcslen(i32* noundef) #2

declare void @printWLine(i32* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_good() #0 !dbg !74 {
entry:
  call void @goodG2B(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* noundef null), !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 noundef %conv), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_good(), !dbg !91
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_bad(), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !97 {
entry:
  %h = alloca i32, align 4
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata i32** %data, metadata !100, metadata !DIExpression()), !dbg !101
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !102, metadata !DIExpression()), !dbg !103
  %0 = alloca i8, i64 200, align 16, !dbg !104
  %1 = bitcast i8* %0 to i32*, !dbg !105
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !103
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !106, metadata !DIExpression()), !dbg !107
  %2 = alloca i8, i64 400, align 16, !dbg !108
  %3 = bitcast i8* %2 to i32*, !dbg !109
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !107
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !110
  %call = call i32* @wmemset(i32* noundef %4, i32 noundef 65, i64 noundef 49), !dbg !111
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !113
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !114
  %call1 = call i32* @wmemset(i32* noundef %6, i32 noundef 65, i64 noundef 99), !dbg !115
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !116
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !116
  store i32 0, i32* %arrayidx2, align 4, !dbg !117
  store i32 0, i32* %h, align 4, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %h, align 4, !dbg !121
  %cmp = icmp slt i32 %8, 1, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !125
  store i32* %9, i32** %data, align 8, !dbg !127
  br label %for.inc, !dbg !128

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %h, align 4, !dbg !129
  %inc = add nsw i32 %10, 1, !dbg !129
  store i32 %inc, i32* %h, align 4, !dbg !129
  br label %for.cond, !dbg !130, !llvm.loop !131

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !133, metadata !DIExpression()), !dbg !135
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !136
  %call3 = call i32* @wmemset(i32* noundef %arraydecay, i32 noundef 67, i64 noundef 99), !dbg !137
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !138
  store i32 0, i32* %arrayidx4, align 4, !dbg !139
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %11 = bitcast i32* %arraydecay5 to i8*, !dbg !140
  %12 = load i32*, i32** %data, align 8, !dbg !140
  %13 = bitcast i32* %12 to i8*, !dbg !140
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !140
  %call7 = call i64 @wcslen(i32* noundef %arraydecay6), !dbg !140
  %mul = mul i64 %call7, 4, !dbg !140
  %call8 = call i8* @__memcpy_chk(i8* noundef %11, i8* noundef %13, i64 noundef %mul, i64 noundef 400) #4, !dbg !140
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !141
  store i32 0, i32* %arrayidx9, align 4, !dbg !142
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !143
  call void @printWLine(i32* noundef %arraydecay10), !dbg !144
  ret void, !dbg !145
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!17 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_bad", scope: !18, file: !18, line: 23, type: !19, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!18 = !DIFile(filename: "src/overflow_pass/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !{}
!22 = !DILocalVariable(name: "i", scope: !17, file: !18, line: 25, type: !8)
!23 = !DILocation(line: 25, column: 9, scope: !17)
!24 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !3)
!25 = !DILocation(line: 26, column: 15, scope: !17)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !17, file: !18, line: 27, type: !3)
!27 = !DILocation(line: 27, column: 15, scope: !17)
!28 = !DILocation(line: 27, column: 42, scope: !17)
!29 = !DILocation(line: 27, column: 31, scope: !17)
!30 = !DILocalVariable(name: "dataGoodBuffer", scope: !17, file: !18, line: 28, type: !3)
!31 = !DILocation(line: 28, column: 15, scope: !17)
!32 = !DILocation(line: 28, column: 43, scope: !17)
!33 = !DILocation(line: 28, column: 32, scope: !17)
!34 = !DILocation(line: 29, column: 13, scope: !17)
!35 = !DILocation(line: 29, column: 5, scope: !17)
!36 = !DILocation(line: 30, column: 5, scope: !17)
!37 = !DILocation(line: 30, column: 25, scope: !17)
!38 = !DILocation(line: 31, column: 13, scope: !17)
!39 = !DILocation(line: 31, column: 5, scope: !17)
!40 = !DILocation(line: 32, column: 5, scope: !17)
!41 = !DILocation(line: 32, column: 27, scope: !17)
!42 = !DILocation(line: 33, column: 11, scope: !43)
!43 = distinct !DILexicalBlock(scope: !17, file: !18, line: 33, column: 5)
!44 = !DILocation(line: 33, column: 9, scope: !43)
!45 = !DILocation(line: 33, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !43, file: !18, line: 33, column: 5)
!47 = !DILocation(line: 33, column: 18, scope: !46)
!48 = !DILocation(line: 33, column: 5, scope: !43)
!49 = !DILocation(line: 36, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !18, line: 34, column: 5)
!51 = !DILocation(line: 36, column: 14, scope: !50)
!52 = !DILocation(line: 37, column: 5, scope: !50)
!53 = !DILocation(line: 33, column: 24, scope: !46)
!54 = !DILocation(line: 33, column: 5, scope: !46)
!55 = distinct !{!55, !48, !56, !57}
!56 = !DILocation(line: 37, column: 5, scope: !43)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocalVariable(name: "dest", scope: !59, file: !18, line: 39, type: !60)
!59 = distinct !DILexicalBlock(scope: !17, file: !18, line: 38, column: 5)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 3200, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 100)
!63 = !DILocation(line: 39, column: 17, scope: !59)
!64 = !DILocation(line: 40, column: 17, scope: !59)
!65 = !DILocation(line: 40, column: 9, scope: !59)
!66 = !DILocation(line: 41, column: 9, scope: !59)
!67 = !DILocation(line: 41, column: 21, scope: !59)
!68 = !DILocation(line: 44, column: 9, scope: !59)
!69 = !DILocation(line: 45, column: 9, scope: !59)
!70 = !DILocation(line: 45, column: 21, scope: !59)
!71 = !DILocation(line: 46, column: 20, scope: !59)
!72 = !DILocation(line: 46, column: 9, scope: !59)
!73 = !DILocation(line: 48, column: 1, scope: !17)
!74 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_17_good", scope: !18, file: !18, line: 82, type: !19, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!75 = !DILocation(line: 84, column: 5, scope: !74)
!76 = !DILocation(line: 85, column: 1, scope: !74)
!77 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 97, type: !78, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !21)
!78 = !DISubroutineType(types: !79)
!79 = !{!8, !8, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !18, line: 97, type: !8)
!84 = !DILocation(line: 97, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !18, line: 97, type: !80)
!86 = !DILocation(line: 97, column: 27, scope: !77)
!87 = !DILocation(line: 100, column: 22, scope: !77)
!88 = !DILocation(line: 100, column: 12, scope: !77)
!89 = !DILocation(line: 100, column: 5, scope: !77)
!90 = !DILocation(line: 102, column: 5, scope: !77)
!91 = !DILocation(line: 103, column: 5, scope: !77)
!92 = !DILocation(line: 104, column: 5, scope: !77)
!93 = !DILocation(line: 107, column: 5, scope: !77)
!94 = !DILocation(line: 108, column: 5, scope: !77)
!95 = !DILocation(line: 109, column: 5, scope: !77)
!96 = !DILocation(line: 111, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 55, type: !19, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !21)
!98 = !DILocalVariable(name: "h", scope: !97, file: !18, line: 57, type: !8)
!99 = !DILocation(line: 57, column: 9, scope: !97)
!100 = !DILocalVariable(name: "data", scope: !97, file: !18, line: 58, type: !3)
!101 = !DILocation(line: 58, column: 15, scope: !97)
!102 = !DILocalVariable(name: "dataBadBuffer", scope: !97, file: !18, line: 59, type: !3)
!103 = !DILocation(line: 59, column: 15, scope: !97)
!104 = !DILocation(line: 59, column: 42, scope: !97)
!105 = !DILocation(line: 59, column: 31, scope: !97)
!106 = !DILocalVariable(name: "dataGoodBuffer", scope: !97, file: !18, line: 60, type: !3)
!107 = !DILocation(line: 60, column: 15, scope: !97)
!108 = !DILocation(line: 60, column: 43, scope: !97)
!109 = !DILocation(line: 60, column: 32, scope: !97)
!110 = !DILocation(line: 61, column: 13, scope: !97)
!111 = !DILocation(line: 61, column: 5, scope: !97)
!112 = !DILocation(line: 62, column: 5, scope: !97)
!113 = !DILocation(line: 62, column: 25, scope: !97)
!114 = !DILocation(line: 63, column: 13, scope: !97)
!115 = !DILocation(line: 63, column: 5, scope: !97)
!116 = !DILocation(line: 64, column: 5, scope: !97)
!117 = !DILocation(line: 64, column: 27, scope: !97)
!118 = !DILocation(line: 65, column: 11, scope: !119)
!119 = distinct !DILexicalBlock(scope: !97, file: !18, line: 65, column: 5)
!120 = !DILocation(line: 65, column: 9, scope: !119)
!121 = !DILocation(line: 65, column: 16, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !18, line: 65, column: 5)
!123 = !DILocation(line: 65, column: 18, scope: !122)
!124 = !DILocation(line: 65, column: 5, scope: !119)
!125 = !DILocation(line: 68, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !18, line: 66, column: 5)
!127 = !DILocation(line: 68, column: 14, scope: !126)
!128 = !DILocation(line: 69, column: 5, scope: !126)
!129 = !DILocation(line: 65, column: 24, scope: !122)
!130 = !DILocation(line: 65, column: 5, scope: !122)
!131 = distinct !{!131, !124, !132, !57}
!132 = !DILocation(line: 69, column: 5, scope: !119)
!133 = !DILocalVariable(name: "dest", scope: !134, file: !18, line: 71, type: !60)
!134 = distinct !DILexicalBlock(scope: !97, file: !18, line: 70, column: 5)
!135 = !DILocation(line: 71, column: 17, scope: !134)
!136 = !DILocation(line: 72, column: 17, scope: !134)
!137 = !DILocation(line: 72, column: 9, scope: !134)
!138 = !DILocation(line: 73, column: 9, scope: !134)
!139 = !DILocation(line: 73, column: 21, scope: !134)
!140 = !DILocation(line: 76, column: 9, scope: !134)
!141 = !DILocation(line: 77, column: 9, scope: !134)
!142 = !DILocation(line: 77, column: 21, scope: !134)
!143 = !DILocation(line: 78, column: 20, scope: !134)
!144 = !DILocation(line: 78, column: 9, scope: !134)
!145 = !DILocation(line: 80, column: 1, scope: !97)
