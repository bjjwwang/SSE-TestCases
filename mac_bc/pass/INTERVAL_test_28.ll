; ModuleID = 'mac_bc/pass/INTERVAL_test_28.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_28.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %counter = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %counter, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !17, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %i, align 4, !dbg !19
  br label %for.cond, !dbg !20

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !21
  %cmp = icmp sle i32 %0, 127, !dbg !23
  br i1 %cmp, label %for.body, label %for.end, !dbg !24

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !25
  %call = call i32 @ispunct(i32 noundef %1) #4, !dbg !28
  %tobool = icmp ne i32 %call, 0, !dbg !28
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %for.body
  %2 = load i32, i32* %counter, align 4, !dbg !30
  %inc = add nsw i32 %2, 1, !dbg !30
  store i32 %inc, i32* %counter, align 4, !dbg !30
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !34
  %inc1 = add nsw i32 %3, 1, !dbg !34
  store i32 %inc1, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %counter, align 4, !dbg !39
  %cmp2 = icmp eq i32 %4, 32, !dbg !40
  call void @svf_assert(i1 noundef zeroext %cmp2), !dbg !41
  %5 = load i32, i32* %retval, align 4, !dbg !42
  ret i32 %5, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @ispunct(i32 noundef) #2

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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_28.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_28.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 9, scope: !9)
!17 = !DILocalVariable(name: "i", scope: !18, file: !10, line: 9, type: !13)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 5)
!19 = !DILocation(line: 9, column: 14, scope: !18)
!20 = !DILocation(line: 9, column: 10, scope: !18)
!21 = !DILocation(line: 9, column: 21, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 9, column: 5)
!23 = !DILocation(line: 9, column: 23, scope: !22)
!24 = !DILocation(line: 9, column: 5, scope: !18)
!25 = !DILocation(line: 10, column: 20, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !10, line: 10, column: 12)
!27 = distinct !DILexicalBlock(scope: !22, file: !10, line: 9, column: 36)
!28 = !DILocation(line: 10, column: 12, scope: !26)
!29 = !DILocation(line: 10, column: 12, scope: !27)
!30 = !DILocation(line: 11, column: 11, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !10, line: 10, column: 24)
!32 = !DILocation(line: 12, column: 3, scope: !31)
!33 = !DILocation(line: 13, column: 5, scope: !27)
!34 = !DILocation(line: 9, column: 32, scope: !22)
!35 = !DILocation(line: 9, column: 5, scope: !22)
!36 = distinct !{!36, !24, !37, !38}
!37 = !DILocation(line: 13, column: 5, scope: !18)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocation(line: 14, column: 13, scope: !9)
!40 = !DILocation(line: 14, column: 21, scope: !9)
!41 = !DILocation(line: 14, column: 2, scope: !9)
!42 = !DILocation(line: 15, column: 1, scope: !9)
