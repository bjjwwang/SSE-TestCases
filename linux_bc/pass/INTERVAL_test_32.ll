; ModuleID = 'linux_bc/pass/INTERVAL_test_32.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_32.c"
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
  br label %do.body, !dbg !18

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %div = sdiv i32 %0, 10, !dbg !21
  store i32 %div, i32* %i.addr, align 4, !dbg !22
  %1 = load i32, i32* %counter, align 4, !dbg !23
  %inc = add nsw i32 %1, 1, !dbg !23
  store i32 %inc, i32* %counter, align 4, !dbg !23
  br label %do.cond, !dbg !24

do.cond:                                          ; preds = %do.body
  %2 = load i32, i32* %i.addr, align 4, !dbg !25
  %cmp = icmp ne i32 %2, 0, !dbg !26
  br i1 %cmp, label %do.body, label %do.end, !dbg !24, !llvm.loop !27

do.end:                                           ; preds = %do.cond
  %3 = load i32, i32* %counter, align 4, !dbg !30
  ret i32 %3, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !32 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !35
  call void @srand(i32 %call) #4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !37, metadata !DIExpression()), !dbg !38
  %call1 = call i32 @rand() #4, !dbg !39
  %rem = srem i32 %call1, 999, !dbg !40
  store i32 %rem, i32* %randomNumber, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load i32, i32* %randomNumber, align 4, !dbg !43
  %call2 = call i32 @digitCount(i32 %0), !dbg !44
  store i32 %call2, i32* %counter, align 4, !dbg !42
  %1 = load i32, i32* %counter, align 4, !dbg !45
  %cmp = icmp sge i32 %1, 1, !dbg !46
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !47

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !48
  %cmp3 = icmp sle i32 %2, 3, !dbg !49
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !50
  call void @svf_assert(i1 zeroext %3), !dbg !51
  %4 = load i32, i32* %retval, align 4, !dbg !52
  ret i32 %4, !dbg !52
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_32.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_32.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 20, scope: !9)
!16 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 9, scope: !9)
!18 = !DILocation(line: 9, column: 5, scope: !9)
!19 = !DILocation(line: 10, column: 13, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!21 = !DILocation(line: 10, column: 14, scope: !20)
!22 = !DILocation(line: 10, column: 11, scope: !20)
!23 = !DILocation(line: 11, column: 16, scope: !20)
!24 = !DILocation(line: 12, column: 5, scope: !20)
!25 = !DILocation(line: 12, column: 13, scope: !9)
!26 = !DILocation(line: 12, column: 15, scope: !9)
!27 = distinct !{!27, !18, !28, !29}
!28 = !DILocation(line: 12, column: 19, scope: !9)
!29 = !{!"llvm.loop.mustprogress"}
!30 = !DILocation(line: 13, column: 12, scope: !9)
!31 = !DILocation(line: 13, column: 5, scope: !9)
!32 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 16, type: !33, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!13}
!35 = !DILocation(line: 17, column: 11, scope: !32)
!36 = !DILocation(line: 17, column: 5, scope: !32)
!37 = !DILocalVariable(name: "randomNumber", scope: !32, file: !10, line: 18, type: !13)
!38 = !DILocation(line: 18, column: 6, scope: !32)
!39 = !DILocation(line: 18, column: 21, scope: !32)
!40 = !DILocation(line: 18, column: 28, scope: !32)
!41 = !DILocalVariable(name: "counter", scope: !32, file: !10, line: 19, type: !13)
!42 = !DILocation(line: 19, column: 9, scope: !32)
!43 = !DILocation(line: 19, column: 30, scope: !32)
!44 = !DILocation(line: 19, column: 19, scope: !32)
!45 = !DILocation(line: 20, column: 16, scope: !32)
!46 = !DILocation(line: 20, column: 24, scope: !32)
!47 = !DILocation(line: 20, column: 29, scope: !32)
!48 = !DILocation(line: 20, column: 32, scope: !32)
!49 = !DILocation(line: 20, column: 40, scope: !32)
!50 = !DILocation(line: 0, scope: !32)
!51 = !DILocation(line: 20, column: 5, scope: !32)
!52 = !DILocation(line: 21, column: 1, scope: !32)
