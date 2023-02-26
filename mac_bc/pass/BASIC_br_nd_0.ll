; ModuleID = 'mac_bc/pass/BASIC_br_nd_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_br_nd_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %y, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 1, i32* %x, align 4, !dbg !19
  store i32 1, i32* %y, align 4, !dbg !20
  %call = call i32 @nd(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  %0 = load i32, i32* %x, align 4, !dbg !24
  %inc = add nsw i32 %0, 1, !dbg !24
  store i32 %inc, i32* %x, align 4, !dbg !24
  %1 = load i32, i32* %y, align 4, !dbg !26
  %inc1 = add nsw i32 %1, 1, !dbg !26
  store i32 %inc1, i32* %y, align 4, !dbg !26
  br label %if.end, !dbg !27

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %x, align 4, !dbg !28
  %cmp = icmp sle i32 %2, 10, !dbg !29
  br i1 %cmp, label %land.lhs.true, label %land.end, !dbg !30

land.lhs.true:                                    ; preds = %if.end
  %3 = load i32, i32* %x, align 4, !dbg !31
  %4 = load i32, i32* %y, align 4, !dbg !32
  %cmp2 = icmp sge i32 %3, %4, !dbg !33
  br i1 %cmp2, label %land.rhs, label %land.end, !dbg !34

land.rhs:                                         ; preds = %land.lhs.true
  %5 = load i32, i32* %x, align 4, !dbg !35
  %6 = load i32, i32* %y, align 4, !dbg !36
  %cmp3 = icmp sle i32 %5, %6, !dbg !37
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %if.end
  %7 = phi i1 [ false, %land.lhs.true ], [ false, %if.end ], [ %cmp3, %land.rhs ], !dbg !38
  call void @svf_assert(i1 noundef zeroext %7), !dbg !39
  ret i32 0, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @nd() #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_br_nd_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 10, type: !11, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_br_nd_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 11, type: !13)
!16 = !DILocation(line: 11, column: 9, scope: !9)
!17 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 11, type: !13)
!18 = !DILocation(line: 11, column: 12, scope: !9)
!19 = !DILocation(line: 12, column: 7, scope: !9)
!20 = !DILocation(line: 13, column: 7, scope: !9)
!21 = !DILocation(line: 15, column: 9, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 15, column: 9)
!23 = !DILocation(line: 15, column: 9, scope: !9)
!24 = !DILocation(line: 16, column: 10, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !10, line: 15, column: 15)
!26 = !DILocation(line: 17, column: 10, scope: !25)
!27 = !DILocation(line: 18, column: 5, scope: !25)
!28 = !DILocation(line: 19, column: 16, scope: !9)
!29 = !DILocation(line: 19, column: 18, scope: !9)
!30 = !DILocation(line: 19, column: 23, scope: !9)
!31 = !DILocation(line: 19, column: 26, scope: !9)
!32 = !DILocation(line: 19, column: 29, scope: !9)
!33 = !DILocation(line: 19, column: 27, scope: !9)
!34 = !DILocation(line: 19, column: 31, scope: !9)
!35 = !DILocation(line: 19, column: 34, scope: !9)
!36 = !DILocation(line: 19, column: 39, scope: !9)
!37 = !DILocation(line: 19, column: 36, scope: !9)
!38 = !DILocation(line: 0, scope: !9)
!39 = !DILocation(line: 19, column: 5, scope: !9)
!40 = !DILocation(line: 20, column: 5, scope: !9)
