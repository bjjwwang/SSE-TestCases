; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_25-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_25-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"Value:%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %buffer = alloca [8 x i32], align 16
  %randomNumber = alloca i32, align 4
  %i = alloca i32, align 4
  call void @llvm.dbg.declare(metadata [8 x i32]* %buffer, metadata !14, metadata !DIExpression()), !dbg !18
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !19
  call void @srand(i32 %call) #4, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !21, metadata !DIExpression()), !dbg !22
  %call1 = call i32 @rand() #4, !dbg !23
  %rem = srem i32 %call1, 999, !dbg !24
  store i32 %rem, i32* %randomNumber, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata i32* %i, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load i32, i32* %randomNumber, align 4, !dbg !27
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 %0), !dbg !28
  store i32 %call2, i32* %i, align 4, !dbg !26
  %1 = load i32, i32* %i, align 4, !dbg !29
  %idxprom = sext i32 %1 to i64, !dbg !30
  %arrayidx = getelementptr inbounds [8 x i32], [8 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !30
  store i32 1, i32* %arrayidx, align 4, !dbg !31
  ret i32 0, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

declare dso_local i32 @printf(i8*, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_25-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 7, type: !11, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_25-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 8, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 8)
!18 = !DILocation(line: 8, column: 6, scope: !9)
!19 = !DILocation(line: 9, column: 11, scope: !9)
!20 = !DILocation(line: 9, column: 5, scope: !9)
!21 = !DILocalVariable(name: "randomNumber", scope: !9, file: !10, line: 10, type: !13)
!22 = !DILocation(line: 10, column: 6, scope: !9)
!23 = !DILocation(line: 10, column: 21, scope: !9)
!24 = !DILocation(line: 10, column: 28, scope: !9)
!25 = !DILocalVariable(name: "i", scope: !9, file: !10, line: 11, type: !13)
!26 = !DILocation(line: 11, column: 6, scope: !9)
!27 = !DILocation(line: 11, column: 29, scope: !9)
!28 = !DILocation(line: 11, column: 10, scope: !9)
!29 = !DILocation(line: 13, column: 9, scope: !9)
!30 = !DILocation(line: 13, column: 2, scope: !9)
!31 = !DILocation(line: 13, column: 12, scope: !9)
!32 = !DILocation(line: 14, column: 1, scope: !9)
