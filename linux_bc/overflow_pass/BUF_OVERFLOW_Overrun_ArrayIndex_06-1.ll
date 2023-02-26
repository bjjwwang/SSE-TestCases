; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_06-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_06-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ints1 = type { [10 x i32] }
%struct.ints2 = type { [5 x i32] }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.ints1, align 4
  %b = alloca %struct.ints2, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.ints1* %a, metadata !14, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata %struct.ints2* %b, metadata !22, metadata !DIExpression()), !dbg !29
  call void @llvm.dbg.declare(metadata i32* %i, metadata !30, metadata !DIExpression()), !dbg !32
  store i32 0, i32* %i, align 4, !dbg !32
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !34
  %cmp = icmp slt i32 %0, 10, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  %zero = getelementptr inbounds %struct.ints1, %struct.ints1* %a, i32 0, i32 0, !dbg !38
  %1 = load i32, i32* %i, align 4, !dbg !40
  %idxprom = sext i32 %1 to i64, !dbg !41
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %zero, i64 0, i64 %idxprom, !dbg !41
  store i32 1, i32* %arrayidx, align 4, !dbg !42
  %zero1 = getelementptr inbounds %struct.ints1, %struct.ints1* %a, i32 0, i32 0, !dbg !43
  %2 = load i32, i32* %i, align 4, !dbg !44
  %idxprom2 = sext i32 %2 to i64, !dbg !45
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %zero1, i64 0, i64 %idxprom2, !dbg !45
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !45
  %zero4 = getelementptr inbounds %struct.ints2, %struct.ints2* %b, i32 0, i32 0, !dbg !46
  %4 = load i32, i32* %i, align 4, !dbg !47
  %idxprom5 = sext i32 %4 to i64, !dbg !48
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %zero4, i64 0, i64 %idxprom5, !dbg !48
  store i32 %3, i32* %arrayidx6, align 4, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %5, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %retval, align 4, !dbg !56
  ret i32 %6, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_06-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !11, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_06-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 16, type: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ints1", file: !10, line: 7, size: 320, elements: !16)
!16 = !{!17}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "zero", scope: !15, file: !10, line: 8, baseType: !18, size: 320)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 10)
!21 = !DILocation(line: 16, column: 15, scope: !9)
!22 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 17, type: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ints2", file: !10, line: 11, size: 160, elements: !24)
!24 = !{!25}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "zero", scope: !23, file: !10, line: 12, baseType: !26, size: 160)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 5)
!29 = !DILocation(line: 17, column: 15, scope: !9)
!30 = !DILocalVariable(name: "i", scope: !31, file: !10, line: 18, type: !13)
!31 = distinct !DILexicalBlock(scope: !9, file: !10, line: 18, column: 2)
!32 = !DILocation(line: 18, column: 11, scope: !31)
!33 = !DILocation(line: 18, column: 7, scope: !31)
!34 = !DILocation(line: 18, column: 18, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !10, line: 18, column: 2)
!36 = !DILocation(line: 18, column: 20, scope: !35)
!37 = !DILocation(line: 18, column: 2, scope: !31)
!38 = !DILocation(line: 19, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !35, file: !10, line: 18, column: 31)
!40 = !DILocation(line: 19, column: 10, scope: !39)
!41 = !DILocation(line: 19, column: 3, scope: !39)
!42 = !DILocation(line: 19, column: 13, scope: !39)
!43 = !DILocation(line: 20, column: 17, scope: !39)
!44 = !DILocation(line: 20, column: 22, scope: !39)
!45 = !DILocation(line: 20, column: 15, scope: !39)
!46 = !DILocation(line: 20, column: 5, scope: !39)
!47 = !DILocation(line: 20, column: 10, scope: !39)
!48 = !DILocation(line: 20, column: 3, scope: !39)
!49 = !DILocation(line: 20, column: 13, scope: !39)
!50 = !DILocation(line: 21, column: 2, scope: !39)
!51 = !DILocation(line: 18, column: 27, scope: !35)
!52 = !DILocation(line: 18, column: 2, scope: !35)
!53 = distinct !{!53, !37, !54, !55}
!54 = !DILocation(line: 21, column: 2, scope: !31)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 22, column: 1, scope: !9)
