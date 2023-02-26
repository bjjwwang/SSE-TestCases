; ModuleID = 'linux_bc/pass/INTERVAL_test_24.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_24.c"
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
  %0 = load i32, i32* %a, align 4, !dbg !16
  %cmp = icmp sge i32 %0, 0, !dbg !18
  br i1 %cmp, label %if.then, label %if.end14, !dbg !19

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %b, metadata !20, metadata !DIExpression()), !dbg !22
  %1 = load i32, i32* %a, align 4, !dbg !23
  store i32 %1, i32* %b, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4, !dbg !29
  %cmp1 = icmp slt i32 %2, 5, !dbg !31
  br i1 %cmp1, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %b, align 4, !dbg !33
  %inc = add nsw i32 %3, 1, !dbg !33
  store i32 %inc, i32* %b, align 4, !dbg !33
  %4 = load i32, i32* %b, align 4, !dbg !35
  %cmp2 = icmp sgt i32 %4, 10, !dbg !37
  br i1 %cmp2, label %if.then3, label %if.end, !dbg !38

if.then3:                                         ; preds = %for.body
  br label %for.end, !dbg !39

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !41

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !42
  %inc4 = add nsw i32 %5, 1, !dbg !42
  store i32 %inc4, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end:                                          ; preds = %if.then3, %for.cond
  %6 = load i32, i32* %a, align 4, !dbg !47
  %cmp5 = icmp sgt i32 %6, 0, !dbg !49
  br i1 %cmp5, label %land.lhs.true, label %if.end13, !dbg !50

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %i, align 4, !dbg !51
  %cmp6 = icmp eq i32 %7, 5, !dbg !52
  br i1 %cmp6, label %land.lhs.true7, label %if.end13, !dbg !53

land.lhs.true7:                                   ; preds = %land.lhs.true
  %8 = load i32, i32* %b, align 4, !dbg !54
  %rem = srem i32 %8, 2, !dbg !55
  %cmp8 = icmp eq i32 %rem, 0, !dbg !56
  br i1 %cmp8, label %if.then9, label %if.end13, !dbg !57

if.then9:                                         ; preds = %land.lhs.true7
  %9 = load i32, i32* %a, align 4, !dbg !58
  %rem10 = srem i32 %9, 2, !dbg !60
  %cmp11 = icmp eq i32 %rem10, 1, !dbg !61
  br i1 %cmp11, label %land.rhs, label %land.end, !dbg !62

land.rhs:                                         ; preds = %if.then9
  %10 = load i32, i32* %a, align 4, !dbg !63
  %cmp12 = icmp sle i32 %10, 5, !dbg !64
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then9
  %11 = phi i1 [ false, %if.then9 ], [ %cmp12, %land.rhs ], !dbg !65
  call void @svf_assert(i1 zeroext %11), !dbg !66
  br label %if.end13, !dbg !67

if.end13:                                         ; preds = %land.end, %land.lhs.true7, %land.lhs.true, %for.end
  br label %if.end14, !dbg !68

if.end14:                                         ; preds = %if.end13, %entry
  %12 = load i32, i32* %retval, align 4, !dbg !69
  ret i32 %12, !dbg !69
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_24.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_24.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !13)
!15 = !DILocation(line: 6, column: 9, scope: !9)
!16 = !DILocation(line: 7, column: 9, scope: !17)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 9)
!18 = !DILocation(line: 7, column: 11, scope: !17)
!19 = !DILocation(line: 7, column: 9, scope: !9)
!20 = !DILocalVariable(name: "b", scope: !21, file: !10, line: 8, type: !13)
!21 = distinct !DILexicalBlock(scope: !17, file: !10, line: 7, column: 17)
!22 = !DILocation(line: 8, column: 13, scope: !21)
!23 = !DILocation(line: 8, column: 17, scope: !21)
!24 = !DILocalVariable(name: "i", scope: !21, file: !10, line: 9, type: !13)
!25 = !DILocation(line: 9, column: 13, scope: !21)
!26 = !DILocation(line: 10, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !10, line: 10, column: 9)
!28 = !DILocation(line: 10, column: 14, scope: !27)
!29 = !DILocation(line: 10, column: 21, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !10, line: 10, column: 9)
!31 = !DILocation(line: 10, column: 23, scope: !30)
!32 = !DILocation(line: 10, column: 9, scope: !27)
!33 = !DILocation(line: 11, column: 14, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 10, column: 33)
!35 = !DILocation(line: 12, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !34, file: !10, line: 12, column: 16)
!37 = !DILocation(line: 12, column: 18, scope: !36)
!38 = !DILocation(line: 12, column: 16, scope: !34)
!39 = !DILocation(line: 13, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 12, column: 24)
!41 = !DILocation(line: 15, column: 9, scope: !34)
!42 = !DILocation(line: 10, column: 29, scope: !30)
!43 = !DILocation(line: 10, column: 9, scope: !30)
!44 = distinct !{!44, !32, !45, !46}
!45 = !DILocation(line: 15, column: 9, scope: !27)
!46 = !{!"llvm.loop.mustprogress"}
!47 = !DILocation(line: 16, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !21, file: !10, line: 16, column: 13)
!49 = !DILocation(line: 16, column: 15, scope: !48)
!50 = !DILocation(line: 16, column: 19, scope: !48)
!51 = !DILocation(line: 16, column: 22, scope: !48)
!52 = !DILocation(line: 16, column: 24, scope: !48)
!53 = !DILocation(line: 16, column: 29, scope: !48)
!54 = !DILocation(line: 16, column: 32, scope: !48)
!55 = !DILocation(line: 16, column: 34, scope: !48)
!56 = !DILocation(line: 16, column: 38, scope: !48)
!57 = !DILocation(line: 16, column: 13, scope: !21)
!58 = !DILocation(line: 17, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !48, file: !10, line: 16, column: 44)
!60 = !DILocation(line: 17, column: 26, scope: !59)
!61 = !DILocation(line: 17, column: 30, scope: !59)
!62 = !DILocation(line: 17, column: 35, scope: !59)
!63 = !DILocation(line: 17, column: 38, scope: !59)
!64 = !DILocation(line: 17, column: 40, scope: !59)
!65 = !DILocation(line: 0, scope: !59)
!66 = !DILocation(line: 17, column: 13, scope: !59)
!67 = !DILocation(line: 18, column: 9, scope: !59)
!68 = !DILocation(line: 19, column: 5, scope: !21)
!69 = !DILocation(line: 20, column: 1, scope: !9)
