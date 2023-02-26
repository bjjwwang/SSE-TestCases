; ModuleID = 'linux_bc/overflow_pass/INTERVAL_Overrun_ArrayIndex_02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%2d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %num = alloca i32, align 4
  %buffer = alloca [2 x i32], align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %num, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %num, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata [2 x i32]* %buffer, metadata !16, metadata !DIExpression()), !dbg !20
  %call = call i32 (i8*, ...) @scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32* %num), !dbg !21
  %0 = load i32, i32* %num, align 4, !dbg !22
  %cmp = icmp sgt i32 %0, 99, !dbg !24
  br i1 %cmp, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 0, !dbg !26
  store i32 1, i32* %arrayidx, align 4, !dbg !28
  br label %if.end, !dbg !29

if.else:                                          ; preds = %entry
  %arrayidx1 = getelementptr inbounds [2 x i32], [2 x i32]* %buffer, i64 0, i64 2, !dbg !30
  store i32 1, i32* %arrayidx1, align 4, !dbg !32
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %retval, align 4, !dbg !33
  ret i32 %1, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @scanf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/INTERVAL_Overrun_ArrayIndex_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 1, type: !11, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/INTERVAL_Overrun_ArrayIndex_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "num", scope: !9, file: !10, line: 2, type: !13)
!15 = !DILocation(line: 2, column: 9, scope: !9)
!16 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 3, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !18)
!18 = !{!19}
!19 = !DISubrange(count: 2)
!20 = !DILocation(line: 3, column: 9, scope: !9)
!21 = !DILocation(line: 4, column: 5, scope: !9)
!22 = !DILocation(line: 6, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !9, file: !10, line: 6, column: 9)
!24 = !DILocation(line: 6, column: 13, scope: !23)
!25 = !DILocation(line: 6, column: 9, scope: !9)
!26 = !DILocation(line: 7, column: 9, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !10, line: 6, column: 19)
!28 = !DILocation(line: 7, column: 19, scope: !27)
!29 = !DILocation(line: 8, column: 5, scope: !27)
!30 = !DILocation(line: 10, column: 9, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !10, line: 9, column: 10)
!32 = !DILocation(line: 10, column: 19, scope: !31)
!33 = !DILocation(line: 12, column: 1, scope: !9)
