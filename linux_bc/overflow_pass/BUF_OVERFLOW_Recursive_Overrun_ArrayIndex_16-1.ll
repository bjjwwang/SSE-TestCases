; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_16-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_16-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = dso_local global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [8 x i8] c"racecar\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"abba\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local zeroext i1 @isPalindrome(i8* %word, i32 %index) #0 !dbg !14 {
entry:
  %retval = alloca i1, align 1
  %word.addr = alloca i8*, align 8
  %index.addr = alloca i32, align 4
  %length = alloca i32, align 4
  store i8* %word, i8** %word.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %word.addr, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 %index, i32* %index.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %index.addr, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i32, i32* @count, align 4, !dbg !24
  %inc = add nsw i32 %0, 1, !dbg !24
  store i32 %inc, i32* @count, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %length, metadata !25, metadata !DIExpression()), !dbg !26
  %1 = load i8*, i8** %word.addr, align 8, !dbg !27
  %call = call i64 @strlen(i8* %1) #3, !dbg !28
  %2 = load i32, i32* %index.addr, align 4, !dbg !29
  %add = add nsw i32 %2, 1, !dbg !30
  %conv = sext i32 %add to i64, !dbg !31
  %sub = sub i64 %call, %conv, !dbg !32
  %conv1 = trunc i64 %sub to i32, !dbg !28
  store i32 %conv1, i32* %length, align 4, !dbg !26
  %3 = load i8*, i8** %word.addr, align 8, !dbg !33
  %4 = load i32, i32* %index.addr, align 4, !dbg !35
  %idxprom = sext i32 %4 to i64, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !33
  %5 = load i8, i8* %arrayidx, align 1, !dbg !33
  %conv2 = sext i8 %5 to i32, !dbg !33
  %6 = load i8*, i8** %word.addr, align 8, !dbg !36
  %7 = load i32, i32* %length, align 4, !dbg !37
  %idxprom3 = sext i32 %7 to i64, !dbg !36
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i64 %idxprom3, !dbg !36
  %8 = load i8, i8* %arrayidx4, align 1, !dbg !36
  %conv5 = sext i8 %8 to i32, !dbg !36
  %cmp = icmp eq i32 %conv2, %conv5, !dbg !38
  br i1 %cmp, label %if.then, label %if.end15, !dbg !39

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %index.addr, align 4, !dbg !40
  %add7 = add nsw i32 %9, 1, !dbg !43
  %10 = load i32, i32* %length, align 4, !dbg !44
  %cmp8 = icmp eq i32 %add7, %10, !dbg !45
  br i1 %cmp8, label %if.then12, label %lor.lhs.false, !dbg !46

lor.lhs.false:                                    ; preds = %if.then
  %11 = load i32, i32* %index.addr, align 4, !dbg !47
  %12 = load i32, i32* %length, align 4, !dbg !48
  %cmp10 = icmp eq i32 %11, %12, !dbg !49
  br i1 %cmp10, label %if.then12, label %if.end, !dbg !50

if.then12:                                        ; preds = %lor.lhs.false, %if.then
  store i1 true, i1* %retval, align 1, !dbg !51
  br label %return, !dbg !51

if.end:                                           ; preds = %lor.lhs.false
  %13 = load i8*, i8** %word.addr, align 8, !dbg !53
  %14 = load i32, i32* %index.addr, align 4, !dbg !54
  %add13 = add nsw i32 %14, 1, !dbg !55
  %call14 = call zeroext i1 @isPalindrome(i8* %13, i32 %add13), !dbg !56
  br label %if.end15, !dbg !57

if.end15:                                         ; preds = %if.end, %entry
  store i1 false, i1* %retval, align 1, !dbg !58
  br label %return, !dbg !58

