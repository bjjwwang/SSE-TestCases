; ModuleID = 'linux_bc/pass/BASIC_array_func_3.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_func_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, [2 x i32] }

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getValue(%struct.A* %arr, i32 %x) #0 !dbg !9 {
entry:
  %arr.addr = alloca %struct.A*, align 8
  %x.addr = alloca i32, align 4
  store %struct.A* %arr, %struct.A** %arr.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.A** %arr.addr, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 %x, i32* %x.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !25, metadata !DIExpression()), !dbg !26
  %0 = load %struct.A*, %struct.A** %arr.addr, align 8, !dbg !27
  %b = getelementptr inbounds %struct.A, %struct.A* %0, i32 0, i32 1, !dbg !28
  %1 = load i32, i32* %x.addr, align 4, !dbg !29
  %idxprom = sext i32 %1 to i64, !dbg !27
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %b, i64 0, i64 %idxprom, !dbg !27
  %2 = load i32, i32* %arrayidx, align 4, !dbg !27
  ret i32 %2, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.A* %a, metadata !34, metadata !DIExpression()), !dbg !35
  %a1 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 0, !dbg !36
  store i32 0, i32* %a1, align 4, !dbg !37
  %b = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !38
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %b, i64 0, i64 0, !dbg !39
  store i32 1, i32* %arrayidx, align 4, !dbg !40
  %b2 = getelementptr inbounds %struct.A, %struct.A* %a, i32 0, i32 1, !dbg !41
  %arrayidx3 = getelementptr inbounds [2 x i32], [2 x i32]* %b2, i64 0, i64 1, !dbg !42
  store i32 2, i32* %arrayidx3, align 4, !dbg !43
  %call = call i32 @getValue(%struct.A* %a, i32 1), !dbg !44
  %cmp = icmp eq i32 %call, 2, !dbg !45
  call void @svf_assert(i1 zeroext %cmp), !dbg !46
  ret i32 0, !dbg !47
}

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BASIC_array_func_3.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "getValue", scope: !10, file: !10, line: 13, type: !11, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "src/pass/BASIC_array_func_3.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!23 = !DILocalVariable(name: "arr", arg: 1, scope: !9, file: !10, line: 13, type: !14)
!24 = !DILocation(line: 13, column: 17, scope: !9)
!25 = !DILocalVariable(name: "x", arg: 2, scope: !9, file: !10, line: 13, type: !13)
!26 = !DILocation(line: 13, column: 26, scope: !9)
!27 = !DILocation(line: 14, column: 12, scope: !9)
!28 = !DILocation(line: 14, column: 17, scope: !9)
!29 = !DILocation(line: 14, column: 19, scope: !9)
!30 = !DILocation(line: 14, column: 5, scope: !9)
!31 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 17, type: !32, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!13}
!34 = !DILocalVariable(name: "a", scope: !31, file: !10, line: 18, type: !15)
!35 = !DILocation(line: 18, column: 7, scope: !31)
!36 = !DILocation(line: 19, column: 7, scope: !31)
!37 = !DILocation(line: 19, column: 9, scope: !31)
!38 = !DILocation(line: 20, column: 7, scope: !31)
!39 = !DILocation(line: 20, column: 5, scope: !31)
!40 = !DILocation(line: 20, column: 12, scope: !31)
!41 = !DILocation(line: 21, column: 7, scope: !31)
!42 = !DILocation(line: 21, column: 5, scope: !31)
!43 = !DILocation(line: 21, column: 12, scope: !31)
!44 = !DILocation(line: 22, column: 16, scope: !31)
!45 = !DILocation(line: 22, column: 32, scope: !31)
!46 = !DILocation(line: 22, column: 5, scope: !31)
!47 = !DILocation(line: 23, column: 5, scope: !31)
