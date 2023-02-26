; ModuleID = 'mac_bc/overflow_unpass/BUF_OVERFLOW_test_63.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_63.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@count = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @foo(i32 noundef %i) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* @count, align 4, !dbg !20
  %inc = add nsw i32 %0, 1, !dbg !20
  store i32 %inc, i32* @count, align 4, !dbg !20
  %1 = load i32, i32* %i.addr, align 4, !dbg !21
  %cmp = icmp eq i32 %1, 0, !dbg !23
  br i1 %cmp, label %if.then, label %if.else, !dbg !24

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !25
  br label %return, !dbg !25

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %i.addr, align 4, !dbg !27
  %sub = sub nsw i32 %2, 1, !dbg !29
  %call = call i32 @foo(i32 noundef %sub), !dbg !30
  store i32 %call, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !32
  ret i32 %3, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !33 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 4, i32* %i, align 4, !dbg !42
  %0 = load i32, i32* %i, align 4, !dbg !43
  %cmp = icmp sge i32 %0, 0, !dbg !45
  br i1 %cmp, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !47
  %call = call i32 @foo(i32 noundef %1), !dbg !49
  %2 = load i32, i32* @count, align 4, !dbg !50
  %idxprom = sext i32 %2 to i64, !dbg !51
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !51
  store i32 1, i32* %arrayidx, align 4, !dbg !52
  br label %if.end, !dbg !53

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %retval, align 4, !dbg !54
  ret i32 %3, !dbg !54
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_63.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_63.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "foo", scope: !5, file: !5, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !5, line: 9, type: !6)
!19 = !DILocation(line: 9, column: 13, scope: !14)
!20 = !DILocation(line: 10, column: 10, scope: !14)
!21 = !DILocation(line: 11, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !5, line: 11, column: 8)
!23 = !DILocation(line: 11, column: 10, scope: !22)
!24 = !DILocation(line: 11, column: 8, scope: !14)
!25 = !DILocation(line: 12, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !5, line: 11, column: 16)
!27 = !DILocation(line: 15, column: 20, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !5, line: 14, column: 10)
!29 = !DILocation(line: 15, column: 22, scope: !28)
!30 = !DILocation(line: 15, column: 16, scope: !28)
!31 = !DILocation(line: 15, column: 9, scope: !28)
!32 = !DILocation(line: 17, column: 1, scope: !14)
!33 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 19, type: !34, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!34 = !DISubroutineType(types: !35)
!35 = !{!6}
!36 = !DILocalVariable(name: "buffer", scope: !33, file: !5, line: 20, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 5)
!40 = !DILocation(line: 20, column: 6, scope: !33)
!41 = !DILocalVariable(name: "i", scope: !33, file: !5, line: 21, type: !6)
!42 = !DILocation(line: 21, column: 9, scope: !33)
!43 = !DILocation(line: 22, column: 8, scope: !44)
!44 = distinct !DILexicalBlock(scope: !33, file: !5, line: 22, column: 8)
!45 = !DILocation(line: 22, column: 10, scope: !44)
!46 = !DILocation(line: 22, column: 8, scope: !33)
!47 = !DILocation(line: 23, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !5, line: 22, column: 16)
!49 = !DILocation(line: 23, column: 9, scope: !48)
!50 = !DILocation(line: 25, column: 10, scope: !48)
!51 = !DILocation(line: 25, column: 3, scope: !48)
!52 = !DILocation(line: 25, column: 17, scope: !48)
!53 = !DILocation(line: 26, column: 5, scope: !48)
!54 = !DILocation(line: 27, column: 1, scope: !33)
