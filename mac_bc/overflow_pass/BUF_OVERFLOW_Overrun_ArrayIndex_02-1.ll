; ModuleID = 'mac_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%union.unionType = type { i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %myUnion = alloca %union.unionType, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata %union.unionType* %myUnion, metadata !15, metadata !DIExpression()), !dbg !21
  %unionFirst = bitcast %union.unionType* %myUnion to i32*, !dbg !22
  store i32 10, i32* %unionFirst, align 4, !dbg !23
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !24, metadata !DIExpression()), !dbg !28
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !28
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !28
  %unionSecond = bitcast %union.unionType* %myUnion to i32*, !dbg !29
  %1 = load i32, i32* %unionSecond, align 4, !dbg !29
  %idxprom = sext i32 %1 to i64, !dbg !30
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !30
  store i32 1, i32* %arrayidx, align 4, !dbg !31
  ret i32 0, !dbg !32
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_02-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "myUnion", scope: !9, file: !10, line: 13, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "unionType", file: !10, line: 10, baseType: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !10, line: 7, size: 32, elements: !18)
!18 = !{!19, !20}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !17, file: !10, line: 8, baseType: !13, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !17, file: !10, line: 9, baseType: !13, size: 32)
!21 = !DILocation(line: 13, column: 12, scope: !9)
!22 = !DILocation(line: 14, column: 10, scope: !9)
!23 = !DILocation(line: 14, column: 21, scope: !9)
!24 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 15, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 10)
!28 = !DILocation(line: 15, column: 6, scope: !9)
!29 = !DILocation(line: 16, column: 17, scope: !9)
!30 = !DILocation(line: 16, column: 2, scope: !9)
!31 = !DILocation(line: 16, column: 30, scope: !9)
!32 = !DILocation(line: 17, column: 1, scope: !9)