return:                                           ; preds = %if.end15, %if.then12
  %15 = load i1, i1* %retval, align 1, !dbg !59
  ret i1 %15, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !60 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [3 x i32], align 4
  %word1 = alloca i8*, align 8
  %word2 = alloca i8*, align 8
  %currentWord = alloca i8*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %buffer, metadata !63, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %word1, metadata !68, metadata !DIExpression()), !dbg !69
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i8** %word1, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %word2, metadata !70, metadata !DIExpression()), !dbg !71
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i8** %word2, align 8, !dbg !71
  call void @llvm.dbg.declare(metadata i8** %currentWord, metadata !72, metadata !DIExpression()), !dbg !73
  %0 = load i8*, i8** %word1, align 8, !dbg !74
  store i8* %0, i8** %currentWord, align 8, !dbg !73
  call void @llvm.dbg.declare(metadata i32* %i, metadata !75, metadata !DIExpression()), !dbg !77
  store i32 0, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !79
  %cmp = icmp slt i32 %1, 2, !dbg !81
  br i1 %cmp, label %for.body, label %for.end, !dbg !82

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %currentWord, align 8, !dbg !83
  %call = call zeroext i1 @isPalindrome(i8* %2, i32 0), !dbg !85
  %3 = load i8*, i8** %currentWord, align 8, !dbg !86
  %call1 = call i64 @strlen(i8* %3) #3, !dbg !88
  %rem = urem i64 %call1, 2, !dbg !89
  %cmp2 = icmp eq i64 %rem, 0, !dbg !90
  br i1 %cmp2, label %if.then, label %if.else, !dbg !91

if.then:                                          ; preds = %for.body
  %4 = load i32, i32* @count, align 4, !dbg !92
  %idxprom = sext i32 %4 to i64, !dbg !94
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !94
  store i32 1, i32* %arrayidx, align 4, !dbg !95
  br label %if.end, !dbg !96

