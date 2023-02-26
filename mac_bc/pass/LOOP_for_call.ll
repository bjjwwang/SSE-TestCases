; ModuleID = 'mac_bc/pass/LOOP_for_call.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_for_call.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @add(i32 noundef %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %a.addr, align 4, !dbg !17
  %add = add nsw i32 %0, 1, !dbg !18
  ret i32 %add, !dbg !19
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !20 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %i, align 4, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %j, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 0, i32* %j, align 4, !dbg !26
  store i32 0, i32* %i, align 4, !dbg !27
  br label %for.cond, !dbg !29

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !30
  %cmp = icmp slt i32 %0, 5, !dbg !32
  br i1 %cmp, label %for.body, label %for.end, !dbg !33

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %j, align 4, !dbg !34
  %call = call i32 @add(i32 noundef %1), !dbg !36
  store i32 %call, i32* %j, align 4, !dbg !37
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !39
  %inc = add nsw i32 %2, 1, !dbg !39
  store i32 %inc, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !40, !llvm.loop !41

for.end:                                          ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !44
  %cmp1 = icmp eq i32 %3, 5, !dbg !45
  br i1 %cmp1, label %land.rhs, label %land.end, !dbg !46

land.rhs:                                         ; preds = %for.end
  %4 = load i32, i32* %j, align 4, !dbg !47
  %cmp2 = icmp eq i32 %4, 5, !dbg !48
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end
  %5 = phi i1 [ false, %for.end ], [ %cmp2, %land.rhs ], !dbg !49
  call void @svf_assert(i1 noundef zeroext %5), !dbg !50
  %6 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %6, !dbg !51
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/LOOP_for_call.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "add", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/LOOP_for_call.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 13, scope: !9)
!17 = !DILocation(line: 8, column: 12, scope: !9)
!18 = !DILocation(line: 8, column: 14, scope: !9)
!19 = !DILocation(line: 8, column: 5, scope: !9)
!20 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 10, type: !21, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!21 = !DISubroutineType(types: !22)
!22 = !{!13}
!23 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 11, type: !13)
!24 = !DILocation(line: 11, column: 9, scope: !20)
!25 = !DILocalVariable(name: "j", scope: !20, file: !10, line: 12, type: !13)
!26 = !DILocation(line: 12, column: 9, scope: !20)
!27 = !DILocation(line: 13, column: 12, scope: !28)
!28 = distinct !DILexicalBlock(scope: !20, file: !10, line: 13, column: 5)
!29 = !DILocation(line: 13, column: 10, scope: !28)
!30 = !DILocation(line: 13, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !10, line: 13, column: 5)
!32 = !DILocation(line: 13, column: 19, scope: !31)
!33 = !DILocation(line: 13, column: 5, scope: !28)
!34 = !DILocation(line: 14, column: 17, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 13, column: 29)
!36 = !DILocation(line: 14, column: 13, scope: !35)
!37 = !DILocation(line: 14, column: 11, scope: !35)
!38 = !DILocation(line: 15, column: 5, scope: !35)
!39 = !DILocation(line: 13, column: 25, scope: !31)
!40 = !DILocation(line: 13, column: 5, scope: !31)
!41 = distinct !{!41, !33, !42, !43}
!42 = !DILocation(line: 15, column: 5, scope: !28)
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 16, column: 16, scope: !20)
!45 = !DILocation(line: 16, column: 18, scope: !20)
!46 = !DILocation(line: 16, column: 23, scope: !20)
!47 = !DILocation(line: 16, column: 26, scope: !20)
!48 = !DILocation(line: 16, column: 28, scope: !20)
!49 = !DILocation(line: 0, scope: !20)
!50 = !DILocation(line: 16, column: 5, scope: !20)
!51 = !DILocation(line: 17, column: 1, scope: !20)
