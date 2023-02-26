; ModuleID = 'mac_bc/pass/INTERVAL_test_4.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_4.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !15
  call void @srand(i32 noundef %call), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %a, metadata !17, metadata !DIExpression()), !dbg !18
  %call1 = call i32 @rand(), !dbg !19
  %rem = srem i32 %call1, 5, !dbg !20
  store i32 %rem, i32* %a, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %b, metadata !21, metadata !DIExpression()), !dbg !22
  %call2 = call i32 @rand(), !dbg !23
  %rem3 = srem i32 %call2, 5, !dbg !24
  store i32 %rem3, i32* %b, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %c, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load i32, i32* %a, align 4, !dbg !27
  %1 = load i32, i32* %b, align 4, !dbg !28
  %mul = mul nsw i32 %0, %1, !dbg !29
  store i32 %mul, i32* %c, align 4, !dbg !26
  %2 = load i32, i32* %c, align 4, !dbg !30
  %cmp = icmp eq i32 %2, 16, !dbg !32
  br i1 %cmp, label %if.then, label %if.else, !dbg !33

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %a, align 4, !dbg !34
  %cmp4 = icmp eq i32 %3, 4, !dbg !36
  br i1 %cmp4, label %land.rhs, label %land.end, !dbg !37

land.rhs:                                         ; preds = %if.then
  %4 = load i32, i32* %b, align 4, !dbg !38
  %cmp5 = icmp eq i32 %4, 4, !dbg !39
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %5 = phi i1 [ false, %if.then ], [ %cmp5, %land.rhs ], !dbg !40
  call void @svf_assert(i1 noundef zeroext %5), !dbg !41
  br label %if.end, !dbg !42

if.else:                                          ; preds = %entry
  %6 = load i32, i32* %a, align 4, !dbg !43
  %cmp6 = icmp slt i32 %6, 4, !dbg !45
  br i1 %cmp6, label %lor.end, label %lor.rhs, !dbg !46

lor.rhs:                                          ; preds = %if.else
  %7 = load i32, i32* %b, align 4, !dbg !47
  %cmp7 = icmp slt i32 %7, 4, !dbg !48
  br label %lor.end, !dbg !46

lor.end:                                          ; preds = %lor.rhs, %if.else
  %8 = phi i1 [ true, %if.else ], [ %cmp7, %lor.rhs ]
  call void @svf_assert(i1 noundef zeroext %8), !dbg !49
  br label %if.end

if.end:                                           ; preds = %lor.end, %land.end
  %9 = load i32, i32* %retval, align 4, !dbg !50
  ret i32 %9, !dbg !50
}

declare void @srand(i32 noundef) #1

declare i32 @time(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @rand() #1

declare void @svf_assert(i1 noundef zeroext) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_4.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_4.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocation(line: 6, column: 8, scope: !9)
!16 = !DILocation(line: 6, column: 2, scope: !9)
!17 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 7, type: !13)
!18 = !DILocation(line: 7, column: 6, scope: !9)
!19 = !DILocation(line: 7, column: 10, scope: !9)
!20 = !DILocation(line: 7, column: 17, scope: !9)
!21 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 8, type: !13)
!22 = !DILocation(line: 8, column: 9, scope: !9)
!23 = !DILocation(line: 8, column: 13, scope: !9)
!24 = !DILocation(line: 8, column: 20, scope: !9)
!25 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 9, type: !13)
!26 = !DILocation(line: 9, column: 9, scope: !9)
!27 = !DILocation(line: 9, column: 13, scope: !9)
!28 = !DILocation(line: 9, column: 17, scope: !9)
!29 = !DILocation(line: 9, column: 15, scope: !9)
!30 = !DILocation(line: 10, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 9)
!32 = !DILocation(line: 10, column: 11, scope: !31)
!33 = !DILocation(line: 10, column: 9, scope: !9)
!34 = !DILocation(line: 11, column: 20, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 10, column: 18)
!36 = !DILocation(line: 11, column: 22, scope: !35)
!37 = !DILocation(line: 11, column: 27, scope: !35)
!38 = !DILocation(line: 11, column: 30, scope: !35)
!39 = !DILocation(line: 11, column: 32, scope: !35)
!40 = !DILocation(line: 0, scope: !35)
!41 = !DILocation(line: 11, column: 9, scope: !35)
!42 = !DILocation(line: 12, column: 5, scope: !35)
!43 = !DILocation(line: 14, column: 20, scope: !44)
!44 = distinct !DILexicalBlock(scope: !31, file: !10, line: 13, column: 10)
!45 = !DILocation(line: 14, column: 22, scope: !44)
!46 = !DILocation(line: 14, column: 26, scope: !44)
!47 = !DILocation(line: 14, column: 29, scope: !44)
!48 = !DILocation(line: 14, column: 31, scope: !44)
!49 = !DILocation(line: 14, column: 9, scope: !44)
!50 = !DILocation(line: 16, column: 1, scope: !9)
