; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_03-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_03-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@a = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @foo(i32 noundef %input) #0 !dbg !14 {
entry:
  %input.addr = alloca i32, align 4
  %output = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %input, i32* %input.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %input.addr, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %output, metadata !20, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %output, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i32* %i, metadata !22, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %i, align 4, !dbg !24
  br label %for.cond, !dbg !25

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !26
  %1 = load i32, i32* %input.addr, align 4, !dbg !28
  %cmp = icmp slt i32 %0, %1, !dbg !29
  br i1 %cmp, label %for.body, label %for.end, !dbg !30

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %output, align 4, !dbg !31
  %inc = add nsw i32 %2, 1, !dbg !31
  store i32 %inc, i32* %output, align 4, !dbg !31
  br label %for.inc, !dbg !33

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4, !dbg !34
  %inc1 = add nsw i32 %3, 1, !dbg !34
  store i32 %inc1, i32* %i, align 4, !dbg !34
  br label %for.cond, !dbg !35, !llvm.loop !36

for.end:                                          ; preds = %for.cond
  %4 = load i32, i32* %output, align 4, !dbg !39
  ret i32 %4, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !44, metadata !DIExpression()), !dbg !48
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !49
  call void @srand(i32 noundef %call), !dbg !50
  %call1 = call i32 @rand(), !dbg !51
  %rem = srem i32 %call1, 11, !dbg !52
  store i32 %rem, i32* @a, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %b, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32, i32* @a, align 4, !dbg !56
  store i32 %0, i32* %b, align 4, !dbg !55
  %1 = load i32, i32* @a, align 4, !dbg !57
  %cmp = icmp sgt i32 %1, 0, !dbg !59
  br i1 %cmp, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !61, metadata !DIExpression()), !dbg !64
  store i32 0, i32* %i, align 4, !dbg !64
  br label %for.cond, !dbg !65

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4, !dbg !66
  %3 = load i32, i32* %b, align 4, !dbg !68
  %cmp2 = icmp slt i32 %2, %3, !dbg !69
  br i1 %cmp2, label %for.body, label %for.end, !dbg !70

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* @a, align 4, !dbg !71
  %5 = load i32, i32* @a, align 4, !dbg !73
  %call3 = call i32 @foo(i32 noundef %5), !dbg !74
  %add = add nsw i32 %4, %call3, !dbg !75
  store i32 %add, i32* @a, align 4, !dbg !76
  br label %for.inc, !dbg !77

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !78
  %inc = add nsw i32 %6, 1, !dbg !78
  store i32 %inc, i32* %i, align 4, !dbg !78
  br label %for.cond, !dbg !79, !llvm.loop !80

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !82

if.end:                                           ; preds = %for.end, %entry
  br label %while.body, !dbg !83

while.body:                                       ; preds = %if.end
  br label %LOOP, !dbg !84

LOOP:                                             ; preds = %if.then6, %while.body
  call void @llvm.dbg.label(metadata !85), !dbg !87
  %7 = load i32, i32* %b, align 4, !dbg !88
  %conv = sitofp i32 %7 to double, !dbg !88
  %8 = call double @llvm.pow.f64(double 2.000000e+00, double %conv), !dbg !89
  %9 = load i32, i32* @a, align 4, !dbg !90
  %conv4 = sitofp i32 %9 to double, !dbg !90
  %sub = fsub double %conv4, %8, !dbg !90
  %conv5 = fptosi double %sub to i32, !dbg !90
  store i32 %conv5, i32* @a, align 4, !dbg !90
  %10 = load i32, i32* @a, align 4, !dbg !91
  %tobool = icmp ne i32 %10, 0, !dbg !91
  br i1 %tobool, label %if.then6, label %if.end7, !dbg !93

if.then6:                                         ; preds = %LOOP
  %11 = load i32, i32* @a, align 4, !dbg !94
  %idxprom = sext i32 %11 to i64, !dbg !96
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !96
  store i32 1, i32* %arrayidx, align 4, !dbg !97
  br label %LOOP, !dbg !98

