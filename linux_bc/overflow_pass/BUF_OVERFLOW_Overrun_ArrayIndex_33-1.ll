; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_33-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_33-1.c"
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
  br label %LOOP, !dbg !18

LOOP:                                             ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !19), !dbg !20
  %0 = load i32, i32* %i.addr, align 4, !dbg !21
  %div = sdiv i32 %0, 10, !dbg !22
  store i32 %div, i32* %i.addr, align 4, !dbg !23
  %1 = load i32, i32* %counter, align 4, !dbg !24
  %inc = add nsw i32 %1, 1, !dbg !24
  store i32 %inc, i32* %counter, align 4, !dbg !24
  %2 = load i32, i32* %i.addr, align 4, !dbg !25
  %cmp = icmp ne i32 %2, 0, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %LOOP
  br label %LOOP, !dbg !29

if.end:                                           ; preds = %LOOP
  %3 = load i32, i32* %counter, align 4, !dbg !31
  ret i32 %3, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !33 {
entry:
  %buffer1 = alloca [4 x i32], align 16
  %buffer2 = alloca [3 x i32], align 4
  %randomNumber = alloca i32, align 4
  %counter = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [4 x i32]* %buffer1, metadata !36, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [3 x i32]* %buffer2, metadata !41, metadata !DIExpression()), !dbg !45
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !46
  call void @srand(i32 %call) #4, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !48, metadata !DIExpression()), !dbg !49
  %call1 = call i32 @rand() #4, !dbg !50
  %rem = srem i32 %call1, 999, !dbg !51
  store i32 %rem, i32* %randomNumber, align 4, !dbg !49
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load i32, i32* %randomNumber, align 4, !dbg !54
  %call2 = call i32 @digitCount(i32 %0), !dbg !55
  store i32 %call2, i32* %counter, align 4, !dbg !53
  %1 = load i32, i32* %counter, align 4, !dbg !56
  %idxprom = sext i32 %1 to i64, !dbg !57
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %buffer1, i64 0, i64 %idxprom, !dbg !57
  store i32 1, i32* %arrayidx, align 4, !dbg !58
  %2 = load i32, i32* %counter, align 4, !dbg !59
  %idxprom3 = sext i32 %2 to i64, !dbg !60
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %buffer2, i64 0, i64 %idxprom3, !dbg !60
  store i32 1, i32* %arrayidx4, align 4, !dbg !61
  ret i32 0, !dbg !62
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_33-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "digitCount", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_33-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "i", arg: 1, scope: !9, file: !10, line: 7, type: !13)
!15 = !DILocation(line: 7, column: 20, scope: !9)
!16 = !DILocalVariable(name: "counter", scope: !9, file: !10, line: 8, type: !13)
!17 = !DILocation(line: 8, column: 9, scope: !9)
!18 = !DILocation(line: 8, column: 5, scope: !9)
!19 = !DILabel(scope: !9, name: "LOOP", file: !10, line: 9)
!20 = !DILocation(line: 9, column: 5, scope: !9)
!21 = !DILocation(line: 10, column: 9, scope: !9)
!22 = !DILocation(line: 10, column: 10, scope: !9)
!23 = !DILocation(line: 10, column: 7, scope: !9)
!24 = !DILocation(line: 11, column: 12, scope: !9)
!25 = !DILocation(line: 12, column: 8, scope: !26)
!26 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 8)
!27 = !DILocation(line: 12, column: 10, scope: !26)
!28 = !DILocation(line: 12, column: 8, scope: !9)
!29 = !DILocation(line: 13, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !10, line: 12, column: 16)
!31 = !DILocation(line: 15, column: 12, scope: !9)
!32 = !DILocation(line: 15, column: 5, scope: !9)
!33 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 18, type: !34, scopeLine: 18, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!34 = !DISubroutineType(types: !35)
!35 = !{!13}
!36 = !DILocalVariable(name: "buffer1", scope: !33, file: !10, line: 19, type: !37)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 4)
!40 = !DILocation(line: 19, column: 6, scope: !33)
!41 = !DILocalVariable(name: "buffer2", scope: !33, file: !10, line: 20, type: !42)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 3)
!45 = !DILocation(line: 20, column: 6, scope: !33)
!46 = !DILocation(line: 21, column: 11, scope: !33)
!47 = !DILocation(line: 21, column: 5, scope: !33)
!48 = !DILocalVariable(name: "randomNumber", scope: !33, file: !10, line: 22, type: !13)
!49 = !DILocation(line: 22, column: 6, scope: !33)
!50 = !DILocation(line: 22, column: 21, scope: !33)
!51 = !DILocation(line: 22, column: 28, scope: !33)
!52 = !DILocalVariable(name: "counter", scope: !33, file: !10, line: 23, type: !13)
!53 = !DILocation(line: 23, column: 9, scope: !33)
!54 = !DILocation(line: 23, column: 30, scope: !33)
!55 = !DILocation(line: 23, column: 19, scope: !33)
!56 = !DILocation(line: 25, column: 10, scope: !33)
!57 = !DILocation(line: 25, column: 2, scope: !33)
!58 = !DILocation(line: 25, column: 19, scope: !33)
!59 = !DILocation(line: 26, column: 10, scope: !33)
!60 = !DILocation(line: 26, column: 2, scope: !33)
!61 = !DILocation(line: 26, column: 19, scope: !33)
!62 = !DILocation(line: 27, column: 1, scope: !33)
