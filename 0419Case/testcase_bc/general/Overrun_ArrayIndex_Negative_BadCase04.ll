; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/general/Overrun_ArrayIndex_Negative_BadCase04.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_ArrayIndex_Negative_BadCase04.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestBadCase04() #0 !dbg !9 {
entry:
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !19
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !19
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !19
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 -1, !dbg !20
  store i32 0, i32* %arrayidx, align 4, !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_ArrayIndex_Negative_BadCase04.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "TestBadCase04", scope: !10, file: !10, line: 9, type: !11, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !13)
!10 = !DIFile(filename: "general/Overrun_ArrayIndex_Negative_BadCase04.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !{}
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 11, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !17)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DILocation(line: 11, column: 9, scope: !9)
!20 = !DILocation(line: 13, column: 5, scope: !9)
!21 = !DILocation(line: 13, column: 16, scope: !9)
!22 = !DILocation(line: 14, column: 1, scope: !9)
