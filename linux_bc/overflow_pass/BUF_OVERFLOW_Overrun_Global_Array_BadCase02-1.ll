; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_Global_Array_BadCase02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_Global_Array_BadCase02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Flts = type { i8, i8, i16, [100 x i8] }

@g_data = dso_local global [100 x %struct.Flts] zeroinitializer, align 16, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @Init(%struct.Flts* %p) #0 !dbg !31 {
entry:
  %p.addr = alloca %struct.Flts*, align 8
  store %struct.Flts* %p, %struct.Flts** %p.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.Flts** %p.addr, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load %struct.Flts*, %struct.Flts** %p.addr, align 8, !dbg !38
  %arrayidx = getelementptr inbounds %struct.Flts, %struct.Flts* %0, i64 101, !dbg !38
  %uc1 = getelementptr inbounds %struct.Flts, %struct.Flts* %arrayidx, i32 0, i32 0, !dbg !39
  store i8 0, i8* %uc1, align 2, !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !42 {
entry:
  call void @Init(%struct.Flts* getelementptr inbounds ([100 x %struct.Flts], [100 x %struct.Flts]* @g_data, i64 0, i64 0)), !dbg !46
  ret i32 0, !dbg !47
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g_data", scope: !2, file: !6, line: 34, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_Global_Array_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 29, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_Global_Array_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "INDEX_A", value: 100)
!10 = !DIEnumerator(name: "INDEX_END", value: 101)
!11 = !{!0}
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 83200, elements: !23)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "Flts", file: !6, line: 27, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Flts", file: !6, line: 22, size: 832, elements: !15)
!15 = !{!16, !18, !19, !21}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "uc1", scope: !14, file: !6, line: 23, baseType: !17, size: 8)
!17 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "uc2", scope: !14, file: !6, line: 24, baseType: !17, size: 8, offset: 8)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "us", scope: !14, file: !6, line: 25, baseType: !20, size: 16, offset: 16)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "arr", scope: !14, file: !6, line: 26, baseType: !22, size: 800, offset: 32)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"uwtable", i32 1}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !{!"clang version 13.0.0"}
!31 = distinct !DISubprogram(name: "Init", scope: !6, file: !6, line: 36, type: !32, scopeLine: 37, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !35)
!32 = !DISubroutineType(types: !33)
!33 = !{null, !34}
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!35 = !{}
!36 = !DILocalVariable(name: "p", arg: 1, scope: !31, file: !6, line: 36, type: !34)
!37 = !DILocation(line: 36, column: 17, scope: !31)
!38 = !DILocation(line: 38, column: 5, scope: !31)
!39 = !DILocation(line: 38, column: 18, scope: !31)
!40 = !DILocation(line: 38, column: 22, scope: !31)
!41 = !DILocation(line: 39, column: 1, scope: !31)
!42 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 44, type: !43, scopeLine: 45, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !35)
!43 = !DISubroutineType(types: !44)
!44 = !{!45}
!45 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!46 = !DILocation(line: 47, column: 5, scope: !42)
!47 = !DILocation(line: 48, column: 1, scope: !42)
