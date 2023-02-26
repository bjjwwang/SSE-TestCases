; ModuleID = 'mac_bc/pass/INTERVAL_test_45.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_45.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @baseConversion(i32 noundef %i, i32 noundef %base) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %base.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %base, i32* %base.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %base.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %cmp = icmp eq i32 %0, 0, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !23
  br label %return, !dbg !23

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %i.addr, align 4, !dbg !25
  %2 = load i32, i32* %base.addr, align 4, !dbg !26
  %rem = srem i32 %1, %2, !dbg !27
  %3 = load i32, i32* %i.addr, align 4, !dbg !28
  %4 = load i32, i32* %base.addr, align 4, !dbg !29
  %div = sdiv i32 %3, %4, !dbg !30
  %5 = load i32, i32* %base.addr, align 4, !dbg !31
  %call = call i32 @baseConversion(i32 noundef %div, i32 noundef %5), !dbg !32
  %mul = mul nsw i32 10, %call, !dbg !33
  %add = add nsw i32 %rem, %mul, !dbg !34
  store i32 %add, i32* %retval, align 4, !dbg !35
  br label %return, !dbg !35

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !36
  ret i32 %6, !dbg !36
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !40
  call void @srand(i32 noundef %call), !dbg !41
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !42, metadata !DIExpression()), !dbg !43
  %call1 = call i32 @rand(), !dbg !44
  %rem = srem i32 %call1, 999, !dbg !45
  store i32 %rem, i32* %randomNumber, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %i, metadata !46, metadata !DIExpression()), !dbg !47
  %0 = load i32, i32* %randomNumber, align 4, !dbg !48
  %call2 = call i32 @baseConversion(i32 noundef %0, i32 noundef 8), !dbg !49
  store i32 %call2, i32* %i, align 4, !dbg !47
  %1 = load i32, i32* %i, align 4, !dbg !50
  %cmp = icmp sge i32 %1, 0, !dbg !51
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !52

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %i, align 4, !dbg !53
  %cmp3 = icmp sle i32 %2, 1746, !dbg !54
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %cmp3, %land.rhs ], !dbg !55
  call void @svf_assert(i1 noundef zeroext %3), !dbg !56
  %4 = load i32, i32* %retval, align 4, !dbg !57
  ret i32 %4, !dbg !57
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_45.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "baseConversion", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_45.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!16 = !DILocation(line: 8, column: 24, scope: !9)
!17 = !DILocalVariable(name: "base", arg: 2, scope: !9, file: !10, line: 8, type: !13)
!18 = !DILocation(line: 8, column: 31, scope: !9)
!19 = !DILocation(line: 9, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!21 = !DILocation(line: 9, column: 10, scope: !20)
!22 = !DILocation(line: 9, column: 8, scope: !9)
!23 = !DILocation(line: 10, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !10, line: 9, column: 16)
!25 = !DILocation(line: 12, column: 12, scope: !9)
!26 = !DILocation(line: 12, column: 16, scope: !9)
!27 = !DILocation(line: 12, column: 14, scope: !9)
!28 = !DILocation(line: 12, column: 43, scope: !9)
!29 = !DILocation(line: 12, column: 47, scope: !9)
!30 = !DILocation(line: 12, column: 45, scope: !9)
!31 = !DILocation(line: 12, column: 53, scope: !9)
!32 = !DILocation(line: 12, column: 28, scope: !9)
!33 = !DILocation(line: 12, column: 26, scope: !9)
!34 = !DILocation(line: 12, column: 21, scope: !9)
!35 = !DILocation(line: 12, column: 5, scope: !9)
!36 = !DILocation(line: 13, column: 1, scope: !9)
!37 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !38, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!38 = !DISubroutineType(types: !39)
!39 = !{!13}
!40 = !DILocation(line: 16, column: 11, scope: !37)
!41 = !DILocation(line: 16, column: 5, scope: !37)
!42 = !DILocalVariable(name: "randomNumber", scope: !37, file: !10, line: 17, type: !13)
!43 = !DILocation(line: 17, column: 9, scope: !37)
!44 = !DILocation(line: 17, column: 24, scope: !37)
!45 = !DILocation(line: 17, column: 31, scope: !37)
!46 = !DILocalVariable(name: "i", scope: !37, file: !10, line: 19, type: !13)
!47 = !DILocation(line: 19, column: 9, scope: !37)
!48 = !DILocation(line: 19, column: 28, scope: !37)
!49 = !DILocation(line: 19, column: 13, scope: !37)
!50 = !DILocation(line: 20, column: 16, scope: !37)
!51 = !DILocation(line: 20, column: 18, scope: !37)
!52 = !DILocation(line: 20, column: 23, scope: !37)
!53 = !DILocation(line: 20, column: 26, scope: !37)
!54 = !DILocation(line: 20, column: 28, scope: !37)
!55 = !DILocation(line: 0, scope: !37)
!56 = !DILocation(line: 20, column: 5, scope: !37)
!57 = !DILocation(line: 21, column: 1, scope: !37)
