; ModuleID = 'linux_bc/pass/INTERVAL_test_21.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32, i32* %a, align 4, !dbg !18
  store i32 %0, i32* %b, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !23
  %cmp = icmp slt i32 %1, 10, !dbg !25
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %a, align 4, !dbg !27
  %cmp1 = icmp eq i32 %2, 10, !dbg !30
  br i1 %cmp1, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !32

if.end:                                           ; preds = %for.body
  %3 = load i32, i32* %a, align 4, !dbg !34
  %inc = add nsw i32 %3, 1, !dbg !34
  store i32 %inc, i32* %a, align 4, !dbg !34
  br label %for.inc, !dbg !35

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !36
  %inc2 = add nsw i32 %4, 1, !dbg !36
  store i32 %inc2, i32* %i, align 4, !dbg !36
  br label %for.cond, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %if.then, %for.cond
  %5 = load i32, i32* %b, align 4, !dbg !41
  %cmp3 = icmp sge i32 %5, 0, !dbg !43
  br i1 %cmp3, label %land.lhs.true, label %if.else, !dbg !44

land.lhs.true:                                    ; preds = %for.end
  %6 = load i32, i32* %b, align 4, !dbg !45
  %cmp4 = icmp sle i32 %6, 10, !dbg !46
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !47

if.then5:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %a, align 4, !dbg !48
  %cmp6 = icmp eq i32 %7, 10, !dbg !50
  call void @svf_assert(i1 zeroext %cmp6), !dbg !51
  br label %if.end7, !dbg !52

if.else:                                          ; preds = %land.lhs.true, %for.end
  %8 = load i32, i32* %b, align 4, !dbg !53
  %add = add nsw i32 %8, 10, !dbg !55
  store i32 %add, i32* %a, align 4, !dbg !56
  %tobool = icmp ne i32 %add, 0, !dbg !57
  call void @svf_assert(i1 zeroext %tobool), !dbg !58
  br label %if.end7

if.end7:                                          ; preds = %if.else, %if.then5
  %9 = load i32, i32* %retval, align 4, !dbg !59
  ret i32 %9, !dbg !59
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_21.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_21.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !13)
!15 = !DILocation(line: 6, column: 9, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 9, scope: !9)
!18 = !DILocation(line: 7, column: 13, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 8, type: !13)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 5)
!21 = !DILocation(line: 8, column: 13, scope: !20)
!22 = !DILocation(line: 8, column: 9, scope: !20)
!23 = !DILocation(line: 8, column: 20, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !10, line: 8, column: 5)
!25 = !DILocation(line: 8, column: 22, scope: !24)
!26 = !DILocation(line: 8, column: 5, scope: !20)
!27 = !DILocation(line: 9, column: 12, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !10, line: 9, column: 12)
!29 = distinct !DILexicalBlock(scope: !24, file: !10, line: 8, column: 33)
!30 = !DILocation(line: 9, column: 14, scope: !28)
!31 = !DILocation(line: 9, column: 12, scope: !29)
!32 = !DILocation(line: 10, column: 13, scope: !33)
!33 = distinct !DILexicalBlock(scope: !28, file: !10, line: 9, column: 21)
!34 = !DILocation(line: 12, column: 10, scope: !29)
!35 = !DILocation(line: 13, column: 5, scope: !29)
!36 = !DILocation(line: 8, column: 29, scope: !24)
!37 = !DILocation(line: 8, column: 5, scope: !24)
!38 = distinct !{!38, !26, !39, !40}
!39 = !DILocation(line: 13, column: 5, scope: !20)
!40 = !{!"llvm.loop.mustprogress"}
!41 = !DILocation(line: 14, column: 8, scope: !42)
!42 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 8)
!43 = !DILocation(line: 14, column: 10, scope: !42)
!44 = !DILocation(line: 14, column: 15, scope: !42)
!45 = !DILocation(line: 14, column: 18, scope: !42)
!46 = !DILocation(line: 14, column: 20, scope: !42)
!47 = !DILocation(line: 14, column: 8, scope: !9)
!48 = !DILocation(line: 15, column: 20, scope: !49)
!49 = distinct !DILexicalBlock(scope: !42, file: !10, line: 14, column: 27)
!50 = !DILocation(line: 15, column: 22, scope: !49)
!51 = !DILocation(line: 15, column: 9, scope: !49)
!52 = !DILocation(line: 16, column: 5, scope: !49)
!53 = !DILocation(line: 18, column: 24, scope: !54)
!54 = distinct !DILexicalBlock(scope: !42, file: !10, line: 17, column: 10)
!55 = !DILocation(line: 18, column: 26, scope: !54)
!56 = !DILocation(line: 18, column: 22, scope: !54)
!57 = !DILocation(line: 18, column: 20, scope: !54)
!58 = !DILocation(line: 18, column: 9, scope: !54)
!59 = !DILocation(line: 21, column: 1, scope: !9)
