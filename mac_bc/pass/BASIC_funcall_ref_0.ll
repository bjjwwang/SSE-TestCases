; ModuleID = 'mac_bc/pass/BASIC_funcall_ref_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_funcall_ref_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo(i32* noundef %p) #0 !dbg !9 {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !16, metadata !DIExpression()), !dbg !17
  %0 = load i32*, i32** %p.addr, align 8, !dbg !18
  store i32 1, i32* %0, align 4, !dbg !19
  ret void, !dbg !20
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !21 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 0, i32* %a, align 4, !dbg !25
  call void @foo(i32* noundef %a), !dbg !26
  %0 = load i32, i32* %a, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 1, !dbg !28
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !29
  ret i32 0, !dbg !30
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_funcall_ref_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/pass/BASIC_funcall_ref_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 15, scope: !9)
!18 = !DILocation(line: 9, column: 4, scope: !9)
!19 = !DILocation(line: 9, column: 6, scope: !9)
!20 = !DILocation(line: 10, column: 1, scope: !9)
!21 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !22, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!22 = !DISubroutineType(types: !23)
!23 = !{!14}
!24 = !DILocalVariable(name: "a", scope: !21, file: !10, line: 13, type: !14)
!25 = !DILocation(line: 13, column: 9, scope: !21)
!26 = !DILocation(line: 14, column: 5, scope: !21)
!27 = !DILocation(line: 15, column: 16, scope: !21)
!28 = !DILocation(line: 15, column: 18, scope: !21)
!29 = !DILocation(line: 15, column: 5, scope: !21)
!30 = !DILocation(line: 16, column: 1, scope: !21)
