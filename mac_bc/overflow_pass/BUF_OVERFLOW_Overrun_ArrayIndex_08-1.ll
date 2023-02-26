; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [2 x i32], align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !20
  call void @srand(i32 noundef %call), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %a, metadata !22, metadata !DIExpression()), !dbg !23
  %call1 = call i32 @rand(), !dbg !24
  %rem = srem i32 %call1, 11, !dbg !25
  store i32 %rem, i32* %a, align 4, !dbg !23
  br label %while.body, !dbg !26

while.body:                                       ; preds = %if.end8, %entry
  %0 = load i32, i32* %a, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.else, !dbg !30

if.then:                                          ; preds = %while.body
  call void @abort() #4, !dbg !31
  unreachable, !dbg !31

if.else:                                          ; preds = %while.body
  %1 = load i32, i32* %a, align 4, !dbg !33
  %cmp = icmp sgt i32 %1, 0, !dbg !36
  br i1 %cmp, label %if.then2, label %if.else3, !dbg !37

if.then2:                                         ; preds = %if.else
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 20, !dbg !38
  store i32 1, i32* %arrayidx, align 4, !dbg !40
  %2 = load i32, i32* %a, align 4, !dbg !41
  %dec = add nsw i32 %2, -1, !dbg !41
  store i32 %dec, i32* %a, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else3:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !43
  %inc = add nsw i32 %3, 1, !dbg !43
  store i32 %inc, i32* %a, align 4, !dbg !43
  %4 = load i32, i32* %a, align 4, !dbg !45
  %idxprom = sext i32 %4 to i64, !dbg !46
  %arrayidx4 = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !46
  store i32 1, i32* %arrayidx4, align 4, !dbg !47
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %5 = load i32, i32* %a, align 4, !dbg !48
  %tobool5 = icmp ne i32 %5, 0, !dbg !48
  br i1 %tobool5, label %if.then6, label %if.end8, !dbg !50

if.then6:                                         ; preds = %if.end
  %arrayidx7 = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 20, !dbg !51
  store i32 1, i32* %arrayidx7, align 4, !dbg !53
  br label %if.end8, !dbg !54

if.end8:                                          ; preds = %if.then6, %if.end
  br label %while.body, !dbg !55, !llvm.loop !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: cold noreturn
declare void @abort() #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { cold noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { cold noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 2)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocation(line: 9, column: 8, scope: !9)
!21 = !DILocation(line: 9, column: 2, scope: !9)
!22 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!23 = !DILocation(line: 10, column: 9, scope: !9)
!24 = !DILocation(line: 10, column: 13, scope: !9)
!25 = !DILocation(line: 10, column: 20, scope: !9)
!26 = !DILocation(line: 12, column: 2, scope: !9)
!27 = !DILocation(line: 13, column: 6, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !10, line: 13, column: 6)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 14)
!30 = !DILocation(line: 13, column: 6, scope: !29)
!31 = !DILocation(line: 15, column: 4, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 13, column: 9)
!33 = !DILocation(line: 20, column: 7, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !10, line: 20, column: 7)
!35 = distinct !DILexicalBlock(scope: !28, file: !10, line: 18, column: 8)
!36 = !DILocation(line: 20, column: 9, scope: !34)
!37 = !DILocation(line: 20, column: 7, scope: !35)
!38 = !DILocation(line: 21, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !10, line: 20, column: 14)
!40 = !DILocation(line: 21, column: 16, scope: !39)
!41 = !DILocation(line: 22, column: 6, scope: !39)
!42 = !DILocation(line: 23, column: 4, scope: !39)
!43 = !DILocation(line: 25, column: 6, scope: !44)
!44 = distinct !DILexicalBlock(scope: !34, file: !10, line: 24, column: 9)
!45 = !DILocation(line: 27, column: 12, scope: !44)
!46 = !DILocation(line: 27, column: 5, scope: !44)
!47 = !DILocation(line: 27, column: 15, scope: !44)
!48 = !DILocation(line: 29, column: 7, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !10, line: 29, column: 7)
!50 = !DILocation(line: 29, column: 7, scope: !35)
!51 = !DILocation(line: 30, column: 5, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !10, line: 29, column: 10)
!53 = !DILocation(line: 30, column: 16, scope: !52)
!54 = !DILocation(line: 31, column: 4, scope: !52)
!55 = !DILocation(line: 32, column: 4, scope: !35)
!56 = distinct !{!56, !26, !57}
!57 = !DILocation(line: 34, column: 2, scope: !9)
