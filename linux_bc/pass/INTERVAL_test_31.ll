; ModuleID = 'linux_bc/pass/INTERVAL_test_31.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_31.c"
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
  store i32 %0, i32* %b, align 4, !dbg !17
  br label %loopStart, !dbg !19

loopStart:                                        ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !20), !dbg !21
  br label %do.body, !dbg !22

do.body:                                          ; preds = %do.cond, %loopStart
  %1 = load i32, i32* %a, align 4, !dbg !23
  %2 = load i32, i32* %b, align 4, !dbg !26
  %cmp = icmp eq i32 %1, %2, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %do.body
  %3 = load i32, i32* %a, align 4, !dbg !29
  %inc = add nsw i32 %3, 1, !dbg !29
  store i32 %inc, i32* %a, align 4, !dbg !29
  br label %loopStart, !dbg !31

if.end:                                           ; preds = %do.body
  %4 = load i32, i32* %a, align 4, !dbg !32
  %inc1 = add nsw i32 %4, 1, !dbg !32
  store i32 %inc1, i32* %a, align 4, !dbg !32
  %5 = load i32, i32* %b, align 4, !dbg !33
  %inc2 = add nsw i32 %5, 1, !dbg !33
  store i32 %inc2, i32* %b, align 4, !dbg !33
  br label %do.cond, !dbg !34

do.cond:                                          ; preds = %if.end
  %6 = load i32, i32* %a, align 4, !dbg !35
  %cmp3 = icmp slt i32 %6, 15, !dbg !36
  br i1 %cmp3, label %do.body, label %do.end, !dbg !34, !llvm.loop !37

do.end:                                           ; preds = %do.cond
  %7 = load i32, i32* %b, align 4, !dbg !40
  %8 = load i32, i32* %a, align 4, !dbg !41
  %sub = sub nsw i32 %8, 1, !dbg !42
  %cmp4 = icmp eq i32 %7, %sub, !dbg !43
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !44

land.rhs:                                         ; preds = %do.end
  %9 = load i32, i32* %a, align 4, !dbg !45
  %cmp5 = icmp sge i32 %9, 15, !dbg !46
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.end
  %10 = phi i1 [ false, %do.end ], [ %cmp5, %land.rhs ], !dbg !47
  call void @svf_assert(i1 zeroext %10), !dbg !48
  %11 = load i32, i32* %retval, align 4, !dbg !49
  ret i32 %11, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_31.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_31.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !13)
!15 = !DILocation(line: 6, column: 8, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 8, scope: !9)
!18 = !DILocation(line: 7, column: 12, scope: !9)
!19 = !DILocation(line: 7, column: 4, scope: !9)
!20 = !DILabel(scope: !9, name: "loopStart", file: !10, line: 8)
!21 = !DILocation(line: 8, column: 4, scope: !9)
!22 = !DILocation(line: 8, column: 15, scope: !9)
!23 = !DILocation(line: 9, column: 10, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !10, line: 9, column: 10)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 18)
!26 = !DILocation(line: 9, column: 15, scope: !24)
!27 = !DILocation(line: 9, column: 12, scope: !24)
!28 = !DILocation(line: 9, column: 10, scope: !25)
!29 = !DILocation(line: 10, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !24, file: !10, line: 9, column: 18)
!31 = !DILocation(line: 11, column: 10, scope: !30)
!32 = !DILocation(line: 13, column: 8, scope: !25)
!33 = !DILocation(line: 14, column: 8, scope: !25)
!34 = !DILocation(line: 15, column: 4, scope: !25)
!35 = !DILocation(line: 15, column: 12, scope: !9)
!36 = !DILocation(line: 15, column: 14, scope: !9)
!37 = distinct !{!37, !22, !38, !39}
!38 = !DILocation(line: 15, column: 18, scope: !9)
!39 = !{!"llvm.loop.mustprogress"}
!40 = !DILocation(line: 16, column: 15, scope: !9)
!41 = !DILocation(line: 16, column: 20, scope: !9)
!42 = !DILocation(line: 16, column: 22, scope: !9)
!43 = !DILocation(line: 16, column: 17, scope: !9)
!44 = !DILocation(line: 16, column: 26, scope: !9)
!45 = !DILocation(line: 16, column: 29, scope: !9)
!46 = !DILocation(line: 16, column: 31, scope: !9)
!47 = !DILocation(line: 0, scope: !9)
!48 = !DILocation(line: 16, column: 4, scope: !9)
!49 = !DILocation(line: 17, column: 1, scope: !9)
