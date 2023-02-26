; ModuleID = 'mac_bc/pass/BASIC_array_func_3.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_func_3.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.A = type { i32, [2 x i32] }

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @getValue(%struct.A* noundef %arr, i32 noundef %x) #0 !dbg !9 {
entry:
  %arr.addr = alloca %struct.A*, align 8
  %x.addr = alloca i32, align 4
  store %struct.A* %arr, %struct.A** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.A** %arr.addr, metadata !24, metadata !DIExpression()), !dbg !25
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !26, metadata !DIExpression()), !dbg !27
  %0 = load %struct.A*, %struct.A** %arr.addr, align 8, !dbg !28
  %b = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 1, !dbg !29
  %1 = load i32, i32* %x.addr, align 4, !dbg !30
  %idxprom = sext i32 %1 to i64, !dbg !28
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %b, i64 0, i64 %idxprom, !dbg !28
  %2 = load i32, i32* %arrayidx, align 4, !dbg !28
  ret i32 %2, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !32 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.A* %a, metadata !35, metadata !DIExpression()), !dbg !36
  %a1 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0, !dbg !37
  store i32 0, i32* %a1, align 4, !dbg !38
  %b = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !39
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %b, i64 0, i64 0, !dbg !40
  store i32 1, i32* %arrayidx, align 4, !dbg !41
  %b2 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !42
  %arrayidx3 = getelementptr inbounds [2 x i32], [2 x i32]* %b2, i64 0, i64 1, !dbg !43
  store i32 2, i32* %arrayidx3, align 4, !dbg !44
  %call = call i32 @getValue(%struct.A* noundef %a, i32 noundef 1), !dbg !45
  %cmp = icmp eq i32 %call, 2, !dbg !46
  call void @svf_assert(i1 noundef zeroext %cmp), !dbg !47
  ret i32 0, !dbg !48
}

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/pass/BASIC_array_func_3.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{i32 7, !"Dwarf Version", i32 4}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"Homebrew clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "getValue", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!10 = !DIFile(filename: "src/pass/BASIC_array_func_3.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !14, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "A", file: !10, line: 11, baseType: !16)
!16 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !10, line: 8, size: 96, elements: !17)
!17 = !{!18, !19}
!18 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !16, file: !10, line: 9, baseType: !13, size: 32)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !16, file: !10, line: 10, baseType: !20, size: 64, offset: 32)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 64, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 2)
!23 = !{}
!24 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !10, line: 13, type: !14)
!25 = !DILocation(line: 13, column: 17, scope: !9)
!26 = !DILocalVariable(name: "x", arg: 2, scope: !9, file: !10, line: 13, type: !13)
!27 = !DILocation(line: 13, column: 26, scope: !9)
!28 = !DILocation(line: 14, column: 12, scope: !9)
!29 = !DILocation(line: 14, column: 17, scope: !9)
!30 = !DILocation(line: 14, column: 19, scope: !9)
!31 = !DILocation(line: 14, column: 5, scope: !9)
!32 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !33, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !23)
!33 = !DISubroutineType(types: !34)
!34 = !{!13}
!35 = !DILocalVariable(name: "a", scope: !32, file: !10, line: 18, type: !15)
!36 = !DILocation(line: 18, column: 7, scope: !32)
!37 = !DILocation(line: 19, column: 7, scope: !32)
!38 = !DILocation(line: 19, column: 9, scope: !32)
!39 = !DILocation(line: 20, column: 7, scope: !32)
!40 = !DILocation(line: 20, column: 5, scope: !32)
!41 = !DILocation(line: 20, column: 12, scope: !32)
!42 = !DILocation(line: 21, column: 7, scope: !32)
!43 = !DILocation(line: 21, column: 5, scope: !32)
!44 = !DILocation(line: 21, column: 12, scope: !32)
!45 = !DILocation(line: 22, column: 16, scope: !32)
!46 = !DILocation(line: 22, column: 32, scope: !32)
!47 = !DILocation(line: 22, column: 5, scope: !32)
!48 = !DILocation(line: 23, column: 5, scope: !32)