if.else:                                          ; preds = %for.body
  %5 = load i32, i32* @count, align 4, !dbg !97
  %idxprom3 = sext i32 %5 to i64, !dbg !99
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !99
  store i32 1, i32* %arrayidx4, align 4, !dbg !100
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* @count, align 4, !dbg !101
  %6 = load i8*, i8** %word2, align 8, !dbg !102
  store i8* %6, i8** %currentWord, align 8, !dbg !103
  br label %for.inc, !dbg !104

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4, !dbg !105
  %inc = add nsw i32 %7, 1, !dbg !105
  store i32 %inc, i32* %i, align 4, !dbg !105
  br label %for.cond, !dbg !106, !llvm.loop !107

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %retval, align 4, !dbg !110
  ret i32 %8, !dbg !110
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !6, line: 7, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_16-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_16-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "isPalindrome", scope: !6, file: !6, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!17, !18, !7}
!17 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !DILocalVariable(name: "word", arg: 1, scope: !14, file: !6, line: 9, type: !18)
!21 = !DILocation(line: 9, column: 25, scope: !14)
!22 = !DILocalVariable(name: "index", arg: 2, scope: !14, file: !6, line: 9, type: !7)
!23 = !DILocation(line: 9, column: 35, scope: !14)
!24 = !DILocation(line: 10, column: 10, scope: !14)
!25 = !DILocalVariable(name: "length", scope: !14, file: !6, line: 11, type: !7)
!26 = !DILocation(line: 11, column: 9, scope: !14)
!27 = !DILocation(line: 11, column: 25, scope: !14)
!28 = !DILocation(line: 11, column: 18, scope: !14)
!29 = !DILocation(line: 11, column: 34, scope: !14)
!30 = !DILocation(line: 11, column: 40, scope: !14)
!31 = !DILocation(line: 11, column: 33, scope: !14)
!32 = !DILocation(line: 11, column: 31, scope: !14)
!33 = !DILocation(line: 12, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !14, file: !6, line: 12, column: 9)
!35 = !DILocation(line: 12, column: 14, scope: !34)
!36 = !DILocation(line: 12, column: 24, scope: !34)
!37 = !DILocation(line: 12, column: 29, scope: !34)
!38 = !DILocation(line: 12, column: 21, scope: !34)
!39 = !DILocation(line: 12, column: 9, scope: !14)
!40 = !DILocation(line: 13, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !6, line: 13, column: 13)
!42 = distinct !DILexicalBlock(scope: !34, file: !6, line: 12, column: 38)
!43 = !DILocation(line: 13, column: 19, scope: !41)
!44 = !DILocation(line: 13, column: 26, scope: !41)
!45 = !DILocation(line: 13, column: 23, scope: !41)
!46 = !DILocation(line: 13, column: 33, scope: !41)
!47 = !DILocation(line: 13, column: 36, scope: !41)
!48 = !DILocation(line: 13, column: 45, scope: !41)
!49 = !DILocation(line: 13, column: 42, scope: !41)
!50 = !DILocation(line: 13, column: 13, scope: !42)
!51 = !DILocation(line: 14, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !6, line: 13, column: 53)
!53 = !DILocation(line: 16, column: 22, scope: !42)
!54 = !DILocation(line: 16, column: 28, scope: !42)
!55 = !DILocation(line: 16, column: 34, scope: !42)
!56 = !DILocation(line: 16, column: 9, scope: !42)
!57 = !DILocation(line: 17, column: 5, scope: !42)
!58 = !DILocation(line: 18, column: 2, scope: !14)
!59 = !DILocation(line: 19, column: 1, scope: !14)
!60 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 21, type: !61, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!61 = !DISubroutineType(types: !62)
!62 = !{!7}
!63 = !DILocalVariable(name: "buffer", scope: !60, file: !6, line: 22, type: !64)
!64 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 96, elements: !65)
!65 = !{!66}
!66 = !DISubrange(count: 3)
!67 = !DILocation(line: 22, column: 6, scope: !60)
!68 = !DILocalVariable(name: "word1", scope: !60, file: !6, line: 23, type: !18)
!69 = !DILocation(line: 23, column: 11, scope: !60)
!70 = !DILocalVariable(name: "word2", scope: !60, file: !6, line: 24, type: !18)
!71 = !DILocation(line: 24, column: 8, scope: !60)
!72 = !DILocalVariable(name: "currentWord", scope: !60, file: !6, line: 25, type: !18)
!73 = !DILocation(line: 25, column: 8, scope: !60)
!74 = !DILocation(line: 25, column: 22, scope: !60)
!75 = !DILocalVariable(name: "i", scope: !76, file: !6, line: 26, type: !7)
!76 = distinct !DILexicalBlock(scope: !60, file: !6, line: 26, column: 2)
!77 = !DILocation(line: 26, column: 10, scope: !76)
!78 = !DILocation(line: 26, column: 6, scope: !76)
!79 = !DILocation(line: 26, column: 17, scope: !80)
!80 = distinct !DILexicalBlock(scope: !76, file: !6, line: 26, column: 2)
!81 = !DILocation(line: 26, column: 19, scope: !80)
!82 = !DILocation(line: 26, column: 2, scope: !76)
!83 = !DILocation(line: 27, column: 16, scope: !84)
!84 = distinct !DILexicalBlock(scope: !80, file: !6, line: 26, column: 29)
!85 = !DILocation(line: 27, column: 3, scope: !84)
!86 = !DILocation(line: 28, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !6, line: 28, column: 6)
!88 = !DILocation(line: 28, column: 6, scope: !87)
!89 = !DILocation(line: 28, column: 26, scope: !87)
!90 = !DILocation(line: 28, column: 30, scope: !87)
!91 = !DILocation(line: 28, column: 6, scope: !84)
!92 = !DILocation(line: 30, column: 11, scope: !93)
!93 = distinct !DILexicalBlock(scope: !87, file: !6, line: 28, column: 36)
!94 = !DILocation(line: 30, column: 4, scope: !93)
!95 = !DILocation(line: 30, column: 18, scope: !93)
!96 = !DILocation(line: 31, column: 3, scope: !93)
!97 = !DILocation(line: 34, column: 11, scope: !98)
!98 = distinct !DILexicalBlock(scope: !87, file: !6, line: 32, column: 8)
!99 = !DILocation(line: 34, column: 4, scope: !98)
!100 = !DILocation(line: 34, column: 18, scope: !98)
!101 = !DILocation(line: 36, column: 9, scope: !84)
!102 = !DILocation(line: 37, column: 17, scope: !84)
!103 = !DILocation(line: 37, column: 15, scope: !84)
!104 = !DILocation(line: 38, column: 2, scope: !84)
!105 = !DILocation(line: 26, column: 25, scope: !80)
!106 = !DILocation(line: 26, column: 2, scope: !80)
!107 = distinct !{!107, !82, !108, !109}
!108 = !DILocation(line: 38, column: 2, scope: !76)
!109 = !{!"llvm.loop.mustprogress"}
!110 = !DILocation(line: 39, column: 1, scope: !60)
