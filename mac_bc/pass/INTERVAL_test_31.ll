; ModuleID = 'mac_bc/pass/INTERVAL_test_31.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_31.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %b, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %a, align 4, !dbg !19
  store i32 %0, i32* %b, align 4, !dbg !18
  br label %loopStart, !dbg !20

loopStart:                                        ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !21), !dbg !22
  br label %do.body, !dbg !23

do.body:                                          ; preds = %do.cond, %loopStart
  %1 = load i32, i32* %a, align 4, !dbg !24
  %2 = load i32, i32* %b, align 4, !dbg !27
  %cmp = icmp eq i32 %1, %2, !dbg !28
  br i1 %cmp, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %do.body
  %3 = load i32, i32* %a, align 4, !dbg !30
  %inc = add nsw i32 %3, 1, !dbg !30
  store i32 %inc, i32* %a, align 4, !dbg !30
  br label %loopStart, !dbg !32

if.end:                                           ; preds = %do.body
  %4 = load i32, i32* %a, align 4, !dbg !33
  %inc1 = add nsw i32 %4, 1, !dbg !33
  store i32 %inc1, i32* %a, align 4, !dbg !33
  %5 = load i32, i32* %b, align 4, !dbg !34
  %inc2 = add nsw i32 %5, 1, !dbg !34
  store i32 %inc2, i32* %b, align 4, !dbg !34
  br label %do.cond, !dbg !35

do.cond:                                          ; preds = %if.end
  %6 = load i32, i32* %a, align 4, !dbg !36
  %cmp3 = icmp slt i32 %6, 15, !dbg !37
  br i1 %cmp3, label %do.body, label %do.end, !dbg !35, !llvm.loop !38

do.end:                                           ; preds = %do.cond
  %7 = load i32, i32* %b, align 4, !dbg !41
  %8 = load i32, i32* %a, align 4, !dbg !42
  %sub = sub nsw i32 %8, 1, !dbg !43
  %cmp4 = icmp eq i32 %7, %sub, !dbg !44
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !45

land.rhs:                                         ; preds = %do.end
  %9 = load i32, i32* %a, align 4, !dbg !46
  %cmp5 = icmp sge i32 %9, 15, !dbg !47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.end
  %10 = phi i1 [ false, %do.end ], [ %cmp5, %land.rhs ], !dbg !48
  call void @svf_assert(i1 noundef zeroext %10), !dbg !49
  %11 = load i32, i32* %retval, align 4, !dbg !50
  ret i32 %11, !dbg !50
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_31.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_31.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !13)
!16 = !DILocation(line: 6, column: 8, scope: !9)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 7, type: !13)
!18 = !DILocation(line: 7, column: 8, scope: !9)
!19 = !DILocation(line: 7, column: 12, scope: !9)
!20 = !DILocation(line: 7, column: 4, scope: !9)
!21 = !DILabel(scope: !9, name: "loopStart", file: !10, line: 8)
!22 = !DILocation(line: 8, column: 4, scope: !9)
!23 = !DILocation(line: 8, column: 15, scope: !9)
!24 = !DILocation(line: 9, column: 10, scope: !25)
!25 = distinct !DILexicalBlock(scope: !26, file: !10, line: 9, column: 10)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 18)
!27 = !DILocation(line: 9, column: 15, scope: !25)
!28 = !DILocation(line: 9, column: 12, scope: !25)
!29 = !DILocation(line: 9, column: 10, scope: !26)
!30 = !DILocation(line: 10, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !25, file: !10, line: 9, column: 18)
!32 = !DILocation(line: 11, column: 10, scope: !31)
!33 = !DILocation(line: 13, column: 8, scope: !26)
!34 = !DILocation(line: 14, column: 8, scope: !26)
!35 = !DILocation(line: 15, column: 4, scope: !26)
!36 = !DILocation(line: 15, column: 12, scope: !9)
!37 = !DILocation(line: 15, column: 14, scope: !9)
!38 = distinct !{!38, !23, !39, !40}
!39 = !DILocation(line: 15, column: 18, scope: !9)
!40 = !{!"llvm.loop.mustprogress"}
!41 = !DILocation(line: 16, column: 15, scope: !9)
!42 = !DILocation(line: 16, column: 20, scope: !9)
!43 = !DILocation(line: 16, column: 22, scope: !9)
!44 = !DILocation(line: 16, column: 17, scope: !9)
!45 = !DILocation(line: 16, column: 26, scope: !9)
!46 = !DILocation(line: 16, column: 29, scope: !9)
!47 = !DILocation(line: 16, column: 31, scope: !9)
!48 = !DILocation(line: 0, scope: !9)
!49 = !DILocation(line: 16, column: 4, scope: !9)
!50 = !DILocation(line: 17, column: 1, scope: !9)
