; ModuleID = 'mac_bc/overflow_unpass/BUF_OVERFLOW_test_68.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_68.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@count = global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [8 x i8] c"racecar\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"abba\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define zeroext i1 @isPalindrome(i8* noundef %word, i32 noundef %index) #0 !dbg !14 {
entry:
  %retval = alloca i1, align 1
  %word.addr = alloca i8*, align 8
  %index.addr = alloca i32, align 4
  %length = alloca i32, align 4
  store i8* %word, i8** %word.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %word.addr, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 %index, i32* %index.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %index.addr, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i32, i32* @count, align 4, !dbg !25
  %inc = add nsw i32 %0, 1, !dbg !25
  store i32 %inc, i32* @count, align 4, !dbg !25
  call void @llvm.dbg.declare(metadata i32* %length, metadata !26, metadata !DIExpression()), !dbg !27
  %1 = load i8*, i8** %word.addr, align 8, !dbg !28
  %call = call i64 @strlen(i8* noundef %1), !dbg !29
  %2 = load i32, i32* %index.addr, align 4, !dbg !30
  %add = add nsw i32 %2, 1, !dbg !31
  %conv = sext i32 %add to i64, !dbg !32
  %sub = sub i64 %call, %conv, !dbg !33
  %conv1 = trunc i64 %sub to i32, !dbg !29
  store i32 %conv1, i32* %length, align 4, !dbg !27
  %3 = load i8*, i8** %word.addr, align 8, !dbg !34
  %4 = load i32, i32* %index.addr, align 4, !dbg !36
  %idxprom = sext i32 %4 to i64, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !34
  %5 = load i8, i8* %arrayidx, align 1, !dbg !34
  %conv2 = sext i8 %5 to i32, !dbg !34
  %6 = load i8*, i8** %word.addr, align 8, !dbg !37
  %7 = load i32, i32* %length, align 4, !dbg !38
  %idxprom3 = sext i32 %7 to i64, !dbg !37
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %idxprom3, !dbg !37
  %8 = load i8, i8* %arrayidx4, align 1, !dbg !37
  %conv5 = sext i8 %8 to i32, !dbg !37
  %cmp = icmp eq i32 %conv2, %conv5, !dbg !39
  br i1 %cmp, label %if.then, label %if.end15, !dbg !40

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %index.addr, align 4, !dbg !41
  %add7 = add nsw i32 %9, 1, !dbg !44
  %10 = load i32, i32* %length, align 4, !dbg !45
  %cmp8 = icmp eq i32 %add7, %10, !dbg !46
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !47

lor.lhs.false:                                    ; preds = %if.then
  %11 = load i32, i32* %index.addr, align 4, !dbg !48
  %12 = load i32, i32* %length, align 4, !dbg !49
  %cmp10 = icmp eq i32 %11, %12, !dbg !50
  br i1 %cmp10, label %if.then12, label %if.end, !dbg !51

if.then12:                                        ; preds = %lor.lhs.false, %if.then
  store i1 true, i1* %retval, align 1, !dbg !52
  br label %return, !dbg !52

if.end:                                           ; preds = %lor.lhs.false
  %13 = load i8*, i8** %word.addr, align 8, !dbg !54
  %14 = load i32, i32* %index.addr, align 4, !dbg !55
  %add13 = add nsw i32 %14, 1, !dbg !56
  %call14 = call zeroext i1 @isPalindrome(i8* noundef %13, i32 noundef %add13), !dbg !57
  br label %if.end15, !dbg !58

if.end15:                                         ; preds = %if.end, %entry
  store i1 false, i1* %retval, align 1, !dbg !59
  br label %return, !dbg !59

