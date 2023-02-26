; ModuleID = 'mac_bc/unpass/BASIC_ptr_s32.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/BASIC_ptr_s32.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !12 {
entry:
  %p = alloca i32*, align 8
  %a = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %p, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = alloca i8, i64 16, align 16, !dbg !19
  %1 = bitcast i8* %0 to i32*, !dbg !20
  store i32* %1, i32** %p, align 8, !dbg !18
  %2 = load i32*, i32** %p, align 8, !dbg !21
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 5, !dbg !21
  store i32 1, i32* %arrayidx, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %a, metadata !23, metadata !DIExpression()), !dbg !27
  %arrayidx1 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 11, !dbg !28
  store i32* %arrayidx1, i32** %p, align 8, !dbg !29
  ret i32 0, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/unpass/BASIC_ptr_s32.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 9, type: !14, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/unpass/BASIC_ptr_s32.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!4}
!16 = !{}
!17 = !DILocalVariable(name: "p", scope: !12, file: !13, line: 10, type: !3)
!18 = !DILocation(line: 10, column: 10, scope: !12)
!19 = !DILocation(line: 10, column: 21, scope: !12)
!20 = !DILocation(line: 10, column: 14, scope: !12)
!21 = !DILocation(line: 11, column: 5, scope: !12)
!22 = !DILocation(line: 11, column: 10, scope: !12)
!23 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 13, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 13, column: 9, scope: !12)
!28 = !DILocation(line: 14, column: 10, scope: !12)
!29 = !DILocation(line: 14, column: 7, scope: !12)
!30 = !DILocation(line: 15, column: 1, scope: !12)
