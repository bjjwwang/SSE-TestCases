; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_26-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_26-1.c"
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
  %rem = srem i32 %call1, 51, !dbg !25
  store i32 %rem, i32* %a, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata i32* %b, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %a, align 4, !dbg !28
  store i32 %0, i32* %b, align 4, !dbg !27
  br label %loopStart, !dbg !29

loopStart:                                        ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !30), !dbg !31
  br label %do.body, !dbg !32

do.body:                                          ; preds = %do.cond, %loopStart
  %1 = load i32, i32* %a, align 4, !dbg !33
  %2 = load i32, i32* %b, align 4, !dbg !36
  %cmp = icmp eq i32 %1, %2, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %do.body
  %3 = load i32, i32* %a, align 4, !dbg !39
  %inc = add nsw i32 %3, 1, !dbg !39
  store i32 %inc, i32* %a, align 4, !dbg !39
  br label %loopStart, !dbg !41

if.end:                                           ; preds = %do.body
  %4 = load i32, i32* %a, align 4, !dbg !42
  %inc2 = add nsw i32 %4, 1, !dbg !42
  store i32 %inc2, i32* %a, align 4, !dbg !42
  %5 = load i32, i32* %b, align 4, !dbg !43
  %inc3 = add nsw i32 %5, 1, !dbg !43
  store i32 %inc3, i32* %b, align 4, !dbg !43
  br label %do.cond, !dbg !44

do.cond:                                          ; preds = %if.end
  %6 = load i32, i32* %a, align 4, !dbg !45
  %cmp4 = icmp slt i32 %6, 15, !dbg !46
  br i1 %cmp4, label %do.body, label %do.end, !dbg !44, !llvm.loop !47

do.end:                                           ; preds = %do.cond
  %7 = load i32, i32* %b, align 4, !dbg !50
  %8 = load i32, i32* %a, align 4, !dbg !52
  %sub = sub nsw i32 %8, 1, !dbg !53
  %cmp5 = icmp eq i32 %7, %sub, !dbg !54
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !55

if.then6:                                         ; preds = %do.end
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 5, !dbg !56
  store i32 1, i32* %arrayidx, align 4, !dbg !58
  br label %if.end7, !dbg !59

if.end7:                                          ; preds = %if.then6, %do.end
  %9 = load i32, i32* %retval, align 4, !dbg !60
  ret i32 %9, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_26-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_26-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!22 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!23 = !DILocation(line: 10, column: 6, scope: !9)
!24 = !DILocation(line: 10, column: 10, scope: !9)
!25 = !DILocation(line: 10, column: 17, scope: !9)
!26 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 11, type: !13)
!27 = !DILocation(line: 11, column: 6, scope: !9)
!28 = !DILocation(line: 11, column: 10, scope: !9)
!29 = !DILocation(line: 11, column: 2, scope: !9)
!30 = !DILabel(scope: !9, name: "loopStart", file: !10, line: 12)
!31 = !DILocation(line: 12, column: 2, scope: !9)
!32 = !DILocation(line: 12, column: 13, scope: !9)
!33 = !DILocation(line: 13, column: 6, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !10, line: 13, column: 6)
!35 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 16)
!36 = !DILocation(line: 13, column: 11, scope: !34)
!37 = !DILocation(line: 13, column: 8, scope: !34)
!38 = !DILocation(line: 13, column: 6, scope: !35)
!39 = !DILocation(line: 14, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !10, line: 13, column: 14)
!41 = !DILocation(line: 15, column: 4, scope: !40)
!42 = !DILocation(line: 17, column: 4, scope: !35)
!43 = !DILocation(line: 18, column: 4, scope: !35)
!44 = !DILocation(line: 19, column: 2, scope: !35)
!45 = !DILocation(line: 19, column: 10, scope: !9)
!46 = !DILocation(line: 19, column: 12, scope: !9)
!47 = distinct !{!47, !32, !48, !49}
!48 = !DILocation(line: 19, column: 16, scope: !9)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 21, column: 5, scope: !51)
!51 = distinct !DILexicalBlock(scope: !9, file: !10, line: 21, column: 5)
!52 = !DILocation(line: 21, column: 10, scope: !51)
!53 = !DILocation(line: 21, column: 12, scope: !51)
!54 = !DILocation(line: 21, column: 7, scope: !51)
!55 = !DILocation(line: 21, column: 5, scope: !9)
!56 = !DILocation(line: 22, column: 3, scope: !57)
!57 = distinct !DILexicalBlock(scope: !51, file: !10, line: 21, column: 17)
!58 = !DILocation(line: 22, column: 13, scope: !57)
!59 = !DILocation(line: 23, column: 2, scope: !57)
!60 = !DILocation(line: 24, column: 1, scope: !9)
