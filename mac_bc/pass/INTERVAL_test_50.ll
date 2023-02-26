; ModuleID = 'mac_bc/pass/INTERVAL_test_50.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_50.c"
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
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !20
  store i32 1, i32* %i, align 4, !dbg !20
  br label %while.body, !dbg !21

while.body:                                       ; preds = %if.end3, %entry
  %0 = load i32, i32* %i, align 4, !dbg !22
  %rem = srem i32 %0, 2, !dbg !25
  %cmp = icmp eq i32 %rem, 0, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %while.body
  %1 = load i32, i32* %output, align 4, !dbg !28
  %inc = add nsw i32 %1, 1, !dbg !28
  store i32 %inc, i32* %output, align 4, !dbg !28
  br label %if.end, !dbg !30

if.end:                                           ; preds = %if.then, %while.body
  %2 = load i32, i32* %i, align 4, !dbg !31
  %3 = load i32, i32* %a.addr, align 4, !dbg !33
  %cmp1 = icmp eq i32 %2, %3, !dbg !34
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !35

if.then2:                                         ; preds = %if.end
  br label %while.end, !dbg !36

if.end3:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !38
  %inc4 = add nsw i32 %4, 1, !dbg !38
  store i32 %inc4, i32* %i, align 4, !dbg !38
  br label %while.body, !dbg !21, !llvm.loop !39

while.end:                                        ; preds = %if.then2
  %5 = load i32, i32* %output, align 4, !dbg !41
  ret i32 %5, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %output = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata i32* %output, metadata !48, metadata !DIExpression()), !dbg !49
  store i32 0, i32* %output, align 4, !dbg !49
  %0 = load i32, i32* %a, align 4, !dbg !50
  %cmp = icmp sgt i32 %0, 0, !dbg !52
  br i1 %cmp, label %if.then, label %if.else, !dbg !53

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !54
  %call = call i32 @loop(i32 noundef %1), !dbg !56
  store i32 %call, i32* %output, align 4, !dbg !57
  %2 = load i32, i32* %output, align 4, !dbg !58
  %3 = load i32, i32* %a, align 4, !dbg !59
  %div = sdiv i32 %3, 2, !dbg !60
  %cmp1 = icmp eq i32 %2, %div, !dbg !61
  call void @svf_assert(i1 noundef zeroext %cmp1), !dbg !62
  br label %if.end, !dbg !63

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %output, align 4, !dbg !64
  %cmp2 = icmp eq i32 %4, 0, !dbg !66
  call void @svf_assert(i1 noundef zeroext %cmp2), !dbg !67
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %retval, align 4, !dbg !68
  ret i32 %5, !dbg !68
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/INTERVAL_test_50.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "loop", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_50.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 5, type: !13)
!16 = !DILocation(line: 5, column: 14, scope: !9)
!17 = !DILocalVariable(name: "output", scope: !9, file: !10, line: 6, type: !13)
!18 = !DILocation(line: 6, column: 9, scope: !9)
!19 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 7, type: !13)
!20 = !DILocation(line: 7, column: 9, scope: !9)
!21 = !DILocation(line: 8, column: 5, scope: !9)
!22 = !DILocation(line: 9, column: 12, scope: !23)
!23 = distinct !DILexicalBlock(scope: !24, file: !10, line: 9, column: 12)
!24 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 17)
!25 = !DILocation(line: 9, column: 14, scope: !23)
!26 = !DILocation(line: 9, column: 18, scope: !23)
!27 = !DILocation(line: 9, column: 12, scope: !24)
!28 = !DILocation(line: 10, column: 19, scope: !29)
!29 = distinct !DILexicalBlock(scope: !23, file: !10, line: 9, column: 24)
!30 = !DILocation(line: 11, column: 9, scope: !29)
!31 = !DILocation(line: 12, column: 12, scope: !32)
!32 = distinct !DILexicalBlock(scope: !24, file: !10, line: 12, column: 12)
!33 = !DILocation(line: 12, column: 17, scope: !32)
!34 = !DILocation(line: 12, column: 14, scope: !32)
!35 = !DILocation(line: 12, column: 12, scope: !24)
!36 = !DILocation(line: 13, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !10, line: 12, column: 20)
!38 = !DILocation(line: 15, column: 10, scope: !24)
!39 = distinct !{!39, !21, !40}
!40 = !DILocation(line: 16, column: 5, scope: !9)
!41 = !DILocation(line: 17, column: 12, scope: !9)
!42 = !DILocation(line: 17, column: 5, scope: !9)
!43 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 20, type: !44, scopeLine: 20, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!44 = !DISubroutineType(types: !45)
!45 = !{!13}
!46 = !DILocalVariable(name: "a", scope: !43, file: !10, line: 21, type: !13)
!47 = !DILocation(line: 21, column: 9, scope: !43)
!48 = !DILocalVariable(name: "output", scope: !43, file: !10, line: 22, type: !13)
!49 = !DILocation(line: 22, column: 9, scope: !43)
!50 = !DILocation(line: 23, column: 8, scope: !51)
!51 = distinct !DILexicalBlock(scope: !43, file: !10, line: 23, column: 8)
!52 = !DILocation(line: 23, column: 10, scope: !51)
!53 = !DILocation(line: 23, column: 8, scope: !43)
!54 = !DILocation(line: 24, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !10, line: 23, column: 15)
!56 = !DILocation(line: 24, column: 18, scope: !55)
!57 = !DILocation(line: 24, column: 16, scope: !55)
!58 = !DILocation(line: 25, column: 20, scope: !55)
!59 = !DILocation(line: 25, column: 30, scope: !55)
!60 = !DILocation(line: 25, column: 31, scope: !55)
!61 = !DILocation(line: 25, column: 27, scope: !55)
!62 = !DILocation(line: 25, column: 9, scope: !55)
!63 = !DILocation(line: 26, column: 5, scope: !55)
!64 = !DILocation(line: 28, column: 20, scope: !65)
!65 = distinct !DILexicalBlock(scope: !51, file: !10, line: 27, column: 10)
!66 = !DILocation(line: 28, column: 27, scope: !65)
!67 = !DILocation(line: 28, column: 9, scope: !65)
!68 = !DILocation(line: 30, column: 1, scope: !43)
