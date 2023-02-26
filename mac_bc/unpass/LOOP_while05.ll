; ModuleID = 'mac_bc/unpass/LOOP_while05.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/LOOP_while05.c"
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
  br label %while.cond, !dbg !21

while.cond:                                       ; preds = %if.end8, %entry
  %call = call i32 @nd(), !dbg !22
  %tobool = icmp ne i32 %call, 0, !dbg !21
  br i1 %tobool, label %while.body, label %while.end, !dbg !21

while.body:                                       ; preds = %while.cond
  %call1 = call i32 @nd(), !dbg !23
  %tobool2 = icmp ne i32 %call1, 0, !dbg !23
  br i1 %tobool2, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %while.body
  %0 = load i32, i32* %x, align 4, !dbg !27
  %inc = add nsw i32 %0, 1, !dbg !27
  store i32 %inc, i32* %x, align 4, !dbg !27
  %1 = load i32, i32* %y, align 4, !dbg !29
  %inc3 = add nsw i32 %1, 1, !dbg !29
  store i32 %inc3, i32* %y, align 4, !dbg !29
  %2 = load i32, i32* %x, align 4, !dbg !30
  %3 = load i32, i32* %y, align 4, !dbg !31
  %cmp = icmp eq i32 %2, %3, !dbg !32
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %while.body
  %call4 = call i32 @nd(), !dbg !35
  %tobool5 = icmp ne i32 %call4, 0, !dbg !35
  br i1 %tobool5, label %if.then6, label %if.end8, !dbg !37

if.then6:                                         ; preds = %if.end
  %4 = load i32, i32* %x, align 4, !dbg !38
  %inc7 = add nsw i32 %4, 1, !dbg !38
  store i32 %inc7, i32* %x, align 4, !dbg !38
  br label %if.end8, !dbg !40

if.end8:                                          ; preds = %if.then6, %if.end
  br label %while.cond, !dbg !21, !llvm.loop !41

while.end:                                        ; preds = %while.cond
  ret i32 0, !dbg !44
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/LOOP_while05.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/unpass/LOOP_while05.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 9, type: !13)
!16 = !DILocation(line: 9, column: 9, scope: !9)
!17 = !DILocalVariable(name: "y", scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 11, scope: !9)
!19 = !DILocation(line: 10, column: 6, scope: !9)
!20 = !DILocation(line: 10, column: 11, scope: !9)
!21 = !DILocation(line: 11, column: 5, scope: !9)
!22 = !DILocation(line: 11, column: 11, scope: !9)
!23 = !DILocation(line: 12, column: 13, scope: !24)
!24 = distinct !DILexicalBlock(scope: !25, file: !10, line: 12, column: 13)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 17)
!26 = !DILocation(line: 12, column: 13, scope: !25)
!27 = !DILocation(line: 13, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 12, column: 19)
!29 = !DILocation(line: 14, column: 14, scope: !28)
!30 = !DILocation(line: 15, column: 25, scope: !28)
!31 = !DILocation(line: 15, column: 30, scope: !28)
!32 = !DILocation(line: 15, column: 27, scope: !28)
!33 = !DILocation(line: 15, column: 13, scope: !28)
!34 = !DILocation(line: 16, column: 9, scope: !28)
!35 = !DILocation(line: 17, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !25, file: !10, line: 17, column: 13)
!37 = !DILocation(line: 17, column: 13, scope: !25)
!38 = !DILocation(line: 18, column: 14, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !10, line: 17, column: 19)
!40 = !DILocation(line: 19, column: 9, scope: !39)
!41 = distinct !{!41, !21, !42, !43}
!42 = !DILocation(line: 20, column: 5, scope: !9)
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 22, column: 5, scope: !9)
