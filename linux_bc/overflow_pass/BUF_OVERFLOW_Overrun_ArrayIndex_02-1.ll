; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.unionType = type { i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %myUnion = alloca %union.unionType, align 4
  %buffer = alloca [10 x i32], align 16
  call void @llvm.dbg.declare(metadata %union.unionType* %myUnion, metadata !14, metadata !DIExpression()), !dbg !20
  %unionFirst = bitcast %union.unionType* %myUnion to i32*, !dbg !21
  store i32 10, i32* %unionFirst, align 4, !dbg !22
  call void @llvm.dbg.declare(metadata [10 x i32]* %buffer, metadata !23, metadata !DIExpression()), !dbg !27
  %0 = bitcast [10 x i32]* %buffer to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 40, i1 false), !dbg !27
  %unionSecond = bitcast %union.unionType* %myUnion to i32*, !dbg !28
  %1 = load i32, i32* %unionSecond, align 4, !dbg !28
  %idxprom = sext i32 %1 to i64, !dbg !29
  %arrayidx = getelementptr inbounds [10 x i32], [10 x i32]* %buffer, i64 0, i64 %idxprom, !dbg !29
  store i32 1, i32* %arrayidx, align 4, !dbg !30
  ret i32 0, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "myUnion", scope: !9, file: !10, line: 13, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "unionType", file: !10, line: 10, baseType: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !10, line: 7, size: 32, elements: !17)
!17 = !{!18, !19}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !16, file: !10, line: 8, baseType: !13, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !16, file: !10, line: 9, baseType: !13, size: 32)
!20 = !DILocation(line: 13, column: 12, scope: !9)
!21 = !DILocation(line: 14, column: 10, scope: !9)
!22 = !DILocation(line: 14, column: 21, scope: !9)
!23 = !DILocalVariable(name: "buffer", scope: !9, file: !10, line: 15, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 10)
!27 = !DILocation(line: 15, column: 6, scope: !9)
!28 = !DILocation(line: 16, column: 17, scope: !9)
!29 = !DILocation(line: 16, column: 2, scope: !9)
!30 = !DILocation(line: 16, column: 30, scope: !9)
!31 = !DILocation(line: 17, column: 1, scope: !9)
