; ModuleID = 'mac_bc/pass/BASIC_array_struct_0.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_struct_0.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.A = type { i32, i32 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !9 {
entry:
  %retval = alloca i32, align 4
  %a = alloca [2 x %struct.A], align 16
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [2 x %struct.A]* %a, metadata !15, metadata !DIExpression()), !dbg !24
  %arrayidx = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !25
  %a1 = getelementptr inbounds %struct.A, %struct.A* %arrayidx, i32 0, i32 0, !dbg !26
  store i32 10, i32* %a1, align 16, !dbg !27
  %arrayidx2 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 0, !dbg !28
  %b = getelementptr inbounds %struct.A, %struct.A* %arrayidx2, i32 0, i32 1, !dbg !29
  store i32 11, i32* %b, align 4, !dbg !30
  %arrayidx3 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 1, !dbg !31
  %a4 = getelementptr inbounds %struct.A, %struct.A* %arrayidx3, i32 0, i32 0, !dbg !32
  store i32 20, i32* %a4, align 8, !dbg !33
  %arrayidx5 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 1, !dbg !34
  %b6 = getelementptr inbounds %struct.A, %struct.A* %arrayidx5, i32 0, i32 1, !dbg !35
  store i32 21, i32* %b6, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i32* %c, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 0, i32* %c, align 4, !dbg !38
  %0 = load i32, i32* %c, align 4, !dbg !39
  %idxprom = sext i32 %0 to i64, !dbg !40
  %arrayidx7 = getelementptr inbounds [2 x %struct.A], [2 x %struct.A]* %a, i64 0, i64 %idxprom, !dbg !40
  %b8 = getelementptr inbounds %struct.A, %struct.A* %arrayidx7, i32 0, i32 1, !dbg !41
  %1 = load i32, i32* %b8, align 4, !dbg !41
  %cmp = icmp eq i32 %1, 11, !dbg !42
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !43
  ret i32 0, !dbg !44
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_struct_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!10 = !DIFile(filename: "src/pass/BASIC_array_struct_0.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "a", scope: !9, file: !10, line: 14, type: !16)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 128, elements: !22)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "A", file: !10, line: 12, baseType: !18)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 9, size: 64, elements: !19)
!19 = !{!20, !21}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !18, file: !10, line: 10, baseType: !13, size: 32)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !18, file: !10, line: 11, baseType: !13, size: 32, offset: 32)
!22 = !{!23}
!23 = !DISubrange(count: 2)
!24 = !DILocation(line: 14, column: 7, scope: !9)
!25 = !DILocation(line: 15, column: 5, scope: !9)
!26 = !DILocation(line: 15, column: 10, scope: !9)
!27 = !DILocation(line: 15, column: 12, scope: !9)
!28 = !DILocation(line: 16, column: 5, scope: !9)
!29 = !DILocation(line: 16, column: 10, scope: !9)
!30 = !DILocation(line: 16, column: 12, scope: !9)
!31 = !DILocation(line: 17, column: 5, scope: !9)
!32 = !DILocation(line: 17, column: 10, scope: !9)
!33 = !DILocation(line: 17, column: 12, scope: !9)
!34 = !DILocation(line: 18, column: 5, scope: !9)
!35 = !DILocation(line: 18, column: 10, scope: !9)
!36 = !DILocation(line: 18, column: 12, scope: !9)
!37 = !DILocalVariable(name: "c", scope: !9, file: !10, line: 19, type: !13)
!38 = !DILocation(line: 19, column: 9, scope: !9)
!39 = !DILocation(line: 20, column: 18, scope: !9)
!40 = !DILocation(line: 20, column: 16, scope: !9)
!41 = !DILocation(line: 20, column: 21, scope: !9)
!42 = !DILocation(line: 20, column: 23, scope: !9)
!43 = !DILocation(line: 20, column: 5, scope: !9)
!44 = !DILocation(line: 21, column: 5, scope: !9)
