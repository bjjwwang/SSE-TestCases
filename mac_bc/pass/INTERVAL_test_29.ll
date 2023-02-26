; ModuleID = 'mac_bc/pass/INTERVAL_test_29.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_29.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %ch = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %ch, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %ch, align 4, !dbg !17
  %cmp = icmp sge i32 %0, 97, !dbg !19
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !20

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %ch, align 4, !dbg !21
  %cmp1 = icmp sle i32 %1, 122, !dbg !22
  br i1 %cmp1, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* %ch, align 4, !dbg !24
  %call = call i32 @toupper(i32 noundef %2) #4, !dbg !26
  store i32 %call, i32* %ch, align 4, !dbg !27
  %3 = load i32, i32* %ch, align 4, !dbg !28
  %cmp2 = icmp sge i32 %3, 65, !dbg !29
  br i1 %cmp2, label %land.rhs, label %land.end, !dbg !30

land.rhs:                                         ; preds = %if.then
  %4 = load i32, i32* %ch, align 4, !dbg !31
  %cmp3 = icmp sle i32 %4, 90, !dbg !32
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %5 = phi i1 [ false, %if.then ], [ %cmp3, %land.rhs ], !dbg !33
  call void @svf_assert(i1 noundef zeroext %5), !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %land.end, %land.lhs.true, %entry
  %6 = load i32, i32* %retval, align 4, !dbg !36
  ret i32 %6, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @toupper(i32 noundef) #2

declare void @svf_assert(i1 noundef zeroext) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_29.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_29.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "ch", scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 6, scope: !9)
!17 = !DILocation(line: 9, column: 6, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 6)
!19 = !DILocation(line: 9, column: 9, scope: !18)
!20 = !DILocation(line: 9, column: 15, scope: !18)
!21 = !DILocation(line: 9, column: 18, scope: !18)
!22 = !DILocation(line: 9, column: 21, scope: !18)
!23 = !DILocation(line: 9, column: 6, scope: !9)
!24 = !DILocation(line: 10, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !18, file: !10, line: 9, column: 29)
!26 = !DILocation(line: 10, column: 8, scope: !25)
!27 = !DILocation(line: 10, column: 6, scope: !25)
!28 = !DILocation(line: 11, column: 14, scope: !25)
!29 = !DILocation(line: 11, column: 17, scope: !25)
!30 = !DILocation(line: 11, column: 23, scope: !25)
!31 = !DILocation(line: 11, column: 26, scope: !25)
!32 = !DILocation(line: 11, column: 29, scope: !25)
!33 = !DILocation(line: 0, scope: !25)
!34 = !DILocation(line: 11, column: 3, scope: !25)
!35 = !DILocation(line: 12, column: 2, scope: !25)
!36 = !DILocation(line: 13, column: 1, scope: !9)
