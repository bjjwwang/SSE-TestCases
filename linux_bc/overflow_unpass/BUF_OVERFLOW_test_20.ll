; ModuleID = 'linux_bc/overflow_unpass/BUF_OVERFLOW_test_20.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_20.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@__const.main.source = private unnamed_addr constant [5 x i32] [i32 9, i32 9, i32 9, i32 9, i32 9], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %source = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %source, metadata !14, metadata !DIExpression()), !dbg !18
  %0 = bitcast [5 x i32]* %source to i8*, !dbg !18
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %0, i8* align 16 bitcast ([5 x i32]* @__const.main.source to i8*), i64 20, i1 false), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 5, i32* %i, align 4, !dbg !20
  br label %do.body, !dbg !21

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i32, i32* %i, align 4, !dbg !22
  %div = sdiv i32 5, %1, !dbg !24
  %idxprom = sext i32 %div to i64, !dbg !25
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %source, i64 0, i64 %idxprom, !dbg !25
  store i32 1, i32* %arrayidx, align 4, !dbg !26
  %2 = load i32, i32* %i, align 4, !dbg !27
  %dec = add nsw i32 %2, -1, !dbg !27
  store i32 %dec, i32* %i, align 4, !dbg !27
  br label %do.cond, !dbg !28

do.cond:                                          ; preds = %do.body
  %3 = load i32, i32* %i, align 4, !dbg !29
  %tobool = icmp ne i32 %3, 0, !dbg !28
  br i1 %tobool, label %do.body, label %do.end, !dbg !28, !llvm.loop !30

do.end:                                           ; preds = %do.cond
  %4 = load i32, i32* %retval, align 4, !dbg !33
  ret i32 %4, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_20.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_20.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "source", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 5)
!18 = !DILocation(line: 8, column: 9, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 9, type: !13)
!20 = !DILocation(line: 9, column: 9, scope: !9)
!21 = !DILocation(line: 10, column: 5, scope: !9)
!22 = !DILocation(line: 11, column: 18, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 8)
!24 = !DILocation(line: 11, column: 17, scope: !23)
!25 = !DILocation(line: 11, column: 9, scope: !23)
!26 = !DILocation(line: 11, column: 21, scope: !23)
!27 = !DILocation(line: 12, column: 10, scope: !23)
!28 = !DILocation(line: 13, column: 5, scope: !23)
!29 = !DILocation(line: 13, column: 13, scope: !9)
!30 = distinct !{!30, !21, !31, !32}
!31 = !DILocation(line: 13, column: 14, scope: !9)
!32 = !{!"llvm.loop.mustprogress"}
!33 = !DILocation(line: 14, column: 1, scope: !9)
