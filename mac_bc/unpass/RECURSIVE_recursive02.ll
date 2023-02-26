; ModuleID = 'mac_bc/unpass/RECURSIVE_recursive02.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/RECURSIVE_recursive02.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @funcA(i32 noundef %a) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %a.addr, align 4, !dbg !17
  %cmp = icmp sle i32 %0, 0, !dbg !19
  br i1 %cmp, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !21
  br label %return, !dbg !21

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4, !dbg !23
  %sub = sub nsw i32 %1, 1, !dbg !24
  %call = call i32 @funcB(i32 noundef %sub), !dbg !25
  %add = add nsw i32 %call, 1, !dbg !26
  store i32 %add, i32* %retval, align 4, !dbg !27
  br label %return, !dbg !27

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !28
  ret i32 %2, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @funcB(i32 noundef %b) #0 !dbg !29 {
entry:
  %retval = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = load i32, i32* %b.addr, align 4, !dbg !32
  %cmp = icmp sle i32 %0, 0, !dbg !34
  br i1 %cmp, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !36
  br label %return, !dbg !36

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %b.addr, align 4, !dbg !38
  %sub = sub nsw i32 %1, 1, !dbg !39
  %call = call i32 @funcA(i32 noundef %sub), !dbg !40
  %add = add nsw i32 %call, 1, !dbg !41
  store i32 %add, i32* %retval, align 4, !dbg !42
  br label %return, !dbg !42

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !43
  ret i32 %2, !dbg !43
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !44 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !47, metadata !DIExpression()), !dbg !48
  %call = call i32 @funcA(i32 noundef 3), !dbg !49
  store i32 %call, i32* %a, align 4, !dbg !48
  %0 = load i32, i32* %a, align 4, !dbg !50
  %cmp = icmp eq i32 %0, 3, !dbg !51
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !52
  ret i32 0, !dbg !53
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/RECURSIVE_recursive02.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "funcA", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/unpass/RECURSIVE_recursive02.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 15, scope: !9)
!17 = !DILocation(line: 5, column: 8, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 5, column: 8)
!19 = !DILocation(line: 5, column: 10, scope: !18)
!20 = !DILocation(line: 5, column: 8, scope: !9)
!21 = !DILocation(line: 6, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 5, column: 16)
!23 = !DILocation(line: 8, column: 17, scope: !9)
!24 = !DILocation(line: 8, column: 19, scope: !9)
!25 = !DILocation(line: 8, column: 11, scope: !9)
!26 = !DILocation(line: 8, column: 23, scope: !9)
!27 = !DILocation(line: 8, column: 4, scope: !9)
!28 = !DILocation(line: 9, column: 1, scope: !9)
!29 = distinct !DISubprogram(name: "funcB", scope: !10, file: !10, line: 10, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!30 = !DILocalVariable(name: "b", arg: 1, scope: !29, file: !10, line: 10, type: !13)
!31 = !DILocation(line: 10, column: 15, scope: !29)
!32 = !DILocation(line: 11, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 11, column: 9)
!34 = !DILocation(line: 11, column: 11, scope: !33)
!35 = !DILocation(line: 11, column: 9, scope: !29)
!36 = !DILocation(line: 12, column: 9, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 11, column: 17)
!38 = !DILocation(line: 14, column: 18, scope: !29)
!39 = !DILocation(line: 14, column: 19, scope: !29)
!40 = !DILocation(line: 14, column: 12, scope: !29)
!41 = !DILocation(line: 14, column: 23, scope: !29)
!42 = !DILocation(line: 14, column: 5, scope: !29)
!43 = !DILocation(line: 15, column: 1, scope: !29)
!44 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !45, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!45 = !DISubroutineType(types: !46)
!46 = !{!13}
!47 = !DILocalVariable(name: "a", scope: !44, file: !10, line: 18, type: !13)
!48 = !DILocation(line: 18, column: 9, scope: !44)
!49 = !DILocation(line: 18, column: 14, scope: !44)
!50 = !DILocation(line: 19, column: 16, scope: !44)
!51 = !DILocation(line: 19, column: 18, scope: !44)
!52 = !DILocation(line: 19, column: 5, scope: !44)
!53 = !DILocation(line: 20, column: 1, scope: !44)
