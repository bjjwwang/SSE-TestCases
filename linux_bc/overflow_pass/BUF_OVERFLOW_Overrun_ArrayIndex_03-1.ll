; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_03-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_03-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 %input) #0 !dbg !14 {
entry:
  %input.addr = alloca i32, align 4
  %output = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %input, i32* %input.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %input.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %output, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %output, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  store i32 0, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !25
  %1 = load i32, i32* %input.addr, align 4, !dbg !27
  %cmp = icmp slt i32 %0, %1, !dbg !28
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %output, align 4, !dbg !30
  %inc = add nsw i32 %2, 1, !dbg !30
  store i32 %inc, i32* %output, align 4, !dbg !30
  br label %for.inc, !dbg !32

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !33
  %inc1 = add nsw i32 %3, 1, !dbg !33
  store i32 %inc1, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34, !llvm.loop !35

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %output, align 4, !dbg !38
  ret i32 %4, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !40 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !43, metadata !DIExpression()), !dbg !47
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !48
  call void @srand(i32 %call) #5, !dbg !49
  %call1 = call i32 @rand() #5, !dbg !50
  %rem = srem i32 %call1, 11, !dbg !51
  store i32 %rem, i32* @a, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %b, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* @a, align 4, !dbg !55
  store i32 %0, i32* %b, align 4, !dbg !54
  %1 = load i32, i32* @a, align 4, !dbg !56
  %cmp = icmp sgt i32 %1, 0, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !60, metadata !DIExpression()), !dbg !63
  store i32 0, i32* %i, align 4, !dbg !63
  br label %for.cond, !dbg !64

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4, !dbg !65
  %3 = load i32, i32* %b, align 4, !dbg !67
  %cmp2 = icmp slt i32 %2, %3, !dbg !68
  br i1 %cmp2, label %for.body, label %for.end, !dbg !69

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* @a, align 4, !dbg !70
  %5 = load i32, i32* @a, align 4, !dbg !72
  %call3 = call i32 @foo(i32 %5), !dbg !73
  %add = add nsw i32 %4, %call3, !dbg !74
  store i32 %add, i32* @a, align 4, !dbg !75
  br label %for.inc, !dbg !76

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !77
  %inc = add nsw i32 %6, 1, !dbg !77
  store i32 %inc, i32* %i, align 4, !dbg !77
  br label %for.cond, !dbg !78, !llvm.loop !79

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !81

if.end:                                           ; preds = %for.end, %entry
  br label %while.body, !dbg !82

while.body:                                       ; preds = %if.end
  br label %LOOP, !dbg !83

LOOP:                                             ; preds = %if.then7, %while.body
  call void @llvm.dbg.label(metadata !84), !dbg !86
  %7 = load i32, i32* %b, align 4, !dbg !87
  %conv = sitofp i32 %7 to double, !dbg !87
  %call4 = call double @pow(double 2.000000e+00, double %conv) #5, !dbg !88
  %8 = load i32, i32* @a, align 4, !dbg !89
  %conv5 = sitofp i32 %8 to double, !dbg !89
  %sub = fsub double %conv5, %call4, !dbg !89
  %conv6 = fptosi double %sub to i32, !dbg !89
  store i32 %conv6, i32* @a, align 4, !dbg !89
  %9 = load i32, i32* @a, align 4, !dbg !90
  %tobool = icmp ne i32 %9, 0, !dbg !90
  br i1 %tobool, label %if.then7, label %if.end8, !dbg !92

if.then7:                                         ; preds = %LOOP
  %10 = load i32, i32* @a, align 4, !dbg !93
  %idxprom = sext i32 %10 to i64, !dbg !95
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !95
  store i32 1, i32* %arrayidx, align 4, !dbg !96
  br label %LOOP, !dbg !97

