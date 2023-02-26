; ModuleID = 'mac_bc/overflow_pass/INTERVAL_Overrun_ArrayIndex_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %data = alloca i32, align 4
  %buffer = alloca [2 x i32], align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !15
  call void @srand(i32 noundef %call), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %a, metadata !17, metadata !DIExpression()), !dbg !18
  %call1 = call i32 @rand(), !dbg !19
  %rem = srem i32 %call1, 5, !dbg !20
  store i32 %rem, i32* %a, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %data, metadata !21, metadata !DIExpression()), !dbg !22
  store i32 0, i32* %data, align 4, !dbg !22
  br label %while.cond, !dbg !23

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32, i32* %data, align 4, !dbg !24
  %1 = load i32, i32* %a, align 4, !dbg !25
  %cmp = icmp slt i32 %0, %1, !dbg !26
  br i1 %cmp, label %while.body, label %while.end, !dbg !23

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* %data, align 4, !dbg !27
  %inc = add nsw i32 %2, 1, !dbg !27
  store i32 %inc, i32* %data, align 4, !dbg !27
  br label %while.cond, !dbg !23, !llvm.loop !29

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata [2 x i32]* %buffer, metadata !32, metadata !DIExpression()), !dbg !36
  %3 = bitcast [2 x i32]* %buffer to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 4 %3, i8 0, i64 8, i1 false), !dbg !36
  %4 = load i32, i32* %data, align 4, !dbg !37
  %idxprom = sext i32 %4 to i64, !dbg !38
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !38
  store i32 1, i32* %arrayidx, align 4, !dbg !39
  ret i32 0, !dbg !40
}

declare void @srand(i32 noundef) #1

declare i32 @time(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @rand() #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/INTERVAL_Overrun_ArrayIndex_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocation(line: 4, column: 8, scope: !9)
!16 = !DILocation(line: 4, column: 2, scope: !9)
!17 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 5, type: !13)
!18 = !DILocation(line: 5, column: 6, scope: !9)
!19 = !DILocation(line: 5, column: 10, scope: !9)
!20 = !DILocation(line: 5, column: 17, scope: !9)
!21 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 6, type: !13)
!22 = !DILocation(line: 6, column: 9, scope: !9)
!23 = !DILocation(line: 7, column: 5, scope: !9)
!24 = !DILocation(line: 7, column: 12, scope: !9)
!25 = !DILocation(line: 7, column: 19, scope: !9)
!26 = !DILocation(line: 7, column: 17, scope: !9)
!27 = !DILocation(line: 8, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 22)
!29 = distinct !{!29, !23, !30, !31}
!30 = !DILocation(line: 9, column: 5, scope: !9)
!31 = !{!"llvm.loop.mustprogress"}
!32 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 11, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 2)
!36 = !DILocation(line: 11, column: 6, scope: !9)
!37 = !DILocation(line: 12, column: 9, scope: !9)
!38 = !DILocation(line: 12, column: 2, scope: !9)
!39 = !DILocation(line: 12, column: 15, scope: !9)
!40 = !DILocation(line: 13, column: 5, scope: !9)
