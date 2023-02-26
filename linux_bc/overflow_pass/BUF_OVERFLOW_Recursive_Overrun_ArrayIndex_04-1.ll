; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_04-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_04-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @fib(i32 %i) #0 !dbg !14 {
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
  br i1 %cmp, label %if.then, label %if.end, !dbg !23

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !24
  br label %return, !dbg !24

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %i.addr, align 4, !dbg !26
  %cmp1 = icmp eq i32 %2, 1, !dbg !28
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !29

if.then2:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !30
  br label %return, !dbg !30

if.end3:                                          ; preds = %if.end
  %3 = load i32, i32* %i.addr, align 4, !dbg !32
  %sub = sub nsw i32 %3, 1, !dbg !33
  %call = call i32 @fib(i32 %sub), !dbg !34
  %4 = load i32, i32* %i.addr, align 4, !dbg !35
  %sub4 = sub nsw i32 %4, 2, !dbg !36
  %call5 = call i32 @fib(i32 %sub4), !dbg !37
  %add = add nsw i32 %call, %call5, !dbg !38
  store i32 %add, i32* %retval, align 4, !dbg !39
  br label %return, !dbg !39

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !40
  ret i32 %5, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [16 x i32], align 16
  %buffer2 = alloca [15 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [16 x i32]* %buffer1, metadata !44, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.declare(metadata [15 x i32]* %buffer2, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata i32* %i, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 5, i32* %i, align 4, !dbg !55
  %0 = load i32, i32* %i, align 4, !dbg !56
  %cmp = icmp sge i32 %0, 0, !dbg !58
  br i1 %cmp, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !60
  %call = call i32 @fib(i32 %1), !dbg !62
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %buffer1, i64 0, i64 15, !dbg !63
  store i32 1, i32* %arrayidx, align 4, !dbg !64
  %arrayidx1 = getelementptr inbounds [15 x i32], [15 x i32]* %buffer2, i64 0, i64 15, !dbg !65
  store i32 1, i32* %arrayidx1, align 4, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %retval, align 4, !dbg !68
  ret i32 %2, !dbg !68
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !6, line: 7, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_04-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "fib", scope: !6, file: !6, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!15 = !DISubroutineType(types: !16)
!16 = !{!7, !7}
!17 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !6, line: 9, type: !7)
!18 = !DILocation(line: 9, column: 13, scope: !14)
!19 = !DILocation(line: 10, column: 10, scope: !14)
!20 = !DILocation(line: 11, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !14, file: !6, line: 11, column: 8)
!22 = !DILocation(line: 11, column: 10, scope: !21)
!23 = !DILocation(line: 11, column: 8, scope: !14)
!24 = !DILocation(line: 12, column: 9, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !6, line: 11, column: 16)
!26 = !DILocation(line: 14, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !14, file: !6, line: 14, column: 8)
!28 = !DILocation(line: 14, column: 10, scope: !27)
!29 = !DILocation(line: 14, column: 8, scope: !14)
!30 = !DILocation(line: 15, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !6, line: 14, column: 16)
!32 = !DILocation(line: 17, column: 16, scope: !14)
!33 = !DILocation(line: 17, column: 18, scope: !14)
!34 = !DILocation(line: 17, column: 12, scope: !14)
!35 = !DILocation(line: 17, column: 29, scope: !14)
!36 = !DILocation(line: 17, column: 31, scope: !14)
!37 = !DILocation(line: 17, column: 25, scope: !14)
!38 = !DILocation(line: 17, column: 23, scope: !14)
!39 = !DILocation(line: 17, column: 5, scope: !14)
!40 = !DILocation(line: 18, column: 1, scope: !14)
!41 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 20, type: !42, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!7}
!44 = !DILocalVariable(name: "buffer1", scope: !41, file: !6, line: 21, type: !45)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 512, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 16)
!48 = !DILocation(line: 21, column: 6, scope: !41)
!49 = !DILocalVariable(name: "buffer2", scope: !41, file: !6, line: 22, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 480, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 15)
!53 = !DILocation(line: 22, column: 6, scope: !41)
!54 = !DILocalVariable(name: "i", scope: !41, file: !6, line: 23, type: !7)
!55 = !DILocation(line: 23, column: 9, scope: !41)
!56 = !DILocation(line: 24, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !41, file: !6, line: 24, column: 8)
!58 = !DILocation(line: 24, column: 10, scope: !57)
!59 = !DILocation(line: 24, column: 8, scope: !41)
!60 = !DILocation(line: 25, column: 13, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !6, line: 24, column: 16)
!62 = !DILocation(line: 25, column: 9, scope: !61)
!63 = !DILocation(line: 27, column: 3, scope: !61)
!64 = !DILocation(line: 27, column: 15, scope: !61)
!65 = !DILocation(line: 28, column: 9, scope: !61)
!66 = !DILocation(line: 28, column: 21, scope: !61)
!67 = !DILocation(line: 29, column: 5, scope: !61)
!68 = !DILocation(line: 30, column: 1, scope: !41)
