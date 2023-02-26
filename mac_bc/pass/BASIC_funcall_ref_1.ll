; ModuleID = 'mac_bc/pass/BASIC_funcall_ref_1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_funcall_ref_1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @swap(i32* noundef %p, i32* noundef %q) #0 !dbg !9 {
entry:
  %p.addr = alloca i32*, align 8
  %q.addr = alloca i32*, align 8
  %t = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !16, metadata !DIExpression()), !dbg !17
  store i32* %q, i32** %q.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %q.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %t, metadata !20, metadata !DIExpression()), !dbg !21
  %0 = load i32*, i32** %p.addr, align 8, !dbg !22
  %1 = load i32, i32* %0, align 4, !dbg !23
  store i32 %1, i32* %t, align 4, !dbg !21
  %2 = load i32*, i32** %q.addr, align 8, !dbg !24
  %3 = load i32, i32* %2, align 4, !dbg !25
  %4 = load i32*, i32** %p.addr, align 8, !dbg !26
  store i32 %3, i32* %4, align 4, !dbg !27
  %5 = load i32, i32* %t, align 4, !dbg !28
  %6 = load i32*, i32** %q.addr, align 8, !dbg !29
  store i32 %5, i32* %6, align 4, !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !32 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !35, metadata !DIExpression()), !dbg !36
  store i32 0, i32* %a, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %b, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 1, i32* %b, align 4, !dbg !38
  call void @swap(i32* noundef %a, i32* noundef %b), !dbg !39
  %0 = load i32, i32* %a, align 4, !dbg !40
  %cmp = icmp eq i32 %0, 1, !dbg !41
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !42
  ret i32 0, !dbg !43
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_funcall_ref_1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "swap", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/pass/BASIC_funcall_ref_1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 16, scope: !9)
!18 = !DILocalVariable(name: "q", arg: 2, scope: !9, file: !10, line: 8, type: !13)
!19 = !DILocation(line: 8, column: 24, scope: !9)
!20 = !DILocalVariable(name: "t", scope: !9, file: !10, line: 9, type: !14)
!21 = !DILocation(line: 9, column: 9, scope: !9)
!22 = !DILocation(line: 9, column: 14, scope: !9)
!23 = !DILocation(line: 9, column: 13, scope: !9)
!24 = !DILocation(line: 10, column: 11, scope: !9)
!25 = !DILocation(line: 10, column: 10, scope: !9)
!26 = !DILocation(line: 10, column: 6, scope: !9)
!27 = !DILocation(line: 10, column: 8, scope: !9)
!28 = !DILocation(line: 11, column: 10, scope: !9)
!29 = !DILocation(line: 11, column: 6, scope: !9)
!30 = !DILocation(line: 11, column: 8, scope: !9)
!31 = !DILocation(line: 12, column: 1, scope: !9)
!32 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !33, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!33 = !DISubroutineType(types: !34)
!34 = !{!14}
!35 = !DILocalVariable(name: "a", scope: !32, file: !10, line: 15, type: !14)
!36 = !DILocation(line: 15, column: 8, scope: !32)
!37 = !DILocalVariable(name: "b", scope: !32, file: !10, line: 15, type: !14)
!38 = !DILocation(line: 15, column: 15, scope: !32)
!39 = !DILocation(line: 16, column: 5, scope: !32)
!40 = !DILocation(line: 17, column: 16, scope: !32)
!41 = !DILocation(line: 17, column: 18, scope: !32)
!42 = !DILocation(line: 17, column: 5, scope: !32)
!43 = !DILocation(line: 18, column: 1, scope: !32)
