; ModuleID = 'mac_bc/pass/BASIC_br_nd_malloc.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_br_nd_malloc.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32** %p, metadata !17, metadata !DIExpression()), !dbg !19
  %call = call i32* @malloc(i32 noundef 10), !dbg !20
  store i32* %call, i32** %p, align 8, !dbg !19
  %0 = load i32*, i32** %p, align 8, !dbg !21
  store i32 10, i32* %0, align 4, !dbg !22
  %1 = load i32, i32* %argc.addr, align 4, !dbg !23
  %tobool = icmp ne i32 %1, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %2 = load i32*, i32** %p, align 8, !dbg !26
  store i32 20, i32* %2, align 4, !dbg !28
  br label %if.end, !dbg !29

if.else:                                          ; preds = %entry
  %3 = load i32*, i32** %p, align 8, !dbg !30
  %4 = load i32, i32* %3, align 4, !dbg !32
  %cmp = icmp eq i32 %4, 10, !dbg !33
  %conv = zext i1 %cmp to i32, !dbg !33
  call void @svf_assert(i32 noundef %conv), !dbg !34
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !35
  ret i32 %5, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32* @malloc(i32 noundef) #2

declare void @svf_assert(i32 noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_br_nd_malloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 3, type: !11, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_br_nd_malloc.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "argc", arg: 1, scope: !9, file: !10, line: 3, type: !13)
!16 = !DILocation(line: 3, column: 14, scope: !9)
!17 = !DILocalVariable(name: "p", scope: !9, file: !10, line: 4, type: !18)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!19 = !DILocation(line: 4, column: 10, scope: !9)
!20 = !DILocation(line: 4, column: 14, scope: !9)
!21 = !DILocation(line: 5, column: 6, scope: !9)
!22 = !DILocation(line: 5, column: 8, scope: !9)
!23 = !DILocation(line: 6, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 6, column: 8)
!25 = !DILocation(line: 6, column: 8, scope: !9)
!26 = !DILocation(line: 7, column: 10, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !10, line: 6, column: 13)
!28 = !DILocation(line: 7, column: 12, scope: !27)
!29 = !DILocation(line: 8, column: 5, scope: !27)
!30 = !DILocation(line: 10, column: 21, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !10, line: 9, column: 9)
!32 = !DILocation(line: 10, column: 20, scope: !31)
!33 = !DILocation(line: 10, column: 22, scope: !31)
!34 = !DILocation(line: 10, column: 9, scope: !31)
!35 = !DILocation(line: 12, column: 1, scope: !9)
