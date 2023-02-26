; ModuleID = 'linux_bc/pass/INTERVAL_test_63.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_63.c"
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
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %b, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i32, i32* @a, align 4, !dbg !45
  store i32 %0, i32* %b, align 4, !dbg !44
  %1 = load i32, i32* @a, align 4, !dbg !46
  %cmp = icmp sgt i32 %1, 0, !dbg !48
  br i1 %cmp, label %if.then, label %if.end, !dbg !49

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %i, metadata !50, metadata !DIExpression()), !dbg !53
  store i32 0, i32* %i, align 4, !dbg !53
  br label %for.cond, !dbg !54

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i32, i32* %i, align 4, !dbg !55
  %3 = load i32, i32* %b, align 4, !dbg !57
  %cmp1 = icmp slt i32 %2, %3, !dbg !58
  br i1 %cmp1, label %for.body, label %for.end, !dbg !59

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* @a, align 4, !dbg !60
  %5 = load i32, i32* @a, align 4, !dbg !62
  %call = call i32 @foo(i32 %5), !dbg !63
  %add = add nsw i32 %4, %call, !dbg !64
  store i32 %add, i32* @a, align 4, !dbg !65
  br label %for.inc, !dbg !66

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4, !dbg !67
  %inc = add nsw i32 %6, 1, !dbg !67
  store i32 %inc, i32* %i, align 4, !dbg !67
  br label %for.cond, !dbg !68, !llvm.loop !69

for.end:                                          ; preds = %for.cond
  %7 = load i32, i32* @a, align 4, !dbg !71
  %conv = sitofp i32 %7 to double, !dbg !71
  %8 = load i32, i32* %b, align 4, !dbg !72
  %conv2 = sitofp i32 %8 to double, !dbg !72
  %9 = load i32, i32* %b, align 4, !dbg !73
  %conv3 = sitofp i32 %9 to double, !dbg !73
  %call4 = call double @pow(double 2.000000e+00, double %conv3) #5, !dbg !74
  %mul = fmul double %conv2, %call4, !dbg !75
  %cmp5 = fcmp oeq double %conv, %mul, !dbg !76
  call void @svf_assert(i1 zeroext %cmp5), !dbg !77
  br label %if.end, !dbg !78

if.end:                                           ; preds = %for.end, %entry
  br label %while.body, !dbg !79

while.body:                                       ; preds = %if.end
  br label %LOOP, !dbg !80

LOOP:                                             ; preds = %if.then11, %while.body
  call void @llvm.dbg.label(metadata !81), !dbg !83
  %10 = load i32, i32* %b, align 4, !dbg !84
  %conv7 = sitofp i32 %10 to double, !dbg !84
  %call8 = call double @pow(double 2.000000e+00, double %conv7) #5, !dbg !85
  %11 = load i32, i32* @a, align 4, !dbg !86
  %conv9 = sitofp i32 %11 to double, !dbg !86
  %sub = fsub double %conv9, %call8, !dbg !86
  %conv10 = fptosi double %sub to i32, !dbg !86
  store i32 %conv10, i32* @a, align 4, !dbg !86
  %12 = load i32, i32* @a, align 4, !dbg !87
  %tobool = icmp ne i32 %12, 0, !dbg !87
  br i1 %tobool, label %if.then11, label %if.end12, !dbg !89

if.then11:                                        ; preds = %LOOP
  br label %LOOP, !dbg !90

if.end12:                                         ; preds = %LOOP
  call void @exit(i32 0) #6, !dbg !92
  unreachable, !dbg !92
}

declare dso_local void @svf_assert(i1 zeroext) #2

