; ModuleID = 'linux_bc/pass/INTERVAL_test_41.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @foo(i32 %i) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @count, align 4, !dbg !19
  %inc = add nsw i32 %0, 1, !dbg !19
  store i32 %inc, i32* @count, align 4, !dbg !19
  %1 = load i32, i32* %i.addr, align 4, !dbg !20
  %cmp = icmp eq i32 %1, 0, !dbg !22
  br i1 %cmp, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !24
  br label %return, !dbg !24

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %i.addr, align 4, !dbg !26
  %call = call i32 @bar(i32 %2), !dbg !28
  store i32 %call, i32* %retval, align 4, !dbg !29
  br label %return, !dbg !29

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval, align 4, !dbg !30
  ret i32 %3, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @bar(i32 %i) #0 !dbg !31 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !32, metadata !DIExpression()), !dbg !33
  %0 = load i32, i32* %i.addr, align 4, !dbg !34
  %sub = sub nsw i32 %0, 1, !dbg !35
  %call = call i32 @foo(i32 %sub), !dbg !36
  ret i32 %call, !dbg !37
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !38 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !41, metadata !DIExpression()), !dbg !42
  %0 = load i32, i32* %i, align 4, !dbg !43
  %cmp = icmp sge i32 %0, 0, !dbg !45
  br i1 %cmp, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !47
  %call = call i32 @foo(i32 %1), !dbg !49
  %2 = load i32, i32* @count, align 4, !dbg !50
  %3 = load i32, i32* %i, align 4, !dbg !51
  %add = add nsw i32 %3, 1, !dbg !52
  %cmp1 = icmp eq i32 %2, %add, !dbg !53
  call void @svf_assert(i1 zeroext %cmp1), !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !56
  ret i32 %4, !dbg !56
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !6, line: 8, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_41.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/pass/INTERVAL_test_41.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "foo", scope: !6, file: !6, line: 11, type: !15, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !7}
!17 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !6, line: 11, type: !7)
!18 = !DILocation(line: 11, column: 13, scope: !14)
!19 = !DILocation(line: 12, column: 10, scope: !14)
!20 = !DILocation(line: 13, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !6, line: 13, column: 8)
!22 = !DILocation(line: 13, column: 10, scope: !21)
!23 = !DILocation(line: 13, column: 8, scope: !14)
!24 = !DILocation(line: 14, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !6, line: 13, column: 16)
!26 = !DILocation(line: 17, column: 20, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !6, line: 16, column: 10)
!28 = !DILocation(line: 17, column: 16, scope: !27)
!29 = !DILocation(line: 17, column: 9, scope: !27)
!30 = !DILocation(line: 19, column: 1, scope: !14)
!31 = distinct !DISubprogram(name: "bar", scope: !6, file: !6, line: 21, type: !15, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DILocalVariable(name: "i", arg: 1, scope: !31, file: !6, line: 21, type: !7)
!33 = !DILocation(line: 21, column: 13, scope: !31)
!34 = !DILocation(line: 22, column: 16, scope: !31)
!35 = !DILocation(line: 22, column: 18, scope: !31)
!36 = !DILocation(line: 22, column: 12, scope: !31)
!37 = !DILocation(line: 22, column: 5, scope: !31)
!38 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 25, type: !39, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!7}
!41 = !DILocalVariable(name: "i", scope: !38, file: !6, line: 26, type: !7)
!42 = !DILocation(line: 26, column: 9, scope: !38)
!43 = !DILocation(line: 27, column: 8, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !6, line: 27, column: 8)
!45 = !DILocation(line: 27, column: 10, scope: !44)
!46 = !DILocation(line: 27, column: 8, scope: !38)
!47 = !DILocation(line: 28, column: 13, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !6, line: 27, column: 16)
!49 = !DILocation(line: 28, column: 9, scope: !48)
!50 = !DILocation(line: 29, column: 20, scope: !48)
!51 = !DILocation(line: 29, column: 29, scope: !48)
!52 = !DILocation(line: 29, column: 31, scope: !48)
!53 = !DILocation(line: 29, column: 26, scope: !48)
!54 = !DILocation(line: 29, column: 9, scope: !48)
!55 = !DILocation(line: 30, column: 5, scope: !48)
!56 = !DILocation(line: 31, column: 1, scope: !38)
