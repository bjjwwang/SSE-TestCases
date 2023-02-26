; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_13-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_13-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i32* %a, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %a), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %b, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 10, i32* %b, align 4, !dbg !23
  %0 = load i32, i32* %b, align 4, !dbg !24
  %1 = load i32, i32* %a, align 4, !dbg !25
  %div = sdiv i32 %0, %1, !dbg !26
  store i32 %div, i32* %b, align 4, !dbg !27
  %2 = load i32, i32* %a, align 4, !dbg !28
  %cmp = icmp sgt i32 %2, 0, !dbg !30
  br i1 %cmp, label %if.then, label %if.else5, !dbg !31

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %a, align 4, !dbg !32
  %cmp1 = icmp sle i32 %3, 5, !dbg !35
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !36

if.then2:                                         ; preds = %if.then
  %4 = load i32, i32* %b, align 4, !dbg !37
  %idxprom = sext i32 %4 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !39
  store i32 1, i32* %arrayidx, align 4, !dbg !40
  br label %if.end, !dbg !41

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* %b, align 4, !dbg !42
  %idxprom3 = sext i32 %5 to i64, !dbg !44
  %arrayidx4 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom3, !dbg !44
  store i32 1, i32* %arrayidx4, align 4, !dbg !45
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end8, !dbg !46

if.else5:                                         ; preds = %entry
  %6 = load i32, i32* %b, align 4, !dbg !47
  %idxprom6 = sext i32 %6 to i64, !dbg !49
  %arrayidx7 = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom6, !dbg !49
  store i32 1, i32* %arrayidx7, align 4, !dbg !50
  br label %if.end8

if.end8:                                          ; preds = %if.else5, %if.end
  %7 = load i32, i32* %retval, align 4, !dbg !51
  ret i32 %7, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_13-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_13-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 10)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!20 = !DILocation(line: 9, column: 6, scope: !9)
!21 = !DILocation(line: 10, column: 2, scope: !9)
!22 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 11, type: !13)
!23 = !DILocation(line: 11, column: 9, scope: !9)
!24 = !DILocation(line: 12, column: 9, scope: !9)
!25 = !DILocation(line: 12, column: 13, scope: !9)
!26 = !DILocation(line: 12, column: 11, scope: !9)
!27 = !DILocation(line: 12, column: 7, scope: !9)
!28 = !DILocation(line: 13, column: 8, scope: !29)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 13, column: 8)
!30 = !DILocation(line: 13, column: 10, scope: !29)
!31 = !DILocation(line: 13, column: 8, scope: !9)
!32 = !DILocation(line: 14, column: 6, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !10, line: 14, column: 6)
!34 = distinct !DILexicalBlock(scope: !29, file: !10, line: 13, column: 15)
!35 = !DILocation(line: 14, column: 8, scope: !33)
!36 = !DILocation(line: 14, column: 6, scope: !34)
!37 = !DILocation(line: 16, column: 11, scope: !38)
!38 = distinct !DILexicalBlock(scope: !33, file: !10, line: 14, column: 14)
!39 = !DILocation(line: 16, column: 4, scope: !38)
!40 = !DILocation(line: 16, column: 14, scope: !38)
!41 = !DILocation(line: 17, column: 3, scope: !38)
!42 = !DILocation(line: 20, column: 11, scope: !43)
!43 = distinct !DILexicalBlock(scope: !33, file: !10, line: 18, column: 8)
!44 = !DILocation(line: 20, column: 4, scope: !43)
!45 = !DILocation(line: 20, column: 14, scope: !43)
!46 = !DILocation(line: 22, column: 5, scope: !34)
!47 = !DILocation(line: 24, column: 10, scope: !48)
!48 = distinct !DILexicalBlock(scope: !29, file: !10, line: 23, column: 7)
!49 = !DILocation(line: 24, column: 3, scope: !48)
!50 = !DILocation(line: 24, column: 13, scope: !48)
!51 = !DILocation(line: 26, column: 1, scope: !9)
