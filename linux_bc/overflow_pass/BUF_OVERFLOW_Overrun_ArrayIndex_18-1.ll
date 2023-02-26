; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_18-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_18-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [15 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [15 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %a, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #4, !dbg !23
  %rem = srem i32 %call1, 51, !dbg !24
  %sub = sub nsw i32 %rem, 25, !dbg !25
  store i32 %sub, i32* %a, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %b, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load i32, i32* %a, align 4, !dbg !28
  store i32 %0, i32* %b, align 4, !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %1, 10, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %a, align 4, !dbg !37
  %cmp2 = icmp eq i32 %2, 10, !dbg !40
  br i1 %cmp2, label %if.then, label %if.end, !dbg !41

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !42

if.end:                                           ; preds = %for.body
  %3 = load i32, i32* %a, align 4, !dbg !44
  %inc = add nsw i32 %3, 1, !dbg !44
  store i32 %inc, i32* %a, align 4, !dbg !44
  br label %for.inc, !dbg !45

for.inc:                                          ; preds = %if.end
  %4 = load i32, i32* %i, align 4, !dbg !46
  %inc3 = add nsw i32 %4, 1, !dbg !46
  store i32 %inc3, i32* %i, align 4, !dbg !46
  br label %for.cond, !dbg !47, !llvm.loop !48

for.end:                                          ; preds = %if.then, %for.cond
  %5 = load i32, i32* %b, align 4, !dbg !51
  %cmp4 = icmp sge i32 %5, 0, !dbg !53
  br i1 %cmp4, label %land.lhs.true, label %if.else, !dbg !54

land.lhs.true:                                    ; preds = %for.end
  %6 = load i32, i32* %b, align 4, !dbg !55
  %cmp5 = icmp sle i32 %6, 10, !dbg !56
  br i1 %cmp5, label %if.then6, label %if.else, !dbg !57

if.then6:                                         ; preds = %land.lhs.true
  %7 = load i32, i32* %a, align 4, !dbg !58
  %idxprom = sext i32 %7 to i64, !dbg !60
  %arrayidx = getelementptr inbounds [15 x i32], [15 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !60
  store i32 1, i32* %arrayidx, align 4, !dbg !61
  br label %if.end9, !dbg !62

if.else:                                          ; preds = %land.lhs.true, %for.end
  %8 = load i32, i32* %a, align 4, !dbg !63
  %idxprom7 = sext i32 %8 to i64, !dbg !65
  %arrayidx8 = getelementptr inbounds [15 x i32], [15 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !65
  store i32 1, i32* %arrayidx8, align 4, !dbg !66
  br label %if.end9

if.end9:                                          ; preds = %if.else, %if.then6
  %9 = load i32, i32* %retval, align 4, !dbg !67
  ret i32 %9, !dbg !67
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_18-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_18-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 480, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 15)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 11, scope: !9)
!20 = !DILocation(line: 9, column: 5, scope: !9)
!21 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 9, scope: !9)
!23 = !DILocation(line: 10, column: 14, scope: !9)
!24 = !DILocation(line: 10, column: 21, scope: !9)
!25 = !DILocation(line: 10, column: 27, scope: !9)
!26 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 12, type: !13)
!27 = !DILocation(line: 12, column: 6, scope: !9)
!28 = !DILocation(line: 12, column: 10, scope: !9)
!29 = !DILocalVariable(name: "i", scope: !30, file: !10, line: 13, type: !13)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 5)
!31 = !DILocation(line: 13, column: 13, scope: !30)
!32 = !DILocation(line: 13, column: 9, scope: !30)
!33 = !DILocation(line: 13, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 13, column: 5)
!35 = !DILocation(line: 13, column: 22, scope: !34)
!36 = !DILocation(line: 13, column: 5, scope: !30)
!37 = !DILocation(line: 14, column: 12, scope: !38)
!38 = distinct !DILexicalBlock(scope: !39, file: !10, line: 14, column: 12)
!39 = distinct !DILexicalBlock(scope: !34, file: !10, line: 13, column: 33)
!40 = !DILocation(line: 14, column: 14, scope: !38)
!41 = !DILocation(line: 14, column: 12, scope: !39)
!42 = !DILocation(line: 15, column: 13, scope: !43)
!43 = distinct !DILexicalBlock(scope: !38, file: !10, line: 14, column: 21)
!44 = !DILocation(line: 17, column: 10, scope: !39)
!45 = !DILocation(line: 18, column: 5, scope: !39)
!46 = !DILocation(line: 13, column: 29, scope: !34)
!47 = !DILocation(line: 13, column: 5, scope: !34)
!48 = distinct !{!48, !36, !49, !50}
!49 = !DILocation(line: 18, column: 5, scope: !30)
!50 = !{!"llvm.loop.mustprogress"}
!51 = !DILocation(line: 19, column: 8, scope: !52)
!52 = distinct !DILexicalBlock(scope: !9, file: !10, line: 19, column: 8)
!53 = !DILocation(line: 19, column: 10, scope: !52)
!54 = !DILocation(line: 19, column: 15, scope: !52)
!55 = !DILocation(line: 19, column: 18, scope: !52)
!56 = !DILocation(line: 19, column: 20, scope: !52)
!57 = !DILocation(line: 19, column: 8, scope: !9)
!58 = !DILocation(line: 21, column: 16, scope: !59)
!59 = distinct !DILexicalBlock(scope: !52, file: !10, line: 19, column: 27)
!60 = !DILocation(line: 21, column: 9, scope: !59)
!61 = !DILocation(line: 21, column: 19, scope: !59)
!62 = !DILocation(line: 22, column: 5, scope: !59)
!63 = !DILocation(line: 25, column: 16, scope: !64)
!64 = distinct !DILexicalBlock(scope: !52, file: !10, line: 23, column: 10)
!65 = !DILocation(line: 25, column: 9, scope: !64)
!66 = !DILocation(line: 25, column: 19, scope: !64)
!67 = !DILocation(line: 27, column: 1, scope: !9)
