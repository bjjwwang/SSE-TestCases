; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_07-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_07-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@digitCount.counter = internal global i32 0, align 4, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @digitCount(i32 %i) #0 !dbg !2 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %cmp = icmp sgt i32 %0, 0, !dbg !21
  br i1 %cmp, label %if.then, label %if.else, !dbg !22

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @digitCount.counter, align 4, !dbg !23
  %inc = add nsw i32 %1, 1, !dbg !23
  store i32 %inc, i32* @digitCount.counter, align 4, !dbg !23
  %2 = load i32, i32* %i.addr, align 4, !dbg !25
  %div = sdiv i32 %2, 10, !dbg !26
  %call = call i32 @digitCount(i32 %div), !dbg !27
  store i32 %call, i32* %retval, align 4, !dbg !28
  br label %return, !dbg !28

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @digitCount.counter, align 4, !dbg !29
  store i32 %3, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval, align 4, !dbg !32
  ret i32 %4, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !33 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [4 x i32], align 16
  %buffer2 = alloca [3 x i32], align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %buffer1, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [3 x i32]* %buffer2, metadata !41, metadata !DIExpression()), !dbg !45
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !46
  call void @srand(i32 %call) #4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !48, metadata !DIExpression()), !dbg !49
  %call1 = call i32 @rand() #4, !dbg !50
  %rem = srem i32 %call1, 999, !dbg !51
  %add = add nsw i32 1, %rem, !dbg !52
  store i32 %add, i32* %randomNumber, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !53, metadata !DIExpression()), !dbg !54
  %0 = load i32, i32* %randomNumber, align 4, !dbg !55
  %call2 = call i32 @digitCount(i32 %0), !dbg !56
  store i32 %call2, i32* %counter, align 4, !dbg !54
  %1 = load i32, i32* %counter, align 4, !dbg !57
  %cmp = icmp eq i32 %1, 3, !dbg !59
  br i1 %cmp, label %if.then, label %if.end, !dbg !60

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !61
  %idxprom = sext i32 %2 to i64, !dbg !63
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !63
  store i32 1, i32* %arrayidx, align 4, !dbg !64
  %3 = load i32, i32* %counter, align 4, !dbg !65
  %idxprom3 = sext i32 %3 to i64, !dbg !66
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !66
  store i32 1, i32* %arrayidx4, align 4, !dbg !67
  br label %if.end, !dbg !68

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !69
  ret i32 %4, !dbg !69
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

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter", scope: !2, file: !3, line: 8, type: !6, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "digitCount", scope: !3, file: !3, line: 7, type: !4, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!3 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !DISubroutineType(types: !5)
!5 = !{!6, !6}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = distinct !DICompileUnit(language: DW_LANG_C99, file: !8, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !9, globals: !10, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Recursive_Overrun_ArrayIndex_07-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!9 = !{}
!10 = !{!0}
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = !DILocalVariable(name: "i", arg: 1, scope: !2, file: !3, line: 7, type: !6)
!18 = !DILocation(line: 7, column: 20, scope: !2)
!19 = !DILocation(line: 9, column: 8, scope: !20)
!20 = distinct !DILexicalBlock(scope: !2, file: !3, line: 9, column: 8)
!21 = !DILocation(line: 9, column: 10, scope: !20)
!22 = !DILocation(line: 9, column: 8, scope: !2)
!23 = !DILocation(line: 10, column: 16, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !3, line: 9, column: 15)
!25 = !DILocation(line: 11, column: 27, scope: !24)
!26 = !DILocation(line: 11, column: 28, scope: !24)
!27 = !DILocation(line: 11, column: 16, scope: !24)
!28 = !DILocation(line: 11, column: 9, scope: !24)
!29 = !DILocation(line: 14, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !20, file: !3, line: 13, column: 10)
!31 = !DILocation(line: 14, column: 9, scope: !30)
!32 = !DILocation(line: 16, column: 1, scope: !2)
!33 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 18, type: !34, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !7, retainedNodes: !9)
!34 = !DISubroutineType(types: !35)
!35 = !{!6}
!36 = !DILocalVariable(name: "buffer1", scope: !33, file: !3, line: 19, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 4)
!40 = !DILocation(line: 19, column: 6, scope: !33)
!41 = !DILocalVariable(name: "buffer2", scope: !33, file: !3, line: 20, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 96, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 3)
!45 = !DILocation(line: 20, column: 6, scope: !33)
!46 = !DILocation(line: 21, column: 11, scope: !33)
!47 = !DILocation(line: 21, column: 5, scope: !33)
!48 = !DILocalVariable(name: "randomNumber", scope: !33, file: !3, line: 22, type: !6)
!49 = !DILocation(line: 22, column: 6, scope: !33)
!50 = !DILocation(line: 22, column: 26, scope: !33)
!51 = !DILocation(line: 22, column: 33, scope: !33)
!52 = !DILocation(line: 22, column: 23, scope: !33)
!53 = !DILocalVariable(name: "counter", scope: !33, file: !3, line: 23, type: !6)
!54 = !DILocation(line: 23, column: 9, scope: !33)
!55 = !DILocation(line: 23, column: 30, scope: !33)
!56 = !DILocation(line: 23, column: 19, scope: !33)
!57 = !DILocation(line: 25, column: 5, scope: !58)
!58 = distinct !DILexicalBlock(scope: !33, file: !3, line: 25, column: 5)
!59 = !DILocation(line: 25, column: 13, scope: !58)
!60 = !DILocation(line: 25, column: 5, scope: !33)
!61 = !DILocation(line: 26, column: 11, scope: !62)
!62 = distinct !DILexicalBlock(scope: !58, file: !3, line: 25, column: 19)
!63 = !DILocation(line: 26, column: 3, scope: !62)
!64 = !DILocation(line: 26, column: 20, scope: !62)
!65 = !DILocation(line: 27, column: 11, scope: !62)
!66 = !DILocation(line: 27, column: 3, scope: !62)
!67 = !DILocation(line: 27, column: 20, scope: !62)
!68 = !DILocation(line: 28, column: 2, scope: !62)
!69 = !DILocation(line: 29, column: 1, scope: !33)
