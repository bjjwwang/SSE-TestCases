; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !15, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %a, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %a), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %b, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 10, i32* %b, align 4, !dbg !24
  %0 = load i32, i32* %b, align 4, !dbg !25
  %1 = load i32, i32* %a, align 4, !dbg !26
  %div = sdiv i32 %0, %1, !dbg !27
  store i32 %div, i32* %b, align 4, !dbg !28
  %2 = load i32, i32* %a, align 4, !dbg !29
  %cmp = icmp sgt i32 %2, 0, !dbg !31
  br i1 %cmp, label %if.then, label %if.else5, !dbg !32

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %a, align 4, !dbg !33
  %cmp1 = icmp sle i32 %3, 5, !dbg !36
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !37

if.then2:                                         ; preds = %if.then
  %4 = load i32, i32* %b, align 4, !dbg !38
  %idxprom = sext i32 %4 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !40
  store i32 1, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* %b, align 4, !dbg !43
  %idxprom3 = sext i32 %5 to i64, !dbg !45
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !45
  store i32 1, i32* %arrayidx4, align 4, !dbg !46
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end8, !dbg !47

if.else5:                                         ; preds = %entry
  %6 = load i32, i32* %b, align 4, !dbg !48
  %idxprom6 = sext i32 %6 to i64, !dbg !50
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !50
  store i32 1, i32* %arrayidx7, align 4, !dbg !51
  br label %if.end8

if.end8:                                          ; preds = %if.else5, %if.end
  %7 = load i32, i32* %retval, align 4, !dbg !52
  ret i32 %7, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @scanf(i8* noundef, ...) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 10)
!19 = !DILocation(line: 8, column: 6, scope: !9)
!20 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!21 = !DILocation(line: 9, column: 6, scope: !9)
!22 = !DILocation(line: 10, column: 2, scope: !9)
!23 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 11, type: !13)
!24 = !DILocation(line: 11, column: 9, scope: !9)
!25 = !DILocation(line: 12, column: 9, scope: !9)
!26 = !DILocation(line: 12, column: 13, scope: !9)
!27 = !DILocation(line: 12, column: 11, scope: !9)
!28 = !DILocation(line: 12, column: 7, scope: !9)
!29 = !DILocation(line: 13, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 8)
!31 = !DILocation(line: 13, column: 10, scope: !30)
!32 = !DILocation(line: 13, column: 8, scope: !9)
!33 = !DILocation(line: 14, column: 6, scope: !34)
!34 = distinct !DILexicalBlock(scope: !35, file: !10, line: 14, column: 6)
!35 = distinct !DILexicalBlock(scope: !30, file: !10, line: 13, column: 15)
!36 = !DILocation(line: 14, column: 8, scope: !34)
!37 = !DILocation(line: 14, column: 6, scope: !35)
!38 = !DILocation(line: 16, column: 11, scope: !39)
!39 = distinct !DILexicalBlock(scope: !34, file: !10, line: 14, column: 14)
!40 = !DILocation(line: 16, column: 4, scope: !39)
!41 = !DILocation(line: 16, column: 14, scope: !39)
!42 = !DILocation(line: 17, column: 3, scope: !39)
!43 = !DILocation(line: 20, column: 11, scope: !44)
!44 = distinct !DILexicalBlock(scope: !34, file: !10, line: 18, column: 8)
!45 = !DILocation(line: 20, column: 4, scope: !44)
!46 = !DILocation(line: 20, column: 14, scope: !44)
!47 = !DILocation(line: 22, column: 5, scope: !35)
!48 = !DILocation(line: 24, column: 10, scope: !49)
!49 = distinct !DILexicalBlock(scope: !30, file: !10, line: 23, column: 7)
!50 = !DILocation(line: 24, column: 3, scope: !49)
!51 = !DILocation(line: 24, column: 13, scope: !49)
!52 = !DILocation(line: 26, column: 1, scope: !9)
