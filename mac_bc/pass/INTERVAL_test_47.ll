; ModuleID = 'mac_bc/pass/INTERVAL_test_47.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_47.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@count = global i32 0, align 4, !dbg !0

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
  br i1 %cmp, label %if.then, label %if.else, !dbg !40

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
  br label %if.end15, !dbg !52

if.end:                                           ; preds = %lor.lhs.false
  %13 = load i8*, i8** %word.addr, align 8, !dbg !54
  %14 = load i32, i32* %index.addr, align 4, !dbg !55
  %add13 = add nsw i32 %14, 1, !dbg !56
  %call14 = call zeroext i1 @isPalindrome(i8* noundef %13, i32 noundef %add13), !dbg !57
  br label %if.end15, !dbg !58

if.else:                                          ; preds = %entry
  store i1 false, i1* %retval, align 1, !dbg !59
  br label %if.end15, !dbg !59

if.end15:                                         ; preds = %if.else, %if.end, %if.then12
  %15 = load i1, i1* %retval, align 1, !dbg !61
  ret i1 %15, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i64 @strlen(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %word = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %word, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i8*, i8** %word, align 8, !dbg !67
  %call = call i64 @strlen(i8* noundef %0), !dbg !69
  %cmp = icmp ugt i64 %call, 0, !dbg !70
  br i1 %cmp, label %if.then, label %if.end13, !dbg !71

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %word, align 8, !dbg !72
  %call1 = call zeroext i1 @isPalindrome(i8* noundef %1, i32 noundef 0), !dbg !74
  %2 = load i8*, i8** %word, align 8, !dbg !75
  %call2 = call i64 @strlen(i8* noundef %2), !dbg !77
  %rem = urem i64 %call2, 2, !dbg !78
  %cmp3 = icmp eq i64 %rem, 0, !dbg !79
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !80

if.then4:                                         ; preds = %if.then
  %3 = load i32, i32* @count, align 4, !dbg !81
  %conv = sext i32 %3 to i64, !dbg !81
  %4 = load i8*, i8** %word, align 8, !dbg !83
  %call5 = call i64 @strlen(i8* noundef %4), !dbg !84
  %div = udiv i64 %call5, 2, !dbg !85
  %cmp6 = icmp eq i64 %conv, %div, !dbg !86
  call void @svf_assert(i1 noundef zeroext %cmp6), !dbg !87
  br label %if.end, !dbg !88

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* @count, align 4, !dbg !89
  %conv8 = sext i32 %5 to i64, !dbg !89
  %6 = load i8*, i8** %word, align 8, !dbg !91
  %call9 = call i64 @strlen(i8* noundef %6), !dbg !92
  %add = add i64 %call9, 1, !dbg !93
  %div10 = udiv i64 %add, 2, !dbg !94
  %cmp11 = icmp eq i64 %conv8, %div10, !dbg !95
  call void @svf_assert(i1 noundef zeroext %cmp11), !dbg !96
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  br label %if.end13, !dbg !97

if.end13:                                         ; preds = %if.end, %entry
  %7 = load i32, i32* %retval, align 4, !dbg !98
  ret i32 %7, !dbg !98
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !5, line: 8, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_47.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/pass/INTERVAL_test_47.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "isPalindrome", scope: !5, file: !5, line: 10, type: !15, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!15 = !DISubroutineType(types: !16)
!16 = !{!17, !18, !6}
!17 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !{}
!21 = !DILocalVariable(name: "word", arg: 1, scope: !14, file: !5, line: 10, type: !18)
!22 = !DILocation(line: 10, column: 25, scope: !14)
!23 = !DILocalVariable(name: "index", arg: 2, scope: !14, file: !5, line: 10, type: !6)
!24 = !DILocation(line: 10, column: 35, scope: !14)
!25 = !DILocation(line: 11, column: 10, scope: !14)
!26 = !DILocalVariable(name: "length", scope: !14, file: !5, line: 12, type: !6)
!27 = !DILocation(line: 12, column: 9, scope: !14)
!28 = !DILocation(line: 12, column: 25, scope: !14)
!29 = !DILocation(line: 12, column: 18, scope: !14)
!30 = !DILocation(line: 12, column: 34, scope: !14)
!31 = !DILocation(line: 12, column: 40, scope: !14)
!32 = !DILocation(line: 12, column: 33, scope: !14)
!33 = !DILocation(line: 12, column: 31, scope: !14)
!34 = !DILocation(line: 13, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !14, file: !5, line: 13, column: 9)
!36 = !DILocation(line: 13, column: 14, scope: !35)
!37 = !DILocation(line: 13, column: 24, scope: !35)
!38 = !DILocation(line: 13, column: 29, scope: !35)
!39 = !DILocation(line: 13, column: 21, scope: !35)
!40 = !DILocation(line: 13, column: 9, scope: !14)
!41 = !DILocation(line: 14, column: 13, scope: !42)
!42 = distinct !DILexicalBlock(scope: !43, file: !5, line: 14, column: 13)
!43 = distinct !DILexicalBlock(scope: !35, file: !5, line: 13, column: 38)
!44 = !DILocation(line: 14, column: 19, scope: !42)
!45 = !DILocation(line: 14, column: 26, scope: !42)
!46 = !DILocation(line: 14, column: 23, scope: !42)
!47 = !DILocation(line: 14, column: 33, scope: !42)
!48 = !DILocation(line: 14, column: 36, scope: !42)
!49 = !DILocation(line: 14, column: 45, scope: !42)
!50 = !DILocation(line: 14, column: 42, scope: !42)
!51 = !DILocation(line: 14, column: 13, scope: !43)
!52 = !DILocation(line: 15, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !42, file: !5, line: 14, column: 53)
!54 = !DILocation(line: 17, column: 22, scope: !43)
!55 = !DILocation(line: 17, column: 28, scope: !43)
!56 = !DILocation(line: 17, column: 34, scope: !43)
!57 = !DILocation(line: 17, column: 9, scope: !43)
!58 = !DILocation(line: 18, column: 5, scope: !43)
!59 = !DILocation(line: 20, column: 9, scope: !60)
!60 = distinct !DILexicalBlock(scope: !35, file: !5, line: 19, column: 10)
!61 = !DILocation(line: 22, column: 1, scope: !14)
!62 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 24, type: !63, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !20)
!63 = !DISubroutineType(types: !64)
!64 = !{!6}
!65 = !DILocalVariable(name: "word", scope: !62, file: !5, line: 25, type: !18)
!66 = !DILocation(line: 25, column: 11, scope: !62)
!67 = !DILocation(line: 26, column: 15, scope: !68)
!68 = distinct !DILexicalBlock(scope: !62, file: !5, line: 26, column: 8)
!69 = !DILocation(line: 26, column: 8, scope: !68)
!70 = !DILocation(line: 26, column: 21, scope: !68)
!71 = !DILocation(line: 26, column: 8, scope: !62)
!72 = !DILocation(line: 27, column: 22, scope: !73)
!73 = distinct !DILexicalBlock(scope: !68, file: !5, line: 26, column: 26)
!74 = !DILocation(line: 27, column: 9, scope: !73)
!75 = !DILocation(line: 28, column: 19, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !5, line: 28, column: 12)
!77 = !DILocation(line: 28, column: 12, scope: !76)
!78 = !DILocation(line: 28, column: 25, scope: !76)
!79 = !DILocation(line: 28, column: 29, scope: !76)
!80 = !DILocation(line: 28, column: 12, scope: !73)
!81 = !DILocation(line: 29, column: 24, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !5, line: 28, column: 35)
!83 = !DILocation(line: 29, column: 40, scope: !82)
!84 = !DILocation(line: 29, column: 33, scope: !82)
!85 = !DILocation(line: 29, column: 45, scope: !82)
!86 = !DILocation(line: 29, column: 30, scope: !82)
!87 = !DILocation(line: 29, column: 13, scope: !82)
!88 = !DILocation(line: 30, column: 9, scope: !82)
!89 = !DILocation(line: 32, column: 24, scope: !90)
!90 = distinct !DILexicalBlock(scope: !76, file: !5, line: 31, column: 14)
!91 = !DILocation(line: 32, column: 41, scope: !90)
!92 = !DILocation(line: 32, column: 34, scope: !90)
!93 = !DILocation(line: 32, column: 47, scope: !90)
!94 = !DILocation(line: 32, column: 51, scope: !90)
!95 = !DILocation(line: 32, column: 30, scope: !90)
!96 = !DILocation(line: 32, column: 13, scope: !90)
!97 = !DILocation(line: 34, column: 5, scope: !73)
!98 = !DILocation(line: 35, column: 1, scope: !62)
