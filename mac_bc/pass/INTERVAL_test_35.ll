; ModuleID = 'mac_bc/pass/INTERVAL_test_35.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_35.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@counter = global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i64 @factorial(i32 noundef %i) #0 !dbg !14 {
entry:
  %retval = alloca i64, align 8
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* @counter, align 4, !dbg !21
  %inc = add nsw i32 %0, 1, !dbg !21
  store i32 %inc, i32* @counter, align 4, !dbg !21
  %1 = load i32, i32* %i.addr, align 4, !dbg !22
  %cmp = icmp sle i32 %1, 1, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  store i64 1, i64* %retval, align 8, !dbg !26
  br label %return, !dbg !26

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %i.addr, align 4, !dbg !28
  %conv = sext i32 %2 to i64, !dbg !28
  %3 = load i32, i32* %i.addr, align 4, !dbg !29
  %sub = sub nsw i32 %3, 1, !dbg !30
  %call = call i64 @factorial(i32 noundef %sub), !dbg !31
  %mul = mul nsw i64 %conv, %call, !dbg !32
  store i64 %mul, i64* %retval, align 8, !dbg !33
  br label %return, !dbg !33

return:                                           ; preds = %if.end, %if.then
  %4 = load i64, i64* %retval, align 8, !dbg !34
  ret i64 %4, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !35 {
entry:
  %i = alloca i32, align 4
  %f = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !38, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i64* %f, metadata !40, metadata !DIExpression()), !dbg !41
  %0 = load i32, i32* %i, align 4, !dbg !42
  %call = call i64 @factorial(i32 noundef %0), !dbg !43
  store i64 %call, i64* %f, align 8, !dbg !41
  %1 = load i32, i32* @counter, align 4, !dbg !44
  %2 = load i32, i32* %i, align 4, !dbg !45
  %cmp = icmp eq i32 %1, %2, !dbg !46
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !47
  ret i32 0, !dbg !48
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_35.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/pass/INTERVAL_test_35.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "factorial", scope: !5, file: !5, line: 9, type: !15, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !18)
!15 = !DISubroutineType(types: !16)
!16 = !{!17, !6}
!17 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!18 = !{}
!19 = !DILocalVariable(name: "i", arg: 1, scope: !14, file: !5, line: 9, type: !6)
!20 = !DILocation(line: 9, column: 20, scope: !14)
!21 = !DILocation(line: 10, column: 12, scope: !14)
!22 = !DILocation(line: 11, column: 8, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !5, line: 11, column: 8)
!24 = !DILocation(line: 11, column: 10, scope: !23)
!25 = !DILocation(line: 11, column: 8, scope: !14)
!26 = !DILocation(line: 12, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !5, line: 11, column: 16)
!28 = !DILocation(line: 14, column: 12, scope: !14)
!29 = !DILocation(line: 14, column: 26, scope: !14)
!30 = !DILocation(line: 14, column: 28, scope: !14)
!31 = !DILocation(line: 14, column: 16, scope: !14)
!32 = !DILocation(line: 14, column: 14, scope: !14)
!33 = !DILocation(line: 14, column: 5, scope: !14)
!34 = !DILocation(line: 15, column: 1, scope: !14)
!35 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 17, type: !36, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !18)
!36 = !DISubroutineType(types: !37)
!37 = !{!6}
!38 = !DILocalVariable(name: "i", scope: !35, file: !5, line: 18, type: !6)
!39 = !DILocation(line: 18, column: 9, scope: !35)
!40 = !DILocalVariable(name: "f", scope: !35, file: !5, line: 19, type: !17)
!41 = !DILocation(line: 19, column: 10, scope: !35)
!42 = !DILocation(line: 19, column: 24, scope: !35)
!43 = !DILocation(line: 19, column: 14, scope: !35)
!44 = !DILocation(line: 20, column: 16, scope: !35)
!45 = !DILocation(line: 20, column: 27, scope: !35)
!46 = !DILocation(line: 20, column: 24, scope: !35)
!47 = !DILocation(line: 20, column: 5, scope: !35)
!48 = !DILocation(line: 21, column: 1, scope: !35)
