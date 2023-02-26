; ModuleID = 'linux_bc/pass/INTERVAL_test_16.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32* %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32*, align 8
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32*, i32** %i.addr, align 8, !dbg !17
  %1 = load i32, i32* %0, align 4, !dbg !18
  %add = add nsw i32 %1, 1, !dbg !19
  %2 = load i32*, i32** %i.addr, align 8, !dbg !20
  store i32 %add, i32* %2, align 4, !dbg !21
  %3 = load i32*, i32** %i.addr, align 8, !dbg !22
  %4 = load i32, i32* %3, align 4, !dbg !24
  %cmp = icmp slt i32 %4, 10, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  %5 = load i32*, i32** %i.addr, align 8, !dbg !27
  call void @foo(i32* %5), !dbg !29
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !32 {
entry:
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !36
  call void @foo(i32* %i), !dbg !37
  %0 = load i32, i32* %i, align 4, !dbg !38
  %cmp = icmp sge i32 %0, 10, !dbg !39
  call void @svf_assert(i1 zeroext %cmp), !dbg !40
  ret i32 0, !dbg !41
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_16.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_16.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 5, type: !13)
!16 = !DILocation(line: 5, column: 15, scope: !9)
!17 = !DILocation(line: 6, column: 11, scope: !9)
!18 = !DILocation(line: 6, column: 10, scope: !9)
!19 = !DILocation(line: 6, column: 13, scope: !9)
!20 = !DILocation(line: 6, column: 6, scope: !9)
!21 = !DILocation(line: 6, column: 8, scope: !9)
!22 = !DILocation(line: 7, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 7, column: 8)
!24 = !DILocation(line: 7, column: 8, scope: !23)
!25 = !DILocation(line: 7, column: 11, scope: !23)
!26 = !DILocation(line: 7, column: 8, scope: !9)
!27 = !DILocation(line: 8, column: 13, scope: !28)
!28 = distinct !DILexicalBlock(scope: !23, file: !10, line: 7, column: 17)
!29 = !DILocation(line: 8, column: 9, scope: !28)
!30 = !DILocation(line: 9, column: 5, scope: !28)
!31 = !DILocation(line: 10, column: 1, scope: !9)
!32 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !33, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!14}
!35 = !DILocalVariable(name: "i", scope: !32, file: !10, line: 13, type: !14)
!36 = !DILocation(line: 13, column: 9, scope: !32)
!37 = !DILocation(line: 14, column: 5, scope: !32)
!38 = !DILocation(line: 15, column: 16, scope: !32)
!39 = !DILocation(line: 15, column: 18, scope: !32)
!40 = !DILocation(line: 15, column: 5, scope: !32)
!41 = !DILocation(line: 16, column: 1, scope: !32)
