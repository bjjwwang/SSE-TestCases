; ModuleID = 'linux_bc/pass/BASIC_arraycopy1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_arraycopy1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %source = alloca [2 x i32*], align 16
  %x = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata [2 x i32*]* %source, metadata !18, metadata !DIExpression()), !dbg !23
  %arrayinit.begin = getelementptr inbounds [2 x i32*], [2 x i32*]* %source, i64 0, i64 0, !dbg !24
  store i32* %a, i32** %arrayinit.begin, align 8, !dbg !24
  %arrayinit.element = getelementptr inbounds i32*, i32** %arrayinit.begin, i64 1, !dbg !24
  store i32* %b, i32** %arrayinit.element, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32** %x, metadata !25, metadata !DIExpression()), !dbg !26
  %arrayidx = getelementptr inbounds [2 x i32*], [2 x i32*]* %source, i64 0, i64 1, !dbg !27
  %0 = load i32*, i32** %arrayidx, align 8, !dbg !27
  store i32* %0, i32** %x, align 8, !dbg !26
  %1 = load i32*, i32** %x, align 8, !dbg !28
  %cmp = icmp eq i32* %1, %b, !dbg !29
  %conv = zext i1 %cmp to i32, !dbg !29
  %call = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 %conv), !dbg !30
  ret i32 0, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @svf_assert(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_arraycopy1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 1, type: !11, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_arraycopy1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 2, type: !13)
!15 = !DILocation(line: 2, column: 6, scope: !9)
!16 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 2, type: !13)
!17 = !DILocation(line: 2, column: 9, scope: !9)
!18 = !DILocalVariable(name: "source", scope: !9, file: !10, line: 3, type: !19)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 128, elements: !21)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!21 = !{!22}
!22 = !DISubrange(count: 2)
!23 = !DILocation(line: 3, column: 7, scope: !9)
!24 = !DILocation(line: 3, column: 19, scope: !9)
!25 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 4, type: !20)
!26 = !DILocation(line: 4, column: 7, scope: !9)
!27 = !DILocation(line: 4, column: 11, scope: !9)
!28 = !DILocation(line: 5, column: 13, scope: !9)
!29 = !DILocation(line: 5, column: 14, scope: !9)
!30 = !DILocation(line: 5, column: 2, scope: !9)
!31 = !DILocation(line: 6, column: 2, scope: !9)
