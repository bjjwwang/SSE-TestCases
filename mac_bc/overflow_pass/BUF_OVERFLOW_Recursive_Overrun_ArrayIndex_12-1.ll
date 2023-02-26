; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_12-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_12-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@count = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @power(i32 noundef %a, i32 noundef %b) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32, i32* @count, align 4, !dbg !22
  %inc = add nsw i32 %0, 1, !dbg !22
  store i32 %inc, i32* @count, align 4, !dbg !22
  %1 = load i32, i32* %b.addr, align 4, !dbg !23
  %cmp = icmp slt i32 %1, 0, !dbg !25
  br i1 %cmp, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %b.addr, align 4, !dbg !29
  %cmp1 = icmp eq i32 %2, 0, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !32

if.then2:                                         ; preds = %if.else
  store i32 1, i32* %retval, align 4, !dbg !33
  br label %return, !dbg !33

if.else3:                                         ; preds = %if.else
  %3 = load i32, i32* %a.addr, align 4, !dbg !35
  %4 = load i32, i32* %a.addr, align 4, !dbg !37
  %5 = load i32, i32* %b.addr, align 4, !dbg !38
  %sub = sub nsw i32 %5, 1, !dbg !39
  %call = call i32 @power(i32 noundef %4, i32 noundef %sub), !dbg !40
  %mul = mul nsw i32 %3, %call, !dbg !41
  store i32 %mul, i32* %retval, align 4, !dbg !42
  br label %return, !dbg !42

return:                                           ; preds = %if.else3, %if.then2, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !43
  ret i32 %6, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !47, metadata !DIExpression()), !dbg !51
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !52
  call void @srand(i32 noundef %call), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %a, metadata !54, metadata !DIExpression()), !dbg !55
  %call1 = call i32 @rand(), !dbg !56
  %rem = srem i32 %call1, 20, !dbg !57
  %sub = sub nsw i32 %rem, 10, !dbg !58
  store i32 %sub, i32* %a, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %b, metadata !59, metadata !DIExpression()), !dbg !60
  %call2 = call i32 @rand(), !dbg !61
  %rem3 = srem i32 %call2, 20, !dbg !62
  %sub4 = sub nsw i32 %rem3, 10, !dbg !63
  store i32 %sub4, i32* %b, align 4, !dbg !60
  %0 = load i32, i32* %a, align 4, !dbg !64
  %1 = load i32, i32* %b, align 4, !dbg !65
  %call5 = call i32 @power(i32 noundef %0, i32 noundef %1), !dbg !66
  %2 = load i32, i32* %b, align 4, !dbg !67
  %cmp = icmp sgt i32 %2, 0, !dbg !69
  br i1 %cmp, label %if.then, label %if.else, !dbg !70

if.then:                                          ; preds = %entry
  %3 = load i32, i32* @count, align 4, !dbg !71
  %idxprom = sext i32 %3 to i64, !dbg !73
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !73
  store i32 1, i32* %arrayidx, align 4, !dbg !74
  br label %if.end, !dbg !75

if.else:                                          ; preds = %entry
  %4 = load i32, i32* @count, align 4, !dbg !76
  %idxprom6 = sext i32 %4 to i64, !dbg !78
  %arrayidx7 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !78
  store i32 1, i32* %arrayidx7, align 4, !dbg !79
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !80
  ret i32 %5, !dbg !80
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_12-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "power", scope: !5, file: !5, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "a", arg: 1, scope: !14, file: !5, line: 9, type: !6)
!19 = !DILocation(line: 9, column: 15, scope: !14)
!20 = !DILocalVariable(name: "b", arg: 2, scope: !14, file: !5, line: 9, type: !6)
!21 = !DILocation(line: 9, column: 22, scope: !14)
!22 = !DILocation(line: 10, column: 10, scope: !14)
!23 = !DILocation(line: 11, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !5, line: 11, column: 8)
!25 = !DILocation(line: 11, column: 10, scope: !24)
!26 = !DILocation(line: 11, column: 8, scope: !14)
!27 = !DILocation(line: 12, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !5, line: 11, column: 15)
!29 = !DILocation(line: 14, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !24, file: !5, line: 14, column: 13)
!31 = !DILocation(line: 14, column: 15, scope: !30)
!32 = !DILocation(line: 14, column: 13, scope: !24)
!33 = !DILocation(line: 15, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !5, line: 14, column: 21)
!35 = !DILocation(line: 18, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !5, line: 17, column: 10)
!37 = !DILocation(line: 18, column: 26, scope: !36)
!38 = !DILocation(line: 18, column: 29, scope: !36)
!39 = !DILocation(line: 18, column: 31, scope: !36)
!40 = !DILocation(line: 18, column: 20, scope: !36)
!41 = !DILocation(line: 18, column: 18, scope: !36)
!42 = !DILocation(line: 18, column: 9, scope: !36)
!43 = !DILocation(line: 20, column: 1, scope: !14)
!44 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 22, type: !45, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!45 = !DISubroutineType(types: !46)
!46 = !{!6}
!47 = !DILocalVariable(name: "buffer", scope: !44, file: !5, line: 23, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 5)
!51 = !DILocation(line: 23, column: 6, scope: !44)
!52 = !DILocation(line: 24, column: 11, scope: !44)
!53 = !DILocation(line: 24, column: 5, scope: !44)
!54 = !DILocalVariable(name: "a", scope: !44, file: !5, line: 25, type: !6)
!55 = !DILocation(line: 25, column: 6, scope: !44)
!56 = !DILocation(line: 25, column: 11, scope: !44)
!57 = !DILocation(line: 25, column: 18, scope: !44)
!58 = !DILocation(line: 25, column: 24, scope: !44)
!59 = !DILocalVariable(name: "b", scope: !44, file: !5, line: 26, type: !6)
!60 = !DILocation(line: 26, column: 9, scope: !44)
!61 = !DILocation(line: 26, column: 14, scope: !44)
!62 = !DILocation(line: 26, column: 21, scope: !44)
!63 = !DILocation(line: 26, column: 27, scope: !44)
!64 = !DILocation(line: 27, column: 11, scope: !44)
!65 = !DILocation(line: 27, column: 14, scope: !44)
!66 = !DILocation(line: 27, column: 5, scope: !44)
!67 = !DILocation(line: 28, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !44, file: !5, line: 28, column: 8)
!69 = !DILocation(line: 28, column: 10, scope: !68)
!70 = !DILocation(line: 28, column: 8, scope: !44)
!71 = !DILocation(line: 30, column: 10, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !5, line: 28, column: 15)
!73 = !DILocation(line: 30, column: 3, scope: !72)
!74 = !DILocation(line: 30, column: 17, scope: !72)
!75 = !DILocation(line: 31, column: 5, scope: !72)
!76 = !DILocation(line: 34, column: 10, scope: !77)
!77 = distinct !DILexicalBlock(scope: !68, file: !5, line: 32, column: 10)
!78 = !DILocation(line: 34, column: 3, scope: !77)
!79 = !DILocation(line: 34, column: 17, scope: !77)
!80 = !DILocation(line: 36, column: 1, scope: !44)
