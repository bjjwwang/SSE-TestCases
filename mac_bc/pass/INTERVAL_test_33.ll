; ModuleID = 'mac_bc/pass/INTERVAL_test_33.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_33.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @digitCount(i32 noundef %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %counter, align 4, !dbg !18
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 0, !dbg !20
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !21

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !21

cond.false:                                       ; preds = %entry
  %1 = load i32, i32* %i.addr, align 4, !dbg !22
  %conv = sitofp i32 %1 to double, !dbg !22
  %2 = call double @llvm.log10.f64(double %conv), !dbg !23
  %add = fadd double %2, 1.000000e+00, !dbg !24
  br label %cond.end, !dbg !21

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi double [ 1.000000e+00, %cond.true ], [ %add, %cond.false ], !dbg !21
  %conv1 = fptosi double %cond to i32, !dbg !21
  store i32 %conv1, i32* %counter, align 4, !dbg !25
  %3 = load i32, i32* %counter, align 4, !dbg !26
  ret i32 %3, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.log10.f64(double) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !31
  call void @srand(i32 noundef %call), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !33, metadata !DIExpression()), !dbg !34
  %call1 = call i32 @rand(), !dbg !35
  %rem = srem i32 %call1, 999, !dbg !36
  store i32 %rem, i32* %randomNumber, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i32, i32* %randomNumber, align 4, !dbg !39
  %call2 = call i32 @digitCount(i32 noundef %0), !dbg !40
  store i32 %call2, i32* %counter, align 4, !dbg !38
  %1 = load i32, i32* %counter, align 4, !dbg !41
  %cmp = icmp sge i32 %1, 1, !dbg !42
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !43

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !44
  %cmp3 = icmp sle i32 %2, 3, !dbg !45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !46
  call void @svf_assert(i1 noundef zeroext %3), !dbg !47
  %4 = load i32, i32* %retval, align 4, !dbg !48
  ret i32 %4, !dbg !48
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_33.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_33.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 20, scope: !9)
!17 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 9, type: !13)
!18 = !DILocation(line: 9, column: 9, scope: !9)
!19 = !DILocation(line: 10, column: 16, scope: !9)
!20 = !DILocation(line: 10, column: 18, scope: !9)
!21 = !DILocation(line: 10, column: 15, scope: !9)
!22 = !DILocation(line: 10, column: 35, scope: !9)
!23 = !DILocation(line: 10, column: 29, scope: !9)
!24 = !DILocation(line: 10, column: 38, scope: !9)
!25 = !DILocation(line: 10, column: 13, scope: !9)
!26 = !DILocation(line: 11, column: 12, scope: !9)
!27 = !DILocation(line: 11, column: 5, scope: !9)
!28 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 14, type: !29, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!29 = !DISubroutineType(types: !30)
!30 = !{!13}
!31 = !DILocation(line: 15, column: 11, scope: !28)
!32 = !DILocation(line: 15, column: 5, scope: !28)
!33 = !DILocalVariable(name: "randomNumber", scope: !28, file: !10, line: 16, type: !13)
!34 = !DILocation(line: 16, column: 6, scope: !28)
!35 = !DILocation(line: 16, column: 21, scope: !28)
!36 = !DILocation(line: 16, column: 28, scope: !28)
!37 = !DILocalVariable(name: "counter", scope: !28, file: !10, line: 17, type: !13)
!38 = !DILocation(line: 17, column: 9, scope: !28)
!39 = !DILocation(line: 17, column: 30, scope: !28)
!40 = !DILocation(line: 17, column: 19, scope: !28)
!41 = !DILocation(line: 18, column: 16, scope: !28)
!42 = !DILocation(line: 18, column: 24, scope: !28)
!43 = !DILocation(line: 18, column: 29, scope: !28)
!44 = !DILocation(line: 18, column: 32, scope: !28)
!45 = !DILocation(line: 18, column: 40, scope: !28)
!46 = !DILocation(line: 0, scope: !28)
!47 = !DILocation(line: 18, column: 5, scope: !28)
!48 = !DILocation(line: 19, column: 1, scope: !28)
