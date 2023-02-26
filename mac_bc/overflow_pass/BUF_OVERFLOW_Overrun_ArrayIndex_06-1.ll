; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_06-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_06-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.ints1 = type { [10 x i32] }
%struct.ints2 = type { [5 x i32] }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.ints1, align 4
  %b = alloca %struct.ints2, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.ints1* %a, metadata !15, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata %struct.ints2* %b, metadata !23, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !31, metadata !DIExpression()), !dbg !33
  store i32 0, i32* %i, align 4, !dbg !33
  br label %for.cond, !dbg !34

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !35
  %cmp = icmp slt i32 %0, 10, !dbg !37
  br i1 %cmp, label %for.body, label %for.end, !dbg !38

for.body:                                         ; preds = %for.cond
  %zero = getelementptr inbounds %struct.ints1, %struct.ints1* %a, i32 0, i32 0, !dbg !39
  %1 = load i32, i32* %i, align 4, !dbg !41
  %idxprom = sext i32 %1 to i64, !dbg !42
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %zero, i64 0, i64 %idxprom, !dbg !42
  store i32 1, i32* %arrayidx, align 4, !dbg !43
  %zero1 = getelementptr inbounds %struct.ints1, %struct.ints1* %a, i32 0, i32 0, !dbg !44
  %2 = load i32, i32* %i, align 4, !dbg !45
  %idxprom2 = sext i32 %2 to i64, !dbg !46
  %arrayidx3 = getelementptr inbounds [10 x i32], [10 x i32]* %zero1, i64 0, i64 %idxprom2, !dbg !46
  %3 = load i32, i32* %arrayidx3, align 4, !dbg !46
  %zero4 = getelementptr inbounds %struct.ints2, %struct.ints2* %b, i32 0, i32 0, !dbg !47
  %4 = load i32, i32* %i, align 4, !dbg !48
  %idxprom5 = sext i32 %4 to i64, !dbg !49
  %arrayidx6 = getelementptr inbounds [5 x i32], [5 x i32]* %zero4, i64 0, i64 %idxprom5, !dbg !49
  store i32 %3, i32* %arrayidx6, align 4, !dbg !50
  br label %for.inc, !dbg !51

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4, !dbg !52
  %inc = add nsw i32 %5, 1, !dbg !52
  store i32 %inc, i32* %i, align 4, !dbg !52
  br label %for.cond, !dbg !53, !llvm.loop !54

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %retval, align 4, !dbg !57
  ret i32 %6, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 15, type: !11, scopeLine: 15, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_06-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 16, type: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ints1", file: !10, line: 7, size: 320, elements: !17)
!17 = !{!18}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "zero", scope: !16, file: !10, line: 8, baseType: !19, size: 320)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 10)
!22 = !DILocation(line: 16, column: 15, scope: !9)
!23 = !DILocalVariable(name: "b", scope: !9, file: !10, line: 17, type: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ints2", file: !10, line: 11, size: 160, elements: !25)
!25 = !{!26}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "zero", scope: !24, file: !10, line: 12, baseType: !27, size: 160)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 160, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 5)
!30 = !DILocation(line: 17, column: 15, scope: !9)
!31 = !DILocalVariable(name: "i", scope: !32, file: !10, line: 18, type: !13)
!32 = distinct !DILexicalBlock(scope: !9, file: !10, line: 18, column: 2)
!33 = !DILocation(line: 18, column: 11, scope: !32)
!34 = !DILocation(line: 18, column: 7, scope: !32)
!35 = !DILocation(line: 18, column: 18, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !10, line: 18, column: 2)
!37 = !DILocation(line: 18, column: 20, scope: !36)
!38 = !DILocation(line: 18, column: 2, scope: !32)
!39 = !DILocation(line: 19, column: 5, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !10, line: 18, column: 31)
!41 = !DILocation(line: 19, column: 10, scope: !40)
!42 = !DILocation(line: 19, column: 3, scope: !40)
!43 = !DILocation(line: 19, column: 13, scope: !40)
!44 = !DILocation(line: 20, column: 17, scope: !40)
!45 = !DILocation(line: 20, column: 22, scope: !40)
!46 = !DILocation(line: 20, column: 15, scope: !40)
!47 = !DILocation(line: 20, column: 5, scope: !40)
!48 = !DILocation(line: 20, column: 10, scope: !40)
!49 = !DILocation(line: 20, column: 3, scope: !40)
!50 = !DILocation(line: 20, column: 13, scope: !40)
!51 = !DILocation(line: 21, column: 2, scope: !40)
!52 = !DILocation(line: 18, column: 27, scope: !36)
!53 = !DILocation(line: 18, column: 2, scope: !36)
!54 = distinct !{!54, !38, !55, !56}
!55 = !DILocation(line: 21, column: 2, scope: !32)
!56 = !{!"llvm.loop.mustprogress"}
!57 = !DILocation(line: 22, column: 1, scope: !9)
