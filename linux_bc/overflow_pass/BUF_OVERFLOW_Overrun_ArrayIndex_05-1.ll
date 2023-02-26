; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_05-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_05-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.twoInts = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %data = alloca [3 x %struct.twoInts], align 16
  %source = alloca [5 x %struct.twoInts], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x %struct.twoInts]* %data, metadata !14, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [5 x %struct.twoInts]* %source, metadata !23, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32* %i, metadata !28, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %i, align 4, !dbg !30
  br label %for.cond, !dbg !31

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !32
  %cmp = icmp slt i32 %0, 5, !dbg !34
  br i1 %cmp, label %for.body, label %for.end, !dbg !35

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !36
  %idxprom = sext i32 %1 to i64, !dbg !38
  %arrayidx = getelementptr inbounds [5 x %struct.twoInts], [5 x %struct.twoInts]* %source, i64 0, i64 %idxprom, !dbg !38
  %zero = getelementptr inbounds %struct.twoInts, %struct.twoInts* %arrayidx, i32 0, i32 0, !dbg !39
  store i32 0, i32* %zero, align 8, !dbg !40
  %2 = load i32, i32* %i, align 4, !dbg !41
  %idxprom1 = sext i32 %2 to i64, !dbg !42
  %arrayidx2 = getelementptr inbounds [5 x %struct.twoInts], [5 x %struct.twoInts]* %source, i64 0, i64 %idxprom1, !dbg !42
  %one = getelementptr inbounds %struct.twoInts, %struct.twoInts* %arrayidx2, i32 0, i32 1, !dbg !43
  store i32 1, i32* %one, align 4, !dbg !44
  %3 = load i32, i32* %i, align 4, !dbg !45
  %idxprom3 = sext i32 %3 to i64, !dbg !46
  %arrayidx4 = getelementptr inbounds [3 x %struct.twoInts], [3 x %struct.twoInts]* %data, i64 0, i64 %idxprom3, !dbg !46
  %4 = load i32, i32* %i, align 4, !dbg !47
  %idxprom5 = sext i32 %4 to i64, !dbg !48
  %arrayidx6 = getelementptr inbounds [5 x %struct.twoInts], [5 x %struct.twoInts]* %source, i64 0, i64 %idxprom5, !dbg !48
  %5 = bitcast %struct.twoInts* %arrayidx4 to i8*, !dbg !48
  %6 = bitcast %struct.twoInts* %arrayidx6 to i8*, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 8 %6, i64 8, i1 false), !dbg !48
  br label %for.inc, !dbg !49

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !50
  %inc = add nsw i32 %7, 1, !dbg !50
  store i32 %inc, i32* %i, align 4, !dbg !50
  br label %for.cond, !dbg !51, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %retval, align 4, !dbg !55
  ret i32 %8, !dbg !55
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_05-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_05-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 13, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 192, elements: !20)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "twoInts", file: !10, line: 7, size: 64, elements: !17)
!17 = !{!18, !19}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "zero", scope: !16, file: !10, line: 8, baseType: !13, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "one", scope: !16, file: !10, line: 9, baseType: !13, size: 32, offset: 32)
!20 = !{!21}
!21 = !DISubrange(count: 3)
!22 = !DILocation(line: 13, column: 17, scope: !9)
!23 = !DILocalVariable(name: "source", scope: !9, file: !10, line: 14, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 5)
!27 = !DILocation(line: 14, column: 17, scope: !9)
!28 = !DILocalVariable(name: "i", scope: !29, file: !10, line: 15, type: !13)
!29 = distinct !DILexicalBlock(scope: !9, file: !10, line: 15, column: 2)
!30 = !DILocation(line: 15, column: 11, scope: !29)
!31 = !DILocation(line: 15, column: 7, scope: !29)
!32 = !DILocation(line: 15, column: 18, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !10, line: 15, column: 2)
!34 = !DILocation(line: 15, column: 20, scope: !33)
!35 = !DILocation(line: 15, column: 2, scope: !29)
!36 = !DILocation(line: 16, column: 10, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !10, line: 15, column: 30)
!38 = !DILocation(line: 16, column: 3, scope: !37)
!39 = !DILocation(line: 16, column: 13, scope: !37)
!40 = !DILocation(line: 16, column: 18, scope: !37)
!41 = !DILocation(line: 17, column: 10, scope: !37)
!42 = !DILocation(line: 17, column: 3, scope: !37)
!43 = !DILocation(line: 17, column: 13, scope: !37)
!44 = !DILocation(line: 17, column: 17, scope: !37)
!45 = !DILocation(line: 18, column: 8, scope: !37)
!46 = !DILocation(line: 18, column: 3, scope: !37)
!47 = !DILocation(line: 18, column: 20, scope: !37)
!48 = !DILocation(line: 18, column: 13, scope: !37)
!49 = !DILocation(line: 19, column: 2, scope: !37)
!50 = !DILocation(line: 15, column: 26, scope: !33)
!51 = !DILocation(line: 15, column: 2, scope: !33)
!52 = distinct !{!52, !35, !53, !54}
!53 = !DILocation(line: 19, column: 2, scope: !29)
!54 = !{!"llvm.loop.mustprogress"}
!55 = !DILocation(line: 20, column: 1, scope: !9)
