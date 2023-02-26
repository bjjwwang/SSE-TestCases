; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_07-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_07-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@digitCount.counter = internal global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @digitCount(i32 noundef %i) #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !18, metadata !DIExpression()), !dbg !19
  %0 = load i32, i32* %i.addr, align 4, !dbg !20
  %cmp = icmp sgt i32 %0, 0, !dbg !22
  br i1 %cmp, label %if.then, label %if.else, !dbg !23

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @digitCount.counter, align 4, !dbg !24
  %inc = add nsw i32 %1, 1, !dbg !24
  store i32 %inc, i32* @digitCount.counter, align 4, !dbg !24
  %2 = load i32, i32* %i.addr, align 4, !dbg !26
  %div = sdiv i32 %2, 10, !dbg !27
  %call = call i32 @digitCount(i32 noundef %div), !dbg !28
  store i32 %call, i32* %retval, align 4, !dbg !29
  br label %return, !dbg !29

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @digitCount.counter, align 4, !dbg !30
  store i32 %3, i32* %retval, align 4, !dbg !32
  br label %return, !dbg !32

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !33
  ret i32 %4, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !34 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [4 x i32], align 16
  %buffer2 = alloca [3 x i32], align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %buffer1, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [3 x i32]* %buffer2, metadata !42, metadata !DIExpression()), !dbg !46
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 noundef 0), !dbg !47
  call void @srand(i32 noundef %call), !dbg !48
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !49, metadata !DIExpression()), !dbg !50
  %call1 = call i32 @rand(), !dbg !51
  %rem = srem i32 %call1, 999, !dbg !52
  %add = add nsw i32 1, %rem, !dbg !53
  store i32 %add, i32* %randomNumber, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !54, metadata !DIExpression()), !dbg !55
  %0 = load i32, i32* %randomNumber, align 4, !dbg !56
  %call2 = call i32 @digitCount(i32 noundef %0), !dbg !57
  store i32 %call2, i32* %counter, align 4, !dbg !55
  %1 = load i32, i32* %counter, align 4, !dbg !58
  %cmp = icmp eq i32 %1, 3, !dbg !60
  br i1 %cmp, label %if.then, label %if.end, !dbg !61

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !62
  %idxprom = sext i32 %2 to i64, !dbg !64
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !64
  store i32 1, i32* %arrayidx, align 4, !dbg !65
  %3 = load i32, i32* %counter, align 4, !dbg !66
  %idxprom3 = sext i32 %3 to i64, !dbg !67
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !67
  store i32 1, i32* %arrayidx4, align 4, !dbg !68
  br label %if.end, !dbg !69

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !70
  ret i32 %4, !dbg !70
}

declare void @srand(i32 noundef) #2

declare i32 @time(...) #2

declare i32 @rand() #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!11, !12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 8, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "digitCount", scope: !3, file: !3, line: 7, type: !4, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !10)
!3 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!8 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_07-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!9 = !{!0}
!10 = !{}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"Homebrew clang version 14.0.6"}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !3, line: 7, type: !6)
!19 = !DILocation(line: 7, column: 20, scope: !2)
!20 = !DILocation(line: 9, column: 8, scope: !21)
!21 = distinct !DILexicalBlock(scope: !2, file: !3, line: 9, column: 8)
!22 = !DILocation(line: 9, column: 10, scope: !21)
!23 = !DILocation(line: 9, column: 8, scope: !2)
!24 = !DILocation(line: 10, column: 16, scope: !25)
!25 = distinct !DILexicalBlock(scope: !21, file: !3, line: 9, column: 15)
!26 = !DILocation(line: 11, column: 27, scope: !25)
!27 = !DILocation(line: 11, column: 28, scope: !25)
!28 = !DILocation(line: 11, column: 16, scope: !25)
!29 = !DILocation(line: 11, column: 9, scope: !25)
!30 = !DILocation(line: 14, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !21, file: !3, line: 13, column: 10)
!32 = !DILocation(line: 14, column: 9, scope: !31)
!33 = !DILocation(line: 16, column: 1, scope: !2)
!34 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 18, type: !35, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !10)
!35 = !DISubroutineType(types: !36)
!36 = !{!6}
!37 = !DILocalVariable(name: "buffer1", scope: !34, file: !3, line: 19, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 4)
!41 = !DILocation(line: 19, column: 6, scope: !34)
!42 = !DILocalVariable(name: "buffer2", scope: !34, file: !3, line: 20, type: !43)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 96, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 3)
!46 = !DILocation(line: 20, column: 6, scope: !34)
!47 = !DILocation(line: 21, column: 11, scope: !34)
!48 = !DILocation(line: 21, column: 5, scope: !34)
!49 = !DILocalVariable(name: "randomNumber", scope: !34, file: !3, line: 22, type: !6)
!50 = !DILocation(line: 22, column: 6, scope: !34)
!51 = !DILocation(line: 22, column: 26, scope: !34)
!52 = !DILocation(line: 22, column: 33, scope: !34)
!53 = !DILocation(line: 22, column: 23, scope: !34)
!54 = !DILocalVariable(name: "counter", scope: !34, file: !3, line: 23, type: !6)
!55 = !DILocation(line: 23, column: 9, scope: !34)
!56 = !DILocation(line: 23, column: 30, scope: !34)
!57 = !DILocation(line: 23, column: 19, scope: !34)
!58 = !DILocation(line: 25, column: 5, scope: !59)
!59 = distinct !DILexicalBlock(scope: !34, file: !3, line: 25, column: 5)
!60 = !DILocation(line: 25, column: 13, scope: !59)
!61 = !DILocation(line: 25, column: 5, scope: !34)
!62 = !DILocation(line: 26, column: 11, scope: !63)
!63 = distinct !DILexicalBlock(scope: !59, file: !3, line: 25, column: 19)
!64 = !DILocation(line: 26, column: 3, scope: !63)
!65 = !DILocation(line: 26, column: 20, scope: !63)
!66 = !DILocation(line: 27, column: 11, scope: !63)
!67 = !DILocation(line: 27, column: 3, scope: !63)
!68 = !DILocation(line: 27, column: 20, scope: !63)
!69 = !DILocation(line: 28, column: 2, scope: !63)
!70 = !DILocation(line: 29, column: 1, scope: !34)
