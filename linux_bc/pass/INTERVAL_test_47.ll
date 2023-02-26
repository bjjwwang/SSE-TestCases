; ModuleID = 'linux_bc/pass/INTERVAL_test_47.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_47.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = dso_local global i32 0, align 4, !dbg !0

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
  %call = call i64 @strlen(i8* %1) #4, !dbg !28
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
  br i1 %cmp, label %if.then, label %if.else, !dbg !39

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
  br label %if.end15, !dbg !51

if.end:                                           ; preds = %lor.lhs.false
  %13 = load i8*, i8** %word.addr, align 8, !dbg !53
  %14 = load i32, i32* %index.addr, align 4, !dbg !54
  %add13 = add nsw i32 %14, 1, !dbg !55
  %call14 = call zeroext i1 @isPalindrome(i8* %13, i32 %add13), !dbg !56
  br label %if.end15, !dbg !57

if.else:                                          ; preds = %entry
  store i1 false, i1* %retval, align 1, !dbg !58
  br label %if.end15, !dbg !58

if.end15:                                         ; preds = %if.else, %if.end, %if.then12
  %15 = load i1, i1* %retval, align 1, !dbg !60
  ret i1 %15, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %word = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %word, metadata !64, metadata !DIExpression()), !dbg !65
  %0 = load i8*, i8** %word, align 8, !dbg !66
  %call = call i64 @strlen(i8* %0) #4, !dbg !68
  %cmp = icmp ugt i64 %call, 0, !dbg !69
  br i1 %cmp, label %if.then, label %if.end13, !dbg !70

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %word, align 8, !dbg !71
  %call1 = call zeroext i1 @isPalindrome(i8* %1, i32 0), !dbg !73
  %2 = load i8*, i8** %word, align 8, !dbg !74
  %call2 = call i64 @strlen(i8* %2) #4, !dbg !76
  %rem = urem i64 %call2, 2, !dbg !77
  %cmp3 = icmp eq i64 %rem, 0, !dbg !78
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !79

if.then4:                                         ; preds = %if.then
  %3 = load i32, i32* @count, align 4, !dbg !80
  %conv = sext i32 %3 to i64, !dbg !80
  %4 = load i8*, i8** %word, align 8, !dbg !82
  %call5 = call i64 @strlen(i8* %4) #4, !dbg !83
  %div = udiv i64 %call5, 2, !dbg !84
  %cmp6 = icmp eq i64 %conv, %div, !dbg !85
  call void @svf_assert(i1 zeroext %cmp6), !dbg !86
  br label %if.end, !dbg !87

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* @count, align 4, !dbg !88
  %conv8 = sext i32 %5 to i64, !dbg !88
  %6 = load i8*, i8** %word, align 8, !dbg !90
  %call9 = call i64 @strlen(i8* %6) #4, !dbg !91
  %add = add i64 %call9, 1, !dbg !92
  %div10 = udiv i64 %add, 2, !dbg !93
  %cmp11 = icmp eq i64 %conv8, %div10, !dbg !94
  call void @svf_assert(i1 zeroext %cmp11), !dbg !95
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  br label %if.end13, !dbg !96

