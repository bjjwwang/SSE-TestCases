; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@buffer = global [5 x i32] zeroinitializer, align 16, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @foo(i32* noundef %i) #0 !dbg !17 {
entry:
  %i.addr = alloca i32*, align 8
  %a = alloca i32, align 4
  store i32* %i, i32** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %i.addr, metadata !22, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata i32* %a, metadata !24, metadata !DIExpression()), !dbg !25
  %0 = load i32*, i32** %i.addr, align 8, !dbg !26
  %1 = load i32, i32* %0, align 4, !dbg !27
  %rem = srem i32 %1, 2, !dbg !28
  store i32 %rem, i32* %a, align 4, !dbg !25
  %2 = load i32, i32* %a, align 4, !dbg !29
  switch i32 %2, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
  ], !dbg !30

sw.bb:                                            ; preds = %entry
  br label %sw.epilog, !dbg !31

sw.bb1:                                           ; preds = %entry
  %3 = load i32*, i32** %i.addr, align 8, !dbg !33
  %4 = load i32, i32* %3, align 4, !dbg !34
  %add = add nsw i32 %4, 1, !dbg !35
  %5 = load i32*, i32** %i.addr, align 8, !dbg !36
  store i32 %add, i32* %5, align 4, !dbg !37
  br label %sw.epilog, !dbg !38

sw.default:                                       ; preds = %entry
  store i32 1, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @buffer, i64 10, i64 0), align 8, !dbg !39
  br label %sw.epilog, !dbg !40

sw.epilog:                                        ; preds = %sw.default, %sw.bb1, %sw.bb
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !42 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !45
  call void @srand(i32 noundef %call), !dbg !46
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !DIExpression()), !dbg !48
  %call1 = call i32 @rand(), !dbg !49
  %rem = srem i32 %call1, 20, !dbg !50
  store i32 %rem, i32* %i, align 4, !dbg !48
  %0 = load i32, i32* %i, align 4, !dbg !51
  %cmp = icmp sge i32 %0, 0, !dbg !53
  br i1 %cmp, label %if.then, label %if.end5, !dbg !54

if.then:                                          ; preds = %entry
  call void @foo(i32* noundef %i), !dbg !55
  %1 = load i32, i32* %i, align 4, !dbg !57
  %rem2 = srem i32 %1, 2, !dbg !59
  %cmp3 = icmp eq i32 %rem2, 0, !dbg !60
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !61

if.then4:                                         ; preds = %if.then
  %2 = load i32, i32* %i, align 4, !dbg !62
  %idxprom = sext i32 %2 to i64, !dbg !64
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* @buffer, i64 0, i64 %idxprom, !dbg !64
  store i32 1, i32* %arrayidx, align 4, !dbg !65
  br label %if.end, !dbg !66

if.else:                                          ; preds = %if.then
  store i32 1, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @buffer, i64 10, i64 0), align 8, !dbg !67
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then4
  br label %if.end5, !dbg !69

if.end5:                                          ; preds = %if.end, %entry
  %3 = load i32, i32* %retval, align 4, !dbg !70
  ret i32 %3, !dbg !70
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "buffer", scope: !2, file: !5, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!0}
!5 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 160, elements: !8)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{!9}
!9 = !DISubrange(count: 5)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"PIC Level", i32 2}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"Homebrew clang version 14.0.6"}
!17 = distinct !DISubprogram(name: "foo", scope: !5, file: !5, line: 9, type: !18, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!18 = !DISubroutineType(types: !19)
!19 = !{null, !20}
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!21 = !{}
!22 = !DILocalVariable(name: "i", arg: 1, scope: !17, file: !5, line: 9, type: !20)
!23 = !DILocation(line: 9, column: 15, scope: !17)
!24 = !DILocalVariable(name: "a", scope: !17, file: !5, line: 10, type: !7)
!25 = !DILocation(line: 10, column: 9, scope: !17)
!26 = !DILocation(line: 10, column: 14, scope: !17)
!27 = !DILocation(line: 10, column: 13, scope: !17)
!28 = !DILocation(line: 10, column: 16, scope: !17)
!29 = !DILocation(line: 11, column: 12, scope: !17)
!30 = !DILocation(line: 11, column: 5, scope: !17)
!31 = !DILocation(line: 13, column: 13, scope: !32)
!32 = distinct !DILexicalBlock(scope: !17, file: !5, line: 11, column: 15)
!33 = !DILocation(line: 15, column: 19, scope: !32)
!34 = !DILocation(line: 15, column: 18, scope: !32)
!35 = !DILocation(line: 15, column: 21, scope: !32)
!36 = !DILocation(line: 15, column: 14, scope: !32)
!37 = !DILocation(line: 15, column: 16, scope: !32)
!38 = !DILocation(line: 16, column: 13, scope: !32)
!39 = !DILocation(line: 18, column: 24, scope: !32)
!40 = !DILocation(line: 19, column: 13, scope: !32)
!41 = !DILocation(line: 21, column: 1, scope: !17)
!42 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 23, type: !43, scopeLine: 23, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !21)
!43 = !DISubroutineType(types: !44)
!44 = !{!7}
!45 = !DILocation(line: 24, column: 11, scope: !42)
!46 = !DILocation(line: 24, column: 5, scope: !42)
!47 = !DILocalVariable(name: "i", scope: !42, file: !5, line: 25, type: !7)
!48 = !DILocation(line: 25, column: 9, scope: !42)
!49 = !DILocation(line: 25, column: 13, scope: !42)
!50 = !DILocation(line: 25, column: 20, scope: !42)
!51 = !DILocation(line: 26, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !42, file: !5, line: 26, column: 9)
!53 = !DILocation(line: 26, column: 11, scope: !52)
!54 = !DILocation(line: 26, column: 9, scope: !42)
!55 = !DILocation(line: 27, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !5, line: 26, column: 17)
!57 = !DILocation(line: 28, column: 12, scope: !58)
!58 = distinct !DILexicalBlock(scope: !56, file: !5, line: 28, column: 12)
!59 = !DILocation(line: 28, column: 14, scope: !58)
!60 = !DILocation(line: 28, column: 18, scope: !58)
!61 = !DILocation(line: 28, column: 12, scope: !56)
!62 = !DILocation(line: 29, column: 11, scope: !63)
!63 = distinct !DILexicalBlock(scope: !58, file: !5, line: 28, column: 24)
!64 = !DILocation(line: 29, column: 4, scope: !63)
!65 = !DILocation(line: 29, column: 14, scope: !63)
!66 = !DILocation(line: 30, column: 3, scope: !63)
!67 = !DILocation(line: 32, column: 15, scope: !68)
!68 = distinct !DILexicalBlock(scope: !58, file: !5, line: 31, column: 8)
!69 = !DILocation(line: 34, column: 5, scope: !56)
!70 = !DILocation(line: 35, column: 1, scope: !42)
