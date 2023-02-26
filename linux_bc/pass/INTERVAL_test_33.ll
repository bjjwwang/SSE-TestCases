; ModuleID = 'linux_bc/pass/INTERVAL_test_33.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_33.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @digitCount(i32 %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %counter, align 4, !dbg !17
  %0 = load i32, i32* %i.addr, align 4, !dbg !18
  %cmp = icmp eq i32 %0, 0, !dbg !19
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !20

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !20

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* %i.addr, align 4, !dbg !21
  %conv = sitofp i32 %1 to double, !dbg !21
  %call = call double @log10(double %conv) #4, !dbg !22
  %add = fadd double %call, 1.000000e+00, !dbg !23
  br label %cond.end, !dbg !20

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 1.000000e+00, %cond.true ], [ %add, %cond.false ], !dbg !20
  %conv1 = fptosi double %cond to i32, !dbg !20
  store i32 %conv1, i32* %counter, align 4, !dbg !24
  %2 = load i32, i32* %counter, align 4, !dbg !25
  ret i32 %2, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local double @log10(double) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !30
  call void @srand(i32 %call) #4, !dbg !31
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !32, metadata !DIExpression()), !dbg !33
  %call1 = call i32 @rand() #4, !dbg !34
  %rem = srem i32 %call1, 999, !dbg !35
  store i32 %rem, i32* %randomNumber, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* %randomNumber, align 4, !dbg !38
  %call2 = call i32 @digitCount(i32 %0), !dbg !39
  store i32 %call2, i32* %counter, align 4, !dbg !37
  %1 = load i32, i32* %counter, align 4, !dbg !40
  %cmp = icmp sge i32 %1, 1, !dbg !41
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !42

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !43
  %cmp3 = icmp sle i32 %2, 3, !dbg !44
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !45
  call void @svf_assert(i1 zeroext %3), !dbg !46
  %4 = load i32, i32* %retval, align 4, !dbg !47
  ret i32 %4, !dbg !47
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_33.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_33.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!15 = !DILocation(line: 8, column: 20, scope: !9)
!16 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 9, type: !13)
!17 = !DILocation(line: 9, column: 9, scope: !9)
!18 = !DILocation(line: 10, column: 16, scope: !9)
!19 = !DILocation(line: 10, column: 18, scope: !9)
!20 = !DILocation(line: 10, column: 15, scope: !9)
!21 = !DILocation(line: 10, column: 35, scope: !9)
!22 = !DILocation(line: 10, column: 29, scope: !9)
!23 = !DILocation(line: 10, column: 38, scope: !9)
!24 = !DILocation(line: 10, column: 13, scope: !9)
!25 = !DILocation(line: 11, column: 12, scope: !9)
!26 = !DILocation(line: 11, column: 5, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !28, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!13}
!30 = !DILocation(line: 15, column: 11, scope: !27)
!31 = !DILocation(line: 15, column: 5, scope: !27)
!32 = !DILocalVariable(name: "randomNumber", scope: !27, file: !10, line: 16, type: !13)
!33 = !DILocation(line: 16, column: 6, scope: !27)
!34 = !DILocation(line: 16, column: 21, scope: !27)
!35 = !DILocation(line: 16, column: 28, scope: !27)
!36 = !DILocalVariable(name: "counter", scope: !27, file: !10, line: 17, type: !13)
!37 = !DILocation(line: 17, column: 9, scope: !27)
!38 = !DILocation(line: 17, column: 30, scope: !27)
!39 = !DILocation(line: 17, column: 19, scope: !27)
!40 = !DILocation(line: 18, column: 16, scope: !27)
!41 = !DILocation(line: 18, column: 24, scope: !27)
!42 = !DILocation(line: 18, column: 29, scope: !27)
!43 = !DILocation(line: 18, column: 32, scope: !27)
!44 = !DILocation(line: 18, column: 40, scope: !27)
!45 = !DILocation(line: 0, scope: !27)
!46 = !DILocation(line: 18, column: 5, scope: !27)
!47 = !DILocation(line: 19, column: 1, scope: !27)
