; ModuleID = 'mac_bc/pass/INTERVAL_test_63.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_63.c"
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
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* @a, align 4, !dbg !46
  store i32 %0, i32* %b, align 4, !dbg !45
  %1 = load i32, i32* @a, align 4, !dbg !47
  %cmp = icmp sgt i32 %1, 0, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !51, metadata !DIExpression()), !dbg !54
  store i32 0, i32* %i, align 4, !dbg !54
  br label %for.cond, !dbg !55

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4, !dbg !56
  %3 = load i32, i32* %b, align 4, !dbg !58
  %cmp1 = icmp slt i32 %2, %3, !dbg !59
  br i1 %cmp1, label %for.body, label %for.end, !dbg !60

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* @a, align 4, !dbg !61
  %5 = load i32, i32* @a, align 4, !dbg !63
  %call = call i32 @foo(i32 noundef %5), !dbg !64
  %add = add nsw i32 %4, %call, !dbg !65
  store i32 %add, i32* @a, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !68
  %inc = add nsw i32 %6, 1, !dbg !68
  store i32 %inc, i32* %i, align 4, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* @a, align 4, !dbg !72
  %conv = sitofp i32 %7 to double, !dbg !72
  %8 = load i32, i32* %b, align 4, !dbg !73
  %conv2 = sitofp i32 %8 to double, !dbg !73
  %9 = load i32, i32* %b, align 4, !dbg !74
  %conv3 = sitofp i32 %9 to double, !dbg !74
  %10 = call double @llvm.pow.f64(double 2.000000e+00, double %conv3), !dbg !75
  %mul = fmul double %conv2, %10, !dbg !76
  %cmp4 = fcmp oeq double %conv, %mul, !dbg !77
  call void @svf_assert(i1 noundef zeroext %cmp4), !dbg !78
  br label %if.end, !dbg !79

if.end:                                           ; preds = %for.end, %entry
  br label %while.body, !dbg !80

while.body:                                       ; preds = %if.end
  br label %LOOP, !dbg !81

LOOP:                                             ; preds = %if.then9, %while.body
  call void @llvm.dbg.label(metadata !82), !dbg !84
  %11 = load i32, i32* %b, align 4, !dbg !85
  %conv6 = sitofp i32 %11 to double, !dbg !85
  %12 = call double @llvm.pow.f64(double 2.000000e+00, double %conv6), !dbg !86
  %13 = load i32, i32* @a, align 4, !dbg !87
  %conv7 = sitofp i32 %13 to double, !dbg !87
  %sub = fsub double %conv7, %12, !dbg !87
  %conv8 = fptosi double %sub to i32, !dbg !87
  store i32 %conv8, i32* @a, align 4, !dbg !87
  %14 = load i32, i32* @a, align 4, !dbg !88
  %tobool = icmp ne i32 %14, 0, !dbg !88
  br i1 %tobool, label %if.then9, label %if.end10, !dbg !90

if.then9:                                         ; preds = %LOOP
  br label %LOOP, !dbg !91

if.end10:                                         ; preds = %LOOP
  call void @exit(i32 noundef 0) #4, !dbg !93
  unreachable, !dbg !93
}

