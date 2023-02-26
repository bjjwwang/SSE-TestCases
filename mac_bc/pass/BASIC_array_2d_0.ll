; ModuleID = 'mac_bc/pass/BASIC_array_2d_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_2d_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [3 x [3 x i32]], align 16
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x [3 x i32]]* %a, metadata !15, metadata !DIExpression()), !dbg !19
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 0, !dbg !20
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx, i64 0, i64 0, !dbg !20
  store i32 0, i32* %arrayidx1, align 16, !dbg !21
  %arrayidx2 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 0, !dbg !22
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx2, i64 0, i64 1, !dbg !22
  store i32 1, i32* %arrayidx3, align 4, !dbg !23
  %arrayidx4 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 0, !dbg !24
  %arrayidx5 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx4, i64 0, i64 2, !dbg !24
  store i32 2, i32* %arrayidx5, align 8, !dbg !25
  %arrayidx6 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 1, !dbg !26
  %arrayidx7 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx6, i64 0, i64 0, !dbg !26
  store i32 3, i32* %arrayidx7, align 4, !dbg !27
  %arrayidx8 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 1, !dbg !28
  %arrayidx9 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx8, i64 0, i64 1, !dbg !28
  store i32 4, i32* %arrayidx9, align 4, !dbg !29
  %arrayidx10 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 1, !dbg !30
  %arrayidx11 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx10, i64 0, i64 2, !dbg !30
  store i32 5, i32* %arrayidx11, align 4, !dbg !31
  %arrayidx12 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 2, !dbg !32
  %arrayidx13 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx12, i64 0, i64 0, !dbg !32
  store i32 6, i32* %arrayidx13, align 8, !dbg !33
  %arrayidx14 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 2, !dbg !34
  %arrayidx15 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx14, i64 0, i64 1, !dbg !34
  store i32 7, i32* %arrayidx15, align 4, !dbg !35
  %arrayidx16 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 2, !dbg !36
  %arrayidx17 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx16, i64 0, i64 2, !dbg !36
  store i32 8, i32* %arrayidx17, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %b, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 2, i32* %b, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %c, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 2, i32* %c, align 4, !dbg !41
  %0 = load i32, i32* %b, align 4, !dbg !42
  %idxprom = sext i32 %0 to i64, !dbg !43
  %arrayidx18 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]]* %a, i64 0, i64 %idxprom, !dbg !43
  %1 = load i32, i32* %c, align 4, !dbg !44
  %idxprom19 = sext i32 %1 to i64, !dbg !43
  %arrayidx20 = getelementptr inbounds [3 x i32], [3 x i32]* %arrayidx18, i64 0, i64 %idxprom19, !dbg !43
  %2 = load i32, i32* %arrayidx20, align 4, !dbg !43
  %cmp = icmp eq i32 %2, 8, !dbg !45
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !46
  ret i32 0, !dbg !47
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_2d_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_array_2d_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 288, elements: !17)
!17 = !{!18, !18}
!18 = !DISubrange(count: 3)
!19 = !DILocation(line: 9, column: 9, scope: !9)
!20 = !DILocation(line: 10, column: 5, scope: !9)
!21 = !DILocation(line: 10, column: 13, scope: !9)
!22 = !DILocation(line: 11, column: 5, scope: !9)
!23 = !DILocation(line: 11, column: 13, scope: !9)
!24 = !DILocation(line: 12, column: 5, scope: !9)
!25 = !DILocation(line: 12, column: 13, scope: !9)
!26 = !DILocation(line: 13, column: 5, scope: !9)
!27 = !DILocation(line: 13, column: 13, scope: !9)
!28 = !DILocation(line: 14, column: 5, scope: !9)
!29 = !DILocation(line: 14, column: 13, scope: !9)
!30 = !DILocation(line: 15, column: 5, scope: !9)
!31 = !DILocation(line: 15, column: 13, scope: !9)
!32 = !DILocation(line: 16, column: 5, scope: !9)
!33 = !DILocation(line: 16, column: 13, scope: !9)
!34 = !DILocation(line: 17, column: 5, scope: !9)
!35 = !DILocation(line: 17, column: 13, scope: !9)
!36 = !DILocation(line: 18, column: 5, scope: !9)
!37 = !DILocation(line: 18, column: 13, scope: !9)
!38 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 20, type: !13)
!39 = !DILocation(line: 20, column: 9, scope: !9)
!40 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 20, type: !13)
!41 = !DILocation(line: 20, column: 16, scope: !9)
!42 = !DILocation(line: 21, column: 18, scope: !9)
!43 = !DILocation(line: 21, column: 16, scope: !9)
!44 = !DILocation(line: 21, column: 21, scope: !9)
!45 = !DILocation(line: 21, column: 24, scope: !9)
!46 = !DILocation(line: 21, column: 5, scope: !9)
!47 = !DILocation(line: 22, column: 5, scope: !9)
