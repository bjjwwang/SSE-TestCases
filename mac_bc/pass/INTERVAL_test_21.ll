; ModuleID = 'mac_bc/pass/INTERVAL_test_21.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_21.c"
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
  call void @llvm.dbg.declare(metadata i32* %b, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %a, align 4, !dbg !19
  store i32 %0, i32* %b, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !24
  %cmp = icmp slt i32 %1, 10, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !27

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %a, align 4, !dbg !28
  %cmp1 = icmp eq i32 %2, 10, !dbg !31
  br i1 %cmp1, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !33

if.end:                                           ; preds = %for.body
  %3 = load i32, i32* %a, align 4, !dbg !35
  %inc = add nsw i32 %3, 1, !dbg !35
  store i32 %inc, i32* %a, align 4, !dbg !35
  br label %for.inc, !dbg !36

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !37
  %inc2 = add nsw i32 %4, 1, !dbg !37
  store i32 %inc2, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %if.then, %for.cond
  %5 = load i32, i32* %b, align 4, !dbg !42
  %cmp3 = icmp sge i32 %5, 0, !dbg !44
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !45

land.lhs.true:                                    ; preds = %for.end
  %6 = load i32, i32* %b, align 4, !dbg !46
  %cmp4 = icmp sle i32 %6, 10, !dbg !47
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !48

if.then5:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %a, align 4, !dbg !49
  %cmp6 = icmp eq i32 %7, 10, !dbg !51
  call void @svf_assert(i1 noundef zeroext %cmp6), !dbg !52
  br label %if.end7, !dbg !53

if.else:                                          ; preds = %land.lhs.true, %for.end
  %8 = load i32, i32* %b, align 4, !dbg !54
  %add = add nsw i32 %8, 10, !dbg !56
  store i32 %add, i32* %a, align 4, !dbg !57
  %tobool = icmp ne i32 %add, 0, !dbg !58
  call void @svf_assert(i1 noundef zeroext %tobool), !dbg !59
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then5
  %9 = load i32, i32* %retval, align 4, !dbg !60
  ret i32 %9, !dbg !60
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_21.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_21.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !13)
!16 = !DILocation(line: 6, column: 9, scope: !9)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 7, type: !13)
!18 = !DILocation(line: 7, column: 9, scope: !9)
!19 = !DILocation(line: 7, column: 13, scope: !9)
!20 = !DILocalVariable(name: "i", scope: !21, file: !10, line: 8, type: !13)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 5)
!22 = !DILocation(line: 8, column: 13, scope: !21)
!23 = !DILocation(line: 8, column: 9, scope: !21)
!24 = !DILocation(line: 8, column: 20, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !10, line: 8, column: 5)
!26 = !DILocation(line: 8, column: 22, scope: !25)
!27 = !DILocation(line: 8, column: 5, scope: !21)
!28 = !DILocation(line: 9, column: 12, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !10, line: 9, column: 12)
!30 = distinct !DILexicalBlock(scope: !25, file: !10, line: 8, column: 33)
!31 = !DILocation(line: 9, column: 14, scope: !29)
!32 = !DILocation(line: 9, column: 12, scope: !30)
!33 = !DILocation(line: 10, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !10, line: 9, column: 21)
!35 = !DILocation(line: 12, column: 10, scope: !30)
!36 = !DILocation(line: 13, column: 5, scope: !30)
!37 = !DILocation(line: 8, column: 29, scope: !25)
!38 = !DILocation(line: 8, column: 5, scope: !25)
!39 = distinct !{!39, !27, !40, !41}
!40 = !DILocation(line: 13, column: 5, scope: !21)
!41 = !{!"llvm.loop.mustprogress"}
!42 = !DILocation(line: 14, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 8)
!44 = !DILocation(line: 14, column: 10, scope: !43)
!45 = !DILocation(line: 14, column: 15, scope: !43)
!46 = !DILocation(line: 14, column: 18, scope: !43)
!47 = !DILocation(line: 14, column: 20, scope: !43)
!48 = !DILocation(line: 14, column: 8, scope: !9)
!49 = !DILocation(line: 15, column: 20, scope: !50)
!50 = distinct !DILexicalBlock(scope: !43, file: !10, line: 14, column: 27)
!51 = !DILocation(line: 15, column: 22, scope: !50)
!52 = !DILocation(line: 15, column: 9, scope: !50)
!53 = !DILocation(line: 16, column: 5, scope: !50)
!54 = !DILocation(line: 18, column: 24, scope: !55)
!55 = distinct !DILexicalBlock(scope: !43, file: !10, line: 17, column: 10)
!56 = !DILocation(line: 18, column: 26, scope: !55)
!57 = !DILocation(line: 18, column: 22, scope: !55)
!58 = !DILocation(line: 18, column: 20, scope: !55)
!59 = !DILocation(line: 18, column: 9, scope: !55)
!60 = !DILocation(line: 21, column: 1, scope: !9)
