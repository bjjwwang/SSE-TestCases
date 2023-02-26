; ModuleID = 'mac_bc/pass/LOOP_for_nested.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_for_nested.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %i, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %j, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %j, align 4, !dbg !18
  store i32 0, i32* %i, align 4, !dbg !19
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc4, %entry
  %0 = load i32, i32* %i, align 4, !dbg !22
  %cmp = icmp slt i32 %0, 5, !dbg !24
  br i1 %cmp, label %for.body, label %for.end6, !dbg !25

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4, !dbg !26
  br label %for.cond1, !dbg !29

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %j, align 4, !dbg !30
  %cmp2 = icmp slt i32 %1, 3, !dbg !32
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !33

for.body3:                                        ; preds = %for.cond1
  br label %for.inc, !dbg !34

for.inc:                                          ; preds = %for.body3
  %2 = load i32, i32* %j, align 4, !dbg !36
  %inc = add nsw i32 %2, 1, !dbg !36
  store i32 %inc, i32* %j, align 4, !dbg !36
  br label %for.cond1, !dbg !37, !llvm.loop !38

for.end:                                          ; preds = %for.cond1
  br label %for.inc4, !dbg !41

for.inc4:                                         ; preds = %for.end
  %3 = load i32, i32* %i, align 4, !dbg !42
  %inc5 = add nsw i32 %3, 1, !dbg !42
  store i32 %inc5, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43, !llvm.loop !44

for.end6:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4, !dbg !46
  %cmp7 = icmp eq i32 %4, 5, !dbg !47
  br i1 %cmp7, label %land.rhs, label %land.end, !dbg !48

land.rhs:                                         ; preds = %for.end6
  %5 = load i32, i32* %j, align 4, !dbg !49
  %cmp8 = icmp eq i32 %5, 3, !dbg !50
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end6
  %6 = phi i1 [ false, %for.end6 ], [ %cmp8, %land.rhs ], !dbg !51
  call void @svf_assert(i1 noundef zeroext %6), !dbg !52
  %7 = load i32, i32* %retval, align 4, !dbg !53
  ret i32 %7, !dbg !53
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_for_nested.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/LOOP_for_nested.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 9, scope: !9)
!17 = !DILocalVariable(name: "j", scope: !9, file: !10, line: 5, type: !13)
!18 = !DILocation(line: 5, column: 9, scope: !9)
!19 = !DILocation(line: 6, column: 12, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 6, column: 5)
!21 = !DILocation(line: 6, column: 10, scope: !20)
!22 = !DILocation(line: 6, column: 17, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !10, line: 6, column: 5)
!24 = !DILocation(line: 6, column: 19, scope: !23)
!25 = !DILocation(line: 6, column: 5, scope: !20)
!26 = !DILocation(line: 7, column: 16, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !10, line: 7, column: 9)
!28 = distinct !DILexicalBlock(scope: !23, file: !10, line: 6, column: 29)
!29 = !DILocation(line: 7, column: 14, scope: !27)
!30 = !DILocation(line: 7, column: 21, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !10, line: 7, column: 9)
!32 = !DILocation(line: 7, column: 23, scope: !31)
!33 = !DILocation(line: 7, column: 9, scope: !27)
!34 = !DILocation(line: 9, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 7, column: 33)
!36 = !DILocation(line: 7, column: 28, scope: !31)
!37 = !DILocation(line: 7, column: 9, scope: !31)
!38 = distinct !{!38, !33, !39, !40}
!39 = !DILocation(line: 9, column: 9, scope: !27)
!40 = !{!"llvm.loop.mustprogress"}
!41 = !DILocation(line: 10, column: 5, scope: !28)
!42 = !DILocation(line: 6, column: 25, scope: !23)
!43 = !DILocation(line: 6, column: 5, scope: !23)
!44 = distinct !{!44, !25, !45, !40}
!45 = !DILocation(line: 10, column: 5, scope: !20)
!46 = !DILocation(line: 11, column: 16, scope: !9)
!47 = !DILocation(line: 11, column: 18, scope: !9)
!48 = !DILocation(line: 11, column: 23, scope: !9)
!49 = !DILocation(line: 11, column: 26, scope: !9)
!50 = !DILocation(line: 11, column: 28, scope: !9)
!51 = !DILocation(line: 0, scope: !9)
!52 = !DILocation(line: 11, column: 5, scope: !9)
!53 = !DILocation(line: 12, column: 1, scope: !9)
