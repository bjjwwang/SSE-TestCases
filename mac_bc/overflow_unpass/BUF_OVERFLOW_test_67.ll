; ModuleID = 'mac_bc/overflow_unpass/BUF_OVERFLOW_test_67.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_67.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@count = global i32 0, align 4, !dbg !0
@result = global i32 0, align 4, !dbg !5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo(i32 noundef %limit) #0 !dbg !16 {
entry:
  %limit.addr = alloca i32, align 4
  store i32 %limit, i32* %limit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %limit.addr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* @count, align 4, !dbg !22
  %1 = load i32, i32* %limit.addr, align 4, !dbg !24
  %cmp = icmp slt i32 %0, %1, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @count, align 4, !dbg !27
  %add = add nsw i32 %2, 1, !dbg !29
  store i32 %add, i32* @result, align 4, !dbg !30
  %3 = load i32, i32* @count, align 4, !dbg !31
  %inc = add nsw i32 %3, 1, !dbg !31
  store i32 %inc, i32* @count, align 4, !dbg !31
  %4 = load i32, i32* %limit.addr, align 4, !dbg !32
  call void @bar(i32 noundef %4), !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @bar(i32 noundef %limit) #0 !dbg !36 {
entry:
  %limit.addr = alloca i32, align 4
  store i32 %limit, i32* %limit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %limit.addr, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* @count, align 4, !dbg !39
  %1 = load i32, i32* %limit.addr, align 4, !dbg !41
  %cmp = icmp slt i32 %0, %1, !dbg !42
  br i1 %cmp, label %if.then, label %if.end, !dbg !43

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @count, align 4, !dbg !44
  %sub = sub nsw i32 %2, 1, !dbg !46
  store i32 %sub, i32* @result, align 4, !dbg !47
  %3 = load i32, i32* @count, align 4, !dbg !48
  %inc = add nsw i32 %3, 1, !dbg !48
  store i32 %inc, i32* @count, align 4, !dbg !48
  %4 = load i32, i32* %limit.addr, align 4, !dbg !49
  call void @foo(i32 noundef %4), !dbg !50
  br label %if.end, !dbg !51

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %limit = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !56, metadata !DIExpression()), !dbg !60
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !61
  call void @srand(i32 noundef %call), !dbg !62
  call void @llvm.dbg.declare(metadata i32* %limit, metadata !63, metadata !DIExpression()), !dbg !64
  %call1 = call i32 @rand(), !dbg !65
  %rem = srem i32 %call1, 11, !dbg !66
  %sub = sub nsw i32 %rem, 5, !dbg !67
  store i32 %sub, i32* %limit, align 4, !dbg !64
  %0 = load i32, i32* %limit, align 4, !dbg !68
  %cmp = icmp sgt i32 %0, 0, !dbg !70
  br i1 %cmp, label %if.then, label %if.else7, !dbg !71

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %limit, align 4, !dbg !72
  call void @foo(i32 noundef %1), !dbg !74
  %2 = load i32, i32* %limit, align 4, !dbg !75
  %rem2 = srem i32 %2, 2, !dbg !77
  %cmp3 = icmp eq i32 %rem2, 1, !dbg !78
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !79

if.then4:                                         ; preds = %if.then
  %3 = load i32, i32* @result, align 4, !dbg !80
  %idxprom = sext i32 %3 to i64, !dbg !82
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !82
  store i32 1, i32* %arrayidx, align 4, !dbg !83
  br label %if.end, !dbg !84

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* @result, align 4, !dbg !85
  %idxprom5 = sext i32 %4 to i64, !dbg !87
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !87
  store i32 1, i32* %arrayidx6, align 4, !dbg !88
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  br label %if.end10, !dbg !89

if.else7:                                         ; preds = %entry
  %5 = load i32, i32* @result, align 4, !dbg !90
  %idxprom8 = sext i32 %5 to i64, !dbg !92
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !92
  store i32 1, i32* %arrayidx9, align 4, !dbg !93
  br label %if.end10

