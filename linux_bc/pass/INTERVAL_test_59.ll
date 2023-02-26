; ModuleID = 'linux_bc/pass/INTERVAL_test_59.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_59.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @recursive(i32 %a) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !14, metadata !DIExpression()), !dbg !15
  %0 = load i32, i32* %a.addr, align 4, !dbg !16
  %dec = add nsw i32 %0, -1, !dbg !16
  store i32 %dec, i32* %a.addr, align 4, !dbg !16
  %1 = load i32, i32* %a.addr, align 4, !dbg !17
  %tobool = icmp ne i32 %1, 0, !dbg !17
  br i1 %tobool, label %if.then, label %if.end, !dbg !19

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4, !dbg !20
  %call = call i32 @recursive(i32 %2), !dbg !22
  store i32 %call, i32* %a.addr, align 4, !dbg !23
  br label %if.end, !dbg !24

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %a.addr, align 4, !dbg !25
  ret i32 %3, !dbg !26
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %a, metadata !30, metadata !DIExpression()), !dbg !31
  %0 = load i32, i32* %a, align 4, !dbg !32
  %cmp = icmp sgt i32 %0, 0, !dbg !34
  br i1 %cmp, label %if.then, label %if.else, !dbg !35

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !36
  %call = call i32 @recursive(i32 %1), !dbg !38
  store i32 %call, i32* %a, align 4, !dbg !39
  br label %if.end, !dbg !40

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !41
  %call1 = call i32 @abs(i32 %2) #4, !dbg !43
  %call2 = call i32 @recursive(i32 %call1), !dbg !44
  store i32 %call2, i32* %a, align 4, !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %a, align 4, !dbg !46
  %cmp3 = icmp eq i32 %3, 0, !dbg !47
  call void @svf_assert(i1 zeroext %cmp3), !dbg !48
  %4 = load i32, i32* %retval, align 4, !dbg !49
  ret i32 %4, !dbg !49
}

; Function Attrs: nounwind readnone willreturn
declare dso_local i32 @abs(i32) #2

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_59.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "recursive", scope: !10, file: !10, line: 8, type: !11, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/INTERVAL_test_59.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 8, type: !13)
!15 = !DILocation(line: 8, column: 19, scope: !9)
!16 = !DILocation(line: 9, column: 3, scope: !9)
!17 = !DILocation(line: 10, column: 5, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 10, column: 5)
!19 = !DILocation(line: 10, column: 5, scope: !9)
!20 = !DILocation(line: 11, column: 17, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !10, line: 10, column: 8)
!22 = !DILocation(line: 11, column: 7, scope: !21)
!23 = !DILocation(line: 11, column: 5, scope: !21)
!24 = !DILocation(line: 12, column: 2, scope: !21)
!25 = !DILocation(line: 13, column: 9, scope: !9)
!26 = !DILocation(line: 13, column: 2, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 16, type: !28, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!13}
!30 = !DILocalVariable(name: "a", scope: !27, file: !10, line: 17, type: !13)
!31 = !DILocation(line: 17, column: 6, scope: !27)
!32 = !DILocation(line: 18, column: 5, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !10, line: 18, column: 5)
!34 = !DILocation(line: 18, column: 7, scope: !33)
!35 = !DILocation(line: 18, column: 5, scope: !27)
!36 = !DILocation(line: 19, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 18, column: 12)
!38 = !DILocation(line: 19, column: 7, scope: !37)
!39 = !DILocation(line: 19, column: 5, scope: !37)
!40 = !DILocation(line: 20, column: 2, scope: !37)
!41 = !DILocation(line: 22, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !33, file: !10, line: 21, column: 7)
!43 = !DILocation(line: 22, column: 17, scope: !42)
!44 = !DILocation(line: 22, column: 7, scope: !42)
!45 = !DILocation(line: 22, column: 5, scope: !42)
!46 = !DILocation(line: 24, column: 13, scope: !27)
!47 = !DILocation(line: 24, column: 15, scope: !27)
!48 = !DILocation(line: 24, column: 2, scope: !27)
!49 = !DILocation(line: 25, column: 1, scope: !27)