return:                                           ; preds = %if.end15, %if.then12
  %15 = load i1, i1* %retval, align 1, !dbg !60
  ret i1 %15, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i64 @strlen(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [3 x i32], align 4
  %word1 = alloca i8*, align 8
  %word2 = alloca i8*, align 8
  %currentWord = alloca i8*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %buffer, metadata !64, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata i8** %word1, metadata !69, metadata !DIExpression()), !dbg !70
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8** %word1, align 8, !dbg !70
  call void @llvm.dbg.declare(metadata i8** %word2, metadata !71, metadata !DIExpression()), !dbg !72
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8** %word2, align 8, !dbg !72
  call void @llvm.dbg.declare(metadata i8** %currentWord, metadata !73, metadata !DIExpression()), !dbg !74
  %0 = load i8*, i8** %word1, align 8, !dbg !75
  store i8* %0, i8** %currentWord, align 8, !dbg !74
  call void @llvm.dbg.declare(metadata i32* %i, metadata !76, metadata !DIExpression()), !dbg !78
  store i32 0, i32* %i, align 4, !dbg !78
  br label %for.cond, !dbg !79

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !80
  %cmp = icmp slt i32 %1, 2, !dbg !82
  br i1 %cmp, label %for.body, label %for.end, !dbg !83

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %currentWord, align 8, !dbg !84
  %call = call zeroext i1 @isPalindrome(i8* noundef %2, i32 noundef 0), !dbg !86
  %3 = load i8*, i8** %currentWord, align 8, !dbg !87
  %call1 = call i64 @strlen(i8* noundef %3), !dbg !89
  %rem = urem i64 %call1, 2, !dbg !90
  %cmp2 = icmp eq i64 %rem, 0, !dbg !91
  br i1 %cmp2, label %if.then, label %if.else, !dbg !92

if.then:                                          ; preds = %for.body
  %4 = load i32, i32* @count, align 4, !dbg !93
  %idxprom = sext i32 %4 to i64, !dbg !95
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !95
  store i32 1, i32* %arrayidx, align 4, !dbg !96
  br label %if.end, !dbg !97

