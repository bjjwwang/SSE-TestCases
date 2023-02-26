; ModuleID = 'mac_bc/pass/BASIC_struct_array_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_struct_array_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.A = type { i32, [3 x i32] }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.A* %a, metadata !15, metadata !DIExpression()), !dbg !24
  %b = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !25
  %arrayidx = getelementptr inbounds [3 x i32], [3 x i32]* %b, i64 0, i64 0, !dbg !26
  store i32 4, i32* %arrayidx, align 4, !dbg !27
  %b1 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !28
  %arrayidx2 = getelementptr inbounds [3 x i32], [3 x i32]* %b1, i64 0, i64 1, !dbg !29
  store i32 5, i32* %arrayidx2, align 4, !dbg !30
  %b3 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !31
  %arrayidx4 = getelementptr inbounds [3 x i32], [3 x i32]* %b3, i64 0, i64 2, !dbg !32
  store i32 6, i32* %arrayidx4, align 4, !dbg !33
  %a5 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0, !dbg !34
  store i32 1, i32* %a5, align 4, !dbg !35
  %b6 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !36
  %a7 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0, !dbg !37
  %0 = load i32, i32* %a7, align 4, !dbg !37
  %idxprom = sext i32 %0 to i64, !dbg !38
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %b6, i64 0, i64 %idxprom, !dbg !38
  %1 = load i32, i32* %arrayidx8, align 4, !dbg !38
  %cmp = icmp eq i32 %1, 5, !dbg !39
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !40
  ret i32 0, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_struct_array_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 12, type: !11, scopeLine: 12, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_struct_array_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 13, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "A", file: !10, line: 11, baseType: !17)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 8, size: 128, elements: !18)
!18 = !{!19, !20}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !17, file: !10, line: 9, baseType: !13, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !17, file: !10, line: 10, baseType: !21, size: 96, offset: 32)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 96, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 3)
!24 = !DILocation(line: 13, column: 7, scope: !9)
!25 = !DILocation(line: 14, column: 7, scope: !9)
!26 = !DILocation(line: 14, column: 5, scope: !9)
!27 = !DILocation(line: 14, column: 12, scope: !9)
!28 = !DILocation(line: 15, column: 7, scope: !9)
!29 = !DILocation(line: 15, column: 5, scope: !9)
!30 = !DILocation(line: 15, column: 12, scope: !9)
!31 = !DILocation(line: 16, column: 7, scope: !9)
!32 = !DILocation(line: 16, column: 5, scope: !9)
!33 = !DILocation(line: 16, column: 12, scope: !9)
!34 = !DILocation(line: 17, column: 7, scope: !9)
!35 = !DILocation(line: 17, column: 9, scope: !9)
!36 = !DILocation(line: 18, column: 18, scope: !9)
!37 = !DILocation(line: 18, column: 22, scope: !9)
!38 = !DILocation(line: 18, column: 16, scope: !9)
!39 = !DILocation(line: 18, column: 25, scope: !9)
!40 = !DILocation(line: 18, column: 5, scope: !9)
!41 = !DILocation(line: 19, column: 5, scope: !9)
