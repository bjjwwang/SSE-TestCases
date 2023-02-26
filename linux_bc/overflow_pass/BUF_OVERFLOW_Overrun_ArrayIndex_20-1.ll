; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_20-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_20-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %input = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %input, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #4, !dbg !23
  %rem = srem i32 %call1, 10, !dbg !24
  store i32 %rem, i32* %input, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %a, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load i32, i32* %input, align 4, !dbg !27
  store i32 %0, i32* %a, align 4, !dbg !26
  call void @llvm.dbg.declare(metadata i32* %b, metadata !28, metadata !DIExpression()), !dbg !29
  %call2 = call i32 @rand() #4, !dbg !30
  %rem3 = srem i32 %call2, 10, !dbg !31
  store i32 %rem3, i32* %b, align 4, !dbg !29
  %1 = load i32, i32* %b, align 4, !dbg !32
  %cmp = icmp ne i32 %1, 0, !dbg !34
  br i1 %cmp, label %if.then, label %if.end10, !dbg !35

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !36
  %3 = load i32, i32* %b, align 4, !dbg !38
  %div = sdiv i32 %2, %3, !dbg !39
  %4 = load i32, i32* %b, align 4, !dbg !40
  %mul = mul nsw i32 %div, %4, !dbg !41
  %5 = load i32, i32* %a, align 4, !dbg !42
  %6 = load i32, i32* %b, align 4, !dbg !43
  %rem4 = srem i32 %5, %6, !dbg !44
  %add = add nsw i32 %mul, %rem4, !dbg !45
  store i32 %add, i32* %a, align 4, !dbg !46
  %7 = load i32, i32* %input, align 4, !dbg !47
  %cmp5 = icmp sge i32 %7, 0, !dbg !49
  br i1 %cmp5, label %land.lhs.true, label %if.else, !dbg !50

land.lhs.true:                                    ; preds = %if.then
  %8 = load i32, i32* %input, align 4, !dbg !51
  %cmp6 = icmp slt i32 %8, 5, !dbg !52
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !53

if.then7:                                         ; preds = %land.lhs.true
  %9 = load i32, i32* %a, align 4, !dbg !54
  %idxprom = sext i32 %9 to i64, !dbg !56
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !56
  store i32 1, i32* %arrayidx, align 4, !dbg !57
  br label %if.end, !dbg !58

if.else:                                          ; preds = %land.lhs.true, %if.then
  %10 = load i32, i32* %a, align 4, !dbg !59
  %idxprom8 = sext i32 %10 to i64, !dbg !61
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !61
  store i32 1, i32* %arrayidx9, align 4, !dbg !62
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  br label %if.end10, !dbg !63

if.end10:                                         ; preds = %if.end, %entry
  %11 = load i32, i32* %retval, align 4, !dbg !64
  ret i32 %11, !dbg !64
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_20-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_20-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 5)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 8, scope: !9)
!20 = !DILocation(line: 9, column: 2, scope: !9)
!21 = !DILocalVariable(name: "input", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 9, scope: !9)
!23 = !DILocation(line: 10, column: 17, scope: !9)
!24 = !DILocation(line: 10, column: 24, scope: !9)
!25 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 11, type: !13)
!26 = !DILocation(line: 11, column: 9, scope: !9)
!27 = !DILocation(line: 11, column: 13, scope: !9)
!28 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 12, type: !13)
!29 = !DILocation(line: 12, column: 9, scope: !9)
!30 = !DILocation(line: 12, column: 13, scope: !9)
!31 = !DILocation(line: 12, column: 20, scope: !9)
!32 = !DILocation(line: 13, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 8)
!34 = !DILocation(line: 13, column: 10, scope: !33)
!35 = !DILocation(line: 13, column: 8, scope: !9)
!36 = !DILocation(line: 15, column: 14, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 13, column: 16)
!38 = !DILocation(line: 15, column: 18, scope: !37)
!39 = !DILocation(line: 15, column: 16, scope: !37)
!40 = !DILocation(line: 15, column: 23, scope: !37)
!41 = !DILocation(line: 15, column: 21, scope: !37)
!42 = !DILocation(line: 15, column: 27, scope: !37)
!43 = !DILocation(line: 15, column: 31, scope: !37)
!44 = !DILocation(line: 15, column: 29, scope: !37)
!45 = !DILocation(line: 15, column: 25, scope: !37)
!46 = !DILocation(line: 15, column: 11, scope: !37)
!47 = !DILocation(line: 17, column: 12, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !10, line: 17, column: 12)
!49 = !DILocation(line: 17, column: 18, scope: !48)
!50 = !DILocation(line: 17, column: 23, scope: !48)
!51 = !DILocation(line: 17, column: 26, scope: !48)
!52 = !DILocation(line: 17, column: 32, scope: !48)
!53 = !DILocation(line: 17, column: 12, scope: !37)
!54 = !DILocation(line: 18, column: 11, scope: !55)
!55 = distinct !DILexicalBlock(scope: !48, file: !10, line: 17, column: 37)
!56 = !DILocation(line: 18, column: 4, scope: !55)
!57 = !DILocation(line: 18, column: 14, scope: !55)
!58 = !DILocation(line: 19, column: 3, scope: !55)
!59 = !DILocation(line: 21, column: 11, scope: !60)
!60 = distinct !DILexicalBlock(scope: !48, file: !10, line: 20, column: 8)
!61 = !DILocation(line: 21, column: 4, scope: !60)
!62 = !DILocation(line: 21, column: 14, scope: !60)
!63 = !DILocation(line: 23, column: 5, scope: !37)
!64 = !DILocation(line: 24, column: 1, scope: !9)
