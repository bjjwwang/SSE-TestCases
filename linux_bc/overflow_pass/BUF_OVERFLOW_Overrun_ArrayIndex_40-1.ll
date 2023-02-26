; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_40-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_40-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %a, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #4, !dbg !23
  %rem = srem i32 %call1, 11, !dbg !24
  %sub = sub nsw i32 %rem, 5, !dbg !25
  store i32 %sub, i32* %a, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %b, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %a, align 4, !dbg !28
  %1 = load i32, i32* %a, align 4, !dbg !28
  %mul = mul nsw i32 %0, %1, !dbg !28
  %2 = load i32, i32* %a, align 4, !dbg !28
  %mul2 = mul nsw i32 %mul, %2, !dbg !28
  %3 = load i32, i32* %a, align 4, !dbg !28
  %cmp = icmp slt i32 %mul2, %3, !dbg !28
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !28

cond.true:                                        ; preds = %entry
  %4 = load i32, i32* %a, align 4, !dbg !28
  %5 = load i32, i32* %a, align 4, !dbg !28
  %mul3 = mul nsw i32 %4, %5, !dbg !28
  %6 = load i32, i32* %a, align 4, !dbg !28
  %mul4 = mul nsw i32 %mul3, %6, !dbg !28
  br label %cond.end, !dbg !28

cond.false:                                       ; preds = %entry
  %7 = load i32, i32* %a, align 4, !dbg !28
  br label %cond.end, !dbg !28

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %mul4, %cond.true ], [ %7, %cond.false ], !dbg !28
  store i32 %cond, i32* %b, align 4, !dbg !27
  %8 = load i32, i32* %b, align 4, !dbg !29
  %9 = load i32, i32* %a, align 4, !dbg !31
  %cmp5 = icmp eq i32 %8, %9, !dbg !32
  br i1 %cmp5, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %cond.end
  %10 = load i32, i32* %a, align 4, !dbg !34
  %tobool = icmp ne i32 %10, 0, !dbg !34
  br i1 %tobool, label %if.end, label %if.then6, !dbg !37

if.then6:                                         ; preds = %if.then
  %11 = load i32, i32* %a, align 4, !dbg !38
  %idxprom = sext i32 %11 to i64, !dbg !40
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !40
  store i32 1, i32* %arrayidx, align 4, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then6, %if.then
  br label %if.end9, !dbg !43

if.else:                                          ; preds = %cond.end
  %12 = load i32, i32* %a, align 4, !dbg !44
  %idxprom7 = sext i32 %12 to i64, !dbg !46
  %arrayidx8 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !46
  store i32 1, i32* %arrayidx8, align 4, !dbg !47
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.end
  %13 = load i32, i32* %retval, align 4, !dbg !48
  ret i32 %13, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_40-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_40-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 10, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 5)
!18 = !DILocation(line: 10, column: 6, scope: !9)
!19 = !DILocation(line: 11, column: 8, scope: !9)
!20 = !DILocation(line: 11, column: 2, scope: !9)
!21 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 12, type: !13)
!22 = !DILocation(line: 12, column: 9, scope: !9)
!23 = !DILocation(line: 12, column: 14, scope: !9)
!24 = !DILocation(line: 12, column: 21, scope: !9)
!25 = !DILocation(line: 12, column: 27, scope: !9)
!26 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 14, type: !13)
!27 = !DILocation(line: 14, column: 6, scope: !9)
!28 = !DILocation(line: 14, column: 10, scope: !9)
!29 = !DILocation(line: 15, column: 5, scope: !30)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 15, column: 5)
!31 = !DILocation(line: 15, column: 10, scope: !30)
!32 = !DILocation(line: 15, column: 7, scope: !30)
!33 = !DILocation(line: 15, column: 5, scope: !9)
!34 = !DILocation(line: 17, column: 7, scope: !35)
!35 = distinct !DILexicalBlock(scope: !36, file: !10, line: 17, column: 6)
!36 = distinct !DILexicalBlock(scope: !30, file: !10, line: 15, column: 13)
!37 = !DILocation(line: 17, column: 6, scope: !36)
!38 = !DILocation(line: 18, column: 11, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !10, line: 17, column: 10)
!40 = !DILocation(line: 18, column: 4, scope: !39)
!41 = !DILocation(line: 18, column: 14, scope: !39)
!42 = !DILocation(line: 19, column: 3, scope: !39)
!43 = !DILocation(line: 20, column: 2, scope: !36)
!44 = !DILocation(line: 23, column: 10, scope: !45)
!45 = distinct !DILexicalBlock(scope: !30, file: !10, line: 21, column: 7)
!46 = !DILocation(line: 23, column: 3, scope: !45)
!47 = !DILocation(line: 23, column: 13, scope: !45)
!48 = !DILocation(line: 25, column: 1, scope: !9)
