; ModuleID = 'linux_bc/pass/BASIC_bi_div_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_bi_div_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 10, i32* %a, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 5, i32* %b, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %c, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* %a, align 4, !dbg !20
  %1 = load i32, i32* %b, align 4, !dbg !21
  %div = sdiv i32 %0, %1, !dbg !22
  store i32 %div, i32* %c, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %d, metadata !23, metadata !DIExpression()), !dbg !24
  %2 = load i32, i32* %a, align 4, !dbg !25
  %3 = load i32, i32* %b, align 4, !dbg !26
  %rem = srem i32 %2, %3, !dbg !27
  store i32 %rem, i32* %d, align 4, !dbg !24
  %4 = load i32, i32* %c, align 4, !dbg !28
  %cmp = icmp eq i32 %4, 2, !dbg !29
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !30

land.rhs:                                         ; preds = %entry
  %5 = load i32, i32* %d, align 4, !dbg !31
  %cmp1 = icmp eq i32 %5, 0, !dbg !32
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ], !dbg !33
  call void @svf_assert(i1 zeroext %6), !dbg !34
  ret i32 0, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_bi_div_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_bi_div_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 5, type: !13)
!15 = !DILocation(line: 5, column: 9, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 6, type: !13)
!17 = !DILocation(line: 6, column: 9, scope: !9)
!18 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 7, type: !13)
!19 = !DILocation(line: 7, column: 9, scope: !9)
!20 = !DILocation(line: 7, column: 13, scope: !9)
!21 = !DILocation(line: 7, column: 17, scope: !9)
!22 = !DILocation(line: 7, column: 15, scope: !9)
!23 = !DILocalVariable(name: "d", scope: !9, file: !10, line: 8, type: !13)
!24 = !DILocation(line: 8, column: 9, scope: !9)
!25 = !DILocation(line: 8, column: 13, scope: !9)
!26 = !DILocation(line: 8, column: 17, scope: !9)
!27 = !DILocation(line: 8, column: 15, scope: !9)
!28 = !DILocation(line: 9, column: 16, scope: !9)
!29 = !DILocation(line: 9, column: 18, scope: !9)
!30 = !DILocation(line: 9, column: 23, scope: !9)
!31 = !DILocation(line: 9, column: 26, scope: !9)
!32 = !DILocation(line: 9, column: 28, scope: !9)
!33 = !DILocation(line: 0, scope: !9)
!34 = !DILocation(line: 9, column: 5, scope: !9)
!35 = !DILocation(line: 10, column: 5, scope: !9)
