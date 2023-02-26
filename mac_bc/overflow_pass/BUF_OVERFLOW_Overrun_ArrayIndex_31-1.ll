; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_31-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_31-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo(i32* noundef %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32*, align 8
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !16, metadata !DIExpression()), !dbg !17
  br label %LOOP, !dbg !18

LOOP:                                             ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !19), !dbg !20
  %0 = load i32*, i32** %i.addr, align 8, !dbg !21
  %1 = load i32, i32* %0, align 4, !dbg !22
  %add = add nsw i32 %1, 1, !dbg !23
  %2 = load i32*, i32** %i.addr, align 8, !dbg !24
  store i32 %add, i32* %2, align 4, !dbg !25
  %3 = load i32*, i32** %i.addr, align 8, !dbg !26
  %4 = load i32, i32* %3, align 4, !dbg !28
  %cmp = icmp slt i32 %4, 10, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %LOOP
  br label %LOOP, !dbg !31

if.end:                                           ; preds = %LOOP
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !34 {
entry:
  %buffer = alloca [20 x i32], align 16
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [20 x i32]* %buffer, metadata !37, metadata !DIExpression()), !dbg !41
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !42
  call void @srand(i32 noundef %call), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !45
  %call1 = call i32 @rand(), !dbg !46
  %rem = srem i32 %call1, 51, !dbg !47
  store i32 %rem, i32* %i, align 4, !dbg !45
  call void @foo(i32* noundef %i), !dbg !48
  %0 = load i32, i32* %i, align 4, !dbg !49
  %idxprom = sext i32 %0 to i64, !dbg !50
  %arrayidx = getelementptr inbounds [20 x i32], [20 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !50
  store i32 1, i32* %arrayidx, align 4, !dbg !51
  ret i32 0, !dbg !52
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "foo", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_31-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{null, !13}
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!15 = !{}
!16 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!17 = !DILocation(line: 7, column: 15, scope: !9)
!18 = !DILocation(line: 7, column: 18, scope: !9)
!19 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 8)
!20 = !DILocation(line: 8, column: 5, scope: !9)
!21 = !DILocation(line: 9, column: 11, scope: !9)
!22 = !DILocation(line: 9, column: 10, scope: !9)
!23 = !DILocation(line: 9, column: 13, scope: !9)
!24 = !DILocation(line: 9, column: 6, scope: !9)
!25 = !DILocation(line: 9, column: 8, scope: !9)
!26 = !DILocation(line: 10, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 8)
!28 = !DILocation(line: 10, column: 8, scope: !27)
!29 = !DILocation(line: 10, column: 11, scope: !27)
!30 = !DILocation(line: 10, column: 8, scope: !9)
!31 = !DILocation(line: 11, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !10, line: 10, column: 17)
!33 = !DILocation(line: 13, column: 1, scope: !9)
!34 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !35, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!35 = !DISubroutineType(types: !36)
!36 = !{!14}
!37 = !DILocalVariable(name: "buffer", scope: !34, file: !10, line: 16, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 640, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 20)
!41 = !DILocation(line: 16, column: 6, scope: !34)
!42 = !DILocation(line: 17, column: 11, scope: !34)
!43 = !DILocation(line: 17, column: 5, scope: !34)
!44 = !DILocalVariable(name: "i", scope: !34, file: !10, line: 18, type: !14)
!45 = !DILocation(line: 18, column: 9, scope: !34)
!46 = !DILocation(line: 18, column: 13, scope: !34)
!47 = !DILocation(line: 18, column: 20, scope: !34)
!48 = !DILocation(line: 20, column: 5, scope: !34)
!49 = !DILocation(line: 22, column: 9, scope: !34)
!50 = !DILocation(line: 22, column: 2, scope: !34)
!51 = !DILocation(line: 22, column: 12, scope: !34)
!52 = !DILocation(line: 23, column: 1, scope: !34)
