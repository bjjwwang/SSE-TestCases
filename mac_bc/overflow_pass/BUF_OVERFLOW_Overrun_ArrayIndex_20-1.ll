; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_20-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_20-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %input = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !20
  call void @srand(i32 noundef %call), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %input, metadata !22, metadata !DIExpression()), !dbg !23
  %call1 = call i32 @rand(), !dbg !24
  %rem = srem i32 %call1, 10, !dbg !25
  store i32 %rem, i32* %input, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %a, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %input, align 4, !dbg !28
  store i32 %0, i32* %a, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %b, metadata !29, metadata !DIExpression()), !dbg !30
  %call2 = call i32 @rand(), !dbg !31
  %rem3 = srem i32 %call2, 10, !dbg !32
  store i32 %rem3, i32* %b, align 4, !dbg !30
  %1 = load i32, i32* %b, align 4, !dbg !33
  %cmp = icmp ne i32 %1, 0, !dbg !35
  br i1 %cmp, label %if.then, label %if.end10, !dbg !36

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !37
  %3 = load i32, i32* %b, align 4, !dbg !39
  %div = sdiv i32 %2, %3, !dbg !40
  %4 = load i32, i32* %b, align 4, !dbg !41
  %mul = mul nsw i32 %div, %4, !dbg !42
  %5 = load i32, i32* %a, align 4, !dbg !43
  %6 = load i32, i32* %b, align 4, !dbg !44
  %rem4 = srem i32 %5, %6, !dbg !45
  %add = add nsw i32 %mul, %rem4, !dbg !46
  store i32 %add, i32* %a, align 4, !dbg !47
  %7 = load i32, i32* %input, align 4, !dbg !48
  %cmp5 = icmp sge i32 %7, 0, !dbg !50
  br i1 %cmp5, label %land.lhs.true, label %if.else, !dbg !51

land.lhs.true:                                    ; preds = %if.then
  %8 = load i32, i32* %input, align 4, !dbg !52
  %cmp6 = icmp slt i32 %8, 5, !dbg !53
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !54

if.then7:                                         ; preds = %land.lhs.true
  %9 = load i32, i32* %a, align 4, !dbg !55
  %idxprom = sext i32 %9 to i64, !dbg !57
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !57
  store i32 1, i32* %arrayidx, align 4, !dbg !58
  br label %if.end, !dbg !59

if.else:                                          ; preds = %land.lhs.true, %if.then
  %10 = load i32, i32* %a, align 4, !dbg !60
  %idxprom8 = sext i32 %10 to i64, !dbg !62
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !62
  store i32 1, i32* %arrayidx9, align 4, !dbg !63
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end10, !dbg !64

if.end10:                                         ; preds = %if.end, %entry
  %11 = load i32, i32* %retval, align 4, !dbg !65
  ret i32 %11, !dbg !65
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_20-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_20-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 5)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocation(line: 9, column: 8, scope: !9)
!21 = !DILocation(line: 9, column: 2, scope: !9)
!22 = !DILocalVariable(name: "input", scope: !9, file: !10, line: 10, type: !13)
!23 = !DILocation(line: 10, column: 9, scope: !9)
!24 = !DILocation(line: 10, column: 17, scope: !9)
!25 = !DILocation(line: 10, column: 24, scope: !9)
!26 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!27 = !DILocation(line: 11, column: 9, scope: !9)
!28 = !DILocation(line: 11, column: 13, scope: !9)
!29 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 12, type: !13)
!30 = !DILocation(line: 12, column: 9, scope: !9)
!31 = !DILocation(line: 12, column: 13, scope: !9)
!32 = !DILocation(line: 12, column: 20, scope: !9)
!33 = !DILocation(line: 13, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 8)
!35 = !DILocation(line: 13, column: 10, scope: !34)
!36 = !DILocation(line: 13, column: 8, scope: !9)
!37 = !DILocation(line: 15, column: 14, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 13, column: 16)
!39 = !DILocation(line: 15, column: 18, scope: !38)
!40 = !DILocation(line: 15, column: 16, scope: !38)
!41 = !DILocation(line: 15, column: 23, scope: !38)
!42 = !DILocation(line: 15, column: 21, scope: !38)
!43 = !DILocation(line: 15, column: 27, scope: !38)
!44 = !DILocation(line: 15, column: 31, scope: !38)
!45 = !DILocation(line: 15, column: 29, scope: !38)
!46 = !DILocation(line: 15, column: 25, scope: !38)
!47 = !DILocation(line: 15, column: 11, scope: !38)
!48 = !DILocation(line: 17, column: 12, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !10, line: 17, column: 12)
!50 = !DILocation(line: 17, column: 18, scope: !49)
!51 = !DILocation(line: 17, column: 23, scope: !49)
!52 = !DILocation(line: 17, column: 26, scope: !49)
!53 = !DILocation(line: 17, column: 32, scope: !49)
!54 = !DILocation(line: 17, column: 12, scope: !38)
!55 = !DILocation(line: 18, column: 11, scope: !56)
!56 = distinct !DILexicalBlock(scope: !49, file: !10, line: 17, column: 37)
!57 = !DILocation(line: 18, column: 4, scope: !56)
!58 = !DILocation(line: 18, column: 14, scope: !56)
!59 = !DILocation(line: 19, column: 3, scope: !56)
!60 = !DILocation(line: 21, column: 11, scope: !61)
!61 = distinct !DILexicalBlock(scope: !49, file: !10, line: 20, column: 8)
!62 = !DILocation(line: 21, column: 4, scope: !61)
!63 = !DILocation(line: 21, column: 14, scope: !61)
!64 = !DILocation(line: 23, column: 5, scope: !38)
!65 = !DILocation(line: 24, column: 1, scope: !9)