if.end10:                                         ; preds = %if.else7, %if.end
  %6 = load i32, i32* %retval, align 4, !dbg !94
  ret i32 %6, !dbg !94
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !7, line: 7, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_67.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0, !5}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !7, line: 8, type: !8, isLocal: false, isDefinition: true)
!7 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_67.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"PIC Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"Homebrew clang version 14.0.6"}
!16 = distinct !DISubprogram(name: "foo", scope: !7, file: !7, line: 13, type: !17, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !8}
!19 = !{}
!20 = !DILocalVariable(name: "limit", arg: 1, scope: !16, file: !7, line: 13, type: !8)
!21 = !DILocation(line: 13, column: 14, scope: !16)
!22 = !DILocation(line: 14, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !16, file: !7, line: 14, column: 8)
!24 = !DILocation(line: 14, column: 16, scope: !23)
!25 = !DILocation(line: 14, column: 14, scope: !23)
!26 = !DILocation(line: 14, column: 8, scope: !16)
!27 = !DILocation(line: 15, column: 18, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !7, line: 14, column: 23)
!29 = !DILocation(line: 15, column: 24, scope: !28)
!30 = !DILocation(line: 15, column: 16, scope: !28)
!31 = !DILocation(line: 16, column: 14, scope: !28)
!32 = !DILocation(line: 17, column: 13, scope: !28)
!33 = !DILocation(line: 17, column: 9, scope: !28)
!34 = !DILocation(line: 18, column: 5, scope: !28)
!35 = !DILocation(line: 19, column: 5, scope: !16)
!36 = distinct !DISubprogram(name: "bar", scope: !7, file: !7, line: 22, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!37 = !DILocalVariable(name: "limit", arg: 1, scope: !36, file: !7, line: 22, type: !8)
!38 = !DILocation(line: 22, column: 14, scope: !36)
!39 = !DILocation(line: 23, column: 8, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !7, line: 23, column: 8)
!41 = !DILocation(line: 23, column: 16, scope: !40)
!42 = !DILocation(line: 23, column: 14, scope: !40)
!43 = !DILocation(line: 23, column: 8, scope: !36)
!44 = !DILocation(line: 24, column: 18, scope: !45)
!45 = distinct !DILexicalBlock(scope: !40, file: !7, line: 23, column: 23)
!46 = !DILocation(line: 24, column: 24, scope: !45)
!47 = !DILocation(line: 24, column: 16, scope: !45)
!48 = !DILocation(line: 25, column: 14, scope: !45)
!49 = !DILocation(line: 26, column: 13, scope: !45)
!50 = !DILocation(line: 26, column: 9, scope: !45)
!51 = !DILocation(line: 27, column: 5, scope: !45)
!52 = !DILocation(line: 28, column: 5, scope: !36)
!53 = distinct !DISubprogram(name: "main", scope: !7, file: !7, line: 31, type: !54, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !19)
!54 = !DISubroutineType(types: !55)
!55 = !{!8}
!56 = !DILocalVariable(name: "buffer", scope: !53, file: !7, line: 32, type: !57)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 160, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 5)
!60 = !DILocation(line: 32, column: 6, scope: !53)
!61 = !DILocation(line: 33, column: 8, scope: !53)
!62 = !DILocation(line: 33, column: 2, scope: !53)
!63 = !DILocalVariable(name: "limit", scope: !53, file: !7, line: 34, type: !8)
!64 = !DILocation(line: 34, column: 9, scope: !53)
!65 = !DILocation(line: 34, column: 18, scope: !53)
!66 = !DILocation(line: 34, column: 25, scope: !53)
!67 = !DILocation(line: 34, column: 31, scope: !53)
!68 = !DILocation(line: 36, column: 8, scope: !69)
!69 = distinct !DILexicalBlock(scope: !53, file: !7, line: 36, column: 8)
!70 = !DILocation(line: 36, column: 14, scope: !69)
!71 = !DILocation(line: 36, column: 8, scope: !53)
!72 = !DILocation(line: 37, column: 13, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !7, line: 36, column: 19)
!74 = !DILocation(line: 37, column: 9, scope: !73)
!75 = !DILocation(line: 38, column: 12, scope: !76)
!76 = distinct !DILexicalBlock(scope: !73, file: !7, line: 38, column: 12)
!77 = !DILocation(line: 38, column: 18, scope: !76)
!78 = !DILocation(line: 38, column: 22, scope: !76)
!79 = !DILocation(line: 38, column: 12, scope: !73)
!80 = !DILocation(line: 40, column: 11, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !7, line: 38, column: 28)
!82 = !DILocation(line: 40, column: 4, scope: !81)
!83 = !DILocation(line: 40, column: 19, scope: !81)
!84 = !DILocation(line: 41, column: 9, scope: !81)
!85 = !DILocation(line: 44, column: 11, scope: !86)
!86 = distinct !DILexicalBlock(scope: !76, file: !7, line: 42, column: 14)
!87 = !DILocation(line: 44, column: 4, scope: !86)
!88 = !DILocation(line: 44, column: 19, scope: !86)
!89 = !DILocation(line: 46, column: 5, scope: !73)
!90 = !DILocation(line: 49, column: 10, scope: !91)
!91 = distinct !DILexicalBlock(scope: !69, file: !7, line: 47, column: 10)
!92 = !DILocation(line: 49, column: 3, scope: !91)
!93 = !DILocation(line: 49, column: 18, scope: !91)
!94 = !DILocation(line: 51, column: 1, scope: !53)
