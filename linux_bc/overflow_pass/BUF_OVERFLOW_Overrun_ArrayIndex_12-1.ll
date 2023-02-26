; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_12-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_12-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca i32*, align 8
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32** %buffer, metadata !14, metadata !DIExpression()), !dbg !16
  %call = call noalias align 16 i8* @malloc(i64 28) #4, !dbg !17
  %0 = bitcast i8* %call to i32*, !dbg !17
  store i32* %0, i32** %buffer, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata i32* %a, metadata !18, metadata !DIExpression()), !dbg !19
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %a), !dbg !20
  %1 = load i32, i32* %a, align 4, !dbg !21
  %cmp = icmp sgt i32 %1, 5, !dbg !23
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !24

land.lhs.true:                                    ; preds = %entry
  %2 = load i32, i32* %a, align 4, !dbg !25
  %cmp2 = icmp slt i32 %2, 7, !dbg !26
  br i1 %cmp2, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %land.lhs.true
  %3 = load i32*, i32** %buffer, align 8, !dbg !28
  %4 = load i32, i32* %a, align 4, !dbg !30
  %idxprom = sext i32 %4 to i64, !dbg !28
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 %idxprom, !dbg !28
  store i32 1, i32* %arrayidx, align 4, !dbg !31
  br label %if.end, !dbg !32

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %5 = load i32, i32* %a, align 4, !dbg !33
  %cmp3 = icmp sgt i32 %5, 5, !dbg !35
  br i1 %cmp3, label %land.lhs.true4, label %if.end9, !dbg !36

land.lhs.true4:                                   ; preds = %if.end
  %6 = load i32, i32* %a, align 4, !dbg !37
  %cmp5 = icmp slt i32 %6, 8, !dbg !38
  br i1 %cmp5, label %if.then6, label %if.end9, !dbg !39

if.then6:                                         ; preds = %land.lhs.true4
  %7 = load i32*, i32** %buffer, align 8, !dbg !40
  %8 = load i32, i32* %a, align 4, !dbg !42
  %idxprom7 = sext i32 %8 to i64, !dbg !40
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 %idxprom7, !dbg !40
  store i32 1, i32* %arrayidx8, align 4, !dbg !43
  br label %if.end9, !dbg !44

if.end9:                                          ; preds = %if.then6, %land.lhs.true4, %if.end
  %9 = load i32, i32* %retval, align 4, !dbg !45
  ret i32 %9, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_12-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_12-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!16 = !DILocation(line: 8, column: 7, scope: !9)
!17 = !DILocation(line: 8, column: 16, scope: !9)
!18 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 9, type: !13)
!19 = !DILocation(line: 9, column: 6, scope: !9)
!20 = !DILocation(line: 10, column: 2, scope: !9)
!21 = !DILocation(line: 11, column: 8, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !10, line: 11, column: 8)
!23 = !DILocation(line: 11, column: 10, scope: !22)
!24 = !DILocation(line: 11, column: 14, scope: !22)
!25 = !DILocation(line: 11, column: 17, scope: !22)
!26 = !DILocation(line: 11, column: 19, scope: !22)
!27 = !DILocation(line: 11, column: 8, scope: !9)
!28 = !DILocation(line: 12, column: 3, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !10, line: 11, column: 24)
!30 = !DILocation(line: 12, column: 10, scope: !29)
!31 = !DILocation(line: 12, column: 13, scope: !29)
!32 = !DILocation(line: 13, column: 5, scope: !29)
!33 = !DILocation(line: 14, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !9, file: !10, line: 14, column: 5)
!35 = !DILocation(line: 14, column: 7, scope: !34)
!36 = !DILocation(line: 14, column: 11, scope: !34)
!37 = !DILocation(line: 14, column: 14, scope: !34)
!38 = !DILocation(line: 14, column: 16, scope: !34)
!39 = !DILocation(line: 14, column: 5, scope: !9)
!40 = !DILocation(line: 15, column: 3, scope: !41)
!41 = distinct !DILexicalBlock(scope: !34, file: !10, line: 14, column: 21)
!42 = !DILocation(line: 15, column: 10, scope: !41)
!43 = !DILocation(line: 15, column: 13, scope: !41)
!44 = !DILocation(line: 16, column: 2, scope: !41)
!45 = !DILocation(line: 17, column: 1, scope: !9)
