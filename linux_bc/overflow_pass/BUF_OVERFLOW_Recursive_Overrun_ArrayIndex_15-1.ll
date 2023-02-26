; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_15-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_15-1.c"
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
  %buffer = alloca [5 x i32], align 16
  %limit = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !55, metadata !DIExpression()), !dbg !59
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !60
  call void @srand(i32 %call) #4, !dbg !61
  call void @llvm.dbg.declare(metadata i32* %limit, metadata !62, metadata !DIExpression()), !dbg !63
  %call1 = call i32 @rand() #4, !dbg !64
  %rem = srem i32 %call1, 11, !dbg !65
  %sub = sub nsw i32 %rem, 5, !dbg !66
  store i32 %sub, i32* %limit, align 4, !dbg !63
  %0 = load i32, i32* %limit, align 4, !dbg !67
  %cmp = icmp sgt i32 %0, 0, !dbg !69
  br i1 %cmp, label %if.then, label %if.else7, !dbg !70

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %limit, align 4, !dbg !71
  call void @foo(i32 %1), !dbg !73
  %2 = load i32, i32* %limit, align 4, !dbg !74
  %rem2 = srem i32 %2, 2, !dbg !76
  %cmp3 = icmp eq i32 %rem2, 1, !dbg !77
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !78

if.then4:                                         ; preds = %if.then
  %3 = load i32, i32* @result, align 4, !dbg !79
  %idxprom = sext i32 %3 to i64, !dbg !81
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !81
  store i32 1, i32* %arrayidx, align 4, !dbg !82
  br label %if.end, !dbg !83

if.else:                                          ; preds = %if.then
  %4 = load i32, i32* @result, align 4, !dbg !84
  %idxprom5 = sext i32 %4 to i64, !dbg !86
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !86
  store i32 1, i32* %arrayidx6, align 4, !dbg !87
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  br label %if.end10, !dbg !88

if.else7:                                         ; preds = %entry
  %5 = load i32, i32* @result, align 4, !dbg !89
  %idxprom8 = sext i32 %5 to i64, !dbg !91
  %arrayidx9 = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 %idxprom8, !dbg !91
  store i32 1, i32* %arrayidx9, align 4, !dbg !92
  br label %if.end10

if.end10:                                         ; preds = %if.else7, %if.end
  %6 = load i32, i32* %retval, align 4, !dbg !93
  ret i32 %6, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "count", scope: !2, file: !8, line: 7, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_15-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "result", scope: !2, file: !8, line: 8, type: !9, isLocal: false, isDefinition: true)
!8 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_15-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "foo", scope: !8, file: !8, line: 13, type: !17, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null, !9}
!19 = !DILocalVariable(name: "limit", arg: 1, scope: !16, file: !8, line: 13, type: !9)
!20 = !DILocation(line: 13, column: 14, scope: !16)
!21 = !DILocation(line: 14, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !16, file: !8, line: 14, column: 8)
!23 = !DILocation(line: 14, column: 16, scope: !22)
!24 = !DILocation(line: 14, column: 14, scope: !22)
!25 = !DILocation(line: 14, column: 8, scope: !16)
!26 = !DILocation(line: 15, column: 18, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !8, line: 14, column: 23)
!28 = !DILocation(line: 15, column: 24, scope: !27)
!29 = !DILocation(line: 15, column: 16, scope: !27)
!30 = !DILocation(line: 16, column: 14, scope: !27)
!31 = !DILocation(line: 17, column: 13, scope: !27)
!32 = !DILocation(line: 17, column: 9, scope: !27)
!33 = !DILocation(line: 18, column: 5, scope: !27)
!34 = !DILocation(line: 19, column: 5, scope: !16)
!35 = distinct !DISubprogram(name: "bar", scope: !8, file: !8, line: 22, type: !17, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!36 = !DILocalVariable(name: "limit", arg: 1, scope: !35, file: !8, line: 22, type: !9)
!37 = !DILocation(line: 22, column: 14, scope: !35)
!38 = !DILocation(line: 23, column: 8, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !8, line: 23, column: 8)
!40 = !DILocation(line: 23, column: 16, scope: !39)
!41 = !DILocation(line: 23, column: 14, scope: !39)
!42 = !DILocation(line: 23, column: 8, scope: !35)
!43 = !DILocation(line: 24, column: 18, scope: !44)
!44 = distinct !DILexicalBlock(scope: !39, file: !8, line: 23, column: 23)
!45 = !DILocation(line: 24, column: 24, scope: !44)
!46 = !DILocation(line: 24, column: 16, scope: !44)
!47 = !DILocation(line: 25, column: 14, scope: !44)
!48 = !DILocation(line: 26, column: 13, scope: !44)
!49 = !DILocation(line: 26, column: 9, scope: !44)
!50 = !DILocation(line: 27, column: 5, scope: !44)
!51 = !DILocation(line: 28, column: 5, scope: !35)
!52 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 31, type: !53, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!9}
!55 = !DILocalVariable(name: "buffer", scope: !52, file: !8, line: 32, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 160, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 5)
!59 = !DILocation(line: 32, column: 6, scope: !52)
!60 = !DILocation(line: 33, column: 8, scope: !52)
!61 = !DILocation(line: 33, column: 2, scope: !52)
!62 = !DILocalVariable(name: "limit", scope: !52, file: !8, line: 34, type: !9)
!63 = !DILocation(line: 34, column: 9, scope: !52)
!64 = !DILocation(line: 34, column: 18, scope: !52)
!65 = !DILocation(line: 34, column: 25, scope: !52)
!66 = !DILocation(line: 34, column: 31, scope: !52)
!67 = !DILocation(line: 36, column: 8, scope: !68)
!68 = distinct !DILexicalBlock(scope: !52, file: !8, line: 36, column: 8)
!69 = !DILocation(line: 36, column: 14, scope: !68)
!70 = !DILocation(line: 36, column: 8, scope: !52)
!71 = !DILocation(line: 37, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !8, line: 36, column: 19)
!73 = !DILocation(line: 37, column: 9, scope: !72)
!74 = !DILocation(line: 38, column: 12, scope: !75)
!75 = distinct !DILexicalBlock(scope: !72, file: !8, line: 38, column: 12)
!76 = !DILocation(line: 38, column: 18, scope: !75)
!77 = !DILocation(line: 38, column: 22, scope: !75)
!78 = !DILocation(line: 38, column: 12, scope: !72)
!79 = !DILocation(line: 40, column: 11, scope: !80)
!80 = distinct !DILexicalBlock(scope: !75, file: !8, line: 38, column: 28)
!81 = !DILocation(line: 40, column: 4, scope: !80)
!82 = !DILocation(line: 40, column: 19, scope: !80)
!83 = !DILocation(line: 41, column: 9, scope: !80)
!84 = !DILocation(line: 44, column: 11, scope: !85)
!85 = distinct !DILexicalBlock(scope: !75, file: !8, line: 42, column: 14)
!86 = !DILocation(line: 44, column: 4, scope: !85)
!87 = !DILocation(line: 44, column: 19, scope: !85)
!88 = !DILocation(line: 46, column: 5, scope: !72)
!89 = !DILocation(line: 49, column: 10, scope: !90)
!90 = distinct !DILexicalBlock(scope: !68, file: !8, line: 47, column: 10)
!91 = !DILocation(line: 49, column: 3, scope: !90)
!92 = !DILocation(line: 49, column: 18, scope: !90)
!93 = !DILocation(line: 51, column: 1, scope: !52)
