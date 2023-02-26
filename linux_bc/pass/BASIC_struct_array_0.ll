; ModuleID = 'linux_bc/pass/BASIC_struct_array_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_struct_array_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, [3 x i32] }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.A* %a, metadata !14, metadata !DIExpression()), !dbg !23
  %b = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !24
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0, !dbg !25
  store i32 4, i32* %arrayidx, align 4, !dbg !26
  %b1 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !27
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %b1, i64 0, i64 1, !dbg !28
  store i32 5, i32* %arrayidx2, align 4, !dbg !29
  %b3 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !30
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %b3, i64 0, i64 2, !dbg !31
  store i32 6, i32* %arrayidx4, align 4, !dbg !32
  %a5 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0, !dbg !33
  store i32 1, i32* %a5, align 4, !dbg !34
  %b6 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !35
  %a7 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0, !dbg !36
  %0 = load i32, i32* %a7, align 4, !dbg !36
  %idxprom = sext i32 %0 to i64, !dbg !37
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %b6, i64 0, i64 %idxprom, !dbg !37
  %1 = load i32, i32* %arrayidx8, align 4, !dbg !37
  %cmp = icmp eq i32 %1, 5, !dbg !38
  call void @svf_assert(i1 zeroext %cmp), !dbg !39
  ret i32 0, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_struct_array_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_struct_array_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 13, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "A", file: !10, line: 11, baseType: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 8, size: 128, elements: !17)
!17 = !{!18, !19}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !16, file: !10, line: 9, baseType: !13, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !16, file: !10, line: 10, baseType: !20, size: 96, offset: 32)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 3)
!23 = !DILocation(line: 13, column: 7, scope: !9)
!24 = !DILocation(line: 14, column: 7, scope: !9)
!25 = !DILocation(line: 14, column: 5, scope: !9)
!26 = !DILocation(line: 14, column: 12, scope: !9)
!27 = !DILocation(line: 15, column: 7, scope: !9)
!28 = !DILocation(line: 15, column: 5, scope: !9)
!29 = !DILocation(line: 15, column: 12, scope: !9)
!30 = !DILocation(line: 16, column: 7, scope: !9)
!31 = !DILocation(line: 16, column: 5, scope: !9)
!32 = !DILocation(line: 16, column: 12, scope: !9)
!33 = !DILocation(line: 17, column: 7, scope: !9)
!34 = !DILocation(line: 17, column: 9, scope: !9)
!35 = !DILocation(line: 18, column: 18, scope: !9)
!36 = !DILocation(line: 18, column: 22, scope: !9)
!37 = !DILocation(line: 18, column: 16, scope: !9)
!38 = !DILocation(line: 18, column: 25, scope: !9)
!39 = !DILocation(line: 18, column: 5, scope: !9)
!40 = !DILocation(line: 19, column: 5, scope: !9)
