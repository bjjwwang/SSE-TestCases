; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_24-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_24-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [91 x i32], align 16
  %ch = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [91 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !20
  call void @srand(i32 noundef %call), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %ch, metadata !22, metadata !DIExpression()), !dbg !23
  %call1 = call i32 @rand(), !dbg !24
  %rem = srem i32 %call1, 128, !dbg !25
  store i32 %rem, i32* %ch, align 4, !dbg !23
  %0 = load i32, i32* %ch, align 4, !dbg !26
  %cmp = icmp sge i32 %0, 97, !dbg !28
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !29

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %ch, align 4, !dbg !30
  %cmp2 = icmp sle i32 %1, 122, !dbg !31
  br i1 %cmp2, label %if.then, label %if.else, !dbg !32

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* %ch, align 4, !dbg !33
  %call3 = call i32 @toupper(i32 noundef %2) #4, !dbg !35
  store i32 %call3, i32* %ch, align 4, !dbg !36
  %3 = load i32, i32* %ch, align 4, !dbg !37
  %idxprom = sext i32 %3 to i64, !dbg !38
  %arrayidx = getelementptr inbounds [91 x i32], [91 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !38
  store i32 1, i32* %arrayidx, align 4, !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %land.lhs.true, %entry
  %4 = load i32, i32* %ch, align 4, !dbg !41
  %idxprom4 = sext i32 %4 to i64, !dbg !43
  %arrayidx5 = getelementptr inbounds [91 x i32], [91 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !43
  store i32 1, i32* %arrayidx5, align 4, !dbg !44
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !45
  ret i32 %5, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: nounwind readonly willreturn
declare i32 @toupper(i32 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_24-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_24-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 9, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2912, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 91)
!19 = !DILocation(line: 9, column: 6, scope: !9)
!20 = !DILocation(line: 10, column: 8, scope: !9)
!21 = !DILocation(line: 10, column: 2, scope: !9)
!22 = !DILocalVariable(name: "ch", scope: !9, file: !10, line: 11, type: !13)
!23 = !DILocation(line: 11, column: 6, scope: !9)
!24 = !DILocation(line: 11, column: 11, scope: !9)
!25 = !DILocation(line: 11, column: 18, scope: !9)
!26 = !DILocation(line: 12, column: 6, scope: !27)
!27 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 6)
!28 = !DILocation(line: 12, column: 9, scope: !27)
!29 = !DILocation(line: 12, column: 15, scope: !27)
!30 = !DILocation(line: 12, column: 18, scope: !27)
!31 = !DILocation(line: 12, column: 21, scope: !27)
!32 = !DILocation(line: 12, column: 6, scope: !9)
!33 = !DILocation(line: 13, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !27, file: !10, line: 12, column: 29)
!35 = !DILocation(line: 13, column: 8, scope: !34)
!36 = !DILocation(line: 13, column: 6, scope: !34)
!37 = !DILocation(line: 15, column: 10, scope: !34)
!38 = !DILocation(line: 15, column: 3, scope: !34)
!39 = !DILocation(line: 15, column: 14, scope: !34)
!40 = !DILocation(line: 16, column: 2, scope: !34)
!41 = !DILocation(line: 18, column: 10, scope: !42)
!42 = distinct !DILexicalBlock(scope: !27, file: !10, line: 17, column: 7)
!43 = !DILocation(line: 18, column: 3, scope: !42)
!44 = !DILocation(line: 18, column: 14, scope: !42)
!45 = !DILocation(line: 20, column: 1, scope: !9)
