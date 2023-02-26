; ModuleID = 'mac_bc/pass/INTERVAL_test_52.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_52.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @digitCount(i32 noundef %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %counter, align 4, !dbg !18
  br label %while.body, !dbg !19

while.body:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %i.addr, align 4, !dbg !20
  %div = sdiv i32 %0, 10, !dbg !22
  store i32 %div, i32* %i.addr, align 4, !dbg !23
  %1 = load i32, i32* %counter, align 4, !dbg !24
  %inc = add nsw i32 %1, 1, !dbg !24
  store i32 %inc, i32* %counter, align 4, !dbg !24
  %2 = load i32, i32* %i.addr, align 4, !dbg !25
  %cmp = icmp eq i32 %2, 0, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %while.body
  br label %while.end, !dbg !29

if.end:                                           ; preds = %while.body
  br label %while.body, !dbg !19, !llvm.loop !31

while.end:                                        ; preds = %if.then
  %3 = load i32, i32* %counter, align 4, !dbg !33
  ret i32 %3, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !38
  call void @srand(i32 noundef %call), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !40, metadata !DIExpression()), !dbg !41
  %call1 = call i32 @rand(), !dbg !42
  %rem = srem i32 %call1, 999, !dbg !43
  store i32 %rem, i32* %randomNumber, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* %randomNumber, align 4, !dbg !46
  %call2 = call i32 @digitCount(i32 noundef %0), !dbg !47
  store i32 %call2, i32* %counter, align 4, !dbg !45
  %1 = load i32, i32* %counter, align 4, !dbg !48
  %cmp = icmp sge i32 %1, 1, !dbg !49
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !50

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !51
  %cmp3 = icmp sle i32 %2, 3, !dbg !52
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !53
  call void @svf_assert(i1 noundef zeroext %3), !dbg !54
  %4 = load i32, i32* %retval, align 4, !dbg !55
  ret i32 %4, !dbg !55
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_52.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_52.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 20, scope: !9)
!17 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 8, type: !13)
!18 = !DILocation(line: 8, column: 9, scope: !9)
!19 = !DILocation(line: 9, column: 5, scope: !9)
!20 = !DILocation(line: 10, column: 13, scope: !21)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 17)
!22 = !DILocation(line: 10, column: 14, scope: !21)
!23 = !DILocation(line: 10, column: 11, scope: !21)
!24 = !DILocation(line: 11, column: 16, scope: !21)
!25 = !DILocation(line: 12, column: 12, scope: !26)
!26 = distinct !DILexicalBlock(scope: !21, file: !10, line: 12, column: 12)
!27 = !DILocation(line: 12, column: 14, scope: !26)
!28 = !DILocation(line: 12, column: 12, scope: !21)
!29 = !DILocation(line: 13, column: 13, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !10, line: 12, column: 20)
!31 = distinct !{!31, !19, !32}
!32 = !DILocation(line: 15, column: 5, scope: !9)
!33 = !DILocation(line: 16, column: 12, scope: !9)
!34 = !DILocation(line: 16, column: 5, scope: !9)
!35 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 19, type: !36, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!36 = !DISubroutineType(types: !37)
!37 = !{!13}
!38 = !DILocation(line: 20, column: 11, scope: !35)
!39 = !DILocation(line: 20, column: 5, scope: !35)
!40 = !DILocalVariable(name: "randomNumber", scope: !35, file: !10, line: 21, type: !13)
!41 = !DILocation(line: 21, column: 6, scope: !35)
!42 = !DILocation(line: 21, column: 21, scope: !35)
!43 = !DILocation(line: 21, column: 28, scope: !35)
!44 = !DILocalVariable(name: "counter", scope: !35, file: !10, line: 22, type: !13)
!45 = !DILocation(line: 22, column: 9, scope: !35)
!46 = !DILocation(line: 22, column: 30, scope: !35)
!47 = !DILocation(line: 22, column: 19, scope: !35)
!48 = !DILocation(line: 23, column: 16, scope: !35)
!49 = !DILocation(line: 23, column: 24, scope: !35)
!50 = !DILocation(line: 23, column: 29, scope: !35)
!51 = !DILocation(line: 23, column: 32, scope: !35)
!52 = !DILocation(line: 23, column: 40, scope: !35)
!53 = !DILocation(line: 0, scope: !35)
!54 = !DILocation(line: 23, column: 5, scope: !35)
!55 = !DILocation(line: 24, column: 1, scope: !35)
