; ModuleID = 'linux_bc/pass/BASIC_funcall_ref_1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_funcall_ref_1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @swap(i32* %p, i32* %q) #0 !dbg !9 {
entry:
  %p.addr = alloca i32*, align 8
  %q.addr = alloca i32*, align 8
  %t = alloca i32, align 4
  store i32* %p, i32** %p.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %p.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32* %q, i32** %q.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %q.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %t, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32*, i32** %p.addr, align 8, !dbg !21
  %1 = load i32, i32* %0, align 4, !dbg !22
  store i32 %1, i32* %t, align 4, !dbg !20
  %2 = load i32*, i32** %q.addr, align 8, !dbg !23
  %3 = load i32, i32* %2, align 4, !dbg !24
  %4 = load i32*, i32** %p.addr, align 8, !dbg !25
  store i32 %3, i32* %4, align 4, !dbg !26
  %5 = load i32, i32* %t, align 4, !dbg !27
  %6 = load i32*, i32** %q.addr, align 8, !dbg !28
  store i32 %5, i32* %6, align 4, !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !31 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !34, metadata !DIExpression()), !dbg !35
  store i32 0, i32* %a, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %b, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 1, i32* %b, align 4, !dbg !37
  call void @swap(i32* %a, i32* %b), !dbg !38
  %0 = load i32, i32* %a, align 4, !dbg !39
  %cmp = icmp eq i32 %0, 1, !dbg !40
  call void @svf_assert(i1 zeroext %cmp), !dbg !41
  ret i32 0, !dbg !42
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_funcall_ref_1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "swap", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_funcall_ref_1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "p", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 16, scope: !9)
!17 = !DILocalVariable(name: "q", arg: 2, scope: !9, file: !10, line: 8, type: !13)
!18 = !DILocation(line: 8, column: 24, scope: !9)
!19 = !DILocalVariable(name: "t", scope: !9, file: !10, line: 9, type: !14)
!20 = !DILocation(line: 9, column: 9, scope: !9)
!21 = !DILocation(line: 9, column: 14, scope: !9)
!22 = !DILocation(line: 9, column: 13, scope: !9)
!23 = !DILocation(line: 10, column: 11, scope: !9)
!24 = !DILocation(line: 10, column: 10, scope: !9)
!25 = !DILocation(line: 10, column: 6, scope: !9)
!26 = !DILocation(line: 10, column: 8, scope: !9)
!27 = !DILocation(line: 11, column: 10, scope: !9)
!28 = !DILocation(line: 11, column: 6, scope: !9)
!29 = !DILocation(line: 11, column: 8, scope: !9)
!30 = !DILocation(line: 12, column: 1, scope: !9)
!31 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !32, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!14}
!34 = !DILocalVariable(name: "a", scope: !31, file: !10, line: 15, type: !14)
!35 = !DILocation(line: 15, column: 8, scope: !31)
!36 = !DILocalVariable(name: "b", scope: !31, file: !10, line: 15, type: !14)
!37 = !DILocation(line: 15, column: 15, scope: !31)
!38 = !DILocation(line: 16, column: 5, scope: !31)
!39 = !DILocation(line: 17, column: 16, scope: !31)
!40 = !DILocation(line: 17, column: 18, scope: !31)
!41 = !DILocation(line: 17, column: 5, scope: !31)
!42 = !DILocation(line: 18, column: 1, scope: !31)
