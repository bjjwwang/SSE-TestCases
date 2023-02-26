; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@sumDigits.sum = internal global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @sumDigits(i32 noundef %i) #0 !dbg !2 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* %i.addr, align 4, !dbg !20
  %cmp = icmp ne i32 %0, 0, !dbg !22
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @sumDigits.sum, align 4, !dbg !24
  %2 = load i32, i32* %i.addr, align 4, !dbg !26
  %rem = srem i32 %2, 10, !dbg !27
  %add = add nsw i32 %1, %rem, !dbg !28
  store i32 %add, i32* @sumDigits.sum, align 4, !dbg !29
  %3 = load i32, i32* %i.addr, align 4, !dbg !30
  %div = sdiv i32 %3, 10, !dbg !31
  %call = call i32 @sumDigits(i32 noundef %div), !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* @sumDigits.sum, align 4, !dbg !34
  ret i32 %4, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !36 {
entry:
  %buffer1 = alloca [27 x i32], align 16
  %buffer2 = alloca [26 x i32], align 16
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [27 x i32]* %buffer1, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [26 x i32]* %buffer2, metadata !44, metadata !DIExpression()), !dbg !48
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !49
  call void @srand(i32 noundef %call), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !51, metadata !DIExpression()), !dbg !52
  %call1 = call i32 @rand(), !dbg !53
  %rem = srem i32 %call1, 999, !dbg !54
  store i32 %rem, i32* %randomNumber, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %i, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* %randomNumber, align 4, !dbg !57
  %call2 = call i32 @sumDigits(i32 noundef %0), !dbg !58
  store i32 %call2, i32* %i, align 4, !dbg !56
  %1 = load i32, i32* %i, align 4, !dbg !59
  %idxprom = sext i32 %1 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [27 x i32], [27 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !60
  store i32 1, i32* %arrayidx, align 4, !dbg !61
  %2 = load i32, i32* %i, align 4, !dbg !62
  %idxprom3 = sext i32 %2 to i64, !dbg !63
  %arrayidx4 = getelementptr inbounds [26 x i32], [26 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !63
  store i32 1, i32* %arrayidx4, align 4, !dbg !64
  ret i32 0, !dbg !65
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "sum", scope: !2, file: !3, line: 8, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "sumDigits", scope: !3, file: !3, line: 7, type: !4, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !10)
!3 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!8 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!9 = !{!0}
!10 = !{}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !3, line: 7, type: !6)
!19 = !DILocation(line: 7, column: 19, scope: !2)
!20 = !DILocation(line: 9, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !2, file: !3, line: 9, column: 8)
!22 = !DILocation(line: 9, column: 10, scope: !21)
!23 = !DILocation(line: 9, column: 8, scope: !2)
!24 = !DILocation(line: 10, column: 15, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !3, line: 9, column: 16)
!26 = !DILocation(line: 10, column: 22, scope: !25)
!27 = !DILocation(line: 10, column: 24, scope: !25)
!28 = !DILocation(line: 10, column: 19, scope: !25)
!29 = !DILocation(line: 10, column: 13, scope: !25)
!30 = !DILocation(line: 11, column: 19, scope: !25)
!31 = !DILocation(line: 11, column: 20, scope: !25)
!32 = !DILocation(line: 11, column: 9, scope: !25)
!33 = !DILocation(line: 12, column: 5, scope: !25)
!34 = !DILocation(line: 13, column: 12, scope: !2)
!35 = !DILocation(line: 13, column: 5, scope: !2)
!36 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 16, type: !37, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !10)
!37 = !DISubroutineType(types: !38)
!38 = !{!6}
!39 = !DILocalVariable(name: "buffer1", scope: !36, file: !3, line: 17, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 864, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 27)
!43 = !DILocation(line: 17, column: 6, scope: !36)
!44 = !DILocalVariable(name: "buffer2", scope: !36, file: !3, line: 18, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 832, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 26)
!48 = !DILocation(line: 18, column: 6, scope: !36)
!49 = !DILocation(line: 19, column: 11, scope: !36)
!50 = !DILocation(line: 19, column: 5, scope: !36)
!51 = !DILocalVariable(name: "randomNumber", scope: !36, file: !3, line: 20, type: !6)
!52 = !DILocation(line: 20, column: 6, scope: !36)
!53 = !DILocation(line: 20, column: 21, scope: !36)
!54 = !DILocation(line: 20, column: 28, scope: !36)
!55 = !DILocalVariable(name: "i", scope: !36, file: !3, line: 21, type: !6)
!56 = !DILocation(line: 21, column: 9, scope: !36)
!57 = !DILocation(line: 21, column: 23, scope: !36)
!58 = !DILocation(line: 21, column: 13, scope: !36)
!59 = !DILocation(line: 23, column: 10, scope: !36)
!60 = !DILocation(line: 23, column: 2, scope: !36)
!61 = !DILocation(line: 23, column: 13, scope: !36)
!62 = !DILocation(line: 24, column: 10, scope: !36)
!63 = !DILocation(line: 24, column: 2, scope: !36)
!64 = !DILocation(line: 24, column: 13, scope: !36)
!65 = !DILocation(line: 25, column: 1, scope: !36)