declare void @svf_assert(i1 noundef zeroext) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.pow.f64(double, double) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

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
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !5, line: 10, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_63.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/pass/INTERVAL_test_63.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "foo", scope: !5, file: !5, line: 12, type: !15, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "input", arg: 1, scope: !14, file: !5, line: 12, type: !6)
!19 = !DILocation(line: 12, column: 13, scope: !14)
!20 = !DILocalVariable(name: "output", scope: !14, file: !5, line: 13, type: !6)
!21 = !DILocation(line: 13, column: 6, scope: !14)
!22 = !DILocalVariable(name: "i", scope: !23, file: !5, line: 14, type: !6)
!23 = distinct !DILexicalBlock(scope: !14, file: !5, line: 14, column: 2)
!24 = !DILocation(line: 14, column: 10, scope: !23)
!25 = !DILocation(line: 14, column: 6, scope: !23)
!26 = !DILocation(line: 14, column: 17, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !5, line: 14, column: 2)
!28 = !DILocation(line: 14, column: 21, scope: !27)
!29 = !DILocation(line: 14, column: 19, scope: !27)
!30 = !DILocation(line: 14, column: 2, scope: !23)
!31 = !DILocation(line: 15, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !5, line: 14, column: 33)
!33 = !DILocation(line: 16, column: 2, scope: !32)
!34 = !DILocation(line: 14, column: 29, scope: !27)
!35 = !DILocation(line: 14, column: 2, scope: !27)
!36 = distinct !{!36, !30, !37, !38}
!37 = !DILocation(line: 16, column: 2, scope: !23)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocation(line: 17, column: 9, scope: !14)
!40 = !DILocation(line: 17, column: 2, scope: !14)
!41 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 20, type: !42, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!42 = !DISubroutineType(types: !43)
!43 = !{!6}
!44 = !DILocalVariable(name: "b", scope: !41, file: !5, line: 21, type: !6)
!45 = !DILocation(line: 21, column: 9, scope: !41)
!46 = !DILocation(line: 21, column: 13, scope: !41)
!47 = !DILocation(line: 22, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !41, file: !5, line: 22, column: 5)
!49 = !DILocation(line: 22, column: 7, scope: !48)
!50 = !DILocation(line: 22, column: 5, scope: !41)
!51 = !DILocalVariable(name: "i", scope: !52, file: !5, line: 23, type: !6)
!52 = distinct !DILexicalBlock(scope: !53, file: !5, line: 23, column: 3)
!53 = distinct !DILexicalBlock(scope: !48, file: !5, line: 22, column: 12)
!54 = !DILocation(line: 23, column: 11, scope: !52)
!55 = !DILocation(line: 23, column: 7, scope: !52)
!56 = !DILocation(line: 23, column: 18, scope: !57)
!57 = distinct !DILexicalBlock(scope: !52, file: !5, line: 23, column: 3)
!58 = !DILocation(line: 23, column: 22, scope: !57)
!59 = !DILocation(line: 23, column: 20, scope: !57)
!60 = !DILocation(line: 23, column: 3, scope: !52)
!61 = !DILocation(line: 24, column: 8, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !5, line: 23, column: 30)
!63 = !DILocation(line: 24, column: 16, scope: !62)
!64 = !DILocation(line: 24, column: 12, scope: !62)
!65 = !DILocation(line: 24, column: 10, scope: !62)
!66 = !DILocation(line: 24, column: 6, scope: !62)
!67 = !DILocation(line: 25, column: 3, scope: !62)
!68 = !DILocation(line: 23, column: 26, scope: !57)
!69 = !DILocation(line: 23, column: 3, scope: !57)
!70 = distinct !{!70, !60, !71, !38}
!71 = !DILocation(line: 25, column: 3, scope: !52)
!72 = !DILocation(line: 26, column: 17, scope: !53)
!73 = !DILocation(line: 26, column: 22, scope: !53)
!74 = !DILocation(line: 26, column: 33, scope: !53)
!75 = !DILocation(line: 26, column: 26, scope: !53)
!76 = !DILocation(line: 26, column: 24, scope: !53)
!77 = !DILocation(line: 26, column: 19, scope: !53)
!78 = !DILocation(line: 26, column: 6, scope: !53)
!79 = !DILocation(line: 27, column: 2, scope: !53)
!80 = !DILocation(line: 28, column: 2, scope: !41)
!81 = !DILocation(line: 28, column: 14, scope: !41)
!82 = !DILabel(scope: !83, name: "LOOP", file: !5, line: 29)
!83 = distinct !DILexicalBlock(scope: !41, file: !5, line: 28, column: 14)
!84 = !DILocation(line: 29, column: 3, scope: !83)
!85 = !DILocation(line: 30, column: 15, scope: !83)
!86 = !DILocation(line: 30, column: 8, scope: !83)
!87 = !DILocation(line: 30, column: 5, scope: !83)
!88 = !DILocation(line: 31, column: 6, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !5, line: 31, column: 6)
!90 = !DILocation(line: 31, column: 6, scope: !83)
!91 = !DILocation(line: 32, column: 4, scope: !92)
!92 = distinct !DILexicalBlock(scope: !89, file: !5, line: 31, column: 9)
!93 = !DILocation(line: 34, column: 3, scope: !83)
