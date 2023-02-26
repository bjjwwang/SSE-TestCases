; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_ArrayIndex_Overflow01-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_ArrayIndex_Overflow01-1.c"
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
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !30, metadata !DIExpression()), !dbg !34
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !35
  call void @srand(i32 %call) #5, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %a, metadata !37, metadata !DIExpression()), !dbg !38
  %call1 = call i32 @rand() #5, !dbg !39
  %rem = srem i32 %call1, 11, !dbg !40
  %sub = sub nsw i32 %rem, 5, !dbg !41
  store i32 %sub, i32* %a, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i32* %result, metadata !42, metadata !DIExpression()), !dbg !43
  %0 = load i32, i32* %a, align 4, !dbg !44
  %cmp = icmp sgt i32 %0, 0, !dbg !46
  br i1 %cmp, label %if.then, label %if.else, !dbg !47

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4, !dbg !48
  %call2 = call i32 @recursive(i32 %1), !dbg !50
  store i32 %call2, i32* %result, align 4, !dbg !51
  br label %if.end, !dbg !52

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !53
  %call3 = call i32 @abs(i32 %2) #6, !dbg !55
  %call4 = call i32 @recursive(i32 %call3), !dbg !56
  store i32 %call4, i32* %result, align 4, !dbg !57
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %result, align 4, !dbg !58
  %idxprom = sext i32 %3 to i64, !dbg !59
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !59
  store i32 1, i32* %arrayidx, align 4, !dbg !60
  %4 = load i32, i32* %a, align 4, !dbg !61
  %idxprom5 = sext i32 %4 to i64, !dbg !62
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !62
  store i32 1, i32* %arrayidx6, align 4, !dbg !63
  %5 = load i32, i32* %retval, align 4, !dbg !64
  ret i32 %5, !dbg !64
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nounwind readnone willreturn
declare dso_local i32 @abs(i32) #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_ArrayIndex_Overflow01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "recursive", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_ArrayIndex_Overflow01-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 19, scope: !9)
!16 = !DILocation(line: 8, column: 3, scope: !9)
!17 = !DILocation(line: 9, column: 5, scope: !18)
!18 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 5)
!19 = !DILocation(line: 9, column: 5, scope: !9)
!20 = !DILocation(line: 10, column: 17, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !10, line: 9, column: 8)
!22 = !DILocation(line: 10, column: 7, scope: !21)
!23 = !DILocation(line: 10, column: 5, scope: !21)
!24 = !DILocation(line: 11, column: 2, scope: !21)
!25 = !DILocation(line: 12, column: 9, scope: !9)
!26 = !DILocation(line: 12, column: 2, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !28, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!13}
!30 = !DILocalVariable(name: "buffer", scope: !27, file: !10, line: 16, type: !31)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 5)
!34 = !DILocation(line: 16, column: 6, scope: !27)
!35 = !DILocation(line: 17, column: 8, scope: !27)
!36 = !DILocation(line: 17, column: 2, scope: !27)
!37 = !DILocalVariable(name: "a", scope: !27, file: !10, line: 18, type: !13)
!38 = !DILocation(line: 18, column: 9, scope: !27)
!39 = !DILocation(line: 18, column: 14, scope: !27)
!40 = !DILocation(line: 18, column: 21, scope: !27)
!41 = !DILocation(line: 18, column: 27, scope: !27)
!42 = !DILocalVariable(name: "result", scope: !27, file: !10, line: 20, type: !13)
!43 = !DILocation(line: 20, column: 6, scope: !27)
!44 = !DILocation(line: 21, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !27, file: !10, line: 21, column: 5)
!46 = !DILocation(line: 21, column: 7, scope: !45)
!47 = !DILocation(line: 21, column: 5, scope: !27)
!48 = !DILocation(line: 22, column: 22, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !10, line: 21, column: 12)
!50 = !DILocation(line: 22, column: 12, scope: !49)
!51 = !DILocation(line: 22, column: 10, scope: !49)
!52 = !DILocation(line: 23, column: 2, scope: !49)
!53 = !DILocation(line: 25, column: 26, scope: !54)
!54 = distinct !DILexicalBlock(scope: !45, file: !10, line: 24, column: 7)
!55 = !DILocation(line: 25, column: 22, scope: !54)
!56 = !DILocation(line: 25, column: 12, scope: !54)
!57 = !DILocation(line: 25, column: 10, scope: !54)
!58 = !DILocation(line: 28, column: 9, scope: !27)
!59 = !DILocation(line: 28, column: 2, scope: !27)
!60 = !DILocation(line: 28, column: 17, scope: !27)
!61 = !DILocation(line: 29, column: 9, scope: !27)
!62 = !DILocation(line: 29, column: 2, scope: !27)
!63 = !DILocation(line: 29, column: 12, scope: !27)
!64 = !DILocation(line: 30, column: 1, scope: !27)
