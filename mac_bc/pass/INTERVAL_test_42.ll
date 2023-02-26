; ModuleID = 'mac_bc/pass/INTERVAL_test_42.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_42.c"
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
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* %i, align 4, !dbg !38
  %cmp = icmp sge i32 %0, 0, !dbg !40
  br i1 %cmp, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !42
  %call = call i32 @foo(i32 noundef %1), !dbg !44
  %2 = load i32, i32* @count, align 4, !dbg !45
  %3 = load i32, i32* %i, align 4, !dbg !46
  %add = add nsw i32 %3, 1, !dbg !47
  %cmp1 = icmp eq i32 %2, %add, !dbg !48
  call void @svf_assert(i1 noundef zeroext %cmp1), !dbg !49
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %4, !dbg !51
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
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_42.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/pass/INTERVAL_test_42.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "foo", scope: !5, file: !5, line: 10, type: !15, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !5, line: 10, type: !6)
!19 = !DILocation(line: 10, column: 13, scope: !14)
!20 = !DILocation(line: 11, column: 10, scope: !14)
!21 = !DILocation(line: 12, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !5, line: 12, column: 8)
!23 = !DILocation(line: 12, column: 10, scope: !22)
!24 = !DILocation(line: 12, column: 8, scope: !14)
!25 = !DILocation(line: 13, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !5, line: 12, column: 16)
!27 = !DILocation(line: 16, column: 20, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !5, line: 15, column: 10)
!29 = !DILocation(line: 16, column: 22, scope: !28)
!30 = !DILocation(line: 16, column: 16, scope: !28)
!31 = !DILocation(line: 16, column: 9, scope: !28)
!32 = !DILocation(line: 18, column: 1, scope: !14)
!33 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 20, type: !34, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!34 = !DISubroutineType(types: !35)
!35 = !{!6}
!36 = !DILocalVariable(name: "i", scope: !33, file: !5, line: 21, type: !6)
!37 = !DILocation(line: 21, column: 9, scope: !33)
!38 = !DILocation(line: 22, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !5, line: 22, column: 8)
!40 = !DILocation(line: 22, column: 10, scope: !39)
!41 = !DILocation(line: 22, column: 8, scope: !33)
!42 = !DILocation(line: 23, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !39, file: !5, line: 22, column: 16)
!44 = !DILocation(line: 23, column: 9, scope: !43)
!45 = !DILocation(line: 24, column: 20, scope: !43)
!46 = !DILocation(line: 24, column: 29, scope: !43)
!47 = !DILocation(line: 24, column: 31, scope: !43)
!48 = !DILocation(line: 24, column: 26, scope: !43)
!49 = !DILocation(line: 24, column: 9, scope: !43)
!50 = !DILocation(line: 25, column: 5, scope: !43)
!51 = !DILocation(line: 26, column: 1, scope: !33)
