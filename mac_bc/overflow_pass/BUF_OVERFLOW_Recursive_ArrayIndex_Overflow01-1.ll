; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_ArrayIndex_Overflow01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_ArrayIndex_Overflow01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @recursive(i32 noundef %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  %0 = load i32, i32* %a.addr, align 4, !dbg !17
  %dec = add nsw i32 %0, -1, !dbg !17
  store i32 %dec, i32* %a.addr, align 4, !dbg !17
  %1 = load i32, i32* %a.addr, align 4, !dbg !18
  %tobool = icmp ne i32 %1, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4, !dbg !21
  %call = call i32 @recursive(i32 noundef %2), !dbg !23
  store i32 %call, i32* %a.addr, align 4, !dbg !24
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %a.addr, align 4, !dbg !26
  ret i32 %3, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !31, metadata !DIExpression()), !dbg !35
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !36
  call void @srand(i32 noundef %call), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %a, metadata !38, metadata !DIExpression()), !dbg !39
  %call1 = call i32 @rand(), !dbg !40
  %rem = srem i32 %call1, 11, !dbg !41
  %sub = sub nsw i32 %rem, 5, !dbg !42
  store i32 %sub, i32* %a, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %result, metadata !43, metadata !DIExpression()), !dbg !44
  %0 = load i32, i32* %a, align 4, !dbg !45
  %cmp = icmp sgt i32 %0, 0, !dbg !47
  br i1 %cmp, label %if.then, label %if.else, !dbg !48

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !49
  %call2 = call i32 @recursive(i32 noundef %1), !dbg !51
  store i32 %call2, i32* %result, align 4, !dbg !52
  br label %if.end, !dbg !53

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !54
  %call3 = call i32 @abs(i32 noundef %2) #4, !dbg !56
  %call4 = call i32 @recursive(i32 noundef %call3), !dbg !57
  store i32 %call4, i32* %result, align 4, !dbg !58
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %result, align 4, !dbg !59
  %idxprom = sext i32 %3 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !60
  store i32 1, i32* %arrayidx, align 4, !dbg !61
  %4 = load i32, i32* %a, align 4, !dbg !62
  %idxprom5 = sext i32 %4 to i64, !dbg !63
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !63
  store i32 1, i32* %arrayidx6, align 4, !dbg !64
  %5 = load i32, i32* %retval, align 4, !dbg !65
  ret i32 %5, !dbg !65
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

; Function Attrs: nounwind readnone willreturn
declare i32 @abs(i32 noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_ArrayIndex_Overflow01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "recursive", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_ArrayIndex_Overflow01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!16 = !DILocation(line: 7, column: 19, scope: !9)
!17 = !DILocation(line: 8, column: 3, scope: !9)
!18 = !DILocation(line: 9, column: 5, scope: !19)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 5)
!20 = !DILocation(line: 9, column: 5, scope: !9)
!21 = !DILocation(line: 10, column: 17, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !10, line: 9, column: 8)
!23 = !DILocation(line: 10, column: 7, scope: !22)
!24 = !DILocation(line: 10, column: 5, scope: !22)
!25 = !DILocation(line: 11, column: 2, scope: !22)
!26 = !DILocation(line: 12, column: 9, scope: !9)
!27 = !DILocation(line: 12, column: 2, scope: !9)
!28 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !29, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!29 = !DISubroutineType(types: !30)
!30 = !{!13}
!31 = !DILocalVariable(name: "buffer", scope: !28, file: !10, line: 16, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 5)
!35 = !DILocation(line: 16, column: 6, scope: !28)
!36 = !DILocation(line: 17, column: 8, scope: !28)
!37 = !DILocation(line: 17, column: 2, scope: !28)
!38 = !DILocalVariable(name: "a", scope: !28, file: !10, line: 18, type: !13)
!39 = !DILocation(line: 18, column: 9, scope: !28)
!40 = !DILocation(line: 18, column: 14, scope: !28)
!41 = !DILocation(line: 18, column: 21, scope: !28)
!42 = !DILocation(line: 18, column: 27, scope: !28)
!43 = !DILocalVariable(name: "result", scope: !28, file: !10, line: 20, type: !13)
!44 = !DILocation(line: 20, column: 6, scope: !28)
!45 = !DILocation(line: 21, column: 5, scope: !46)
!46 = distinct !DILexicalBlock(scope: !28, file: !10, line: 21, column: 5)
!47 = !DILocation(line: 21, column: 7, scope: !46)
!48 = !DILocation(line: 21, column: 5, scope: !28)
!49 = !DILocation(line: 22, column: 22, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !10, line: 21, column: 12)
!51 = !DILocation(line: 22, column: 12, scope: !50)
!52 = !DILocation(line: 22, column: 10, scope: !50)
!53 = !DILocation(line: 23, column: 2, scope: !50)
!54 = !DILocation(line: 25, column: 26, scope: !55)
!55 = distinct !DILexicalBlock(scope: !46, file: !10, line: 24, column: 7)
!56 = !DILocation(line: 25, column: 22, scope: !55)
!57 = !DILocation(line: 25, column: 12, scope: !55)
!58 = !DILocation(line: 25, column: 10, scope: !55)
!59 = !DILocation(line: 28, column: 9, scope: !28)
!60 = !DILocation(line: 28, column: 2, scope: !28)
!61 = !DILocation(line: 28, column: 17, scope: !28)
!62 = !DILocation(line: 29, column: 9, scope: !28)
!63 = !DILocation(line: 29, column: 2, scope: !28)
!64 = !DILocation(line: 29, column: 12, scope: !28)
!65 = !DILocation(line: 30, column: 1, scope: !28)
