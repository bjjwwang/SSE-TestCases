; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_24-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_24-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [91 x i32], align 16
  %ch = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [91 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #5, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %ch, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #5, !dbg !23
  %rem = srem i32 %call1, 128, !dbg !24
  store i32 %rem, i32* %ch, align 4, !dbg !22
  %0 = load i32, i32* %ch, align 4, !dbg !25
  %cmp = icmp sge i32 %0, 97, !dbg !27
  br i1 %cmp, label %land.lhs.true, label %if.else, !dbg !28

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %ch, align 4, !dbg !29
  %cmp2 = icmp sle i32 %1, 122, !dbg !30
  br i1 %cmp2, label %if.then, label %if.else, !dbg !31

if.then:                                          ; preds = %land.lhs.true
  %2 = load i32, i32* %ch, align 4, !dbg !32
  %call3 = call i32 @toupper(i32 %2) #6, !dbg !34
  store i32 %call3, i32* %ch, align 4, !dbg !35
  %3 = load i32, i32* %ch, align 4, !dbg !36
  %idxprom = sext i32 %3 to i64, !dbg !37
  %arrayidx = getelementptr inbounds [91 x i32], [91 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !37
  store i32 1, i32* %arrayidx, align 4, !dbg !38
  br label %if.end, !dbg !39

if.else:                                          ; preds = %land.lhs.true, %entry
  %4 = load i32, i32* %ch, align 4, !dbg !40
  %idxprom4 = sext i32 %4 to i64, !dbg !42
  %arrayidx5 = getelementptr inbounds [91 x i32], [91 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !42
  store i32 1, i32* %arrayidx5, align 4, !dbg !43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !44
  ret i32 %5, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i32 @toupper(i32) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_24-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_24-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 9, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 2912, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 91)
!18 = !DILocation(line: 9, column: 6, scope: !9)
!19 = !DILocation(line: 10, column: 8, scope: !9)
!20 = !DILocation(line: 10, column: 2, scope: !9)
!21 = !DILocalVariable(name: "ch", scope: !9, file: !10, line: 11, type: !13)
!22 = !DILocation(line: 11, column: 6, scope: !9)
!23 = !DILocation(line: 11, column: 11, scope: !9)
!24 = !DILocation(line: 11, column: 18, scope: !9)
!25 = !DILocation(line: 12, column: 6, scope: !26)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 6)
!27 = !DILocation(line: 12, column: 9, scope: !26)
!28 = !DILocation(line: 12, column: 15, scope: !26)
!29 = !DILocation(line: 12, column: 18, scope: !26)
!30 = !DILocation(line: 12, column: 21, scope: !26)
!31 = !DILocation(line: 12, column: 6, scope: !9)
!32 = !DILocation(line: 13, column: 16, scope: !33)
!33 = distinct !DILexicalBlock(scope: !26, file: !10, line: 12, column: 29)
!34 = !DILocation(line: 13, column: 8, scope: !33)
!35 = !DILocation(line: 13, column: 6, scope: !33)
!36 = !DILocation(line: 15, column: 10, scope: !33)
!37 = !DILocation(line: 15, column: 3, scope: !33)
!38 = !DILocation(line: 15, column: 14, scope: !33)
!39 = !DILocation(line: 16, column: 2, scope: !33)
!40 = !DILocation(line: 18, column: 10, scope: !41)
!41 = distinct !DILexicalBlock(scope: !26, file: !10, line: 17, column: 7)
!42 = !DILocation(line: 18, column: 3, scope: !41)
!43 = !DILocation(line: 18, column: 14, scope: !41)
!44 = !DILocation(line: 20, column: 1, scope: !9)
