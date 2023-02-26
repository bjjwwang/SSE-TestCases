; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_04-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_04-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@count = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @fib(i32 noundef %i) #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* @count, align 4, !dbg !20
  %inc = add nsw i32 %0, 1, !dbg !20
  store i32 %inc, i32* @count, align 4, !dbg !20
  %1 = load i32, i32* %i.addr, align 4, !dbg !21
  %cmp = icmp eq i32 %1, 0, !dbg !23
  br i1 %cmp, label %if.then, label %if.end, !dbg !24

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !25
  br label %return, !dbg !25

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %i.addr, align 4, !dbg !27
  %cmp1 = icmp eq i32 %2, 1, !dbg !29
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !30

if.then2:                                         ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

if.end3:                                          ; preds = %if.end
  %3 = load i32, i32* %i.addr, align 4, !dbg !33
  %sub = sub nsw i32 %3, 1, !dbg !34
  %call = call i32 @fib(i32 noundef %sub), !dbg !35
  %4 = load i32, i32* %i.addr, align 4, !dbg !36
  %sub4 = sub nsw i32 %4, 2, !dbg !37
  %call5 = call i32 @fib(i32 noundef %sub4), !dbg !38
  %add = add nsw i32 %call, %call5, !dbg !39
  store i32 %add, i32* %retval, align 4, !dbg !40
  br label %return, !dbg !40

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !41
  ret i32 %5, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [16 x i32], align 16
  %buffer2 = alloca [15 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [16 x i32]* %buffer1, metadata !45, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.declare(metadata [15 x i32]* %buffer2, metadata !50, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.declare(metadata i32* %i, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 5, i32* %i, align 4, !dbg !56
  %0 = load i32, i32* %i, align 4, !dbg !57
  %cmp = icmp sge i32 %0, 0, !dbg !59
  br i1 %cmp, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !61
  %call = call i32 @fib(i32 noundef %1), !dbg !63
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %buffer1, i64 0, i64 15, !dbg !64
  store i32 1, i32* %arrayidx, align 4, !dbg !65
  %arrayidx1 = getelementptr inbounds [15 x i32], [15 x i32]* %buffer2, i64 0, i64 15, !dbg !66
  store i32 1, i32* %arrayidx1, align 4, !dbg !67
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %retval, align 4, !dbg !69
  ret i32 %2, !dbg !69
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_04-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "fib", scope: !5, file: !5, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !5, line: 9, type: !6)
!19 = !DILocation(line: 9, column: 13, scope: !14)
!20 = !DILocation(line: 10, column: 10, scope: !14)
!21 = !DILocation(line: 11, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !5, line: 11, column: 8)
!23 = !DILocation(line: 11, column: 10, scope: !22)
!24 = !DILocation(line: 11, column: 8, scope: !14)
!25 = !DILocation(line: 12, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !5, line: 11, column: 16)
!27 = !DILocation(line: 14, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !5, line: 14, column: 8)
!29 = !DILocation(line: 14, column: 10, scope: !28)
!30 = !DILocation(line: 14, column: 8, scope: !14)
!31 = !DILocation(line: 15, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !5, line: 14, column: 16)
!33 = !DILocation(line: 17, column: 16, scope: !14)
!34 = !DILocation(line: 17, column: 18, scope: !14)
!35 = !DILocation(line: 17, column: 12, scope: !14)
!36 = !DILocation(line: 17, column: 29, scope: !14)
!37 = !DILocation(line: 17, column: 31, scope: !14)
!38 = !DILocation(line: 17, column: 25, scope: !14)
!39 = !DILocation(line: 17, column: 23, scope: !14)
!40 = !DILocation(line: 17, column: 5, scope: !14)
!41 = !DILocation(line: 18, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 20, type: !43, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!43 = !DISubroutineType(types: !44)
!44 = !{!6}
!45 = !DILocalVariable(name: "buffer1", scope: !42, file: !5, line: 21, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 16)
!49 = !DILocation(line: 21, column: 6, scope: !42)
!50 = !DILocalVariable(name: "buffer2", scope: !42, file: !5, line: 22, type: !51)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 480, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 15)
!54 = !DILocation(line: 22, column: 6, scope: !42)
!55 = !DILocalVariable(name: "i", scope: !42, file: !5, line: 23, type: !6)
!56 = !DILocation(line: 23, column: 9, scope: !42)
!57 = !DILocation(line: 24, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !42, file: !5, line: 24, column: 8)
!59 = !DILocation(line: 24, column: 10, scope: !58)
!60 = !DILocation(line: 24, column: 8, scope: !42)
!61 = !DILocation(line: 25, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !5, line: 24, column: 16)
!63 = !DILocation(line: 25, column: 9, scope: !62)
!64 = !DILocation(line: 27, column: 3, scope: !62)
!65 = !DILocation(line: 27, column: 15, scope: !62)
!66 = !DILocation(line: 28, column: 9, scope: !62)
!67 = !DILocation(line: 28, column: 21, scope: !62)
!68 = !DILocation(line: 29, column: 5, scope: !62)
!69 = !DILocation(line: 30, column: 1, scope: !42)
