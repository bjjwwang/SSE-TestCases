; ModuleID = 'linux_bc/unpass/LOOP_while04.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/unpass/LOOP_while04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %y, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 1, i32* %x, align 4, !dbg !18
  store i32 1, i32* %y, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %n, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 3, i32* %n, align 4, !dbg !22
  br label %while.cond, !dbg !23

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %n, align 4, !dbg !24
  %tobool = icmp ne i32 %0, 0, !dbg !23
  br i1 %tobool, label %while.body, label %while.end, !dbg !23

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %n, align 4, !dbg !25
  %tobool1 = icmp ne i32 %1, 0, !dbg !25
  br i1 %tobool1, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %while.body
  %2 = load i32, i32* %x, align 4, !dbg !29
  %inc = add nsw i32 %2, 1, !dbg !29
  store i32 %inc, i32* %x, align 4, !dbg !29
  %3 = load i32, i32* %y, align 4, !dbg !31
  %dec = add nsw i32 %3, -1, !dbg !31
  store i32 %dec, i32* %y, align 4, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %while.body
  %4 = load i32, i32* %n, align 4, !dbg !33
  %dec2 = add nsw i32 %4, -1, !dbg !33
  store i32 %dec2, i32* %n, align 4, !dbg !33
  br label %while.cond, !dbg !23, !llvm.loop !34

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %x, align 4, !dbg !37
  %6 = load i32, i32* %y, align 4, !dbg !38
  %add = add nsw i32 %5, %6, !dbg !39
  %cmp = icmp eq i32 %add, 2, !dbg !40
  call void @svf_assert(i1 zeroext %cmp), !dbg !41
  ret i32 0, !dbg !42
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/unpass/LOOP_while04.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/unpass/LOOP_while04.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 9, type: !13)
!15 = !DILocation(line: 9, column: 9, scope: !9)
!16 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 9, type: !13)
!17 = !DILocation(line: 9, column: 11, scope: !9)
!18 = !DILocation(line: 10, column: 6, scope: !9)
!19 = !DILocation(line: 10, column: 11, scope: !9)
!20 = !DILocalVariable(name: "n", scope: !9, file: !10, line: 11, type: !13)
!21 = !DILocation(line: 11, column: 9, scope: !9)
!22 = !DILocation(line: 12, column: 7, scope: !9)
!23 = !DILocation(line: 13, column: 5, scope: !9)
!24 = !DILocation(line: 13, column: 11, scope: !9)
!25 = !DILocation(line: 14, column: 13, scope: !26)
!26 = distinct !DILexicalBlock(scope: !27, file: !10, line: 14, column: 13)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 14)
!28 = !DILocation(line: 14, column: 13, scope: !27)
!29 = !DILocation(line: 15, column: 14, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !10, line: 14, column: 16)
!31 = !DILocation(line: 16, column: 14, scope: !30)
!32 = !DILocation(line: 17, column: 9, scope: !30)
!33 = !DILocation(line: 18, column: 10, scope: !27)
!34 = distinct !{!34, !23, !35, !36}
!35 = !DILocation(line: 19, column: 5, scope: !9)
!36 = !{!"llvm.loop.mustprogress"}
!37 = !DILocation(line: 20, column: 18, scope: !9)
!38 = !DILocation(line: 20, column: 20, scope: !9)
!39 = !DILocation(line: 20, column: 19, scope: !9)
!40 = !DILocation(line: 20, column: 23, scope: !9)
!41 = !DILocation(line: 20, column: 5, scope: !9)
!42 = !DILocation(line: 21, column: 5, scope: !9)
