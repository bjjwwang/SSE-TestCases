; ModuleID = 'linux_bc/unpass/RECURSIVE_recursive02.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/unpass/RECURSIVE_recursive02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @funcA(i32 %a) #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %a.addr, align 4, !dbg !16
  %cmp = icmp sle i32 %0, 0, !dbg !18
  br i1 %cmp, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !20
  br label %return, !dbg !20

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4, !dbg !22
  %sub = sub nsw i32 %1, 1, !dbg !23
  %call = call i32 @funcB(i32 %sub), !dbg !24
  %add = add nsw i32 %call, 1, !dbg !25
  store i32 %add, i32* %retval, align 4, !dbg !26
  br label %return, !dbg !26

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !27
  ret i32 %2, !dbg !27
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @funcB(i32 %b) #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !29, metadata !DIExpression()), !dbg !30
  %0 = load i32, i32* %b.addr, align 4, !dbg !31
  %cmp = icmp sle i32 %0, 0, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !35
  br label %return, !dbg !35

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %b.addr, align 4, !dbg !37
  %sub = sub nsw i32 %1, 1, !dbg !38
  %call = call i32 @funcA(i32 %sub), !dbg !39
  %add = add nsw i32 %call, 1, !dbg !40
  store i32 %add, i32* %retval, align 4, !dbg !41
  br label %return, !dbg !41

return:                                           ; preds = %if.end, %if.then
  %2 = load i32, i32* %retval, align 4, !dbg !42
  ret i32 %2, !dbg !42
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !43 {
entry:
  %a = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !46, metadata !DIExpression()), !dbg !47
  %call = call i32 @funcA(i32 3), !dbg !48
  store i32 %call, i32* %a, align 4, !dbg !47
  %0 = load i32, i32* %a, align 4, !dbg !49
  %cmp = icmp eq i32 %0, 3, !dbg !50
  call void @svf_assert(i1 zeroext %cmp), !dbg !51
  ret i32 0, !dbg !52
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/unpass/RECURSIVE_recursive02.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "funcA", scope: !10, file: !10, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/unpass/RECURSIVE_recursive02.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 4, type: !13)
!15 = !DILocation(line: 4, column: 15, scope: !9)
!16 = !DILocation(line: 5, column: 8, scope: !17)
!17 = distinct !DILexicalBlock(scope: !9, file: !10, line: 5, column: 8)
!18 = !DILocation(line: 5, column: 10, scope: !17)
!19 = !DILocation(line: 5, column: 8, scope: !9)
!20 = !DILocation(line: 6, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !17, file: !10, line: 5, column: 16)
!22 = !DILocation(line: 8, column: 17, scope: !9)
!23 = !DILocation(line: 8, column: 19, scope: !9)
!24 = !DILocation(line: 8, column: 11, scope: !9)
!25 = !DILocation(line: 8, column: 23, scope: !9)
!26 = !DILocation(line: 8, column: 4, scope: !9)
!27 = !DILocation(line: 9, column: 1, scope: !9)
!28 = distinct !DISubprogram(name: "funcB", scope: !10, file: !10, line: 10, type: !11, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DILocalVariable(name: "b", arg: 1, scope: !28, file: !10, line: 10, type: !13)
!30 = !DILocation(line: 10, column: 15, scope: !28)
!31 = !DILocation(line: 11, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !10, line: 11, column: 9)
!33 = !DILocation(line: 11, column: 11, scope: !32)
!34 = !DILocation(line: 11, column: 9, scope: !28)
!35 = !DILocation(line: 12, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 11, column: 17)
!37 = !DILocation(line: 14, column: 18, scope: !28)
!38 = !DILocation(line: 14, column: 19, scope: !28)
!39 = !DILocation(line: 14, column: 12, scope: !28)
!40 = !DILocation(line: 14, column: 23, scope: !28)
!41 = !DILocation(line: 14, column: 5, scope: !28)
!42 = !DILocation(line: 15, column: 1, scope: !28)
!43 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !44, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!13}
!46 = !DILocalVariable(name: "a", scope: !43, file: !10, line: 18, type: !13)
!47 = !DILocation(line: 18, column: 9, scope: !43)
!48 = !DILocation(line: 18, column: 14, scope: !43)
!49 = !DILocation(line: 19, column: 16, scope: !43)
!50 = !DILocation(line: 19, column: 18, scope: !43)
!51 = !DILocation(line: 19, column: 5, scope: !43)
!52 = !DILocation(line: 20, column: 1, scope: !43)
