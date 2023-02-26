; ModuleID = 'linux_bc/pass/INTERVAL_test_46.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_46.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = dso_local global i32 0, align 4, !dbg !0
@result = dso_local global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32 %limit) #0 !dbg !16 {
entry:
  %limit.addr = alloca i32, align 4
  store i32 %limit, i32* %limit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %limit.addr, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = load i32, i32* @count, align 4, !dbg !21
  %1 = load i32, i32* %limit.addr, align 4, !dbg !23
  %cmp = icmp slt i32 %0, %1, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @count, align 4, !dbg !26
  %add = add nsw i32 %2, 1, !dbg !28
  store i32 %add, i32* @result, align 4, !dbg !29
  %3 = load i32, i32* @count, align 4, !dbg !30
  %inc = add nsw i32 %3, 1, !dbg !30
  store i32 %inc, i32* @count, align 4, !dbg !30
  %4 = load i32, i32* %limit.addr, align 4, !dbg !31
  call void @bar(i32 %4), !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !34
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @bar(i32 %limit) #0 !dbg !35 {
entry:
  %limit.addr = alloca i32, align 4
  store i32 %limit, i32* %limit.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %limit.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* @count, align 4, !dbg !38
  %1 = load i32, i32* %limit.addr, align 4, !dbg !40
  %cmp = icmp slt i32 %0, %1, !dbg !41
  br i1 %cmp, label %if.then, label %if.end, !dbg !42

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @count, align 4, !dbg !43
  %sub = sub nsw i32 %2, 1, !dbg !45
  store i32 %sub, i32* @result, align 4, !dbg !46
  %3 = load i32, i32* @count, align 4, !dbg !47
  %inc = add nsw i32 %3, 1, !dbg !47
  store i32 %inc, i32* @count, align 4, !dbg !47
  %4 = load i32, i32* %limit.addr, align 4, !dbg !48
  call void @foo(i32 %4), !dbg !49
  br label %if.end, !dbg !50

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !51
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !52 {
entry:
  %retval = alloca i32, align 4
  %limit = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %limit, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* %limit, align 4, !dbg !57
  %cmp = icmp sgt i32 %0, 0, !dbg !59
  br i1 %cmp, label %if.then, label %if.else5, !dbg !60

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %limit, align 4, !dbg !61
  call void @foo(i32 %1), !dbg !63
  %2 = load i32, i32* %limit, align 4, !dbg !64
  %rem = srem i32 %2, 2, !dbg !66
  %cmp1 = icmp eq i32 %rem, 1, !dbg !67
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !68

if.then2:                                         ; preds = %if.then
  %3 = load i32, i32* @result, align 4, !dbg !69
  %4 = load i32, i32* %limit, align 4, !dbg !71
  %cmp3 = icmp eq i32 %3, %4, !dbg !72
  call void @svf_assert(i1 zeroext %cmp3), !dbg !73
  br label %if.end, !dbg !74

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* @result, align 4, !dbg !75
  %6 = load i32, i32* %limit, align 4, !dbg !77
  %sub = sub nsw i32 %6, 2, !dbg !78
  %cmp4 = icmp eq i32 %5, %sub, !dbg !79
  call void @svf_assert(i1 zeroext %cmp4), !dbg !80
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end7, !dbg !81

if.else5:                                         ; preds = %entry
  %7 = load i32, i32* @result, align 4, !dbg !82
  %cmp6 = icmp eq i32 %7, 0, !dbg !84
  call void @svf_assert(i1 zeroext %cmp6), !dbg !85
  br label %if.end7

if.end7:                                          ; preds = %if.else5, %if.end
  %8 = load i32, i32* %retval, align 4, !dbg !86
  ret i32 %8, !dbg !86
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_46.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !8, line: 9, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "src/pass/INTERVAL_test_46.c", directory: "/home/SVF-tools/SSE-TestCases")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 14, type: !17, scopeLine: 14, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !9}
!19 = !DILocalVariable(name: "limit", arg: 1, scope: !16, file: !8, line: 14, type: !9)
!20 = !DILocation(line: 14, column: 14, scope: !16)
!21 = !DILocation(line: 15, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !16, file: !8, line: 15, column: 8)
!23 = !DILocation(line: 15, column: 16, scope: !22)
!24 = !DILocation(line: 15, column: 14, scope: !22)
!25 = !DILocation(line: 15, column: 8, scope: !16)
!26 = !DILocation(line: 16, column: 18, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !8, line: 15, column: 23)
!28 = !DILocation(line: 16, column: 24, scope: !27)
!29 = !DILocation(line: 16, column: 16, scope: !27)
!30 = !DILocation(line: 17, column: 14, scope: !27)
!31 = !DILocation(line: 18, column: 13, scope: !27)
!32 = !DILocation(line: 18, column: 9, scope: !27)
!33 = !DILocation(line: 19, column: 5, scope: !27)
!34 = !DILocation(line: 20, column: 5, scope: !16)
!35 = distinct !DISubprogram(name: "bar", scope: !8, file: !8, line: 23, type: !17, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DILocalVariable(name: "limit", arg: 1, scope: !35, file: !8, line: 23, type: !9)
!37 = !DILocation(line: 23, column: 14, scope: !35)
!38 = !DILocation(line: 24, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !8, line: 24, column: 8)
!40 = !DILocation(line: 24, column: 16, scope: !39)
!41 = !DILocation(line: 24, column: 14, scope: !39)
!42 = !DILocation(line: 24, column: 8, scope: !35)
!43 = !DILocation(line: 25, column: 18, scope: !44)
!44 = distinct !DILexicalBlock(scope: !39, file: !8, line: 24, column: 23)
!45 = !DILocation(line: 25, column: 24, scope: !44)
!46 = !DILocation(line: 25, column: 16, scope: !44)
!47 = !DILocation(line: 26, column: 14, scope: !44)
!48 = !DILocation(line: 27, column: 13, scope: !44)
!49 = !DILocation(line: 27, column: 9, scope: !44)
!50 = !DILocation(line: 28, column: 5, scope: !44)
!51 = !DILocation(line: 29, column: 5, scope: !35)
!52 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 32, type: !53, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!9}
!55 = !DILocalVariable(name: "limit", scope: !52, file: !8, line: 33, type: !9)
!56 = !DILocation(line: 33, column: 9, scope: !52)
!57 = !DILocation(line: 34, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !8, line: 34, column: 8)
!59 = !DILocation(line: 34, column: 14, scope: !58)
!60 = !DILocation(line: 34, column: 8, scope: !52)
!61 = !DILocation(line: 35, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !8, line: 34, column: 19)
!63 = !DILocation(line: 35, column: 9, scope: !62)
!64 = !DILocation(line: 36, column: 12, scope: !65)
!65 = distinct !DILexicalBlock(scope: !62, file: !8, line: 36, column: 12)
!66 = !DILocation(line: 36, column: 18, scope: !65)
!67 = !DILocation(line: 36, column: 22, scope: !65)
!68 = !DILocation(line: 36, column: 12, scope: !62)
!69 = !DILocation(line: 37, column: 24, scope: !70)
!70 = distinct !DILexicalBlock(scope: !65, file: !8, line: 36, column: 28)
!71 = !DILocation(line: 37, column: 34, scope: !70)
!72 = !DILocation(line: 37, column: 31, scope: !70)
!73 = !DILocation(line: 37, column: 13, scope: !70)
!74 = !DILocation(line: 38, column: 9, scope: !70)
!75 = !DILocation(line: 40, column: 24, scope: !76)
!76 = distinct !DILexicalBlock(scope: !65, file: !8, line: 39, column: 14)
!77 = !DILocation(line: 40, column: 34, scope: !76)
!78 = !DILocation(line: 40, column: 40, scope: !76)
!79 = !DILocation(line: 40, column: 31, scope: !76)
!80 = !DILocation(line: 40, column: 13, scope: !76)
!81 = !DILocation(line: 42, column: 5, scope: !62)
!82 = !DILocation(line: 44, column: 20, scope: !83)
!83 = distinct !DILexicalBlock(scope: !58, file: !8, line: 43, column: 10)
!84 = !DILocation(line: 44, column: 27, scope: !83)
!85 = !DILocation(line: 44, column: 9, scope: !83)
!86 = !DILocation(line: 46, column: 1, scope: !52)
