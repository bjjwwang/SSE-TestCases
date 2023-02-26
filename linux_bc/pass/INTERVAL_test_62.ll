; ModuleID = 'linux_bc/pass/INTERVAL_test_62.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_62.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  br label %while.body, !dbg !16

while.body:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %a, align 4, !dbg !17
  %tobool = icmp ne i32 %0, 0, !dbg !17
  br i1 %tobool, label %if.then, label %if.else, !dbg !20

if.then:                                          ; preds = %while.body
  %1 = load i32, i32* %a, align 4, !dbg !21
  %cmp = icmp ne i32 %1, 0, !dbg !23
  call void @svf_assert(i1 zeroext %cmp), !dbg !24
  call void @abort() #4, !dbg !25
  unreachable, !dbg !25

if.else:                                          ; preds = %while.body
  %2 = load i32, i32* %a, align 4, !dbg !26
  %cmp1 = icmp sgt i32 %2, 0, !dbg !29
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !30

if.then2:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !31
  %dec = add nsw i32 %3, -1, !dbg !31
  store i32 %dec, i32* %a, align 4, !dbg !31
  br label %if.end, !dbg !33

if.else3:                                         ; preds = %if.else
  %4 = load i32, i32* %a, align 4, !dbg !34
  %inc = add nsw i32 %4, 1, !dbg !34
  store i32 %inc, i32* %a, align 4, !dbg !34
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %while.body, !dbg !36, !llvm.loop !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_62.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 9, type: !11, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_62.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!15 = !DILocation(line: 10, column: 6, scope: !9)
!16 = !DILocation(line: 11, column: 2, scope: !9)
!17 = !DILocation(line: 12, column: 6, scope: !18)
!18 = distinct !DILexicalBlock(scope: !19, file: !10, line: 12, column: 6)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 14)
!20 = !DILocation(line: 12, column: 6, scope: !19)
!21 = !DILocation(line: 13, column: 15, scope: !22)
!22 = distinct !DILexicalBlock(scope: !18, file: !10, line: 12, column: 9)
!23 = !DILocation(line: 13, column: 17, scope: !22)
!24 = !DILocation(line: 13, column: 4, scope: !22)
!25 = !DILocation(line: 14, column: 4, scope: !22)
!26 = !DILocation(line: 17, column: 7, scope: !27)
!27 = distinct !DILexicalBlock(scope: !28, file: !10, line: 17, column: 7)
!28 = distinct !DILexicalBlock(scope: !18, file: !10, line: 16, column: 8)
!29 = !DILocation(line: 17, column: 9, scope: !27)
!30 = !DILocation(line: 17, column: 7, scope: !28)
!31 = !DILocation(line: 18, column: 6, scope: !32)
!32 = distinct !DILexicalBlock(scope: !27, file: !10, line: 17, column: 14)
!33 = !DILocation(line: 19, column: 4, scope: !32)
!34 = !DILocation(line: 21, column: 6, scope: !35)
!35 = distinct !DILexicalBlock(scope: !27, file: !10, line: 20, column: 9)
!36 = !DILocation(line: 23, column: 4, scope: !28)
!37 = distinct !{!37, !16, !38}
!38 = !DILocation(line: 25, column: 2, scope: !9)