if.end7:                                          ; preds = %LOOP
  call void @exit(i32 noundef 0) #4, !dbg !99
  unreachable, !dbg !99
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.pow.f64(double, double) #1

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !5, line: 8, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_03-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "foo", scope: !5, file: !5, line: 10, type: !15, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "input", arg: 1, scope: !14, file: !5, line: 10, type: !6)
!19 = !DILocation(line: 10, column: 13, scope: !14)
!20 = !DILocalVariable(name: "output", scope: !14, file: !5, line: 11, type: !6)
!21 = !DILocation(line: 11, column: 6, scope: !14)
!22 = !DILocalVariable(name: "i", scope: !23, file: !5, line: 12, type: !6)
!23 = distinct !DILexicalBlock(scope: !14, file: !5, line: 12, column: 2)
!24 = !DILocation(line: 12, column: 10, scope: !23)
!25 = !DILocation(line: 12, column: 6, scope: !23)
!26 = !DILocation(line: 12, column: 17, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !5, line: 12, column: 2)
!28 = !DILocation(line: 12, column: 21, scope: !27)
!29 = !DILocation(line: 12, column: 19, scope: !27)
!30 = !DILocation(line: 12, column: 2, scope: !23)
!31 = !DILocation(line: 13, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !5, line: 12, column: 33)
!33 = !DILocation(line: 14, column: 2, scope: !32)
!34 = !DILocation(line: 12, column: 29, scope: !27)
!35 = !DILocation(line: 12, column: 2, scope: !27)
!36 = distinct !{!36, !30, !37, !38}
!37 = !DILocation(line: 14, column: 2, scope: !23)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocation(line: 15, column: 9, scope: !14)
!40 = !DILocation(line: 15, column: 2, scope: !14)
!41 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 18, type: !42, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!42 = !DISubroutineType(types: !43)
!43 = !{!6}
!44 = !DILocalVariable(name: "buffer", scope: !41, file: !5, line: 19, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 160, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 5)
!48 = !DILocation(line: 19, column: 6, scope: !41)
!49 = !DILocation(line: 20, column: 11, scope: !41)
!50 = !DILocation(line: 20, column: 5, scope: !41)
!51 = !DILocation(line: 21, column: 9, scope: !41)
!52 = !DILocation(line: 21, column: 16, scope: !41)
!53 = !DILocation(line: 21, column: 7, scope: !41)
!54 = !DILocalVariable(name: "b", scope: !41, file: !5, line: 23, type: !6)
!55 = !DILocation(line: 23, column: 6, scope: !41)
!56 = !DILocation(line: 23, column: 10, scope: !41)
!57 = !DILocation(line: 24, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !41, file: !5, line: 24, column: 5)
!59 = !DILocation(line: 24, column: 7, scope: !58)
!60 = !DILocation(line: 24, column: 5, scope: !41)
!61 = !DILocalVariable(name: "i", scope: !62, file: !5, line: 25, type: !6)
!62 = distinct !DILexicalBlock(scope: !63, file: !5, line: 25, column: 3)
!63 = distinct !DILexicalBlock(scope: !58, file: !5, line: 24, column: 12)
!64 = !DILocation(line: 25, column: 11, scope: !62)
!65 = !DILocation(line: 25, column: 7, scope: !62)
!66 = !DILocation(line: 25, column: 18, scope: !67)
!67 = distinct !DILexicalBlock(scope: !62, file: !5, line: 25, column: 3)
!68 = !DILocation(line: 25, column: 22, scope: !67)
!69 = !DILocation(line: 25, column: 20, scope: !67)
!70 = !DILocation(line: 25, column: 3, scope: !62)
!71 = !DILocation(line: 26, column: 8, scope: !72)
!72 = distinct !DILexicalBlock(scope: !67, file: !5, line: 25, column: 30)
!73 = !DILocation(line: 26, column: 16, scope: !72)
!74 = !DILocation(line: 26, column: 12, scope: !72)
!75 = !DILocation(line: 26, column: 10, scope: !72)
!76 = !DILocation(line: 26, column: 6, scope: !72)
!77 = !DILocation(line: 27, column: 3, scope: !72)
!78 = !DILocation(line: 25, column: 26, scope: !67)
!79 = !DILocation(line: 25, column: 3, scope: !67)
!80 = distinct !{!80, !70, !81, !38}
!81 = !DILocation(line: 27, column: 3, scope: !62)
!82 = !DILocation(line: 29, column: 2, scope: !63)
!83 = !DILocation(line: 30, column: 2, scope: !41)
!84 = !DILocation(line: 30, column: 14, scope: !41)
!85 = !DILabel(scope: !86, name: "LOOP", file: !5, line: 31)
!86 = distinct !DILexicalBlock(scope: !41, file: !5, line: 30, column: 14)
!87 = !DILocation(line: 31, column: 3, scope: !86)
!88 = !DILocation(line: 32, column: 15, scope: !86)
!89 = !DILocation(line: 32, column: 8, scope: !86)
!90 = !DILocation(line: 32, column: 5, scope: !86)
!91 = !DILocation(line: 33, column: 6, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !5, line: 33, column: 6)
!93 = !DILocation(line: 33, column: 6, scope: !86)
!94 = !DILocation(line: 34, column: 11, scope: !95)
!95 = distinct !DILexicalBlock(scope: !92, file: !5, line: 33, column: 9)
!96 = !DILocation(line: 34, column: 4, scope: !95)
!97 = !DILocation(line: 34, column: 14, scope: !95)
!98 = !DILocation(line: 35, column: 4, scope: !95)
!99 = !DILocation(line: 37, column: 3, scope: !86)
