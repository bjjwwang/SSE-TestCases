; ModuleID = 'linux_bc/pass/INTERVAL_test_60.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_60.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %a, align 4, !dbg !18
  %1 = load i32, i32* %a, align 4, !dbg !18
  %mul = mul nsw i32 %0, %1, !dbg !18
  %2 = load i32, i32* %a, align 4, !dbg !18
  %mul1 = mul nsw i32 %mul, %2, !dbg !18
  %3 = load i32, i32* %a, align 4, !dbg !18
  %cmp = icmp slt i32 %mul1, %3, !dbg !18
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !18

cond.true:                                        ; preds = %entry
  %4 = load i32, i32* %a, align 4, !dbg !18
  %5 = load i32, i32* %a, align 4, !dbg !18
  %mul2 = mul nsw i32 %4, %5, !dbg !18
  %6 = load i32, i32* %a, align 4, !dbg !18
  %mul3 = mul nsw i32 %mul2, %6, !dbg !18
  br label %cond.end, !dbg !18

cond.false:                                       ; preds = %entry
  %7 = load i32, i32* %a, align 4, !dbg !18
  br label %cond.end, !dbg !18

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %mul3, %cond.true ], [ %7, %cond.false ], !dbg !18
  store i32 %cond, i32* %b, align 4, !dbg !17
  %8 = load i32, i32* %b, align 4, !dbg !19
  %9 = load i32, i32* %a, align 4, !dbg !21
  %cmp4 = icmp eq i32 %8, %9, !dbg !22
  br i1 %cmp4, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %cond.end
  %10 = load i32, i32* %a, align 4, !dbg !24
  %cmp5 = icmp sge i32 %10, 0, !dbg !26
  call void @svf_assert(i1 zeroext %cmp5), !dbg !27
  br label %if.end, !dbg !28

if.else:                                          ; preds = %cond.end
  %11 = load i32, i32* %a, align 4, !dbg !29
  %cmp6 = icmp slt i32 %11, 0, !dbg !31
  call void @svf_assert(i1 zeroext %cmp6), !dbg !32
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !33
  ret i32 %12, !dbg !33
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_60.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 10, type: !11, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_60.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!15 = !DILocation(line: 11, column: 6, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 12, type: !13)
!17 = !DILocation(line: 12, column: 6, scope: !9)
!18 = !DILocation(line: 12, column: 10, scope: !9)
!19 = !DILocation(line: 13, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 5)
!21 = !DILocation(line: 13, column: 10, scope: !20)
!22 = !DILocation(line: 13, column: 7, scope: !20)
!23 = !DILocation(line: 13, column: 5, scope: !9)
!24 = !DILocation(line: 14, column: 14, scope: !25)
!25 = distinct !DILexicalBlock(scope: !20, file: !10, line: 13, column: 13)
!26 = !DILocation(line: 14, column: 16, scope: !25)
!27 = !DILocation(line: 14, column: 3, scope: !25)
!28 = !DILocation(line: 15, column: 2, scope: !25)
!29 = !DILocation(line: 17, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !10, line: 16, column: 7)
!31 = !DILocation(line: 17, column: 16, scope: !30)
!32 = !DILocation(line: 17, column: 3, scope: !30)
!33 = !DILocation(line: 19, column: 1, scope: !9)
