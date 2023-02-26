; ModuleID = 'mac_bc/pass/BASIC_bi_div_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_bi_div_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 10, i32* %a, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %b, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 5, i32* %b, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %c, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* %a, align 4, !dbg !21
  %1 = load i32, i32* %b, align 4, !dbg !22
  %div = sdiv i32 %0, %1, !dbg !23
  store i32 %div, i32* %c, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %d, metadata !24, metadata !DIExpression()), !dbg !25
  %2 = load i32, i32* %a, align 4, !dbg !26
  %3 = load i32, i32* %b, align 4, !dbg !27
  %rem = srem i32 %2, %3, !dbg !28
  store i32 %rem, i32* %d, align 4, !dbg !25
  %4 = load i32, i32* %c, align 4, !dbg !29
  %cmp = icmp eq i32 %4, 2, !dbg !30
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !31

land.rhs:                                         ; preds = %entry
  %5 = load i32, i32* %d, align 4, !dbg !32
  %cmp1 = icmp eq i32 %5, 0, !dbg !33
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ], !dbg !34
  call void @svf_assert(i1 noundef zeroext %6), !dbg !35
  ret i32 0, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_bi_div_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_bi_div_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 5, type: !13)
!16 = !DILocation(line: 5, column: 9, scope: !9)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 6, type: !13)
!18 = !DILocation(line: 6, column: 9, scope: !9)
!19 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 7, type: !13)
!20 = !DILocation(line: 7, column: 9, scope: !9)
!21 = !DILocation(line: 7, column: 13, scope: !9)
!22 = !DILocation(line: 7, column: 17, scope: !9)
!23 = !DILocation(line: 7, column: 15, scope: !9)
!24 = !DILocalVariable(name: "d", scope: !9, file: !10, line: 8, type: !13)
!25 = !DILocation(line: 8, column: 9, scope: !9)
!26 = !DILocation(line: 8, column: 13, scope: !9)
!27 = !DILocation(line: 8, column: 17, scope: !9)
!28 = !DILocation(line: 8, column: 15, scope: !9)
!29 = !DILocation(line: 9, column: 16, scope: !9)
!30 = !DILocation(line: 9, column: 18, scope: !9)
!31 = !DILocation(line: 9, column: 23, scope: !9)
!32 = !DILocation(line: 9, column: 26, scope: !9)
!33 = !DILocation(line: 9, column: 28, scope: !9)
!34 = !DILocation(line: 0, scope: !9)
!35 = !DILocation(line: 9, column: 5, scope: !9)
!36 = !DILocation(line: 10, column: 5, scope: !9)
