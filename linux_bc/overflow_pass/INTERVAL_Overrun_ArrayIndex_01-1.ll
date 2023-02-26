; ModuleID = 'linux_bc/overflow_pass/INTERVAL_Overrun_ArrayIndex_01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_01-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [2 x i32], align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !14
  call void @srand(i32 %call) #5, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %a, metadata !16, metadata !DIExpression()), !dbg !17
  %call1 = call i32 @rand() #5, !dbg !18
  %rem = srem i32 %call1, 5, !dbg !19
  store i32 %rem, i32* %a, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %data, align 4, !dbg !21
  br label %while.cond, !dbg !22

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %data, align 4, !dbg !23
  %1 = load i32, i32* %a, align 4, !dbg !24
  %cmp = icmp slt i32 %0, %1, !dbg !25
  br i1 %cmp, label %while.body, label %while.end, !dbg !22

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %data, align 4, !dbg !26
  %inc = add nsw i32 %2, 1, !dbg !26
  store i32 %inc, i32* %data, align 4, !dbg !26
  br label %while.cond, !dbg !22, !llvm.loop !28

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata [2 x i32]* %buffer, metadata !31, metadata !DIExpression()), !dbg !35
  %3 = bitcast [2 x i32]* %buffer to i8*, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 8, i1 false), !dbg !35
  %4 = load i32, i32* %data, align 4, !dbg !36
  %idxprom = sext i32 %4 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  store i32 1, i32* %arrayidx, align 4, !dbg !38
  ret i32 0, !dbg !39
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

declare dso_local i32 @time(...) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/INTERVAL_Overrun_ArrayIndex_01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocation(line: 4, column: 8, scope: !9)
!15 = !DILocation(line: 4, column: 2, scope: !9)
!16 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 5, type: !13)
!17 = !DILocation(line: 5, column: 6, scope: !9)
!18 = !DILocation(line: 5, column: 10, scope: !9)
!19 = !DILocation(line: 5, column: 17, scope: !9)
!20 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 6, type: !13)
!21 = !DILocation(line: 6, column: 9, scope: !9)
!22 = !DILocation(line: 7, column: 5, scope: !9)
!23 = !DILocation(line: 7, column: 12, scope: !9)
!24 = !DILocation(line: 7, column: 19, scope: !9)
!25 = !DILocation(line: 7, column: 17, scope: !9)
!26 = !DILocation(line: 8, column: 13, scope: !27)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 22)
!28 = distinct !{!28, !22, !29, !30}
!29 = !DILocation(line: 9, column: 5, scope: !9)
!30 = !{!"llvm.loop.mustprogress"}
!31 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 11, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 2)
!35 = !DILocation(line: 11, column: 6, scope: !9)
!36 = !DILocation(line: 12, column: 9, scope: !9)
!37 = !DILocation(line: 12, column: 2, scope: !9)
!38 = !DILocation(line: 12, column: 15, scope: !9)
!39 = !DILocation(line: 13, column: 5, scope: !9)
