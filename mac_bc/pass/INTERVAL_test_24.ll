; ModuleID = 'mac_bc/pass/INTERVAL_test_24.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_24.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %a, align 4, !dbg !17
  %cmp = icmp sge i32 %0, 0, !dbg !19
  br i1 %cmp, label %if.then, label %if.end14, !dbg !20

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %b, metadata !21, metadata !DIExpression()), !dbg !23
  %1 = load i32, i32* %a, align 4, !dbg !24
  store i32 %1, i32* %b, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4, !dbg !30
  %cmp1 = icmp slt i32 %2, 5, !dbg !32
  br i1 %cmp1, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %b, align 4, !dbg !34
  %inc = add nsw i32 %3, 1, !dbg !34
  store i32 %inc, i32* %b, align 4, !dbg !34
  %4 = load i32, i32* %b, align 4, !dbg !36
  %cmp2 = icmp sgt i32 %4, 10, !dbg !38
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !39

if.then3:                                         ; preds = %for.body
  br label %for.end, !dbg !40

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !43
  %inc4 = add nsw i32 %5, 1, !dbg !43
  store i32 %inc4, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %if.then3, %for.cond
  %6 = load i32, i32* %a, align 4, !dbg !48
  %cmp5 = icmp sgt i32 %6, 0, !dbg !50
  br i1 %cmp5, label %land.lhs.true, label %if.end13, !dbg !51

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %i, align 4, !dbg !52
  %cmp6 = icmp eq i32 %7, 5, !dbg !53
  br i1 %cmp6, label %land.lhs.true7, label %if.end13, !dbg !54

land.lhs.true7:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* %b, align 4, !dbg !55
  %rem = srem i32 %8, 2, !dbg !56
  %cmp8 = icmp eq i32 %rem, 0, !dbg !57
  br i1 %cmp8, label %if.then9, label %if.end13, !dbg !58

if.then9:                                         ; preds = %land.lhs.true7
  %9 = load i32, i32* %a, align 4, !dbg !59
  %rem10 = srem i32 %9, 2, !dbg !61
  %cmp11 = icmp eq i32 %rem10, 1, !dbg !62
  br i1 %cmp11, label %land.rhs, label %land.end, !dbg !63

land.rhs:                                         ; preds = %if.then9
  %10 = load i32, i32* %a, align 4, !dbg !64
  %cmp12 = icmp sle i32 %10, 5, !dbg !65
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then9
  %11 = phi i1 [ false, %if.then9 ], [ %cmp12, %land.rhs ], !dbg !66
  call void @svf_assert(i1 noundef zeroext %11), !dbg !67
  br label %if.end13, !dbg !68

if.end13:                                         ; preds = %land.end, %land.lhs.true7, %land.lhs.true, %for.end
  br label %if.end14, !dbg !69

if.end14:                                         ; preds = %if.end13, %entry
  %12 = load i32, i32* %retval, align 4, !dbg !70
  ret i32 %12, !dbg !70
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_24.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_24.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !13)
!16 = !DILocation(line: 6, column: 9, scope: !9)
!17 = !DILocation(line: 7, column: 9, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 9)
!19 = !DILocation(line: 7, column: 11, scope: !18)
!20 = !DILocation(line: 7, column: 9, scope: !9)
!21 = !DILocalVariable(name: "b", scope: !22, file: !10, line: 8, type: !13)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 7, column: 17)
!23 = !DILocation(line: 8, column: 13, scope: !22)
!24 = !DILocation(line: 8, column: 17, scope: !22)
!25 = !DILocalVariable(name: "i", scope: !22, file: !10, line: 9, type: !13)
!26 = !DILocation(line: 9, column: 13, scope: !22)
!27 = !DILocation(line: 10, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !22, file: !10, line: 10, column: 9)
!29 = !DILocation(line: 10, column: 14, scope: !28)
!30 = !DILocation(line: 10, column: 21, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !10, line: 10, column: 9)
!32 = !DILocation(line: 10, column: 23, scope: !31)
!33 = !DILocation(line: 10, column: 9, scope: !28)
!34 = !DILocation(line: 11, column: 14, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 10, column: 33)
!36 = !DILocation(line: 12, column: 16, scope: !37)
!37 = distinct !DILexicalBlock(scope: !35, file: !10, line: 12, column: 16)
!38 = !DILocation(line: 12, column: 18, scope: !37)
!39 = !DILocation(line: 12, column: 16, scope: !35)
!40 = !DILocation(line: 13, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !10, line: 12, column: 24)
!42 = !DILocation(line: 15, column: 9, scope: !35)
!43 = !DILocation(line: 10, column: 29, scope: !31)
!44 = !DILocation(line: 10, column: 9, scope: !31)
!45 = distinct !{!45, !33, !46, !47}
!46 = !DILocation(line: 15, column: 9, scope: !28)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocation(line: 16, column: 13, scope: !49)
!49 = distinct !DILexicalBlock(scope: !22, file: !10, line: 16, column: 13)
!50 = !DILocation(line: 16, column: 15, scope: !49)
!51 = !DILocation(line: 16, column: 19, scope: !49)
!52 = !DILocation(line: 16, column: 22, scope: !49)
!53 = !DILocation(line: 16, column: 24, scope: !49)
!54 = !DILocation(line: 16, column: 29, scope: !49)
!55 = !DILocation(line: 16, column: 32, scope: !49)
!56 = !DILocation(line: 16, column: 34, scope: !49)
!57 = !DILocation(line: 16, column: 38, scope: !49)
!58 = !DILocation(line: 16, column: 13, scope: !22)
!59 = !DILocation(line: 17, column: 24, scope: !60)
!60 = distinct !DILexicalBlock(scope: !49, file: !10, line: 16, column: 44)
!61 = !DILocation(line: 17, column: 26, scope: !60)
!62 = !DILocation(line: 17, column: 30, scope: !60)
!63 = !DILocation(line: 17, column: 35, scope: !60)
!64 = !DILocation(line: 17, column: 38, scope: !60)
!65 = !DILocation(line: 17, column: 40, scope: !60)
!66 = !DILocation(line: 0, scope: !60)
!67 = !DILocation(line: 17, column: 13, scope: !60)
!68 = !DILocation(line: 18, column: 9, scope: !60)
!69 = !DILocation(line: 19, column: 5, scope: !22)
!70 = !DILocation(line: 20, column: 1, scope: !9)
