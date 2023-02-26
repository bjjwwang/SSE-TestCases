; ModuleID = 'linux_bc/unpass/BASIC_ptr_s32.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/unpass/BASIC_ptr_s32.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !12 {
entry:
  %p = alloca i32*, align 8
  %a = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %p, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = alloca i8, i64 16, align 16, !dbg !18
  %1 = bitcast i8* %0 to i32*, !dbg !19
  store i32* %1, i32** %p, align 8, !dbg !17
  %2 = load i32*, i32** %p, align 8, !dbg !20
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 5, !dbg !20
  store i32 1, i32* %arrayidx, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata [10 x i32]* %a, metadata !22, metadata !DIExpression()), !dbg !26
  %arrayidx1 = getelementptr inbounds [10 x i32], [10 x i32]* %a, i64 0, i64 11, !dbg !27
  store i32* %arrayidx1, i32** %p, align 8, !dbg !28
  ret i32 0, !dbg !29
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/unpass/BASIC_ptr_s32.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 4}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"clang version 13.0.0"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 9, type: !14, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!13 = !DIFile(filename: "src/unpass/BASIC_ptr_s32.c", directory: "/home/SVF-tools/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!5}
!16 = !DILocalVariable(name: "p", scope: !12, file: !13, line: 10, type: !4)
!17 = !DILocation(line: 10, column: 10, scope: !12)
!18 = !DILocation(line: 10, column: 21, scope: !12)
!19 = !DILocation(line: 10, column: 14, scope: !12)
!20 = !DILocation(line: 11, column: 5, scope: !12)
!21 = !DILocation(line: 11, column: 10, scope: !12)
!22 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 13, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 320, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 10)
!26 = !DILocation(line: 13, column: 9, scope: !12)
!27 = !DILocation(line: 14, column: 10, scope: !12)
!28 = !DILocation(line: 14, column: 7, scope: !12)
!29 = !DILocation(line: 15, column: 1, scope: !12)
