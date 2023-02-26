; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_17-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_17-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@buffer = dso_local global [5 x i32] zeroinitializer, align 16, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @foo(i32* %i) #0 !dbg !17 {
entry:
  %i.addr = alloca i32*, align 8
  %a = alloca i32, align 4
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %a, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i32*, i32** %i.addr, align 8, !dbg !25
  %1 = load i32, i32* %0, align 4, !dbg !26
  %rem = srem i32 %1, 2, !dbg !27
  store i32 %rem, i32* %a, align 4, !dbg !24
  %2 = load i32, i32* %a, align 4, !dbg !28
  switch i32 %2, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
  ], !dbg !29

sw.bb:                                            ; preds = %entry
  br label %sw.epilog, !dbg !30

sw.bb1:                                           ; preds = %entry
  %3 = load i32*, i32** %i.addr, align 8, !dbg !32
  %4 = load i32, i32* %3, align 4, !dbg !33
  %add = add nsw i32 %4, 1, !dbg !34
  %5 = load i32*, i32** %i.addr, align 8, !dbg !35
  store i32 %add, i32* %5, align 4, !dbg !36
  br label %sw.epilog, !dbg !37

sw.default:                                       ; preds = %entry
  store i32 1, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @buffer, i64 10, i64 0), align 8, !dbg !38
  br label %sw.epilog, !dbg !39

sw.epilog:                                        ; preds = %sw.default, %sw.bb1, %sw.bb
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !44
  call void @srand(i32 %call) #4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %i, metadata !46, metadata !DIExpression()), !dbg !47
  %call1 = call i32 @rand() #4, !dbg !48
  %rem = srem i32 %call1, 20, !dbg !49
  store i32 %rem, i32* %i, align 4, !dbg !47
  %0 = load i32, i32* %i, align 4, !dbg !50
  %cmp = icmp sge i32 %0, 0, !dbg !52
  br i1 %cmp, label %if.then, label %if.end5, !dbg !53

if.then:                                          ; preds = %entry
  call void @foo(i32* %i), !dbg !54
  %1 = load i32, i32* %i, align 4, !dbg !56
  %rem2 = srem i32 %1, 2, !dbg !58
  %cmp3 = icmp eq i32 %rem2, 0, !dbg !59
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !60

if.then4:                                         ; preds = %if.then
  %2 = load i32, i32* %i, align 4, !dbg !61
  %idxprom = sext i32 %2 to i64, !dbg !63
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* @buffer, i64 0, i64 %idxprom, !dbg !63
  store i32 1, i32* %arrayidx, align 4, !dbg !64
  br label %if.end, !dbg !65

if.else:                                          ; preds = %if.then
  store i32 1, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @buffer, i64 10, i64 0), align 8, !dbg !66
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  br label %if.end5, !dbg !68

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* %retval, align 4, !dbg !69
  ret i32 %3, !dbg !69
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
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "buffer", scope: !2, file: !6, line: 7, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_17-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{}
!5 = !{!0}
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_17-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DICompositeType(tag: DW_TAG_array_type, baseType: !8, size: 160, elements: !9)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{!10}
!10 = !DISubrange(count: 5)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "foo", scope: !6, file: !6, line: 9, type: !18, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!21 = !DILocalVariable(name: "i", arg: 1, scope: !17, file: !6, line: 9, type: !20)
!22 = !DILocation(line: 9, column: 15, scope: !17)
!23 = !DILocalVariable(name: "a", scope: !17, file: !6, line: 10, type: !8)
!24 = !DILocation(line: 10, column: 9, scope: !17)
!25 = !DILocation(line: 10, column: 14, scope: !17)
!26 = !DILocation(line: 10, column: 13, scope: !17)
!27 = !DILocation(line: 10, column: 16, scope: !17)
!28 = !DILocation(line: 11, column: 12, scope: !17)
!29 = !DILocation(line: 11, column: 5, scope: !17)
!30 = !DILocation(line: 13, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !17, file: !6, line: 11, column: 15)
!32 = !DILocation(line: 15, column: 19, scope: !31)
!33 = !DILocation(line: 15, column: 18, scope: !31)
!34 = !DILocation(line: 15, column: 21, scope: !31)
!35 = !DILocation(line: 15, column: 14, scope: !31)
!36 = !DILocation(line: 15, column: 16, scope: !31)
!37 = !DILocation(line: 16, column: 13, scope: !31)
!38 = !DILocation(line: 18, column: 24, scope: !31)
!39 = !DILocation(line: 19, column: 13, scope: !31)
!40 = !DILocation(line: 21, column: 1, scope: !17)
!41 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 23, type: !42, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!8}
!44 = !DILocation(line: 24, column: 11, scope: !41)
!45 = !DILocation(line: 24, column: 5, scope: !41)
!46 = !DILocalVariable(name: "i", scope: !41, file: !6, line: 25, type: !8)
!47 = !DILocation(line: 25, column: 9, scope: !41)
!48 = !DILocation(line: 25, column: 13, scope: !41)
!49 = !DILocation(line: 25, column: 20, scope: !41)
!50 = !DILocation(line: 26, column: 9, scope: !51)
!51 = distinct !DILexicalBlock(scope: !41, file: !6, line: 26, column: 9)
!52 = !DILocation(line: 26, column: 11, scope: !51)
!53 = !DILocation(line: 26, column: 9, scope: !41)
!54 = !DILocation(line: 27, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !6, line: 26, column: 17)
!56 = !DILocation(line: 28, column: 12, scope: !57)
!57 = distinct !DILexicalBlock(scope: !55, file: !6, line: 28, column: 12)
!58 = !DILocation(line: 28, column: 14, scope: !57)
!59 = !DILocation(line: 28, column: 18, scope: !57)
!60 = !DILocation(line: 28, column: 12, scope: !55)
!61 = !DILocation(line: 29, column: 11, scope: !62)
!62 = distinct !DILexicalBlock(scope: !57, file: !6, line: 28, column: 24)
!63 = !DILocation(line: 29, column: 4, scope: !62)
!64 = !DILocation(line: 29, column: 14, scope: !62)
!65 = !DILocation(line: 30, column: 3, scope: !62)
!66 = !DILocation(line: 32, column: 15, scope: !67)
!67 = distinct !DILexicalBlock(scope: !57, file: !6, line: 31, column: 8)
!68 = !DILocation(line: 34, column: 5, scope: !55)
!69 = !DILocation(line: 35, column: 1, scope: !41)
