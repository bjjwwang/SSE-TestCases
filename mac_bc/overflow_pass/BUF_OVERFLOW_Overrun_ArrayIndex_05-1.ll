; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_05-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_05-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.twoInts = type { i32, i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %data = alloca [3 x %struct.twoInts], align 16
  %source = alloca [5 x %struct.twoInts], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [3 x %struct.twoInts]* %data, metadata !15, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [5 x %struct.twoInts]* %source, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata i32* %i, metadata !29, metadata !DIExpression()), !dbg !31
  store i32 0, i32* %i, align 4, !dbg !31
  br label %for.cond, !dbg !32

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !33
  %cmp = icmp slt i32 %0, 5, !dbg !35
  br i1 %cmp, label %for.body, label %for.end, !dbg !36

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4, !dbg !37
  %idxprom = sext i32 %1 to i64, !dbg !39
  %arrayidx = getelementptr inbounds [5 x %struct.twoInts], [5 x %struct.twoInts]* %source, i64 0, i64 %idxprom, !dbg !39
  %zero = getelementptr inbounds %struct.twoInts, %struct.twoInts* %arrayidx, i32 0, i32 0, !dbg !40
  store i32 0, i32* %zero, align 8, !dbg !41
  %2 = load i32, i32* %i, align 4, !dbg !42
  %idxprom1 = sext i32 %2 to i64, !dbg !43
  %arrayidx2 = getelementptr inbounds [5 x %struct.twoInts], [5 x %struct.twoInts]* %source, i64 0, i64 %idxprom1, !dbg !43
  %one = getelementptr inbounds %struct.twoInts, %struct.twoInts* %arrayidx2, i32 0, i32 1, !dbg !44
  store i32 1, i32* %one, align 4, !dbg !45
  %3 = load i32, i32* %i, align 4, !dbg !46
  %idxprom3 = sext i32 %3 to i64, !dbg !47
  %arrayidx4 = getelementptr inbounds [3 x %struct.twoInts], [3 x %struct.twoInts]* %data, i64 0, i64 %idxprom3, !dbg !47
  %4 = load i32, i32* %i, align 4, !dbg !48
  %idxprom5 = sext i32 %4 to i64, !dbg !49
  %arrayidx6 = getelementptr inbounds [5 x %struct.twoInts], [5 x %struct.twoInts]* %source, i64 0, i64 %idxprom5, !dbg !49
  %5 = bitcast %struct.twoInts* %arrayidx4 to i8*, !dbg !49
  %6 = bitcast %struct.twoInts* %arrayidx6 to i8*, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %5, i8* align 8 %6, i64 8, i1 false), !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %7, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %8 = load i32, i32* %retval, align 4, !dbg !56
  ret i32 %8, !dbg !56
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_05-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 13, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 192, elements: !21)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "twoInts", file: !10, line: 7, size: 64, elements: !18)
!18 = !{!19, !20}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "zero", scope: !17, file: !10, line: 8, baseType: !13, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "one", scope: !17, file: !10, line: 9, baseType: !13, size: 32, offset: 32)
!21 = !{!22}
!22 = !DISubrange(count: 3)
!23 = !DILocation(line: 13, column: 17, scope: !9)
!24 = !DILocalVariable(name: "source", scope: !9, file: !10, line: 14, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 5)
!28 = !DILocation(line: 14, column: 17, scope: !9)
!29 = !DILocalVariable(name: "i", scope: !30, file: !10, line: 15, type: !13)
!30 = distinct !DILexicalBlock(scope: !9, file: !10, line: 15, column: 2)
!31 = !DILocation(line: 15, column: 11, scope: !30)
!32 = !DILocation(line: 15, column: 7, scope: !30)
!33 = !DILocation(line: 15, column: 18, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !10, line: 15, column: 2)
!35 = !DILocation(line: 15, column: 20, scope: !34)
!36 = !DILocation(line: 15, column: 2, scope: !30)
!37 = !DILocation(line: 16, column: 10, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !10, line: 15, column: 30)
!39 = !DILocation(line: 16, column: 3, scope: !38)
!40 = !DILocation(line: 16, column: 13, scope: !38)
!41 = !DILocation(line: 16, column: 18, scope: !38)
!42 = !DILocation(line: 17, column: 10, scope: !38)
!43 = !DILocation(line: 17, column: 3, scope: !38)
!44 = !DILocation(line: 17, column: 13, scope: !38)
!45 = !DILocation(line: 17, column: 17, scope: !38)
!46 = !DILocation(line: 18, column: 8, scope: !38)
!47 = !DILocation(line: 18, column: 3, scope: !38)
!48 = !DILocation(line: 18, column: 20, scope: !38)
!49 = !DILocation(line: 18, column: 13, scope: !38)
!50 = !DILocation(line: 19, column: 2, scope: !38)
!51 = !DILocation(line: 15, column: 26, scope: !34)
!52 = !DILocation(line: 15, column: 2, scope: !34)
!53 = distinct !{!53, !36, !54, !55}
!54 = !DILocation(line: 19, column: 2, scope: !30)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 20, column: 1, scope: !9)
