; ModuleID = 'mac_bc/pass/INTERVAL_test_34.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_34.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@digitCount.counter = internal global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @digitCount(i32 noundef %i) #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* %i.addr, align 4, !dbg !20
  %cmp = icmp sgt i32 %0, 0, !dbg !22
  br i1 %cmp, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @digitCount.counter, align 4, !dbg !24
  %inc = add nsw i32 %1, 1, !dbg !24
  store i32 %inc, i32* @digitCount.counter, align 4, !dbg !24
  %2 = load i32, i32* %i.addr, align 4, !dbg !26
  %div = sdiv i32 %2, 10, !dbg !27
  %call = call i32 @digitCount(i32 noundef %div), !dbg !28
  store i32 %call, i32* %retval, align 4, !dbg !29
  br label %return, !dbg !29

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @digitCount.counter, align 4, !dbg !30
  store i32 %3, i32* %retval, align 4, !dbg !32
  br label %return, !dbg !32

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !33
  ret i32 %4, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !34 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !37
  call void @srand(i32 noundef %call), !dbg !38
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !39, metadata !DIExpression()), !dbg !40
  %call1 = call i32 @rand(), !dbg !41
  %rem = srem i32 %call1, 999, !dbg !42
  %add = add nsw i32 1, %rem, !dbg !43
  store i32 %add, i32* %randomNumber, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !44, metadata !DIExpression()), !dbg !45
  %0 = load i32, i32* %randomNumber, align 4, !dbg !46
  %call2 = call i32 @digitCount(i32 noundef %0), !dbg !47
  store i32 %call2, i32* %counter, align 4, !dbg !45
  %1 = load i32, i32* %counter, align 4, !dbg !48
  %cmp = icmp sge i32 %1, 1, !dbg !49
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !50

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !51
  %cmp3 = icmp sle i32 %2, 3, !dbg !52
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !53
  call void @svf_assert(i1 noundef zeroext %3), !dbg !54
  %4 = load i32, i32* %retval, align 4, !dbg !55
  ret i32 %4, !dbg !55
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 8, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "digitCount", scope: !3, file: !3, line: 7, type: !4, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !10)
!3 = !DIFile(filename: "src/pass/INTERVAL_test_34.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!8 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_34.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!9 = !{!0}
!10 = !{}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !3, line: 7, type: !6)
!19 = !DILocation(line: 7, column: 20, scope: !2)
!20 = !DILocation(line: 9, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !2, file: !3, line: 9, column: 8)
!22 = !DILocation(line: 9, column: 10, scope: !21)
!23 = !DILocation(line: 9, column: 8, scope: !2)
!24 = !DILocation(line: 10, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !3, line: 9, column: 15)
!26 = !DILocation(line: 11, column: 27, scope: !25)
!27 = !DILocation(line: 11, column: 28, scope: !25)
!28 = !DILocation(line: 11, column: 16, scope: !25)
!29 = !DILocation(line: 11, column: 9, scope: !25)
!30 = !DILocation(line: 14, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !21, file: !3, line: 13, column: 10)
!32 = !DILocation(line: 14, column: 9, scope: !31)
!33 = !DILocation(line: 16, column: 1, scope: !2)
!34 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 18, type: !35, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !10)
!35 = !DISubroutineType(types: !36)
!36 = !{!6}
!37 = !DILocation(line: 19, column: 11, scope: !34)
!38 = !DILocation(line: 19, column: 5, scope: !34)
!39 = !DILocalVariable(name: "randomNumber", scope: !34, file: !3, line: 20, type: !6)
!40 = !DILocation(line: 20, column: 6, scope: !34)
!41 = !DILocation(line: 20, column: 25, scope: !34)
!42 = !DILocation(line: 20, column: 32, scope: !34)
!43 = !DILocation(line: 20, column: 23, scope: !34)
!44 = !DILocalVariable(name: "counter", scope: !34, file: !3, line: 21, type: !6)
!45 = !DILocation(line: 21, column: 9, scope: !34)
!46 = !DILocation(line: 21, column: 30, scope: !34)
!47 = !DILocation(line: 21, column: 19, scope: !34)
!48 = !DILocation(line: 22, column: 16, scope: !34)
!49 = !DILocation(line: 22, column: 24, scope: !34)
!50 = !DILocation(line: 22, column: 29, scope: !34)
!51 = !DILocation(line: 22, column: 32, scope: !34)
!52 = !DILocation(line: 22, column: 40, scope: !34)
!53 = !DILocation(line: 0, scope: !34)
!54 = !DILocation(line: 22, column: 5, scope: !34)
!55 = !DILocation(line: 23, column: 1, scope: !34)