; Function Attrs: nounwind
declare dso_local double @pow(double, double) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !6, line: 10, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_63.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/pass/INTERVAL_test_63.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "foo", scope: !6, file: !6, line: 12, type: !15, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !7}
!17 = !DILocalVariable(name: "input", arg: 1, scope: !14, file: !6, line: 12, type: !7)
!18 = !DILocation(line: 12, column: 13, scope: !14)
!19 = !DILocalVariable(name: "output", scope: !14, file: !6, line: 13, type: !7)
!20 = !DILocation(line: 13, column: 6, scope: !14)
!21 = !DILocalVariable(name: "i", scope: !22, file: !6, line: 14, type: !7)
!22 = distinct !DILexicalBlock(scope: !14, file: !6, line: 14, column: 2)
!23 = !DILocation(line: 14, column: 10, scope: !22)
!24 = !DILocation(line: 14, column: 6, scope: !22)
!25 = !DILocation(line: 14, column: 17, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !6, line: 14, column: 2)
!27 = !DILocation(line: 14, column: 21, scope: !26)
!28 = !DILocation(line: 14, column: 19, scope: !26)
!29 = !DILocation(line: 14, column: 2, scope: !22)
!30 = !DILocation(line: 15, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !26, file: !6, line: 14, column: 33)
!32 = !DILocation(line: 16, column: 2, scope: !31)
!33 = !DILocation(line: 14, column: 29, scope: !26)
!34 = !DILocation(line: 14, column: 2, scope: !26)
!35 = distinct !{!35, !29, !36, !37}
!36 = !DILocation(line: 16, column: 2, scope: !22)
!37 = !{!"llvm.loop.mustprogress"}
!38 = !DILocation(line: 17, column: 9, scope: !14)
!39 = !DILocation(line: 17, column: 2, scope: !14)
!40 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 20, type: !41, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!41 = !DISubroutineType(types: !42)
!42 = !{!7}
!43 = !DILocalVariable(name: "b", scope: !40, file: !6, line: 21, type: !7)
!44 = !DILocation(line: 21, column: 9, scope: !40)
!45 = !DILocation(line: 21, column: 13, scope: !40)
!46 = !DILocation(line: 22, column: 5, scope: !47)
!47 = distinct !DILexicalBlock(scope: !40, file: !6, line: 22, column: 5)
!48 = !DILocation(line: 22, column: 7, scope: !47)
!49 = !DILocation(line: 22, column: 5, scope: !40)
!50 = !DILocalVariable(name: "i", scope: !51, file: !6, line: 23, type: !7)
!51 = distinct !DILexicalBlock(scope: !52, file: !6, line: 23, column: 3)
!52 = distinct !DILexicalBlock(scope: !47, file: !6, line: 22, column: 12)
!53 = !DILocation(line: 23, column: 11, scope: !51)
!54 = !DILocation(line: 23, column: 7, scope: !51)
!55 = !DILocation(line: 23, column: 18, scope: !56)
!56 = distinct !DILexicalBlock(scope: !51, file: !6, line: 23, column: 3)
!57 = !DILocation(line: 23, column: 22, scope: !56)
!58 = !DILocation(line: 23, column: 20, scope: !56)
!59 = !DILocation(line: 23, column: 3, scope: !51)
!60 = !DILocation(line: 24, column: 8, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !6, line: 23, column: 30)
!62 = !DILocation(line: 24, column: 16, scope: !61)
!63 = !DILocation(line: 24, column: 12, scope: !61)
!64 = !DILocation(line: 24, column: 10, scope: !61)
!65 = !DILocation(line: 24, column: 6, scope: !61)
!66 = !DILocation(line: 25, column: 3, scope: !61)
!67 = !DILocation(line: 23, column: 26, scope: !56)
!68 = !DILocation(line: 23, column: 3, scope: !56)
!69 = distinct !{!69, !59, !70, !37}
!70 = !DILocation(line: 25, column: 3, scope: !51)
!71 = !DILocation(line: 26, column: 17, scope: !52)
!72 = !DILocation(line: 26, column: 22, scope: !52)
!73 = !DILocation(line: 26, column: 33, scope: !52)
!74 = !DILocation(line: 26, column: 26, scope: !52)
!75 = !DILocation(line: 26, column: 24, scope: !52)
!76 = !DILocation(line: 26, column: 19, scope: !52)
!77 = !DILocation(line: 26, column: 6, scope: !52)
!78 = !DILocation(line: 27, column: 2, scope: !52)
!79 = !DILocation(line: 28, column: 2, scope: !40)
!80 = !DILocation(line: 28, column: 14, scope: !40)
!81 = !DILabel(scope: !82, name: "LOOP", file: !6, line: 29)
!82 = distinct !DILexicalBlock(scope: !40, file: !6, line: 28, column: 14)
!83 = !DILocation(line: 29, column: 3, scope: !82)
!84 = !DILocation(line: 30, column: 15, scope: !82)
!85 = !DILocation(line: 30, column: 8, scope: !82)
!86 = !DILocation(line: 30, column: 5, scope: !82)
!87 = !DILocation(line: 31, column: 6, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !6, line: 31, column: 6)
!89 = !DILocation(line: 31, column: 6, scope: !82)
!90 = !DILocation(line: 32, column: 4, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !6, line: 31, column: 9)
!92 = !DILocation(line: 34, column: 3, scope: !82)
