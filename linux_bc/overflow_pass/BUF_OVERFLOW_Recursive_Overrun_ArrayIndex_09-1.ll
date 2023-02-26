; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_09-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_09-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @sum(i32 %i) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* @count, align 4, !dbg !19
  %inc = add nsw i32 %0, 1, !dbg !19
  store i32 %inc, i32* @count, align 4, !dbg !19
  %1 = load i32, i32* %i.addr, align 4, !dbg !20
  %cmp = icmp ne i32 %1, 0, !dbg !22
  br i1 %cmp, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %i.addr, align 4, !dbg !24
  %3 = load i32, i32* %i.addr, align 4, !dbg !26
  %sub = sub nsw i32 %3, 1, !dbg !27
  %call = call i32 @sum(i32 %sub), !dbg !28
  %add = add nsw i32 %2, %call, !dbg !29
  store i32 %add, i32* %retval, align 4, !dbg !30
  br label %return, !dbg !30

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %i.addr, align 4, !dbg !31
  store i32 %4, i32* %retval, align 4, !dbg !33
  br label %return, !dbg !33

return:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !34
  ret i32 %5, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !35 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %i, metadata !43, metadata !DIExpression()), !dbg !44
  store i32 4, i32* %i, align 4, !dbg !44
  %0 = load i32, i32* %i, align 4, !dbg !45
  %cmp = icmp sge i32 %0, 0, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !49
  %call = call i32 @sum(i32 %1), !dbg !51
  %2 = load i32, i32* @count, align 4, !dbg !52
  %idxprom = sext i32 %2 to i64, !dbg !53
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !53
  store i32 1, i32* %arrayidx, align 4, !dbg !54
  br label %if.end, !dbg !55

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %retval, align 4, !dbg !56
  ret i32 %3, !dbg !56
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !6, line: 7, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_09-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_09-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "sum", scope: !6, file: !6, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !7}
!17 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !6, line: 9, type: !7)
!18 = !DILocation(line: 9, column: 13, scope: !14)
!19 = !DILocation(line: 10, column: 10, scope: !14)
!20 = !DILocation(line: 11, column: 9, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !6, line: 11, column: 9)
!22 = !DILocation(line: 11, column: 11, scope: !21)
!23 = !DILocation(line: 11, column: 9, scope: !14)
!24 = !DILocation(line: 12, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !6, line: 11, column: 17)
!26 = !DILocation(line: 12, column: 24, scope: !25)
!27 = !DILocation(line: 12, column: 26, scope: !25)
!28 = !DILocation(line: 12, column: 20, scope: !25)
!29 = !DILocation(line: 12, column: 18, scope: !25)
!30 = !DILocation(line: 12, column: 9, scope: !25)
!31 = !DILocation(line: 15, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !21, file: !6, line: 14, column: 10)
!33 = !DILocation(line: 15, column: 9, scope: !32)
!34 = !DILocation(line: 17, column: 1, scope: !14)
!35 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 19, type: !36, scopeLine: 19, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DISubroutineType(types: !37)
!37 = !{!7}
!38 = !DILocalVariable(name: "buffer", scope: !35, file: !6, line: 20, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 5)
!42 = !DILocation(line: 20, column: 6, scope: !35)
!43 = !DILocalVariable(name: "i", scope: !35, file: !6, line: 21, type: !7)
!44 = !DILocation(line: 21, column: 9, scope: !35)
!45 = !DILocation(line: 22, column: 8, scope: !46)
!46 = distinct !DILexicalBlock(scope: !35, file: !6, line: 22, column: 8)
!47 = !DILocation(line: 22, column: 10, scope: !46)
!48 = !DILocation(line: 22, column: 8, scope: !35)
!49 = !DILocation(line: 23, column: 13, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !6, line: 22, column: 16)
!51 = !DILocation(line: 23, column: 9, scope: !50)
!52 = !DILocation(line: 25, column: 10, scope: !50)
!53 = !DILocation(line: 25, column: 3, scope: !50)
!54 = !DILocation(line: 25, column: 17, scope: !50)
!55 = !DILocation(line: 26, column: 5, scope: !50)
!56 = !DILocation(line: 27, column: 1, scope: !35)
