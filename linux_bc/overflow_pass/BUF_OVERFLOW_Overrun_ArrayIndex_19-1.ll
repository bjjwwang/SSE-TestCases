; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_19-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_19-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [2 x i32], align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
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
  %cmp = icmp slt i32 %1, 3, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %b, align 4, !dbg !37
  %3 = load i32, i32* %a, align 4, !dbg !39
  %mul = mul nsw i32 %2, %3, !dbg !40
  store i32 %mul, i32* %b, align 4, !dbg !41
  br label %for.inc, !dbg !42

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4, !dbg !43
  %inc = add nsw i32 %4, 1, !dbg !43
  store i32 %inc, i32* %i, align 4, !dbg !43
  br label %for.cond, !dbg !44, !llvm.loop !45

for.end:                                          ; preds = %for.cond
  %5 = load i32, i32* %b, align 4, !dbg !48
  %cmp2 = icmp sge i32 %5, 0, !dbg !50
  br i1 %cmp2, label %if.then, label %if.else, !dbg !51

if.then:                                          ; preds = %for.end
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 2, !dbg !52
  store i32 1, i32* %arrayidx, align 4, !dbg !54
  br label %if.end, !dbg !55

if.else:                                          ; preds = %for.end
  %arrayidx3 = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 2, !dbg !56
  store i32 1, i32* %arrayidx3, align 4, !dbg !58
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !59
  ret i32 %6, !dbg !59
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_19-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_19-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 2)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 11, scope: !9)
!20 = !DILocation(line: 9, column: 5, scope: !9)
!21 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 9, scope: !9)
!23 = !DILocation(line: 10, column: 14, scope: !9)
!24 = !DILocation(line: 10, column: 21, scope: !9)
!25 = !DILocation(line: 10, column: 27, scope: !9)
!26 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 12, type: !13)
!27 = !DILocation(line: 12, column: 9, scope: !9)
!28 = !DILocation(line: 12, column: 13, scope: !9)
!29 = !DILocalVariable(name: "i", scope: !30, file: !10, line: 13, type: !13)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 5)
!31 = !DILocation(line: 13, column: 13, scope: !30)
!32 = !DILocation(line: 13, column: 9, scope: !30)
!33 = !DILocation(line: 13, column: 20, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 13, column: 5)
!35 = !DILocation(line: 13, column: 22, scope: !34)
!36 = !DILocation(line: 13, column: 5, scope: !30)
!37 = !DILocation(line: 14, column: 13, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 13, column: 32)
!39 = !DILocation(line: 14, column: 17, scope: !38)
!40 = !DILocation(line: 14, column: 15, scope: !38)
!41 = !DILocation(line: 14, column: 11, scope: !38)
!42 = !DILocation(line: 15, column: 5, scope: !38)
!43 = !DILocation(line: 13, column: 28, scope: !34)
!44 = !DILocation(line: 13, column: 5, scope: !34)
!45 = distinct !{!45, !36, !46, !47}
!46 = !DILocation(line: 15, column: 5, scope: !30)
!47 = !{!"llvm.loop.mustprogress"}
!48 = !DILocation(line: 17, column: 5, scope: !49)
!49 = distinct !DILexicalBlock(scope: !9, file: !10, line: 17, column: 5)
!50 = !DILocation(line: 17, column: 7, scope: !49)
!51 = !DILocation(line: 17, column: 5, scope: !9)
!52 = !DILocation(line: 18, column: 3, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !10, line: 17, column: 13)
!54 = !DILocation(line: 18, column: 13, scope: !53)
!55 = !DILocation(line: 19, column: 2, scope: !53)
!56 = !DILocation(line: 21, column: 3, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !10, line: 20, column: 10)
!58 = !DILocation(line: 21, column: 13, scope: !57)
!59 = !DILocation(line: 23, column: 1, scope: !9)
