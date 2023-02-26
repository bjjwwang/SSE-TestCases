; ModuleID = 'linux_bc/pass/BASIC_array_varIdx_1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_varIdx_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %a = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [3 x i32]* %a, metadata !14, metadata !DIExpression()), !dbg !18
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 0, !dbg !19
  store i32 0, i32* %arrayidx, align 4, !dbg !20
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 1, !dbg !21
  store i32 1, i32* %arrayidx1, align 4, !dbg !22
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 2, !dbg !23
  store i32 2, i32* %arrayidx2, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 1, i32* %i, align 4, !dbg !26
  %0 = load i32, i32* %i, align 4, !dbg !27
  %idxprom = sext i32 %0 to i64, !dbg !28
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %a, i64 0, i64 %idxprom, !dbg !28
  %1 = load i32, i32* %arrayidx3, align 4, !dbg !28
  %cmp = icmp eq i32 %1, 1, !dbg !29
  %conv = zext i1 %cmp to i32, !dbg !29
  call void @svf_assert(i32 %conv), !dbg !30
  ret i32 0, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i32) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_varIdx_1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 2, type: !11, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_array_varIdx_1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 4, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 3)
!18 = !DILocation(line: 4, column: 7, scope: !9)
!19 = !DILocation(line: 5, column: 3, scope: !9)
!20 = !DILocation(line: 5, column: 8, scope: !9)
!21 = !DILocation(line: 6, column: 3, scope: !9)
!22 = !DILocation(line: 6, column: 8, scope: !9)
!23 = !DILocation(line: 7, column: 3, scope: !9)
!24 = !DILocation(line: 7, column: 8, scope: !9)
!25 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 8, type: !13)
!26 = !DILocation(line: 8, column: 7, scope: !9)
!27 = !DILocation(line: 9, column: 16, scope: !9)
!28 = !DILocation(line: 9, column: 14, scope: !9)
!29 = !DILocation(line: 9, column: 18, scope: !9)
!30 = !DILocation(line: 9, column: 3, scope: !9)
!31 = !DILocation(line: 11, column: 1, scope: !9)
