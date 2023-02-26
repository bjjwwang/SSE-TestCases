; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_27-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_27-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @digitCount(i32 noundef %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %counter, align 4, !dbg !18
  br label %do.body, !dbg !19

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, i32* %i.addr, align 4, !dbg !20
  %div = sdiv i32 %0, 10, !dbg !22
  store i32 %div, i32* %i.addr, align 4, !dbg !23
  %1 = load i32, i32* %counter, align 4, !dbg !24
  %inc = add nsw i32 %1, 1, !dbg !24
  store i32 %inc, i32* %counter, align 4, !dbg !24
  br label %do.cond, !dbg !25

do.cond:                                          ; preds = %do.body
  %2 = load i32, i32* %i.addr, align 4, !dbg !26
  %cmp = icmp ne i32 %2, 0, !dbg !27
  br i1 %cmp, label %do.body, label %do.end, !dbg !25, !llvm.loop !28

do.end:                                           ; preds = %do.cond
  %3 = load i32, i32* %counter, align 4, !dbg !31
  ret i32 %3, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !33 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [4 x i32], align 16
  %buffer2 = alloca [3 x i32], align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %buffer1, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [3 x i32]* %buffer2, metadata !41, metadata !DIExpression()), !dbg !45
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !46
  call void @srand(i32 noundef %call), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !48, metadata !DIExpression()), !dbg !49
  %call1 = call i32 @rand(), !dbg !50
  %rem = srem i32 %call1, 999, !dbg !51
  store i32 %rem, i32* %randomNumber, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load i32, i32* %randomNumber, align 4, !dbg !54
  %call2 = call i32 @digitCount(i32 noundef %0), !dbg !55
  store i32 %call2, i32* %counter, align 4, !dbg !53
  %1 = load i32, i32* %counter, align 4, !dbg !56
  %cmp = icmp eq i32 %1, 3, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !60
  %idxprom = sext i32 %2 to i64, !dbg !62
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !62
  store i32 1, i32* %arrayidx, align 4, !dbg !63
  %3 = load i32, i32* %counter, align 4, !dbg !64
  %idxprom3 = sext i32 %3 to i64, !dbg !65
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !65
  store i32 1, i32* %arrayidx4, align 4, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !68
  ret i32 %4, !dbg !68
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_27-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_27-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 20, scope: !9)
!17 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 8, type: !13)
!18 = !DILocation(line: 8, column: 9, scope: !9)
!19 = !DILocation(line: 9, column: 5, scope: !9)
!20 = !DILocation(line: 10, column: 13, scope: !21)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!22 = !DILocation(line: 10, column: 14, scope: !21)
!23 = !DILocation(line: 10, column: 11, scope: !21)
!24 = !DILocation(line: 11, column: 16, scope: !21)
!25 = !DILocation(line: 12, column: 5, scope: !21)
!26 = !DILocation(line: 12, column: 13, scope: !9)
!27 = !DILocation(line: 12, column: 15, scope: !9)
!28 = distinct !{!28, !19, !29, !30}
!29 = !DILocation(line: 12, column: 19, scope: !9)
!30 = !{!"llvm.loop.mustprogress"}
!31 = !DILocation(line: 13, column: 12, scope: !9)
!32 = !DILocation(line: 13, column: 5, scope: !9)
!33 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 16, type: !34, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!34 = !DISubroutineType(types: !35)
!35 = !{!13}
!36 = !DILocalVariable(name: "buffer1", scope: !33, file: !10, line: 17, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 4)
!40 = !DILocation(line: 17, column: 6, scope: !33)
!41 = !DILocalVariable(name: "buffer2", scope: !33, file: !10, line: 18, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 3)
!45 = !DILocation(line: 18, column: 6, scope: !33)
!46 = !DILocation(line: 19, column: 11, scope: !33)
!47 = !DILocation(line: 19, column: 5, scope: !33)
!48 = !DILocalVariable(name: "randomNumber", scope: !33, file: !10, line: 20, type: !13)
!49 = !DILocation(line: 20, column: 6, scope: !33)
!50 = !DILocation(line: 20, column: 21, scope: !33)
!51 = !DILocation(line: 20, column: 28, scope: !33)
!52 = !DILocalVariable(name: "counter", scope: !33, file: !10, line: 21, type: !13)
!53 = !DILocation(line: 21, column: 9, scope: !33)
!54 = !DILocation(line: 21, column: 30, scope: !33)
!55 = !DILocation(line: 21, column: 19, scope: !33)
!56 = !DILocation(line: 23, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !33, file: !10, line: 23, column: 5)
!58 = !DILocation(line: 23, column: 13, scope: !57)
!59 = !DILocation(line: 23, column: 5, scope: !33)
!60 = !DILocation(line: 24, column: 11, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !10, line: 23, column: 19)
!62 = !DILocation(line: 24, column: 3, scope: !61)
!63 = !DILocation(line: 24, column: 20, scope: !61)
!64 = !DILocation(line: 25, column: 11, scope: !61)
!65 = !DILocation(line: 25, column: 3, scope: !61)
!66 = !DILocation(line: 25, column: 20, scope: !61)
!67 = !DILocation(line: 26, column: 2, scope: !61)
!68 = !DILocation(line: 27, column: 1, scope: !33)