if.end13:                                         ; preds = %if.end, %entry
  %7 = load i32, i32* %retval, align 4, !dbg !97
  ret i32 %7, !dbg !97
}

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_47.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/pass/INTERVAL_test_47.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "isPalindrome", scope: !6, file: !6, line: 10, type: !15, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!17, !18, !7}
!17 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!20 = !DILocalVariable(name: "word", arg: 1, scope: !14, file: !6, line: 10, type: !18)
!21 = !DILocation(line: 10, column: 25, scope: !14)
!22 = !DILocalVariable(name: "index", arg: 2, scope: !14, file: !6, line: 10, type: !7)
!23 = !DILocation(line: 10, column: 35, scope: !14)
!24 = !DILocation(line: 11, column: 10, scope: !14)
!25 = !DILocalVariable(name: "length", scope: !14, file: !6, line: 12, type: !7)
!26 = !DILocation(line: 12, column: 9, scope: !14)
!27 = !DILocation(line: 12, column: 25, scope: !14)
!28 = !DILocation(line: 12, column: 18, scope: !14)
!29 = !DILocation(line: 12, column: 34, scope: !14)
!30 = !DILocation(line: 12, column: 40, scope: !14)
!31 = !DILocation(line: 12, column: 33, scope: !14)
!32 = !DILocation(line: 12, column: 31, scope: !14)
!33 = !DILocation(line: 13, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !14, file: !6, line: 13, column: 9)
!35 = !DILocation(line: 13, column: 14, scope: !34)
!36 = !DILocation(line: 13, column: 24, scope: !34)
!37 = !DILocation(line: 13, column: 29, scope: !34)
!38 = !DILocation(line: 13, column: 21, scope: !34)
!39 = !DILocation(line: 13, column: 9, scope: !14)
!40 = !DILocation(line: 14, column: 13, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !6, line: 14, column: 13)
!42 = distinct !DILexicalBlock(scope: !34, file: !6, line: 13, column: 38)
!43 = !DILocation(line: 14, column: 19, scope: !41)
!44 = !DILocation(line: 14, column: 26, scope: !41)
!45 = !DILocation(line: 14, column: 23, scope: !41)
!46 = !DILocation(line: 14, column: 33, scope: !41)
!47 = !DILocation(line: 14, column: 36, scope: !41)
!48 = !DILocation(line: 14, column: 45, scope: !41)
!49 = !DILocation(line: 14, column: 42, scope: !41)
!50 = !DILocation(line: 14, column: 13, scope: !42)
!51 = !DILocation(line: 15, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !41, file: !6, line: 14, column: 53)
!53 = !DILocation(line: 17, column: 22, scope: !42)
!54 = !DILocation(line: 17, column: 28, scope: !42)
!55 = !DILocation(line: 17, column: 34, scope: !42)
!56 = !DILocation(line: 17, column: 9, scope: !42)
!57 = !DILocation(line: 18, column: 5, scope: !42)
!58 = !DILocation(line: 20, column: 9, scope: !59)
!59 = distinct !DILexicalBlock(scope: !34, file: !6, line: 19, column: 10)
!60 = !DILocation(line: 22, column: 1, scope: !14)
!61 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 24, type: !62, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DISubroutineType(types: !63)
!63 = !{!7}
!64 = !DILocalVariable(name: "word", scope: !61, file: !6, line: 25, type: !18)
!65 = !DILocation(line: 25, column: 11, scope: !61)
!66 = !DILocation(line: 26, column: 15, scope: !67)
!67 = distinct !DILexicalBlock(scope: !61, file: !6, line: 26, column: 8)
!68 = !DILocation(line: 26, column: 8, scope: !67)
!69 = !DILocation(line: 26, column: 21, scope: !67)
!70 = !DILocation(line: 26, column: 8, scope: !61)
!71 = !DILocation(line: 27, column: 22, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !6, line: 26, column: 26)
!73 = !DILocation(line: 27, column: 9, scope: !72)
!74 = !DILocation(line: 28, column: 19, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !6, line: 28, column: 12)
!76 = !DILocation(line: 28, column: 12, scope: !75)
!77 = !DILocation(line: 28, column: 25, scope: !75)
!78 = !DILocation(line: 28, column: 29, scope: !75)
!79 = !DILocation(line: 28, column: 12, scope: !72)
!80 = !DILocation(line: 29, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !6, line: 28, column: 35)
!82 = !DILocation(line: 29, column: 40, scope: !81)
!83 = !DILocation(line: 29, column: 33, scope: !81)
!84 = !DILocation(line: 29, column: 45, scope: !81)
!85 = !DILocation(line: 29, column: 30, scope: !81)
!86 = !DILocation(line: 29, column: 13, scope: !81)
!87 = !DILocation(line: 30, column: 9, scope: !81)
!88 = !DILocation(line: 32, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !75, file: !6, line: 31, column: 14)
!90 = !DILocation(line: 32, column: 41, scope: !89)
!91 = !DILocation(line: 32, column: 34, scope: !89)
!92 = !DILocation(line: 32, column: 47, scope: !89)
!93 = !DILocation(line: 32, column: 51, scope: !89)
!94 = !DILocation(line: 32, column: 30, scope: !89)
!95 = !DILocation(line: 32, column: 13, scope: !89)
!96 = !DILocation(line: 34, column: 5, scope: !72)
!97 = !DILocation(line: 35, column: 1, scope: !61)
