; ModuleID = 'linux_bc/pass/LOOP_for_call.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/LOOP_for_call.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @add(i32 %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %a.addr, align 4, !dbg !16
  %add = add nsw i32 %0, 1, !dbg !17
  ret i32 %add, !dbg !18
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !19 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %i, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %j, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %j, align 4, !dbg !25
  store i32 0, i32* %i, align 4, !dbg !26
  br label %for.cond, !dbg !28

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !29
  %cmp = icmp slt i32 %0, 5, !dbg !31
  br i1 %cmp, label %for.body, label %for.end, !dbg !32

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %j, align 4, !dbg !33
  %call = call i32 @add(i32 %1), !dbg !35
  store i32 %call, i32* %j, align 4, !dbg !36
  br label %for.inc, !dbg !37

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4, !dbg !38
  %inc = add nsw i32 %2, 1, !dbg !38
  store i32 %inc, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !39, !llvm.loop !40

for.end:                                          ; preds = %for.cond
  %3 = load i32, i32* %i, align 4, !dbg !43
  %cmp1 = icmp eq i32 %3, 5, !dbg !44
  br i1 %cmp1, label %land.rhs, label %land.end, !dbg !45

land.rhs:                                         ; preds = %for.end
  %4 = load i32, i32* %j, align 4, !dbg !46
  %cmp2 = icmp eq i32 %4, 5, !dbg !47
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end
  %5 = phi i1 [ false, %for.end ], [ %cmp2, %land.rhs ], !dbg !48
  call void @svf_assert(i1 zeroext %5), !dbg !49
  %6 = load i32, i32* %retval, align 4, !dbg !50
  ret i32 %6, !dbg !50
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/LOOP_for_call.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "add", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/LOOP_for_call.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 13, scope: !9)
!16 = !DILocation(line: 8, column: 12, scope: !9)
!17 = !DILocation(line: 8, column: 14, scope: !9)
!18 = !DILocation(line: 8, column: 5, scope: !9)
!19 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 10, type: !20, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DISubroutineType(types: !21)
!21 = !{!13}
!22 = !DILocalVariable(name: "i", scope: !19, file: !10, line: 11, type: !13)
!23 = !DILocation(line: 11, column: 9, scope: !19)
!24 = !DILocalVariable(name: "j", scope: !19, file: !10, line: 12, type: !13)
!25 = !DILocation(line: 12, column: 9, scope: !19)
!26 = !DILocation(line: 13, column: 12, scope: !27)
!27 = distinct !DILexicalBlock(scope: !19, file: !10, line: 13, column: 5)
!28 = !DILocation(line: 13, column: 10, scope: !27)
!29 = !DILocation(line: 13, column: 17, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !10, line: 13, column: 5)
!31 = !DILocation(line: 13, column: 19, scope: !30)
!32 = !DILocation(line: 13, column: 5, scope: !27)
!33 = !DILocation(line: 14, column: 17, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 13, column: 29)
!35 = !DILocation(line: 14, column: 13, scope: !34)
!36 = !DILocation(line: 14, column: 11, scope: !34)
!37 = !DILocation(line: 15, column: 5, scope: !34)
!38 = !DILocation(line: 13, column: 25, scope: !30)
!39 = !DILocation(line: 13, column: 5, scope: !30)
!40 = distinct !{!40, !32, !41, !42}
!41 = !DILocation(line: 15, column: 5, scope: !27)
!42 = !{!"llvm.loop.mustprogress"}
!43 = !DILocation(line: 16, column: 16, scope: !19)
!44 = !DILocation(line: 16, column: 18, scope: !19)
!45 = !DILocation(line: 16, column: 23, scope: !19)
!46 = !DILocation(line: 16, column: 26, scope: !19)
!47 = !DILocation(line: 16, column: 28, scope: !19)
!48 = !DILocation(line: 0, scope: !19)
!49 = !DILocation(line: 16, column: 5, scope: !19)
!50 = !DILocation(line: 17, column: 1, scope: !19)
