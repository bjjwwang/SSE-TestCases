; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_27-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_27-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @digitCount(i32 %i) #0 !dbg !9 {
entry:
  %i.addr = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 0, i32* %counter, align 4, !dbg !17
  br label %do.body, !dbg !18

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32, i32* %i.addr, align 4, !dbg !19
  %div = sdiv i32 %0, 10, !dbg !21
  store i32 %div, i32* %i.addr, align 4, !dbg !22
  %1 = load i32, i32* %counter, align 4, !dbg !23
  %inc = add nsw i32 %1, 1, !dbg !23
  store i32 %inc, i32* %counter, align 4, !dbg !23
  br label %do.cond, !dbg !24

do.cond:                                          ; preds = %do.body
  %2 = load i32, i32* %i.addr, align 4, !dbg !25
  %cmp = icmp ne i32 %2, 0, !dbg !26
  br i1 %cmp, label %do.body, label %do.end, !dbg !24, !llvm.loop !27

do.end:                                           ; preds = %do.cond
  %3 = load i32, i32* %counter, align 4, !dbg !30
  ret i32 %3, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !32 {
entry:
  %retval = alloca i32, align 4
  %buffer1 = alloca [4 x i32], align 16
  %buffer2 = alloca [3 x i32], align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %buffer1, metadata !35, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [3 x i32]* %buffer2, metadata !40, metadata !DIExpression()), !dbg !44
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !45
  call void @srand(i32 %call) #4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !47, metadata !DIExpression()), !dbg !48
  %call1 = call i32 @rand() #4, !dbg !49
  %rem = srem i32 %call1, 999, !dbg !50
  store i32 %rem, i32* %randomNumber, align 4, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !51, metadata !DIExpression()), !dbg !52
  %0 = load i32, i32* %randomNumber, align 4, !dbg !53
  %call2 = call i32 @digitCount(i32 %0), !dbg !54
  store i32 %call2, i32* %counter, align 4, !dbg !52
  %1 = load i32, i32* %counter, align 4, !dbg !55
  %cmp = icmp eq i32 %1, 3, !dbg !57
  br i1 %cmp, label %if.then, label %if.end, !dbg !58

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %counter, align 4, !dbg !59
  %idxprom = sext i32 %2 to i64, !dbg !61
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !61
  store i32 1, i32* %arrayidx, align 4, !dbg !62
  %3 = load i32, i32* %counter, align 4, !dbg !63
  %idxprom3 = sext i32 %3 to i64, !dbg !64
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !64
  store i32 1, i32* %arrayidx4, align 4, !dbg !65
  br label %if.end, !dbg !66

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %retval, align 4, !dbg !67
  ret i32 %4, !dbg !67
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_27-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_27-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 20, scope: !9)
!16 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 9, scope: !9)
!18 = !DILocation(line: 9, column: 5, scope: !9)
!19 = !DILocation(line: 10, column: 13, scope: !20)
!20 = distinct !DILexicalBlock(scope: !9, file: !10, line: 9, column: 8)
!21 = !DILocation(line: 10, column: 14, scope: !20)
!22 = !DILocation(line: 10, column: 11, scope: !20)
!23 = !DILocation(line: 11, column: 16, scope: !20)
!24 = !DILocation(line: 12, column: 5, scope: !20)
!25 = !DILocation(line: 12, column: 13, scope: !9)
!26 = !DILocation(line: 12, column: 15, scope: !9)
!27 = distinct !{!27, !18, !28, !29}
!28 = !DILocation(line: 12, column: 19, scope: !9)
!29 = !{!"llvm.loop.mustprogress"}
!30 = !DILocation(line: 13, column: 12, scope: !9)
!31 = !DILocation(line: 13, column: 5, scope: !9)
!32 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 16, type: !33, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!13}
!35 = !DILocalVariable(name: "buffer1", scope: !32, file: !10, line: 17, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 4)
!39 = !DILocation(line: 17, column: 6, scope: !32)
!40 = !DILocalVariable(name: "buffer2", scope: !32, file: !10, line: 18, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 3)
!44 = !DILocation(line: 18, column: 6, scope: !32)
!45 = !DILocation(line: 19, column: 11, scope: !32)
!46 = !DILocation(line: 19, column: 5, scope: !32)
!47 = !DILocalVariable(name: "randomNumber", scope: !32, file: !10, line: 20, type: !13)
!48 = !DILocation(line: 20, column: 6, scope: !32)
!49 = !DILocation(line: 20, column: 21, scope: !32)
!50 = !DILocation(line: 20, column: 28, scope: !32)
!51 = !DILocalVariable(name: "counter", scope: !32, file: !10, line: 21, type: !13)
!52 = !DILocation(line: 21, column: 9, scope: !32)
!53 = !DILocation(line: 21, column: 30, scope: !32)
!54 = !DILocation(line: 21, column: 19, scope: !32)
!55 = !DILocation(line: 23, column: 5, scope: !56)
!56 = distinct !DILexicalBlock(scope: !32, file: !10, line: 23, column: 5)
!57 = !DILocation(line: 23, column: 13, scope: !56)
!58 = !DILocation(line: 23, column: 5, scope: !32)
!59 = !DILocation(line: 24, column: 11, scope: !60)
!60 = distinct !DILexicalBlock(scope: !56, file: !10, line: 23, column: 19)
!61 = !DILocation(line: 24, column: 3, scope: !60)
!62 = !DILocation(line: 24, column: 20, scope: !60)
!63 = !DILocation(line: 25, column: 11, scope: !60)
!64 = !DILocation(line: 25, column: 3, scope: !60)
!65 = !DILocation(line: 25, column: 20, scope: !60)
!66 = !DILocation(line: 26, column: 2, scope: !60)
!67 = !DILocation(line: 27, column: 1, scope: !32)
