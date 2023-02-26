; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_26-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_26-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [5 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [5 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %a, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #4, !dbg !23
  %rem = srem i32 %call1, 51, !dbg !24
  store i32 %rem, i32* %a, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %b, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load i32, i32* %a, align 4, !dbg !27
  store i32 %0, i32* %b, align 4, !dbg !26
  br label %loopStart, !dbg !28

loopStart:                                        ; preds = %if.then, %entry
  call void @llvm.dbg.label(metadata !29), !dbg !30
  br label %do.body, !dbg !31

do.body:                                          ; preds = %do.cond, %loopStart
  %1 = load i32, i32* %a, align 4, !dbg !32
  %2 = load i32, i32* %b, align 4, !dbg !35
  %cmp = icmp eq i32 %1, %2, !dbg !36
  br i1 %cmp, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %do.body
  %3 = load i32, i32* %a, align 4, !dbg !38
  %inc = add nsw i32 %3, 1, !dbg !38
  store i32 %inc, i32* %a, align 4, !dbg !38
  br label %loopStart, !dbg !40

if.end:                                           ; preds = %do.body
  %4 = load i32, i32* %a, align 4, !dbg !41
  %inc2 = add nsw i32 %4, 1, !dbg !41
  store i32 %inc2, i32* %a, align 4, !dbg !41
  %5 = load i32, i32* %b, align 4, !dbg !42
  %inc3 = add nsw i32 %5, 1, !dbg !42
  store i32 %inc3, i32* %b, align 4, !dbg !42
  br label %do.cond, !dbg !43

do.cond:                                          ; preds = %if.end
  %6 = load i32, i32* %a, align 4, !dbg !44
  %cmp4 = icmp slt i32 %6, 15, !dbg !45
  br i1 %cmp4, label %do.body, label %do.end, !dbg !43, !llvm.loop !46

do.end:                                           ; preds = %do.cond
  %7 = load i32, i32* %b, align 4, !dbg !49
  %8 = load i32, i32* %a, align 4, !dbg !51
  %sub = sub nsw i32 %8, 1, !dbg !52
  %cmp5 = icmp eq i32 %7, %sub, !dbg !53
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !54

if.then6:                                         ; preds = %do.end
  %arrayidx = getelementptr inbounds [5 x i32], [5 x i32]* %buffer, i64 0, i64 5, !dbg !55
  store i32 1, i32* %arrayidx, align 4, !dbg !57
  br label %if.end7, !dbg !58

if.end7:                                          ; preds = %if.then6, %do.end
  %9 = load i32, i32* %retval, align 4, !dbg !59
  ret i32 %9, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_26-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_26-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 5)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 8, scope: !9)
!20 = !DILocation(line: 9, column: 2, scope: !9)
!21 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 6, scope: !9)
!23 = !DILocation(line: 10, column: 10, scope: !9)
!24 = !DILocation(line: 10, column: 17, scope: !9)
!25 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 11, type: !13)
!26 = !DILocation(line: 11, column: 6, scope: !9)
!27 = !DILocation(line: 11, column: 10, scope: !9)
!28 = !DILocation(line: 11, column: 2, scope: !9)
!29 = !DILabel(scope: !9, name: "loopStart", file: !10, line: 12)
!30 = !DILocation(line: 12, column: 2, scope: !9)
!31 = !DILocation(line: 12, column: 13, scope: !9)
!32 = !DILocation(line: 13, column: 6, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !10, line: 13, column: 6)
!34 = distinct !DILexicalBlock(scope: !9, file: !10, line: 12, column: 16)
!35 = !DILocation(line: 13, column: 11, scope: !33)
!36 = !DILocation(line: 13, column: 8, scope: !33)
!37 = !DILocation(line: 13, column: 6, scope: !34)
!38 = !DILocation(line: 14, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !33, file: !10, line: 13, column: 14)
!40 = !DILocation(line: 15, column: 4, scope: !39)
!41 = !DILocation(line: 17, column: 4, scope: !34)
!42 = !DILocation(line: 18, column: 4, scope: !34)
!43 = !DILocation(line: 19, column: 2, scope: !34)
!44 = !DILocation(line: 19, column: 10, scope: !9)
!45 = !DILocation(line: 19, column: 12, scope: !9)
!46 = distinct !{!46, !31, !47, !48}
!47 = !DILocation(line: 19, column: 16, scope: !9)
!48 = !{!"llvm.loop.mustprogress"}
!49 = !DILocation(line: 21, column: 5, scope: !50)
!50 = distinct !DILexicalBlock(scope: !9, file: !10, line: 21, column: 5)
!51 = !DILocation(line: 21, column: 10, scope: !50)
!52 = !DILocation(line: 21, column: 12, scope: !50)
!53 = !DILocation(line: 21, column: 7, scope: !50)
!54 = !DILocation(line: 21, column: 5, scope: !9)
!55 = !DILocation(line: 22, column: 3, scope: !56)
!56 = distinct !DILexicalBlock(scope: !50, file: !10, line: 21, column: 17)
!57 = !DILocation(line: 22, column: 13, scope: !56)
!58 = !DILocation(line: 23, column: 2, scope: !56)
!59 = !DILocation(line: 24, column: 1, scope: !9)
