; ModuleID = 'linux_bc/overflow_unpass/BUF_OVERFLOW_test_62.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_62.c"
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
  %buffer = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !41, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %i, metadata !46, metadata !DIExpression()), !dbg !47
  store i32 4, i32* %i, align 4, !dbg !47
  %0 = load i32, i32* %i, align 4, !dbg !48
  %cmp = icmp sge i32 %0, 0, !dbg !50
  br i1 %cmp, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !52
  %call = call i32 @foo(i32 %1), !dbg !54
  %2 = load i32, i32* @count, align 4, !dbg !55
  %idxprom = sext i32 %2 to i64, !dbg !56
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !56
  store i32 1, i32* %arrayidx, align 4, !dbg !57
  br label %if.end, !dbg !58

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %retval, align 4, !dbg !59
  ret i32 %3, !dbg !59
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !6, line: 10, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_62.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_62.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "foo", scope: !6, file: !6, line: 13, type: !15, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !7}
!17 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !6, line: 13, type: !7)
!18 = !DILocation(line: 13, column: 13, scope: !14)
!19 = !DILocation(line: 14, column: 10, scope: !14)
!20 = !DILocation(line: 15, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !6, line: 15, column: 8)
!22 = !DILocation(line: 15, column: 10, scope: !21)
!23 = !DILocation(line: 15, column: 8, scope: !14)
!24 = !DILocation(line: 16, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !6, line: 15, column: 16)
!26 = !DILocation(line: 19, column: 20, scope: !27)
!27 = distinct !DILexicalBlock(scope: !21, file: !6, line: 18, column: 10)
!28 = !DILocation(line: 19, column: 16, scope: !27)
!29 = !DILocation(line: 19, column: 9, scope: !27)
!30 = !DILocation(line: 21, column: 1, scope: !14)
!31 = distinct !DISubprogram(name: "bar", scope: !6, file: !6, line: 23, type: !15, scopeLine: 23, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DILocalVariable(name: "i", arg: 1, scope: !31, file: !6, line: 23, type: !7)
!33 = !DILocation(line: 23, column: 13, scope: !31)
!34 = !DILocation(line: 24, column: 16, scope: !31)
!35 = !DILocation(line: 24, column: 18, scope: !31)
!36 = !DILocation(line: 24, column: 12, scope: !31)
!37 = !DILocation(line: 24, column: 5, scope: !31)
!38 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 27, type: !39, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DISubroutineType(types: !40)
!40 = !{!7}
!41 = !DILocalVariable(name: "buffer", scope: !38, file: !6, line: 28, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 5)
!45 = !DILocation(line: 28, column: 6, scope: !38)
!46 = !DILocalVariable(name: "i", scope: !38, file: !6, line: 29, type: !7)
!47 = !DILocation(line: 29, column: 9, scope: !38)
!48 = !DILocation(line: 30, column: 8, scope: !49)
!49 = distinct !DILexicalBlock(scope: !38, file: !6, line: 30, column: 8)
!50 = !DILocation(line: 30, column: 10, scope: !49)
!51 = !DILocation(line: 30, column: 8, scope: !38)
!52 = !DILocation(line: 31, column: 13, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !6, line: 30, column: 16)
!54 = !DILocation(line: 31, column: 9, scope: !53)
!55 = !DILocation(line: 33, column: 10, scope: !53)
!56 = !DILocation(line: 33, column: 3, scope: !53)
!57 = !DILocation(line: 33, column: 17, scope: !53)
!58 = !DILocation(line: 34, column: 5, scope: !53)
!59 = !DILocation(line: 35, column: 1, scope: !38)
