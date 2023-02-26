; ModuleID = 'mac_bc/pass/INTERVAL_test_41.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_41.c"
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
  %call = call i32 @bar(i32 noundef %2), !dbg !29
  store i32 %call, i32* %retval, align 4, !dbg !30
  br label %return, !dbg !30

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !31
  ret i32 %3, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @bar(i32 noundef %i) #0 !dbg !32 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !33, metadata !DIExpression()), !dbg !34
  %0 = load i32, i32* %i.addr, align 4, !dbg !35
  %sub = sub nsw i32 %0, 1, !dbg !36
  %call = call i32 @foo(i32 noundef %sub), !dbg !37
  ret i32 %call, !dbg !38
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* %i, align 4, !dbg !44
  %cmp = icmp sge i32 %0, 0, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !48
  %call = call i32 @foo(i32 noundef %1), !dbg !50
  %2 = load i32, i32* @count, align 4, !dbg !51
  %3 = load i32, i32* %i, align 4, !dbg !52
  %add = add nsw i32 %3, 1, !dbg !53
  %cmp1 = icmp eq i32 %2, %add, !dbg !54
  call void @svf_assert(i1 noundef zeroext %cmp1), !dbg !55
  br label %if.end, !dbg !56

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !57
  ret i32 %4, !dbg !57
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
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_41.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/pass/INTERVAL_test_41.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "foo", scope: !5, file: !5, line: 11, type: !15, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !5, line: 11, type: !6)
!19 = !DILocation(line: 11, column: 13, scope: !14)
!20 = !DILocation(line: 12, column: 10, scope: !14)
!21 = !DILocation(line: 13, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !5, line: 13, column: 8)
!23 = !DILocation(line: 13, column: 10, scope: !22)
!24 = !DILocation(line: 13, column: 8, scope: !14)
!25 = !DILocation(line: 14, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !5, line: 13, column: 16)
!27 = !DILocation(line: 17, column: 20, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !5, line: 16, column: 10)
!29 = !DILocation(line: 17, column: 16, scope: !28)
!30 = !DILocation(line: 17, column: 9, scope: !28)
!31 = !DILocation(line: 19, column: 1, scope: !14)
!32 = distinct !DISubprogram(name: "bar", scope: !5, file: !5, line: 21, type: !15, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!33 = !DILocalVariable(name: "i", arg: 1, scope: !32, file: !5, line: 21, type: !6)
!34 = !DILocation(line: 21, column: 13, scope: !32)
!35 = !DILocation(line: 22, column: 16, scope: !32)
!36 = !DILocation(line: 22, column: 18, scope: !32)
!37 = !DILocation(line: 22, column: 12, scope: !32)
!38 = !DILocation(line: 22, column: 5, scope: !32)
!39 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 25, type: !40, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!40 = !DISubroutineType(types: !41)
!41 = !{!6}
!42 = !DILocalVariable(name: "i", scope: !39, file: !5, line: 26, type: !6)
!43 = !DILocation(line: 26, column: 9, scope: !39)
!44 = !DILocation(line: 27, column: 8, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !5, line: 27, column: 8)
!46 = !DILocation(line: 27, column: 10, scope: !45)
!47 = !DILocation(line: 27, column: 8, scope: !39)
!48 = !DILocation(line: 28, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !5, line: 27, column: 16)
!50 = !DILocation(line: 28, column: 9, scope: !49)
!51 = !DILocation(line: 29, column: 20, scope: !49)
!52 = !DILocation(line: 29, column: 29, scope: !49)
!53 = !DILocation(line: 29, column: 31, scope: !49)
!54 = !DILocation(line: 29, column: 26, scope: !49)
!55 = !DILocation(line: 29, column: 9, scope: !49)
!56 = !DILocation(line: 30, column: 5, scope: !49)
!57 = !DILocation(line: 31, column: 1, scope: !39)
