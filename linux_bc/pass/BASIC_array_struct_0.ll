; ModuleID = 'linux_bc/pass/BASIC_array_struct_0.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_struct_0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [2 x %struct.A], align 16
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x %struct.A]* %a, metadata !14, metadata !DIExpression()), !dbg !23
  %arrayidx = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !24
  %a1 = getelementptr inbounds %struct.A, %struct.A* %arrayidx, i32 0, i32 0, !dbg !25
  store i32 10, i32* %a1, align 16, !dbg !26
  %arrayidx2 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !27
  %b = getelementptr inbounds %struct.A, %struct.A* %arrayidx2, i32 0, i32 1, !dbg !28
  store i32 11, i32* %b, align 4, !dbg !29
  %arrayidx3 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 1, !dbg !30
  %a4 = getelementptr inbounds %struct.A, %struct.A* %arrayidx3, i32 0, i32 0, !dbg !31
  store i32 20, i32* %a4, align 8, !dbg !32
  %arrayidx5 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 1, !dbg !33
  %b6 = getelementptr inbounds %struct.A, %struct.A* %arrayidx5, i32 0, i32 1, !dbg !34
  store i32 21, i32* %b6, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %c, metadata !36, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %c, align 4, !dbg !37
  %0 = load i32, i32* %c, align 4, !dbg !38
  %idxprom = sext i32 %0 to i64, !dbg !39
  %arrayidx7 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 %idxprom, !dbg !39
  %b8 = getelementptr inbounds %struct.A, %struct.A* %arrayidx7, i32 0, i32 1, !dbg !40
  %1 = load i32, i32* %b8, align 4, !dbg !40
  %cmp = icmp eq i32 %1, 11, !dbg !41
  call void @svf_assert(i1 zeroext %cmp), !dbg !42
  ret i32 0, !dbg !43
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
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_struct_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_array_struct_0.c", directory: "/home/SVF-tools/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 14, type: !15)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 128, elements: !21)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "A", file: !10, line: 12, baseType: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 9, size: 64, elements: !18)
!18 = !{!19, !20}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !17, file: !10, line: 10, baseType: !13, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !17, file: !10, line: 11, baseType: !13, size: 32, offset: 32)
!21 = !{!22}
!22 = !DISubrange(count: 2)
!23 = !DILocation(line: 14, column: 7, scope: !9)
!24 = !DILocation(line: 15, column: 5, scope: !9)
!25 = !DILocation(line: 15, column: 10, scope: !9)
!26 = !DILocation(line: 15, column: 12, scope: !9)
!27 = !DILocation(line: 16, column: 5, scope: !9)
!28 = !DILocation(line: 16, column: 10, scope: !9)
!29 = !DILocation(line: 16, column: 12, scope: !9)
!30 = !DILocation(line: 17, column: 5, scope: !9)
!31 = !DILocation(line: 17, column: 10, scope: !9)
!32 = !DILocation(line: 17, column: 12, scope: !9)
!33 = !DILocation(line: 18, column: 5, scope: !9)
!34 = !DILocation(line: 18, column: 10, scope: !9)
!35 = !DILocation(line: 18, column: 12, scope: !9)
!36 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 19, type: !13)
!37 = !DILocation(line: 19, column: 9, scope: !9)
!38 = !DILocation(line: 20, column: 18, scope: !9)
!39 = !DILocation(line: 20, column: 16, scope: !9)
!40 = !DILocation(line: 20, column: 21, scope: !9)
!41 = !DILocation(line: 20, column: 23, scope: !9)
!42 = !DILocation(line: 20, column: 5, scope: !9)
!43 = !DILocation(line: 21, column: 5, scope: !9)
