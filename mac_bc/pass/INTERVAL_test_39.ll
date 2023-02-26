; ModuleID = 'mac_bc/pass/INTERVAL_test_39.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_39.c"
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
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !45, metadata !DIExpression()), !dbg !46
  %0 = load i32, i32* %i, align 4, !dbg !47
  %cmp = icmp sge i32 %0, 0, !dbg !49
  br i1 %cmp, label %if.then, label %if.end, !dbg !50

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %i, align 4, !dbg !51
  %call = call i32 @fib(i32 noundef %1), !dbg !53
  %2 = load i32, i32* @count, align 4, !dbg !54
  %3 = load i32, i32* %i, align 4, !dbg !55
  %add = add nsw i32 %3, 1, !dbg !56
  %call1 = call i32 @fib(i32 noundef %add), !dbg !57
  %mul = mul nsw i32 2, %call1, !dbg !58
  %sub = sub nsw i32 %mul, 1, !dbg !59
  %cmp2 = icmp eq i32 %2, %sub, !dbg !60
  call void @svf_assert(i1 noundef zeroext %cmp2), !dbg !61
  br label %if.end, !dbg !62

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !63
  ret i32 %4, !dbg !63
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !5, line: 8, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_39.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/pass/INTERVAL_test_39.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "fib", scope: !5, file: !5, line: 10, type: !15, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!15 = !DISubroutineType(types: !16)
!16 = !{!6, !6}
!17 = !{}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !5, line: 10, type: !6)
!19 = !DILocation(line: 10, column: 13, scope: !14)
!20 = !DILocation(line: 11, column: 10, scope: !14)
!21 = !DILocation(line: 12, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !14, file: !5, line: 12, column: 8)
!23 = !DILocation(line: 12, column: 10, scope: !22)
!24 = !DILocation(line: 12, column: 8, scope: !14)
!25 = !DILocation(line: 13, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !5, line: 12, column: 16)
!27 = !DILocation(line: 15, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !5, line: 15, column: 8)
!29 = !DILocation(line: 15, column: 10, scope: !28)
!30 = !DILocation(line: 15, column: 8, scope: !14)
!31 = !DILocation(line: 16, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !5, line: 15, column: 16)
!33 = !DILocation(line: 18, column: 16, scope: !14)
!34 = !DILocation(line: 18, column: 18, scope: !14)
!35 = !DILocation(line: 18, column: 12, scope: !14)
!36 = !DILocation(line: 18, column: 29, scope: !14)
!37 = !DILocation(line: 18, column: 31, scope: !14)
!38 = !DILocation(line: 18, column: 25, scope: !14)
!39 = !DILocation(line: 18, column: 23, scope: !14)
!40 = !DILocation(line: 18, column: 5, scope: !14)
!41 = !DILocation(line: 19, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 21, type: !43, scopeLine: 21, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !17)
!43 = !DISubroutineType(types: !44)
!44 = !{!6}
!45 = !DILocalVariable(name: "i", scope: !42, file: !5, line: 22, type: !6)
!46 = !DILocation(line: 22, column: 9, scope: !42)
!47 = !DILocation(line: 23, column: 8, scope: !48)
!48 = distinct !DILexicalBlock(scope: !42, file: !5, line: 23, column: 8)
!49 = !DILocation(line: 23, column: 10, scope: !48)
!50 = !DILocation(line: 23, column: 8, scope: !42)
!51 = !DILocation(line: 24, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !48, file: !5, line: 23, column: 16)
!53 = !DILocation(line: 24, column: 9, scope: !52)
!54 = !DILocation(line: 25, column: 20, scope: !52)
!55 = !DILocation(line: 25, column: 37, scope: !52)
!56 = !DILocation(line: 25, column: 39, scope: !52)
!57 = !DILocation(line: 25, column: 33, scope: !52)
!58 = !DILocation(line: 25, column: 31, scope: !52)
!59 = !DILocation(line: 25, column: 44, scope: !52)
!60 = !DILocation(line: 25, column: 26, scope: !52)
!61 = !DILocation(line: 25, column: 9, scope: !52)
!62 = !DILocation(line: 26, column: 5, scope: !52)
!63 = !DILocation(line: 27, column: 1, scope: !42)
