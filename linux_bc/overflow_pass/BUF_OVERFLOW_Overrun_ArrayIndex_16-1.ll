; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_16-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_16-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @loop(i32 %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  %output = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %output, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %output, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !20
  store i32 1, i32* %i, align 4, !dbg !20
  br label %for.cond, !dbg !21

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !22
  %1 = load i32, i32* %a.addr, align 4, !dbg !24
  %cmp = icmp sle i32 %0, %1, !dbg !25
  br i1 %cmp, label %for.body, label %for.end, !dbg !26

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !27
  %rem = srem i32 %2, 2, !dbg !30
  %cmp1 = icmp eq i32 %rem, 0, !dbg !31
  br i1 %cmp1, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %output, align 4, !dbg !33
  %inc = add nsw i32 %3, 1, !dbg !33
  store i32 %inc, i32* %output, align 4, !dbg !33
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !36

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !37
  %inc2 = add nsw i32 %4, 1, !dbg !37
  store i32 %inc2, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !38, !llvm.loop !39

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %output, align 4, !dbg !42
  ret i32 %5, !dbg !43
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !44 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %output = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !47, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %a, metadata !52, metadata !DIExpression()), !dbg !53
  store i32 9, i32* %a, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %b, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 10, i32* %b, align 4, !dbg !55
  call void @llvm.dbg.declare(metadata i32* %output, metadata !56, metadata !DIExpression()), !dbg !57
  %0 = load i32, i32* %a, align 4, !dbg !58
  %cmp = icmp sgt i32 %0, 0, !dbg !60
  br i1 %cmp, label %if.then, label %if.end, !dbg !61

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !62
  %call = call i32 @loop(i32 %1), !dbg !64
  store i32 %call, i32* %output, align 4, !dbg !65
  %2 = load i32, i32* %output, align 4, !dbg !66
  %idxprom = sext i32 %2 to i64, !dbg !67
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !67
  store i32 1, i32* %arrayidx, align 4, !dbg !68
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %b, align 4, !dbg !70
  %cmp1 = icmp sgt i32 %3, 0, !dbg !72
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !73

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %b, align 4, !dbg !74
  %call3 = call i32 @loop(i32 %4), !dbg !76
  store i32 %call3, i32* %output, align 4, !dbg !77
  %5 = load i32, i32* %output, align 4, !dbg !78
  %idxprom4 = sext i32 %5 to i64, !dbg !79
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !79
  store i32 1, i32* %arrayidx5, align 4, !dbg !80
  br label %if.end6, !dbg !81

if.end6:                                          ; preds = %if.then2, %if.end
  %6 = load i32, i32* %retval, align 4, !dbg !82
  ret i32 %6, !dbg !82
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_16-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "loop", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_16-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 14, scope: !9)
!16 = !DILocalVariable(name: "output", scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 9, scope: !9)
!18 = !DILocalVariable(name: "i", scope: !19, file: !10, line: 9, type: !13)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 5)
!20 = !DILocation(line: 9, column: 13, scope: !19)
!21 = !DILocation(line: 9, column: 9, scope: !19)
!22 = !DILocation(line: 9, column: 20, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !10, line: 9, column: 5)
!24 = !DILocation(line: 9, column: 25, scope: !23)
!25 = !DILocation(line: 9, column: 22, scope: !23)
!26 = !DILocation(line: 9, column: 5, scope: !19)
!27 = !DILocation(line: 10, column: 12, scope: !28)
!28 = distinct !DILexicalBlock(scope: !29, file: !10, line: 10, column: 12)
!29 = distinct !DILexicalBlock(scope: !23, file: !10, line: 9, column: 33)
!30 = !DILocation(line: 10, column: 14, scope: !28)
!31 = !DILocation(line: 10, column: 18, scope: !28)
!32 = !DILocation(line: 10, column: 12, scope: !29)
!33 = !DILocation(line: 11, column: 19, scope: !34)
!34 = distinct !DILexicalBlock(scope: !28, file: !10, line: 10, column: 24)
!35 = !DILocation(line: 12, column: 9, scope: !34)
!36 = !DILocation(line: 13, column: 5, scope: !29)
!37 = !DILocation(line: 9, column: 29, scope: !23)
!38 = !DILocation(line: 9, column: 5, scope: !23)
!39 = distinct !{!39, !26, !40, !41}
!40 = !DILocation(line: 13, column: 5, scope: !19)
!41 = !{!"llvm.loop.mustprogress"}
!42 = !DILocation(line: 14, column: 12, scope: !9)
!43 = !DILocation(line: 14, column: 5, scope: !9)
!44 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !45, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!45 = !DISubroutineType(types: !46)
!46 = !{!13}
!47 = !DILocalVariable(name: "buffer", scope: !44, file: !10, line: 18, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 5)
!51 = !DILocation(line: 18, column: 6, scope: !44)
!52 = !DILocalVariable(name: "a", scope: !44, file: !10, line: 19, type: !13)
!53 = !DILocation(line: 19, column: 9, scope: !44)
!54 = !DILocalVariable(name: "b", scope: !44, file: !10, line: 20, type: !13)
!55 = !DILocation(line: 20, column: 6, scope: !44)
!56 = !DILocalVariable(name: "output", scope: !44, file: !10, line: 21, type: !13)
!57 = !DILocation(line: 21, column: 9, scope: !44)
!58 = !DILocation(line: 22, column: 8, scope: !59)
!59 = distinct !DILexicalBlock(scope: !44, file: !10, line: 22, column: 8)
!60 = !DILocation(line: 22, column: 10, scope: !59)
!61 = !DILocation(line: 22, column: 8, scope: !44)
!62 = !DILocation(line: 23, column: 23, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !10, line: 22, column: 15)
!64 = !DILocation(line: 23, column: 18, scope: !63)
!65 = !DILocation(line: 23, column: 16, scope: !63)
!66 = !DILocation(line: 25, column: 16, scope: !63)
!67 = !DILocation(line: 25, column: 9, scope: !63)
!68 = !DILocation(line: 25, column: 24, scope: !63)
!69 = !DILocation(line: 26, column: 5, scope: !63)
!70 = !DILocation(line: 27, column: 5, scope: !71)
!71 = distinct !DILexicalBlock(scope: !44, file: !10, line: 27, column: 5)
!72 = !DILocation(line: 27, column: 7, scope: !71)
!73 = !DILocation(line: 27, column: 5, scope: !44)
!74 = !DILocation(line: 28, column: 23, scope: !75)
!75 = distinct !DILexicalBlock(scope: !71, file: !10, line: 27, column: 12)
!76 = !DILocation(line: 28, column: 18, scope: !75)
!77 = !DILocation(line: 28, column: 16, scope: !75)
!78 = !DILocation(line: 30, column: 16, scope: !75)
!79 = !DILocation(line: 30, column: 9, scope: !75)
!80 = !DILocation(line: 30, column: 24, scope: !75)
!81 = !DILocation(line: 31, column: 5, scope: !75)
!82 = !DILocation(line: 32, column: 1, scope: !44)
