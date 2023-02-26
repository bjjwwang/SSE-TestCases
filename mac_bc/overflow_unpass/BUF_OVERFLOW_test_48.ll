; ModuleID = 'mac_bc/overflow_unpass/BUF_OVERFLOW_test_48.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_48.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [32 x i32], align 16
  %counter = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [32 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %counter, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %cmp = icmp sle i32 %0, 127, !dbg !28
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !30
  %call = call i32 @ispunct(i32 noundef %1) #3, !dbg !33
  %tobool = icmp ne i32 %call, 0, !dbg !33
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %for.body
  %2 = load i32, i32* %counter, align 4, !dbg !35
  %inc = add nsw i32 %2, 1, !dbg !35
  store i32 %inc, i32* %counter, align 4, !dbg !35
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %if.end
  %3 = load i32, i32* %i, align 4, !dbg !39
  %inc1 = add nsw i32 %3, 1, !dbg !39
  store i32 %inc1, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !40, !llvm.loop !41

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %counter, align 4, !dbg !44
  %idxprom = sext i32 %4 to i64, !dbg !45
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !45
  store i32 1, i32* %arrayidx, align 4, !dbg !46
  %5 = load i32, i32* %retval, align 4, !dbg !47
  ret i32 %5, !dbg !47
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly willreturn
declare i32 @ispunct(i32 noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_48.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_48.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 9, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1024, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 32)
!19 = !DILocation(line: 9, column: 9, scope: !9)
!20 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 10, type: !13)
!21 = !DILocation(line: 10, column: 6, scope: !9)
!22 = !DILocalVariable(name: "i", scope: !23, file: !10, line: 11, type: !13)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 5)
!24 = !DILocation(line: 11, column: 14, scope: !23)
!25 = !DILocation(line: 11, column: 10, scope: !23)
!26 = !DILocation(line: 11, column: 21, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !10, line: 11, column: 5)
!28 = !DILocation(line: 11, column: 23, scope: !27)
!29 = !DILocation(line: 11, column: 5, scope: !23)
!30 = !DILocation(line: 12, column: 20, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !10, line: 12, column: 12)
!32 = distinct !DILexicalBlock(scope: !27, file: !10, line: 11, column: 36)
!33 = !DILocation(line: 12, column: 12, scope: !31)
!34 = !DILocation(line: 12, column: 12, scope: !32)
!35 = !DILocation(line: 13, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !10, line: 12, column: 24)
!37 = !DILocation(line: 14, column: 3, scope: !36)
!38 = !DILocation(line: 15, column: 5, scope: !32)
!39 = !DILocation(line: 11, column: 32, scope: !27)
!40 = !DILocation(line: 11, column: 5, scope: !27)
!41 = distinct !{!41, !29, !42, !43}
!42 = !DILocation(line: 15, column: 5, scope: !23)
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 17, column: 9, scope: !9)
!45 = !DILocation(line: 17, column: 2, scope: !9)
!46 = !DILocation(line: 17, column: 18, scope: !9)
!47 = !DILocation(line: 18, column: 1, scope: !9)
