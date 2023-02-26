; ModuleID = 'linux_bc/unpass/LOOP_while05.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/unpass/LOOP_while05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %y, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 1, i32* %x, align 4, !dbg !18
  store i32 1, i32* %y, align 4, !dbg !19
  br label %while.cond, !dbg !20

while.cond:                                       ; preds = %if.end8, %entry
  %call = call i32 @nd(), !dbg !21
  %tobool = icmp ne i32 %call, 0, !dbg !20
  br i1 %tobool, label %while.body, label %while.end, !dbg !20

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @nd(), !dbg !22
  %tobool2 = icmp ne i32 %call1, 0, !dbg !22
  br i1 %tobool2, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %while.body
  %0 = load i32, i32* %x, align 4, !dbg !26
  %inc = add nsw i32 %0, 1, !dbg !26
  store i32 %inc, i32* %x, align 4, !dbg !26
  %1 = load i32, i32* %y, align 4, !dbg !28
  %inc3 = add nsw i32 %1, 1, !dbg !28
  store i32 %inc3, i32* %y, align 4, !dbg !28
  %2 = load i32, i32* %x, align 4, !dbg !29
  %3 = load i32, i32* %y, align 4, !dbg !30
  %cmp = icmp eq i32 %2, %3, !dbg !31
  call void @svf_assert(i1 zeroext %cmp), !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %while.body
  %call4 = call i32 @nd(), !dbg !34
  %tobool5 = icmp ne i32 %call4, 0, !dbg !34
  br i1 %tobool5, label %if.then6, label %if.end8, !dbg !36

if.then6:                                         ; preds = %if.end
  %4 = load i32, i32* %x, align 4, !dbg !37
  %inc7 = add nsw i32 %4, 1, !dbg !37
  store i32 %inc7, i32* %x, align 4, !dbg !37
  br label %if.end8, !dbg !39

if.end8:                                          ; preds = %if.then6, %if.end
  br label %while.cond, !dbg !20, !llvm.loop !40

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @nd() #2

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/unpass/LOOP_while05.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/unpass/LOOP_while05.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 9, type: !13)
!15 = !DILocation(line: 9, column: 9, scope: !9)
!16 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 9, type: !13)
!17 = !DILocation(line: 9, column: 11, scope: !9)
!18 = !DILocation(line: 10, column: 6, scope: !9)
!19 = !DILocation(line: 10, column: 11, scope: !9)
!20 = !DILocation(line: 11, column: 5, scope: !9)
!21 = !DILocation(line: 11, column: 11, scope: !9)
!22 = !DILocation(line: 12, column: 13, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !10, line: 12, column: 13)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 17)
!25 = !DILocation(line: 12, column: 13, scope: !24)
!26 = !DILocation(line: 13, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !10, line: 12, column: 19)
!28 = !DILocation(line: 14, column: 14, scope: !27)
!29 = !DILocation(line: 15, column: 25, scope: !27)
!30 = !DILocation(line: 15, column: 30, scope: !27)
!31 = !DILocation(line: 15, column: 27, scope: !27)
!32 = !DILocation(line: 15, column: 13, scope: !27)
!33 = !DILocation(line: 16, column: 9, scope: !27)
!34 = !DILocation(line: 17, column: 13, scope: !35)
!35 = distinct !DILexicalBlock(scope: !24, file: !10, line: 17, column: 13)
!36 = !DILocation(line: 17, column: 13, scope: !24)
!37 = !DILocation(line: 18, column: 14, scope: !38)
!38 = distinct !DILexicalBlock(scope: !35, file: !10, line: 17, column: 19)
!39 = !DILocation(line: 19, column: 9, scope: !38)
!40 = distinct !{!40, !20, !41, !42}
!41 = !DILocation(line: 20, column: 5, scope: !9)
!42 = !{!"llvm.loop.mustprogress"}
!43 = !DILocation(line: 22, column: 5, scope: !9)
