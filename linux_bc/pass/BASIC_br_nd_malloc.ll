; ModuleID = 'linux_bc/pass/BASIC_br_nd_malloc.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_br_nd_malloc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32** %p, metadata !16, metadata !DIExpression()), !dbg !18
  %call = call i32* @malloc(i32 10), !dbg !19
  store i32* %call, i32** %p, align 8, !dbg !18
  %0 = load i32*, i32** %p, align 8, !dbg !20
  store i32 10, i32* %0, align 4, !dbg !21
  %1 = load i32, i32* %argc.addr, align 4, !dbg !22
  %tobool = icmp ne i32 %1, 0, !dbg !22
  br i1 %tobool, label %if.then, label %if.else, !dbg !24

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %p, align 8, !dbg !25
  store i32 20, i32* %2, align 4, !dbg !27
  br label %if.end, !dbg !28

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %p, align 8, !dbg !29
  %4 = load i32, i32* %3, align 4, !dbg !31
  %cmp = icmp eq i32 %4, 10, !dbg !32
  %conv = zext i1 %cmp to i32, !dbg !32
  call void @svf_assert(i32 %conv), !dbg !33
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !34
  ret i32 %5, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32* @malloc(i32) #2

declare dso_local void @svf_assert(i32) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_br_nd_malloc.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_br_nd_malloc.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 3, type: !13)
!15 = !DILocation(line: 3, column: 14, scope: !9)
!16 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 4, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!18 = !DILocation(line: 4, column: 10, scope: !9)
!19 = !DILocation(line: 4, column: 14, scope: !9)
!20 = !DILocation(line: 5, column: 6, scope: !9)
!21 = !DILocation(line: 5, column: 8, scope: !9)
!22 = !DILocation(line: 6, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 6, column: 8)
!24 = !DILocation(line: 6, column: 8, scope: !9)
!25 = !DILocation(line: 7, column: 10, scope: !26)
!26 = distinct !DILexicalBlock(scope: !23, file: !10, line: 6, column: 13)
!27 = !DILocation(line: 7, column: 12, scope: !26)
!28 = !DILocation(line: 8, column: 5, scope: !26)
!29 = !DILocation(line: 10, column: 21, scope: !30)
!30 = distinct !DILexicalBlock(scope: !23, file: !10, line: 9, column: 9)
!31 = !DILocation(line: 10, column: 20, scope: !30)
!32 = !DILocation(line: 10, column: 22, scope: !30)
!33 = !DILocation(line: 10, column: 9, scope: !30)
!34 = !DILocation(line: 12, column: 1, scope: !9)
