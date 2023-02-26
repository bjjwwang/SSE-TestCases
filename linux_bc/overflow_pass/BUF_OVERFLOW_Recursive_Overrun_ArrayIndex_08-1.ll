; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_08-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_08-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@counter = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i64 @factorial(i32 %i) #0 !dbg !14 {
entry:
  %retval = alloca i64, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* @counter, align 4, !dbg !20
  %inc = add nsw i32 %0, 1, !dbg !20
  store i32 %inc, i32* @counter, align 4, !dbg !20
  %1 = load i32, i32* %i.addr, align 4, !dbg !21
  %cmp = icmp sle i32 %1, 1, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  store i64 1, i64* %retval, align 8, !dbg !25
  br label %return, !dbg !25

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %i.addr, align 4, !dbg !27
  %conv = sext i32 %2 to i64, !dbg !27
  %3 = load i32, i32* %i.addr, align 4, !dbg !28
  %sub = sub nsw i32 %3, 1, !dbg !29
  %call = call i64 @factorial(i32 %sub), !dbg !30
  %mul = mul nsw i64 %conv, %call, !dbg !31
  store i64 %mul, i64* %retval, align 8, !dbg !32
  br label %return, !dbg !32

return:                                           ; preds = %if.end, %if.then
  %4 = load i64, i64* %retval, align 8, !dbg !33
  ret i64 %4, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !34 {
entry:
  %buffer1 = alloca [6 x i32], align 16
  %buffer2 = alloca [5 x i32], align 16
  %i = alloca i32, align 4
  %f = alloca i64, align 8
  call void @llvm.dbg.declare(metadata [6 x i32]* %buffer1, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer2, metadata !42, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !DIExpression()), !dbg !48
  store i32 5, i32* %i, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i64* %f, metadata !49, metadata !DIExpression()), !dbg !50
  %0 = load i32, i32* %i, align 4, !dbg !51
  %call = call i64 @factorial(i32 %0), !dbg !52
  store i64 %call, i64* %f, align 8, !dbg !50
  %1 = load i32, i32* @counter, align 4, !dbg !53
  %idxprom = sext i32 %1 to i64, !dbg !54
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !54
  store i32 1, i32* %arrayidx, align 4, !dbg !55
  %2 = load i32, i32* @counter, align 4, !dbg !56
  %idxprom1 = sext i32 %2 to i64, !dbg !57
  %arrayidx2 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer2, i64 0, i64 %idxprom1, !dbg !57
  store i32 1, i32* %arrayidx2, align 4, !dbg !58
  ret i32 0, !dbg !59
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !6, line: 7, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_08-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_08-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "factorial", scope: !6, file: !6, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!17, !7}
!17 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!18 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !6, line: 9, type: !7)
!19 = !DILocation(line: 9, column: 20, scope: !14)
!20 = !DILocation(line: 10, column: 12, scope: !14)
!21 = !DILocation(line: 11, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !6, line: 11, column: 8)
!23 = !DILocation(line: 11, column: 10, scope: !22)
!24 = !DILocation(line: 11, column: 8, scope: !14)
!25 = !DILocation(line: 12, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !6, line: 11, column: 16)
!27 = !DILocation(line: 14, column: 12, scope: !14)
!28 = !DILocation(line: 14, column: 26, scope: !14)
!29 = !DILocation(line: 14, column: 28, scope: !14)
!30 = !DILocation(line: 14, column: 16, scope: !14)
!31 = !DILocation(line: 14, column: 14, scope: !14)
!32 = !DILocation(line: 14, column: 5, scope: !14)
!33 = !DILocation(line: 15, column: 1, scope: !14)
!34 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 17, type: !35, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{!7}
!37 = !DILocalVariable(name: "buffer1", scope: !34, file: !6, line: 18, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 192, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 6)
!41 = !DILocation(line: 18, column: 6, scope: !34)
!42 = !DILocalVariable(name: "buffer2", scope: !34, file: !6, line: 19, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 5)
!46 = !DILocation(line: 19, column: 6, scope: !34)
!47 = !DILocalVariable(name: "i", scope: !34, file: !6, line: 20, type: !7)
!48 = !DILocation(line: 20, column: 9, scope: !34)
!49 = !DILocalVariable(name: "f", scope: !34, file: !6, line: 21, type: !17)
!50 = !DILocation(line: 21, column: 10, scope: !34)
!51 = !DILocation(line: 21, column: 24, scope: !34)
!52 = !DILocation(line: 21, column: 14, scope: !34)
!53 = !DILocation(line: 23, column: 10, scope: !34)
!54 = !DILocation(line: 23, column: 2, scope: !34)
!55 = !DILocation(line: 23, column: 19, scope: !34)
!56 = !DILocation(line: 24, column: 10, scope: !34)
!57 = !DILocation(line: 24, column: 2, scope: !34)
!58 = !DILocation(line: 24, column: 19, scope: !34)
!59 = !DILocation(line: 25, column: 1, scope: !34)
