; ModuleID = 'mac_bc/pass/BASIC_arraycopy1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_arraycopy1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %source = alloca [2 x i32*], align 16
  %x = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %b, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [2 x i32*]* %source, metadata !19, metadata !DIExpression()), !dbg !24
  %arrayinit.begin = getelementptr inbounds [2 x i32*], [2 x i32*]* %source, i64 0, i64 0, !dbg !25
  store i32* %a, i32** %arrayinit.begin, align 8, !dbg !25
  %arrayinit.element = getelementptr inbounds i32*, i32** %arrayinit.begin, i64 1, !dbg !25
  store i32* %b, i32** %arrayinit.element, align 8, !dbg !25
  call void @llvm.dbg.declare(metadata i32** %x, metadata !26, metadata !DIExpression()), !dbg !27
  %arrayidx = getelementptr inbounds [2 x i32*], [2 x i32*]* %source, i64 0, i64 1, !dbg !28
  %0 = load i32*, i32** %arrayidx, align 8, !dbg !28
  store i32* %0, i32** %x, align 8, !dbg !27
  %1 = load i32*, i32** %x, align 8, !dbg !29
  %cmp = icmp eq i32* %1, %b, !dbg !30
  %conv = zext i1 %cmp to i32, !dbg !30
  %call = call i32 (i32, ...) bitcast (i32 (...)* @svf_assert to i32 (i32, ...)*)(i32 noundef %conv), !dbg !31
  ret i32 0, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @svf_assert(...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_arraycopy1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 1, type: !11, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_arraycopy1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 2, type: !13)
!16 = !DILocation(line: 2, column: 6, scope: !9)
!17 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 2, type: !13)
!18 = !DILocation(line: 2, column: 9, scope: !9)
!19 = !DILocalVariable(name: "source", scope: !9, file: !10, line: 3, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 128, elements: !22)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!22 = !{!23}
!23 = !DISubrange(count: 2)
!24 = !DILocation(line: 3, column: 7, scope: !9)
!25 = !DILocation(line: 3, column: 19, scope: !9)
!26 = !DILocalVariable(name: "x", scope: !9, file: !10, line: 4, type: !21)
!27 = !DILocation(line: 4, column: 7, scope: !9)
!28 = !DILocation(line: 4, column: 11, scope: !9)
!29 = !DILocation(line: 5, column: 13, scope: !9)
!30 = !DILocation(line: 5, column: 14, scope: !9)
!31 = !DILocation(line: 5, column: 2, scope: !9)
!32 = !DILocation(line: 6, column: 2, scope: !9)
