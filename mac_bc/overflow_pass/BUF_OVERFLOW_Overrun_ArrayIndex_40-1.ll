; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_40-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_40-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !20
  call void @srand(i32 noundef %call), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %a, metadata !22, metadata !DIExpression()), !dbg !23
  %call1 = call i32 @rand(), !dbg !24
  %rem = srem i32 %call1, 11, !dbg !25
  %sub = sub nsw i32 %rem, 5, !dbg !26
  store i32 %sub, i32* %a, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %b, metadata !27, metadata !DIExpression()), !dbg !28
  %0 = load i32, i32* %a, align 4, !dbg !29
  %1 = load i32, i32* %a, align 4, !dbg !29
  %mul = mul nsw i32 %0, %1, !dbg !29
  %2 = load i32, i32* %a, align 4, !dbg !29
  %mul2 = mul nsw i32 %mul, %2, !dbg !29
  %3 = load i32, i32* %a, align 4, !dbg !29
  %cmp = icmp slt i32 %mul2, %3, !dbg !29
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !29

cond.true:                                        ; preds = %entry
  %4 = load i32, i32* %a, align 4, !dbg !29
  %5 = load i32, i32* %a, align 4, !dbg !29
  %mul3 = mul nsw i32 %4, %5, !dbg !29
  %6 = load i32, i32* %a, align 4, !dbg !29
  %mul4 = mul nsw i32 %mul3, %6, !dbg !29
  br label %cond.end, !dbg !29

cond.false:                                       ; preds = %entry
  %7 = load i32, i32* %a, align 4, !dbg !29
  br label %cond.end, !dbg !29

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %mul4, %cond.true ], [ %7, %cond.false ], !dbg !29
  store i32 %cond, i32* %b, align 4, !dbg !28
  %8 = load i32, i32* %b, align 4, !dbg !30
  %9 = load i32, i32* %a, align 4, !dbg !32
  %cmp5 = icmp eq i32 %8, %9, !dbg !33
  br i1 %cmp5, label %if.then, label %if.else, !dbg !34

if.then:                                          ; preds = %cond.end
  %10 = load i32, i32* %a, align 4, !dbg !35
  %tobool = icmp ne i32 %10, 0, !dbg !35
  br i1 %tobool, label %if.end, label %if.then6, !dbg !38

if.then6:                                         ; preds = %if.then
  %11 = load i32, i32* %a, align 4, !dbg !39
  %idxprom = sext i32 %11 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !41
  store i32 1, i32* %arrayidx, align 4, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end9, !dbg !44

if.else:                                          ; preds = %cond.end
  %12 = load i32, i32* %a, align 4, !dbg !45
  %idxprom7 = sext i32 %12 to i64, !dbg !47
  %arrayidx8 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !47
  store i32 1, i32* %arrayidx8, align 4, !dbg !48
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.end
  %13 = load i32, i32* %retval, align 4, !dbg !49
  ret i32 %13, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_40-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_40-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 10, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 5)
!19 = !DILocation(line: 10, column: 6, scope: !9)
!20 = !DILocation(line: 11, column: 8, scope: !9)
!21 = !DILocation(line: 11, column: 2, scope: !9)
!22 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 12, type: !13)
!23 = !DILocation(line: 12, column: 9, scope: !9)
!24 = !DILocation(line: 12, column: 14, scope: !9)
!25 = !DILocation(line: 12, column: 21, scope: !9)
!26 = !DILocation(line: 12, column: 27, scope: !9)
!27 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 14, type: !13)
!28 = !DILocation(line: 14, column: 6, scope: !9)
!29 = !DILocation(line: 14, column: 10, scope: !9)
!30 = !DILocation(line: 15, column: 5, scope: !31)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 15, column: 5)
!32 = !DILocation(line: 15, column: 10, scope: !31)
!33 = !DILocation(line: 15, column: 7, scope: !31)
!34 = !DILocation(line: 15, column: 5, scope: !9)
!35 = !DILocation(line: 17, column: 7, scope: !36)
!36 = distinct !DILexicalBlock(scope: !37, file: !10, line: 17, column: 6)
!37 = distinct !DILexicalBlock(scope: !31, file: !10, line: 15, column: 13)
!38 = !DILocation(line: 17, column: 6, scope: !37)
!39 = !DILocation(line: 18, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 17, column: 10)
!41 = !DILocation(line: 18, column: 4, scope: !40)
!42 = !DILocation(line: 18, column: 14, scope: !40)
!43 = !DILocation(line: 19, column: 3, scope: !40)
!44 = !DILocation(line: 20, column: 2, scope: !37)
!45 = !DILocation(line: 23, column: 10, scope: !46)
!46 = distinct !DILexicalBlock(scope: !31, file: !10, line: 21, column: 7)
!47 = !DILocation(line: 23, column: 3, scope: !46)
!48 = !DILocation(line: 23, column: 13, scope: !46)
!49 = !DILocation(line: 25, column: 1, scope: !9)
