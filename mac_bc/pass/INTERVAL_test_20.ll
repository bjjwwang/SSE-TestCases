; ModuleID = 'mac_bc/pass/INTERVAL_test_20.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_20.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !12 {
entry:
  %retval = alloca i32, align 4
  %r = alloca i32, align 4
  %a = alloca i8, align 1
  %a_as_int = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !17
  call void @srand(i32 noundef %call), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %r, metadata !19, metadata !DIExpression()), !dbg !20
  %call1 = call i32 @rand(), !dbg !21
  %rem = srem i32 %call1, 128, !dbg !22
  store i32 %rem, i32* %r, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i8* %a, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i32, i32* %r, align 4, !dbg !25
  %conv = trunc i32 %0 to i8, !dbg !26
  store i8 %conv, i8* %a, align 1, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %a_as_int, metadata !27, metadata !DIExpression()), !dbg !28
  %1 = load i8, i8* %a, align 1, !dbg !29
  %conv2 = sext i8 %1 to i32, !dbg !30
  store i32 %conv2, i32* %a_as_int, align 4, !dbg !28
  %2 = load i8, i8* %a, align 1, !dbg !31
  %conv3 = sext i8 %2 to i32, !dbg !31
  %cmp = icmp sge i32 %conv3, 97, !dbg !33
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !34

land.lhs.true:                                    ; preds = %entry
  %3 = load i8, i8* %a, align 1, !dbg !35
  %conv5 = sext i8 %3 to i32, !dbg !35
  %cmp6 = icmp sle i32 %conv5, 122, !dbg !36
  br i1 %cmp6, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %land.lhs.true
  %4 = load i32, i32* %a_as_int, align 4, !dbg !38
  %cmp8 = icmp sge i32 %4, 97, !dbg !40
  br i1 %cmp8, label %land.rhs, label %land.end, !dbg !41

land.rhs:                                         ; preds = %if.then
  %5 = load i32, i32* %a_as_int, align 4, !dbg !42
  %cmp10 = icmp sle i32 %5, 122, !dbg !43
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %6 = phi i1 [ false, %if.then ], [ %cmp10, %land.rhs ], !dbg !44
  call void @svf_assert(i1 noundef zeroext %6), !dbg !45
  br label %if.end, !dbg !46

if.end:                                           ; preds = %land.end, %land.lhs.true, %entry
  %7 = load i32, i32* %retval, align 4, !dbg !47
  ret i32 %7, !dbg !47
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
!llvm.module.flags = !{!5, !6, !7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_20.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !4}
!3 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"PIC Level", i32 2}
!9 = !{i32 7, !"uwtable", i32 1}
!10 = !{i32 7, !"frame-pointer", i32 2}
!11 = !{!"Homebrew clang version 14.0.6"}
!12 = distinct !DISubprogram(name: "main", scope: !13, file: !13, line: 7, type: !14, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!13 = !DIFile(filename: "src/pass/INTERVAL_test_20.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!14 = !DISubroutineType(types: !15)
!15 = !{!4}
!16 = !{}
!17 = !DILocation(line: 8, column: 11, scope: !12)
!18 = !DILocation(line: 8, column: 5, scope: !12)
!19 = !DILocalVariable(name: "r", scope: !12, file: !13, line: 9, type: !4)
!20 = !DILocation(line: 9, column: 6, scope: !12)
!21 = !DILocation(line: 9, column: 10, scope: !12)
!22 = !DILocation(line: 9, column: 17, scope: !12)
!23 = !DILocalVariable(name: "a", scope: !12, file: !13, line: 10, type: !3)
!24 = !DILocation(line: 10, column: 10, scope: !12)
!25 = !DILocation(line: 10, column: 20, scope: !12)
!26 = !DILocation(line: 10, column: 14, scope: !12)
!27 = !DILocalVariable(name: "a_as_int", scope: !12, file: !13, line: 11, type: !4)
!28 = !DILocation(line: 11, column: 9, scope: !12)
!29 = !DILocation(line: 11, column: 25, scope: !12)
!30 = !DILocation(line: 11, column: 20, scope: !12)
!31 = !DILocation(line: 12, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !12, file: !13, line: 12, column: 9)
!33 = !DILocation(line: 12, column: 11, scope: !32)
!34 = !DILocation(line: 12, column: 18, scope: !32)
!35 = !DILocation(line: 12, column: 21, scope: !32)
!36 = !DILocation(line: 12, column: 23, scope: !32)
!37 = !DILocation(line: 12, column: 9, scope: !12)
!38 = !DILocation(line: 13, column: 20, scope: !39)
!39 = distinct !DILexicalBlock(scope: !32, file: !13, line: 12, column: 31)
!40 = !DILocation(line: 13, column: 29, scope: !39)
!41 = !DILocation(line: 13, column: 35, scope: !39)
!42 = !DILocation(line: 13, column: 38, scope: !39)
!43 = !DILocation(line: 13, column: 47, scope: !39)
!44 = !DILocation(line: 0, scope: !39)
!45 = !DILocation(line: 13, column: 9, scope: !39)
!46 = !DILocation(line: 14, column: 5, scope: !39)
!47 = !DILocation(line: 15, column: 1, scope: !12)
