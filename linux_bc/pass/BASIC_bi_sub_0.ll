; ModuleID = 'linux_bc/pass/BASIC_bi_sub_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_bi_sub_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %i) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %a, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %c, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* %i.addr, align 4, !dbg !20
  %sub = sub nsw i32 %0, 1, !dbg !21
  store i32 %sub, i32* %a, align 4, !dbg !22
  %1 = load i32, i32* %a, align 4, !dbg !23
  store i32 %1, i32* %c, align 4, !dbg !24
  %2 = load i32, i32* %c, align 4, !dbg !25
  %3 = load i32, i32* %i.addr, align 4, !dbg !26
  %sub1 = sub nsw i32 %3, 1, !dbg !27
  %cmp = icmp eq i32 %2, %sub1, !dbg !28
  call void @svf_assert(i1 zeroext %cmp), !dbg !29
  ret i32 0, !dbg !30
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_bi_sub_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_bi_sub_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 3, type: !13)
!15 = !DILocation(line: 3, column: 14, scope: !9)
!16 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 4, type: !13)
!17 = !DILocation(line: 4, column: 9, scope: !9)
!18 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 4, type: !13)
!19 = !DILocation(line: 4, column: 12, scope: !9)
!20 = !DILocation(line: 5, column: 9, scope: !9)
!21 = !DILocation(line: 5, column: 11, scope: !9)
!22 = !DILocation(line: 5, column: 7, scope: !9)
!23 = !DILocation(line: 6, column: 9, scope: !9)
!24 = !DILocation(line: 6, column: 7, scope: !9)
!25 = !DILocation(line: 7, column: 17, scope: !9)
!26 = !DILocation(line: 7, column: 22, scope: !9)
!27 = !DILocation(line: 7, column: 24, scope: !9)
!28 = !DILocation(line: 7, column: 19, scope: !9)
!29 = !DILocation(line: 7, column: 5, scope: !9)
!30 = !DILocation(line: 8, column: 5, scope: !9)
