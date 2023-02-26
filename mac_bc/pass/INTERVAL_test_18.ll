; ModuleID = 'mac_bc/pass/INTERVAL_test_18.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_18.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @loop(i32 noundef %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  %result = alloca i32, align 4
  %output = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata i32* %result, metadata !17, metadata !DIExpression()), !dbg !18
  store i32 0, i32* %result, align 4, !dbg !18
  call void @llvm.dbg.declare(metadata i32* %output, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 0, i32* %output, align 4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %i, metadata !21, metadata !DIExpression()), !dbg !23
  store i32 1, i32* %i, align 4, !dbg !23
  br label %for.cond, !dbg !24

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !25
  %1 = load i32, i32* %a.addr, align 4, !dbg !27
  %cmp = icmp sle i32 %0, %1, !dbg !28
  br i1 %cmp, label %for.body, label %for.end, !dbg !29

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !30
  %rem = srem i32 %2, 2, !dbg !33
  %cmp1 = icmp ne i32 %rem, 0, !dbg !34
  br i1 %cmp1, label %if.then, label %if.end, !dbg !35

if.then:                                          ; preds = %for.body
  br label %for.inc, !dbg !36

if.end:                                           ; preds = %for.body
  %3 = load i32, i32* %output, align 4, !dbg !38
  %inc = add nsw i32 %3, 1, !dbg !38
  store i32 %inc, i32* %output, align 4, !dbg !38
  br label %for.inc, !dbg !39

for.inc:                                          ; preds = %if.end, %if.then
  %4 = load i32, i32* %i, align 4, !dbg !40
  %inc2 = add nsw i32 %4, 1, !dbg !40
  store i32 %inc2, i32* %i, align 4, !dbg !40
  br label %for.cond, !dbg !41, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %output, align 4, !dbg !45
  ret i32 %5, !dbg !46
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !47 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %output = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata i32* %b, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load i32, i32* %a, align 4, !dbg !54
  store i32 %0, i32* %b, align 4, !dbg !53
  call void @llvm.dbg.declare(metadata i32* %output, metadata !55, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %output, align 4, !dbg !56
  %1 = load i32, i32* %a, align 4, !dbg !57
  %cmp = icmp sgt i32 %1, 0, !dbg !59
  br i1 %cmp, label %if.then, label %if.else, !dbg !60

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !61
  %call = call i32 @loop(i32 noundef %2), !dbg !63
  store i32 %call, i32* %output, align 4, !dbg !64
  %3 = load i32, i32* %output, align 4, !dbg !65
  %4 = load i32, i32* %b, align 4, !dbg !66
  %div = sdiv i32 %4, 2, !dbg !67
  %cmp1 = icmp eq i32 %3, %div, !dbg !68
  call void @svf_assert(i1 noundef zeroext %cmp1), !dbg !69
  br label %if.end, !dbg !70

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %output, align 4, !dbg !71
  %cmp2 = icmp eq i32 %5, 0, !dbg !73
  call void @svf_assert(i1 noundef zeroext %cmp2), !dbg !74
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !75
  ret i32 %6, !dbg !75
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_18.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "loop", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_18.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 5, type: !13)
!16 = !DILocation(line: 5, column: 14, scope: !9)
!17 = !DILocalVariable(name: "result", scope: !9, file: !10, line: 6, type: !13)
!18 = !DILocation(line: 6, column: 9, scope: !9)
!19 = !DILocalVariable(name: "output", scope: !9, file: !10, line: 7, type: !13)
!20 = !DILocation(line: 7, column: 9, scope: !9)
!21 = !DILocalVariable(name: "i", scope: !22, file: !10, line: 8, type: !13)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 5)
!23 = !DILocation(line: 8, column: 13, scope: !22)
!24 = !DILocation(line: 8, column: 9, scope: !22)
!25 = !DILocation(line: 8, column: 20, scope: !26)
!26 = distinct !DILexicalBlock(scope: !22, file: !10, line: 8, column: 5)
!27 = !DILocation(line: 8, column: 25, scope: !26)
!28 = !DILocation(line: 8, column: 22, scope: !26)
!29 = !DILocation(line: 8, column: 5, scope: !22)
!30 = !DILocation(line: 9, column: 12, scope: !31)
!31 = distinct !DILexicalBlock(scope: !32, file: !10, line: 9, column: 12)
!32 = distinct !DILexicalBlock(scope: !26, file: !10, line: 8, column: 33)
!33 = !DILocation(line: 9, column: 14, scope: !31)
!34 = !DILocation(line: 9, column: 18, scope: !31)
!35 = !DILocation(line: 9, column: 12, scope: !32)
!36 = !DILocation(line: 10, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !31, file: !10, line: 9, column: 24)
!38 = !DILocation(line: 12, column: 15, scope: !32)
!39 = !DILocation(line: 13, column: 5, scope: !32)
!40 = !DILocation(line: 8, column: 29, scope: !26)
!41 = !DILocation(line: 8, column: 5, scope: !26)
!42 = distinct !{!42, !29, !43, !44}
!43 = !DILocation(line: 13, column: 5, scope: !22)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocation(line: 14, column: 12, scope: !9)
!46 = !DILocation(line: 14, column: 5, scope: !9)
!47 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !48, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!48 = !DISubroutineType(types: !49)
!49 = !{!13}
!50 = !DILocalVariable(name: "a", scope: !47, file: !10, line: 18, type: !13)
!51 = !DILocation(line: 18, column: 9, scope: !47)
!52 = !DILocalVariable(name: "b", scope: !47, file: !10, line: 19, type: !13)
!53 = !DILocation(line: 19, column: 9, scope: !47)
!54 = !DILocation(line: 19, column: 13, scope: !47)
!55 = !DILocalVariable(name: "output", scope: !47, file: !10, line: 20, type: !13)
!56 = !DILocation(line: 20, column: 9, scope: !47)
!57 = !DILocation(line: 21, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !47, file: !10, line: 21, column: 8)
!59 = !DILocation(line: 21, column: 10, scope: !58)
!60 = !DILocation(line: 21, column: 8, scope: !47)
!61 = !DILocation(line: 22, column: 23, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !10, line: 21, column: 15)
!63 = !DILocation(line: 22, column: 18, scope: !62)
!64 = !DILocation(line: 22, column: 16, scope: !62)
!65 = !DILocation(line: 23, column: 20, scope: !62)
!66 = !DILocation(line: 23, column: 30, scope: !62)
!67 = !DILocation(line: 23, column: 31, scope: !62)
!68 = !DILocation(line: 23, column: 27, scope: !62)
!69 = !DILocation(line: 23, column: 9, scope: !62)
!70 = !DILocation(line: 24, column: 5, scope: !62)
!71 = !DILocation(line: 26, column: 20, scope: !72)
!72 = distinct !DILexicalBlock(scope: !58, file: !10, line: 25, column: 10)
!73 = !DILocation(line: 26, column: 27, scope: !72)
!74 = !DILocation(line: 26, column: 9, scope: !72)
!75 = !DILocation(line: 28, column: 1, scope: !47)