if.else:                                          ; preds = %for.body
  %5 = load i32, i32* @count, align 4, !dbg !98
  %idxprom3 = sext i32 %5 to i64, !dbg !100
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !100
  store i32 1, i32* %arrayidx4, align 4, !dbg !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* @count, align 4, !dbg !102
  %6 = load i8*, i8** %word2, align 8, !dbg !103
  store i8* %6, i8** %currentWord, align 8, !dbg !104
  br label %for.inc, !dbg !105

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4, !dbg !106
  %inc = add nsw i32 %7, 1, !dbg !106
  store i32 %inc, i32* %i, align 4, !dbg !106
  br label %for.cond, !dbg !107, !llvm.loop !108

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %retval, align 4, !dbg !111
  ret i32 %8, !dbg !111
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_68.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_68.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "isPalindrome", scope: !5, file: !5, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!15 = !DISubroutineType(types: !16)
!16 = !{!17, !18, !6}
!17 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{}
!21 = !DILocalVariable(name: "word", arg: 1, scope: !14, file: !5, line: 9, type: !18)
!22 = !DILocation(line: 9, column: 25, scope: !14)
!23 = !DILocalVariable(name: "index", arg: 2, scope: !14, file: !5, line: 9, type: !6)
!24 = !DILocation(line: 9, column: 35, scope: !14)
!25 = !DILocation(line: 10, column: 10, scope: !14)
!26 = !DILocalVariable(name: "length", scope: !14, file: !5, line: 11, type: !6)
!27 = !DILocation(line: 11, column: 9, scope: !14)
!28 = !DILocation(line: 11, column: 25, scope: !14)
!29 = !DILocation(line: 11, column: 18, scope: !14)
!30 = !DILocation(line: 11, column: 34, scope: !14)
!31 = !DILocation(line: 11, column: 40, scope: !14)
!32 = !DILocation(line: 11, column: 33, scope: !14)
!33 = !DILocation(line: 11, column: 31, scope: !14)
!34 = !DILocation(line: 12, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !14, file: !5, line: 12, column: 9)
!36 = !DILocation(line: 12, column: 14, scope: !35)
!37 = !DILocation(line: 12, column: 24, scope: !35)
!38 = !DILocation(line: 12, column: 29, scope: !35)
!39 = !DILocation(line: 12, column: 21, scope: !35)
!40 = !DILocation(line: 12, column: 9, scope: !14)
!41 = !DILocation(line: 13, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !43, file: !5, line: 13, column: 13)
!43 = distinct !DILexicalBlock(scope: !35, file: !5, line: 12, column: 38)
!44 = !DILocation(line: 13, column: 19, scope: !42)
!45 = !DILocation(line: 13, column: 26, scope: !42)
!46 = !DILocation(line: 13, column: 23, scope: !42)
!47 = !DILocation(line: 13, column: 33, scope: !42)
!48 = !DILocation(line: 13, column: 36, scope: !42)
!49 = !DILocation(line: 13, column: 45, scope: !42)
!50 = !DILocation(line: 13, column: 42, scope: !42)
!51 = !DILocation(line: 13, column: 13, scope: !43)
!52 = !DILocation(line: 14, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !42, file: !5, line: 13, column: 53)
!54 = !DILocation(line: 16, column: 22, scope: !43)
!55 = !DILocation(line: 16, column: 28, scope: !43)
!56 = !DILocation(line: 16, column: 34, scope: !43)
!57 = !DILocation(line: 16, column: 9, scope: !43)
!58 = !DILocation(line: 17, column: 5, scope: !43)
!59 = !DILocation(line: 18, column: 2, scope: !14)
!60 = !DILocation(line: 19, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 21, type: !62, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!62 = !DISubroutineType(types: !63)
!63 = !{!6}
!64 = !DILocalVariable(name: "buffer", scope: !61, file: !5, line: 22, type: !65)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 96, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 3)
!68 = !DILocation(line: 22, column: 6, scope: !61)
!69 = !DILocalVariable(name: "word1", scope: !61, file: !5, line: 23, type: !18)
!70 = !DILocation(line: 23, column: 11, scope: !61)
!71 = !DILocalVariable(name: "word2", scope: !61, file: !5, line: 24, type: !18)
!72 = !DILocation(line: 24, column: 8, scope: !61)
!73 = !DILocalVariable(name: "currentWord", scope: !61, file: !5, line: 25, type: !18)
!74 = !DILocation(line: 25, column: 8, scope: !61)
!75 = !DILocation(line: 25, column: 22, scope: !61)
!76 = !DILocalVariable(name: "i", scope: !77, file: !5, line: 26, type: !6)
!77 = distinct !DILexicalBlock(scope: !61, file: !5, line: 26, column: 2)
!78 = !DILocation(line: 26, column: 10, scope: !77)
!79 = !DILocation(line: 26, column: 6, scope: !77)
!80 = !DILocation(line: 26, column: 17, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !5, line: 26, column: 2)
!82 = !DILocation(line: 26, column: 19, scope: !81)
!83 = !DILocation(line: 26, column: 2, scope: !77)
!84 = !DILocation(line: 27, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !5, line: 26, column: 29)
!86 = !DILocation(line: 27, column: 3, scope: !85)
!87 = !DILocation(line: 28, column: 13, scope: !88)
!88 = distinct !DILexicalBlock(scope: !85, file: !5, line: 28, column: 6)
!89 = !DILocation(line: 28, column: 6, scope: !88)
!90 = !DILocation(line: 28, column: 26, scope: !88)
!91 = !DILocation(line: 28, column: 30, scope: !88)
!92 = !DILocation(line: 28, column: 6, scope: !85)
!93 = !DILocation(line: 30, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !5, line: 28, column: 36)
!95 = !DILocation(line: 30, column: 4, scope: !94)
!96 = !DILocation(line: 30, column: 18, scope: !94)
!97 = !DILocation(line: 31, column: 3, scope: !94)
!98 = !DILocation(line: 34, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !88, file: !5, line: 32, column: 8)
!100 = !DILocation(line: 34, column: 4, scope: !99)
!101 = !DILocation(line: 34, column: 18, scope: !99)
!102 = !DILocation(line: 36, column: 9, scope: !85)
!103 = !DILocation(line: 37, column: 17, scope: !85)
!104 = !DILocation(line: 37, column: 15, scope: !85)
!105 = !DILocation(line: 38, column: 2, scope: !85)
!106 = !DILocation(line: 26, column: 25, scope: !81)
!107 = !DILocation(line: 26, column: 2, scope: !81)
!108 = distinct !{!108, !83, !109, !110}
!109 = !DILocation(line: 38, column: 2, scope: !77)
!110 = !{!"llvm.loop.mustprogress"}
!111 = !DILocation(line: 39, column: 1, scope: !61)
