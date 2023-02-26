; ModuleID = 'linux_bc/pass/INTERVAL_test_44.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_44.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sumDigits.sum = internal global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sumDigits(i32 %i) #0 !dbg !2 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %cmp = icmp ne i32 %0, 0, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @sumDigits.sum, align 4, !dbg !23
  %2 = load i32, i32* %i.addr, align 4, !dbg !25
  %rem = srem i32 %2, 10, !dbg !26
  %add = add nsw i32 %1, %rem, !dbg !27
  store i32 %add, i32* @sumDigits.sum, align 4, !dbg !28
  %3 = load i32, i32* %i.addr, align 4, !dbg !29
  %div = sdiv i32 %3, 10, !dbg !30
  %call = call i32 @sumDigits(i32 %div), !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* @sumDigits.sum, align 4, !dbg !33
  ret i32 %4, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !38
  call void @srand(i32 %call) #4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !40, metadata !DIExpression()), !dbg !41
  %call1 = call i32 @rand() #4, !dbg !42
  %rem = srem i32 %call1, 999, !dbg !43
  store i32 %rem, i32* %randomNumber, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %i, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* %randomNumber, align 4, !dbg !46
  %call2 = call i32 @sumDigits(i32 %0), !dbg !47
  store i32 %call2, i32* %i, align 4, !dbg !45
  %1 = load i32, i32* %i, align 4, !dbg !48
  %cmp = icmp sge i32 %1, 0, !dbg !49
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !50

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %i, align 4, !dbg !51
  %cmp3 = icmp sle i32 %2, 26, !dbg !52
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !53
  call void @svf_assert(i1 zeroext %3), !dbg !54
  %4 = load i32, i32* %retval, align 4, !dbg !55
  ret i32 %4, !dbg !55
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

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "sum", scope: !2, file: !3, line: 9, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "sumDigits", scope: !3, file: !3, line: 8, type: !4, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "src/pass/INTERVAL_test_44.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_44.c", directory: "/home/SVF-tools/SSE-TestCases")
!9 = !{}
!10 = !{!0}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !3, line: 8, type: !6)
!18 = !DILocation(line: 8, column: 19, scope: !2)
!19 = !DILocation(line: 10, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !2, file: !3, line: 10, column: 8)
!21 = !DILocation(line: 10, column: 9, scope: !20)
!22 = !DILocation(line: 10, column: 8, scope: !2)
!23 = !DILocation(line: 11, column: 15, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !3, line: 10, column: 14)
!25 = !DILocation(line: 11, column: 22, scope: !24)
!26 = !DILocation(line: 11, column: 24, scope: !24)
!27 = !DILocation(line: 11, column: 19, scope: !24)
!28 = !DILocation(line: 11, column: 13, scope: !24)
!29 = !DILocation(line: 12, column: 19, scope: !24)
!30 = !DILocation(line: 12, column: 20, scope: !24)
!31 = !DILocation(line: 12, column: 9, scope: !24)
!32 = !DILocation(line: 13, column: 5, scope: !24)
!33 = !DILocation(line: 14, column: 12, scope: !2)
!34 = !DILocation(line: 14, column: 5, scope: !2)
!35 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 17, type: !36, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!36 = !DISubroutineType(types: !37)
!37 = !{!6}
!38 = !DILocation(line: 18, column: 11, scope: !35)
!39 = !DILocation(line: 18, column: 5, scope: !35)
!40 = !DILocalVariable(name: "randomNumber", scope: !35, file: !3, line: 19, type: !6)
!41 = !DILocation(line: 19, column: 6, scope: !35)
!42 = !DILocation(line: 19, column: 21, scope: !35)
!43 = !DILocation(line: 19, column: 28, scope: !35)
!44 = !DILocalVariable(name: "i", scope: !35, file: !3, line: 20, type: !6)
!45 = !DILocation(line: 20, column: 9, scope: !35)
!46 = !DILocation(line: 20, column: 23, scope: !35)
!47 = !DILocation(line: 20, column: 13, scope: !35)
!48 = !DILocation(line: 21, column: 16, scope: !35)
!49 = !DILocation(line: 21, column: 18, scope: !35)
!50 = !DILocation(line: 21, column: 23, scope: !35)
!51 = !DILocation(line: 21, column: 26, scope: !35)
!52 = !DILocation(line: 21, column: 28, scope: !35)
!53 = !DILocation(line: 0, scope: !35)
!54 = !DILocation(line: 21, column: 5, scope: !35)
!55 = !DILocation(line: 22, column: 1, scope: !35)
