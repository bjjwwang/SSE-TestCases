; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_16-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_16-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @loop(i32 noundef %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  %output = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %output, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %output, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !21
  store i32 1, i32* %i, align 4, !dbg !21
  br label %for.cond, !dbg !22

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !23
  %1 = load i32, i32* %a.addr, align 4, !dbg !25
  %cmp = icmp sle i32 %0, %1, !dbg !26
  br i1 %cmp, label %for.body, label %for.end, !dbg !27

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !28
  %rem = srem i32 %2, 2, !dbg !31
  %cmp1 = icmp eq i32 %rem, 0, !dbg !32
  br i1 %cmp1, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %output, align 4, !dbg !34
  %inc = add nsw i32 %3, 1, !dbg !34
  store i32 %inc, i32* %output, align 4, !dbg !34
  br label %if.end, !dbg !36

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !37

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !38
  %inc2 = add nsw i32 %4, 1, !dbg !38
  store i32 %inc2, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !39, !llvm.loop !40

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %output, align 4, !dbg !43
  ret i32 %5, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !45 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %output = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !48, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.declare(metadata i32* %a, metadata !53, metadata !DIExpression()), !dbg !54
  store i32 9, i32* %a, align 4, !dbg !54
  call void @llvm.dbg.declare(metadata i32* %b, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 10, i32* %b, align 4, !dbg !56
  call void @llvm.dbg.declare(metadata i32* %output, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* %a, align 4, !dbg !59
  %cmp = icmp sgt i32 %0, 0, !dbg !61
  br i1 %cmp, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !63
  %call = call i32 @loop(i32 noundef %1), !dbg !65
  store i32 %call, i32* %output, align 4, !dbg !66
  %2 = load i32, i32* %output, align 4, !dbg !67
  %idxprom = sext i32 %2 to i64, !dbg !68
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !68
  store i32 1, i32* %arrayidx, align 4, !dbg !69
  br label %if.end, !dbg !70

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %b, align 4, !dbg !71
  %cmp1 = icmp sgt i32 %3, 0, !dbg !73
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !74

if.then2:                                         ; preds = %if.end
  %4 = load i32, i32* %b, align 4, !dbg !75
  %call3 = call i32 @loop(i32 noundef %4), !dbg !77
  store i32 %call3, i32* %output, align 4, !dbg !78
  %5 = load i32, i32* %output, align 4, !dbg !79
  %idxprom4 = sext i32 %5 to i64, !dbg !80
  %arrayidx5 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom4, !dbg !80
  store i32 1, i32* %arrayidx5, align 4, !dbg !81
  br label %if.end6, !dbg !82

if.end6:                                          ; preds = %if.then2, %if.end
  %6 = load i32, i32* %retval, align 4, !dbg !83
  ret i32 %6, !dbg !83
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "loop", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_16-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 14, scope: !9)
!17 = !DILocalVariable(name: "output", scope: !9, file: !10, line: 8, type: !13)
!18 = !DILocation(line: 8, column: 9, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !20, file: !10, line: 9, type: !13)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 5)
!21 = !DILocation(line: 9, column: 13, scope: !20)
!22 = !DILocation(line: 9, column: 9, scope: !20)
!23 = !DILocation(line: 9, column: 20, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !10, line: 9, column: 5)
!25 = !DILocation(line: 9, column: 25, scope: !24)
!26 = !DILocation(line: 9, column: 22, scope: !24)
!27 = !DILocation(line: 9, column: 5, scope: !20)
!28 = !DILocation(line: 10, column: 12, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !10, line: 10, column: 12)
!30 = distinct !DILexicalBlock(scope: !24, file: !10, line: 9, column: 33)
!31 = !DILocation(line: 10, column: 14, scope: !29)
!32 = !DILocation(line: 10, column: 18, scope: !29)
!33 = !DILocation(line: 10, column: 12, scope: !30)
!34 = !DILocation(line: 11, column: 19, scope: !35)
!35 = distinct !DILexicalBlock(scope: !29, file: !10, line: 10, column: 24)
!36 = !DILocation(line: 12, column: 9, scope: !35)
!37 = !DILocation(line: 13, column: 5, scope: !30)
!38 = !DILocation(line: 9, column: 29, scope: !24)
!39 = !DILocation(line: 9, column: 5, scope: !24)
!40 = distinct !{!40, !27, !41, !42}
!41 = !DILocation(line: 13, column: 5, scope: !20)
!42 = !{!"llvm.loop.mustprogress"}
!43 = !DILocation(line: 14, column: 12, scope: !9)
!44 = !DILocation(line: 14, column: 5, scope: !9)
!45 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !46, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!46 = !DISubroutineType(types: !47)
!47 = !{!13}
!48 = !DILocalVariable(name: "buffer", scope: !45, file: !10, line: 18, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 5)
!52 = !DILocation(line: 18, column: 6, scope: !45)
!53 = !DILocalVariable(name: "a", scope: !45, file: !10, line: 19, type: !13)
!54 = !DILocation(line: 19, column: 9, scope: !45)
!55 = !DILocalVariable(name: "b", scope: !45, file: !10, line: 20, type: !13)
!56 = !DILocation(line: 20, column: 6, scope: !45)
!57 = !DILocalVariable(name: "output", scope: !45, file: !10, line: 21, type: !13)
!58 = !DILocation(line: 21, column: 9, scope: !45)
!59 = !DILocation(line: 22, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !45, file: !10, line: 22, column: 8)
!61 = !DILocation(line: 22, column: 10, scope: !60)
!62 = !DILocation(line: 22, column: 8, scope: !45)
!63 = !DILocation(line: 23, column: 23, scope: !64)
!64 = distinct !DILexicalBlock(scope: !60, file: !10, line: 22, column: 15)
!65 = !DILocation(line: 23, column: 18, scope: !64)
!66 = !DILocation(line: 23, column: 16, scope: !64)
!67 = !DILocation(line: 25, column: 16, scope: !64)
!68 = !DILocation(line: 25, column: 9, scope: !64)
!69 = !DILocation(line: 25, column: 24, scope: !64)
!70 = !DILocation(line: 26, column: 5, scope: !64)
!71 = !DILocation(line: 27, column: 5, scope: !72)
!72 = distinct !DILexicalBlock(scope: !45, file: !10, line: 27, column: 5)
!73 = !DILocation(line: 27, column: 7, scope: !72)
!74 = !DILocation(line: 27, column: 5, scope: !45)
!75 = !DILocation(line: 28, column: 23, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !10, line: 27, column: 12)
!77 = !DILocation(line: 28, column: 18, scope: !76)
!78 = !DILocation(line: 28, column: 16, scope: !76)
!79 = !DILocation(line: 30, column: 16, scope: !76)
!80 = !DILocation(line: 30, column: 9, scope: !76)
!81 = !DILocation(line: 30, column: 24, scope: !76)
!82 = !DILocation(line: 31, column: 5, scope: !76)
!83 = !DILocation(line: 32, column: 1, scope: !45)
