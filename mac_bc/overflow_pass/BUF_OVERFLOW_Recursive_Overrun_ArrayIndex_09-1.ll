; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_09-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_09-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@count = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @sum(i32 noundef %i) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* @count, align 4, !dbg !20
  %inc = add nsw i32 %0, 1, !dbg !20
  store i32 %inc, i32* @count, align 4, !dbg !20
  %1 = load i32, i32* %i.addr, align 4, !dbg !21
  %cmp = icmp ne i32 %1, 0, !dbg !23
  br i1 %cmp, label %if.then, label %if.else, !dbg !24

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %i.addr, align 4, !dbg !25
  %3 = load i32, i32* %i.addr, align 4, !dbg !27
  %sub = sub nsw i32 %3, 1, !dbg !28
  %call = call i32 @sum(i32 noundef %sub), !dbg !29
  %add = add nsw i32 %2, %call, !dbg !30
  store i32 %add, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %i.addr, align 4, !dbg !32
  store i32 %4, i32* %retval, align 4, !dbg !34
  br label %return, !dbg !34

return:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !35
  ret i32 %5, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !36 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 4, i32* %i, align 4, !dbg !45
  %0 = load i32, i32* %i, align 4, !dbg !46
  %cmp = icmp sge i32 %0, 0, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !50
  %call = call i32 @sum(i32 noundef %1), !dbg !52
  %2 = load i32, i32* @count, align 4, !dbg !53
  %idxprom = sext i32 %2 to i64, !dbg !54
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !54
  store i32 1, i32* %arrayidx, align 4, !dbg !55
  br label %if.end, !dbg !56

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %retval, align 4, !dbg !57
  ret i32 %3, !dbg !57
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_09-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "sum", scope: !5, file: !5, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !5, line: 9, type: !6)
!19 = !DILocation(line: 9, column: 13, scope: !14)
!20 = !DILocation(line: 10, column: 10, scope: !14)
!21 = !DILocation(line: 11, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !5, line: 11, column: 9)
!23 = !DILocation(line: 11, column: 11, scope: !22)
!24 = !DILocation(line: 11, column: 9, scope: !14)
!25 = !DILocation(line: 12, column: 16, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !5, line: 11, column: 17)
!27 = !DILocation(line: 12, column: 24, scope: !26)
!28 = !DILocation(line: 12, column: 26, scope: !26)
!29 = !DILocation(line: 12, column: 20, scope: !26)
!30 = !DILocation(line: 12, column: 18, scope: !26)
!31 = !DILocation(line: 12, column: 9, scope: !26)
!32 = !DILocation(line: 15, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !22, file: !5, line: 14, column: 10)
!34 = !DILocation(line: 15, column: 9, scope: !33)
!35 = !DILocation(line: 17, column: 1, scope: !14)
!36 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 19, type: !37, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!37 = !DISubroutineType(types: !38)
!38 = !{!6}
!39 = !DILocalVariable(name: "buffer", scope: !36, file: !5, line: 20, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 5)
!43 = !DILocation(line: 20, column: 6, scope: !36)
!44 = !DILocalVariable(name: "i", scope: !36, file: !5, line: 21, type: !6)
!45 = !DILocation(line: 21, column: 9, scope: !36)
!46 = !DILocation(line: 22, column: 8, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !5, line: 22, column: 8)
!48 = !DILocation(line: 22, column: 10, scope: !47)
!49 = !DILocation(line: 22, column: 8, scope: !36)
!50 = !DILocation(line: 23, column: 13, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !5, line: 22, column: 16)
!52 = !DILocation(line: 23, column: 9, scope: !51)
!53 = !DILocation(line: 25, column: 10, scope: !51)
!54 = !DILocation(line: 25, column: 3, scope: !51)
!55 = !DILocation(line: 25, column: 17, scope: !51)
!56 = !DILocation(line: 26, column: 5, scope: !51)
!57 = !DILocation(line: 27, column: 1, scope: !36)
