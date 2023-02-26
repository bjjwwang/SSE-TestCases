; ModuleID = 'linux_bc/pass/INTERVAL_test_19.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_19.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32* %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32*, align 8
  %a = alloca i32, align 4
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %a, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32*, i32** %i.addr, align 8, !dbg !19
  %1 = load i32, i32* %0, align 4, !dbg !20
  %rem = srem i32 %1, 2, !dbg !21
  store i32 %rem, i32* %a, align 4, !dbg !18
  %2 = load i32, i32* %a, align 4, !dbg !22
  switch i32 %2, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
  ], !dbg !23

sw.bb:                                            ; preds = %entry
  br label %sw.epilog, !dbg !24

sw.bb1:                                           ; preds = %entry
  %3 = load i32*, i32** %i.addr, align 8, !dbg !26
  %4 = load i32, i32* %3, align 4, !dbg !27
  %add = add nsw i32 %4, 1, !dbg !28
  %5 = load i32*, i32** %i.addr, align 8, !dbg !29
  store i32 %add, i32* %5, align 4, !dbg !30
  br label %sw.epilog, !dbg !31

sw.default:                                       ; preds = %entry
  %6 = load i32*, i32** %i.addr, align 8, !dbg !32
  %7 = load i32, i32* %6, align 4, !dbg !33
  %add2 = add nsw i32 %7, 3, !dbg !34
  %8 = load i32*, i32** %i.addr, align 8, !dbg !35
  store i32 %add2, i32* %8, align 4, !dbg !36
  br label %sw.epilog, !dbg !37

sw.epilog:                                        ; preds = %sw.default, %sw.bb1, %sw.bb
  ret void, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !39 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* %i, align 4, !dbg !44
  %cmp = icmp sge i32 %0, 0, !dbg !46
  br i1 %cmp, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %entry
  call void @foo(i32* %i), !dbg !48
  %1 = load i32, i32* %i, align 4, !dbg !50
  %rem = srem i32 %1, 2, !dbg !51
  %cmp1 = icmp eq i32 %rem, 0, !dbg !52
  call void @svf_assert(i1 zeroext %cmp1), !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %retval, align 4, !dbg !55
  ret i32 %2, !dbg !55
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_19.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_19.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 5, type: !13)
!16 = !DILocation(line: 5, column: 15, scope: !9)
!17 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 6, type: !14)
!18 = !DILocation(line: 6, column: 9, scope: !9)
!19 = !DILocation(line: 6, column: 14, scope: !9)
!20 = !DILocation(line: 6, column: 13, scope: !9)
!21 = !DILocation(line: 6, column: 16, scope: !9)
!22 = !DILocation(line: 7, column: 13, scope: !9)
!23 = !DILocation(line: 7, column: 5, scope: !9)
!24 = !DILocation(line: 10, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 5)
!26 = !DILocation(line: 12, column: 19, scope: !25)
!27 = !DILocation(line: 12, column: 18, scope: !25)
!28 = !DILocation(line: 12, column: 21, scope: !25)
!29 = !DILocation(line: 12, column: 14, scope: !25)
!30 = !DILocation(line: 12, column: 16, scope: !25)
!31 = !DILocation(line: 13, column: 13, scope: !25)
!32 = !DILocation(line: 15, column: 19, scope: !25)
!33 = !DILocation(line: 15, column: 18, scope: !25)
!34 = !DILocation(line: 15, column: 21, scope: !25)
!35 = !DILocation(line: 15, column: 14, scope: !25)
!36 = !DILocation(line: 15, column: 16, scope: !25)
!37 = !DILocation(line: 16, column: 13, scope: !25)
!38 = !DILocation(line: 18, column: 1, scope: !9)
!39 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 20, type: !40, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{!14}
!42 = !DILocalVariable(name: "i", scope: !39, file: !10, line: 21, type: !14)
!43 = !DILocation(line: 21, column: 9, scope: !39)
!44 = !DILocation(line: 22, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !10, line: 22, column: 9)
!46 = !DILocation(line: 22, column: 11, scope: !45)
!47 = !DILocation(line: 22, column: 9, scope: !39)
!48 = !DILocation(line: 23, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !10, line: 22, column: 17)
!50 = !DILocation(line: 24, column: 20, scope: !49)
!51 = !DILocation(line: 24, column: 22, scope: !49)
!52 = !DILocation(line: 24, column: 26, scope: !49)
!53 = !DILocation(line: 24, column: 9, scope: !49)
!54 = !DILocation(line: 25, column: 5, scope: !49)
!55 = !DILocation(line: 26, column: 1, scope: !39)
