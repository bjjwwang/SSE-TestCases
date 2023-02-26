; ModuleID = 'linux_bc/pass/INTERVAL_test_17.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @loop(i32 %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  %result = alloca i32, align 4
  %output = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %result, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %result, align 4, !dbg !17
  call void @llvm.dbg.declare(metadata i32* %output, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 0, i32* %output, align 4, !dbg !19
  call void @llvm.dbg.declare(metadata i32* %i, metadata !20, metadata !DIExpression()), !dbg !22
  store i32 1, i32* %i, align 4, !dbg !22
  br label %for.cond, !dbg !23

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !24
  %1 = load i32, i32* %a.addr, align 4, !dbg !26
  %cmp = icmp sle i32 %0, %1, !dbg !27
  br i1 %cmp, label %for.body, label %for.end, !dbg !28

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4, !dbg !29
  %rem = srem i32 %2, 2, !dbg !32
  %cmp1 = icmp eq i32 %rem, 0, !dbg !33
  br i1 %cmp1, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %for.body
  %3 = load i32, i32* %output, align 4, !dbg !35
  %inc = add nsw i32 %3, 1, !dbg !35
  store i32 %inc, i32* %output, align 4, !dbg !35
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !38

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !39
  %inc2 = add nsw i32 %4, 1, !dbg !39
  store i32 %inc2, i32* %i, align 4, !dbg !39
  br label %for.cond, !dbg !40, !llvm.loop !41

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %output, align 4, !dbg !44
  ret i32 %5, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %output = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !49, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.declare(metadata i32* %b, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* %a, align 4, !dbg !53
  store i32 %0, i32* %b, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata i32* %output, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 0, i32* %output, align 4, !dbg !55
  %1 = load i32, i32* %a, align 4, !dbg !56
  %cmp = icmp sgt i32 %1, 0, !dbg !58
  br i1 %cmp, label %if.then, label %if.else, !dbg !59

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !60
  %call = call i32 @loop(i32 %2), !dbg !62
  store i32 %call, i32* %output, align 4, !dbg !63
  %3 = load i32, i32* %output, align 4, !dbg !64
  %4 = load i32, i32* %b, align 4, !dbg !65
  %div = sdiv i32 %4, 2, !dbg !66
  %cmp1 = icmp eq i32 %3, %div, !dbg !67
  call void @svf_assert(i1 zeroext %cmp1), !dbg !68
  br label %if.end, !dbg !69

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %output, align 4, !dbg !70
  %cmp2 = icmp eq i32 %5, 0, !dbg !72
  call void @svf_assert(i1 zeroext %cmp2), !dbg !73
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !74
  ret i32 %6, !dbg !74
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_17.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "loop", scope: !10, file: !10, line: 5, type: !11, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_17.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 5, type: !13)
!15 = !DILocation(line: 5, column: 14, scope: !9)
!16 = !DILocalVariable(name: "result", scope: !9, file: !10, line: 6, type: !13)
!17 = !DILocation(line: 6, column: 9, scope: !9)
!18 = !DILocalVariable(name: "output", scope: !9, file: !10, line: 7, type: !13)
!19 = !DILocation(line: 7, column: 9, scope: !9)
!20 = !DILocalVariable(name: "i", scope: !21, file: !10, line: 8, type: !13)
!21 = distinct !DILexicalBlock(scope: !9, file: !10, line: 8, column: 5)
!22 = !DILocation(line: 8, column: 13, scope: !21)
!23 = !DILocation(line: 8, column: 9, scope: !21)
!24 = !DILocation(line: 8, column: 20, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !10, line: 8, column: 5)
!26 = !DILocation(line: 8, column: 25, scope: !25)
!27 = !DILocation(line: 8, column: 22, scope: !25)
!28 = !DILocation(line: 8, column: 5, scope: !21)
!29 = !DILocation(line: 9, column: 12, scope: !30)
!30 = distinct !DILexicalBlock(scope: !31, file: !10, line: 9, column: 12)
!31 = distinct !DILexicalBlock(scope: !25, file: !10, line: 8, column: 33)
!32 = !DILocation(line: 9, column: 14, scope: !30)
!33 = !DILocation(line: 9, column: 18, scope: !30)
!34 = !DILocation(line: 9, column: 12, scope: !31)
!35 = !DILocation(line: 10, column: 19, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !10, line: 9, column: 24)
!37 = !DILocation(line: 11, column: 9, scope: !36)
!38 = !DILocation(line: 12, column: 5, scope: !31)
!39 = !DILocation(line: 8, column: 29, scope: !25)
!40 = !DILocation(line: 8, column: 5, scope: !25)
!41 = distinct !{!41, !28, !42, !43}
!42 = !DILocation(line: 12, column: 5, scope: !21)
!43 = !{!"llvm.loop.mustprogress"}
!44 = !DILocation(line: 13, column: 12, scope: !9)
!45 = !DILocation(line: 13, column: 5, scope: !9)
!46 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 16, type: !47, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!47 = !DISubroutineType(types: !48)
!48 = !{!13}
!49 = !DILocalVariable(name: "a", scope: !46, file: !10, line: 17, type: !13)
!50 = !DILocation(line: 17, column: 9, scope: !46)
!51 = !DILocalVariable(name: "b", scope: !46, file: !10, line: 18, type: !13)
!52 = !DILocation(line: 18, column: 9, scope: !46)
!53 = !DILocation(line: 18, column: 13, scope: !46)
!54 = !DILocalVariable(name: "output", scope: !46, file: !10, line: 19, type: !13)
!55 = !DILocation(line: 19, column: 9, scope: !46)
!56 = !DILocation(line: 20, column: 8, scope: !57)
!57 = distinct !DILexicalBlock(scope: !46, file: !10, line: 20, column: 8)
!58 = !DILocation(line: 20, column: 10, scope: !57)
!59 = !DILocation(line: 20, column: 8, scope: !46)
!60 = !DILocation(line: 21, column: 23, scope: !61)
!61 = distinct !DILexicalBlock(scope: !57, file: !10, line: 20, column: 15)
!62 = !DILocation(line: 21, column: 18, scope: !61)
!63 = !DILocation(line: 21, column: 16, scope: !61)
!64 = !DILocation(line: 22, column: 20, scope: !61)
!65 = !DILocation(line: 22, column: 30, scope: !61)
!66 = !DILocation(line: 22, column: 31, scope: !61)
!67 = !DILocation(line: 22, column: 27, scope: !61)
!68 = !DILocation(line: 22, column: 9, scope: !61)
!69 = !DILocation(line: 23, column: 5, scope: !61)
!70 = !DILocation(line: 25, column: 20, scope: !71)
!71 = distinct !DILexicalBlock(scope: !57, file: !10, line: 24, column: 10)
!72 = !DILocation(line: 25, column: 27, scope: !71)
!73 = !DILocation(line: 25, column: 9, scope: !71)
!74 = !DILocation(line: 27, column: 1, scope: !46)
