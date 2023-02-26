; ModuleID = 'mac_bc/overflow_pass/INTERVAL_Overrun_ArrayIndex_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [4 x i8] c"%2d\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %num = alloca i32, align 4
  %buffer = alloca [2 x i32], align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %num, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 0, i32* %num, align 4, !dbg !16
  call void @llvm.dbg.declare(metadata [2 x i32]* %buffer, metadata !17, metadata !DIExpression()), !dbg !21
  %call = call i32 (i8*, ...) @scanf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32* noundef %num), !dbg !22
  %0 = load i32, i32* %num, align 4, !dbg !23
  %cmp = icmp sgt i32 %0, 99, !dbg !25
  br i1 %cmp, label %if.then, label %if.else, !dbg !26

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 0, !dbg !27
  store i32 1, i32* %arrayidx, align 4, !dbg !29
  br label %if.end, !dbg !30

if.else:                                          ; preds = %entry
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 2, !dbg !31
  store i32 1, i32* %arrayidx1, align 4, !dbg !33
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %retval, align 4, !dbg !34
  ret i32 %1, !dbg !34
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 1, type: !11, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/INTERVAL_Overrun_ArrayIndex_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "num", scope: !9, file: !10, line: 2, type: !13)
!16 = !DILocation(line: 2, column: 9, scope: !9)
!17 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 3, type: !18)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 2)
!21 = !DILocation(line: 3, column: 9, scope: !9)
!22 = !DILocation(line: 4, column: 5, scope: !9)
!23 = !DILocation(line: 6, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 6, column: 9)
!25 = !DILocation(line: 6, column: 13, scope: !24)
!26 = !DILocation(line: 6, column: 9, scope: !9)
!27 = !DILocation(line: 7, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !10, line: 6, column: 19)
!29 = !DILocation(line: 7, column: 19, scope: !28)
!30 = !DILocation(line: 8, column: 5, scope: !28)
!31 = !DILocation(line: 10, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !10, line: 9, column: 10)
!33 = !DILocation(line: 10, column: 19, scope: !32)
!34 = !DILocation(line: 12, column: 1, scope: !9)