if.end8:                                          ; preds = %LOOP
  call void @exit(i32 0) #6, !dbg !98
  unreachable, !dbg !98
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_03-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "foo", scope: !6, file: !6, line: 10, type: !15, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !7}
!17 = !DILocalVariable(name: "input", arg: 1, scope: !14, file: !6, line: 10, type: !7)
!18 = !DILocation(line: 10, column: 13, scope: !14)
!19 = !DILocalVariable(name: "output", scope: !14, file: !6, line: 11, type: !7)
!20 = !DILocation(line: 11, column: 6, scope: !14)
!21 = !DILocalVariable(name: "i", scope: !22, file: !6, line: 12, type: !7)
!22 = distinct !DILexicalBlock(scope: !14, file: !6, line: 12, column: 2)
!23 = !DILocation(line: 12, column: 10, scope: !22)
!24 = !DILocation(line: 12, column: 6, scope: !22)
!25 = !DILocation(line: 12, column: 17, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !6, line: 12, column: 2)
!27 = !DILocation(line: 12, column: 21, scope: !26)
!28 = !DILocation(line: 12, column: 19, scope: !26)
!29 = !DILocation(line: 12, column: 2, scope: !22)
!30 = !DILocation(line: 13, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !6, line: 12, column: 33)
!32 = !DILocation(line: 14, column: 2, scope: !31)
!33 = !DILocation(line: 12, column: 29, scope: !26)
!34 = !DILocation(line: 12, column: 2, scope: !26)
!35 = distinct !{!35, !29, !36, !37}
!36 = !DILocation(line: 14, column: 2, scope: !22)
!37 = !{!"llvm.loop.mustprogress"}
!38 = !DILocation(line: 15, column: 9, scope: !14)
!39 = !DILocation(line: 15, column: 2, scope: !14)
!40 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 18, type: !41, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{!7}
!43 = !DILocalVariable(name: "buffer", scope: !40, file: !6, line: 19, type: !44)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 5)
!47 = !DILocation(line: 19, column: 6, scope: !40)
!48 = !DILocation(line: 20, column: 11, scope: !40)
!49 = !DILocation(line: 20, column: 5, scope: !40)
!50 = !DILocation(line: 21, column: 9, scope: !40)
!51 = !DILocation(line: 21, column: 16, scope: !40)
!52 = !DILocation(line: 21, column: 7, scope: !40)
!53 = !DILocalVariable(name: "b", scope: !40, file: !6, line: 23, type: !7)
!54 = !DILocation(line: 23, column: 6, scope: !40)
!55 = !DILocation(line: 23, column: 10, scope: !40)
!56 = !DILocation(line: 24, column: 5, scope: !57)
!57 = distinct !DILexicalBlock(scope: !40, file: !6, line: 24, column: 5)
!58 = !DILocation(line: 24, column: 7, scope: !57)
!59 = !DILocation(line: 24, column: 5, scope: !40)
!60 = !DILocalVariable(name: "i", scope: !61, file: !6, line: 25, type: !7)
!61 = distinct !DILexicalBlock(scope: !62, file: !6, line: 25, column: 3)
!62 = distinct !DILexicalBlock(scope: !57, file: !6, line: 24, column: 12)
!63 = !DILocation(line: 25, column: 11, scope: !61)
!64 = !DILocation(line: 25, column: 7, scope: !61)
!65 = !DILocation(line: 25, column: 18, scope: !66)
!66 = distinct !DILexicalBlock(scope: !61, file: !6, line: 25, column: 3)
!67 = !DILocation(line: 25, column: 22, scope: !66)
!68 = !DILocation(line: 25, column: 20, scope: !66)
!69 = !DILocation(line: 25, column: 3, scope: !61)
!70 = !DILocation(line: 26, column: 8, scope: !71)
!71 = distinct !DILexicalBlock(scope: !66, file: !6, line: 25, column: 30)
!72 = !DILocation(line: 26, column: 16, scope: !71)
!73 = !DILocation(line: 26, column: 12, scope: !71)
!74 = !DILocation(line: 26, column: 10, scope: !71)
!75 = !DILocation(line: 26, column: 6, scope: !71)
!76 = !DILocation(line: 27, column: 3, scope: !71)
!77 = !DILocation(line: 25, column: 26, scope: !66)
!78 = !DILocation(line: 25, column: 3, scope: !66)
!79 = distinct !{!79, !69, !80, !37}
!80 = !DILocation(line: 27, column: 3, scope: !61)
!81 = !DILocation(line: 29, column: 2, scope: !62)
!82 = !DILocation(line: 30, column: 2, scope: !40)
!83 = !DILocation(line: 30, column: 14, scope: !40)
!84 = !DILabel(scope: !85, name: "LOOP", file: !6, line: 31)
!85 = distinct !DILexicalBlock(scope: !40, file: !6, line: 30, column: 14)
!86 = !DILocation(line: 31, column: 3, scope: !85)
!87 = !DILocation(line: 32, column: 15, scope: !85)
!88 = !DILocation(line: 32, column: 8, scope: !85)
!89 = !DILocation(line: 32, column: 5, scope: !85)
!90 = !DILocation(line: 33, column: 6, scope: !91)
!91 = distinct !DILexicalBlock(scope: !85, file: !6, line: 33, column: 6)
!92 = !DILocation(line: 33, column: 6, scope: !85)
!93 = !DILocation(line: 34, column: 11, scope: !94)
!94 = distinct !DILexicalBlock(scope: !91, file: !6, line: 33, column: 9)
!95 = !DILocation(line: 34, column: 4, scope: !94)
!96 = !DILocation(line: 34, column: 14, scope: !94)
!97 = !DILocation(line: 35, column: 4, scope: !94)
!98 = !DILocation(line: 37, column: 3, scope: !85)
